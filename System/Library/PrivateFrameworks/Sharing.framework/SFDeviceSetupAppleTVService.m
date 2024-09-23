@implementation SFDeviceSetupAppleTVService

- (SFDeviceSetupAppleTVService)init
{
  SFDeviceSetupAppleTVService *v2;
  SFDeviceSetupAppleTVService *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupAppleTVService;
  v2 = -[SFDeviceSetupAppleTVService init](&v7, sel_init);
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
  SFDeviceSetupAppleTVService *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupAppleTVService *)FatalErrorF();
    -[SFDeviceSetupAppleTVService _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceSetupAppleTVService _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupAppleTVService;
    -[SFDeviceSetupAppleTVService dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  SFClient *preventExitForLocaleClient;
  id progressHandler;

  -[SFClient invalidate](self->_preventExitForLocaleClient, "invalidate");
  preventExitForLocaleClient = self->_preventExitForLocaleClient;
  self->_preventExitForLocaleClient = 0;

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
  block[2] = __39__SFDeviceSetupAppleTVService_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __39__SFDeviceSetupAppleTVService_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  SFClient *v3;
  SFClient *preventExitForLocaleClient;

  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_activateCalled = 1;
  self->_advertiseFast = CFPrefs_GetInt64() != 0;
  self->_prefCDPEnabled = CFPrefs_GetInt64() != 0;
  if (_os_feature_enabled_impl())
    self->_prefAppleIDSetupEnabled = 1;
  self->_prefTVLatency = CFPrefs_GetInt64() != 0;
  self->_prefHH2Enabled = CFPrefs_GetInt64() != 0;
  if (!self->_preventExitForLocaleClient)
  {
    v3 = objc_alloc_init(SFClient);
    preventExitForLocaleClient = self->_preventExitForLocaleClient;
    self->_preventExitForLocaleClient = v3;

    -[SFClient preventExitForLocaleReason:](self->_preventExitForLocaleClient, "preventExitForLocaleReason:", CFSTR("AppleTVSetup"));
  }
  -[SFDeviceSetupAppleTVService _sfServiceStart](self, "_sfServiceStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceSetupAppleTVService_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceSetupAppleTVService_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  SFService *sfService;
  void (**progressHandler)(id, uint64_t, _QWORD);

  if (!self->_invalidateCalled
    && gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  if (self->_sfSession)
    -[SFDeviceSetupAppleTVService _handleSessionEnded:](self, "_handleSessionEnded:");
  -[SFService invalidate](self->_sfService, "invalidate");
  sfService = self->_sfService;
  self->_sfService = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 20, 0);
  -[SFDeviceSetupAppleTVService _cleanup](self, "_cleanup");
}

- (void)_reportProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = _Block_copy(self->_progressHandler);
  v7 = v6;
  if (v6)
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);

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

  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFService invalidate](self->_sfService, "invalidate");
  v3 = objc_alloc_init(SFService);
  sfService = self->_sfService;
  self->_sfService = v3;

  if (self->_advertiseFast)
    -[SFService setAdvertiseRate:](self->_sfService, "setAdvertiseRate:", 50);
  -[SFService setDispatchQueue:](self->_sfService, "setDispatchQueue:", self->_dispatchQueue);
  -[SFService setIdentifier:](self->_sfService, "setIdentifier:", CFSTR("com.apple.sharing.AppleTVSetup"));
  -[SFService setLabel:](self->_sfService, "setLabel:", CFSTR("AppleTVSetup"));
  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  -[SFService setDeviceActionType:](self->_sfService, "setDeviceActionType:", 1);
  -[SFService setPairSetupACL:](self->_sfService, "setPairSetupACL:", &unk_1E4891200);
  -[SFService setPinType:](self->_sfService, "setPinType:", 1);
  -[SFService setSessionFlags:](self->_sfService, "setSessionFlags:", 1);
  -[SFService setTouchRemoteEnabled:](self->_sfService, "setTouchRemoteEnabled:", 1);
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke;
  v9[3] = &unk_1E482FA30;
  v9[4] = self;
  -[SFService setSessionStartedHandler:](self->_sfService, "setSessionStartedHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_2;
  v8[3] = &unk_1E482FA58;
  v8[4] = self;
  -[SFService setSessionEndedHandler:](self->_sfService, "setSessionEndedHandler:", v8);
  v6 = self->_sfService;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_3;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFService activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

uint64_t __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionStarted:", a2);
}

uint64_t __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSessionEnded:", a2);
}

void __46__SFDeviceSetupAppleTVService__sfServiceStart__block_invoke_3(uint64_t a1, void *a2)
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
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
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
  SFSession *sfSession;
  uint64_t v7;
  SFSession *v8;
  SFSession *v9;
  SFDeviceOperationHandlerCDPSetup *v10;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  SFSession *v12;
  HMDeviceSetupOperationHandler *v13;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  HMDeviceSetupOperationHandler *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  SFSession *v20;
  SFDeviceOperationHandlerWiFiSetup *v21;
  SFDeviceOperationHandlerWiFiSetup *wifiSetupHandler;
  SFDeviceOperationHandlerCNJSetup *v23;
  SFDeviceOperationHandlerCNJSetup *captiveNetworkHandler;
  SFSession *v25;
  void (**progressHandler)(id, uint64_t, void *);
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  _QWORD v37[5];
  _QWORD v38[5];
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  sfSession = self->_sfSession;
  if (sfSession)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService <= 60)
    {
      if (gLogCategory_SFDeviceSetupAppleTVService == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_15;
        sfSession = self->_sfSession;
      }
      -[SFSession peer](sfSession, "peer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "peer");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(v5, "peer");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    objc_storeStrong((id *)&self->_sfSession, a3);
    v7 = MEMORY[0x1E0C809B0];
    v8 = self->_sfSession;
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke;
    v38[3] = &unk_1E482E2D0;
    v38[4] = self;
    -[SFSession registerRequestID:options:handler:](v8, "registerRequestID:options:handler:", CFSTR("_pa"), &unk_1E4891228, v38);
    v9 = self->_sfSession;
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_2;
    v37[3] = &unk_1E482E2D0;
    v37[4] = self;
    -[SFSession registerRequestID:options:handler:](v9, "registerRequestID:options:handler:", CFSTR("_bc"), &unk_1E4891250, v37);
    if (self->_prefCDPEnabled)
    {
      v10 = objc_alloc_init(SFDeviceOperationHandlerCDPSetup);
      cdpSetupHandler = self->_cdpSetupHandler;
      self->_cdpSetupHandler = v10;

      -[SFDeviceOperationHandlerCDPSetup setDispatchQueue:](self->_cdpSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHandlerCDPSetup setSfSession:](self->_cdpSetupHandler, "setSfSession:", v5);
      -[SFDeviceOperationHandlerCDPSetup activate](self->_cdpSetupHandler, "activate");
    }
    if (self->_prefAppleIDSetupEnabled)
    {
      v12 = self->_sfSession;
      v36[0] = v7;
      v36[1] = 3221225472;
      v36[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_3;
      v36[3] = &unk_1E482E2D0;
      v36[4] = self;
      -[SFSession registerRequestID:options:handler:](v12, "registerRequestID:options:handler:", CFSTR("_appleIDSetup"), &unk_1E4891278, v36);
    }
    v13 = (HMDeviceSetupOperationHandler *)objc_alloc_init((Class)getHMDeviceSetupOperationHandlerClass_1[0]());
    homeKitSetupHandler = self->_homeKitSetupHandler;
    self->_homeKitSetupHandler = v13;

    v15 = self->_homeKitSetupHandler;
    -[SFSession trSession](self->_sfSession, "trSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDeviceSetupOperationHandler registerMessageHandlersForSession:](v15, "registerMessageHandlersForSession:", v16);

    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)objc_msgSend(objc_alloc((Class)getTVLAudioLatencyEstimatorClass[0]()), "initWithMessageSession:", v17);
      objc_storeStrong((id *)&self->_tvLatencyEstimator, v18);
      v34[0] = v7;
      v34[1] = 3221225472;
      v34[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_4;
      v34[3] = &unk_1E482E370;
      v34[4] = self;
      v35 = v18;
      v19 = v18;
      objc_msgSend(v19, "setProgressEventHandler:", v34);

    }
    v20 = self->_sfSession;
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_6;
    v33[3] = &unk_1E482E2D0;
    v33[4] = self;
    -[SFSession registerRequestID:options:handler:](v20, "registerRequestID:options:handler:", CFSTR("_tvlS"), &unk_1E48912A0, v33, v30);
    v21 = objc_alloc_init(SFDeviceOperationHandlerWiFiSetup);
    wifiSetupHandler = self->_wifiSetupHandler;
    self->_wifiSetupHandler = v21;

    -[SFDeviceOperationHandlerWiFiSetup setDispatchQueue:](self->_wifiSetupHandler, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceOperationHandlerWiFiSetup setSfSession:](self->_wifiSetupHandler, "setSfSession:", v5);
    -[SFDeviceOperationHandlerWiFiSetup activate](self->_wifiSetupHandler, "activate");
    v23 = objc_alloc_init(SFDeviceOperationHandlerCNJSetup);
    captiveNetworkHandler = self->_captiveNetworkHandler;
    self->_captiveNetworkHandler = v23;

    -[SFDeviceOperationHandlerCNJSetup setDispatchQueue:](self->_captiveNetworkHandler, "setDispatchQueue:", self->_dispatchQueue);
    -[SFDeviceOperationHandlerCNJSetup setSfSession:](self->_captiveNetworkHandler, "setSfSession:", v5);
    -[SFDeviceOperationHandlerCNJSetup activate](self->_captiveNetworkHandler, "activate");
    v25 = self->_sfSession;
    v32[0] = v7;
    v32[1] = 3221225472;
    v32[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_7;
    v32[3] = &unk_1E482E2D0;
    v32[4] = self;
    -[SFSession registerRequestID:options:handler:](v25, "registerRequestID:options:handler:", CFSTR("_finish"), &unk_1E48912C8, v32);
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v39 = CFSTR("trSession");
      objc_msgSend(v5, "trSession");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = v27;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 31, v28);

    }
    -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 0);

  }
LABEL_15:

}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePreAuthRequest:responseHandler:");
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBasicConfigRequest:responseHandler:");
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleAppleIDSetupRequest:responseHandler:");
}

void __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;

  v5 = a3;
  v6 = *(void **)(a1 + 40);
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_5;
  v11[3] = &unk_1E482E348;
  v8 = v6;
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v14 = v5;
  v15 = a2;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_5(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 56))
    return objc_msgSend(*(id *)(result + 40), "_handleTVLatencyProgressEvent:info:", *(_QWORD *)(result + 56), *(_QWORD *)(result + 48));
  return result;
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleTVLatencyRequest:responseHandler:");
}

uint64_t __53__SFDeviceSetupAppleTVService__handleSessionStarted___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFinishRequest:responseHandler:");
}

- (void)_handleSessionEnded:(id)a3
{
  SFSession *sfSession;
  SFSession *v5;
  SFDeviceOperationHandlerWiFiSetup *wifiSetupHandler;
  TVLAudioLatencyEstimator *tvLatencyEstimator;
  HMDeviceSetupOperationHandler *homeKitSetupHandler;
  SFDeviceOperationHandlerCDPSetup *cdpSetupHandler;
  SFDeviceOperationHandlerCNJSetup *captiveNetworkHandler;
  SFSession *v11;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v13;
  SFSession *v14;

  sfSession = (SFSession *)a3;
  v5 = sfSession;
  if (self->_sfSession != sfSession)
    goto LABEL_9;
  v14 = sfSession;
  if (sfSession && gLogCategory_SFDeviceSetupAppleTVService <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService != -1)
    {
LABEL_5:
      -[SFSession peer](sfSession, "peer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      goto LABEL_7;
    }
    if (_LogCategory_Initialize())
    {
      sfSession = self->_sfSession;
      goto LABEL_5;
    }
  }
LABEL_7:
  -[SFDeviceOperationHandlerWiFiSetup invalidate](self->_wifiSetupHandler, "invalidate", v13);
  wifiSetupHandler = self->_wifiSetupHandler;
  self->_wifiSetupHandler = 0;

  -[TVLAudioLatencyEstimator invalidate](self->_tvLatencyEstimator, "invalidate");
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  self->_tvLatencyFinalReported = 0;
  homeKitSetupHandler = self->_homeKitSetupHandler;
  self->_homeKitSetupHandler = 0;

  -[SFDeviceOperationHandlerCDPSetup invalidate](self->_cdpSetupHandler, "invalidate");
  cdpSetupHandler = self->_cdpSetupHandler;
  self->_cdpSetupHandler = 0;

  -[SFDeviceOperationHandlerCNJSetup invalidate](self->_captiveNetworkHandler, "invalidate");
  captiveNetworkHandler = self->_captiveNetworkHandler;
  self->_captiveNetworkHandler = 0;

  v11 = self->_sfSession;
  self->_sfSession = 0;

  -[SFService setNeedsSetup:](self->_sfService, "setNeedsSetup:", 1);
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  v5 = v14;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 32, 0);
    v5 = v14;
  }
LABEL_9:

}

- (void)_handlePreAuthRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void (**progressHandler)(id, uint64_t, id);
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t Int64;
  BOOL v14;
  uint64_t v15;
  const char *v16;
  NSString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  const char *v22;
  NSString *v23;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    v21 = v6;
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 40, v6);
  if (self->_prefAppleIDSetupEnabled)
    v10 = (16 * self->_prefCDPEnabled) | 0x8000;
  else
    v10 = 16 * self->_prefCDPEnabled;
  if (self->_prefTVLatency)
    v10 |= 0x40uLL;
  if (self->_prefHH2Enabled)
    v10 |= 0x800uLL;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10 | 0x2000, v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("ff"));

  LOBYTE(v11) = CFDictionaryGetInt64Ranged();
  -[SFSession peerDevice](self->_sfSession, "peerDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDeviceClassCode:", v11);

  Int64 = CFDictionaryGetInt64();
  v14 = Int64 != 0;
  v15 = Int64;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    v16 = "no";
    if (v15)
      v16 = "yes";
    v22 = v16;
    LogPrintF();
  }
  self->_isCLIMode = v14;
  -[SFService setIsCLIMode:](self->_sfService, "setIsCLIMode:", v15 != 0, v22);
  if (v15)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      v23 = v17;
      LogPrintF();
    }
    self->_forcedPasscode = v17;
    -[SFService setForcedPin:](self->_sfService, "setForcedPin:", v17, v23);

  }
  v18 = (void *)GestaltCopyAnswer();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("mdN"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVService <= 90
         && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v19 = (void *)GestaltCopyAnswer();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("model"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVService <= 90
         && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v20 = (void *)MGCopyAnswer();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("osBuild"));
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVService > 90)
      goto LABEL_48;
    if (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_48:
  (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);

}

- (void)_handleBasicConfigRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**progressHandler)(id, uint64_t, void *);
  id v12;
  const char *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  double v20;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "addEntriesFromDictionary:", v6);
  if (self->_isCLIMode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("isCLIMode"));

    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 80, v9);
  SFMyAltDSID();
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "UTF8String");

  if (v13)
  {
    -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("AltDSID"), 16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(objc_retainAutorelease(v14), "bytes");
      strlen(v13);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", SipHash());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("adh"));

    }
  }
  CFDateGetTypeID();
  CFDictionaryGetTypedValue();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = gLogCategory_SFDeviceSetupAppleTVService;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize())
      LogPrintF();
    v18 = gLogCategory_SFDeviceSetupAppleTVService;
  }
  if (v17)
  {
    if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
    {
      getTMSourceProxBuddy[0]();
      LogPrintF();
    }
    v19 = getTMSourceProxBuddy[0]();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    ((void (*)(uint64_t, double, double))softLinkTMSetSourceTime[0])(v19, v20, 10.0);
    v18 = gLogCategory_SFDeviceSetupAppleTVService;
  }
  if (v18 <= 30 && (v18 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);

}

- (void)_handleAppleIDSetupRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void (**progressHandler)(id, uint64_t, void *);
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    v20 = v6;
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "addEntriesFromDictionary:", v6);
  if (self->_isCLIMode)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("isCLIMode"));

    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      v20 = v9;
      LogPrintF();
    }
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 224, v9);
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate", v20);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = objc_alloc_init((Class)getAISSetupContextClass[0]());
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CFCF18]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRequiredServiceTypes:", v14);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CFCF38], *MEMORY[0x1E0CFCF28], 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setDesiredServiceTypes:", v15);

    objc_msgSend(v13, "setShouldBackgroundDesiredServices:", 1);
    objc_msgSend(v13, "setLocalRole:", 1);
    objc_msgSend(v13, "setRemoteRole:", 4);
    objc_msgSend(v13, "setMessageSessionTemplate:", v12);
    v16 = _Block_copy(self->_appleIDSetupReportHandler);
    v17 = objc_alloc_init((Class)getAISSetupControllerClass[0]());
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __74__SFDeviceSetupAppleTVService__handleAppleIDSetupRequest_responseHandler___block_invoke;
    v21[3] = &unk_1E4832B38;
    v22 = v16;
    v18 = v16;
    objc_msgSend(v17, "setupWithContext:completionHandler:", v13, v21);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("dn"));
    if (gLogCategory_SFDeviceSetupAppleTVService <= 30
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);

  }
  else
  {
    NSErrorWithOSStatusF();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceSetupAppleTVService <= 90
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v7 + 2))(v7, v19, 0, 0);

  }
}

void __74__SFDeviceSetupAppleTVService__handleAppleIDSetupRequest_responseHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)_handleTVLatencyRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  void *v7;
  TVLAudioLatencyEstimator *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    v10 = v11;
    LogPrintF();
  }
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = self->_tvLatencyEstimator;
    if (v8)
    {
      if (gLogCategory_SFDeviceSetupAppleTVService <= 30
        && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[TVLAudioLatencyEstimator activate](v8, "activate");
      -[SFDeviceSetupAppleTVService _reportProgress:info:](self, "_reportProgress:info:", 260, v11);
      if (gLogCategory_SFDeviceSetupAppleTVService <= 30
        && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, _QWORD, _QWORD, _QWORD))v6 + 2))(v6, 0, 0, MEMORY[0x1E0C9AA70]);
    }
    else
    {
      NSErrorWithOSStatusF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFDeviceSetupAppleTVService <= 90
        && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      (*((void (**)(id, void *, _QWORD, _QWORD))v6 + 2))(v6, v9, 0, 0);

    }
  }
  else
  {
    NSErrorWithOSStatusF();
    v8 = (TVLAudioLatencyEstimator *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceSetupAppleTVService <= 90
      && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, TVLAudioLatencyEstimator *, _QWORD, _QWORD))v6 + 2))(v6, v8, 0, 0);
  }

}

- (void)_handleTVLatencyProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6;
  int v7;
  SFDeviceSetupAppleTVService *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  id v12;

  v6 = a4;
  v12 = v6;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVService != -1 || (v7 = _LogCategory_Initialize(), v6 = v12, v7))
    {
      v10 = a3;
      v11 = v6;
      LogPrintF();
      v6 = v12;
    }
  }
  switch(a3)
  {
    case 0uLL:
      v8 = self;
      v9 = 270;
      goto LABEL_12;
    case 1uLL:
      v8 = self;
      v9 = 277;
      goto LABEL_12;
    case 2uLL:
      v8 = self;
      v9 = 274;
      goto LABEL_12;
    case 3uLL:
      if (!self->_tvLatencyFinalReported)
      {
        -[SFDeviceSetupAppleTVService _reportProgress:info:](self, "_reportProgress:info:", 272, v12);
        v6 = v12;
        self->_tvLatencyFinalReported = 1;
      }
      break;
    case 4uLL:
      v8 = self;
      v9 = 276;
LABEL_12:
      -[SFDeviceSetupAppleTVService _reportProgress:info:](v8, "_reportProgress:info:", v9, v12, v10, v11);
      v6 = v12;
      break;
    default:
      break;
  }

}

- (void)_handleFinishRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_tvLatencyEstimator && !self->_tvLatencyFinalReported)
  {
    -[SFDeviceSetupAppleTVService _reportProgress:info:](self, "_reportProgress:info:", 272, MEMORY[0x1E0C9AA70]);
    self->_tvLatencyFinalReported = 1;
  }
  if (gLogCategory_SFDeviceSetupAppleTVService <= 30
    && (gLogCategory_SFDeviceSetupAppleTVService != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v8);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFDeviceSetupAppleTVService__handleFinishRequest_responseHandler___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

uint64_t __68__SFDeviceSetupAppleTVService__handleFinishRequest_responseHandler___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 10))
  {
    result = *(_QWORD *)(v1 + 104);
    if (result)
      return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, 96, 0);
  }
  return result;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPasscode
{
  return self->_forcedPasscode;
}

- (void)setForcedPasscode:(id)a3
{
  self->_forcedPasscode = (NSString *)a3;
}

- (id)appleIDSetupReportHandler
{
  return self->_appleIDSetupReportHandler;
}

- (void)setAppleIDSetupReportHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appleIDSetupReportHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_captiveNetworkHandler, 0);
  objc_storeStrong((id *)&self->_wifiSetupHandler, 0);
  objc_storeStrong((id *)&self->_tvLatencyEstimator, 0);
  objc_storeStrong((id *)&self->_homeKitSetupHandler, 0);
  objc_storeStrong((id *)&self->_cdpSetupHandler, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_preventExitForLocaleClient, 0);
}

@end
