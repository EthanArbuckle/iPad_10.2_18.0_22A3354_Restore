@implementation SFSession

- (void)registerForExternalIO:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SFSession_CNJ__registerForExternalIO___block_invoke;
  v6[3] = &unk_1E482E2D0;
  v7 = v4;
  v5 = v4;
  -[SFSession registerRequestID:options:handler:](self, "registerRequestID:options:handler:", CFSTR("_cnjExtIO"), 0, v6);

}

void __40__SFSession_CNJ__registerForExternalIO___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("d"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if (gLogCategory_SFDeviceOperationCNJ <= 30
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      v8 = objc_msgSend(v6, "length");
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "receivedData:", v6, v8);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD))v9 + 2))(v9, 0, 0, MEMORY[0x1E0C9AA70]);
  }
  else
  {
    NSErrorWithOSStatusF();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (gLogCategory_SFDeviceOperationCNJ <= 90
      && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    (*((void (**)(id, void *, _QWORD, _QWORD))v9 + 2))(v9, v7, 0, MEMORY[0x1E0C9AA70]);

  }
}

- (void)sendExternalIO:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    v6 = objc_msgSend(v4, "length");
    LogPrintF();
  }
  v7 = CFSTR("d");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSession sendRequestID:options:request:responseHandler:](self, "sendRequestID:options:request:responseHandler:", CFSTR("_cnjExtIO"), 0, v5, &__block_literal_global_52);

}

void __33__SFSession_CNJ__sendExternalIO___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;

  v8 = a2;
  v6 = a3;
  v7 = a4;
  if (gLogCategory_SFDeviceOperationCNJ <= 30
    && (gLogCategory_SFDeviceOperationCNJ != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFSession)init
{
  SFSession *v2;
  SFSession *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSession;
  v2 = -[SFSession init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    SFMainQueue(v2);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v4;

    v3->_ucatCore = (LogCategory *)&gLogCategory_SFSessionCore;
    v3->_ucatCrypto = (LogCategory *)&gLogCategory_SFSessionCrypto;
  }
  return v3;
}

- (SFSession)initWithCoder:(id)a3
{
  id v4;
  SFSession *v5;
  SFSession *v6;
  uint64_t v7;
  OS_dispatch_queue *dispatchQueue;
  uint64_t v9;
  NSUUID *identifier;
  uint64_t v11;
  SFDevice *peerDevice;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSUUID *serviceUUID;
  SFSession *v19;
  objc_super v21;
  uint64_t v22;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SFSession;
  v5 = -[SFSession init](&v21, sel_init);
  v6 = v5;
  if (v5)
  {
    SFMainQueue(v5);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v6->_dispatchQueue;
    v6->_dispatchQueue = (OS_dispatch_queue *)v7;

    v6->_ucatCore = (LogCategory *)&gLogCategory_SFSessionCore;
    v6->_ucatCrypto = (LogCategory *)&gLogCategory_SFSessionCrypto;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ident")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ident"));
      v9 = objc_claimAutoreleasedReturnValue();
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v9;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("pd")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pd"));
      v11 = objc_claimAutoreleasedReturnValue();
      peerDevice = v6->_peerDevice;
      v6->_peerDevice = (SFDevice *)v11;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("st")))
    {
      v13 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("st"));
      v6->_serviceType = v13;
      if (v13 >= 0x100)
      {
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
        _NSMethodExceptionProem();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "raise:format:", v15, CFSTR("%@: service type out-of-range: %ld"), v16, v13);

      }
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sid")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
      v17 = objc_claimAutoreleasedReturnValue();
      serviceUUID = v6->_serviceUUID;
      v6->_serviceUUID = (NSUUID *)v17;

    }
    v22 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_sessionFlags = v22;
    v19 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSUUID *identifier;
  SFDevice *peerDevice;
  NSUUID *serviceUUID;
  uint64_t sessionFlags;
  id v9;

  v4 = a3;
  identifier = self->_identifier;
  v9 = v4;
  if (identifier)
  {
    objc_msgSend(v4, "encodeObject:forKey:", identifier, CFSTR("ident"));
    v4 = v9;
  }
  peerDevice = self->_peerDevice;
  if (peerDevice)
  {
    objc_msgSend(v9, "encodeObject:forKey:", peerDevice, CFSTR("pd"));
    v4 = v9;
  }
  if (self->_serviceType)
  {
    objc_msgSend(v9, "encodeInteger:forKey:");
    v4 = v9;
  }
  serviceUUID = self->_serviceUUID;
  if (serviceUUID)
  {
    objc_msgSend(v9, "encodeObject:forKey:", serviceUUID, CFSTR("sid"));
    v4 = v9;
  }
  sessionFlags = self->_sessionFlags;
  if ((_DWORD)sessionFlags)
  {
    objc_msgSend(v9, "encodeInteger:forKey:", sessionFlags, CFSTR("seFl"));
    v4 = v9;
  }

}

- (void)dealloc
{
  LogCategory *ucatCore;
  LogCategory *ucatCrypto;
  SFSession *v5;
  SEL v6;
  objc_super v7;

  if (self->_activateCalled && !self->_invalidateCalled)
  {
    v5 = (SFSession *)FatalErrorF();
    -[SFSession _cleanup](v5, v6);
  }
  else
  {
    -[SFSession _cleanup](self, "_cleanup");
    ucatCore = self->_ucatCore;
    if (ucatCore && (ucatCore->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucatCore = 0;
    }
    ucatCrypto = self->_ucatCrypto;
    if (ucatCrypto)
    {
      if ((ucatCrypto->var3 & 0x40000) != 0)
      {
        LogCategory_Remove();
        self->_ucatCrypto = 0;
      }
    }
    v7.receiver = self;
    v7.super_class = (Class)SFSession;
    -[SFSession dealloc](&v7, sel_dealloc);
  }
}

- (void)_cleanup
{
  CryptoAEADPrivate *encryptionReadAEAD;
  CryptoAEADPrivate *encryptionWriteAEAD;
  id pairSetupCompletion;
  CUPairingSession *pairSetupSession;
  id pairVerifyCompletion;
  PairingSessionPrivate *pairVerifySession;
  OS_dispatch_source *timeoutTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  id bluetoothStateChangedHandler;
  id errorHandler;
  id eventMessageHandler;
  id interruptionHandler;
  id invalidationHandler;
  id promptForPINHandler;
  id receivedFrameHandler;
  id receivedObjectHandler;
  id receivedRequestHandler;
  id requestMessageHandler;
  id responseMessageInternalHandler;
  id sendFrameHandler;
  id sessionStartedHandler;
  OS_os_transaction *transaction;
  id timeoutHandler;
  NSXPCConnection *xpcCnx;

  encryptionReadAEAD = self->_encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->_encryptionReadAEAD = 0;
  }
  encryptionWriteAEAD = self->_encryptionWriteAEAD;
  if (encryptionWriteAEAD)
  {
    CFRelease(encryptionWriteAEAD);
    self->_encryptionWriteAEAD = 0;
  }
  pairSetupCompletion = self->_pairSetupCompletion;
  self->_pairSetupCompletion = 0;

  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  pairVerifyCompletion = self->_pairVerifyCompletion;
  self->_pairVerifyCompletion = 0;

  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v10 = timeoutTimer;
    dispatch_source_cancel(v10);
    v11 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_bluetoothStateChangedHandler = 0;

  errorHandler = self->_errorHandler;
  self->_errorHandler = 0;

  eventMessageHandler = self->_eventMessageHandler;
  self->_eventMessageHandler = 0;

  interruptionHandler = self->_interruptionHandler;
  self->_interruptionHandler = 0;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  promptForPINHandler = self->_promptForPINHandler;
  self->_promptForPINHandler = 0;

  receivedFrameHandler = self->_receivedFrameHandler;
  self->_receivedFrameHandler = 0;

  receivedObjectHandler = self->_receivedObjectHandler;
  self->_receivedObjectHandler = 0;

  receivedRequestHandler = self->_receivedRequestHandler;
  self->_receivedRequestHandler = 0;

  requestMessageHandler = self->_requestMessageHandler;
  self->_requestMessageHandler = 0;

  responseMessageInternalHandler = self->_responseMessageInternalHandler;
  self->_responseMessageInternalHandler = 0;

  sendFrameHandler = self->_sendFrameHandler;
  self->_sendFrameHandler = 0;

  sessionStartedHandler = self->_sessionStartedHandler;
  self->_sessionStartedHandler = 0;

  transaction = self->_transaction;
  self->_transaction = 0;

  timeoutHandler = self->_timeoutHandler;
  self->_timeoutHandler = 0;

  xpcCnx = self->_xpcCnx;
  self->_xpcCnx = 0;

}

- (id)description
{
  id v3;
  int serviceType;
  id *v5;
  NSString *serviceIdentifier;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *identifier;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v19[2];

  v19[1] = 0;
  NSAppendPrintF();
  v3 = 0;
  serviceType = self->_serviceType;
  if (self->_serviceType)
  {
    v19[0] = v3;
    identifier = (void *)SFNearbyBLEServiceTypeToString_0(serviceType);
    v5 = (id *)v19;
  }
  else
  {
    serviceIdentifier = self->_serviceIdentifier;
    if (!serviceIdentifier)
      goto LABEL_6;
    v18 = v3;
    identifier = serviceIdentifier;
    v5 = &v18;
  }
  NSAppendPrintF();
  v7 = *v5;

  v3 = v7;
LABEL_6:
  if (self->_invalidateCalled)
  {
    NSAppendPrintF();
    v8 = v3;

    v3 = v8;
  }
  if (self->_identifier)
  {
    identifier = self->_identifier;
    NSAppendPrintF();
    v9 = v3;

    v3 = v9;
  }
  if (self->_peerDevice)
  {
    identifier = self->_peerDevice;
    NSAppendPrintF();
    v10 = v3;

    v3 = v10;
  }
  if (self->_sessionFlags)
  {
    identifier = (void *)self->_sessionFlags;
    v17 = &unk_1A2AF9034;
    NSAppendPrintF();
    v11 = v3;

    v3 = v11;
  }
  if (-[NSMutableDictionary count](self->_requestHandlers, "count", identifier, v17))
  {
    v16 = -[NSMutableDictionary count](self->_requestHandlers, "count");
    NSAppendPrintF();
    v12 = v3;

    v3 = v12;
  }
  if (-[NSMutableDictionary count](self->_requestMap, "count", v16))
  {
    -[NSMutableDictionary count](self->_requestMap, "count");
    NSAppendPrintF();
    v13 = v3;

    v3 = v13;
  }
  return v3;
}

- (int)setEncryptionReadKey:(const char *)a3 readKeyLen:(unint64_t)a4 writeKey:(const char *)a5 writeKeyLen:(unint64_t)a6
{
  CryptoAEADPrivate *encryptionReadAEAD;
  CryptoAEADPrivate *v8;
  CryptoAEADPrivate *encryptionWriteAEAD;
  CryptoAEADPrivate *v10;
  int var0;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  encryptionReadAEAD = self->_encryptionReadAEAD;
  if (encryptionReadAEAD)
  {
    CFRelease(encryptionReadAEAD);
    self->_encryptionReadAEAD = 0;
  }
  v8 = (CryptoAEADPrivate *)CryptoAEADCreate();
  self->_encryptionReadAEAD = v8;
  if (v8)
  {
    *(_DWORD *)&self->_encryptionReadNonce[8] = 0;
    *(_QWORD *)self->_encryptionReadNonce = 0;
    encryptionWriteAEAD = self->_encryptionWriteAEAD;
    if (encryptionWriteAEAD)
    {
      CFRelease(encryptionWriteAEAD);
      self->_encryptionWriteAEAD = 0;
    }
    v10 = (CryptoAEADPrivate *)CryptoAEADCreate();
    self->_encryptionWriteAEAD = v10;
    if (v10)
    {
      *(_DWORD *)&self->_encryptionWriteNonce[8] = 0;
      *(_QWORD *)self->_encryptionWriteNonce = 0;
      var0 = self->_ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
  return 0;
}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

  -[NSString UTF8String](self->_label, "UTF8String");
  ASPrintF();
}

- (CUPairedPeer)pairedPeer
{
  return (CUPairedPeer *)-[CUPairingSession pairedPeer](self->_pairSetupSession, "pairedPeer");
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__SFSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __36__SFSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void *v3;
  id v5;
  NSObject *v6;
  unsigned int *p_sessionID;
  NSString *v8;
  int var0;
  int serviceType;
  NSUUID *v11;
  NSUUID *serviceUUID;
  NSUUID *v13;
  NSUUID *v14;
  NSMutableDictionary *v15;
  NSMutableDictionary *requestQueue;
  NSUUID *v17;
  NSUUID *identifier;
  NSUUID *v19;
  NSUUID *peer;
  void *v21;
  id activateCompletion;
  uint64_t v23;
  NSXPCConnection *xpcCnx;
  void *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  unsigned int v38;
  os_activity_scope_state_s state;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  v38 = 0;
  p_sessionID = &self->_sessionID;
  RandomBytes();
  v8 = self->_serviceIdentifier;
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v33 = (uint64_t)v8;
    v34 = *p_sessionID;
    LogPrintF();
  }
  if (self->_invalidateCalled)
  {
    v26 = 4294960572;
  }
  else
  {
    self->_activateCalled = 1;
    if (v8)
    {
      serviceType = self->_serviceType;
      if (!self->_serviceType)
      {
        serviceType = SFServiceIdentifierToType(v8);
        self->_serviceType = serviceType;
      }
      if (self->_serviceUUID)
        goto LABEL_39;
      SFServiceTypeToUUID(serviceType);
      v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      serviceUUID = self->_serviceUUID;
      self->_serviceUUID = v11;

      if (self->_serviceUUID
        || (SFServiceIdentifierToUUID(v8, (int *)&v38),
            v13 = (NSUUID *)objc_claimAutoreleasedReturnValue(),
            v14 = self->_serviceUUID,
            self->_serviceUUID = v13,
            v14,
            self->_serviceUUID))
      {
LABEL_39:
        if (!self->_requestQueue)
        {
          v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          requestQueue = self->_requestQueue;
          self->_requestQueue = v15;

        }
        if (!self->_identifier)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v17 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          identifier = self->_identifier;
          self->_identifier = v17;

        }
        if (!self->_peer)
        {
          -[SFDevice identifier](self->_peerDevice, "identifier");
          v19 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          peer = self->_peer;
          self->_peer = v19;

        }
        -[SFSession _ensureXPCStarted](self, "_ensureXPCStarted", v33, v34);
        -[SFSession _fetchInfo](self, "_fetchInfo");
        v21 = _Block_copy(v5);
        activateCompletion = self->_activateCompletion;
        self->_activateCompletion = v21;

        self->_activateInProgress = 1;
        v23 = MEMORY[0x1E0C809B0];
        xpcCnx = self->_xpcCnx;
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __37__SFSession__activateWithCompletion___block_invoke;
        v36[3] = &unk_1E482EE00;
        v36[4] = self;
        v37 = v5;
        -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v36);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v35[0] = v23;
        v35[1] = 3221225472;
        v35[2] = __37__SFSession__activateWithCompletion___block_invoke_2;
        v35[3] = &unk_1E482DFF0;
        v35[4] = self;
        objc_msgSend(v25, "sessionActivate:completion:", self, v35);

        v38 = 0;
        goto LABEL_19;
      }
      v26 = 4294960588;
    }
    else
    {
      v26 = 4294960551;
    }
  }
  v38 = v26;
  v27 = self->_ucatCore->var0;
  if (v27 <= 60)
  {
    if (v27 != -1)
    {
LABEL_25:
      v33 = v26;
      LogPrintF();
      goto LABEL_27;
    }
    if (_LogCategory_Initialize())
    {
      v26 = v38;
      goto LABEL_25;
    }
  }
LABEL_27:
  if (v5)
  {
    v28 = (int)v38;
    if (v38)
    {
      v29 = (void *)MEMORY[0x1E0CB35C8];
      v40 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v30 = objc_claimAutoreleasedReturnValue();
      p_sessionID = (unsigned int *)v30;
      v31 = CFSTR("?");
      if (v30)
        v31 = (const __CFString *)v30;
      v41[0] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1, v33, v34);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], v28, v3);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
    }
    (*((void (**)(id, void *))v5 + 2))(v5, v32);
    if ((_DWORD)v28)
    {

    }
  }
LABEL_19:

  os_activity_scope_leave(&state);
}

void __37__SFSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 177) = 0;
  v8 = v3;
  if (v3)
  {
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v8);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 184);
  *(_QWORD *)(v6 + 184) = 0;

}

uint64_t __37__SFSession__activateWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 177) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_activatedIfReady:", a2);
}

- (void)_activatedIfReady:(id)a3
{
  void (**activateCompletion)(id, id);
  id v5;
  int var0;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    if (self->_activateInProgress || !self->_appleIDContactCompleted)
      goto LABEL_9;
    -[SFSession _activated](self, "_activated");
  }
  activateCompletion = (void (**)(id, id))self->_activateCompletion;
  if (activateCompletion)
  {
    activateCompletion[2](activateCompletion, v7);
    v5 = self->_activateCompletion;
  }
  else
  {
    v5 = 0;
  }
  self->_activateCompletion = 0;

LABEL_9:
}

- (void)_activated
{
  int var0;
  OS_os_transaction *v4;
  OS_os_transaction *transaction;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *DataMutable;
  int v11;
  int v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v15;
  const char *v16;
  _QWORD handler[5];
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (!self->_invalidateCalled)
  {
    self->_activateCompleted = 1;
    var0 = self->_ucatCore->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v16 = SFNearbyBLEServiceTypeToString_0(self->_serviceType);
      LogPrintF();
    }
    if (self->_serviceType)
    {
      -[SFSession _setupMessageSession](self, "_setupMessageSession");
      if (self->_touchRemoteEnabled)
        -[SFSession _setupTouchRemote](self, "_setupTouchRemote");
      -[SFSession _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded", v16);
      if (!self->_transaction)
      {
        v4 = (OS_os_transaction *)os_transaction_create();
        transaction = self->_transaction;
        self->_transaction = v4;

        if (!self->_transaction)
        {
          v6 = self->_ucatCore->var0;
          if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
            LogPrintF();
        }
      }
      v18[0] = CFSTR("sid");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_sessionID);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = CFSTR("shv");
      v19[0] = v7;
      v19[1] = CFSTR("1945.10.6");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = self->_ucatCore->var0;
      if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      DataMutable = (void *)OPACKEncoderCreateDataMutable();
      if (DataMutable)
      {
        -[SFSession sendFrameType:data:](self, "sendFrameType:data:", 23, DataMutable);
      }
      else
      {
        v11 = self->_ucatCore->var0;
        if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }
      if (!self->_heartbeatTimer)
      {
        RandomBytes();
        v12 = self->_ucatCore->var0;
        if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        self->_heartbeatLastTicks = mach_absolute_time();
        v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        heartbeatTimer = self->_heartbeatTimer;
        self->_heartbeatTimer = v13;

        v15 = self->_heartbeatTimer;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __23__SFSession__activated__block_invoke;
        handler[3] = &unk_1E482DF78;
        handler[4] = self;
        dispatch_source_set_event_handler(v15, handler);
        SFDispatchTimerSet(self->_heartbeatTimer, 3.0, 3.0, -4.0);
        dispatch_resume((dispatch_object_t)self->_heartbeatTimer);
      }

    }
  }
}

uint64_t __23__SFSession__activated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_hearbeatTimer");
}

- (void)_ensureXPCStarted
{
  NSXPCListenerEndpoint *testListenerEndpoint;
  id v4;
  NSXPCConnection *v5;
  NSXPCConnection *xpcCnx;
  void *v7;
  uint64_t v8;
  void *v9;
  int var0;
  _QWORD v11[5];
  _QWORD v12[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    testListenerEndpoint = self->_testListenerEndpoint;
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    if (testListenerEndpoint)
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithListenerEndpoint:", self->_testListenerEndpoint);
    else
      v5 = (NSXPCConnection *)objc_msgSend(v4, "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v5;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__SFSession__ensureXPCStarted__block_invoke;
    v12[3] = &unk_1E482DF78;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __30__SFSession__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_1E482DF78;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DC1C8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    var0 = self->_ucatCore->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

uint64_t __30__SFSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __30__SFSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_fetchInfo
{
  int var0;
  SFAppleIDClient *v4;
  SFAppleIDClient *v5;
  _QWORD v6[5];
  SFAppleIDClient *v7;

  if ((self->_sessionFlags & 4) != 0)
  {
    if (!self->_appleIDContactInfo)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v4 = objc_alloc_init(SFAppleIDClient);
      -[SFAppleIDClient setDispatchQueue:](v4, "setDispatchQueue:", self->_dispatchQueue);
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __23__SFSession__fetchInfo__block_invoke;
      v6[3] = &unk_1E4834060;
      v6[4] = self;
      v7 = v4;
      v5 = v4;
      -[SFAppleIDClient myAccountWithCompletion:](v5, "myAccountWithCompletion:", v6);

    }
  }
  else
  {
    self->_appleIDContactCompleted = 1;
  }
}

void __23__SFSession__fetchInfo__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 200) = 1;
  v7 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
  if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (v6)
  {
    v17 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v17 > 60 || v17 == -1 && !_LogCategory_Initialize())
      goto LABEL_8;
    v20 = v6;
  }
  else if (v5)
  {
    objc_msgSend(v5, "contactInfo");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 192);
    *(_QWORD *)(v9 + 192) = v8;

    v11 = *(_QWORD *)(a1 + 32);
    if (*(_QWORD *)(v11 + 192))
      goto LABEL_8;
    v19 = **(_DWORD **)(v11 + 160);
    if (v19 > 60 || v19 == -1 && !_LogCategory_Initialize())
      goto LABEL_8;
  }
  else
  {
    v18 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v18 > 60 || v18 == -1 && !_LogCategory_Initialize())
      goto LABEL_8;
  }
  LogPrintF();
LABEL_8:
  objc_msgSend(*(id *)(a1 + 40), "invalidate", v20);
  objc_msgSend(*(id *)(a1 + 32), "_activatedIfReady:", 0);
  v21[0] = CFSTR("errDomain");
  objc_msgSend(v6, "domain");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E483B8E8;
  v21[1] = CFSTR("errCode");
  v22[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "code"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SFMetricsLog(CFSTR("com.apple.sharing.sessionFetchInfo"), v16);

}

- (void)_hearbeatTimer
{
  double v3;
  double v4;
  int v5;
  int var0;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  unsigned int *p_heartbeatID;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  if (self->_heartbeatTimer)
  {
    mach_absolute_time();
    UpTicksToSecondsF();
    v4 = v3;
    if (v3 >= 300.0)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v17 = v4;
        LogPrintF();
      }
      self->_heartbeatWaiting = 0;
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2F90];
      v22 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("?");
      if (v10)
        v12 = (const __CFString *)v10;
      v23[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1, *(_QWORD *)&v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, -71160, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFSession sessionError:](self, "sessionError:", v14);

    }
    else if (self->_heartbeatWaiting)
    {
      v5 = self->_ucatCore->var0;
      if (v5 <= 30 && (v5 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else if (self->_activateCompleted)
    {
      v7 = self->_ucatCore->var0;
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
      {
        v19 = 4;
        v20 = 4;
        p_heartbeatID = &self->_heartbeatID;
        v17 = v4;
        LogPrintF();
      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &self->_heartbeatID, 4, *(_QWORD *)&v17, p_heartbeatID, v19, v20);
      v15 = objc_claimAutoreleasedReturnValue();
      ++self->_heartbeatID;
      self->_heartbeatWaiting = 1;
      if (self->_heartbeatV2)
        v16 = 21;
      else
        v16 = 20;
      v21 = (id)v15;
      -[SFSession sendFrameType:data:](self, "sendFrameType:data:", v16);

    }
  }
}

- (void)_interrupted
{
  int var0;
  void (**interruptionHandler)(void);
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSXPCConnection *xpcCnx;
  void *v9;
  _QWORD v10[5];
  _QWORD v11[5];
  os_activity_scope_state_s state;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucatCore->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  *(_WORD *)&self->_activateInProgress = 0;
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
  if (self->_activateCalled)
  {
    v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionActivate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    v6 = self->_ucatCore->var0;
    if (v6 <= 50 && (v6 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[SFSession _ensureXPCStarted](self, "_ensureXPCStarted");
    self->_activateInProgress = 1;
    v7 = MEMORY[0x1E0C809B0];
    xpcCnx = self->_xpcCnx;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __25__SFSession__interrupted__block_invoke;
    v11[3] = &unk_1E482DFF0;
    v11[4] = self;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __25__SFSession__interrupted__block_invoke_2;
    v10[3] = &unk_1E482DFF0;
    v10[4] = self;
    objc_msgSend(v9, "sessionActivate:completion:", self, v10);

    os_activity_scope_leave(&state);
  }
}

void __25__SFSession__interrupted__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  id v6;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 177) = 0;
  if (v3)
  {
    v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v4 <= 60)
    {
      v6 = v3;
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = v6, v5))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }

}

void __25__SFSession__interrupted__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _DWORD **v4;
  int v5;
  int v6;
  id v7;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 177) = 0;
  v4 = *(_DWORD ***)(a1 + 32);
  if (!v3)
  {
    v7 = 0;
    objc_msgSend(v4, "_activated");
    goto LABEL_6;
  }
  v5 = *v4[20];
  if (v5 <= 60)
  {
    v7 = v3;
    if (v5 != -1 || (v6 = _LogCategory_Initialize(), v3 = v7, v6))
    {
      LogPrintF();
LABEL_6:
      v3 = v7;
    }
  }

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __23__SFSession_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __23__SFSession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 201))
  {
    *(_BYTE *)(v1 + 201) = 1;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = **(_DWORD **)(v3 + 160);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(a1 + 32), v5))
      {
        LogPrintF();
        v3 = *(_QWORD *)(a1 + 32);
      }
    }
    v6 = *(void **)(v3 + 96);
    if (v6)
    {
      v7 = v6;
      dispatch_source_cancel(v7);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 96);
      *(_QWORD *)(v8 + 96) = 0;

    }
    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 304);
    if (v10)
    {
      v11 = v10;
      dispatch_source_cancel(v11);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 304);
      *(_QWORD *)(v12 + 304) = 0;

    }
    v14 = *(void **)(*(_QWORD *)(a1 + 32) + 312);
    if (v14)
    {
      objc_msgSend(v14, "invalidate");
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 312);
      *(_QWORD *)(v15 + 312) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidated");
    }
  }
}

- (void)_invalidated
{
  int var0;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  NSMutableDictionary *requestQueue;
  NSMutableDictionary *requestHandlers;
  NSMutableDictionary *requestMap;
  NSMutableDictionary *v24;
  void (**invalidationHandler)(void);
  int v26;
  NSMutableDictionary *obj;
  uint64_t v28;
  _QWORD v29[5];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  const __CFString *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
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
    -[SFSession _tearDownMessageSession](self, "_tearDownMessageSession");
    -[SFSession _tearDownTouchRemote](self, "_tearDownTouchRemote");
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = self->_requestQueue;
    v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v31;
      v28 = *MEMORY[0x1E0CB2F90];
      v10 = *MEMORY[0x1E0CB2D50];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v31 != v9)
            objc_enumerationMutation(obj);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_requestQueue, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "responseHandler");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "responseHandler");
            v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0CB35C8];
            v34 = v10;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
            v16 = objc_claimAutoreleasedReturnValue();
            v17 = (void *)v16;
            v18 = CFSTR("?");
            if (v16)
              v18 = (const __CFString *)v16;
            v35 = v18;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "errorWithDomain:code:userInfo:", v28, -6723, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            ((void (**)(_QWORD, void *, _QWORD))v14)[2](v14, v20, 0);

          }
          objc_msgSend(v12, "invalidate");

        }
        v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v8);
    }

    -[NSMutableDictionary removeAllObjects](self->_requestQueue, "removeAllObjects");
    requestQueue = self->_requestQueue;
    self->_requestQueue = 0;

    if (self->_pairSetupSession && !self->_pairSetupEnded)
      -[SFSession _pairSetupCompleted:](self, "_pairSetupCompleted:", 4294960573);
    if (self->_pairVerifySession && !self->_pairVerifyEnded)
      -[SFSession _pairVerifyCompleted:](self, "_pairVerifyCompleted:", 4294960573);
    -[NSMutableDictionary removeAllObjects](self->_requestHandlers, "removeAllObjects");
    requestHandlers = self->_requestHandlers;
    self->_requestHandlers = 0;

    requestMap = self->_requestMap;
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __25__SFSession__invalidated__block_invoke;
    v29[3] = &unk_1E4834088;
    v29[4] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requestMap, "enumerateKeysAndObjectsUsingBlock:", v29);
    -[NSMutableDictionary removeAllObjects](self->_requestMap, "removeAllObjects");
    v24 = self->_requestMap;
    self->_requestMap = 0;

    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    -[SFSession _cleanup](self, "_cleanup");
    self->_invalidateDone = 1;
    v26 = self->_ucatCore->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

void __25__SFSession__invalidated__block_invoke(uint64_t a1, void *a2, void *a3)
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

- (void)_setupMessageSession
{
  int var0;
  CUMessageSessionServer *v4;
  CUMessageSessionServer *messageSessionServer;
  uint64_t v6;
  CUMessageSession *v7;
  CUMessageSession *messageSessionTemplate;
  int v9;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  if (!self->_messageSessionServer)
  {
    var0 = self->_ucatCore->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = (CUMessageSessionServer *)objc_alloc_init(MEMORY[0x1E0D1B3A0]);
    messageSessionServer = self->_messageSessionServer;
    self->_messageSessionServer = v4;

    -[CUMessageSessionServer setDispatchQueue:](self->_messageSessionServer, "setDispatchQueue:", self->_dispatchQueue);
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__SFSession__setupMessageSession__block_invoke;
    v12[3] = &unk_1E4834100;
    v12[4] = self;
    -[CUMessageSessionServer setRegisterRequestHandler:](self->_messageSessionServer, "setRegisterRequestHandler:", v12);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __33__SFSession__setupMessageSession__block_invoke_4;
    v11[3] = &unk_1E4834128;
    v11[4] = self;
    -[CUMessageSessionServer setDeregisterRequestHandler:](self->_messageSessionServer, "setDeregisterRequestHandler:", v11);
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __33__SFSession__setupMessageSession__block_invoke_5;
    v10[3] = &unk_1E4834178;
    v10[4] = self;
    -[CUMessageSessionServer setSendRequestHandler:](self->_messageSessionServer, "setSendRequestHandler:", v10);
    -[CUMessageSessionServer activate](self->_messageSessionServer, "activate");
    -[CUMessageSessionServer templateSession](self->_messageSessionServer, "templateSession");
    v7 = (CUMessageSession *)objc_claimAutoreleasedReturnValue();
    messageSessionTemplate = self->_messageSessionTemplate;
    self->_messageSessionTemplate = v7;

    if (!self->_messageSessionTemplate)
    {
      v9 = self->_ucatCore->var0;
      if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
}

void __33__SFSession__setupMessageSession__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  _QWORD *v9;
  _QWORD v10[4];
  id v11;

  v7 = a4;
  v8 = v7;
  v9 = *(_QWORD **)(a1 + 32);
  if (v9[27])
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __33__SFSession__setupMessageSession__block_invoke_2;
    v10[3] = &unk_1E48340D8;
    v11 = v7;
    objc_msgSend(v9, "_registerRequestID:options:handler:", a2, a3, v10);

  }
}

void __33__SFSession__setupMessageSession__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _QWORD *);
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  v8 = *(_QWORD *)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __33__SFSession__setupMessageSession__block_invoke_3;
  v11[3] = &unk_1E48340B0;
  v12 = v7;
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v8 + 16);
  v10 = v7;
  v9(v8, a2, a3, v11);

}

void __33__SFSession__setupMessageSession__block_invoke_3(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  void (*v11)(uint64_t, _QWORD);
  id v12;

  v5 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v7 = *MEMORY[0x1E0CB2F90];
    v8 = a2;
    v9 = a4;
    v10 = a3;
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", v7, v8, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v5 + 16))(v5);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD))(v5 + 16);
    v10 = a4;
    v12 = a3;
    v11(v5, 0);
  }

}

_QWORD *__33__SFSession__setupMessageSession__block_invoke_4(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[27])
    return (_QWORD *)objc_msgSend(result, "_deregisterRequestID:", a2);
  return result;
}

void __33__SFSession__setupMessageSession__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[4];
  id v13;

  v9 = a5;
  v10 = v9;
  v11 = *(_QWORD **)(a1 + 32);
  if (v11[27])
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__SFSession__setupMessageSession__block_invoke_6;
    v12[3] = &unk_1E4834150;
    v13 = v9;
    objc_msgSend(v11, "_sendRequestID:options:request:responseHandler:", a2, a3, a4, v12);

  }
}

void __33__SFSession__setupMessageSession__block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a4;
  v8 = a3;
  v7 = NSErrorToOSStatus();
  (*(void (**)(uint64_t, uint64_t, id, id))(v5 + 16))(v5, v7, v8, v6);

}

- (void)_tearDownMessageSession
{
  CUMessageSession *messageSessionTemplate;
  CUMessageSessionServer *messageSessionServer;

  -[CUMessageSession invalidate](self->_messageSessionTemplate, "invalidate");
  messageSessionTemplate = self->_messageSessionTemplate;
  self->_messageSessionTemplate = 0;

  -[CUMessageSessionServer invalidate](self->_messageSessionServer, "invalidate");
  messageSessionServer = self->_messageSessionServer;
  self->_messageSessionServer = 0;

}

- (void)_setupTouchRemote
{
  int var0;
  SFTRSession *v4;
  SFTRSession *sfTRSession;
  TRSession *v6;
  TRSession *trSession;

  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v4 = objc_alloc_init(SFTRSession);
  sfTRSession = self->_sfTRSession;
  self->_sfTRSession = v4;

  -[SFTRSession setDispatchQueue:](self->_sfTRSession, "setDispatchQueue:", self->_dispatchQueue);
  -[SFTRSession setSession:](self->_sfTRSession, "setSession:", self);
  -[SFTRSession activate](self->_sfTRSession, "activate");
  -[SFTRSession trSession](self->_sfTRSession, "trSession");
  v6 = (TRSession *)objc_claimAutoreleasedReturnValue();
  trSession = self->_trSession;
  self->_trSession = v6;

}

- (void)_tearDownTouchRemote
{
  TRSession *trSession;
  SFTRSession *sfTRSession;

  trSession = self->_trSession;
  self->_trSession = 0;

  -[SFTRSession invalidate](self->_sfTRSession, "invalidate");
  sfTRSession = self->_sfTRSession;
  self->_sfTRSession = 0;

}

- (void)_startTimeoutIfNeeded
{
  int var0;
  OS_dispatch_source *v4;
  OS_dispatch_source *timeoutTimer;
  NSObject *v6;
  _QWORD handler[5];

  if (self->_timeout > 0.0 && self->_bluetoothState == 3 && !self->_timeoutFired && !self->_timeoutTimer)
  {
    var0 = self->_ucatCore->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    timeoutTimer = self->_timeoutTimer;
    self->_timeoutTimer = v4;

    v6 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __34__SFSession__startTimeoutIfNeeded__block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v6, handler);
    SFDispatchTimerSet(self->_timeoutTimer, self->_timeout, 1.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

uint64_t __34__SFSession__startTimeoutIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutTimerFired");
}

- (void)_timeoutTimerFired
{
  int var0;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  void (**timeoutHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucatCore->var0;
  if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    timeoutHandler = (void (**)(void))self->_timeoutHandler;
  }
  self->_timeoutHandler = 0;

}

- (BOOL)pairingContainsACL:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  uint64_t v6;
  CUPairingSession *pairSetupSession;
  void *v8;
  void *v9;
  uint64_t Int64;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (self->_pairVerifySession)
  {
    PairingSessionCopyPairedPeer();
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    pairSetupSession = self->_pairSetupSession;
    if (!pairSetupSession)
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[CUPairingSession pairedPeer](pairSetupSession, "pairedPeer");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v6;
LABEL_6:
  objc_msgSend(v8, "acl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
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
  if (pairSetupSession)
  {
    if (!-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "IdentifierKeyInfo", 17, v7, v8, a4, objc_msgSend(objc_retainAutorelease(v9), "mutableBytes")))
    {
LABEL_3:
      v12 = v10;
      goto LABEL_4;
    }
  }
  else if (self->_pairVerifySession)
  {
    objc_msgSend(objc_retainAutorelease(v9), "mutableBytes");
    if (!PairingSessionDeriveKey())
      goto LABEL_3;
  }
  var0 = self->_ucatCore->var0;
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v12 = 0;
LABEL_4:

  return v12;
}

- (void)_serviceInitiatedPairSetup:(id)a3
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
  v7[2] = __40__SFSession__serviceInitiatedPairSetup___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __40__SFSession__serviceInitiatedPairSetup___block_invoke(uint64_t a1)
{
  void *v2;
  char Int64Ranged;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v2 = _Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 472));
  if (v2)
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 256) = CFDictionaryGetInt64Ranged();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned int *)(v4 + 140);
    if ((v5 & 0x800) != 0)
      v6 = 20;
    else
      v6 = Int64Ranged & 0x18 | 4u;
    v7 = **(_DWORD **)(v4 + 160);
    if (v7 > 30)
      goto LABEL_9;
    if (v7 == -1)
    {
      v8 = _LogCategory_Initialize();
      v4 = *(_QWORD *)(a1 + 32);
      if (!v8)
        goto LABEL_9;
      v5 = *(unsigned int *)(v4 + 140);
    }
    v13 = v6;
    v14 = &unk_1A2AF9109;
    v11 = v5;
    v12 = &unk_1A2AF9034;
    v10 = *(unsigned int *)(v4 + 256);
    LogPrintF();
    v4 = *(_QWORD *)(a1 + 32);
LABEL_9:
    objc_msgSend((id)v4, "_pairSetupWithFlags:completion:isServer:", v6, v2, 1, v10, v11, v12, v13, v14);
    objc_msgSend(*(id *)(a1 + 32), "_pairSetup:start:", *(_QWORD *)(a1 + 40), 1);
    goto LABEL_14;
  }
  v9 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
  if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_14:

}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4
{
  -[SFSession _pairSetupWithFlags:completion:isServer:](self, "_pairSetupWithFlags:completion:isServer:", *(_QWORD *)&a3, a4, 0);
}

- (void)pairSetupWithFlags:(unsigned int)a3 completion:(id)a4 isServer:(BOOL)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  _QWORD block[5];
  id v12;
  unsigned int v13;
  BOOL v14;

  v8 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__SFSession_pairSetupWithFlags_completion_isServer___block_invoke;
  block[3] = &unk_1E48341A0;
  v13 = a3;
  block[4] = self;
  v12 = v8;
  v14 = a5;
  v10 = v8;
  dispatch_async(dispatchQueue, block);

}

uint64_t __52__SFSession_pairSetupWithFlags_completion_isServer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupWithFlags:completion:isServer:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 52));
}

- (void)_pairSetupWithFlags:(unsigned int)a3 completion:(id)a4 isServer:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  int var0;
  void (**pairSetupCompletion)(id, void *);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  CUPairingSession *pairSetupSession;
  CUPairingSession *v19;
  CUPairingSession *v20;
  void *v21;
  uint64_t v22;
  NSString *v23;
  uint64_t v24;
  NSString *forcedPasscode;
  int v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t pairSetupXID;
  _QWORD v31[5];
  _QWORD v32[5];
  unsigned int v33;
  uint64_t v34;
  _QWORD v35[2];

  v5 = a5;
  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if (!v5)
    RandomBytes();
  var0 = self->_ucatCore->var0;
  if (self->_pairSetupCompletion)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      pairSetupXID = self->_pairSetupXID;
      LogPrintF();
    }
    pairSetupCompletion = (void (**)(id, void *))self->_pairSetupCompletion;
    if ((a3 & 0x80000) == 0)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2F90];
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("?");
      if (v13)
        v15 = (const __CFString *)v13;
      v35[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1, pairSetupXID);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, -6723, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      pairSetupCompletion[2](pairSetupCompletion, v17);

      pairSetupCompletion = (void (**)(id, void *))self->_pairSetupCompletion;
    }
    self->_pairSetupCompletion = 0;

  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    pairSetupXID = self->_pairSetupXID;
    LogPrintF();
  }
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", 0, pairSetupXID);
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", 0);
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate");
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  self->_pairSetupEnded = 0;
  self->_pairSetupFlags = a3 | 4;
  v19 = (CUPairingSession *)objc_alloc_init(MEMORY[0x1E0D1B400]);
  v20 = self->_pairSetupSession;
  self->_pairSetupSession = v19;

  -[CUPairingSession setDispatchQueue:](self->_pairSetupSession, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", self->_ucatCrypto->var4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CUPairingSession setLabel:](self->_pairSetupSession, "setLabel:", v21);

  -[CUPairingSession setFlags:](self->_pairSetupSession, "setFlags:", self->_pairSetupFlags);
  if (v5)
    v22 = 2;
  else
    v22 = 1;
  -[CUPairingSession setSessionType:](self->_pairSetupSession, "setSessionType:", v22);
  if (self->_promptForPINHandler)
    -[CUPairingSession setPromptForPINHandler:](self->_pairSetupSession, "setPromptForPINHandler:");
  if (self->_showPINHandlerEx)
    -[CUPairingSession setShowPINHandlerEx:](self->_pairSetupSession, "setShowPINHandlerEx:");
  if (self->_hidePINHandler)
    -[CUPairingSession setHidePINHandler:](self->_pairSetupSession, "setHidePINHandler:");
  if (self->_pairSetupACL)
    -[CUPairingSession setAcl:](self->_pairSetupSession, "setAcl:");
  v23 = self->_fixedPIN;
  if (!-[NSString length](v23, "length") && IsAppleInternalBuild())
  {
    CFStringGetTypeID();
    v24 = CFPrefs_CopyTypedValue();

    v23 = (NSString *)v24;
  }
  if (-[NSString length](v23, "length"))
    -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", v23);
  forcedPasscode = self->_forcedPasscode;
  if (forcedPasscode
    && self->_isCLIMode
    && -[NSString length](forcedPasscode, "length")
    && IsAppleInternalBuild())
  {
    v26 = self->_ucatCore->var0;
    if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    -[CUPairingSession setFixedPIN:](self->_pairSetupSession, "setFixedPIN:", self->_forcedPasscode);
  }
  v27 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke;
  v32[3] = &unk_1E4833CA8;
  v32[4] = self;
  v33 = a3;
  -[CUPairingSession setSendDataHandler:](self->_pairSetupSession, "setSendDataHandler:", v32);
  v31[0] = v27;
  v31[1] = 3221225472;
  v31[2] = __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke_2;
  v31[3] = &unk_1E482DFF0;
  v31[4] = self;
  -[CUPairingSession setCompletionHandler:](self->_pairSetupSession, "setCompletionHandler:", v31);
  v28 = _Block_copy(v8);
  v29 = self->_pairSetupCompletion;
  self->_pairSetupCompletion = v28;

  -[SFSession _pairSetup:start:](self, "_pairSetup:start:", 0, 1);
}

void __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12[0] = CFSTR("pd");
  v12[1] = CFSTR("pxid");
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 256));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a2 & 1) != 0)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("pf"));

    v11 = objc_msgSend(v9, "copy");
    v8 = 16;
    v7 = (void *)v11;
  }
  else
  {
    v8 = 17;
  }
  objc_msgSend(*(id *)(a1 + 32), "sendFrameType:object:", v8, v7);

}

uint64_t __53__SFSession__pairSetupWithFlags_completion_isServer___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupCompleted:", NSErrorToOSStatus());
}

- (void)_pairSetup:(id)a3 start:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int var0;
  uint64_t Int64Ranged;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  uint64_t pairSetupXID;
  int v15;

  v4 = a4;
  v6 = a3;
  v15 = 0;
  if (!self->_pairSetupSession)
  {
    v10 = 0;
LABEL_32:
    -[SFSession _pairSetupCompleted:](self, "_pairSetupCompleted:", pairSetupXID);
    goto LABEL_33;
  }
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    pairSetupXID = self->_pairSetupXID;
    LogPrintF();
  }
  if (v4)
    -[CUPairingSession activate](self->_pairSetupSession, "activate");
  if (!v6)
    goto LABEL_30;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  v15 = Int64Ranged;
  if ((_DWORD)Int64Ranged)
  {
    v12 = self->_ucatCore->var0;
    if (v12 > 60 || v12 == -1 && !_LogCategory_Initialize())
      goto LABEL_30;
    pairSetupXID = Int64Ranged;
    goto LABEL_25;
  }
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v13 = self->_ucatCore->var0;
    if (v13 > 60 || v13 == -1 && !_LogCategory_Initialize())
      goto LABEL_30;
    pairSetupXID = 0;
LABEL_25:
    LogPrintF();
LABEL_30:
    v10 = 0;
    goto LABEL_31;
  }
  v10 = (void *)v9;
  if (self->_pairSetupXID != CFDictionaryGetInt64Ranged())
  {
    v11 = self->_ucatCore->var0;
    if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_33;
  }
  -[CUPairingSession receivedData:](self->_pairSetupSession, "receivedData:", v10, pairSetupXID);
LABEL_31:
  if (v15)
    goto LABEL_32;
LABEL_33:

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
  v7[2] = __29__SFSession_pairSetupTryPIN___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __29__SFSession_pairSetupTryPIN___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairSetupTryPIN:", *(_QWORD *)(a1 + 40));
}

- (void)_pairSetupTryPIN:(id)a3
{
  __CFString *v4;
  int var0;
  int v6;
  const __CFString *v7;
  int v8;
  CUPairingSession *pairSetupSession;
  int v10;
  uint64_t v11;
  __CFString *v12;

  v4 = (__CFString *)a3;
  var0 = self->_ucatCore->var0;
  v12 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v8 = _LogCategory_Initialize(), v4 = v12, v8))
    {
      v6 = IsAppleInternalBuild();
      v7 = CFSTR("*");
      if (v6)
        v7 = v12;
      v11 = (uint64_t)v7;
      LogPrintF();
      v4 = v12;
    }
  }
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    -[CUPairingSession tryPIN:](pairSetupSession, "tryPIN:", v4);
  }
  else
  {
    v10 = self->_ucatCore->var0;
    if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
    {
      v11 = 4294960551;
      LogPrintF();
    }
    -[SFSession _pairSetupCompleted:](self, "_pairSetupCompleted:", 4294960551, v11);
  }

}

- (void)_pairSetupCompleted:(int)a3
{
  uint64_t v3;
  CUPairingSession *pairSetupSession;
  uint64_t v6;
  int var0;
  void (**v8)(id, _QWORD);
  id *p_pairSetupCompletion;
  void (**pairSetupCompletion)(id, _QWORD);
  id v11;
  int v12;
  CUPairingSession *v13;
  void (**v14)(id, void *);
  void (**v15)(id, void *);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  _OWORD v27[2];
  _OWORD __s[2];
  uint64_t v29;

  v3 = *(_QWORD *)&a3;
  v29 = *MEMORY[0x1E0C80C00];
  memset(__s, 0, sizeof(__s));
  memset(v27, 0, sizeof(v27));
  self->_pairSetupEnded = 1;
  if (!a3)
  {
    pairSetupSession = self->_pairSetupSession;
    if (pairSetupSession)
    {
      v6 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "ReadKeySalt", 11, "ReadKeyInfo", 11, 32, __s);
      if (!(_DWORD)v6)
      {
        v6 = -[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](self->_pairSetupSession, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", "WriteKeySalt", 12, "WriteKeyInfo", 12, 32, v27);
        if (!(_DWORD)v6)
        {
          v6 = -[SFSession setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:](self, "setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:", __s, 32, v27, 32);
          if (!(_DWORD)v6)
          {
            memset_s(__s, 0x20uLL, 0, 0x20uLL);
            memset_s(v27, 0x20uLL, 0, 0x20uLL);
            var0 = self->_ucatCore->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            pairSetupCompletion = (void (**)(id, _QWORD))self->_pairSetupCompletion;
            p_pairSetupCompletion = &self->_pairSetupCompletion;
            v8 = pairSetupCompletion;
            if (pairSetupCompletion)
            {
              v8[2](v8, 0);
LABEL_12:
              v11 = *p_pairSetupCompletion;
              *p_pairSetupCompletion = 0;

              return;
            }
            return;
          }
        }
      }
      v3 = v6;
    }
    else
    {
      v3 = 4294960534;
    }
  }
  v12 = self->_ucatCore->var0;
  if (v12 <= 60 && (v12 != -1 || _LogCategory_Initialize()))
  {
    v24 = v3;
    LogPrintF();
  }
  -[CUPairingSession invalidate](self->_pairSetupSession, "invalidate", v24);
  v13 = self->_pairSetupSession;
  self->_pairSetupSession = 0;

  v15 = (void (**)(id, void *))self->_pairSetupCompletion;
  p_pairSetupCompletion = &self->_pairSetupCompletion;
  v14 = v15;
  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2F90];
    v18 = (int)v3;
    v25 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    v21 = CFSTR("?");
    if (v19)
      v21 = (const __CFString *)v19;
    v26 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2](v14, v23);

    goto LABEL_12;
  }
}

- (void)pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFSession_pairVerifyWithFlags_completion___block_invoke;
  block[3] = &unk_1E4831C28;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __44__SFSession_pairVerifyWithFlags_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pairVerifyWithFlags:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_pairVerifyWithFlags:(unsigned int)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  int var0;
  unint64_t v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t *v11;
  int v12;
  void (**pairVerifyCompletion)(id, void *);
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  PairingSessionPrivate *pairVerifySession;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  unsigned int sessionFlags;
  int v35;
  NSString *v36;
  NSString *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  void (**v46)(id, void *);
  char v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *))a4;
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v8 = 0x1E0CB3000;
  v9 = (_QWORD *)MEMORY[0x1E0CB2F90];
  v10 = 0x1E0CB3000;
  v11 = (uint64_t *)MEMORY[0x1E0CB2D50];
  if (self->_pairVerifyCompletion)
  {
    v46 = v6;
    v12 = self->_ucatCore->var0;
    if (v12 <= 30 && (v12 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    pairVerifyCompletion = (void (**)(id, void *))self->_pairVerifyCompletion;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = v9;
    v16 = *v9;
    v50 = *v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = CFSTR("?");
    v51[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    v9 = v15;
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v21, -6723, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    pairVerifyCompletion[2](pairVerifyCompletion, v22);

    v8 = 0x1E0CB3000uLL;
    v10 = 0x1E0CB3000uLL;
    v23 = self->_pairVerifyCompletion;
    self->_pairVerifyCompletion = 0;

    v6 = v46;
  }
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    self->_pairVerifySession = 0;
  }
  self->_pairVerifyEnded = 0;
  self->_pairVerifyFlags = a3 | 4;
  v25 = PairingSessionCreate();
  if (v25)
  {
    if (v6)
    {
      v26 = *(void **)(v8 + 1480);
      v27 = *v9;
      v28 = v25;
      v48 = *v11;
      objc_msgSend(*(id *)(v10 + 2368), "stringWithUTF8String:", DebugGetErrorString());
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v29;
      if (v29)
        v31 = (const __CFString *)v29;
      else
        v31 = CFSTR("?");
      v49 = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", v27, v28, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v33);

    }
  }
  else
  {
    sessionFlags = self->_sessionFlags;
    if (sessionFlags & 4 | a3 & 0x1000)
    {
      if ((sessionFlags & 8) != 0)
        v35 = 1052672;
      else
        v35 = 4096;
      self->_pairVerifyFlags |= (sessionFlags << 17) & 0x200000 | v35;
      if (self->_myAppleIDInfoClient)
      {
        PairingSessionSetMyAppleIDInfoClient();
      }
      else if (self->_myAppleID)
      {
        PairingSessionSetMyAppleID();
      }
      if (self->_peerAppleID)
        PairingSessionSetPeerAppleID();
      v36 = self->_peerContactIdentifier;
      v37 = v36;
      if (v36)
      {
        v47 = 0;
        SFNormalizedUserIdentifiersForContactIdentifier(v36, 0, &v47);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v38;
        if (v47)
        {
          v40 = (void *)objc_msgSend(v38, "mutableCopy");
          -[SFAppleIDContactInfo validatedPhoneNumbers](self->_appleIDContactInfo, "validatedPhoneNumbers");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFAppleIDContactInfo validatedEmailAddresses](self->_appleIDContactInfo, "validatedEmailAddresses");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          if (v41)
            objc_msgSend(v40, "addObjectsFromArray:", v41);
          if (v42)
            objc_msgSend(v40, "addObjectsFromArray:", v42);
          v43 = objc_msgSend(v40, "copy");

          v39 = (void *)v43;
        }
        if (objc_msgSend(v39, "count"))
          PairingSessionSetPeerAppleIDs();

      }
    }
    else if ((sessionFlags & 0x440) == 0x40)
    {
      self->_pairVerifyFlags |= 0x400000u;
    }
    if (self->_pairVerifyACL)
      PairingSessionSetACL();
    PairingSessionSetFlags();
    PairingSessionSetLogging();
    v44 = _Block_copy(v6);
    v45 = self->_pairVerifyCompletion;
    self->_pairVerifyCompletion = v44;

    -[SFSession _pairVerify:start:](self, "_pairVerify:start:", 0, 1);
  }

}

- (void)_pairVerify:(id)a3 start:(BOOL)a4
{
  id v5;
  int var0;
  uint64_t Int64Ranged;
  void *v8;
  int v9;
  id v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!self->_pairVerifySession)
  {
    v10 = 0;
    goto LABEL_15;
  }
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (v5)
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    v13 = Int64Ranged;
    if ((_DWORD)Int64Ranged)
    {
      v11 = self->_ucatCore->var0;
      if (v11 > 60 || v11 == -1 && !_LogCategory_Initialize())
        goto LABEL_26;
      v12 = Int64Ranged;
      goto LABEL_21;
    }
    CFDataGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v9 = self->_ucatCore->var0;
      if (v9 > 60 || v9 == -1 && !_LogCategory_Initialize())
        goto LABEL_26;
      v12 = 0;
LABEL_21:
      LogPrintF();
LABEL_26:
      v10 = 0;
      goto LABEL_14;
    }
  }
  else
  {
    v8 = 0;
  }
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v13 = PairingSessionExchange();
  if (!v13)
  {
LABEL_15:
    -[SFSession _pairVerifyCompleted:](self, "_pairVerifyCompleted:", v12);
    goto LABEL_16;
  }
LABEL_14:
  if (v13)
    goto LABEL_15;
LABEL_16:

}

- (void)_pairVerifyCompleted:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  int var0;
  int v7;
  void (**pairVerifyCompletion)(id, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  int v18;
  PairingSessionPrivate *pairVerifySession;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  _OWORD v23[2];
  _OWORD __s[2];
  uint64_t v25;

  v3 = *(_QWORD *)&a3;
  v25 = *MEMORY[0x1E0C80C00];
  memset(__s, 0, sizeof(__s));
  memset(v23, 0, sizeof(v23));
  self->_pairVerifyEnded = 1;
  if (!a3)
  {
    if (self->_pairVerifySession)
    {
      v5 = PairingSessionDeriveKey();
      if (!(_DWORD)v5)
      {
        v5 = PairingSessionDeriveKey();
        if (!(_DWORD)v5)
        {
          v5 = -[SFSession setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:](self, "setEncryptionReadKey:readKeyLen:writeKey:writeKeyLen:", __s, 32, v23, 32);
          if (!(_DWORD)v5)
          {
            memset_s(__s, 0x20uLL, 0, 0x20uLL);
            memset_s(v23, 0x20uLL, 0, 0x20uLL);
            var0 = self->_ucatCore->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            LODWORD(v3) = 0;
            v7 = 1;
            goto LABEL_11;
          }
        }
      }
      v3 = v5;
    }
    else
    {
      v3 = 4294960534;
    }
  }
  v18 = self->_ucatCore->var0;
  if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
  {
    v20 = v3;
    LogPrintF();
  }
  pairVerifySession = self->_pairVerifySession;
  if (pairVerifySession)
  {
    CFRelease(pairVerifySession);
    v7 = 0;
    self->_pairVerifySession = 0;
  }
  else
  {
    v7 = 0;
  }
LABEL_11:
  pairVerifyCompletion = (void (**)(id, _QWORD))self->_pairVerifyCompletion;
  if (pairVerifyCompletion)
  {
    if (v7)
    {
      pairVerifyCompletion[2](self->_pairVerifyCompletion, 0);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2F90];
      v11 = (int)v3;
      v21 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = CFSTR("?");
      if (v12)
        v14 = (const __CFString *)v12;
      v22 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1, v20);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, v11, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *))pairVerifyCompletion)[2](pairVerifyCompletion, v16);

    }
    v17 = self->_pairVerifyCompletion;
    self->_pairVerifyCompletion = 0;

  }
}

- (void)appleIDAddProof:(id)a3 dispatchQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_queue_create("AppleIDAddProof", 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke;
  v15[3] = &unk_1E482E508;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v12 = 0;
  objc_msgSend(v2, "_appleIDAddProof:error:", v3, &v12);
  v4 = v12;
  if (v4)
  {
    v5 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v5 <= 90 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke_2;
  block[3] = &unk_1E482E0F0;
  v6 = *(NSObject **)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v10 = v4;
  v11 = v7;
  v8 = v4;
  dispatch_async(v6, block);

}

uint64_t __54__SFSession_appleIDAddProof_dispatchQueue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (BOOL)_appleIDAddProof:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  id *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v30 = a3;
  -[SDStatusMonitor myMediumHashes](self->_statusMonitor, "myMediumHashes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    if ((unint64_t)objc_msgSend(v6, "length") <= 8)
    {
      v7 = (void *)objc_msgSend(v6, "mutableCopy");
      objc_msgSend(v7, "setLength:", 9);

      v6 = v7;
    }
    -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("AppleIDChallenge"), 16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D1B318]);
      v33 = 0;
      v10 = (void *)objc_msgSend(v9, "copyMyCertificateDataAndReturnError:", &v33);
      v11 = v33;
      v12 = v11;
      if (v10)
      {
        v32 = v11;
        v13 = (void *)objc_msgSend(v9, "copyMyValidationDataAndReturnError:", &v32);
        v14 = v32;

        if (v13)
        {
          v15 = v9;
          v16 = v6;
          v26 = a4;
          v29 = v8;
          v17 = v8;
          v28 = v10;
          v18 = v10;
          v19 = v13;
          v20 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
          objc_msgSend(v20, "appendData:", v17);
          objc_msgSend(v20, "appendData:", v18);
          objc_msgSend(v20, "appendData:", v19);
          v31 = v14;
          v27 = v15;
          objc_msgSend(v15, "signData:error:", v20, &v31);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v31;

          v22 = v21 != 0;
          if (v21)
          {
            v23 = v30;
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v18, CFSTR("cert"));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v16, CFSTR("medHash"));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v21, CFSTR("sig"));
            objc_msgSend(v30, "setObject:forKeyedSubscript:", v19, CFSTR("vrec"));
          }
          else
          {
            v23 = v30;
            if (v26)
            {
              SFNestedErrorF();
              *v26 = (id)objc_claimAutoreleasedReturnValue();
            }
          }

          v10 = v28;
          v8 = v29;
          v24 = v22;
          v6 = v16;
          v9 = v27;
        }
        else
        {
          if (a4)
          {
            SFNestedErrorF();
            v24 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v24 = 0;
          }
          v12 = v14;
          v23 = v30;
        }

      }
      else
      {
        if (a4)
        {
          SFNestedErrorF();
          v24 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = 0;
        }
        v23 = v30;
      }

    }
    else
    {
      v23 = v30;
      if (a4)
      {
        SFErrorF();
        v24 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v24 = 0;
      }
    }

  }
  else
  {
    if (a4)
    {
      SFErrorF();
      v24 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    v23 = v30;
  }

  return v24;
}

- (void)appleIDVerifyProof:(id)a3 dispatchQueue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = dispatch_queue_create("AppleIDVerifyProof", 0);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke;
  v15[3] = &unk_1E482E508;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  int v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v13 = 0;
  objc_msgSend(v2, "_appleIDVerifyProof:error:", v3, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke_2;
  block[3] = &unk_1E482F1A0;
  v7 = *(NSObject **)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v11 = v5;
  v12 = v8;
  block[4] = v4;
  v9 = v5;
  dispatch_async(v7, block);

}

uint64_t __57__SFSession_appleIDVerifyProof_dispatchQueue_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)_appleIDVerifyProof:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SDStatusMonitor *statusMonitor;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char v20;
  id v21;
  id v22;
  id *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;

  v6 = a3;
  CFDataGetTypeID();
  CFDictionaryGetTypedValue();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (a4)
      goto LABEL_22;
    goto LABEL_37;
  }
  statusMonitor = self->_statusMonitor;
  if (!statusMonitor)
  {
    if (a4)
    {
LABEL_22:
      SFErrorF();
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_37:
    v22 = 0;
    goto LABEL_18;
  }
  -[SDStatusMonitor contactIdentifierForMediumHashes:](statusMonitor, "contactIdentifierForMediumHashes:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v30 = 0;
    SFNormalizedUserIdentifiersForContactIdentifierEx(v9, 0, &v30, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v11;
    if (v11)
    {
      v12 = v11;
      CFDataGetTypeID();
      CFDictionaryGetTypedValue();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        CFDataGetTypeID();
        CFDictionaryGetTypedValue();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          CFDataGetTypeID();
          CFDictionaryGetTypedValue();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            -[SFSession pairingDeriveKeyForIdentifier:keyLength:](self, "pairingDeriveKeyForIdentifier:keyLength:", CFSTR("AppleIDChallenge"), 16);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v24 = a4;
              v25 = v10;
              v26 = v7;
              v16 = v28;
              v17 = v14;
              v18 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
              objc_msgSend(v18, "appendData:", v15);
              objc_msgSend(v18, "appendData:", v16);
              objc_msgSend(v18, "appendData:", v17);
              v19 = objc_alloc_init(MEMORY[0x1E0D1B318]);
              objc_msgSend(v19, "setPeerAppleIDs:", v12);
              objc_msgSend(v19, "setPeerCertificateData:", v16);
              objc_msgSend(v19, "setPeerValidationData:", v17);
              v29 = 0;
              v20 = objc_msgSend(v19, "verifyData:signature:error:", v18, v13, &v29);
              v21 = v29;
              if ((v20 & 1) != 0)
              {
                v22 = v30;
              }
              else if (v24)
              {
                SFNestedErrorF();
                v22 = 0;
                *v24 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v22 = 0;
              }

              v10 = v25;
              v7 = v26;
            }
            else if (a4)
            {
              SFErrorF();
              v22 = 0;
              *a4 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v22 = 0;
            }

          }
          else if (a4)
          {
            SFErrorF();
            v22 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v22 = 0;
          }

        }
        else if (a4)
        {
          SFErrorF();
          v22 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }

      }
      else if (a4)
      {
        SFErrorF();
        v22 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }

    }
    else if (a4)
    {
      SFErrorF();
      v22 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }

  }
  else if (a4)
  {
    SFErrorF();
    v22 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

LABEL_18:
  return v22;
}

- (void)sendEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __23__SFSession_sendEvent___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

}

void __23__SFSession_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s state;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 312))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionSendEvent", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionSendEvent:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&state);
  }
  else
  {
    v5 = **(_DWORD **)(v2 + 160);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__SFSession_sendRequest___block_invoke;
  block[3] = &unk_1E482EBA0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(dispatchQueue, block);

}

void __25__SFSession_sendRequest___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s state;

  v2 = a1[4];
  if (*(_QWORD *)(v2 + 312))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionSendRequest", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    objc_msgSend(*(id *)(a1[4] + 312), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionSendRequest:", a1[5]);

    objc_msgSend(*(id *)(a1[4] + 288), "setObject:forKeyedSubscript:", a1[5], a1[6]);
    os_activity_scope_leave(&state);

  }
  else
  {
    v5 = **(_DWORD **)(v2 + 160);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendResponse:(id)a3
{
  id v4;
  void *v5;
  NSObject *dispatchQueue;
  id v7;
  uint64_t v8;
  _QWORD block[5];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __26__SFSession_sendResponse___block_invoke;
    block[3] = &unk_1E482D3A0;
    block[4] = self;
    v10 = v4;
    v7 = v4;
    dispatch_async(dispatchQueue, block);

  }
  else
  {
    v8 = FatalErrorF();
    __26__SFSession_sendResponse___block_invoke(v8);
  }
}

void __26__SFSession_sendResponse___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s state;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 312))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionSendResponse", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionSendResponse:", *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&state);
  }
  else
  {
    v5 = **(_DWORD **)(v2 + 160);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
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
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__SFSession_sendFrameType_data___block_invoke;
  block[3] = &unk_1E4832528;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __32__SFSession_sendFrameType_data___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  os_activity_scope_state_s v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 312))
  {
    v3 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionSendFrameType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v6.opaque[0] = 0;
    v6.opaque[1] = 0;
    os_activity_scope_enter(v3, &v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 312), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionSendFrameType:data:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

    os_activity_scope_leave(&v6);
  }
  else
  {
    v5 = **(_DWORD **)(v2 + 160);
    if (v5 <= 60 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)sendFrameType:(unsigned __int8)a3 object:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned __int8 v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__SFSession_sendFrameType_object___block_invoke;
  block[3] = &unk_1E4832528;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __34__SFSession_sendFrameType_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendFrameType:object:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_sendFrameType:(unsigned __int8)a3 object:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t DataMutable;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  void *v12;
  void (**sendFrameHandler)(id, _QWORD, void *);
  int v14;
  int var0;
  int v16;
  os_activity_scope_state_s state;
  uint64_t v18;
  int v19;

  v4 = a3;
  v6 = a4;
  v19 = 0;
  DataMutable = OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    var0 = self->_ucatCore->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      SFNearbyBLEFrameTypeToString_0(v4);
      LogPrintF();
    }
    goto LABEL_24;
  }
  v8 = (void *)DataMutable;
  if ((_DWORD)v4 != 29)
    goto LABEL_5;
  v18 = 0;
  NSDataCompress();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = 0;

  if (!v9)
  {
    v16 = self->_ucatCore->var0;
    if (v16 <= 60 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();

LABEL_24:
    v8 = 0;
    goto LABEL_13;
  }

  v8 = (void *)v9;
LABEL_5:
  if (self->_xpcCnx)
  {
    v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionSendFrameType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v11, &state);
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionSendFrameType:data:", v4, v8);

    os_activity_scope_leave(&state);
  }
  else
  {
    sendFrameHandler = (void (**)(id, _QWORD, void *))self->_sendFrameHandler;
    if (sendFrameHandler)
    {
      sendFrameHandler[2](sendFrameHandler, v4, v8);
    }
    else
    {
      v14 = self->_ucatCore->var0;
      if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
LABEL_13:

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
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__SFSession_sendRequestWithFlags_object_responseHandler___block_invoke;
  v13[3] = &unk_1E4831C00;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(dispatchQueue, v13);

}

uint64_t __57__SFSession_sendRequestWithFlags_object_responseHandler___block_invoke(uint64_t a1)
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
  uint64_t v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v6 = *(_QWORD *)&a3;
  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  RandomBytes();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("_xc"));
  if (!self->_requestMap)
  {
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    requestMap = self->_requestMap;
    self->_requestMap = v11;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v6, 0, CFSTR("_fl"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("_rh");
  v18[0] = v13;
  v14 = _Block_copy(v8);

  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestMap, "setObject:forKeyedSubscript:", v15, v10);

  if ((v6 & 1) != 0)
  {
    -[SFSession _sendEncryptedObject:](self, "_sendEncryptedObject:", v9);
  }
  else
  {
    if ((self->_sessionFlags & 2) != 0)
      v16 = 29;
    else
      v16 = 5;
    -[SFSession _sendFrameType:object:](self, "_sendFrameType:object:", v16, v9);
  }

}

- (void)sendWithFlags:(unsigned int)a3 object:(id)a4
{
  char v4;
  id v6;
  NSObject *dispatchQueue;
  uint64_t (*v8)(uint64_t);
  uint64_t *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  if ((v4 & 1) != 0)
  {
    v12 = MEMORY[0x1E0C809B0];
    v8 = __34__SFSession_sendWithFlags_object___block_invoke;
    v9 = &v12;
  }
  else
  {
    v11 = MEMORY[0x1E0C809B0];
    v8 = __34__SFSession_sendWithFlags_object___block_invoke_2;
    v9 = &v11;
  }
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v8;
  v9[3] = (uint64_t)&unk_1E482D3A0;
  v9[4] = (uint64_t)self;
  v10 = v6;
  v9[5] = (uint64_t)v10;
  dispatch_async(dispatchQueue, v9);

}

uint64_t __34__SFSession_sendWithFlags_object___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEncryptedObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __34__SFSession_sendWithFlags_object___block_invoke_2(uint64_t a1)
{
  uint64_t v1;

  if ((*(_DWORD *)(*(_QWORD *)(a1 + 32) + 140) & 2) != 0)
    v1 = 29;
  else
    v1 = 5;
  return objc_msgSend(*(id *)(a1 + 32), "_sendFrameType:object:", v1, *(_QWORD *)(a1 + 40));
}

- (void)_sendEncryptedObject:(id)a3
{
  id v4;
  NSObject *v5;
  id DataMutable;
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
  os_activity_scope_state_s state;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFSession/sessionSendFrameType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  v22[0] = 0;
  v22[1] = 0;
  if (!self->_xpcCnx)
  {
    var0 = self->_ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_38;
LABEL_26:
    LogPrintF();
LABEL_38:
    DataMutable = 0;
    goto LABEL_17;
  }
  if (!self->_encryptionWriteAEAD)
  {
    v17 = self->_ucatCore->var0;
    if (v17 > 60 || v17 == -1 && !_LogCategory_Initialize())
      goto LABEL_38;
    goto LABEL_26;
  }
  DataMutable = (id)OPACKEncoderCreateDataMutable();
  if (!DataMutable)
  {
    v18 = self->_ucatCore->var0;
    if (v18 > 60 || v18 == -1 && !_LogCategory_Initialize())
      goto LABEL_38;
    goto LABEL_26;
  }
  if ((self->_sessionFlags & 2) != 0)
  {
    NSDataCompress();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    if (!v8)
    {
      v20 = self->_ucatCore->var0;
      if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      goto LABEL_16;
    }
    v10 = objc_msgSend(v8, "mutableCopy");

    v7 = 28;
    DataMutable = (id)v10;
  }
  else
  {
    v7 = 6;
  }
  DataMutable = objc_retainAutorelease(DataMutable);
  objc_msgSend(DataMutable, "mutableBytes");
  objc_msgSend(DataMutable, "length");
  encryptionWriteNonce = self->_encryptionWriteNonce;
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
  if (!v12)
  {
    objc_msgSend(DataMutable, "appendBytes:length:", v22, 16, v22, 16);
    -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sessionSendFrameType:data:", v7, DataMutable);
LABEL_16:

    goto LABEL_17;
  }
  v19 = self->_ucatCore->var0;
  if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_17:

  os_activity_scope_leave(&state);
}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (CFDictionaryGetInt64())
  {
    -[SFSession _registerRequestID:options:handler:](self, "_registerRequestID:options:handler:", v8, v9, v10);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__SFSession_registerRequestID_options_handler___block_invoke;
    v12[3] = &unk_1E482E508;
    v12[4] = self;
    v13 = v8;
    v14 = v9;
    v15 = v10;
    dispatch_async(dispatchQueue, v12);

  }
}

uint64_t __47__SFSession_registerRequestID_options_handler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerRequestID:options:handler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  id v10;
  int var0;
  SFMessageSessionRequestEntry *v12;
  NSMutableDictionary *requestHandlers;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;
  id v17;

  v17 = a3;
  v8 = a4;
  dispatchQueue = self->_dispatchQueue;
  v10 = a5;
  dispatch_assert_queue_V2(dispatchQueue);
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v16 = v17;
    LogPrintF();
  }
  v12 = objc_alloc_init(SFMessageSessionRequestEntry);
  -[SFMessageSessionRequestEntry setHandler:](v12, "setHandler:", v10);

  if (v8)
    -[SFMessageSessionRequestEntry setOptions:](v12, "setOptions:", v8);
  -[SFMessageSessionRequestEntry setAllowUnencrypted:](v12, "setAllowUnencrypted:", CFDictionaryGetInt64() != 0, v16);
  requestHandlers = self->_requestHandlers;
  if (!requestHandlers)
  {
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = self->_requestHandlers;
    self->_requestHandlers = v14;

    requestHandlers = self->_requestHandlers;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](requestHandlers, "setObject:forKeyedSubscript:", v12, v17);

}

- (void)deregisterRequestID:(id)a3
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
  v7[2] = __33__SFSession_deregisterRequestID___block_invoke;
  v7[3] = &unk_1E482D3A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __33__SFSession_deregisterRequestID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deregisterRequestID:", *(_QWORD *)(a1 + 40));
}

- (void)_deregisterRequestID:(id)a3
{
  int var0;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucatCore->var0;
  if (var0 <= 30)
  {
    v5 = v7;
    if (var0 == -1)
    {
      if (!_LogCategory_Initialize())
        goto LABEL_5;
      v5 = v7;
    }
    v6 = v5;
    LogPrintF();
  }
LABEL_5:
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_requestHandlers, "setObject:forKeyedSubscript:", 0, v7, v6);

}

- (void)sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *dispatchQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SFSession_sendRequestID_options_request_responseHandler___block_invoke;
  block[3] = &unk_1E4833758;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(dispatchQueue, block);

}

uint64_t __59__SFSession_sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequestID:options:request:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)_sendRequestID:(id)a3 options:(id)a4 request:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int var0;
  _BOOL8 v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _BOOL4 v24;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v19 = v10;
    v20 = objc_msgSend(v12, "count");
    LogPrintF();
  }
  if (self->_encryptionWriteAEAD)
    v15 = 1;
  else
    v15 = CFDictionaryGetInt64() == 0;
  v25[0] = CFSTR("_ri");
  v25[1] = CFSTR("_ro");
  v26[0] = v10;
  v26[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2, v19, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __60__SFSession__sendRequestID_options_request_responseHandler___block_invoke;
  v21[3] = &unk_1E48341C8;
  v21[4] = self;
  v22 = v10;
  v23 = v13;
  v24 = v15;
  v17 = v13;
  v18 = v10;
  -[SFSession _sendRequestWithFlags:object:responseHandler:](self, "_sendRequestWithFlags:object:responseHandler:", v15, v16, v21);

}

void __60__SFSession__sendRequestID_options_request_responseHandler___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  int v9;
  uint64_t Int64Ranged;
  int v11;
  void *v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v9 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v9 <= 60 && (v9 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v7);
  }
  else if ((a2 & 1) == 0 && (*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v14 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    Int64Ranged = CFDictionaryGetInt64Ranged();
    if ((_DWORD)Int64Ranged)
    {
      v11 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
      if (v11 <= 60 && (v11 != -1 || _LogCategory_Initialize()))
      {
        v25 = *(_QWORD *)(a1 + 40);
        v26 = Int64Ranged;
        LogPrintF();
      }
      v15 = *(_QWORD *)(a1 + 48);
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v17 = *MEMORY[0x1E0CB2F90];
      v18 = (int)Int64Ranged;
      v27 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v19 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v19;
      v20 = CFSTR("?");
      if (v19)
        v20 = (const __CFString *)v19;
      v28[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1, v25, v26);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v18, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v15 + 16))(v15, v22, 0, 0);

    }
    else
    {
      CFDictionaryGetTypeID();
      CFDictionaryGetTypedValue();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
      if (v12)
      {
        if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v12, "count");
          LogPrintF();
        }
        (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
      }
      else
      {
        if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        v23 = *(_QWORD *)(a1 + 48);
        NSErrorWithOSStatusF();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v23 + 16))(v23, v24, 0, 0);

      }
    }

  }
}

- (void)sessionBluetoothStateChanged:(int64_t)a3
{
  int var0;
  void (**bluetoothStateChangedHandler)(id, int64_t);

  var0 = self->_ucatCore->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_bluetoothState = a3;
  bluetoothStateChangedHandler = (void (**)(id, int64_t))self->_bluetoothStateChangedHandler;
  if (bluetoothStateChangedHandler)
    bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, a3);
  -[SFSession _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
}

- (void)sessionError:(id)a3
{
  id v4;
  int var0;
  OS_dispatch_source *heartbeatTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  NSMutableDictionary *requestHandlers;
  NSMutableDictionary *requestMap;
  NSMutableDictionary *v15;
  void (**errorHandler)(id, id);
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  var0 = self->_ucatCore->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v17 = v4;
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  heartbeatTimer = self->_heartbeatTimer;
  if (heartbeatTimer)
  {
    v7 = heartbeatTimer;
    dispatch_source_cancel(v7);
    v8 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

  }
  if (self->_pairSetupSession && !self->_pairSetupEnded)
  {
    v9 = NSErrorToOSStatus();
    if (v9)
      v10 = v9;
    else
      v10 = 4294960596;
    -[SFSession _pairSetupCompleted:](self, "_pairSetupCompleted:", v10, v17);
  }
  if (self->_pairVerifySession && !self->_pairVerifyEnded)
  {
    v11 = NSErrorToOSStatus();
    if (v11)
      v12 = v11;
    else
      v12 = 4294960596;
    -[SFSession _pairVerifyCompleted:](self, "_pairVerifyCompleted:", v12, v17);
  }
  -[NSMutableDictionary removeAllObjects](self->_requestHandlers, "removeAllObjects", v17);
  requestHandlers = self->_requestHandlers;
  self->_requestHandlers = 0;

  requestMap = self->_requestMap;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __26__SFSession_sessionError___block_invoke;
  v19[3] = &unk_1E48341F0;
  v19[4] = self;
  v18 = v4;
  v20 = v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](requestMap, "enumerateKeysAndObjectsUsingBlock:", v19);
  -[NSMutableDictionary removeAllObjects](self->_requestMap, "removeAllObjects");
  v15 = self->_requestMap;
  self->_requestMap = 0;

  errorHandler = (void (**)(id, id))self->_errorHandler;
  if (errorHandler)
    errorHandler[2](errorHandler, v18);

}

void __26__SFSession_sessionError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
  if (v6 <= 50 && (v6 != -1 || _LogCategory_Initialize()))
  {
    v9 = v11;
    v10 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("_rh"), v9, v10);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(a1 + 40), 0);

}

- (void)sessionReceivedEvent:(id)a3
{
  int var0;
  void (**eventMessageHandler)(id, id);
  void *v6;
  id v7;

  v7 = a3;
  var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  eventMessageHandler = (void (**)(id, id))self->_eventMessageHandler;
  v6 = v7;
  if (eventMessageHandler)
  {
    eventMessageHandler[2](eventMessageHandler, v7);
    v6 = v7;
  }

}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 data:(id)a4
{
  uint64_t v4;
  SFSession *v6;
  id v7;
  uint64_t v8;
  void (**receivedFrameHandler)(id, _QWORD, id);
  id v10;

  v4 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_heartbeatLastTicks = mach_absolute_time();
  if ((int)v4 > 47)
  {
    if ((v4 - 64) < 2)
      goto LABEL_15;
    if ((_DWORD)v4 == 48)
    {
      v6 = self;
      v7 = v10;
      v8 = 0;
    }
    else
    {
      if ((_DWORD)v4 != 49)
      {
LABEL_13:
        receivedFrameHandler = (void (**)(id, _QWORD, id))self->_receivedFrameHandler;
        if (receivedFrameHandler)
          receivedFrameHandler[2](receivedFrameHandler, v4, v10);
        goto LABEL_15;
      }
      v6 = self;
      v7 = v10;
      v8 = 1;
    }
    -[SFSession sessionReceivedFragmentData:last:](v6, "sessionReceivedFragmentData:last:", v7, v8);
    goto LABEL_15;
  }
  switch((int)v4)
  {
    case 5:
    case 16:
    case 17:
    case 19:
    case 29:
      -[SFSession _sessionReceivedUnencryptedData:type:](self, "_sessionReceivedUnencryptedData:type:", v10, v4);
      break;
    case 6:
    case 28:
      -[SFSession _sessionReceivedEncryptedData:type:](self, "_sessionReceivedEncryptedData:type:", v10, v4);
      break;
    case 20:
    case 22:
      self->_heartbeatWaiting = 0;
      break;
    case 21:
    case 23:
    case 30:
      break;
    case 24:
      self->_heartbeatV2 = 1;
      -[SFSession _sessionReceivedStartAck:](self, "_sessionReceivedStartAck:", v10);
      break;
    default:
      goto LABEL_13;
  }
LABEL_15:

}

- (void)sessionReceivedFragmentData:(id)a3 last:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  int v9;
  NSMutableData *v10;
  NSMutableData *v11;
  NSMutableData *v12;
  void *v13;
  NSMutableData *v14;
  unint64_t v15;
  int v16;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableData *v21;
  void *v22;
  int var0;
  NSMutableData *fragmentData;
  id v25;

  v25 = a3;
  v6 = objc_msgSend(v25, "length");
  if (!v6
    || (v7 = v6,
        v8 = objc_retainAutorelease(v25),
        v9 = *(unsigned __int8 *)objc_msgSend(v8, "bytes"),
        self->_fragmentLastIndex + 1 != v9))
  {
    NSErrorWithOSStatusF();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
LABEL_22:
    if (v22)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      fragmentData = self->_fragmentData;
      self->_fragmentData = 0;

      self->_fragmentLastIndex = 0;
    }
    goto LABEL_19;
  }
  v10 = self->_fragmentData;
  if (!v10)
  {
    v11 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    v12 = self->_fragmentData;
    self->_fragmentData = v11;

    v10 = self->_fragmentData;
  }
  objc_msgSend(v8, "subdataWithRange:", 1, v7 - 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableData appendData:](v10, "appendData:", v13);

  if (a4)
  {
    v14 = self->_fragmentData;
    v15 = -[NSMutableData length](v14, "length");
    v16 = self->_ucatCore->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (v15 > 1)
    {
      v14 = objc_retainAutorelease(v14);
      v18 = (unsigned __int8 *)-[NSMutableData bytes](v14, "bytes");
      v19 = *v18;
      if ((((_BYTE)v19 - 48) & 0xEE) != 0 && v18[1] == self->_serviceType)
      {
        -[NSMutableData subdataWithRange:](v14, "subdataWithRange:", 2, v15 - 2);
        v20 = objc_claimAutoreleasedReturnValue();

        -[SFSession sessionReceivedFrameType:data:](self, "sessionReceivedFrameType:data:", v19, v20);
        v21 = self->_fragmentData;
        self->_fragmentData = 0;

        v22 = 0;
        self->_fragmentLastIndex = 0;
        v14 = (NSMutableData *)v20;
        goto LABEL_19;
      }
    }
    NSErrorWithOSStatusF();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v17 = self->_ucatCore->var0;
  if (v17 <= 30 && (v17 != -1 || _LogCategory_Initialize()))
  {
    -[NSMutableData length](self->_fragmentData, "length");
    LogPrintF();
  }
  v22 = 0;
  v14 = 0;
  self->_fragmentLastIndex = v9;
LABEL_19:

}

- (void)_sessionReceivedEncryptedData:(id)a3 type:(unsigned __int8)a4
{
  int v4;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  int v13;
  uint64_t v14;
  char v15;
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
  v7 = v6;
  if (!self->_encryptionReadAEAD)
  {
    var0 = self->_ucatCore->var0;
    if (var0 > 60 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_41;
LABEL_22:
    LogPrintF();
LABEL_41:
    v12 = 0;
    goto LABEL_42;
  }
  v8 = objc_msgSend(v6, "length");
  v9 = v8;
  if (v8 <= 0xF)
  {
    v23 = self->_ucatCore->var0;
    if (v23 > 60 || v23 == -1 && !_LogCategory_Initialize())
      goto LABEL_41;
    goto LABEL_22;
  }
  v10 = v8 - 16;
  v11 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v9 - 16);
  if (objc_msgSend(v12, "length") != v10)
  {
    v24 = self->_ucatCore->var0;
    if (v24 > 60 || v24 == -1 && !_LogCategory_Initialize())
      goto LABEL_42;
LABEL_28:
    LogPrintF();
    goto LABEL_42;
  }
  v12 = objc_retainAutorelease(v12);
  objc_msgSend(v12, "mutableBytes");
  v30 = v11 + v10;
  v13 = CryptoAEADDecryptMessage();
  v14 = 24;
  do
  {
    v15 = *((_BYTE *)&self->super.isa + v14) + 1;
    *((_BYTE *)&self->super.isa + v14) = v15;
    if (v15)
      break;
  }
  while (v14++ != 35);
  if (v13)
  {
    v25 = self->_ucatCore->var0;
    if (v25 > 60 || v25 == -1 && !_LogCategory_Initialize())
      goto LABEL_42;
    goto LABEL_28;
  }
  if (v4 == 28)
  {
    NSDataDecompress();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = v18;
    if (v17)
    {

      goto LABEL_13;
    }
    v29 = self->_ucatCore->var0;
    if (v29 <= 60 && (v29 != -1 || _LogCategory_Initialize()))
      LogPrintF();

LABEL_42:
    v17 = 0;
LABEL_43:
    v21 = 0;
    goto LABEL_16;
  }
  v17 = v12;
LABEL_13:
  v20 = OPACKDecodeData();
  if (!v20)
  {
    v26 = self->_ucatCore->var0;
    if (v26 <= 60 && (v26 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_43;
  }
  v21 = (void *)v20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSession _sessionReceivedObject:flags:](self, "_sessionReceivedObject:flags:", v21, 1, v30, 16);
  }
  else
  {
    v27 = self->_ucatCore->var0;
    if (v27 <= 60 && (v27 != -1 || _LogCategory_Initialize()))
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
LABEL_16:

}

- (void)_sessionReceivedUnencryptedData:(id)a3 type:(unsigned __int8)a4
{
  int v4;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  objc_class *v15;
  int var0;
  void *v17;

  v4 = a4;
  v6 = a3;
  if (v4 == 29)
  {
    NSDataDecompress();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = 0;

    if (!v7)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();

      v6 = 0;
      goto LABEL_41;
    }

    v6 = (id)v7;
  }
  v9 = OPACKDecodeData();
  if (!v9)
  {
    v13 = self->_ucatCore->var0;
    if (v13 <= 60 && (v13 != -1 || _LogCategory_Initialize()))
      LogPrintF();
LABEL_41:
    v10 = 0;
    goto LABEL_15;
  }
  v10 = (void *)v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v4 == 19)
    {
      if (self->_pairVerifySession)
      {
        -[SFSession _pairVerify:start:](self, "_pairVerify:start:", v10, 0);
        goto LABEL_15;
      }
      v11 = self->_ucatCore->var0;
      if (v11 <= 50 && (v11 != -1 || _LogCategory_Initialize()))
        goto LABEL_21;
    }
    else
    {
      if (v4 != 17)
      {
        if (v4 == 16)
          -[SFSession _serviceInitiatedPairSetup:](self, "_serviceInitiatedPairSetup:", v10);
        else
          -[SFSession _sessionReceivedObject:flags:](self, "_sessionReceivedObject:flags:", v10, 0);
        goto LABEL_15;
      }
      if (self->_pairSetupSession)
      {
        -[SFSession _pairSetup:start:](self, "_pairSetup:start:", v10, 0);
        goto LABEL_15;
      }
      v12 = self->_ucatCore->var0;
      if (v12 <= 50 && (v12 != -1 || _LogCategory_Initialize()))
LABEL_21:
        LogPrintF();
    }
  }
  else
  {
    v14 = self->_ucatCore->var0;
    if (v14 <= 60 && (v14 != -1 || _LogCategory_Initialize()))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF();

    }
  }
LABEL_15:

}

- (void)_sessionReceivedObject:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void (**receivedObjectHandler)(id, _QWORD, id);
  int var0;
  id v11;

  v4 = *(_QWORD *)&a4;
  v11 = a3;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_xc"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[SFSession _sessionReceivedResponseID:object:flags:](self, "_sessionReceivedResponseID:object:flags:", v6, v11, v4);
  }
  else
  {
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("_xs"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v7 = (void *)v8;
      if (!-[SFSession _sessionReceivedRegisteredRequestID:flags:xidKey:xidValue:](self, "_sessionReceivedRegisteredRequestID:flags:xidKey:xidValue:", v11, v4, CFSTR("_xs"), v8))-[SFSession _sessionReceivedRequestID:object:flags:](self, "_sessionReceivedRequestID:object:flags:", v7, v11, v4);
    }
    else
    {
      receivedObjectHandler = (void (**)(id, _QWORD, id))self->_receivedObjectHandler;
      if (receivedObjectHandler)
      {
        receivedObjectHandler[2](receivedObjectHandler, v4, v11);
      }
      else
      {
        var0 = self->_ucatCore->var0;
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
          LogPrintF();
      }
      v7 = 0;
    }
  }

}

- (BOOL)_sessionReceivedEvent:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t Int64Ranged;
  char v8;
  char v9;
  BOOL v10;
  int var0;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (!self->_sfTRSession)
  {
    v10 = 0;
    goto LABEL_10;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 10)
  {
    if ((v4 & 1) == 0)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v8 = 1;
      goto LABEL_6;
    }
    -[SFTRSession handleEvent:flags:](self->_sfTRSession, "handleEvent:flags:", v6, v4);
  }
  v8 = 0;
LABEL_6:
  v9 = v8 ^ 1;
  if (Int64Ranged == 10)
    v10 = v9;
  else
    v10 = 0;
LABEL_10:

  return v10;
}

- (BOOL)_sessionReceivedRegisteredRequestID:(id)a3 flags:(unsigned int)a4 xidKey:(id)a5 xidValue:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  BOOL v18;
  int v19;
  int var0;
  int v21;
  int v22;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  unsigned int v28;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    CFDictionaryGetTypeID();
    CFDictionaryGetTypedValue();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v18 = 0;
      goto LABEL_35;
    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestHandlers, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if ((a4 & 1) != 0 || (objc_msgSend(v15, "allowUnencrypted") & 1) != 0)
      {
        objc_msgSend(v16, "handler");
        v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v18 = v17 != 0;
        v19 = self->_ucatCore->var0;
        if (v17)
        {
          if (v19 <= 30 && (v19 != -1 || _LogCategory_Initialize()))
          {
            objc_msgSend(v14, "count");
            LogPrintF();
          }
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __71__SFSession__sessionReceivedRegisteredRequestID_flags_xidKey_xidValue___block_invoke;
          v24[3] = &unk_1E4834218;
          v24[4] = self;
          v25 = v13;
          v28 = a4;
          v26 = v11;
          v27 = v12;
          ((void (**)(_QWORD, _QWORD, void *, _QWORD *))v17)[2](v17, 0, v14, v24);

        }
        else if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }

        goto LABEL_34;
      }
      v22 = self->_ucatCore->var0;
      if (v22 > 60 || v22 == -1 && !_LogCategory_Initialize())
      {
LABEL_33:
        v18 = 0;
LABEL_34:

LABEL_35:
        goto LABEL_36;
      }
    }
    else
    {
      v21 = self->_ucatCore->var0;
      if (v21 > 60 || v21 == -1 && !_LogCategory_Initialize())
        goto LABEL_33;
    }
    LogPrintF();
    goto LABEL_33;
  }
  v18 = 0;
LABEL_36:

  return v18;
}

void __71__SFSession__sessionReceivedRegisteredRequestID_flags_xidKey_xidValue___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unsigned int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (v7)
    {
      v10 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 160);
      if (v10 <= 60 && (v10 != -1 || _LogCategory_Initialize()))
      {
        v23 = *(_QWORD *)(a1 + 40);
        v24 = v7;
        LogPrintF();
      }
    }
    v19 = *(void **)(a1 + 32);
    v20 = *(unsigned int *)(a1 + 64);
    v21 = *(_QWORD *)(a1 + 48);
    v22 = *(_QWORD *)(a1 + 56);
    v27[0] = CFSTR("_ro");
    v27[1] = v21;
    v28[0] = v9;
    v28[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2, v23, v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendWithFlags:object:", v20, v16);
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(unsigned int *)(a1 + 64);
    v25[0] = CFSTR("er");
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = NSErrorToOSStatus();
    if (v14)
      v15 = v14;
    else
      v15 = 4294960596;
    objc_msgSend(v13, "numberWithInt:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 56);
    v25[1] = *(_QWORD *)(a1 + 48);
    v26[0] = v16;
    v26[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendWithFlags:object:", v12, v18);

  }
}

- (void)_sessionReceivedRequestID:(id)a3 object:(id)a4 flags:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void (**receivedRequestHandler)(id, _QWORD, void *, void *);
  int var0;
  _QWORD aBlock[5];
  id v15;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = (void *)objc_msgSend(a4, "mutableCopy");
  objc_msgSend(v9, "removeObjectForKey:", CFSTR("_xs"));
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__SFSession__sessionReceivedRequestID_object_flags___block_invoke;
  aBlock[3] = &unk_1E4833C80;
  aBlock[4] = self;
  v10 = v8;
  v15 = v10;
  v11 = _Block_copy(aBlock);
  if (!-[SFSession _sessionReceivedRequest:flags:responseHandler:](self, "_sessionReceivedRequest:flags:responseHandler:", v9, v5, v11))
  {
    receivedRequestHandler = (void (**)(id, _QWORD, void *, void *))self->_receivedRequestHandler;
    if (receivedRequestHandler)
    {
      receivedRequestHandler[2](receivedRequestHandler, v5, v9, v11);
    }
    else
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }

}

void __52__SFSession__sessionReceivedRequestID_object_flags___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
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
    objc_msgSend(v16, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("_xs"));
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
    v19[1] = CFSTR("_xs");
    v20[0] = v14;
    v20[1] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sendWithFlags:object:", a2, v15);

  }
}

- (BOOL)_sessionReceivedRequest:(id)a3 flags:(unsigned int)a4 responseHandler:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  uint64_t Int64Ranged;
  char v11;
  char v12;
  BOOL v13;
  int var0;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (!self->_sfTRSession)
  {
    v13 = 0;
    goto LABEL_10;
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 11)
  {
    if ((v6 & 1) == 0)
    {
      var0 = self->_ucatCore->var0;
      if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v11 = 1;
      goto LABEL_6;
    }
    -[SFTRSession handleRequest:flags:responseHandler:](self->_sfTRSession, "handleRequest:flags:responseHandler:", v8, v6, v9);
  }
  v11 = 0;
LABEL_6:
  v12 = v11 ^ 1;
  if (Int64Ranged == 11)
    v13 = v12;
  else
    v13 = 0;
LABEL_10:

  return v13;
}

- (void)_sessionReceivedResponseID:(id)a3 object:(id)a4 flags:(unsigned int)a5
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
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestMap, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    var0 = self->_ucatCore->var0;
    if (var0 > 50 || var0 == -1 && !_LogCategory_Initialize())
      goto LABEL_6;
LABEL_12:
    LogPrintF();
    goto LABEL_6;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_requestMap, "removeObjectForKey:", v8);
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("_rh"));
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v16 = self->_ucatCore->var0;
    if (v16 > 50 || v16 == -1 && !_LogCategory_Initialize())
      goto LABEL_6;
    goto LABEL_12;
  }
  v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v11;
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if ((v5 & 1) == 0 && (Int64Ranged & 1) != 0)
  {
    v17 = self->_ucatCore->var0;
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
    objc_msgSend(v14, "removeObjectForKey:", CFSTR("_xc"));
    ((void (**)(_QWORD, uint64_t, _QWORD, void *))v12)[2](v12, v5, 0, v14);

  }
LABEL_6:

}

- (void)_sessionReceivedStartAck:(id)a3
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
  void (**sessionStartedHandler)(id);
  id v14;
  _QWORD block[5];
  int v16;

  v4 = a3;
  v16 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__SFSession__sessionReceivedStartAck___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  if (_sessionReceivedStartAck__onceToken != -1)
    dispatch_once(&_sessionReceivedStartAck__onceToken, block);
  v5 = (void *)OPACKDecodeData();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  var0 = self->_ucatCore->var0;
  if ((isKindOfClass & 1) != 0)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v10 = TextToSourceVersion();
      self->_sharingSourceVersion = v10;
      if (!v10)
        goto LABEL_12;
    }
    else if (!self->_sharingSourceVersion)
    {
LABEL_12:
      v11 = self->_ucatCore->var0;
      if (v11 <= 115 && (v11 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    sessionFlags = self->_sessionFlags;
    if ((sessionFlags & 1) != 0 && self->_sharingSourceVersion >= 0x7E57C0)
    {
      sessionFlags |= 2u;
      self->_sessionFlags = sessionFlags;
    }
    if ((sessionFlags & 0x20) != 0 && self->_sharingSourceVersion >= 0x8FE454)
      self->_sessionFlags = sessionFlags | 0x40;
    sessionStartedHandler = (void (**)(id))self->_sessionStartedHandler;
    if (sessionStartedHandler)
    {
      sessionStartedHandler[2](sessionStartedHandler);
      v14 = self->_sessionStartedHandler;
      self->_sessionStartedHandler = 0;

    }
    goto LABEL_24;
  }
  if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v9 = 0;
LABEL_24:

}

int *__38__SFSession__sessionReceivedStartAck___block_invoke(uint64_t a1)
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

- (void)sessionReceivedRequest:(id)a3
{
  int var0;
  void (**requestMessageHandler)(id, id);
  void *v6;
  id v7;

  v7 = a3;
  var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  requestMessageHandler = (void (**)(id, id))self->_requestMessageHandler;
  v6 = v7;
  if (requestMessageHandler)
  {
    requestMessageHandler[2](requestMessageHandler, v7);
    v6 = v7;
  }

}

- (void)sessionReceivedResponse:(id)a3
{
  void *v4;
  int var0;
  void *v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  id v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucatCore->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v11 = v12;
    LogPrintF();
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4
    && (-[NSMutableDictionary objectForKeyedSubscript:](self->_requestQueue, "objectForKeyedSubscript:", v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = v6;
    objc_msgSend(v6, "responseHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "responseHandler");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, id))v9)[2](v9, 0, v12);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_requestQueue, "removeObjectForKey:", v4, v11);

  }
  else
  {
    v10 = self->_ucatCore->var0;
    if (v10 <= 50 && (v10 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (int64_t)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int64_t)a3
{
  self->_bluetoothState = a3;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)fixedPIN
{
  return self->_fixedPIN;
}

- (void)setFixedPIN:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)label
{
  return self->_label;
}

- (CUMessageSession)messageSessionTemplate
{
  return self->_messageSessionTemplate;
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (void)setServiceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (unsigned)sessionFlags
{
  return self->_sessionFlags;
}

- (void)setSessionFlags:(unsigned int)a3
{
  self->_sessionFlags = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (NSString)myAppleID
{
  return self->_myAppleID;
}

- (void)setMyAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (CUAppleIDClient)myAppleIDInfoClient
{
  return self->_myAppleIDInfoClient;
}

- (void)setMyAppleIDInfoClient:(id)a3
{
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, a3);
}

- (NSString)peerAppleID
{
  return self->_peerAppleID;
}

- (void)setPeerAppleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)peerContactIdentifier
{
  return self->_peerContactIdentifier;
}

- (void)setPeerContactIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (SDStatusMonitor)statusMonitor
{
  return self->_statusMonitor;
}

- (void)setStatusMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_statusMonitor, a3);
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSDictionary)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSDictionary)pairVerifyACL
{
  return self->_pairVerifyACL;
}

- (void)setPairVerifyACL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (id)pairSetupCompletionHandler
{
  return self->_pairSetupCompletionHandler;
}

- (void)setPairSetupCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (id)showPINHandlerEx
{
  return self->_showPINHandlerEx;
}

- (void)setShowPINHandlerEx:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (id)promptForPINHandler
{
  return self->_promptForPINHandler;
}

- (void)setPromptForPINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (id)hidePINHandler
{
  return self->_hidePINHandler;
}

- (void)setHidePINHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 496);
}

- (id)receivedObjectHandler
{
  return self->_receivedObjectHandler;
}

- (void)setReceivedObjectHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 504);
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedRequestHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (id)sessionStartedHandler
{
  return self->_sessionStartedHandler;
}

- (void)setSessionStartedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 520);
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 528);
}

- (BOOL)isCLIMode
{
  return self->_isCLIMode;
}

- (void)setIsCLIMode:(BOOL)a3
{
  self->_isCLIMode = a3;
}

- (NSString)forcedPasscode
{
  return self->_forcedPasscode;
}

- (void)setForcedPasscode:(id)a3
{
  self->_forcedPasscode = (NSString *)a3;
}

- (id)eventMessageHandler
{
  return self->_eventMessageHandler;
}

- (void)setEventMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (id)requestMessageHandler
{
  return self->_requestMessageHandler;
}

- (void)setRequestMessageHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (unint64_t)heartbeatLastTicks
{
  return self->_heartbeatLastTicks;
}

- (void)setHeartbeatLastTicks:(unint64_t)a3
{
  self->_heartbeatLastTicks = a3;
}

- (NSUUID)peer
{
  return self->_peer;
}

- (void)setPeer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)receivedFrameHandler
{
  return self->_receivedFrameHandler;
}

- (void)setReceivedFrameHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 560);
}

- (NSMutableDictionary)requestHandlers
{
  return self->_requestHandlers;
}

- (id)responseMessageInternalHandler
{
  return self->_responseMessageInternalHandler;
}

- (void)setResponseMessageInternalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (id)sendFrameHandler
{
  return self->_sendFrameHandler;
}

- (void)setSendFrameHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(unsigned __int8)a3
{
  self->_serviceType = a3;
}

- (NSUUID)serviceUUID
{
  return self->_serviceUUID;
}

- (void)setServiceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 584);
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(unsigned int)a3
{
  self->_sessionID = a3;
}

- (unsigned)sharingSourceVersion
{
  return self->_sharingSourceVersion;
}

- (void)setSharingSourceVersion:(unsigned int)a3
{
  self->_sharingSourceVersion = a3;
}

- (NSXPCListenerEndpoint)testListenerEndpoint
{
  return self->_testListenerEndpoint;
}

- (void)setTestListenerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, a3);
}

- (BOOL)touchRemoteEnabled
{
  return self->_touchRemoteEnabled;
}

- (void)setTouchRemoteEnabled:(BOOL)a3
{
  self->_touchRemoteEnabled = a3;
}

- (TRSession)trSession
{
  return self->_trSession;
}

- (void)setTrSession:(id)a3
{
  objc_storeStrong((id *)&self->_trSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_serviceUUID, 0);
  objc_storeStrong(&self->_sendFrameHandler, 0);
  objc_storeStrong(&self->_responseMessageInternalHandler, 0);
  objc_storeStrong(&self->_receivedFrameHandler, 0);
  objc_storeStrong(&self->_requestMessageHandler, 0);
  objc_storeStrong(&self->_eventMessageHandler, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_sessionStartedHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedObjectHandler, 0);
  objc_storeStrong(&self->_hidePINHandler, 0);
  objc_storeStrong(&self->_promptForPINHandler, 0);
  objc_storeStrong(&self->_showPINHandlerEx, 0);
  objc_storeStrong(&self->_pairSetupCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pairVerifyACL, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_peerContactIdentifier, 0);
  objc_storeStrong((id *)&self->_myAppleIDInfoClient, 0);
  objc_storeStrong((id *)&self->_myAppleID, 0);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_trSession, 0);
  objc_storeStrong((id *)&self->_sfTRSession, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
  objc_storeStrong(&self->_pairVerifyCompletion, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_storeStrong(&self->_pairSetupCompletion, 0);
  objc_storeStrong((id *)&self->_messageSessionTemplate, 0);
  objc_storeStrong((id *)&self->_messageSessionServer, 0);
  objc_storeStrong((id *)&self->_appleIDContactInfo, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_requestMap, 0);
  objc_storeStrong((id *)&self->_requestHandlers, 0);
  objc_storeStrong((id *)&self->_peerAppleID, 0);
  objc_storeStrong((id *)&self->_peer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_fragmentData, 0);
  objc_storeStrong((id *)&self->_fixedPIN, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
