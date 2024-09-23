@implementation SearchUIScreenTimeManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_35);
  return (id)sharedInstance_screenTimeManager;
}

- (NSCache)possiblyCorrectCache
{
  return (NSCache *)objc_getProperty(self, a2, 40, 1);
}

- (DMFApplicationPolicyMonitor)monitor
{
  return (DMFApplicationPolicyMonitor *)objc_getProperty(self, a2, 24, 1);
}

void __43__SearchUIScreenTimeManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_screenTimeManager;
  sharedInstance_screenTimeManager = v0;

}

- (SearchUIScreenTimeManager)init
{
  SearchUIScreenTimeManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  NSObject *v6;
  _QWORD block[4];
  SearchUIScreenTimeManager *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SearchUIScreenTimeManager;
  v2 = -[TLKAsyncCache init](&v10, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("screenTimeFetchingQueue", v3);
    -[SearchUIScreenTimeManager setSerialQueue:](v2, "setSerialQueue:", v4);

    v5 = (void *)objc_opt_new();
    -[SearchUIScreenTimeManager setPossiblyCorrectCache:](v2, "setPossiblyCorrectCache:", v5);

    -[SearchUIScreenTimeManager serialQueue](v2, "serialQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__SearchUIScreenTimeManager_init__block_invoke;
    block[3] = &unk_1EA1F62F0;
    v9 = v2;
    dispatch_async(v6, block);

  }
  return v2;
}

- (OS_dispatch_queue)serialQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSerialQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setPossiblyCorrectCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

void __33__SearchUIScreenTimeManager_init__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t);
  void *v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = objc_alloc(MEMORY[0x1E0D1D1D8]);
  v4 = MEMORY[0x1E0C809B0];
  v5 = 3221225472;
  v6 = __33__SearchUIScreenTimeManager_init__block_invoke_2;
  v7 = &unk_1EA1F84E0;
  objc_copyWeak(&v8, &location);
  v3 = (void *)objc_msgSend(v2, "initWithPolicyChangeHandler:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "setMonitor:", v3, v4, v5, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)setMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

void __33__SearchUIScreenTimeManager_init__block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "clear");
  objc_msgSend(WeakRetained, "possiblyCorrectCache");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

  +[SearchUIUtilities dispatchMainIfNecessary:](SearchUIUtilities, "dispatchMainIfNecessary:", &__block_literal_global_10);
}

void __33__SearchUIScreenTimeManager_init__block_invoke_3()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("SearchUIScreenTimeChangeNotification"), 0);

}

- (id)getCachedObjectIfAvailableForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  dispatch_time_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  SearchUIScreenTimeManager *v23;
  id v24;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SearchUIScreenTimeManager;
  -[TLKAsyncCache getCachedObjectIfAvailableForKey:](&v25, sel_getCachedObjectIfAvailableForKey_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || v5)
  {
    v12 = v5;
  }
  else
  {
    v7 = dispatch_time(0, 10000000);
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __62__SearchUIScreenTimeManager_getCachedObjectIfAvailableForKey___block_invoke;
    v22 = &unk_1EA1F6210;
    v23 = self;
    v8 = v4;
    v24 = v8;
    dispatch_after(v7, MEMORY[0x1E0C80D38], &v19);
    -[SearchUIScreenTimeManager possiblyCorrectCache](self, "possiblyCorrectCache", v19, v20, v21, v22, v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = v10;
    }
    else
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);
      objc_msgSend(v13, "compatibilityObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "deviceManagementPolicy") != 0;

      -[SearchUIScreenTimeManager possiblyCorrectCache](self, "possiblyCorrectCache");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKey:", v17, v8);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;

  }
  return v12;
}

uint64_t __62__SearchUIScreenTimeManager_getCachedObjectIfAvailableForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "getObjectForKey:completionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_15);
}

- (void)computeObjectsForKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (+[SearchUIUtilities appIsValidForBundleIdentifier:](SearchUIUtilities, "appIsValidForBundleIdentifier:", v14))
        {
          objc_msgSend(v8, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  -[SearchUIScreenTimeManager monitor](self, "monitor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __69__SearchUIScreenTimeManager_computeObjectsForKeys_completionHandler___block_invoke;
  v18[3] = &unk_1EA1F8548;
  v19 = v9;
  v20 = v7;
  v16 = v7;
  v17 = v9;
  objc_msgSend(v15, "requestPoliciesForBundleIdentifiers:completionHandler:", v8, v18);

}

void __69__SearchUIScreenTimeManager_computeObjectsForKeys_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = *(id *)(a1 + 32);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        if (v10)
          v12 = (void *)v10;
        else
          v12 = &unk_1EA228DB0;
        objc_msgSend(v4, "addObject:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (id)itemsToBatchPreFetchForRowModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "results", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!objc_msgSend(v10, "isLocalApplicationResult")
          || (objc_msgSend(v10, "renderHorizontallyWithOtherResultsInCategory") & 1) == 0)
        {
          objc_msgSend(v10, "applicationBundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "sectionBundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "addObject:", v11);
          if (v12)
            objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_possiblyCorrectCache, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
