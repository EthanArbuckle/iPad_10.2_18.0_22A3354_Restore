@implementation SKStepBasicConfigClient

- (SKStepBasicConfigClient)init
{
  SKStepBasicConfigClient *v2;
  SKStepBasicConfigClient *v3;
  SKStepBasicConfigClient *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKStepBasicConfigClient;
  v2 = -[SKStepBasicConfigClient init](&v6, sel_init);
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
  block[2] = __35__SKStepBasicConfigClient_activate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__SKStepBasicConfigClient_invalidate__block_invoke;
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
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
}

- (void)_completeWithError:(id)a3
{
  id v4;
  int v5;
  void (**v6)(void *, id);
  id skCompletionHandler;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
    v5 = 3;
  else
    v5 = 4;
  self->_runState = v5;
  v9 = v4;
  if (v4)
  {
    if (gLogCategory_SKStepBasicConfigClient <= 60
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
  else if (gLogCategory_SKStepBasicConfigClient <= 30
         && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v6 = (void (**)(void *, id))_Block_copy(self->_skCompletionHandler);
  skCompletionHandler = self->_skCompletionHandler;
  self->_skCompletionHandler = 0;

  if (v6)
    v6[2](v6, v9);

}

- (void)_run
{
  int runState;
  _BOOL4 v4;
  int v5;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      runState = self->_runState;
      if (runState > 11)
      {
        if (runState == 12)
        {
          if (self->_responseReceived)
          {
            v5 = 13;
            goto LABEL_14;
          }
          v5 = 12;
        }
        else
        {
          if (runState != 13)
            return;
          -[SKStepBasicConfigClient _completeWithError:](self, "_completeWithError:", 0);
          v5 = self->_runState;
        }
      }
      else
      {
        if (!runState)
        {
          v5 = 11;
          goto LABEL_14;
        }
        if (runState != 11)
          return;
        v4 = -[SKStepBasicConfigClient _runBasicConfigStart](self, "_runBasicConfigStart");
        v5 = self->_runState;
        if (v4)
        {
          ++v5;
LABEL_14:
          self->_runState = v5;
        }
      }
      if (v5 == runState)
        return;
      if (gLogCategory_SKStepBasicConfigClient <= 30
        && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
      {
        LogPrintF_safe();
      }
    }
  }
}

- (BOOL)_runBasicConfigStart
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  CUMessaging *v8;
  void *v9;
  void *v11;
  _QWORD v12[5];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[SKStepBasicConfigClient clientConfig](self, "clientConfig");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_lang"));
    }
    else if (gLogCategory_SKStepBasicConfigClient <= 90
           && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("_locale"));
    }
    else if (gLogCategory_SKStepBasicConfigClient <= 90
           && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  v8 = self->_skMessaging;
  if (v8)
  {
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    v13 = CFSTR("timeoutSeconds");
    v14[0] = &unk_24D2337C0;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __47__SKStepBasicConfigClient__runBasicConfigStart__block_invoke;
    v12[3] = &unk_24D22ADF0;
    v12[4] = self;
    -[CUMessaging sendRequestID:requestMessage:options:responseHandler:](v8, "sendRequestID:requestMessage:options:responseHandler:", CFSTR("_bsCf"), v3, v9, v12);
  }
  else
  {
    NSErrorF_safe();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKStepBasicConfigClient _completeWithError:](self, "_completeWithError:", v9);
  }

  return v8 != 0;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (NSDictionary)clientConfig
{
  return self->_clientConfig;
}

- (void)setClientConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)outServerConfig
{
  return self->_outServerConfig;
}

- (void)setOutServerConfig:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outServerConfig, 0);
  objc_storeStrong((id *)&self->_clientConfig, 0);
  objc_destroyWeak((id *)&self->_skSetupObject);
  objc_storeStrong((id *)&self->_skMessaging, 0);
  objc_storeStrong(&self->_skCompletionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

void __47__SKStepBasicConfigClient__runBasicConfigStart__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  _BYTE *v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  id v15;

  v15 = a2;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = *(_BYTE **)(a1 + 32);
  if (!v10[8])
  {
    v11 = v15;
    if (!v15 || v8)
    {
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 32), "_completeWithError:", v8);
      }
      else
      {
        NSErrorF_safe();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_completeWithError:", v12);

      }
    }
    else
    {
      if (gLogCategory_SKStepBasicConfigClient <= 30)
      {
        if (gLogCategory_SKStepBasicConfigClient != -1 || (v13 = _LogCategory_Initialize(), v11 = v15, v13))
        {
          CUPrintNSObjectOneLine();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF_safe();

          v11 = v15;
        }
      }
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = 1;
      objc_msgSend(*(id *)(a1 + 32), "setOutServerConfig:", v11, v14);
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
  }

}

uint64_t __37__SKStepBasicConfigClient_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 8))
  {
    v2 = result;
    *(_BYTE *)(v1 + 8) = 1;
    if (gLogCategory_SKStepBasicConfigClient <= 30
      && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

uint64_t __35__SKStepBasicConfigClient_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SKStepBasicConfigClient <= 30
    && (gLogCategory_SKStepBasicConfigClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

@end
