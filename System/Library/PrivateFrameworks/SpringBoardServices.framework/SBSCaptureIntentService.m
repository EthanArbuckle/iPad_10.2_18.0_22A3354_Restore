@implementation SBSCaptureIntentService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_22);
  return (id)sharedInstance_service_1;
}

void __41__SBSCaptureIntentService_sharedInstance__block_invoke()
{
  SBSCaptureIntentService *v0;
  void *v1;

  v0 = objc_alloc_init(SBSCaptureIntentService);
  v1 = (void *)sharedInstance_service_1;
  sharedInstance_service_1 = (uint64_t)v0;

}

- (SBSCaptureIntentService)init
{
  SBSCaptureIntentService *v2;
  SBSCaptureIntentService *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BSServiceConnection *lock_connection;
  BSServiceConnection *v10;
  _QWORD v12[4];
  SBSCaptureIntentService *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBSCaptureIntentService;
  v2 = -[SBSCaptureIntentService init](&v14, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (void *)MEMORY[0x1E0D03458];
    objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBSCaptureIntentServiceSpecification identifier](SBSCaptureIntentServiceSpecification, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endpointForMachName:service:instance:", v5, v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      lock_connection = v3->_lock_connection;
      v3->_lock_connection = (BSServiceConnection *)v8;

      v10 = v3->_lock_connection;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __31__SBSCaptureIntentService_init__block_invoke;
      v12[3] = &unk_1E288CF30;
      v13 = v3;
      -[BSServiceConnection configureConnection:](v10, "configureConnection:", v12);
      -[BSServiceConnection activate](v3->_lock_connection, "activate");

    }
  }
  return v3;
}

void __31__SBSCaptureIntentService_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a2;
  +[SBSCaptureIntentServiceSpecification interface](SBSCaptureIntentServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_6_0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SBSCaptureIntentService_init__block_invoke_7;
  v6[3] = &unk_1E288CF08;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "setInvalidationHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __31__SBSCaptureIntentService_init__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  SBLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_18EB52000, v0, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: interrupted", v1, 2u);
  }

}

void __31__SBSCaptureIntentService_init__block_invoke_7(uint64_t a1)
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
    _os_log_impl(&dword_18EB52000, v2, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: remotely invalidated", v4, 2u);
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
  v15 = CFSTR("SBSCaptureIntentService.m");
  v16 = 1024;
  v17 = 67;
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

- (void)setContext:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  SBLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18EB52000, v6, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: Setting capture intent context for bundle identifier", v8, 2u);
  }

  -[BSServiceConnection remoteTarget](self->_lock_connection, "remoteTarget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCaptureIntentContext:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)context
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v8[16];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  SBLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_18EB52000, v4, OS_LOG_TYPE_DEFAULT, "SBSCaptureIntentService: Retrieving capture intent context for bundle identifier", v8, 2u);
  }

  -[BSServiceConnection remoteTarget](self->_lock_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captureIntentContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end
