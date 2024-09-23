@implementation PCRemoteActivityClient

- (void)dealloc
{
  id interruptionHandler;
  id invalidationHandler;
  id updateHandler;
  LogCategory *ucat;
  objc_super v7;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)PCRemoteActivityClient;
  -[PCRemoteActivityClient dealloc](&v7, sel_dealloc);
}

- (PCRemoteActivityClient)init
{
  PCRemoteActivityClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  PCRemoteActivityClient *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PCRemoteActivityClient;
  v2 = -[PCRemoteActivityClient init](&v7, sel_init);
  if (v2)
  {
    v2->_ucat = (LogCategory *)LogCategoryCreateEx();
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)interrupted
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__PCRemoteActivityClient_interrupted__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__PCRemoteActivityClient_interrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

- (void)_interrupted
{
  void (**v3)(void);
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void (**)(void))MEMORY[0x212BE7198](self->_interruptionHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)_xpcEnsureStarted
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  NSXPCProxyCreating *xpcCnx;
  id v9;
  _QWORD v10[5];
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE1598);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE1768);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    v6 = (void *)objc_msgSend(v5, "initWithMachServiceName:options:", PCXPCLaunchingServiceName, 0);
    objc_msgSend(v6, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(v6, "setExportedInterface:", v3);
    objc_msgSend(v6, "setExportedObject:", self);
    v7 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke;
    v11[3] = &unk_24CCF6518;
    v11[4] = self;
    objc_msgSend(v6, "setInterruptionHandler:", v11);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke_2;
    v10[3] = &unk_24CCF6518;
    v10[4] = self;
    objc_msgSend(v6, "setInvalidationHandler:", v10);
    objc_msgSend(v6, "setRemoteObjectInterface:", v4);
    objc_msgSend(v6, "resume");
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = (NSXPCProxyCreating *)v6;
    v9 = v6;

  }
}

uint64_t __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __43__PCRemoteActivityClient__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_xpcEnsureStopped
{
  NSXPCProxyCreating *xpcCnx;
  NSXPCProxyCreating *v4;
  NSXPCProxyCreating *v5;

  xpcCnx = self->_xpcCnx;
  if (xpcCnx)
  {
    v5 = xpcCnx;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSXPCProxyCreating invalidate](v5, "invalidate");
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
  v7[2] = __49__PCRemoteActivityClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __49__PCRemoteActivityClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  int var0;
  uint64_t v6;
  NSXPCProxyCreating *xpcCnx;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[PCRemoteActivityClient _xpcEnsureStarted](self, "_xpcEnsureStarted");
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v6 = MEMORY[0x24BDAC760];
  xpcCnx = self->_xpcCnx;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __50__PCRemoteActivityClient__activateWithCompletion___block_invoke;
  v13[3] = &unk_24CCF6788;
  v13[4] = self;
  v8 = v4;
  v14 = v8;
  -[NSXPCProxyCreating remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __50__PCRemoteActivityClient__activateWithCompletion___block_invoke_2;
  v11[3] = &unk_24CCF6638;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "client:activateWithCompletion:", self, v11);

}

void __50__PCRemoteActivityClient__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v10 = v3;
  if (v5 <= 90)
  {
    if (v5 != -1)
    {
LABEL_3:
      v9 = v3;
      LogPrintF();
      v4 = *(_DWORD ***)(a1 + 32);
      goto LABEL_5;
    }
    v6 = _LogCategory_Initialize();
    v4 = *(_DWORD ***)(a1 + 32);
    if (v6)
    {
      v3 = v10;
      goto LABEL_3;
    }
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v9);
  v7 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 40));
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v10);

}

void __50__PCRemoteActivityClient__activateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__PCRemoteActivityClient_invalidate__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__PCRemoteActivityClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[PCRemoteActivityClient _xpcEnsureStopped](self, "_xpcEnsureStopped");
  -[PCRemoteActivityClient _invalidated](self, "_invalidated");
}

- (void)_invalidated
{
  void (**v3)(void);
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void (**)(void))MEMORY[0x212BE7198](self->_invalidationHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)startObservingHomeKitIdentifier:(id)a3
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
  v7[2] = __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke;
  v7[3] = &unk_24CCF6590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke(uint64_t a1)
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
  v3 = *v2[1];
  if (v3 <= 50)
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
  v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke_2;
  v9[3] = &unk_24CCF6568;
  v9[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startObservingHomeKitIdentifier:", *(_QWORD *)(a1 + 40));

}

void __58__PCRemoteActivityClient_startObservingHomeKitIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)stopObservingHomeKitIdentifier:(id)a3
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
  v7[2] = __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke;
  v7[3] = &unk_24CCF6590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke(uint64_t a1)
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
  v3 = *v2[1];
  if (v3 <= 50)
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
  v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke_2;
  v9[3] = &unk_24CCF6568;
  v9[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopObservingHomeKitIdentifier:", *(_QWORD *)(a1 + 40));

}

void __57__PCRemoteActivityClient_stopObservingHomeKitIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)startObservingMediaRemoteIdentifier:(id)a3
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
  v7[2] = __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke;
  v7[3] = &unk_24CCF6590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke(uint64_t a1)
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
  v3 = *v2[1];
  if (v3 <= 50)
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
  v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke_2;
  v9[3] = &unk_24CCF6568;
  v9[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startObservingMediaRemoteIdentifier:", *(_QWORD *)(a1 + 40));

}

void __62__PCRemoteActivityClient_startObservingMediaRemoteIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)stopObservingMediaRemoteIdentifier:(id)a3
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
  v7[2] = __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke;
  v7[3] = &unk_24CCF6590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke(uint64_t a1)
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
  v3 = *v2[1];
  if (v3 <= 50)
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
  v6 = *(void **)(v5 + 80);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke_2;
  v9[3] = &unk_24CCF6568;
  v9[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopObservingMediaRemoteIdentifier:", *(_QWORD *)(a1 + 40));

}

void __61__PCRemoteActivityClient_stopObservingMediaRemoteIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)stopObservingAllDevices
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke_2;
  v8[3] = &unk_24CCF6568;
  v8[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stopObservingAllDevices");

}

void __49__PCRemoteActivityClient_stopObservingAllDevices__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)userTappedCloseButton
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke_2;
  v8[3] = &unk_24CCF6568;
  v8[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userTappedCloseButton");

}

void __47__PCRemoteActivityClient_userTappedCloseButton__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)userTappedDisambiguationButton:(id)a3
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
  v7[2] = __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke;
  v7[3] = &unk_24CCF6590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke(uint64_t a1)
{
  _DWORD **v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v2 = *(_DWORD ***)(a1 + 32);
  v3 = *v2[1];
  if (v3 <= 50)
  {
    if (v3 != -1 || (v4 = _LogCategory_Initialize(), v2 = *(_DWORD ***)(a1 + 32), v4))
    {
      LogPrintF();
      v2 = *(_DWORD ***)(a1 + 32);
    }
  }
  objc_msgSend(v2, "_xpcEnsureStarted");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 80);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke_2;
  v8[3] = &unk_24CCF6568;
  v8[4] = v5;
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userTappedDisambiguationButton:", *(_QWORD *)(a1 + 40));

}

void __57__PCRemoteActivityClient_userTappedDisambiguationButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = *(_DWORD ***)(a1 + 32);
  v5 = *v4[1];
  v8 = v3;
  if (v5 <= 90)
  {
    if (v5 == -1)
    {
      v6 = _LogCategory_Initialize();
      v4 = *(_DWORD ***)(a1 + 32);
      if (!v6)
        goto LABEL_5;
      v3 = v8;
    }
    v7 = v3;
    LogPrintF();
    v4 = *(_DWORD ***)(a1 + 32);
  }
LABEL_5:
  objc_msgSend(v4, "invalidate", v7);

}

- (void)updateHomeKitID:(id)a3 mediaRemoteID:(id)a4 withActivities:(id)a5 disambiguationContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  int var0;
  int v14;
  int v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (v16)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[PCRemoteActivityClient updateHomeKitID:withActivities:disambiguationContext:](self, "updateHomeKitID:withActivities:disambiguationContext:", v16, v11, v12);
    if (v10)
      goto LABEL_11;
  }
  else
  {
    if (v10)
    {
LABEL_11:
      v15 = self->_ucat->var0;
      if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      -[PCRemoteActivityClient updateMediaRemoteID:withActivities:disambiguationContext:](self, "updateMediaRemoteID:withActivities:disambiguationContext:", v10, v11, v12);
      goto LABEL_16;
    }
    v14 = self->_ucat->var0;
    if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_16:

}

- (void)updateHomeKitID:(id)a3 withActivities:(id)a4 disambiguationContext:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  int var0;
  id v14;
  int v15;
  id v16;

  v16 = a3;
  v8 = a5;
  -[PCRemoteActivityClient userActivitySetFromData:](self, "userActivitySetFromData:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x212BE7198](self->_homeKitUpdateHandler);
  v11 = (void *)v10;
  if (v10)
  {
    (*(void (**)(uint64_t, id, void *, id))(v10 + 16))(v10, v16, v9, v8);
  }
  else
  {
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BE7198](self->_updateHandler);
    if (v12)
    {
      var0 = self->_ucat->var0;
      v14 = v16;
      if (var0 <= 60)
      {
        if (var0 != -1 || (v15 = _LogCategory_Initialize(), v14 = v16, v15))
        {
          LogPrintF();
          v14 = v16;
        }
      }
      ((void (**)(_QWORD, id, void *, id))v12)[2](v12, v14, v9, v8);
    }

  }
}

- (void)updateMediaRemoteID:(id)a3 withActivities:(id)a4 disambiguationContext:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v11;
  int var0;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))MEMORY[0x212BE7198](self->_mediaRemoteUpdateHandler);
  if (v10)
  {
    -[PCRemoteActivityClient userActivitySetFromData:](self, "userActivitySetFromData:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, id))v10)[2](v10, v13, v11, v9);

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (id)userActivitySetFromData:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x24BDD1960]);
        v12 = (void *)objc_msgSend(v11, "_initWithUserActivityData:", v10, (_QWORD)v15);
        if (v12)
        {
          +[PCActivityUtility activityFrom:](PCActivityUtility, "activityFrom:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v4, "addObject:", v13);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCRemoteActivityClient)initWithCoder:(id)a3
{
  PCRemoteActivityClient *v3;
  PCRemoteActivityClient *v4;
  PCRemoteActivityClient *v5;

  v3 = -[PCRemoteActivityClient init](self, "init", a3);
  v4 = v3;
  if (v3)
    v5 = v3;

  return v4;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)homeKitUpdateHandler
{
  return self->_homeKitUpdateHandler;
}

- (void)setHomeKitUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)mediaRemoteUpdateHandler
{
  return self->_mediaRemoteUpdateHandler;
}

- (void)setMediaRemoteUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)uiWillDismissHandler
{
  return self->_uiWillDismissHandler;
}

- (void)setUiWillDismissHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)updateHandler
{
  return self->_updateHandler;
}

- (void)setUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)activityDataUpdateHandler
{
  return self->_activityDataUpdateHandler;
}

- (void)setActivityDataUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSXPCProxyCreating)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_activityDataUpdateHandler, 0);
  objc_storeStrong(&self->_updateHandler, 0);
  objc_storeStrong(&self->_uiWillDismissHandler, 0);
  objc_storeStrong(&self->_mediaRemoteUpdateHandler, 0);
  objc_storeStrong(&self->_homeKitUpdateHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
