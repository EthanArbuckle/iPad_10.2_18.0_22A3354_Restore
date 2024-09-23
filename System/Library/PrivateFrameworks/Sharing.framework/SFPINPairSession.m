@implementation SFPINPairSession

- (SFPINPairSession)init
{
  SFPINPairSession *v2;
  SFPINPairSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFPINPairSession;
  v2 = -[SFPINPairSession init](&v7, sel_init);
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
  id completionHandler;
  id promptForPINHandler;
  id showPINHandler;
  id hidePINHandler;
  SFPINPairSession *v7;
  SEL v8;
  objc_super v9;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v7 = (SFPINPairSession *)FatalErrorF();
    -[SFPINPairSession activate](v7, v8);
  }
  else
  {
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

    promptForPINHandler = self->_promptForPINHandler;
    self->_promptForPINHandler = 0;

    showPINHandler = self->_showPINHandler;
    self->_showPINHandler = 0;

    hidePINHandler = self->_hidePINHandler;
    self->_hidePINHandler = 0;

    v9.receiver = self;
    v9.super_class = (Class)SFPINPairSession;
    -[SFPINPairSession dealloc](&v9, sel_dealloc);
  }
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__SFPINPairSession_activate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__SFPINPairSession_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activate");
}

- (void)_activate
{
  const char *v3;
  OS_os_transaction *v4;
  OS_os_transaction *transaction;
  OS_dispatch_source *v6;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v8;
  const char *v9;
  _QWORD handler[5];

  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    if (self->_peerDevice)
      v3 = "client";
    else
      v3 = "server";
    v9 = v3;
    LogPrintF();
  }
  self->_activateCalled = 1;
  self->_startTicks = mach_absolute_time();
  if (!self->_transaction)
  {
    v4 = (OS_os_transaction *)os_transaction_create();
    transaction = self->_transaction;
    self->_transaction = v4;

    if (!self->_transaction
      && gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (!self->_heartbeatTimer)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_heartbeatLastTicks = mach_absolute_time();
    v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    heartbeatTimer = self->_heartbeatTimer;
    self->_heartbeatTimer = v6;

    v8 = self->_heartbeatTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __29__SFPINPairSession__activate__block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);
    SFDispatchTimerSet(self->_heartbeatTimer, 1.0, 1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_heartbeatTimer);
  }
  if (self->_peerDevice)
  {
    -[SFPINPairSession _clientRun](self, "_clientRun");
  }
  else if (!self->_sfService)
  {
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPINPairSession _completed:](self, "_completed:", 4294960591, v9);
  }
}

uint64_t __29__SFPINPairSession__activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hearbeatTimer");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SFPINPairSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__SFPINPairSession_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  OS_dispatch_source *heartbeatTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void (**completionHandler)(id, _QWORD);
  id v7;
  id promptForPINHandler;
  id showPINHandler;
  id hidePINHandler;
  OS_os_transaction *transaction;

  if (!self->_invalidateCalled
    && gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_invalidateCalled = 1;
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    v4 = heartbeatTimer;
    dispatch_source_cancel(v4);
    v5 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

  }
  -[SFPINPairSession _cleanup](self, "_cleanup");
  completionHandler = (void (**)(id, _QWORD))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0);
    v7 = self->_completionHandler;
  }
  else
  {
    v7 = 0;
  }
  self->_completionHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  showPINHandler = self->_showPINHandler;
  self->_showPINHandler = 0;

  hidePINHandler = self->_hidePINHandler;
  self->_hidePINHandler = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)_cleanup
{
  PairingSessionPrivate *pairSetupSession;
  PairingSessionPrivate *pairVerifySession;
  SFSession *sfSession;

  self->_pairSetupDone = 0;
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    CFRelease(pairSetupSession);
    self->_pairSetupSession = 0;
  }
  self->_pairVerifyDone = 0;
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  -[SFSession invalidate](self->_sfSession, "invalidate");
  sfSession = self->_sfSession;
  self->_sfSession = 0;

  self->_sfSessionActivated = 0;
}

- (void)_completed:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  void (**completionHandler)(id, void *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v19;
  OS_dispatch_source *v20;
  OS_os_transaction *transaction;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[4];
  uint64_t v26;
  _QWORD v27[2];

  v3 = *(_QWORD *)&a3;
  v27[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  mach_absolute_time();
  v5 = UpTicksToMilliseconds();
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    v22 = v5;
    v23 = v3;
    LogPrintF();
  }
  completionHandler = (void (**)(id, void *))self->_completionHandler;
  if (completionHandler)
  {
    if ((_DWORD)v3)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0CB2F90];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("?");
      if (v9)
        v11 = (const __CFString *)v9;
      v27[0] = v11;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v22, v23);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, (int)v3, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      completionHandler[2](completionHandler, v13);

    }
    else
    {
      completionHandler[2](self->_completionHandler, 0);
    }
    v14 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  v24[0] = CFSTR("_cat");
  v24[1] = CFSTR("_op");
  v25[0] = CFSTR("PINPair");
  v25[1] = CFSTR("Done");
  v24[2] = CFSTR("error");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3, v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v15;
  v24[3] = CFSTR("ms");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SFDashboardLogJSON(v17);

  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    v19 = heartbeatTimer;
    dispatch_source_cancel(v19);
    v20 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

  }
  -[SFPINPairSession _cleanup](self, "_cleanup");
  transaction = self->_transaction;
  self->_transaction = 0;

}

- (void)_hearbeatTimer
{
  unint64_t v3;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v5;
  OS_dispatch_source *v6;

  mach_absolute_time();
  v3 = UpTicksToMilliseconds();
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_pairSetupWaitingForUser || v3 >> 3 < 0x753)
  {
    if (self->_sfSessionActivated)
      -[SFPINPairSession _clientHeartbeatSend](self, "_clientHeartbeatSend");
  }
  else
  {
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    heartbeatTimer = self->_heartbeatTimer;
    if (heartbeatTimer)
    {
      v5 = heartbeatTimer;
      dispatch_source_cancel(v5);
      v6 = self->_heartbeatTimer;
      self->_heartbeatTimer = 0;

    }
    -[SFPINPairSession _completed:](self, "_completed:", 4294960574);
  }
}

- (void)_clientRun
{
  NSData *v3;
  NSData *clientSessionUUID;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_clientStarted)
  {
    v5[0] = 0;
    v5[1] = 0;
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPINPairSession _cleanup](self, "_cleanup");
    UUIDGet();
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, 16);
    v3 = (NSData *)objc_claimAutoreleasedReturnValue();
    clientSessionUUID = self->_clientSessionUUID;
    self->_clientSessionUUID = v3;

    self->_clientStarted = 1;
  }
  if (!self->_sfSession)
  {
    -[SFPINPairSession _clientSFSessionStart](self, "_clientSFSessionStart");
    return;
  }
  if (!self->_sfSessionActivated)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_17;
    }
    return;
  }
  if (!self->_pairVerifySession)
  {
    if (!self->_pairVerifyDone)
    {
      -[SFPINPairSession _clientPairVerify:start:](self, "_clientPairVerify:start:", 0, 1);
      return;
    }
    goto LABEL_19;
  }
  if (self->_pairVerifyDone)
  {
LABEL_19:
    if (self->_pairSetupSession)
    {
      if (!self->_pairSetupDone
        && gLogCategory_SFPINPairSession <= 30
        && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_17;
      }
    }
    else if (!self->_pairSetupDone)
    {
      -[SFPINPairSession _clientPairSetup:start:](self, "_clientPairSetup:start:", 0, 1);
    }
    return;
  }
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
LABEL_17:
    LogPrintF();
  }
}

- (void)_clientHeartbeatSend
{
  SFRequestMessage *v3;
  NSData *clientSessionUUID;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if (self->_heartbeatSending)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    self->_heartbeatSending = 1;
    v3 = objc_alloc_init(SFRequestMessage);
    v7[0] = CFSTR("op");
    v7[1] = CFSTR("sid");
    clientSessionUUID = self->_clientSessionUUID;
    v8[0] = &unk_1E4890B08;
    v8[1] = clientSessionUUID;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFMessage setHeaderFields:](v3, "setHeaderFields:", v5);

    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __40__SFPINPairSession__clientHeartbeatSend__block_invoke;
    v6[3] = &unk_1E48339F0;
    v6[4] = self;
    -[SFRequestMessage setResponseHandler:](v3, "setResponseHandler:", v6);
    -[SFSession sendRequest:](self->_sfSession, "sendRequest:", v3);

  }
}

void __40__SFPINPairSession__clientHeartbeatSend__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = mach_absolute_time();
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;

}

- (void)_clientSFSessionStart
{
  SFSession *v3;
  SFSession *sfSession;
  uint64_t v5;
  SFSession *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[SFSession invalidate](self->_sfSession, "invalidate");
  v3 = objc_alloc_init(SFSession);
  sfSession = self->_sfSession;
  self->_sfSession = v3;

  -[SFSession setDispatchQueue:](self->_sfSession, "setDispatchQueue:", self->_dispatchQueue);
  -[SFSession setPeerDevice:](self->_sfSession, "setPeerDevice:", self->_peerDevice);
  -[SFSession setServiceIdentifier:](self->_sfSession, "setServiceIdentifier:", CFSTR("com.apple.sharing.PINPair"));
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__SFPINPairSession__clientSFSessionStart__block_invoke;
  v9[3] = &unk_1E482DFF0;
  v9[4] = self;
  -[SFSession setErrorHandler:](self->_sfSession, "setErrorHandler:", v9);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __41__SFPINPairSession__clientSFSessionStart__block_invoke_2;
  v8[3] = &unk_1E482DF78;
  v8[4] = self;
  -[SFSession setInterruptionHandler:](self->_sfSession, "setInterruptionHandler:", v8);
  -[SFSession setInvalidationHandler:](self->_sfSession, "setInvalidationHandler:", &__block_literal_global_61);
  v6 = self->_sfSession;
  v7[0] = v5;
  v7[1] = 3221225472;
  v7[2] = __41__SFPINPairSession__clientSFSessionStart__block_invoke_4;
  v7[3] = &unk_1E482DFF0;
  v7[4] = self;
  -[SFSession activateWithCompletion:](v6, "activateWithCompletion:", v7);
}

void __41__SFPINPairSession__clientSFSessionStart__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (gLogCategory_SFPINPairSession <= 90
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_completed:", NSErrorToOSStatus());

}

uint64_t __41__SFPINPairSession__clientSFSessionStart__block_invoke_2(uint64_t a1)
{
  if (gLogCategory_SFPINPairSession <= 60
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(a1 + 32), "_completed:", 4294960534);
}

void __41__SFPINPairSession__clientSFSessionStart__block_invoke_3()
{
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void __41__SFPINPairSession__clientSFSessionStart__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3)
  {
    if (gLogCategory_SFPINPairSession <= 90
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_completed:", NSErrorToOSStatus());
  }
  else
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_clientRun");
  }

}

- (void)_clientPairVerify:(id)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PairingSessionPrivate *pairVerifySession;
  uint64_t v8;
  id v9;
  SFRequestMessage *v10;
  void *v11;
  uint64_t Int64Ranged;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSData *clientSessionUUID;
  void *v19;
  uint64_t v20;
  _QWORD v21[5];
  char v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v4 = a4;
  v27[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v25 = 0;
  v23 = 0;
  v24 = 0;
  v22 = 0;
  if (v4)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    pairVerifySession = self->_pairVerifySession;
    if (pairVerifySession)
    {
      CFRelease(pairVerifySession);
      self->_pairVerifySession = 0;
    }
    v8 = PairingSessionCreate();
    v25 = v8;
    if ((_DWORD)v8)
    {
      v9 = 0;
      v10 = 0;
      goto LABEL_38;
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    if (-[SFDevice osVersion](self->_peerDevice, "osVersion") >= 9)
      PairingSessionSetACL();
  }
  else
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (!self->_pairVerifySession)
    {
      v9 = 0;
      v10 = 0;
      v8 = 4294960551;
LABEL_53:
      v25 = v8;
      goto LABEL_38;
    }
  }
  if (v6)
  {
    objc_msgSend(v6, "headerFields");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Int64Ranged = CFDictionaryGetInt64Ranged();
    v25 = Int64Ranged;

    if ((_DWORD)Int64Ranged)
    {
      if (gLogCategory_SFPINPairSession <= 30)
      {
        if (gLogCategory_SFPINPairSession == -1 && !_LogCategory_Initialize())
          goto LABEL_58;
        v20 = Int64Ranged;
LABEL_50:
        LogPrintF();
LABEL_58:
        v10 = 0;
        v9 = 0;
        goto LABEL_37;
      }
LABEL_51:
      v10 = 0;
      v9 = 0;
      goto LABEL_42;
    }
    objc_msgSend(v6, "headerFields");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v25 = -6762;
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession == -1 && !_LogCategory_Initialize())
          goto LABEL_58;
        goto LABEL_50;
      }
      goto LABEL_51;
    }
  }
  else
  {
    v14 = 0;
  }
  v9 = objc_retainAutorelease(v14);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v15 = PairingSessionExchange();
  v25 = v15;
  if (v22 && !v15)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPINPairSession _completed:](self, "_completed:", 0);
    goto LABEL_36;
  }
  if (v15)
  {
LABEL_36:
    v10 = 0;
    goto LABEL_37;
  }
  if (!v24)
  {
    v10 = 0;
    v8 = 4294960534;
    goto LABEL_53;
  }
  v10 = objc_alloc_init(SFRequestMessage);
  v16 = &unk_1E4890B38;
  if (v4)
    v16 = &unk_1E4890B20;
  v27[0] = v16;
  v26[0] = CFSTR("op");
  v26[1] = CFSTR("pd");
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v24, v23, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26[2] = CFSTR("sid");
  clientSessionUUID = self->_clientSessionUUID;
  v27[1] = v17;
  v27[2] = clientSessionUUID;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMessage setHeaderFields:](v10, "setHeaderFields:", v19);

  v24 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __44__SFPINPairSession__clientPairVerify_start___block_invoke;
  v21[3] = &unk_1E48339F0;
  v21[4] = self;
  -[SFRequestMessage setResponseHandler:](v10, "setResponseHandler:", v21);
  -[SFSession sendRequest:](self->_sfSession, "sendRequest:", v10);
LABEL_37:
  v8 = v25;
  if (!v25)
    goto LABEL_43;
LABEL_38:
  if (gLogCategory_SFPINPairSession <= 30)
  {
    if (gLogCategory_SFPINPairSession == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_42;
      v8 = v25;
    }
    v20 = v8;
    LogPrintF();
  }
LABEL_42:
  self->_pairVerifyDone = 1;
  -[SFPINPairSession _clientRun](self, "_clientRun", v20);
LABEL_43:
  if (v24)
    free(v24);

}

void __44__SFPINPairSession__clientPairVerify_start___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    v6 = v5;
    v7 = v8;
    LogPrintF();
  }
  if (v8 || !v5)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      v6 = v8;
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
    objc_msgSend(*(id *)(a1 + 32), "_clientRun", v6, v7);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientPairVerify:start:", v5, 0);
  }

}

- (void)_clientPairSetup:(id)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PairingSessionPrivate *pairSetupSession;
  uint64_t v8;
  uint64_t v9;
  id v10;
  SFRequestMessage *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  NSData *clientSessionUUID;
  void *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[6];
  __int128 v24;
  uint64_t (*v25)(uint64_t, uint64_t, void *);
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  char v29;
  uint64_t v30;
  void *v31;
  unsigned int Int64Ranged;
  _QWORD v33[3];
  _QWORD v34[4];

  v4 = a4;
  v34[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Int64Ranged = 0;
  v30 = 0;
  v31 = 0;
  v29 = 0;
  if (v4)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v26 = 0;
    v28 = 0u;
    v27 = 0u;
    v24 = 0u;
    v23[5] = self;
    v25 = _clientPairSetupPromptForPIN;
    pairSetupSession = self->_pairSetupSession;
    if (pairSetupSession)
    {
      CFRelease(pairSetupSession);
      self->_pairSetupSession = 0;
    }
    v8 = PairingSessionCreate();
    Int64Ranged = v8;
    if ((_DWORD)v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = 0;
      goto LABEL_39;
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    if (-[SFDevice osVersion](self->_peerDevice, "osVersion") >= 9)
      PairingSessionSetACL();
  }
  else
  {
    if (!self->_pairSetupSession)
    {
      v10 = 0;
      v11 = 0;
      v9 = 4294960551;
      goto LABEL_57;
    }
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  if (v6)
  {
    objc_msgSend(v6, "headerFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    Int64Ranged = CFDictionaryGetInt64Ranged();

    v9 = Int64Ranged;
    if (Int64Ranged)
    {
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession == -1)
        {
          if (!_LogCategory_Initialize())
            goto LABEL_62;
          v9 = Int64Ranged;
        }
        v21 = v9;
LABEL_51:
        LogPrintF();
LABEL_62:
        v11 = 0;
        v10 = 0;
        goto LABEL_38;
      }
LABEL_52:
      v11 = 0;
      v10 = 0;
LABEL_43:
      -[SFPINPairSession _completed:](self, "_completed:", v9, v21);
      goto LABEL_44;
    }
    objc_msgSend(v6, "headerFields");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      v9 = 4294960534;
      Int64Ranged = -6762;
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession == -1 && !_LogCategory_Initialize())
          goto LABEL_62;
        goto LABEL_51;
      }
      goto LABEL_52;
    }
  }
  else
  {
    v14 = 0;
  }
  v10 = objc_retainAutorelease(v14);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v15 = PairingSessionExchange();
  Int64Ranged = v15;
  if (v29 && !v15)
  {
    if (gLogCategory_SFPINPairSession <= 30
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    -[SFPINPairSession _completed:](self, "_completed:", Int64Ranged);
    goto LABEL_37;
  }
  if (v15 != -6771)
  {
    if (v15)
    {
LABEL_37:
      v11 = 0;
      goto LABEL_38;
    }
    if (v31)
    {
      v11 = objc_alloc_init(SFRequestMessage);
      v16 = &unk_1E4890B68;
      if (v4)
        v16 = &unk_1E4890B50;
      v34[0] = v16;
      v33[0] = CFSTR("op");
      v33[1] = CFSTR("pd");
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v31, v30, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v33[2] = CFSTR("sid");
      clientSessionUUID = self->_clientSessionUUID;
      v34[1] = v17;
      v34[2] = clientSessionUUID;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFMessage setHeaderFields:](v11, "setHeaderFields:", v19);

      v31 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __43__SFPINPairSession__clientPairSetup_start___block_invoke;
      v23[3] = &unk_1E48339F0;
      v23[4] = self;
      -[SFRequestMessage setResponseHandler:](v11, "setResponseHandler:", v23);
      -[SFSession sendRequest:](self->_sfSession, "sendRequest:", v11);
LABEL_38:
      v9 = Int64Ranged;
      if (!Int64Ranged)
        goto LABEL_44;
LABEL_39:
      if (gLogCategory_SFPINPairSession <= 60)
      {
        if (gLogCategory_SFPINPairSession != -1 || (v20 = _LogCategory_Initialize(), v9 = Int64Ranged, v20))
        {
          v22 = v9;
          LogPrintF();
          -[SFPINPairSession _completed:](self, "_completed:", Int64Ranged, v22);
          goto LABEL_44;
        }
      }
      goto LABEL_43;
    }
    v11 = 0;
    v9 = 4294960534;
LABEL_57:
    Int64Ranged = v9;
    goto LABEL_39;
  }
  Int64Ranged = 0;
  if (gLogCategory_SFPINPairSession <= 30)
  {
    if (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    goto LABEL_37;
  }
  v11 = 0;
LABEL_44:
  if (v31)
    free(v31);

}

void __43__SFPINPairSession__clientPairSetup_start___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v6 || !v5)
  {
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_completed:", NSErrorToOSStatus());
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_clientPairSetup:start:", v5, 0);
  }

}

- (void)clientTryPIN:(id)a3
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
  v7[2] = __33__SFPINPairSession_clientTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __33__SFPINPairSession_clientTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)_clientTryPIN:(id)a3
{
  int v4;
  const __CFString *v5;
  uint64_t v6;
  const __CFString *v7;
  __CFString *v8;

  v8 = (__CFString *)a3;
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    v4 = IsAppleInternalBuild();
    v5 = CFSTR("*");
    if (v4)
      v5 = v8;
    v7 = v5;
    LogPrintF();
  }
  self->_pairSetupWaitingForUser = 0;
  if (self->_pairSetupSession)
  {
    -[__CFString UTF8String](objc_retainAutorelease(v8), "UTF8String");
    v6 = PairingSessionSetSetupCode();
    if (!(_DWORD)v6)
    {
      -[SFPINPairSession _clientPairSetup:start:](self, "_clientPairSetup:start:", 0, 0);
      goto LABEL_15;
    }
  }
  else
  {
    v6 = 4294960551;
  }
  if (gLogCategory_SFPINPairSession <= 60
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[SFPINPairSession _completed:](self, "_completed:", v6, v6);
  }
  else
  {
    -[SFPINPairSession _completed:](self, "_completed:", v6, v7);
  }
LABEL_15:

}

- (void)handleServerRequest:(id)a3
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
  v7[2] = __40__SFPINPairSession_handleServerRequest___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __40__SFPINPairSession_handleServerRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleServerRequest:", *(_QWORD *)(a1 + 40));
}

- (void)_handleServerRequest:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 Int64Ranged;
  const char *v7;
  SFPINPairSession *v8;
  id v9;
  uint64_t v10;
  SFPINPairSession *v11;
  id v12;
  uint64_t v13;
  const char *v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "headerFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_SFPINPairSession <= 30
    && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
  {
    if (Int64Ranged > 5u)
      v7 = "?";
    else
      v7 = off_1E4833A10[(char)Int64Ranged];
    v14 = v7;
    v15 = v4;
    LogPrintF();
  }
  switch(Int64Ranged)
  {
    case 1u:
      -[SFPINPairSession handleServerHeartbeat:](self, "handleServerHeartbeat:", v4);
      break;
    case 2u:
      v11 = self;
      v12 = v4;
      v13 = 1;
      goto LABEL_17;
    case 3u:
      v11 = self;
      v12 = v4;
      v13 = 0;
LABEL_17:
      -[SFPINPairSession handleServerPairVerify:reset:](v11, "handleServerPairVerify:reset:", v12, v13, v14, v15);
      break;
    case 4u:
      v8 = self;
      v9 = v4;
      v10 = 1;
      goto LABEL_19;
    case 5u:
      v8 = self;
      v9 = v4;
      v10 = 0;
LABEL_19:
      -[SFPINPairSession handleServerPairSetup:reset:](v8, "handleServerPairSetup:reset:", v9, v10, v14, v15);
      break;
    default:
      if (gLogCategory_SFPINPairSession <= 30
        && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }

}

- (void)handleServerHeartbeat:(id)a3
{
  id v4;
  SFResponseMessage *v5;

  v4 = a3;
  self->_heartbeatLastTicks = mach_absolute_time();
  v5 = -[SFResponseMessage initWithRequestMessage:]([SFResponseMessage alloc], "initWithRequestMessage:", v4);

  -[SFService sendResponse:](self->_sfService, "sendResponse:", v5);
}

- (void)handleServerPairVerify:(id)a3 reset:(BOOL)a4
{
  id v6;
  PairingSessionPrivate *pairVerifySession;
  SFResponseMessage *v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pairVerifySession = self->_pairVerifySession;
  if (a4)
  {
    if (pairVerifySession)
    {
      CFRelease(pairVerifySession);
      self->_pairVerifySession = 0;
    }
  }
  else if (pairVerifySession)
  {
    goto LABEL_11;
  }
  if (PairingSessionCreate())
  {
    v8 = 0;
    v9 = 0;
    goto LABEL_7;
  }
  PairingSessionSetFlags();
  PairingSessionSetLogging();
LABEL_11:
  objc_msgSend(v6, "headerFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if (gLogCategory_SFPINPairSession > 60)
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_21;
    }
    if (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    v8 = 0;
    goto LABEL_7;
  }
  v9 = objc_retainAutorelease(v9);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v16 = PairingSessionExchange();
  v8 = -[SFResponseMessage initWithRequestMessage:]([SFResponseMessage alloc], "initWithRequestMessage:", v6);
  v11 = v16;
  if (!v16)
  {
LABEL_7:
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  if (gLogCategory_SFPINPairSession <= 30)
  {
    if (gLogCategory_SFPINPairSession != -1 || (v12 = _LogCategory_Initialize(), v11 = v16, v12))
    {
      v15 = v11;
      LogPrintF();
      v11 = v16;
    }
  }
  v17 = CFSTR("err");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMessage setHeaderFields:](v8, "setHeaderFields:", v14);

  -[SFService sendResponse:](self->_sfService, "sendResponse:", v8);
LABEL_21:

}

- (void)handleServerPairSetup:(id)a3 reset:(BOOL)a4
{
  id v6;
  PairingSessionPrivate *pairSetupSession;
  SFResponseMessage *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pairSetupSession = self->_pairSetupSession;
  if (a4 || !pairSetupSession)
  {
    if (pairSetupSession)
    {
      CFRelease(pairSetupSession);
      self->_pairSetupSession = 0;
    }
    if (PairingSessionCreate())
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_7;
    }
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    PairingSessionSetACL();
  }
  objc_msgSend(v6, "headerFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (gLogCategory_SFPINPairSession > 60)
    {
      v8 = 0;
      v9 = 0;
      goto LABEL_21;
    }
    if (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize())
      LogPrintF();
    v9 = 0;
    v8 = 0;
    goto LABEL_7;
  }
  v9 = objc_retainAutorelease(v11);
  objc_msgSend(v9, "bytes");
  objc_msgSend(v9, "length");
  v17 = PairingSessionExchange();
  v8 = -[SFResponseMessage initWithRequestMessage:]([SFResponseMessage alloc], "initWithRequestMessage:", v6);
  v12 = v17;
  if (!v17)
  {
LABEL_7:
    if (gLogCategory_SFPINPairSession <= 60
      && (gLogCategory_SFPINPairSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  if (gLogCategory_SFPINPairSession <= 60)
  {
    if (gLogCategory_SFPINPairSession != -1 || (v13 = _LogCategory_Initialize(), v12 = v17, v13))
    {
      v16 = v12;
      LogPrintF();
      v12 = v17;
    }
  }
  v18 = CFSTR("err");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12, v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFMessage setHeaderFields:](v8, "setHeaderFields:", v15);

  -[SFService sendResponse:](self->_sfService, "sendResponse:", v8);
LABEL_21:

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
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

- (SFService)sfService
{
  return self->_sfService;
}

- (void)setSfService:(id)a3
{
  objc_storeStrong((id *)&self->_sfService, a3);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)showPINHandler
{
  return self->_showPINHandler;
}

- (void)setShowPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_showPINHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong((id *)&self->_sfService, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_sfSession, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_clientSessionUUID, 0);
}

@end
