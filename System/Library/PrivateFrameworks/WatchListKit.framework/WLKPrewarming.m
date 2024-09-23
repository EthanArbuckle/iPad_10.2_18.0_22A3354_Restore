@implementation WLKPrewarming

void __36__WLKPrewarming__prefetchAppLibrary__block_invoke()
{
  NSObject *v0;
  os_signpost_id_t v1;
  NSObject *v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = os_signpost_id_generate(v0);

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v3, OS_SIGNPOST_INTERVAL_BEGIN, v1, "Config.prefetchAppLibrary", ", buf, 2u);
  }

  v4 = +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v1 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v6, OS_SIGNPOST_INTERVAL_END, v1, "Config.prefetchAppLibrary", ", v9, 2u);
  }

  WLKSystemLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B515A000, v7, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - prefetchAppLibrary end", v8, 2u);
  }

}

void __31__WLKPrewarming_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[WLKPrewarming _init]([WLKPrewarming alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;

}

- (id)_init
{
  WLKPrewarming *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *workQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *prefetchQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WLKPrewarming;
  v2 = -[WLKPrewarming init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.watchlistkit.prewarm", 0);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.watchlistkit.prefetch", v5);
    prefetchQueue = v2->_prefetchQueue;
    v2->_prefetchQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

void __40__WLKPrewarming_prewarmSubscriptionData__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Subscriptions.Fetch", ", buf, 2u);
  }

  +[WLKSubscriptionStore sharedInstance](WLKSubscriptionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__WLKPrewarming_prewarmSubscriptionData__block_invoke_21;
  v4[3] = &unk_1E68AA048;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "fetchSubscriptionData:completion:", 0, v4);

}

- (id)_connection
{
  NSXPCConnection *connection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  void *v9;
  NSXPCConnection *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;

  connection = self->_connection;
  if (!connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    v5 = self->_connection;
    self->_connection = v4;

    v6 = self->_connection;
    WLKConnectionClientInterface();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](v6, "setExportedInterface:", v7);

    -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self);
    v8 = self->_connection;
    WLKConnectionServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_32);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __28__WLKPrewarming__connection__block_invoke_33;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

+ (id)sharedInstance
{
  if (sharedInstance___once_4 != -1)
    dispatch_once(&sharedInstance___once_4, &__block_literal_global_52);
  return (id)sharedInstance___sharedInstance_1;
}

- (void)prewarmWithConfigCachePolicy:(unint64_t)a3
{
  -[WLKPrewarming _prewarmConfigurationWithConfigCachePolicy:](self, "_prewarmConfigurationWithConfigCachePolicy:", a3);
  -[WLKPrewarming _prefetchAppLibrary](self, "_prefetchAppLibrary");
}

- (void)_prefetchAppLibrary
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - prefetchAppLibrary begin", v4, 2u);
  }

  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_17_1);

}

- (void)prewarmSubscriptionData
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WLKPrewarming_prewarmSubscriptionData__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (WLKPrewarming)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)prewarm
{
  -[WLKPrewarming prewarmWithConfigCachePolicy:](self, "prewarmWithConfigCachePolicy:", 0);
}

- (void)_prewarmConfigurationWithConfigCachePolicy:(unint64_t)a3
{
  NSObject *workQueue;
  _QWORD v6[5];
  id v7[2];
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke;
  v6[3] = &unk_1E68AA000;
  v7[1] = (id)a3;
  objc_copyWeak(v7, &location);
  v6[4] = self;
  dispatch_async(workQueue, v6);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12[2];
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming", ", buf, 2u);
  }

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 134217984;
    v14 = v4;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Start prewarm, configCachePolicy = %lu", buf, 0xCu);
  }

  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "LocationManager.init", ", buf, 2u);
  }

  v6 = +[WLKLocationManager defaultLocationManager](WLKLocationManager, "defaultLocationManager");
  WLKStartupSignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v7, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "LocationManager.init", ", buf, 2u);
  }

  WLKStartupSignpostLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch", ", buf, 2u);
  }

  +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke_11;
  v11[3] = &unk_1E68A9FD8;
  v12[1] = v10;
  objc_copyWeak(v12, (id *)(a1 + 40));
  v11[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, v10, 0, v11);

  objc_destroyWeak(v12);
}

void __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke_11(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  unsigned int v6;
  void *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  id WeakRetained;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _DWORD v18[2];
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - done fetching config", (uint8_t *)v18, 2u);
  }

  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Config.Fetch", ", (uint8_t *)v18, 2u);
  }

  v6 = (*(_QWORD *)(a1 + 48) < 6uLL) & (0x32u >> *(_QWORD *)(a1 + 48));
  +[WLKLaunchConfiguration sharedInstance](WLKLaunchConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "alwaysPrefetchAppConfiguration");

  v9 = objc_msgSend(v3, "isFromDiskCache");
  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v18[0] = 67109632;
    v18[1] = v9;
    v19 = 1024;
    v20 = v6;
    v21 = 1024;
    v22 = v8;
    _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Check prefetching: isFromDiskCache: %d, doesPolicyAllowInvalidConfig: %d, alwaysPrefetchConfig: %d", (uint8_t *)v18, 0x14u);
  }

  if ((v9 & (v6 | v8)) == 1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_prefetchIfNeeded:alwaysPrefetchConfig:", v3, v8);

  }
  WLKStartupSignpostLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v12))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Daemon", ", (uint8_t *)v18, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_15_0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "ping");
  objc_msgSend(v14, "checkPendingPlaybackReports");
  WLKStartupSignpostLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Daemon", ", (uint8_t *)v18, 2u);
  }

  WLKStartupSignpostLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v16))
  {
    LOWORD(v18[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming", ", (uint8_t *)v18, 2u);
  }

  WLKSystemLogObject();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18[0]) = 0;
    _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - end prewarm", (uint8_t *)v18, 2u);
  }

}

void __60__WLKPrewarming__prewarmConfigurationWithConfigCachePolicy___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }

}

- (void)_prefetchIfNeeded:(id)a3 alwaysPrefetchConfig:(BOOL)a4
{
  id v6;
  NSObject *prefetchQueue;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;

  v6 = a3;
  prefetchQueue = self->_prefetchQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke;
  v9[3] = &unk_1E68A9568;
  v11 = a4;
  v10 = v6;
  v8 = v6;
  dispatch_async(prefetchQueue, v9);

}

void __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 40))
    v1 = 3;
  else
    v1 = 0;
  if (*(_BYTE *)(a1 + 40) || (v8 = *(void **)(a1 + 32)) == 0 || (objc_msgSend(v8, "isValid") & 1) == 0)
  {
    WLKSystemLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v11 = v1;
      _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Prefetching the configuration, cachePolicy=%lu", buf, 0xCu);
    }

    WLKStartupSignpostLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_signpost_id_generate(v3);

    WLKStartupSignpostLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B515A000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Config.SilentFetch", ", buf, 2u);
    }

    +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke_19;
    v9[3] = &__block_descriptor_40_e52_v24__0__WLKServerConfigurationResponse_8__NSError_16l;
    v9[4] = v4;
    objc_msgSend(v7, "fetchConfigurationWithOptions:cachePolicy:queryParameters:completion:", 0, v1, 0, v9);

  }
}

void __56__WLKPrewarming__prefetchIfNeeded_alwaysPrefetchConfig___block_invoke_19(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Config.SilentFetch", ", buf, 2u);
  }

  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Done silent fetching", v6, 2u);
  }

}

- (void)prewarmDevice
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __30__WLKPrewarming_prewarmDevice__block_invoke;
  v4[3] = &unk_1E68A7FC0;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __30__WLKPrewarming_prewarmDevice__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t v7[16];
  uint8_t v8[16];
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Device", ", buf, 2u);
  }

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - start prewarmDevice", v8, 2u);
  }

  objc_msgSend(WeakRetained, "_onQueue_prewarmDevice");
  WLKStartupSignpostLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.Device", ", v7, 2u);
  }

  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - end prewarmDevice", v6, 2u);
  }

}

void __40__WLKPrewarming_prewarmSubscriptionData__block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[8];
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v13 = CFSTR("WLKPrewarmSubscriptionDataNotificationErrorKey");
    +[WLKSanitizer sanitizeError:](WLKSanitizer, "sanitizeError:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WLKPrewarmSubscriptionDataDidComplete"), *(_QWORD *)(a1 + 32), v8);

  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - done refreshing subs", v12, 2u);
  }

  WLKStartupSignpostLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "Subscriptions.Fetch", ", v12, 2u);
  }

}

- (void)_onQueue_prewarmDevice
{
  id v2;
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v2 = +[WLKConfigurationManager sharedInstance](WLKConfigurationManager, "sharedInstance");
  v3 = +[WLKAppLibrary defaultAppLibrary](WLKAppLibrary, "defaultAppLibrary");
}

- (void)prewarmDeviceAndNetwork
{
  NSObject *workQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke;
  v4[3] = &unk_1E68A7FC0;
  objc_copyWeak(&v5, &location);
  dispatch_async(workQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  NSObject *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[4];
  NSObject *v12;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.start", ", buf, 2u);
  }

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - start prewarmNonPersonalized", buf, 2u);
  }

  v4 = dispatch_semaphore_create(0);
  WLKStartupSignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.bag.start", ", buf, 2u);
  }

  v6 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke_27;
  v11[3] = &unk_1E68A9628;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v6, "isFullTVAppEnabledwithCompletion:", v11);
  objc_msgSend(WeakRetained, "_onQueue_prewarmDevice");
  v8 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v7, v8);
  WLKStartupSignpostLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.end", ", buf, 2u);
  }

  WLKSystemLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - end prewarmNonPersonalized", buf, 2u);
  }

}

intptr_t __40__WLKPrewarming_prewarmDeviceAndNetwork__block_invoke_27(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  WLKStartupSignpostLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v2))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B515A000, v2, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WLKPrewarming.nonPersonalized.bag.end", ", v4, 2u);
  }

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __28__WLKPrewarming__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Connection interrupted.", v1, 2u);
  }

}

void __28__WLKPrewarming__connection__block_invoke_33(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint8_t v6[16];

  WLKSystemLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKPrewarming - Connection invalidated.", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 3);
    *((_QWORD *)WeakRetained + 3) = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_prefetchQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
