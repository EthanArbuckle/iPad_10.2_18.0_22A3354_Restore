@implementation RPRemoteDisplayServer

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplayServer)init
{
  RPRemoteDisplayServer *v2;
  RPRemoteDisplayServer *v3;
  RPRemoteDisplayServer *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPRemoteDisplayServer;
  v2 = -[RPRemoteDisplayServer init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_passwordType = 3;
    v4 = v3;
  }

  return v3;
}

- (RPRemoteDisplayServer)initWithCoder:(id)a3
{
  id v4;
  RPRemoteDisplayServer *v5;
  RPRemoteDisplayServer *v6;
  id v7;
  RPRemoteDisplayServer *v8;
  objc_super v10;
  uint64_t v11;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPRemoteDisplayServer;
  v5 = -[RPRemoteDisplayServer init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v11 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_internalAuthFlags = v11;
    v11 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_passwordType = v11;
    v7 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t internalAuthFlags;
  uint64_t passwordType;
  NSString *serviceType;
  id v8;

  v4 = a3;
  internalAuthFlags = self->_internalAuthFlags;
  v8 = v4;
  if ((_DWORD)internalAuthFlags)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", internalAuthFlags, CFSTR("iaf"));
    v4 = v8;
  }
  passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    objc_msgSend(v8, "encodeInteger:forKey:", passwordType, CFSTR("pwTy"));
    v4 = v8;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v8, "encodeObject:forKey:", serviceType, CFSTR("srvTy"));
    v4 = v8;
  }

}

- (id)description
{
  id v3;
  void *v4;
  NSString *serviceType;
  id v6;
  NSString *v8;
  void *v9;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v9 = v3;
    v8 = serviceType;
    NSAppendPrintF();
    v6 = v9;

    v4 = v6;
  }
  return v4;
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
  v7[2] = __48__RPRemoteDisplayServer_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __48__RPRemoteDisplayServer_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  NSXPCConnection *xpcCnx;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[4];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    if (gLogCategory_RPRemoteDisplayServer <= 30
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPRemoteDisplayServer <= 30
         && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  if (self->_authCompletionHandler)
    self->_internalAuthFlags |= 8u;
  if (self->_showPasswordHandler)
    self->_internalAuthFlags |= 1u;
  if (self->_hidePasswordHandler)
    self->_internalAuthFlags |= 2u;
  if (self->_promptForPasswordHandler)
    self->_internalAuthFlags |= 4u;
  -[RPRemoteDisplayServer _ensureXPCStarted](self, "_ensureXPCStarted");
  v7 = MEMORY[0x1E0C809B0];
  xpcCnx = self->_xpcCnx;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E5F4EED8;
  v17 = v4;
  v9 = v6;
  v16 = v9;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E5F4EED8;
  v14 = v4;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "remoteDisplayActivateServer:completion:", self, v12);

}

void __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  v7 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayServer <= 90)
    {
      if (gLogCategory_RPRemoteDisplayServer != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplayServer <= 90)
  {
    if (gLogCategory_RPRemoteDisplayServer != -1)
      goto LABEL_7;
    v5 = _LogCategory_Initialize();
    v3 = v7;
    if (v5)
      goto LABEL_7;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
    v3 = v7;
  }

}

void __60__RPRemoteDisplayServer__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  id v9;

  v3 = a2;
  v9 = v3;
  if (v3)
  {
    if (*(_BYTE *)(a1 + 40))
    {
      if (gLogCategory_RPRemoteDisplayServer <= 90)
      {
        if (gLogCategory_RPRemoteDisplayServer != -1 || (v5 = _LogCategory_Initialize(), v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPRemoteDisplayServer <= 90)
    {
      if (gLogCategory_RPRemoteDisplayServer != -1)
        goto LABEL_15;
      v7 = _LogCategory_Initialize();
      v3 = v9;
      if (v7)
        goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplayServer <= 30)
    {
      if (gLogCategory_RPRemoteDisplayServer != -1)
        goto LABEL_15;
      v6 = _LogCategory_Initialize();
      v3 = 0;
      if (v6)
        goto LABEL_15;
    }
  }
  else if (gLogCategory_RPRemoteDisplayServer <= 30)
  {
    if (gLogCategory_RPRemoteDisplayServer != -1)
      goto LABEL_15;
    v8 = _LogCategory_Initialize();
    v3 = 0;
    if (v8)
      goto LABEL_15;
  }
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v9);
    v3 = v9;
  }

}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.RemoteDisplay"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE452B0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AD58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPRemoteDisplayServer <= 10
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __42__RPRemoteDisplayServer__ensureXPCStarted__block_invoke_2(uint64_t a1)
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
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPRemoteDisplayServer <= 50
    && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled)
    -[RPRemoteDisplayServer _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
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
  block[2] = __35__RPRemoteDisplayServer_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __35__RPRemoteDisplayServer_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_RPRemoteDisplayServer <= 30
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(v2 + 32);
    if (*(_BYTE *)(v3 + 11))
    {
      objc_msgSend((id)v3, "stopPairingServer");
      v3 = *(_QWORD *)(v2 + 32);
    }
    objc_msgSend(*(id *)(v3 + 16), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_13);
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 24), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

uint64_t __35__RPRemoteDisplayServer_invalidate__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "invalidate");
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id authCompletionHandler;
  id interruptionHandler;
  id v6;
  id showPasswordHandler;
  id hidePasswordHandler;
  id promptForPasswordHandler;
  id sessionStartHandler;
  id sessionEndedHandler;

  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !-[NSMutableDictionary count](self->_sessions, "count")
    && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    authCompletionHandler = self->_authCompletionHandler;
    self->_authCompletionHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v6 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    showPasswordHandler = self->_showPasswordHandler;
    self->_showPasswordHandler = 0;

    hidePasswordHandler = self->_hidePasswordHandler;
    self->_hidePasswordHandler = 0;

    promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_promptForPasswordHandler = 0;

    sessionStartHandler = self->_sessionStartHandler;
    self->_sessionStartHandler = 0;

    sessionEndedHandler = self->_sessionEndedHandler;
    self->_sessionEndedHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplayServer <= 30
      && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)tryPassword:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (gLogCategory_RPRemoteDisplayServer <= 90
    && ((v6 = v3, gLogCategory_RPRemoteDisplayServer != -1) || (v5 = _LogCategory_Initialize(), v4 = v6, v5)))
  {
    LogPrintF();

  }
  else
  {

  }
}

- (void)startPairingServerWithCompletion:(id)a3
{
  id v4;
  id sessionStartHandler;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  sessionStartHandler = self->_sessionStartHandler;
  self->_sessionStartHandler = &__block_literal_global_102;

  xpcCnx = self->_xpcCnx;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_2;
  v13[3] = &unk_1E5F4ED20;
  v8 = v4;
  v14 = v8;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_3;
  v11[3] = &unk_1E5F50BD8;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "remoteDisplayStartPairingServerWithCompletion:", v11);

}

void __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void (**v4)(id, _QWORD);
  id v5;

  v5 = a2;
  v4 = a3;
  if (gLogCategory_RPRemoteDisplayServer <= 30
    && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v4[2](v4, 0);

}

uint64_t __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

void __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v9 = *(NSObject **)(v7 + 128);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_4;
  v12[3] = &unk_1E5F4F540;
  v13 = v6;
  v14 = v7;
  v15 = v5;
  v16 = v8;
  v10 = v5;
  v11 = v6;
  dispatch_async(v9, v12);

}

_QWORD *__58__RPRemoteDisplayServer_startPairingServerWithCompletion___block_invoke_4(_QWORD *result)
{
  uint64_t v1;

  if (!result[4])
    *(_BYTE *)(result[5] + 11) = 1;
  v1 = result[7];
  if (v1)
    return (_QWORD *)(*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v1 + 16))(result[7], result[6], result[4]);
  return result;
}

- (void)stopPairingServer
{
  void *v3;

  -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteDisplayStopPairingServer");

  self->_pairingServerRunning = 0;
}

- (void)remoteDisplayStartServerSessionID:(id)a3 device:(id)a4 linkType:(id)a5 completion:(id)a6
{
  void (**v10)(id, void *);
  NSObject *dispatchQueue;
  id v12;
  id v13;
  RPRemoteDisplaySession *v14;
  uint64_t v15;
  NSMutableDictionary *sessions;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = (void (**)(id, void *))a6;
  dispatchQueue = self->_dispatchQueue;
  v12 = a5;
  v13 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  v14 = objc_alloc_init(RPRemoteDisplaySession);
  -[RPRemoteDisplaySession setDestinationDevice:](v14, "setDestinationDevice:", v13);

  -[RPRemoteDisplaySession setDispatchQueue:](v14, "setDispatchQueue:", self->_dispatchQueue);
  -[RPRemoteDisplaySession setServer:](v14, "setServer:", self);
  -[RPRemoteDisplaySession setSessionID:](v14, "setSessionID:", v22);
  -[RPRemoteDisplaySession setXpcCnx:](v14, "setXpcCnx:", self->_xpcCnx);
  v15 = objc_msgSend(v12, "intValue");

  -[RPRemoteDisplaySession setLinkType:](v14, "setLinkType:", v15);
  sessions = self->_sessions;
  if (!sessions)
  {
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = self->_sessions;
    self->_sessions = v17;

    sessions = self->_sessions;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v14, v22);
  v19 = MEMORY[0x1AF45BE48](self->_sessionStartHandler);
  v20 = (void *)v19;
  if (v19)
  {
    (*(void (**)(uint64_t, RPRemoteDisplaySession *, void (**)(id, void *)))(v19 + 16))(v19, v14, v10);
  }
  else
  {
    RPErrorF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v21);

  }
}

- (void)remoteDisplaySessionEndedWithID:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v6 = MEMORY[0x1AF45BE48](self->_sessionEndedHandler);
    v7 = (void *)v6;
    if (v6)
      (*(void (**)(uint64_t, id, _QWORD))(v6 + 16))(v6, v8, 0);

  }
}

- (void)remoteDisplayReceivedEventID:(id)a3 event:(id)a4 options:(id)a5 sessionID:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13 = a6;
  dispatch_assert_queue_V2(dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v14, "remoteDisplayReceivedEventID:event:options:", v15, v10, v11);

}

- (void)remoteDisplayReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6 sessionID:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  id v16;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  dispatchQueue = self->_dispatchQueue;
  v16 = a7;
  dispatch_assert_queue_V2(dispatchQueue);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v17, "remoteDisplayReceivedRequestID:request:options:responseHandler:", v18, v12, v13, v14);

}

- (void)remoteDisplayShowPassword:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v6 = v9;
  if (!self->_invalidateCalled)
  {
    v7 = MEMORY[0x1AF45BE48](self->_showPasswordHandler);
    v8 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v4, v9);
    }
    else if (gLogCategory_RPRemoteDisplayServer <= 90
           && (gLogCategory_RPRemoteDisplayServer != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v6 = v9;
  }

}

- (void)remoteDisplayHidePasswordWithFlags:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v5 = MEMORY[0x1AF45BE48](self->_hidePasswordHandler);
    v6 = (void *)v5;
    if (v5)
    {
      v8 = (void *)v5;
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, v3);
LABEL_4:

      return;
    }
    if (gLogCategory_RPRemoteDisplayServer <= 90)
    {
      v8 = 0;
      if (gLogCategory_RPRemoteDisplayServer != -1 || (v7 = _LogCategory_Initialize(), v6 = 0, v7))
      {
        LogPrintF();
        goto LABEL_4;
      }
    }

  }
}

- (NSArray)allowedMACAddresses
{
  return self->_allowedMACAddresses;
}

- (void)setAllowedMACAddresses:(id)a3
{
  objc_storeStrong((id *)&self->_allowedMACAddresses, a3);
}

- (NSArray)pairSetupACL
{
  return self->_pairSetupACL;
}

- (void)setPairSetupACL:(id)a3
{
  objc_storeStrong((id *)&self->_pairSetupACL, a3);
}

- (unsigned)pairSetupFlags
{
  return self->_pairSetupFlags;
}

- (void)setPairSetupFlags:(unsigned int)a3
{
  self->_pairSetupFlags = a3;
}

- (unsigned)pairVerifyFlags
{
  return self->_pairVerifyFlags;
}

- (void)setPairVerifyFlags:(unsigned int)a3
{
  self->_pairVerifyFlags = a3;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (int)passwordTypeActual
{
  return self->_passwordTypeActual;
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (id)sessionStartHandler
{
  return self->_sessionStartHandler;
}

- (void)setSessionStartHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (id)sessionEndedHandler
{
  return self->_sessionEndedHandler;
}

- (void)setSessionEndedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sessionEndedHandler, 0);
  objc_storeStrong(&self->_sessionStartHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
}

@end
