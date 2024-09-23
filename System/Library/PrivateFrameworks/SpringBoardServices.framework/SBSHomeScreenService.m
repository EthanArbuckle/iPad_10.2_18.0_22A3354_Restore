@implementation SBSHomeScreenService

void __28__SBSHomeScreenService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[SBSHomeScreenServiceSpecification interface](SBSHomeScreenServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  +[SBSHomeScreenServiceSpecification serviceQuality](SBSHomeScreenServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v3, "setActivationHandler:", &__block_literal_global_24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__SBSHomeScreenService_init__block_invoke_6;
  v6[3] = &unk_1E288D248;
  objc_copyWeak(&v7, (id *)(a1 + 40));
  objc_msgSend(v3, "setInterruptionHandler:", v6);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_8);
  objc_destroyWeak(&v7);

}

- (id)addIconBadgeValueObserver:(id)a3
{
  BSServiceConnection *connection;
  id v5;
  void *v6;
  NSObject *v7;
  SBSHomeScreenServiceIconBadgeValueObservationAssertion *v8;
  NSHashTable *iconBadgeValueObservers;
  NSHashTable *v10;
  NSHashTable *v11;

  connection = self->_connection;
  v5 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addIconBadgeValueObserver:].cold.1();

  }
  v8 = -[SBSHomeScreenServiceIconBadgeValueObservationAssertion initWithObserver:service:]([SBSHomeScreenServiceIconBadgeValueObservationAssertion alloc], "initWithObserver:service:", v5, self);

  os_unfair_lock_lock(&self->_lock);
  iconBadgeValueObservers = self->_iconBadgeValueObservers;
  if (!iconBadgeValueObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_iconBadgeValueObservers;
    self->_iconBadgeValueObservers = v10;

    iconBadgeValueObservers = self->_iconBadgeValueObservers;
  }
  -[NSHashTable addObject:](iconBadgeValueObservers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "setObservingIconBadgeValue:", MEMORY[0x1E0C9AAB0]);

  return v8;
}

- (id)addInstalledWebClipsObserver:(id)a3
{
  BSServiceConnection *connection;
  id v5;
  void *v6;
  NSObject *v7;
  SBSHomeScreenServiceInstalledWebClipsObservationAssertion *v8;
  NSHashTable *installedWebClipObservers;
  NSHashTable *v10;
  NSHashTable *v11;

  connection = self->_connection;
  v5 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addInstalledWebClipsObserver:].cold.1();

  }
  v8 = -[SBSHomeScreenServiceInstalledWebClipsObservationAssertion initWithObserver:service:]([SBSHomeScreenServiceInstalledWebClipsObservationAssertion alloc], "initWithObserver:service:", v5, self);

  os_unfair_lock_lock(&self->_lock);
  installedWebClipObservers = self->_installedWebClipObservers;
  if (!installedWebClipObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_installedWebClipObservers;
    self->_installedWebClipObservers = v10;

    installedWebClipObservers = self->_installedWebClipObservers;
  }
  -[NSHashTable addObject:](installedWebClipObservers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "setObservingInstalledWebClips:", MEMORY[0x1E0C9AAB0]);

  return v8;
}

- (void)requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v7)
      objc_msgSend(v8, "requestAppLibraryUpdate:reason:completion:", &unk_1E28BFE58, v6, v7);
    else
      objc_msgSend(v8, "refreshAppLibrary:reason:", &unk_1E28BFE58, v6);
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:].cold.1();

  }
}

- (SBSHomeScreenService)init
{
  SBSHomeScreenService *v2;
  SBSHomeScreenService *v3;
  uint64_t Serial;
  OS_dispatch_queue *connectionQueue;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  _QWORD v13[4];
  id *v14;
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SBSHomeScreenService;
  v2 = -[SBSHomeScreenService init](&v17, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v3->_connectionQueue;
    v3->_connectionQueue = (OS_dispatch_queue *)Serial;

    v6 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSHomeScreenServiceSpecification identifier](SBSHomeScreenServiceSpecification, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endpointForMachName:service:instance:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(&location, v3);
    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __28__SBSHomeScreenService_init__block_invoke;
    v13[3] = &unk_1E288D270;
    v11 = v3;
    v14 = v11;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v10, "configureConnection:", v13);
    objc_storeStrong(v11 + 1, v10);
    objc_msgSend(v11[1], "activate");
    objc_destroyWeak(&v15);

    objc_destroyWeak(&location);
  }
  return v3;
}

void __28__SBSHomeScreenService_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "SBSHomeScreenService: Connection Activated: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

void __28__SBSHomeScreenService_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v3;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_INFO, "SBSHomeScreenService: Received interruption for connection: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(v3, "activate");
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 6);
    if (objc_msgSend(*(id *)&v6[8]._os_unfair_lock_opaque, "count"))
    {
      objc_msgSend(v3, "remoteTarget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObservingInstalledWebClips:", MEMORY[0x1E0C9AAB0]);

    }
    os_unfair_lock_unlock(v6 + 6);
  }

}

void __28__SBSHomeScreenService_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138543362;
    v5 = v2;
    _os_log_impl(&dword_18EB52000, v3, OS_LOG_TYPE_INFO, "SBSHomeScreenService: Received invalidation for connection: %{public}@", (uint8_t *)&v4, 0xCu);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSHomeScreenService;
  -[SBSHomeScreenService dealloc](&v3, sel_dealloc);
}

- (void)resetHomeScreenLayoutWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  NSObject *v7;
  NSObject *connectionQueue;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke;
    v11[3] = &unk_1E288D2C0;
    v6 = &v12;
    v12 = v4;
    objc_msgSend(v5, "resetHomeScreenLayoutWithCompletion:", v11);
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService resetHomeScreenLayoutWithCompletion:].cold.1();

  if (v4)
  {
    connectionQueue = self->_connectionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_13;
    v9[3] = &unk_1E288D310;
    v6 = &v10;
    v10 = v4;
    dispatch_async(connectionQueue, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: home screen layout successfully reset", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);

}

uint64_t __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_13(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)resetCategoriesLayoutWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  NSObject *v7;
  NSObject *connectionQueue;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke;
    v11[3] = &unk_1E288D2C0;
    v6 = &v12;
    v12 = v4;
    objc_msgSend(v5, "resetCategoriesLayoutWithCompletion:", v11);
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService resetCategoriesLayoutWithCompletion:].cold.1();

  if (v4)
  {
    connectionQueue = self->_connectionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_15;
    v9[3] = &unk_1E288D310;
    v6 = &v10;
    v10 = v4;
    dispatch_async(connectionQueue, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: categories successfully reset", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v3 == 0);

}

uint64_t __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)forbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  NSObject *v11;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke;
    v15[3] = &unk_1E288D768;
    v9 = &v16;
    v10 = v6;
    v16 = v10;
    v17 = v7;
    objc_msgSend(v8, "forbidApplicationBundleIdentifierFromLibrary:withCompletion:", v10, v15);

LABEL_7:
    goto LABEL_8;
  }
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService forbidApplicationBundleIdentifierFromLibrary:withCompletion:].cold.1();

  if (v7)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_16;
    block[3] = &unk_1E288D310;
    v9 = &v14;
    v14 = v7;
    dispatch_async(connectionQueue, block);
    goto LABEL_7;
  }
LABEL_8:

}

void __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: app bundle identifier '%@' was forbidden", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);

}

uint64_t __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id *v9;
  id v10;
  NSObject *v11;
  NSObject *connectionQueue;
  _QWORD block[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke;
    v15[3] = &unk_1E288D768;
    v9 = &v16;
    v10 = v6;
    v16 = v10;
    v17 = v7;
    objc_msgSend(v8, "unforbidApplicationBundleIdentifierFromLibrary:withCompletion:", v10, v15);

LABEL_7:
    goto LABEL_8;
  }
  SBLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService unforbidApplicationBundleIdentifierFromLibrary:withCompletion:].cold.1();

  if (v7)
  {
    connectionQueue = self->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_17;
    block[3] = &unk_1E288D310;
    v9 = &v14;
    v14 = v7;
    dispatch_async(connectionQueue, block);
    goto LABEL_7;
  }
LABEL_8:

}

void __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: app bundle identifier '%@' was unforbidden", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, v3 == 0);

}

uint64_t __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)runFloatingDockStressTestWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id *v6;
  NSObject *v7;
  NSObject *connectionQueue;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke;
    v11[3] = &unk_1E288D2C0;
    v6 = &v12;
    v12 = v4;
    objc_msgSend(v5, "runFloatingDockStressTestWithCompletion:", v11);
LABEL_7:

    goto LABEL_8;
  }
  SBLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService runFloatingDockStressTestWithCompletion:].cold.1();

  if (v4)
  {
    connectionQueue = self->_connectionQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_18;
    v9[3] = &unk_1E288D310;
    v6 = &v10;
    v10 = v4;
    dispatch_async(connectionQueue, v9);
    goto LABEL_7;
  }
LABEL_8:

}

void __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v7[16];

  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_18EB52000, v5, OS_LOG_TYPE_INFO, "SBSHomeScreenService: successfully ran floating dock suggestions stress test", v7, 2u);
  }

  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)requestSuggestedApplicationWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *connectionQueue;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD block[4];
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0D01798]);
  if ((objc_msgSend(v8, "isUsable") & 1) != 0)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D017A0]), "initFromReceiveRight:", v8);
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2;
      v18[3] = &unk_1E288E4B0;
      v11 = &v20;
      v20 = v7;
      v19 = v8;
      objc_msgSend(v10, "requestSuggestedApplicationWithBundleIdentifier:assertionPort:completion:", v6, v9, v18);

    }
    else
    {
      SBLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[SBSHomeScreenService requestSuggestedApplicationWithBundleIdentifier:completion:].cold.1();

      connectionQueue = self->_connectionQueue;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_24;
      v16[3] = &unk_1E288D310;
      v11 = &v17;
      v17 = v7;
      dispatch_async(connectionQueue, v16);
    }

  }
  else
  {
    SBLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService requestSuggestedApplicationWithBundleIdentifier:completion:].cold.2();

    v13 = self->_connectionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke;
    block[3] = &unk_1E288D310;
    v22 = v7;
    dispatch_async(v13, block);
    v9 = v22;
  }

}

uint64_t __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  SBSAssertion *v6;

  v3 = a2;
  if (v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = -[SBSAssertion initWithAssertionName:reason:receiveRight:]([SBSAssertion alloc], "initWithAssertionName:reason:receiveRight:", CFSTR("com.apple.springboard.requestSuggestedApplication"), CFSTR("requestSuggestedApplicationWithBundleIdentifier"), *(_QWORD *)(a1 + 32));
    (*(void (**)(uint64_t, SBSAssertion *))(v5 + 16))(v5, v6);

  }
}

uint64_t __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_24(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)folderPathToIconWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService folderPathToIconWithBundleIdentifier:].cold.1();

  }
  objc_msgSend(v5, "folderPathToIconWithBundleIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)debugContinuityWithBadgeType:(id)a3 deviceTypeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  char v10;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService debugContinuityWithBadgeType:deviceTypeIdentifier:].cold.1();

  }
  v10 = objc_msgSend(v8, "debugContinuityWithBadgeType:deviceTypeIdentifier:", v6, v7);

  return v10;
}

- (void)runDownloadingIconTest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed runDownloadingIconTest (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureDeweyEachAppHasItsOwnCategory
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed configureDeweyEachAppHasItsOwnCategory (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureDeweyOneCategoryWithAllApps
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed configureDeweyOneCategoryWithAllApps (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureLibraryWithCategoryLimit:(int64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService configureLibraryWithCategoryLimit:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configureLibraryWithCategoryLimit:", v6);

}

- (id)configureCategoryMapProviderToUseCategoryMapAtURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService configureCategoryMapProviderToUseCategoryMapAtURL:].cold.1();

  }
  objc_msgSend(v5, "configureCategoryMapProviderToUseCategoryMapAtURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runRemoveAndRestoreIconTest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed runRemoveAndRestoreIconTest (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addApplicationIconToHomeScreenWithBundleIdentifier:].cold.1();

  }
  objc_msgSend(v5, "addApplicationIconToHomeScreenWithBundleIdentifier:", v4);

}

- (void)addWidgetToTodayViewWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addWidgetToTodayViewWithBundleIdentifier:].cold.1();

  }
  objc_msgSend(v5, "addWidgetToTodayViewWithBundleIdentifier:", v4);

}

- (BOOL)isLargeIconLayoutEnabled
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService isLargeIconLayoutEnabled].cold.1();

  }
  objc_msgSend(v2, "largeIconLayoutEnabledValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setLargeIconLayoutEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService isLargeIconLayoutEnabled].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLargeIconLayoutEnabledValue:", v6);

}

- (BOOL)addsNewIconsToHomeScreen
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addsNewIconsToHomeScreen].cold.1();

  }
  objc_msgSend(v2, "addsNewIconsToHomeScreenValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setAddsNewIconsToHomeScreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService setAddsNewIconsToHomeScreen:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAddsNewIconsToHomeScreenValue:", v6);

}

- (void)setIconListsHidden:(id)a3
{
  BSServiceConnection *connection;
  id v4;
  void *v5;
  NSObject *v6;
  SBSHomeScreenServiceArrayOfStrings *v7;

  connection = self->_connection;
  v4 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService setIconListsHidden:].cold.1();

  }
  v7 = -[SBSHomeScreenServiceArrayOfStrings initWithArray:]([SBSHomeScreenServiceArrayOfStrings alloc], "initWithArray:", v4);

  objc_msgSend(v5, "setIconListsHidden:", v7);
}

- (BOOL)showsBadgesInAppLibrary
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService showsBadgesInAppLibrary].cold.1();

  }
  objc_msgSend(v2, "showsBadgesInAppLibraryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setShowsBadgesInAppLibrary:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService showsBadgesInAppLibrary].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsBadgesInAppLibraryValue:", v6);

}

- (BOOL)showsHomeScreenSearchAffordance
{
  void *v2;
  NSObject *v3;
  void *v4;
  char v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService showsHomeScreenSearchAffordance].cold.1();

  }
  objc_msgSend(v2, "showsHomeScreenSearchAffordanceValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setShowsHomeScreenSearchAffordance:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  NSObject *v5;
  void *v6;

  v3 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService showsHomeScreenSearchAffordance].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsHomeScreenSearchAffordanceValue:", v6);

}

- (NSArray)allHomeScreenApplicationBundleIdentifiers
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService allHomeScreenApplicationBundleIdentifiers].cold.1();

  }
  objc_msgSend(v2, "allHomeScreenApplicationBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService allHomeScreenApplicationPlaceholderBundleIdentifiers].cold.1();

  }
  objc_msgSend(v2, "allHomeScreenApplicationPlaceholderBundleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSString)allIconLists
{
  void *v2;
  NSObject *v3;
  void *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService allIconLists].cold.1();

  }
  objc_msgSend(v2, "allIconLists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)hasWidgetWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  char v7;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService hasWidgetWithBundleIdentifier:].cold.1();

  }
  v7 = objc_msgSend(v5, "hasWidgetWithBundleIdentifier:", v4);

  return v7;
}

- (void)requestAppLibraryUpdateWithReason:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    if (v7)
      objc_msgSend(v8, "requestAppLibraryUpdate:reason:completion:", &unk_1E28BFE40, v6, v7);
    else
      objc_msgSend(v8, "refreshAppLibrary:reason:", &unk_1E28BFE40, v6);
  }
  else
  {
    SBLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService requestAppLibraryUpdateWithReason:completionHandler:].cold.1();

  }
}

- (void)organizeAllIconsIntoFoldersWithPageCount:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService organizeAllIconsIntoFoldersWithPageCount:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizeAllIconsIntoFoldersWithPageCount:", v6);

}

- (void)organizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService organizeAllIconsAcrossPagesWithPageCount:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizeAllIconsAcrossPagesWithPageCount:", v6);

}

- (void)randomizeAllIconsAcrossPagesWithPageCount:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService randomizeAllIconsAcrossPagesWithPageCount:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "randomizeAllIconsAcrossPagesWithPageCount:", v6);

}

- (void)removeAllWidgets
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, a2, v4, "SBSHomeScreenService: failed %{public}@ request (no target).", v5);

  OUTLINED_FUNCTION_8();
}

- (void)removeWidgetsFromHomeScreen
{
  void *v3;
  NSObject *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService removeAllWidgets].cold.1(a2, v4);

  }
  objc_msgSend(v3, "removeWidgetsFromHomeScreen");

}

- (void)ignoreAllApps
{
  void *v3;
  NSObject *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService removeAllWidgets].cold.1(a2, v4);

  }
  objc_msgSend(v3, "ignoreAllApps");

}

- (void)deleteAllWebClips
{
  void *v3;
  NSObject *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    SBLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService removeAllWidgets].cold.1(a2, v4);

  }
  objc_msgSend(v3, "deleteAllWebClips");

}

- (void)changeDisplayedDateOverride:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService changeDisplayedDateOverride:].cold.1();

  }
  objc_msgSend(v5, "changeDisplayedDateOverride:", v4);

}

- (void)changeDisplayedDateOffsetOverride:(double)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService changeDisplayedDateOffsetOverride:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDisplayedDateOffsetOverride:", v6);

}

- (void)reloadIcons
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed reloadIcons request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)reloadHomeScreenLayout
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed reloadHomeScreenLayout request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)resetTodayViewLayout
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed resetTodayViewLayout request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)clearTodayViewLayout
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed clearTodayViewLayout request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)overrideBadgeValue:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService overrideBadgeValue:forBundleIdentifier:].cold.1();

  }
  objc_msgSend(v8, "overrideBadgeValue:forBundleIdentifier:", v6, v7);

}

- (void)clearNewlyInstalledAndRecentlyUpdatedAppIndicators
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed clearNewlyInstalledAndRecentlyUpdatedAppIndicators request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService presentAppLibraryCategoryPodForCategoryIdentifier:completion:].cold.1();

  }
  objc_msgSend(v8, "presentAppLibraryCategoryPodForCategoryIdentifier:completion:", v6, v7);

}

- (void)presentAppLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  BSServiceConnection *connection;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  connection = self->_connection;
  v6 = a4;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService presentAppLibraryAnimated:completion:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentAppLibraryAnimated:completion:", v9, v6);

}

- (void)dismissAppLibraryWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService dismissAppLibraryWithCompletion:].cold.1();

  }
  objc_msgSend(v5, "dismissAppLibraryWithCompletion:", v4);

}

- (void)addDebugIconWithSizeClassDescription:(id)a3 inPage:(unint64_t)a4 atPositionDescription:(id)a5
{
  BSServiceConnection *connection;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;

  connection = self->_connection;
  v8 = a5;
  v9 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addDebugIconWithSizeClassDescription:inPage:atPositionDescription:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addDebugIconWithSizeClassDescription:inPage:atPositionDescription:", v9, v12, v8);

}

- (void)removeInstalledWebClipsObservationAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSUInteger v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_installedWebClipObservers, "removeObject:", v5);

  v6 = -[NSHashTable count](self->_installedWebClipObservers, "count");
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObservingInstalledWebClips:", MEMORY[0x1E0C9AAA0]);

  }
}

- (SBSDebugActiveWidgetInfo)debuggingActiveWidgetInfo
{
  void *v2;
  NSObject *v3;
  void *v4;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService debuggingActiveWidgetInfo].cold.1();

  }
  objc_msgSend(v2, "debuggingActiveWidgetInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBSDebugActiveWidgetInfo *)v4;
}

- (void)insertEmptyPageAtIndex:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService insertEmptyPageAtIndex:].cold.1();

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertEmptyPageAtIndex:", v6);

}

- (void)addEmptyPage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addEmptyPage request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addSuggestedPageWithPageType:(id)a3 focusModeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addSuggestedPageWithPageType:focusModeIdentifier:].cold.1();

  }
  objc_msgSend(v8, "addSuggestedPageWithPageType:focusModeIdentifier:", v6, v7);

}

- (BOOL)isHomeScreenLayoutAvailable
{
  os_unfair_lock_s *p_lock;
  BOOL v4;
  char v5;
  void *v6;
  NSObject *v7;
  void *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[SBSHomeScreenService isCachedHomeScreenLayoutAvailableValid](self, "isCachedHomeScreenLayoutAvailableValid");
  v5 = -[SBSHomeScreenService isCachedHomeScreenLayoutAvailable](self, "isCachedHomeScreenLayoutAvailable");
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      SBLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[SBSHomeScreenService isHomeScreenLayoutAvailable].cold.1();

    }
    objc_msgSend(v6, "homeScreenLayoutAvailability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v8, "BOOLValue");

  }
  return v5;
}

- (id)addHomeScreenLayoutAvailabilityObserver:(id)a3
{
  BSServiceConnection *connection;
  id v5;
  void *v6;
  NSObject *v7;
  SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion *v8;
  NSHashTable *homeScreenLayoutAvailableObservers;
  NSHashTable *v10;
  NSHashTable *v11;

  connection = self->_connection;
  v5 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addHomeScreenLayoutAvailabilityObserver:].cold.1();

  }
  v8 = -[SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion initWithObserver:service:]([SBSHomeScreenServiceHomeScreenLayoutAvailabilityObservationAssertion alloc], "initWithObserver:service:", v5, self);

  os_unfair_lock_lock(&self->_lock);
  homeScreenLayoutAvailableObservers = self->_homeScreenLayoutAvailableObservers;
  if (!homeScreenLayoutAvailableObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_homeScreenLayoutAvailableObservers;
    self->_homeScreenLayoutAvailableObservers = v10;

    homeScreenLayoutAvailableObservers = self->_homeScreenLayoutAvailableObservers;
  }
  -[NSHashTable addObject:](homeScreenLayoutAvailableObservers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "setObservingHomeScreenLayoutAvailability:", MEMORY[0x1E0C9AAB0]);

  return v8;
}

- (void)removeHomeScreenLayoutAvailabilityObservationAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSUInteger v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_homeScreenLayoutAvailableObservers, "removeObject:", v5);

  v6 = -[NSHashTable count](self->_homeScreenLayoutAvailableObservers, "count");
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObservingHomeScreenLayoutAvailability:", MEMORY[0x1E0C9AAA0]);

  }
}

- (id)addHomeScreenLayoutObserver:(id)a3
{
  BSServiceConnection *connection;
  id v5;
  void *v6;
  NSObject *v7;
  SBSHomeScreenServiceHomeScreenLayoutObservationAssertion *v8;
  NSHashTable *homeScreenLayoutObservers;
  NSHashTable *v10;
  NSHashTable *v11;

  connection = self->_connection;
  v5 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addHomeScreenLayoutObserver:].cold.1();

  }
  v8 = -[SBSHomeScreenServiceHomeScreenLayoutObservationAssertion initWithObserver:service:]([SBSHomeScreenServiceHomeScreenLayoutObservationAssertion alloc], "initWithObserver:service:", v5, self);

  os_unfair_lock_lock(&self->_lock);
  homeScreenLayoutObservers = self->_homeScreenLayoutObservers;
  if (!homeScreenLayoutObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_homeScreenLayoutObservers;
    self->_homeScreenLayoutObservers = v10;

    homeScreenLayoutObservers = self->_homeScreenLayoutObservers;
  }
  -[NSHashTable addObject:](homeScreenLayoutObservers, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v6, "setObservingHomeScreenLayout:", MEMORY[0x1E0C9AAB0]);

  return v8;
}

- (void)removeHomeScreenLayoutObservationAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSUInteger v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_homeScreenLayoutObservers, "removeObject:", v5);

  v6 = -[NSHashTable count](self->_homeScreenLayoutObservers, "count");
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObservingHomeScreenLayout:", MEMORY[0x1E0C9AAA0]);

  }
}

- (BSColor)iconTintColor
{
  void *v2;
  void *v3;
  void *v4;

  -[SBSHomeScreenService homeScreenIconStyleConfiguration](self, "homeScreenIconStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "configurationType") == 3)
  {
    objc_msgSend(v3, "tintColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (BSColor *)v4;
}

- (void)setIconTintColor:(id)a3
{
  id v4;

  +[SBSHomeScreenIconStyleConfiguration tintedStyleConfigurationWithTintColor:](SBSHomeScreenIconStyleConfiguration, "tintedStyleConfigurationWithTintColor:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSHomeScreenService setHomeScreenIconStyleConfiguration:](self, "setHomeScreenIconStyleConfiguration:", v4);

}

- (NSString)iconUserInterfaceStyle
{
  void *v2;
  void *v3;
  unint64_t v4;
  const __CFString *v5;

  -[SBSHomeScreenService homeScreenIconStyleConfiguration](self, "homeScreenIconStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "configurationType");
    if (v4 > 3)
      v5 = CFSTR("unknown");
    else
      v5 = off_1E288E4F8[v4];
  }
  else
  {
    v5 = 0;
  }

  return &v5->isa;
}

- (void)setIconUserInterfaceStyle:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("auto")))
  {
    +[SBSHomeScreenIconStyleConfiguration automaticStyleConfiguration](SBSHomeScreenIconStyleConfiguration, "automaticStyleConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v6, "isEqualToString:", CFSTR("light")))
  {
    +[SBSHomeScreenIconStyleConfiguration lightStyleConfiguration](SBSHomeScreenIconStyleConfiguration, "lightStyleConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v6, "isEqualToString:", CFSTR("dark")))
    {
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "Unable to set icon style to %s\n", (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"));
      goto LABEL_8;
    }
    +[SBSHomeScreenIconStyleConfiguration darkStyleConfiguration](SBSHomeScreenIconStyleConfiguration, "darkStyleConfiguration");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  -[SBSHomeScreenService setHomeScreenIconStyleConfiguration:](self, "setHomeScreenIconStyleConfiguration:", v4);

LABEL_8:
}

- (SBSHomeScreenIconStyleConfiguration)homeScreenIconStyleConfiguration
{
  os_unfair_lock_s *p_lock;
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = -[SBSHomeScreenService isCachedIconStyleConfigurationValid](self, "isCachedIconStyleConfigurationValid");
  -[SBSHomeScreenService cachedIconStyleConfiguration](self, "cachedIconStyleConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  if (v4)
  {
    v6 = v5;
  }
  else
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "homeScreenIconStyleConfiguration");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      SBLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[SBSHomeScreenService homeScreenIconStyleConfiguration].cold.1();

      v6 = 0;
    }

  }
  return (SBSHomeScreenIconStyleConfiguration *)v6;
}

- (void)setHomeScreenIconStyleConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "setHomeScreenIconStyleConfiguration:", v4);
  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService setHomeScreenIconStyleConfiguration:].cold.1();

  }
}

- (id)addIconTintColorObserver:(id)a3
{
  return 0;
}

- (id)addHomeScreenIconStyleObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  SBSHomeScreenServiceIconStyleObservationAssertion *v7;
  NSHashTable *iconStyleObservers;
  NSHashTable *v9;
  NSHashTable *v10;
  _BOOL4 v11;
  void *v12;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService addHomeScreenIconStyleObserver:].cold.1();

  }
  v7 = -[SBSHomeScreenServiceIconStyleObservationAssertion initWithObserver:service:]([SBSHomeScreenServiceIconStyleObservationAssertion alloc], "initWithObserver:service:", v4, self);
  os_unfair_lock_lock(&self->_lock);
  iconStyleObservers = self->_iconStyleObservers;
  if (!iconStyleObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v9 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v10 = self->_iconStyleObservers;
    self->_iconStyleObservers = v9;

    iconStyleObservers = self->_iconStyleObservers;
  }
  -[NSHashTable addObject:](iconStyleObservers, "addObject:", v7);
  v11 = -[SBSHomeScreenService isCachedIconStyleConfigurationValid](self, "isCachedIconStyleConfigurationValid");
  -[SBSHomeScreenService cachedIconStyleConfiguration](self, "cachedIconStyleConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  objc_msgSend(v5, "setObservingIconTintColor:", MEMORY[0x1E0C9AAB0]);
  if (v11)
    objc_msgSend(v4, "homeScreenService:homeScreenIconStyleConfigurationDidChange:", self, v12);

  return v7;
}

- (void)removeIconStyleObservationAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  id v6;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_iconStyleObservers, "removeObject:", v5);

  if (-[NSHashTable count](self->_iconStyleObservers, "count"))
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    -[SBSHomeScreenService setCachedIconStyleConfigurationValid:](self, "setCachedIconStyleConfigurationValid:", 0);
    os_unfair_lock_unlock(p_lock);
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObservingIconTintColor:", MEMORY[0x1E0C9AAA0]);

  }
}

- (id)silhouetteLayoutForPageAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "silhouetteLayoutForPageAtIndex:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService silhouetteLayoutForPageAtIndex:].cold.1();

    v6 = 0;
  }

  return v6;
}

- (void)removeIconBadgeValueObservationAssertion:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSUInteger v6;
  id v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_iconBadgeValueObservers, "removeObject:", v5);

  v6 = -[NSHashTable count](self->_iconBadgeValueObservers, "count");
  os_unfair_lock_unlock(p_lock);
  if (!v6)
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObservingIconBadgeValue:", MEMORY[0x1E0C9AAA0]);

  }
}

- (id)badgeValueForIconWithApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a3;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "badgeValueForIconWithApplicationBundleIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberOrString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SBLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:].cold.1();

    v8 = 0;
  }

  return v8;
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    goto LABEL_2;
  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService badgeValueForIconWithApplicationBundleIdentifier:].cold.1();

  if (!v7)
  {
LABEL_2:
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __91__SBSHomeScreenService_badgeValueForIconWithApplicationBundleIdentifier_completionHandler___block_invoke;
    v10[3] = &unk_1E288E4D8;
    v11 = v7;
    objc_msgSend(v8, "badgeValueForIconWithApplicationBundleIdentifier:completionHandler:", v6, v10);

  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

void __91__SBSHomeScreenService_badgeValueForIconWithApplicationBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "numberOrString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)clearAllOverflowSlotCounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed clearAllOverflowSlotCounts request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (NSArray)overflowSlotCounts
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;

  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBSHomeScreenService overflowSlotCounts].cold.1();

  }
  objc_msgSend(v2, "overflowSlotCounts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setupHomeScreenForWidgetScrollPerformanceTest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed setupHomeScreenForWidgetScrollPerformanceTest request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)runWidgetDiscoverabilityTest
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed runWidgetDiscoverabilityTest request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)installedWebClipsDidChange
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18EB52000, v2, (uint64_t)v2, "Lost an observer for installed web clips without invalidating the assertion", v3);
}

- (void)homeScreenLayoutAvailabilityDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_homeScreenLayoutAvailableObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSHomeScreenService setCachedHomeScreenLayoutAvailable:](self, "setCachedHomeScreenLayoutAvailable:", objc_msgSend(v4, "BOOLValue"));
  -[SBSHomeScreenService setCachedHomeScreenLayoutAvailableValid:](self, "setCachedHomeScreenLayoutAvailableValid:", 1);
  os_unfair_lock_unlock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "observer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "homeScreenServiceLayoutAvailabilityDidChange:", self);
        }
        else
        {
          SBLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SBSHomeScreenService homeScreenLayoutAvailabilityDidChange:].cold.1(&v15, v16);

          -[SBSHomeScreenService removeHomeScreenLayoutAvailabilityObservationAssertion:](self, "removeHomeScreenLayoutAvailabilityObservationAssertion:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)applicationIconInfoChangedForBundleIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  char v20;
  _BYTE v21[15];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_iconBadgeValueObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v19 = v4;
  objc_msgSend(v4, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  SBLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[SBSHomeScreenService applicationIconInfoChangedForBundleIdentifiers:].cold.2();

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v5;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v15, "observer");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "homeScreenService:applicationIconInfoChangedForBundleIdentifiers:", self, v8);
        }
        else
        {
          SBLogCommon();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            -[SBSHomeScreenService applicationIconInfoChangedForBundleIdentifiers:].cold.1(&v20, v21);

          -[SBSHomeScreenService removeIconBadgeValueObservationAssertion:](self, "removeIconBadgeValueObservationAssertion:", v15);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

}

- (void)homeScreenLayoutDidChange
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18EB52000, v2, (uint64_t)v2, "Lost an observer for home screen layout without invalidating the assertion", v3);
}

- (void)homeScreenIconStyleConfigurationDidChange:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  char v15;
  _BYTE v16[15];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_iconStyleObservers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSHomeScreenService setCachedIconStyleConfiguration:](self, "setCachedIconStyleConfiguration:", v4);
  -[SBSHomeScreenService setCachedIconStyleConfigurationValid:](self, "setCachedIconStyleConfigurationValid:", 1);
  os_unfair_lock_unlock(&self->_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "observer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "homeScreenService:homeScreenIconStyleConfigurationDidChange:", self, v4);
        }
        else
        {
          SBLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            -[SBSHomeScreenService homeScreenIconStyleConfigurationDidChange:].cold.1(&v15, v16);

          -[SBSHomeScreenService removeIconStyleObservationAssertion:](self, "removeIconStyleObservationAssertion:", v11);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

}

- (void)setHomeScreenLayoutAvailable:(BOOL)a3
{
  self->_homeScreenLayoutAvailable = a3;
}

- (BOOL)isCachedHomeScreenLayoutAvailable
{
  return self->_cachedHomeScreenLayoutAvailable;
}

- (void)setCachedHomeScreenLayoutAvailable:(BOOL)a3
{
  self->_cachedHomeScreenLayoutAvailable = a3;
}

- (BOOL)isCachedHomeScreenLayoutAvailableValid
{
  return self->_cachedHomeScreenLayoutAvailableValid;
}

- (void)setCachedHomeScreenLayoutAvailableValid:(BOOL)a3
{
  self->_cachedHomeScreenLayoutAvailableValid = a3;
}

- (SBSHomeScreenIconStyleConfiguration)cachedIconStyleConfiguration
{
  return self->_cachedIconStyleConfiguration;
}

- (void)setCachedIconStyleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isCachedIconStyleConfigurationValid
{
  return self->_cachedIconStyleConfigurationValid;
}

- (void)setCachedIconStyleConfigurationValid:(BOOL)a3
{
  self->_cachedIconStyleConfigurationValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIconStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_iconStyleObservers, 0);
  objc_storeStrong((id *)&self->_iconBadgeValueObservers, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutObservers, 0);
  objc_storeStrong((id *)&self->_homeScreenLayoutAvailableObservers, 0);
  objc_storeStrong((id *)&self->_installedWebClipObservers, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)resetHomeScreenLayoutWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed request to reset home screen layout (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__SBSHomeScreenService_resetHomeScreenLayoutWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: error from request to reset home screen layout: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)resetCategoriesLayoutWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed request to reset categories (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __60__SBSHomeScreenService_resetCategoriesLayoutWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: error from request to reset categories: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)forbidApplicationBundleIdentifierFromLibrary:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed to forbid application bundle identifier (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __84__SBSHomeScreenService_forbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: error from request to forbid application bundle identifier: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)unforbidApplicationBundleIdentifierFromLibrary:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed to unforbid application bundle identifier (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __86__SBSHomeScreenService_unforbidApplicationBundleIdentifierFromLibrary_withCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: error from request to unforbid application bundle identifier: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)runFloatingDockStressTestWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed request to run floating dock suggestions stress test.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __64__SBSHomeScreenService_runFloatingDockStressTestWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: error from request to run stress test: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)requestSuggestedApplicationWithBundleIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed app dock suggestion request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestSuggestedApplicationWithBundleIdentifier:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed app dock suggestion request (unusable assertion port).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __83__SBSHomeScreenService_requestSuggestedApplicationWithBundleIdentifier_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: error from app dock suggestion request: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)folderPathToIconWithBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed folder path lookup request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)debugContinuityWithBadgeType:deviceTypeIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed debug continuity badge typoe (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureLibraryWithCategoryLimit:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed configureLibraryWithCategoryLimit: (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)configureCategoryMapProviderToUseCategoryMapAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed configureCategoryMapProviderToUseCategoryMapAtURL: (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addApplicationIconToHomeScreenWithBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed add icon to home screen request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addWidgetToTodayViewWithBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed add widget to today view request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isLargeIconLayoutEnabled
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed large icon request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addsNewIconsToHomeScreen
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed adds new icons to home screen request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setAddsNewIconsToHomeScreen:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed setAddsNewIconsToHomeScreen request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setIconListsHidden:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed setIconListsHidden request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)showsBadgesInAppLibrary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed shows badges in app library request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)showsHomeScreenSearchAffordance
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed shows home screen search affordance request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)allHomeScreenApplicationBundleIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed allHomeScreenApplicationBundleIdentifiers request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)allHomeScreenApplicationPlaceholderBundleIdentifiers
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed allHomeScreenApplicationPlaceholderBundleIdentifiers request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)allIconLists
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed allIconLists request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)hasWidgetWithBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed hasWidgetWithBundleIdentifier request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestAppLibraryUpdateWithReason:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed requestAppLibraryUpdateReason: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed requestAppLibraryUpdateSuggestionsAndRecentsPodWithReason: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)organizeAllIconsIntoFoldersWithPageCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed organizeAllIconsIntoFoldersWithPageCount request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)organizeAllIconsAcrossPagesWithPageCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed organizeAllIconsAcrossPagesWithPageCount request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)randomizeAllIconsAcrossPagesWithPageCount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed randomizeAllIconsAcrossPagesWithPageCount request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changeDisplayedDateOverride:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed changeDisplayedDateOverride request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)changeDisplayedDateOffsetOverride:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed changeDisplayedDateOffsetOverride request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)overrideBadgeValue:forBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed overrideBadgeValue:forBundleIdentifier: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentAppLibraryCategoryPodForCategoryIdentifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed presentAppLibraryCategoryPodForCategoryIdentifier request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)presentAppLibraryAnimated:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed presentAppLibraryAnimated:completion: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)dismissAppLibraryWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed dismissAppLibraryWithCompletion request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addDebugIconWithSizeClassDescription:inPage:atPositionDescription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addDebugIconWithSizeClassDescription request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addInstalledWebClipsObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addInstalledWebClipsObserver: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)debuggingActiveWidgetInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed debuggingActiveWidgetInfo: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)insertEmptyPageAtIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed insertEmptyPageAtIndex: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addSuggestedPageWithPageType:focusModeIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addSuggestedPage request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)isHomeScreenLayoutAvailable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed isHomeScreenLayoutAvailable request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addHomeScreenLayoutAvailabilityObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addHomeScreenLayoutAvailabilityObserver: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addHomeScreenLayoutObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addHomeScreenLayoutObserver: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)homeScreenIconStyleConfiguration
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed homeScreenIconStyleConfiguration request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setHomeScreenIconStyleConfiguration:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed setHomeScreenIconStyleConfiguration: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addHomeScreenIconStyleObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addHomeScreenIconStyleObserver: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)silhouetteLayoutForPageAtIndex:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed silhouetteLayoutForPageAtIndex: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)addIconBadgeValueObserver:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed addIconBadgeValueObserver: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)badgeValueForIconWithApplicationBundleIdentifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed badgeValueForIconWithApplicationBundleIdentifier: request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)overflowSlotCounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_18EB52000, v0, v1, "SBSHomeScreenService: failed overflowSlotCounts request (no target).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)homeScreenLayoutAvailabilityDidChange:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18EB52000, v2, (uint64_t)v2, "Lost an observer for home screen layout availability without invalidating the assertion", v3);
}

- (void)applicationIconInfoChangedForBundleIdentifiers:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18EB52000, v2, (uint64_t)v2, "Lost an observer for application icon info without invalidating the assertion", v3);
}

- (void)applicationIconInfoChangedForBundleIdentifiers:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_4_1(&dword_18EB52000, v0, v1, "Received notification for changed application icon info: %@", v2);
  OUTLINED_FUNCTION_3();
}

- (void)homeScreenIconStyleConfigurationDidChange:(_BYTE *)a1 .cold.1(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_6(a1, a2);
  OUTLINED_FUNCTION_1_1(&dword_18EB52000, v2, (uint64_t)v2, "Lost an observer for icon style without invalidating the assertion", v3);
}

@end
