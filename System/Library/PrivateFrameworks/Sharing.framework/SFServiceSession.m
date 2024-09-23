@implementation SFServiceSession

- (SFServiceSession)init
{
  SFServiceSession *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFServiceSession;
  result = -[SFSession init](&v3, sel_init);
  if (result)
  {
    result->super._ucatCore = (LogCategory *)&gLogCategory_SFServiceCore;
    result->super._ucatCrypto = (LogCategory *)&gLogCategory_SFServiceCrypto;
  }
  return result;
}

- (void)dealloc
{
  SFServiceSession *v3;
  SEL v4;
  const char *v5;
  unint64_t v6;
  const char *v7;
  unint64_t v8;
  objc_super v9;

  if (self->super._transaction)
  {
    v3 = (SFServiceSession *)FatalErrorF();
    -[SFServiceSession setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:](v3, v4, v5, v6, v7, v8);
  }
  else
  {
    -[SFServiceSession clearEncryptionInfo](self, "clearEncryptionInfo");
    v9.receiver = self;
    v9.super_class = (Class)SFServiceSession;
    -[SFSession dealloc](&v9, sel_dealloc);
  }
}

- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6
{
  CryptoAEADPrivate *encryptionReadAEAD;
  CryptoAEADPrivate *v8;
  CryptoAEADPrivate *encryptionWriteAEAD;
  CryptoAEADPrivate *v10;
  int var0;

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  encryptionReadAEAD = self->super._encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->super._encryptionReadAEAD = 0;
  }
  v8 = (CryptoAEADPrivate *)CryptoAEADCreate();
  self->super._encryptionReadAEAD = v8;
  if (v8)
  {
    *(_QWORD *)self->super._encryptionReadNonce = 0;
    *(_DWORD *)&self->super._encryptionReadNonce[8] = 0;
    encryptionWriteAEAD = self->super._encryptionWriteAEAD;
    if (encryptionWriteAEAD)
    {
      CFRelease(encryptionWriteAEAD);
      self->super._encryptionWriteAEAD = 0;
    }
    v10 = (CryptoAEADPrivate *)CryptoAEADCreate();
    self->super._encryptionWriteAEAD = v10;
    if (v10)
    {
      *(_QWORD *)self->super._encryptionWriteNonce = 0;
      *(_DWORD *)&self->super._encryptionWriteNonce[8] = 0;
      var0 = self->super._ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
  return 0;
}

- (void)clearEncryptionInfo
{
  CryptoAEADPrivate *encryptionReadAEAD;
  CryptoAEADPrivate *encryptionWriteAEAD;
  CUPairingSession *pairSetupSession;
  CUPairingSession *pairVerifySession;

  encryptionReadAEAD = self->super._encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->super._encryptionReadAEAD = 0;
  }
  encryptionWriteAEAD = self->super._encryptionWriteAEAD;
  if (encryptionWriteAEAD)
  {
    CFRelease(encryptionWriteAEAD);
    self->super._encryptionWriteAEAD = 0;
  }
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  -[CUPairingSession invalidate](self->_pairVerifySession, "invalidate");
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0;

}

- (void)activate
{
  OS_os_transaction *v3;
  OS_os_transaction *transaction;
  int var0;
  int v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v9;
  _QWORD handler[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  v3 = (OS_os_transaction *)os_transaction_create();
  transaction = self->super._transaction;
  self->super._transaction = v3;

  if (!self->super._transaction)
  {
    var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  -[SFSession _setupMessageSession](self, "_setupMessageSession");
  if (-[SFService touchRemoteEnabled](self->_service, "touchRemoteEnabled"))
    -[SFSession _setupTouchRemote](self, "_setupTouchRemote");
  v6 = self->super._ucatCore->var0;
  if (v6 <= 30 && (v6 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->super._heartbeatLastTicks = mach_absolute_time();
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->super._dispatchQueue);
  heartbeatTimer = self->super._heartbeatTimer;
  self->super._heartbeatTimer = v7;

  v9 = self->super._heartbeatTimer;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __28__SFServiceSession_activate__block_invoke;
  handler[3] = &unk_1E482DF78;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  SFDispatchTimerSet(self->super._heartbeatTimer, 3.0, 3.0, -4.0);
  dispatch_resume((dispatch_object_t)self->super._heartbeatTimer);
}

uint64_t __28__SFServiceSession_activate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hearbeatTimer");
}

- (void)invalidate
{
  OS_dispatch_source *heartbeatTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  NSMutableDictionary *requestHandlers;
  NSMutableDictionary *requestMap;
  NSMutableDictionary *v8;
  OS_os_transaction *transaction;
  int var0;
  _QWORD v11[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  heartbeatTimer = self->super._heartbeatTimer;
  if (heartbeatTimer)
  {
    v4 = heartbeatTimer;
    dispatch_source_cancel(v4);
    v5 = self->super._heartbeatTimer;
    self->super._heartbeatTimer = 0;

  }
  -[SFSession _tearDownMessageSession](self, "_tearDownMessageSession");
  -[SFSession _tearDownTouchRemote](self, "_tearDownTouchRemote");
  -[NSMutableDictionary removeAllObjects](self->super._requestHandlers, "removeAllObjects");
  requestHandlers = self->super._requestHandlers;
  self->super._requestHandlers = 0;

  requestMap = self->super._requestMap;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __30__SFServiceSession_invalidate__block_invoke;
  v11[3] = &unk_1E48326A8;
  v11[4] = self;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requestMap, "enumerateKeysAndObjectsUsingBlock:", v11);
  -[NSMutableDictionary removeAllObjects](self->super._requestMap, "removeAllObjects");
  v8 = self->super._requestMap;
  self->super._requestMap = 0;

  -[SFServiceSession clearEncryptionInfo](self, "clearEncryptionInfo");
  transaction = self->super._transaction;
  self->super._transaction = 0;

  var0 = self->super._ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
}

void __30__SFServiceSession_invalidate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
  if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
  {
    v16 = v5;
    LogPrintF();
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("_rh"), v16);
  v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2F90];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("?");
    if (v11)
      v13 = (const __CFString *)v11;
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, -6723, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, _QWORD))v8)[2](v8, 0, v15, 0);

  }
}

- (void)_hearbeatTimer
{
  double v3;
  double v4;
  int v5;
  int var0;
  SFService *service;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (self->super._heartbeatTimer)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    v4 = v3;
    if (v3 >= 300.0)
    {
      var0 = self->super._ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v15 = v4;
        LogPrintF();
      }
      service = self->_service;
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2F90];
      v16 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("?");
      if (v10)
        v12 = (const __CFString *)v10;
      v17[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1, *(_QWORD *)&v15);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -71160, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFService serviceSessionFailed:error:](service, "serviceSessionFailed:error:", self, v14);

    }
    else if (v3 > 6.0)
    {
      v5 = self->super._ucatCore->var0;
      if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

- (void)receivedEncryptedData:(id)a3 type:(unsigned __int8)a4
{
  int v4;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  unsigned __int8 *encryptionReadNonce;
  int v13;
  uint64_t v14;
  BOOL v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int var0;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  objc_class *v28;
  int v29;
  unint64_t v30;
  void *v31;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (!self->super._encryptionReadAEAD)
  {
    var0 = self->super._ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_43;
LABEL_24:
    LogPrintF();
LABEL_43:
    v11 = 0;
    goto LABEL_44;
  }
  v7 = objc_msgSend(v6, "length");
  v8 = v7;
  if (v7 <= 0xF)
  {
    v23 = self->super._ucatCore->var0;
    if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize())
      goto LABEL_43;
    goto LABEL_24;
  }
  v9 = v7 - 16;
  v10 = objc_msgSend(objc_retainAutorelease(v6), "bytes");
  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v8 - 16);
  if (objc_msgSend(v11, "length") != v9)
  {
    v24 = self->super._ucatCore->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize())
      goto LABEL_44;
LABEL_30:
    LogPrintF();
    goto LABEL_44;
  }
  v11 = objc_retainAutorelease(v11);
  objc_msgSend(v11, "mutableBytes");
  encryptionReadNonce = self->super._encryptionReadNonce;
  v30 = v10 + v9;
  v13 = CryptoAEADDecryptMessage();
  v14 = 0;
  do
  {
    if (++encryptionReadNonce[v14])
      v16 = 1;
    else
      v16 = v14 == 11;
    ++v14;
  }
  while (!v16);
  if (v13)
  {
    v25 = self->super._ucatCore->var0;
    if (v25 > 60 || v25 == -1 && !_LogCategory_Initialize())
      goto LABEL_44;
    goto LABEL_30;
  }
  if (v4 == 28)
  {
    NSDataDecompress();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = v18;
    if (v17)
    {

      goto LABEL_15;
    }
    v29 = self->super._ucatCore->var0;
    if (v29 <= 60 && (v29 != -1 || _LogCategory_Initialize()))
      LogPrintF();

LABEL_44:
    v17 = 0;
LABEL_45:
    v21 = 0;
    goto LABEL_18;
  }
  v17 = v11;
LABEL_15:
  v20 = OPACKDecodeData();
  if (!v20)
  {
    v26 = self->super._ucatCore->var0;
    if (v26 <= 60 && (v26 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_45;
  }
  v21 = (void *)v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFServiceSession _receivedObject:flags:](self, "_receivedObject:flags:", v21, 1, v30, 16);
  }
  else
  {
    v27 = self->super._ucatCore->var0;
    if (v27 <= 60 && (v27 != -1 || _LogCategory_Initialize()))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
LABEL_18:

}

- (void)receivedUnencryptedData:(id)a3 type:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  SFServiceSession *v11;
  void *v12;
  uint64_t v13;
  SFServiceSession *v14;
  void *v15;
  uint64_t v16;
  int v17;
  int v18;
  objc_class *v19;
  int var0;
  void *v21;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (v4 == 29)
  {
    NSDataDecompress();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 0;

    if (!v7)
    {
      var0 = self->super._ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();

      v6 = 0;
      goto LABEL_30;
    }

    v6 = (id)v7;
  }
  v9 = OPACKDecodeData();
  if (!v9)
  {
    v17 = self->super._ucatCore->var0;
    if (v17 <= 60 && (v17 != -1 || _LogCategory_Initialize()))
    {
      SFNearbyBLEFrameTypeToString(v4);
      LogPrintF();
    }
LABEL_30:
    v10 = 0;
    goto LABEL_14;
  }
  v10 = (void *)v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(v4)
    {
      case 0x10u:
        v11 = self;
        v12 = v10;
        v13 = 1;
        goto LABEL_10;
      case 0x11u:
        v11 = self;
        v12 = v10;
        v13 = 0;
LABEL_10:
        -[SFServiceSession pairSetup:start:](v11, "pairSetup:start:", v12, v13);
        break;
      case 0x12u:
        v14 = self;
        v15 = v10;
        v16 = 1;
        goto LABEL_13;
      case 0x13u:
        v14 = self;
        v15 = v10;
        v16 = 0;
LABEL_13:
        -[SFServiceSession pairVerify:start:](v14, "pairVerify:start:", v15, v16);
        break;
      default:
        -[SFServiceSession _receivedObject:flags:](self, "_receivedObject:flags:", v10, 0);
        break;
    }
  }
  else
  {
    v18 = self->super._ucatCore->var0;
    if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
    {
      SFNearbyBLEFrameTypeToString(v4);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
LABEL_14:

}

- (void)_receivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD, _QWORD);
  int var0;
  id v12;

  v4 = *(_QWORD *)&a4;
  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_xc"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    if (!-[SFSession _sessionReceivedRegisteredRequestID:flags:xidKey:xidValue:](self, "_sessionReceivedRegisteredRequestID:flags:xidKey:xidValue:", v12, v4, CFSTR("_xc"), v6))-[SFServiceSession _receivedRequestID:object:flags:](self, "_receivedRequestID:object:flags:", v7, v12, v4);
  }
  else
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("_xs"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = (void *)v8;
      -[SFServiceSession _receivedResponseID:object:flags:](self, "_receivedResponseID:object:flags:", v8, v12, v4);
    }
    else
    {
      if (!-[SFSession _sessionReceivedEvent:flags:](self, "_sessionReceivedEvent:flags:", v12, v4))
      {
        -[SFService receivedObjectHandler](self->_service, "receivedObjectHandler");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          -[SFService receivedObjectHandler](self->_service, "receivedObjectHandler");
          v10 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, SFServiceSession *, uint64_t, id))v10)[2](v10, self, v4, v12);

        }
        else
        {
          var0 = self->super._ucatCore->var0;
          if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
            LogPrintF();
        }
      }
      v7 = 0;
    }
  }

}

- (void)_receivedRequestID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  int var0;
  _QWORD aBlock[5];
  id v16;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("_xc"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SFServiceSession__receivedRequestID_object_flags___block_invoke;
  aBlock[3] = &unk_1E4833C80;
  aBlock[4] = self;
  v10 = v8;
  v16 = v10;
  v11 = _Block_copy(aBlock);
  if (!-[SFSession _sessionReceivedRequest:flags:responseHandler:](self, "_sessionReceivedRequest:flags:responseHandler:", v9, v5, v11))
  {
    -[SFService receivedRequestHandler](self->_service, "receivedRequestHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SFService receivedRequestHandler](self->_service, "receivedRequestHandler");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, SFServiceSession *, uint64_t, void *, void *))v13)[2](v13, self, v5, v9, v11);

    }
    else
    {
      var0 = self->super._ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }

}

void __52__SFServiceSession__receivedRequestID_object_flags___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  void *v10;
  void *v11;
  unsigned int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (v7)
    {
      v9 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
      if (v9 <= 90 && (v9 != -1 || _LogCategory_Initialize()))
      {
        v17 = *(_QWORD *)(a1 + 40);
        v18 = v7;
        LogPrintF();
      }
    }
    v16 = (void *)objc_msgSend(v8, "mutableCopy", v17, v18);
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("_xc"));
    objc_msgSend(*(id *)(a1 + 32), "sendWithFlags:object:", a2, v16);

  }
  else
  {
    v10 = *(void **)(a1 + 32);
    v19[0] = CFSTR("er");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v12 = NSErrorToOSStatus();
    if (v12)
      v13 = v12;
    else
      v13 = 4294960596;
    objc_msgSend(v11, "numberWithInt:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = CFSTR("_xc");
    v20[0] = v14;
    v20[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendWithFlags:object:", a2, v15);

  }
}

- (void)_receivedResponseID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  char Int64Ranged;
  void *v14;
  int var0;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  _QWORD v27[2];

  v5 = *(_QWORD *)&a5;
  v27[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->super._requestMap, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    var0 = self->super._ucatCore->var0;
    if (var0 > 50 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_6;
LABEL_12:
    LogPrintF();
    goto LABEL_6;
  }
  -[NSMutableDictionary removeObjectForKey:](self->super._requestMap, "removeObjectForKey:", v8);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_rh"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = self->super._ucatCore->var0;
    if (v16 > 50 || v16 == -1 && !_LogCategory_Initialize())
      goto LABEL_6;
    goto LABEL_12;
  }
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v11;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if ((v5 & 1) == 0 && (Int64Ranged & 1) != 0)
  {
    v17 = self->super._ucatCore->var0;
    if (v17 <= 50 && (v17 != -1 || _LogCategory_Initialize()))
    {
      v25 = v8;
      LogPrintF();
    }
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2F90];
    v26 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = CFSTR("?");
    if (v20)
      v22 = (const __CFString *)v20;
    v27[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, -6768, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *, _QWORD))v12)[2](v12, 0, v24, 0);

  }
  else
  {
    v14 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v14, "removeObjectForKey:", CFSTR("_xs"));
    ((void (**)(_QWORD, uint64_t, _QWORD, void *))v12)[2](v12, v5, 0, v14);

  }
LABEL_6:

}

- (void)receivedStartRequest:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  int var0;
  void *v8;
  void *v9;
  unsigned int v10;
  int v11;
  unsigned int sessionFlags;
  int v13;
  uint64_t DataMutable;
  void *v15;
  int v16;
  _QWORD block[5];
  int v18;

  v4 = a3;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFServiceSession_receivedStartRequest___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  if (receivedStartRequest__onceToken != -1)
    dispatch_once(&receivedStartRequest__onceToken, block);
  v5 = (void *)OPACKDecodeData();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  var0 = self->super._ucatCore->var0;
  if ((isKindOfClass & 1) != 0)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->super._sessionID = CFDictionaryGetInt64Ranged();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v10 = TextToSourceVersion();
      self->super._sharingSourceVersion = v10;
      if (!v10)
        goto LABEL_12;
    }
    else if (!self->super._sharingSourceVersion)
    {
LABEL_12:
      v11 = self->super._ucatCore->var0;
      if (v11 <= 115 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    sessionFlags = self->super._sessionFlags;
    if ((sessionFlags & 1) != 0 && self->super._sharingSourceVersion >= 0x7E57C0)
    {
      sessionFlags |= 2u;
      self->super._sessionFlags = sessionFlags;
    }
    if ((sessionFlags & 0x20) != 0 && self->super._sharingSourceVersion >= 0x8FE454)
      self->super._sessionFlags = sessionFlags | 0x40;
    v13 = self->super._ucatCore->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    DataMutable = OPACKEncoderCreateDataMutable();
    if (DataMutable)
    {
      v15 = (void *)DataMutable;
      -[SFServiceSession _sendFrameType:data:](self, "_sendFrameType:data:", 24, DataMutable);

    }
    else
    {
      v16 = self->super._ucatCore->var0;
      if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    goto LABEL_28;
  }
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v9 = 0;
LABEL_28:

}

int *__41__SFServiceSession_receivedStartRequest___block_invoke(uint64_t a1)
{
  int *result;

  objc_msgSend(CFSTR("1945.10.6"), "UTF8String");
  result = (int *)TextToSourceVersion();
  if (!(_DWORD)result)
  {
    result = *(int **)(*(_QWORD *)(a1 + 32) + 160);
    if (*result <= 115)
    {
      if (*result != -1)
        return (int *)LogPrintF();
      result = (int *)_LogCategory_Initialize();
      if ((_DWORD)result)
        return (int *)LogPrintF();
    }
  }
  return result;
}

- (void)sendEncryptedObject:(id)a3
{
  id v4;
  uint64_t DataMutable;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  unsigned __int8 *encryptionWriteNonce;
  int v12;
  uint64_t v13;
  BOOL v15;
  int var0;
  int v17;
  int v18;
  int v19;
  int v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21[0] = 0;
  v21[1] = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._dispatchQueue);
  if (!self->_service->_xpcCnx)
  {
    var0 = self->super._ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
LABEL_25:
    LogPrintF();
LABEL_26:
    v6 = 0;
    goto LABEL_16;
  }
  if (!self->super._encryptionWriteAEAD)
  {
    v17 = self->super._ucatCore->var0;
    if (v17 > 60 || v17 == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
    goto LABEL_25;
  }
  DataMutable = OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    v18 = self->super._ucatCore->var0;
    if (v18 > 60 || v18 == -1 && !_LogCategory_Initialize())
      goto LABEL_26;
    goto LABEL_25;
  }
  v6 = (id)DataMutable;
  if ((self->super._sessionFlags & 2) == 0)
  {
    v7 = 6;
    goto LABEL_8;
  }
  NSDataCompress();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  if (v8)
  {
    v10 = objc_msgSend(v8, "mutableCopy");

    v7 = 28;
    v6 = (id)v10;
LABEL_8:
    v6 = objc_retainAutorelease(v6);
    objc_msgSend(v6, "mutableBytes");
    objc_msgSend(v6, "length");
    encryptionWriteNonce = self->super._encryptionWriteNonce;
    v12 = CryptoAEADEncryptMessage();
    v13 = 0;
    do
    {
      if (++encryptionWriteNonce[v13])
        v15 = 1;
      else
        v15 = v13 == 11;
      ++v13;
    }
    while (!v15);
    if (v12)
    {
      v19 = self->super._ucatCore->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else
    {
      objc_msgSend(v6, "appendBytes:length:", v21, 16, v21, 16);
      -[SFServiceSession _sendFrameType:data:](self, "_sendFrameType:data:", v7, v6);
    }
    goto LABEL_16;
  }
  v20 = self->super._ucatCore->var0;
  if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize()))
    LogPrintF();

LABEL_16:
}

- (void)sendFrameType:(unsigned __int8)a3 data:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int8 v11;

  v6 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFServiceSession_sendFrameType_data___block_invoke;
  block[3] = &unk_1E4832528;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __39__SFServiceSession_sendFrameType_data___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendFrameType:data:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_sendFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = a3;
  v6 = a4;
  self->_sendLastTicks = mach_absolute_time();
  -[SFService _sendToPeer:type:data:](self->_service, "_sendToPeer:type:data:", self->super._peer, v4, v6);

}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4;
  id v6;

  v4 = a3;
  v6 = a4;
  self->_sendLastTicks = mach_absolute_time();
  -[SFService _sendToPeer:type:unencryptedObject:](self->_service, "_sendToPeer:type:unencryptedObject:", self->super._peer, v4, v6);

}

- (void)sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unsigned int v16;

  v8 = a4;
  v9 = a5;
  dispatchQueue = self->super._dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __64__SFServiceSession_sendRequestWithFlags_object_responseHandler___block_invoke;
  v13[3] = &unk_1E4831C00;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __64__SFServiceSession_sendRequestWithFlags_object_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequestWithFlags:object:responseHandler:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_sendRequestWithFlags:(unsigned int)a3 object:(id)a4 responseHandler:(id)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *requestMap;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v6 = *(_QWORD *)&a3;
  v17[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  RandomBytes();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("_xs"));
  if (!self->super._requestMap)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestMap = self->super._requestMap;
    self->super._requestMap = v11;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6, 0, CFSTR("_fl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("_rh");
  v17[0] = v13;
  v14 = _Block_copy(v8);

  v17[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->super._requestMap, "setObject:forKeyedSubscript:", v15, v10);

  -[SFServiceSession _sendWithFlags:object:](self, "_sendWithFlags:object:", v6, v9);
}

- (void)sendWithFlags:(unsigned int)a3 object:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->super._dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__SFServiceSession_sendWithFlags_object___block_invoke;
  block[3] = &unk_1E4832158;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __41__SFServiceSession_sendWithFlags_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendWithFlags:object:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_sendWithFlags:(unsigned int)a3 object:(id)a4
{
  char v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v6 = a4;
  v8 = v6;
  if ((v4 & 1) != 0)
  {
    -[SFServiceSession sendEncryptedObject:](self, "sendEncryptedObject:", v6);
  }
  else
  {
    if ((self->super._sessionFlags & 2) != 0)
      v7 = 29;
    else
      v7 = 5;
    -[SFServiceSession _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", v7, v6);
  }

}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  id v6;
  SFServiceSession *v7;
  id v8;
  uint64_t v9;
  id v10;

  v4 = a3;
  v6 = a4;
  if ((int)v4 > 15)
  {
    switch((int)v4)
    {
      case 16:
      case 17:
      case 18:
      case 19:
      case 29:
        goto LABEL_3;
      case 20:
      case 21:
      case 22:
      case 24:
      case 25:
      case 26:
      case 27:
        goto LABEL_14;
      case 23:
        v10 = v6;
        -[SFServiceSession receivedStartRequest:](self, "receivedStartRequest:", v6);
        goto LABEL_13;
      case 28:
        goto LABEL_6;
      default:
        if ((_DWORD)v4 == 64)
        {
          v7 = self;
          v10 = v6;
          v8 = v6;
          v9 = 0;
        }
        else
        {
          if ((_DWORD)v4 != 65)
            goto LABEL_14;
          v7 = self;
          v10 = v6;
          v8 = v6;
          v9 = 1;
        }
        -[SFSession sessionReceivedFragmentData:last:](v7, "sessionReceivedFragmentData:last:", v8, v9);
        break;
    }
    goto LABEL_13;
  }
  if ((_DWORD)v4 == 5)
  {
LABEL_3:
    v10 = v6;
    -[SFServiceSession receivedUnencryptedData:type:](self, "receivedUnencryptedData:type:", v6, v4);
LABEL_13:
    v6 = v10;
    goto LABEL_14;
  }
  if ((_DWORD)v4 == 6)
  {
LABEL_6:
    v10 = v6;
    -[SFServiceSession receivedEncryptedData:type:](self, "receivedEncryptedData:type:", v6, v4);
    goto LABEL_13;
  }
LABEL_14:

}

- (BOOL)pairingContainsACL:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  CUPairingSession *pairVerifySession;
  void *v7;
  void *v8;
  uint64_t Int64;

  dispatchQueue = self->super._dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  pairVerifySession = self->_pairVerifySession;
  if (!pairVerifySession)
    pairVerifySession = self->_pairSetupSession;
  -[CUPairingSession pairedPeer](pairVerifySession, "pairedPeer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "acl");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  Int64 = CFDictionaryGetInt64();

  return Int64 != 0;
}

- (id)pairingDeriveKeyForIdentifier:(id)a3 keyLength:(unint64_t)a4
{
  id v6;
  const char *v7;
  size_t v8;
  void *v9;
  void *v10;
  CUPairingSession *pairSetupSession;
  id v12;
  int var0;

  v6 = objc_retainAutorelease(a3);
  v7 = (const char *)objc_msgSend(v6, "UTF8String");
  v8 = strlen(v7);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", a4);
  v10 = v9;
  pairSetupSession = self->_pairSetupSession;
  if ((pairSetupSession || (pairSetupSession = self->_pairVerifySession) != 0)
    && !-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "IdentifierKeyInfo", 17, v7, v8, a4, objc_msgSend(objc_retainAutorelease(v9), "mutableBytes")))
  {
    v12 = v10;
  }
  else
  {
    var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v12 = 0;
  }

  return v12;
}

- (void)pairSetupWithFlags:(unsigned int)a3
{
  unsigned int *p_pairSetupXID;
  int var0;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  CUPairingSession *v11;
  CUPairingSession *pairSetupSession;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  SFService *service;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t sessionFlags;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  unsigned int v36;

  p_pairSetupXID = &self->_pairSetupXID;
  RandomBytes();
  var0 = self->super._ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v28 = *p_pairSetupXID;
    LogPrintF();
  }
  if ((self->super._sessionFlags & 0x800) != 0)
  {
    v7 = 20;
  }
  else
  {
    v7 = a3 & 0x18 | 4;
    -[SFService showPINHandler](self->_service, "showPINHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {

    }
    else
    {
      -[SFService showPINHandlerEx](self->_service, "showPINHandlerEx");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        v7 = v7;
      else
        v7 = a3 & 0x18 | 0x84;
    }
  }
  -[SFService promptForPINHandler](self->_service, "promptForPINHandler", v28);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  v11 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = v11;

  -[SFService pairSetupACL](self->_service, "pairSetupACL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SFService pairSetupACL](self->_service, "pairSetupACL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:", v14);

  }
  -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->super._dispatchQueue);
  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", v7);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->super._ucatCrypto->var4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", v15);

  -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", -[SFService pinType](self->_service, "pinType"));
  -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", 1);
  v16 = self->super._fixedPIN;
  if (!-[NSString length](v16, "length"))
  {
    -[SFService fixedPIN](self->_service, "fixedPIN");
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (NSString *)v17;
  }
  if (!-[NSString length](v16, "length") && IsAppleInternalBuild())
  {
    CFStringGetTypeID();
    v18 = CFPrefs_CopyTypedValue();

    v16 = (NSString *)v18;
  }
  if (-[NSString length](v16, "length"))
    -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", v16);
  -[SFService showPINHandlerEx](self->_service, "showPINHandlerEx");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  service = self->_service;
  if (v19)
  {
    -[SFService showPINHandlerEx](service, "showPINHandlerEx");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setShowPINHandlerEx:](self->_pairSetupSession, "setShowPINHandlerEx:", v21);
  }
  else
  {
    -[SFService showPINHandler](service, "showPINHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
      goto LABEL_26;
    -[SFService showPINHandler](self->_service, "showPINHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setShowPINHandler:](self->_pairSetupSession, "setShowPINHandler:", v21);
  }

LABEL_26:
  -[SFService hidePINHandler](self->_service, "hidePINHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[SFService hidePINHandler](self->_service, "hidePINHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setHidePINHandler:](self->_pairSetupSession, "setHidePINHandler:", v24);

  }
  if (v10)
  {
    -[SFService promptForPINHandler](self->_service, "promptForPINHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setPromptForPINHandler:](self->_pairSetupSession, "setPromptForPINHandler:", v25);

  }
  v26 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __39__SFServiceSession_pairSetupWithFlags___block_invoke;
  v35[3] = &unk_1E4833CA8;
  v35[4] = self;
  v36 = a3;
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v35);
  v34[0] = v26;
  v34[1] = 3221225472;
  v34[2] = __39__SFServiceSession_pairSetupWithFlags___block_invoke_2;
  v34[3] = &unk_1E482DFF0;
  v34[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v34);
  v27 = self->super._ucatCore->var0;
  if (v27 <= 30 && (v27 != -1 || _LogCategory_Initialize()))
  {
    v32 = v7;
    v33 = &unk_1A2AF8DE3;
    sessionFlags = self->super._sessionFlags;
    v31 = &unk_1A2AF8D0E;
    v29 = *p_pairSetupXID;
    LogPrintF();
  }
  -[CUPairingSession activate](self->_pairSetupSession, "activate", v29, sessionFlags, v31, v32, v33);

}

void __39__SFServiceSession_pairSetupWithFlags___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = **(_DWORD **)(v6 + 160);
  if (v7 <= 30)
  {
    if (v7 != -1 || (v8 = _LogCategory_Initialize(), v6 = *(_QWORD *)(a1 + 32), v8))
    {
      v15 = a2;
      LogPrintF();
      v6 = *(_QWORD *)(a1 + 32);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v6 + 608), v15, CFSTR("pd"), CFSTR("pxid"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a2 & 1) != 0)
  {
    v12 = (void *)objc_msgSend(v10, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("pf"));

    v14 = objc_msgSend(v12, "copy");
    v11 = 16;
    v10 = (void *)v14;
  }
  else
  {
    v11 = 17;
  }
  objc_msgSend(*(id *)(a1 + 32), "_sendFrameType:unencryptedObject:", v11, v10);

}

void __39__SFServiceSession_pairSetupWithFlags___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "pairSetupCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "pairSetupCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v3);

  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "_pairSetupCompleted:", NSErrorToOSStatus());
  if ((_DWORD)v6)
  {
    v7 = *(void **)(a1 + 32);
    v10 = CFSTR("er");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sendFrameType:unencryptedObject:", 17, v9);

  }
}

- (void)pairSetup:(id)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int var0;
  const char *v11;
  const __CFString *v12;
  int v13;
  __int16 Int64Ranged;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CUPairingSession *v20;
  CUPairingSession *pairSetupSession;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  NSString *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  SFService *service;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  int v38;
  void *v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  int v43;
  int v44;
  int v45;
  const char *v46;
  uint64_t pairSetupXID;
  const __CFString *v48;
  uint64_t sessionFlags;
  void *v50;
  uint64_t v51;
  void *v52;
  _QWORD v53[5];
  _QWORD v54[5];
  int v55;
  const __CFString *v56;
  _QWORD v57[3];

  v4 = a4;
  v57[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v55 = 0;
  if (-[SFService pairSetupDisabled](self->_service, "pairSetupDisabled"))
  {
    v55 = -6731;
    v56 = CFSTR("er");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4294960565);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFServiceSession _sendFrameType:unencryptedObject:](self, "_sendFrameType:unencryptedObject:", 17, v8);

    goto LABEL_3;
  }
  var0 = self->super._ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v11 = "no";
    if (v4)
      v11 = "yes";
    if (self->_pairSetupSession)
      v12 = CFSTR("not nil");
    else
      v12 = CFSTR("is nil");
    v46 = v11;
    v48 = v12;
    LogPrintF();
  }
  if (v4 || !self->_pairSetupSession)
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    self->_pairSetupXID = CFDictionaryGetInt64Ranged();
    if ((self->super._sessionFlags & 0x800) != 0)
    {
      v15 = 20;
    }
    else
    {
      v15 = Int64Ranged & 0x18 | 4;
      -[SFService showPINHandler](self->_service, "showPINHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

      }
      else
      {
        -[SFService showPINHandlerEx](self->_service, "showPINHandlerEx");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
          v15 = Int64Ranged & 0x18 | 0x84;
      }
    }
    v18 = v15 | Int64Ranged & 0x100u;
    -[SFService promptForPINHandler](self->_service, "promptForPINHandler", v46, v48);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0);
    -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", 0);
    -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
    v20 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
    pairSetupSession = self->_pairSetupSession;
    self->_pairSetupSession = v20;

    -[SFService pairSetupACL](self->_service, "pairSetupACL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      -[SFService pairSetupACL](self->_service, "pairSetupACL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:", v23);

    }
    -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->super._dispatchQueue);
    -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", v18);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->super._ucatCrypto->var4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", v24);

    -[CUPairingSession setPinType:](self->_pairSetupSession, "setPinType:", -[SFService pinType](self->_service, "pinType"));
    if (v19)
      v25 = 1;
    else
      v25 = 2;
    -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", v25);
    -[SFSession peerDevice](self, "peerDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setPeerDeviceClass:](self->_pairSetupSession, "setPeerDeviceClass:", MGDeviceClassFromSFDeviceClassCode(objc_msgSend(v26, "deviceClassCode")));

    v27 = self->super._fixedPIN;
    if (!-[NSString length](v27, "length"))
    {
      -[SFService fixedPIN](self->_service, "fixedPIN");
      v28 = objc_claimAutoreleasedReturnValue();

      v27 = (NSString *)v28;
    }
    if (!-[NSString length](v27, "length") && IsAppleInternalBuild())
    {
      CFStringGetTypeID();
      v29 = CFPrefs_CopyTypedValue();

      v27 = (NSString *)v29;
    }
    if (-[NSString length](v27, "length"))
      -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", v27);
    -[SFService showPINHandlerEx](self->_service, "showPINHandlerEx");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    service = self->_service;
    if (v30)
    {
      -[SFService showPINHandlerEx](service, "showPINHandlerEx");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setShowPINHandlerEx:](self->_pairSetupSession, "setShowPINHandlerEx:", v32);
    }
    else
    {
      -[SFService showPINHandler](service, "showPINHandler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v33)
      {
LABEL_41:
        -[SFService hidePINHandler](self->_service, "hidePINHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[SFService hidePINHandler](self->_service, "hidePINHandler");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUPairingSession setHidePINHandler:](self->_pairSetupSession, "setHidePINHandler:", v35);

        }
        if (v19)
        {
          -[SFService promptForPINHandler](self->_service, "promptForPINHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUPairingSession setPromptForPINHandler:](self->_pairSetupSession, "setPromptForPINHandler:", v36);

        }
        v37 = -[SFService isCLIMode](self->_service, "isCLIMode");
        v38 = self->super._ucatCore->var0;
        if (v37)
        {
          if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          -[SFService forcedPin](self->_service, "forcedPin");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", v39);

        }
        else if (v38 <= 30 && (v38 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v40 = MEMORY[0x1E0C809B0];
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __36__SFServiceSession_pairSetup_start___block_invoke;
        v54[3] = &unk_1E4833CD0;
        v54[4] = self;
        -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v54);
        v53[0] = v40;
        v53[1] = 3221225472;
        v53[2] = __36__SFServiceSession_pairSetup_start___block_invoke_2;
        v53[3] = &unk_1E482DFF0;
        v53[4] = self;
        -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v53);
        v41 = self->super._ucatCore->var0;
        if (v41 <= 30 && (v41 != -1 || _LogCategory_Initialize()))
        {
          v51 = v18;
          v52 = &unk_1A2AF8DE3;
          sessionFlags = self->super._sessionFlags;
          v50 = &unk_1A2AF8D0E;
          pairSetupXID = self->_pairSetupXID;
          LogPrintF();
        }
        -[CUPairingSession activate](self->_pairSetupSession, "activate", pairSetupXID, sessionFlags, v50, v51, v52);

        goto LABEL_59;
      }
      -[SFService showPINHandler](self->_service, "showPINHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setShowPINHandler:](self->_pairSetupSession, "setShowPINHandler:", v32);
    }

    goto LABEL_41;
  }
  v13 = self->super._ucatCore->var0;
  if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_59:
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v42 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v42;
  if (v55)
  {
    v44 = self->super._ucatCore->var0;
    if (v44 <= 60 && (v44 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_62;
  }
  if (v42)
  {
    -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v42);
    goto LABEL_62;
  }
  v55 = -6762;
  v45 = self->super._ucatCore->var0;
  if (v45 > 60)
  {
    v9 = 0;
    goto LABEL_67;
  }
  if (v45 != -1 || _LogCategory_Initialize())
    LogPrintF();
LABEL_3:
  v9 = 0;
LABEL_62:
  if (v55)
  {
    v43 = self->super._ucatCore->var0;
    if (v43 <= 60 && (v43 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
LABEL_67:

}

void __36__SFServiceSession_pairSetup_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned int *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v3 = *(unsigned int **)(a1 + 32);
  v9[0] = CFSTR("pd");
  v9[1] = CFSTR("pxid");
  v10[0] = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = v3[152];
  v6 = a3;
  objc_msgSend(v4, "numberWithUnsignedInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 17, v8);

}

void __36__SFServiceSession_pairSetup_start___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "pairSetupCompletionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 632), "pairSetupCompletionHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v3);

  }
  v6 = objc_msgSend(*(id *)(a1 + 32), "_pairSetupCompleted:", NSErrorToOSStatus());
  if ((_DWORD)v6)
  {
    v7 = *(void **)(a1 + 32);
    v10 = CFSTR("er");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_sendFrameType:unencryptedObject:", 17, v9);

  }
}

- (int)_pairSetupCompleted:(int)a3
{
  uint64_t v3;
  CUPairingSession *pairSetupSession;
  uint64_t v6;
  int v7;
  void (**v8)(_QWORD, _QWORD);
  int var0;
  uint64_t v11;
  _OWORD v12[2];
  _OWORD __s[2];
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  memset(__s, 0, sizeof(__s));
  memset(v12, 0, sizeof(v12));
  if (a3)
    goto LABEL_16;
  pairSetupSession = self->_pairSetupSession;
  if (!pairSetupSession)
  {
    v3 = 4294960534;
LABEL_16:
    var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v11 = v3;
      LogPrintF();
    }
    -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate", v11);
    v8 = (void (**)(_QWORD, _QWORD))self->_pairSetupSession;
    self->_pairSetupSession = 0;
    goto LABEL_12;
  }
  v6 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "ReadKeySalt", 11, "ReadKeyInfo", 11, 32, v12);
  if ((_DWORD)v6
    || (v6 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](self->_pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "WriteKeySalt", 12, "WriteKeyInfo", 12, 32, __s), (_DWORD)v6)|| (v6 = -[SFServiceSession setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:](self, "setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:", __s, 32, v12, 32), (_DWORD)v6))
  {
    v3 = v6;
    goto LABEL_16;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v12, 0x20uLL, 0, 0x20uLL);
  v7 = self->super._ucatCore->var0;
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[SFService sessionSecuredHandler](self->_service, "sessionSecuredHandler");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFService sessionSecuredHandler](self->_service, "sessionSecuredHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, SFServiceSession *))v8)[2](v8, self);
    LODWORD(v3) = 0;
LABEL_12:

  }
  return v3;
}

- (void)tryPIN:(id)a3
{
  -[CUPairingSession tryPIN:](self->_pairSetupSession, "tryPIN:", a3);
}

- (void)pairVerify:(id)a3 start:(BOOL)a4
{
  id v6;
  __int16 Int64Ranged;
  uint64_t v8;
  int v9;
  CUPairingSession *v10;
  CUPairingSession *pairVerifySession;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SFService *service;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  int var0;
  int v25;
  _QWORD v26[5];
  _QWORD v27[5];
  int v28;

  v6 = a3;
  v28 = 0;
  if (a4 || !self->_pairVerifySession)
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if ((CFDictionaryGetInt64Ranged() & 8) != 0)
      v8 = 12;
    else
      v8 = 4;
    -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", 0);
    -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", 0);
    -[CUPairingSession invalidate](self->_pairVerifySession, "invalidate");
    if ((-[SFService sessionFlags](self->_service, "sessionFlags") & 4) != 0)
    {
      if ((-[SFService sessionFlags](self->_service, "sessionFlags") & 8) != 0)
        v9 = 1052672;
      else
        v9 = 4096;
      v8 = v9 & 0xFFDFFFFF | (((-[SFService sessionFlags](self->_service, "sessionFlags") >> 4) & 1) << 21) | v8;
    }
    else if ((Int64Ranged & 0x400) == 0)
    {
      v8 = v8 & 0xFFBFFFFF | (((self->super._sessionFlags >> 6) & 1) << 22);
    }
    v10 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
    pairVerifySession = self->_pairVerifySession;
    self->_pairVerifySession = v10;

    -[SFService pairVerifyACL](self->_service, "pairVerifyACL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[SFService pairVerifyACL](self->_service, "pairVerifyACL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setAcl:](self->_pairVerifySession, "setAcl:", v13);

    }
    -[CUPairingSession setDispatchQueue:](self->_pairVerifySession, "setDispatchQueue:", self->super._dispatchQueue);
    -[CUPairingSession setFlags:](self->_pairVerifySession, "setFlags:", v8);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->super._ucatCrypto->var4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUPairingSession setLabel:](self->_pairVerifySession, "setLabel:", v14);

    -[CUPairingSession setSessionType:](self->_pairVerifySession, "setSessionType:", 4);
    if ((v8 & 0x1000) == 0)
      goto LABEL_24;
    -[SFService myAppleIDInfoClient](self->_service, "myAppleIDInfoClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    service = self->_service;
    if (v15)
    {
      -[SFService myAppleIDInfoClient](service, "myAppleIDInfoClient");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setMyAppleIDInfoClient:](self->_pairVerifySession, "setMyAppleIDInfoClient:", v17);
    }
    else
    {
      -[SFService myAppleID](service, "myAppleID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
        goto LABEL_21;
      -[SFService myAppleID](self->_service, "myAppleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setMyAppleID:](self->_pairVerifySession, "setMyAppleID:", v17);
    }

LABEL_21:
    if (self->super._peerAppleID)
    {
      -[CUPairingSession setPeerAppleID:](self->_pairVerifySession, "setPeerAppleID:");
    }
    else
    {
      -[SFService peerAppleID](self->_service, "peerAppleID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CUPairingSession setPeerAppleID:](self->_pairVerifySession, "setPeerAppleID:", v19);

    }
LABEL_24:
    v20 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __37__SFServiceSession_pairVerify_start___block_invoke;
    v27[3] = &unk_1E4833CD0;
    v27[4] = self;
    -[CUPairingSession setSendDataHandler:](self->_pairVerifySession, "setSendDataHandler:", v27);
    v26[0] = v20;
    v26[1] = 3221225472;
    v26[2] = __37__SFServiceSession_pairVerify_start___block_invoke_2;
    v26[3] = &unk_1E482DFF0;
    v26[4] = self;
    -[CUPairingSession setCompletionHandler:](self->_pairVerifySession, "setCompletionHandler:", v26);
    -[CUPairingSession activate](self->_pairVerifySession, "activate");
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v28)
  {
    var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else if (v21)
  {
    -[CUPairingSession receivedData:](self->_pairVerifySession, "receivedData:", v21);
  }
  else
  {
    v28 = -6762;
    v25 = self->super._ucatCore->var0;
    if (v25 <= 60 && (v25 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v22 = 0;
  }
  if (v28)
  {
    v23 = self->super._ucatCore->var0;
    if (v23 <= 60 && (v23 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

void __37__SFServiceSession_pairVerify_start___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v7 = CFSTR("pd");
  v8[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 19, v6);

}

void __37__SFServiceSession_pairVerify_start___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "_pairVerifyCompleted:", NSErrorToOSStatus());
  if ((_DWORD)v2)
  {
    v3 = *(void **)(a1 + 32);
    v6 = CFSTR("er");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_sendFrameType:unencryptedObject:", 19, v5);

  }
}

- (int)_pairVerifyCompleted:(int)a3
{
  uint64_t v3;
  CUPairingSession *pairVerifySession;
  uint64_t v6;
  int v7;
  void (**v8)(_QWORD, _QWORD);
  int var0;
  uint64_t v11;
  _OWORD v12[2];
  _OWORD __s[2];
  uint64_t v14;

  v3 = *(_QWORD *)&a3;
  v14 = *MEMORY[0x1E0C80C00];
  memset(__s, 0, sizeof(__s));
  memset(v12, 0, sizeof(v12));
  if (a3)
    goto LABEL_16;
  pairVerifySession = self->_pairVerifySession;
  if (!pairVerifySession)
  {
    v3 = 4294960534;
LABEL_16:
    var0 = self->super._ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v11 = v3;
      LogPrintF();
    }
    -[CUPairingSession invalidate](self->_pairVerifySession, "invalidate", v11);
    v8 = (void (**)(_QWORD, _QWORD))self->_pairVerifySession;
    self->_pairVerifySession = 0;
    goto LABEL_12;
  }
  v6 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairVerifySession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "ReadKeySalt", 11, "ReadKeyInfo", 11, 32, v12);
  if ((_DWORD)v6
    || (v6 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](self->_pairVerifySession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "WriteKeySalt", 12, "WriteKeyInfo", 12, 32, __s), (_DWORD)v6)|| (v6 = -[SFServiceSession setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:](self, "setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:", __s, 32, v12, 32), (_DWORD)v6))
  {
    v3 = v6;
    goto LABEL_16;
  }
  memset_s(__s, 0x20uLL, 0, 0x20uLL);
  memset_s(v12, 0x20uLL, 0, 0x20uLL);
  v7 = self->super._ucatCore->var0;
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[SFService sessionSecuredHandler](self->_service, "sessionSecuredHandler");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFService sessionSecuredHandler](self->_service, "sessionSecuredHandler");
    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, SFServiceSession *))v8)[2](v8, self);
    LODWORD(v3) = 0;
LABEL_12:

  }
  return v3;
}

- (unint64_t)sendLastTicks
{
  return self->_sendLastTicks;
}

- (void)setSendLastTicks:(unint64_t)a3
{
  self->_sendLastTicks = a3;
}

- (SFService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pairVerifySession, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
}

@end
