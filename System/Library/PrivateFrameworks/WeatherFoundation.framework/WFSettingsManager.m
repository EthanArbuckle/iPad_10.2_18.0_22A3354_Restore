@implementation WFSettingsManager

+ (WFSettingsManager)sharedInstance
{
  if (onceToken != -1)
    dispatch_once(&onceToken, &__block_literal_global_28);
  return (WFSettingsManager *)(id)sSharedInstance;
}

void __35__WFSettingsManager_sharedInstance__block_invoke()
{
  WFSettingsManager *v0;
  void *v1;

  v0 = objc_alloc_init(WFSettingsManager);
  v1 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v0;

}

- (WFSettingsManager)init
{
  WFSettingsManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *requestSerialQueue;
  uint64_t v6;
  NSHashTable *observers;
  WFUserInfoManager *v8;
  WFUserInfoManager *userInfoManager;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFSettingsManager;
  v2 = -[WFSettingsManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.weather.remote_config", v3);
    requestSerialQueue = v2->_requestSerialQueue;
    v2->_requestSerialQueue = (OS_dispatch_queue *)v4;

    v2->_settingsLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v6 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v6;

    v8 = objc_alloc_init(WFUserInfoManager);
    userInfoManager = v2->_userInfoManager;
    v2->_userInfoManager = v8;

    -[WFUserInfoManager setDelegate:](v2->_userInfoManager, "setDelegate:", v2);
    -[WFUserInfoManager synchronize](v2->_userInfoManager, "synchronize");
    -[WFSettingsManager setupRemoteSettings](v2, "setupRemoteSettings");
  }
  return v2;
}

- (void)setupRemoteSettings
{
  NSObject *v3;
  _QWORD block[5];

  -[WFSettingsManager requestSerialQueue](self, "requestSerialQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40__WFSettingsManager_setupRemoteSettings__block_invoke;
  block[3] = &unk_24CCA06F8;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;

  v1 = (id *)(a1 + 32);
  v2 = *(void **)(a1 + 32);
  +[WFRemoteAppSettings defaultSettings](WFRemoteAppSettings, "defaultSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSettings:", v3);

  objc_msgSend(*v1, "clearConfigCacheOnLaunchIfRequested");
  WeatherFoundationInternalUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cachedAppConfig"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    +[WFSettingsManager userIdentifier](WFSettingsManager, "userIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    +[WFRemoteAppSettings configurationWithData:userID:error:](WFRemoteAppSettings, "configurationWithData:userID:error:", v5, v6, &v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    objc_msgSend(*v1, "setSettings:", v7);
    if (v8)
    {
      WFLogForCategory(9uLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_3();
    }
    else
    {
      WFLogForCategory(0xAuLL);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_2(v1, v9);
    }

    objc_msgSend(*v1, "fetchAppConfigurationIfExpired");
  }
  else
  {
    WFLogForCategory(0xAuLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_1(v10);

    objc_msgSend(*v1, "forceFetchAppConfiguration");
  }

}

- (BOOL)useFallback
{
  WFSettingsManager *v2;
  os_unfair_lock_s *p_settingsLock;

  v2 = self;
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  LOBYTE(v2) = v2->_useFallback;
  os_unfair_lock_unlock(p_settingsLock);
  return (char)v2;
}

- (void)setUseFallback:(BOOL)a3
{
  os_unfair_lock_s *p_settingsLock;

  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  self->_useFallback = a3;
  os_unfair_lock_unlock(p_settingsLock);
}

- (WFRemoteAppSettings)settings
{
  os_unfair_lock_s *p_settingsLock;
  void *v4;

  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[WFRemoteAppSettings copy](self->_settings, "copy");
  os_unfair_lock_unlock(p_settingsLock);
  return (WFRemoteAppSettings *)v4;
}

- (void)setSettings:(id)a3
{
  os_unfair_lock_s *p_settingsLock;
  id v5;
  WFRemoteAppSettings *v6;
  WFRemoteAppSettings *settings;

  p_settingsLock = &self->_settingsLock;
  v5 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (WFRemoteAppSettings *)objc_msgSend(v5, "copy");

  settings = self->_settings;
  self->_settings = v6;

  os_unfair_lock_unlock(p_settingsLock);
}

- (NSString)APIVersion
{
  void *v3;
  void *v4;
  NSObject *v5;

  -[WFSettingsManager settings](self, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WFSettingsManager useFallback](self, "useFallback"))
    objc_msgSend(v3, "apiVersionFallback");
  else
    objc_msgSend(v3, "apiVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(0xAuLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[WFSettingsManager APIVersion].cold.1();

  return (NSString *)v4;
}

+ (id)userIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("userId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeatherFoundationInternalUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v3, CFSTR("userId"));

  }
  return v3;
}

+ (void)setUserIdentifier:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    WeatherFoundationInternalUserDefaults();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setValue:forKey:", v3, CFSTR("userId"));

  }
}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_settingsLock;
  id v5;
  void *v6;

  if (a3)
  {
    p_settingsLock = &self->_settingsLock;
    v5 = a3;
    os_unfair_lock_lock_with_options();
    -[WFSettingsManager observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

    os_unfair_lock_unlock(p_settingsLock);
  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  os_unfair_lock_s *p_settingsLock;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    p_settingsLock = &self->_settingsLock;
    v9 = v4;
    os_unfair_lock_lock_with_options();
    -[WFSettingsManager observers](self, "observers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v9);

    if (v7)
    {
      -[WFSettingsManager observers](self, "observers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "removeObject:", v9);

    }
    os_unfair_lock_unlock(p_settingsLock);
    v4 = v9;
  }

}

- (BOOL)clearConfigCacheOnLaunchIfRequested
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("clearConfigCacheOnLaunch"));

  if (!v3)
    return 0;
  WeatherFoundationInternalUserDefaults();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBool:forKey:", 0, CFSTR("clearConfigCacheOnLaunch"));

  objc_msgSend(MEMORY[0x24BDBCF48], "wf_cacheDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeatherFoundationInternalUserDefaults();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("cachedAppConfig"));

  WeatherFoundationInternalUserDefaults();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObjectForKey:", CFSTR("cachedAppConfigLastSavedDate"));

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "removeItemAtURL:error:", v5, 0);

  WFLogForCategory(0xAuLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[WFSettingsManager clearConfigCacheOnLaunchIfRequested].cold.1(v9, v10, v11);

  return v9;
}

- (void)fetchAppConfigurationIfExpired
{
  void *v3;
  id v4;

  -[WFSettingsManager settings](self, "settings");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "isExpired"))
  {
    -[WFSettingsManager requestSerialQueue](self, "requestSerialQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSettingsManager fetchAppConfigurationWithCompletionQueue:completion:](self, "fetchAppConfigurationWithCompletionQueue:completion:", v3, 0);

  }
}

- (void)forceFetchAppConfiguration
{
  id v3;

  -[WFSettingsManager requestSerialQueue](self, "requestSerialQueue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[WFSettingsManager fetchAppConfigurationWithCompletionQueue:completion:](self, "fetchAppConfigurationWithCompletionQueue:completion:", v3, 0);

}

- (unint64_t)debugEnvironmentFromOverride:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("remoteconfig_staging")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("remoteconfig_qa")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)debugOverrides
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v8;

  WeatherFoundationInternalUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("remoteconfiguration_env"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[WFSettingsManager debugEnvironmentFromOverride:](self, "debugEnvironmentFromOverride:", v4);
    LOBYTE(v8) = 1;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7EAF8]), "initWithDisableAbTesting:overrideSegmentSetIDs:additionalSegmentSetIDs:configurationSource:debugEnvironment:ignoreCache:enableExtraLogs:", 0, 0, 0, 1, v5, 1, v8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchAppConfigurationWithCompletionQueue:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WFSettingsManager requestSerialQueue](self, "requestSerialQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke;
  block[3] = &unk_24CCA27C8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id location;

  +[WFSettingsManager userIdentifier](WFSettingsManager, "userIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = a1[4];
  objc_msgSend(v5, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "permanentURLForRecordID:containerIdentifier:", CFSTR("configuration-weather-000000"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "wf_cacheDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7EAE8]), "initWithContentDirectoryURL:", v8);
  objc_msgSend(a1[4], "debugOverrides");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE7EAF0]);
  objc_msgSend(MEMORY[0x24BE7EB00], "defaultDeviceInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:", CFSTR("weatherConfigRequest"), CFSTR("weatherConfigurationWrapper"), v7, v2, CFSTR("00000"), v4, v12, v10, 1);

  objc_initWeak(&location, a1[4]);
  dispatch_get_global_queue(21, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2;
  v17[3] = &unk_24CCA27A0;
  objc_copyWeak(&v22, &location);
  v18 = a1[5];
  v21 = a1[6];
  v15 = v2;
  v19 = v15;
  v16 = v4;
  v20 = v16;
  objc_msgSend(v9, "fetchSingleConfigurationWithSettings:completionQueue:completion:", v13, v14, v17);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a2;
  v8 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (v8)
  {
    WFLogForCategory(9uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_3();

    objc_msgSend(WeakRetained, "completeOnQueue:error:completion:", *(_QWORD *)(a1 + 32), v8, *(_QWORD *)(a1 + 56));
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 40);
    v19 = 0;
    +[WFRemoteAppSettings configurationWithData:userID:error:](WFRemoteAppSettings, "configurationWithData:userID:error:", v7, v11, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    WFLogForCategory(0xAuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_2(a1, (uint64_t)v12, v14);

    if (v13)
    {
      WFLogForCategory(9uLL);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_3();

    }
    else
    {
      objc_msgSend(WeakRetained, "setSettings:", v12);
      WeatherFoundationInternalUserDefaults();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("cachedAppConfig"));

      WeatherFoundationInternalUserDefaults();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", v18, CFSTR("cachedAppConfigLastSavedDate"));

      objc_msgSend(WeakRetained, "notifyObserversOfAppConfigRefresh");
    }
    objc_msgSend(WeakRetained, "completeOnQueue:error:completion:", *(_QWORD *)(a1 + 32), v13, *(_QWORD *)(a1 + 56));

  }
}

- (void)notifyObserversOfAppConfigRefresh
{
  os_unfair_lock_s *p_settingsLock;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_settingsLock = &self->_settingsLock;
  os_unfair_lock_lock_with_options();
  -[WFSettingsManager observers](self, "observers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  os_unfair_lock_unlock(p_settingsLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        -[WFSettingsManager settings](self, "settings", (_QWORD)v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "settingsManager:didRefreshWithSettings:", self, v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)completeOnQueue:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __54__WFSettingsManager_completeOnQueue_error_completion___block_invoke;
    block[3] = &unk_24CCA27F0;
    v13 = v9;
    block[4] = self;
    v12 = v8;
    dispatch_async((dispatch_queue_t)a3, block);

  }
}

void __54__WFSettingsManager_completeOnQueue_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "settings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, *(_QWORD *)(a1 + 40));

}

- (id)permanentURLForRecordID:(id)a3 containerIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v15;
  char v16;
  char v17;
  char v18;

  v18 = 2;
  v17 = 0;
  v6 = a4;
  v7 = a3;
  v16 = objc_msgSend(v7, "length");
  v15 = -[WFSettingsManager containerIDForContainerIdentifier:](self, "containerIDForContainerIdentifier:", v6);
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendBytes:length:", &v18, 1);
  objc_msgSend(v8, "appendBytes:length:", &v15, 1);
  objc_msgSend(v8, "appendBytes:length:", &v16, 1);
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "appendData:", v9);
  objc_msgSend(v8, "appendBytes:length:", &v17, 1);
  objc_msgSend(v8, "appendBytes:length:", "17", 2);
  -[WFSettingsManager urlSafeBase64EncodedStringWithData:options:](self, "urlSafeBase64EncodedStringWithData:options:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDD1808]);
  objc_msgSend(v11, "setScheme:", CFSTR("https"));
  objc_msgSend(v11, "setHost:", CFSTR("c.apple.news"));
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPath:", v12);

  -[WFSettingsManager updateAssetURLHostIfNeededWithComponents:containerIdentifier:](self, "updateAssetURLHostIfNeededWithComponents:containerIdentifier:", v11, v6);
  objc_msgSend(v11, "URL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (char)containerIDForContainerIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public.staging")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public.qa")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)containerIdentifier
{
  void *v2;
  void *v3;
  const __CFString *v4;

  WeatherFoundationInternalUserDefaults();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("remoteconfiguration_env"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("remoteconfig_staging")) & 1) != 0)
  {
    v4 = CFSTR("com.apple.news.public.staging");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("remoteconfig_qa")))
  {
    v4 = CFSTR("com.apple.news.public.qa");
  }
  else
  {
    v4 = CFSTR("com.apple.news.public");
  }

  return (id)v4;
}

- (id)urlSafeBase64EncodedStringWithData:(id)a3 options:(unint64_t)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "base64EncodedStringWithOptions:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("+"), CFSTR("-"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("/"), CFSTR("_"), 0, 0, objc_msgSend(v5, "length"));
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", CFSTR("="), &stru_24CCA55E8, 0, 0, objc_msgSend(v5, "length"));
  return v5;
}

- (BOOL)shouldReroutePermanentURLsForContainerIdentifier:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public.staging")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.news.public.qa"));

  return v4;
}

- (void)updateAssetURLHostIfNeededWithComponents:(id)a3 containerIdentifier:(id)a4
{
  id v6;

  v6 = a3;
  if (-[WFSettingsManager shouldReroutePermanentURLsForContainerIdentifier:](self, "shouldReroutePermanentURLsForContainerIdentifier:", a4))
  {
    objc_msgSend(v6, "setHost:", CFSTR("cvws-internal.icloud.com"));
  }

}

- (void)userInfoManager:(id)a3 didSynchronizeUserIdentifier:(id)a4
{
  id v5;

  if (a4)
  {
    v5 = a4;
    objc_msgSend((id)objc_opt_class(), "setUserIdentifier:", v5);

    -[WFSettingsManager setupRemoteSettings](self, "setupRemoteSettings");
  }
}

- (WFUserInfoManager)userInfoManager
{
  return self->_userInfoManager;
}

- (void)setUserInfoManager:(id)a3
{
  objc_storeStrong((id *)&self->_userInfoManager, a3);
}

- (OS_dispatch_queue)requestSerialQueue
{
  return self->_requestSerialQueue;
}

- (void)setRequestSerialQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestSerialQueue, a3);
}

- (os_unfair_lock_s)settingsLock
{
  return self->_settingsLock;
}

- (void)setSettingsLock:(os_unfair_lock_s)a3
{
  self->_settingsLock = a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_requestSerialQueue, 0);
  objc_storeStrong((id *)&self->_userInfoManager, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21189A000, log, OS_LOG_TYPE_DEBUG, "force fetching a new remote config", v1, 2u);
}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "initializing with remote app settings: %@", v5);

}

void __40__WFSettingsManager_setupRemoteSettings__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Error parsing remote config: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)APIVersion
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_21189A000, v0, v1, "Using API: %@ is fallback: %@");
  OUTLINED_FUNCTION_1();
}

- (void)clearConfigCacheOnLaunchIfRequested
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v3 = CFSTR("YES");
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, a3, "cleared remote config cache? : [%@]", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_5(&dword_21189A000, a2, a3, "updating remote app settings for %{public}@ to: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __73__WFSettingsManager_fetchAppConfigurationWithCompletionQueue_completion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_21189A000, v0, v1, "Error retrieving remote config: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
