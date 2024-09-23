@implementation WLKSportsFavoriteManager

void __42__WLKSportsFavoriteManager_defaultManager__block_invoke()
{
  WLKSportsFavoriteCache *v0;
  void *v1;
  WLKSportsFavoriteManager *v2;
  void *v3;
  WLKSportsFavoriteCache *v4;

  v0 = [WLKSportsFavoriteCache alloc];
  objc_msgSend(MEMORY[0x1E0C99EA0], "wlk_userDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WLKSportsFavoriteCache initWithUserDefaults:](v0, "initWithUserDefaults:", v1);

  v2 = -[WLKSportsFavoriteManager initWithCache:]([WLKSportsFavoriteManager alloc], "initWithCache:", v4);
  v3 = (void *)defaultManager___defaultManager;
  defaultManager___defaultManager = (uint64_t)v2;

}

- (WLKSportsFavoriteManager)initWithCache:(id)a3
{
  id v5;
  WLKSportsFavoriteManager *v6;
  WLKSportsFavoriteManager *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WLKSportsFavoriteManager;
  v6 = -[WLKSportsFavoriteManager init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_xpcLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->__cache, a3);
    -[WLKSportsFavoriteManager deleteLegacyCache](v7, "deleteLegacyCache");
    v8 = dispatch_queue_create("WLKSportsFavoriteManagerQueue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    objc_initWeak(&location, v7);
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke;
    handler[3] = &unk_1E68A7D68;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch("com.apple.WatchListKit.WLKSportsFavoriteOptInStatusChangedNotification", &v7->_sportsFavoriteSyncSettingChangedNotificationToken, v10, handler);

    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke_135;
    v15[3] = &unk_1E68A7D68;
    objc_copyWeak(&v16, &location);
    notify_register_dispatch("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification", &v7->_favoritesCacheSyncNotificationToken, v10, v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel_handleAccountDidChange_, CFSTR("WLKAccountMonitorAccountDidChange"), 0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)deleteLegacyCache
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__WLKSportsFavoriteManager_deleteLegacyCache__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  if (deleteLegacyCache___once != -1)
    dispatch_once(&deleteLegacyCache___once, block);
}

uint64_t __45__WLKSportsFavoriteManager_deleteLegacyCache__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "deleteLegacyCacheWithCompletion:", 0);
}

+ (id)defaultManager
{
  if (defaultManager___once != -1)
    dispatch_once(&defaultManager___once, &__block_literal_global_45);
  return (id)defaultManager___defaultManager;
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WLKIsDaemon() & 1) == 0)
  {
    WLKSystemLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Received opt in status changed notification, fetching cache", buf, 2u);
    }

    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke_130;
    v3[3] = &unk_1E68A9A20;
    v4 = WeakRetained;
    objc_msgSend(v4, "isOnboarded:", v3);

  }
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke_130(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  v7 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("WLKSportsFavoriteSyncSettingChangedNotificationOnboardingStatusKey"));

  if (v7)
    objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("WLKSportsFavoriteSyncSettingChangedNotificationLastModifiedDateKey"));
  if (v8)
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("WLKSportsFavoriteSyncSettingChangedNotificationErrorKey"));
  WLKSystemLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1B515A000, v11, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Firing local opt in status changed notification", v13, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("WLKSportsFavoriteSyncSettingChangedNotification"), *(_QWORD *)(a1 + 32), v9);

}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke_135(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (WLKIsDaemon() & 1) == 0)
  {
    WLKSystemLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B515A000, v2, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Received cache sync invalidation notification, fetching cache", buf, 2u);
    }

    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __42__WLKSportsFavoriteManager_initWithCache___block_invoke_136;
    v3[3] = &unk_1E68A9A48;
    v4 = WeakRetained;
    objc_msgSend(v4, "favoritesWithCompletion:", v3);

  }
}

void __42__WLKSportsFavoriteManager_initWithCache___block_invoke_136(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v7)
  {
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("WLKSportsFavoriteSyncCompletionNotificationFavoritesKey"));

  }
  if (v8)
    objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("WLKSportsFavoriteSyncCompletionNotificationLastModifiedDateKey"));
  if (v9)
    objc_msgSend(v10, "setObject:forKey:", v9, CFSTR("WLKSportsFavoriteSyncCompletionNotificationErrorKey"));
  WLKSystemLogObject();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B515A000, v12, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Firing local cache sync complete notification", v14, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("WLKSportsFavoriteSyncCompletionNotification"), *(_QWORD *)(a1 + 32), v10);

}

- (void)handleAccountDidChange:(id)a3
{
  -[WLKSportsFavoriteCaching invalidate](self->__cache, "invalidate", a3);
  objc_msgSend(MEMORY[0x1E0DB1838], "accountDidChange");
}

- (id)caller
{
  if (WLKIsNewsApp())
    return CFSTR("apple-news");
  else
    return 0;
}

- (void)dealloc
{
  int favoritesCacheSyncNotificationToken;
  int sportsFavoriteSyncSettingChangedNotificationToken;
  void *v5;
  objc_super v6;

  favoritesCacheSyncNotificationToken = self->_favoritesCacheSyncNotificationToken;
  if (favoritesCacheSyncNotificationToken)
    notify_cancel(favoritesCacheSyncNotificationToken);
  sportsFavoriteSyncSettingChangedNotificationToken = self->_sportsFavoriteSyncSettingChangedNotificationToken;
  if (sportsFavoriteSyncSettingChangedNotificationToken)
    notify_cancel(sportsFavoriteSyncSettingChangedNotificationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)WLKSportsFavoriteManager;
  -[WLKSportsFavoriteManager dealloc](&v6, sel_dealloc);
}

- (id)_connection
{
  os_unfair_lock_s *p_xpcLock;
  NSXPCConnection *v4;
  NSXPCConnection *connection;
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

  p_xpcLock = &self->_xpcLock;
  os_unfair_lock_lock(&self->_xpcLock);
  if (!self->_connection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.watchlistd.xpc"), 0);
    connection = self->_connection;
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

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_146);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __39__WLKSportsFavoriteManager__connection__block_invoke_147;
    v15 = &unk_1E68A7FC0;
    objc_copyWeak(&v16, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", &v12);
    -[NSXPCConnection resume](self->_connection, "resume", v12, v13, v14, v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  os_unfair_lock_unlock(p_xpcLock);
  return self->_connection;
}

void __39__WLKSportsFavoriteManager__connection__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  WLKSystemLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1B515A000, v0, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Connection interrupted.", v1, 2u);
  }

}

void __39__WLKSportsFavoriteManager__connection__block_invoke_147(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_invalidationHandler");

}

- (void)_invalidationHandler
{
  NSObject *v3;
  NSXPCConnection *connection;
  uint8_t v5[16];

  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Connection invalidated.", v5, 2u);
  }

  os_unfair_lock_lock(&self->_xpcLock);
  connection = self->_connection;
  self->_connection = 0;

  os_unfair_lock_unlock(&self->_xpcLock);
}

- (void)handleRefreshCacheNotification
{
  NSObject *queue;
  _QWORD block[5];

  if ((WLKIsDaemon() & 1) != 0 || WLKIsRunningTest())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__WLKSportsFavoriteManager_handleRefreshCacheNotification__block_invoke;
    block[3] = &unk_1E68A80F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __58__WLKSportsFavoriteManager_handleRefreshCacheNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlistd_performAction:withIDs:caller:overrideLastModifiedDate:completion:", 0, 0, 0, 1, &__block_literal_global_148);
}

- (void)handleSyncSettingChangedNotification
{
  NSObject *queue;
  _QWORD block[5];

  if ((WLKIsDaemon() & 1) != 0 || WLKIsRunningTest())
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__WLKSportsFavoriteManager_handleSyncSettingChangedNotification__block_invoke;
    block[3] = &unk_1E68A80F8;
    block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __64__WLKSportsFavoriteManager_handleSyncSettingChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlistd_performUserSettingsAction:setFavoritesSyncEnabled:caller:overrideLastModifiedDate:completion:", 0, 0, 0, 1, &__block_literal_global_150);
}

+ (BOOL)isOptOutAvailable
{
  return 1;
}

- (void)isOnboarded:(id)a3
{
  id v4;
  char v5;
  id v6;
  WLKSportsFavoriteCaching *cache;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  v11 = 0;
  v5 = WLKCheckAuthentication(&v11);
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    cache = self->__cache;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke;
    v9[3] = &unk_1E68A9B40;
    v9[4] = self;
    v10 = v4;
    -[WLKSportsFavoriteCaching hasFavoritesSyncEnabledKey:](cache, "hasFavoritesSyncEnabledKey:", v9);

  }
  else
  {
    WLKSystemLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, id))v4 + 2))(v4, 0, 0, v6);
  }

}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    v3 = *(void **)(v2 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2;
    v8[3] = &unk_1E68A9AF0;
    v9 = *(id *)(a1 + 40);
    objc_msgSend(v3, "isOptedIn:", v8);
    v4 = v9;
  }
  else
  {
    v5 = *(NSObject **)(v2 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_152;
    block[3] = &unk_1E68A8258;
    block[4] = v2;
    v7 = *(id *)(a1 + 40);
    dispatch_async(v5, block);
    v4 = v7;
  }

}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = a2;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - isOnboarded reply with cached onboarding state: %d, lastModified: %@", (uint8_t *)v7, 0x12u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_152(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "caller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2_153;
  v5[3] = &unk_1E68A9228;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v2, "_performUserSettingsAction:setFavoritesSyncEnabled:caller:completion:", 0, 0, v3, v5);

}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_2_153(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_3;
  v8[3] = &unk_1E68A9B18;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  objc_msgSend(v6, "isOptedIn:", v8);

}

void __40__WLKSportsFavoriteManager_isOnboarded___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WLKSystemLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "debugDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109634;
    v9[1] = a2;
    v10 = 2112;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - isOnboarded reply with fresh onboarding state: %d, lastModified: %@, error: %@", (uint8_t *)v9, 0x1Cu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)setOptInStatus:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v6 = a4;
  v14 = 0;
  v7 = WLKCheckAuthentication(&v14);
  v8 = v14;
  if ((v7 & 1) != 0)
  {
    if (v4
      || +[WLKSportsFavoriteManager isOptOutAvailable](WLKSportsFavoriteManager, "isOptOutAvailable"))
    {
      -[WLKSportsFavoriteManager caller](self, "caller");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __54__WLKSportsFavoriteManager_setOptInStatus_completion___block_invoke;
      v12[3] = &unk_1E68A7DB8;
      v13 = v6;
      -[WLKSportsFavoriteManager _performUserSettingsAction:setFavoritesSyncEnabled:caller:completion:](self, "_performUserSettingsAction:setFavoritesSyncEnabled:caller:completion:", 1, v4, v9, v12);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKSportsFavoriteErrorDomain"), -2, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        (*((void (**)(id, void *))v6 + 2))(v6, v11);

    }
  }
  else
  {
    WLKSystemLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, id))v6 + 2))(v6, v8);
  }

}

uint64_t __54__WLKSportsFavoriteManager_setOptInStatus_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a3);
  return result;
}

- (void)favoritesWithCompletion:(id)a3
{
  -[WLKSportsFavoriteManager _getFavoritesIgnoringCache:overrideLastModifiedDate:completion:](self, "_getFavoritesIgnoringCache:overrideLastModifiedDate:completion:", 0, 0, a3);
}

- (void)getFavoritesWithCompletion:(id)a3
{
  -[WLKSportsFavoriteManager getFavoritesIgnoringCache:completion:](self, "getFavoritesIgnoringCache:completion:", 0, a3);
}

- (void)addFavorites:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[WLKSportsFavoriteManager caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__WLKSportsFavoriteManager_addFavorites_completion___block_invoke;
  v10[3] = &unk_1E68A9B68;
  v11 = v6;
  v9 = v6;
  -[WLKSportsFavoriteManager _performAction:withIDs:caller:completion:](self, "_performAction:withIDs:caller:completion:", 1, v7, v8, v10);

}

uint64_t __52__WLKSportsFavoriteManager_addFavorites_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeFavorites:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[WLKSportsFavoriteManager caller](self, "caller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__WLKSportsFavoriteManager_removeFavorites_completion___block_invoke;
  v10[3] = &unk_1E68A9B68;
  v11 = v6;
  v9 = v6;
  -[WLKSportsFavoriteManager _performAction:withIDs:caller:completion:](self, "_performAction:withIDs:caller:completion:", 2, v7, v8, v10);

}

uint64_t __55__WLKSportsFavoriteManager_removeFavorites_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getFavoritesIgnoringCache:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__WLKSportsFavoriteManager_getFavoritesIgnoringCache_completion___block_invoke;
  v8[3] = &unk_1E68A9B68;
  v9 = v6;
  v7 = v6;
  -[WLKSportsFavoriteManager _getFavoritesIgnoringCache:overrideLastModifiedDate:completion:](self, "_getFavoritesIgnoringCache:overrideLastModifiedDate:completion:", v4, 0, v8);

}

uint64_t __65__WLKSportsFavoriteManager_getFavoritesIgnoringCache_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_getFavoritesIgnoringCache:(BOOL)a3 overrideLastModifiedDate:(BOOL)a4 completion:(id)a5
{
  id v7;
  char v8;
  id v9;
  NSObject *queue;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  id v15;

  v7 = a5;
  v15 = 0;
  v8 = WLKCheckAuthentication(&v15);
  v9 = v15;
  if ((v8 & 1) != 0)
  {
    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke;
    v12[3] = &unk_1E68A9650;
    v12[4] = self;
    v14 = a3;
    v13 = v7;
    dispatch_async(queue, v12);

  }
  else
  {
    WLKSystemLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, id))v7 + 2))(v7, 0, 0, v9);
  }

}

void __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "hasCache") && !*(_BYTE *)(a1 + 48))
  {
    v3 = *(void **)(a1 + 40);
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke_2;
    v6[3] = &unk_1E68A9B90;
    v7 = v3;
    objc_msgSend(v4, "getFavoritesWithCompletion:", v6);

  }
  else
  {
    v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "caller");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_performAction:withIDs:caller:completion:", 0, 0, v5, *(_QWORD *)(a1 + 40));

  }
}

uint64_t __91__WLKSportsFavoriteManager__getFavoritesIgnoringCache_overrideLastModifiedDate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_performAction:(unint64_t)a3 withIDs:(id)a4 caller:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[8];
  _QWORD v28[4];
  id v29;
  _QWORD *v30;
  _QWORD v31[3];
  char v32;
  id v33;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v33 = 0;
  v13 = WLKCheckAuthentication(&v33);
  v14 = v33;
  if ((v13 & 1) != 0)
  {
    if ((WLKIsDaemon() & 1) != 0 || (WLKIsRunningTest() & 1) != 0)
    {
      -[WLKSportsFavoriteManager watchlistd_performAction:withIDs:caller:overrideLastModifiedDate:completion:](self, "watchlistd_performAction:withIDs:caller:overrideLastModifiedDate:completion:", a3, v10, v11, 0, v12);
    }
    else
    {
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x2020000000;
      v16 = MEMORY[0x1E0C809B0];
      v32 = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke;
      v28[3] = &unk_1E68A9BB8;
      v30 = v31;
      v29 = v12;
      v17 = (void *)MEMORY[0x1B5E47FF4](v28);
      WLKSystemLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B515A000, v18, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Performing sports favorites action over xpc.", buf, 2u);
      }

      -[WLKSportsFavoriteManager _connection](self, "_connection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v16;
      v25[1] = 3221225472;
      v25[2] = __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_156;
      v25[3] = &unk_1E68A7E88;
      v20 = v17;
      v26 = v20;
      objc_msgSend(v19, "remoteObjectProxyWithErrorHandler:", v25);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v23[0] = v16;
      v23[1] = 3221225472;
      v23[2] = __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_158;
      v23[3] = &unk_1E68A9B68;
      v22 = v20;
      v24 = v22;
      objc_msgSend(v21, "performSportsFavoritesAction:ids:caller:completion:", a3, v10, v11, v23);

      _Block_object_dispose(v31, 8);
    }
  }
  else
  {
    WLKSystemLogObject();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, id))v12 + 2))(v12, 0, 0, v14);
  }

}

uint64_t __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_156(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WLKSystemLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __69__WLKSportsFavoriteManager__performAction_withIDs_caller_completion___block_invoke_158(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (!v11)
          v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        +[WLKSportsFavoriteFactory favoriteWithID:](WLKSportsFavoriteFactory, "favoriteWithID:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v15);

      }
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_performUserSettingsAction:(unint64_t)a3 setFavoritesSyncEnabled:(BOOL)a4 caller:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[8];
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _QWORD v30[3];
  char v31;
  id v32;

  v7 = a4;
  v10 = a5;
  v11 = a6;
  v32 = 0;
  v12 = WLKCheckAuthentication(&v32);
  v13 = v32;
  if ((v12 & 1) != 0)
  {
    if ((WLKIsDaemon() & 1) != 0 || (WLKIsRunningTest() & 1) != 0)
    {
      -[WLKSportsFavoriteManager watchlistd_performUserSettingsAction:setFavoritesSyncEnabled:caller:overrideLastModifiedDate:completion:](self, "watchlistd_performUserSettingsAction:setFavoritesSyncEnabled:caller:overrideLastModifiedDate:completion:", a3, v7, v10, 0, v11);
    }
    else
    {
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x2020000000;
      v15 = MEMORY[0x1E0C809B0];
      v31 = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke;
      v27[3] = &unk_1E68A9BE0;
      v29 = v30;
      v28 = v11;
      v16 = (void *)MEMORY[0x1B5E47FF4](v27);
      WLKSystemLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B515A000, v17, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Performing sports favorites (user settings) action over xpc.", buf, 2u);
      }

      -[WLKSportsFavoriteManager _connection](self, "_connection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v15;
      v24[1] = 3221225472;
      v24[2] = __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_159;
      v24[3] = &unk_1E68A7E88;
      v19 = v16;
      v25 = v19;
      objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v22[0] = v15;
      v22[1] = 3221225472;
      v22[2] = __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_160;
      v22[3] = &unk_1E68A7DB8;
      v21 = v19;
      v23 = v21;
      objc_msgSend(v20, "performSportsFavoritesAction:favoritesSyncEnabled:caller:completion:", a3, v7, v10, v22);

      _Block_object_dispose(v30, 8);
    }
  }
  else
  {
    WLKSystemLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, _QWORD, id))v11 + 2))(v11, 0, v13);
  }

}

uint64_t __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

void __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_159(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    WLKSystemLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Error: Unable to communicate with the remote object proxy (%@)", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __97__WLKSportsFavoriteManager__performUserSettingsAction_setFavoritesSyncEnabled_caller_completion___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)watchlistd_performAction:(unint64_t)a3 withIDs:(id)a4 caller:(id)a5 overrideLastModifiedDate:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  NSObject *queue;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  WLKSportsFavoriteManager *v22;
  id v23;
  unint64_t v24;
  BOOL v25;
  id v26;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v26 = 0;
  v15 = WLKCheckAuthentication(&v26);
  v16 = v26;
  if ((v15 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke;
    block[3] = &unk_1E68A9C80;
    v24 = a3;
    v20 = v12;
    v21 = v13;
    v22 = self;
    v25 = a6;
    v23 = v14;
    dispatch_async(queue, block);

  }
  else
  {
    WLKSystemLogObject();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD, id))v14 + 2))(v14, 0, 0, v16);
  }

}

void __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  WLKSportsFavoriteRequestOperation *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint64_t v8;
  char v9;

  v2 = -[WLKSportsFavoriteRequestOperation initWithAction:ids:caller:]([WLKSportsFavoriteRequestOperation alloc], "initWithAction:ids:caller:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_2;
  v5[3] = &unk_1E68A9C58;
  v9 = *(_BYTE *)(a1 + 72);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v5[4] = v3;
  v7 = v4;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "_perform:completion:", v2, v5);

}

void __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  id v13;
  id *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  _QWORD v25[4];
  uint64_t v26;
  id v27;
  _QWORD v28[4];
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  uint64_t v32;
  id v33;
  char v34;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 56);
  if (v8 == 2)
  {
    if (!v6)
    {
      v15 = *(_QWORD *)(a1 + 40);
      if (v15)
      {
        v16 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_5;
        v25[3] = &unk_1E68A9C30;
        v12 = &v27;
        v17 = *(id *)(a1 + 48);
        v14 = (id *)&v26;
        v26 = 0;
        v27 = v17;
        objc_msgSend(v16, "removeFavorites:completion:", v15, v25);
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  if (v8 == 1)
  {
    if (!v6)
    {
      v19 = *(_QWORD *)(a1 + 40);
      if (v19)
      {
        v20 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_4;
        v28[3] = &unk_1E68A9C30;
        v12 = &v30;
        v21 = *(id *)(a1 + 48);
        v14 = (id *)&v29;
        v29 = 0;
        v30 = v21;
        objc_msgSend(v20, "addFavorites:completion:", v19, v28);
        goto LABEL_11;
      }
    }
    goto LABEL_10;
  }
  if (v8 || v6)
  {
LABEL_10:
    v18 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_6;
    v22[3] = &unk_1E68A9C30;
    v12 = &v24;
    v24 = *(id *)(a1 + 48);
    v14 = &v23;
    v23 = v7;
    objc_msgSend(v18, "getFavoritesWithCompletion:", v22);
    goto LABEL_11;
  }
  v9 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v5, "favorites");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(unsigned __int8 *)(a1 + 64);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_3;
  v31[3] = &unk_1E68A9C08;
  v12 = &v33;
  v13 = *(id *)(a1 + 48);
  v14 = (id *)&v32;
  v32 = 0;
  v33 = v13;
  v34 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v9, "setCache:overrideLastModifiedDate:completion:", v10, v11, v31);

LABEL_11:
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (*(_BYTE *)(a1 + 48))
  {
    WLKSystemLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification";
      _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v4, 0xCu);
    }

    return notify_post("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification");
  }
  return result;
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification";
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v5, 0xCu);
  }

  return notify_post("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification");
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
  WLKSystemLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification";
    _os_log_impl(&dword_1B515A000, v3, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v5, 0xCu);
  }

  return notify_post("com.apple.WatchListKit.WLKSportsFavoriteCacheSyncNotification");
}

uint64_t __104__WLKSportsFavoriteManager_watchlistd_performAction_withIDs_caller_overrideLastModifiedDate_completion___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, a3, *(_QWORD *)(a1 + 32));
}

- (void)watchlistd_performUserSettingsAction:(unint64_t)a3 setFavoritesSyncEnabled:(BOOL)a4 caller:(id)a5 overrideLastModifiedDate:(BOOL)a6 completion:(id)a7
{
  id v12;
  id v13;
  char v14;
  id v15;
  NSObject *queue;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  WLKSportsFavoriteManager *v20;
  id v21;
  unint64_t v22;
  BOOL v23;
  BOOL v24;
  id v25;

  v12 = a5;
  v13 = a7;
  v25 = 0;
  v14 = WLKCheckAuthentication(&v25);
  v15 = v25;
  if ((v14 & 1) != 0)
  {
    queue = self->_queue;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke;
    v18[3] = &unk_1E68A9D20;
    v22 = a3;
    v23 = a4;
    v19 = v12;
    v20 = self;
    v21 = v13;
    v24 = a6;
    dispatch_async(queue, v18);

  }
  else
  {
    WLKSystemLogObject();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[WLKSportsFavoriteManager isOnboarded:].cold.1();

    (*((void (**)(id, _QWORD, id))v13 + 2))(v13, 0, v15);
  }

}

void __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke(uint64_t a1)
{
  WLKUserSettingsRequestOperation *v2;
  uint64_t v3;
  WLKUserSettings *v4;
  WLKUserSettingsRequestOperation *v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v2 = [WLKUserSettingsRequestOperation alloc];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = -[WLKUserSettings initWithFavoritesSyncEnabled:]([WLKUserSettings alloc], "initWithFavoritesSyncEnabled:", *(unsigned __int8 *)(a1 + 64));
  v5 = -[WLKUserSettingsRequestOperation initWithAction:userSettings:caller:](v2, "initWithAction:userSettings:caller:", v3, v4, *(_QWORD *)(a1 + 32));

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_2;
  v9[3] = &unk_1E68A9CF8;
  v6 = *(void **)(a1 + 48);
  v10 = *(id *)(a1 + 40);
  v7 = v6;
  v13 = *(_BYTE *)(a1 + 65);
  v8 = *(_QWORD *)(a1 + 56);
  v11 = v7;
  v12 = v8;
  objc_msgSend(v10, "_performUserSettingsOperation:completion:", v5, v9);

}

void __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id *v8;
  id *v9;
  uint64_t v10;
  _BOOL8 v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[2];
  char v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (v6)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_3;
    v18[3] = &unk_1E68A9CA8;
    v8 = &v20;
    v20 = *(id *)(a1 + 40);
    v9 = &v19;
    v19 = v6;
    objc_msgSend(v7, "isOptedIn:", v18);
  }
  else
  {
    v10 = objc_msgSend(v5, "favoritesSyncEnabled");
    if (*(_BYTE *)(a1 + 56))
      v11 = 1;
    else
      v11 = *(_QWORD *)(a1 + 48) == 1;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_165;
    v14[3] = &unk_1E68A9CD0;
    v8 = &v15;
    v15 = v5;
    v9 = (id *)v16;
    v12 = *(id *)(a1 + 40);
    v17 = *(_BYTE *)(a1 + 56);
    v13 = *(_QWORD *)(a1 + 48);
    v16[0] = v12;
    v16[1] = v13;
    objc_msgSend(v7, "setOptInStatus:overrideLastModifiedDate:completion:", v10, v11, v14);
  }

}

uint64_t __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_3(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - returning cached value for sports onboarding state: %d", (uint8_t *)v6, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __132__WLKSportsFavoriteManager_watchlistd_performUserSettingsAction_setFavoritesSyncEnabled_caller_overrideLastModifiedDate_completion___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WLKSystemLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "favoritesSyncEnabled");
    v7 = 67109120;
    LODWORD(v8) = v5;
    _os_log_impl(&dword_1B515A000, v4, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - returning new value for sports onboarding state: %d", (uint8_t *)&v7, 8u);
  }

  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "favoritesSyncEnabled"), v3);
  if (*(_BYTE *)(a1 + 56) || *(_QWORD *)(a1 + 48) == 1)
  {
    WLKSystemLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = "com.apple.WatchListKit.WLKSportsFavoriteOptInStatusChangedNotification";
      _os_log_impl(&dword_1B515A000, v6, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - posting (cross process) notification %s", (uint8_t *)&v7, 0xCu);
    }

    notify_post("com.apple.WatchListKit.WLKSportsFavoriteOptInStatusChangedNotification");
  }
}

- (void)_perform:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  void (**v16)(id, _QWORD, void *);
  id v17;
  id location[2];

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if ((objc_msgSend(v5, "action") == 1 || objc_msgSend(v5, "action") == 2)
    && (objc_msgSend(v5, "ids"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        !v8))
  {
    WLKSystemLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1B515A000, v10, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites action will not be executed -- empty ids parameter.", (uint8_t *)location, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKSportsFavoriteErrorDomain"), -1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v11);

  }
  else
  {
    objc_initWeak(location, v5);
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __48__WLKSportsFavoriteManager__perform_completion___block_invoke;
    v15 = &unk_1E68A7A28;
    objc_copyWeak(&v17, location);
    v16 = v6;
    objc_msgSend(v5, "setCompletionBlock:", &v12);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue", v12, v13, v14, v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addOperation:", v5);

    objc_destroyWeak(&v17);
    objc_destroyWeak(location);
  }

}

void __48__WLKSportsFavoriteManager__perform_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WLKXPCSafeErrorFromError(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2048;
      v15 = objc_msgSend(WeakRetained, "action");
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites action failed -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);

    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v4);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(0, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(WeakRetained, "action");
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites action succeeded -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v9, 0);
  }

}

- (void)_performUserSettingsOperation:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD, void *);
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  void (**v15)(id, _QWORD, void *);
  id v16;
  id location[2];

  v5 = a3;
  v6 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v5, "action") == 1
    && (objc_msgSend(v5, "userSettings"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
  {
    WLKSystemLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_1B515A000, v9, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites (user settings) action will not be executed -- empty userSettings parameter.", (uint8_t *)location, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("WLKSportsFavoriteErrorDomain"), -1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, 0, v10);

  }
  else
  {
    objc_initWeak(location, v5);
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __69__WLKSportsFavoriteManager__performUserSettingsOperation_completion___block_invoke;
    v14 = &unk_1E68A7A28;
    objc_copyWeak(&v16, location);
    v15 = v6;
    objc_msgSend(v5, "setCompletionBlock:", &v11);
    objc_msgSend(MEMORY[0x1E0CB3828], "wlkDefaultQueue", v11, v12, v13, v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOperation:", v5);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }

}

void __69__WLKSportsFavoriteManager__performUserSettingsOperation_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WLKXPCSafeErrorFromError(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  WLKSystemLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v4, "localizedDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v7;
      v14 = 2048;
      v15 = objc_msgSend(WeakRetained, "action");
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites (user settings) action failed -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);

    }
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v8 + 16))(v8, v9, v4);
  }
  else
  {
    if (v6)
    {
      objc_msgSend(0, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2048;
      v15 = objc_msgSend(WeakRetained, "action");
      _os_log_impl(&dword_1B515A000, v5, OS_LOG_TYPE_DEFAULT, "WLKSportsFavorites - Sports favorites (user settings) action succeeded -- %@. Request -- %lu", (uint8_t *)&v12, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(WeakRetained, "response");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v11 + 16))(v11, v9, 0);
  }

}

- (WLKSportsFavoriteCaching)_cache
{
  return (WLKSportsFavoriteCaching *)objc_getProperty(self, a2, 40, 1);
}

- (void)set_cache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__cache, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)isOnboarded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B515A000, v0, v1, "WLKSportsFavorites - User is not signed in, returning early with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
