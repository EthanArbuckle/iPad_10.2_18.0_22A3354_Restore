@implementation SFProxHandoffService

- (SFProxHandoffService)init
{
  SFProxHandoffService *v2;
  SFProxHandoffService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFProxHandoffService;
  v2 = -[SFProxHandoffService init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

  }
  return v3;
}

- (void)dealloc
{
  SFProxHandoffService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFProxHandoffService *)FatalErrorF();
    -[SFProxHandoffService description](v3, v4);
  }
  else
  {
    -[SFProxHandoffService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFProxHandoffService;
    -[SFProxHandoffService dealloc](&v5, sel_dealloc);
  }
}

- (id)description
{
  id v3;
  const __CFString *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("SFProxHandoffService"));
  if (self->_activateCalled)
  {
    v4 = CFSTR(", activated");
  }
  else
  {
    if (!self->_invalidateCalled)
      goto LABEL_6;
    v4 = CFSTR(", invalidated");
  }
  objc_msgSend(v3, "appendString:", v4);
LABEL_6:
  if (self->_service)
    objc_msgSend(v3, "appendFormat:", CFSTR(", %@"), self->_service);
  return v3;
}

- (void)_cleanup
{
  id activateCompletion;

  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = 0;

  self->_serviceState = 0;
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
  v7[2] = __47__SFProxHandoffService_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __47__SFProxHandoffService_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void *v4;
  id activateCompletion;
  id aBlock;

  aBlock = a3;
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  v4 = _Block_copy(aBlock);
  activateCompletion = self->_activateCompletion;
  self->_activateCompletion = v4;

  -[SFProxHandoffService _serviceStart](self, "_serviceStart");
}

- (void)_activated
{
  int serviceState;
  BOOL v4;
  void (**activateCompletion)(id, _QWORD);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  serviceState = self->_serviceState;
  v4 = serviceState == 4 || serviceState == 2;
  if (v4 && self->_service)
  {
    if (gLogCategory_SFProxHandoffService <= 30
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    activateCompletion = (void (**)(id, _QWORD))self->_activateCompletion;
    if (activateCompletion)
    {
      activateCompletion[2](activateCompletion, 0);
      activateCompletion = (void (**)(id, _QWORD))self->_activateCompletion;
    }
    self->_activateCompletion = 0;

  }
  else if (gLogCategory_SFProxHandoffService <= 30
         && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFProxHandoffService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __34__SFProxHandoffService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24)
    && gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)_completedWithError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3
    && gLogCategory_SFProxHandoffService <= 60
    && ((v6 = v3, gLogCategory_SFProxHandoffService != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)_serviceStart
{
  SFService *v3;
  SFService *service;
  uint64_t v5;
  SFService *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  if (!self->_service)
  {
    if (gLogCategory_SFProxHandoffService <= 30
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_serviceState = 1;
    v3 = objc_alloc_init(SFService);
    service = self->_service;
    self->_service = v3;

    -[SFService setAdvertiseRate:](self->_service, "setAdvertiseRate:", 50);
    -[SFService setDispatchQueue:](self->_service, "setDispatchQueue:", self->_dispatchQueue);
    -[SFService setIdentifier:](self->_service, "setIdentifier:", CFSTR("com.apple.sharing.ProxHandoff"));
    -[SFService setLabel:](self->_service, "setLabel:", CFSTR("HandoffService"));
    -[SFService setSessionFlags:](self->_service, "setSessionFlags:", 512);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __37__SFProxHandoffService__serviceStart__block_invoke;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[SFService setInterruptionHandler:](self->_service, "setInterruptionHandler:", v8);
    -[SFService setInvalidationHandler:](self->_service, "setInvalidationHandler:", &__block_literal_global_35);
    -[SFService setSessionEndedHandler:](self->_service, "setSessionEndedHandler:", &__block_literal_global_110_0);
    -[SFService setSessionStartedHandler:](self->_service, "setSessionStartedHandler:", &__block_literal_global_113);
    -[SFService setSessionSecuredHandler:](self->_service, "setSessionSecuredHandler:", &__block_literal_global_115);
    v6 = self->_service;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __37__SFProxHandoffService__serviceStart__block_invoke_6;
    v7[3] = &unk_1E482DFF0;
    v7[4] = self;
    -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

uint64_t __37__SFProxHandoffService__serviceStart__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __37__SFProxHandoffService__serviceStart__block_invoke_2()
{
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __37__SFProxHandoffService__serviceStart__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  id v6;

  v6 = a2;
  v4 = a3;
  if (gLogCategory_SFProxHandoffService <= 30
    && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v6, "peer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
}

void __37__SFProxHandoffService__serviceStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFProxHandoffService <= 30)
  {
    v6 = v2;
    if (gLogCategory_SFProxHandoffService != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      objc_msgSend(v3, "peer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

void __37__SFProxHandoffService__serviceStart__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = v2;
  if (gLogCategory_SFProxHandoffService <= 30)
  {
    v6 = v2;
    if (gLogCategory_SFProxHandoffService != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      objc_msgSend(v3, "peer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v3 = v6;
    }
  }

}

void __37__SFProxHandoffService__serviceStart__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (v5)
  {
    if (gLogCategory_SFProxHandoffService <= 90
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
    v3 = *(void **)(a1 + 32);
    NSErrorWithOSStatusF();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_completedWithError:", v4);

  }
  else
  {
    if (gLogCategory_SFProxHandoffService <= 30
      && (gLogCategory_SFProxHandoffService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_activated");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

@end
