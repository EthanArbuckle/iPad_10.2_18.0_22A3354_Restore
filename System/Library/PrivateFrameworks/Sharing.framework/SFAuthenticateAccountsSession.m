@implementation SFAuthenticateAccountsSession

- (SFAuthenticateAccountsSession)init
{
  SFAuthenticateAccountsSession *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v5;
  ACAccountStore *accountStore;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFAuthenticateAccountsSession;
  v2 = -[SFAuthenticateAccountsSession init](&v8, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v5 = objc_claimAutoreleasedReturnValue();
    accountStore = v2->_accountStore;
    v2->_accountStore = (ACAccountStore *)v5;

  }
  return v2;
}

- (void)dealloc
{
  SFAuthenticateAccountsSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFAuthenticateAccountsSession *)FatalErrorF();
    -[SFAuthenticateAccountsSession _cleanup](v3, v4);
  }
  else
  {
    -[SFAuthenticateAccountsSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFAuthenticateAccountsSession;
    -[SFAuthenticateAccountsSession dealloc](&v5, sel_dealloc);
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
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  SFSession *sfSession;
  void (**progressHandler)(id, uint64_t, _QWORD);
  id v15;
  UIViewController *presentingViewController;
  id promptForPINHandler;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  self->_targetedAccountTypes = 0;
  -[TROperationQueue invalidate](self->_trOperationQueue, "invalidate");
  trOperationQueue = self->_trOperationQueue;
  self->_trOperationQueue = 0;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_trOperations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "cancel", (_QWORD)v18);
        objc_msgSend(v9, "setCompletionBlock:", 0);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }

  -[NSMutableArray removeAllObjects](self->_trOperations, "removeAllObjects");
  trOperations = self->_trOperations;
  self->_trOperations = 0;

  trSession = self->_trSession;
  self->_trSession = 0;

  -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
  homeKitSetupOperation = self->_homeKitSetupOperation;
  self->_homeKitSetupOperation = 0;

  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (progressHandler)
  {
    progressHandler[2](progressHandler, 20, 0);
    v15 = self->_progressHandler;
  }
  else
  {
    v15 = 0;
  }
  self->_progressHandler = 0;

  presentingViewController = self->_presentingViewController;
  self->_presentingViewController = 0;

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
  block[2] = __41__SFAuthenticateAccountsSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __41__SFAuthenticateAccountsSession_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  id v7;

  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = mach_absolute_time();
  objc_msgSend((Class)getHMHomeManagerConfigurationClass[0](), "defaultPrivateConfiguration");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(objc_alloc((Class)getHMHomeManagerClass[0]()), "initWithHomeMangerConfiguration:", v7);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 112);
  *(_QWORD *)(v3 + 112) = v2;

  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[27];
  if (v6)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(v5[27], 10, 0);
    v5 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v5, "_run");

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__SFAuthenticateAccountsSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __43__SFAuthenticateAccountsSession_invalidate__block_invoke(uint64_t a1)
{
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
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
  v7[2] = __49__SFAuthenticateAccountsSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __49__SFAuthenticateAccountsSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
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

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v3 = -[SFAuthenticateAccountsSession _validateAccounts](self, "_validateAccounts");
    if (v3 == 4 || v3 == 2)
    {
      v4 = -[SFAuthenticateAccountsSession _validateiCloudAccountTerms](self, "_validateiCloudAccountTerms");
      if (v4 == 4 || v4 == 2)
      {
        v5 = -[SFAuthenticateAccountsSession _runSFSessionStart](self, "_runSFSessionStart");
        if (v5 == 4 || v5 == 2)
        {
          v6 = -[SFAuthenticateAccountsSession _runPairVerify](self, "_runPairVerify");
          if (v6 == 4 || v6 == 2)
          {
            if (self->_sessionSecured
              || (v12 = -[SFAuthenticateAccountsSession _runPairSetup](self, "_runPairSetup"), v12 == 4)
              || v12 == 2)
            {
              v7 = -[SFAuthenticateAccountsSession _runInfoExchange](self, "_runInfoExchange");
              if (v7 == 4 || v7 == 2)
              {
                v8 = -[SFAuthenticateAccountsSession _runTRSessionStart](self, "_runTRSessionStart");
                if (v8 == 4 || v8 == 2)
                {
                  if (!self->_trAuthenticationEnabled
                    || (v9 = -[SFAuthenticateAccountsSession _runTRAuthentication](self, "_runTRAuthentication"), v9 == 4)
                    || v9 == 2)
                  {
                    if ((self->_problemFlags & 0x20000) == 0 && !self->_isSigningInNewiCloud
                      || (v10 = -[SFAuthenticateAccountsSession _runRepairCDP](self, "_runRepairCDP"), v10 == 4)
                      || v10 == 2)
                    {
                      if ((self->_problemFlags & 8) == 0
                        || (v11 = -[SFAuthenticateAccountsSession _runHomeKitSetup](self, "_runHomeKitSetup"), v11 == 4)
                        || v11 == 2)
                      {
                        -[SFAuthenticateAccountsSession _runFinish](self, "_runFinish");
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
  if (gLogCategory_SFAuthenticateAccountsSession <= 90
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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

- (int)_runSFSessionStart
{
  int sfSessionState;
  SFSession *v4;
  SFSession *sfSession;
  uint64_t v6;
  SFSession *v7;
  SFSession *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  id location;

  sfSessionState = self->_sfSessionState;
  if (sfSessionState != 4)
  {
    if (sfSessionState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_sfSessionState = 1;
      -[SFSession invalidate](self->_sfSession, "invalidate");
      v4 = objc_alloc_init(SFSession);
      sfSession = self->_sfSession;
      self->_sfSession = v4;

      -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
      -[SFSession setLabel:](self->_sfSession, "setLabel:", CFSTR("AuthenticateAccounts"));
      -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
      -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.AuthenticateAccounts"));
      -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 4097);
      -[SFSession setTouchRemoteEnabled:](self->_sfSession, "setTouchRemoteEnabled:", 1);
      location = 0;
      objc_initWeak(&location, self);
      v6 = MEMORY[0x1E0C809B0];
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke;
      v16[3] = &unk_1E482E280;
      objc_copyWeak(&v17, &location);
      -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v16);
      v14[0] = v6;
      v14[1] = 3221225472;
      v14[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_2;
      v14[3] = &unk_1E482E2A8;
      objc_copyWeak(&v15, &location);
      -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v14);
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_3;
      v12[3] = &unk_1E482E2A8;
      objc_copyWeak(&v13, &location);
      -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", v12);
      if (self->_promptForPINHandler)
        -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:");
      v7 = self->_sfSession;
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_4;
      v11[3] = &unk_1E482E2D0;
      v11[4] = self;
      -[SFSession registerRequestID:options:handler:](v7, "registerRequestID:options:handler:", CFSTR("_aaTerms"), 0, v11);
      v8 = self->_sfSession;
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_5;
      v10[3] = &unk_1E482DFF0;
      v10[4] = self;
      -[SFSession activateWithCompletion:](v8, "activateWithCompletion:", v10);
      objc_destroyWeak(&v13);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return self->_sfSessionState;
}

void __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (gLogCategory_SFAuthenticateAccountsSession <= 90
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reportError:", v4);

}

void __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
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
  objc_msgSend(WeakRetained, "_reportError:", v8);

}

void __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_3(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained && !*((_BYTE *)WeakRetained + 9))
  {
    v4 = objc_loadWeakRetained(v1);
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2F90];
    v12 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("?");
    if (v7)
      v9 = (const __CFString *)v7;
    v13[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, -6736, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_reportError:", v11);

  }
}

uint64_t __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleShowTermsUI:responseHandler:");
}

uint64_t __51__SFAuthenticateAccountsSession__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    *(_DWORD *)(v2 + 64) = 3;
    return objc_msgSend(*(id *)(a1 + 32), "_reportError:", a2);
  }
  else
  {
    *(_DWORD *)(v2 + 64) = 4;
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
      v7[2] = __47__SFAuthenticateAccountsSession__runPairVerify__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFSession pairVerifyWithFlags:completion:](sfSession, "pairVerifyWithFlags:completion:", 8, v7);
    }
  }
  return self->_pairVerifyState;
}

void __47__SFAuthenticateAccountsSession__runPairVerify__block_invoke(uint64_t a1, void *a2)
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
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v4 = *(_QWORD *)(a1 + 32);
    v3 = a1 + 32;
    *(_DWORD *)(v4 + 72) = 2;
    goto LABEL_13;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5 = *(_QWORD *)(a1 + 32);
  v3 = a1 + 32;
  *(_BYTE *)(v5 + 68) = 1;
  *(_DWORD *)(*(_QWORD *)v3 + 72) = 4;
  v6 = *(void **)v3;
  v7 = *(_QWORD *)(*(_QWORD *)v3 + 216);
  if (v7)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(*(_QWORD *)(*(_QWORD *)v3 + 216), 70, 0);
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
      v7[2] = __46__SFAuthenticateAccountsSession__runPairSetup__block_invoke;
      v7[3] = &unk_1E482DFF0;
      v7[4] = self;
      -[SFSession pairSetupWithFlags:completion:](sfSession, "pairSetupWithFlags:completion:", 8, v7);
    }
  }
  return self->_pairSetupState;
}

void __46__SFAuthenticateAccountsSession__runPairSetup__block_invoke(uint64_t a1, void *a2)
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
    *(_DWORD *)(v4 + 76) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v3);
  }
  else
  {
    *(_BYTE *)(v4 + 68) = 1;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 76) = 4;
    v5 = *(_QWORD **)(a1 + 32);
    v6 = v5[27];
    if (v6)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(v5[27], 70, 0);
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
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_infoExchangeState = 1;
      -[SFAuthenticateAccountsSession _runInfoExchangeRequest](self, "_runInfoExchangeRequest");
      self->_trAuthenticationEnabled = 1;
      -[SFAuthenticateAccountsSession _run](self, "_run");
    }
  }
  return self->_infoExchangeState;
}

- (void)_runInfoExchangeRequest
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  SFSession *sfSession;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[5];
  int v22;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("lang"));

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("langs"));
  }
  else if (gLogCategory_SFAuthenticateAccountsSession <= 60
         && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
  else if (gLogCategory_SFAuthenticateAccountsSession <= 60
         && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v22 = 0;
  CFArrayGetTypeID();
  v9 = CFPrefs_CopyTypedValue();
  v10 = (void *)v9;
  if (v9)
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("kbs"));
  }
  else if (gLogCategory_SFAuthenticateAccountsSession <= 60
         && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFAuthenticateAccountsSession _availableAccountsToSignIn](self, "_availableAccountsToSignIn", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v3, "addEntriesFromDictionary:", v11);
  SFDeviceSetupHomeKitCurrentUserIdentifiers(self->_homeManager);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("hkcuis"));
  SFDeviceSetupHomeKitRMVEnabledForAllHomes(self->_homeManager);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("hkhrmve"));
  objc_msgSend((Class)getVTPreferencesClass_0[0](), "sharedPreferences");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "voiceTriggerEnabled");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("siriVP"));

  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    v20 = v3;
    LogPrintF();
  }
  sfSession = self->_sfSession;
  v18 = (void *)objc_msgSend(v3, "copy", v20);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__SFAuthenticateAccountsSession__runInfoExchangeRequest__block_invoke;
  v21[3] = &unk_1E482E320;
  v21[4] = self;
  -[SFSession sendRequestID:options:request:responseHandler:](sfSession, "sendRequestID:options:request:responseHandler:", CFSTR("_info"), 0, v18, v21);

}

uint64_t __56__SFAuthenticateAccountsSession__runInfoExchangeRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_runInfoExchangeResponse:error:", a4, a2);
}

- (id)_availableAccountsToSignIn
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "aa_altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("aaiCloudAltDSID"));

  }
  -[ACAccountStore ams_activeiTunesAccount](self->_accountStore, "ams_activeiTunesAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "aa_altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("aaiTunesAltDSID"));

  }
  objc_msgSend((id)objc_opt_class(), "_myGameCenterAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "aa_altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("aaGameCenterAltDSID"));

  }
  v13 = (void *)objc_msgSend(v3, "copy");

  return v13;
}

- (void)_runInfoExchangeResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char Int64Ranged;
  unsigned int v10;
  void *v11;
  unint64_t Int64;
  int v13;
  void *v14;
  unsigned int targetedAccountTypes;
  void *v16;
  void *v17;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || v7)
  {
    self->_infoExchangeState = 3;
    if (!v7)
      goto LABEL_13;
    -[SFAuthenticateAccountsSession _reportError:](self, "_reportError:", v7);
    goto LABEL_27;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    v20 = v6;
    LogPrintF();
  }
  self->_peerFeatureFlags = CFDictionaryGetInt64();
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v10 = CFDictionaryGetInt64Ranged();
  if (!v10 && (Int64Ranged & 2) == 0)
  {
    self->_infoExchangeState = 3;
LABEL_13:
    NSErrorWithOSStatusF();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAuthenticateAccountsSession _reportError:](self, "_reportError:", v11);

    goto LABEL_27;
  }
  self->_targetedAccountTypes = v10;
  Int64 = CFDictionaryGetInt64();
  self->_problemFlags = Int64;
  if ((self->_peerFeatureFlags & 0x10) == 0)
    goto LABEL_24;
  v13 = Int64;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    self->_isSigningInNewiCloud = 0;
  }
  else
  {
    targetedAccountTypes = self->_targetedAccountTypes;
    self->_isSigningInNewiCloud = targetedAccountTypes & 1;
    if ((targetedAccountTypes & 1) != 0)
    {
LABEL_23:

LABEL_24:
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 800, 0);
      self->_infoExchangeState = 4;
      -[SFAuthenticateAccountsSession _run](self, "_run", v20);
      goto LABEL_27;
    }
  }
  if ((v13 & 0x20000) == 0)
    goto LABEL_23;
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "aa_altDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && v17 && objc_msgSend(v14, "isEqual:", v17))
  {

    goto LABEL_23;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 90
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_infoExchangeState = 3;
  NSErrorWithOSStatusF();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticateAccountsSession _reportError:](self, "_reportError:", v19);

LABEL_27:
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
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
      v6 = (TROperationQueue *)objc_alloc_init((Class)getTROperationQueueClass[0]());
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
      if (gLogCategory_SFAuthenticateAccountsSession > 90
        || gLogCategory_SFAuthenticateAccountsSession == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_25;
      }
    }
    else if (gLogCategory_SFAuthenticateAccountsSession > 90
           || gLogCategory_SFAuthenticateAccountsSession == -1 && !_LogCategory_Initialize())
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
    -[SFAuthenticateAccountsSession _reportError:](self, "_reportError:", v17);

    return self->_trSessionState;
  }
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return self->_trSessionState;
}

- (int)_runTRAuthentication
{
  void *v3;
  void *v4;
  int trAuthenticationState;
  BOOL v6;
  void *v7;
  int v8;
  _QWORD v10[5];
  id v11;
  id location;

  -[SFAuthenticateAccountsSession _trTargetedServices](self, "_trTargetedServices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  trAuthenticationState = self->_trAuthenticationState;
  if (trAuthenticationState)
  {
LABEL_2:
    v6 = trAuthenticationState == 2 || trAuthenticationState == 4;
    if (!v6
      && gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_25;
  }
  if (objc_msgSend(v3, "count"))
  {
    trAuthenticationState = self->_trAuthenticationState;
    if (trAuthenticationState)
      goto LABEL_2;
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_trAuthenticationState = 1;
    v7 = (void *)objc_msgSend(objc_alloc((Class)getTRAuthenticationOperationClass[0]()), "initWithSession:", self->_trSession);
    objc_msgSend(v7, "setShouldIgnoreAuthFailures:", 0);
    -[NSMutableArray addObject:](self->_trOperations, "addObject:", v7);
    objc_msgSend(v7, "setTargetedServices:", v4);
    if (self->_presentingViewController)
      objc_msgSend(v7, "setPresentingViewController:");
    location = 0;
    objc_initWeak(&location, v7);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke;
    v10[3] = &unk_1E482DC20;
    v10[4] = self;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v7, "setCompletionBlock:", v10);
    -[TROperationQueue addOperation:](self->_trOperationQueue, "addOperation:", v7);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);

  }
  else
  {
    if (gLogCategory_SFAuthenticateAccountsSession <= 40
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_trAuthenticationState = 2;
  }
LABEL_25:
  v8 = self->_trAuthenticationState;

  return v8;
}

void __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD v3[5];
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 192);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke_2;
  v3[3] = &unk_1E482DC20;
  v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __53__SFAuthenticateAccountsSession__runTRAuthentication__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id WeakRetained;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "result");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      getTRAuthenticationOperationUnauthenticatedServicesKey[0]();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "objectForKeyedSubscript:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v4, "count"))
      {
        v5 = WeakRetained;
        if (gLogCategory_SFAuthenticateAccountsSession <= 60)
        {
          if (gLogCategory_SFAuthenticateAccountsSession != -1
            || (v6 = _LogCategory_Initialize(), v5 = WeakRetained, v6))
          {
            v8 = v4;
            LogPrintF();
            v5 = WeakRetained;
          }
        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 156) = 3;
        objc_msgSend(v5, "error", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          getTRAuthenticationOperationErrorKey[0]();
          CFErrorGetTypeID();
          CFDictionaryGetTypedValue();
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6736, 0);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        objc_msgSend(*(id *)(a1 + 32), "_reportError:", v7);

      }
      else
      {
        if (gLogCategory_SFAuthenticateAccountsSession <= 30
          && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        *(_DWORD *)(*(_QWORD *)(a1 + 32) + 156) = 4;
        objc_msgSend(*(id *)(a1 + 32), "_run");
      }
    }
    else
    {
      objc_msgSend(WeakRetained, "error");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_SFAuthenticateAccountsSession <= 60
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        v8 = v4;
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 156) = 3;
      objc_msgSend(*(id *)(a1 + 32), "_reportError:", v4, v8);
    }

  }
}

- (id)_trTargetedServices
{
  id v3;
  void *v4;
  unsigned int targetedAccountTypes;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = v3;
  targetedAccountTypes = self->_targetedAccountTypes;
  if ((targetedAccountTypes & 1) == 0)
  {
    if ((targetedAccountTypes & 2) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v4, "addObject:", &unk_1E4890838);
    if ((self->_targetedAccountTypes & 4) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v3, "addObject:", &unk_1E4890820);
  targetedAccountTypes = self->_targetedAccountTypes;
  if ((targetedAccountTypes & 2) != 0)
    goto LABEL_7;
LABEL_3:
  if ((targetedAccountTypes & 4) != 0)
LABEL_4:
    objc_msgSend(v4, "addObject:", &unk_1E4890850);
LABEL_5:
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

- (int)_runRepairCDP
{
  int cdpState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationCDPSetup *v5;
  SFDeviceOperationCDPSetup *cdpSetupOperation;
  _QWORD v8[5];
  id v9;
  id location;

  cdpState = self->_cdpState;
  if (cdpState != 4)
  {
    if (cdpState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
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
      -[SFDeviceOperationCDPSetup setIsRepair:](self->_cdpSetupOperation, "setIsRepair:", !self->_isSigningInNewiCloud);
      if (self->_presentingViewController)
        -[SFDeviceOperationCDPSetup setPresentingViewController:](self->_cdpSetupOperation, "setPresentingViewController:");
      location = 0;
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __46__SFAuthenticateAccountsSession__runRepairCDP__block_invoke;
      v8[3] = &unk_1E4830050;
      objc_copyWeak(&v9, &location);
      v8[4] = self;
      -[SFDeviceOperationCDPSetup setCompletionHandler:](self->_cdpSetupOperation, "setCompletionHandler:", v8);
      -[SFDeviceOperationCDPSetup activate](self->_cdpSetupOperation, "activate");
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  return self->_cdpState;
}

void __46__SFAuthenticateAccountsSession__runRepairCDP__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained && *((_QWORD *)WeakRetained + 20))
  {
    if (v5)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 90
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 3;
      objc_msgSend(v4, "_reportError:", v5);
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 168) = 4;
      objc_msgSend(v4, "_run");
    }
  }

}

- (int)_runHomeKitSetup
{
  int homeKitSetupState;
  void (**progressHandler)(id, uint64_t, _QWORD);
  SFDeviceOperationHomeKitSetup *v5;
  SFDeviceOperationHomeKitSetup *homeKitSetupOperation;
  _QWORD v8[4];
  id v9;
  id location;

  homeKitSetupState = self->_homeKitSetupState;
  if (homeKitSetupState != 4)
  {
    if (homeKitSetupState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_homeKitSetupState = 1;
      -[SFDeviceOperationHomeKitSetup invalidate](self->_homeKitSetupOperation, "invalidate");
      progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
      if (progressHandler)
        progressHandler[2](progressHandler, 234, 0);
      v5 = objc_alloc_init(SFDeviceOperationHomeKitSetup);
      homeKitSetupOperation = self->_homeKitSetupOperation;
      self->_homeKitSetupOperation = v5;

      -[SFDeviceOperationHomeKitSetup setDispatchQueue:](self->_homeKitSetupOperation, "setDispatchQueue:", self->_dispatchQueue);
      -[SFDeviceOperationHomeKitSetup setKeyExchangeOnly:](self->_homeKitSetupOperation, "setKeyExchangeOnly:", 1);
      -[SFDeviceOperationHomeKitSetup setUserInteractive:](self->_homeKitSetupOperation, "setUserInteractive:", 1);
      -[SFDeviceOperationHomeKitSetup setTrSession:](self->_homeKitSetupOperation, "setTrSession:", self->_trSession);
      location = 0;
      objc_initWeak(&location, self);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __49__SFAuthenticateAccountsSession__runHomeKitSetup__block_invoke;
      v8[3] = &unk_1E482E280;
      objc_copyWeak(&v9, &location);
      -[SFDeviceOperationHomeKitSetup setCompletionHandler:](self->_homeKitSetupOperation, "setCompletionHandler:", v8);
      -[SFDeviceOperationHomeKitSetup activate](self->_homeKitSetupOperation, "activate");
      objc_destroyWeak(&v9);
      objc_destroyWeak(&location);
    }
  }
  return self->_homeKitSetupState;
}

void __49__SFAuthenticateAccountsSession__runHomeKitSetup__block_invoke(uint64_t a1, void *a2)
{
  _DWORD *WeakRetained;
  id v4;
  int v5;
  int v6;
  id v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = v8;
    if (v8)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30)
      {
        if (gLogCategory_SFAuthenticateAccountsSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v8, v5))
        {
          v7 = v4;
          LogPrintF();
        }
      }
      v6 = 2;
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v6 = 4;
    }
    WeakRetained[46] = v6;
    objc_msgSend(WeakRetained, "_run", v7);
  }

}

- (int)_runFinish
{
  int finishState;
  id v5;
  void *v6;
  SFSession *sfSession;
  _QWORD v9[5];

  finishState = self->_finishState;
  if (finishState != 4 && finishState != 2)
  {
    if (finishState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_finishState = 1;
      v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_1E4890868, CFSTR("op"));
      if ((self->_problemFlags & 8) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_homeKitSetupState == 4);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("aaHKSetup"));

      }
      sfSession = self->_sfSession;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __43__SFAuthenticateAccountsSession__runFinish__block_invoke;
      v9[3] = &unk_1E4830078;
      v9[4] = self;
      -[SFSession sendRequestWithFlags:object:responseHandler:](sfSession, "sendRequestWithFlags:object:responseHandler:", 1, v5, v9);
      self->_finishState = 4;

    }
  }
  return self->_finishState;
}

void __43__SFAuthenticateAccountsSession__runFinish__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  SFClient *v6;
  id v7;
  int Int64Ranged;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  SFClient *v16;
  _QWORD *v17;
  uint64_t v18;
  SFClient *v19;
  _QWORD v20[4];
  SFClient *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v6)
    goto LABEL_21;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (!Int64Ranged)
    goto LABEL_22;
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v10 = *MEMORY[0x1E0CB2F90];
  v11 = Int64Ranged;
  v22 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("?");
  if (v12)
    v14 = (const __CFString *)v12;
  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v15);
  v6 = (SFClient *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
LABEL_21:
    if (gLogCategory_SFAuthenticateAccountsSession <= 90
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      v19 = v6;
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 188) = 3;
    objc_msgSend(*(id *)(a1 + 32), "_reportError:", v6, v19);
  }
  else
  {
LABEL_22:
    if (gLogCategory_SFAuthenticateAccountsSession <= 30
      && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v16 = objc_alloc_init(SFClient);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __43__SFAuthenticateAccountsSession__runFinish__block_invoke_2;
    v20[3] = &unk_1E482DFF0;
    v6 = v16;
    v21 = v6;
    -[SFClient reenableProxCardType:completion:](v6, "reenableProxCardType:completion:", 32, v20);
    v17 = *(_QWORD **)(a1 + 32);
    v18 = v17[27];
    if (v18)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v18 + 16))(v17[27], 96, 0);
      v17 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v17, "_cleanup");

  }
}

void __43__SFAuthenticateAccountsSession__runFinish__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    v3 = v4;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v3);

}

- (void)__runFinishWithSFSession:(id)a3
{
  objc_storeStrong((id *)&self->_sfSession, a3);
  -[SFAuthenticateAccountsSession _runFinish](self, "_runFinish");
}

- (int)_validateAccounts
{
  int accountsState;
  void *v5;
  uint64_t v6;
  void *v7;

  accountsState = self->_accountsState;
  if (accountsState != 4 && accountsState != 2)
  {
    if (accountsState)
    {
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      -[SFAuthenticateAccountsSession _availableAccountsToSignIn](self, "_availableAccountsToSignIn");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "count");

      if (v6)
      {
        self->_accountsState = 4;
      }
      else
      {
        self->_accountsState = 3;
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UserErrorDomain"), 301005, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFAuthenticateAccountsSession _reportError:](self, "_reportError:", v7);

      }
    }
  }
  return self->_accountsState;
}

- (int)__validateAccountsWithAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
  return -[SFAuthenticateAccountsSession _validateAccounts](self, "_validateAccounts");
}

- (void)_handleShowTermsUI:(id)a3 responseHandler:(id)a4
{
  id v5;

  (*((void (**)(id, _QWORD, _QWORD, _QWORD))a4 + 2))(a4, 0, 0, MEMORY[0x1E0C9AA70]);
  if (gLogCategory_SFAuthenticateAccountsSession <= 30
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_trSessionState = 0;
  self->_trAuthenticationState = 0;
  -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFAuthenticateAccountsSession _presentiCloudTermsUIWithAccount:](self, "_presentiCloudTermsUIWithAccount:", v5);

}

- (int)_validateiCloudAccountTerms
{
  void *v3;

  switch(self->_iCloudTermsState)
  {
    case 0:
      -[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "aa_needsToVerifyTerms"))
      {
        if (gLogCategory_SFAuthenticateAccountsSession <= 50
          && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        -[SFAuthenticateAccountsSession _presentiCloudTermsUIWithAccount:](self, "_presentiCloudTermsUIWithAccount:", v3);
      }
      else
      {
        self->_iCloudTermsState = 4;
      }
      goto LABEL_15;
    case 2:
    case 4:
      return self->_iCloudTermsState;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("UserErrorDomain"), 301025, 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAuthenticateAccountsSession _reportError:](self, "_reportError:", v3);
LABEL_15:

      break;
    default:
      if (gLogCategory_SFAuthenticateAccountsSession <= 30
        && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
  return self->_iCloudTermsState;
}

- (void)_presentiCloudTermsUIWithAccount:(id)a3
{
  Class (__cdecl *v4)();
  id v5;
  void *v6;
  AAUIGenericTermsRemoteUI *termsRemoteUI;

  v4 = (Class (__cdecl *)())getAAUIGenericTermsRemoteUIClass[0];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(v4()), "initWithAccount:inStore:", v5, self->_accountStore);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "presentFromViewController:modal:", self->_presentingViewController, 1);
  termsRemoteUI = self->_termsRemoteUI;
  self->_termsRemoteUI = (AAUIGenericTermsRemoteUI *)v6;

  self->_iCloudTermsState = 1;
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AAUIGenericTermsRemoteUI *termsRemoteUI;
  int v8;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a4;
  v6 = a3;
  if (gLogCategory_SFAuthenticateAccountsSession <= 50
    && (gLogCategory_SFAuthenticateAccountsSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  termsRemoteUI = self->_termsRemoteUI;
  self->_termsRemoteUI = 0;

  if (v4)
    v8 = 4;
  else
    v8 = 3;
  self->_iCloudTermsState = v8;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SFAuthenticateAccountsSession_genericTermsRemoteUI_didFinishWithSuccess___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

uint64_t __75__SFAuthenticateAccountsSession_genericTermsRemoteUI_didFinishWithSuccess___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_run");
}

+ (id)_myGameCenterAccount
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F098]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountsWithAccountType:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    v5 = (void *)MEMORY[0x1E0CB3928];
    NSStringFromSelector(sel_creationDate);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortDescriptorWithKey:ascending:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingDescriptors:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
  }
  objc_msgSend(v4, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_homeKitSetupOperation, 0);
  objc_storeStrong((id *)&self->_cdpSetupOperation, 0);
  objc_storeStrong((id *)&self->_trOperationQueue, 0);
  objc_storeStrong((id *)&self->_trOperations, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_termsRemoteUI, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end
