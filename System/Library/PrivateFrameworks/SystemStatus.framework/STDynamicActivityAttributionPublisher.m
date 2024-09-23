@implementation STDynamicActivityAttributionPublisher

+ (id)sharedInstance
{
  objc_opt_self();
  if (qword_1ED0CB460 != -1)
    dispatch_once(&qword_1ED0CB460, &__block_literal_global_11);
  return (id)_MergedGlobals_11;
}

void __55__STDynamicActivityAttributionPublisher_sharedInstance__block_invoke()
{
  STDynamicActivityAttributionPublisher *v0;
  void *v1;

  v0 = objc_alloc_init(STDynamicActivityAttributionPublisher);
  v1 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = (uint64_t)v0;

}

+ (void)setCurrentAttributionKey:(id)a3 andApp:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD *v8;
  id v9;
  id v10;
  NSObject *v11;
  _BYTE v12[24];
  void *v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    STSystemStatusLogDynamicAttribution();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v12 = 138543618;
      *(_QWORD *)&v12[4] = v5;
      *(_WORD *)&v12[12] = 2114;
      *(_QWORD *)&v12[14] = v6;
      _os_log_impl(&dword_1D12C7000, v7, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionKey: %{public}@, andApp: %{public}@", v12, 0x16u);
    }

  }
  +[STDynamicActivityAttributionPublisher sharedInstance]();
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  v10 = v6;
  if (v8)
  {
    v11 = v8[1];
    *(_QWORD *)v12 = MEMORY[0x1E0C809B0];
    *(_QWORD *)&v12[8] = 3221225472;
    *(_QWORD *)&v12[16] = __78__STDynamicActivityAttributionPublisher_setCurrentAttributionKey_application___block_invoke;
    v13 = &unk_1E91E5058;
    v14 = v8;
    v15 = v9;
    v16 = v10;
    dispatch_sync(v11, v12);

  }
}

+ (void)setCurrentAttributionLocalizableKey:(id)a3 auditToken:(id *)a4
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  _BYTE buf[24];
  void *v14;
  _QWORD *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    STSystemStatusLogDynamicAttribution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = BSPIDForAuditToken();
      _os_log_impl(&dword_1D12C7000, v6, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionLocalizableKey: %{public}@, auditToken(pid): %{public}d", buf, 0x12u);
    }

  }
  +[STDynamicActivityAttributionPublisher sharedInstance]();
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)a4->var0;
  v12 = *(_OWORD *)&a4->var0[4];
  v8 = v5;
  v9 = v8;
  if (v7)
  {
    v10 = v7[1];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __101__STDynamicActivityAttributionPublisher_setCurrentAttributionLocalizableKey_maskingClientAuditToken___block_invoke;
    v14 = &unk_1E91E56D8;
    v15 = v7;
    v16 = v8;
    v17 = v11;
    v18 = v12;
    dispatch_sync(v10, buf);

  }
}

+ (void)setCurrentAttributionStringWithFormat:(id)a3 auditToken:(id *)a4
{
  id v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  void *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  _BYTE buf[24];
  void *v14;
  _QWORD *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    STSystemStatusLogDynamicAttribution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = BSPIDForAuditToken();
      _os_log_impl(&dword_1D12C7000, v6, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionStringWithFormat: %{public}@, auditToken(pid): %{public}d", buf, 0x12u);
    }

  }
  +[STDynamicActivityAttributionPublisher sharedInstance]();
  v7 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)a4->var0;
  v12 = *(_OWORD *)&a4->var0[4];
  v8 = v5;
  v9 = v8;
  if (v7)
  {
    v10 = v7[1];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __103__STDynamicActivityAttributionPublisher_setCurrentAttributionStringWithFormat_maskingClientAuditToken___block_invoke;
    v14 = &unk_1E91E56D8;
    v15 = v7;
    v16 = v8;
    v17 = v11;
    v18 = v12;
    dispatch_sync(v10, buf);

  }
}

+ (void)setCurrentAttributionWebsiteString:(id)a3 auditToken:(id *)a4
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  _QWORD *v8;
  id v9;
  void *v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  _BYTE buf[24];
  void *v15;
  _QWORD *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
    dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
  if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
  {
    STSystemStatusLogDynamicAttribution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5)
        v7 = CFSTR("non-nil");
      else
        v7 = CFSTR("nil");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1026;
      *(_DWORD *)&buf[14] = BSPIDForAuditToken();
      _os_log_impl(&dword_1D12C7000, v6, OS_LOG_TYPE_DEFAULT, "setCurrentAttributionWebsiteString: %{public}@, auditToken(pid): %{public}d", buf, 0x12u);
    }

  }
  +[STDynamicActivityAttributionPublisher sharedInstance]();
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)a4->var0;
  v13 = *(_OWORD *)&a4->var0[4];
  v9 = v5;
  v10 = v9;
  if (v8)
  {
    v11 = v8[1];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __100__STDynamicActivityAttributionPublisher_setCurrentAttributionWebsiteString_maskingClientAuditToken___block_invoke;
    v15 = &unk_1E91E56D8;
    v16 = v8;
    v17 = v9;
    v18 = v12;
    v19 = v13;
    dispatch_sync(v11, buf);

  }
}

- (STDynamicActivityAttributionPublisher)init
{
  STDynamicActivityAttributionPublisher *v2;
  uint64_t Serial;
  OS_dispatch_queue *internalQueue;
  uint64_t v5;
  STServerLaunchObservable *serverLaunchObservable;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STDynamicActivityAttributionPublisher;
  v2 = -[STDynamicActivityAttributionPublisher init](&v8, sel_init);
  if (v2)
  {
    Serial = BSDispatchQueueCreateSerial();
    internalQueue = v2->_internalQueue;
    v2->_internalQueue = (OS_dispatch_queue *)Serial;

    +[STServerLaunchMonitor sharedInstance](STServerLaunchMonitor, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    serverLaunchObservable = v2->_serverLaunchObservable;
    v2->_serverLaunchObservable = (STServerLaunchObservable *)v5;

    -[STServerLaunchObservable addObserver:](v2->_serverLaunchObservable, "addObserver:", v2);
  }
  return v2;
}

- (void)dealloc
{
  STDynamicActivityAttributionPublisher *v2;
  objc_super v3;

  v2 = self;
  if (self)
    self = (STDynamicActivityAttributionPublisher *)self->_serverLaunchObservable;
  -[STDynamicActivityAttributionPublisher removeObserver:](self, "removeObserver:", v2);
  v3.receiver = v2;
  v3.super_class = (Class)STDynamicActivityAttributionPublisher;
  -[STDynamicActivityAttributionPublisher dealloc](&v3, sel_dealloc);
}

- (void)didObserveServerLaunch:(id)a3
{
  NSObject *v4;
  NSObject *internalQueue;
  _QWORD v6[6];

  STSystemStatusLogDynamicAttribution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1D12C7000, v4, OS_LOG_TYPE_DEFAULT, "Server launched, attempting to re-send cached attribution values if necessary", (uint8_t *)v6, 2u);
  }

  if (self)
  {
    internalQueue = self->_internalQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__STDynamicActivityAttributionPublisher__resendAttributionData__block_invoke;
    v6[3] = &unk_1E91E4E40;
    v6[4] = self;
    dispatch_async(internalQueue, v6);
  }
}

void __78__STDynamicActivityAttributionPublisher_setCurrentAttributionKey_application___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (objc_storeStrong((id *)(v2 + 24), *(id *)(a1 + 40)), (v3 = *(_QWORD *)(a1 + 32)) != 0))
  {
    objc_storeStrong((id *)(v3 + 32), *(id *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v4 = 0;
  }
  -[STDynamicActivityAttributionPublisher _internalQueue_sendAttributionKey:andApp:](v4, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_internalQueue_sendAttributionKey:(void *)a3 andApp:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint8_t v9[16];

  if (a1)
  {
    v5 = a3;
    v6 = a2;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      STSystemStatusLogDynamicAttribution();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1D12C7000, v7, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionKey:andApp:", v9, 2u);
      }

    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](a1);
    objc_msgSend(*(id *)(a1 + 16), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCurrentAttributionKey:application:reply:", v6, v5, &__block_literal_global_16);

  }
}

void __101__STDynamicActivityAttributionPublisher_setCurrentAttributionLocalizableKey_maskingClientAuditToken___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  id v4;
  NSObject *v5;
  void *v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = v3;
  if (v2)
  {
    v4 = v1;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      STSystemStatusLogDynamicAttribution();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionLocalizableKey:maskingClientAuditToken:", (uint8_t *)v7, 2u);
      }

    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](v2);
    objc_msgSend(*(id *)(v2 + 16), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v8;
    v7[1] = v9;
    objc_msgSend(v6, "setCurrentAttributionLocalizableKey:maskingClientAuditToken:reply:", v4, v7, &__block_literal_global_19_0);

  }
}

void __103__STDynamicActivityAttributionPublisher_setCurrentAttributionStringWithFormat_maskingClientAuditToken___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  id v4;
  NSObject *v5;
  void *v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = v3;
  if (v2)
  {
    v4 = v1;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      STSystemStatusLogDynamicAttribution();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionStringWithFormat:maskingClientAuditToken:", (uint8_t *)v7, 2u);
      }

    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](v2);
    objc_msgSend(*(id *)(v2 + 16), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v8;
    v7[1] = v9;
    objc_msgSend(v6, "setCurrentAttributionStringWithFormat:maskingClientAuditToken:reply:", v4, v7, &__block_literal_global_22);

  }
}

void __100__STDynamicActivityAttributionPublisher_setCurrentAttributionWebsiteString_maskingClientAuditToken___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  __int128 v3;
  id v4;
  NSObject *v5;
  void *v6;
  _OWORD v7[2];
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 64);
  v8 = *(_OWORD *)(a1 + 48);
  v9 = v3;
  if (v2)
  {
    v4 = v1;
    if (STSystemStatusIsInternalLoggingEnabled_onceToken != -1)
      dispatch_once(&STSystemStatusIsInternalLoggingEnabled_onceToken, &__block_literal_global_34);
    if (STSystemStatusIsInternalLoggingEnabled___internalLoggingEnabled)
    {
      STSystemStatusLogDynamicAttribution();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v7[0]) = 0;
        _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "_internalQueue_sendAttributionWebsiteString:maskingClientAuditToken:", (uint8_t *)v7, 2u);
      }

    }
    -[STDynamicActivityAttributionPublisher _internalQueue_setupXPCConnectionIfNecessary](v2);
    objc_msgSend(*(id *)(v2 + 16), "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_23);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v8;
    v7[1] = v9;
    objc_msgSend(v6, "setCurrentAttributionWebsiteString:maskingClientAuditToken:reply:", v4, v7, &__block_literal_global_25);

  }
}

- (void)_internalQueue_setupXPCConnectionIfNecessary
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.systemstatus.activityattribution"), 0);
    STDynamicAttributionXPCServerInterface();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setRemoteObjectInterface:", v3);

    objc_storeStrong((id *)(a1 + 16), v2);
    objc_initWeak(&location, (id)a1);
    objc_msgSend(v2, "setInterruptionHandler:", &__block_literal_global_10);
    v4 = MEMORY[0x1E0C809B0];
    v5 = 3221225472;
    v6 = __85__STDynamicActivityAttributionPublisher__internalQueue_setupXPCConnectionIfNecessary__block_invoke_11;
    v7 = &unk_1E91E4B50;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v2, "setInvalidationHandler:", &v4);
    objc_msgSend(v2, "resume", v4, v5, v6, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);

  }
}

void __85__STDynamicActivityAttributionPublisher__internalQueue_setupXPCConnectionIfNecessary__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  STSystemStatusLogDynamicAttribution();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D12C7000, v0, OS_LOG_TYPE_DEFAULT, "Connection interrupted", v1, 2u);
  }

}

void __85__STDynamicActivityAttributionPublisher__internalQueue_setupXPCConnectionIfNecessary__block_invoke_11(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[6];

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[1];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __63__STDynamicActivityAttributionPublisher__tearDownXPCConnection__block_invoke;
    v5[3] = &unk_1E91E4E40;
    v5[4] = v2;
    dispatch_async(v3, v5);
  }
  STSystemStatusLogDynamicAttribution();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5[0]) = 0;
    _os_log_impl(&dword_1D12C7000, v4, OS_LOG_TYPE_DEFAULT, "InvalidationHandler called, tearing down xpc connection", (uint8_t *)v5, 2u);
  }

}

void __63__STDynamicActivityAttributionPublisher__resendAttributionData__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (*(_QWORD *)(v1 + 16))
    {
      v2 = *(void **)(v1 + 32);
      v3 = *(id *)(v1 + 24);
      -[STDynamicActivityAttributionPublisher _internalQueue_sendAttributionKey:andApp:](v1, v3, v2);

    }
  }
}

void __63__STDynamicActivityAttributionPublisher__tearDownXPCConnection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

}

void __82__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionKey_andApp___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  STSystemStatusLogDynamicAttribution();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionKey with error %@", (uint8_t *)&v4, 0xCu);
  }

}

void __110__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionLocalizableKey_maskingClientAuditToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  STSystemStatusLogDynamicAttribution();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionLocalizableKey with error %@", (uint8_t *)&v4, 0xCu);
  }

}

void __112__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionStringWithFormat_maskingClientAuditToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  STSystemStatusLogDynamicAttribution();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionStringWithFormat with error %@", (uint8_t *)&v4, 0xCu);
  }

}

void __109__STDynamicActivityAttributionPublisher__internalQueue_sendAttributionWebsiteString_maskingClientAuditToken___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  STSystemStatusLogDynamicAttribution();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_error_impl(&dword_1D12C7000, v3, OS_LOG_TYPE_ERROR, "Failed to setCurrentAttributionWebsiteString with error %@", (uint8_t *)&v4, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverLaunchObservable, 0);
  objc_storeStrong((id *)&self->_cachedAppBundleID, 0);
  objc_storeStrong((id *)&self->_cachedLocalizedPlistKey, 0);
  objc_storeStrong((id *)&self->_serverXPCConnection, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
}

@end
