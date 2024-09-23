@implementation RPSiriAudioSession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPSiriAudioSession)init
{
  RPSiriAudioSession *v2;
  RPSiriAudioSession *v3;
  RPSiriAudioSession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPSiriAudioSession;
  v2 = -[RPSiriAudioSession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_ucat = (LogCategory *)&gLogCategory_RPSiriAudioSession;
    v4 = v3;
  }

  return v3;
}

- (RPSiriAudioSession)initWithCoder:(id)a3
{
  id v4;
  RPSiriAudioSession *v5;
  RPSiriAudioSession *v6;
  id v7;
  RPSiriAudioSession *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPSiriAudioSession;
  v5 = -[RPSiriAudioSession init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v6->_ucat = (LogCategory *)&gLogCategory_RPSiriAudioSession;
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
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
  v4.super_class = (Class)RPSiriAudioSession;
  -[RPSiriAudioSession dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *sessionID;

  sessionID = self->_sessionID;
  if (sessionID)
    objc_msgSend(a3, "encodeObject:forKey:", sessionID, CFSTR("sid"));
}

- (id)description
{
  NSAppendPrintF();
  return 0;
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__RPSiriAudioSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __45__RPSiriAudioSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[8])
  {
    NSRandomData();
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "bytes");
    objc_msgSend(v3, "length");
    objc_msgSend(v3, "length");
    NSPrintF();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 64);
    *(_QWORD *)(v5 + 64) = v4;

    v2 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v2, "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  int var0;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  BOOL v15;
  _QWORD v16[5];
  id v17;
  BOOL v18;

  v4 = a4;
  v6 = a3;
  var0 = self->_ucat->var0;
  if (v4)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  -[RPSiriAudioSession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke;
  v16[3] = &unk_1E5F4F478;
  v18 = v4;
  v16[4] = self;
  v10 = v6;
  v17 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke_2;
  v13[3] = &unk_1E5F4F478;
  v15 = v4;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "xpcSiriAudioSessionActivate:completion:", self, v13);

}

void __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  id v8;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = v3;
  if (*(_BYTE *)(a1 + 48))
  {
    if (v4 <= 90)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = v8, v5))
      {
LABEL_7:
        LogPrintF();
        v3 = v8;
      }
    }
  }
  else if (v4 <= 90)
  {
    if (v4 != -1)
      goto LABEL_7;
    v6 = _LogCategory_Initialize();
    v3 = v8;
    if (v6)
      goto LABEL_7;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v8);
    v3 = v8;
  }

}

void __57__RPSiriAudioSession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 16);
  v7 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 48))
    {
      if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
LABEL_15:
        LogPrintF();
    }
    else if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
      goto LABEL_15;
  }
  else if (v4 <= 30 && (v4 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_15;
  }
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v7;
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);
    v6 = v7;
  }

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  int var0;
  _QWORD v9[5];
  _QWORD v10[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.rapport.siri-audio"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE45A18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __39__RPSiriAudioSession__ensureXPCStarted__block_invoke;
    v10[3] = &unk_1E5F4EC60;
    v10[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v10);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __39__RPSiriAudioSession__ensureXPCStarted__block_invoke_2;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v9);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4ADB8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

uint64_t __39__RPSiriAudioSession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __39__RPSiriAudioSession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  int var0;
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_activateCalled)
    -[RPSiriAudioSession _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__RPSiriAudioSession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPSiriAudioSession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    v3 = *(_QWORD *)(result + 32);
    v4 = **(_DWORD **)(v3 + 16);
    if (v4 <= 30)
    {
      if (v4 != -1 || (v5 = _LogCategory_Initialize(), v3 = *(_QWORD *)(v2 + 32), v5))
      {
        LogPrintF();
        v3 = *(_QWORD *)(v2 + 32);
      }
    }
    objc_msgSend(*(id *)(v3 + 24), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id interruptionHandler;
  id v5;
  RPSiriAudioSessionDelegate *delegate;
  int var0;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    delegate = self->_delegate;
    self->_delegate = 0;

    self->_invalidateDone = 1;
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)receivedSiriAudioEvent:(id)a3
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
  v7[2] = __45__RPSiriAudioSession_receivedSiriAudioEvent___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __45__RPSiriAudioSession_receivedSiriAudioEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  if (v3)
  {
    objc_msgSend(v3, "remoteObjectProxy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "xpcSiriAudioReceived:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v4 = **(_DWORD **)(v2 + 16);
    if (v4 <= 60 && (v4 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (void)xpcSiriStopClientRecordingWithDeviceId:(id)a3
{
  int var0;
  RPSiriAudioSessionDelegate *v5;
  id v6;

  v6 = a3;
  if (_os_feature_enabled_impl())
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    v5 = self->_delegate;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[RPSiriAudioSessionDelegate siriAudioSessionDidReceiveStopRecordingWithDeviceId:](v5, "siriAudioSessionDidReceiveStopRecordingWithDeviceId:", v6);

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

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)label
{
  return self->_label;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RPSiriAudioSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
}

@end
