@implementation SFRemoteAutoFillSession

- (SFRemoteAutoFillSession)init
{
  SFRemoteAutoFillSession *v2;
  SFRemoteAutoFillSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFRemoteAutoFillSession;
  v2 = -[SFRemoteAutoFillSession init](&v7, sel_init);
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
  SFRemoteAutoFillSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFRemoteAutoFillSession *)FatalErrorF();
    -[SFRemoteAutoFillSession activate](v3, v4);
  }
  else
  {
    -[SFRemoteAutoFillSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFRemoteAutoFillSession;
    -[SFRemoteAutoFillSession dealloc](&v5, sel_dealloc);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFRemoteAutoFillSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__SFRemoteAutoFillSession_activate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFPrefs_GetInt64();
  if (result)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
    return objc_msgSend(*(id *)(a1 + 32), "_run");
  }
  else if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__SFRemoteAutoFillSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__SFRemoteAutoFillSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 72)
    && gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 144);
  *(_QWORD *)(v2 + 144) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
}

- (void)_cleanup
{
  NSString *contextBundleID;
  NSString *contextURL;
  id pairingFinishedHandler;
  NSString *pickedPassword;
  NSString *pickedUsername;
  id promptForPickerHandler;
  id promptForPINHandler;

  contextBundleID = self->_contextBundleID;
  self->_contextBundleID = 0;

  contextURL = self->_contextURL;
  self->_contextURL = 0;

  pairingFinishedHandler = self->_pairingFinishedHandler;
  self->_pairingFinishedHandler = 0;

  self->_pairingFinishedNotified = 0;
  *(_QWORD *)&self->_pairSubstate.homeKit = 0;
  *(_QWORD *)&self->_pairSubstate.pairVerify = 0;
  *(_QWORD *)&self->_pairState = 0;
  self->_passwordPickerState = 0;
  pickedPassword = self->_pickedPassword;
  self->_pickedPassword = 0;

  pickedUsername = self->_pickedUsername;
  self->_pickedUsername = 0;

  promptForPickerHandler = self->_promptForPickerHandler;
  self->_promptForPickerHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  self->_sendCredentialsState = 0;
  self->_sessionState = 0;
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
  v7[2] = __34__SFRemoteAutoFillSession_tryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __34__SFRemoteAutoFillSession_tryPIN___block_invoke(uint64_t a1)
{
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144)
    && gLogCategory_SFRemoteAutoFillSession <= 60
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 144), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)_completedWithError:(id)a3
{
  id v4;
  void (**completedHandler)(id, id);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v12 = v4;
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_SFRemoteAutoFillSession <= 30
         && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  completedHandler = (void (**)(id, id))self->_completedHandler;
  if (completedHandler)
    completedHandler[2](completedHandler, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_contextRequestState, v12, CFSTR("contextRequestState"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  v13[1] = CFSTR("pairingState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_pairState);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("passwordPickerState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_passwordPickerState);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v8;
  v13[3] = CFSTR("sendCredentialState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sendCredentialsState);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v9;
  v13[4] = CFSTR("sessionState");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_sessionState);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.AutoFillSession"), v11);

}

- (void)_run
{
  void (**pairingFinishedHandler)(void);
  int v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activateCalled
    && !self->_invalidateCalled
    && -[SFRemoteAutoFillSession _runSessionStart](self, "_runSessionStart") == 4
    && -[SFRemoteAutoFillSession _runPair](self, "_runPair") == 4)
  {
    if (!self->_pairingFinishedNotified)
    {
      pairingFinishedHandler = (void (**)(void))self->_pairingFinishedHandler;
      if (pairingFinishedHandler)
      {
        self->_pairingFinishedNotified = 1;
        pairingFinishedHandler[2]();
      }
    }
    v4 = -[SFRemoteAutoFillSession _runContextRequest](self, "_runContextRequest");
    if ((v4 == 4 || v4 == 2)
      && -[SFRemoteAutoFillSession _runPasswordPicker](self, "_runPasswordPicker") == 4
      && -[SFRemoteAutoFillSession _runSendCredentials](self, "_runSendCredentials") == 4)
    {
      -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", 0);
    }
  }
}

- (int)_runSessionStart
{
  int sessionState;
  SFSession *v4;
  SFSession *session;
  void *v6;
  uint64_t v7;
  SFSession *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  sessionState = self->_sessionState;
  if (sessionState)
  {
    if (sessionState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_sessionState = 1;
    -[SFSession invalidate](self->_session, "invalidate");
    v4 = objc_alloc_init(SFSession);
    session = self->_session;
    self->_session = v4;

    -[SFSession setDispatchQueue:](self->_session, "setDispatchQueue:", self->_dispatchQueue);
    -[SFSession setPeerDevice:](self->_session, "setPeerDevice:", self->_peerDevice);
    -[SFSession setServiceIdentifier:](self->_session, "setServiceIdentifier:", CFSTR("com.apple.sharing.RemoteAutoFill"));
    -[SFDevice contactIdentifier](self->_peerDevice, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSession setPeerContactIdentifier:](self->_session, "setPeerContactIdentifier:", v6);

    -[SFSession setSessionFlags:](self->_session, "setSessionFlags:", 12);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke;
    v14[3] = &unk_1E482DFF0;
    v14[4] = self;
    -[SFSession setErrorHandler:](self->_session, "setErrorHandler:", v14);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_2;
    v13[3] = &unk_1E482DF78;
    v13[4] = self;
    -[SFSession setInterruptionHandler:](self->_session, "setInterruptionHandler:", v13);
    -[SFSession setInvalidationHandler:](self->_session, "setInvalidationHandler:", &__block_literal_global_62);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_4;
    v12[3] = &unk_1E482FFD8;
    v12[4] = self;
    -[SFSession setPromptForPINHandler:](self->_session, "setPromptForPINHandler:", v12);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_5;
    v11[3] = &unk_1E4830000;
    v11[4] = self;
    -[SFSession setReceivedObjectHandler:](self->_session, "setReceivedObjectHandler:", v11);
    v8 = self->_session;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_6;
    v10[3] = &unk_1E482DFF0;
    v10[4] = self;
    -[SFSession activateWithCompletion:](v8, "activateWithCompletion:", v10);
  }
  return self->_sessionState;
}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_SFRemoteAutoFillSession <= 90)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3, v5);

}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_SFRemoteAutoFillSession <= 60
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completedWithError:", v3);

}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_3()
{
  if (gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 192);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedObject:flags:", a3, a2);
}

void __43__SFRemoteAutoFillSession__runSessionStart__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  id v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (v3)
  {
    v4 = v3;
    if (gLogCategory_SFRemoteAutoFillSession <= 90)
    {
      if (gLogCategory_SFRemoteAutoFillSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
      {
        v6 = v4;
        LogPrintF();
        v4 = v7;
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v4, v6);
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 152) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

- (int)_runPair
{
  unsigned int pairState;
  NSDate *v4;
  NSDate *pairClock;
  int v6;

  pairState = self->_pairState;
  if (pairState > 1)
  {
LABEL_25:
    if (pairState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return self->_pairState;
  }
  if (!pairState)
  {
    self->_pairState = 1;
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    pairClock = self->_pairClock;
    self->_pairClock = v4;

  }
  v6 = -[SFRemoteAutoFillSession _runPairVerify](self, "_runPairVerify");
  if (v6 == 4
    || (v6 & 0xFFFFFFFE) == 2
    && ((v6 = -[SFRemoteAutoFillSession _runPairHomeKit](self, "_runPairHomeKit"), v6 == 4)
     || (v6 & 0xFFFFFFFE) == 2
     && ((v6 = -[SFRemoteAutoFillSession _runPairContacts](self, "_runPairContacts"), v6 == 4)
      || (v6 & 0xFFFFFFFE) == 2
      && ((v6 = -[SFRemoteAutoFillSession _runPairVisual](self, "_runPairVisual"), v6 == 4)
       || (v6 & 0xFFFFFFFE) == 2
       && ((v6 = -[SFRemoteAutoFillSession _runPairPIN](self, "_runPairPIN"), v6 == 4) || (v6 & 0xFFFFFFFE) == 2)))))
  {
    if (v6 == 4 || v6 == 2)
      pairState = 4;
    else
      pairState = 3;
    self->_pairState = pairState;
    goto LABEL_25;
  }
  return self->_pairState;
}

- (int)_runPairContacts
{
  _BOOL4 v3;
  int result;
  uint64_t v5;
  void *v6;
  SFSession *session;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  int v15;

  v15 = 0;
  v3 = CFPrefs_GetInt64() != 0;
  if (self->_prefPairContactsDisabled == v3)
  {
    result = self->_pairSubstate.contacts;
    if (!result)
    {
      v9 = 0;
      v10 = &v9;
      v11 = 0x3032000000;
      v12 = __Block_byref_object_copy__15;
      v13 = __Block_byref_object_dispose__15;
      v14 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v10[5];
      v10[5] = v5;

      self->_pairSubstate.contacts = 1;
      session = self->_session;
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __43__SFRemoteAutoFillSession__runPairContacts__block_invoke;
      v8[3] = &unk_1E4830028;
      v8[4] = self;
      v8[5] = &v9;
      -[SFSession pairVerifyWithFlags:completion:](session, "pairVerifyWithFlags:completion:", 4096, v8);
      _Block_object_dispose(&v9, 8);

      return self->_pairSubstate.contacts;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairContactsDisabled = v3;
    result = 2;
    self->_pairSubstate.contacts = 2;
  }
  return result;
}

void __43__SFRemoteAutoFillSession__runPairContacts__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = v4;
      LogPrintF();

    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v8 = v6;
      LogPrintF();

    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v9;
      LogPrintF();
    }
    v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 4;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 92) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);

}

- (int)_runPairHomeKit
{
  int result;
  uint64_t v4;
  void *v5;
  SFSession *session;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  int v14;

  v14 = 0;
  if (self->_prefPairHomeKitDisabled == (CFPrefs_GetInt64() != 0))
  {
    result = self->_pairSubstate.homeKit;
    if (!result)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x3032000000;
      v11 = __Block_byref_object_copy__15;
      v12 = __Block_byref_object_dispose__15;
      v13 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v9[5];
      v9[5] = v4;

      self->_pairSubstate.homeKit = 1;
      session = self->_session;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __42__SFRemoteAutoFillSession__runPairHomeKit__block_invoke;
      v7[3] = &unk_1E4830028;
      v7[4] = self;
      v7[5] = &v8;
      -[SFSession pairVerifyWithFlags:completion:](session, "pairVerifyWithFlags:completion:", 0x400000, v7);
      _Block_object_dispose(&v8, 8);

      return self->_pairSubstate.homeKit;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairHomeKitDisabled = 1;
    result = 2;
    self->_pairSubstate.homeKit = 2;
  }
  return result;
}

void __42__SFRemoteAutoFillSession__runPairHomeKit__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = v4;
      LogPrintF();

    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v8 = v6;
      LogPrintF();

    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v9;
      LogPrintF();
    }
    v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 4;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 96) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);

}

- (int)_runPairVerify
{
  int result;
  uint64_t v4;
  void *v5;
  SFSession *session;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  int v14;

  v14 = 0;
  if (self->_prefPairVerifyDisabled == (CFPrefs_GetInt64() != 0))
  {
    result = self->_pairSubstate.pairVerify;
    if (!result)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x3032000000;
      v11 = __Block_byref_object_copy__15;
      v12 = __Block_byref_object_dispose__15;
      v13 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v9[5];
      v9[5] = v4;

      self->_pairSubstate.pairVerify = 1;
      session = self->_session;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __41__SFRemoteAutoFillSession__runPairVerify__block_invoke;
      v7[3] = &unk_1E4830028;
      v7[4] = self;
      v7[5] = &v8;
      -[SFSession pairVerifyWithFlags:completion:](session, "pairVerifyWithFlags:completion:", 0, v7);
      _Block_object_dispose(&v8, 8);

      return self->_pairSubstate.pairVerify;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairVerifyDisabled = 1;
    result = 2;
    self->_pairSubstate.pairVerify = 2;
  }
  return result;
}

void __41__SFRemoteAutoFillSession__runPairVerify__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = v4;
      LogPrintF();

    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v8 = v6;
      LogPrintF();

    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v9;
      LogPrintF();
    }
    v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 4;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 104) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);

}

- (int)_runPairPIN
{
  int result;
  uint64_t v4;
  void *v5;
  SFSession *session;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  result = self->_pairSubstate.pin;
  if (!result)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__15;
    v12 = __Block_byref_object_dispose__15;
    v13 = 0;
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v9[5];
    v9[5] = v4;

    self->_pairSubstate.pin = 1;
    session = self->_session;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__SFRemoteAutoFillSession__runPairPIN__block_invoke;
    v7[3] = &unk_1E4830028;
    v7[4] = self;
    v7[5] = &v8;
    -[SFSession pairSetupWithFlags:completion:](session, "pairSetupWithFlags:completion:", 16, v7);
    _Block_object_dispose(&v8, 8);

    return self->_pairSubstate.pin;
  }
  return result;
}

void __38__SFRemoteAutoFillSession__runPairPIN__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = v4;
      LogPrintF();

    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v8 = v6;
      LogPrintF();

    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v9;
      LogPrintF();
    }
    v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 4;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);

}

- (int)_runPairVisual
{
  int result;
  uint64_t v4;
  void *v5;
  SFSession *session;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  int v14;

  v14 = 0;
  if (self->_prefPairVisualDisabled == (CFPrefs_GetInt64() != 0))
  {
    result = self->_pairSubstate.visual;
    if (!result)
    {
      v8 = 0;
      v9 = &v8;
      v10 = 0x3032000000;
      v11 = __Block_byref_object_copy__15;
      v12 = __Block_byref_object_dispose__15;
      v13 = 0;
      if (gLogCategory_SFRemoteAutoFillSession <= 50
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v9[5];
      v9[5] = v4;

      self->_pairSubstate.visual = 1;
      session = self->_session;
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __41__SFRemoteAutoFillSession__runPairVisual__block_invoke;
      v7[3] = &unk_1E4830028;
      v7[4] = self;
      v7[5] = &v8;
      -[SFSession pairSetupWithFlags:completion:](session, "pairSetupWithFlags:completion:", 272, v7);
      _Block_object_dispose(&v8, 8);

      return self->_pairSubstate.visual;
    }
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_prefPairVisualDisabled = 1;
    result = 2;
    self->_pairSubstate.visual = 2;
  }
  return result;
}

void __41__SFRemoteAutoFillSession__runPairVisual__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  id v9;

  v9 = a2;
  if (gLogCategory_SFRemoteAutoFillSession <= 50)
  {
    if (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize())
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      v8 = v4;
      LogPrintF();

    }
    if (gLogCategory_SFRemoteAutoFillSession <= 50
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
      v8 = v6;
      LogPrintF();

    }
  }
  if (v9)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v9;
      LogPrintF();
    }
    v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v7 = 4;
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 100) = v7;
  objc_msgSend(*(id *)(a1 + 32), "_run", v8);

}

- (int)_runContextRequest
{
  int contextRequestState;
  SFSession *session;
  _QWORD v6[5];

  contextRequestState = self->_contextRequestState;
  if (contextRequestState)
  {
    if (contextRequestState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else
  {
    if (self->_session)
    {
      self->_contextRequestState = 1;
      session = self->_session;
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __45__SFRemoteAutoFillSession__runContextRequest__block_invoke;
      v6[3] = &unk_1E4830078;
      v6[4] = self;
      -[SFSession sendRequestWithFlags:object:responseHandler:](session, "sendRequestWithFlags:object:responseHandler:", 1, &unk_1E4891638, v6);
      return self->_contextRequestState;
    }
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
LABEL_15:
      LogPrintF();
    }
  }
  return self->_contextRequestState;
}

uint64_t __45__SFRemoteAutoFillSession__runContextRequest__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleContextRequestResponse:error:", a4, a3);
}

- (void)_handleContextRequestResponse:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  NSData *v8;
  NSData *contextAppIconData;
  void *v10;
  NSArray *v11;
  NSArray *contextAssociatedDomains;
  __CFString *v13;
  int v14;
  const __CFString *v15;
  __CFString *v16;
  int v17;
  const __CFString *v18;
  NSString *v19;
  NSString *contextLocalizedAppName;
  __CFString *v21;
  int v22;
  const __CFString *v23;
  NSString *v24;
  NSString *contextUnlocalizedAppName;
  __CFString *v26;
  int v27;
  const __CFString *v28;
  uint64_t v29;
  id v30;

  v30 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFRemoteAutoFillSession <= 30
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    v29 = (uint64_t)v30;
    LogPrintF();
  }
  if (v6)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v29 = (uint64_t)v6;
      LogPrintF();
    }
    self->_contextRequestState = 3;
    -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", v6, v29);
  }
  else
  {
    if (!v30
      && gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v8 = (NSData *)objc_msgSend(v7, "copy", v29);
      contextAppIconData = self->_contextAppIconData;
      self->_contextAppIconData = v8;

    }
    CFArrayGetTypeID();
    CFDictionaryGetTypedValue();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v29 = objc_msgSend(v10, "count", v29);
        LogPrintF();
      }
      v11 = (NSArray *)objc_msgSend(v10, "copy", v29);
      contextAssociatedDomains = self->_contextAssociatedDomains;
      self->_contextAssociatedDomains = v11;

    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v14 = IsAppleInternalBuild();
        v15 = CFSTR("*");
        if (v14)
          v15 = v13;
        v29 = (uint64_t)v15;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_contextBundleID, v13);
    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v17 = IsAppleInternalBuild();
        v18 = CFSTR("*");
        if (v17)
          v18 = v16;
        v29 = (uint64_t)v18;
        LogPrintF();
      }
      v19 = (NSString *)-[__CFString copy](v16, "copy", v29);
      contextLocalizedAppName = self->_contextLocalizedAppName;
      self->_contextLocalizedAppName = v19;

    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v22 = IsAppleInternalBuild();
        v23 = CFSTR("*");
        if (v22)
          v23 = v21;
        v29 = (uint64_t)v23;
        LogPrintF();
      }
      v24 = (NSString *)-[__CFString copy](v21, "copy", v29);
      contextUnlocalizedAppName = self->_contextUnlocalizedAppName;
      self->_contextUnlocalizedAppName = v24;

    }
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 30
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v27 = IsAppleInternalBuild();
        v28 = CFSTR("*");
        if (v27)
          v28 = v26;
        v29 = (uint64_t)v28;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_contextURL, v26);
    }
    self->_contextRequestState = 4;
    -[SFRemoteAutoFillSession _run](self, "_run", v29);

  }
}

- (int)_runPasswordPicker
{
  int passwordPickerState;
  _QWORD *promptForPickerHandler;
  NSString *contextBundleID;
  NSString *contextLocalizedAppName;
  NSString *contextURL;
  NSString *contextUnlocalizedAppName;
  NSArray *contextAssociatedDomains;
  NSData *contextAppIconData;
  void *v11;
  void (*v12)(_QWORD *, NSString *, NSString *, NSString *, NSString *, NSArray *, NSData *, void *, _QWORD *);
  _QWORD v14[5];

  passwordPickerState = self->_passwordPickerState;
  if (passwordPickerState)
  {
    if (passwordPickerState != 4
      && gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    promptForPickerHandler = self->_promptForPickerHandler;
    if (promptForPickerHandler)
    {
      contextBundleID = self->_contextBundleID;
      contextLocalizedAppName = self->_contextLocalizedAppName;
      contextUnlocalizedAppName = self->_contextUnlocalizedAppName;
      contextURL = self->_contextURL;
      contextAppIconData = self->_contextAppIconData;
      contextAssociatedDomains = self->_contextAssociatedDomains;
      -[SFDevice name](self->_peerDevice, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = 3221225472;
      v14[2] = __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke;
      v14[3] = &unk_1E4833A48;
      v14[4] = self;
      v12 = (void (*)(_QWORD *, NSString *, NSString *, NSString *, NSString *, NSArray *, NSData *, void *, _QWORD *))promptForPickerHandler[2];
      v14[0] = MEMORY[0x1E0C809B0];
      v12(promptForPickerHandler, contextURL, contextBundleID, contextLocalizedAppName, contextUnlocalizedAppName, contextAssociatedDomains, contextAppIconData, v11, v14);

    }
  }
  return self->_passwordPickerState;
}

void __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(NSObject **)(v10 + 168);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke_2;
  v15[3] = &unk_1E482E7D8;
  v15[4] = v10;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v7;
  dispatch_async(v11, v15);

}

uint64_t __45__SFRemoteAutoFillSession__runPasswordPicker__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePasswordPickerResponse:password:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_handlePasswordPickerResponse:(id)a3 password:(id)a4 error:(id)a5
{
  __CFString *v9;
  __CFString *v10;
  int v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  void *v15;
  const __CFString *v16;
  __CFString *v17;

  v17 = (__CFString *)a3;
  v9 = (__CFString *)a4;
  v10 = (__CFString *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v10)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v16 = v10;
      LogPrintF();
    }
    self->_passwordPickerState = 3;
    -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", v10, v16);
  }
  else
  {
    if (v17)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 10
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v11 = IsAppleInternalBuild();
        v12 = CFSTR("*");
        if (v11)
          v12 = v17;
        v16 = v12;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_pickedUsername, a3);
    }
    if (v9)
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 10
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        v13 = IsAppleInternalBuild();
        v14 = CFSTR("*");
        if (v13)
          v14 = v9;
        v16 = v14;
        LogPrintF();
      }
      objc_storeStrong((id *)&self->_pickedPassword, a4);
    }
    if (self->_pickedUsername || self->_pickedPassword)
    {
      self->_passwordPickerState = 4;
      -[SFRemoteAutoFillSession _run](self, "_run", v16);
    }
    else
    {
      if (gLogCategory_SFRemoteAutoFillSession <= 60
        && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      self->_passwordPickerState = 3;
      NSErrorWithOSStatusF();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", v15);

    }
  }

}

- (int)_runSendCredentials
{
  int sendCredentialsState;
  id v4;
  NSString *pickedUsername;
  NSString *pickedPassword;
  SFSession *session;
  _QWORD v9[5];

  sendCredentialsState = self->_sendCredentialsState;
  if (sendCredentialsState)
  {
    if (sendCredentialsState == 4
      || gLogCategory_SFRemoteAutoFillSession > 30
      || gLogCategory_SFRemoteAutoFillSession == -1 && !_LogCategory_Initialize())
    {
      return self->_sendCredentialsState;
    }
LABEL_24:
    LogPrintF();
    return self->_sendCredentialsState;
  }
  if (!self->_session)
  {
    if (gLogCategory_SFRemoteAutoFillSession > 60
      || gLogCategory_SFRemoteAutoFillSession == -1 && !_LogCategory_Initialize())
    {
      return self->_sendCredentialsState;
    }
    goto LABEL_24;
  }
  if (!self->_pickedPassword && !self->_pickedUsername)
  {
    if (gLogCategory_SFRemoteAutoFillSession > 60
      || gLogCategory_SFRemoteAutoFillSession == -1 && !_LogCategory_Initialize())
    {
      return self->_sendCredentialsState;
    }
    goto LABEL_24;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E4890B98, CFSTR("op"));
  pickedUsername = self->_pickedUsername;
  if (pickedUsername)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", pickedUsername, CFSTR("un"));
  pickedPassword = self->_pickedPassword;
  if (pickedPassword)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", pickedPassword, CFSTR("pw"));
  self->_sendCredentialsState = 1;
  session = self->_session;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SFRemoteAutoFillSession__runSendCredentials__block_invoke;
  v9[3] = &unk_1E4830078;
  v9[4] = self;
  -[SFSession sendRequestWithFlags:object:responseHandler:](session, "sendRequestWithFlags:object:responseHandler:", 1, v4, v9);

  return self->_sendCredentialsState;
}

uint64_t __46__SFRemoteAutoFillSession__runSendCredentials__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleSendCredentialsResponse:error:", a4, a3);
}

- (void)_handleSendCredentialsResponse:(id)a3 error:(id)a4
{
  id v6;
  int v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6)
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 60
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v6;
      LogPrintF();
    }
    v7 = 3;
  }
  else
  {
    if (gLogCategory_SFRemoteAutoFillSession <= 30
      && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
    {
      v8 = v9;
      LogPrintF();
    }
    v7 = 4;
  }
  self->_sendCredentialsState = v7;
  -[SFRemoteAutoFillSession _run](self, "_run", v8);

}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  char Int64Ranged;
  void *v6;

  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFRemoteAutoFillSession <= 50
    && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (Int64Ranged == 5)
  {
    NSErrorWithOSStatusF();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFRemoteAutoFillSession _completedWithError:](self, "_completedWithError:", v6);

  }
  else if (gLogCategory_SFRemoteAutoFillSession <= 60
         && (gLogCategory_SFRemoteAutoFillSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (id)completedHandler
{
  return self->_completedHandler;
}

- (void)setCompletedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
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

- (id)pairingFinishedHandler
{
  return self->_pairingFinishedHandler;
}

- (void)setPairingFinishedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)promptForPickerHandler
{
  return self->_promptForPickerHandler;
}

- (void)setPromptForPickerHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPickerHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_pairingFinishedHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completedHandler, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_pickedUsername, 0);
  objc_storeStrong((id *)&self->_pickedPassword, 0);
  objc_storeStrong((id *)&self->_pairClock, 0);
  objc_storeStrong((id *)&self->_contextURL, 0);
  objc_storeStrong((id *)&self->_contextUnlocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextLocalizedAppName, 0);
  objc_storeStrong((id *)&self->_contextBundleID, 0);
  objc_storeStrong((id *)&self->_contextAssociatedDomains, 0);
  objc_storeStrong((id *)&self->_contextAppIconData, 0);
}

@end
