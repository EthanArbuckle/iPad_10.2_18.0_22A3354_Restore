@implementation SFB389NFCPromptSession

- (SFB389NFCPromptSession)init
{
  SFB389NFCPromptSession *v2;
  SEL v3;
  id v4;

  v2 = (SFB389NFCPromptSession *)FatalErrorF();
  return -[SFB389NFCPromptSession initWithInitialConfiguration:](v2, v3, v4);
}

- (SFB389NFCPromptSession)initWithInitialConfiguration:(id)a3
{
  id v4;
  SFB389NFCPromptSession *v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v8;
  SFB389NFCPromptConfiguration *config;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFB389NFCPromptSession;
  v5 = -[SFB389NFCPromptSession init](&v11, sel_init);
  if (v5)
  {
    CUMainQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v5->_dispatchQueue;
    v5->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = objc_msgSend(v4, "copy");
    config = v5->_config;
    v5->_config = (SFB389NFCPromptConfiguration *)v8;

  }
  return v5;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFB389NFCPromptSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __34__SFB389NFCPromptSession_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    *(_BYTE *)(v2 + 8) = 1;
    if (gLogCategory_SFB389NFCPromptSession <= 30
      && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_getRemoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 16);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __34__SFB389NFCPromptSession_activate__block_invoke_2;
    v6[3] = &unk_1E482FC70;
    v6[4] = v4;
    objc_msgSend(v3, "b389NFCPromptDidRequestPresentationWithConfiguration:responseHandler:", v5, v6);

  }
}

void __34__SFB389NFCPromptSession_activate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  void (**v7)(void *, id, _QWORD, double);
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  if (gLogCategory_SFB389NFCPromptSession <= 30
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = (void (**)(void *, id, _QWORD, double))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 40));
  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    v7[2](v7, v10, a3, a4);
  }

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SFB389NFCPromptSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __36__SFB389NFCPromptSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    *(_BYTE *)(v1 + 9) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_getRemoteObjectProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissCurrentB389NFCPrompt");

    if (gLogCategory_SFB389NFCPromptSession <= 30
      && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)dealloc
{
  objc_super v3;

  if (!self->_invalidateCalled
    && gLogCategory_SFB389NFCPromptSession <= 115
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3.receiver = self;
  v3.super_class = (Class)SFB389NFCPromptSession;
  -[SFB389NFCPromptSession dealloc](&v3, sel_dealloc);
}

- (id)_getRemoteObjectProxy
{
  NSXPCConnection *xpcCnx;
  _QWORD v4[5];

  xpcCnx = self->_xpcCnx;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SFB389NFCPromptSession__getRemoteObjectProxy__block_invoke;
  v4[3] = &unk_1E482DFF0;
  v4[4] = self;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __47__SFB389NFCPromptSession__getRemoteObjectProxy__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(void *, id, _QWORD, double);
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (gLogCategory_SFB389NFCPromptSession <= 90
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = (void (**)(void *, id, _QWORD, double))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 40));
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    v3[2](v3, v6, 0, -1.0);
  }

}

- (void)_ensureXPCStarted
{
  objc_class *v3;
  SFB389NFCPromptSession *v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD v10[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3B38];
    v4 = self;
    v5 = (NSXPCConnection *)objc_msgSend([v3 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke;
    v10[3] = &unk_1E482DF78;
    v10[4] = v4;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v7;
    v9[1] = 3221225472;
    v9[2] = __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_1E482DF78;
    v9[4] = v4;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBBC8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v8);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
  }
}

uint64_t __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFB389NFCPromptSession <= 90
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __43__SFB389NFCPromptSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFB389NFCPromptSession <= 90
    && (gLogCategory_SFB389NFCPromptSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)updateCardConfiguration:(id)a3
{
  void *v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_msgSend(a3, "copy");
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SFB389NFCPromptSession_updateCardConfiguration___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__SFB389NFCPromptSession_updateCardConfiguration___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  id v3;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), *(id *)(a1 + 40));
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[8])
  {
    objc_msgSend(v2, "_getRemoteObjectProxy");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "b389NFCPromptUpdateConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

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

- (id)userResponseHandler
{
  return self->_userResponseHandler;
}

- (void)setUserResponseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_userResponseHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_config, 0);
}

@end
