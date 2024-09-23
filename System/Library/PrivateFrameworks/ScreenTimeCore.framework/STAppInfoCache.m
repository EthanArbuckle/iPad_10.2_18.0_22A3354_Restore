@implementation STAppInfoCache

+ (STAppInfoCache)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_0);
  return (STAppInfoCache *)(id)sharedCache_sharedCache;
}

void __29__STAppInfoCache_sharedCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedCache_sharedCache;
  sharedCache_sharedCache = v0;

}

- (STAppInfoCache)init
{
  STAppInfoCache *v2;
  uint64_t v3;
  NSCache *appInfoByBundleIdentifier;
  uint64_t v5;
  NSMutableSet *bundleIdentifiersWithPendingRequests;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *lookupQueue;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSURLSession *urlSession;
  void *v16;
  uint64_t v17;
  NSOperationQueue *completionHandlerQueue;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)STAppInfoCache;
  v2 = -[STAppInfoCache init](&v20, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    appInfoByBundleIdentifier = v2->_appInfoByBundleIdentifier;
    v2->_appInfoByBundleIdentifier = (NSCache *)v3;

    v5 = objc_opt_new();
    bundleIdentifiersWithPendingRequests = v2->_bundleIdentifiersWithPendingRequests;
    v2->_bundleIdentifiersWithPendingRequests = (NSMutableSet *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.screentime.app-info-cache", v8);
    lookupQueue = v2->_lookupQueue;
    v2->_lookupQueue = (OS_dispatch_queue *)v9;

    objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3990], "sharedURLCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setURLCache:", v12);

    objc_msgSend(v11, "setRequestCachePolicy:", 2);
    objc_msgSend(v11, "setHTTPShouldUsePipelining:", 1);
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "setName:", CFSTR("com.apple.screentime.app-info-cache"));
    objc_msgSend(v13, "setUnderlyingQueue:", v2->_lookupQueue);
    objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:delegate:delegateQueue:", v11, 0, v13);
    v14 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v14;

    objc_msgSend(v13, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURLSession setSessionDescription:](v2->_urlSession, "setSessionDescription:", v16);

    v17 = objc_opt_new();
    completionHandlerQueue = v2->_completionHandlerQueue;
    v2->_completionHandlerQueue = (NSOperationQueue *)v17;

    -[NSOperationQueue setName:](v2->_completionHandlerQueue, "setName:", CFSTR("App Info Cache Completion Handler Queue"));
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_completionHandlerQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v2->_completionHandlerQueue, "setQualityOfService:", 25);

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  v3.receiver = self;
  v3.super_class = (Class)STAppInfoCache;
  -[STAppInfoCache dealloc](&v3, sel_dealloc);
}

- (id)appInfoForBundleIdentifier:(id)a3 localOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD block[4];
  id v16;
  id v17;
  id location;

  v4 = a4;
  v6 = a3;
  -[STAppInfoCache _appInfoForBundleIdentifier:](self, "_appInfoForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "source");
  if (_os_feature_enabled_impl() && objc_msgSend(v7, "adamID"))
  {
    objc_msgSend(v7, "localURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9 == 0;

    if (!v4)
    {
LABEL_4:
      if (v8)
        v11 = v10;
      else
        v11 = 1;
      if (v11 == 1)
      {
        objc_initWeak(&location, self);
        -[STAppInfoCache lookupQueue](self, "lookupQueue");
        v12 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__STAppInfoCache_appInfoForBundleIdentifier_localOnly___block_invoke;
        block[3] = &unk_1E93708F0;
        v16 = v6;
        objc_copyWeak(&v17, &location);
        dispatch_async(v12, block);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&location);
      }
      goto LABEL_12;
    }
  }
  else
  {
    v10 = 0;
    if (!v4)
      goto LABEL_4;
  }
  if (v8 == 3)
  {
    -[STAppInfoCache _placeholderAppInfoWithBundleIdentifier:](self, "_placeholderAppInfoWithBundleIdentifier:", v6);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
LABEL_12:

  return v7;
}

void __55__STAppInfoCache_appInfoForBundleIdentifier_localOnly___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", *(_QWORD *)(a1 + 32), 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:", v3);

}

- (id)appInfoForBundleIdentifier:(id)a3
{
  return -[STAppInfoCache appInfoForBundleIdentifier:localOnly:](self, "appInfoForBundleIdentifier:localOnly:", a3, 0);
}

- (void)fetchAppInfoForBundleIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, 0);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __68__STAppInfoCache_fetchAppInfoForBundleIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E9370918;
  v12 = v6;
  v13 = v7;
  v9 = v6;
  v10 = v7;
  -[STAppInfoCache fetchAppInfoForBundleIdentifiers:completionHandler:](self, "fetchAppInfoForBundleIdentifiers:completionHandler:", v8, v11);

}

void __68__STAppInfoCache_fetchAppInfoForBundleIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

- (void)fetchAppInfoForBundleIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v10 = v6;
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
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[STAppInfoCache _appInfoForBundleIdentifier:](self, "_appInfoForBundleIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "source"))
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v15);
        else
          objc_msgSend(v9, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    -[STAppInfoCache lookupQueue](self, "lookupQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke;
    v18[3] = &unk_1E9370968;
    v18[4] = self;
    v19 = v9;
    v20 = v8;
    v21 = v7;
    dispatch_async(v17, v18);

  }
  else
  {
    (*((void (**)(id, void *))v7 + 2))(v7, v8);
  }

}

void __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_2;
  v6[3] = &unk_1E9370940;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:timeoutInterval:completionHandler:", v3, v6, 30.0);

}

void __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_2(id *a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (a2)
    objc_msgSend(a1[4], "addEntriesFromDictionary:", a2);
  objc_msgSend(a1[5], "completionHandlerQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_3;
  v4[3] = &unk_1E9370898;
  v6 = a1[6];
  v5 = a1[4];
  objc_msgSend(v3, "addOperationWithBlock:", v4);

}

uint64_t __69__STAppInfoCache_fetchAppInfoForBundleIdentifiers_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3 selector:(SEL)a4 bundleIdentifier:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = (void *)MEMORY[0x1E0CB37D0];
  v9 = a3;
  objc_msgSend(v8, "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppInfoCacheDidFetchResult-%@"), v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:object:", v9, a4, v11, self);

}

- (void)removeObserver:(id)a3 bundleIdentifier:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppInfoCacheDidFetchResult-%@"), v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:name:object:", v7, v9, self);

}

- (id)_appInfoForBundleIdentifier:(id)a3
{
  __CFString *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  void *v19;
  uint64_t v20;
  id v21;

  v4 = (__CFString *)a3;
  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("STAppInfoCacheSkipLS"));

  }
  else
  {
    v6 = 0;
  }
  if (os_variant_has_internal_content())
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("STAppInfoCacheSkipSynced"));

  }
  else
  {
    v8 = 0;
  }
  v9 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("com.apple.iChat"));
  v10 = CFSTR("com.apple.MobileSMS");
  if (!v9)
    v10 = v4;
  v11 = v10;

  -[STAppInfoCache appInfoByBundleIdentifier](self, "appInfoByBundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = v13;
    objc_msgSend(v13, "displayName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "length");

    if (!v16)
    {
      +[STLog appInfo](STLog, "appInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[STAppInfoCache _appInfoForBundleIdentifier:].cold.2(v14);
LABEL_25:

    }
  }
  else
  {
    if ((v6 & 1) != 0
      || (-[STAppInfoCache _fetchAppInfoFromLaunchServicesWithBundleIdentifier:](self, "_fetchAppInfoFromLaunchServicesWithBundleIdentifier:", v11), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      -[STAppInfoCache _preloadedAppInfoWithBundleIdentifier:](self, "_preloadedAppInfoWithBundleIdentifier:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        v18 = 1;
      else
        v18 = v8;
      if ((v18 & 1) == 0)
      {
        -[STAppInfoCache _fetchSyncedInstalledAppInfoForBundleIdentifier:](self, "_fetchSyncedInstalledAppInfoForBundleIdentifier:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v14)
      {
        -[STAppInfoCache _placeholderAppInfoWithBundleIdentifier:](self, "_placeholderAppInfoWithBundleIdentifier:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    objc_msgSend(v12, "setObject:forKey:", v14, v11);
    objc_msgSend(v14, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "length");

    if (!v20)
    {
      +[STLog appInfo](STLog, "appInfo");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[STAppInfoCache _appInfoForBundleIdentifier:].cold.1(v14);
      goto LABEL_25;
    }
  }
  v21 = v14;

  return v21;
}

- (id)_fetchAppInfoFromLaunchServicesWithBundleIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[STLog appInfo](STLog, "appInfo");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[STAppInfoCache _fetchAppInfoFromLaunchServicesWithBundleIdentifier:].cold.1((uint64_t)v3, v4);

  v29 = 0;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v29);
  v6 = v29;
  if (!v5)
  {
    +[STLog ask](STLog, "ask");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v31 = v3;
      v32 = 2114;
      v33 = v6;
      _os_log_impl(&dword_1D22E7000, v18, OS_LOG_TYPE_INFO, "No application record found for %{public}@ %{public}@", buf, 0x16u);
    }
    v7 = 0;
    goto LABEL_22;
  }
  if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.facetime"))
    || MGGetBoolAnswer())
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v7, "setSource:", 2);
    objc_msgSend(v7, "setBundleIdentifier:", v3);
    objc_msgSend(v5, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDisplayName:", v8);

    objc_msgSend(v7, "setPlatform:", 2);
    objc_msgSend(v5, "URL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLocalURL:", v9);

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v5, "iTunesMetadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "distributorInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "distributorID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDistributorID:", v12);

      objc_msgSend(v5, "iTunesMetadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setAdamID:", objc_msgSend(v13, "storeItemIdentifier"));

      objc_msgSend(v5, "iTunesMetadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVersionIdentifier:", objc_msgSend(v14, "versionIdentifier"));

      objc_msgSend(v5, "iTunesMetadata");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setBetaVersionIdentifier:", objc_msgSend(v15, "betaVersionIdentifier"));

      objc_msgSend(v5, "iTunesMetadata");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "distributorInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDistributorIsThirdParty:", objc_msgSend(v17, "distributorIsThirdParty"));

    }
    +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
    v18 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compatibilityObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "applicationType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0CA5820]);

    if (v21)
    {
      -[NSObject localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("AppleDeveloperName"), &stru_1E9372498, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDeveloperName:", v22);
    }
    else
    {
      objc_msgSend(v5, "iTunesMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "artistName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v7, "setDeveloperName:", v23);
      }
      else
      {
        -[NSObject localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("NoDeveloper"), &stru_1E9372498, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setDeveloperName:", v24);

      }
    }

    objc_msgSend(v5, "iTunesMetadata");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ratingLabel");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v7, "setRatingLabel:", v26);
    }
    else
    {
      -[NSObject localizedStringForKey:value:table:](v18, "localizedStringForKey:value:table:", CFSTR("NoAgeRating"), &stru_1E9372498, 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setRatingLabel:", v27);

    }
LABEL_22:

    goto LABEL_23;
  }
  v7 = 0;
LABEL_23:

  return v7;
}

- (void)_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[STAppInfoCache lookupQueue](self, "lookupQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v7 = (id)objc_msgSend(v4, "mutableCopy");
  -[STAppInfoCache bundleIdentifiersWithPendingRequests](self, "bundleIdentifiersWithPendingRequests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minusSet:", v6);

  if (objc_msgSend(v7, "count"))
    -[STAppInfoCache _fetchAppStoreInfoAndNotifyWithBundleIdentifiers:timeoutInterval:completionHandler:](self, "_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:timeoutInterval:completionHandler:", v7, 0, 0.0);

}

- (void)_fetchAppStoreInfoAndNotifyWithBundleIdentifiers:(id)a3 timeoutInterval:(double)a4 completionHandler:(id)a5
{
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  _QWORD v62[5];
  id v63;
  id v64;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[3];
  uint8_t buf[4];
  id v72;
  __int16 v73;
  int v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v47 = a5;
  -[STAppInfoCache bundleIdentifiersWithPendingRequests](self, "bundleIdentifiersWithPendingRequests");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v48, "mutableCopy");
  +[STLog appInfo](STLog, "appInfo");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v72 = v8;
    _os_log_impl(&dword_1D22E7000, v9, OS_LOG_TYPE_INFO, "Going to query %{public}@ from the store", buf, 0xCu);
  }

  objc_msgSend(v46, "unionSet:", v8);
  if (!_os_feature_enabled_impl())
  {
LABEL_39:
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", CFSTR("https://itunes.apple.com/lookup"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(v8, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "queryItemWithName:value:", CFSTR("bundleId"), v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x1E0CB39D8];
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "countryCode");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "queryItemWithName:value:", CFSTR("country"), v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("entity"), CFSTR("software,iPadSoftware,macSoftware"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v34;
    v70[1] = v38;
    v70[2] = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 3);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setQueryItems:", v40);

    objc_initWeak((id *)buf, self);
    v41 = (void *)MEMORY[0x1E0CB39E0];
    objc_msgSend(v30, "URL");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 <= 0.0)
      objc_msgSend(v41, "requestWithURL:", v42);
    else
      objc_msgSend(v41, "requestWithURL:cachePolicy:timeoutInterval:", v42, 2, a4);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    -[STAppInfoCache urlSession](self, "urlSession");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_5;
    v54[3] = &unk_1E93709E0;
    objc_copyWeak(&v57, (id *)buf);
    v8 = v8;
    v55 = v8;
    v56 = v47;
    objc_msgSend(v44, "dataTaskWithRequest:completionHandler:", v43, v54);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "resume");
    objc_destroyWeak(&v57);

    objc_destroyWeak((id *)buf);
    goto LABEL_43;
  }
  v10 = objc_msgSend(v8, "count");
  v53 = (void *)objc_msgSend(v48, "mutableCopy");
  v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  v52 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v10);
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v10);
  v49 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", v10);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
  if (!v12)
    goto LABEL_30;
  v13 = *(_QWORD *)v67;
  do
  {
    v14 = 0;
    do
    {
      if (*(_QWORD *)v67 != v13)
        objc_enumerationMutation(v11);
      v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v14);
      -[NSCache objectForKey:](self->_appInfoByBundleIdentifier, "objectForKey:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        +[STLog appInfo](STLog, "appInfo");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          goto LABEL_22;
        *(_DWORD *)buf = 138412290;
        v72 = v15;
        v23 = v20;
        v24 = "AppInfo not found for bundleIdentifier: %@";
        v25 = 12;
LABEL_28:
        _os_log_error_impl(&dword_1D22E7000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
        goto LABEL_22;
      }
      if (os_variant_has_internal_content())
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "BOOLForKey:", CFSTR("STAppInfoCacheSkipAMS"));

        if ((v18 & 1) != 0)
        {
          v19 = 1;
LABEL_21:
          +[STLog appInfo](STLog, "appInfo");
          v20 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            goto LABEL_22;
          *(_DWORD *)buf = 138412546;
          v72 = v15;
          v73 = 1024;
          v74 = v19;
          v23 = v20;
          v24 = "AppInfo from unknown source or missing an adamID or skipping AMS. Reverting to iTunes lookup. BundleIden"
                "tifier: %@, skipping AMS: %d";
          v25 = 18;
          goto LABEL_28;
        }
      }
      if (!objc_msgSend(v16, "source") || !objc_msgSend(v16, "adamID"))
      {
        v19 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v53, "removeObject:", v15);
      if (objc_msgSend(v16, "distributorIsThirdParty"))
      {
        objc_msgSend(v52, "addObject:", v16);
        objc_msgSend(v49, "addObject:", v15);
        +[STLog appInfo](STLog, "appInfo");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        *(_DWORD *)buf = 138543362;
        v72 = v15;
        v21 = v20;
        v22 = "Adding app with bundleID %{public}@ to global list";
      }
      else
      {
        objc_msgSend(v51, "addObject:", v16);
        objc_msgSend(v50, "addObject:", v15);
        +[STLog appInfo](STLog, "appInfo");
        v20 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        *(_DWORD *)buf = 138543362;
        v72 = v15;
        v21 = v20;
        v22 = "Adding app with bundleID %{public}@ to App Store list";
      }
      _os_log_impl(&dword_1D22E7000, v21, OS_LOG_TYPE_INFO, v22, buf, 0xCu);
LABEL_22:

      ++v14;
    }
    while (v12 != v14);
    v26 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    v12 = v26;
  }
  while (v26);
LABEL_30:

  objc_initWeak((id *)buf, self);
  if (objc_msgSend(v52, "count"))
  {
    +[STAMSClient makeAMSMediaTaskForApps:isGlobal:](STAMSClient, "makeAMSMediaTaskForApps:isGlobal:", v52, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke;
      v62[3] = &unk_1E93709B8;
      v62[4] = self;
      objc_copyWeak(&v65, (id *)buf);
      v63 = v49;
      v64 = v47;
      +[STAMSClient loadMediaForTask:withCompletionHandler:](STAMSClient, "loadMediaForTask:withCompletionHandler:", v27, v62);

      objc_destroyWeak(&v65);
    }

  }
  if (objc_msgSend(v51, "count"))
  {
    +[STAMSClient makeAMSMediaTaskForApps:isGlobal:](STAMSClient, "makeAMSMediaTaskForApps:isGlobal:", v51, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_3;
      v58[3] = &unk_1E93709B8;
      v58[4] = self;
      objc_copyWeak(&v61, (id *)buf);
      v59 = v50;
      v60 = v47;
      +[STAMSClient loadMediaForTask:withCompletionHandler:](STAMSClient, "loadMediaForTask:withCompletionHandler:", v28, v58);

      objc_destroyWeak(&v61);
    }

  }
  v8 = v53;

  v29 = objc_msgSend(v8, "count") == 0;
  objc_destroyWeak((id *)buf);

  if (!v29)
    goto LABEL_39;
LABEL_43:

}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "lookupQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_2;
  block[3] = &unk_1E9370990;
  objc_copyWeak(&v15, a1 + 7);
  v11 = a1[5];
  v12 = v6;
  v13 = v5;
  v14 = a1[6];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(WeakRetained, "_handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_3(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1[4], "lookupQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_4;
  block[3] = &unk_1E9370990;
  objc_copyWeak(&v15, a1 + 7);
  v11 = a1[5];
  v12 = v6;
  v13 = v5;
  v14 = a1[6];
  v8 = v5;
  v9 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v15);
}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_4(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(WeakRetained, "_handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:", v2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __101__STAppInfoCache__fetchAppStoreInfoAndNotifyWithBundleIdentifiers_timeoutInterval_completionHandler___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id *v7;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  v7 = (id *)(a1 + 48);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  WeakRetained = objc_loadWeakRetained(v7);
  objc_msgSend(WeakRetained, "_handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:", *(_QWORD *)(a1 + 32), v9, v10, v8, *(_QWORD *)(a1 + 40));

}

- (void)_handleAMSClientResponseForBundleIdentifiers:(id)a3 results:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t j;
  uint64_t v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  STAppInfoCache *val;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD block[4];
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  _BYTE v73[16];
  uint8_t buf[4];
  void *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v54 = a6;
  -[STAppInfoCache lookupQueue](self, "lookupQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v13);

  val = self;
  -[STAppInfoCache bundleIdentifiersWithPendingRequests](self, "bundleIdentifiersWithPendingRequests");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "minusSet:", v10);

  if (!v11 || !objc_msgSend(v11, "count"))
  {
    +[STLog appInfo](STLog, "appInfo");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[STAppInfoCache _handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:].cold.2();

  }
  v56 = v12;
  v59 = (void *)objc_msgSend(v10, "mutableCopy");
  v16 = (void *)objc_opt_new();
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v17 = v11;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
  v58 = v17;
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v69;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v69 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * i);
        objc_msgSend(v22, "bundleIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "length");

        if (!v24)
        {
          +[STLog appInfo](STLog, "appInfo");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_27;
          *(_DWORD *)buf = 138543362;
          v75 = v22;
          v32 = v27;
          v33 = "Unable to parse store response, bundle identifier is missing: %{public}@";
LABEL_19:
          _os_log_error_impl(&dword_1D22E7000, v32, OS_LOG_TYPE_ERROR, v33, buf, 0xCu);
          goto LABEL_27;
        }
        objc_msgSend(v22, "displayName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "length");

        if (!v26)
        {
          +[STLog appInfo](STLog, "appInfo");
          v27 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            goto LABEL_27;
          *(_DWORD *)buf = 138543362;
          v75 = v22;
          v32 = v27;
          v33 = "Unable to parse store response, display name is missing: %{public}@";
          goto LABEL_19;
        }
        v27 = objc_opt_new();
        -[NSObject setSource:](v27, "setSource:", 3);
        objc_msgSend(v22, "bundleIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setBundleIdentifier:](v27, "setBundleIdentifier:", v28);

        objc_msgSend(v22, "displayName");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setDisplayName:](v27, "setDisplayName:", v29);

        objc_msgSend(v22, "software");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "isEqualToString:", CFSTR("software")))
        {

          v31 = 2;
        }
        else
        {
          objc_msgSend(v22, "software");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("ipad-software"));

          if ((v35 & 1) != 0)
          {
            v31 = 2;
          }
          else
          {
            objc_msgSend(v22, "software");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v36, "isEqualToString:", CFSTR("mac-software"));

          }
          v17 = v58;
        }
        -[NSObject setPlatform:](v27, "setPlatform:", v31);
        objc_msgSend(v22, "artworkURL");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setArtworkURL:](v27, "setArtworkURL:", v37);

        objc_msgSend(v22, "vendorName");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setDeveloperName:](v27, "setDeveloperName:", v38);

        objc_msgSend(v22, "ratingLabel");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setRatingLabel:](v27, "setRatingLabel:", v39);

        objc_msgSend(v22, "bundleIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, v40);

        objc_msgSend(v22, "bundleIdentifier");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "removeObject:", v41);

        +[STLog appInfo](STLog, "appInfo");
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
          -[STAppInfoCache _handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:].cold.1((uint64_t)v73, (uint64_t)v27);

LABEL_27:
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
    }
    while (v19);
  }
  v57 = v10;

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v43 = v59;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v65;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v65 != v46)
          objc_enumerationMutation(v43);
        v48 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
        v49 = (void *)objc_opt_new();
        objc_msgSend(v49, "setSource:", 3);
        objc_msgSend(v49, "setBundleIdentifier:", v48);
        objc_msgSend(v49, "setDisplayName:", v48);
        objc_msgSend(v49, "setPlatform:", 0);
        +[STLog appInfo](STLog, "appInfo");
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v49, "bundleIdentifier");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v75 = v51;
          _os_log_impl(&dword_1D22E7000, v50, OS_LOG_TYPE_DEFAULT, "Did not find app %@ in AMS Response; setting AppInfo to placeholder",
            buf,
            0xCu);

        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v49, v48);

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v45);
  }

  objc_initWeak((id *)buf, val);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __95__STAppInfoCache__handleAMSClientResponseForBundleIdentifiers_results_error_completionHandler___block_invoke;
  block[3] = &unk_1E9370A08;
  objc_copyWeak(&v63, (id *)buf);
  v61 = v16;
  v62 = v54;
  v52 = v54;
  v53 = v16;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v63);
  objc_destroyWeak((id *)buf);

}

uint64_t __95__STAppInfoCache__handleAMSClientResponseForBundleIdentifiers_results_error_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishedFetchingAppInfoByBundleIdentifier:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)_handleiTunesResponseForBundleIdentifiers:(id)a3 response:(id)a4 data:(id)a5 error:(id)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  STAppInfoCache *val;
  id v47;
  void *v48;
  void (**v49)(id, _QWORD);
  id v50;
  id v51;
  void *v52;
  id obj;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD block[4];
  id v58;
  void (**v59)(id, _QWORD);
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  id v69;
  _BYTE v70[128];
  char v71[16];
  uint8_t buf[4];
  void *v73;
  _BYTE v74[128];
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  -[STAppInfoCache lookupQueue](self, "lookupQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  -[STAppInfoCache bundleIdentifiersWithPendingRequests](self, "bundleIdentifiersWithPendingRequests");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "minusSet:", v11);

  if (!v12 || v13)
  {
    +[STLog appInfo](STLog, "appInfo");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[STAppInfoCache _handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:].cold.1();

    if (v14)
      v14[2](v14, 0);
  }
  else
  {
    v69 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, &v69);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v69;
    if (v17)
    {
      v52 = (void *)objc_msgSend(v11, "mutableCopy");
      v56 = (void *)objc_opt_new();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("results"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v50 = v12;
      v51 = v11;
      v49 = v14;
      val = self;
      v47 = v18;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v19 = 0;
      }
      v48 = v17;
      v67 = 0u;
      v68 = 0u;
      v66 = 0u;
      v65 = 0u;
      obj = v19;
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v55)
      {
        v54 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v55; ++i)
          {
            if (*(_QWORD *)v66 != v54)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("bundleId"), val);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v22 = 0;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("trackName"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v23 = 0;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("kind"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v24 = 0;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("artworkUrl100"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v25 = 0;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("artistName"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v26 = 0;
            }
            objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("contentAdvisoryRating"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {

              v27 = 0;
            }
            if (!objc_msgSend(v22, "length"))
            {
              +[STLog appInfo](STLog, "appInfo");
              v28 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                goto LABEL_40;
              *(_DWORD *)buf = 138543362;
              v73 = v21;
              v30 = v28;
              v31 = "Unable to parse store response, bundle identifier is missing: %{public}@";
LABEL_32:
              _os_log_error_impl(&dword_1D22E7000, v30, OS_LOG_TYPE_ERROR, v31, buf, 0xCu);
              goto LABEL_40;
            }
            if (!objc_msgSend(v23, "length"))
            {
              +[STLog appInfo](STLog, "appInfo");
              v28 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
                goto LABEL_40;
              *(_DWORD *)buf = 138543362;
              v73 = v21;
              v30 = v28;
              v31 = "Unable to parse store response, display name is missing: %{public}@";
              goto LABEL_32;
            }
            v28 = objc_opt_new();
            -[NSObject setSource:](v28, "setSource:", 3);
            -[NSObject setBundleIdentifier:](v28, "setBundleIdentifier:", v22);
            -[NSObject setDisplayName:](v28, "setDisplayName:", v23);
            if ((objc_msgSend(v24, "isEqualToString:", CFSTR("software")) & 1) != 0
              || (objc_msgSend(v24, "isEqualToString:", CFSTR("ipad-software")) & 1) != 0)
            {
              v29 = 2;
            }
            else
            {
              v29 = objc_msgSend(v24, "isEqualToString:", CFSTR("mac-software"));
            }
            -[NSObject setPlatform:](v28, "setPlatform:", v29);
            if (objc_msgSend(v25, "length"))
            {
              objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v25);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setArtworkURL:](v28, "setArtworkURL:", v32);

            }
            else
            {
              -[NSObject setArtworkURL:](v28, "setArtworkURL:", 0);
            }
            -[NSObject setDeveloperName:](v28, "setDeveloperName:", v26);
            -[NSObject setRatingLabel:](v28, "setRatingLabel:", v27);
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v28, v22);
            objc_msgSend(v52, "removeObject:", v22);
            +[STLog appInfo](STLog, "appInfo");
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              -[STAppInfoCache _handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:].cold.1((uint64_t)v71, (uint64_t)v28);

LABEL_40:
          }
          v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        }
        while (v55);
      }

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v34 = v52;
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v62;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v62 != v37)
              objc_enumerationMutation(v34);
            v39 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * j);
            v40 = (void *)objc_opt_new();
            objc_msgSend(v40, "setSource:", 3);
            objc_msgSend(v40, "setBundleIdentifier:", v39);
            objc_msgSend(v40, "setDisplayName:", v39);
            objc_msgSend(v40, "setPlatform:", 0);
            +[STLog appInfo](STLog, "appInfo");
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v40, "bundleIdentifier");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v73 = v42;
              _os_log_impl(&dword_1D22E7000, v41, OS_LOG_TYPE_DEFAULT, "Did not find app %@ in iTunes Response; setting AppInfo to placeholder",
                buf,
                0xCu);

            }
            objc_msgSend(v56, "setObject:forKeyedSubscript:", v40, v39);

          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v36);
      }

      objc_initWeak((id *)buf, val);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __98__STAppInfoCache__handleiTunesResponseForBundleIdentifiers_response_data_error_completionHandler___block_invoke;
      block[3] = &unk_1E9370A08;
      objc_copyWeak(&v60, (id *)buf);
      v58 = v56;
      v14 = v49;
      v59 = v49;
      v43 = v56;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(&v60);
      objc_destroyWeak((id *)buf);

      v12 = v50;
      v11 = v51;
      v13 = 0;
      v18 = v47;
      v17 = v48;
    }
    else
    {
      +[STLog appInfo](STLog, "appInfo");
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[STAppInfoCache _handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:].cold.1();

      if (v14)
        v14[2](v14, 0);
    }

  }
}

uint64_t __98__STAppInfoCache__handleiTunesResponseForBundleIdentifiers_response_data_error_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_finishedFetchingAppInfoByBundleIdentifier:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (id)_fetchSyncedInstalledAppInfoForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  -[STAppInfoCache persistentContainer](self, "persistentContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_msgSend(v5, "newBackgroundContext");
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke;
    v10[3] = &unk_1E9370A58;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v7, "performBlockAndWait:", v10);

  }
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  _QWORD v32[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint8_t v42[32];
  __int128 buf;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  +[STInstalledApp fetchRequest](STInstalledApp, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("bundleIdentifier"), *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("userDeviceState.device.identifier"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSortDescriptors:", v5);

  v41 = 0;
  objc_msgSend(v2, "execute:", &v41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v41;
  if (!v6)
  {
    +[STLog appInfo](STLog, "appInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_1((uint64_t)v7, v10);
    goto LABEL_10;
  }
  if (!objc_msgSend(v6, "count"))
  {
    +[STLog appInfo](STLog, "appInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v2, "predicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v11;
      _os_log_impl(&dword_1D22E7000, v10, OS_LOG_TYPE_INFO, "No installed apps matching predicate: %{public}@", (uint8_t *)&buf, 0xCu);

    }
LABEL_10:

    goto LABEL_40;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v44 = 0x2020000000;
  v45 = 0x7FFFFFFFFFFFFFFFLL;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0x7FFFFFFFFFFFFFFFLL;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_192;
  v32[3] = &unk_1E9370A30;
  v32[4] = &v33;
  v32[5] = &buf;
  v32[6] = &v37;
  v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v32);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL
    || (v8 = v38[3], v8 != 0x7FFFFFFFFFFFFFFFLL)
    || (v34[3] == 0x7FFFFFFFFFFFFFFFLL || !_os_feature_enabled_impl()
      ? (v9 = (uint64_t *)*((_QWORD *)&buf + 1))
      : (v9 = v34),
        v8 = v9[3],
        v8 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_new();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v12, "adamID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16
        && (objc_msgSend(v12, "adamID"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "unsignedLongValue"),
            v17,
            v16,
            v18))
      {
        v19 = 3;
      }
      else
      {
        v18 = 0;
        v19 = 4;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSource:", v19);
      objc_msgSend(v12, "distributorID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDistributorID:", v20);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDistributorIsThirdParty:", objc_msgSend(v12, "distributorIsThirdParty"));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setAdamID:", v18);
      objc_msgSend(v12, "versionIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v12, "versionIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v20, "unsignedLongValue");
      }
      else
      {
        v22 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setVersionIdentifier:", v22);
      if (v21)

      objc_msgSend(v12, "betaVersionIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v12, "betaVersionIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v20, "unsignedLongValue");
      }
      else
      {
        v24 = 0;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBetaVersionIdentifier:", v24);
      if (v23)

    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSource:", 4);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setBundleIdentifier:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "userDeviceState");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "device");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setPlatform:", objc_msgSend(v26, "platform"));

    objc_msgSend(v12, "displayName");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v26) = objc_msgSend(v27, "length") == 0;

    if ((_DWORD)v26)
    {
      +[STLog appInfo](STLog, "appInfo");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "description");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_2(v30, v42, v29);
      }

      objc_msgSend(v12, "bundleIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDisplayName:", v28);
    }
    else
    {
      objc_msgSend(v12, "displayName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setDisplayName:", v28);
    }

    objc_msgSend(v12, "iconData");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setArtworkData:", v31);

  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&buf, 8);
LABEL_40:

}

BOOL __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_192(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL8 v16;

  v5 = a2;
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "adamID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    objc_msgSend(v5, "adamID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToNumber:", &unk_1E938D910);

    if ((v10 & 1) == 0)
    {
      if (_os_feature_enabled_impl())
        *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = a3;
    }
  }
  if (v6
    && (v11 = *(_QWORD *)(a1[5] + 8), *(_QWORD *)(v11 + 24) == 0x7FFFFFFFFFFFFFFFLL)
    && (*(_QWORD *)(v11 + 24) = a3,
        objc_msgSend(v5, "iconData"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v12,
        v12)
    && (v13 = *(_QWORD *)(a1[6] + 8), *(_QWORD *)(v13 + 24) == 0x7FFFFFFFFFFFFFFFLL))
  {
    *(_QWORD *)(v13 + 24) = a3;
    objc_msgSend(v5, "userDeviceState");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "device");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "platform") == 2;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)_finishedFetchingAppInfoByBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  STAppInfoCache *v9;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[STAppInfoCache appInfoByBundleIdentifier](self, "appInfoByBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__STAppInfoCache__finishedFetchingAppInfoByBundleIdentifier___block_invoke;
  v7[3] = &unk_1E9370A80;
  v8 = v5;
  v9 = self;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __61__STAppInfoCache__finishedFetchingAppInfoByBundleIdentifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "setObject:forKey:", v7, v5);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AppInfoCacheDidFetchResult-%@"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v13 = CFSTR("AppInfo");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", v9, v10, v11);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:userInfo:", CFSTR("STAppInfoCacheDidUpdateNotificationName"), *(_QWORD *)(a1 + 40), 0);

}

- (id)_preloadedAppInfoWithBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[STAppInfoCache _localAppNameForBundleIdentifier:](self, "_localAppNameForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(v6, "setSource:", 1);
    objc_msgSend(v6, "setBundleIdentifier:", v4);
    objc_msgSend(v6, "setDisplayName:", v5);
    objc_msgSend(v6, "setPlatform:", 2);
    +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("AppleDeveloperName"), &stru_1E9372498, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDeveloperName:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_placeholderAppInfoWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setSource:", 0);
  objc_msgSend(v4, "setBundleIdentifier:", v3);
  objc_msgSend(v4, "setDisplayName:", v3);

  objc_msgSend(v4, "setPlatform:", 0);
  return v4;
}

- (id)_localAppNameForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  if (_localAppNameForBundleIdentifier__onceToken != -1)
    dispatch_once(&_localAppNameForBundleIdentifier__onceToken, &__block_literal_global_197);
  objc_msgSend((id)_localAppNameForBundleIdentifier__localAppNameMap, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[STScreenTimeCoreBundle bundle](STScreenTimeCoreBundle, "bundle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_1E9372498, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __51__STAppInfoCache__localAppNameForBundleIdentifier___block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[10];
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.camera");
  v2[1] = CFSTR("com.apple.compass");
  v3[0] = CFSTR("CameraAppName");
  v3[1] = CFSTR("CompassAppName");
  v2[2] = CFSTR("com.apple.Health");
  v2[3] = CFSTR("com.apple.mobilephone");
  v3[2] = CFSTR("HealthAppName");
  v3[3] = CFSTR("PhoneAppName");
  v2[4] = CFSTR("com.apple.mobilesafari");
  v2[5] = CFSTR("com.apple.mobileslideshow");
  v3[4] = CFSTR("SafariAppName");
  v3[5] = CFSTR("PhotosAppName");
  v2[6] = CFSTR("com.apple.MobileSMS");
  v2[7] = CFSTR("com.apple.mobiletimer");
  v3[6] = CFSTR("MessagesAppName");
  v3[7] = CFSTR("ClockAppName");
  v2[8] = CFSTR("com.apple.Passbook");
  v2[9] = CFSTR("com.apple.Preferences");
  v3[8] = CFSTR("PassbookAppName");
  v3[9] = CFSTR("SettingsAppName");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_localAppNameForBundleIdentifier__localAppNameMap;
  _localAppNameForBundleIdentifier__localAppNameMap = v0;

}

- (NSPersistentContainer)persistentContainer
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPersistentContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSCache)appInfoByBundleIdentifier
{
  return self->_appInfoByBundleIdentifier;
}

- (OS_dispatch_queue)lookupQueue
{
  return self->_lookupQueue;
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (NSMutableSet)bundleIdentifiersWithPendingRequests
{
  return self->_bundleIdentifiersWithPendingRequests;
}

- (NSOperationQueue)completionHandlerQueue
{
  return self->_completionHandlerQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlerQueue, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiersWithPendingRequests, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
  objc_storeStrong((id *)&self->_appInfoByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)_appInfoForBundleIdentifier:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1D22E7000, v2, v3, "STAppInfoCache is vending result with no displayName: %{public}@ in function: %s:%d", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)_appInfoForBundleIdentifier:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1D22E7000, v2, v3, "STAppInfoCache is vending result with no displayName: %{public}@ in function: %s:%d", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_7();
}

- (void)_fetchAppInfoFromLaunchServicesWithBundleIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_DEBUG, "Going to query %{public}@ from LS", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_handleAMSClientResponseForBundleIdentifiers:(uint64_t)a1 results:(uint64_t)a2 error:completionHandler:.cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_4(&dword_1D22E7000, v5, v6, "Got app %{public}@ details from the store");

  OUTLINED_FUNCTION_5();
}

- (void)_handleAMSClientResponseForBundleIdentifiers:results:error:completionHandler:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "App lookup of %@ from media services failed: %{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_handleiTunesResponseForBundleIdentifiers:response:data:error:completionHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D22E7000, v0, v1, "App lookup of %@ from store failed: %{public}@");
  OUTLINED_FUNCTION_1();
}

void __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1D22E7000, a2, OS_LOG_TYPE_FAULT, "Failed to fetch installed apps: %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __66__STAppInfoCache__fetchSyncedInstalledAppInfoForBundleIdentifier___block_invoke_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543874;
  *((_WORD *)buf + 6) = 2080;
  *(_QWORD *)(buf + 4) = a1;
  *(_QWORD *)(buf + 14) = "-[STAppInfoCache _fetchSyncedInstalledAppInfoForBundleIdentifier:]_block_invoke";
  *((_WORD *)buf + 11) = 1024;
  *((_DWORD *)buf + 6) = 618;
  _os_log_error_impl(&dword_1D22E7000, log, OS_LOG_TYPE_ERROR, "Display name missing for installedApplication: %{public}@ in function: %s:%d", buf, 0x1Cu);

}

@end
