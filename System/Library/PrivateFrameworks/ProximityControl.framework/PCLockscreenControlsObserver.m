@implementation PCLockscreenControlsObserver

- (id)knownDevices
{
  NSMutableDictionary *devices;
  void *v3;

  devices = self->_devices;
  if (devices)
  {
    -[NSMutableDictionary allValues](devices, "allValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCLockscreenControlsObserver)init
{
  PCLockscreenControlsObserver *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *processName;
  PCLockscreenControlsObserver *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PCLockscreenControlsObserver;
  v2 = -[PCLockscreenControlsObserver init](&v13, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "processIdentifier");

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@:%d"), v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    processName = v2->_processName;
    v2->_processName = (NSString *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  LogCategory *ucat;
  id deviceLost;
  id deviceUpdated;
  id invalidationHandler;
  objc_super v7;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  deviceLost = self->_deviceLost;
  self->_deviceLost = 0;

  deviceUpdated = self->_deviceUpdated;
  self->_deviceUpdated = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  v7.receiver = self;
  v7.super_class = (Class)PCLockscreenControlsObserver;
  -[PCLockscreenControlsObserver dealloc](&v7, sel_dealloc);
}

- (void)_interrupted
{
  id v3;

  NSErrorWithOSStatusF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PCLockscreenControlsObserver _invalidateWithError:](self, "_invalidateWithError:", v3);

}

- (void)_xpcEnsureStarted
{
  void *v3;
  void *v4;
  id v5;
  NSXPCConnection *v6;
  uint64_t v7;
  void *v8;
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE1658);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE17C8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", PCXPCServiceName, 0);
    -[NSXPCConnection _setQueue:](v6, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v3);
    -[NSXPCConnection setExportedObject:](v6, "setExportedObject:", self);
    v7 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke;
    v12[3] = &unk_24CCF6518;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](v6, "setInterruptionHandler:", v12);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke_2;
    v11[3] = &unk_24CCF6518;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](v6, "setInvalidationHandler:", v11);
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v4);
    -[NSXPCConnection _xpcConnection](v6, "_xpcConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_non_launching();

    -[NSXPCConnection resume](v6, "resume");
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;
    v10 = v6;

  }
}

uint64_t __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

void __49__PCLockscreenControlsObserver__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_invalidateWithError:", v2);

}

- (void)_xpcEnsureStopped
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    -[NSXPCConnection invalidate](xpcCnx, "invalidate");
    v4 = self->_xpcCnx;
    self->_xpcCnx = 0;

  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__PCLockscreenControlsObserver_activateWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__PCLockscreenControlsObserver_activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void (**v3)(id, void *);
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  void *v8;
  void (**v9)(id, void *);

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = (void (**)(id, void *))MEMORY[0x212BE7198](*(_QWORD *)(a1 + 40));
    if (v3)
    {
      v9 = v3;
      NSErrorWithOSStatusF();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v4);

      v3 = v9;
    }

  }
  else
  {
    *(_BYTE *)(v2 + 8) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = **(_DWORD **)(v5 + 32);
    if (v6 <= 30)
    {
      if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 32), v7))
      {
        LogPrintF();
        v5 = *(_QWORD *)(a1 + 32);
      }
    }
    objc_msgSend(*(id *)(v5 + 40), "remoteObjectProxy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activateObserver:", *(_QWORD *)(a1 + 32));

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PCLockscreenControlsObserver %p, %lu devices"), self, -[NSMutableDictionary count](self->_devices, "count"));
}

- (void)didSwitchRouteToDevice:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke;
  v7[3] = &unk_24CCF6590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[5];

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[4];
  if (v3 <= 30)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      v8 = *(_QWORD *)(a1 + 40);
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted", v8);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke_2;
  v9[3] = &unk_24CCF6568;
  v9[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didSwitchRouteToDevice:", *(_QWORD *)(a1 + 40));

}

void __55__PCLockscreenControlsObserver_didSwitchRouteToDevice___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 32);
  if (v4 <= 90)
  {
    v6 = v3;
    if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5))
    {
      LogPrintF();
      v3 = v6;
    }
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__PCLockscreenControlsObserver_invalidate__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __42__PCLockscreenControlsObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", 0);
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  int var0;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = a3;
  if (!self->_invalidated)
  {
    v8 = v4;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
    self->_invalidated = 1;
    -[PCLockscreenControlsObserver _xpcEnsureStopped](self, "_xpcEnsureStopped");
    v6 = MEMORY[0x212BE7198](self->_invalidationHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, id))(v6 + 16))(v6, v8);

    v4 = v8;
  }

}

- (PCLockscreenControlsObserver)initWithCoder:(id)a3
{
  id v4;
  PCLockscreenControlsObserver *v5;
  PCLockscreenControlsObserver *v6;

  v4 = a3;
  v5 = -[PCLockscreenControlsObserver init](self, "init");
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *processName;

  processName = self->_processName;
  if (processName)
    objc_msgSend(a3, "encodeObject:forKey:", processName, CFSTR("pn"));
}

- (void)deviceLost:(id)a3
{
  id v4;
  int var0;
  int v6;
  NSMutableDictionary *devices;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v4 = a3;
  var0 = self->_ucat->var0;
  v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      v11 = v4;
      LogPrintF();
      v4 = v12;
    }
  }
  devices = self->_devices;
  objc_msgSend(v4, "mediaRouteID", v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](devices, "removeObjectForKey:", v8);

  v9 = MEMORY[0x212BE7198](self->_deviceLost);
  v10 = (void *)v9;
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v12);

}

- (void)deviceUpdated:(id)a3
{
  id v4;
  int var0;
  int v6;
  NSMutableDictionary *devices;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v4 = a3;
  var0 = self->_ucat->var0;
  v14 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v14, v6))
    {
      v13 = v4;
      LogPrintF();
      v4 = v14;
    }
  }
  devices = self->_devices;
  if (!devices)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = self->_devices;
    self->_devices = v8;

    v4 = v14;
    devices = self->_devices;
  }
  objc_msgSend(v4, "mediaRouteID", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v14, v10);

  v11 = MEMORY[0x212BE7198](self->_deviceUpdated);
  v12 = (void *)v11;
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v14);

}

- (id)deviceLost
{
  return self->_deviceLost;
}

- (void)setDeviceLost:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)deviceUpdated
{
  return self->_deviceUpdated;
}

- (void)setDeviceUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)processName
{
  return self->_processName;
}

- (void)setProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceUpdated, 0);
  objc_storeStrong(&self->_deviceLost, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
