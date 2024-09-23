@implementation RPRemoteDisplaySession

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPRemoteDisplaySession)init
{
  RPRemoteDisplaySession *v2;
  RPRemoteDisplaySession *v3;
  RPRemoteDisplaySession *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RPRemoteDisplaySession;
  v2 = -[RPRemoteDisplaySession init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = v3;
  }

  return v3;
}

- (RPRemoteDisplaySession)initWithCoder:(id)a3
{
  id v4;
  RPRemoteDisplaySession *v5;
  RPRemoteDisplaySession *v6;
  id v7;
  id v8;
  id v9;
  RPRemoteDisplaySession *v10;
  objc_super v12;
  uint64_t v13;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RPRemoteDisplaySession;
  v5 = -[RPRemoteDisplaySession init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v7 = v4;
    if (objc_msgSend(v7, "containsValueForKey:", CFSTR("cFl")))
      v6->_controlFlags = objc_msgSend(v7, "decodeInt64ForKey:", CFSTR("cFl"));

    objc_opt_class();
    NSDecodeObjectIfPresent();
    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_internalAuthFlags = v13;
    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v13 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      v6->_passwordType = v13;
    v9 = v8;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v10 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  unint64_t controlFlags;
  RPRemoteDisplayDevice *destinationDevice;
  uint64_t internalAuthFlags;
  NSData *pairingInfo;
  uint64_t passwordType;
  NSString *serviceType;
  id v11;

  v4 = a3;
  controlFlags = self->_controlFlags;
  v11 = v4;
  if (controlFlags)
  {
    objc_msgSend(v4, "encodeInt64:forKey:", controlFlags, CFSTR("cFl"));
    v4 = v11;
  }
  destinationDevice = self->_destinationDevice;
  if (destinationDevice)
  {
    objc_msgSend(v11, "encodeObject:forKey:", destinationDevice, CFSTR("dd"));
    v4 = v11;
  }
  internalAuthFlags = self->_internalAuthFlags;
  if ((_DWORD)internalAuthFlags)
  {
    objc_msgSend(v11, "encodeInt64:forKey:", internalAuthFlags, CFSTR("iaf"));
    v4 = v11;
  }
  pairingInfo = self->_pairingInfo;
  if (pairingInfo)
  {
    objc_msgSend(v11, "encodeObject:forKey:", pairingInfo, CFSTR("pairI"));
    v4 = v11;
  }
  passwordType = self->_passwordType;
  if ((_DWORD)passwordType)
  {
    objc_msgSend(v11, "encodeInteger:forKey:", passwordType, CFSTR("pwTy"));
    v4 = v11;
  }
  serviceType = self->_serviceType;
  if (serviceType)
  {
    objc_msgSend(v11, "encodeObject:forKey:", serviceType, CFSTR("srvTy"));
    v4 = v11;
  }

}

- (id)description
{
  id v3;
  void *v4;
  NSString *serviceType;
  id v6;
  RPRemoteDisplayDevice *destinationDevice;
  id v8;
  NSString *v10;
  RPRemoteDisplayDevice *v11;
  void *v12;

  NSAppendPrintF();
  v3 = 0;
  v4 = v3;
  serviceType = self->_serviceType;
  if (serviceType)
  {
    v12 = v3;
    v10 = serviceType;
    NSAppendPrintF();
    v6 = v12;

    v4 = v6;
  }
  destinationDevice = self->_destinationDevice;
  if (destinationDevice)
  {
    v11 = destinationDevice;
    NSAppendPrintF();
    v8 = v4;

    v4 = v8;
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
  v7[2] = __49__RPRemoteDisplaySession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __49__RPRemoteDisplaySession_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  NSXPCConnection *xpcCnx;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;

  v4 = a4;
  v6 = a3;
  v7 = v6;
  if (self->_server)
  {
    if (v6)
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
    goto LABEL_23;
  }
  if (v4)
  {
    if (gLogCategory_RPRemoteDisplaySession > 30
      || gLogCategory_RPRemoteDisplaySession == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }
  else if (gLogCategory_RPRemoteDisplaySession > 30
         || gLogCategory_RPRemoteDisplaySession == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_14;
  }
  LogPrintF();
LABEL_14:
  if (self->_authCompletionHandler)
    self->_internalAuthFlags |= 8u;
  if (self->_showPasswordHandler)
    self->_internalAuthFlags |= 1u;
  if (self->_hidePasswordHandler)
    self->_internalAuthFlags |= 2u;
  if (self->_promptForPasswordHandler)
    self->_internalAuthFlags |= 4u;
  -[RPRemoteDisplaySession _ensureXPCStarted](self, "_ensureXPCStarted");
  xpcCnx = self->_xpcCnx;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke;
  v15[3] = &unk_1E5F4F478;
  v15[4] = self;
  v17 = v4;
  v10 = v7;
  v16 = v10;
  -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke_2;
  v12[3] = &unk_1E5F4EED8;
  v14 = v4;
  v13 = v10;
  objc_msgSend(v11, "remoteDisplayActivateSession:completion:", self, v12);

LABEL_23:
}

void __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  id v9;
  id v10;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v9 = v3;
    RPNestedErrorF();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v10 = v4;
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1 || (v6 = _LogCategory_Initialize(), v4 = v10, v6))
      {
LABEL_9:
        LogPrintF();
        v4 = v10;
      }
    }
  }
  else if (gLogCategory_RPRemoteDisplaySession <= 90)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1)
      goto LABEL_9;
    v7 = _LogCategory_Initialize();
    v4 = v10;
    if (v7)
      goto LABEL_9;
  }
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v4);
    v4 = v10;
  }

}

void __61__RPRemoteDisplaySession__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2)
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
      if (gLogCategory_RPRemoteDisplaySession <= 90)
      {
        if (gLogCategory_RPRemoteDisplaySession != -1 || (v5 = _LogCategory_Initialize(), v3 = v9, v5))
        {
LABEL_15:
          LogPrintF();
          v3 = v9;
        }
      }
    }
    else if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1)
        goto LABEL_15;
      v7 = _LogCategory_Initialize();
      v3 = v9;
      if (v7)
        goto LABEL_15;
    }
  }
  else if (*(_BYTE *)(a1 + 40))
  {
    if (gLogCategory_RPRemoteDisplaySession <= 30)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1)
        goto LABEL_15;
      v6 = _LogCategory_Initialize();
      v3 = 0;
      if (v6)
        goto LABEL_15;
    }
  }
  else if (gLogCategory_RPRemoteDisplaySession <= 30)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1)
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
    v9[2] = __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke;
    v9[3] = &unk_1E5F4EC60;
    v9[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v9);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke_2;
    v8[3] = &unk_1E5F4EC60;
    v8[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v8);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AD58);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v7);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPRemoteDisplaySession <= 10
      && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __43__RPRemoteDisplaySession__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 224);
  *(_QWORD *)(v2 + 224) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPRemoteDisplaySession <= 50
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled)
    -[RPRemoteDisplaySession _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
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
  block[2] = __36__RPRemoteDisplaySession_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __36__RPRemoteDisplaySession_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    v2 = result;
    *(_BYTE *)(v1 + 24) = 1;
    if (gLogCategory_RPRemoteDisplaySession <= 30
      && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(_QWORD *)(v2 + 32);
    if (*(_QWORD *)(v3 + 208))
    {
      v4 = *(id *)(v3 + 216);
      if (v4)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 224), "remoteObjectProxy");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "remoteDisplayInvalidateSessionID:", v4);

      }
      v6 = *(_QWORD *)(v2 + 32);
      v7 = *(void **)(v6 + 208);
      *(_QWORD *)(v6 + 208) = 0;

      v8 = *(_QWORD *)(v2 + 32);
      v9 = *(void **)(v8 + 216);
      *(_QWORD *)(v8 + 216) = 0;

      v10 = *(_QWORD *)(v2 + 32);
      v11 = *(void **)(v10 + 224);
      *(_QWORD *)(v10 + 224) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(v3 + 224), "remoteObjectProxy");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "remoteDisplayInvalidateClientSession");

      objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 224), "invalidate");
    }
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id authCompletionHandler;
  id errorHandler;
  id interruptionHandler;
  id v7;
  id showPasswordHandler;
  id hidePasswordHandler;
  id promptForPasswordHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    -[NSMutableDictionary removeAllObjects](self->_eventRegistrations, "removeAllObjects");
    -[NSMutableDictionary removeAllObjects](self->_requestRegistrations, "removeAllObjects");
    authCompletionHandler = self->_authCompletionHandler;
    self->_authCompletionHandler = 0;

    errorHandler = self->_errorHandler;
    self->_errorHandler = 0;

    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v7 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    showPasswordHandler = self->_showPasswordHandler;
    self->_showPasswordHandler = 0;

    hidePasswordHandler = self->_hidePasswordHandler;
    self->_hidePasswordHandler = 0;

    promptForPasswordHandler = self->_promptForPasswordHandler;
    self->_promptForPasswordHandler = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPRemoteDisplaySession <= 30
      && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__RPRemoteDisplaySession_tryPassword___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __38__RPRemoteDisplaySession_tryPassword___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteDisplayTryPassword:", *(_QWORD *)(a1 + 40));

}

- (void)remoteDisplayPromptForPasswordWithFlags:(unsigned int)a3 throttleSeconds:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    v7 = MEMORY[0x1AF45BE48](self->_promptForPasswordHandler);
    v8 = (void *)v7;
    if (v7)
    {
      v10 = (void *)v7;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, v5, v4);
LABEL_4:

      return;
    }
    if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      v10 = 0;
      if (gLogCategory_RPRemoteDisplaySession != -1 || (v9 = _LogCategory_Initialize(), v8 = 0, v9))
      {
        LogPrintF();
        goto LABEL_4;
      }
    }

  }
}

- (void)remoteDisplayAuthCompleted:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = MEMORY[0x1AF45BE48](self->_authCompletionHandler);
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
  else if (gLogCategory_RPRemoteDisplaySession <= 90
         && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

- (void)registerEventID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  RPRemoteDisplaySession *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__RPRemoteDisplaySession_registerEventID_options_handler___block_invoke;
  v15[3] = &unk_1E5F4F540;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __58__RPRemoteDisplaySession_registerEventID_options_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  RPEventRegistration *v7;

  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    v6 = a1[4];
    LogPrintF();
  }
  v7 = objc_alloc_init(RPEventRegistration);
  -[RPEventRegistration setEventID:](v7, "setEventID:", a1[4]);
  -[RPEventRegistration setOptions:](v7, "setOptions:", a1[5]);
  -[RPEventRegistration setHandler:](v7, "setHandler:", a1[7]);
  v2 = *(void **)(a1[6] + 16);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = a1[6];
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(a1[6] + 16);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, a1[4], v6);

}

- (void)deregisterEventID:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RPRemoteDisplaySession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__RPRemoteDisplaySession_deregisterEventID___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __44__RPRemoteDisplaySession_deregisterEventID___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  -[RPRemoteDisplaySession sendEventID:event:destinationID:options:completion:](self, "sendEventID:event:destinationID:options:completion:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v13, "count");
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__RPRemoteDisplaySession_sendEventID_event_destinationID_options_completion___block_invoke;
  block[3] = &unk_1E5F4F680;
  block[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(dispatchQueue, block);

}

uint64_t __77__RPRemoteDisplaySession_sendEventID_event_destinationID_options_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendEventID:event:destinationID:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_sendEventID:(id)a3 event:(id)a4 destinationID:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSXPCConnection *xpcCnx;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if ((objc_msgSend(a5, "isEqual:", CFSTR("rapport:rdid:DirectPeer")) & 1) != 0)
  {
    -[RPRemoteDisplaySession _ensureXPCStarted](self, "_ensureXPCStarted");
    v16 = MEMORY[0x1E0C809B0];
    xpcCnx = self->_xpcCnx;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke;
    v25[3] = &unk_1E5F4F720;
    v25[4] = self;
    v18 = v12;
    v26 = v18;
    v19 = v15;
    v27 = v19;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke_2;
    v22[3] = &unk_1E5F4F3E8;
    v23 = v18;
    v24 = v19;
    objc_msgSend(v20, "remoteDisplaySendEventID:event:options:completion:", v23, v13, v14, v22);

  }
  else if (v15)
  {
    RPErrorF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v15 + 2))(v15, v21);

  }
}

void __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v8 = v3;
    RPNestedErrorF();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v9 = v4;
  if (gLogCategory_RPRemoteDisplaySession <= 90)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1 || (v6 = _LogCategory_Initialize(), v4 = v9, v6))
    {
      LogPrintF();
      v4 = v9;
    }
  }
  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
  {
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v9);
    v4 = v9;
  }

}

void __78__RPRemoteDisplaySession__sendEventID_event_destinationID_options_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  id v6;

  v3 = a2;
  v6 = v3;
  if (v3)
  {
    if (gLogCategory_RPRemoteDisplaySession <= 90)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1 || (v4 = _LogCategory_Initialize(), v3 = v6, v4))
      {
        LogPrintF();
        v3 = v6;
      }
    }
  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
    v3 = v6;
  }

}

- (void)remoteDisplayReceivedEventID:(id)a3 event:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", v8);
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_eventRegistrations, "objectForKeyedSubscript:", CFSTR("*"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_6;
    v12 = (void *)v15;
    if (v10)
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v10);
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v8, CFSTR("eventID"));

      v10 = v16;
    }
    else
    {
      v17 = CFSTR("eventID");
      v18[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v12, "handler");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    (*(void (**)(uint64_t, id, id))(v13 + 16))(v13, v9, v10);

LABEL_6:
}

- (void)remoteDisplaySessionError:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = MEMORY[0x1AF45BE48](self->_errorHandler);
  v5 = (void *)v4;
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);

}

- (void)registerRequestID:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  RPRemoteDisplaySession *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__RPRemoteDisplaySession_registerRequestID_options_handler___block_invoke;
  v15[3] = &unk_1E5F4F540;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

void __60__RPRemoteDisplaySession_registerRequestID_options_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  RPRequestRegistration *v7;

  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    v6 = a1[4];
    LogPrintF();
  }
  v7 = objc_alloc_init(RPRequestRegistration);
  -[RPRequestRegistration setRequestID:](v7, "setRequestID:", a1[4]);
  -[RPRequestRegistration setOptions:](v7, "setOptions:", a1[5]);
  -[RPRequestRegistration setHandler:](v7, "setHandler:", a1[7]);
  v2 = *(void **)(a1[6] + 32);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v4 = a1[6];
    v5 = *(void **)(v4 + 32);
    *(_QWORD *)(v4 + 32) = v3;

    v2 = *(void **)(a1[6] + 32);
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, a1[4], v6);

}

- (void)deregisterRequestID:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  RPRemoteDisplaySession *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__RPRemoteDisplaySession_deregisterRequestID___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __46__RPRemoteDisplaySession_deregisterRequestID___block_invoke(uint64_t a1)
{
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "setObject:forKeyedSubscript:", 0, *(_QWORD *)(a1 + 32));
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  -[RPRemoteDisplaySession sendRequestID:request:destinationID:options:responseHandler:](self, "sendRequestID:request:destinationID:options:responseHandler:", a3, a4, CFSTR("rapport:rdid:DirectPeer"), a5, a6);
}

- (void)sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *dispatchQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogCategory_RPRemoteDisplaySession <= 30
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v13, "count");
    LogPrintF();
  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__RPRemoteDisplaySession_sendRequestID_request_destinationID_options_responseHandler___block_invoke;
  block[3] = &unk_1E5F4F680;
  block[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(dispatchQueue, block);

}

uint64_t __86__RPRemoteDisplaySession_sendRequestID_request_destinationID_options_responseHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendRequestID:request:destinationID:options:responseHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (void)_sendRequestID:(id)a3 request:(id)a4 destinationID:(id)a5 options:(id)a6 responseHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  NSXPCConnection *xpcCnx;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if ((objc_msgSend(a5, "isEqual:", CFSTR("rapport:rdid:DirectPeer")) & 1) != 0)
  {
    -[RPRemoteDisplaySession _ensureXPCStarted](self, "_ensureXPCStarted");
    v16 = MEMORY[0x1E0C809B0];
    xpcCnx = self->_xpcCnx;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke;
    v25[3] = &unk_1E5F4F720;
    v25[4] = self;
    v18 = v12;
    v26 = v18;
    v19 = v15;
    v27 = v19;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v16;
    v22[1] = 3221225472;
    v22[2] = __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke_2;
    v22[3] = &unk_1E5F50C00;
    v23 = v18;
    v24 = v19;
    objc_msgSend(v20, "remoteDisplaySendRequestID:request:options:responseHandler:", v23, v13, v14, v22);

  }
  else if (v15)
  {
    RPErrorF();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v15 + 2))(v15, 0, 0, v21);

  }
}

void __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 24))
  {
    v6 = v3;
    RPNestedErrorF();
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v7 = v4;
  if (gLogCategory_RPRemoteDisplaySession <= 90
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);

}

void __87__RPRemoteDisplaySession__sendRequestID_request_destinationID_options_responseHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (v8
    && gLogCategory_RPRemoteDisplaySession <= 90
    && (gLogCategory_RPRemoteDisplaySession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  (*(void (**)(_QWORD, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9);

}

- (void)remoteDisplayReceivedRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_requestRegistrations, "objectForKeyedSubscript:", CFSTR("*"));
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      RPErrorF();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v15);
      goto LABEL_6;
    }
    v15 = (void *)v18;
    if (v12)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v12);
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, CFSTR("requestID"));

      v12 = v19;
    }
    else
    {
      v20 = CFSTR("requestID");
      v21[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v15, "handler");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    (*(void (**)(uint64_t, id, id, id))(v16 + 16))(v16, v11, v12, v13);

LABEL_6:
}

- (void)remoteDisplayUpdateDataLinkType:(id)a3
{
  unsigned int v4;
  unsigned int linkType;
  BOOL v6;
  NSObject *dispatchQueue;
  _QWORD block[5];
  unsigned int v9;

  v4 = objc_msgSend(a3, "intValue");
  linkType = self->_linkType;
  if (linkType)
    v6 = linkType == v4;
  else
    v6 = 1;
  if (v6)
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__RPRemoteDisplaySession_remoteDisplayUpdateDataLinkType___block_invoke;
    block[3] = &unk_1E5F4F450;
    block[4] = self;
    v9 = v4;
    dispatch_async(dispatchQueue, block);
  }
  else if (gLogCategory_RPRemoteDisplaySession <= 30)
  {
    if (gLogCategory_RPRemoteDisplaySession != -1)
    {
LABEL_10:
      RPDataLinkTypeToString_0(linkType);
      RPDataLinkTypeToString_0(v4);
      LogPrintF();
      return;
    }
    if (_LogCategory_Initialize())
    {
      linkType = self->_linkType;
      goto LABEL_10;
    }
  }
}

uint64_t __58__RPRemoteDisplaySession_remoteDisplayUpdateDataLinkType___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_DWORD *)(v1 + 60))
  {
    v2 = result;
    if (gLogCategory_RPRemoteDisplaySession <= 30)
    {
      if (gLogCategory_RPRemoteDisplaySession != -1
        || (result = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 32), (_DWORD)result))
      {
        result = LogPrintF();
        v1 = *(_QWORD *)(v2 + 32);
      }
    }
    *(_DWORD *)(v1 + 60) = *(_DWORD *)(v2 + 40);
  }
  return result;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)showPasswordHandler
{
  return self->_showPasswordHandler;
}

- (void)setShowPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)hidePasswordHandler
{
  return self->_hidePasswordHandler;
}

- (void)setHidePasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)promptForPasswordHandler
{
  return self->_promptForPasswordHandler;
}

- (void)setPromptForPasswordHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSData)pairingInfo
{
  return self->_pairingInfo;
}

- (void)setPairingInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (int)linkType
{
  return self->_linkType;
}

- (void)setLinkType:(int)a3
{
  self->_linkType = a3;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(id)a3
{
  objc_storeStrong((id *)&self->_serviceType, a3);
}

- (unint64_t)controlFlags
{
  return self->_controlFlags;
}

- (void)setControlFlags:(unint64_t)a3
{
  self->_controlFlags = a3;
}

- (RPRemoteDisplayDevice)destinationDevice
{
  return self->_destinationDevice;
}

- (void)setDestinationDevice:(id)a3
{
  objc_storeStrong((id *)&self->_destinationDevice, a3);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (CUBonjourDevice)bonjourDevice
{
  return self->_bonjourDevice;
}

- (void)setBonjourDevice:(id)a3
{
  objc_storeStrong((id *)&self->_bonjourDevice, a3);
}

- (RPRemoteDisplayDevice)daemonDevice
{
  return self->_daemonDevice;
}

- (void)setDaemonDevice:(id)a3
{
  objc_storeStrong((id *)&self->_daemonDevice, a3);
}

- (unsigned)internalAuthFlags
{
  return self->_internalAuthFlags;
}

- (BOOL)needsAWDL
{
  return self->_needsAWDL;
}

- (void)setNeedsAWDL:(BOOL)a3
{
  self->_needsAWDL = a3;
}

- (RPRemoteDisplayServer)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  objc_storeStrong((id *)&self->_server, a3);
}

- (NSNumber)sessionID
{
  return self->_sessionID;
}

- (void)setSessionID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (NSXPCConnection)xpcCnx
{
  return self->_xpcCnx;
}

- (void)setXpcCnx:(id)a3
{
  objc_storeStrong((id *)&self->_xpcCnx, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_daemonDevice, 0);
  objc_storeStrong((id *)&self->_bonjourDevice, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_destinationDevice, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_pairingInfo, 0);
  objc_storeStrong(&self->_promptForPasswordHandler, 0);
  objc_storeStrong(&self->_hidePasswordHandler, 0);
  objc_storeStrong(&self->_showPasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_pairSetupACL, 0);
  objc_storeStrong((id *)&self->_allowedMACAddresses, 0);
  objc_storeStrong((id *)&self->_requestRegistrations, 0);
  objc_storeStrong((id *)&self->_eventRegistrations, 0);
}

@end
