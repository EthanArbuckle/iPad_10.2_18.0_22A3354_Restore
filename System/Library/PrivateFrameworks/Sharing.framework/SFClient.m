@implementation SFClient

- (SFClient)init
{
  SFClient *v2;
  SFClient *v3;
  uint64_t v4;
  OS_dispatch_queue *dispatchQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFClient;
  v2 = -[SFClient init](&v7, sel_init);
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
  OS_dispatch_queue *dispatchQueue;
  id interruptionHandler;
  id invalidationHandler;
  SFClient *v6;
  SEL v7;
  objc_super v8;

  if (self->_xpcCnx)
  {
    v6 = (SFClient *)FatalErrorF();
    -[SFClient invalidate](v6, v7);
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
    v8.super_class = (Class)SFClient;
    -[SFClient dealloc](&v8, sel_dealloc);
  }
}

- (void)invalidate
{
  SFClient *v2;
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
  block[2] = __22__SFClient_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
}

uint64_t __22__SFClient_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  NSXPCConnection *xpcCnx;
  NSXPCConnection *v4;
  id wristStateMonitorCompletionHandler;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (!self->_invalidateDone
      && gLogCategory_SFClient <= 30
      && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpcCnx = self->_xpcCnx;
    if (xpcCnx)
    {
      -[NSXPCConnection invalidate](xpcCnx, "invalidate");
      v4 = self->_xpcCnx;
      self->_xpcCnx = 0;

    }
    else
    {
      -[SFClient _invalidated](self, "_invalidated");
    }
    wristStateMonitorCompletionHandler = self->_wristStateMonitorCompletionHandler;
    self->_wristStateMonitorCompletionHandler = 0;

  }
}

- (void)activateAssertionWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[4];
  id v9;
  SFClient *v10;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/activateAssertionWithIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__SFClient_activateAssertionWithIdentifier___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __44__SFClient_activateAssertionWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("com.apple.sharing.EnhancedDiscovery")))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 16))
    {
      if (gLogCategory_SFClient <= 90 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
        LogPrintF();
      return;
    }
    if (gLogCategory_SFClient <= 30 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    *(_BYTE *)(*(_QWORD *)(a1 + 40) + 16) = 1;
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 8);
    *(_QWORD *)(v4 + 8) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  }
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "remoteObjectProxy");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateAssertionWithIdentifier:", *(_QWORD *)(a1 + 32));

}

- (void)activityStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/activityStateWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__SFClient_activityStateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __40__SFClient_activityStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__SFClient_activityStateWithCompletion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityStateWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __40__SFClient_activityStateWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)appleIDInfoWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/appleIDInfoWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SFClient_appleIDInfoWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __38__SFClient_appleIDInfoWithCompletion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleIDInfoWithCompletion:", *(_QWORD *)(a1 + 40));

}

- (void)subCredentialPresentCardWithParams:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/subCredentialPresentCardWithParams", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subCredentialPresentCardWithParams:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __58__SFClient_subCredentialPresentCardWithParams_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)clearXPCHelperImageCacheWithCompletion:(id)a3
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
  v7[2] = __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke;
  v7[3] = &unk_1E482DFC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

void __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearXPCHelperImageCacheWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __51__SFClient_clearXPCHelperImageCacheWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)broadwayPresentCardWithCode:(id)a3 options:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/broadwayPresentCardWithCode", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke;
  v16[3] = &unk_1E482F3A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "broadwayPresentCardWithCode:options:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __59__SFClient_broadwayPresentCardWithCode_options_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)contactIDForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/contactIDForEmailHash", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke;
  v16[3] = &unk_1E482F3A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contactIDForEmailHash:phoneHash:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __55__SFClient_contactIDForEmailHash_phoneHash_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)displayNameForEmailHash:(id)a3 phoneHash:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/displayNameForEmailHash", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke;
  v16[3] = &unk_1E482F3A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameForEmailHash:phoneHash:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __57__SFClient_displayNameForEmailHash_phoneHash_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)displayStringForContactIdentifier:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/displayStringForContactIdentifier", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke;
  v16[3] = &unk_1E482F3A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayStringForContactIdentifier:deviceIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

uint64_t __74__SFClient_displayStringForContactIdentifier_deviceIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)displayStringForContactIdentifierSync:(id)a3 deviceIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/displayStringForContactIdentifierSync", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  -[SFClient ensureSyncXPCStarted](self, "ensureSyncXPCStarted");
  v14 = 0;
  -[SFClient syncRemoteProxyWithError:](self, "syncRemoteProxyWithError:", &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v14;
  if (v12)
    objc_msgSend(v12, "displayStringForContactIdentifier:deviceIdentifier:completion:", v8, v9, v10);
  else
    (*((void (**)(id, _QWORD, _QWORD, id))v10 + 2))(v10, 0, 0, v13);

  os_activity_scope_leave(&state);
}

- (void)ensureSyncXPCStarted
{
  SFClient *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSXPCConnection *syncXPCCnx;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_syncXPCCnx)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBD48);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getPeopleSuggestions_completion_, 0, 1);

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    syncXPCCnx = v2->_syncXPCCnx;
    v2->_syncXPCCnx = (NSXPCConnection *)v7;

    -[NSXPCConnection _setQueue:](v2->_syncXPCCnx, "_setQueue:", v2->_dispatchQueue);
    v9 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __32__SFClient_ensureSyncXPCStarted__block_invoke;
    v11[3] = &unk_1E482DF78;
    v11[4] = v2;
    -[NSXPCConnection setInterruptionHandler:](v2->_syncXPCCnx, "setInterruptionHandler:", v11);
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __32__SFClient_ensureSyncXPCStarted__block_invoke_2;
    v10[3] = &unk_1E482DF78;
    v10[4] = v2;
    -[NSXPCConnection setInvalidationHandler:](v2->_syncXPCCnx, "setInvalidationHandler:", v10);
    -[NSXPCConnection setRemoteObjectInterface:](v2->_syncXPCCnx, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection resume](v2->_syncXPCCnx, "resume");
    if (gLogCategory_SFClient <= 10 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
  objc_sync_exit(v2);

}

uint64_t __32__SFClient_ensureSyncXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __32__SFClient_ensureSyncXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)findContact:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/findContact", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__SFClient_findContact_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __35__SFClient_findContact_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findContact:skipIfContactBlocked:completion:", *(_QWORD *)(a1 + 40), 1, *(_QWORD *)(a1 + 48));

}

- (void)findContact:(id)a3 skipIfContactBlocked:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/findContact", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __56__SFClient_findContact_skipIfContactBlocked_completion___block_invoke;
  v14[3] = &unk_1E4831200;
  v14[4] = self;
  v15 = v8;
  v17 = a4;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

void __56__SFClient_findContact_skipIfContactBlocked_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findContact:skipIfContactBlocked:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

- (void)getDeviceAssets:(id)a3 completion:(id)a4
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
  block[2] = __39__SFClient_getDeviceAssets_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(dispatchQueue, block);

}

void __39__SFClient_getDeviceAssets_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getDeviceAssets:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)getPeopleSuggestions:(id)a3 completion:(id)a4
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
  block[2] = __44__SFClient_getPeopleSuggestions_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(dispatchQueue, block);

}

void __44__SFClient_getPeopleSuggestions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__SFClient_getPeopleSuggestions_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPeopleSuggestions:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __44__SFClient_getPeopleSuggestions_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getPairedWatchWristStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/getPairedWatchWristStateWithCompletionHandler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SFClient_getPairedWatchWristStateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __58__SFClient_getPairedWatchWristStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPairedWatchWristStateWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

- (void)monitorPairedWatchWristStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/monitorPairedWatchWristStateWithCompletionHandler", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SFClient_monitorPairedWatchWristStateWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __62__SFClient_monitorPairedWatchWristStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginMonitoringPairedWatchWristState");

}

- (void)getProblemFlagsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/getProblemFlagsWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getProblemFlagsWithCompletionHandler:", *(_QWORD *)(a1 + 40));

}

uint64_t __49__SFClient_getProblemFlagsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)hashManagerControl:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/hashManagerControl", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__SFClient_hashManagerControl_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __42__SFClient_hashManagerControl_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SFClient_hashManagerControl_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hashManagerControl:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __42__SFClient_hashManagerControl_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)openSetupURL:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/openSetupURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__SFClient_openSetupURL_completion___block_invoke;
  block[3] = &unk_1E482D2B8;
  block[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __36__SFClient_openSetupURL_completion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSetupURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)preventExitForLocaleReason:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/preventExitForLocaleReason", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SFClient_preventExitForLocaleReason___block_invoke;
  v8[3] = &unk_1E482D3A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __39__SFClient_preventExitForLocaleReason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preventExitForLocaleReason:", *(_QWORD *)(a1 + 40));

}

- (void)reenableProxCardType:(unsigned __int8)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unsigned __int8 v12;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/reenableProxCardType", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFClient_reenableProxCardType_completion___block_invoke;
  block[3] = &unk_1E482E800;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __44__SFClient_reenableProxCardType_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SFClient_reenableProxCardType_completion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reenableProxCardType:completion:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __44__SFClient_reenableProxCardType_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)repairDevice:(id)a3 completion:(id)a4
{
  -[SFClient repairDevice:flags:completion:](self, "repairDevice:flags:completion:", a3, 0, a4);
}

- (void)repairDevice:(id)a3 flags:(unsigned int)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SFClient *v16;
  id v17;
  unsigned int v18;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/repairDevice", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __42__SFClient_repairDevice_flags_completion___block_invoke;
  v14[3] = &unk_1E4831C00;
  v18 = a4;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  dispatch_async(dispatchQueue, v14);

  os_activity_scope_leave(&state);
}

void __42__SFClient_repairDevice_flags_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;

  if (gLogCategory_SFClient <= 30 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
  {
    v6 = &unk_1A2AF7C9D;
    v7 = *(_QWORD *)(a1 + 32);
    v5 = *(unsigned int *)(a1 + 56);
    LogPrintF();
  }
  objc_msgSend(*(id *)(a1 + 40), "_ensureXPCStarted", v5, v6, v7);
  v2 = *(void **)(a1 + 48);
  v3 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__SFClient_repairDevice_flags_completion___block_invoke_2;
  v8[3] = &unk_1E482E490;
  v9 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "repairDevice:flags:completion:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

uint64_t __42__SFClient_repairDevice_flags_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retriggerProximityPairing:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/retriggerProximityPairing", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __38__SFClient_retriggerProximityPairing___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __38__SFClient_retriggerProximityPairing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__SFClient_retriggerProximityPairing___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retriggerProximityPairing:", *(_QWORD *)(a1 + 40));

}

uint64_t __38__SFClient_retriggerProximityPairing___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)retriggerProximitySetup:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/retriggerProximitySetup", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SFClient_retriggerProximitySetup___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __36__SFClient_retriggerProximitySetup___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__SFClient_retriggerProximitySetup___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "retriggerProximitySetup:", *(_QWORD *)(a1 + 40));

}

uint64_t __36__SFClient_retriggerProximitySetup___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setAudioRoutingScore:(int)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  int v12;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/setAudioRoutingScore", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SFClient_setAudioRoutingScore_completion___block_invoke;
  block[3] = &unk_1E4831C28;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __44__SFClient_setAudioRoutingScore_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__SFClient_setAudioRoutingScore_completion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAudioRoutingScore:completion:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __44__SFClient_setAudioRoutingScore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupDevice:(id)a3 home:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *dispatchQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/setupDevice", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __40__SFClient_setupDevice_home_completion___block_invoke;
  v16[3] = &unk_1E482F3A0;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  dispatch_async(dispatchQueue, v16);

  os_activity_scope_leave(&state);
}

void __40__SFClient_setupDevice_home_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__SFClient_setupDevice_home_completion___block_invoke_2;
  v6[3] = &unk_1E482E490;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupDevice:homeIdentifier:completion:", v4, v5, *(_QWORD *)(a1 + 56));

}

uint64_t __40__SFClient_setupDevice_home_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)showDevicePickerWithInfo:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/showDevicePickerWithInfo", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__SFClient_showDevicePickerWithInfo_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __48__SFClient_showDevicePickerWithInfo_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __48__SFClient_showDevicePickerWithInfo_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showDevicePickerWithInfo:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __48__SFClient_showDevicePickerWithInfo_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)syncRemoteProxyWithError:(id *)a3
{
  SFClient *v4;
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
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v4 = self;
  objc_sync_enter(v4);
  syncXPCCnx = v4->_syncXPCCnx;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__SFClient_syncRemoteProxyWithError___block_invoke;
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

void __37__SFClient_syncRemoteProxyWithError___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)testContinuityKeyboardBegin:(BOOL)a3
{
  NSObject *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  BOOL v8;
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/testContinuityKeyboardBegin", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__SFClient_testContinuityKeyboardBegin___block_invoke;
  v7[3] = &unk_1E482E4B8;
  v7[4] = self;
  v8 = a3;
  dispatch_async(dispatchQueue, v7);
  os_activity_scope_leave(&state);

}

void __40__SFClient_testContinuityKeyboardBegin___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "remoteObjectProxy");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "testContinuityKeyboardBegin:", *(unsigned __int8 *)(a1 + 40));

}

- (void)triggerHomeKitDeviceDetectedWithURL:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/triggerHomeKitDeviceDetectedWithURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerHomeKitDeviceDetectedWithURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __59__SFClient_triggerHomeKitDeviceDetectedWithURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)triggerProximityAutoFillDetectedWithURL:(id)a3 completion:(id)a4
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
  v8 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/triggerProximityAutoFillDetectedWithURL", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke;
  block[3] = &unk_1E482F3C8;
  v13 = v6;
  v14 = v7;
  block[4] = self;
  v10 = v6;
  v11 = v7;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke_2;
  v4[3] = &unk_1E482E490;
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "triggerProximityAutoFillDetectedWithURL:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

uint64_t __63__SFClient_triggerProximityAutoFillDetectedWithURL_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)wifiPasswordSharingAvailabilityWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/wifiPasswordSharingAvailabilityWithCompletion", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  dispatchQueue = self->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  os_activity_scope_leave(&state);
}

void __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wifiPasswordSharingAvailabilityWithCompletion:", *(_QWORD *)(a1 + 40));

}

uint64_t __58__SFClient_wifiPasswordSharingAvailabilityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)startProxCardTransactionWithOptions:(unint64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *dispatchQueue;
  id v9;
  _QWORD block[5];
  id v11;
  unint64_t v12;
  os_activity_scope_state_s state;

  v6 = a4;
  v7 = _os_activity_create(&dword_1A2830000, "Sharing/SFClient/startProxCardTransactionWithOptions", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v7, &state);
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke;
  block[3] = &unk_1E48309B0;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v9 = v6;
  dispatch_async(dispatchQueue, block);

  os_activity_scope_leave(&state);
}

void __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_ensureXPCStarted");
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke_2;
  v5[3] = &unk_1E482E490;
  v6 = v2;
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startProxCardTransactionWithOptions:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));

}

uint64_t __59__SFClient_startProxCardTransactionWithOptions_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)pairedWatchWristStateChanged:(int64_t)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[6];

  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41__SFClient_pairedWatchWristStateChanged___block_invoke;
  v4[3] = &unk_1E482E018;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

void __41__SFClient_pairedWatchWristStateChanged___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  __CFString *v4;
  __CFString *v5;
  void (**v6)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "wristStateMonitorCompletionHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (gLogCategory_SFClient <= 40 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
    {
      v3 = *(_QWORD *)(a1 + 40);
      if (v3 >= 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Undefined state (%ld)"), *(_QWORD *)(a1 + 40));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = off_1E4831C48[v3];
      }
      v5 = v4;
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "wristStateMonitorCompletionHandler", v5);
    v6 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, *(_QWORD *)(a1 + 40));

  }
}

- (void)_ensureXPCStarted
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSXPCConnection *v8;
  NSXPCConnection *xpcCnx;
  uint64_t v10;
  _QWORD v11[5];
  _QWORD v12[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_xpcCnx)
  {
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6DBD48);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0C99E60]);
    v5 = objc_opt_class();
    v6 = (void *)objc_msgSend(v4, "initWithObjects:", v5, objc_opt_class(), 0);
    objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getPeopleSuggestions_completion_, 0, 1);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE6B55E0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.SharingServices"), 0);
    xpcCnx = self->_xpcCnx;
    self->_xpcCnx = v8;

    -[NSXPCConnection _setQueue:](self->_xpcCnx, "_setQueue:", self->_dispatchQueue);
    v10 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __29__SFClient__ensureXPCStarted__block_invoke;
    v12[3] = &unk_1E482DF78;
    v12[4] = self;
    -[NSXPCConnection setInterruptionHandler:](self->_xpcCnx, "setInterruptionHandler:", v12);
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __29__SFClient__ensureXPCStarted__block_invoke_2;
    v11[3] = &unk_1E482DF78;
    v11[4] = self;
    -[NSXPCConnection setInvalidationHandler:](self->_xpcCnx, "setInvalidationHandler:", v11);
    -[NSXPCConnection setRemoteObjectInterface:](self->_xpcCnx, "setRemoteObjectInterface:", v3);
    -[NSXPCConnection setExportedObject:](self->_xpcCnx, "setExportedObject:", self);
    -[NSXPCConnection setExportedInterface:](self->_xpcCnx, "setExportedInterface:", v7);
    -[NSXPCConnection resume](self->_xpcCnx, "resume");
    if (gLogCategory_SFClient <= 10 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
      LogPrintF();

  }
}

uint64_t __29__SFClient__ensureXPCStarted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_interrupted");
}

uint64_t __29__SFClient__ensureXPCStarted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidated");
}

- (void)_interrupted
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void (**interruptionHandler)(void);
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (gLogCategory_SFClient <= 50 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (-[NSMutableSet count](self->_assertions, "count"))
  {
    -[SFClient _ensureXPCStarted](self, "_ensureXPCStarted");
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = self->_assertions;
    v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (gLogCategory_SFClient <= 50 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
          {
            v11 = v8;
            LogPrintF();
          }
          -[NSXPCConnection remoteObjectProxy](self->_xpcCnx, "remoteObjectProxy", v11);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "activateAssertionWithIdentifier:", v8);

        }
        v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v5);
    }

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

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_invalidateDone)
  {
    if (!self->_invalidateCalled
      && gLogCategory_SFClient <= 50
      && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
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
    if (gLogCategory_SFClient <= 10 && (gLogCategory_SFClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
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

- (id)wristStateMonitorCompletionHandler
{
  return self->_wristStateMonitorCompletionHandler;
}

- (void)setWristStateMonitorCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_wristStateMonitorCompletionHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_syncXPCCnx, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
