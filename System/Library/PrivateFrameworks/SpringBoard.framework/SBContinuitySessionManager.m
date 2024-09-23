@implementation SBContinuitySessionManager

+ (id)sharedInstance
{
  if (sharedInstance___once_7 != -1)
    dispatch_once(&sharedInstance___once_7, &__block_literal_global_204);
  return (id)sharedInstance___sharedInstance_15;
}

void __44__SBContinuitySessionManager_sharedInstance__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  SBContinuityDisplayLayoutCoordinator *v3;
  _SBContinuitySessionManagerExternalDependencyProvider *v4;
  SBContinuitySessionManager *v5;
  SBContinuitySessionService *v6;
  uint64_t v7;
  void *v8;
  SBOverridableUserInterfaceStyleProvider *v9;

  v9 = objc_alloc_init(SBOverridableUserInterfaceStyleProvider);
  v0 = (void *)MEMORY[0x1E0D230F0];
  objc_msgSend(MEMORY[0x1E0D230F8], "configurationForContinuityDisplay");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "publisherWithConfiguration:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -[SBContinuityDisplayLayoutCoordinator initWithRootPublisher:]([SBContinuityDisplayLayoutCoordinator alloc], "initWithRootPublisher:", v2);
  v4 = objc_alloc_init(_SBContinuitySessionManagerExternalDependencyProvider);
  v5 = [SBContinuitySessionManager alloc];
  v6 = objc_alloc_init(SBContinuitySessionService);
  v7 = -[SBContinuitySessionManager _initWithService:userInterfaceStyleProvider:displayLayoutCoordinator:sessionFactory:externalDependencyProvider:](v5, "_initWithService:userInterfaceStyleProvider:displayLayoutCoordinator:sessionFactory:externalDependencyProvider:", v6, v9, v3, 0, v4);
  v8 = (void *)sharedInstance___sharedInstance_15;
  sharedInstance___sharedInstance_15 = v7;

}

+ (BOOL)areContinuitySessionsAllowed
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (__sb__runningInSpringBoard())
  {
    if (!SBFEffectiveDeviceClass() || SBFEffectiveDeviceClass() == 1)
      goto LABEL_4;
LABEL_7:
    SBLogContinuitySession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[SBContinuitySessionManager areContinuitySessionsAllowed].cold.2(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
    goto LABEL_7;
LABEL_4:
  if ((SBFIsOnenessAvailable() & 1) != 0)
    return 1;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    +[SBContinuitySessionManager areContinuitySessionsAllowed].cold.1(v5, v13, v14, v15, v16, v17, v18, v19);
LABEL_11:

  return 0;
}

- (id)_initWithService:(id)a3 userInterfaceStyleProvider:(id)a4 displayLayoutCoordinator:(id)a5 sessionFactory:(id)a6 externalDependencyProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBContinuitySessionManager *v17;
  NSMutableArray *v18;
  NSMutableArray *waitingWindowScenes;
  id v20;
  uint64_t v21;
  BSInvalidatable *stateDumpHandle;
  id v24;
  id v25;
  id location;
  objc_super v27;

  v13 = a3;
  v24 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuitySessionManager;
  v17 = -[SBContinuitySessionManager init](&v27, sel_init);
  if (v17)
  {
    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    waitingWindowScenes = v17->_waitingWindowScenes;
    v17->_waitingWindowScenes = v18;

    objc_storeStrong((id *)&v17->_sessionFactory, a6);
    objc_storeStrong((id *)&v17->_service, a3);
    objc_storeStrong((id *)&v17->_userInterfaceStyleProvider, a4);
    objc_msgSend(v13, "setSessionFactory:", v17);
    objc_storeStrong((id *)&v17->_displayLayoutCoordinator, a5);
    objc_storeStrong((id *)&v17->_externalDependencyProvider, a7);
    objc_initWeak(&location, v17);
    v20 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v25, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v21 = objc_claimAutoreleasedReturnValue();
    stateDumpHandle = v17->_stateDumpHandle;
    v17->_stateDumpHandle = (BSInvalidatable *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v17;
}

id __141__SBContinuitySessionManager__initWithService_userInterfaceStyleProvider_displayLayoutCoordinator_sessionFactory_externalDependencyProvider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)MEMORY[0x1E0D01750];
    objc_msgSend(MEMORY[0x1E0D01758], "debugStyle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "descriptionForRootObject:withStyle:", WeakRetained, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)dealloc
{
  BSInvalidatable *stateDumpHandle;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_stateDumpHandle, "invalidate");
  stateDumpHandle = self->_stateDumpHandle;
  self->_stateDumpHandle = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBContinuitySessionManager;
  -[SBContinuitySessionManager dealloc](&v4, sel_dealloc);
}

- (void)activate
{
  void *v3;

  -[SBContinuityDisplayLayoutCoordinator start](self->_displayLayoutCoordinator, "start");
  -[SBContinuityDisplayLayoutCoordinator rootPublisher](self->_displayLayoutCoordinator, "rootPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activate");

  -[SBContinuitySessionService activate](self->_service, "activate");
}

- (SBUserInterfaceStyleProvider)userInterfaceStyleProvider
{
  return (SBUserInterfaceStyleProvider *)self->_userInterfaceStyleProvider;
}

- (SBOverridableUserInterfaceStyleProvider)overridableUserInterfaceStyleProvider
{
  return self->_userInterfaceStyleProvider;
}

- (id)registerWindowScene:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(v4, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ContinuityScene<%p>-Delegate<%p>"), v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_FBSScene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hostHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "auditToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hasEntitlement:", *MEMORY[0x1E0DAC890]);

  if ((v12 & 1) == 0)
  {
    SBLogContinuitySession();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBContinuitySessionManager registerWindowScene:].cold.2((uint64_t)v8);
    goto LABEL_14;
  }
  if (!v7)
  {
    SBLogContinuitySession();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[SBContinuitySessionManager registerWindowScene:].cold.1((uint64_t)v8, v4, v18);
LABEL_14:

    v16 = 0;
    goto LABEL_15;
  }
  objc_initWeak(&location, self);
  v13 = objc_alloc(MEMORY[0x1E0D01868]);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50__SBContinuitySessionManager_registerWindowScene___block_invoke;
  v20[3] = &unk_1E8EB2468;
  objc_copyWeak(&v24, &location);
  v14 = v4;
  v21 = v14;
  v22 = v7;
  v15 = v8;
  v23 = v15;
  v16 = (void *)objc_msgSend(v13, "initWithIdentifier:forReason:invalidationBlock:", v15, CFSTR("SBContinuitySessionManager registerWindowScene:"), v20);
  SBLogContinuitySession();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = v15;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[SessionManager] Added waiting scene: %{public}@", buf, 0xCu);
  }

  -[NSMutableArray insertObject:atIndex:](self->_waitingWindowScenes, "insertObject:atIndex:", v14, 0);
  -[SBContinuitySessionManager _noteSceneOrSessionIsWaiting](self, "_noteSceneOrSessionIsWaiting");

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
LABEL_15:

  return v16;
}

void __50__SBContinuitySessionManager_registerWindowScene___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[5], "removeObject:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "connectedSession");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "noteSceneDisconnected:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      SBLogContinuitySession();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 48);
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ unregistered but has no memory of its session", (uint8_t *)&v8, 0xCu);
      }

    }
  }

}

- (id)registerSystemApertureWindowScene:(id)a3
{
  return -[SBContinuitySessionManager _registerSystemApertureScene:sessionConnectionCallout:sessionDisconnectionCallout:](self, "_registerSystemApertureScene:sessionConnectionCallout:sessionDisconnectionCallout:", a3, &__block_literal_global_47_2, &__block_literal_global_48_2);
}

void __64__SBContinuitySessionManager_registerSystemApertureWindowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a2;
  objc_msgSend(v7, "noteSystemApertureSceneConnected:", a3);
  objc_msgSend(v6, "didConnectToSession:", v7);

}

uint64_t __64__SBContinuitySessionManager_registerSystemApertureWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSystemApertureSceneDisconnected:");
}

- (id)registerSystemApertureCurtainWindowScene:(id)a3
{
  return -[SBContinuitySessionManager _registerSystemApertureScene:sessionConnectionCallout:sessionDisconnectionCallout:](self, "_registerSystemApertureScene:sessionConnectionCallout:sessionDisconnectionCallout:", a3, &__block_literal_global_49, &__block_literal_global_50_0);
}

void __71__SBContinuitySessionManager_registerSystemApertureCurtainWindowScene___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a2;
  objc_msgSend(v7, "noteSystemApertureCurtainSceneConnected:", a3);
  objc_msgSend(v6, "didConnectToSession:", v7);

}

uint64_t __71__SBContinuitySessionManager_registerSystemApertureCurtainWindowScene___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "noteSystemApertureCurtainSceneDisconnected:");
}

- (id)_registerSystemApertureScene:(id)a3 sessionConnectionCallout:(id)a4 sessionDisconnectionCallout:(id)a5
{
  id v8;
  void (**v9)(id, SBContinuitySession *, id, id);
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  SBContinuitySession *currentSession;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, SBContinuitySession *, id, id))a4;
  v10 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(v8, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v8, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SystemApertureScene<%p>-Delegate<%p>"), v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_FBSScene");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hostHandle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "auditToken");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasEntitlement:", *MEMORY[0x1E0DAC890]);

  if ((v18 & 1) == 0)
  {
    SBLogContinuitySession();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBContinuitySessionManager registerWindowScene:].cold.2((uint64_t)v14);
    goto LABEL_11;
  }
  if (!v13)
  {
    SBLogContinuitySession();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SBContinuitySessionManager _registerSystemApertureScene:sessionConnectionCallout:sessionDisconnectionCallout:].cold.1((uint64_t)v14, v8, v25);
LABEL_11:

LABEL_21:
    v24 = 0;
    goto LABEL_22;
  }
  currentSession = self->_currentSession;
  if (!currentSession)
  {
    SBLogContinuitySession();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v14;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Attempted to register a scene %{public}@ but we don't have an active session", (uint8_t *)location, 0xCu);
    }
    goto LABEL_20;
  }
  -[SBContinuitySession mainWindowScene](currentSession, "mainWindowScene");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    SBLogContinuitySession();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138543362;
      *(id *)((char *)location + 4) = v14;
      _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_DEFAULT, "Attempted to register a scene %{public}@ the current session doesn't have a main window scene", (uint8_t *)location, 0xCu);
    }
LABEL_20:

    goto LABEL_21;
  }
  objc_initWeak(location, self);
  v21 = objc_alloc(MEMORY[0x1E0D01868]);
  v28[1] = 3221225472;
  v28[2] = __112__SBContinuitySessionManager__registerSystemApertureScene_sessionConnectionCallout_sessionDisconnectionCallout___block_invoke;
  v28[3] = &unk_1E8EB2530;
  v28[0] = MEMORY[0x1E0C809B0];
  objc_copyWeak(&v33, location);
  v22 = v13;
  v29 = v22;
  v32 = v10;
  v23 = v8;
  v30 = v23;
  v31 = v14;
  v24 = (void *)objc_msgSend(v21, "initWithIdentifier:forReason:invalidationBlock:", v31, CFSTR("SBContinuitySessionManager registerSystemApertureWindowScene:"), v28);
  v9[2](v9, self->_currentSession, v23, v22);

  objc_destroyWeak(&v33);
  objc_destroyWeak(location);
LABEL_22:

  return v24;
}

void __112__SBContinuitySessionManager__registerSystemApertureScene_sessionConnectionCallout_sessionDisconnectionCallout___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 32), "connectedSession");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (WeakRetained)
  {
    if (v3)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }
    else
    {
      SBLogContinuitySession();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(a1 + 48);
        v7 = 138543362;
        v8 = v6;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Scene %{public}@ unregistered but has no memory of its session", (uint8_t *)&v7, 0xCu);
      }

    }
  }

}

- (void)_noteSceneOrSessionIsWaiting
{
  void *v4;
  SBContinuitySession *currentSession;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMutableArray firstObject](self->_waitingWindowScenes, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    currentSession = self->_currentSession;
    if (currentSession && !-[SBContinuitySession isSceneConnected](currentSession, "isSceneConnected"))
    {
      -[NSMutableArray removeObject:](self->_waitingWindowScenes, "removeObject:", v4);
      SBLogContinuitySession();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "_sceneIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBContinuitySession succinctDescription](self->_currentSession, "succinctDescription");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = (uint64_t)v11;
        v18 = 2114;
        v19 = v12;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[SessionManager] Connecting window scene %{public}@ to session %{public}@", (uint8_t *)&v16, 0x16u);

      }
      objc_msgSend(v4, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) == 0
        || (objc_msgSend(v4, "delegate"), (v6 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuitySessionManager.m"), 278, CFSTR("the waiting scene does not have a SBContinuitySessionSceneDelegate"));

        v6 = 0;
      }
      -[SBContinuitySession noteSceneConnected:](self->_currentSession, "noteSceneConnected:", v4);
      -[NSObject didConnectToSession:](v6, "didConnectToSession:", self->_currentSession);
    }
    else
    {
      SBLogContinuitySession();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v4, "_sceneIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        v8 = (void *)v7;
        v9 = CFSTR("current session already has a scene");
        if (!self->_currentSession)
          v9 = CFSTR("current session is nil");
        v16 = 138543618;
        v17 = v7;
        v18 = 2114;
        v19 = v9;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[SessionManager] waiting scene %{public}@ can't connect to session %{public}@", (uint8_t *)&v16, 0x16u);

      }
    }

  }
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBContinuitySessionManager *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBContinuitySessionManager_appendDescriptionToStream___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

id __56__SBContinuitySessionManager_appendDescriptionToStream___block_invoke(uint64_t a1)
{
  id v2;
  id result;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64), CFSTR("currentSession"));
  result = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "count");
  if (result)
    return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40), CFSTR("waitingWindowScenes"));
  return result;
}

- (id)newContinuitySession
{
  NSObject *v3;
  SBContinuitySessionFactory *sessionFactory;
  SBContinuitySession *v5;
  SBContinuitySession *v6;
  SBContinuitySession *currentSession;
  NSObject *v8;
  SBContinuitySession *v9;
  void *v10;
  SBContinuitySession *v11;
  SBContinuityDisplayLayoutPublisher *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  SBLogContinuitySession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[SessionManager] Creating new session...", (uint8_t *)&v16, 2u);
  }

  sessionFactory = self->_sessionFactory;
  if (sessionFactory)
    v5 = (SBContinuitySession *)-[SBContinuitySessionFactory newContinuitySession](sessionFactory, "newContinuitySession");
  else
    v5 = objc_alloc_init(SBContinuitySession);
  v6 = v5;
  currentSession = self->_currentSession;
  if (currentSession)
  {
    SBLogContinuitySession();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SBContinuitySessionManager newContinuitySession].cold.1(&self->_currentSession);

    -[SBContinuitySession removeStateObserver:](self->_currentSession, "removeStateObserver:", self);
    v9 = self->_currentSession;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("terminal.new-session-created"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySession invalidateForReasons:](v9, "invalidateForReasons:", v10);

    v11 = self->_currentSession;
    self->_currentSession = 0;

  }
  v12 = -[SBContinuityDisplayLayoutPublisher initWithCoordinator:]([SBContinuityDisplayLayoutPublisher alloc], "initWithCoordinator:", self->_displayLayoutCoordinator);
  -[SBContinuitySession setDisplayLayoutPublisher:](v6, "setDisplayLayoutPublisher:", v12);
  SBLogContinuitySession();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    -[SBContinuitySession succinctDescription](v6, "succinctDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v14;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[SessionManager] Created new session: %{public}@", (uint8_t *)&v16, 0xCu);

  }
  objc_storeStrong((id *)&self->_currentSession, v6);
  -[SBContinuitySession addStateObserver:](v6, "addStateObserver:", self);
  if (!currentSession)
    -[SBContinuitySessionManagerExternalDependencyProviding noteContinuitySessionNegotiationStarted](self->_externalDependencyProvider, "noteContinuitySessionNegotiationStarted");
  -[SBContinuitySessionManager _noteSceneOrSessionIsWaiting](self, "_noteSceneOrSessionIsWaiting");

  return v6;
}

- (void)continuitySessionDidUpdateState:(id)a3
{
  SBContinuitySession *v4;
  SBContinuitySession *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  SBContinuitySession *currentSession;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (SBContinuitySession *)a3;
  v5 = v4;
  if (self->_currentSession == v4)
  {
    v6 = -[SBContinuitySession state](v4, "state");
    if (v6 == 11)
    {
      SBLogContinuitySession();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        -[SBContinuitySession succinctDescription](v5, "succinctDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v8;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[SessionManager] current session %{public}@ is invalid - cleaning up", (uint8_t *)&v10, 0xCu);

      }
      -[SBContinuitySession removeStateObserver:](self->_currentSession, "removeStateObserver:", self);
      currentSession = self->_currentSession;
      self->_currentSession = 0;

      -[SBContinuitySessionManagerExternalDependencyProviding noteContinuitySessionEnded](self->_externalDependencyProvider, "noteContinuitySessionEnded");
    }
    else if (v6 == 10)
    {
      -[SBContinuitySessionManagerExternalDependencyProviding noteContinuitySessionIsActive](self->_externalDependencyProvider, "noteContinuitySessionIsActive");
    }
  }

}

- (SBContinuitySession)currentSession
{
  return self->_currentSession;
}

- (void)setCurrentSession:(id)a3
{
  objc_storeStrong((id *)&self->_currentSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentSession, 0);
  objc_storeStrong((id *)&self->_externalDependencyProvider, 0);
  objc_storeStrong((id *)&self->_displayLayoutCoordinator, 0);
  objc_storeStrong((id *)&self->_waitingWindowScenes, 0);
  objc_storeStrong((id *)&self->_userInterfaceStyleProvider, 0);
  objc_storeStrong((id *)&self->_stateDumpHandle, 0);
  objc_storeStrong((id *)&self->_sessionFactory, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

+ (void)areContinuitySessionsAllowed
{
  OUTLINED_FUNCTION_0_3(&dword_1D0540000, a1, a3, "continuity session not allowed - this device doesn't support this feature", a5, a6, a7, a8, 0);
}

- (void)registerWindowScene:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v7, "Attempted to register a scene %{public}@ who's delegate doesn't conform to SBContinuitySessionSceneDelegate: %{public}@", v8);

  OUTLINED_FUNCTION_20();
}

- (void)registerWindowScene:(uint64_t)a1 .cold.2(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v1, v2, "Attempted to register a scene %{public}@ from an untrusted host: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

- (void)_registerSystemApertureScene:(uint64_t)a1 sessionConnectionCallout:(void *)a2 sessionDisconnectionCallout:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_6();
  OUTLINED_FUNCTION_1_0(&dword_1D0540000, a3, v7, "Attempted to register a scene %{public}@ who's delegate doesn't conform to SBContinuitySessionSceneDelegate: %{public}@", v8);

  OUTLINED_FUNCTION_20();
}

- (void)newContinuitySession
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_2_13();
  OUTLINED_FUNCTION_2_8(&dword_1D0540000, v1, v2, "[SessionManager] Current session %{public}@ is being replaced by session %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_2_0();
}

@end
