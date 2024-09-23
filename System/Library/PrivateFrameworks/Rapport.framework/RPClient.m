@implementation RPClient

- (id)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  RPCompanionLinkClient *v13;
  SEL v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_xpcCnx)
  {
LABEL_21:
    v11 = 0;
    return v11;
  }
  if (-[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
    && self->_targetUserSession)
  {
    if (!-[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID"))
    {
      if (gLogCategory_RPClient <= 50 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
        LogPrintF();
      RPErrorF();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      return v11;
    }
    if (gLogCategory_RPClient <= 30 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  if (self->_type == 1)
  {
    -[RPClient _XPCConnectionWithMachServiceName:options:](self, "_XPCConnectionWithMachServiceName:options:", CFSTR("com.apple.rapport"), 0);
    v3 = (NSXPCConnection *)objc_claimAutoreleasedReturnValue();
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AA58);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v5);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EEE4AAB8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v7, "initWithObjects:", v8, objc_opt_class(), 0);
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_getIdentitiesWithFlags_completion_, 0, 1);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __29__RPClient__ensureXPCStarted__block_invoke;
    v21[3] = &unk_1E5F4EC60;
    v21[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v21);
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __29__RPClient__ensureXPCStarted__block_invoke_2;
    v20[3] = &unk_1E5F4EC60;
    v20[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v20);
    if (self->_targetUserSession
      && -[RPSignedInUserProvider supportsMultipleUsers](self->_userProvider, "supportsMultipleUsers")
      && -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID"))
    {
      -[NSXPCConnection _setTargetUserIdentifier:](self->_xpcCnx, "_setTargetUserIdentifier:", -[RPSignedInUserProvider signedInUserID](self->_userProvider, "signedInUserID"));
    }
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_RPClient <= 10 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    goto LABEL_21;
  }
  v13 = (RPCompanionLinkClient *)FatalErrorF();
  return -[RPCompanionLinkClient _connectionWithClient:queue:userProvider:interruptionHandler:invalidationHandler:](v13, v14, v15, v16, v17, v18, v19);
}

void __46__RPClient_getIdentitiesWithFlags_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__RPClient_getIdentitiesWithFlags_completion___block_invoke_2;
    v6[3] = &unk_1E5F4ED20;
    v7 = v3;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getIdentitiesWithFlags:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __29__RPClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

void __22__RPClient_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25)
      && gLogCategory_RPClient <= 30
      && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    if (v3)
    {
      objc_msgSend(v3, "invalidate");
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_invalidated");
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
  block[2] = __22__RPClient_invalidate__block_invoke;
  block[3] = &unk_1E5F4EC60;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (RPClient)init
{
  RPSignedInUserProvider *v3;
  RPClient *v4;

  v3 = objc_alloc_init(RPSignedInUserProvider);
  v4 = -[RPClient initWithUserProvider:](self, "initWithUserProvider:", v3);

  return v4;
}

- (RPClient)initWithUserProvider:(id)a3
{
  id v5;
  RPClient *v6;
  RPClient *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPClient;
  v6 = -[RPClient init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v7->_type = 1;
    objc_storeStrong((id *)&v7->_userProvider, a3);
  }

  return v7;
}

- (void)getIdentitiesWithFlags:(unsigned int)a3 completion:(id)a4
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
  block[2] = __46__RPClient_getIdentitiesWithFlags_completion___block_invoke;
  block[3] = &unk_1E5F4EE38;
  block[4] = self;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  NSXPCConnection *xpcCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_RPClient <= 50
      && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2]();
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_RPClient <= 10 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
}

- (id)_XPCConnectionWithMachServiceName:(id)a3 options:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;

  v5 = (objc_class *)MEMORY[0x1E0CB3B38];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithMachServiceName:options:", v6, a4);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_userProvider, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

+ (void)primaryAccountSignedIn
{
  RPClient *v2;
  _QWORD v3[5];

  if (gLogCategory_RPClient <= 30 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = objc_alloc_init(RPClient);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __34__RPClient_primaryAccountSignedIn__block_invoke;
  v3[3] = &unk_1E5F4ECD0;
  v3[4] = v2;
  -[RPClient primaryAccountSignedInWithCompletion:](v2, "primaryAccountSignedInWithCompletion:", v3);

}

void __34__RPClient_primaryAccountSignedIn__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;
  id v5;

  v5 = a2;
  if (v5)
    v3 = 90;
  else
    v3 = 30;
  if (v3 >= gLogCategory_RPClient && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    v4 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4);

}

+ (void)primaryAccountSignedOut
{
  RPClient *v2;
  _QWORD v3[5];

  if (gLogCategory_RPClient <= 30 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v2 = objc_alloc_init(RPClient);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __35__RPClient_primaryAccountSignedOut__block_invoke;
  v3[3] = &unk_1E5F4ECD0;
  v3[4] = v2;
  -[RPClient primaryAccountSignedOutWithCompletion:](v2, "primaryAccountSignedOutWithCompletion:", v3);

}

void __35__RPClient_primaryAccountSignedOut__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  id v4;
  id v5;

  v5 = a2;
  if (v5)
    v3 = 90;
  else
    v3 = 30;
  if (v3 >= gLogCategory_RPClient && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    v4 = v5;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "invalidate", v4);

}

uint64_t __29__RPClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

- (void)_interrupted
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void (**interruptionHandler)(void);
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_RPClient <= 50 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (-[NSMutableSet count](self->_assertions, "count"))
  {
    v3 = -[RPClient _ensureXPCStarted](self, "_ensureXPCStarted");
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = self->_assertions;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (gLogCategory_RPClient <= 50 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
          {
            v12 = v9;
            LogPrintF();
          }
          -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy", v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "activateAssertionWithIdentifier:", v9);

        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v6);
    }

  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)activateAssertionWithIdentifier:(id)a3
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
  v7[2] = __44__RPClient_activateAssertionWithIdentifier___block_invoke;
  v7[3] = &unk_1E5F4ECF8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __44__RPClient_activateAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activateAssertionWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)addOrUpdateIdentity:(id)a3 completion:(id)a4
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
  block[2] = __43__RPClient_addOrUpdateIdentity_completion___block_invoke;
  block[3] = &unk_1E5F4ED48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __43__RPClient_addOrUpdateIdentity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__RPClient_addOrUpdateIdentity_completion___block_invoke_2;
    v9[3] = &unk_1E5F4ED20;
    v10 = *(id *)(a1 + 48);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v3;
    v7[1] = 3221225472;
    v7[2] = __43__RPClient_addOrUpdateIdentity_completion___block_invoke_3;
    v7[3] = &unk_1E5F4ED20;
    v6 = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v5, "addOrUpdateIdentity:completion:", v6, v7);

  }
}

uint64_t __43__RPClient_addOrUpdateIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __43__RPClient_addOrUpdateIdentity_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)regenerateTemporarySelfIdentityWithCompletion:(id)a3
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
  v7[2] = __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5F4ED20;
    v10 = v3;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_3;
    v7[3] = &unk_1E5F4ED20;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "regenerateTemporarySelfIdentityWithCompletion:", v7);

  }
}

uint64_t __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __58__RPClient_regenerateTemporarySelfIdentityWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)diagnosticCommand:(id)a3 params:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
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
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __48__RPClient_diagnosticCommand_params_completion___block_invoke;
  v15[3] = &unk_1E5F4EDC0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

void __48__RPClient_diagnosticCommand_params_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __48__RPClient_diagnosticCommand_params_completion___block_invoke_2;
    v10[3] = &unk_1E5F4ED20;
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    v8[0] = v3;
    v8[1] = 3221225472;
    v8[2] = __48__RPClient_diagnosticCommand_params_completion___block_invoke_3;
    v8[3] = &unk_1E5F4ED98;
    v9 = *(id *)(a1 + 56);
    objc_msgSend(v5, "diagnosticCommand:params:completion:", v6, v7, v8);

  }
}

uint64_t __48__RPClient_diagnosticCommand_params_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __48__RPClient_diagnosticCommand_params_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)diagnosticLogControl:(id)a3 completion:(id)a4
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
  block[2] = __44__RPClient_diagnosticLogControl_completion___block_invoke;
  block[3] = &unk_1E5F4ED48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __44__RPClient_diagnosticLogControl_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__RPClient_diagnosticLogControl_completion___block_invoke_2;
    v12[3] = &unk_1E5F4ED20;
    v13 = *(id *)(a1 + 48);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __44__RPClient_diagnosticLogControl_completion___block_invoke_3;
    v10[3] = &unk_1E5F4EDE8;
    v9 = *(_QWORD *)(a1 + 40);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v8, "diagnosticLogControl:completion:", v9, v10);

  }
}

void __44__RPClient_diagnosticLogControl_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __44__RPClient_diagnosticLogControl_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    else
    {
      NSPrintF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    v4 = v7;
  }

}

- (void)diagnosticShow:(id)a3 level:(int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int v16;

  v8 = a3;
  v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__RPClient_diagnosticShow_level_completion___block_invoke;
  v13[3] = &unk_1E5F4EE10;
  v14 = v8;
  v15 = v9;
  v13[4] = self;
  v16 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(dispatchQueue, v13);

}

void __44__RPClient_diagnosticShow_level_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v2, "description");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44__RPClient_diagnosticShow_level_completion___block_invoke_2;
    v13[3] = &unk_1E5F4ED20;
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned int *)(a1 + 56);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __44__RPClient_diagnosticShow_level_completion___block_invoke_3;
    v11[3] = &unk_1E5F4EDE8;
    v10 = *(_QWORD *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v8, "diagnosticShow:level:completion:", v10, v9, v11);

  }
}

void __44__RPClient_diagnosticShow_level_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    NSPrintF();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

void __44__RPClient_diagnosticShow_level_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v7 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
    }
    else
    {
      NSPrintF();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

    }
    v4 = v7;
  }

}

- (void)getIdentitiesWithCompletion:(id)a3
{
  -[RPClient getIdentitiesWithFlags:completion:](self, "getIdentitiesWithFlags:completion:", 11, a3);
}

uint64_t __46__RPClient_getIdentitiesWithFlags_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)primaryAccountSignedInWithCompletion:(id)a3
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
  v7[2] = __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5F4ED20;
    v10 = v3;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_3;
    v7[3] = &unk_1E5F4ED20;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "primaryAccountSignedInWithCompletion:", v7);

  }
}

uint64_t __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __49__RPClient_primaryAccountSignedInWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)primaryAccountSignedOutWithCompletion:(id)a3
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
  v7[2] = __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke;
  v7[3] = &unk_1E5F4ED70;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_2;
    v9[3] = &unk_1E5F4ED20;
    v10 = v3;
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_3;
    v7[3] = &unk_1E5F4ED20;
    v8 = *(id *)(a1 + 40);
    objc_msgSend(v6, "primaryAccountSignedOutWithCompletion:", v7);

  }
}

uint64_t __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __50__RPClient_primaryAccountSignedOutWithCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)clientCreateDeviceMappingInternal:(int)a3 applicationService:(id)a4 deviceID:(id)a5 endpointID:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *dispatchQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  RPClient *v24;
  id v25;
  id v26;
  int v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  dispatchQueue = self->_dispatchQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke;
  v21[3] = &unk_1E5F4EE88;
  v22 = v12;
  v23 = v13;
  v25 = v14;
  v26 = v15;
  v27 = a3;
  v24 = self;
  v17 = v14;
  v18 = v15;
  v19 = v13;
  v20 = v12;
  dispatch_async(dispatchQueue, v21);

}

void __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  if (gLogCategory_RPClient <= 40 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 48), "_ensureXPCStarted", v10, v11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    v3 = MEMORY[0x1E0C809B0];
    v4 = *(void **)(*(_QWORD *)(a1 + 48) + 40);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_2;
    v14[3] = &unk_1E5F4ED20;
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(unsigned int *)(a1 + 72);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v12[0] = v3;
    v12[1] = 3221225472;
    v12[2] = __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_3;
    v12[3] = &unk_1E5F4EE60;
    v9 = *(_QWORD *)(a1 + 56);
    v13 = *(id *)(a1 + 64);
    objc_msgSend(v5, "serverCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:", v6, v7, v8, v9, v12);

  }
}

uint64_t __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, 0, a2);
  return result;
}

uint64_t __96__RPClient_clientCreateDeviceMappingInternal_applicationService_deviceID_endpointID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)createEndpointToDeviceMapping:(id)a3 deviceID:(id)a4 endpointID:(id)a5 completion:(id)a6
{
  -[RPClient clientCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:](self, "clientCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:", 0, a3, a4, a5, a6);
}

- (void)createDeviceToListenerMapping:(id)a3 deviceID:(id)a4 completion:(id)a5
{
  -[RPClient clientCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:](self, "clientCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:", 1, a3, a4, 0, a5);
}

- (void)queryDeviceToListenerMapping:(id)a3 deviceID:(id)a4 completion:(id)a5
{
  -[RPClient clientCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:](self, "clientCreateDeviceMappingInternal:applicationService:deviceID:endpointID:completion:", 2, a3, a4, 0, a5);
}

- (void)setAutoMapping:(BOOL)a3 completion:(id)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__RPClient_setAutoMapping_completion___block_invoke;
  block[3] = &unk_1E5F4EEB0;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

void __38__RPClient_setAutoMapping_completion___block_invoke(uint64_t a1)
{
  const char *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;

  if (gLogCategory_RPClient <= 40 && (gLogCategory_RPClient != -1 || _LogCategory_Initialize()))
  {
    if (*(_BYTE *)(a1 + 48))
      v2 = "yes";
    else
      v2 = "no";
    v10 = v2;
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted", v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
  else
  {
    v5 = *(void **)(a1 + 40);
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __38__RPClient_setAutoMapping_completion___block_invoke_2;
    v13[3] = &unk_1E5F4ED20;
    v14 = v5;
    objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(unsigned __int8 *)(a1 + 48);
    v11[0] = v7;
    v11[1] = 3221225472;
    v11[2] = __38__RPClient_setAutoMapping_completion___block_invoke_3;
    v11[3] = &unk_1E5F4ED20;
    v12 = *(id *)(a1 + 40);
    objc_msgSend(v8, "serverSetAutoMappingInternal:completion:", v9, v11);

  }
}

uint64_t __38__RPClient_setAutoMapping_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __38__RPClient_setAutoMapping_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removeSessionPairedIdentity:(id)a3 completion:(id)a4
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
  block[2] = __51__RPClient_removeSessionPairedIdentity_completion___block_invoke;
  block[3] = &unk_1E5F4ED48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __51__RPClient_removeSessionPairedIdentity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v2);
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __51__RPClient_removeSessionPairedIdentity_completion___block_invoke_2;
    v6[3] = &unk_1E5F4ED20;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeSessionPairedIdentity:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  }
}

uint64_t __51__RPClient_removeSessionPairedIdentity_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)targetUserSession
{
  return self->_targetUserSession;
}

- (void)setTargetUserSession:(BOOL)a3
{
  self->_targetUserSession = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (void)setType:(unsigned int)a3
{
  self->_type = a3;
}

@end
