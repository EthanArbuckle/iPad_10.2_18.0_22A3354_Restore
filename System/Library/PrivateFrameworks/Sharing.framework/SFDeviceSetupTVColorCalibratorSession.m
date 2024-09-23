@implementation SFDeviceSetupTVColorCalibratorSession

- (SFDeviceSetupTVColorCalibratorSession)init
{
  SFDeviceSetupTVColorCalibratorSession *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  SFDeviceSetupTVColorCalibratorSession *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupTVColorCalibratorSession;
  v2 = -[SFDeviceSetupTVColorCalibratorSession init](&v7, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)_cleanup
{
  TVLDisplayColorCalibrator *tvColorCalibrator;
  SFSession *sfSession;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v6;
  id promptForPINHandler;
  TVLDisplayColorCalibrator *v8;

  v8 = self->_tvColorCalibrator;
  tvColorCalibrator = self->_tvColorCalibrator;
  self->_tvColorCalibrator = 0;

  -[TVLDisplayColorCalibrator invalidate](v8, "invalidate");
  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    v6 = self->_progressHandler;
  }
  else
  {
    v6 = 0;
  }
  self->_progressHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupTVColorCalibratorSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SFDeviceSetupTVColorCalibratorSession_activate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = mach_absolute_time();
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[10];
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(v2[10], 10, 0);
    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SFDeviceSetupTVColorCalibratorSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __51__SFDeviceSetupTVColorCalibratorSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16)
    && gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)_reportError:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  void (**progressHandler)(id, uint64_t, void *);
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint64_t v25;
  const __CFString *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 60
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    v22 = v6;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v27 = CFSTR("eo");
    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2F90];
      v25 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v11 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v11;
      if (v11)
        v12 = (const __CFString *)v11;
      else
        v12 = CFSTR("?");
      v26 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1, v22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -6700, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v22);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 30, v13);

    if (!v6)
    {

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code", v22, CFSTR("errCode")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v23[1] = CFSTR("errDomain");
  objc_msgSend(v6, "domain");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("?");
  v24[1] = v17;
  v24[2] = MEMORY[0x1E0C9AAA0];
  v23[2] = CFSTR("success");
  v23[3] = CFSTR("totalMs");
  v18 = (void *)MEMORY[0x1E0CB37E8];
  mach_absolute_time();
  objc_msgSend(v18, "numberWithUnsignedLongLong:", UpTicksToMilliseconds());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("triggerMs");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_triggerMs);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.TVLatencyResult"), v21);

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
  v7[2] = __57__SFDeviceSetupTVColorCalibratorSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __57__SFDeviceSetupTVColorCalibratorSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)tryAgain
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SFDeviceSetupTVColorCalibratorSession_tryAgain__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __49__SFDeviceSetupTVColorCalibratorSession_tryAgain__block_invoke(uint64_t a1)
{
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "calibrate");
}

- (void)_run
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  id v10;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = -[SFDeviceSetupTVColorCalibratorSession _runSFSessionStart](self, "_runSFSessionStart");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[SFDeviceSetupTVColorCalibratorSession _runPairVerify:](self, "_runPairVerify:", 0);
      if (v4 == 4 || v4 == 2)
      {
        if (self->_sessionSecured
          || ((v5 = -[SFDeviceSetupTVColorCalibratorSession _runPairVerify:](self, "_runPairVerify:", 1), v5 == 4)
           || v5 == 2)
          && (self->_sessionSecured
           || (v9 = -[SFDeviceSetupTVColorCalibratorSession _runPairSetup](self, "_runPairSetup"), v9 == 4)
           || v9 == 2))
        {
          v6 = -[SFDeviceSetupTVColorCalibratorSession _runTVLatencySetup](self, "_runTVLatencySetup");
          if (v6 == 4 || v6 == 2)
          {
            v7 = -[SFDeviceSetupTVColorCalibratorSession _runFinish](self, "_runFinish");
            if (v7 == 4 || v7 == 2)
            {
              v8 = _Block_copy(self->_progressHandler);
              if (v8)
              {
                v10 = v8;
                (*((void (**)(void *, uint64_t, _QWORD))v8 + 2))(v8, 96, 0);
                v8 = v10;
              }

            }
          }
        }
      }
    }
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState;
  SFSession *v5;
  SFSession *sfSession;
  uint64_t v7;
  void *v8;
  SFSession *v9;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4 && sfSessionState != 2)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_sfSessionState = 1;
      -[SFSession invalidate](self->_sfSession, "invalidate");
      v5 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v5;

      -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("TVLatency"));
      -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
      -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.AppleTVSetup"));
      -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 33);
      location = 0;
      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke;
      v19[3] = &unk_1E482E280;
      objc_copyWeak(&v20, &location);
      -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v19);
      v17[0] = v7;
      v17[1] = 3221225472;
      v17[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_2;
      v17[3] = &unk_1E482E2A8;
      objc_copyWeak(&v18, &location);
      -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v17);
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_3;
      v15[3] = &unk_1E482E2A8;
      objc_copyWeak(&v16, &location);
      -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", v15);
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_4;
      v13[3] = &unk_1E482E2A8;
      objc_copyWeak(&v14, &location);
      -[SFSession setSessionStartedHandler:](self->_sfSession, "setSessionStartedHandler:", v13);
      v8 = _Block_copy(self->_promptForPINHandler);
      if (v8)
        -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:", v8);

      v9 = self->_sfSession;
      v11[0] = v7;
      v11[1] = 3221225472;
      v11[2] = __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_5;
      v11[3] = &unk_1E482E280;
      objc_copyWeak(&v12, &location);
      -[SFSession activateWithCompletion:](v9, "activateWithCompletion:", v11);
      objc_destroyWeak(&v12);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
  return self->_sfSessionState;
}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && !WeakRetained[16])
    objc_msgSend(WeakRetained, "_reportError:", v5);

}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[16])
  {
    v3 = WeakRetained;
    NSErrorWithOSStatusF();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_reportError:", v2);

    WeakRetained = v3;
  }

}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[16])
  {
    v3 = WeakRetained;
    NSErrorWithOSStatusF();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_reportError:", v2);

    WeakRetained = v3;
  }

}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_4(uint64_t a1)
{
  _DWORD *WeakRetained;
  _DWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !*((_BYTE *)WeakRetained + 16) && WeakRetained[12] == 1)
  {
    WeakRetained[12] = 4;
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_run");
    WeakRetained = v2;
  }

}

void __59__SFDeviceSetupTVColorCalibratorSession__runSFSessionStart__block_invoke_5(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 16))
  {
    if (v5)
    {
      *((_DWORD *)WeakRetained + 12) = 3;
      objc_msgSend(WeakRetained, "_reportError:");
    }
    else
    {
      objc_msgSend(WeakRetained, "_runSFSessionActivated");
    }
  }

}

- (void)_runSFSessionActivated
{
  SFSession *sfSession;
  _QWORD v4[5];

  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SFDeviceSetupTVColorCalibratorSession__runSFSessionActivated__block_invoke;
  v4[3] = &unk_1E482E2D0;
  v4[4] = self;
  -[SFSession registerRequestID:options:handler:](sfSession, "registerRequestID:options:handler:", CFSTR("_sa"), &unk_1E4891138, v4);
  -[SFDeviceSetupTVColorCalibratorSession _run](self, "_run");
}

uint64_t __63__SFDeviceSetupTVColorCalibratorSession__runSFSessionActivated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSetupActionRequest:responseHandler:");
}

- (int)_runPairVerify:(BOOL)a3
{
  int pairVerifyState;
  __int16 v6;
  __CFString *v7;
  __CFString *v8;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  __CFString *v12;
  _QWORD v13[6];

  if (a3 && (-[SFSession sessionFlags](self->_sfSession, "sessionFlags") & 0x400) == 0)
  {
    -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", -[SFSession sessionFlags](self->_sfSession, "sessionFlags") | 0x400);
    self->_pairVerifyState = 0;
  }
  pairVerifyState = self->_pairVerifyState;
  if (pairVerifyState != 4 && pairVerifyState != 2)
  {
    if (pairVerifyState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v6 = -[SFSession sessionFlags](self->_sfSession, "sessionFlags");
      v7 = CFSTR("CUPairing");
      if ((v6 & 0x400) == 0)
        v7 = CFSTR("HomeKit");
      v8 = v7;
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        v12 = v8;
        LogPrintF();
      }
      self->_pairVerifyState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 60, 0);
      sfSession = self->_sfSession;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __56__SFDeviceSetupTVColorCalibratorSession__runPairVerify___block_invoke;
      v13[3] = &unk_1E482E2F8;
      v13[4] = self;
      v13[5] = v8;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v13, v12);

    }
  }
  return self->_pairVerifyState;
}

void __56__SFDeviceSetupTVColorCalibratorSession__runPairVerify___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 16))
  {
    v7 = v3;
    if (v3)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        v6 = *(_QWORD *)(a1 + 40);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = 2;
    }
    else
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        v6 = *(_QWORD *)(a1 + 40);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 24) = 4;
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 1;
      v4 = *(_QWORD **)(a1 + 32);
      v5 = v4[10];
      if (!v5)
        goto LABEL_15;
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v5 + 16))(v4[10], 70, 0);
    }
    v4 = *(_QWORD **)(a1 + 32);
LABEL_15:
    objc_msgSend(v4, "_run", v6);
    v3 = v7;
  }

}

- (int)_runPairSetup
{
  int pairSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  _QWORD v7[5];

  pairSetupState = self->_pairSetupState;
  if (pairSetupState != 4)
  {
    if (pairSetupState)
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      self->_pairSetupState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 60, 0);
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __54__SFDeviceSetupTVColorCalibratorSession__runPairSetup__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", 8, v7);
    }
  }
  return self->_pairSetupState;
}

void __54__SFDeviceSetupTVColorCalibratorSession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3);
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 20) = 4;
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[10];
    if (v5)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v5 + 16))(v4[10], 70, 0);
      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "_run");
  }

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
      -[SFDeviceSetupTVColorCalibratorSession _runTVColorCalibratorSetup](self, "_runTVColorCalibratorSetup");
      return self->_tvLatencySetupState;
    }
    goto LABEL_9;
  }
  if (!tvLatencySetupState)
  {
    -[SFDeviceSetupTVColorCalibratorSession _runTVLatencySetupRequest](self, "_runTVLatencySetupRequest");
    return self->_tvLatencySetupState;
  }
  if (tvLatencySetupState != 2)
  {
LABEL_9:
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return self->_tvLatencySetupState;
}

- (void)_runTVLatencySetupRequest
{
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  _QWORD v5[5];

  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
    progressHandler[2](progressHandler, 278, 0);
  self->_tvLatencySetupState = 10;
  sfSession = self->_sfSession;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SFDeviceSetupTVColorCalibratorSession__runTVLatencySetupRequest__block_invoke;
  v5[3] = &unk_1E482E320;
  v5[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_tvlS"), 0, MEMORY[0x1E0C9AA70], v5);
}

void __66__SFDeviceSetupTVColorCalibratorSession__runTVLatencySetupRequest__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v8 = a4;
  if (v14)
  {
    v10 = *(void **)(a1 + 32);
    v9 = (id *)(a1 + 32);
    NSErrorNestedF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_reportError:", v11);

    v12 = 3;
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      v13 = v8;
      LogPrintF();
    }
    v9 = (id *)(a1 + 32);
    v12 = 11;
  }
  *((_DWORD *)*v9 + 13) = v12;
  objc_msgSend(*v9, "_run", v13);

}

- (void)_runTVColorCalibratorSetup
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *);
  void *v10;
  SFDeviceSetupTVColorCalibratorSession *v11;
  id v12;

  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_tvLatencySetupState = 12;
  -[SFSession messageSessionTemplate](self->_sfSession, "messageSessionTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc((Class)getTVLDisplayColorCalibratorClass[0]()), "initWithMessageSession:", v3);
    objc_storeStrong((id *)&self->_tvColorCalibrator, v4);
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke;
    v10 = &unk_1E482E370;
    v11 = self;
    v12 = v4;
    v5 = v4;
    objc_msgSend(v5, "setProgressEventHandler:", &v7);
    objc_msgSend(v5, "activate", v7, v8, v9, v10, v11);
    objc_msgSend(v5, "calibrate");

  }
  else
  {
    NSErrorWithOSStatusF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceSetupTVColorCalibratorSession _reportError:](self, "_reportError:", v6);

    self->_tvLatencySetupState = 3;
  }

}

void __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke_2;
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

uint64_t __67__SFDeviceSetupTVColorCalibratorSession__runTVColorCalibratorSetup__block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 56))
    return objc_msgSend(*(id *)(result + 40), "_runTVColorCalibratorProgressEvent:info:", *(_QWORD *)(result + 56), *(_QWORD *)(result + 48));
  return result;
}

- (void)_runTVColorCalibratorProgressEvent:(unint64_t)a3 info:(id)a4
{
  void (**v6)(void *, uint64_t);
  void (**v7)(void *, uint64_t);
  void (*v8)(void *, uint64_t);
  uint64_t v9;
  void *v10;
  void *v11;
  TVLDisplayColorCalibrator *tvColorCalibrator;
  TVLDisplayColorCalibrator *v13;
  id v14;

  v14 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  switch(a3)
  {
    case 0uLL:
      v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      v7 = v6;
      if (!v6)
        goto LABEL_15;
      v8 = v6[2];
      v9 = 278;
      break;
    case 1uLL:
      v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      v7 = v6;
      if (!v6)
        goto LABEL_15;
      v8 = v6[2];
      v9 = 279;
      break;
    case 2uLL:
      v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      v7 = v6;
      if (!v6)
        goto LABEL_15;
      v8 = v6[2];
      v9 = 280;
      break;
    case 3uLL:
      v10 = _Block_copy(self->_progressHandler);
      v11 = v10;
      if (v10)
        (*((void (**)(void *, uint64_t, id))v10 + 2))(v10, 282, v14);

      tvColorCalibrator = self->_tvColorCalibrator;
      self->_tvColorCalibrator = 0;
      v13 = tvColorCalibrator;

      -[TVLDisplayColorCalibrator invalidate](v13, "invalidate");
      if (self->_tvLatencySetupState == 12)
      {
        self->_tvLatencySetupState = 4;
        -[SFDeviceSetupTVColorCalibratorSession _run](self, "_run");
      }
      goto LABEL_16;
    case 4uLL:
      v6 = (void (**)(void *, uint64_t))_Block_copy(self->_progressHandler);
      v7 = v6;
      if (!v6)
        goto LABEL_15;
      v8 = v6[2];
      v9 = 281;
      break;
    default:
      goto LABEL_16;
  }
  v8(v6, v9);
LABEL_15:

LABEL_16:
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
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
        && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_finishState = 1;
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__SFDeviceSetupTVColorCalibratorSession__runFinish__block_invoke;
      v7[3] = &unk_1E482E320;
      v7[4] = self;
      -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_finish"), 0, MEMORY[0x1E0C9AA70], v7);
    }
  }
  return self->_finishState;
}

void __51__SFDeviceSetupTVColorCalibratorSession__runFinish__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    v9 = v8;
    v10 = v11;
    LogPrintF();
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 4;
  objc_msgSend(*(id *)(a1 + 32), "_run", v9, v10);

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
  if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 30
    && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 0xA)
      v9 = "?";
    else
      v9 = off_1E482E390[(int)Int64Ranged];
    v14 = (uint64_t)v9;
    v15 = v16;
    LogPrintF();
  }
  if ((_DWORD)Int64Ranged == 7)
  {
    progressHandler = self->_progressHandler;
    if (progressHandler)
    {
      v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
      v12 = 278;
      goto LABEL_15;
    }
  }
  else if ((_DWORD)Int64Ranged == 1)
  {
    progressHandler = self->_progressHandler;
    if (progressHandler)
    {
      v11 = (void (*)(_QWORD *, uint64_t))progressHandler[2];
      v12 = 400;
LABEL_15:
      v11(progressHandler, v12);
    }
  }
  else
  {
    if (gLogCategory_SFDeviceSetupTVColorCalibratorSession <= 60
      && (gLogCategory_SFDeviceSetupTVColorCalibratorSession != -1 || _LogCategory_Initialize()))
    {
      if (Int64Ranged > 0xA)
        v13 = "?";
      else
        v13 = off_1E482E3E8[(int)Int64Ranged];
      v14 = Int64Ranged;
      v15 = v13;
      LogPrintF();
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E4890700, CFSTR("er"), v14, v15);
  }
  (*((void (**)(id, _QWORD, _QWORD, id))v6 + 2))(v6, 0, 0, v7);

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)triggerMs
{
  return self->_triggerMs;
}

- (void)setTriggerMs:(unint64_t)a3
{
  self->_triggerMs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_tvColorCalibrator, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
