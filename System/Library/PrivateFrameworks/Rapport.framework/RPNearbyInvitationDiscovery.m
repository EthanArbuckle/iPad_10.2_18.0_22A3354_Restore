@implementation RPNearbyInvitationDiscovery

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationDiscovery)init
{
  RPNearbyInvitationDiscovery *v2;
  RPNearbyInvitationDiscovery *v3;
  RPNearbyInvitationDiscovery *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPNearbyInvitationDiscovery;
  v2 = -[RPNearbyInvitationDiscovery init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (RPNearbyInvitationDiscovery)initWithCoder:(id)a3
{
  id v4;
  RPNearbyInvitationDiscovery *v5;
  RPNearbyInvitationDiscovery *v6;
  id v7;
  RPNearbyInvitationDiscovery *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPNearbyInvitationDiscovery;
  v5 = -[RPNearbyInvitationDiscovery init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v7 = v4;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("_disFl")))
      v6->_discoveryFlags = objc_msgSend(v7, "decodeInt64ForKey:", CFSTR("_disFl"));

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t discoveryFlags;

  discoveryFlags = self->_discoveryFlags;
  if (discoveryFlags)
    objc_msgSend(a3, "encodeInt64:forKey:", discoveryFlags, CFSTR("_disFl"));
}

- (NSString)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  unint64_t discoveryFlags;
  void *v9;
  void *v10;

  discoveryFlags = (unint64_t)self;
  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  if (self->_discoveryFlags)
  {
    v10 = v3;
    discoveryFlags = self->_discoveryFlags;
    v9 = &unk_1AF307458;
    NSAppendPrintF();
    v5 = v10;

    v4 = v5;
  }
  if (-[NSMutableDictionary count](self->_discoveredDevices, "count", discoveryFlags, v9))
  {
    -[NSMutableDictionary count](self->_discoveredDevices, "count");
    NSAppendPrintF();
    v6 = v4;

    v4 = v6;
  }
  return (NSString *)v4;
}

- (BOOL)shouldReportDevice:(id)a3
{
  return (objc_msgSend(a3, "statusFlags") & 0x10000AE000) == 0;
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__RPNearbyInvitationDiscovery_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __54__RPNearbyInvitationDiscovery_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSXPCConnection *xpcCnx;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearbyInvitationDiscovery <= 30
         && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPNearbyInvitationDiscovery _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E5F4F478;
  v15[4] = self;
  v17 = v4;
  v9 = v6;
  v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E5F4EED8;
  v14 = v4;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "nearbyInvitationActivateDiscovery:completion:", self, v12);

}

void __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v9 = v3;
    RPNestedErrorF();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v10 = v4;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1 || (v6 = _LogCategory_Initialize(), v4 = v10, v6))
      {
LABEL_9:
        LogPrintF();
        v4 = v10;
      }
    }
  }
  else if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery != -1)
      goto LABEL_9;
    v7 = _LogCategory_Initialize();
    v4 = v10;
    if (v7)
      goto LABEL_9;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
    v4 = v10;
  }

}

void __66__RPNearbyInvitationDiscovery__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
      {
        if (gLogCategory_RPNearbyInvitationDiscovery != -1 || (v5 = _LogCategory_Initialize(), v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPNearbyInvitationDiscovery <= 90)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1)
        goto LABEL_15;
      v7 = _LogCategory_Initialize();
      v3 = v9;
      if (v7)
        goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30)
    {
      if (gLogCategory_RPNearbyInvitationDiscovery != -1)
        goto LABEL_15;
      v6 = _LogCategory_Initialize();
      v3 = 0;
      if (v6)
        goto LABEL_15;
    }
  }
  else if (gLogCategory_RPNearbyInvitationDiscovery <= 30)
  {
    if (gLogCategory_RPNearbyInvitationDiscovery != -1)
      goto LABEL_15;
    v8 = _LogCategory_Initialize();
    v3 = 0;
    if (v8)
      goto LABEL_15;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    v3 = v9;
  }

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.rapport.NearbyInvitation"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE40F98);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AB18);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearbyInvitationDiscovery <= 10
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __48__RPNearbyInvitationDiscovery__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearbyInvitationDiscovery <= 50
    && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled)
    -[RPNearbyInvitationDiscovery _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__RPNearbyInvitationDiscovery_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__RPNearbyInvitationDiscovery_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 32), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  NSMutableDictionary *discoveredDevices;
  id v8;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    deviceChangedHandler = self->_deviceChangedHandler;
    self->_deviceChangedHandler = 0;

    discoveredDevices = self->_discoveredDevices;
    self->_discoveredDevices = 0;

    v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearbyInvitationDiscovery <= 30
      && (gLogCategory_RPNearbyInvitationDiscovery != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (NSArray)discoveredDevices
{
  RPNearbyInvitationDiscovery *v2;
  NSMutableDictionary *discoveredDevices;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  discoveredDevices = v2->_discoveredDevices;
  if (discoveredDevices)
  {
    -[NSMutableDictionary allValues](discoveredDevices, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_sync_exit(v2);

  return (NSArray *)v4;
}

- (void)nearbyInvitationFoundDevice:(id)a3
{
  RPNearbyInvitationDiscovery *v4;
  void *v5;
  NSMutableDictionary *discoveredDevices;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  void (**deviceFoundHandler)(id, id);
  id v10;

  v10 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v10, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    discoveredDevices = v4->_discoveredDevices;
    if (!discoveredDevices)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = v4->_discoveredDevices;
      v4->_discoveredDevices = v7;

      discoveredDevices = v4->_discoveredDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](discoveredDevices, "setObject:forKeyedSubscript:", v10, v5);

    objc_sync_exit(v4);
    deviceFoundHandler = (void (**)(id, id))v4->_deviceFoundHandler;
    if (deviceFoundHandler)
      deviceFoundHandler[2](deviceFoundHandler, v10);
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)nearbyInvitationLostDevice:(id)a3
{
  RPNearbyInvitationDiscovery *v4;
  void *v5;
  void (**deviceLostHandler)(id, id);
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v7, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v4->_discoveredDevices, "setObject:forKeyedSubscript:", 0, v5);

    objc_sync_exit(v4);
    deviceLostHandler = (void (**)(id, id))v4->_deviceLostHandler;
    if (deviceLostHandler)
      deviceLostHandler[2](deviceLostHandler, v7);
  }
  else
  {
    objc_sync_exit(v4);

  }
}

- (void)nearbyInvitationChangedDevice:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  RPNearbyInvitationDiscovery *v6;
  void *v7;
  void (**deviceChangedHandler)(id, id, _QWORD);
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = self;
  objc_sync_enter(v6);
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_discoveredDevices, "setObject:forKeyedSubscript:", v9, v7);

    objc_sync_exit(v6);
    deviceChangedHandler = (void (**)(id, id, _QWORD))v6->_deviceChangedHandler;
    if (deviceChangedHandler)
      deviceChangedHandler[2](deviceChangedHandler, v9, v4);
  }
  else
  {
    objc_sync_exit(v6);

  }
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
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

- (unint64_t)discoveryFlags
{
  return self->_discoveryFlags;
}

- (void)setDiscoveryFlags:(unint64_t)a3
{
  self->_discoveryFlags = a3;
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_discoveredDevices, 0);
}

@end
