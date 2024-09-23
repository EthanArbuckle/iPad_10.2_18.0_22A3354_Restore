@implementation SKStepBasicConfigServer

- (SKStepBasicConfigServer)init
{
  SKStepBasicConfigServer *v2;
  SKStepBasicConfigServer *v3;
  SKStepBasicConfigServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKStepBasicConfigServer;
  v2 = -[SKStepBasicConfigServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = v3;
  }

  return v3;
}

- (NSString)description
{
  void *v2;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSPrintF();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v2;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__SKStepBasicConfigServer_activate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  CUMessaging *skMessaging;
  CUMessaging *v4;
  id v5;
  _QWORD v6[6];
  _QWORD v7[6];

  skMessaging = self->_skMessaging;
  if (skMessaging)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __36__SKStepBasicConfigServer__activate__block_invoke;
    v7[3] = &unk_24D22B118;
    v7[4] = skMessaging;
    v7[5] = self;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __36__SKStepBasicConfigServer__activate__block_invoke_2;
    v6[3] = &unk_24D22B140;
    v6[4] = skMessaging;
    v6[5] = self;
    v4 = skMessaging;
    -[CUMessaging registerRequestID:options:requestHandler:completionHandler:](v4, "registerRequestID:options:requestHandler:completionHandler:", CFSTR("_bsCf"), 0, v7, v6);

  }
  else
  {
    NSErrorF_safe();
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SKStepBasicConfigServer _completeWithError:](self, "_completeWithError:", v5);

  }
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SKStepBasicConfigServer_invalidate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidated
{
  id skCompletionHandler;
  void *v4;
  void (**v5)(id, void *);

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v5 = (void (**)(id, void *))_Block_copy(self->_skCompletionHandler);
    skCompletionHandler = self->_skCompletionHandler;
    self->_skCompletionHandler = 0;

    if (v5)
    {
      NSErrorF_safe();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v4);

    }
    self->_invalidateDone = 1;
    if (gLogCategory_SKStepBasicConfigServer <= 30
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

- (void)_completeWithError:(id)a3
{
  id v4;
  void *v5;
  id responseHandler;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (v4)
  {
    if (gLogCategory_SKStepBasicConfigServer <= 90
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (gLogCategory_SKStepBasicConfigServer <= 30
         && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v5 = _Block_copy(self->_responseHandler);
  responseHandler = self->_responseHandler;
  self->_responseHandler = 0;

  if (v5)
  {
    if (v4)
      v7 = 0;
    else
      v7 = MEMORY[0x24BDBD1B8];
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __46__SKStepBasicConfigServer__completeWithError___block_invoke;
    v9[3] = &unk_24D22B140;
    v9[4] = self;
    v10 = v4;
    (*((void (**)(void *, uint64_t, _QWORD, id, _QWORD *))v5 + 2))(v5, v7, 0, v10, v9);

  }
}

- (void)_handleRequestBasicConfig:(id)a3 responseHandler:(id)a4
{
  id v6;
  SKEventBasicConfigUpdated *v7;
  id WeakRetained;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (gLogCategory_SKStepBasicConfigServer <= 30
    && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSObjectOneLine();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[SKStepBasicConfigServer setOutClientConfig:](self, "setOutClientConfig:", v13, v12);
  v7 = -[SKEventBasicConfigUpdated initWithBasicConfig:]([SKEventBasicConfigUpdated alloc], "initWithBasicConfig:", v13);
  WeakRetained = objc_loadWeakRetained((id *)&self->_skSetupObject);
  objc_msgSend(WeakRetained, "_reportEvent:", v7);

  -[SKStepBasicConfigServer serverConfig](self, "serverConfig");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = v9;
  else
    v11 = MEMORY[0x24BDBD1B8];
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, void *))v6 + 2))(v6, v11, 0, 0, &__block_literal_global_14);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)skCompletionHandler
{
  return self->_skCompletionHandler;
}

- (void)setSkCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (CUMessaging)skMessaging
{
  return self->_skMessaging;
}

- (void)setSkMessaging:(id)a3
{
  objc_storeStrong((id *)&self->_skMessaging, a3);
}

- (SKSetupBase)skSetupObject
{
  return (SKSetupBase *)objc_loadWeakRetained((id *)&self->_skSetupObject);
}

- (void)setSkSetupObject:(id)a3
{
  objc_storeWeak((id *)&self->_skSetupObject, a3);
}

- (NSDictionary)serverConfig
{
  return self->_serverConfig;
}

- (void)setServerConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDictionary)outClientConfig
{
  return self->_outClientConfig;
}

- (void)setOutClientConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outClientConfig, 0);
  objc_storeStrong((id *)&self->_serverConfig, 0);
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_responseHandler, 0);
}

void __46__SKStepBasicConfigServer__completeWithError___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(void *, _QWORD);
  id v4;
  id v5;

  v5 = a2;
  v3 = (void (**)(void *, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 32));
  if (v3)
  {
    if (*(_QWORD *)(a1 + 40))
      v4 = *(id *)(a1 + 40);
    else
      v4 = v5;
    ((void (**)(void *, id))v3)[2](v3, v4);
  }

}

void __37__SKStepBasicConfigServer_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_SKStepBasicConfigServer <= 30
      && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v6 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 16));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    if (v6)
    {
      NSErrorF_safe();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *, void *))v6 + 2))(v6, 0, 0, v5, &__block_literal_global_2568);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "deregisterRequestID:completionHandler:", CFSTR("_bsCf"), &__block_literal_global_9);
    objc_msgSend(*(id *)(a1 + 32), "_invalidated");

  }
}

_QWORD *__36__SKStepBasicConfigServer__activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *result;
  uint64_t v6;

  v6 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v6 == result[5])
    return (_QWORD *)objc_msgSend(result, "_handleRequestBasicConfig:responseHandler:", a3, a5);
  return result;
}

_QWORD *__36__SKStepBasicConfigServer__activate__block_invoke_2(_QWORD *result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = result[4];
    result = (_QWORD *)result[5];
    if (v2 == result[5])
      return (_QWORD *)objc_msgSend(result, "_completeWithError:", a2);
  }
  return result;
}

uint64_t __35__SKStepBasicConfigServer_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SKStepBasicConfigServer <= 30
    && (gLogCategory_SKStepBasicConfigServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

@end
