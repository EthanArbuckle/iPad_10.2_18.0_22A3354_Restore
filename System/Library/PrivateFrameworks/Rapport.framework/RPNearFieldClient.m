@implementation RPNearFieldClient

- (RPNearFieldClient)init
{
  RPNearFieldClient *v2;
  RPNearFieldClient *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RPNearFieldClient;
  v2 = -[RPNearFieldClient init](&v5, sel_init);
  v3 = v2;
  if (v2)
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
  return v3;
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3B38];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:options:", v6, a4);

  return v7;
}

- (id)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    -[RPNearFieldClient _XPCConnectionWithMachServiceName:options:](self, "_XPCConnectionWithMachServiceName:options:", CFSTR("com.apple.rapport.nearfield"), 0);
    v3 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE3CA48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AB78);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__RPNearFieldClient__ensureXPCStarted__block_invoke;
    v10[3] = &unk_1E5F4EC60;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __38__RPNearFieldClient__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPNearFieldClient <= 10
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return 0;
}

uint64_t __38__RPNearFieldClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __38__RPNearFieldClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**v3)(void);
  void (**v4)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPNearFieldClient <= 50
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void (**)(void))MEMORY[0x1AF45BE48](self->_interruptionHandler);
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__RPNearFieldClient_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __31__RPNearFieldClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16))
  {
    *(_BYTE *)(v1 + 16) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 17)
      && gLogCategory_RPNearFieldClient <= 30
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    if (v3)
    {
      objc_msgSend(v3, "invalidate");
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 64);
      *(_QWORD *)(v4 + 64) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidated");
    }
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPNearFieldClient <= 50
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPNearFieldClient <= 10
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)stopWithCompletion:(id)a3
{
  id v4;
  id v5;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  v5 = -[RPNearFieldClient _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __40__RPNearFieldClient_stopWithCompletion___block_invoke;
  v13[3] = &unk_1E5F4ED20;
  v8 = v4;
  v14 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __40__RPNearFieldClient_stopWithCompletion___block_invoke_2;
  v11[3] = &unk_1E5F4ED20;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "stopDiscoveryWithCompletion:", v11);

}

void __40__RPNearFieldClient_stopWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = MEMORY[0x1AF45BE48](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __40__RPNearFieldClient_stopWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_RPNearFieldClient <= 90
      && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPNearFieldClient <= 40
         && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  v3 = MEMORY[0x1AF45BE48](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

- (void)failDiscoveryWithError:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = MEMORY[0x1AF45BE48](self->_failedDiscovery);
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (void)receivedTapEvent:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = MEMORY[0x1AF45BE48](self->_tapEventHandler);
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (void)receivedAlwaysOnEventWithSuggestedRole:(unsigned int)a3
{
  if (gLogCategory_RPNearFieldClient <= 90
    && (gLogCategory_RPNearFieldClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)didConnect
{
  void (**v2)(void);
  void (**v3)(void);

  v2 = (void (**)(void))MEMORY[0x1AF45BE48](self->_connectionEstablishedHandler, a2);
  if (v2)
  {
    v3 = v2;
    v2[2]();
    v2 = v3;
  }

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)tapEventHandler
{
  return self->_tapEventHandler;
}

- (void)setTapEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)failedDiscovery
{
  return self->_failedDiscovery;
}

- (void)setFailedDiscovery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)connectionEstablishedHandler
{
  return self->_connectionEstablishedHandler;
}

- (void)setConnectionEstablishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong(&self->_connectionEstablishedHandler, 0);
  objc_storeStrong(&self->_failedDiscovery, 0);
  objc_storeStrong(&self->_tapEventHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
