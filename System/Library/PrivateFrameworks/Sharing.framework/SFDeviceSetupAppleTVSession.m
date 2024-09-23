@implementation SFDeviceSetupAppleTVSession

- (SFDeviceSetupAppleTVSession)init
{
  SFDeviceSetupAppleTVSession *v2;
  SFDeviceSetupAppleTVSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v6;
  NSUUID *sessionID;
  SFDeviceSetupAppleTVSession *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFDeviceSetupAppleTVSession;
  v2 = -[SFDeviceSetupAppleTVSession init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_proxSetupActiveToken = -1;
    v6 = objc_opt_new();
    sessionID = v3->_sessionID;
    v3->_sessionID = (NSUUID *)v6;

    *(_QWORD *)&v3->_numberOfAppleTVsOnAccount = -1;
    v8 = v3;
  }

  return v3;
}

- (void)dealloc
{
  SFDeviceSetupAppleTVSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupAppleTVSession *)FatalErrorF();
    -[SFDeviceSetupAppleTVSession _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceSetupAppleTVSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupAppleTVSession;
    -[SFDeviceSetupAppleTVSession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  int proxSetupActiveToken;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  TROperationQueue *trOperationQueue;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSMutableArray *trOperations;
  SFDeviceOperationWiFiSetup *wifiSetupOperation;
  SFDeviceOperationCNJSetup *captiveJoin;
  TRSession *trSession;
  TVLAudioLatencyEstimator *tvLatencyEstimator;
  SFSession *sfSession;
  UIViewController *presentingViewController;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v21;
  id promptForHomeHandler;
  id promptForHomeiCloudHandler;
  id promptForPINHandler;
  id promptForRoomHandler;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  proxSetupActiveToken = self->_proxSetupActiveToken;
  if (proxSetupActiveToken != -1)
  {
    notify_set_state(proxSetupActiveToken, 0);
    notify_post("com.apple.sharing.wha-prox-setup");
    notify_cancel(self->_proxSetupActiveToken);
    self->_proxSetupActiveToken = -1;
  }
  -[SFDeviceOperationCDPSetup invalidate](self->_cdpSetupOperation, "invalidate");
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = self->_trOperations;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v12, "cancel", (_QWORD)v26);
        objc_msgSend(v12, "setCompletionBlock:", 0);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }

  -[NSMutableArray removeAllObjects](self->_trOperations, "removeAllObjects");
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  -[SFDeviceOperationWiFiSetup invalidate](self->_wifiSetupOperation, "invalidate");
  wifiSetupOperation = self->_wifiSetupOperation;
  self->_wifiSetupOperation = 0;

  -[SFDeviceOperationCNJSetup invalidate](self->_captiveJoin, "invalidate");
  captiveJoin = self->_captiveJoin;
  self->_captiveJoin = 0;

  -[TRSession setDisconnectHandler:](self->_trSession, "setDisconnectHandler:", 0);
  -[TRSession disconnect](self->_trSession, "disconnect");
  trSession = self->_trSession;
  self->_trSession = 0;

  -[TVLAudioLatencyEstimator invalidate](self->_tvLatencyEstimator, "invalidate");
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    v21 = self->_progressHandler;
  }
  else
  {
    v21 = 0;
  }
  self->_progressHandler = 0;

  promptForHomeHandler = self->_promptForHomeHandler;
  self->_promptForHomeHandler = 0;

  promptForHomeiCloudHandler = self->_promptForHomeiCloudHandler;
  self->_promptForHomeiCloudHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  promptForRoomHandler = self->_promptForRoomHandler;
  self->_promptForRoomHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFDeviceSetupAppleTVSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __39__SFDeviceSetupAppleTVSession_activate__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  objc_msgSend((Class)getHMHomeManagerConfigurationClass_0[0](), "defaultPrivateConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(objc_alloc((Class)getHMHomeManagerClass_1[0]()), "initWithHomeMangerConfiguration:", v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 192);
  *(_QWORD *)(v4 + 192) = v3;

  notify_register_check("com.apple.sharing.wha-prox-setup", (int *)(*(_QWORD *)(a1 + 32) + 20));
  notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 20), 1uLL);
  notify_post("com.apple.sharing.wha-prox-setup");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 124) = _os_feature_enabled_impl();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 96) = CFPrefs_GetInt64() != 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 153) = CFPrefs_GetInt64() != 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = CFPrefs_GetInt64() != 0;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 154))
    *(_BYTE *)(v6 + 153) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 400) = CFPrefs_GetInt64() != 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = CFPrefs_GetInt64() != 0;
  v7 = *(_QWORD **)(a1 + 32);
  v8 = v7[67];
  if (v8)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v8 + 16))(v7[67], 10, 0);
    v7 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v7, "_run");

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFDeviceSetupAppleTVSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __41__SFDeviceSetupAppleTVSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16)
    && gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_runFinish:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)homeiCloudEnable
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFDeviceSetupAppleTVSession_homeiCloudEnable__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__SFDeviceSetupAppleTVSession_homeiCloudEnable__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)homeKitSelectHome:(id)a3
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
  v7[2] = __49__SFDeviceSetupAppleTVSession_homeKitSelectHome___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __49__SFDeviceSetupAppleTVSession_homeKitSelectHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "selectHome:", *(_QWORD *)(a1 + 40));
}

- (void)captiveConfirmed
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__SFDeviceSetupAppleTVSession_captiveConfirmed__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __47__SFDeviceSetupAppleTVSession_captiveConfirmed__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)switchToManualAuth
{
  if (self->_pairSetupState == 1)
  {
    self->_pairSetupState = 0;
    -[SFDeviceSetupAppleTVSession _runPairSetupWithFlags:](self, "_runPairSetupWithFlags:", 0);
  }
}

- (void)homeKitSelectRoom:(id)a3
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
  v7[2] = __49__SFDeviceSetupAppleTVSession_homeKitSelectRoom___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __49__SFDeviceSetupAppleTVSession_homeKitSelectRoom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "selectRoom:", *(_QWORD *)(a1 + 40));
}

- (void)pairSetupTryPIN:(id)a3
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
  v7[2] = __47__SFDeviceSetupAppleTVSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __47__SFDeviceSetupAppleTVSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)_reportError:(id)a3 label:(id)a4
{
  void *v4;
  void *v5;
  id v8;
  id v9;
  double v10;
  void (**progressHandler)(id, uint64_t, void *);
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v25[3];
  _QWORD v26[3];
  uint64_t v27;
  const __CFString *v28;
  const __CFString *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    v23 = v9;
    v24 = v8;
    LogPrintF();
  }
  if (self->_isCLIMode && IsAppleInternalBuild())
  {
    v23 = v9;
    v24 = v8;
    FPrintF();
  }
  if (self->_userWaitSeconds == 0.0)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    self->_userWaitSeconds = v10;
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v29 = CFSTR("eo");
    v12 = v8;
    if (!v8)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0CB2F90];
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v15 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v15;
      if (v15)
        v16 = (const __CFString *)v15;
      else
        v16 = CFSTR("?");
      v28 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1, v23, v24);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, -6700, v5);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v30[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1, v23, v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 30, v17);

    if (!v8)
    {

    }
  }
  if (!self->_metricsReported)
  {
    self->_metricsReported = 1;
    -[SFDeviceSetupAppleTVSession _reportMainMetrics:errorLabel:userWaitSeconds:](self, "_reportMainMetrics:errorLabel:userWaitSeconds:", v8, v9, self->_userWaitSeconds);
    -[SFDeviceSetupAppleTVSession _reportErrorMetrics:errorLabel:isFatal:](self, "_reportErrorMetrics:errorLabel:isFatal:", v8, v9, -[SFDeviceSetupAppleTVSession _isPreflightError:](self, "_isPreflightError:", v8) ^ 1);
  }
  v26[0] = v9;
  v25[0] = CFSTR("label");
  v25[1] = CFSTR("errDomain");
  objc_msgSend(v8, "domain", v23, v24);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = CFSTR("?");
  v26[1] = v20;
  v25[2] = CFSTR("errCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "code"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.AppleTVSetupResult"), v22);

}

- (void)_reportProgress:(unsigned int)a3 info:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;

  v4 = *(_QWORD *)&a3;
  v8 = a4;
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = _Block_copy(self->_progressHandler);
  v7 = v6;
  if (v6)
    (*((void (**)(void *, uint64_t, id))v6 + 2))(v6, v4, v8);

}

- (BOOL)_shouldSkipHomeKitSetup
{
  int v3;

  v3 = -[HMHomeManager hasOptedToHH2](self->_homeManager, "hasOptedToHH2");
  if (v3)
    LOBYTE(v3) = (self->_peerFeatureFlags & 0x800) == 0;
  return v3;
}

- (void)_run
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  void *v23;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    -[SFSession identifier](self->_sfSession, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = -[SFDeviceSetupAppleTVSession _runPreflightWiFi](self, "_runPreflightWiFi");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[SFDeviceSetupAppleTVSession _runCaptivePrompt](self, "_runCaptivePrompt", v23);
      if (v4 == 4 || v4 == 2)
      {
        if (self->_appleIDSetupEnabled
          || (v18 = -[SFDeviceSetupAppleTVSession _runPreflightiTunes](self, "_runPreflightiTunes"), v18 == 4)
          || v18 == 2)
        {
          v5 = -[SFDeviceSetupAppleTVSession _runPreflightHomeKit](self, "_runPreflightHomeKit");
          if (v5 == 4 || v5 == 2)
          {
            if (!self->_useSFSession && !self->_isCLIMode
              || ((v6 = -[SFDeviceSetupAppleTVSession _runSFSessionStart](self, "_runSFSessionStart"), v6 == 4)
               || v6 == 2)
              && ((v7 = -[SFDeviceSetupAppleTVSession _runPreAuth](self, "_runPreAuth"), v7 == 4) || v7 == 2)
              && ((v8 = -[SFDeviceSetupAppleTVSession _runPairSetupWithFlags:](self, "_runPairSetupWithFlags:", 0),
                   v8 == 4)
               || v8 == 2)
              && (!self->_homeKitDoFullSetup && !self->_isCLIMode
               || (v9 = -[SFDeviceSetupAppleTVSession _runHomeKitUserInput](self, "_runHomeKitUserInput"), v9 == 4)
               || v9 == 2)
              && ((v10 = -[SFDeviceSetupAppleTVSession _runBasicConfig](self, "_runBasicConfig"), v10 == 4) || v10 == 2))
            {
              v11 = -[SFDeviceSetupAppleTVSession _runTRSessionStart](self, "_runTRSessionStart");
              if (v11 == 4 || v11 == 2)
              {
                v12 = -[SFDeviceSetupAppleTVSession _runTRSetupConfiguration](self, "_runTRSetupConfiguration");
                v13 = v12;
                if (v12 == 4 || v12 == 2)
                {
                  if (!SFDeviceIsVirtualMachine())
                    v13 = -[SFDeviceSetupAppleTVSession _runWiFiSetup](self, "_runWiFiSetup");
                  if (v13 == 4 || v13 == 2)
                  {
                    if (!self->_doCaptiveJoin
                      || (v14 = -[SFDeviceSetupAppleTVSession _runCaptiveJoin](self, "_runCaptiveJoin"), v14 == 4)
                      || v14 == 2)
                    {
                      v15 = -[SFDeviceSetupAppleTVSession _runTRActivation](self, "_runTRActivation");
                      if (v15 == 4 || v15 == 2)
                      {
                        if (self->_appleIDSetupEnabled && (self->_peerFeatureFlags & 0x8000) != 0)
                        {
                          v19 = -[SFDeviceSetupAppleTVSession _runAppleIDSetup](self, "_runAppleIDSetup");
                          if (v19 != 2 && v19 != 4)
                            return;
                        }
                        else
                        {
                          v16 = -[SFDeviceSetupAppleTVSession _runTRAuthentication](self, "_runTRAuthentication");
                          if (v16 != 4 && v16 != 2)
                            return;
                          if (self->_cdpEnabled && (self->_peerFeatureFlags & 0x10) != 0)
                          {
                            v17 = -[SFDeviceSetupAppleTVSession _runCDPSetup](self, "_runCDPSetup");
                            if (v17 != 4 && v17 != 2)
                              return;
                          }
                        }
                        if ((!self->_useSFSession || !self->_homeKitDoKeyExchange && !self->_homeKitDoFullSetup)
                          && !self->_isCLIMode
                          || (v20 = -[SFDeviceSetupAppleTVSession _runHomeKitSetup](self, "_runHomeKitSetup"), v20 == 4)
                          || v20 == 2)
                        {
                          if (!self->_tvLatencyEnabled
                            || (self->_peerFeatureFlags & 0x40) == 0
                            || (v21 = -[SFDeviceSetupAppleTVSession _runTVLatencySetup](self, "_runTVLatencySetup"),
                                v21 == 4)
                            || v21 == 2)
                          {
                            v22 = -[SFDeviceSetupAppleTVSession _runTRCompletion](self, "_runTRCompletion");
                            if (v22 == 4 || v22 == 2)
                              -[SFDeviceSetupAppleTVSession _runFinish:](self, "_runFinish:", 0);
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

- (int)_runPreflightWiFi
{
  int preflightWiFiState;
  void *v5;
  void *v6;
  int Int64Ranged;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  void *v12;
  const char *v14;

  preflightWiFiState = self->_preflightWiFiState;
  if (preflightWiFiState == 4 || preflightWiFiState == 2)
    return self->_preflightWiFiState;
  if (preflightWiFiState)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_preflightWiFiState;
  }
  if (self->_isCLIMode && IsAppleInternalBuild())
    FPrintF();
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 || SFDeviceIsVirtualMachine())
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if (CFDictionaryGetInt64())
    {
      NSErrorWithOSStatusF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        self->_preflightWiFiState = 3;
        -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v8, CFSTR("PreflightWiFi"));
      }
    }
    else
    {
      v8 = 0;
    }
    self->_wifiIsCaptive = CFDictionaryGetInt64() != 0;
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v11 = "UnshareableMDM";
    switch(Int64Ranged)
    {
      case 0:
      case 1:
      case 5:
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_preflightWiFiState = 4;

        return self->_preflightWiFiState;
      case 2:
        break;
      case 3:
        v11 = "UnshareableCarrier";
        break;
      case 4:
        v11 = "UnshareableUnsupportedEAP";
        break;
      case 6:
        v11 = "UnsupportedProfileBased";
        break;
      case 7:
        v11 = "UnshareableEAPShareBlockedByProfile";
        break;
      case 8:
        v11 = "UnshareableThirdPartySource";
        break;
      case 9:
        v11 = "NetworkRequiresOneTimePassword";
        break;
      default:
        v11 = "?";
        break;
    }
    v14 = v11;
    NSErrorWithOSStatusF();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    self->_preflightWiFiState = 3;
    -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v12, CFSTR("PreflightWiFi"), v14);
    v10 = self->_preflightWiFiState;

  }
  else
  {
    NSErrorWithOSStatusF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v9, CFSTR("PreflightWiFi"));

    v10 = 3;
    self->_preflightWiFiState = 3;
  }

  return v10;
}

- (int)_runPreflightiTunes
{
  int preflightiTunesState;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *iTunesUserID;
  int v9;

  preflightiTunesState = self->_preflightiTunesState;
  if (preflightiTunesState != 4 && preflightiTunesState != 2)
  {
    if (preflightiTunesState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preflightiTunesState = 1;
      objc_msgSend((Class)getSSAccountStoreClass_1[0](), "defaultStore");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeAccount");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        objc_msgSend(v6, "accountName");
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        iTunesUserID = self->_iTunesUserID;
        self->_iTunesUserID = v7;

        v9 = 4;
      }
      else
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v9 = 2;
      }
      self->_preflightiTunesState = v9;

    }
  }
  return self->_preflightiTunesState;
}

- (int)_runPreflightHomeKit
{
  int preflightHomeKitState;
  int v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  int v10;

  preflightHomeKitState = self->_preflightHomeKitState;
  HIDWORD(v5) = preflightHomeKitState;
  LODWORD(v5) = preflightHomeKitState;
  v4 = v5 >> 1;
  if ((v4 - 1) < 2)
    return self->_preflightHomeKitState;
  if (v4 == 5)
  {
    if (self->_homeiCloudEnabled)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFDeviceSetupAppleTVSession _homeKitUpdateiCloudSwitchState:](self, "_homeKitUpdateiCloudSwitchState:", 1);
      self->_preflightHomeKitState = 4;
      return self->_preflightHomeKitState;
    }
    if (preflightHomeKitState == 2 || preflightHomeKitState == 4)
      return self->_preflightHomeKitState;
LABEL_24:
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_preflightHomeKitState;
  }
  if (v4)
    goto LABEL_24;
  if (self->_isCLIMode && IsAppleInternalBuild())
    FPrintF();
  v6 = objc_alloc_init((Class)getACAccountStoreClass_4[0]());
  objc_msgSend(v6, "aa_primaryAppleAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v10 = 2;
    self->_preflightHomeKitState = 2;
    goto LABEL_38;
  }
  if ((objc_msgSend(v7, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3B8]) & 1) != 0)
    goto LABEL_41;
  if (!self->_promptForHomeiCloudHandler)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFDeviceSetupAppleTVSession _homeKitUpdateiCloudSwitchState:](self, "_homeKitUpdateiCloudSwitchState:", 1);
LABEL_41:
    self->_preflightHomeKitState = 4;

    return self->_preflightHomeKitState;
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_preflightHomeKitState = 10;
  (*((void (**)(void))self->_promptForHomeiCloudHandler + 2))();
  v10 = self->_preflightHomeKitState;
LABEL_38:

  return v10;
}

- (int)_runSFSessionStart
{
  int sfSessionState;
  SFSession *v5;
  SFSession *sfSession;
  uint64_t v7;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *v9;
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_sfSessionState = 1;
      -[SFSession invalidate](self->_sfSession, "invalidate");
      v5 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v5;

      -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("AppleTVSetup"));
      -[SFSession setPairSetupACL:](self->_sfSession, "setPairSetupACL:", &unk_1E48912F0);
      -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
      -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.AppleTVSetup"));
      -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 4097);
      -[SFSession setTouchRemoteEnabled:](self->_sfSession, "setTouchRemoteEnabled:", 1);
      v7 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke;
      v15[3] = &unk_1E482DFF0;
      v15[4] = self;
      -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v15);
      v14[0] = v7;
      v14[1] = 3221225472;
      v14[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_2;
      v14[3] = &unk_1E482DF78;
      v14[4] = self;
      -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v14);
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_3;
      v13[3] = &unk_1E482DF78;
      v13[4] = self;
      -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", v13);
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_4;
      v12[3] = &unk_1E482FFD8;
      v12[4] = self;
      -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:", v12);
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 35, 0);
      v9 = self->_sfSession;
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_5;
      v11[3] = &unk_1E482DFF0;
      v11[4] = self;
      -[SFSession activateWithCompletion:](v9, "activateWithCompletion:", v11);
    }
  }
  return self->_sfSessionState;
}

uint64_t __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", a2, CFSTR("SFSessionError"));
}

void __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0CB2F90];
  v9 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("?");
  if (v4)
    v6 = (const __CFString *)v4;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6762, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_reportError:label:", v8, CFSTR("SFSessionInterruption"));

}

void __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 16) && *(_QWORD *)(v1 + 56))
  {
    v2 = (void *)MEMORY[0x1E0CB35C8];
    v3 = *MEMORY[0x1E0CB2F90];
    v9 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    v6 = CFSTR("?");
    if (v4)
      v6 = (const __CFString *)v4;
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, -6736, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v1, "_reportError:label:", v8, CFSTR("SFSessionInvalidation"));

  }
}

uint64_t __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  uint64_t result;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    v10 = &unk_1A2AF871E;
    v11 = a3;
    v9 = a2;
    LogPrintF();
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 497))
  {
    v7 = IsAppleInternalBuild();
    v6 = *(_QWORD *)(a1 + 32);
    if (v7)
    {
      if (*(_QWORD *)(v6 + 584))
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pairSetupTryPIN:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 584), v9, v10, v11);
        v6 = *(_QWORD *)(a1 + 32);
      }
    }
  }
  result = *(_QWORD *)(v6 + 560);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __49__SFDeviceSetupAppleTVSession__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v2 + 64) = 3;
    return objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", a2, CFSTR("SFSessionActivate"));
  }
  else
  {
    *(_DWORD *)(v2 + 64) = 4;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
}

- (int)_runPreAuth
{
  int preAuthState;

  preAuthState = self->_preAuthState;
  if (preAuthState != 4 && preAuthState != 2)
  {
    if (preAuthState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preAuthState = 1;
      -[SFDeviceSetupAppleTVSession _runPreAuthRequest](self, "_runPreAuthRequest");
    }
  }
  return self->_preAuthState;
}

- (void)_runPreAuthRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SFSession *sfSession;
  id v26;
  _QWORD v27[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("lang"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("langs"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("locale"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", softLink_AXSVoiceOverTouchEnabled[0]());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("voe"));

  v10 = (void *)MEMORY[0x1E0CB37E8];
  softLink_AXSVoiceOverTouchSpeakingRate();
  objc_msgSend(v10, "numberWithFloat:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("vosr"));

  objc_msgSend((Class)getAXSettingsClass[0](), "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "touchAccommodationsHoldDurationEnabled"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("taHE"));

  v14 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "touchAccommodationsHoldDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("taHD"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v12, "touchAccommodationsIgnoreRepeatEnabled"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("taIRE"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "touchAccommodationsIgnoreRepeatDuration");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("taIRD"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "touchAccommodationsTapActivationMethod"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("taTAM"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "touchAccommodationsTapActivationTimeout");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("taTAT"));

  v22 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v12, "voiceOverDoubleTapInterval");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("vodti"));

  if (self->_isCLIMode && IsAppleInternalBuild())
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v26 = v3;
      LogPrintF();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_forcedPasscode, CFSTR("forcedPin"), v26);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isCLIMode"));
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", SFDeviceClassCodeGet());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("dclass"));

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    v26 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __49__SFDeviceSetupAppleTVSession__runPreAuthRequest__block_invoke;
  v27[3] = &unk_1E482E320;
  v27[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_pa"), &unk_1E4891318, v3, v27, v26);

}

uint64_t __49__SFDeviceSetupAppleTVSession__runPreAuthRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runPreAuthResponse:error:", a4, a2);
}

- (void)_runPreAuthResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    self->_preAuthState = 3;
    if (v7)
    {
      -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v7, CFSTR("PreAuth"));
    }
    else
    {
      NSErrorWithOSStatusF();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v9, CFSTR("PreAuth"));

    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v13 = v6;
      LogPrintF();
    }
    self->_peerFeatureFlags = CFDictionaryGetInt64();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_storeStrong((id *)&self->_appleTVModelNumber, v10);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v13 = 0;
      LogPrintF();
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_storeStrong((id *)&self->_appleTVModel, v11);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v13 = 0;
      LogPrintF();
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_storeStrong((id *)&self->_appleTVBuild, v12);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v13 = 0;
      LogPrintF();
    }
    self->_preAuthState = 4;
    -[SFDeviceSetupAppleTVSession _run](self, "_run", v13);

  }
}

- (int)_runPairSetupWithFlags:(unsigned int)a3
{
  int pairSetupState;
  uint64_t v7;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  _QWORD v11[6];

  pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4 && pairSetupState != 2)
  {
    if (pairSetupState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      self->_pairSetupState = 1;
      v7 = mach_absolute_time();
      if (self->_isCLIMode && self->_forcedPasscode)
      {
        -[SFSession setIsCLIMode:](self->_sfSession, "setIsCLIMode:", 1);
        -[SFSession setForcedPasscode:](self->_sfSession, "setForcedPasscode:", self->_forcedPasscode);
      }
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 60, 0);
      sfSession = self->_sfSession;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __54__SFDeviceSetupAppleTVSession__runPairSetupWithFlags___block_invoke;
      v11[3] = &unk_1E4832A88;
      v11[4] = self;
      v11[5] = v7;
      -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", a3 | 0x80008, v11);
    }
  }
  return self->_pairSetupState;
}

void __54__SFDeviceSetupAppleTVSession__runPairSetupWithFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = v3;
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = v4;
    if (v7)
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v7, CFSTR("PairSetup"));
    }
    else
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 80) = 4;
      v5 = *(_QWORD **)(a1 + 32);
      v6 = v5[67];
      if (v6)
      {
        (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(v5[67], 70, 0);
        v5 = *(_QWORD **)(a1 + 32);
      }
      objc_msgSend(v5, "_run");
    }
    v3 = v7;
  }

}

- (int)_runHomeKitUserInput
{
  int homeKitUserInputState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationHomeKitSetup *v5;
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  homeKitUserInputState = self->_homeKitUserInputState;
  if (homeKitUserInputState != 4)
  {
    if (homeKitUserInputState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homeKitUserInputState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 230, 0);
      -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
      v5 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v5;

      -[SFDeviceOperationHomeKitSetup setDispatchQueue:](self->_homeKitSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHomeKitSetup setUserInteractive:](self->_homeKitSetupOperation, "setUserInteractive:", 1);
      -[SFDeviceOperationHomeKitSetup setPauseAfterUserInput:](self->_homeKitSetupOperation, "setPauseAfterUserInput:", 1);
      -[SFDeviceOperationHomeKitSetup setTimeoutInSeconds:](self->_homeKitSetupOperation, "setTimeoutInSeconds:", 120.0);
      -[SFDeviceOperationHomeKitSetup setIsCLIMode:](self->_homeKitSetupOperation, "setIsCLIMode:", self->_isCLIMode);
      if (self->_promptForHomeHandler)
        -[SFDeviceOperationHomeKitSetup setPromptForHomeHandler:](self->_homeKitSetupOperation, "setPromptForHomeHandler:");
      if (self->_promptForRoomHandler)
        -[SFDeviceOperationHomeKitSetup setPromptForRoomHandler:](self->_homeKitSetupOperation, "setPromptForRoomHandler:");
      v7 = MEMORY[0x1E0C809B0];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke;
      v10[3] = &unk_1E482DF78;
      v10[4] = self;
      -[SFDeviceOperationHomeKitSetup setPauseHandler:](self->_homeKitSetupOperation, "setPauseHandler:", v10);
      v9[0] = v7;
      v9[1] = 3221225472;
      v9[2] = __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke_2;
      v9[3] = &unk_1E482DFF0;
      v9[4] = self;
      -[SFDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetupOperation, "setCompletionHandler:", v9);
      -[SFDeviceOperationHomeKitSetup activate](self->_homeKitSetupOperation, "activate");
    }
  }
  return self->_homeKitUserInputState;
}

uint64_t __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "homeKitSelectedRoomName");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 184);
  *(_QWORD *)(v3 + 184) = v2;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 4;
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

void __51__SFDeviceSetupAppleTVSession__runHomeKitUserInput__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v4 + 160))
  {
    if (!v3)
    {
      NSErrorWithOSStatusF();
      v3 = (id)objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
    }
    v5 = v3;
    *(_DWORD *)(v4 + 168) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("HomeKitUserInput"));
    v3 = v5;
  }

}

- (int)_runBasicConfig
{
  int basicConfigState;
  void (**progressHandler)(id, uint64_t, _QWORD);

  basicConfigState = self->_basicConfigState;
  if (basicConfigState != 4 && basicConfigState != 2)
  {
    if (basicConfigState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_basicConfigState = 1;
      self->_startUserWaitTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 80, 0);
      -[SFDeviceSetupAppleTVSession _runBasicConfigRequest](self, "_runBasicConfigRequest");
    }
  }
  return self->_basicConfigState;
}

- (void)_runBasicConfigRequest
{
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  Class v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SFSession *sfSession;
  uint64_t v46;
  id v47;
  void *v48;
  _QWORD v49[5];
  int v50;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  SFDeviceSetupDeviceInfo();
  v4 = objc_claimAutoreleasedReturnValue();
  v48 = (void *)v4;
  if (v4)
  {
    objc_msgSend(v3, "addEntriesFromDictionary:", v4);
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FF8]) == 1;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("eca"));

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46FC0]);

  if ((v9 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9 == 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("dsub"));

  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "effectiveBoolValueForSetting:", *MEMORY[0x1E0D46EF0]);

  if ((v12 - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12 == 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("aasub"));

  }
  SFDeviceSetupHomeKitInfo(self->_homeManager);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SFDeviceSetupAppleTVSession _shouldSkipHomeKitSetup](self, "_shouldSkipHomeKitSetup"))
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("hkcuis"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v15, CFSTR("hkcuis"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hkin"));

    }
  }
  else if (v14)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("hkin"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((Class)getCLLocationManagerClass_0[0](), "locationServicesEnabled"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("lsEn"));

  SFDeviceSetupAppleTVLocationAuthorizationInfo();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("lsAI"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("lang"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("langs"));
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v50 = 0;
    CFArrayGetTypeID();
    v22 = CFPrefs_CopyTypedValue();
    v23 = (void *)v22;
    if (v22)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("kbs"));
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", v46);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localeIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("locale"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKey:", *MEMORY[0x1E0C99828]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("tempUnit"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v28 = (Class)getOBBundleClass[0]();
  -[objc_class bundleWithIdentifier:](v28, "bundleWithIdentifier:", getOBPrivacyPrivacyPaneIdentifier[0]());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "privacyFlow");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "contentVersion");

  if (v31)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("pfcv"));

  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend((Class)getAFPreferencesClass_0[0](), "sharedPreferences");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    SFDeviceSetupSiriInfo(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "addEntriesFromDictionary:", v35);
    }
    else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
           && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("time"));

  v37 = (const __CFString *)*MEMORY[0x1E0C9B228];
  if (CFPreferencesGetAppBooleanValue(CFSTR("AppleICUForce12HourTime"), (CFStringRef)*MEMORY[0x1E0C9B228], 0))
  {
    v38 = 12;
  }
  else if (CFPreferencesGetAppBooleanValue(CFSTR("AppleICUForce24HourTime"), v37, 0))
  {
    v38 = 24;
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v39, CFSTR("timeCycle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", softLinkTMIsAutomaticTimeEnabled[0]() != 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, CFSTR("timeAuto"));

  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "name");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v42, CFSTR("tz"));
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", softLinkTMIsAutomaticTimeZoneEnabled[0]() != 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v43, CFSTR("tzAuto"));

  -[SFDeviceSetupAppleTVSession _videoSubscriberAccountData](self, "_videoSubscriberAccountData");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v44, CFSTR("vsad"));
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    v47 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v49[0] = MEMORY[0x1E0C809B0];
  v49[1] = 3221225472;
  v49[2] = __53__SFDeviceSetupAppleTVSession__runBasicConfigRequest__block_invoke;
  v49[3] = &unk_1E482E320;
  v49[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_bc"), 0, v3, v49, v47);

}

uint64_t __53__SFDeviceSetupAppleTVSession__runBasicConfigRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runBasicConfigResponse:error:", a4, a2);
}

- (void)_runBasicConfigResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  int v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v13 = 0;
  if (v6 && !v7)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v11 = v6;
      LogPrintF();
    }
    v12 = 0;
    v10 = -[SFDeviceSetupAppleTVSession _verifyiCloudMatch:error:](self, "_verifyiCloudMatch:error:", CFDictionaryGetInt64(), &v12);
    v9 = v12;
    self->_iCloudAccountMatches = v10;
    if (v9
      && gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v11 = v9;
      LogPrintF();
    }
    self->_basicConfigState = 4;
    -[SFDeviceSetupAppleTVSession _run](self, "_run", v11);
    goto LABEL_16;
  }
  self->_basicConfigState = 3;
  if (!v7)
  {
    NSErrorWithOSStatusF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v9, CFSTR("BasicConfig"));
LABEL_16:

    goto LABEL_17;
  }
  -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v7, CFSTR("BasicConfig"));
LABEL_17:

}

- (int)_runTRSessionStart
{
  int trSessionState;
  TROperationQueue *v5;
  TROperationQueue *trOperationQueue;
  NSMutableArray *v7;
  NSMutableArray *trOperations;
  TRSession *v9;
  TRSession *trSession;
  SFDevice *v12;
  SFDevice *v13;
  void *v14;
  TRSession *v15;
  TRSession *v16;
  id v17;
  void *v18;
  TRSession *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  if (self->_isCLIMode && IsAppleInternalBuild())
    FPrintF();
  trSessionState = self->_trSessionState;
  if (trSessionState != 4 && trSessionState != 2)
  {
    if (!trSessionState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trSessionState = 1;
      v5 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_2[0]());
      trOperationQueue = self->_trOperationQueue;
      self->_trOperationQueue = v5;

      if (!self->_trOperationQueue)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession > 90
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_56;
        }
        goto LABEL_38;
      }
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      trOperations = self->_trOperations;
      self->_trOperations = v7;

      if (self->_useSFSession || self->_isCLIMode)
      {
        -[SFSession trSession](self->_sfSession, "trSession");
        v9 = (TRSession *)objc_claimAutoreleasedReturnValue();
        trSession = self->_trSession;
        self->_trSession = v9;

        if (self->_trSession)
        {
          if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
            && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          self->_trSessionState = 4;
          return self->_trSessionState;
        }
        if (gLogCategory_SFDeviceSetupAppleTVSession > 90
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_56;
        }
LABEL_38:
        LogPrintF();
LABEL_56:
        v20 = -6700;
LABEL_57:
        self->_trSessionState = 3;
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2F90];
        v23 = v20;
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        v26 = CFSTR("?");
        if (v24)
          v26 = (const __CFString *)v24;
        v31[0] = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v28, CFSTR("TRSessionStart"));

        return self->_trSessionState;
      }
      v12 = self->_peerDevice;
      if (!v12)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v20 = -6745;
        goto LABEL_57;
      }
      v13 = v12;
      v14 = (void *)objc_msgSend(objc_alloc((Class)getTRNearbyDeviceClass[0]()), "initWithRepresentedDevice:supportedService:", v12, 1);
      if (v14)
      {
        v15 = (TRSession *)objc_msgSend(objc_alloc((Class)getTRSessionClass[0]()), "initWithNearbyDevice:", v14);
        v16 = self->_trSession;
        self->_trSession = v15;

        if (self->_trSession)
        {
          v17 = objc_alloc_init((Class)getTRNearbyDeviceScannerClass[0]());
          if (v17)
          {
            v18 = v17;
            v19 = self->_trSession;
            v29[0] = MEMORY[0x1E0C809B0];
            v29[1] = 3221225472;
            v29[2] = __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke;
            v29[3] = &unk_1E482F150;
            v29[4] = self;
            objc_msgSend(v17, "openSession:withCompletion:", v19, v29);

            return self->_trSessionState;
          }
          if (gLogCategory_SFDeviceSetupAppleTVSession > 90
            || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
          {
            goto LABEL_55;
          }
        }
        else if (gLogCategory_SFDeviceSetupAppleTVSession > 90
               || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_55;
        }
      }
      else if (gLogCategory_SFDeviceSetupAppleTVSession > 90
             || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_55;
      }
      LogPrintF();
LABEL_55:

      goto LABEL_56;
    }
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return self->_trSessionState;
}

void __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  char v11;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 504);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke_2;
  block[3] = &unk_1E4832528;
  v11 = a2;
  block[4] = v6;
  v10 = v5;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __49__SFDeviceSetupAppleTVSession__runTRSessionStart__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_QWORD *)(v1 + 208))
  {
    v2 = result;
    if (*(_BYTE *)(result + 48))
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(v2 + 32) + 204) = 4;
      return objc_msgSend(*(id *)(v2 + 32), "_run");
    }
    else
    {
      *(_DWORD *)(v1 + 204) = 3;
      return objc_msgSend(*(id *)(result + 32), "_reportError:label:", *(_QWORD *)(result + 40), CFSTR("TRSessionOpen"));
    }
  }
  return result;
}

- (int)_runTRSetupConfiguration
{
  int trSetupConfigurationState;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  trSetupConfigurationState = self->_trSetupConfigurationState;
  if (trSetupConfigurationState != 4 && trSetupConfigurationState != 2)
  {
    if (trSetupConfigurationState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trSetupConfigurationState = 1;
      self->_trSetupConfigurationStartTicks = mach_absolute_time();
      v5 = (void *)objc_msgSend(objc_alloc((Class)getTRSetupConfigurationOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v5);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke;
      v8[3] = &unk_1E482D3A0;
      v8[4] = self;
      v9 = v5;
      v6 = v5;
      objc_msgSend(v6, "setCompletionBlock:", v8);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v6);

    }
  }
  return self->_trSetupConfigurationState;
}

void __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 504);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __55__SFDeviceSetupAppleTVSession__runTRSetupConfiguration__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 248) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      getTRSetupConfigurationOperationNeedsNetworkKey[0]();
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 256) = CFDictionaryGetInt64() != 0;
      getTRSetupConfigurationOperationUnauthenticatedServicesKey[0]();
      CFSetGetTypeID();
      CFDictionaryGetTypedValue();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 264);
      *(_QWORD *)(v4 + 264) = v3;

      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v6 = *(_QWORD *)(a1 + 32);
        v7 = "yes";
        if (!*(_BYTE *)(v6 + 256))
          v7 = "no";
        v11 = v7;
        v12 = *(_QWORD *)(v6 + 264);
        v10 = *(_QWORD *)(v6 + 248);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 232) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v10, v11, v12);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 232) = 3;
      v8 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_reportError:label:", v9, CFSTR("TRSetupConfig"));

    }
  }
}

- (int)_runTRNetwork
{
  int trNetworkState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  trNetworkState = self->_trNetworkState;
  if (trNetworkState != 4 && trNetworkState != 2)
  {
    if (trNetworkState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_trNeedsNetwork)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trNetworkState = 1;
      self->_trNetworkStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 200, 0);
      v6 = (void *)objc_msgSend(objc_alloc((Class)getTRNetworkOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v6);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke;
      v9[3] = &unk_1E482D3A0;
      v9[4] = self;
      v10 = v6;
      v7 = v6;
      objc_msgSend(v7, "setCompletionBlock:", v9);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v7);

    }
    else
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trNetworkState = 2;
    }
  }
  return self->_trNetworkState;
}

void __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 504);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __44__SFDeviceSetupAppleTVSession__runTRNetwork__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    getTRNetworkOperationHasNetworkKey[0]();
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 3;
      objc_msgSend(*(id *)(a1 + 40), "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UserErrorDomain"), 301021, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("TRNetwork"));

    }
  }
}

- (int)_runWiFiSetup
{
  int wifiSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationWiFiSetup *v5;
  SFDeviceOperationWiFiSetup *wifiSetupOperation;
  _QWORD v8[5];

  if (SFDeviceIsVirtualMachine())
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_wifiSetupState = 2;
  }
  else
  {
    wifiSetupState = self->_wifiSetupState;
    if (wifiSetupState != 4)
    {
      if (wifiSetupState)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (self->_isCLIMode && IsAppleInternalBuild())
          FPrintF();
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_wifiSetupState = 1;
        progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
        if (progressHandler)
          progressHandler[2](progressHandler, 200, 0);
        -[SFDeviceOperationWiFiSetup invalidate](self->_wifiSetupOperation, "invalidate");
        v5 = objc_alloc_init(SFDeviceOperationWiFiSetup);
        wifiSetupOperation = self->_wifiSetupOperation;
        self->_wifiSetupOperation = v5;

        -[SFDeviceOperationWiFiSetup setDispatchQueue:](self->_wifiSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
        if (self->_prefBonjourTest && (self->_peerFeatureFlags & 0x80) != 0)
          -[SFDeviceOperationWiFiSetup setSetupFlags:](self->_wifiSetupOperation, "setSetupFlags:", -[SFDeviceOperationWiFiSetup setupFlags](self->_wifiSetupOperation, "setupFlags") | 1);
        -[SFDeviceOperationWiFiSetup setSfSession:](self->_wifiSetupOperation, "setSfSession:", self->_sfSession);
        -[SFDeviceOperationWiFiSetup setSkipReachability:](self->_wifiSetupOperation, "setSkipReachability:", self->_doCaptiveJoin);
        -[SFDeviceOperationWiFiSetup setRetryScansCount:](self->_wifiSetupOperation, "setRetryScansCount:", 2);
        -[SFDeviceOperationWiFiSetup setRetryJoinsCount:](self->_wifiSetupOperation, "setRetryJoinsCount:", 2);
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __44__SFDeviceSetupAppleTVSession__runWiFiSetup__block_invoke;
        v8[3] = &unk_1E482DFF0;
        v8[4] = self;
        -[SFDeviceOperationWiFiSetup setCompletionHandler:](self->_wifiSetupOperation, "setCompletionHandler:", v8);
        -[SFDeviceOperationWiFiSetup activate](self->_wifiSetupOperation, "activate");
      }
    }
  }
  return self->_wifiSetupState;
}

void __44__SFDeviceSetupAppleTVSession__runWiFiSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  void *v20;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 312);
  if (v5)
  {
    v20 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 320) = 3;
      if (objc_msgSend(v3, "code") == 301009 || objc_msgSend(v20, "code") == 301000)
      {
        objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v20, CFSTR("WiFiSetup"));
      }
      else
      {
        if (objc_msgSend(v20, "code") != -71157)
          objc_msgSend(v20, "code");
        NSErrorNestedF();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v15, CFSTR("WiFiSetup"));

      }
    }
    else
    {
      objc_msgSend(v5, "metricTotalSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 328) = v6;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "metricWiFiSetupSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 336) = v7;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "metricBonjourTestSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) = v8;
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 500) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "bonjourTestState");
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v10 = *(_QWORD *)(v9 + 328);
        v11 = *(_QWORD *)(v9 + 336);
        v12 = *(_QWORD *)(v9 + 344);
        v13 = *(int *)(v9 + 500);
        if (v13 >= 8)
        {
          if ((int)v13 <= 9)
            v14 = "?";
          else
            v14 = "User";
        }
        else
        {
          v14 = off_1E4832DD0[v13];
        }
        v19 = v14;
        v17 = v11;
        v18 = v12;
        v16 = v10;
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 320) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v16, v17, v18, v19);
    }
    v3 = v20;
  }

}

- (int)_runCaptivePrompt
{
  int v3;

  switch(self->_captivePromptState)
  {
    case 0:
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (!self->_wifiIsCaptive)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession > 30
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_37;
        }
LABEL_25:
        LogPrintF();
LABEL_37:
        v3 = 2;
        goto LABEL_38;
      }
      if (!self->_promptForCaptiveNetworkHandler)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession > 30
          || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_37;
        }
        goto LABEL_25;
      }
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_captivePromptState = 1;
      (*((void (**)(void))self->_promptForCaptiveNetworkHandler + 2))();
      return self->_captivePromptState;
    case 1:
      if (self->_doCaptiveJoin)
      {
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v3 = 4;
LABEL_38:
        self->_captivePromptState = v3;
      }
      else if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
             && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
LABEL_22:
        LogPrintF();
      }
      return self->_captivePromptState;
    case 2:
    case 4:
      return self->_captivePromptState;
    default:
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_22;
      }
      return self->_captivePromptState;
  }
}

- (int)_runCaptiveJoin
{
  int captiveJoinState;
  SFDeviceOperationCNJSetup *v4;
  SFDeviceOperationCNJSetup *captiveJoin;
  _QWORD v7[5];

  captiveJoinState = self->_captiveJoinState;
  if (captiveJoinState != 4)
  {
    if (captiveJoinState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_doCaptiveJoin)
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_captiveJoinState = 1;
      -[SFDeviceOperationCNJSetup invalidate](self->_captiveJoin, "invalidate");
      v4 = objc_alloc_init(SFDeviceOperationCNJSetup);
      captiveJoin = self->_captiveJoin;
      self->_captiveJoin = v4;

      -[SFDeviceOperationCNJSetup setDispatchQueue:](self->_captiveJoin, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationCNJSetup setSfSession:](self->_captiveJoin, "setSfSession:", self->_sfSession);
      -[SFDeviceOperationCNJSetup setIsSetup:](self->_captiveJoin, "setIsSetup:", 1);
      -[SFDeviceOperationCNJSetup setPresentingViewController:](self->_captiveJoin, "setPresentingViewController:", self->_presentingViewController);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFDeviceOperationCNJSetup setCompletionHandler:](self->_captiveJoin, "setCompletionHandler:", v7);
      -[SFDeviceOperationCNJSetup activate](self->_captiveJoin, "activate");
    }
    else
    {
      self->_captiveJoinState = 2;
    }
  }
  return self->_captiveJoinState;
}

void __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 504);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __46__SFDeviceSetupAppleTVSession__runCaptiveJoin__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    NSErrorWithOSStatusF();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 280) = 3;
    objc_msgSend(*(id *)(a1 + 40), "_reportError:label:", v3, CFSTR("Captive Join"));

  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 272), "metricTotalSeconds");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 288) = v2;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 280) = 4;
    objc_msgSend(*(id *)(a1 + 40), "_run");
  }
}

- (int)_runTRActivation
{
  int trActivationState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  trActivationState = self->_trActivationState;
  if (trActivationState != 4 && trActivationState != 2)
  {
    if (trActivationState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trActivationState = 1;
      self->_trActivationStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 210, 0);
      v6 = (void *)objc_msgSend(objc_alloc((Class)getTRActivationOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v6);
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke;
      v9[3] = &unk_1E482D3A0;
      v9[4] = self;
      v10 = v6;
      v7 = v6;
      objc_msgSend(v7, "setCompletionBlock:", v9);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v7);

    }
  }
  return self->_trActivationState;
}

void __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 504);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __47__SFDeviceSetupAppleTVSession__runTRActivation__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    getTRActivationOperationIsActivatedKey[0]();
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 368);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 356) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4);
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 356) = 3;
      objc_msgSend(*(id *)(a1 + 40), "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UserErrorDomain"), 301003, 0);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("TRActivation"));

    }
  }
}

- (int)_runTRAuthentication
{
  int trAuthenticationState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4 && trAuthenticationState != 2)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trAuthenticationState = 1;
      self->_trAuthenticationStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 220, 0);
      v6 = (void *)objc_msgSend(objc_alloc((Class)getTRAuthenticationOperationClass_1[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v6);
      objc_msgSend(v6, "setTargetedServices:", self->_trUnauthServices);
      if (self->_presentingViewController)
        objc_msgSend(v6, "setPresentingViewController:");
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke;
      v9[3] = &unk_1E482D3A0;
      v9[4] = self;
      v10 = v6;
      v7 = v6;
      objc_msgSend(v7, "setCompletionBlock:", v9);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v7);

    }
  }
  return self->_trAuthenticationState;
}

void __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 504);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __51__SFDeviceSetupAppleTVSession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 376) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 376) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("TRAuth"));

    }
  }
}

- (int)_runAppleIDSetup
{
  int appleIDSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);

  appleIDSetupState = self->_appleIDSetupState;
  if (appleIDSetupState != 4)
  {
    if (appleIDSetupState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_appleIDSetupState = 1;
      self->_appleIDSetupStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 224, 0);
      -[SFDeviceSetupAppleTVSession _runAppleIDSetupRequest](self, "_runAppleIDSetupRequest");
    }
  }
  return self->_appleIDSetupState;
}

- (void)_runAppleIDSetupRequest
{
  id v3;
  SFSession *sfSession;
  id v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (self->_isCLIMode && IsAppleInternalBuild())
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isCLIMode"), v3);
    }
    else
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isCLIMode"), v5);
    }
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SFDeviceSetupAppleTVSession__runAppleIDSetupRequest__block_invoke;
  v6[3] = &unk_1E482E320;
  v6[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_appleIDSetup"), MEMORY[0x1E0C9AA70], v3, v6, v5);

}

uint64_t __54__SFDeviceSetupAppleTVSession__runAppleIDSetupRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runAppleIDSetupResponse:error:", a4, a2);
}

- (void)_runAppleIDSetupResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t Int64;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  UIViewController *v16;
  id v17;
  id v18;
  id v19;
  UIViewController *presentingViewController;
  _QWORD aBlock[5];

  v6 = a3;
  v7 = a4;
  Int64 = CFDictionaryGetInt64();
  if (v6 && !v7 && Int64)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v17 = v6;
      LogPrintF();
    }
    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_alloc_init((Class)getAISSetupContextClass_0[0]());
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *MEMORY[0x1E0CFCF18]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRequiredServiceTypes:", v11);

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", *MEMORY[0x1E0CFCF38], *MEMORY[0x1E0CFCF28], 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setDesiredServiceTypes:", v12);

      objc_msgSend(v10, "setShouldBackgroundDesiredServices:", 1);
      objc_msgSend(v10, "setLocalRole:", 1);
      objc_msgSend(v10, "setRemoteRole:", 3);
      objc_msgSend(v10, "setMessageSessionTemplate:", v9);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke;
      aBlock[3] = &unk_1E4832B80;
      aBlock[4] = self;
      v13 = _Block_copy(aBlock);
      if (self->_presentingViewController)
      {
        v14 = (id)objc_msgSend(objc_alloc((Class)getAISSetupViewControllerClass[0]()), "initWithContext:", v10);
        objc_msgSend(v14, "setReportHandler:", v13);
        if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
          && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
        {
          v19 = v14;
          presentingViewController = self->_presentingViewController;
          LogPrintF();
        }
        -[UIViewController navigationController](self->_presentingViewController, "navigationController", v19, presentingViewController);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        getUINavigationControllerClass[0]();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v16 = self->_presentingViewController;

          v15 = v16;
        }
        if (v15)
          objc_msgSend(v15, "pushViewController:animated:", v14, 1);
        else
          -[UIViewController presentViewController:animated:completion:](self->_presentingViewController, "presentViewController:animated:completion:", v14, 1, 0);

      }
      else
      {
        v14 = objc_alloc_init((Class)getAISSetupControllerClass_0[0]());
        objc_msgSend(v14, "setupWithContext:completionHandler:", v10, v13);
      }

    }
    else
    {
      NSErrorWithOSStatusF();
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v18 = v10;
        LogPrintF();
      }
      self->_appleIDSetupState = 3;
      -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v10, CFSTR("AppleIDSetup"), v18);
    }

    goto LABEL_31;
  }
  self->_appleIDSetupState = 3;
  if (!v7)
  {
    NSErrorWithOSStatusF();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v9, CFSTR("AppleIDSetup"));
LABEL_31:

    goto LABEL_32;
  }
  -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v7, CFSTR("AppleIDSetup"));
LABEL_32:

}

void __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(NSObject **)(v7 + 504);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke_2;
  block[3] = &unk_1E482EBA0;
  block[4] = v7;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, block);

}

uint64_t __62__SFDeviceSetupAppleTVSession__runAppleIDSetupResponse_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  mach_absolute_time();
  UpTicksToSecondsF();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 144) = v2;
  if (*(_QWORD *)(a1 + 40))
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128) = 4;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 128) = 3;
    return objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", *(_QWORD *)(a1 + 48), CFSTR("AppleIDSetup"));
  }
}

- (int)_runCDPSetup
{
  int cdpState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationCDPSetup *v5;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  _QWORD v8[5];

  cdpState = self->_cdpState;
  if (cdpState != 4)
  {
    if (cdpState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_cdpState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 236, 0);
      -[SFDeviceOperationCDPSetup invalidate](self->_cdpSetupOperation, "invalidate");
      v5 = objc_alloc_init(SFDeviceOperationCDPSetup);
      cdpSetupOperation = self->_cdpSetupOperation;
      self->_cdpSetupOperation = v5;

      -[SFDeviceOperationCDPSetup setDispatchQueue:](self->_cdpSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationCDPSetup setSfSession:](self->_cdpSetupOperation, "setSfSession:", self->_sfSession);
      if (self->_presentingViewController)
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __43__SFDeviceSetupAppleTVSession__runCDPSetup__block_invoke;
      v8[3] = &unk_1E482DFF0;
      v8[4] = self;
      -[SFDeviceOperationCDPSetup setCompletionHandler:](self->_cdpSetupOperation, "setCompletionHandler:", v8);
      -[SFDeviceOperationCDPSetup activate](self->_cdpSetupOperation, "activate");
    }
  }
  return self->_cdpState;
}

void __43__SFDeviceSetupAppleTVSession__runCDPSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 104);
  if (v5)
  {
    v8 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 120) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("CDPSetup"));
    }
    else
    {
      objc_msgSend(v5, "metricSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = v6;
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 120) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v7);
    }
    v3 = v8;
  }

}

- (int)_runHomeKitSetup
{
  int homeKitSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  SFDeviceOperationHomeKitSetup *v7;
  SFDeviceOperationHomeKitSetup *v8;
  SFDeviceOperationHomeKitSetup *v9;
  SFDeviceOperationHomeKitSetup *v10;
  int result;
  _QWORD v12[5];

  homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState == 4 || homeKitSetupState == 2)
    return self->_homeKitSetupState;
  if (homeKitSetupState)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_homeKitSetupState;
  }
  if (-[SFDeviceSetupAppleTVSession _shouldSkipHomeKitSetup](self, "_shouldSkipHomeKitSetup"))
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession > 30
      || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_38;
    }
    goto LABEL_9;
  }
  if (self->_iCloudAccountMatches
    || -[NSSet containsObject:](self->_trUnauthServices, "containsObject:", &unk_1E4890988))
  {
    if (self->_isCLIMode && IsAppleInternalBuild())
      FPrintF();
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_homeKitSetupState = 1;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 234, 0);
    homeKitSetupOperation = self->_homeKitSetupOperation;
    v7 = homeKitSetupOperation;
    if (!homeKitSetupOperation)
    {
      v8 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      v9 = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v8;

      -[SFDeviceOperationHomeKitSetup setDispatchQueue:](self->_homeKitSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHomeKitSetup setUserInteractive:](self->_homeKitSetupOperation, "setUserInteractive:", 0);
      -[SFDeviceOperationHomeKitSetup setKeyExchangeOnly:](self->_homeKitSetupOperation, "setKeyExchangeOnly:", 1);
      v7 = self->_homeKitSetupOperation;
    }
    -[SFDeviceOperationHomeKitSetup setPauseHandler:](v7, "setPauseHandler:", 0);
    -[SFDeviceOperationHomeKitSetup setTrSession:](self->_homeKitSetupOperation, "setTrSession:", self->_trSession);
    -[SFDeviceOperationHomeKitSetup setTimeoutInSeconds:](self->_homeKitSetupOperation, "setTimeoutInSeconds:", 60.0);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__SFDeviceSetupAppleTVSession__runHomeKitSetup__block_invoke;
    v12[3] = &unk_1E482DFF0;
    v12[4] = self;
    -[SFDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetupOperation, "setCompletionHandler:", v12);
    v10 = self->_homeKitSetupOperation;
    if (homeKitSetupOperation)
      -[SFDeviceOperationHomeKitSetup resume](v10, "resume");
    else
      -[SFDeviceOperationHomeKitSetup activate](v10, "activate");
    return self->_homeKitSetupState;
  }
  if (gLogCategory_SFDeviceSetupAppleTVSession > 30
    || gLogCategory_SFDeviceSetupAppleTVSession == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_38;
  }
LABEL_9:
  LogPrintF();
LABEL_38:
  result = 2;
  self->_homeKitSetupState = 2;
  return result;
}

void __47__SFDeviceSetupAppleTVSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 160);
  if (v4)
  {
    v16 = v3;
    objc_msgSend(v4, "metricNonUserSeconds");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176) = v5;
    v6 = *(id **)(a1 + 32);
    objc_msgSend(v6[20], "homeKitHomeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setNumberOfDevicesOnAccount:", v8);

    v9 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      if (*(_BYTE *)(v9 + 154))
      {
        *(_DWORD *)(v9 + 172) = 3;
        objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v16, CFSTR("HomeKitSetup"));
LABEL_16:
        v3 = v16;
        goto LABEL_17;
      }
      objc_msgSend((id)v9, "_reportErrorMetrics:errorLabel:isFatal:");
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v15 = v16;
        LogPrintF();
      }
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 2;
    }
    else
    {
      objc_msgSend(*(id *)(v9 + 160), "homeKitSelectedRoomName");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 184);
      *(_QWORD *)(v11 + 184) = v10;

      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v15 = *(id *)(*(_QWORD *)(a1 + 32) + 176);
        LogPrintF();
      }
      v13 = *(_QWORD *)(a1 + 32);
      v14 = 4;
    }
    *(_DWORD *)(v13 + 172) = v14;
    objc_msgSend(*(id *)(a1 + 32), "_run", v15);
    goto LABEL_16;
  }
LABEL_17:

}

- (int)_runTVLatencySetup
{
  int tvLatencySetupState;

  tvLatencySetupState = self->_tvLatencySetupState;
  if (tvLatencySetupState > 3)
  {
    if (tvLatencySetupState == 4)
      return self->_tvLatencySetupState;
    if (tvLatencySetupState == 11)
    {
      -[SFDeviceSetupAppleTVSession _runTVLatencySetupEstimate](self, "_runTVLatencySetupEstimate");
      return self->_tvLatencySetupState;
    }
LABEL_12:
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_tvLatencySetupState;
  }
  if (tvLatencySetupState)
  {
    if (tvLatencySetupState == 2)
      return self->_tvLatencySetupState;
    goto LABEL_12;
  }
  if (self->_isCLIMode && IsAppleInternalBuild())
    FPrintF();
  -[SFDeviceSetupAppleTVSession _runTVLatencySetupRequest](self, "_runTVLatencySetupRequest");
  return self->_tvLatencySetupState;
}

- (void)_runTVLatencySetupRequest
{
  SFSession *sfSession;
  _QWORD v4[5];

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFDeviceSetupAppleTVSession _reportProgress:info:](self, "_reportProgress:info:", 260, 0);
  self->_tvLatencySetupState = 10;
  sfSession = self->_sfSession;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SFDeviceSetupAppleTVSession__runTVLatencySetupRequest__block_invoke;
  v4[3] = &unk_1E482E320;
  v4[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_tvlS"), 0, MEMORY[0x1E0C9AA70], v4);
}

void __56__SFDeviceSetupAppleTVSession__runTVLatencySetupRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v11)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v10 = v11;
      LogPrintF();
    }
    v9 = 2;
  }
  else
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      v10 = v8;
      LogPrintF();
    }
    v9 = 11;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 416) = v9;
  objc_msgSend(*(id *)(a1 + 32), "_run", v10);

}

- (void)_runTVLatencySetupEstimate
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  SFDeviceSetupAppleTVSession *v11;
  id v12;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_tvLatencySetupState = 12;
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)getTVLAudioLatencyEstimatorClass_0[0]()), "initWithMessageSession:", v3);
    objc_storeStrong((id *)&self->_tvLatencyEstimator, v4);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke;
    v10 = &unk_1E482E370;
    v11 = self;
    v12 = v4;
    v5 = v4;
    objc_msgSend(v5, "setProgressEventHandler:", &v7);
    objc_msgSend(v5, "activate", v7, v8, v9, v10, v11);
    objc_msgSend(v5, "estimate");

  }
  else
  {
    NSErrorWithOSStatusF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceSetupAppleTVSession _reportError:label:](self, "_reportError:label:", v6, CFSTR("TVLatencySetup"));
    self->_tvLatencySetupState = 3;

  }
}

void __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 504);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke_2;
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

uint64_t __57__SFDeviceSetupAppleTVSession__runTVLatencySetupEstimate__block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 408))
    return objc_msgSend(*(id *)(result + 40), "_runTVLatencySetupProgressEvent:info:", *(_QWORD *)(result + 56), *(_QWORD *)(result + 48));
  return result;
}

- (void)_runTVLatencySetupProgressEvent:(unint64_t)a3 info:(id)a4
{
  id v6;
  int v7;
  SFDeviceSetupAppleTVSession *v8;
  uint64_t v9;
  SFDeviceSetupAppleTVSession *v10;
  uint64_t v11;
  SFDeviceSetupAppleTVSession *v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;

  v6 = a4;
  v16 = v6;
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession != -1 || (v7 = _LogCategory_Initialize(), v6 = v16, v7))
    {
      v14 = a3;
      v15 = v6;
      LogPrintF();
      v6 = v16;
    }
  }
  switch(a3)
  {
    case 0uLL:
      v8 = self;
      v9 = 270;
      goto LABEL_8;
    case 1uLL:
      v8 = self;
      v9 = 277;
LABEL_8:
      -[SFDeviceSetupAppleTVSession _reportProgress:info:](v8, "_reportProgress:info:", v9, v16, v14, v15);
      goto LABEL_14;
    case 2uLL:
      v10 = self;
      v11 = 274;
      goto LABEL_12;
    case 3uLL:
      -[SFDeviceSetupAppleTVSession _reportProgress:info:](self, "_reportProgress:info:", 272, v16);
      v12 = self;
      v13 = 4;
      goto LABEL_13;
    case 4uLL:
      v10 = self;
      v11 = 276;
LABEL_12:
      -[SFDeviceSetupAppleTVSession _reportProgress:info:](v10, "_reportProgress:info:", v11, v16, v14, v15);
      v12 = self;
      v13 = 2;
LABEL_13:
      -[SFDeviceSetupAppleTVSession _runTVLatencySetupEnded:](v12, "_runTVLatencySetupEnded:", v13, v14, v15);
LABEL_14:
      v6 = v16;
      break;
    default:
      break;
  }

}

- (void)_runTVLatencySetupEnded:(int)a3
{
  const char *v5;
  TVLAudioLatencyEstimator *tvLatencyEstimator;
  const char *v7;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    if (a3 >= 8)
    {
      v5 = "?";
      if (a3 > 9)
        v5 = "User";
    }
    else
    {
      v5 = off_1E4832DD0[a3];
    }
    v7 = v5;
    LogPrintF();
  }
  -[TVLAudioLatencyEstimator invalidate](self->_tvLatencyEstimator, "invalidate", v7);
  tvLatencyEstimator = self->_tvLatencyEstimator;
  self->_tvLatencyEstimator = 0;

  if (self->_tvLatencySetupState == 12)
  {
    self->_tvLatencySetupState = a3;
    -[SFDeviceSetupAppleTVSession _run](self, "_run");
  }
}

- (int)_runTRCompletion
{
  int trCompletionState;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  trCompletionState = self->_trCompletionState;
  if (trCompletionState != 4 && trCompletionState != 2)
  {
    if (trCompletionState)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trCompletionState = 1;
      self->_trCompletionStartTicks = mach_absolute_time();
      v5 = (void *)objc_msgSend(objc_alloc((Class)getTRCompletionOperationClass[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v5);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke;
      v8[3] = &unk_1E482D3A0;
      v8[4] = self;
      v9 = v5;
      v6 = v5;
      objc_msgSend(v6, "setCompletionBlock:", v8);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v6);

    }
  }
  return self->_trCompletionState;
}

void __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 504);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __47__SFDeviceSetupAppleTVSession__runTRCompletion__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 432) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 392);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 420) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v4, v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 420) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:label:", v3, CFSTR("TRCompletion"));

    }
  }
}

- (int)_runFinish:(BOOL)a3
{
  int result;
  double v5;
  void (**progressHandler)(id, uint64_t, _QWORD);

  result = self->_finishState;
  if (!result)
  {
    if (!a3)
    {
      if (self->_isCLIMode && IsAppleInternalBuild())
        FPrintF();
      if (self->_userWaitSeconds == 0.0)
      {
        mach_absolute_time();
        UpTicksToSecondsF();
        self->_userWaitSeconds = v5;
      }
      CFPrefs_SetValue();
      notify_post("com.apple.Sharing.prefsChanged");
      if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
        && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 96, 0);
    }
    self->_finishState = 4;
    if (!self->_metricsReported)
    {
      self->_metricsReported = 1;
      -[SFDeviceSetupAppleTVSession _reportMainMetrics:errorLabel:userWaitSeconds:](self, "_reportMainMetrics:errorLabel:userWaitSeconds:", 0, CFSTR("NoErr"), self->_userWaitSeconds);
    }
    -[SFDeviceSetupAppleTVSession _cleanup](self, "_cleanup");
    return self->_finishState;
  }
  return result;
}

- (void)_homeKitUpdateiCloudSwitchState:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD block[4];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  dispatch_async(dispatchQueue, block);
}

void __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  _QWORD v5[4];
  id v6;
  char v7;

  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = (void *)objc_msgSend(objc_alloc((Class)getHMHomeManagerClass_1[0]()), "initWithOptions:", 0);
  v3 = *(unsigned __int8 *)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke_2;
  v5[3] = &unk_1E4832BA8;
  v7 = v3;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v4, "updateiCloudSwitchState:completionHandler:", v3, v5);

}

void __63__SFDeviceSetupAppleTVSession__homeKitUpdateiCloudSwitchState___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  int v6;
  void *v7;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 90)
    {
      v7 = v3;
      if (gLogCategory_SFDeviceSetupAppleTVSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        objc_msgSend(*(id *)(a1 + 32), "status");
LABEL_7:
        LogPrintF();

        return;
      }
    }
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 30)
  {
    v7 = 0;
    if (gLogCategory_SFDeviceSetupAppleTVSession != -1)
      goto LABEL_7;
    v6 = _LogCategory_Initialize();
    v4 = 0;
    if (v6)
      goto LABEL_7;
  }

}

- (id)_videoSubscriberAccountData
{
  void *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  v17 = 0;
  objc_msgSend((Class)getVSAccountSerializationCenterClass[0](), "defaultSerializationCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__SFDeviceSetupAppleTVSession__videoSubscriberAccountData__block_invoke;
    v9[3] = &unk_1E4832BF0;
    v11 = &v12;
    v4 = v3;
    v10 = v4;
    v5 = (id)objc_msgSend(v2, "exportDataWithCompletionHandler:", v9);
    v6 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v4, v6)
      && gLogCategory_SFDeviceSetupAppleTVSession <= 90
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 90
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __58__SFDeviceSetupAppleTVSession__videoSubscriberAccountData__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if (v7)
  {
    if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
      && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  else if (gLogCategory_SFDeviceSetupAppleTVSession <= 60
         && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (BOOL)_verifyiCloudMatch:(unint64_t)a3 error:(id *)a4
{
  id v7;
  const char *v8;
  void *v9;
  id v10;
  BOOL v11;
  id v12;
  BOOL v13;

  SFMyAltDSID();
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v8 = (const char *)objc_msgSend(v7, "UTF8String");

  if (v8
    && (-[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("AltDSID"), 16), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = objc_retainAutorelease(v9);
    objc_msgSend(v10, "bytes");
    strlen(v8);
    if (SipHash() == a3)
    {
      v11 = 0;
      v12 = 0;
      goto LABEL_5;
    }
    NSErrorWithOSStatusF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSErrorWithOSStatusF();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  v11 = v12 != 0;
  if (a4 && v12)
  {
    v12 = objc_retainAutorelease(v12);
    *a4 = v12;
    v11 = 1;
  }
LABEL_5:
  v13 = !v11;

  return v13;
}

- (void)_reportMainMetrics:(id)a3 errorLabel:(id)a4 userWaitSeconds:(double)a5
{
  id v8;
  const __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  const __CFString *appleTVModel;
  const __CFString *appleTVBuild;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  void *v26;
  _BOOL8 v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  __CFString *v38;
  __CFString *v39;
  _QWORD v40[12];
  _QWORD v41[14];

  v41[12] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (const __CFString *)a4;
  v10 = objc_msgSend(v8, "code");
  objc_msgSend(v8, "domain");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "underlyingErrors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v13, "code");

  objc_msgSend(v8, "underlyingErrors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "domain");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  v18 = CFSTR("NoUnderlyingError");
  if (v16)
    v18 = (__CFString *)v16;
  v39 = v18;

  -[NSUUID UUIDString](self->_sessionID, "UUIDString");
  v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("AppleTVModel");
  v40[1] = CFSTR("AppleTVSetupDeviceBuild");
  appleTVBuild = (const __CFString *)self->_appleTVBuild;
  appleTVModel = (const __CFString *)self->_appleTVModel;
  if (!appleTVModel)
    appleTVModel = CFSTR("Unknown");
  if (!appleTVBuild)
    appleTVBuild = CFSTR("Unknown");
  v41[0] = appleTVModel;
  v41[1] = appleTVBuild;
  v40[2] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = (void *)v22;
  if (v11)
    v24 = v11;
  else
    v24 = CFSTR("Unknown");
  v41[2] = v22;
  v41[3] = v24;
  v40[3] = CFSTR("errorDomain");
  v40[4] = CFSTR("errorLabel");
  v38 = (__CFString *)v9;
  if (v9)
    v25 = v9;
  else
    v25 = CFSTR("Unknown");
  v41[4] = v25;
  v40[5] = CFSTR("isPreFlightLabel");
  v26 = (void *)MEMORY[0x1E0CB37E8];
  if (v8)
    v27 = -[SFDeviceSetupAppleTVSession _isPreflightError:](self, "_isPreflightError:", v8);
  else
    v27 = 0;
  objc_msgSend(v26, "numberWithInt:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v41[5] = v28;
  v40[6] = CFSTR("numberOfAppleTVsOnAccount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfAppleTVsOnAccount);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v41[6] = v29;
  v40[7] = CFSTR("numberOfHomePodsOnAccount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfAppleTVsOnAccount);
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v19)
    v32 = v19;
  else
    v32 = CFSTR("Unknown");
  v41[7] = v30;
  v41[8] = v32;
  v40[8] = CFSTR("sessionIdentifier");
  v40[9] = CFSTR("underlyingErrorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v37);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v41[9] = v33;
  v41[10] = v39;
  v40[10] = CFSTR("underlyingErrorDomain");
  v40[11] = CFSTR("userWaitTimeMs");
  v34 = a5 * 1000.0;
  if (a5 == 0.0)
    v34 = 0.0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v41[11] = v35;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 12);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  SFMetricsLog(CFSTR("com.apple.tvos.tvsetup.main"), v36);
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_reportErrorMetrics:(id)a3 errorLabel:(id)a4 isFatal:(BOOL)a5
{
  id v7;
  const __CFString *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  const __CFString *appleTVModel;
  const __CFString *appleTVBuild;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  uint64_t v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL4 v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  __CFString *v51;
  __CFString *v52;
  __CFString *v53;
  _QWORD v54[14];
  _QWORD v55[16];

  v45 = a5;
  v55[14] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (const __CFString *)a4;
  v9 = objc_msgSend(v7, "code");
  objc_msgSend(v7, "domain");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "underlyingErrors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_msgSend(v12, "code");
  objc_msgSend(v12, "domain");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (__CFString *)v13;
  else
    v15 = CFSTR("NoUnderlyingError");
  v53 = v15;

  v48 = v12;
  objc_msgSend(v12, "underlyingErrors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = objc_msgSend(v17, "code");
  objc_msgSend(v17, "domain");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (__CFString *)v18;
  else
    v20 = CFSTR("NoUnderlyingError");
  v52 = v20;

  objc_msgSend(v17, "underlyingErrors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = objc_msgSend(v22, "code");
  v47 = v22;
  objc_msgSend(v22, "domain");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = (void *)v23;
  if (v23)
    v25 = (__CFString *)v23;
  else
    v25 = CFSTR("NoUnderlyingError");
  v51 = v25;

  -[NSUUID UUIDString](self->_sessionID, "UUIDString");
  v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v54[0] = CFSTR("AppleTVModel");
  v54[1] = CFSTR("AppleTVSetupDeviceBuild");
  appleTVBuild = (const __CFString *)self->_appleTVBuild;
  appleTVModel = (const __CFString *)self->_appleTVModel;
  if (!appleTVModel)
    appleTVModel = CFSTR("Unknown");
  if (!appleTVBuild)
    appleTVBuild = CFSTR("Unknown");
  v55[0] = appleTVModel;
  v55[1] = appleTVBuild;
  v54[2] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = (void *)v29;
  v49 = (void *)v10;
  v50 = (__CFString *)v8;
  if (v10)
    v31 = (const __CFString *)v10;
  else
    v31 = CFSTR("Unknown");
  v55[2] = v29;
  v55[3] = v31;
  v54[3] = CFSTR("errorDomain");
  v54[4] = CFSTR("errorLabel");
  if (v8)
    v32 = v8;
  else
    v32 = CFSTR("Unknown");
  v55[4] = v32;
  v54[5] = CFSTR("isFatalError");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v45);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v33;
  v54[6] = CFSTR("isPreFlight");
  v34 = (void *)MEMORY[0x1E0CB37E8];
  if (v7)
    v35 = -[SFDeviceSetupAppleTVSession _isPreflightError:](self, "_isPreflightError:", v7);
  else
    v35 = 0;
  objc_msgSend(v34, "numberWithInt:", v35);
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v36;
  if (v26)
    v38 = v26;
  else
    v38 = CFSTR("Unknown");
  v55[6] = v36;
  v55[7] = v38;
  v54[7] = CFSTR("sessionIdentifier");
  v54[8] = CFSTR("underlyingErrorCode1");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v46);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v55[8] = v39;
  v55[9] = v53;
  v54[9] = CFSTR("underlyingErrorDomain1");
  v54[10] = CFSTR("underlyingErrorCode2");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v44);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[10] = v40;
  v55[11] = v52;
  v54[11] = CFSTR("underlyingErrorDomain2");
  v54[12] = CFSTR("underlyingErrorCode3");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v54[13] = CFSTR("underlyingErrorDomain3");
  v55[12] = v41;
  v55[13] = v51;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 14);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  SFMetricsLog(CFSTR("com.apple.tvos.tvsetup.errors"), v42);
  if (gLogCategory_SFDeviceSetupAppleTVSession <= 30
    && (gLogCategory_SFDeviceSetupAppleTVSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (BOOL)_isPreflightError:(id)a3
{
  uint64_t v3;

  v3 = objc_msgSend(a3, "code");
  return ((unint64_t)(v3 - 301000) < 8) & (0x91u >> (v3 + 56));
}

- (void)_setNumberOfDevicesOnAccount:(id)a3
{
  id v4;
  int *p_numberOfAppleTVsOnAccount;
  int *p_numberOfHomePodsOnAccount;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  int *v18;
  void *v19;
  int v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  *(_QWORD *)&self->_numberOfAppleTVsOnAccount = 0;
  obj = v4;
  if (v4)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v23)
    {
      p_numberOfAppleTVsOnAccount = &self->_numberOfAppleTVsOnAccount;
      p_numberOfHomePodsOnAccount = &self->_numberOfHomePodsOnAccount;
      v22 = *(_QWORD *)v30;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v30 != v22)
            objc_enumerationMutation(obj);
          v24 = v7;
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v7);
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v28 = 0u;
          objc_msgSend(v8, "accessories", obj);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v26;
            do
            {
              for (i = 0; i != v11; ++i)
              {
                if (*(_QWORD *)v26 != v12)
                  objc_enumerationMutation(v9);
                objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "category");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "categoryType");
                v15 = (void *)objc_claimAutoreleasedReturnValue();

                getHMAccessoryCategoryTypeHomePod_1[0]();
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v15, "isEqualToString:", v16);

                v18 = p_numberOfHomePodsOnAccount;
                if ((v17 & 1) != 0
                  || (getHMAccessoryCategoryTypeAppleTV_0[0](),
                      v19 = (void *)objc_claimAutoreleasedReturnValue(),
                      v20 = objc_msgSend(v15, "isEqualToString:", v19),
                      v19,
                      v18 = p_numberOfAppleTVsOnAccount,
                      v20))
                {
                  ++*v18;
                }

              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
            }
            while (v11);
          }

          v7 = v24 + 1;
        }
        while (v24 + 1 != v23);
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v23);
    }
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

- (int)bonjourTestState
{
  return self->_bonjourTestState;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (unint64_t)peerFeatureFlags
{
  return self->_peerFeatureFlags;
}

- (void)setPeerFeatureFlags:(unint64_t)a3
{
  self->_peerFeatureFlags = a3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)promptForHomeiCloudHandler
{
  return self->_promptForHomeiCloudHandler;
}

- (void)setPromptForHomeiCloudHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (id)promptForCaptiveNetworkHandler
{
  return self->_promptForCaptiveNetworkHandler;
}

- (void)setPromptForCaptiveNetworkHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForCaptiveNetworkHandler, 0);
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_promptForHomeiCloudHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_appleTVModelNumber, 0);
  objc_storeStrong((id *)&self->_appleTVModel, 0);
  objc_storeStrong((id *)&self->_appleTVBuild, 0);
  objc_storeStrong((id *)&self->_tvLatencyEstimator, 0);
  objc_storeStrong((id *)&self->_wifiSetupOperation, 0);
  objc_storeStrong((id *)&self->_captiveJoin, 0);
  objc_storeStrong((id *)&self->_trUnauthServices, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_homeKitSelectedRoomName, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_iTunesUserID, 0);
}

@end
