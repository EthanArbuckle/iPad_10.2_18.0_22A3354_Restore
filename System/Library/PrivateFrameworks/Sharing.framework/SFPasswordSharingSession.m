@implementation SFPasswordSharingSession

- (SFPasswordSharingSession)init
{
  SFPasswordSharingSession *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFPasswordSharingSession;
  v2 = -[SFPasswordSharingSession init](&v6, sel_init);
  if (v2)
  {
    SFMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)dealloc
{
  SFPasswordSharingSession *v3;
  SEL v4;
  objc_super v5;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v3 = (SFPasswordSharingSession *)FatalErrorF();
    -[SFPasswordSharingSession activate](v3, v4);
  }
  else
  {
    -[SFPasswordSharingSession _cleanup](self, "_cleanup");
    v5.receiver = self;
    v5.super_class = (Class)SFPasswordSharingSession;
    -[SFPasswordSharingSession dealloc](&v5, sel_dealloc);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SFPasswordSharingSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__SFPasswordSharingSession_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;

  if (gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v5 = *(_QWORD **)(a1 + 32);
  v6 = v5[12];
  if (v6)
  {
    (*(void (**)(_QWORD, uint64_t, _QWORD))(v6 + 16))(v5[12], 10, 0);
    v5 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v5, "_run");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SFPasswordSharingSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __38__SFPasswordSharingSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 9)
    && gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_cleanup");
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
  v7[2] = __35__SFPasswordSharingSession_tryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __35__SFPasswordSharingSession_tryPIN___block_invoke(uint64_t a1)
{
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24)
    && gLogCategory_SFPasswordSharingSession <= 60
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)_cleanup
{
  self->_pairState = 0;
  self->_passwordShareState = 0;
  self->_sfSessionState = 0;
}

- (void)_completedWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void (**progressHandler)(id, uint64_t, void *);
  void *v8;
  void (**v9)(id, uint64_t, _QWORD);
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_SFPasswordSharingSession <= 50
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", self->_shareClock);
    LogPrintF();

  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = v4;
  if (v6)
  {
    if (gLogCategory_SFPasswordSharingSession <= 60
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    if (progressHandler)
    {
      v10 = CFSTR("eo");
      v11[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 20, v8);

    }
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (v9)
      v9[2](v9, 20, 0);
  }

}

- (void)_run
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled
    && -[SFPasswordSharingSession _runSFSessionStart](self, "_runSFSessionStart") == 4
    && -[SFPasswordSharingSession _runPair](self, "_runPair") == 4)
  {
    -[SFPasswordSharingSession _runPasswordShare](self, "_runPasswordShare");
  }
}

- (int)_runSFSessionStart
{
  int sfSessionState;
  SFSession *v4;
  SFSession *sfSession;
  void *v6;
  uint64_t v7;
  SFSession *v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];

  sfSessionState = self->_sfSessionState;
  if (sfSessionState)
  {
    if (sfSessionState != 4
      && gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_sfSessionState = 1;
    -[SFSession invalidate](self->_sfSession, "invalidate");
    v4 = objc_alloc_init(SFSession);
    sfSession = self->_sfSession;
    self->_sfSession = v4;

    -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
    -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
    -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.PasswordSharing"));
    -[SFDevice contactIdentifier](self->_peerDevice, "contactIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSession setPeerContactIdentifier:](self->_sfSession, "setPeerContactIdentifier:", v6);

    -[SFSession setSessionFlags:](self->_sfSession, "setSessionFlags:", 12);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke;
    v14[3] = &unk_1E482DFF0;
    v14[4] = self;
    -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v14);
    v13[0] = v7;
    v13[1] = 3221225472;
    v13[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_2;
    v13[3] = &unk_1E482DF78;
    v13[4] = self;
    -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v13);
    -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", &__block_literal_global_20);
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_4;
    v12[3] = &unk_1E482FFD8;
    v12[4] = self;
    -[SFSession setPromptForPINHandler:](self->_sfSession, "setPromptForPINHandler:", v12);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_5;
    v11[3] = &unk_1E4830000;
    v11[4] = self;
    -[SFSession setReceivedObjectHandler:](self->_sfSession, "setReceivedObjectHandler:", v11);
    v8 = self->_sfSession;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_6;
    v10[3] = &unk_1E482DFF0;
    v10[4] = self;
    -[SFSession activateWithCompletion:](v8, "activateWithCompletion:", v10);
  }
  return self->_sfSessionState;
}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  id v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (gLogCategory_SFPasswordSharingSession <= 90)
  {
    if (gLogCategory_SFPasswordSharingSession != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
    {
      v5 = v3;
      LogPrintF();
      v3 = v6;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_completedWithError:", v3, v5);

}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_SFPasswordSharingSession <= 60
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(a1 + 32);
  NSErrorWithOSStatusF();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_completedWithError:", v3);

}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_3()
{
  if (gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (gLogCategory_SFPasswordSharingSession <= 30
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a3);
  return result;
}

uint64_t __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receivedObject:flags:", a3, a2);
}

void __46__SFPasswordSharingSession__runSFSessionStart__block_invoke_6(uint64_t a1, void *a2)
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
    if (gLogCategory_SFPasswordSharingSession <= 90)
    {
      if (gLogCategory_SFPasswordSharingSession != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
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
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = 4;
    objc_msgSend(*(id *)(a1 + 32), "_run");
  }

}

- (int)_runPair
{
  int pairState;
  uint64_t v4;
  void *v5;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v7;
  _QWORD aBlock[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  pairState = self->_pairState;
  if (pairState)
  {
    if (pairState != 4
      && gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__4;
    v14 = __Block_byref_object_dispose__4;
    v15 = 0;
    if (gLogCategory_SFPasswordSharingSession <= 50
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v11[5];
    v11[5] = v4;

    self->_pairState = 1;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 60, 0);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __36__SFPasswordSharingSession__runPair__block_invoke;
    aBlock[3] = &unk_1E4830028;
    aBlock[4] = self;
    aBlock[5] = &v10;
    v7 = _Block_copy(aBlock);
    -[SFSession pairVerifyWithFlags:completion:](self->_sfSession, "pairVerifyWithFlags:completion:", 4096, v7);

    _Block_object_dispose(&v10, 8);
  }
  return self->_pairState;
}

void __36__SFPasswordSharingSession__runPair__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[4];
  _QWORD v26[4];
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (gLogCategory_SFPasswordSharingSession <= 50
    && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    v22 = v5;
    LogPrintF();

  }
  if (v3)
  {
    if (gLogCategory_SFPasswordSharingSession <= 50
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      v22 = v3;
      LogPrintF();
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 3;
    v8 = v3;
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[12];
    if (v10)
    {
      v27 = CFSTR("eo");
      v28[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, void *))(v10 + 16))(v10, 30, v11);

      v9 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v9, "_completedWithError:", v8, v22);

  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) = 4;
    v6 = *(_QWORD **)(a1 + 32);
    v7 = v6[12];
    if (v7)
    {
      (*(void (**)(_QWORD, uint64_t, _QWORD))(v7 + 16))(v6[12], 70, 0);
      v6 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v6, "_run", v22);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSinceNow");
  v13 = v12;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSinceNow");
  if (v13 < 0.0)
    v14 = -v14;
  v15 = (uint64_t)(v14 * 1000.0);
  v25[0] = CFSTR("_cat");
  v25[1] = CFSTR("_op");
  v26[0] = CFSTR("PasswordSharing");
  v26[1] = CFSTR("PairVerify");
  v25[2] = CFSTR("durationMS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = v16;
  v25[3] = CFSTR("errorCode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", NSErrorToOSStatus());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  SFDashboardLogJSON(v18);

  v23[0] = CFSTR("durationMS");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = CFSTR("errorCode");
  v24[0] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", NSErrorToOSStatus());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.PasswordSharingPairVerify"), v21);

}

- (int)_runPasswordShare
{
  int passwordShareState;

  passwordShareState = self->_passwordShareState;
  if (passwordShareState)
  {
    if (passwordShareState != 4
      && gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_SFPasswordSharingSession <= 50
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPasswordSharingSession _runPasswordShareSendInfo](self, "_runPasswordShareSendInfo");
  }
  return self->_passwordShareState;
}

- (void)_runPasswordShareSendInfo
{
  NSString *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void (**v13)(id, uint64_t, _QWORD);
  void (**progressHandler)(id, uint64_t, void *);
  uint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSString *hashedEmail;
  NSString *hashedPhone;
  NSString *deviceName;
  void (**v31)(id, uint64_t, _QWORD);
  void *v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v3 = self->_hotspotPSK;
  -[SFDevice requestSSID](self->_peerDevice, "requestSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_sfSession)
  {
    if (gLogCategory_SFPasswordSharingSession <= 60)
    {
      if (gLogCategory_SFPasswordSharingSession == -1)
      {
        v5 = -6762;
        if (!_LogCategory_Initialize())
          goto LABEL_4;
      }
      else
      {
        v5 = -6762;
      }
      goto LABEL_53;
    }
    v5 = -6762;
LABEL_55:
    self->_passwordShareState = 3;
LABEL_22:
    progressHandler = (void (**)(id, uint64_t, void *))self->_progressHandler;
    v15 = *MEMORY[0x1E0CB2F90];
    v16 = 0x1E0CB3000uLL;
    if (progressHandler)
    {
      v35 = CFSTR("eo");
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v18 = v5;
      v33 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = CFSTR("?");
      if (v19)
        v21 = (const __CFString *)v19;
      v34 = v21;
      v22 = v4;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1, v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", v15, v18, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      progressHandler[2](progressHandler, 30, v25);

      v4 = v22;
      v16 = 0x1E0CB3000;
    }
    else
    {
      v18 = v5;
    }
    objc_msgSend(*(id *)(v16 + 1480), "errorWithDomain:code:userInfo:", v15, v18, 0, v32, v33);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPasswordSharingSession _completedWithError:](self, "_completedWithError:", v26);

    v27 = 0;
    goto LABEL_49;
  }
  if (self->_passwordShareState)
  {
    v5 = -6709;
LABEL_4:
    v6 = gLogCategory_SFPasswordSharingSession;
    self->_passwordShareState = 3;
    if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2F90];
      v37 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("?");
      if (v9)
        v11 = (const __CFString *)v9;
      v38[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, v5, v12);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    goto LABEL_22;
  }
  self->_passwordShareState = 1;
  v13 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (v13)
    v13[2](v13, 80, 0);
  if (!v4)
  {
    v5 = -6705;
    goto LABEL_4;
  }
  if (v3)
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_29;
  }
  SFShareablePasswordForSSID(v4);
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (gLogCategory_SFPasswordSharingSession <= 60)
    {
      if (gLogCategory_SFPasswordSharingSession == -1)
      {
        v3 = 0;
        v5 = -6709;
        if (!_LogCategory_Initialize())
          goto LABEL_4;
      }
      else
      {
        v3 = 0;
        v5 = -6709;
      }
LABEL_53:
      LogPrintF();
      goto LABEL_4;
    }
    v3 = 0;
    v5 = -6709;
    goto LABEL_55;
  }
LABEL_29:
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v27, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("gr"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v4, CFSTR("nw"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E4890808, CFSTR("op"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v3, CFSTR("psk"));
  hashedEmail = self->_hashedEmail;
  if (hashedEmail)
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", hashedEmail, CFSTR("eh"));
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  hashedPhone = self->_hashedPhone;
  if (hashedPhone)
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", hashedPhone, CFSTR("ph"));
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  deviceName = self->_deviceName;
  if (deviceName)
  {
    objc_msgSend(v27, "setObject:forKeyedSubscript:", deviceName, CFSTR("dn"));
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFSession sendWithFlags:object:](self->_sfSession, "sendWithFlags:object:", 1, v27);
  v31 = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
  if (v31)
    v31[2](v31, 82, 0);
LABEL_49:

}

- (void)_runPasswordShareReceiveResponse:(id)a3
{
  id v4;
  uint64_t Int64Ranged;
  void (**progressHandler)(id, uint64_t, _QWORD);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (CFDictionaryGetInt64())
  {
    if (gLogCategory_SFPasswordSharingSession <= 30
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_passwordShareState = 4;
    progressHandler = (void (**)(id, uint64_t, _QWORD))self->_progressHandler;
    if (progressHandler)
      progressHandler[2](progressHandler, 83, 0);
  }
  else
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if (gLogCategory_SFPasswordSharingSession <= 60
      && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
    {
      v15 = Int64Ranged;
      LogPrintF();
    }
    self->_passwordShareState = 4;
    if (self->_progressHandler)
    {
      if ((_DWORD)Int64Ranged)
      {
        v18 = CFSTR("eo");
        v7 = (void *)MEMORY[0x1E0CB35C8];
        v8 = *MEMORY[0x1E0CB2F90];
        v16 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        v11 = CFSTR("?");
        if (v9)
          v11 = (const __CFString *)v9;
        v17 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1, v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, (int)Int64Ranged, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19[0] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v14 = 0;
      }
      (*((void (**)(void))self->_progressHandler + 2))();

    }
  }
  -[SFPasswordSharingSession _completedWithError:](self, "_completedWithError:", 0, v15);

}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  id v5;

  v5 = a3;
  if (CFDictionaryGetInt64Ranged() == 5)
  {
    -[SFPasswordSharingSession _runPasswordShareReceiveResponse:](self, "_runPasswordShareReceiveResponse:", v5);
  }
  else if (gLogCategory_SFPasswordSharingSession <= 60
         && (gLogCategory_SFPasswordSharingSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
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

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSString)hashedEmail
{
  return self->_hashedEmail;
}

- (void)setHashedEmail:(id)a3
{
  objc_storeStrong((id *)&self->_hashedEmail, a3);
}

- (NSString)hashedPhone
{
  return self->_hashedPhone;
}

- (void)setHashedPhone:(id)a3
{
  objc_storeStrong((id *)&self->_hashedPhone, a3);
}

- (NSString)hotspotPSK
{
  return self->_hotspotPSK;
}

- (void)setHotspotPSK:(id)a3
{
  objc_storeStrong((id *)&self->_hotspotPSK, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_progressHandler, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_hotspotPSK, 0);
  objc_storeStrong((id *)&self->_hashedPhone, 0);
  objc_storeStrong((id *)&self->_hashedEmail, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_shareClock, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
}

@end
