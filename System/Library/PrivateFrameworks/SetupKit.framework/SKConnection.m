@implementation SKConnection

- (SKConnection)init
{
  SKConnection *v2;
  SKConnection *v3;
  NSMutableArray *v4;
  NSMutableArray *sendArray;
  SKConnection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SKConnection;
  v2 = -[SKConnection init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x24BDAC9B8]);
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sendArray = v3->_sendArray;
    v3->_sendArray = v4;

    v3->_ucat = (LogCategory *)&gLogCategory_SKConnection;
    RandomBytes();
    v6 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKConnection;
  -[SKConnection dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  NSString *v3;
  id v4;
  id v5;
  id v6;
  __CFString *v7;
  id *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v13;
  __CFString *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  int v18;

  v18 = 12;
  v3 = self->_label;
  v17 = 0;
  CUAppendF();
  v16 = 0;
  CUAppendF();
  v4 = v16;

  v15[3] = v4;
  CUAppendF();
  v5 = v4;

  v15[2] = v5;
  CUAppendF();
  v6 = v5;

  v15[1] = v6;
  CUAppendF();
  v7 = (__CFString *)v6;

  if (self->_bleConnection)
  {
    v15[0] = v7;
    v8 = (id *)v15;
  }
  else if (self->_blePeerDevice)
  {
    v14 = v7;
    v8 = (id *)&v14;
  }
  else
  {
    if (!self->_sendDataHandler)
      goto LABEL_8;
    v13 = v7;
    v8 = (id *)&v13;
  }
  CUAppendF();
  v9 = (__CFString *)*v8;

  v7 = v9;
LABEL_8:
  if (v7)
    v10 = v7;
  else
    v10 = &stru_24D22B2A0;
  v11 = v10;

  return (NSString *)v11;
}

- (void)setLabel:(id)a3
{
  id v4;

  objc_storeStrong((id *)&self->_label, a3);
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");

  LogCategoryReplaceF();
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__SKConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_24D22A928;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  CBConnection *bleConnection;
  int var0;
  uint64_t v9;
  void *v10;
  SKConnection *v11;
  uint64_t aBlock;
  uint64_t v13;
  uint64_t (*v14)(_QWORD *);
  void *v15;
  SKConnection *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__290;
  v23 = __Block_byref_object_dispose__291;
  v24 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __40__SKConnection__activateWithCompletion___block_invoke;
  v15 = &unk_24D22AC78;
  v18 = &v19;
  v16 = self;
  v5 = v4;
  v17 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&aBlock);
  if (self->_activateCalled || self->_invalidateCalled)
    goto LABEL_14;
  if (self->_blePeerDevice)
  {
    self->_clientMode = 1;
    goto LABEL_8;
  }
  bleConnection = self->_bleConnection;
  if (bleConnection)
  {
    self->_clientMode = 0;
    objc_storeStrong((id *)&self->_requestable, bleConnection);
    goto LABEL_8;
  }
  if (!self->_sendDataHandler)
  {
LABEL_14:
    NSErrorF_safe();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v20[5];
    v20[5] = v9;

    goto LABEL_13;
  }
LABEL_8:
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v11 = self;
    LogPrintF();
  }
  self->_activateCalled = 1;
  -[SKConnection _run](self, "_run", v11, aBlock, v13, v14, v15, v16);
  (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
LABEL_13:
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__SKConnection_invalidate__block_invoke;
  block[3] = &unk_24D22B0F0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidateWithError:(id)a3
{
  id v4;
  void *v5;
  int var0;
  void *v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    var0 = self->_ucat->var0;
    v8 = v4;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[SKConnection _invalidateCore:](self, "_invalidateCore:", v8, v7);
    -[SKConnection _invalidated](self, "_invalidated");
    v5 = v8;
  }

}

- (void)_invalidateCore:(id)a3
{
  NSError *v4;
  OS_dispatch_source *startTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  void *v8;
  void *v9;
  NSError *stepError;
  NSError *v11;
  NSError *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int var0;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void (**v22)(_QWORD, _QWORD);
  void (**v23)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSError *v27;
  void *v28;
  NSMutableArray *obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = (NSError *)a3;
  startTimer = self->_startTimer;
  if (startTimer)
  {
    v6 = startTimer;
    dispatch_source_cancel(v6);
    v7 = self->_startTimer;
    self->_startTimer = 0;

  }
  -[CBConnection invalidate](self->_bleConnection, "invalidate");
  if (self->_showPasswordCalled)
  {
    self->_showPasswordCalled = 0;
    v8 = _Block_copy(self->_authHidePasswordHandler);
    v9 = v8;
    if (v8)
      (*((void (**)(void *))v8 + 2))(v8);

  }
  stepError = v4;
  v27 = v4;
  if (v4 || (stepError = self->_stepError) != 0)
  {
    v11 = stepError;
  }
  else
  {
    NSErrorF_safe();
    v11 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v11);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = self->_sendArray;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v31;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v31 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
        var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v17, "requestID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (uint64_t)v19;
          if (!v19)
          {
            objc_msgSend(v17, "eventID");
            v20 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v20;
          }
          CUPrintNSError();
          v25 = v20;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          if (!v19)
        }
        objc_msgSend(v17, "timer", v25, v26);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setTimer:", 0);
        if (v21)
          dispatch_source_cancel(v21);
        objc_msgSend(v17, "completion");
        v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setCompletion:", 0);
        if (v22)
        {
          ((void (**)(_QWORD, NSError *))v22)[2](v22, v12);
        }
        else
        {
          objc_msgSend(v17, "responseHandler");
          v23 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setResponseHandler:", 0);
          if (v23)
            ((void (**)(_QWORD, _QWORD, _QWORD, NSError *))v23)[2](v23, 0, 0, v12);

        }
        ++v16;
      }
      while (v14 != v16);
      v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      v14 = v24;
    }
    while (v24);
  }

  -[NSMutableArray removeAllObjects](self->_sendArray, "removeAllObjects");
}

- (void)_invalidated
{
  OS_dispatch_source *startTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  id authCompletionHandler;
  id authShowPasswordHandler;
  id authHidePasswordHandler;
  id authPromptHandler;
  id errorHandler;
  id invalidationHandler;
  id pairSetupConfigHandler;
  id receivedEventHandler;
  id receivedRequestHandler;
  id sendDataHandler;
  id stateChangedHandler;
  void *v17;
  int var0;
  int v19;
  void *v20;

  if (!self->_invalidateDone && !self->_bleConnection)
  {
    -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
    -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
    startTimer = self->_startTimer;
    if (startTimer)
    {
      v4 = startTimer;
      dispatch_source_cancel(v4);
      v5 = self->_startTimer;
      self->_startTimer = 0;

    }
    v20 = _Block_copy(self->_invalidationHandler);
    authCompletionHandler = self->_authCompletionHandler;
    self->_authCompletionHandler = 0;

    authShowPasswordHandler = self->_authShowPasswordHandler;
    self->_authShowPasswordHandler = 0;

    authHidePasswordHandler = self->_authHidePasswordHandler;
    self->_authHidePasswordHandler = 0;

    authPromptHandler = self->_authPromptHandler;
    self->_authPromptHandler = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    pairSetupConfigHandler = self->_pairSetupConfigHandler;
    self->_pairSetupConfigHandler = 0;

    receivedEventHandler = self->_receivedEventHandler;
    self->_receivedEventHandler = 0;

    receivedRequestHandler = self->_receivedRequestHandler;
    self->_receivedRequestHandler = 0;

    sendDataHandler = self->_sendDataHandler;
    self->_sendDataHandler = 0;

    stateChangedHandler = self->_stateChangedHandler;
    self->_stateChangedHandler = 0;

    v17 = v20;
    self->_invalidateDone = 1;
    if (v20)
    {
      (*((void (**)(void *))v20 + 2))(v20);
      v17 = v20;
    }
    var0 = self->_ucat->var0;
    if (var0 <= 30)
    {
      if (var0 != -1 || (v19 = _LogCategory_Initialize(), v17 = v20, v19))
      {
        LogPrintF();
        v17 = v20;
      }
    }

  }
}

- (id)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 error:(id *)a8
{
  CUPairingSession *pairSetupSession;
  CUPairingSession *v15;
  id v16;
  id v17;

  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    v15 = pairSetupSession;
  }
  else
  {
    v15 = self->_pairVerifySession;
    if (!v15)
    {
      if (a8)
      {
        NSErrorF_safe();
        v17 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      return v17;
    }
  }
  v16 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", a7));
  if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](v15, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", a3, a4, a5, a6, a7, objc_msgSend(v16, "mutableBytes")))
  {
    if (a8)
    {
      NSErrorF_safe();
      v17 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = 0;
    }
  }
  else
  {
    v17 = v16;
  }

  return v17;
}

- (void)_pairSetupInvalidate
{
  OS_dispatch_source *authThrottleTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  CUPairingSession *pairSetupSession;

  authThrottleTimer = self->_authThrottleTimer;
  if (authThrottleTimer)
  {
    v4 = authThrottleTimer;
    dispatch_source_cancel(v4);
    v5 = self->_authThrottleTimer;
    self->_authThrottleTimer = 0;

  }
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0);
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", 0);
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

}

- (void)_pairVerifyInvalidate
{
  CUPairingSession *pairVerifySession;

  -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", 0);
  -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", 0);
  -[CUPairingSession invalidate](self->_pairVerifySession, "invalidate");
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0;

}

- (void)_pskPrepareClientMode:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSData *v6;
  char v7;
  id v8;
  int var0;
  NSError *v10;
  NSError *stepError;
  id v12;

  v3 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE29810]);
  v6 = self->_pskData;
  v12 = 0;
  v7 = objc_msgSend(v5, "prepareWithName:isClient:pskData:error:", CFSTR("main"), v3, v6, &v12);
  v8 = v12;
  if ((v7 & 1) != 0)
  {
    objc_storeStrong((id *)&self->_mainStream, v5);
    self->_mainAuthTagLength = objc_msgSend(v5, "authTagLength");
  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    NSErrorNestedF();
    v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    stepError = self->_stepError;
    self->_stepError = v10;

  }
}

- (void)_run
{
  if (self->_clientMode)
    -[SKConnection _clientRun](self, "_clientRun");
  else
    -[SKConnection _serverRun](self, "_serverRun");
}

- (void)tryPassword:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__SKConnection_tryPassword___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)updatePasswordType:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __35__SKConnection_updatePasswordType___block_invoke;
  v4[3] = &unk_24D22A4C0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_updateExternalState
{
  int state;
  unsigned int v3;
  int v4;
  int var0;
  void *v7;
  uint64_t v8;
  id v9;

  state = self->_state;
  v3 = (self->_runState - 20) & 0xFFFFFFF7;
  v4 = v3 == 0;
  if (state != v4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_state = v4;
    v7 = _Block_copy(self->_stateChangedHandler);
    if (v7)
    {
      v9 = v7;
      (*((void (**)(void *, uint64_t))v7 + 2))(v7, v8);
      v7 = v9;
    }

  }
}

- (void)_clientRun
{
  unint64_t runState;
  int v4;
  void *v5;
  unint64_t v6;
  int var0;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      runState = self->_runState;
      switch((int)runState)
      {
        case 0:
          self->_runState = 11;
          goto LABEL_32;
        case 11:
          self->_runState = 12;
          -[SKConnection _clientConnectStart](self, "_clientConnectStart");
          goto LABEL_32;
        case 12:
          if (self->_stepError)
            goto LABEL_24;
          if (self->_stepDone)
          {
            if (!-[NSData length](self->_pskData, "length"))
              goto LABEL_20;
            v4 = 19;
            goto LABEL_31;
          }
          goto LABEL_32;
        case 13:
          self->_runState = 14;
          -[SKConnection _clientPairVerifyStart](self, "_clientPairVerifyStart");
          goto LABEL_32;
        case 14:
          if (!self->_stepError)
            goto LABEL_15;
          v4 = 15;
          goto LABEL_31;
        case 15:
          if (self->_reversePairing)
          {
            v4 = 17;
LABEL_31:
            self->_runState = v4;
          }
          else
          {
            self->_runState = 16;
            -[SKConnection _clientPairSetupStart](self, "_clientPairSetupStart");
          }
LABEL_32:
          v6 = self->_runState;
          if (v6 == runState)
            return;
          var0 = self->_ucat->var0;
          if (var0 > 30)
            goto LABEL_41;
          if (var0 != -1)
            goto LABEL_35;
          if (_LogCategory_Initialize())
          {
            v6 = self->_runState;
LABEL_35:
            v8 = "?";
            if (runState <= 0x1D)
              v8 = off_24D229FF8[runState];
            v9 = "?";
            if (v6 <= 0x1D)
              v9 = off_24D229FF8[v6];
            v10 = v8;
            v11 = v9;
            LogPrintF();
          }
LABEL_41:
          -[SKConnection _updateExternalState](self, "_updateExternalState", v10, v11);
          break;
        case 16:
        case 18:
          if (self->_stepError)
            goto LABEL_24;
LABEL_15:
          if (!self->_stepDone)
            goto LABEL_32;
LABEL_22:
          v4 = 20;
          goto LABEL_31;
        case 17:
          -[SKConnection _clientPairSetupStartReverse](self, "_clientPairSetupStartReverse");
LABEL_20:
          v4 = self->_runState + 1;
          goto LABEL_31;
        case 19:
          -[SKConnection _pskPrepareClientMode:](self, "_pskPrepareClientMode:", 1);
          if (!self->_stepError)
            goto LABEL_22;
          goto LABEL_24;
        case 20:
          if (self->_stepError)
LABEL_24:
            self->_runState = 21;
          else
            -[SKConnection _processSends](self, "_processSends");
          goto LABEL_32;
        case 21:
          if (self->_stepError)
          {
            -[SKConnection _clientError:](self, "_clientError:");
          }
          else
          {
            NSErrorF_safe();
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKConnection _clientError:](self, "_clientError:", v5);

          }
          v4 = 3;
          goto LABEL_31;
        default:
          goto LABEL_32;
      }
    }
  }
}

- (void)_clientConnectStart
{
  NSError *v3;
  NSError *stepError;

  if (self->_blePeerDevice)
  {
    -[SKConnection _clientConnectStartBLE](self, "_clientConnectStartBLE");
  }
  else if (self->_sendDataHandler)
  {
    self->_stepDone = 1;
  }
  else
  {
    NSErrorF_safe();
    v3 = (NSError *)objc_claimAutoreleasedReturnValue();
    stepError = self->_stepError;
    self->_stepError = v3;

  }
}

- (void)_clientConnectStartBLE
{
  NSError *stepError;
  int var0;
  id v5;
  unsigned int v6;
  uint64_t v7;
  const __CFString *label;
  void *v9;
  id v10;
  uint64_t v11;
  NSError *v12;
  NSError *v13;
  SKDevice *blePeerDevice;
  _QWORD v15[6];
  _QWORD v16[6];
  _QWORD v17[6];

  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  -[CBConnection invalidate](self->_bleConnection, "invalidate");
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    blePeerDevice = self->_blePeerDevice;
    LogPrintF();
  }
  v5 = objc_alloc_init(MEMORY[0x24BDBB230]);
  objc_storeStrong((id *)&self->_bleConnection, v5);
  v6 = -[SKDevice blePSM](self->_blePeerDevice, "blePSM");
  if (v6)
    v7 = v6;
  else
    v7 = 130;
  objc_msgSend(v5, "setBlePSM:", v7, blePeerDevice);
  objc_msgSend(v5, "setConnectionFlags:", 64);
  objc_msgSend(v5, "setConnectTimeoutSeconds:", 10.0);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("SKCnx");
  objc_msgSend(v5, "setLabel:", label);
  objc_msgSend(v5, "setUseCase:", self->_bluetoothUseCase);
  -[SKDevice identifier](self->_blePeerDevice, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x24BDBB240]);
    objc_msgSend(v10, "setIdentifier:", v9);
    objc_msgSend(v5, "setPeerDevice:", v10);
    v11 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __38__SKConnection__clientConnectStartBLE__block_invoke;
    v17[3] = &unk_24D22B140;
    v17[4] = v5;
    v17[5] = self;
    objc_msgSend(v5, "setErrorHandler:", v17);
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __38__SKConnection__clientConnectStartBLE__block_invoke_2;
    v16[3] = &unk_24D22AFC8;
    v16[4] = v5;
    v16[5] = self;
    objc_msgSend(v5, "setInvalidationHandler:", v16);
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __38__SKConnection__clientConnectStartBLE__block_invoke_3;
    v15[3] = &unk_24D22B140;
    v15[4] = v5;
    v15[5] = self;
    objc_msgSend(v5, "activateWithCompletion:", v15);

  }
  else
  {
    NSErrorF_safe();
    v12 = (NSError *)objc_claimAutoreleasedReturnValue();
    v13 = self->_stepError;
    self->_stepError = v12;

  }
}

- (void)_clientConnectCompleted:(id)a3
{
  id v4;
  int var0;
  NSError *v6;
  NSError *stepError;
  void *v8;
  id v9;

  v4 = a3;
  var0 = self->_ucat->var0;
  v9 = v4;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    if (!self->_stepError)
    {
      NSErrorNestedF();
      v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v6;

    }
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (!self->_readRequested)
      -[SKConnection _receiveStart:](self, "_receiveStart:", 0);
    self->_stepDone = 1;
  }
  -[SKConnection _run](self, "_run", v8);

}

- (void)_clientPairSetupStart
{
  NSError *stepError;
  int var0;
  id v5;
  uint64_t v6;
  const __CFString *label;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[6];
  _QWORD v11[6];

  -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = objc_alloc_init(MEMORY[0x24BE29808]);
  objc_storeStrong((id *)&self->_pairSetupSession, v5);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v5, "setFixedPIN:", self->_password);
  if (self->_conditionalPersistent)
  {
    v6 = 520;
  }
  else if (self->_persistentPairing)
  {
    v6 = 8;
  }
  else
  {
    v6 = 24;
  }
  objc_msgSend(v5, "setFlags:", v6);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("SKCnx");
  objc_msgSend(v5, "setLabel:", label);
  objc_msgSend(v5, "setSessionType:", 1);
  v8 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__SKConnection__clientPairSetupStart__block_invoke;
  v11[3] = &unk_24D229DF8;
  v11[4] = self;
  v11[5] = v5;
  objc_msgSend(v5, "setPromptForPINHandler:", v11);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __37__SKConnection__clientPairSetupStart__block_invoke_2;
  v10[3] = &unk_24D229E20;
  v10[4] = v5;
  v10[5] = self;
  objc_msgSend(v5, "setSendDataHandler:", v10);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __37__SKConnection__clientPairSetupStart__block_invoke_3;
  v9[3] = &unk_24D22B140;
  v9[4] = v5;
  v9[5] = self;
  objc_msgSend(v5, "setCompletionHandler:", v9);
  objc_msgSend(v5, "activate");

}

- (void)_clientPairSetupStartReverse
{
  int var0;
  NSError *stepError;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  v6 = CFSTR("_pairReverse");
  v7[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKConnection _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 2, v5);

}

- (void)_clientPairSetupContinueWithData:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  CUPairingSession *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int var0;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  objc_class *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD aBlock[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v4 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__290;
  v25 = __Block_byref_object_dispose__291;
  v26 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __49__SKConnection__clientPairSetupContinueWithData___block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v21;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  v6 = self->_pairSetupSession;
  if (!v6)
  {
    NSErrorF_safe();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v22[5];
    v22[5] = v12;

    goto LABEL_13;
  }
  v7 = (void *)OPACKDecodeData();
  if (!v7)
  {
    v14 = (id)NSErrorF_safe();
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v18 = (void *)v22[5];
    v22[5] = v16;

    goto LABEL_11;
  }
  CUDecodeNSErrorDictionary();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v22[5];
  v22[5] = v8;

  if (v22[5])
  {
    v17 = (id)NSErrorNestedF();
    goto LABEL_12;
  }
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v4, "length");
    CUPrintNSObjectOneLineEx();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    NSErrorF_safe();
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[CUPairingSession receivedData:](v6, "receivedData:", v11);
LABEL_11:

LABEL_12:
LABEL_13:

  v5[2](v5);
  _Block_object_dispose(&v21, 8);

}

- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 passwordType:(int)a4 throttleSeconds:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int var0;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  OS_dispatch_source *authThrottleTimer;
  OS_dispatch_source **p_authThrottleTimer;
  NSObject *v15;
  OS_dispatch_source *v16;
  dispatch_source_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD handler[6];
  int v23;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    CUPrintFlags32();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

    if ((v7 & 0x20000) == 0)
      goto LABEL_14;
  }
  else if ((v7 & 0x20000) == 0)
  {
    goto LABEL_14;
  }
  if ((int)v5 < 1)
  {
LABEL_14:
    v20 = _Block_copy(self->_authPromptHandler);
    if (v20)
    {
      v21 = v20;
      (*((void (**)(void *, uint64_t, uint64_t, _QWORD))v20 + 2))(v20, v6, v7, 0);
      v20 = v21;
    }

    return;
  }
  v11 = mach_absolute_time();
  v12 = SecondsToUpTicks();
  p_authThrottleTimer = &self->_authThrottleTimer;
  authThrottleTimer = self->_authThrottleTimer;
  self->_authThrottleDeadlineTicks = v12 + v11;
  if (authThrottleTimer)
  {
    v15 = authThrottleTimer;
    dispatch_source_cancel(v15);
    v16 = *p_authThrottleTimer;
    *p_authThrottleTimer = 0;

  }
  v17 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_authThrottleTimer, v17);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __77__SKConnection__clientPairSetupPromptWithFlags_passwordType_throttleSeconds___block_invoke;
  handler[3] = &unk_24D229E48;
  handler[4] = v17;
  handler[5] = self;
  v23 = v6;
  dispatch_source_set_event_handler(v17, handler);
  CUDispatchTimerSet();
  dispatch_activate(v17);
  v18 = _Block_copy(self->_authPromptHandler);
  v19 = v18;
  if (v18)
    (*((void (**)(void *, uint64_t, uint64_t, uint64_t))v18 + 2))(v18, v6, v7, v5);

}

- (void)_clientPairSetupCompleted:(id)a3
{
  id v4;
  OS_dispatch_source *authThrottleTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  id v8;
  id v9;
  CUPairingSession *pairSetupSession;
  CUPairingStream *v11;
  CUPairingStream *mainStream;
  int var0;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;

  v4 = a3;
  authThrottleTimer = self->_authThrottleTimer;
  if (authThrottleTimer)
  {
    v6 = authThrottleTimer;
    dispatch_source_cancel(v6);
    v7 = self->_authThrottleTimer;
    self->_authThrottleTimer = 0;

  }
  v8 = v4;
  v9 = v8;
  if (v8)
    goto LABEL_5;
  pairSetupSession = self->_pairSetupSession;
  v19 = 0;
  -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", CFSTR("main"), &v19);
  v11 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  v9 = v19;
  mainStream = self->_mainStream;
  self->_mainStream = v11;

  if (v9)
  {
LABEL_5:
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v18);
    }
    else
    {
      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v17);
    }
  }
  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v9 = 0;
  }
  v14 = _Block_copy(self->_authCompletionHandler);
  v15 = v14;
  if (v14)
    (*((void (**)(void *, id))v14 + 2))(v14, v9);

  if (!self->_stepError)
    objc_storeStrong((id *)&self->_stepError, v9);
  self->_stepDone = 1;
  -[SKConnection _run](self, "_run");

}

- (void)_clientPairVerifyStart
{
  NSError *stepError;
  int var0;
  id v5;
  uint64_t v6;
  const __CFString *label;
  uint64_t v8;
  _QWORD v9[6];
  _QWORD v10[6];

  -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v5 = objc_alloc_init(MEMORY[0x24BE29808]);
  objc_storeStrong((id *)&self->_pairVerifySession, v5);
  objc_msgSend(v5, "setDispatchQueue:", self->_dispatchQueue);
  v6 = 8;
  if (!self->_conditionalPersistent)
  {
    if (self->_persistentPairing)
      v6 = 8;
    else
      v6 = 0x400000;
  }
  objc_msgSend(v5, "setFlags:", v6);
  if (self->_label)
    label = (const __CFString *)self->_label;
  else
    label = CFSTR("SKCnx");
  objc_msgSend(v5, "setLabel:", label);
  objc_msgSend(v5, "setSessionType:", 3);
  v8 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__SKConnection__clientPairVerifyStart__block_invoke;
  v10[3] = &unk_24D229E20;
  v10[4] = v5;
  v10[5] = self;
  objc_msgSend(v5, "setSendDataHandler:", v10);
  v9[0] = v8;
  v9[1] = 3221225472;
  v9[2] = __38__SKConnection__clientPairVerifyStart__block_invoke_2;
  v9[3] = &unk_24D22B140;
  v9[4] = v5;
  v9[5] = self;
  objc_msgSend(v5, "setCompletionHandler:", v9);
  objc_msgSend(v5, "activate");

}

- (void)_clientPairVerifyWithData:(id)a3
{
  id v4;
  void (**v5)(_QWORD);
  void *v6;
  int var0;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD aBlock[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__290;
  v23 = __Block_byref_object_dispose__291;
  v24 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__SKConnection__clientPairVerifyWithData___block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v19;
  v5 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (self->_pairVerifySession)
  {
    v6 = (void *)OPACKDecodeData();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v4, "length");
          CUPrintNSObjectOneLineEx();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        CFDataGetTypeID();
        CFDictionaryGetTypedValue();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v8);
        }
        else
        {
          NSErrorF_safe();
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v20[5];
          v20[5] = v15;

          v8 = 0;
        }
      }
      else
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        NSErrorF_safe();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v20[5];
        v20[5] = v13;

      }
    }
    else
    {
      NSErrorF_safe();
      v11 = objc_claimAutoreleasedReturnValue();
      v8 = (void *)v20[5];
      v20[5] = v11;
    }

  }
  else
  {
    NSErrorF_safe();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v20[5];
    v20[5] = v9;

  }
  v5[2](v5);

  _Block_object_dispose(&v19, 8);
}

- (void)_clientPairVerifyCompleted:(id)a3
{
  id v4;
  id v5;
  CUPairingSession *pairVerifySession;
  CUPairingStream *v7;
  CUPairingStream *mainStream;
  int var0;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
    goto LABEL_3;
  pairVerifySession = self->_pairVerifySession;
  v15 = 0;
  -[CUPairingSession openStreamWithName:error:](pairVerifySession, "openStreamWithName:error:", CFSTR("main"), &v15);
  v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  v5 = v15;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v14);
    }
    else
    {
      -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v13);
    }
  }
  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v11 = _Block_copy(self->_authCompletionHandler);
    v12 = v11;
    if (v11)
      (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);

    v5 = 0;
  }
  if (!self->_stepError)
    objc_storeStrong((id *)&self->_stepError, v5);
  self->_stepDone = 1;
  -[SKConnection _run](self, "_run");

}

- (void)_clientError:(id)a3
{
  id v4;
  int var0;
  int v6;
  OS_dispatch_source *startTimer;
  NSObject *v8;
  OS_dispatch_source *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  var0 = self->_ucat->var0;
  v12 = v4;
  if (var0 <= 90)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v12, v6))
    {
      CUPrintNSError();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v12;
    }
  }
  startTimer = self->_startTimer;
  if (startTimer)
  {
    v8 = startTimer;
    dispatch_source_cancel(v8);
    v9 = self->_startTimer;
    self->_startTimer = 0;

    v4 = v12;
  }
  if (v4)
  {
    -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:");
  }
  else
  {
    NSErrorF_safe();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:", v10);

  }
  -[CBConnection invalidate](self->_bleConnection, "invalidate", v11);
  -[SKConnection _invalidateWithError:](self, "_invalidateWithError:", v12);

}

- (void)_serverRun
{
  uint64_t runState;
  unsigned int v4;
  int var0;
  const char *v6;
  char *v7;
  const char *v8;

  if (!self->_invalidateCalled)
  {
    while (1)
    {
      runState = self->_runState;
      switch((int)runState)
      {
        case 23:
          -[SKConnection _serverAccept](self, "_serverAccept");
          if (!-[NSData length](self->_pskData, "length"))
            goto LABEL_11;
          v4 = 27;
          goto LABEL_21;
        case 24:
          if (self->_reversePairing)
          {
            v4 = 25;
LABEL_21:
            self->_runState = v4;
            goto LABEL_22;
          }
          if (self->_stepError)
          {
LABEL_20:
            v4 = 29;
            goto LABEL_21;
          }
          if (self->_stepDone)
          {
            self->_stepDone = 0;
LABEL_16:
            v4 = 28;
            goto LABEL_21;
          }
          v4 = 24;
LABEL_22:
          if (v4 == (_DWORD)runState)
            return;
          var0 = self->_ucat->var0;
          if (var0 > 30)
            goto LABEL_29;
          if (var0 != -1)
            goto LABEL_25;
          if (_LogCategory_Initialize())
          {
            v4 = self->_runState;
LABEL_25:
            v6 = "?";
            if (v4 <= 0x1D)
              v6 = off_24D229FF8[v4];
            v7 = off_24D229FF8[runState];
            v8 = v6;
            LogPrintF();
          }
LABEL_29:
          -[SKConnection _updateExternalState](self, "_updateExternalState", v7, v8);
          break;
        case 25:
          -[SKConnection _clientPairSetupStart](self, "_clientPairSetupStart");
LABEL_11:
          v4 = self->_runState + 1;
          goto LABEL_21;
        case 26:
          if (self->_stepError)
            goto LABEL_20;
          if (self->_stepDone)
            goto LABEL_16;
          v4 = 26;
          goto LABEL_22;
        case 27:
          -[SKConnection _pskPrepareClientMode:](self, "_pskPrepareClientMode:", 0);
          if (!self->_stepError)
            goto LABEL_16;
          goto LABEL_20;
        case 28:
          if (self->_stepError)
            goto LABEL_20;
          -[SKConnection _processSends](self, "_processSends");
          v4 = self->_runState;
          goto LABEL_22;
        case 29:
          goto LABEL_7;
        default:
          if ((_DWORD)runState)
            return;
LABEL_7:
          v4 = 23;
          goto LABEL_21;
      }
    }
  }
}

- (void)_serverAccept
{
  NSError *stepError;
  NSError *v4;
  NSError *v5;

  -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate");
  -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate");
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_reversePairing = 0;
  if (self->_bleConnection)
  {
    -[SKConnection _serverAcceptBLE](self, "_serverAcceptBLE");
  }
  else if (self->_sendDataHandler)
  {
    self->_stepDone = 1;
  }
  else
  {
    NSErrorF_safe();
    v4 = (NSError *)objc_claimAutoreleasedReturnValue();
    v5 = self->_stepError;
    self->_stepError = v4;

  }
}

- (void)_serverAcceptBLE
{
  CBConnection *bleConnection;
  uint64_t v4;
  CBConnection *v5;
  _QWORD v6[6];
  _QWORD v7[6];

  bleConnection = self->_bleConnection;
  v4 = MEMORY[0x24BDAC760];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__SKConnection__serverAcceptBLE__block_invoke;
  v7[3] = &unk_24D22B140;
  v7[4] = bleConnection;
  v7[5] = self;
  v5 = bleConnection;
  -[CBConnection setErrorHandler:](v5, "setErrorHandler:", v7);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __32__SKConnection__serverAcceptBLE__block_invoke_2;
  v6[3] = &unk_24D22AFC8;
  v6[4] = v5;
  v6[5] = self;
  -[CBConnection setInvalidationHandler:](v5, "setInvalidationHandler:", v6);
  -[SKConnection _receiveStart:](self, "_receiveStart:", 0);

}

- (void)_serverPairSetupContinueWithData:(id)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t Int64;
  int v11;
  int var0;
  id v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *label;
  void *v18;
  uint64_t v19;
  objc_class *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[6];
  _QWORD v28[6];
  _QWORD v29[6];
  _QWORD v30[6];
  int v31;
  _QWORD aBlock[6];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v4 = a4;
  v6 = a3;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__290;
  v37 = __Block_byref_object_dispose__291;
  v38 = 0;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v33;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v31 = 0;
  v9 = (void *)OPACKDecodeData();
  if (!v9)
  {
    NSErrorF_safe();
    v19 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v34[5];
    v34[5] = v19;
LABEL_33:

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v34[5];
    v34[5] = v21;

    goto LABEL_33;
  }
  if (!v4)
  {
    if (self->_pairSetupSession)
    {
      var0 = self->_ucat->var0;
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize())
        goto LABEL_31;
      objc_msgSend(v6, "length");
      CUPrintNSObjectOneLineEx();
      v13 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
LABEL_30:

LABEL_31:
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v18);
      }
      else
      {
        NSErrorF_safe();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v34[5];
        v34[5] = v23;

        v18 = 0;
      }
      goto LABEL_33;
    }
LABEL_12:
    v14 = self->_ucat->var0;
    if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
    {
      v15 = objc_msgSend(v6, "length");
      CUPrintNSObjectOneLineEx();
      v25 = v15;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v25, v26);
    v13 = objc_alloc_init(MEMORY[0x24BE29808]);
    objc_storeStrong((id *)&self->_pairSetupSession, v13);
    objc_msgSend(v13, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v13, "setFixedPIN:", self->_password);
    if (self->_conditionalPersistent)
    {
      v16 = 520;
    }
    else if (self->_persistentPairing)
    {
      v16 = 8;
    }
    else
    {
      v16 = 24;
    }
    objc_msgSend(v13, "setFlags:", v16);
    if (self->_label)
      label = (const __CFString *)self->_label;
    else
      label = CFSTR("SKCnx");
    objc_msgSend(v13, "setLabel:", label);
    objc_msgSend(v13, "setPinType:", self->_passwordType);
    objc_msgSend(v13, "setSessionType:", 2);
    if (self->_authShowPasswordHandler)
    {
      v30[0] = v7;
      v30[1] = 3221225472;
      v30[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_2;
      v30[3] = &unk_24D229E70;
      v30[4] = v13;
      v30[5] = self;
      objc_msgSend(v13, "setShowPINHandlerEx:", v30);
    }
    else
    {
      objc_msgSend(v13, "setFlags:", objc_msgSend(v13, "flags") | 0x80);
    }
    if (self->_authHidePasswordHandler)
    {
      v29[0] = v7;
      v29[1] = 3221225472;
      v29[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_3;
      v29[3] = &unk_24D22AFC8;
      v29[4] = v13;
      v29[5] = self;
      objc_msgSend(v13, "setHidePINHandler:", v29);
    }
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_4;
    v28[3] = &unk_24D229E20;
    v28[4] = v13;
    v28[5] = self;
    objc_msgSend(v13, "setSendDataHandler:", v28);
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_5;
    v27[3] = &unk_24D22B140;
    v27[4] = v13;
    v27[5] = self;
    objc_msgSend(v13, "setCompletionHandler:", v27);
    objc_msgSend(v13, "activate");
    goto LABEL_30;
  }
  Int64 = CFDictionaryGetInt64();
  self->_reversePairing = Int64 != 0;
  if (!Int64)
    goto LABEL_12;
  v11 = self->_ucat->var0;
  if (v11 <= 30 && (v11 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[SKConnection _run](self, "_run");
LABEL_36:

  v8[2](v8);
  _Block_object_dispose(&v33, 8);

}

- (void)_serverPairSetupCompleted:(id)a3
{
  id v4;
  id v5;
  CUPairingSession *pairSetupSession;
  CUPairingStream *v7;
  CUPairingStream *mainStream;
  int var0;
  int runState;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
    goto LABEL_3;
  pairSetupSession = self->_pairSetupSession;
  v16 = 0;
  -[CUPairingSession openStreamWithName:error:](pairSetupSession, "openStreamWithName:error:", CFSTR("main"), &v16);
  v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  v5 = v16;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v15);
    }
    else
    {
      -[SKConnection _pairSetupInvalidate](self, "_pairSetupInvalidate", v14);
    }
  }
  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    v13 = self->_ucat->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = 0;
  }
  runState = self->_runState;
  if (runState == 24 || runState == 18)
  {
    v11 = _Block_copy(self->_authCompletionHandler);
    v12 = v11;
    if (v11)
      (*((void (**)(void *, id))v11 + 2))(v11, v5);

    if (!self->_stepError)
      objc_storeStrong((id *)&self->_stepError, v5);
    self->_stepDone = 1;
    -[SKConnection _run](self, "_run");
  }

}

- (void)_serverPairVerifyContinueWithData:(id)a3 start:(BOOL)a4
{
  id v6;
  uint64_t v7;
  void (**v8)(_QWORD);
  void *v9;
  int v10;
  id v11;
  int var0;
  uint64_t v13;
  uint64_t v14;
  const __CFString *label;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[6];
  _QWORD v26[6];
  int v27;
  _QWORD aBlock[6];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__290;
  v33 = __Block_byref_object_dispose__291;
  v34 = 0;
  v7 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v29;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  v27 = 0;
  v9 = (void *)OPACKDecodeData();
  if (!v9)
  {
    NSErrorF_safe();
    v17 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v30[5];
    v30[5] = v17;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v30[5];
    v30[5] = v19;

    goto LABEL_22;
  }
  if (a4 || !self->_pairVerifySession)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v13 = objc_msgSend(v6, "length");
      CUPrintNSObjectOneLineEx();
      v23 = v13;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v23, v24);
    v11 = objc_alloc_init(MEMORY[0x24BE29808]);
    objc_storeStrong((id *)&self->_pairVerifySession, v11);
    objc_msgSend(v11, "setDispatchQueue:", self->_dispatchQueue);
    if (self->_conditionalPersistent || self->_persistentPairing)
      v14 = 8;
    else
      v14 = 0x400000;
    objc_msgSend(v11, "setFlags:", v14);
    if (self->_label)
      label = (const __CFString *)self->_label;
    else
      label = CFSTR("SKCnx");
    objc_msgSend(v11, "setLabel:", label);
    objc_msgSend(v11, "setSessionType:", 4);
    v26[0] = v7;
    v26[1] = 3221225472;
    v26[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_2;
    v26[3] = &unk_24D229E20;
    v26[4] = v11;
    v26[5] = self;
    objc_msgSend(v11, "setSendDataHandler:", v26);
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_3;
    v25[3] = &unk_24D22B140;
    v25[4] = v11;
    v25[5] = self;
    objc_msgSend(v11, "setCompletionHandler:", v25);
    objc_msgSend(v11, "activate");
  }
  else
  {
    v10 = self->_ucat->var0;
    if (v10 > 30 || v10 == -1 && !_LogCategory_Initialize())
      goto LABEL_20;
    objc_msgSend(v6, "length");
    CUPrintNSObjectOneLineEx();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

LABEL_20:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v16);
  }
  else
  {
    NSErrorF_safe();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v30[5];
    v30[5] = v21;

    v16 = 0;
  }
LABEL_22:

  v8[2](v8);
  _Block_object_dispose(&v29, 8);

}

- (void)_serverPairVerifyCompleted:(id)a3
{
  id v4;
  id v5;
  CUPairingSession *pairVerifySession;
  CUPairingStream *v7;
  CUPairingStream *mainStream;
  int var0;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  v5 = v4;
  if (v4)
    goto LABEL_3;
  pairVerifySession = self->_pairVerifySession;
  v14 = 0;
  -[CUPairingSession openStreamWithName:error:](pairVerifySession, "openStreamWithName:error:", CFSTR("main"), &v14);
  v7 = (CUPairingStream *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    -[SKConnection _pairVerifyInvalidate](self, "_pairVerifyInvalidate", v13);

  }
  else
  {
    self->_mainAuthTagLength = -[CUPairingStream authTagLength](self->_mainStream, "authTagLength");
    v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (self->_runState == 24)
    {
      v11 = _Block_copy(self->_authCompletionHandler);
      v12 = v11;
      if (v11)
        (*((void (**)(void *, _QWORD))v11 + 2))(v11, 0);

      self->_stepDone = 1;
      -[SKConnection _run](self, "_run");
    }
  }

}

- (void)_serverError:(id)a3
{
  id v4;
  int var0;
  int v6;
  void *v7;
  id v8;

  v4 = a3;
  var0 = self->_ucat->var0;
  v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), v4 = v8, v6))
    {
      CUPrintNSError();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

      v4 = v8;
    }
  }
  -[SKConnection _invalidateWithError:](self, "_invalidateWithError:", v4, v7);

}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  NSObject *dispatchQueue;
  id v14;
  unsigned int xidLast;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  _QWORD v23[5];

  v23[4] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v12 = (void (**)(id, void *))a6;
  dispatchQueue = self->_dispatchQueue;
  v14 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  xidLast = self->_xidLast;
  if (xidLast + 1 > 1)
    v16 = xidLast + 1;
  else
    v16 = 1;
  self->_xidLast = v16;
  v22[0] = &unk_24D2336D0;
  v22[1] = &unk_24D2336E8;
  v23[0] = v14;
  v23[1] = v10;
  v23[2] = &unk_24D233718;
  v22[2] = &unk_24D233700;
  v22[3] = &unk_24D233730;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  v19 = (void *)MEMORY[0x2199D6EC8](v18, 0, &v21);
  if (v19)
  {
    -[SKConnection sendEventID:data:xid:options:completion:](self, "sendEventID:data:xid:options:completion:", v10, v19, v16, v11, v12);
  }
  else
  {
    NSErrorF_safe();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, v20);

  }
}

- (void)sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  void (**v14)(id, void *);
  int var0;
  int v16;
  void *v17;
  SKSendEntry *v18;
  id v19;

  v9 = *(_QWORD *)&a5;
  v19 = a3;
  v12 = a4;
  v13 = a6;
  v14 = (void (**)(id, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    NSErrorF_safe();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v17);

  }
  else if ((self->_runState & 0xFFFFFFF7) == 0x14 && !-[NSMutableArray count](self->_sendArray, "count"))
  {
    -[SKConnection _sendEventID:data:xid:options:completion:](self, "_sendEventID:data:xid:options:completion:", v19, v12, v9, v13, v14);
  }
  else
  {
    v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
    {
      -[NSMutableArray count](self->_sendArray, "count");
      LogPrintF();
    }
    v18 = objc_alloc_init(SKSendEntry);
    -[SKSendEntry setCompletion:](v18, "setCompletion:", v14);
    -[SKSendEntry setEventID:](v18, "setEventID:", v19);
    -[SKSendEntry setEventData:](v18, "setEventData:", v12);
    -[SKSendEntry setOptions:](v18, "setOptions:", v13);
    -[SKSendEntry setQueueTicks:](v18, "setQueueTicks:", mach_absolute_time());
    -[SKSendEntry setXid:](v18, "setXid:", v9);
    -[NSMutableArray addObject:](self->_sendArray, "addObject:", v18);

  }
}

- (void)_sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  unint64_t v18;
  id v19;
  CUPairingStream *v20;
  CUPairingStream *v21;
  id *v22;
  id v23;
  id v24;
  int var0;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id obj;
  _BYTE v36[4];
  _QWORD aBlock[5];
  id v38;
  id v39;
  uint64_t *v40;
  int v41;
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__290;
  v46 = __Block_byref_object_dispose__291;
  v47 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __57__SKConnection__sendEventID_data_xid_options_completion___block_invoke;
  aBlock[3] = &unk_24D229E98;
  v40 = &v42;
  aBlock[4] = self;
  v34 = v12;
  v38 = v34;
  v41 = v9;
  v16 = v15;
  v39 = v16;
  v17 = (void (**)(_QWORD))_Block_copy(aBlock);
  v36[0] = 5;
  v18 = self->_mainAuthTagLength + objc_msgSend(v13, "length");
  if (v18 >> 24)
  {
    NSErrorF_safe();
    v26 = objc_claimAutoreleasedReturnValue();
    v19 = v43[5];
    v43[5] = (id)v26;
  }
  else
  {
    v33 = v9;
    v36[1] = BYTE2(v18);
    v36[2] = BYTE1(v18);
    v36[3] = v18;
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v36, 4);
    v20 = self->_mainStream;
    v21 = v20;
    if (v20)
    {
      v22 = v43;
      obj = v43[5];
      v23 = v13;
      -[CUPairingStream encryptData:aadData:error:](v20, "encryptData:aadData:error:", v13, v19, &obj);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_storeStrong(v22 + 5, obj);
      if (v24)
      {
        var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObject();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

          -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v19, v24, v16, v34, v33, v31, v18);
        }
        else
        {
          -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v19, v24, v16, v28, v29, v30, v32);
        }
      }
    }
    else
    {
      v23 = v13;
      NSErrorF_safe();
      v27 = objc_claimAutoreleasedReturnValue();
      v24 = v43[5];
      v43[5] = (id)v27;
    }

    v13 = v23;
  }

  v17[2](v17);
  _Block_object_dispose(&v42, 8);

}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int var0;
  int v15;
  void *v16;
  SKSendEntry *v17;
  double v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  _QWORD handler[7];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    NSErrorF_safe();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v16);

  }
  else if ((self->_runState & 0xFFFFFFF7) == 0x14 && !-[NSMutableArray count](self->_sendArray, "count"))
  {
    -[SKConnection _sendRequestID:request:options:sendEntry:responseHandler:](self, "_sendRequestID:request:options:sendEntry:responseHandler:", v10, v11, v12, 0, v13);
  }
  else
  {
    v15 = self->_ucat->var0;
    if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
    {
      v20 = v10;
      v21 = -[NSMutableArray count](self->_sendArray, "count");
      LogPrintF();
    }
    v17 = objc_alloc_init(SKSendEntry);
    -[SKSendEntry setOptions:](v17, "setOptions:", v12);
    -[SKSendEntry setQueueTicks:](v17, "setQueueTicks:", mach_absolute_time());
    -[SKSendEntry setRequestID:](v17, "setRequestID:", v10);
    -[SKSendEntry setRequest:](v17, "setRequest:", v11);
    -[SKSendEntry setResponseHandler:](v17, "setResponseHandler:", v13);
    if (v12)
    {
      CFDictionaryGetDouble();
      if (v18 > 0.0)
      {
        v19 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __62__SKConnection_sendRequestID_request_options_responseHandler___block_invoke;
        handler[3] = &unk_24D229EC0;
        handler[4] = v19;
        handler[5] = self;
        handler[6] = v17;
        dispatch_source_set_event_handler(v19, handler);
        CUDispatchTimerSet();
        dispatch_activate(v19);
        -[SKSendEntry setTimer:](v17, "setTimer:", v19);

      }
    }
    -[NSMutableArray addObject:](self->_sendArray, "addObject:", v17, v20, v21);

  }
}

- (void)_sendRequestID:(id)a3 request:(id)a4 options:(id)a5 sendEntry:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  unsigned int xidLast;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  CUPairingStream *v21;
  CUPairingStream *v22;
  id *v23;
  id v24;
  SKRequestEntry *v25;
  void *v26;
  NSMutableDictionary *requests;
  NSMutableDictionary *v28;
  NSMutableDictionary *v29;
  int var0;
  double v31;
  NSObject *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  unint64_t v40;
  void *v41;
  void (**v42)(_QWORD);
  id v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  _QWORD handler[7];
  id obj;
  int v51;
  int v52;
  _QWORD aBlock[5];
  id v54;
  id v55;
  uint64_t *v56;
  int v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  _QWORD v64[4];
  _QWORD v65[6];

  v65[4] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v44 = a4;
  v48 = a5;
  v46 = a6;
  v13 = a7;
  xidLast = self->_xidLast;
  if (xidLast + 1 > 1)
    v15 = xidLast + 1;
  else
    v15 = 1;
  self->_xidLast = v15;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__290;
  v62 = __Block_byref_object_dispose__291;
  v63 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke;
  aBlock[3] = &unk_24D229E98;
  v56 = &v58;
  aBlock[4] = self;
  v47 = v12;
  v54 = v47;
  v57 = v15;
  v43 = v13;
  v55 = v43;
  v42 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v64[0] = &unk_24D2336D0;
  v64[1] = &unk_24D2336E8;
  v65[0] = v44;
  v65[1] = v47;
  v64[2] = &unk_24D233700;
  v64[3] = &unk_24D233730;
  v65[2] = &unk_24D233748;
  v65[3] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, v64, 4);
  v52 = 0;
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x2199D6EC8](v41, 0, &v52);
  v18 = v17;
  v45 = (void *)v16;
  if (v17)
  {
    v51 = 5;
    v19 = self->_mainAuthTagLength + objc_msgSend(v17, "length");
    if (v19 >> 24)
    {
      NSErrorF_safe();
      v35 = objc_claimAutoreleasedReturnValue();
      v20 = v59[5];
      v59[5] = (id)v35;
    }
    else
    {
      BYTE1(v51) = BYTE2(v19);
      BYTE2(v51) = BYTE1(v19);
      HIBYTE(v51) = v19;
      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", &v51, 4);
      v21 = self->_mainStream;
      v22 = v21;
      if (v21)
      {
        v23 = v59;
        obj = v59[5];
        -[CUPairingStream encryptData:aadData:error:](v21, "encryptData:aadData:error:", v18, v20, &obj);
        v24 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v23 + 5, obj);
        if (v24)
        {
          v25 = objc_alloc_init(SKRequestEntry);
          -[SKRequestEntry setOptions:](v25, "setOptions:", v48);
          -[SKRequestEntry setRequestID:](v25, "setRequestID:", v47);
          -[SKRequestEntry setResponseHandler:](v25, "setResponseHandler:", v43);
          -[SKRequestEntry setSendTicks:](v25, "setSendTicks:", mach_absolute_time());
          if (v46)
          {
            objc_msgSend(v46, "timer");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKRequestEntry setTimer:](v25, "setTimer:", v26);

            objc_msgSend(v46, "setXidObj:", v45);
          }
          requests = self->_requests;
          if (!requests)
          {
            v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
            v29 = self->_requests;
            self->_requests = v28;

            requests = self->_requests;
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](requests, "setObject:forKeyedSubscript:", v25, v45);
          var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObject();
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v19;
            v37 = v47;
            v38 = v15;
            LogPrintF();

          }
          -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v20, v24, &__block_literal_global_295, v37, v38, v39, v40);
          if (v48)
          {
            CFDictionaryGetDouble();
            if (v31 > 0.0)
            {
              v32 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
              handler[0] = MEMORY[0x24BDAC760];
              handler[1] = 3221225472;
              handler[2] = __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke_2;
              handler[3] = &unk_24D229EC0;
              handler[4] = v32;
              handler[5] = self;
              handler[6] = v45;
              dispatch_source_set_event_handler(v32, handler);
              CUDispatchTimerSet();
              dispatch_activate(v32);
              -[SKRequestEntry setTimer:](v25, "setTimer:", v32);

            }
          }

        }
      }
      else
      {
        NSErrorF_safe();
        v36 = objc_claimAutoreleasedReturnValue();
        v24 = v59[5];
        v59[5] = (id)v36;
      }

    }
  }
  else
  {
    NSErrorF_safe();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v59[5];
    v59[5] = (id)v33;

  }
  v42[2](v42);

  _Block_object_dispose(&v58, 8);
}

- (void)_sendResponse:(id)a3 error:(id)a4 xid:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  BOOL v20;
  id v21;
  int var0;
  void *v23;
  void *v24;
  unint64_t v25;
  id v26;
  CUPairingStream *v27;
  CUPairingStream *v28;
  id *v29;
  id v30;
  int v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  void *v45;
  void (**v46)(_QWORD);
  id v47;
  id obj;
  _BYTE v49[4];
  int v50;
  _QWORD aBlock[5];
  id v52;
  uint64_t *v53;
  int v54;
  uint64_t v55;
  id *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v55 = 0;
  v56 = (id *)&v55;
  v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__290;
  v59 = __Block_byref_object_dispose__291;
  v60 = 0;
  v17 = objc_msgSend(v14, "unsignedIntValue");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__SKConnection__sendResponse_error_xid_requestID_completion___block_invoke;
  aBlock[3] = &unk_24D229F08;
  v53 = &v55;
  aBlock[4] = self;
  v54 = v17;
  v47 = v16;
  v52 = v47;
  v46 = (void (**)(_QWORD))_Block_copy(aBlock);
  v18 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v19 = v18;
  if (v13)
    v20 = 1;
  else
    v20 = v12 == 0;
  if (v20)
    v21 = (id)MEMORY[0x24BDBD1B8];
  else
    v21 = v12;
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, &unk_24D2336D0);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_24D233760, &unk_24D233700);
  objc_msgSend(v19, "setObject:forKeyedSubscript:", v14, &unk_24D233730);
  if (v13)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v37 = v17;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    CUEncodeNSErrorDictionary();
  }
  v42 = v17;
  v45 = v15;
  v50 = 0;
  v23 = (void *)MEMORY[0x2199D6EC8](v19, 0, &v50);
  v24 = v23;
  if (v23)
  {
    v49[0] = 5;
    v25 = self->_mainAuthTagLength + objc_msgSend(v23, "length");
    if (v25 >> 24)
    {
      NSErrorF_safe();
      v35 = objc_claimAutoreleasedReturnValue();
      v26 = v56[5];
      v56[5] = (id)v35;
    }
    else
    {
      v49[1] = BYTE2(v25);
      v49[2] = BYTE1(v25);
      v49[3] = v25;
      v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v49, 4);
      v27 = self->_mainStream;
      v28 = v27;
      v43 = v14;
      v44 = v12;
      if (v27)
      {
        v29 = v56;
        obj = v56[5];
        -[CUPairingStream encryptData:aadData:error:](v27, "encryptData:aadData:error:", v24, v26, &obj);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        objc_storeStrong(v29 + 5, obj);
        if (v30)
        {
          v31 = self->_ucat->var0;
          if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize()))
          {
            CUPrintNSObject();
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            CUPrintNSError();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF();

            -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v26, v30, v47, v42, v32, v25, v41);
          }
          else
          {
            -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v26, v30, v47, v37, v38, v39, v40);
          }
        }
      }
      else
      {
        NSErrorF_safe();
        v36 = objc_claimAutoreleasedReturnValue();
        v30 = v56[5];
        v56[5] = (id)v36;
      }

      v14 = v43;
      v12 = v44;
    }

  }
  else
  {
    NSErrorF_safe();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v56[5];
    v56[5] = (id)v33;

  }
  v46[2](v46);

  _Block_object_dispose(&v55, 8);
}

- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4
{
  uint64_t v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  int var0;
  uint64_t v16;
  const char *v17;
  unint64_t v18;
  uint64_t v19;
  const char *v20;
  _BYTE v21[4];

  v4 = a3;
  v6 = a4;
  v21[0] = v4;
  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v7 >> 24)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v21[1] = BYTE2(v7);
    v21[2] = BYTE1(v7);
    v21[3] = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v21, 4);
    v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    {
      if (v4 > 8)
        v11 = "?";
      else
        v11 = off_24D22A130[v4];
      CUPrintNSDataHex();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = "";
      if (v8 > 0x10)
        v14 = "...";
      v19 = v12;
      v20 = v14;
      v17 = v11;
      v18 = v8;
      v16 = v4;
      LogPrintF();

    }
    -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v9, v6, &__block_literal_global_220, v16, v17, v18, v19, v20);

  }
}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4;
  void *v6;
  int var0;
  void *v8;
  int v9;

  v4 = a3;
  v9 = 0;
  v6 = (void *)MEMORY[0x2199D6EC8](a4, 0, &v9);
  if (v6)
  {
    -[SKConnection _sendFrameType:body:](self, "_sendFrameType:body:", v4, v6);
  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintErrorCode();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }

}

- (void)_sendHeaderData:(id)a3 bodyData:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  CUReadWriteRequestable *v11;
  id v12;
  void *v13;
  id *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self->_requestable;
  if (v11)
  {
    v12 = objc_alloc_init(MEMORY[0x24BE29860]);
    v19 = MEMORY[0x24BDAC760];
    v20 = 3221225472;
    v21 = __52__SKConnection__sendHeaderData_bodyData_completion___block_invoke;
    v22 = &unk_24D22A928;
    v23 = v12;
    v24 = v10;
    objc_msgSend(v12, "setCompletion:", &v19);
    if (objc_msgSend(v9, "length", v19, v20, v21, v22, v23))
    {
      v26[0] = v8;
      v26[1] = v9;
      v13 = (void *)MEMORY[0x24BDBCE30];
      v14 = (id *)v26;
      v15 = 2;
    }
    else
    {
      v25 = v8;
      v13 = (void *)MEMORY[0x24BDBCE30];
      v14 = &v25;
      v15 = 1;
    }
    objc_msgSend(v13, "arrayWithObjects:count:", v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDataArray:", v18);

    -[CUReadWriteRequestable writeWithRequest:](v11, "writeWithRequest:", v12);
  }
  else
  {
    v12 = _Block_copy(self->_sendDataHandler);
    if (v12)
    {
      v16 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      objc_msgSend(v16, "appendData:", v8);
      if (objc_msgSend(v9, "length"))
        objc_msgSend(v16, "appendData:", v9);
      (*((void (**)(id, id))v12 + 2))(v12, v16);
      v17 = 0;
    }
    else
    {
      NSErrorF_safe();
      v17 = objc_claimAutoreleasedReturnValue();
      v16 = (id)v17;
    }
    (*((void (**)(id, uint64_t))v10 + 2))(v10, v17);

  }
}

- (void)_processSends
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  int var0;
  void *v20;
  void *v21;
  void *v22;

  -[NSMutableArray popFirstObject](self->_sendArray, "popFirstObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v4, "eventID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v4, "eventData");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        if (v6)
        {
          v8 = v6;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "data");
          v8 = (id)objc_claimAutoreleasedReturnValue();
        }
        v10 = v8;

        objc_msgSend(v4, "completion");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (!v14)
          v14 = &__block_literal_global_226;
        v16 = _Block_copy(v14);

        v17 = objc_msgSend(v4, "xid");
        objc_msgSend(v4, "options");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKConnection _sendEventID:data:xid:options:completion:](self, "_sendEventID:data:xid:options:completion:", v5, v10, v17, v18, v16);

      }
      else
      {
        objc_msgSend(v4, "requestID");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v4, "request");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11)
          {
            v13 = v11;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
            v13 = (id)objc_claimAutoreleasedReturnValue();
          }
          v20 = v13;

          objc_msgSend(v4, "responseHandler");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "options");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKConnection _sendRequestID:request:options:sendEntry:responseHandler:](self, "_sendRequestID:request:options:sendEntry:responseHandler:", v10, v20, v22, v4, v21);

        }
        else
        {
          var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          v10 = 0;
        }
      }

      -[NSMutableArray popFirstObject](self->_sendArray, "popFirstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v4);
  }
}

- (void)_abortRequestsWithError:(id)a3
{
  id v4;
  NSMutableDictionary *requests;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  requests = self->_requests;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__SKConnection__abortRequestsWithError___block_invoke;
  v7[3] = &unk_24D229F70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requests, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[NSMutableDictionary removeAllObjects](self->_requests, "removeAllObjects");

}

- (void)_timeoutForSendEntry:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  int var0;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "xidObj");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[SKConnection _timeoutForXID:](self, "_timeoutForXID:", v4);
    goto LABEL_15;
  }
  mach_absolute_time();
  objc_msgSend(v15, "queueTicks");
  UpTicksToSecondsF();
  v6 = v5;
  v7 = -[NSMutableArray indexOfObject:](self->_sendArray, "indexOfObject:", v15);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_sendArray, "removeObjectAtIndex:", v7);
    var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      v11 = v15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize())
          goto LABEL_13;
        v11 = v15;
      }
      objc_msgSend(v11, "requestID");
      v14 = v6;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
LABEL_13:
    objc_msgSend(v15, "responseHandler", v13, v14);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v9)[2](v9, 0, 0, v12);

    goto LABEL_14;
  }
  v8 = self->_ucat->var0;
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v15, "requestID");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    LogPrintF();
LABEL_14:

  }
LABEL_15:

}

- (void)_timeoutForXID:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int var0;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v4 = objc_msgSend(v14, "unsignedIntValue");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0, v14);
    mach_absolute_time();
    objc_msgSend(v5, "sendTicks");
    UpTicksToSecondsF();
    var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      v8 = v6;
      if (var0 != -1 || _LogCategory_Initialize())
      {
        v13 = v8;
        v12 = v4;
        LogPrintF();
      }
    }
    objc_msgSend(v5, "responseHandler", v12, v13);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    NSErrorF_safe();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, _QWORD, void *))v9)[2](v9, 0, 0, v10);

  }
  else
  {
    v11 = self->_ucat->var0;
    if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (void)receivedData:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  SKConnection *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __29__SKConnection_receivedData___block_invoke;
  v7[3] = &unk_24D22AFC8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_receiveStart:(id)a3
{
  id v4;
  id v5;
  int var0;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  SKConnection *v12;
  id v13;

  v4 = a3;
  v5 = v4;
  if (!v4)
    v5 = objc_alloc_init(MEMORY[0x24BE29820]);
  var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_receivingHeader = 1;
  objc_msgSend(v5, "setMinLength:", 4);
  objc_msgSend(v5, "setMaxLength:", 4);
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __30__SKConnection__receiveStart___block_invoke;
  v11 = &unk_24D22AFC8;
  v12 = self;
  v13 = v5;
  v7 = v5;
  objc_msgSend(v7, "setCompletion:", &v8);
  -[CUReadWriteRequestable readWithRequest:](self->_requestable, "readWithRequest:", v7, v8, v9, v10, v11, v12);
  self->_readRequested = 1;

}

- (void)_receiveCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int var0;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  $99C7B5D234F7D6D4241F49443380A03D *v12;
  $99C7B5D234F7D6D4241F49443380A03D v13;
  uint64_t v14;
  int v15;
  int v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  self->_readRequested = 0;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "code") == -6753 || objc_msgSend(v6, "code") == -71148 || objc_msgSend(v6, "code") == -71143)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
LABEL_7:
        CUPrintNSError();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
    else
    {
      v17 = self->_ucat->var0;
      if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
        goto LABEL_7;
    }
  }
  else
  {
    v9 = objc_msgSend(v4, "length");
    objc_msgSend(v4, "bufferData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLength:", v9);

    if (self->_receivingHeader)
    {
      objc_msgSend(v4, "data");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v11, "length") <= 3)
      {
        v22 = self->_ucat->var0;
        if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v11, "length");
          LogPrintF();
        }
      }
      else
      {
        v12 = ($99C7B5D234F7D6D4241F49443380A03D *)objc_msgSend(objc_retainAutorelease(v11), "bytes");
        v13 = *v12;
        self->_frameHeader = *v12;
        v14 = (*(_DWORD *)&v13 << 8) & 0xFF0000 | (*(unsigned int *)&v13 >> 8) & 0xFF00 | v13.frameLen[2];
        v15 = self->_ucat->var0;
        if ((_DWORD)v14)
        {
          if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize()))
          {
            v23 = v14;
            LogPrintF();
          }
          self->_receivingHeader = 0;
          objc_msgSend(v4, "setMinLength:", v14, v23);
          objc_msgSend(v4, "setMaxLength:", v14);
          v24[0] = MEMORY[0x24BDAC760];
          v24[1] = 3221225472;
          v24[2] = __35__SKConnection__receiveCompletion___block_invoke;
          v24[3] = &unk_24D22AFC8;
          v24[4] = self;
          v18 = v4;
          v25 = v18;
          objc_msgSend(v18, "setCompletion:", v24);
          -[CUReadWriteRequestable readWithRequest:](self->_requestable, "readWithRequest:", v18);
          self->_readRequested = 1;

        }
        else
        {
          if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          objc_msgSend(MEMORY[0x24BDBCE50], "data");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[SKConnection _receivedHeader:body:](self, "_receivedHeader:body:", &self->_frameHeader, v21);

          -[SKConnection _receiveStart:](self, "_receiveStart:", v4);
        }
      }

    }
    else
    {
      v16 = self->_ucat->var0;
      if (v16 <= 10 && (v16 != -1 || _LogCategory_Initialize()))
      {
        v23 = objc_msgSend(v4, "length");
        LogPrintF();
      }
      objc_msgSend(v4, "data", v23);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        -[SKConnection _receivedHeader:body:](self, "_receivedHeader:body:", &self->_frameHeader, v19);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "data");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKConnection _receivedHeader:body:](self, "_receivedHeader:body:", &self->_frameHeader, v20);

      }
      -[SKConnection _receiveStart:](self, "_receiveStart:", v4);
    }
  }

}

- (void)_receivedHeader:(id *)a3 body:(id)a4
{
  id v6;
  uint64_t var0;
  uint64_t v8;
  int v9;
  int v10;
  unint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  SKConnection *v16;
  id v17;
  uint64_t v18;
  int v19;
  int v20;
  SKConnection *v21;
  id v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  const char *v26;
  unint64_t v27;
  uint64_t v28;
  const char *v29;
  id v30;

  v6 = a4;
  var0 = a3->var0;
  v30 = v6;
  v8 = objc_msgSend(v6, "length");
  if ((_DWORD)var0 == 5)
    v9 = 10;
  else
    v9 = 30;
  v10 = self->_ucat->var0;
  if (v9 >= v10)
  {
    v11 = v8;
    if (v10 != -1 || _LogCategory_Initialize())
    {
      if (var0 > 8)
        v12 = "?";
      else
        v12 = off_24D22A130[var0];
      CUPrintNSDataHex();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = "";
      if (v11 > 0x10)
        v15 = "...";
      v28 = v13;
      v29 = v15;
      v26 = v12;
      v27 = v11;
      v25 = var0;
      LogPrintF();

    }
  }
  switch((int)var0)
  {
    case 1:
      break;
    case 2:
      if (!self->_clientMode || self->_reversePairing)
      {
        v16 = self;
        v17 = v30;
        v18 = 1;
        goto LABEL_21;
      }
      v24 = self->_ucat->var0;
      if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
        goto LABEL_42;
      break;
    case 3:
      if (self->_clientMode && !self->_reversePairing)
      {
        -[SKConnection _clientPairSetupContinueWithData:](self, "_clientPairSetupContinueWithData:", v30);
      }
      else
      {
        v16 = self;
        v17 = v30;
        v18 = 0;
LABEL_21:
        -[SKConnection _serverPairSetupContinueWithData:start:](v16, "_serverPairSetupContinueWithData:start:", v17, v18, v25, v26, v27, v28, v29);
      }
      break;
    case 5:
      -[SKConnection _receivedHeader:encryptedObjectData:](self, "_receivedHeader:encryptedObjectData:", a3, v30);
      break;
    case 6:
      if (!self->_clientMode)
      {
        v21 = self;
        v22 = v30;
        v23 = 1;
        goto LABEL_35;
      }
      v20 = self->_ucat->var0;
      if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize()))
        goto LABEL_42;
      break;
    case 7:
      if (self->_clientMode)
      {
        -[SKConnection _clientPairVerifyWithData:](self, "_clientPairVerifyWithData:", v30);
      }
      else
      {
        v21 = self;
        v22 = v30;
        v23 = 0;
LABEL_35:
        -[SKConnection _serverPairVerifyContinueWithData:start:](v21, "_serverPairVerifyContinueWithData:start:", v22, v23, v25, v26, v27, v28, v29);
      }
      break;
    case 8:
      -[SKConnection _receivedHeader:unencryptedObjectData:](self, "_receivedHeader:unencryptedObjectData:", a3, v30);
      break;
    default:
      v19 = self->_ucat->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v30, "length", v25, v26, v27, v28, v29);
LABEL_42:
        LogPrintF();
      }
      break;
  }

}

- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  CUPairingStream *v8;
  CUPairingStream *v9;
  id *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  objc_class *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id obj;
  _QWORD aBlock[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__290;
  v25 = __Block_byref_object_dispose__291;
  v26 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SKConnection__receivedHeader_encryptedObjectData___block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v21;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = self->_mainStream;
  v9 = v8;
  if (v8)
  {
    v10 = (id *)(v22 + 5);
    obj = (id)v22[5];
    -[CUPairingStream decryptData:aadBytes:aadLength:error:](v8, "decryptData:aadBytes:aadLength:error:", v6, a3, 4, &obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10, obj);
    if (v11)
    {
      v12 = (void *)OPACKDecodeData();
      if (v12)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[SKConnection _receivedObject:](self, "_receivedObject:", v12);
        }
        else
        {
          v15 = (objc_class *)objc_opt_class();
          NSStringFromClass(v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NSErrorF_safe();
          v16 = objc_claimAutoreleasedReturnValue();
          v17 = (void *)v22[5];
          v22[5] = v16;

        }
      }
      else
      {
        v14 = (id)NSErrorF_safe();
      }

    }
  }
  else
  {
    NSErrorF_safe();
    v13 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v22[5];
    v22[5] = v13;
  }

  v7[2](v7);
  _Block_object_dispose(&v21, 8);

}

- (void)_receivedHeader:(id *)a3 unencryptedObjectData:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  int var0;
  void (**pairSetupConfigHandler)(id, void *);
  id v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v6 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__290;
  v22 = __Block_byref_object_dispose__291;
  v23 = 0;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __54__SKConnection__receivedHeader_unencryptedObjectData___block_invoke;
  aBlock[3] = &unk_24D22ADC0;
  aBlock[4] = self;
  aBlock[5] = &v18;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  v8 = (void *)OPACKDecodeData();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      var0 = self->_ucat->var0;
      if (a3->var0 == 8)
      {
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSObjectOneLine();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        pairSetupConfigHandler = (void (**)(id, void *))self->_pairSetupConfigHandler;
        if (pairSetupConfigHandler)
          pairSetupConfigHandler[2](pairSetupConfigHandler, v8);
      }
      else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v6, "length");
        LogPrintF();
      }
    }
    else
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSErrorF_safe();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v19[5];
      v19[5] = v13;

    }
  }
  else
  {
    v11 = (id)NSErrorF_safe();
  }

  v7[2](v7);
  _Block_object_dispose(&v18, 8);

}

- (void)_receivedObject:(id)a3
{
  int Int64Ranged;
  void *v5;
  int var0;
  int v7;
  id v8;

  v8 = a3;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 3)
  {
    -[SKConnection _receivedResponse:](self, "_receivedResponse:", v8);
    goto LABEL_10;
  }
  if (Int64Ranged == 2)
  {
    -[SKConnection _receivedRequest:](self, "_receivedRequest:", v8);
    goto LABEL_10;
  }
  v5 = v8;
  if (Int64Ranged == 1)
  {
    -[SKConnection _receivedEvent:](self, "_receivedEvent:", v8);
LABEL_10:
    v5 = v8;
    goto LABEL_11;
  }
  var0 = self->_ucat->var0;
  if (var0 <= 60)
  {
    if (var0 != -1 || (v7 = _LogCategory_Initialize(), v5 = v8, v7))
    {
      LogPrintF();
      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_receivedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int var0;
  void *v9;
  void *v10;
  int v11;
  int v12;

  v4 = a3;
  CFDictionaryGetTypeID();
  CFDictionaryGetTypedValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      NSDictionaryGetNSNumber();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "unsignedIntValue");
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v5, "count");
        LogPrintF();
      }
      v9 = _Block_copy(self->_receivedEventHandler);
      v10 = v9;
      if (v9)
        (*((void (**)(void *, void *, void *, _QWORD))v9 + 2))(v9, v6, v5, 0);

    }
    else
    {
      v12 = self->_ucat->var0;
      if (v12 > 90 || v12 == -1 && !_LogCategory_Initialize())
      {
        v6 = 0;
        goto LABEL_11;
      }
      CUPrintErrorCode();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

LABEL_11:
    goto LABEL_12;
  }
  v11 = self->_ucat->var0;
  if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_11;
  }
LABEL_12:

}

- (void)_receivedRequest:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int var0;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[7];
  int v23;
  int v24;

  v4 = a3;
  v24 = 0;
  NSDictionaryGetNSNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");
  if ((_DWORD)v6)
  {
    v7 = v6;
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v9 = objc_claimAutoreleasedReturnValue();
      var0 = self->_ucat->var0;
      if (v9)
      {
        v11 = (void *)v9;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v19 = v7;
          v20 = objc_msgSend(v11, "count");
          v18 = v8;
          LogPrintF();
        }
        if (objc_msgSend(v8, "isEqual:", CFSTR("_ping"), v18, v19, v20))
        {
          -[SKConnection _sendResponse:error:xid:requestID:completion:](self, "_sendResponse:error:xid:requestID:completion:", v11, 0, v5, v8, &__block_literal_global_264);
        }
        else
        {
          v12 = _Block_copy(self->_receivedRequestHandler);
          v13 = v12;
          if (v12)
          {
            v22[0] = MEMORY[0x24BDAC760];
            v22[1] = 3221225472;
            v22[2] = __33__SKConnection__receivedRequest___block_invoke_3;
            v22[3] = &unk_24D229FD8;
            v22[4] = self;
            v22[5] = v8;
            v23 = v7;
            v22[6] = v5;
            (*((void (**)(void *, void *, void *, _QWORD, _QWORD *))v12 + 2))(v12, v8, v11, 0, v22);
          }
          else
          {
            v14 = self->_ucat->var0;
            if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            NSErrorF_safe();
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[SKConnection _sendResponse:error:xid:requestID:completion:](self, "_sendResponse:error:xid:requestID:completion:", 0, v15, v5, v8, &__block_literal_global_267);

          }
        }
      }
      else
      {
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          CUPrintErrorCode();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LogPrintF();

        }
        v11 = 0;
      }
    }
    else
    {
      v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
      {
        v8 = 0;
        goto LABEL_19;
      }
      CUPrintErrorCode();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

LABEL_19:
    goto LABEL_20;
  }
  v16 = self->_ucat->var0;
  if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_19;
  }
LABEL_20:

}

- (void)_receivedResponse:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void (*v16)(void);
  int v17;
  int var0;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  NSDictionaryGetNSNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");
  if ((_DWORD)v6)
  {
    v7 = v6;
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requests, "objectForKeyedSubscript:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v9 = 0;
      goto LABEL_20;
    }
    v9 = (void *)v8;
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requests, "setObject:forKeyedSubscript:", 0, v5);
    objc_msgSend(v9, "timer");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimer:", 0);
    if (v10)
      dispatch_source_cancel(v10);
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      mach_absolute_time();
      objc_msgSend(v9, "sendTicks");
      v12 = UpTicksToMilliseconds();
      CUDecodeNSErrorDictionary();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = self->_ucat->var0;
      if (v13)
      {
        if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v21 = v12;
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = v7;
          LogPrintF();

        }
        objc_msgSend(v9, "responseHandler", v20, v21, v22);
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v16 = (void (*)(void))v15[2];
      }
      else
      {
        if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
        {
          v20 = v7;
          v21 = v12;
          LogPrintF();
        }
        objc_msgSend(v9, "responseHandler", v20, v21);
        v15 = (_QWORD *)objc_claimAutoreleasedReturnValue();
        v16 = (void (*)(void))v15[2];
      }
      v16();

    }
    else
    {
      v19 = self->_ucat->var0;
      if (v19 > 90 || v19 == -1 && !_LogCategory_Initialize())
        goto LABEL_19;
      CUPrintErrorCode();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  v17 = self->_ucat->var0;
  if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
  {
    CUPrintErrorCode();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();
    goto LABEL_20;
  }
LABEL_21:

}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)authHidePasswordHandler
{
  return self->_authHidePasswordHandler;
}

- (void)setAuthHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)authShowPasswordHandler
{
  return self->_authShowPasswordHandler;
}

- (void)setAuthShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)authPromptHandler
{
  return self->_authPromptHandler;
}

- (void)setAuthPromptHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (CBConnection)bleConnection
{
  return self->_bleConnection;
}

- (void)setBleConnection:(id)a3
{
  objc_storeStrong((id *)&self->_bleConnection, a3);
}

- (SKDevice)blePeerDevice
{
  return self->_blePeerDevice;
}

- (void)setBlePeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_blePeerDevice, a3);
}

- (unsigned)bluetoothUseCase
{
  return self->_bluetoothUseCase;
}

- (void)setBluetoothUseCase:(unsigned int)a3
{
  self->_bluetoothUseCase = a3;
}

- (BOOL)clientMode
{
  return self->_clientMode;
}

- (void)setClientMode:(BOOL)a3
{
  self->_clientMode = a3;
}

- (BOOL)conditionalPersistent
{
  return self->_conditionalPersistent;
}

- (void)setConditionalPersistent:(BOOL)a3
{
  self->_conditionalPersistent = a3;
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setPskData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)pairSetupConfigHandler
{
  return self->_pairSetupConfigHandler;
}

- (void)setPairSetupConfigHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (BOOL)persistentPairing
{
  return self->_persistentPairing;
}

- (void)setPersistentPairing:(BOOL)a3
{
  self->_persistentPairing = a3;
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (BOOL)reversePairing
{
  return self->_reversePairing;
}

- (void)setReversePairing:(BOOL)a3
{
  self->_reversePairing = a3;
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setSendDataHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 304);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_sendDataHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedEventHandler, 0);
  objc_storeStrong(&self->_pairSetupConfigHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_blePeerDevice, 0);
  objc_storeStrong((id *)&self->_bleConnection, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_authPromptHandler, 0);
  objc_storeStrong(&self->_authShowPasswordHandler, 0);
  objc_storeStrong(&self->_authHidePasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_startTimer, 0);
  objc_storeStrong((id *)&self->_sendArray, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_pairVerifySession, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_storeStrong((id *)&self->_mainStream, 0);
  objc_storeStrong((id *)&self->_requestable, 0);
  objc_storeStrong((id *)&self->_authThrottleTimer, 0);
}

void __33__SKConnection__receivedRequest___block_invoke_3(_QWORD *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  int v13;
  id v14;

  v14 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a1[4];
  if (*(_BYTE *)(v12 + 52))
  {
    v13 = **(_DWORD **)(v12 + 144);
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    objc_msgSend((id)v12, "_sendResponse:error:xid:requestID:completion:", v14, v10, a1[6], a1[5], v11);
  }

}

void __54__SKConnection__receivedHeader_unencryptedObjectData___block_invoke(uint64_t a1)
{
  int v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v1 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
}

void __52__SKConnection__receivedHeader_encryptedObjectData___block_invoke(uint64_t a1)
{
  int v1;
  id v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v1 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
}

uint64_t __35__SKConnection__receiveCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveCompletion:", *(_QWORD *)(a1 + 40));
}

uint64_t __30__SKConnection__receiveStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_receiveCompletion:", *(_QWORD *)(a1 + 40));
}

void __29__SKConnection_receivedData___block_invoke(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "length");
  if (v2 <= 3)
  {
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 40) + 144);
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    v3 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
    objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 4, v2 - 4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_receivedHeader:body:", v3, v5);

  }
}

void __40__SKConnection__abortRequestsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
  if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
  {
    v7 = objc_msgSend(v12, "unsignedIntValue");
    CUPrintNSError();
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_msgSend(v5, "timer", v10, v11);
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimer:", 0);
  if (v8)
    dispatch_source_cancel(v8);
  objc_msgSend(v5, "responseHandler");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponseHandler:", 0);
  if (v9)
    v9[2](v9, 0, 0, *(_QWORD *)(a1 + 40));

}

void __52__SKConnection__sendHeaderData_bodyData_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v5 = (id)v2;
  if (v2)
  {
    NSErrorNestedF();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
  }

}

uint64_t __61__SKConnection__sendResponse_error_xid_requestID_completion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

uint64_t __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  return result;
}

uint64_t __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_timeoutForXID:", *(_QWORD *)(a1 + 48));
}

uint64_t __62__SKConnection_sendRequestID_request_options_responseHandler___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_timeoutForSendEntry:", *(_QWORD *)(a1 + 48));
}

uint64_t __57__SKConnection__sendEventID_data_xid_options_completion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  return result;
}

uint64_t __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;
  void *v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    v2 = result;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(_QWORD *)(v2 + 40), v5))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v3 = *(_DWORD ***)(v2 + 32);
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    return objc_msgSend(v3, "_serverPairVerifyCompleted:", *(_QWORD *)(*(_QWORD *)(v1 + 8) + 40));
  }
  return result;
}

void __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v3[10])
  {
    v7 = CFSTR("_pd");
    v8[0] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 7, v6);

  }
}

_QWORD *__56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[10])
    return (_QWORD *)objc_msgSend(result, "_serverPairVerifyCompleted:", a2);
  return result;
}

uint64_t __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;
  void *v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    v2 = result;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(_QWORD *)(v2 + 40), v5))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v3 = *(_DWORD ***)(v2 + 32);
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    return objc_msgSend(v3, "_serverPairSetupCompleted:", *(_QWORD *)(*(_QWORD *)(v1 + 8) + 40));
  }
  return result;
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v5 + 72))
  {
    v8 = v4;
    *(_BYTE *)(v5 + 112) = 1;
    v6 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 192));
    v7 = v6;
    if (v6)
      (*((void (**)(void *, _QWORD, id))v6 + 2))(v6, *(unsigned int *)(*(_QWORD *)(a1 + 40) + 160), v8);

    v4 = v8;
  }

}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void (**v2)(void);
  void (**v3)(void);

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 72) && *(_BYTE *)(v1 + 112))
  {
    *(_BYTE *)(v1 + 112) = 0;
    v2 = (void (**)(void))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 40) + 184));
    if (v2)
    {
      v3 = v2;
      v2[2]();
      v2 = v3;
    }

  }
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v3[9])
  {
    v7 = CFSTR("_pd");
    v8[0] = a3;
    v4 = (void *)MEMORY[0x24BDBCE70];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 3, v6);

  }
}

_QWORD *__55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_5(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[9])
    return (_QWORD *)objc_msgSend(result, "_serverPairSetupCompleted:", a2);
  return result;
}

void __32__SKConnection__serverAcceptBLE__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;

  v1 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v1[29])
  {
    NSErrorNestedF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_serverError:", v2);

  }
}

uint64_t __32__SKConnection__serverAcceptBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 232))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 40), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    v5 = *(void **)(v1 + 232);
    *(_QWORD *)(v1 + 232) = 0;

    v6 = *(_QWORD *)(v2 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    return objc_msgSend(*(id *)(v2 + 40), "_invalidated");
  }
  return result;
}

uint64_t __42__SKConnection__clientPairVerifyWithData___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;
  void *v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    v2 = result;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(_QWORD *)(v2 + 40), v5))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v3 = *(_DWORD ***)(v2 + 32);
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    return objc_msgSend(v3, "_clientPairVerifyCompleted:", *(_QWORD *)(*(_QWORD *)(v1 + 8) + 40));
  }
  return result;
}

void __38__SKConnection__clientPairVerifyStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v3[10])
  {
    v4 = a2 & 1 ^ 7u;
    v8 = CFSTR("_pd");
    v9[0] = a3;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = a3;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFrameType:unencryptedObject:", v4, v7);

  }
}

_QWORD *__38__SKConnection__clientPairVerifyStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[10])
    return (_QWORD *)objc_msgSend(result, "_clientPairVerifyCompleted:", a2);
  return result;
}

void __77__SKConnection__clientPairSetupPromptWithFlags_passwordType_throttleSeconds___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  double v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v1 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(v1 + 24))
  {
    v3 = *(_QWORD *)(v1 + 16);
    if ((uint64_t)(v3 - mach_absolute_time()) < 1)
    {
      v3 = 0;
    }
    else
    {
      UpTicksToSecondsF();
      LODWORD(v3) = llround(v4);
    }
    v5 = *(_QWORD *)(a1 + 40);
    v6 = **(_DWORD **)(v5 + 144);
    if (v6 <= 30)
    {
      if (v6 != -1 || (v7 = _LogCategory_Initialize(), v5 = *(_QWORD *)(a1 + 40), v7))
      {
        LogPrintF();
        v5 = *(_QWORD *)(a1 + 40);
      }
    }
    if ((int)v3 <= 0)
    {
      v9 = *(void **)(v5 + 24);
      if (v9)
      {
        v10 = v9;
        dispatch_source_cancel(v10);
        v11 = *(_QWORD *)(a1 + 40);
        v12 = *(void **)(v11 + 24);
        *(_QWORD *)(v11 + 24) = 0;

        v8 = 0;
        v5 = *(_QWORD *)(a1 + 40);
      }
      else
      {
        v8 = 0;
      }
    }
    else
    {
      v8 = 0x20000;
    }
    v13 = _Block_copy(*(const void **)(v5 + 200));
    if (v13)
    {
      v14 = v13;
      (*((void (**)(void *, _QWORD, uint64_t, uint64_t))v13 + 2))(v13, *(unsigned int *)(a1 + 48), v8, v3);
      v13 = v14;
    }

  }
}

uint64_t __49__SKConnection__clientPairSetupContinueWithData___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD **v3;
  int v4;
  int v5;
  void *v6;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 8) + 40))
  {
    v2 = result;
    v3 = *(_DWORD ***)(result + 32);
    v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(_QWORD *)(v2 + 40), v5))
      {
        CUPrintNSError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

        v3 = *(_DWORD ***)(v2 + 32);
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    return objc_msgSend(v3, "_clientPairSetupCompleted:", *(_QWORD *)(*(_QWORD *)(v1 + 8) + 40));
  }
  return result;
}

uint64_t __37__SKConnection__clientPairSetupStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientPairSetupPromptWithFlags:passwordType:throttleSeconds:", a2, objc_msgSend(*(id *)(a1 + 40), "pinTypeActual"), a3);
}

void __37__SKConnection__clientPairSetupStart__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v3[9])
  {
    v4 = a2 & 1 ^ 3u;
    v8 = CFSTR("_pd");
    v9[0] = a3;
    v5 = (void *)MEMORY[0x24BDBCE70];
    v6 = a3;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFrameType:unencryptedObject:", v4, v7);

  }
}

_QWORD *__37__SKConnection__clientPairSetupStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[9])
    return (_QWORD *)objc_msgSend(result, "_clientPairSetupCompleted:", a2);
  return result;
}

void __38__SKConnection__clientConnectStartBLE__block_invoke(uint64_t a1)
{
  _QWORD *v1;
  id v2;

  v1 = *(_QWORD **)(a1 + 40);
  if (*(_QWORD *)(a1 + 32) == v1[29])
  {
    NSErrorNestedF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_clientError:", v2);

  }
}

uint64_t __38__SKConnection__clientConnectStartBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v1 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(result + 32) == *(_QWORD *)(v1 + 232))
  {
    v2 = result;
    v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (v4 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 40), v4))
      {
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    v5 = *(void **)(v1 + 232);
    *(_QWORD *)(v1 + 232) = 0;

    v6 = *(_QWORD *)(v2 + 40);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    result = *(_QWORD *)(v2 + 40);
    if (*(_BYTE *)(result + 52))
      return objc_msgSend((id)result, "_invalidated");
  }
  return result;
}

void __38__SKConnection__clientConnectStartBLE__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v3 == *(void **)(v4 + 232))
  {
    objc_storeStrong((id *)(v4 + 40), v3);
    v6 = a2;
    objc_msgSend(*(id *)(a1 + 40), "_clientConnectCompleted:", v6);

  }
}

void __35__SKConnection_updatePasswordType___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  v1 = *(_BYTE **)(a1 + 32);
  if (!v1[52])
  {
    v4 = CFSTR("_pt");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "_sendFrameType:unencryptedObject:", 8, v3);

  }
}

void __28__SKConnection_tryPassword___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  int v5;
  int v6;
  int v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 156) || *(_BYTE *)(v2 + 159))
  {
    v3 = *(id *)(v2 + 72);
    v4 = v3;
    v8 = v3;
    if (v3)
    {
      objc_msgSend(v3, "tryPIN:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v5 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
      if (v5 > 90)
        goto LABEL_6;
      if (v5 == -1)
      {
        v7 = _LogCategory_Initialize();
        v4 = 0;
        if (!v7)
          goto LABEL_6;
      }
      LogPrintF();
    }
    v4 = v8;
LABEL_6:

    return;
  }
  v6 = **(_DWORD **)(v2 + 144);
  if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

uint64_t __26__SKConnection_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithError:", 0);
}

uint64_t __40__SKConnection__activateWithCompletion___block_invoke(_QWORD *a1)
{
  uint64_t result;
  int v3;
  void *v4;

  result = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  if (result)
  {
    v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
    return (*(uint64_t (**)(void))(a1[5] + 16))();
  }
  return result;
}

uint64_t __39__SKConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

@end
