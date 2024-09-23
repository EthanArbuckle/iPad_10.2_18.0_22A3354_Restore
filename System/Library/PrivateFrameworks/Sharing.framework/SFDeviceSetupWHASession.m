@implementation SFDeviceSetupWHASession

- (SFDeviceSetupWHASession)init
{
  SFDeviceSetupWHASession *v2;
  SFDeviceSetupWHASession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFDeviceSetupWHASession;
  v2 = -[SFDeviceSetupWHASession init](&v7, sel_init);
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
  SFDeviceSetupWHASession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFDeviceSetupWHASession *)FatalErrorF();
    -[SFDeviceSetupWHASession _cleanup](v3, v4);
  }
  else
  {
    -[SFDeviceSetupWHASession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFDeviceSetupWHASession;
    -[SFDeviceSetupWHASession dealloc](&v5, sel_dealloc);
  }
}

- (void)_cleanup
{
  TROperationQueue *trOperationQueue;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *trOperations;
  TRSession *trSession;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  SFDeviceOperationHomeKitSetup *homeKitSetup;
  SFSession *sfSession;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v16;
  UIViewController *presentingViewController;
  id promptForHomeHandler;
  id promptForPINHandler;
  id promptForRoomHandler;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_trOperations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v9, "cancel", (_QWORD)v21);
        objc_msgSend(v9, "setCompletionBlock:", 0);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_trOperations, "removeAllObjects");
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  -[SFDeviceOperationCDPSetup invalidate](self->_cdpSetupOperation, "invalidate");
  cdpSetupOperation = self->_cdpSetupOperation;
  self->_cdpSetupOperation = 0;

  -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetup, "invalidate");
  homeKitSetup = self->_homeKitSetup;
  self->_homeKitSetup = 0;

  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    v16 = self->_progressHandler;
  }
  else
  {
    v16 = 0;
  }
  self->_progressHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

  promptForHomeHandler = self->_promptForHomeHandler;
  self->_promptForHomeHandler = 0;

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
  block[2] = __35__SFDeviceSetupWHASession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFDeviceSetupWHASession_activate__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = CFPrefs_GetInt64() != 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 164) = CFPrefs_GetInt64() != 0;
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[25];
  if (v3)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v3 + 16))(v2[25], 10, 0);
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
  block[2] = __37__SFDeviceSetupWHASession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFDeviceSetupWHASession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
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
  v7[2] = __45__SFDeviceSetupWHASession_homeKitSelectHome___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __45__SFDeviceSetupWHASession_homeKitSelectHome___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "selectHome:", *(_QWORD *)(a1 + 40));
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
  v7[2] = __45__SFDeviceSetupWHASession_homeKitSelectRoom___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __45__SFDeviceSetupWHASession_homeKitSelectRoom___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "selectRoom:", *(_QWORD *)(a1 + 40));
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
  v7[2] = __43__SFDeviceSetupWHASession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __43__SFDeviceSetupWHASession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
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
  id v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    v14 = v6;
    LogPrintF();
  }
  progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
  if (progressHandler)
  {
    v17 = CFSTR("eo");
    v8 = v6;
    if (!v6)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2F90];
      v15 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v11 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v11;
      v12 = CFSTR("?");
      if (v11)
        v12 = (const __CFString *)v11;
      v16 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1, v14);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -6700, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v18[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1, v14, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    progressHandler[2](progressHandler, 30, v13);

    if (!v6)
    {

    }
  }

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

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = -[SFDeviceSetupWHASession _runSFSessionStart](self, "_runSFSessionStart");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[SFDeviceSetupWHASession _runPairVerify](self, "_runPairVerify");
      if (v4 == 4 || v4 == 2)
      {
        if (self->_sessionSecured
          || (v11 = -[SFDeviceSetupWHASession _runPairSetup](self, "_runPairSetup"), v11 == 4)
          || v11 == 2)
        {
          v5 = -[SFDeviceSetupWHASession _runInfoExchange](self, "_runInfoExchange");
          if (v5 == 4 || v5 == 2)
          {
            v6 = -[SFDeviceSetupWHASession _runTRSessionStart](self, "_runTRSessionStart");
            if (v6 == 4 || v6 == 2)
            {
              if (!self->_trSetupConfigurationEnabled
                || (v7 = -[SFDeviceSetupWHASession _runTRSetupConfiguration](self, "_runTRSetupConfiguration"), v7 == 4)
                || v7 == 2)
              {
                if (!self->_trAuthenticationEnabled
                  || (v8 = -[SFDeviceSetupWHASession _runTRAuthentication](self, "_runTRAuthentication"), v8 == 4)
                  || v8 == 2)
                {
                  v9 = -[SFDeviceSetupWHASession _runHomeKitSetup](self, "_runHomeKitSetup");
                  if (v9 == 4 || v9 == 2)
                  {
                    if (!self->_cdpEnabled
                      || (self->_peerProblemsFlags & 0x20000) == 0
                      || (v10 = -[SFDeviceSetupWHASession _runCDPSetup](self, "_runCDPSetup"), v10 == 4)
                      || v10 == 2)
                    {
                      -[SFDeviceSetupWHASession _runFinish](self, "_runFinish");
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

- (int)_runSFSessionStart
{
  int sfSessionState;
  SFSession *v4;
  SFSession *sfSession;
  uint64_t v6;
  SFSession *v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_sfSessionState = 1;
      -[SFSession invalidate](self->_sfSession, "invalidate");
      v4 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v4;

      -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("WHASetup"));
      -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
      -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.WHASetup"));
      -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 1);
      -[SFSession setTouchRemoteEnabled:](self->_sfSession, "setTouchRemoteEnabled:", 1);
      v6 = MEMORY[0x1E0C809B0];
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke;
      v12[3] = &unk_1E482DFF0;
      v12[4] = self;
      -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v12);
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_2;
      v11[3] = &unk_1E482DF78;
      v11[4] = self;
      -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v11);
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_3;
      v10[3] = &unk_1E482DF78;
      v10[4] = self;
      -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", v10);
      if (self->_promptForPINHandler)
        -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:");
      v7 = self->_sfSession;
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_4;
      v9[3] = &unk_1E482DFF0;
      v9[4] = self;
      -[SFSession activateWithCompletion:](v7, "activateWithCompletion:", v9);
    }
  }
  return self->_sfSessionState;
}

void __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_SFDeviceSetupWHASession <= 60)
  {
    if (gLogCategory_SFDeviceSetupWHASession != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3, v5);

}

void __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_2(uint64_t a1)
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
  objc_msgSend(v1, "_reportError:", v8);

}

void __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  _BYTE *v1;
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
  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[9])
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
    objc_msgSend(v1, "_reportError:", v8);

  }
}

uint64_t __45__SFDeviceSetupWHASession__runSFSessionStart__block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v2 + 24) = 3;
    return objc_msgSend(*(id *)(a1 + 32), "_reportError:", a2);
  }
  else
  {
    *(_DWORD *)(v2 + 24) = 4;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
}

- (int)_runPairVerify
{
  int pairVerifyState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFSession *sfSession;
  _QWORD v7[5];

  pairVerifyState = self->_pairVerifyState;
  if (pairVerifyState != 4)
  {
    if (pairVerifyState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      self->_pairVerifyState = 1;
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 60, 0);
      sfSession = self->_sfSession;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __41__SFDeviceSetupWHASession__runPairVerify__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v7);
    }
  }
  return self->_pairVerifyState;
}

void __41__SFDeviceSetupWHASession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(_QWORD *)(a1 + 32);
    v3 = a1 + 32;
    *(_DWORD *)(v4 + 32) = 2;
    goto LABEL_13;
  }
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = *(_QWORD *)(a1 + 32);
  v3 = a1 + 32;
  *(_BYTE *)(v5 + 28) = 1;
  *(_DWORD *)(*(_QWORD *)v3 + 32) = 4;
  v6 = *(void **)v3;
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 200);
  if (v7)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(*(_QWORD *)(*(_QWORD *)v3 + 200), 70, 0);
LABEL_13:
    v6 = *(void **)v3;
  }
  objc_msgSend(v6, "_run");

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
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
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
      v7[2] = __40__SFDeviceSetupWHASession__runPairSetup__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", 8, v7);
    }
  }
  return self->_pairSetupState;
}

void __40__SFDeviceSetupWHASession__runPairSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  if (v3)
  {
    *(_DWORD *)(v4 + 36) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3);
  }
  else
  {
    *(_BYTE *)(v4 + 28) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 36) = 4;
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[25];
    if (v6)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(v5[25], 70, 0);
      v5 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v5, "_run");
  }

}

- (int)_runInfoExchange
{
  int infoExchangeState;

  infoExchangeState = self->_infoExchangeState;
  if (infoExchangeState != 4 && infoExchangeState != 2)
  {
    if (infoExchangeState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_infoExchangeState = 1;
      -[SFDeviceSetupWHASession _runInfoExchangeRequest](self, "_runInfoExchangeRequest");
    }
  }
  return self->_infoExchangeState;
}

- (void)_runInfoExchangeRequest
{
  id v3;
  SFSession *sfSession;
  id v5;
  _QWORD v6[5];

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    v5 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SFDeviceSetupWHASession__runInfoExchangeRequest__block_invoke;
  v6[3] = &unk_1E482E320;
  v6[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_info"), 0, v3, v6, v5);

}

uint64_t __50__SFDeviceSetupWHASession__runInfoExchangeRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runInfoExchangeResponse:error:", a4, a2);
}

- (void)_runInfoExchangeResponse:(id)a3 error:(id)a4
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
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      v11 = v6;
      LogPrintF();
    }
    v12 = 0;
    v10 = -[SFDeviceSetupWHASession _verifyiCloudMatch:error:](self, "_verifyiCloudMatch:error:", CFDictionaryGetInt64(), &v12);
    v9 = v12;
    if (v10)
    {
      self->_peerFeatureFlags = CFDictionaryGetInt64();
      self->_peerProblemsFlags = CFDictionaryGetInt64();
      self->_infoExchangeState = 4;
      -[SFDeviceSetupWHASession _run](self, "_run");
LABEL_14:

      goto LABEL_15;
    }
    self->_infoExchangeState = 3;
LABEL_13:
    -[SFDeviceSetupWHASession _reportError:](self, "_reportError:", v9, v11);
    goto LABEL_14;
  }
  self->_infoExchangeState = 3;
  if (!v7)
  {
    NSErrorWithOSStatusF();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[SFDeviceSetupWHASession _reportError:](self, "_reportError:", v7);
LABEL_15:

}

- (int)_runTRSessionStart
{
  int trSessionState;
  TRSession *v4;
  TRSession *trSession;
  TROperationQueue *v6;
  TROperationQueue *trOperationQueue;
  NSMutableArray *v8;
  NSMutableArray *trOperations;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  trSessionState = self->_trSessionState;
  if (trSessionState == 4)
    return self->_trSessionState;
  if (!trSessionState)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_trSessionState = 1;
    -[SFSession trSession](self->_sfSession, "trSession");
    v4 = (TRSession *)objc_claimAutoreleasedReturnValue();
    trSession = self->_trSession;
    self->_trSession = v4;

    if (self->_trSession)
    {
      v6 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass_3[0]());
      trOperationQueue = self->_trOperationQueue;
      self->_trOperationQueue = v6;

      if (self->_trOperationQueue)
      {
        v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
        trOperations = self->_trOperations;
        self->_trOperations = v8;

        self->_trSessionState = 4;
        return self->_trSessionState;
      }
      if (gLogCategory_SFDeviceSetupWHASession > 90
        || gLogCategory_SFDeviceSetupWHASession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
    }
    else if (gLogCategory_SFDeviceSetupWHASession > 90
           || gLogCategory_SFDeviceSetupWHASession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_25;
    }
    LogPrintF();
LABEL_25:
    self->_trSessionState = 3;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0CB2F90];
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    v15 = CFSTR("?");
    if (v13)
      v15 = (const __CFString *)v13;
    v19[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6700, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDeviceSetupWHASession _reportError:](self, "_reportError:", v17);

    return self->_trSessionState;
  }
  if (gLogCategory_SFDeviceSetupWHASession <= 30
    && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runTRSetupConfiguration
{
  int trSetupConfigurationState;
  void *v4;
  id v5;
  _QWORD v7[5];
  id v8;

  trSetupConfigurationState = self->_trSetupConfigurationState;
  if (trSetupConfigurationState != 4)
  {
    if (trSetupConfigurationState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trSetupConfigurationState = 1;
      v4 = (void *)objc_msgSend(objc_alloc((Class)getTRSetupConfigurationOperationClass_0[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v4);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke;
      v7[3] = &unk_1E482D3A0;
      v7[4] = self;
      v8 = v4;
      v5 = v4;
      objc_msgSend(v5, "setCompletionBlock:", v7);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v5);

    }
  }
  return self->_trSetupConfigurationState;
}

void __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 176);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __51__SFDeviceSetupWHASession__runTRSetupConfiguration__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "result");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      getTRSetupConfigurationOperationUnauthenticatedServicesKey_0[0]();
      CFSetGetTypeID();
      CFDictionaryGetTypedValue();
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 104);
      *(_QWORD *)(v3 + 104) = v2;

      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        v6 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v6);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFDeviceSetupWHASession <= 60
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        v6 = v5;
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v5, v6);

    }
  }
}

- (int)_runTRAuthentication
{
  int trAuthenticationState;
  void *v4;
  id v5;
  _QWORD v7[5];
  id v8;

  trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState != 4)
  {
    if (trAuthenticationState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_trAuthenticationState = 1;
      v4 = (void *)objc_msgSend(objc_alloc((Class)getTRAuthenticationOperationClass_2[0]()), "initWithSession:", self->_trSession);
      -[NSMutableArray addObject:](self->_trOperations, "addObject:", v4);
      objc_msgSend(v4, "setTargetedServices:", self->_trUnauthServices);
      if (self->_presentingViewController)
        objc_msgSend(v4, "setPresentingViewController:");
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke;
      v7[3] = &unk_1E482D3A0;
      v7[4] = self;
      v8 = v4;
      v5 = v4;
      objc_msgSend(v5, "setCompletionBlock:", v7);
      -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v5);

    }
  }
  return self->_trAuthenticationState;
}

void __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  id v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(v1 + 176);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke_2;
  v4[3] = &unk_1E482D3A0;
  v4[4] = v1;
  v5 = v2;
  dispatch_async(v3, v4);

}

void __47__SFDeviceSetupWHASession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "result");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run");
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "error");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFDeviceSetupWHASession <= 60
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        v3 = v2;
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 116) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v2, v3, 0);

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
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
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
      v8[2] = __39__SFDeviceSetupWHASession__runCDPSetup__block_invoke;
      v8[3] = &unk_1E482DFF0;
      v8[4] = self;
      -[SFDeviceOperationCDPSetup setCompletionHandler:](self->_cdpSetupOperation, "setCompletionHandler:", v8);
      -[SFDeviceOperationCDPSetup activate](self->_cdpSetupOperation, "activate");
    }
  }
  return self->_cdpState;
}

void __39__SFDeviceSetupWHASession__runCDPSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 128);
  if (v5)
  {
    v10 = v3;
    if (v3)
    {
      *(_DWORD *)(v4 + 144) = 3;
      v6 = *(void **)(a1 + 32);
      SFNestedErrorF();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_reportError:", v7);

    }
    else
    {
      objc_msgSend(v5, "metricSeconds");
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = v8;
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 144) = 4;
      objc_msgSend(*(id *)(a1 + 32), "_run", v9);
    }
    v3 = v10;
  }

}

- (int)_runHomeKitSetup
{
  int homeKitState;
  SFDeviceOperationHomeKitSetup *v4;
  SFDeviceOperationHomeKitSetup *homeKitSetup;
  _QWORD v7[5];

  homeKitState = self->_homeKitState;
  if (homeKitState != 4)
  {
    if (homeKitState)
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFDeviceSetupWHASession <= 30
        && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homeKitState = 1;
      -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetup, "invalidate");
      v4 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetup = self->_homeKitSetup;
      self->_homeKitSetup = v4;

      -[SFDeviceOperationHomeKitSetup setDispatchQueue:](self->_homeKitSetup, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHomeKitSetup setUserInteractive:](self->_homeKitSetup, "setUserInteractive:", 1);
      -[SFDeviceOperationHomeKitSetup setTrSession:](self->_homeKitSetup, "setTrSession:", self->_trSession);
      if (self->_homeKitDoFullSetup)
      {
        if (self->_promptForHomeHandler)
          -[SFDeviceOperationHomeKitSetup setPromptForHomeHandler:](self->_homeKitSetup, "setPromptForHomeHandler:");
        if (self->_promptForRoomHandler)
          -[SFDeviceOperationHomeKitSetup setPromptForRoomHandler:](self->_homeKitSetup, "setPromptForRoomHandler:");
      }
      else
      {
        -[SFDeviceOperationHomeKitSetup setKeyExchangeOnly:](self->_homeKitSetup, "setKeyExchangeOnly:", 1);
      }
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __43__SFDeviceSetupWHASession__runHomeKitSetup__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetup, "setCompletionHandler:", v7);
      -[SFDeviceOperationHomeKitSetup activate](self->_homeKitSetup, "activate");
    }
  }
  return self->_homeKitState;
}

void __43__SFDeviceSetupWHASession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 152);
  if (v5)
  {
    v13 = v3;
    if (v3)
    {
      if ((*(_BYTE *)(v4 + 49) & 2) == 0)
      {
        *(_DWORD *)(v4 + 160) = 3;
        objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3);
LABEL_16:
        v3 = v13;
        goto LABEL_17;
      }
      if (gLogCategory_SFDeviceSetupWHASession > 90)
        goto LABEL_14;
      if (gLogCategory_SFDeviceSetupWHASession == -1)
      {
        v10 = _LogCategory_Initialize();
        v4 = *(_QWORD *)(a1 + 32);
        if (!v10)
          goto LABEL_14;
        v5 = *(void **)(v4 + 152);
      }
      objc_msgSend(v5, "metricNonUserSeconds");
      v12 = v13;
      v11 = v7;
      LogPrintF();
      v4 = *(_QWORD *)(a1 + 32);
LABEL_14:
      v9 = 2;
      goto LABEL_15;
    }
    if (gLogCategory_SFDeviceSetupWHASession <= 30)
    {
      if (gLogCategory_SFDeviceSetupWHASession == -1)
      {
        v8 = _LogCategory_Initialize();
        v4 = *(_QWORD *)(a1 + 32);
        if (!v8)
          goto LABEL_12;
        v5 = *(void **)(v4 + 152);
      }
      objc_msgSend(v5, "metricNonUserSeconds");
      v11 = v6;
      LogPrintF();
      v4 = *(_QWORD *)(a1 + 32);
    }
LABEL_12:
    v9 = 4;
LABEL_15:
    *(_DWORD *)(v4 + 160) = v9;
    objc_msgSend(*(id *)(a1 + 32), "_run", v11, v12);
    goto LABEL_16;
  }
LABEL_17:

}

- (int)_runFinish
{
  int result;
  id v4;
  SFSession *sfSession;
  _QWORD v6[5];

  result = self->_finishState;
  if (!result)
  {
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_finishState = 1;
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E4890AD8, CFSTR("op"));
    sfSession = self->_sfSession;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __37__SFDeviceSetupWHASession__runFinish__block_invoke;
    v6[3] = &unk_1E4830078;
    v6[4] = self;
    -[SFSession sendRequestWithFlags:object:responseHandler:](sfSession, "sendRequestWithFlags:object:responseHandler:", 1, v4, v6);
    self->_finishState = 4;

    return self->_finishState;
  }
  return result;
}

void __37__SFDeviceSetupWHASession__runFinish__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  int Int64Ranged;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    goto LABEL_19;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!Int64Ranged)
    goto LABEL_20;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2F90];
  v11 = Int64Ranged;
  v17 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("?");
  if (v12)
    v14 = (const __CFString *)v12;
  v18[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v15);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_19:
    if (gLogCategory_SFDeviceSetupWHASession <= 50
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      v16 = v6;
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v16, v17);

  }
  else
  {
LABEL_20:
    if (gLogCategory_SFDeviceSetupWHASession <= 30
      && (gLogCategory_SFDeviceSetupWHASession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_cleanup");
  }

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)promptForHomeHandler
{
  return self->_promptForHomeHandler;
}

- (void)setPromptForHomeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)promptForRoomHandler
{
  return self->_promptForRoomHandler;
}

- (void)setPromptForRoomHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForRoomHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_promptForHomeHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_homeKitSetup, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_trUnauthServices, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
