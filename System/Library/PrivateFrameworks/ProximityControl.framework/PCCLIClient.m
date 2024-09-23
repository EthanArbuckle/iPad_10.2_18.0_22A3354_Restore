@implementation PCCLIClient

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
  v7[2] = __38__PCCLIClient_activateWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __38__PCCLIClient_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  void *v6;
  id v7;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[PCCLIClient _xpcEnsureStarted](self, "_xpcEnsureStarted");
  v7 = (id)MEMORY[0x212BE7198](v5);

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__PCCLIClient_invalidate__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __25__PCCLIClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[NSXPCConnection invalidate](self->_xpcCnx, "invalidate");
  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

  -[PCCLIClient _invalidated](self, "_invalidated");
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

- (void)_wakingXPCEnsureStarted
{
  void *v3;
  void *v4;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *wakingXPCCnx;
  uint64_t v8;
  _QWORD v9[5];
  _QWORD v10[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_wakingXPCCnx)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE2568);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE25C8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", PCXPCLaunchingServiceName, 0);
    wakingXPCCnx = self->_wakingXPCCnx;
    self->_wakingXPCCnx = v6;

    -[NSXPCConnection _setQueue:](self->_wakingXPCCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedInterface:](self->_wakingXPCCnx, "setExportedInterface:", v3);
    -[NSXPCConnection setExportedObject:](self->_wakingXPCCnx, "setExportedObject:", self);
    v8 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke;
    v10[3] = &unk_24CCF6518;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_wakingXPCCnx, "setInterruptionHandler:", v10);
    v9[0] = v8;
    v9[1] = 3221225472;
    v9[2] = __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke_2;
    v9[3] = &unk_24CCF6518;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_wakingXPCCnx, "setInvalidationHandler:", v9);
    -[NSXPCConnection setRemoteObjectInterface:](self->_wakingXPCCnx, "setRemoteObjectInterface:", v4);
    -[NSXPCConnection resume](self->_wakingXPCCnx, "resume");

  }
}

uint64_t __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __38__PCCLIClient__wakingXPCEnsureStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_xpcEnsureStarted
{
  void *v3;
  void *v4;
  id v5;
  NSXPCConnection *v6;
  NSXPCConnection *xpcCnx;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE2568);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254AE25C8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc(MEMORY[0x24BDD1988]);
    v6 = (NSXPCConnection *)objc_msgSend(v5, "initWithMachServiceName:options:", PCXPCServiceName, 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v6;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v3);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __32__PCCLIClient__xpcEnsureStarted__block_invoke;
    v11[3] = &unk_24CCF6518;
    v11[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v11);
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __32__PCCLIClient__xpcEnsureStarted__block_invoke_2;
    v10[3] = &unk_24CCF6518;
    v10[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v10);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v4);
    -[NSXPCConnection _xpcConnection](self->_xpcCnx, "_xpcConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_connection_set_non_launching();

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
}

uint64_t __32__PCCLIClient__xpcEnsureStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __32__PCCLIClient__xpcEnsureStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)dismissBannerWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__PCCLIClient_dismissBannerWithCompletion___block_invoke;
  block[3] = &unk_24CCF6540;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

void __43__PCCLIClient_dismissBannerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  NSLog(CFSTR("DismissBanner"));
  objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_2;
  v8[3] = &unk_24CCF6638;
  v9 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_3;
  v6[3] = &unk_24CCF6638;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "dismissBannerWithCompletion:", v6);

}

void __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __43__PCCLIClient_dismissBannerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  NSLog(CFSTR("DismissBanner completed with error: %@"), v4);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)presentBannerWithCompletion:(id)a3
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
  v7[2] = __43__PCCLIClient_presentBannerWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __43__PCCLIClient_presentBannerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  NSLog(CFSTR("PresentBanner"));
  objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__PCCLIClient_presentBannerWithCompletion___block_invoke_2;
  v8[3] = &unk_24CCF6638;
  v9 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __43__PCCLIClient_presentBannerWithCompletion___block_invoke_3;
  v6[3] = &unk_24CCF6638;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "presentBannerWithCompletion:", v6);

}

void __43__PCCLIClient_presentBannerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __43__PCCLIClient_presentBannerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  NSLog(CFSTR("PresentBanner completed with error: %@"), v4);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)setBannerScaleProgress:(float)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  float v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke;
  block[3] = &unk_24CCF6660;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  double v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  NSLog(CFSTR("setBannerScaleProgress"));
  objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_2;
  v10[3] = &unk_24CCF6638;
  v11 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_DWORD *)(a1 + 48);
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_3;
  v8[3] = &unk_24CCF6638;
  v9 = *(id *)(a1 + 40);
  LODWORD(v7) = v6;
  objc_msgSend(v5, "setBannerScaleProgress:completion:", v8, v7);

}

void __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __49__PCCLIClient_setBannerScaleProgress_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  NSLog(CFSTR("setBannerScaleProgress completed with error: %@"), v4);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)tapBannerWithCompletion:(id)a3
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
  v7[2] = __39__PCCLIClient_tapBannerWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __39__PCCLIClient_tapBannerWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  NSLog(CFSTR("tapBanner"));
  objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__PCCLIClient_tapBannerWithCompletion___block_invoke_2;
  v8[3] = &unk_24CCF6638;
  v9 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __39__PCCLIClient_tapBannerWithCompletion___block_invoke_3;
  v6[3] = &unk_24CCF6638;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "tapBannerWithCompletion:", v6);

}

void __39__PCCLIClient_tapBannerWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

}

void __39__PCCLIClient_tapBannerWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  NSLog(CFSTR("tapBanner completed with error: %@"), v4);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)didProvideState:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "client:didProvideState:", self, v5);

}

- (void)requestState
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__PCCLIClient_requestState__block_invoke;
  block[3] = &unk_24CCF6518;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __27__PCCLIClient_requestState__block_invoke(uint64_t a1)
{
  id v2;

  NSLog(CFSTR("RequestState"));
  objc_msgSend(*(id *)(a1 + 32), "_xpcEnsureStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestState");

}

- (void)stateWithCompletion:(id)a3
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
  v7[2] = __35__PCCLIClient_stateWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __35__PCCLIClient_stateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  NSLog(CFSTR("State"));
  objc_msgSend(*(id *)(a1 + 32), "_wakingXPCEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __35__PCCLIClient_stateWithCompletion___block_invoke_2;
  v8[3] = &unk_24CCF6638;
  v9 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __35__PCCLIClient_stateWithCompletion___block_invoke_3;
  v6[3] = &unk_24CCF6688;
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v5, "stateWithCompletion:", v6);

}

void __35__PCCLIClient_stateWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  if (v3)
  {
    objc_msgSend(v5, "localizedDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v3)[2](v3, v4);

  }
}

void __35__PCCLIClient_stateWithCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)triggerHandoffFeedbackAlertWithCompletion:(id)a3
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
  v7[2] = __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  NSLog(CFSTR("trigger Handoff feedback alert"));
  objc_msgSend(*(id *)(a1 + 32), "_wakingXPCEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke_2;
  v5[3] = &unk_24CCF6638;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "triggerHandoffFeedbackAlertWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __57__PCCLIClient_triggerHandoffFeedbackAlertWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v5, 0);

}

- (void)updateLockscreenMediaThresholdWithCompletion:(id)a3
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
  v7[2] = __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke;
  v7[3] = &unk_24CCF6540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  NSLog(CFSTR("update lockscreen media threshold"));
  objc_msgSend(*(id *)(a1 + 32), "_wakingXPCEnsureStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke_2;
  v5[3] = &unk_24CCF6638;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateLockscreenMediaThresholdWithCompletion:", *(_QWORD *)(a1 + 40));

}

void __60__PCCLIClient_updateLockscreenMediaThresholdWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  NSLog(CFSTR("RemoteObjectProxy with error: %@"), v5);
  v3 = MEMORY[0x212BE7198](*(_QWORD *)(a1 + 32));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PCCLIClientDelegate)delegate
{
  return (PCCLIClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_wakingXPCCnx, 0);
}

@end
