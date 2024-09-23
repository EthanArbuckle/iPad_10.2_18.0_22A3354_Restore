@implementation RPStatusSubscriber

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPStatusSubscriber)init
{
  RPStatusSubscriber *v2;
  RPStatusSubscriber *v3;
  RPSignedInUserProvider *v4;
  RPSignedInUserProvider *userProvider;
  RPStatusSubscriber *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RPStatusSubscriber;
  v2 = -[RPStatusSubscriber init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v4 = objc_alloc_init(RPSignedInUserProvider);
    userProvider = v3->_userProvider;
    v3->_userProvider = v4;

    v6 = v3;
  }

  return v3;
}

- (RPStatusSubscriber)initWithCoder:(id)a3
{
  RPStatusSubscriber *v3;
  RPStatusSubscriber *v4;
  RPStatusSubscriber *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RPStatusSubscriber;
  v3 = -[RPStatusSubscriber init](&v7, sel_init, a3);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v5 = v4;
  }

  return v4;
}

- (NSString)description
{
  NSAppendPrintF();
  return (NSString *)0;
}

- (void)subscribeToStatusUpdate:(id)a3 leeway:(double)a4 configurationFlags:(unint64_t)a5 statusUpdateHandler:(id)a6 completion:(id)a7
{
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;

  v9 = a3;
  v10 = a7;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __103__RPStatusSubscriber_subscribeToStatusUpdate_leeway_configurationFlags_statusUpdateHandler_completion___block_invoke;
  block[3] = &unk_1E5F4ED48;
  v15 = v9;
  v16 = v10;
  block[4] = self;
  v12 = v9;
  v13 = v10;
  dispatch_async(dispatchQueue, block);

}

void __103__RPStatusSubscriber_subscribeToStatusUpdate_leeway_configurationFlags_statusUpdateHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "xpcStatusUpdatableSubscribeToStatus:", *(_QWORD *)(a1 + 40));

LABEL_9:
    v3 = v7;
    goto LABEL_10;
  }
  v3 = (void *)v2;
  if (gLogCategory_StatusSubscriber <= 60)
  {
    if (gLogCategory_StatusSubscriber != -1 || (v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      LogPrintF();
      v3 = v7;
    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)unsubscribeToStatusUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RPStatusSubscriber_unsubscribeToStatusUpdate_completion___block_invoke;
  block[3] = &unk_1E5F4ED48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __59__RPStatusSubscriber_unsubscribeToStatusUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v2;
  if (!v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteObjectProxy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "xpcStatusUpdatableUnsubscribeToStatus:", *(_QWORD *)(a1 + 40));

LABEL_9:
    v3 = v7;
    goto LABEL_10;
  }
  v3 = (void *)v2;
  if (gLogCategory_StatusSubscriber <= 60)
  {
    if (gLogCategory_StatusSubscriber != -1 || (v5 = _LogCategory_Initialize(), v3 = v7, v5))
    {
      LogPrintF();
      v3 = v7;
    }
  }
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  RPStatusSubscriber *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__RPStatusSubscriber_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E5F4ED70;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __45__RPStatusSubscriber_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:reactivate:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_activateWithCompletion:(id)a3 reactivate:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(id, void *);
  const char *v7;
  void *v8;
  uint64_t v9;
  NSXPCConnection *xpcCnx;
  void (**v11)(id, void *);
  void *v12;
  void (**v13)(id, void *);
  const char *v14;
  _QWORD v15[5];
  void (**v16)(id, void *);
  BOOL v17;
  _QWORD v18[4];
  void (**v19)(id, void *);
  BOOL v20;

  v4 = a4;
  v6 = (void (**)(id, void *))a3;
  if (v4)
  {
    if (gLogCategory_StatusSubscriber > 30
      || gLogCategory_StatusSubscriber == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_14;
    }
  }
  else if (gLogCategory_StatusSubscriber > 30
         || gLogCategory_StatusSubscriber == -1 && !_LogCategory_Initialize())
  {
    goto LABEL_14;
  }
  if (self->_targetUserSession)
    v7 = "(TargetUserSession)";
  else
    v7 = "";
  v14 = v7;
  LogPrintF();
LABEL_14:
  -[RPStatusSubscriber _ensureXPCStarted](self, "_ensureXPCStarted", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (v6)
      v6[2](v6, v8);
  }
  else
  {
    v9 = MEMORY[0x1E0C809B0];
    xpcCnx = self->_xpcCnx;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke;
    v18[3] = &unk_1E5F4EED8;
    v20 = v4;
    v11 = v6;
    v19 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke_2;
    v15[3] = &unk_1E5F4F4A0;
    v17 = v4;
    v15[4] = self;
    v13 = v11;
    v16 = v13;
    objc_msgSend(v12, "xpcStatusSubscriberActivate:completion:", self, v15);

    if (v13)
      v13[2](v13, 0);

  }
}

void __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke(uint64_t a1, void *a2)
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
    if (gLogCategory_StatusSubscriber <= 60)
    {
      if (gLogCategory_StatusSubscriber != -1 || (v4 = _LogCategory_Initialize(), v3 = v7, v4))
      {
LABEL_7:
        LogPrintF();
        v3 = v7;
      }
    }
  }
  else if (gLogCategory_StatusSubscriber <= 60)
  {
    if (gLogCategory_StatusSubscriber != -1)
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

void __57__RPStatusSubscriber__activateWithCompletion_reactivate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "getIdentifier");

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    objc_sync_exit(v7);
    if (*(_BYTE *)(a1 + 48))
    {
      if (gLogCategory_StatusSubscriber <= 30
        && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
      {
LABEL_22:
        LogPrintF();
      }
    }
    else if (gLogCategory_StatusSubscriber <= 30
           && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_22;
    }
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
      (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
    goto LABEL_32;
  }
  if (*(_BYTE *)(a1 + 48))
  {
    if (gLogCategory_StatusSubscriber <= 60
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
LABEL_19:
      LogPrintF();
    }
  }
  else if (gLogCategory_StatusSubscriber <= 60
         && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_19;
  }
LABEL_32:

}

- (id)_ensureXPCStarted
{
  void *v2;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  unsigned int v8;
  NSXPCConnection *v9;
  NSXPCConnection *xpcCnx;
  uint64_t v12;
  _QWORD v13[5];
  _QWORD v14[5];

  if (!self->_xpcCnx)
  {
    if (self->_invalidateCalled)
    {
      RPErrorF();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      return v2;
    }
    v4 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __39__RPStatusSubscriber__ensureXPCStarted__block_invoke;
    v14[3] = &unk_1E5F4EC60;
    v14[4] = self;
    v5 = (void *)MEMORY[0x1AF45BE48](v14, a2);
    v13[0] = v4;
    v13[1] = 3221225472;
    v13[2] = __39__RPStatusSubscriber__ensureXPCStarted__block_invoke_2;
    v13[3] = &unk_1E5F4EC60;
    v13[4] = self;
    v6 = (void *)MEMORY[0x1AF45BE48](v13);
    if (-[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
      && self->_targetUserSession)
    {
      v7 = -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID");
      if (!v7)
      {
        if (gLogCategory_StatusSubscriber <= 50
          && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        RPErrorF();
        v2 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      if (gLogCategory_StatusSubscriber <= 30)
      {
        v8 = v7;
        if (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize())
        {
          v12 = v8;
          LogPrintF();
        }
      }
    }
    -[RPStatusSubscriber _connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:](self, "_connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:", self, self->_dispatchQueue, self->_userProvider, v5, v6, v12);
    v9 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v9;

    if (gLogCategory_StatusSubscriber <= 10
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v2 = 0;
LABEL_20:

    return v2;
  }
  v2 = 0;
  return v2;
}

uint64_t __39__RPStatusSubscriber__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __39__RPStatusSubscriber__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (id)_connectionWithClient:(id)a3 queue:(id)a4 userProvider:(id)a5 interruptionHandler:(id)a6 invalidationHandler:(id)a7
{
  objc_class *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  id v33;

  v30 = a5;
  v11 = (objc_class *)MEMORY[0x1E0CB3B38];
  v32 = a7;
  v31 = a6;
  v33 = a4;
  v12 = a3;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithMachServiceName:options:", CFSTR("com.apple.rapport.StatusUpdates"), 0);
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE466B8);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_xpcStatusUpdatableGiveStatusUpdate_peerDevice_currentState_statusInfo_, 1, 0);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AE18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_alloc(MEMORY[0x1E0C99E60]);
  v26 = objc_opt_class();
  v27 = (void *)objc_msgSend(v25, "initWithObjects:", v26, objc_opt_class(), 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_xpcStatusSubscriberActivate_completion_, 0, 1);

  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_xpcStatusUpdatableSubscribeToStatus_, 0, 0);
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_xpcStatusUpdatableUnsubscribeToStatus_, 0, 0);

  objc_msgSend(v13, "setExportedInterface:", v23);
  objc_msgSend(v13, "setExportedObject:", v12);

  objc_msgSend(v13, "setInterruptionHandler:", v31);
  objc_msgSend(v13, "setInvalidationHandler:", v32);

  objc_msgSend(v13, "setRemoteObjectInterface:", v24);
  objc_msgSend(v13, "_setQueue:", v33);

  if (self->_targetUserSession
    && objc_msgSend(v30, "supportsMultipleUsers")
    && objc_msgSend(v30, "signedInUserID"))
  {
    objc_msgSend(v13, "_setTargetUserIdentifier:", objc_msgSend(v30, "signedInUserID"));
  }
  objc_msgSend(v13, "resume");

  return v13;
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_StatusSubscriber <= 50
    && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_activateCalled)
    -[RPStatusSubscriber _activateWithCompletion:reactivate:](self, "_activateWithCompletion:reactivate:", 0, 1);
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
  block[2] = __32__RPStatusSubscriber_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__RPStatusSubscriber_invalidate__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 9))
  {
    v2 = result;
    *(_BYTE *)(v1 + 9) = 1;
    if (gLogCategory_StatusSubscriber <= 30
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(*(_QWORD *)(v2 + 32) + 24), "invalidate");
    return objc_msgSend(*(id *)(v2 + 32), "_invalidated");
  }
  return result;
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id interruptionHandler;
  id v5;
  NSMutableDictionary *devices;
  NSMutableDictionary *statusConfigurations;

  if (self->_invalidateCalled && !self->_invalidateDone && !self->_xpcCnx)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    devices = self->_devices;
    self->_devices = 0;

    statusConfigurations = self->_statusConfigurations;
    self->_statusConfigurations = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_StatusSubscriber <= 30
      && (gLogCategory_StatusSubscriber != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (void)xpcStatusUpdatableGiveStatusUpdate:(id)a3 peerDevice:(id)a4 currentState:(int)a5 statusInfo:(id)a6
{
  uint64_t v7;
  id v10;
  id v11;
  RPStatusSubscriber *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v21;

  v7 = *(_QWORD *)&a5;
  v21 = a3;
  v10 = a4;
  v11 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v12 = self;
  objc_sync_enter(v12);
  -[RPStatusSubscriber identifierFromDevice:](v12, "identifierFromDevice:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_devices, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusInfoMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v21);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusStateMap");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v21);

    -[NSMutableDictionary setObject:forKeyedSubscript:](v12->_devices, "setObject:forKeyedSubscript:", v14, v13);
    -[NSMutableDictionary objectForKeyedSubscript:](v12->_statusConfigurations, "objectForKeyedSubscript:", v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
    v14 = 0;
  }

  objc_sync_exit(v12);
  if (v13)
  {
    objc_msgSend(v18, "handler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v18, "handler");
      v20 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, id, uint64_t, id))v20)[2](v20, v21, v10, v7, v11);

    }
  }

}

- (BOOL)wantStatus:(id)a3 FromDevice:(id)a4
{
  return 1;
}

- (id)identifierFromDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "idsDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "identifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (NSMutableDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_storeStrong((id *)&self->_devices, a3);
}

- (NSMutableDictionary)statusConfigurations
{
  return self->_statusConfigurations;
}

- (void)setStatusConfigurations:(id)a3
{
  objc_storeStrong((id *)&self->_statusConfigurations, a3);
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_statusConfigurations, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_userProvider, 0);
}

@end
