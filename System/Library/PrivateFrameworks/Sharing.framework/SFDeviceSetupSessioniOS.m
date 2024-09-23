@implementation SFDeviceSetupSessioniOS

- (SFDeviceSetupSessioniOS)init
{
  SFDeviceSetupSessioniOS *v2;
  SFDeviceSetupSessioniOS *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupSessioniOS;
  v2 = -[SFDeviceSetupSessioniOS init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_pairFlags = 0;
    if (CFPrefs_GetInt64())
      v3->_pairFlags |= 0x100u;
  }
  return v3;
}

- (void)dealloc
{
  SFDeviceSetupSessioniOS *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupSessioniOS *)FatalErrorF();
    -[SFDeviceSetupSessioniOS _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceSetupSessioniOS _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupSessioniOS;
    -[SFDeviceSetupSessioniOS dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  id interruptionHandler;
  id invalidationHandler;
  id progressHandler;
  id promptForPINHandler;
  id receivedObjectHandler;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  progressHandler = self->_progressHandler;
  self->_progressHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  receivedObjectHandler = self->_receivedObjectHandler;
  self->_receivedObjectHandler = 0;

}

- (void)setPairFlags:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__SFDeviceSetupSessioniOS_setPairFlags___block_invoke;
  v4[3] = &unk_1E4830D68;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

uint64_t __40__SFDeviceSetupSessioniOS_setPairFlags___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_DWORD *)(*(_QWORD *)(result + 32) + 172) = *(_DWORD *)(result + 40);
  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 8))
  {
    *(_DWORD *)(v1 + 172) |= 0x80000u;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 37) = 1;
    return objc_msgSend(*(id *)(result + 32), "_run");
  }
  return result;
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFDeviceSetupSessioniOS_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupSessioniOS_activate__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  const char *v3;
  _QWORD *v4;
  uint64_t v5;
  const char *v7;

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = CFPrefs_GetInt64() != 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 104) = v2;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    v3 = "no";
    if (v2)
      v3 = "yes";
    v7 = v3;
    LogPrintF();
  }
  RandomBytes();
  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[27];
  if (v5)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v5 + 16))(v4[27], 10, 0);
    v4 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v4, "_run", v7);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFDeviceSetupSessioniOS_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupSessioniOS_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 35)
    && gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 35) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 144);
  *(_QWORD *)(v4 + 144) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = 0;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v8)
  {
    v9 = v8;
    v10 = (id)objc_msgSend(v9, "endPlanTransferForEndPoint:", 1);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 96);
    *(_QWORD *)(v11 + 96) = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "invalidate");
  v13 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(v13 + 80);
  *(_QWORD *)(v13 + 80) = 0;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  v15 = *(_QWORD **)(a1 + 32);
  v16 = v15[25];
  if (v16)
  {
    (*(void (**)(_QWORD))(v16 + 16))(v15[25]);
    v15 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v15, "_cleanup");
}

- (void)_completedWithError:(id)a3
{
  id v4;
  id v5;
  void (**progressHandler)(id, uint64_t, void *);
  void *v7;
  void (**v8)(id, uint64_t, _QWORD);
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];
  _QWORD v16[2];
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v5 = v4;
  if (v5)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 60
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      v14 = v5;
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v17 = CFSTR("eo");
      v18[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 20, v7);

    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (v8)
      v8[2](v8, 20, 0);
  }
  objc_msgSend(v5, "domain", v14, CFSTR("errDomain"));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E483B8E8;
  v15[1] = CFSTR("errCode");
  v16[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "code"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.iOSSetup"), v13);

}

- (void)_run
{
  int v3;
  int v4;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void (**v6)(id, uint64_t, _QWORD);
  void (**v7)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  uint64_t v9;
  TSCellularPlanProximityTransferController *v10;
  TSCellularPlanProximityTransferController *secureESIMTransferController;
  int v12;
  int v13;
  int v14;
  void (**v15)(id, uint64_t, _QWORD);
  void *v16;
  void *resumePassword;
  _QWORD v18[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_sfSession && self->_peerDevice)
  {
    -[SFDeviceSetupSessioniOS _runSFSessionStart](self, "_runSFSessionStart");
    return;
  }
  if (!self->_sfSessionActivated)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_29;
    }
    return;
  }
  if (!self->_resumePassword && -[SFDevice osVersion](self->_peerDevice, "osVersion") >= 8)
  {
    v3 = -[SFDeviceSetupSessioniOS _runPreAuthPairSetup](self, "_runPreAuthPairSetup");
    if (v3 != 4 && v3 != 2)
      return;
  }
  if (!self->_preAuthRequestSent)
  {
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 40, 0);
    self->_preAuthRequestSent = 1;
    -[SFDeviceSetupSessioniOS _sendPreAuthInfo](self, "_sendPreAuthInfo");
    return;
  }
  if (!self->_preAuthResponseReceived)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_29;
    }
    return;
  }
  if (!self->_pairSetupDone)
  {
    if (self->_pairSetupRunning)
    {
      if (!self->_pairSetupReset)
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_29;
        }
        return;
      }
    }
    else
    {
      v7 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (v7)
        v7[2](v7, 60, 0);
    }
    *(_WORD *)&self->_pairSetupReset = 256;
    if (self->_resumePassword)
    {
      -[SFSession setFixedPIN:](self->_sfSession, "setFixedPIN:");
      if (gLogCategory_SFDeviceSetupSessioniOS > 30
        || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_45;
      }
      resumePassword = self->_resumePassword;
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS > 30
           || gLogCategory_SFDeviceSetupSessioniOS == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_45;
    }
    LogPrintF();
LABEL_45:
    sfSession = self->_sfSession;
    v9 = self->_pairFlags | 0x10;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __31__SFDeviceSetupSessioniOS__run__block_invoke;
    v18[3] = &unk_1E482DFF0;
    v18[4] = self;
    -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", v9, v18, resumePassword);
    return;
  }
  if (self->_configRequestSent)
  {
    if (self->_configResponseReceived)
    {
      if (!-[SFDeviceSetupSessioniOS supportsDependentSetup](self, "supportsDependentSetup")
        || (v4 = -[SFDeviceSetupSessioniOS _runDependentSetup](self, "_runDependentSetup"), v4 == 4)
        || v4 == 2)
      {
        if (!self->_secureESIMTransferController && _os_feature_enabled_impl())
        {
          if (gLogCategory_SFDeviceSetupSessioniOS <= 30
            && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v10 = (TSCellularPlanProximityTransferController *)objc_msgSend(objc_alloc((Class)getTSCellularPlanProximityTransferControllerClass[0]()), "initWithESIMDelegate:", self);
          secureESIMTransferController = self->_secureESIMTransferController;
          self->_secureESIMTransferController = v10;

          if (gLogCategory_SFDeviceSetupSessioniOS <= 30
            && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
          {
            resumePassword = self->_secureESIMTransferController;
            LogPrintF();
          }
        }
        if (self->_eSIMSetupEnabled)
        {
          v12 = -[SFDeviceSetupSessioniOS _runESIMSetup](self, "_runESIMSetup");
          if (v12 != 4 && v12 != 2)
            return;
          -[SFDeviceSetupSessioniOS _runOTCSetup](self, "_runOTCSetup", resumePassword);
        }
        if (self->_resumePassword)
          goto LABEL_59;
        v14 = -[SFDeviceSetupSessioniOS _runCoreCDPSetup](self, "_runCoreCDPSetup");
        if (v14 != 4 && v14 != 2)
          return;
        if (self->_resumePassword)
        {
LABEL_59:
          v13 = -[SFDeviceSetupSessioniOS _runResume](self, "_runResume", resumePassword);
          if (v13 != 4 && v13 != 2)
            return;
        }
        if (self->_buddySession)
        {
          if (!self->_buddyConfigured)
          {
            if (gLogCategory_SFDeviceSetupSessioniOS <= 30
              && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
            {
              resumePassword = self->_fileTransferSessionTemplate;
              LogPrintF();
            }
            -[BYDeviceSetupSourceSession setFileTransferSessionTemplate:](self->_buddySession, "setFileTransferSessionTemplate:", self->_fileTransferSessionTemplate, resumePassword);
            -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[BYDeviceSetupSourceSession setMessageSession:](self->_buddySession, "setMessageSession:", v16);

            self->_buddyConfigured = 1;
          }
          if (self->_buddyComplete)
          {
            -[SFDeviceSetupSessioniOS _completedWithError:](self, "_completedWithError:", 0);
            return;
          }
          if (gLogCategory_SFDeviceSetupSessioniOS <= 30
            && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
          {
LABEL_29:
            LogPrintF();
          }
        }
        else
        {
          v15 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
          if (v15)
            v15[2](v15, 240, 0);
          -[SFDeviceSetupSessioniOS _startBuddySession](self, "_startBuddySession");
        }
      }
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 30
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_29;
    }
  }
  else
  {
    v6 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (v6)
      v6[2](v6, 80, 0);
    self->_configRequestSent = 1;
    -[SFDeviceSetupSessioniOS _sendConfigInfo](self, "_sendConfigInfo");
  }
}

void __31__SFDeviceSetupSessioniOS__run__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 38) = 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 36) = 1;
  v6 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3);
  }
  else
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[27];
    if (v5)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v5 + 16))(v4[27], 70, 0);
      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "_run");
  }

}

- (void)_runSFSessionStart
{
  SFSession *v3;
  SFSession *sfSession;
  uint64_t v5;
  SFSession *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFSession invalidate](self->_sfSession, "invalidate");
  v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
  -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
  -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.iOSSetup"));
  -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 1);
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke;
  v11[3] = &unk_1E482DFF0;
  v11[4] = self;
  -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v11);
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_2;
  v10[3] = &unk_1E482DF78;
  v10[4] = self;
  -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v10);
  -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", &__block_literal_global_53);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_4;
  v9[3] = &unk_1E482FFD8;
  v9[4] = self;
  -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_5;
  v8[3] = &unk_1E4830000;
  v8[4] = self;
  -[SFSession setReceivedObjectHandler:](self->_sfSession, "setReceivedObjectHandler:", v8);
  v6 = self->_sfSession;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_6;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFSession activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 90)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3, v5);

}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_SFDeviceSetupSessioniOS <= 60
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completedWithError:", v3);

}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_3()
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedObject:flags:", a3, a2);
}

void __45__SFDeviceSetupSessioniOS__runSFSessionStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  id v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (v3)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 90
      && ((v4 = v3, gLogCategory_SFDeviceSetupSessioniOS != -1) || (v5 = _LogCategory_Initialize(), v4 = v8, v5)))
    {
      v7 = v4;
      LogPrintF();
      objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v8, v7);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v8, v6);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_runSFSessionActivated");
  }

}

- (void)_runSFSessionActivated
{
  SFSession *sfSession;
  _QWORD v4[5];

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_sfSessionActivated = 1;
  sfSession = self->_sfSession;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SFDeviceSetupSessioniOS__runSFSessionActivated__block_invoke;
  v4[3] = &unk_1E482E2D0;
  v4[4] = self;
  -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_sa"), &unk_1E4891408, v4);
  -[SFDeviceSetupSessioniOS _run](self, "_run");
}

uint64_t __49__SFDeviceSetupSessioniOS__runSFSessionActivated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupActionRequest:responseHandler:");
}

- (int)_runPreAuthPairSetup
{
  int preAuthPairSetupState;
  SFSession *sfSession;
  _QWORD v6[5];

  preAuthPairSetupState = self->_preAuthPairSetupState;
  if (preAuthPairSetupState != 4)
  {
    if (preAuthPairSetupState)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preAuthPairSetupState = 1;
      -[SFSession setFixedPIN:](self->_sfSession, "setFixedPIN:", CFSTR("public"));
      sfSession = self->_sfSession;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __47__SFDeviceSetupSessioniOS__runPreAuthPairSetup__block_invoke;
      v6[3] = &unk_1E482DFF0;
      v6[4] = self;
      -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", 24, v6);
    }
  }
  return self->_preAuthPairSetupState;
}

void __47__SFDeviceSetupSessioniOS__runPreAuthPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "setFixedPIN:", 0);
  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3);
  }
  else
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

- (int)_runESIMSetup
{
  int eSIMSetupState;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  eSIMSetupState = self->_eSIMSetupState;
  if (!eSIMSetupState)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = (void *)objc_msgSend(objc_alloc((Class)getCoreTelephonyClientClass[0]()), "initWithQueue:", self->_dispatchQueue);
      if (v7)
      {
        v8 = v7;
        objc_storeStrong((id *)&self->_eSIMClient, v7);
        v9 = (id)objc_msgSend(v8, "bootstrapPlanTransferForEndpoint:usingMessageSession:", 1, v6);
        self->_eSIMSetupState = 4;

        return self->_eSIMSetupState;
      }
      else
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 90
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        eSIMSetupState = 2;
        self->_eSIMSetupState = 2;

      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 90
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      eSIMSetupState = 2;
      self->_eSIMSetupState = 2;
    }
  }
  return eSIMSetupState;
}

- (void)_runOTCSetup
{
  CoreTelephonyClient *v3;
  CoreTelephonyClient *eSIMClient;
  CoreTelephonyClient *v5;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_eSIMClient)
  {
    v3 = (CoreTelephonyClient *)objc_msgSend(objc_alloc((Class)getCoreTelephonyClientClass[0]()), "initWithQueue:", self->_dispatchQueue);
    eSIMClient = self->_eSIMClient;
    self->_eSIMClient = v3;

  }
  location = 0;
  objc_initWeak(&location, self);
  v5 = self->_eSIMClient;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __39__SFDeviceSetupSessioniOS__runOTCSetup__block_invoke;
  v6[3] = &unk_1E4833470;
  objc_copyWeak(&v7, &location);
  -[CoreTelephonyClient carrierOneTimeCodeSendersWithCompletion:](v5, "carrierOneTimeCodeSendersWithCompletion:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__SFDeviceSetupSessioniOS__runOTCSetup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 60
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (WeakRetained)
    {
      if ((objc_msgSend(WeakRetained, "_allowAllOTCSenders") & 1) != 0 || objc_msgSend(v8, "count"))
        objc_msgSend(v7, "_registerOneTimeCodeDetection:", v8);
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 90
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (BOOL)_allowAllOTCSenders
{
  int v2;
  int AppBooleanValue;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;

  v2 = IsAppleInternalBuild();
  if (v2)
  {
    CFPreferencesSynchronize(CFSTR("com.apple.Sharing"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("AllowAllOTCSenders"), CFSTR("com.apple.Sharing"), &keyExistsAndHasValidFormat);
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (keyExistsAndHasValidFormat)
      v4 = AppBooleanValue == 0;
    else
      v4 = 1;
    LOBYTE(v2) = !v4;
  }
  return v2;
}

- (void)_registerOneTimeCodeDetection:(id)a3
{
  id v4;
  id v5;
  IMOneTimeCodeAccelerator *v6;
  IMOneTimeCodeAccelerator *oneTimeCodeAccelerator;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  if (self->_oneTimeCodeAccelerator)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    location = 0;
    objc_initWeak(&location, self);
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = objc_alloc((Class)getIMOneTimeCodeAcceleratorClass[0]());
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__SFDeviceSetupSessioniOS__registerOneTimeCodeDetection___block_invoke;
    v8[3] = &unk_1E4833498;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    v6 = (IMOneTimeCodeAccelerator *)objc_msgSend(v5, "initWithBlockForUpdates:", v8);
    oneTimeCodeAccelerator = self->_oneTimeCodeAccelerator;
    self->_oneTimeCodeAccelerator = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __57__SFDeviceSetupSessioniOS__registerOneTimeCodeDetection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v4 = _LogCategory_Initialize(), v3 = v10, v4))
    {
      v9 = v3;
      LogPrintF();
      v3 = v10;
    }
  }
  objc_msgSend(v3, "firstObject", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("code"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("handle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v8) & 1) != 0
        || objc_msgSend(WeakRetained, "_allowAllOTCSenders"))
      {
        objc_msgSend(WeakRetained, "_presentOneTimeCodeProxCard:", v6);
      }
      else if (gLogCategory_SFDeviceSetupSessioniOS <= 30
             && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }

    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 90
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
}

- (void)_presentOneTimeCodeProxCard:(id)a3
{
  id v4;
  void (**progressHandler)(id, uint64_t, void *);
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v7 = CFSTR("oneTimeCode");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 1100, v6);

  }
}

- (int)_runDependentSetup
{
  int result;
  uint64_t v4;
  void *v5;
  void *v6;
  PASUIGuardianViewPresenter *v7;
  PASUIGuardianViewPresenter *dependentSetupSession;
  PASUIGuardianViewPresenter *v9;
  _QWORD v10[5];

  result = self->_dependentSetupState;
  if (!result)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      self->_dependentSetupState = 1;
      v6 = (void *)objc_msgSend(objc_alloc((Class)getPRXCardContentViewControllerClass[0]()), "initWithNibName:bundle:", 0, 0);
      v7 = (PASUIGuardianViewPresenter *)objc_msgSend(objc_alloc((Class)getPASUIGuardianViewPresenterClass[0]()), "initWithSharingViewController:", v6);
      dependentSetupSession = self->_dependentSetupSession;
      self->_dependentSetupSession = v7;

      if ((objc_opt_respondsToSelector() & 1) != 0)
        -[PASUIGuardianViewPresenter setDelegate:](self->_dependentSetupSession, "setDelegate:", self);
      v9 = self->_dependentSetupSession;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke;
      v10[3] = &unk_1E48334C0;
      v10[4] = self;
      -[PASUIGuardianViewPresenter activateWithTemplateMessageSession:completion:](v9, "activateWithTemplateMessageSession:completion:", v5, v10);

      return self->_dependentSetupState;
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 90
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      result = 2;
      self->_dependentSetupState = 2;
    }
  }
  return result;
}

void __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  uint64_t v11;
  id v12;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 176);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke_2;
    v10 = &unk_1E482D3A0;
    v11 = v5;
    v12 = v3;
    dispatch_async(v6, &v7);
    objc_msgSend(*(id *)(a1 + 32), "_startBuddySession", v7, v8, v9, v10, v11);

  }
}

void __45__SFDeviceSetupSessioniOS__runDependentSetup__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 216);
  v4 = CFSTR("viewController");
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, 2000, v3);

}

- (int)_runCoreCDPSetup
{
  int cdpState;
  void *v5;
  CDPContext *v6;
  CDPContext *cdpContext;
  CDPStateController *v8;
  CDPStateController *cdpController;
  CDPStateController *v10;
  void *v11;
  _QWORD v13[5];

  cdpState = self->_cdpState;
  if (cdpState != 4 && cdpState != 2)
  {
    if (cdpState)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_cdpState = 1;
      -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        v6 = (CDPContext *)objc_alloc_init((Class)getCDPContextClass_0[0]());
        cdpContext = self->_cdpContext;
        self->_cdpContext = v6;

        -[CDPContext setSharingChannel:](self->_cdpContext, "setSharingChannel:", v5);
        v8 = (CDPStateController *)objc_msgSend(objc_alloc((Class)getCDPStateControllerClass_0[0]()), "initWithContext:", self->_cdpContext);
        cdpController = self->_cdpController;
        self->_cdpController = v8;

        v10 = self->_cdpController;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke;
        v13[3] = &unk_1E482F150;
        v13[4] = self;
        -[CDPStateController startCircleApplicationApprovalServer:](v10, "startCircleApplicationApprovalServer:", v13);
      }
      else
      {
        self->_cdpState = 3;
        NSErrorWithOSStatusF();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFDeviceSetupSessioniOS _completedWithError:](self, "_completedWithError:", v11);

      }
    }
  }
  return self->_cdpState;
}

void __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  uint64_t v11;
  char v12;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(NSObject **)(v6 + 176);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke_2;
  block[3] = &unk_1E4832528;
  v12 = a2;
  v10 = v5;
  v11 = v6;
  v8 = v5;
  dispatch_async(v7, block);

}

uint64_t __43__SFDeviceSetupSessioniOS__runCoreCDPSetup__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 128) = 4;
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (int)_runResume
{
  int resumeState;
  SFSession *sfSession;
  _QWORD v6[5];

  resumeState = self->_resumeState;
  if (resumeState != 4)
  {
    if (resumeState)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_resumeState = 1;
      sfSession = self->_sfSession;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __37__SFDeviceSetupSessioniOS__runResume__block_invoke;
      v6[3] = &unk_1E482E320;
      v6[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_sa"), 0, &unk_1E4891430, v6);
    }
  }
  return self->_resumeState;
}

void __37__SFDeviceSetupSessioniOS__runResume__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v12)
    v9 = 3;
  else
    v9 = 4;
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72) = v9;
  v10 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 216));
  v11 = v10;
  if (v10)
    (*((void (**)(void *, uint64_t, _QWORD))v10 + 2))(v10, 97, 0);

  objc_msgSend(*(id *)(a1 + 32), "_run");
}

- (void)_sendConfigInfo
{
  id v3;
  RPFileTransferSession *fileTransferSessionTemplate;
  RPFileTransferSession *v5;
  RPFileTransferSession *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;

  if (self->_sfSession)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E4890A00, CFSTR("op"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("dn"));
    fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
    if (!fileTransferSessionTemplate)
    {
      v5 = (RPFileTransferSession *)objc_alloc_init(MEMORY[0x1E0D83928]);
      v6 = self->_fileTransferSessionTemplate;
      self->_fileTransferSessionTemplate = v5;

      -[RPFileTransferSession setFlags:](self->_fileTransferSessionTemplate, "setFlags:", 418);
      -[RPFileTransferSession prepareTemplateAndReturnError:](self->_fileTransferSessionTemplate, "prepareTemplateAndReturnError:", 0);
      fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
    }
    -[RPFileTransferSession selfPublicKey](fileTransferSessionTemplate, "selfPublicKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("ftPK"));

    v8 = objc_alloc_init((Class)getACAccountStoreClass_5[0]());
    objc_msgSend(v8, "aa_primaryAppleAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "username");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("icn"));
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lang"));
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localeIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("locale"));
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v15 = (void *)WiFiCopyCurrentNetworkInfoEx();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ssid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("wifiSSID"));
      }
      else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
             && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("password"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("wifiPW"));
      }
      else
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v14 = 0;
      }
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      v18 = 0;
      LogPrintF();
    }
    -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", 1, v3, v18);

  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_receivedConfigResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v8;

  v8 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[RPFileTransferSession setPeerPublicKey:](self->_fileTransferSessionTemplate, "setPeerPublicKey:", v4);

  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[RPFileTransferSession targetID](self->_fileTransferSessionTemplate, "targetID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[RPFileTransferSession setTargetID:](self->_fileTransferSessionTemplate, "setTargetID:", v5);
    if (!v6)
    {
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 420, 0);
    }
  }

}

- (void)_sendPreAuthInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  id v13;

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", &unk_1E4890A18, CFSTR("op"));
  if (AccessibilityLibrary_sOnce_0 != -1)
    dispatch_once(&AccessibilityLibrary_sOnce_0, &__block_literal_global_561);
  if (AccessibilityLibrary_sLib_0 && dlsym((void *)AccessibilityLibrary_sLib_0, "_AXSCopySettingsDataBlobForBuddy"))
  {
    v3 = (void *)softLink_AXSCopySettingsDataBlobForBuddy[0]();
    if (v3)
    {
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v3, CFSTR("axSt"));
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", SFDeviceClassCodeGet());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v4, CFSTR("dclass"));

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v5, CFSTR("langs"));
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, CFSTR("lang"));
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, CFSTR("locale"));
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 60
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v9 = (void *)GestaltCopyAnswer();

  if (v9)
  {
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("model"));
  }
  else
  {
    v10 = v13;
    if (gLogCategory_SFDeviceSetupSessioniOS > 60)
      goto LABEL_39;
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize())
      LogPrintF();
  }
  v10 = v13;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v11 = _LogCategory_Initialize(), v10 = v13, v11))
    {
      v12 = v10;
      LogPrintF();
      v10 = v13;
    }
  }
LABEL_39:
  -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", self->_preAuthPairSetupState == 4, v10, v12);

}

- (void)_startBuddySession
{
  BYDeviceSetupSourceSession *v3;
  BYDeviceSetupSourceSession *buddySession;
  void *v5;
  RPFileTransferSession *fileTransferSessionTemplate;
  _QWORD v7[5];

  if (!self->_buddySession)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = (BYDeviceSetupSourceSession *)objc_alloc_init((Class)getBYDeviceSetupSourceSessionClass[0]());
    buddySession = self->_buddySession;
    self->_buddySession = v3;

    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
      LogPrintF();
    }
    -[BYDeviceSetupSourceSession setFileTransferSessionTemplate:](self->_buddySession, "setFileTransferSessionTemplate:", self->_fileTransferSessionTemplate, fileTransferSessionTemplate);
    -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[BYDeviceSetupSourceSession setMessageSession:](self->_buddySession, "setMessageSession:", v5);

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke;
    v7[3] = &unk_1E48334E8;
    v7[4] = self;
    -[BYDeviceSetupSourceSession setProgressHandler:](self->_buddySession, "setProgressHandler:", v7);
    -[BYDeviceSetupSourceSession activate](self->_buddySession, "activate");
    self->_buddyConfigured = 1;
  }
}

void __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 176);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke_2;
  v7[3] = &unk_1E482D3A0;
  v7[4] = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

uint64_t __45__SFDeviceSetupSessioniOS__startBuddySession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleBuddyProgress:", *(_QWORD *)(a1 + 40));
}

- (void)_handleBuddyProgress:(id)a3
{
  id v4;
  void *v5;
  int Int64Ranged;
  double v7;
  double v8;
  double v9;
  double v10;
  void (**progressHandler)(id, uint64_t, id);
  void (**v12)(id, uint64_t, void *);
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(id, uint64_t, void *);
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_buddySession)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30
      && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      v17 = v4;
      LogPrintF();
    }
    if (CFDictionaryGetInt64())
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      progressHandler = (void (**)(id, uint64_t, id))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 242, v4);
      self->_buddyComplete = 1;
      if (self->_dependentSetupState == 1)
      {
        self->_dependentSetupState = 4;
        self->_eSIMSetupState = 2;
        self->_cdpState = 2;
      }
      -[SFDeviceSetupSessioniOS _run](self, "_run", v17);
      goto LABEL_36;
    }
    CFErrorGetTypeID();
    CFDictionaryGetTypedValue();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
        -[SFDeviceSetupSessioniOS _completedWithError:](self, "_completedWithError:", v5, v5);
      }
      else
      {
        -[SFDeviceSetupSessioniOS _completedWithError:](self, "_completedWithError:", v5, v17);
      }
    }
    else
    {
      Int64Ranged = CFDictionaryGetInt64Ranged();
      CFDictionaryGetDouble();
      v8 = v7;
      CFDictionaryGetDouble();
      v10 = v9;
      if (Int64Ranged == 2)
      {
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v16 = (void (**)(id, uint64_t, void *))self->_progressHandler;
        if (!v16)
          goto LABEL_35;
        v18[0] = CFSTR("progress");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = CFSTR("remainSecs");
        v19[0] = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v19[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16[2](v16, 310, v15);
      }
      else
      {
        if (Int64Ranged != 1)
          goto LABEL_35;
        if (gLogCategory_SFDeviceSetupSessioniOS <= 30
          && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v12 = (void (**)(id, uint64_t, void *))self->_progressHandler;
        if (!v12)
          goto LABEL_35;
        v20[0] = CFSTR("progress");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v20[1] = CFSTR("remainSecs");
        v21[0] = v13;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v21[1] = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v12[2](v12, 300, v15);
      }

    }
LABEL_35:

    goto LABEL_36;
  }
  if (gLogCategory_SFDeviceSetupSessioniOS <= 60
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_36:

}

- (void)_handleSetupActionRequest:(id)a3 responseHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t Int64Ranged;
  const char *v9;
  _QWORD *progressHandler;
  void (*v11)(_QWORD *, uint64_t);
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  char *v16;

  v16 = (char *)a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA)
      v9 = "?";
    else
      v9 = off_1E4833610[(int)Int64Ranged];
    v14 = (uint64_t)v9;
    v15 = v16;
    LogPrintF();
  }
  switch((int)Int64Ranged)
  {
    case 1:
      progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
        v12 = 400;
        goto LABEL_27;
      }
      break;
    case 2:
      progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
        v12 = 401;
        goto LABEL_27;
      }
      break;
    case 3:
      progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
        v12 = 410;
        goto LABEL_27;
      }
      break;
    case 4:
      progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
        v12 = 411;
        goto LABEL_27;
      }
      break;
    case 5:
      -[SFDeviceSetupSessioniOS _handleSetupActionSoftwareUpdate](self, "_handleSetupActionSoftwareUpdate");
      break;
    case 9:
      progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
        v12 = 430;
        goto LABEL_27;
      }
      break;
    case 10:
      progressHandler = self->_progressHandler;
      if (progressHandler)
      {
        v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
        v12 = 431;
LABEL_27:
        v11(progressHandler, v12);
      }
      break;
    default:
      if (gLogCategory_SFDeviceSetupSessioniOS <= 60
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        if (Int64Ranged > 0xA)
          v13 = "?";
        else
          v13 = off_1E4833668[(int)Int64Ranged];
        v14 = Int64Ranged;
        v15 = v13;
        LogPrintF();
      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E4890A30, CFSTR("er"), v14, v15);
      break;
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v7);

}

- (void)_handleSetupActionSoftwareUpdate
{
  NSData *v3;
  NSData *resumeAuthTag;
  void *v5;
  void *v6;
  id v7;
  NSString *v8;
  NSString *resumePassword;
  SFSession *sfSession;
  void (**progressHandler)(id, uint64_t, _QWORD);
  NSData *v12;
  NSString *v13;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ResumeAuthTag"), 3);
  v3 = (NSData *)objc_claimAutoreleasedReturnValue();
  resumeAuthTag = self->_resumeAuthTag;
  self->_resumeAuthTag = v3;

  -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self->_sfSession, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("ResumePassword"), 8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v7 = objc_retainAutorelease(v5);
    objc_msgSend(v7, "bytes");
    objc_msgSend(v7, "length");
    DataToHexCStringEx();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v15);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    resumePassword = self->_resumePassword;
    self->_resumePassword = v8;

    v15 = 0;
    v16 = 0;
    v17 = 0;
    if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize())
      {
        v12 = self->_resumeAuthTag;
        v13 = self->_resumePassword;
        LogPrintF();
      }
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    sfSession = self->_sfSession;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __59__SFDeviceSetupSessioniOS__handleSetupActionSoftwareUpdate__block_invoke;
    v14[3] = &unk_1E482E320;
    v14[4] = self;
    -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_sa"), 0, &unk_1E4891458, v14, v12, v13);
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 99, 0);
  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 90
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __59__SFDeviceSetupSessioniOS__handleSetupActionSoftwareUpdate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    v9 = v8;
    v10 = v11;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_handleSetupPeerSuspended", v9, v10);

}

- (void)_handleSetupPeerSuspended
{
  RPFileTransferSession *fileTransferSessionTemplate;
  SFDevice *peerDevice;
  SFSession *sfSession;
  SFDeviceDiscovery *v6;
  SFDeviceDiscovery *resumeDiscovery;
  SFDeviceDiscovery *v8;
  uint64_t v9;
  _QWORD v10[6];
  _QWORD v11[6];

  *(_WORD *)&self->_buddyConfigured = 0;
  fileTransferSessionTemplate = self->_fileTransferSessionTemplate;
  self->_fileTransferSessionTemplate = 0;

  self->_pairSetupDone = 0;
  peerDevice = self->_peerDevice;
  self->_peerDevice = 0;

  self->_sfSessionActivated = 0;
  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v6 = objc_alloc_init(SFDeviceDiscovery);
  resumeDiscovery = self->_resumeDiscovery;
  self->_resumeDiscovery = v6;
  v8 = v6;

  -[SFDeviceDiscovery setDiscoveryFlags:](v8, "setDiscoveryFlags:", 512);
  -[SFDeviceDiscovery setDispatchQueue:](v8, "setDispatchQueue:", self->_dispatchQueue);
  -[SFDeviceDiscovery setPurpose:](v8, "setPurpose:", CFSTR("iOSSetupResume"));
  v9 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke;
  v11[3] = &unk_1E4833510;
  v11[4] = v8;
  v11[5] = self;
  -[SFDeviceDiscovery setDeviceFoundHandler:](v8, "setDeviceFoundHandler:", v11);
  v10[0] = v9;
  v10[1] = 3221225472;
  v10[2] = __52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke_2;
  v10[3] = &unk_1E482E2F8;
  v10[4] = v8;
  v10[5] = self;
  -[SFDeviceDiscovery activateWithCompletion:](v8, "activateWithCompletion:", v10);

}

_QWORD *__52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[7])
    return (_QWORD *)objc_msgSend(result, "_handleSetupResumeFoundDevice:", a2);
  return result;
}

void __52__SFDeviceSetupSessioniOS__handleSetupPeerSuspended__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) && gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    v6 = v3;
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v5 = _LogCategory_Initialize(), v4 = v6, v5))
    {
      LogPrintF();
      v4 = v6;
    }
  }

}

- (void)_handleSetupResumeFoundDevice:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  SFDeviceDiscovery *resumeDiscovery;
  id v9;

  v9 = a3;
  if ((objc_msgSend(v9, "deviceFlags") & 0x100) != 0)
  {
    objc_msgSend(v9, "bleDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "advertisementFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v7, "isEqual:", self->_resumeAuthTag) & 1) != 0)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_peerDevice, a3);
      -[SFDeviceDiscovery invalidate](self->_resumeDiscovery, "invalidate");
      resumeDiscovery = self->_resumeDiscovery;
      self->_resumeDiscovery = 0;

      -[SFDeviceSetupSessioniOS _run](self, "_run");
    }
    else if (gLogCategory_SFDeviceSetupSessioniOS <= 30
           && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

  }
  else if (gLogCategory_SFDeviceSetupSessioniOS <= 30
         && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  int v7;
  int Int64Ranged;
  void *v9;
  int v10;
  void (**receivedObjectHandler)(id, _QWORD);
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v17 = v6;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30)
  {
    if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v7 = _LogCategory_Initialize(), v6 = v17, v7))
    {
      v15 = &unk_1A2AF8A2B;
      v16 = objc_msgSend(v6, "count");
      v14 = v4;
      LogPrintF();
    }
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 2)
  {
    if ((v4 & 1) != 0)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      -[SFDeviceSetupSessioniOS _receivedConfigResponse:](self, "_receivedConfigResponse:", v17, v14, v15, v16);
      receivedObjectHandler = (void (**)(id, _QWORD))self->_receivedObjectHandler;
      if (receivedObjectHandler)
        ((void (**)(id, id))receivedObjectHandler)[2](receivedObjectHandler, v17);
      self->_configResponseReceived = 1;
      goto LABEL_30;
    }
    v9 = v17;
    if (gLogCategory_SFDeviceSetupSessioniOS <= 50)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1 || (v13 = _LogCategory_Initialize(), v9 = v17, v13))
      {
LABEL_21:
        LogPrintF();
LABEL_31:
        v9 = v17;
      }
    }
  }
  else if (Int64Ranged == 5)
  {
    v9 = v17;
    if ((v4 & 1) == 0 && gLogCategory_SFDeviceSetupSessioniOS <= 50)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1)
        goto LABEL_21;
      v12 = _LogCategory_Initialize();
      v9 = v17;
      if (v12)
        goto LABEL_21;
    }
  }
  else
  {
    v9 = v17;
    if (Int64Ranged == 4)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS <= 30
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_preAuthResponseReceived = 1;
LABEL_30:
      -[SFDeviceSetupSessioniOS _run](self, "_run", v14);
      goto LABEL_31;
    }
    if (gLogCategory_SFDeviceSetupSessioniOS <= 60)
    {
      if (gLogCategory_SFDeviceSetupSessioniOS != -1)
        goto LABEL_21;
      v10 = _LogCategory_Initialize();
      v9 = v17;
      if (v10)
        goto LABEL_21;
    }
  }

}

- (void)sendAppEvent:(id)a3
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
  v7[2] = __40__SFDeviceSetupSessioniOS_sendAppEvent___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __40__SFDeviceSetupSessioniOS_sendAppEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(unsigned int *)(v2 + 12);
  *(_DWORD *)(v2 + 12) = v3 + 1;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    v5 = v3;
    LogPrintF();
  }
  v6 = (id)objc_msgSend(*(id *)(a1 + 40), "mutableCopy", v5);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E4890A60, CFSTR("op"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("appID"));

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "sendWithFlags:object:", 1, v6);
}

- (void)tryPIN:(id)a3
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
  v7[2] = __34__SFDeviceSetupSessioniOS_tryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __34__SFDeviceSetupSessioniOS_tryPIN___block_invoke(uint64_t a1)
{
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80)
    && gLogCategory_SFDeviceSetupSessioniOS <= 60
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)didComplete
{
  void (**progressHandler)(id, uint64_t, _QWORD);

  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 1001, 0);
}

- (void)didRequestPresentationForProxCard:(id)a3
{
  id v4;
  void (**progressHandler)(id, uint64_t, void *);
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_SFDeviceSetupSessioniOS <= 30
    && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v7 = CFSTR("viewController");
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 1000, v6);

  }
}

- (id)sfSession
{
  return self->_sfSession;
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SFDeviceSetupSessioniOS *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__SFDeviceSetupSessioniOS_proximitySetupCompletedWithResult___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __61__SFDeviceSetupSessioniOS_proximitySetupCompletedWithResult___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v6;
  void *v7;
  void *v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "accountType");
  switch(v2)
  {
    case 0:
      if (gLogCategory_SFDeviceSetupSessioniOS <= 50
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(a1 + 32), "authResults");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "familyMember");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      goto LABEL_14;
    case 2:
      if (gLogCategory_SFDeviceSetupSessioniOS <= 90
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(a1 + 32), "error");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 152) = 7;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), 2001);
      break;
    case 1:
      if (gLogCategory_SFDeviceSetupSessioniOS <= 50
        && (gLogCategory_SFDeviceSetupSessioniOS != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(a1 + 32), "authResults");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personalAccount");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
LABEL_14:
      *(_DWORD *)(*(_QWORD *)(a1 + 40) + 152) = 4;
      (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), 2001);
      break;
  }
  return objc_msgSend(*(id *)(a1 + 40), "_run");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (RPFileTransferSession)fileTransferSessionTemplate
{
  return self->_fileTransferSessionTemplate;
}

- (void)setFileTransferSessionTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (unsigned)pairFlags
{
  return self->_pairFlags;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (BOOL)supportsDependentSetup
{
  return self->_supportsDependentSetup;
}

- (void)setSupportsDependentSetup:(BOOL)a3
{
  self->_supportsDependentSetup = a3;
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)receivedObjectHandler
{
  return self->_receivedObjectHandler;
}

- (void)setReceivedObjectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_fileTransferSessionTemplate, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_dependentSetupSession, 0);
  objc_storeStrong((id *)&self->_cdpController, 0);
  objc_storeStrong((id *)&self->_cdpContext, 0);
  objc_storeStrong((id *)&self->_oneTimeCodeAccelerator, 0);
  objc_storeStrong((id *)&self->_secureESIMTransferController, 0);
  objc_storeStrong((id *)&self->_eSIMClient, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_resumePassword, 0);
  objc_storeStrong((id *)&self->_resumeDiscovery, 0);
  objc_storeStrong((id *)&self->_resumeAuthTag, 0);
  objc_storeStrong((id *)&self->_buddySession, 0);
}

@end
