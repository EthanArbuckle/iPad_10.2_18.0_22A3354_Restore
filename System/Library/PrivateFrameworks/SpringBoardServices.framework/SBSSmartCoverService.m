@implementation SBSSmartCoverService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_5);
  return (id)sharedInstance_service_0;
}

void __38__SBSSmartCoverService_sharedInstance__block_invoke()
{
  SBSSmartCoverService *v0;
  void *v1;

  v0 = objc_alloc_init(SBSSmartCoverService);
  v1 = (void *)sharedInstance_service_0;
  sharedInstance_service_0 = (uint64_t)v0;

}

- (SBSSmartCoverService)init
{
  SBSSmartCoverService *v2;
  SBSSmartCoverService *v3;
  void *v4;
  uint64_t v5;
  SBSSmartCoverService *v6;
  uint64_t v7;
  BSCompoundAssertion *observerAssertion;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  BSServiceConnection *lock_connection;
  BSServiceConnection *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  SBSSmartCoverService *v21;
  _QWORD v22[4];
  SBSSmartCoverService *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)SBSSmartCoverService;
  v2 = -[SBSSmartCoverService init](&v24, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E0D01718];
    v5 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __28__SBSSmartCoverService_init__block_invoke;
    v22[3] = &unk_1E288D360;
    v6 = v2;
    v23 = v6;
    objc_msgSend(v4, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBSSmartCoverObserver"), v22);
    v7 = objc_claimAutoreleasedReturnValue();
    observerAssertion = v6->_observerAssertion;
    v6->_observerAssertion = (BSCompoundAssertion *)v7;

    v9 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSSmartCoverServiceSpecification identifier](SBSSmartCoverServiceSpecification, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endpointForMachName:service:instance:", v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v12);
      v13 = objc_claimAutoreleasedReturnValue();
      lock_connection = v6->_lock_connection;
      v6->_lock_connection = (BSServiceConnection *)v13;

      v15 = v6->_lock_connection;
      v17 = v5;
      v18 = 3221225472;
      v19 = __28__SBSSmartCoverService_init__block_invoke_2;
      v20 = &unk_1E288CF30;
      v21 = v6;
      -[BSServiceConnection configureConnection:](v15, "configureConnection:", &v17);
      -[BSServiceConnection activate](v6->_lock_connection, "activate", v17, v18, v19, v20);

    }
  }
  return v3;
}

void __28__SBSSmartCoverService_init__block_invoke(uint64_t a1, void *a2)
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  os_unfair_lock_lock(v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "isActive");

  objc_msgSend(v6, "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWantsSmartCoverStateChanges:", v8);

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void __28__SBSSmartCoverService_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = a2;
  +[SBSSmartCoverServiceSpecification interface](SBSSmartCoverServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __28__SBSSmartCoverService_init__block_invoke_3;
  v9[3] = &unk_1E288CF08;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __28__SBSSmartCoverService_init__block_invoke_21;
  v7[3] = &unk_1E288CF08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __28__SBSSmartCoverService_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id *WeakRetained;
  id *v6;
  int v7;
  void *v8;
  __int16 v9[8];

  v3 = a2;
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 0;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSSmartCoverService: interrupted - resyncing state", (uint8_t *)v9, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained[3], "isActive");
    objc_msgSend(v3, "activate");
    if (v7)
    {
      objc_msgSend(v3, "remoteTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setWantsSmartCoverStateChanges:", MEMORY[0x1E0C9AAB0]);

    }
  }

}

void __28__SBSSmartCoverService_init__block_invoke_21(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  SBLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_DEFAULT, "SBSSmartCoverService: invalidated remotely", v4, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 2);
  objc_msgSend(*((id *)WeakRetained + 2), "invalidate");
  v3 = (void *)*((_QWORD *)WeakRetained + 2);
  *((_QWORD *)WeakRetained + 2) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 2);
}

- (void)dealloc
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSSmartCoverService.m");
  v16 = 1024;
  v17 = 110;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_18EB52000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  BSServiceConnection *lock_connection;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection invalidate](self->_lock_connection, "invalidate");
  lock_connection = self->_lock_connection;
  self->_lock_connection = 0;

  os_unfair_lock_lock(p_lock);
}

- (id)registerSmartCoverStateObserver:(id)a3
{
  BSCompoundAssertion *observerAssertion;
  id v4;
  void *v5;
  void *v6;

  observerAssertion = self->_observerAssertion;
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:withContext:](observerAssertion, "acquireForReason:withContext:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)observeSmartCoverStateDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "integerValue");
  -[BSCompoundAssertion context](self->_observerAssertion, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "smartCoverStateDidChange:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerAssertion, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end
