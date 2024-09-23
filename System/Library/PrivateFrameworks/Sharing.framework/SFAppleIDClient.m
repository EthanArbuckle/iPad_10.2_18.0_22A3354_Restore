@implementation SFAppleIDClient

- (SFAppleIDClient)init
{
  SFAppleIDClient *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFAppleIDClient;
  v2 = -[SFAppleIDClient init](&v6, sel_init);
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
  OS_dispatch_queue *dispatchQueue;
  id interruptionHandler;
  id invalidationHandler;
  SFAppleIDClient *v6;
  SEL v7;
  objc_super v8;

  if (self->_xpcCnx)
  {
    v6 = (SFAppleIDClient *)FatalErrorF();
    -[SFAppleIDClient invalidate](v6, v7);
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    if (dispatchQueue)
    {
      self->_dispatchQueue = 0;

    }
    interruptionHandler = self->_interruptionHandler;
    self->_interruptionHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    v8.receiver = self;
    v8.super_class = (Class)SFAppleIDClient;
    -[SFAppleIDClient dealloc](&v8, sel_dealloc);
  }
}

- (void)invalidate
{
  SFAppleIDClient *v2;
  NSXPCConnection *syncXPCCnx;
  NSXPCConnection *v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  syncXPCCnx = v2->_syncXPCCnx;
  if (syncXPCCnx)
  {
    -[NSXPCConnection invalidate](syncXPCCnx, "invalidate");
    v4 = v2->_syncXPCCnx;
    v2->_syncXPCCnx = 0;

  }
  objc_sync_exit(v2);

  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__SFAppleIDClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__SFAppleIDClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;
  NSXPCConnection *xpcAuthCnx;
  NSXPCConnection *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFAppleIDClient <= 30
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v4 = self->_xpcCnx;
      self->_xpcCnx = 0;

      xpcAuthCnx = self->_xpcAuthCnx;
      if (!xpcAuthCnx)
        return;
    }
    else
    {
      xpcAuthCnx = self->_xpcAuthCnx;
      if (!xpcAuthCnx)
      {
        -[SFAppleIDClient _invalidated](self, "_invalidated");
        return;
      }
    }
    -[NSXPCConnection invalidate](xpcAuthCnx, "invalidate");
    v6 = self->_xpcAuthCnx;
    self->_xpcAuthCnx = 0;

  }
}

- (void)_ensureXPCStarted
{
  NSXPCConnection *v3;
  NSXPCConnection *xpcCnx;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    v3 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v3;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __36__SFAppleIDClient__ensureXPCStarted__block_invoke;
    v8[3] = &unk_1E482DF78;
    v8[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __36__SFAppleIDClient__ensureXPCStarted__block_invoke_2;
    v7[3] = &unk_1E482DF78;
    v7[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB988);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFAppleIDClient <= 10
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

uint64_t __36__SFAppleIDClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __36__SFAppleIDClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)ensureSyncXPCStarted
{
  SFAppleIDClient *v2;
  uint64_t v3;
  NSXPCConnection *syncXPCCnx;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_syncXPCCnx)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    syncXPCCnx = v2->_syncXPCCnx;
    v2->_syncXPCCnx = (NSXPCConnection *)v3;

    v5 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke;
    v8[3] = &unk_1E482DF78;
    v8[4] = v2;
    -[NSXPCConnection setInterruptionHandler:](v2->_syncXPCCnx, "setInterruptionHandler:", v8);
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_3;
    v7[3] = &unk_1E482DF78;
    v7[4] = v2;
    -[NSXPCConnection setInvalidationHandler:](v2->_syncXPCCnx, "setInvalidationHandler:", v7);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DB988);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v2->_syncXPCCnx, "setRemoteObjectInterface:", v6);

    -[NSXPCConnection resume](v2->_syncXPCCnx, "resume");
    if (gLogCategory_SFAppleIDClient <= 10
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  objc_sync_exit(v2);

}

void __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_2;
  block[3] = &unk_1E482DF78;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

void __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_4;
  block[3] = &unk_1E482DF78;
  block[4] = v1;
  dispatch_async(v2, block);
}

uint64_t __39__SFAppleIDClient_ensureSyncXPCStarted__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_ensureAuthXPCStarted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
}

- (void)_interrupted
{
  void (**interruptionHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFAppleIDClient <= 50
    && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  interruptionHandler = (void (**)(void))self->_interruptionHandler;
  if (interruptionHandler)
    interruptionHandler[2]();
}

- (void)_invalidated
{
  void (**invalidationHandler)(void);
  id interruptionHandler;
  id v5;
  NSXPCConnection *xpcCnx;
  NSXPCConnection *xpcAuthCnx;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFAppleIDClient <= 50
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
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

    xpcAuthCnx = self->_xpcAuthCnx;
    self->_xpcAuthCnx = 0;

    self->_invalidateDone = 1;
    if (gLogCategory_SFAppleIDClient <= 10
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
}

- (id)syncRemoteProxyWithError:(id *)a3
{
  SFAppleIDClient *v4;
  NSXPCConnection *syncXPCCnx;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v4 = self;
  objc_sync_enter(v4);
  syncXPCCnx = v4->_syncXPCCnx;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SFAppleIDClient_syncRemoteProxyWithError___block_invoke;
  v8[3] = &unk_1E482F300;
  v8[4] = &v9;
  -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:](syncXPCCnx, "synchronousRemoteObjectProxyWithErrorHandler:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v4);

  if (a3 && !v6)
    *a3 = objc_retainAutorelease((id)v10[5]);
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __44__SFAppleIDClient_syncRemoteProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)copyCertificateForAppleID:(id)a3 withCompletion:(id)a4
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
  block[2] = __60__SFAppleIDClient_copyCertificateForAppleID_withCompletion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __60__SFAppleIDClient_copyCertificateForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copyCertificateForAppleID:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_copyCertificateForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  os_activity_scope_state_s state;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFAppleIDClient/copyCertificateForAppleID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6 && v7)
  {
    -[SFAppleIDClient _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke;
    v21[3] = &unk_1E482E490;
    v11 = v7;
    v22 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke_2;
    v19[3] = &unk_1E482F328;
    v20 = v11;
    objc_msgSend(v12, "accountForAppleID:withCompletion:", v6, v19);

    v13 = v22;
  }
  else
  {
    if (!v7)
      goto LABEL_5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v15;
    v16 = CFSTR("?");
    if (v15)
      v16 = (const __CFString *)v15;
    v25[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6705, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

  }
LABEL_5:
  os_activity_scope_leave(&state);

}

uint64_t __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __61__SFAppleIDClient__copyCertificateForAppleID_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code"))
  {
    v10 = v6;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "identity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "copyCertificate");

        if (v9)
        {
          v10 = 0;
          goto LABEL_6;
        }
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2F90];
        v27 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v25 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v25;
        v26 = CFSTR("?");
        if (v25)
          v26 = (const __CFString *)v25;
        v28 = v26;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 201203;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2F90];
        v29 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v23 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v23;
        v24 = CFSTR("?");
        if (v23)
          v24 = (const __CFString *)v23;
        v30 = v24;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 201205;
      }
      v18 = v21;
      v19 = v22;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2F90];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("?");
      if (v14)
        v16 = (const __CFString *)v14;
      v32[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v12;
      v19 = v13;
      v20 = 201202;
    }
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v20, v17);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = 0;
LABEL_6:
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);

}

- (void)copyIdentityForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *dispatchQueue;
  uint64_t v9;
  void *v10;
  _QWORD block[5];
  id v12;
  void (**v13)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (gSDAppleIDAgent)
  {
    if (gLogCategory_SFAppleIDClient <= 90
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9 = objc_msgSend((id)gSDAppleIDAgent, "copyIdentityForAppleID:", v6);
    if (v9)
    {
      v7[2](v7, v9, 0);
    }
    else
    {
      NSErrorF();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v10);

    }
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__SFAppleIDClient_copyIdentityForAppleID_withCompletion___block_invoke;
    block[3] = &unk_1E482D2B8;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(dispatchQueue, block);

  }
}

uint64_t __57__SFAppleIDClient_copyIdentityForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_copyIdentityForAppleID:withCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_copyIdentityForAppleID:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  os_activity_scope_state_s state;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFAppleIDClient/copyIdentityForAppleID", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v6 && v7)
  {
    -[SFAppleIDClient _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke;
    v21[3] = &unk_1E482E490;
    v11 = v7;
    v22 = v11;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472;
    v19[2] = __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke_2;
    v19[3] = &unk_1E482F328;
    v20 = v11;
    objc_msgSend(v12, "accountForAppleID:withCompletion:", v6, v19);

    v13 = v22;
  }
  else
  {
    if (!v7)
      goto LABEL_5;
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v15;
    v16 = CFSTR("?");
    if (v15)
      v16 = (const __CFString *)v15;
    v25[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6705, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

  }
LABEL_5:
  os_activity_scope_leave(&state);

}

uint64_t __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SFAppleIDClient__copyIdentityForAppleID_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  const __CFString **v26;
  uint64_t *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code"))
  {
    v10 = v6;
  }
  else
  {
    if (v5)
    {
      objc_msgSend(v5, "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v5, "identity");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "copyIdentity");

        if (v9)
        {
          v10 = 0;
          goto LABEL_6;
        }
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2F90];
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v28 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v28;
        v29 = CFSTR("?");
        if (v28)
          v29 = (const __CFString *)v28;
        v31 = v29;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v31;
        v27 = &v30;
      }
      else
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0CB2F90];
        v32 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v23 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v23;
        v24 = CFSTR("?");
        if (v23)
          v24 = (const __CFString *)v23;
        v33 = v24;
        v25 = (void *)MEMORY[0x1E0C99D80];
        v26 = &v33;
        v27 = &v32;
      }
      objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v21;
      v20 = v22;
      v18 = 201205;
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v13 = *MEMORY[0x1E0CB2F90];
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      v16 = CFSTR("?");
      if (v14)
        v16 = (const __CFString *)v14;
      v35[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 201202;
      v19 = v12;
      v20 = v13;
    }
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", v20, v18, v17);
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = 0;
LABEL_6:
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id))(v11 + 16))(v11, v9, v10);

}

- (__SecIdentity)copyIdentityForAppleID:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id *v10;
  __SecIdentity *v11;
  _QWORD v13[6];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = (id *)&v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  if (!v6)
    goto LABEL_4;
  if (!gSDAppleIDAgent)
  {
    -[SFAppleIDClient ensureSyncXPCStarted](self, "ensureSyncXPCStarted");
    v10 = v20;
    obj = v20[5];
    -[SFAppleIDClient syncRemoteProxyWithError:](self, "syncRemoteProxyWithError:", &obj);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v10 + 5, obj);
    if (v9)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__SFAppleIDClient_copyIdentityForAppleID_error___block_invoke;
      v13[3] = &unk_1E482F350;
      v13[4] = &v19;
      v13[5] = &v15;
      objc_msgSend(v9, "accountForAppleID:withCompletion:", v6, v13);
    }
    goto LABEL_7;
  }
  v7 = objc_msgSend((id)gSDAppleIDAgent, "copyIdentityForAppleID:", v6);
  v16[3] = v7;
  if (!v7)
  {
LABEL_4:
    NSErrorF();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v20[5];
    v20[5] = (id)v8;
LABEL_7:

  }
  v11 = (__SecIdentity *)v16[3];
  if (a4 && !v11)
  {
    *a4 = objc_retainAutorelease(v20[5]);
    v11 = (__SecIdentity *)v16[3];
  }
  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v11;
}

void __48__SFAppleIDClient_copyIdentityForAppleID_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
    goto LABEL_5;
  }
  if (!v5)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2F90];
    v34 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("?");
    if (v11)
      v13 = (const __CFString *)v11;
    v35[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 201202;
    v16 = v9;
    v17 = v10;
    goto LABEL_17;
  }
  objc_msgSend(v5, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2F90];
    v32 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v20 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v20;
    v21 = CFSTR("?");
    if (v20)
      v21 = (const __CFString *)v20;
    v33 = v21;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v33;
    v24 = &v32;
    goto LABEL_16;
  }
  objc_msgSend(v5, "identity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v8, "copyIdentity");

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2F90];
    v30 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v25 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v25;
    v26 = CFSTR("?");
    if (v25)
      v26 = (const __CFString *)v25;
    v31 = v26;
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v31;
    v24 = &v30;
LABEL_16:
    objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    v17 = v19;
    v15 = 201205;
LABEL_17:
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, v15, v14);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

  }
LABEL_5:

}

- (void)myAccountWithCompletion:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  NSObject *dispatchQueue;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  if (gSDAppleIDAgent)
  {
    if (gLogCategory_SFAppleIDClient <= 90
      && (gLogCategory_SFAppleIDClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend((id)gSDAppleIDAgent, "myAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      ((void (**)(_QWORD, void *, _QWORD))v5)[2](v5, v7, 0);
    }
    else
    {
      NSErrorF();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, _QWORD, void *))v5)[2](v5, 0, v8);

    }
  }
  else
  {
    dispatchQueue = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__SFAppleIDClient_myAccountWithCompletion___block_invoke;
    v9[3] = &unk_1E482DFC8;
    v9[4] = self;
    v10 = v4;
    dispatch_async(dispatchQueue, v9);

  }
}

uint64_t __43__SFAppleIDClient_myAccountWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_myAccountWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_myAccountWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSXPCConnection *xpcCnx;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFAppleIDClient/myAccountWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    -[SFAppleIDClient _ensureXPCStarted](self, "_ensureXPCStarted");
    xpcCnx = self->_xpcCnx;
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__SFAppleIDClient__myAccountWithCompletion___block_invoke;
    v12[3] = &unk_1E482E490;
    v8 = v4;
    v13 = v8;
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __44__SFAppleIDClient__myAccountWithCompletion___block_invoke_2;
    v10[3] = &unk_1E482F328;
    v11 = v8;
    objc_msgSend(v9, "myAccountWithCompletion:", v10);

  }
  os_activity_scope_leave(&state);

}

uint64_t __44__SFAppleIDClient__myAccountWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __44__SFAppleIDClient__myAccountWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "code"))
  {
    v7 = v6;
  }
  else if (v5)
  {
    v7 = 0;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2F90];
    v15 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = CFSTR("?");
    if (v11)
      v13 = (const __CFString *)v11;
    v16[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, 201202, v14);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v7);

}

- (id)myAccountWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  id obj;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  id *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = (id *)&v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__0;
  v25 = __Block_byref_object_dispose__0;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  if (!gSDAppleIDAgent)
  {
    -[SFAppleIDClient ensureSyncXPCStarted](self, "ensureSyncXPCStarted");
    v9 = v22;
    obj = v22[5];
    -[SFAppleIDClient syncRemoteProxyWithError:](self, "syncRemoteProxyWithError:", &obj);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v9 + 5, obj);
    if (v8)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __38__SFAppleIDClient_myAccountWithError___block_invoke;
      v13[3] = &unk_1E482F350;
      v13[4] = &v21;
      v13[5] = &v15;
      objc_msgSend(v8, "myAccountWithCompletion:", v13);
    }
    goto LABEL_6;
  }
  objc_msgSend((id)gSDAppleIDAgent, "myAccount");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v16[5];
  v16[5] = v5;

  if (!v16[5])
  {
    NSErrorF();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v22[5];
    v22[5] = (id)v7;
LABEL_6:

  }
  v10 = (void *)v16[5];
  if (a3 && !v10)
  {
    *a3 = objc_retainAutorelease(v22[5]);
    v10 = (void *)v16[5];
  }
  v11 = v10;
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v11;
}

void __38__SFAppleIDClient_myAccountWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (objc_msgSend(v7, "code"))
  {
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v9 = a3;
    goto LABEL_4;
  }
  if (v6)
  {
    v8 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v9 = a2;
LABEL_4:
    objc_storeStrong(v8, v9);
    goto LABEL_5;
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2F90];
  v19 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("?");
  if (v12)
    v14 = (const __CFString *)v12;
  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 201202, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

LABEL_5:
}

- (void)personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
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
  block[2] = __57__SFAppleIDClient_personInfoWithEmailOrPhone_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

uint64_t __57__SFAppleIDClient_personInfoWithEmailOrPhone_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_personInfoWithEmailOrPhone:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_personInfoWithEmailOrPhone:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  id v22;
  os_activity_scope_state_s state;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFAppleIDClient/personInfoWithEmailOrPhone", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    if (v6)
    {
      -[SFAppleIDClient _ensureXPCStarted](self, "_ensureXPCStarted");
      xpcCnx = self->_xpcCnx;
      v10 = MEMORY[0x1E0C809B0];
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke;
      v21[3] = &unk_1E482E490;
      v11 = v7;
      v22 = v11;
      -[NSXPCConnection remoteObjectProxyWithErrorHandler:](xpcCnx, "remoteObjectProxyWithErrorHandler:", v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v10;
      v19[1] = 3221225472;
      v19[2] = __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke_2;
      v19[3] = &unk_1E482F378;
      v19[4] = self;
      v20 = v11;
      objc_msgSend(v12, "personInfoWithEmailOrPhone:completion:", v6, v19);

      v13 = v22;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
      v15 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v15;
      v16 = CFSTR("?");
      if (v15)
        v16 = (const __CFString *)v15;
      v25[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -6705, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v18);

    }
  }
  os_activity_scope_leave(&state);

}

uint64_t __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__SFAppleIDClient__personInfoWithEmailOrPhone_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 8));
  if (objc_msgSend(v5, "code"))
    v6 = v5;
  else
    v6 = 0;
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v8, v6);

}

- (void)authenticateAccountWithAppleID:(id)a3 password:(id)a4 completion:(id)a5
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
  v15[2] = __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke;
  v15[3] = &unk_1E482F3A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(dispatchQueue, v15);

}

void __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureAuthXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticateAccountWithAppleID:password:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __70__SFAppleIDClient_authenticateAccountWithAppleID_password_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestWithInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *dispatchQueue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFAppleIDClient/requestWithInfo", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__SFAppleIDClient_requestWithInfo_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __46__SFAppleIDClient_requestWithInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __46__SFAppleIDClient_requestWithInfo_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestWithInfo:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __46__SFAppleIDClient_requestWithInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)statusInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFAppleIDClient/statusInfoWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "statusInfoWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __44__SFAppleIDClient_statusInfoWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_xpcAuthCnx, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_syncXPCCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end
