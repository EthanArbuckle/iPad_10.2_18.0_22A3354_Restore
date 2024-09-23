@implementation SFDeviceRepairSession

- (SFDeviceRepairSession)init
{
  SFDeviceRepairSession *v2;
  SFDeviceRepairSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceRepairSession;
  v2 = -[SFDeviceRepairSession init](&v7, sel_init);
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
  SFDeviceRepairSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceRepairSession *)FatalErrorF();
    -[SFDeviceRepairSession _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceRepairSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceRepairSession;
    -[SFDeviceRepairSession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  SFDeviceOperationWiFiSetup *wifiSetupOperation;
  SFDeviceOperationCNJSetup *captiveJoin;
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  AISRepairController *appleIDRepairController;
  SFSession *sfSession;
  void (**progressHandler)(id, uint64_t, _QWORD);

  -[SFDeviceOperationWiFiSetup invalidate](self->_wifiSetupOperation, "invalidate");
  wifiSetupOperation = self->_wifiSetupOperation;
  self->_wifiSetupOperation = 0;

  -[SFDeviceOperationCNJSetup invalidate](self->_captiveJoin, "invalidate");
  captiveJoin = self->_captiveJoin;
  self->_captiveJoin = 0;

  -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  -[SFDeviceOperationCDPSetup invalidate](self->_cdpSetupOperation, "invalidate");
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  appleIDRepairController = self->_appleIDRepairController;
  self->_appleIDRepairController = 0;

  -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", 0);
  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  }
  self->_progressHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__SFDeviceRepairSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __33__SFDeviceRepairSession_activate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;

  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    v5 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 304);
    v6 = &unk_1A2AF8443;
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = mach_absolute_time();
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "problemFlags");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 112) = CFPrefs_GetInt64() != 0;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[44];
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(v2[44], 10, 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_run", v5, v6);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceRepairSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceRepairSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)_reportError:(id)a3 isPreflight:(BOOL)a4
{
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v8;
  void (**progressHandler)(id, uint64_t, void *);
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  void *v15;
  SFRepairResultMetrics *v16;
  void *v17;
  id v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[2];

  v6 = a4;
  v22[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (gLogCategory_SFDeviceRepairSession <= 90
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    v18 = v8;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v21 = CFSTR("eo");
    v10 = v8;
    if (!v8)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2F90];
      v19 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v13 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v13;
      v14 = CFSTR("?");
      if (v13)
        v14 = (const __CFString *)v13;
      v20 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1, v18);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6700, v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 30, v15);

    if (!v8)
    {

    }
  }
  v16 = objc_alloc_init(SFRepairResultMetrics);
  -[SFRepairResultMetrics setError:](v16, "setError:", v8);
  -[SFRepairResultMetrics setIsPreflightError:](v16, "setIsPreflightError:", v6);
  -[SFRepairResultMetrics setProblemFlags:](v16, "setProblemFlags:", self->_problemFlags);
  -[SFRepairResultMetrics setPeerProblemFlags:](v16, "setPeerProblemFlags:", self->_peerProblemFlags);
  -[SFDevice model](self->_peerDevice, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFRepairResultMetrics setPeerModel:](v16, "setPeerModel:", v17);

  -[SFRepairResultMetrics setPeerBuild:](v16, "setPeerBuild:", self->_peerOSBuild);
  -[SFRepairResultMetrics setForceWiFi:](v16, "setForceWiFi:", self->_repairFlags & 1);
  mach_absolute_time();
  -[SFRepairResultMetrics setTotalMs:](v16, "setTotalMs:", (double)(unint64_t)UpTicksToMilliseconds());
  -[SFRepairResultMetrics setTriggerMs:](v16, "setTriggerMs:", (double)self->_triggerMs);
  -[SFRepairResultMetrics setHasView:](v16, "setHasView:", self->_presentingViewController != 0);
  -[SFDeviceRepairSession _reportRepairResultMetrics:](self, "_reportRepairResultMetrics:", v16);

}

- (void)_reportRepairResultMetrics:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  if (gLogCategory_SFDeviceRepairSession <= 40
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v4, "dict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.RepairResult"), v3);

}

- (BOOL)_remotePeerNeedsAppleIDRepair
{
  int v3;
  unsigned int v4;

  if (_os_feature_enabled_impl())
    v3 = BYTE1(self->_peerFeatureFlags) >> 7;
  else
    LOBYTE(v3) = 0;
  if ((self->_problemFlags & 0x20006) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = (self->_repairFlags >> 3) & 1;
    if ((self->_repairFlags & 6) != 0)
      LOBYTE(v4) = 1;
  }
  return v3 & v4;
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

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    return;
  v3 = -[SFDeviceRepairSession _runPreflightWiFiEarly](self, "_runPreflightWiFiEarly");
  if (v3 != 4 && v3 != 2)
    return;
  v4 = -[SFDeviceRepairSession _runSFSessionStart](self, "_runSFSessionStart");
  if (v4 != 4 && v4 != 2)
    return;
  if (!self->_sessionSecured)
  {
    v10 = -[SFDeviceRepairSession _runPairVerify](self, "_runPairVerify");
    if (v10 != 4 && v10 != 2)
      return;
  }
  v5 = -[SFDeviceRepairSession _runGetProblems](self, "_runGetProblems");
  if (v5 != 4 && v5 != 2)
    return;
  if ((self->_problemFlags & 0x10) != 0 || (self->_repairFlags & 1) != 0)
  {
    v6 = -[SFDeviceRepairSession _runPreflightWiFiFull](self, "_runPreflightWiFiFull");
    if (v6 != 4 && v6 != 2)
      return;
    v7 = -[SFDeviceRepairSession _runWiFiSetup](self, "_runWiFiSetup");
    if (v7 != 4 && v7 != 2)
      return;
    v8 = -[SFDeviceRepairSession _runCaptiveJoin](self, "_runCaptiveJoin");
    if (v8 != 4 && v8 != 2)
      return;
  }
  if (-[SFDeviceRepairSession _remotePeerNeedsAppleIDRepair](self, "_remotePeerNeedsAppleIDRepair"))
  {
    v9 = -[SFDeviceRepairSession _runAppleIDSetupRepair](self, "_runAppleIDSetupRepair");
    if (v9 != 2 && v9 != 4)
      return;
    goto LABEL_35;
  }
  if ((self->_problemFlags & 6) == 0 && (self->_repairFlags & 6) == 0
    || ((v11 = -[SFDeviceRepairSession _runTRSessionStart](self, "_runTRSessionStart"), v11 == 4) || v11 == 2)
    && ((v12 = -[SFDeviceRepairSession _runTRAuthentication](self, "_runTRAuthentication"), v12 == 4) || v12 == 2))
  {
    if (!self->_cdpEnabled
      || (self->_problemFlags & 0x20000) == 0 && (self->_repairFlags & 8) == 0
      || (v13 = -[SFDeviceRepairSession _runCDPSetup](self, "_runCDPSetup"), v13 == 4)
      || v13 == 2)
    {
LABEL_35:
      if ((self->_problemFlags & 8) == 0 && (self->_repairFlags & 0x10) == 0
        || (v14 = -[SFDeviceRepairSession _runHomeKitSetup](self, "_runHomeKitSetup"), v14 == 4)
        || v14 == 2)
      {
        if ((self->_problemFlags & 0x100) == 0)
          -[SFDeviceRepairSession _runFinish](self, "_runFinish");
      }
    }
  }
}

- (int)_runPreflightWiFiEarly
{
  int preflightWiFiEarlyState;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  preflightWiFiEarlyState = self->_preflightWiFiEarlyState;
  if (!preflightWiFiEarlyState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = (void *)WiFiCopyCurrentNetworkInfoEx();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preflightWiFiEarlyState = 4;

      return self->_preflightWiFiEarlyState;
    }
    else
    {
      NSErrorWithOSStatusF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      self->_preflightWiFiEarlyState = 3;
      -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v7, 1);
      preflightWiFiEarlyState = self->_preflightWiFiEarlyState;

    }
  }
  return preflightWiFiEarlyState;
}

- (int)_runPreflightWiFiFull
{
  int preflightWiFiState;
  void *v5;
  uint64_t Int64Ranged;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  int v13;
  _BOOL4 wifiIsCaptive;
  unint64_t peerFeatureFlags;
  int v16;
  BOOL v17;
  int v18;
  void *v19;
  uint64_t v21;
  _BOOL8 v22;

  preflightWiFiState = self->_preflightWiFiState;
  if (preflightWiFiState == 4 || preflightWiFiState == 2)
    return self->_preflightWiFiState;
  if (preflightWiFiState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_preflightWiFiState;
  }
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = (void *)WiFiCopyCurrentNetworkInfoEx();
  Int64Ranged = CFDictionaryGetInt64Ranged();
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    NSErrorWithOSStatusF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_preflightWiFiState = 3;
    -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v8, 1);
    v13 = self->_preflightWiFiState;
    goto LABEL_22;
  }
  if (!CFDictionaryGetInt64())
    goto LABEL_26;
  if ((_DWORD)Int64Ranged != 1)
  {
    v21 = Int64Ranged;
    NSPrintF();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_20;
  }
  -[SFDevice bleDevice](self->_peerDevice, "bleDevice", v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "advertisementData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "length"))
  {

    goto LABEL_26;
  }
  v11 = -[SFDevice osVersion](self->_peerDevice, "osVersion");

  if (v11 > 0xA
    || (v21 = -[SFDevice osVersion](self->_peerDevice, "osVersion"),
        NSPrintF(),
        (v8 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_26:
    if (CFPrefs_GetInt64() && objc_msgSend(v7, "isEqual:", CFSTR("AppleWiFi"), v21))
      goto LABEL_48;
    wifiIsCaptive = CFDictionaryGetInt64() != 0;
    self->_wifiIsCaptive = wifiIsCaptive;
    peerFeatureFlags = self->_peerFeatureFlags;
    if (gLogCategory_SFDeviceRepairSession <= 30)
    {
      if (gLogCategory_SFDeviceRepairSession != -1
        || (v16 = _LogCategory_Initialize(), wifiIsCaptive = self->_wifiIsCaptive, v16))
      {
        v21 = wifiIsCaptive;
        v22 = (peerFeatureFlags & 0x2000) == 0;
        LogPrintF();
        wifiIsCaptive = self->_wifiIsCaptive;
      }
    }
    if (wifiIsCaptive && (peerFeatureFlags & 0x2000) == 0
      || ((peerFeatureFlags & 0x2000) != 0 ? (v17 = (_DWORD)Int64Ranged == 5) : (v17 = 0),
          v17 ? (v18 = 0) : (v18 = 1),
          Int64Ranged >= 2 && v18))
    {
LABEL_48:
      NSErrorWithOSStatusF();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      self->_preflightWiFiState = 3;
      -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v19, 1);
      v13 = self->_preflightWiFiState;

      goto LABEL_49;
    }
    if (-[NSString isEqualToString:](self->_peerSSID, "isEqualToString:", v7, v21, v22)
      && ((self->_problemFlags & 0x200000) != 0 || (self->_repairFlags & 0x20) != 0))
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_wifiSetupState = 2;
    }
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_preflightWiFiState = 4;

    return self->_preflightWiFiState;
  }
LABEL_20:
  NSErrorWithOSStatusF();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  self->_preflightWiFiState = 3;
  -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v12, 1, v8);
  v13 = self->_preflightWiFiState;

LABEL_22:
LABEL_49:

  return v13;
}

- (int)_runSFSessionStart
{
  int sfSessionState;
  SFSession *v5;
  SFSession *sfSession;
  uint64_t v7;
  SFSession *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_sfSessionState = 1;
      -[SFSession invalidate](self->_sfSession, "invalidate");
      v5 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v5;

      -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("Repair"));
      -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
      -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.Repair"));
      -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 4129);
      -[SFSession setTouchRemoteEnabled:](self->_sfSession, "setTouchRemoteEnabled:", 1);
      v7 = MEMORY[0x1E0C809B0];
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke;
      v14[3] = &unk_1E482DFF0;
      v14[4] = self;
      -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v14);
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_2;
      v13[3] = &unk_1E482DF78;
      v13[4] = self;
      -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v13);
      v12[0] = v7;
      v12[1] = 3221225472;
      v12[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_3;
      v12[3] = &unk_1E482DF78;
      v12[4] = self;
      -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", v12);
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_4;
      v11[3] = &unk_1E482DF78;
      v11[4] = self;
      -[SFSession setSessionStartedHandler:](self->_sfSession, "setSessionStartedHandler:", v11);
      v8 = self->_sfSession;
      v10[0] = v7;
      v10[1] = 3221225472;
      v10[2] = __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_5;
      v10[3] = &unk_1E482DFF0;
      v10[4] = self;
      -[SFSession activateWithCompletion:](v8, "activateWithCompletion:", v10);
    }
  }
  return self->_sfSessionState;
}

_BYTE *__43__SFDeviceRepairSession__runSFSessionStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _BYTE *result;

  result = *(_BYTE **)(a1 + 32);
  if (!result[9])
    return (_BYTE *)objc_msgSend(result, "_reportError:isPreflight:", a2, 1);
  return result;
}

void __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[9])
  {
    NSErrorWithOSStatusF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_reportError:isPreflight:", v2, 0);

  }
}

void __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  _BYTE *v1;
  id v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[9])
  {
    NSErrorWithOSStatusF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_reportError:isPreflight:", v2, 0);

  }
}

uint64_t __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_4(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9) && *(_DWORD *)(v1 + 40) == 1)
  {
    *(_DWORD *)(v1 + 40) = 4;
    return objc_msgSend(*(id *)(result + 32), "_run");
  }
  return result;
}

uint64_t __43__SFDeviceRepairSession__runSFSessionStart__block_invoke_5(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(result + 32);
    if (!*(_BYTE *)(v2 + 9))
    {
      *(_DWORD *)(v2 + 40) = 3;
      return objc_msgSend(*(id *)(result + 32), "_reportError:isPreflight:", a2, 0);
    }
  }
  return result;
}

- (int)_runPairVerify
{
  int pairVerifyState;
  unint64_t pairVerifyType;
  const char *v6;
  const char *v7;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  const char *v11;
  _QWORD v12[6];

  pairVerifyState = self->_pairVerifyState;
  if ((pairVerifyState | 2) == 2)
  {
    -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", -[SFSession sessionFlags](self->_sfSession, "sessionFlags") & 0xFFFFFBFFLL);
    self->_pairVerifyState = 0;
    pairVerifyType = self->_pairVerifyType;
    if (pairVerifyType != 1)
    {
LABEL_10:
      v6 = "?";
      if (pairVerifyType == 1)
        v6 = "CUPairing";
      if (pairVerifyType)
        v7 = v6;
      else
        v7 = "HomeKit";
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v11 = v7;
        LogPrintF();
      }
      self->_pairVerifyState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 60, 0);
      sfSession = self->_sfSession;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __39__SFDeviceRepairSession__runPairVerify__block_invoke;
      v12[3] = &unk_1E4832A88;
      v12[4] = self;
      v12[5] = v7;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v12, v11);
      return self->_pairVerifyState;
    }
    -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", -[SFSession sessionFlags](self->_sfSession, "sessionFlags") | 0x400);
    pairVerifyState = self->_pairVerifyState;
  }
  if (pairVerifyState == 4 || pairVerifyState == 2)
    return self->_pairVerifyState;
  if (!pairVerifyState)
  {
    pairVerifyType = self->_pairVerifyType;
    goto LABEL_10;
  }
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_pairVerifyState;
}

void __39__SFDeviceRepairSession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  _QWORD *v11;
  uint64_t v12;
  const char *v13;
  id v14;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9))
  {
    v14 = v3;
    if (v3)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v13 = *(const char **)(a1 + 40);
        LogPrintF();
      }
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(v4 + 80);
      if (v5 == 1)
      {
        *(_DWORD *)(v4 + 72) = 3;
        v6 = *(void **)(a1 + 32);
        NSErrorWithOSStatusF();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_reportError:isPreflight:", v7, 0, v14);

LABEL_27:
        v3 = v14;
        goto LABEL_28;
      }
      *(_QWORD *)(v4 + 80) = v5 + 1;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
        v9 = "?";
        if (v8 == 1)
          v9 = "CUPairing";
        if (v8)
          v10 = v9;
        else
          v10 = "HomeKit";
        v13 = v10;
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 2;
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v13 = *(const char **)(a1 + 40);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = 4;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
      v11 = *(_QWORD **)(a1 + 32);
      v12 = v11[44];
      if (!v12)
        goto LABEL_26;
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v12 + 16))(v11[44], 70, 0);
    }
    v11 = *(_QWORD **)(a1 + 32);
LABEL_26:
    objc_msgSend(v11, "_run", v13);
    goto LABEL_27;
  }
LABEL_28:

}

- (int)_runGetProblems
{
  int getProblemsState;
  uint64_t v5;
  void *v6;
  void *v7;
  SFSession *sfSession;
  _QWORD v10[5];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  getProblemsState = self->_getProblemsState;
  if (getProblemsState != 4 && getProblemsState != 2)
  {
    if (getProblemsState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_getProblemsState = 1;
      if (_os_feature_enabled_impl())
        v5 = 0x8000;
      else
        v5 = 0;
      v11 = CFSTR("ff");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      sfSession = self->_sfSession;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __40__SFDeviceRepairSession__runGetProblems__block_invoke;
      v10[3] = &unk_1E482E320;
      v10[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_getprob"), 0, v7, v10);

    }
  }
  return self->_getProblemsState;
}

void __40__SFDeviceRepairSession__runGetProblems__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v7 = a2;
  v24 = a3;
  v8 = a4;
  if (v7
    || CFDictionaryGetInt64Ranged()
    && (NSErrorWithOSStatusF(), (v7 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:isPreflight:", v7, 0);

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = CFDictionaryGetInt64();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) = CFDictionaryGetInt64();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 328);
    *(_QWORD *)(v10 + 328) = v9;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 56);
    *(_QWORD *)(v13 + 56) = v12;

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 104);
    *(_QWORD *)(v16 + 104) = v15;

    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      v18 = *(_QWORD **)(a1 + 32);
      v22 = v18[7];
      v23 = v18[13];
      v20 = &unk_1A2AF8490;
      v21 = v18[41];
      v19 = v18[12];
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run", v19, v20, v21, v22, v23, v24);
  }

}

- (int)_runWiFiSetup
{
  int wifiSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationWiFiSetup *v6;
  SFDeviceOperationWiFiSetup *wifiSetupOperation;
  _QWORD v9[5];

  if (SFDeviceIsVirtualMachine())
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_wifiSetupState = 2;
  }
  else
  {
    wifiSetupState = self->_wifiSetupState;
    if (wifiSetupState != 4 && wifiSetupState != 2)
    {
      if (wifiSetupState)
      {
        if (gLogCategory_SFDeviceRepairSession <= 30
          && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      else
      {
        if (gLogCategory_SFDeviceRepairSession <= 30
          && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_wifiSetupState = 1;
        progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
        if (progressHandler)
          progressHandler[2](progressHandler, 200, 0);
        -[SFDeviceOperationWiFiSetup invalidate](self->_wifiSetupOperation, "invalidate");
        v6 = objc_alloc_init(SFDeviceOperationWiFiSetup);
        wifiSetupOperation = self->_wifiSetupOperation;
        self->_wifiSetupOperation = v6;

        -[SFDeviceOperationWiFiSetup setDispatchQueue:](self->_wifiSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
        -[SFDeviceOperationWiFiSetup setRepairFlags:](self->_wifiSetupOperation, "setRepairFlags:", self->_repairFlags);
        -[SFDeviceOperationWiFiSetup setSfSession:](self->_wifiSetupOperation, "setSfSession:", self->_sfSession);
        -[SFDeviceOperationWiFiSetup setSkipLocalReachability:](self->_wifiSetupOperation, "setSkipLocalReachability:", self->_wifiIsCaptive);
        -[SFDeviceOperationWiFiSetup setSkipReachability:](self->_wifiSetupOperation, "setSkipReachability:", self->_wifiIsCaptive);
        v9[0] = MEMORY[0x1E0C809B0];
        v9[1] = 3221225472;
        v9[2] = __38__SFDeviceRepairSession__runWiFiSetup__block_invoke;
        v9[3] = &unk_1E482DFF0;
        v9[4] = self;
        -[SFDeviceOperationWiFiSetup setCompletionHandler:](self->_wifiSetupOperation, "setCompletionHandler:", v9);
        -[SFDeviceOperationWiFiSetup activate](self->_wifiSetupOperation, "activate");
      }
    }
  }
  return self->_wifiSetupState;
}

void __38__SFDeviceRepairSession__runWiFiSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v5 + 9))
  {
    v8 = v3;
    if (v3)
    {
      *(_DWORD *)(v5 + 192) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:isPreflight:", v3, 0);
    }
    else
    {
      objc_msgSend(*(id *)(v5 + 184), "metricTotalSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200) = v6;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 192) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v7);
    }
    v4 = v8;
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
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else if (self->_wifiIsCaptive)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
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
      -[SFDeviceOperationCNJSetup setPresentingViewController:](self->_captiveJoin, "setPresentingViewController:", self->_presentingViewController);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke;
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

void __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke(uint64_t a1, void *a2)
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
  v5 = *(NSObject **)(v4 + 320);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __40__SFDeviceRepairSession__runCaptiveJoin__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id v3;

  if (*(_QWORD *)(a1 + 32))
  {
    if (gLogCategory_SFDeviceRepairSession <= 60
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    NSErrorWithOSStatusF();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 224) = 3;
    objc_msgSend(*(id *)(a1 + 40), "_reportError:isPreflight:", v3, 0);

  }
  else
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 216), "metricTotalSeconds");
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 232) = v2;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 224) = 4;
    objc_msgSend(*(id *)(a1 + 40), "_run");
  }
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
  void *v12;

  trSessionState = self->_trSessionState;
  if (trSessionState == 4 || trSessionState == 2)
    return self->_trSessionState;
  if (!trSessionState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_trSessionState = 1;
    v5 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_1[0]());
    trOperationQueue = self->_trOperationQueue;
    self->_trOperationQueue = v5;

    if (self->_trOperationQueue)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      trOperations = self->_trOperations;
      self->_trOperations = v7;

      -[SFSession trSession](self->_sfSession, "trSession");
      v9 = (TRSession *)objc_claimAutoreleasedReturnValue();
      trSession = self->_trSession;
      self->_trSession = v9;

      if (self->_trSession)
      {
        if (gLogCategory_SFDeviceRepairSession <= 30
          && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        self->_trSessionState = 4;
        return self->_trSessionState;
      }
      if (gLogCategory_SFDeviceRepairSession > 90
        || gLogCategory_SFDeviceRepairSession == -1 && !_LogCategory_Initialize())
      {
LABEL_32:
        self->_trSessionState = 3;
        NSErrorWithOSStatusF();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v12, 0);

        return self->_trSessionState;
      }
    }
    else if (gLogCategory_SFDeviceRepairSession > 90
           || gLogCategory_SFDeviceRepairSession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_32;
    }
    LogPrintF();
    goto LABEL_32;
  }
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runTRAuthentication
{
  int trAuthenticationState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v6;
  uint64_t Int64;
  _BOOL4 v8;
  uint64_t v9;
  id v10;
  void *v11;
  unint64_t problemFlags;
  id v13;
  _QWORD v15[5];
  id v16;
  int v17;

  trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4 && trAuthenticationState != 2)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trAuthenticationState = 1;
      self->_trAuthenticationStartTicks = mach_absolute_time();
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 220, 0);
      v6 = (void *)objc_msgSend(objc_alloc((Class)getTRAuthenticationOperationClass_0[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v6);
      v17 = 0;
      Int64 = CFPrefs_GetInt64();
      v8 = -[SFDeviceRepairSession disableSilentAuth](self, "disableSilentAuth");
      if (Int64)
        v9 = v8;
      else
        v9 = 1;
      objc_msgSend(v6, "setShouldForceInteractiveAuth:", v9);
      objc_msgSend(v6, "setShouldIgnoreAuthFailures:", 0);
      v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v11 = v10;
      problemFlags = self->_problemFlags;
      if ((problemFlags & 2) != 0 || (self->_repairFlags & 2) != 0)
      {
        objc_msgSend(v10, "addObject:", &unk_1E4890958);
        problemFlags = self->_problemFlags;
      }
      if ((problemFlags & 4) != 0 || (self->_repairFlags & 4) != 0)
        objc_msgSend(v11, "addObject:", &unk_1E4890970);
      objc_msgSend(v6, "setTargetedServices:", v11);
      if (self->_presentingViewController)
        objc_msgSend(v6, "setPresentingViewController:");
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __45__SFDeviceRepairSession__runTRAuthentication__block_invoke;
      v15[3] = &unk_1E482D3A0;
      v15[4] = self;
      v16 = v6;
      v13 = v6;
      objc_msgSend(v13, "setCompletionBlock:", v15);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v13);

    }
  }
  return self->_trAuthenticationState;
}

void __45__SFDeviceRepairSession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 320);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__SFDeviceRepairSession__runTRAuthentication__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __45__SFDeviceRepairSession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 248))
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = v2;
    objc_msgSend(*(id *)(a1 + 40), "result");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    getTRAuthenticationOperationUnauthenticatedServicesKey_0[0]();
    CFSetGetTypeID();
    CFDictionaryGetTypedValue();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 && !objc_msgSend(v3, "count"))
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v5 = *(id *)(*(_QWORD *)(a1 + 32) + 288);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 272) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v5);
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 60
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v5 = v6;
        LogPrintF();
      }
      objc_msgSend(*(id *)(a1 + 40), "error", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        getTRAuthenticationOperationErrorKey_0[0]();
        CFErrorGetTypeID();
        CFDictionaryGetTypedValue();
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v4)
        {
          NSErrorWithOSStatusF();
          v4 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 272) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:isPreflight:", v4, 0);

    }
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
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
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
      -[SFDeviceOperationCDPSetup setIsRepair:](self->_cdpSetupOperation, "setIsRepair:", 1);
      if (self->_presentingViewController)
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __37__SFDeviceRepairSession__runCDPSetup__block_invoke;
      v8[3] = &unk_1E482DFF0;
      v8[4] = self;
      -[SFDeviceOperationCDPSetup setCompletionHandler:](self->_cdpSetupOperation, "setCompletionHandler:", v8);
      -[SFDeviceOperationCDPSetup activate](self->_cdpSetupOperation, "activate");
    }
  }
  return self->_cdpState;
}

void __37__SFDeviceRepairSession__runCDPSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 120);
  if (v5)
  {
    v8 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 136) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:isPreflight:", v3, 0);
    }
    else
    {
      objc_msgSend(v5, "metricSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = v6;
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 136) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v7);
    }
    v3 = v8;
  }

}

- (int)_runAppleIDSetupRepair
{
  int appleIDSetupState;
  NSString *v4;
  void *v5;
  void *v6;
  int v7;
  void (**progressHandler)(id, uint64_t, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  AISRepairController *v12;
  AISRepairController *appleIDRepairController;
  AISRepairController *v14;
  _QWORD v16[6];

  appleIDSetupState = self->_appleIDSetupState;
  if (appleIDSetupState == 4)
    return self->_appleIDSetupState;
  if (appleIDSetupState)
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_appleIDSetupState;
  }
  v4 = self->_altDSID;
  if (v4)
  {
    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_appleIDSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 224, 0);
      v9 = mach_absolute_time();
      v10 = (void *)objc_msgSend(objc_alloc((Class)getAISRepairContextClass_0[0]()), "initWithAltDSID:", v4);
      -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMessageSessionTemplate:", v11);

      objc_msgSend(v10, "setRemoteRole:", 3);
      v12 = (AISRepairController *)objc_alloc_init((Class)getAISRepairControllerClass_0[0]());
      appleIDRepairController = self->_appleIDRepairController;
      self->_appleIDRepairController = v12;

      v14 = self->_appleIDRepairController;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke;
      v16[3] = &unk_1E4832AB0;
      v16[4] = self;
      v16[5] = v9;
      -[AISRepairController repairWithContext:completionHandler:](v14, "repairWithContext:completionHandler:", v10, v16);

      return self->_appleIDSetupState;
    }
  }
  self->_appleIDSetupState = 3;
  NSErrorWithOSStatusF();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFDeviceRepairSession _reportError:isPreflight:](self, "_reportError:isPreflight:", v6, 0);

  v7 = self->_appleIDSetupState;
  return v7;
}

void __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v7 + 320);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke_2;
  v12[3] = &unk_1E482E348;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

uint64_t __47__SFDeviceRepairSession__runAppleIDSetupRepair__block_invoke_2(uint64_t a1)
{
  uint64_t v3;

  if (*(_QWORD *)(a1 + 32))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 160) = 3;
    return objc_msgSend(*(id *)(a1 + 40), "_reportError:isPreflight:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    mach_absolute_time();
    UpTicksToSecondsF();
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 152) = v3;
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 160) = 4;
    return objc_msgSend(*(id *)(a1 + 40), "_run");
  }
}

- (int)_runHomeKitSetup
{
  int homeKitSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationHomeKitSetup *v5;
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  void *v7;
  _QWORD v9[5];

  homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState != 4)
  {
    if (homeKitSetupState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homeKitSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 234, 0);
      v5 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v5;

      -[SFDeviceOperationHomeKitSetup setDispatchQueue:](self->_homeKitSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHomeKitSetup setKeyExchangeOnly:](self->_homeKitSetupOperation, "setKeyExchangeOnly:", 1);
      -[SFDeviceOperationHomeKitSetup setUserInteractive:](self->_homeKitSetupOperation, "setUserInteractive:", 0);
      -[SFSession trSession](self->_sfSession, "trSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFDeviceOperationHomeKitSetup setTrSession:](self->_homeKitSetupOperation, "setTrSession:", v7);

      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __41__SFDeviceRepairSession__runHomeKitSetup__block_invoke;
      v9[3] = &unk_1E482DFF0;
      v9[4] = self;
      -[SFDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetupOperation, "setCompletionHandler:", v9);
      -[SFDeviceOperationHomeKitSetup activate](self->_homeKitSetupOperation, "activate");
    }
  }
  return self->_homeKitSetupState;
}

void __41__SFDeviceRepairSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v5 + 168))
  {
    v6 = v3;
    if (v3)
    {
      *(_DWORD *)(v5 + 176) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:isPreflight:", v3, 0);
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 176) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    v4 = v6;
  }

}

- (int)_runFinish
{
  int finishState;
  SFSession *sfSession;
  _QWORD v7[5];

  finishState = self->_finishState;
  if (finishState != 4 && finishState != 2)
  {
    if (finishState)
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceRepairSession <= 30
        && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_finishState = 1;
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __35__SFDeviceRepairSession__runFinish__block_invoke;
      v7[3] = &unk_1E482E320;
      v7[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_finish"), 0, MEMORY[0x1E0C9AA70], v7);
    }
  }
  return self->_finishState;
}

void __35__SFDeviceRepairSession__runFinish__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  SFRepairResultMetrics *v7;
  id v8;
  id v9;
  void *v10;
  SFClient *v11;
  SFClient *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[4];
  SFClient *v16;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7
    || CFDictionaryGetInt64Ranged()
    && (NSErrorWithOSStatusF(), (v7 = (SFRepairResultMetrics *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:isPreflight:", v7, 0);
  }
  else
  {
    if (gLogCategory_SFDeviceRepairSession <= 30
      && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = objc_alloc_init(SFRepairResultMetrics);
    -[SFRepairResultMetrics setProblemFlags:](v7, "setProblemFlags:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
    -[SFRepairResultMetrics setPeerProblemFlags:](v7, "setPeerProblemFlags:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    -[SFRepairResultMetrics setForceWiFi:](v7, "setForceWiFi:", *(_DWORD *)(*(_QWORD *)(a1 + 32) + 304) & 1);
    mach_absolute_time();
    -[SFRepairResultMetrics setTotalMs:](v7, "setTotalMs:", (double)(unint64_t)UpTicksToMilliseconds());
    -[SFRepairResultMetrics setTriggerMs:](v7, "setTriggerMs:", (double)*(unint64_t *)(*(_QWORD *)(a1 + 32) + 360));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRepairResultMetrics setPeerModel:](v7, "setPeerModel:", v10);

    -[SFRepairResultMetrics setPeerBuild:](v7, "setPeerBuild:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104));
    -[SFRepairResultMetrics setHasView:](v7, "setHasView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344) != 0);
    objc_msgSend(*(id *)(a1 + 32), "_reportRepairResultMetrics:", v7);
    v11 = objc_alloc_init(SFClient);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __35__SFDeviceRepairSession__runFinish__block_invoke_2;
    v15[3] = &unk_1E482DFF0;
    v12 = v11;
    v16 = v12;
    -[SFClient reenableProxCardType:completion:](v12, "reenableProxCardType:completion:", 10, v15);
    v13 = *(_QWORD **)(a1 + 32);
    v14 = v13[44];
    if (v14)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v14 + 16))(v13[44], 96, 0);
      v13 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v13, "_cleanup");

  }
}

void __35__SFDeviceRepairSession__runFinish__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (gLogCategory_SFDeviceRepairSession <= 30
    && (gLogCategory_SFDeviceRepairSession != -1 || _LogCategory_Initialize()))
  {
    v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);

}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (unsigned)repairFlags
{
  return self->_repairFlags;
}

- (void)setRepairFlags:(unsigned int)a3
{
  self->_repairFlags = a3;
}

- (unint64_t)triggerMs
{
  return self->_triggerMs;
}

- (void)setTriggerMs:(unint64_t)a3
{
  self->_triggerMs = a3;
}

- (BOOL)disableSilentAuth
{
  return self->_disableSilentAuth;
}

- (void)setDisableSilentAuth:(BOOL)a3
{
  self->_disableSilentAuth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_captiveJoin, 0);
  objc_storeStrong((id *)&self->_wifiSetupOperation, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_appleIDRepairController, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_peerOSBuild, 0);
  objc_storeStrong((id *)&self->_peerSSID, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
