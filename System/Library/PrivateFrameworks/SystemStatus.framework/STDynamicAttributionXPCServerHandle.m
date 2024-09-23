@implementation STDynamicAttributionXPCServerHandle

+ (id)sharedMachServiceServerHandle
{
  if (qword_1ED0CB4A0 != -1)
    dispatch_once(&qword_1ED0CB4A0, &__block_literal_global_16);
  return (id)_MergedGlobals_15;
}

void __68__STDynamicAttributionXPCServerHandle_sharedMachServiceServerHandle__block_invoke()
{
  STDynamicAttributionXPCServerHandle *v0;
  void *v1;

  v0 = objc_alloc_init(STDynamicAttributionXPCServerHandle);
  v1 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = (uint64_t)v0;

}

- (STDynamicAttributionXPCServerHandle)init
{
  return -[STDynamicAttributionXPCServerHandle initWithXPCConnectionProvider:](self, "initWithXPCConnectionProvider:", &__block_literal_global_2_1);
}

id __43__STDynamicAttributionXPCServerHandle_init__block_invoke()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.systemstatus.activityattribution"), 0);
}

- (STDynamicAttributionXPCServerHandle)initWithXPCConnectionProvider:(id)a3
{
  id v4;
  STDynamicAttributionXPCServerHandle *v5;
  STDynamicAttributionXPCServerHandle *v6;
  NSMutableSet *v7;
  NSMutableSet *lock_clients;
  uint64_t v9;
  id lock_connectionProvider;
  uint64_t v11;
  STServerLaunchObservable *serverLaunchObservable;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)STDynamicAttributionXPCServerHandle;
  v5 = -[STDynamicAttributionXPCServerHandle init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    lock_clients = v6->_lock_clients;
    v6->_lock_clients = v7;

    v9 = objc_msgSend(v4, "copy");
    lock_connectionProvider = v6->_lock_connectionProvider;
    v6->_lock_connectionProvider = (id)v9;

    +[STServerLaunchMonitor sharedInstance](STServerLaunchMonitor, "sharedInstance");
    v11 = objc_claimAutoreleasedReturnValue();
    serverLaunchObservable = v6->_serverLaunchObservable;
    v6->_serverLaunchObservable = (STServerLaunchObservable *)v11;

    -[STServerLaunchObservable addObserver:](v6->_serverLaunchObservable, "addObserver:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[STServerLaunchObservable removeObserver:](self->_serverLaunchObservable, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)STDynamicAttributionXPCServerHandle;
  -[STDynamicAttributionXPCServerHandle dealloc](&v3, sel_dealloc);
}

- (_QWORD)_lock_remoteProxy
{
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[2];
    if (!v2)
    {
      (*(void (**)(void))(v1[3] + 16))();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)v1[2];
      v1[2] = v3;

      v5 = (void *)v1[2];
      STDynamicAttributionXPCServerInterface();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setRemoteObjectInterface:", v6);

      v7 = (void *)v1[2];
      STDynamicAttributionXPCClientInterface();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setExportedInterface:", v8);

      objc_msgSend((id)v1[2], "setExportedObject:", v1);
      objc_initWeak(&location, v1);
      v9 = (void *)v1[2];
      v10 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke;
      v15[3] = &unk_1E91E4B50;
      objc_copyWeak(&v16, &location);
      objc_msgSend(v9, "setInterruptionHandler:", v15);
      v11 = (void *)v1[2];
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke_8;
      v13[3] = &unk_1E91E4B50;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v11, "setInvalidationHandler:", v13);
      objc_msgSend((id)v1[2], "resume");
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      v2 = (void *)v1[2];
    }
    objc_msgSend(v2, "remoteObjectProxy");
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    STSystemStatusLogDynamicAttribution();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = 138412290;
      v4 = WeakRetained;
      _os_log_impl(&dword_1D12C7000, v2, OS_LOG_TYPE_DEFAULT, "%@: Connection interrupted", (uint8_t *)&v3, 0xCu);
    }

  }
}

void __56__STDynamicAttributionXPCServerHandle__lock_remoteProxy__block_invoke_8(uint64_t a1)
{
  NSObject *v2;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v4;
  void *v5;
  uint8_t v6[16];

  STSystemStatusLogDynamicAttribution();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v6 = 0;
    _os_log_error_impl(&dword_1D12C7000, v2, OS_LOG_TYPE_ERROR, "STDynamicAttributionXPCServerHandle connection was invalidated", v6, 2u);
  }

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 2);
    v5 = *(void **)&v4[4]._os_unfair_lock_opaque;
    *(_QWORD *)&v4[4]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v4 + 2);
  }

}

- (void)setLocalizableAttributionKey:(id)a3 andApplication:(id)a4 forClient:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  STDynamicAttributionXPCServerHandle *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  int v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138413314;
    v16 = v12;
    v17 = 2112;
    v18 = v14;
    v19 = 2048;
    v20 = self;
    v21 = 2112;
    v22 = CFSTR("STDynamicAttributionXPCServerHandle.m");
    v23 = 1024;
    v24 = 114;
    _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v15, 0x30u);

  }
  __break(0);
}

- (void)setAttributionLocalizableKey:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  STDynamicAttributionXPCServerHandle *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;

  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413314;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = CFSTR("STDynamicAttributionXPCServerHandle.m");
    v21 = 1024;
    v22 = 118;
    _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v13, 0x30u);

  }
  __break(0);
}

- (void)setAttributionStringWithFormat:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  STDynamicAttributionXPCServerHandle *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;

  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413314;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = CFSTR("STDynamicAttributionXPCServerHandle.m");
    v21 = 1024;
    v22 = 122;
    _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v13, 0x30u);

  }
  __break(0);
}

- (void)setAttributionWebsiteString:(id)a3 maskingClientAuditToken:(id *)a4 forClient:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  STDynamicAttributionXPCServerHandle *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;

  v8 = a3;
  v9 = a5;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138413314;
    v14 = v10;
    v15 = 2112;
    v16 = v12;
    v17 = 2048;
    v18 = self;
    v19 = 2112;
    v20 = CFSTR("STDynamicAttributionXPCServerHandle.m");
    v21 = 1024;
    v22 = 126;
    _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %@ of <%@:%p> (%@:%i)", (uint8_t *)&v13, 0x30u);

  }
  __break(0);
}

- (void)subscribeToUpdates:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  STDynamicAttributionXPCServerHandle *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("client != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = CFSTR("STDynamicAttributionXPCServerHandle.m");
      v22 = 1024;
      v23 = 130;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D12FE1B0);
  }
  v6 = v5;
  STSystemStatusLogDynamicAttribution();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1D12C7000, v7, OS_LOG_TYPE_DEFAULT, "%@: Activating", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  if (-[NSMutableSet count](self->_lock_clients, "count"))
  {
    v8 = 0;
  }
  else
  {
    -[STDynamicAttributionXPCServerHandle _lock_remoteProxy](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    STSystemStatusLogDynamicAttribution();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_DEFAULT, "Initiating XPC connection for initial client", buf, 2u);
    }

  }
  -[NSMutableSet addObject:](self->_lock_clients, "addObject:", v6);
  os_unfair_lock_unlock(&self->_lock);
  if (v8)
    objc_msgSend(v8, "subscribeToUpdates");

}

- (void)unsubscribeFromUpdates:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSXPCConnection *lock_connection;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  STDynamicAttributionXPCServerHandle *v19;
  __int16 v20;
  const __CFString *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("client != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v15 = v11;
      v16 = 2114;
      v17 = v13;
      v18 = 2048;
      v19 = self;
      v20 = 2114;
      v21 = CFSTR("STDynamicAttributionXPCServerHandle.m");
      v22 = 1024;
      v23 = 148;
      v24 = 2114;
      v25 = v10;
      _os_log_error_impl(&dword_1D12C7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D12FE3E8);
  }
  v6 = v5;
  STSystemStatusLogDynamicAttribution();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1D12C7000, v7, OS_LOG_TYPE_DEFAULT, "%@: Deactivating", buf, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableSet removeObject:](self->_lock_clients, "removeObject:", v6);
  if (!-[NSMutableSet count](self->_lock_clients, "count"))
  {
    STSystemStatusLogDynamicAttribution();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D12C7000, v8, OS_LOG_TYPE_DEFAULT, "Tearing down XPC connection after last client", buf, 2u);
    }

    -[NSXPCConnection invalidate](self->_lock_connection, "invalidate");
    lock_connection = self->_lock_connection;
    self->_lock_connection = 0;

  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void)currentAttributionsDidChange:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSMutableSet copy](self->_lock_clients, "copy");
  os_unfair_lock_unlock(p_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "currentAttributionsDidChange:", v4, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)didObserveServerLaunch:(id)a3
{
  NSObject *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  STDynamicAttributionXPCServerHandle *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  STSystemStatusLogDynamicAttribution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = self;
    _os_log_impl(&dword_1D12C7000, v4, OS_LOG_TYPE_DEFAULT, "%@: Observed server launch, resubscribing to updates if necessary", buf, 0xCu);
  }

  if (self)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_connection)
    {
      v6 = (void *)-[NSMutableSet copy](self->_lock_clients, "copy");
      -[STDynamicAttributionXPCServerHandle _lock_remoteProxy](self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
      v6 = 0;
    }
    os_unfair_lock_unlock(p_lock);
    if (objc_msgSend(v6, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, buf, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        v12 = MEMORY[0x1E0C9AA60];
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "currentAttributionsDidChange:", v12, (_QWORD)v14);
          }
          while (v10 != v13);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, buf, 16);
        }
        while (v10);
      }

      objc_msgSend(v7, "subscribeToUpdates");
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong((id *)&self->_lock_clients, 0);
  objc_storeStrong(&self->_lock_connectionProvider, 0);
  objc_storeStrong((id *)&self->_lock_connection, 0);
}

@end
