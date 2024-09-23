@implementation SBSKeyboardFocusService

void __61__SBSKeyboardFocusService_systemKeyCommandOverlayEnvironment__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D00CA8], "environmentWithIdentifier:", CFSTR("systemKeyCommandOverlay"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)systemKeyCommandOverlayEnvironment___keyCommandOverlayEnvironment;
  systemKeyCommandOverlayEnvironment___keyCommandOverlayEnvironment = v0;

}

+ (BKSHIDEventDeferringEnvironment)systemKeyCommandOverlayEnvironment
{
  if (systemKeyCommandOverlayEnvironment_onceToken != -1)
    dispatch_once(&systemKeyCommandOverlayEnvironment_onceToken, &__block_literal_global_27);
  return (BKSHIDEventDeferringEnvironment *)(id)systemKeyCommandOverlayEnvironment___keyCommandOverlayEnvironment;
}

- (void)dealloc
{
  BSServiceConnection *connection;
  OS_dispatch_queue *connectionQueue;
  objc_super v5;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  connectionQueue = self->_connectionQueue;
  self->_connectionQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSKeyboardFocusService;
  -[SBSKeyboardFocusService dealloc](&v5, sel_dealloc);
}

- (void)requestKeyboardFocusForSceneIdentity:(id)a3 processID:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  if (v8 && (_DWORD)v6)
  {
    -[SBSKeyboardFocusService _connection](self, "_connection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "remoteTarget");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke;
    v13[3] = &unk_1E288E840;
    v14 = v8;
    v15 = v9;
    objc_msgSend(v11, "requestKeyboardFocusForSceneIdentity:pid:completion:", v14, v12, v13);

  }
}

void __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    SBLogKeyboardFocus();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke_cold_1(a1, (uint64_t)v6, v7);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  (*(void (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(v5, "BOOLValue"));

}

- (void)removeKeyboardFocusFromSceneIdentity:(id)a3 processID:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a3)
  {
    v4 = *(_QWORD *)&a4;
    if (a4)
    {
      v6 = a3;
      -[SBSKeyboardFocusService _connection](self, "_connection");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "remoteTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeKeyboardFocusFromSceneIdentity:pid:", v6, v8);

    }
  }
}

- (id)applyAdditionalDeferringRules:(id)a3 whenSceneHasKeyboardFocus:(id)a4 processID:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  int v28;
  id location;
  id v30;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasEntitlement:", CFSTR("com.apple.springboard.keyboardfocusservice"));
  if (v9 && v11)
  {

    if ((_DWORD)v5)
    {
      v30 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v30);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v30;
      if (!v13)
      {
        objc_initWeak(&location, self);
        v18 = objc_alloc(MEMORY[0x1E0D01868]);
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "UUIDString");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __93__SBSKeyboardFocusService_applyAdditionalDeferringRules_whenSceneHasKeyboardFocus_processID___block_invoke;
        v25[3] = &unk_1E288E868;
        objc_copyWeak(&v27, &location);
        v21 = v9;
        v26 = v21;
        v28 = v5;
        v16 = (void *)objc_msgSend(v18, "initWithIdentifier:forReason:invalidationBlock:", v20, CFSTR("SBSKeyboardFocusService"), v25);

        -[SBSKeyboardFocusService _connection](self, "_connection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "remoteTarget");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v5);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deferAdditionalEnvironments:whenSceneHasKeyboardFocus:pid:", v12, v21, v24);

        objc_destroyWeak(&v27);
        objc_destroyWeak(&location);

        goto LABEL_10;
      }
      v14 = v13;
      SBLogKeyboardFocus();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[SBSKeyboardFocusService applyAdditionalDeferringRules:whenSceneHasKeyboardFocus:processID:].cold.1((uint64_t)v8, v15);

    }
  }
  else
  {

  }
  v16 = 0;
LABEL_10:

  return v16;
}

void __93__SBSKeyboardFocusService_applyAdditionalDeferringRules_whenSceneHasKeyboardFocus_processID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopApplyingAdditionalDeferringRulesWhenSceneHasKeyboardFocus:pid:", v4, v5);

}

- (id)setExternalSceneIdentities:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  BSCompoundAssertion *externalSceneIdentitiesAssertion;
  BSCompoundAssertion *v9;
  BSCompoundAssertion *v10;
  BSCompoundAssertion *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v6 = a3;
  v7 = a4;
  externalSceneIdentitiesAssertion = self->_externalSceneIdentitiesAssertion;
  if (!externalSceneIdentitiesAssertion)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__SBSKeyboardFocusService_setExternalSceneIdentities_forReason___block_invoke;
    v15[3] = &unk_1E288D360;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0D01718], "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBSKeyboardFocusService-externalSceneIdentities"), v15);
    v9 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v10 = self->_externalSceneIdentitiesAssertion;
    self->_externalSceneIdentitiesAssertion = v9;

    v11 = self->_externalSceneIdentitiesAssertion;
    SBLogKeyboardFocus();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v11, "setLog:", v12);

    externalSceneIdentitiesAssertion = self->_externalSceneIdentitiesAssertion;
  }
  -[BSCompoundAssertion acquireForReason:withContext:](externalSceneIdentitiesAssertion, "acquireForReason:withContext:", v7, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __64__SBSKeyboardFocusService_setExternalSceneIdentities_forReason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "context", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "remoteTarget");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setExternalSceneIdentities:", v4);

}

- (id)_connection
{
  BSServiceConnection *connection;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  OS_dispatch_queue *v8;
  OS_dispatch_queue *connectionQueue;
  BSServiceConnection *v10;
  BSServiceConnection *v11;
  BSServiceConnection *v12;
  _QWORD v14[5];

  connection = self->_connection;
  if (!connection)
  {
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSKeyboardFocusServiceSpecification identifier](SBSKeyboardFocusServiceSpecification, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (OS_dispatch_queue *)BSDispatchQueueCreateWithQualityOfService();
    connectionQueue = self->_connectionQueue;
    self->_connectionQueue = v8;

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
    v10 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    v11 = self->_connection;
    self->_connection = v10;

    v12 = self->_connection;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __38__SBSKeyboardFocusService__connection__block_invoke;
    v14[3] = &unk_1E288CF30;
    v14[4] = self;
    -[BSServiceConnection configureConnection:](v12, "configureConnection:", v14);
    -[BSServiceConnection activate](self->_connection, "activate");

    connection = self->_connection;
  }
  return connection;
}

void __38__SBSKeyboardFocusService__connection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  id v10;
  id location;

  v3 = a2;
  +[SBSKeyboardFocusServiceSpecification interface](SBSKeyboardFocusServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBSKeyboardFocusServiceSpecification serviceQuality](SBSKeyboardFocusServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __38__SBSKeyboardFocusService__connection__block_invoke_2;
  v9 = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInvalidationHandler:", &v6);
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_22, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __38__SBSKeyboardFocusService__connection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

void __38__SBSKeyboardFocusService__connection__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  SBLogKeyboardFocus();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __38__SBSKeyboardFocusService__connection__block_invoke_3_cold_1(v3);

  objc_msgSend(v2, "activate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalSceneIdentitiesAssertion, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __85__SBSKeyboardFocusService_requestKeyboardFocusForSceneIdentity_processID_completion___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "SBSKeyboardFocusService: error requesting focus for sceneIdentity %{public}@: %{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)applyAdditionalDeferringRules:(uint64_t)a1 whenSceneHasKeyboardFocus:(NSObject *)a2 processID:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_18EB52000, a2, OS_LOG_TYPE_ERROR, "SBSKeyboardFocusService failed to encode deferring environments: %{public}@", (uint8_t *)&v2, 0xCu);
}

void __38__SBSKeyboardFocusService__connection__block_invoke_3_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EB52000, log, OS_LOG_TYPE_ERROR, "SBSKeyboardFocusService: connection interrupted, attempting to reactivate", v1, 2u);
}

@end
