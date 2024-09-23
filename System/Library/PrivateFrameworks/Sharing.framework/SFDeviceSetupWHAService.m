@implementation SFDeviceSetupWHAService

- (SFDeviceSetupWHAService)init
{
  SFDeviceSetupWHAService *v2;
  SFDeviceSetupWHAService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupWHAService;
  v2 = -[SFDeviceSetupWHAService init](&v7, sel_init);
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
  SFDeviceSetupWHAService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupWHAService *)FatalErrorF();
    -[SFDeviceSetupWHAService _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceSetupWHAService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupWHAService;
    -[SFDeviceSetupWHAService dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  id progressHandler;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupWHAService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupWHAService_activate__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 10) = CFPrefs_GetInt64() != 0;
  return objc_msgSend(*(id *)(a1 + 32), "_sfServiceStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupWHAService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupWHAService_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 24))
  {
    objc_msgSend((id)v2, "_handleSessionEnded:");
    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 16), "invalidate");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[7];
  if (v6)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(v5[7], 20, 0);
    v5 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v5, "_cleanup");
}

- (void)_sfServiceStart
{
  SFService *v3;
  SFService *sfService;
  uint64_t v5;
  SFService *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 13);
  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.WHASetup"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("WHASetup"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  -[SFService setPairSetupACL:](self->_sfService, "setPairSetupACL:", &unk_1E4891570);
  -[SFService setPinType:](self->_sfService, "setPinType:", 1);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 1);
  -[SFService setTouchRemoteEnabled:](self->_sfService, "setTouchRemoteEnabled:", 1);
  v5 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke;
  v10[3] = &unk_1E482FA30;
  v10[4] = self;
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v10);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_2;
  v9[3] = &unk_1E482FA58;
  v9[4] = self;
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_3;
  v8[3] = &unk_1E482FA08;
  v8[4] = self;
  -[SFService setReceivedRequestHandler:](self->_sfService, "setReceivedRequestHandler:", v8);
  v6 = self->_sfService;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_4;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

uint64_t __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", a2);
}

uint64_t __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", a2);
}

uint64_t __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleRequest:flags:session:responseHandler:", a4, a3, a2, a5);
}

void __42__SFDeviceSetupWHAService__sfServiceStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v3)
  {
    if (v5)
    {
      v7 = CFSTR("eo");
      v8[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v5 + 16))(v5, 30, v6);

    }
  }
  else if (v5)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD))(v5 + 16))(v5, 10, 0);
  }

}

- (void)_handleSessionStarted:(id)a3
{
  id v5;
  SFSession **p_sfSession;
  void *v7;
  SFDeviceOperationHandlerCDPSetup *v8;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  id v10;
  void *v11;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v13;
  void *v14;
  _QWORD v15[5];

  v5 = a3;
  p_sfSession = &self->_sfSession;
  if (self->_sfSession)
  {
    if (gLogCategory_SFDeviceSetupWHAService <= 60
      && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSession peer](*p_sfSession, "peer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupWHAService <= 30
      && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__SFDeviceSetupWHAService__handleSessionStarted___block_invoke;
    v15[3] = &unk_1E482E2D0;
    v15[4] = self;
    objc_msgSend(v5, "registerRequestID:options:handler:", CFSTR("_info"), 0, v15);
    if (self->_prefCDPEnabled)
    {
      v8 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v8;

      -[SFDeviceOperationHandlerCDPSetup setDispatchQueue:](self->_cdpSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHandlerCDPSetup setSfSession:](self->_cdpSetupHandler, "setSfSession:", v5);
      -[SFDeviceOperationHandlerCDPSetup activate](self->_cdpSetupHandler, "activate");
    }
    v10 = objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass_2[0]());
    objc_setAssociatedObject(v5, "hmDeviceSetup", v10, (void *)0x301);
    objc_msgSend(v5, "trSession");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerMessageHandlersForSession:", v11);

    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 31, 0);
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0, v13);

  }
}

uint64_t __49__SFDeviceSetupWHAService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleInfoExchange:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  void *v6;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *v8;
  void (**v9)(id, uint64_t, _QWORD);
  void *v10;
  SFSession *object;

  sfSession = (SFSession *)a3;
  if (self->_sfSession != sfSession)
    goto LABEL_14;
  object = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupWHAService <= 30)
  {
    if (gLogCategory_SFDeviceSetupWHAService == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_7;
      sfSession = self->_sfSession;
    }
    -[SFSession peer](sfSession, "peer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
LABEL_7:
  -[SFDeviceOperationHandlerCDPSetup invalidate](self->_cdpSetupHandler, "invalidate", v10);
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  objc_setAssociatedObject(object, "hmDeviceSetup", 0, (void *)0x301);
  objc_getAssociatedObject(object, "finished");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 100, 0);
    objc_setAssociatedObject(object, "finished", 0, (void *)0x301);
  }
  v8 = self->_sfSession;
  self->_sfSession = 0;

  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  v9 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (v9)
    v9[2](v9, 32, 0);

  sfSession = object;
LABEL_14:

}

- (void)_handleInfoExchange:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  const char *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    v19 = v6;
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  SFMyAltDSID();
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const char *)objc_msgSend(v9, "UTF8String");

  if (v10)
  {
    -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("AltDSID"), 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(objc_retainAutorelease(v11), "bytes");
      strlen(v10);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SipHash());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("adh"));

    }
  }
  if (self->_needsCDPRepair)
    v14 = (16 * self->_prefCDPEnabled) | 0x200;
  else
    v14 = 16 * self->_prefCDPEnabled;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14, v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("ff"));

  if (self->_prefCDPEnabled)
  {
    v16 = objc_alloc_init((Class)getCDPStateControllerClass_1[0]());
    v20 = 0;
    if (objc_msgSend(v16, "isManateeAvailable:", &v20))
      v17 = 0;
    else
      v17 = 0x20000;

  }
  else
  {
    v17 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("dpf"));

  if (gLogCategory_SFDeviceSetupWHAService <= 30
    && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);

}

- (void)_handleRequest:(id)a3 flags:(unsigned int)a4 session:(id)a5 responseHandler:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  uint64_t Int64Ranged;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void (**progressHandler)(id, uint64_t, _QWORD);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v7 = *(_QWORD *)&a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if ((_DWORD)Int64Ranged == 9)
  {
    if ((v7 & 1) != 0)
    {
      if (gLogCategory_SFDeviceSetupWHAService <= 30
        && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, uint64_t, _QWORD, _QWORD))v10 + 2))(v10, v7, 0, MEMORY[0x1E0C9AA70]);
      objc_setAssociatedObject(v9, "finished", MEMORY[0x1E0C9AAB0], (void *)0x301);
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 96, 0);
      goto LABEL_17;
    }
    v12 = -6768;
    if (gLogCategory_SFDeviceSetupWHAService <= 60)
    {
      if (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize())
        LogPrintF();
      v12 = -6768;
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupWHAService <= 60
      && (gLogCategory_SFDeviceSetupWHAService != -1 || _LogCategory_Initialize()))
    {
      v22 = Int64Ranged;
      v23 = 0;
      LogPrintF();
    }
    v12 = -6732;
  }
  v13 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2F90];
  v15 = v12;
  v24 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("?");
  if (v16)
    v18 = (const __CFString *)v16;
  v25[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1, v22, v23);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, void *, _QWORD))v10 + 2))(v10, v7, v20, 0);

LABEL_17:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)needsCDPRepair
{
  return self->_needsCDPRepair;
}

- (void)setNeedsCDPRepair:(BOOL)a3
{
  self->_needsCDPRepair = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
}

@end
