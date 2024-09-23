@implementation WLKSettingsStore

uint64_t __33__WLKSettingsStore_watchListApps__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "sortUsingComparator:", &__block_literal_global_50);
}

void __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  uint64_t v34;
  id v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id obj;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v1 = a1;
  v62 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
    v3 = WeakRetained;
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "migratePrivateModeFromDiskIfNeeded:", *(_QWORD *)(v1 + 32));

    +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "migrateSportsSpoilersFromDiskIfNeeded:", *(_QWORD *)(v1 + 32));

    objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", CFSTR("LastSyncDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v3 + 12);
    *((_QWORD *)v3 + 12) = v6;

    objc_msgSend(*(id *)(v1 + 32), "objectForKeyedSubscript:", CFSTR("LastSyncToCloudDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v3 + 13);
    *((_QWORD *)v3 + 13) = v8;

    objc_storeStrong((id *)v3 + 4, *(id *)(v1 + 40));
    objc_storeStrong((id *)v3 + 3, *(id *)(v1 + 48));
    objc_msgSend(*(id *)(v1 + 56), "objectForKeyedSubscript:", CFSTR("OptedIn"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v3 + 48) = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(*(id *)(v1 + 56), "objectForKeyedSubscript:", CFSTR("OptedIn"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v3 + 5);
    *((_QWORD *)v3 + 5) = v11;

    objc_msgSend(*(id *)(v1 + 56), "objectForKeyedSubscript:", CFSTR("MigratediOS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *((_BYTE *)v3 + 49) = objc_msgSend(v13, "BOOLValue");

    objc_msgSend(*(id *)(v1 + 56), "objectForKeyedSubscript:", CFSTR("MigratedtvOS"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v3;
    *((_BYTE *)v3 + 50) = objc_msgSend(v14, "BOOLValue");

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    obj = *(id *)(v1 + 64);
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (!v47)
      goto LABEL_28;
    v45 = v1;
    v46 = *(_QWORD *)v57;
    while (1)
    {
      for (i = 0; i != v47; i = v34 + 1)
      {
        if (*(_QWORD *)v57 != v46)
          objc_enumerationMutation(obj);
        v49 = i;
        v16 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "channelID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "externalID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("%@:%@"), v18, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "addObject:", v20);

        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v21 = *(id *)(*(_QWORD *)(v1 + 72) + 56);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        if (!v22)
        {

LABEL_25:
          objc_msgSend(*(id *)(*(_QWORD *)(v1 + 72) + 56), "addObject:", v16);
          v34 = v49;
          continue;
        }
        v23 = v22;
        v50 = 0;
        v24 = *(_QWORD *)v53;
        do
        {
          v25 = 0;
          v51 = v23;
          do
          {
            if (*(_QWORD *)v53 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v25);
            objc_msgSend(v26, "channelID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "channelID");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v27, "isEqualToString:", v28) & 1) == 0)
            {

              goto LABEL_16;
            }
            objc_msgSend(v26, "externalID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v16;
            objc_msgSend(v16, "externalID");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = +[WLKAppSettings isExternalID:equalToExternalID:](WLKAppSettings, "isExternalID:equalToExternalID:", v29, v31);

            if (v32)
            {
              v27 = v50;
              v23 = v51;
              v50 = v26;
              v16 = v30;
LABEL_16:

              goto LABEL_18;
            }
            v16 = v30;
            v23 = v51;
LABEL_18:
            ++v25;
          }
          while (v23 != v25);
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
        }
        while (v23);

        v1 = v45;
        if (!v50)
          goto LABEL_25;
        objc_msgSend(v50, "setAccessStatus:", objc_msgSend(v16, "accessStatus"));
        objc_msgSend(v16, "displayName");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v49;
        if (objc_msgSend(v33, "length"))
          objc_msgSend(v50, "setDisplayName:", v33);

      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      if (!v47)
      {
LABEL_28:

        v35 = objc_alloc_init(MEMORY[0x1E0CB3788]);
        if (objc_msgSend(*(id *)(*(_QWORD *)(v1 + 72) + 56), "count"))
        {
          v36 = 0;
          do
          {
            objc_msgSend(*(id *)(*(_QWORD *)(v1 + 72) + 56), "objectAtIndex:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v37, "channelID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "externalID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "stringWithFormat:", CFSTR("%@:%@"), v39, v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v48, "containsObject:", v41) & 1) == 0)
              objc_msgSend(v35, "addIndex:", v36);

            ++v36;
          }
          while (v36 < objc_msgSend(*(id *)(*(_QWORD *)(v1 + 72) + 56), "count"));
        }
        objc_msgSend(*(id *)(*(_QWORD *)(v1 + 72) + 56), "removeObjectsAtIndexes:", v35);

        WeakRetained = v43;
        goto LABEL_36;
      }
    }
  }
  NSLog(CFSTR("WLKSettingsStore: object invalid inner block."));
  v42 = *(_QWORD *)(v1 + 80);
  if (v42)
    (*(void (**)(void))(v42 + 16))();
LABEL_36:

}

void __34__WLKSettingsStore_sharedSettings__block_invoke()
{
  WLKSettingsStore *v0;
  void *v1;

  __isInitializing_0 = 1;
  v0 = objc_alloc_init(WLKSettingsStore);
  v1 = (void *)sharedSettings___singleInstance;
  sharedSettings___singleInstance = (uint64_t)v0;

  __isInitializing_0 = 0;
}

- (WLKSettingsStore)init
{
  WLKSettingsStore *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *accessQueue;
  dispatch_queue_t v5;
  OS_dispatch_queue *readWriteQueue;
  uint64_t v7;
  NSMutableArray *apps;
  uint64_t v9;
  void *defaultsAccessor;
  id v11;
  uint64_t v12;
  NSUserDefaults *v13;
  WLKSettingsStore *v14;
  void *v15;
  void *v16;
  _QWORD handler[4];
  WLKSettingsStore *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WLKSettingsStore;
  v2 = -[WLKSettingsStore init](&v20, sel_init);
  if (v2)
  {
    NSLog(CFSTR("WLKSettingsStore - init"));
    v3 = dispatch_queue_create("WLKSettingsQueue", 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v3;

    v5 = dispatch_queue_create("WLKSettingsQueueRW", 0);
    readWriteQueue = v2->_readWriteQueue;
    v2->_readWriteQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    apps = v2->_apps;
    v2->_apps = (NSMutableArray *)v7;

    if (WLKIsTVApp())
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v9 = objc_claimAutoreleasedReturnValue();
      defaultsAccessor = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v9;
    }
    else
    {
      v11 = objc_alloc(MEMORY[0x1E0C99EA0]);
      WLKTVAppBundleID();
      defaultsAccessor = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "initWithSuiteName:", defaultsAccessor);
      v13 = v2->_defaultsAccessor;
      v2->_defaultsAccessor = (NSUserDefaults *)v12;

    }
    -[WLKSettingsStore refreshWithCompletion:](v2, "refreshWithCompletion:", 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __24__WLKSettingsStore_init__block_invoke;
    handler[3] = &unk_1E68A8820;
    v14 = v2;
    v19 = v14;
    notify_register_dispatch("com.apple.WatchListKit.WLKSettingsDidChangeNotification", &v2->_didChangeNotificationToken, MEMORY[0x1E0C80D38], handler);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[WLKAccountMonitor sharedInstance](WLKAccountMonitor, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v14, sel__activeAccountChangedNotification_, CFSTR("WLKAccountMonitorAccountDidChange"), v16);

  }
  return v2;
}

- (void)_loadFromDiskWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke;
  v6[3] = &unk_1E68A9600;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v6[4] = self;
  v7 = v5;
  -[WLKSettingsStore _dictionaryOnDisk:](self, "_dictionaryOnDisk:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)_dictionaryOnDisk:(id)a3
{
  id v4;
  int64_t v5;
  dispatch_time_t v6;
  NSObject *readWriteQueue;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (+[WLKSettingsStore isHostedInRemoteViewService](WLKSettingsStore, "isHostedInRemoteViewService"))
    v5 = 10000000;
  else
    v5 = 0;
  v6 = dispatch_time(0, v5);
  readWriteQueue = self->_readWriteQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke;
  v9[3] = &unk_1E68A8258;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_after(v6, readWriteQueue, v9);

}

+ (BOOL)isHostedInRemoteViewService
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.TVAccessViewService"));
  return (char)v2;
}

uint64_t __27__WLKSettingsStore_optedIn__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

void __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99D50];
  objc_msgSend(*(id *)(a1 + 32), "_supportPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfFile:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_supportPath
{
  void *v2;
  void *v3;
  id v4;

  WLKDefaultSupportPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("settings.plist"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "stringByExpandingTildeInPath");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    NSLog(CFSTR("WLKSettingsStore - Error: DefaultSupportPath returned nil"));
    v4 = v2;
    v3 = v4;
  }

  return v4;
}

+ (id)sharedSettings
{
  if (sharedSettings___once != -1)
    dispatch_once(&sharedSettings___once, &__block_literal_global_41);
  return (id)sharedSettings___singleInstance;
}

- (BOOL)optedIn
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__WLKSettingsStore_optedIn__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)consentedBrands
{
  void *v2;
  void *v3;
  id v4;
  id v5;
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
  -[WLKSettingsStore watchListApps](self, "watchListApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
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
        if (objc_msgSend(v10, "accessStatus", (_QWORD)v14) == 1)
        {
          objc_msgSend(v10, "channelID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)deniedBrands
{
  void *v2;
  void *v3;
  id v4;
  id v5;
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
  -[WLKSettingsStore watchListApps](self, "watchListApps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
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
        if (objc_msgSend(v10, "accessStatus", (_QWORD)v14) == 2)
        {
          objc_msgSend(v10, "channelID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)watchListApps
{
  NSObject *accessQueue;
  void *v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__7;
  v11 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__WLKSettingsStore_watchListApps__block_invoke;
  v6[3] = &unk_1E68A8CE0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(accessQueue, v6);
  v4 = (void *)objc_msgSend((id)v8[5], "copy");
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__WLKSettingsStore__dictionaryRepresentationCopyingItems___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v2, CFSTR("DSID"));

  v3 = *(_QWORD **)(a1 + 32);
  v4 = (void *)v3[3];
  if (v4)
  {
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v5, CFSTR("PushToken"));

    v3 = *(_QWORD **)(a1 + 32);
  }
  v6 = (void *)v3[12];
  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v7, CFSTR("LastSyncDate"));

    v3 = *(_QWORD **)(a1 + 32);
  }
  v8 = (void *)v3[13];
  if (v8)
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v9, CFSTR("LastSyncToCloudDate"));

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56), *(unsigned __int8 *)(a1 + 48));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, CFSTR("AppsArray"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, CFSTR("OptedIn"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, CFSTR("MigratediOS"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 50));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("MigratedtvOS"));

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v14, CFSTR("SynchronizedSettings"));
}

void __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  NSLog(CFSTR("WLKSettingsStore - daemon callback for read"));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  int v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  _QWORD block[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  id v43;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DSID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_dictionaryRepresentation");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_activeiTunesAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ams_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v9;
    v11 = v5;
    v12 = v11;
    v33 = v11;
    if (v10 == v11)
    {
      v17 = v11;
      v18 = v11;
    }
    else
    {
      if (v11)
        v13 = v10 == 0;
      else
        v13 = 1;
      v14 = !v13;
      if (v13)
      {

      }
      else
      {
        v15 = objc_msgSend(v10, "isEqual:", v11);

        if ((v15 & 1) != 0)
          goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v19 = objc_claimAutoreleasedReturnValue();

      if (!v14
        || (NSLog(CFSTR("WLKSettingsStore: account persisted does not match, resetting store")),
            !WLKShouldRunInProcess()))
      {
        v3 = (id)v19;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "_supportPath");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeItemAtPath:error:", v17, 0);
      v3 = (id)v19;
    }

LABEL_21:
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PushToken"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SynchronizedSettings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("AppsArray"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = WeakRetained[1];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__WLKSettingsStore__loadFromDiskWithCompletion___block_invoke_2;
    block[3] = &unk_1E68A95D8;
    objc_copyWeak(&v43, (id *)(a1 + 48));
    v42 = *(id *)(a1 + 40);
    v3 = v3;
    v36 = v3;
    v24 = v10;
    v37 = v24;
    v25 = v20;
    v38 = v25;
    v26 = v21;
    v39 = v26;
    v27 = v22;
    v28 = *(_QWORD *)(a1 + 32);
    v40 = v27;
    v41 = v28;
    dispatch_sync(v23, block);
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SynchronizedSettings"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("AppsArray"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v27, "isEqualToArray:", v30);

    if ((v31 & 1) == 0)
      objc_msgSend(WeakRetained, "_tickleKVO");
    v32 = *(_QWORD *)(a1 + 40);
    if (v32)
      (*(void (**)(void))(v32 + 16))();

    objc_destroyWeak(&v43);
    goto LABEL_26;
  }
  NSLog(CFSTR("WLKSettingsStore: object invalid."));
  v16 = *(_QWORD *)(a1 + 40);
  if (v16)
    (*(void (**)(void))(v16 + 16))();
LABEL_26:

}

- (void)_tickleKVO
{
  uint64_t v2;
  void (**v3)(_QWORD);
  _QWORD v4[4];
  void (**v5)(_QWORD);
  _QWORD v6[5];

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__WLKSettingsStore__tickleKVO__block_invoke;
  v6[3] = &unk_1E68A80F8;
  v6[4] = self;
  v3 = (void (**)(_QWORD))MEMORY[0x1B5E47FF4](v6, a2);
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    v3[2](v3);
  }
  else
  {
    v4[0] = v2;
    v4[1] = 3221225472;
    v4[2] = __30__WLKSettingsStore__tickleKVO__block_invoke_2;
    v4[3] = &unk_1E68A7DE0;
    v5 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

  }
}

- (id)_dictionaryRepresentation
{
  return -[WLKSettingsStore _dictionaryRepresentationCopyingItems:](self, "_dictionaryRepresentationCopyingItems:", 0);
}

- (id)_dictionaryRepresentationCopyingItems:(BOOL)a3
{
  NSObject *accessQueue;
  void *v6;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__WLKSettingsStore__dictionaryRepresentationCopyingItems___block_invoke;
  block[3] = &unk_1E68A95B0;
  block[4] = self;
  block[5] = &v10;
  v9 = a3;
  dispatch_sync(accessQueue, block);
  v6 = (void *)objc_msgSend((id)v11[5], "copy");
  _Block_object_dispose(&v10, 8);

  return v6;
}

- (void)refreshWithCompletion:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[WLKSettingsStore ignoreChangesCount](self, "ignoreChangesCount") < 1)
  {
    -[WLKSettingsStore _loadFromDiskWithCompletion:](self, "_loadFromDiskWithCompletion:", v4);
  }
  else
  {
    NSLog(CFSTR("WLKSettingsStore: ignoring refreshWithCompletion call since ignoreChangesCount is > 0."));
    if (v4)
      v4[2]();
  }

}

- (int)ignoreChangesCount
{
  return self->_ignoreChangesCount;
}

void __38__WLKSettingsStore__dictionaryOnDisk___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD block[6];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  if (WLKShouldRunInProcess())
  {
    v2 = (void *)MEMORY[0x1B5E47E50]();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__7;
    v32 = __Block_byref_object_dispose__7;
    v33 = 0;
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_2;
    block[3] = &unk_1E68A84D0;
    block[4] = v3;
    block[5] = &v28;
    dispatch_sync(v4, block);
    if (v29[5])
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3710]);
      v6 = v29[5];
      v26 = 0;
      v7 = (void *)objc_msgSend(v5, "initForReadingFromData:error:", v6, &v26);
      v8 = v26;
      v9 = v8;
      if (v8)
      {
        NSLog(CFSTR("WLKSettingsStore - read failed secure unarchiver error: %@"), v8);
        v10 = 0;
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C99E60];
        v15 = objc_opt_class();
        v16 = objc_opt_class();
        v17 = objc_opt_class();
        v18 = objc_opt_class();
        v19 = objc_opt_class();
        objc_msgSend(v14, "setWithObjects:", v15, v16, v17, v18, v19, objc_opt_class(), 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "decodeObjectOfClasses:forKey:", v20, *MEMORY[0x1E0CB2CD0]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v10 = 0;
    }
    v21 = *(_QWORD *)(a1 + 40);
    if (v21)
      (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v10);
    _Block_object_dispose(&v28, 8);

    objc_autoreleasePoolPop(v2);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_connection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_3;
    v24[3] = &unk_1E68A7E88;
    v25 = *(id *)(a1 + 40);
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", v24);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    NSLog(CFSTR("WLKSettingsStore - calling out to daemon for read"));
    v22[0] = v12;
    v22[1] = 3221225472;
    v22[2] = __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_4;
    v22[3] = &unk_1E68A9740;
    v23 = *(id *)(a1 + 40);
    objc_msgSend(v13, "readSettingsStore:", v22);

  }
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

    -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", &__block_literal_global_142);
    objc_initWeak(&location, self);
    v10 = self->_connection;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __31__WLKSettingsStore__connection__block_invoke_2;
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

uint64_t __30__WLKSettingsStore__tickleKVO__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (BOOL)isSettingsStoreInitializing
{
  return __isInitializing_0;
}

uint64_t __30__WLKSettingsStore__tickleKVO__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("watchListApps"));
  return objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("watchListApps"));
}

- (BOOL)upNextLockupsUseCoverArt
{
  void *v2;
  char v3;

  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "upNextLockupsUseCoverArt");

  return v3;
}

- (NSDate)lastSyncDate
{
  return self->_lastSyncDate;
}

void __24__WLKSettingsStore_init__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint64_t state64;

  state64 = 0;
  notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 72), &state64);
  if (state64 != getpid())
  {
    NSLog(CFSTR("WLKSettingsStore - Received didChange notification"));
    objc_msgSend(*(id *)(a1 + 32), "_dictionaryRepresentationDataOnly");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __24__WLKSettingsStore_init__block_invoke_2;
    v5[3] = &unk_1E68A79C0;
    v6 = v3;
    v7 = v2;
    v4 = v2;
    objc_msgSend(v6, "refreshWithCompletion:", v5);

  }
}

void __24__WLKSettingsStore_init__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_dictionaryRepresentationDataOnly");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToDictionary:") & 1) == 0)
  {
    NSLog(CFSTR("WLKSettingsStore - Firing local notification"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("WLKSettingsDidChangeNotification"), 0);

  }
}

- (void)dealloc
{
  int didChangeNotificationToken;
  void *v4;
  objc_super v5;

  didChangeNotificationToken = self->_didChangeNotificationToken;
  if (didChangeNotificationToken)
    notify_cancel(didChangeNotificationToken);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)WLKSettingsStore;
  -[WLKSettingsStore dealloc](&v5, sel_dealloc);
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___WLKSettingsStore;
  v3 = a3;
  objc_msgSendSuper2(&v8, sel_keyPathsForValuesAffectingValueForKey_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("_watchListAppsFiltered"), v8.receiver, v8.super_class);

  if (v5)
  {
    objc_msgSend(v4, "setByAddingObjectsFromArray:", &unk_1E68CA1B0);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

uint64_t __33__WLKSettingsStore_watchListApps__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (id)settingsForChannelID:(id)a3 externalID:(id)a4
{
  id v6;
  id v7;
  NSObject *accessQueue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  accessQueue = self->_accessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__WLKSettingsStore_settingsForChannelID_externalID___block_invoke;
  v13[3] = &unk_1E68A9518;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(accessQueue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __52__WLKSettingsStore_settingsForChannelID_externalID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  NSLog(CFSTR("WLKSettingsStore: settingsForChannelID. Apps count:%lu, channelID:%@, externalID:%@"), objc_msgSend(*(id *)(a1[4] + 56), "count"), a1[5], a1[6]);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1[4] + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "channelID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", a1[5]) & 1) != 0)
        {
          objc_msgSend(v7, "externalID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = +[WLKAppSettings isExternalID:equalToExternalID:](WLKAppSettings, "isExternalID:equalToExternalID:", v9, a1[6]);

          if (v10)
          {
            NSLog(CFSTR("WLKSettingsStore: settingsForChannelID. App found"));
            objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);
            goto LABEL_12;
          }
        }
        else
        {

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
LABEL_12:

}

- (id)_copyAppsForChannelID:(id)a3 apps:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "channelID", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v5);

        if (v15)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
    v16 = (void *)objc_msgSend(v7, "copy");
  else
    v16 = 0;

  return v16;
}

- (void)setStatus:(unint64_t)a3 forChannelID:(id)a4 externalID:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *accessQueue;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[5];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (v8)
  {
    v10 = (void *)MEMORY[0x1B5E47E50]();
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__7;
    v37 = __Block_byref_object_dispose__7;
    v38 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__7;
    v31 = __Block_byref_object_dispose__7;
    v32 = 0;
    accessQueue = self->_accessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__WLKSettingsStore_setStatus_forChannelID_externalID___block_invoke;
    block[3] = &unk_1E68A9540;
    v24 = &v27;
    block[4] = self;
    v22 = v8;
    v23 = v9;
    v25 = &v33;
    v26 = a3;
    dispatch_sync(accessQueue, block);
    if (!v34[5] && objc_msgSend((id)v28[5], "count"))
    {
      v19 = 0u;
      v20 = 0u;
      v17 = 0u;
      v18 = 0u;
      v12 = (id)v28[5];
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v39, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v18;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v18 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
            objc_msgSend(v16, "setAccessStatus:", 2, (_QWORD)v17);
            objc_msgSend(v16, "setObsolete:", 1);
            -[WLKSettingsStore _attemptCullingOfObsoleteApp:](self, "_attemptCullingOfObsoleteApp:", v16);
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v39, 16);
        }
        while (v13);
      }

    }
    -[WLKSettingsStore _tickleKVO](self, "_tickleKVO", (_QWORD)v17);

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v33, 8);

    objc_autoreleasePoolPop(v10);
    -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");
  }
  else
  {
    NSLog(CFSTR("WLKSettingsStore - channelID is nil"));
  }

}

void __54__WLKSettingsStore_setStatus_forChannelID_externalID___block_invoke(_QWORD *a1)
{
  id *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  WLKAppSettings *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (id *)a1[4];
  v3 = a1[5];
  v4 = (void *)objc_msgSend(v2[7], "copy");
  v5 = objc_msgSend(v2, "_copyAppsForChannelID:apps:", v3, v4);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = *(id *)(*(_QWORD *)(a1[7] + 8) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v13, "externalID", (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = +[WLKAppSettings isExternalID:equalToExternalID:](WLKAppSettings, "isExternalID:equalToExternalID:", v14, a1[6]);

        if (v15)
        {
          NSLog(CFSTR("WLKSettingsStore - Found app."));
          objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v13);
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_11:

  v16 = *(void **)(*(_QWORD *)(a1[8] + 8) + 40);
  if (v16)
  {
    objc_msgSend(v16, "setAccessStatus:", a1[9]);
  }
  else
  {
    v17 = -[WLKAppSettings initWithChannelID:accessStatus:displayName:externalID:]([WLKAppSettings alloc], "initWithChannelID:accessStatus:displayName:externalID:", a1[5], a1[9], 0, a1[6]);
    objc_msgSend(*(id *)(a1[4] + 56), "addObject:", v17);
    NSLog(CFSTR("WLKSettingsStore - No exact match."));

  }
}

- (void)setName:(id)a3 forChannelID:(id)a4 externalID:(id)a5
{
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *accessQueue;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;

  v13 = a3;
  -[WLKSettingsStore settingsForChannelID:externalID:](self, "settingsForChannelID:externalID:", a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v13, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__WLKSettingsStore_setName_forChannelID_externalID___block_invoke;
      block[3] = &unk_1E68A79C0;
      v15 = v9;
      v16 = v13;
      dispatch_sync(accessQueue, block);
      -[WLKSettingsStore _tickleKVO](self, "_tickleKVO");

    }
  }
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");

}

uint64_t __52__WLKSettingsStore_setName_forChannelID_externalID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDisplayName:", *(_QWORD *)(a1 + 40));
}

- (void)publishCrossProcessSettingsChangedNotification
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __66__WLKSettingsStore_publishCrossProcessSettingsChangedNotification__block_invoke;
  v3[3] = &unk_1E68A7FC0;
  objc_copyWeak(&v4, &location);
  dispatch_async(v2, v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__WLKSettingsStore_publishCrossProcessSettingsChangedNotification__block_invoke(uint64_t a1)
{
  _DWORD *WeakRetained;
  int v2;
  pid_t v3;
  _DWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained[18];
    v4 = WeakRetained;
    v3 = getpid();
    notify_set_state(v2, v3);
    notify_post("com.apple.WatchListKit.WLKSettingsDidChangeNotification");
    WeakRetained = v4;
  }

}

- (NSSet)suppressedSportsEventIDs
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v9;
  id v10;

  -[NSUserDefaults objectForKey:](self->_defaultsAccessor, "objectForKey:", CFSTR("SuppressedSportsEventIDs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSUserDefaults objectForKey:](self->_defaultsAccessor, "objectForKey:", CFSTR("SuppressedSportsEventIDs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedArrayOfObjectsOfClass:fromData:error:", objc_opt_class(), v4, &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    v7 = v6;
    if (v6)
    {
      NSLog(CFSTR("WLKSettingsStore - Error unarchiving suppressedSportsEventIds: %@"), v6);
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSSet *)v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)setSportsNotificationSuppression:(BOOL)a3 forEventID:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  int v8;
  NSObject *accessQueue;
  id v10;
  _QWORD block[4];
  id v12;
  WLKSettingsStore *v13;

  v4 = a3;
  v10 = a4;
  -[WLKSettingsStore suppressedSportsEventIDs](self, "suppressedSportsEventIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  v8 = objc_msgSend(v7, "containsObject:", v10);
  if (v4)
  {
    if ((v8 & 1) == 0)
    {
      objc_msgSend(v7, "addObject:", v10);
LABEL_6:
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __64__WLKSettingsStore_setSportsNotificationSuppression_forEventID___block_invoke;
      block[3] = &unk_1E68A79C0;
      v12 = v7;
      v13 = self;
      dispatch_sync(accessQueue, block);

    }
  }
  else if (v8)
  {
    objc_msgSend(v7, "removeObject:", v10);
    goto LABEL_6;
  }

}

void __64__WLKSettingsStore_setSportsNotificationSuppression_forEventID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v2, 1, &v10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v10;
  v5 = v4;
  if (v4)
  {
    NSLog(CFSTR("WLKSettingsStore - Error archiving suppressedSportsEventIds: %@"), v4);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 64), "setObject:forKey:", v3, CFSTR("SuppressedSportsEventIDs"));
    v6 = (void *)objc_opt_class();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v11[0] = CFSTR("SuppressedSportsEventIDs");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "synchronizeSettingsDefaultsForKeys:", v9);

  }
}

- (void)clearAllSportsNotificationSuppression
{
  NSObject *accessQueue;
  _QWORD block[5];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WLKSettingsStore_clearAllSportsNotificationSuppression__block_invoke;
  block[3] = &unk_1E68A80F8;
  block[4] = self;
  dispatch_sync(accessQueue, block);
}

void __57__WLKSettingsStore_clearAllSportsNotificationSuppression__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObjectForKey:", CFSTR("SuppressedSportsEventIDs"));
  v1 = (void *)objc_opt_class();
  v2 = (void *)MEMORY[0x1E0C99E60];
  v5[0] = CFSTR("SuppressedSportsEventIDs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "synchronizeSettingsDefaultsForKeys:", v4);

}

- (void)setOptedIn:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v5[5];
  BOOL v6;

  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__WLKSettingsStore_setOptedIn___block_invoke;
  v5[3] = &unk_1E68A9568;
  v5[4] = self;
  v6 = a3;
  dispatch_sync(accessQueue, v5);
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");
}

uint64_t __31__WLKSettingsStore_setOptedIn___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = *(_BYTE *)(result + 40);
  return result;
}

- (NSNumber)optedInVal
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __30__WLKSettingsStore_optedInVal__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSNumber *)v3;
}

void __30__WLKSettingsStore_optedInVal__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setMigratediOS:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v5[5];
  BOOL v6;

  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__WLKSettingsStore_setMigratediOS___block_invoke;
  v5[3] = &unk_1E68A9568;
  v5[4] = self;
  v6 = a3;
  dispatch_sync(accessQueue, v5);
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");
}

uint64_t __35__WLKSettingsStore_setMigratediOS___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 49) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)migratediOS
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __31__WLKSettingsStore_migratediOS__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__WLKSettingsStore_migratediOS__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 49);
  return result;
}

- (void)setMigratedtvOS:(BOOL)a3
{
  NSObject *accessQueue;
  _QWORD v5[5];
  BOOL v6;

  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__WLKSettingsStore_setMigratedtvOS___block_invoke;
  v5[3] = &unk_1E68A9568;
  v5[4] = self;
  v6 = a3;
  dispatch_sync(accessQueue, v5);
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");
}

uint64_t __36__WLKSettingsStore_setMigratedtvOS___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 50) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)migratedtvOS
{
  NSObject *accessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__WLKSettingsStore_migratedtvOS__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __32__WLKSettingsStore_migratedtvOS__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 50);
  return result;
}

- (void)setLastSyncDate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WLKSettingsStore_setLastSyncDate___block_invoke;
  block[3] = &unk_1E68A79C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");

}

void __36__WLKSettingsStore_setLastSyncDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), *(id *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), CFSTR("WLKSettingsLastSyncDate"));
  v2 = (void *)objc_opt_class();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v6[0] = CFSTR("WLKSettingsLastSyncDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronizeSettingsDefaultsForKeys:", v5);

}

- (void)setLastSyncToCloudDate:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__WLKSettingsStore_setLastSyncToCloudDate___block_invoke;
  block[3] = &unk_1E68A79C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");

}

void __43__WLKSettingsStore_setLastSyncToCloudDate___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 104), *(id *)(a1 + 40));
}

- (void)setPushToken:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  WLKSettingsStore *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__WLKSettingsStore_setPushToken___block_invoke;
  block[3] = &unk_1E68A9130;
  v6 = v4;
  v8 = v6;
  v9 = self;
  v10 = &v11;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v12 + 24))
    -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");

  _Block_object_dispose(&v11, 8);
}

void __33__WLKSettingsStore_setPushToken___block_invoke(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24)) & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 24), *(id *)(a1 + 32));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
}

- (NSString)pushToken
{
  NSObject *accessQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__7;
  v10 = __Block_byref_object_dispose__7;
  v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __29__WLKSettingsStore_pushToken__block_invoke;
  v5[3] = &unk_1E68A84D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __29__WLKSettingsStore_pushToken__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (id)description
{
  void *v2;
  void *v3;

  -[WLKSettingsStore _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_watchListAppsFiltered
{
  WLKSettingsStore *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  _BOOL4 v30;
  id v31;
  void *v32;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  WLKSettingsStore *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v2 = self;
  v52 = *MEMORY[0x1E0C80C00];
  -[WLKSettingsStore watchListApps](self, "watchListApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v34 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[WLKChannelUtilities sharedInstance](WLKChannelUtilities, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "orderedChannels");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v47;
    v37 = v5;
    v38 = v2;
    v35 = *(_QWORD *)v47;
    v36 = v8;
    do
    {
      v12 = 0;
      v39 = v10;
      do
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v12);
        if (objc_msgSend(v13, "isWatchListEnabled") && (objc_msgSend(v13, "isFirstParty") & 1) == 0)
        {
          objc_msgSend(v13, "channelID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[WLKSettingsStore _appsForChannelID:](v2, "_appsForChannelID:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v15, "count"))
          {
            v41 = v12;
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "appBundleIDs");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            WLKSubscriptionIdentifierForBundleID(v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            v44 = 0u;
            v45 = 0u;
            v42 = 0u;
            v43 = 0u;
            v40 = v15;
            v20 = v15;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
            if (v21)
            {
              v22 = v21;
              v23 = 0;
              v24 = *(_QWORD *)v43;
              do
              {
                for (i = 0; i != v22; ++i)
                {
                  if (*(_QWORD *)v43 != v24)
                    objc_enumerationMutation(v20);
                  v26 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
                  objc_msgSend(v26, "displayName");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v27, "length"))
                  {
                    v28 = objc_msgSend(v26, "accessStatus");

                    if (v28)
                    {
                      objc_msgSend(v26, "externalID");
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      v30 = +[WLKAppSettings isExternalID:equalToExternalID:](WLKAppSettings, "isExternalID:equalToExternalID:", v29, v19);

                      if (v30)
                      {
                        v31 = v26;

                        v23 = v31;
                      }
                      else
                      {
                        objc_msgSend(v16, "addObject:", v26);
                      }
                    }
                  }
                  else
                  {

                  }
                }
                v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
              }
              while (v22);

              v5 = v37;
              v2 = v38;
              v11 = v35;
              v8 = v36;
              if (v23)
              {
                objc_msgSend(v37, "addObject:", v23);
                v10 = v39;
                goto LABEL_28;
              }
            }
            else
            {

            }
            v10 = v39;
            if (objc_msgSend(v16, "count"))
            {
              objc_msgSend(v16, "firstObject");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v32);

            }
            v23 = 0;
LABEL_28:

            v15 = v40;
            v12 = v41;
          }

        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v10);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_74);
  return v5;
}

uint64_t __42__WLKSettingsStore__watchListAppsFiltered__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (void)_updateDisplayNamesForUI:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__WLKSettingsStore__updateDisplayNamesForUI___block_invoke;
  v7[3] = &unk_1E68A8258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __45__WLKSettingsStore__updateDisplayNamesForUI___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  BOOL v16;
  void *v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  +[WLKChannelUtilities sharedInstance](WLKChannelUtilities, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "channelsByID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "beginIgnoringChanges");
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v22 = a1;
    objc_msgSend(*(id *)(a1 + 32), "watchListApps");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (!v4)
      goto LABEL_21;
    v5 = v4;
    v6 = *(_QWORD *)v25;
    while (1)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v8, "channelID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_msgSend(v8, "displayName");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v11;
          v14 = v12;
          if (v13 == v14)
          {

            v17 = v13;
            goto LABEL_18;
          }
          v15 = v14;
          if (v13)
            v16 = v14 == 0;
          else
            v16 = 1;
          if (v16)
          {

LABEL_17:
            v19 = *(void **)(v22 + 32);
            objc_msgSend(v8, "channelID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "externalID");
            v20 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setName:forChannelID:externalID:", v13, v17, v20);
            v13 = (id)v20;
LABEL_18:

            goto LABEL_19;
          }
          v18 = objc_msgSend(v13, "isEqual:", v14);

          if ((v18 & 1) == 0)
            goto LABEL_17;
        }
LABEL_19:

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (!v5)
      {
LABEL_21:

        a1 = v22;
        objc_msgSend(*(id *)(v22 + 32), "endIgnoringChanges");
        break;
      }
    }
  }
  v21 = *(_QWORD *)(a1 + 40);
  if (v21)
    (*(void (**)(uint64_t, BOOL))(v21 + 16))(v21, v3 != 0);

}

- (id)_dictionaryRepresentationDataOnly
{
  void *v2;
  void *v3;
  void *v4;

  -[WLKSettingsStore _dictionaryRepresentationCopyingItems:](self, "_dictionaryRepresentationCopyingItems:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", CFSTR("LastSyncDate"));
  objc_msgSend(v3, "removeObjectForKey:", CFSTR("LastSyncToCloudDate"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)_writeToDisk
{
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD v8[4];
  dispatch_semaphore_t v9;

  if (-[WLKSettingsStore ignoreChangesCount](self, "ignoreChangesCount") < 1)
  {
    v3 = (void *)MEMORY[0x1B5E47E50]();
    v4 = dispatch_semaphore_create(0);
    -[WLKSettingsStore _dictionaryRepresentation](self, "_dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__WLKSettingsStore__writeToDisk__block_invoke;
    v8[3] = &unk_1E68A9628;
    v9 = v4;
    v6 = v4;
    -[WLKSettingsStore _writeToDisk:completion:](self, "_writeToDisk:completion:", v5, v8);

    v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);

    objc_autoreleasePoolPop(v3);
  }
  else
  {
    -[WLKSettingsStore setHasOutstandingChanges:](self, "setHasOutstandingChanges:", 1);
  }
}

intptr_t __32__WLKSettingsStore__writeToDisk__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_writeToDisk:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *readWriteQueue;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (WLKShouldRunInProcess())
  {
    objc_initWeak(&location, self);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke;
    v12[3] = &unk_1E68A96C8;
    objc_copyWeak(&v15, &location);
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    -[WLKSettingsStore _dictionaryOnDisk:](self, "_dictionaryOnDisk:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    readWriteQueue = self->_readWriteQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_5;
    v9[3] = &unk_1E68A9718;
    v9[4] = self;
    v11 = v7;
    v10 = v6;
    dispatch_async(readWriteQueue, v9);

  }
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id location;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_initWeak(&location, WeakRetained);
  v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_2;
  v7[3] = &unk_1E68A96A0;
  objc_copyWeak(&v12, &location);
  v8 = *(id *)(a1 + 40);
  v9 = v3;
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  v6 = v3;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD block[6];
  id v15;
  char v16;
  id v17;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToDictionary:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (v3)
      (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, 1);
    NSLog(CFSTR("WLKSettingsStore - Skipping write, dictionaries are the same"));
  }
  else
  {
    WLKDefaultSupportPath();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, 0);

      v6 = *(_QWORD *)(a1 + 32);
      v17 = 0;
      objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v17);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v17;
      if (v7)
      {
        objc_msgSend(WeakRetained, "_supportPath");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v7, "writeToFile:atomically:", v9, 1);

      }
      else
      {
        v10 = 0;
      }
      NSLog(CFSTR("WLKSettingsStore - Wrote store %d"), v10);
      dispatch_get_global_queue(0, 0);
      v11 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_3;
      block[3] = &unk_1E68A9678;
      v12 = *(_QWORD *)(a1 + 48);
      v13 = *(void **)(a1 + 56);
      block[4] = WeakRetained;
      block[5] = v12;
      v15 = v13;
      v16 = v10;
      dispatch_async(v11, block);

    }
    else
    {
      NSLog(CFSTR("WLKSettingsStore - Error: DefaultSupportPath returned nil"));
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    }

  }
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_4;
  v3[3] = &unk_1E68A9650;
  v2 = *(void **)(a1 + 32);
  v3[4] = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_BYTE *)(a1 + 56);
  objc_msgSend(v2, "_loadFromDiskWithCompletion:", v3);

}

uint64_t __44__WLKSettingsStore__writeToDisk_completion___block_invoke_4(uint64_t a1)
{
  int v2;
  pid_t v3;
  uint64_t result;

  v2 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = getpid();
  notify_set_state(v2, v3);
  notify_post("com.apple.WatchListKit.WLKSettingsDidChangeNotification");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 48));
  return result;
}

void __44__WLKSettingsStore__writeToDisk_completion___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_6;
  v8[3] = &unk_1E68A7E88;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "remoteObjectProxyWithErrorHandler:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("WLKSettingsStore - calling out to daemon for write"));
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __44__WLKSettingsStore__writeToDisk_completion___block_invoke_7;
  v6[3] = &unk_1E68A96F0;
  v5 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "writeSettingsStore:replyHandler:", v5, v6);

}

uint64_t __44__WLKSettingsStore__writeToDisk_completion___block_invoke_6(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  NSLog(CFSTR("WLKSettingsStore - Error: Unable to communicate with the remote object proxy (%@)"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __44__WLKSettingsStore__writeToDisk_completion___block_invoke_7(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  NSLog(CFSTR("WLKSettingsStore - daemon callback for write"));
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __38__WLKSettingsStore__dictionaryOnDisk___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  NSLog(CFSTR("WLKSettingsStore - Error: Unable to communicate with the remote object proxy (%@)"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)forceUpdateWithCompletion:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  +[WLKChannelUtilities sharedInstanceFiltered](WLKChannelUtilities, "sharedInstanceFiltered");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidateCache");

  +[WLKSettingsCloudUtilities forceUpdateWithCompletion:](WLKSettingsCloudUtilities, "forceUpdateWithCompletion:", v4);
}

- (void)synchronize:(unint64_t)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  if (a3 == 1)
  {
    v6 = v5;
    +[WLKSettingsCloudUtilities updateLocalStoreWithCompletion:](WLKSettingsCloudUtilities, "updateLocalStoreWithCompletion:", v5);
    goto LABEL_5;
  }
  if (!a3)
  {
    v6 = v5;
    +[WLKSettingsCloudUtilities updateCloudStoreWithCompletion:](WLKSettingsCloudUtilities, "updateCloudStoreWithCompletion:", v5);
LABEL_5:
    v5 = v6;
  }

}

- (BOOL)synchronize:(unint64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  dispatch_semaphore_t v8;
  NSObject *v9;
  char v10;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainThread");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("WLKSettingsStoreException"), CFSTR("don't call synchronize: on main thread!"), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise");

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v8 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __32__WLKSettingsStore_synchronize___block_invoke;
  v12[3] = &unk_1E68A9768;
  v14 = &v15;
  v9 = v8;
  v13 = v9;
  -[WLKSettingsStore synchronize:completion:](self, "synchronize:completion:", a3, v12);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v10 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v10;
}

intptr_t __32__WLKSettingsStore_synchronize___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_attemptCullingOfObsoleteApp:(id)a3
{
  id v4;
  void *v5;
  int v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  +[WLKReachabilityMonitor sharedInstance](WLKReachabilityMonitor, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isNetworkReachable");

  if (v6)
  {
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__WLKSettingsStore__attemptCullingOfObsoleteApp___block_invoke;
    v7[3] = &unk_1E68A9790;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    +[WLKSettingsCloudUtilities updateCloudStoreAppSettings:deleteHistory:removeEntry:completion:](WLKSettingsCloudUtilities, "updateCloudStoreAppSettings:deleteHistory:removeEntry:completion:", v8, 0, 1, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

void __49__WLKSettingsStore__attemptCullingOfObsoleteApp___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "_removeWatchListApp:", *(_QWORD *)(a1 + 32));

  }
}

+ (void)synchronizeSettingsDefaultsForKeys:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__WLKSettingsStore_synchronizeSettingsDefaultsForKeys___block_invoke;
  block[3] = &unk_1E68A80F8;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __55__WLKSettingsStore_synchronizeSettingsDefaultsForKeys___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  NSLog(CFSTR("WLKSettingsStore - NPSManager sync begin"));
  v3 = objc_alloc_init(MEMORY[0x1E0D51618]);
  WLKTVAppBundleID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronizeUserDefaultsDomain:keys:", v2, *(_QWORD *)(a1 + 32));

  NSLog(CFSTR("WLKSettingsStore - NPSManager sync end"));
}

- (void)_activeAccountChangedNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *accessQueue;
  id v10;
  _QWORD block[4];
  id v12;
  WLKSettingsStore *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ams_activeiTunesAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "ams_DSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "ams_DSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__WLKSettingsStore__activeAccountChangedNotification___block_invoke;
  block[3] = &unk_1E68A9130;
  v10 = v7;
  v12 = v10;
  v13 = self;
  v14 = &v15;
  dispatch_sync(accessQueue, block);
  if (*((_BYTE *)v16 + 24))
    -[WLKSettingsStore refreshWithCompletion:](self, "refreshWithCompletion:", 0);

  _Block_object_dispose(&v15, 8);
}

void __54__WLKSettingsStore__activeAccountChangedNotification___block_invoke(_QWORD *a1)
{
  void *v2;

  v2 = (void *)a1[4];
  if (v2)
  {
    if ((objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1[5] + 32)) & 1) == 0)
    {
      NSLog(CFSTR("WLKSettingsStore - DSID changed"));
      *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    }
  }
}

- (void)setSportsScoreSpoilersAllowed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSportsScoreSpoilersAllowed:", v3);

}

- (BOOL)sportsScoreSpoilersAllowed
{
  void *v2;
  char v3;

  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sportsScoreSpoilersAllowed");

  return v3;
}

- (void)setUpNextLockupsUseCoverArt:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUpNextLockupsUseCoverArt:", v3);

}

- (void)setPrivateModeEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPrivateModeEnabled:", v3);

}

- (BOOL)privateModeEnabled
{
  void *v2;
  char v3;

  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "privateModeEnabled");

  return v3;
}

- (void)setPostPlayAutoPlayNextVideo:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPostPlayAutoPlayNextVideo:", v3);

}

- (BOOL)postPlayAutoPlayNextVideo
{
  void *v2;
  char v3;

  +[WLKSystemPreferencesStore sharedPreferences](WLKSystemPreferencesStore, "sharedPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "postPlayAutoPlayNextVideo");

  return v3;
}

- (id)_appsForChannelID:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  void *v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__WLKSettingsStore__appsForChannelID___block_invoke;
  block[3] = &unk_1E68A9130;
  block[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  dispatch_sync(accessQueue, block);
  if (objc_msgSend((id)v13[5], "count"))
    v7 = (void *)objc_msgSend((id)v13[5], "copy");
  else
    v7 = 0;

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __38__WLKSettingsStore__appsForChannelID___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1[4] + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v7, "channelID", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", a1[5]);

        if (v9)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObject:", v7);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)_removeWatchListApp:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__WLKSettingsStore__removeWatchListApp___block_invoke;
  block[3] = &unk_1E68A79C0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(accessQueue, block);
  -[WLKSettingsStore _tickleKVO](self, "_tickleKVO");
  -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");

}

uint64_t __40__WLKSettingsStore__removeWatchListApp___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)beginIgnoringChanges
{
  int v3;

  v3 = -[WLKSettingsStore ignoreChangesCount](self, "ignoreChangesCount");
  if (!v3)
    NSLog(CFSTR("WLKSettingsStore: Begin ignoring changes..."));
  -[WLKSettingsStore setIgnoreChangesCount:](self, "setIgnoreChangesCount:", (v3 + 1));
}

- (void)endIgnoringChanges
{
  if (-[WLKSettingsStore ignoreChangesCount](self, "ignoreChangesCount") >= 1)
  {
    -[WLKSettingsStore setIgnoreChangesCount:](self, "setIgnoreChangesCount:", -[WLKSettingsStore ignoreChangesCount](self, "ignoreChangesCount") - 1);
    if (!-[WLKSettingsStore ignoreChangesCount](self, "ignoreChangesCount"))
    {
      NSLog(CFSTR("WLKSettingsStore: End ignoring changes"));
      if (-[WLKSettingsStore hasOutstandingChanges](self, "hasOutstandingChanges"))
      {
        NSLog(CFSTR("WLKSettingsStore: Committing change."));
        -[WLKSettingsStore setHasOutstandingChanges:](self, "setHasOutstandingChanges:", 0);
        -[WLKSettingsStore _writeToDisk](self, "_writeToDisk");
      }
    }
  }
}

void __31__WLKSettingsStore__connection__block_invoke()
{
  NSLog(CFSTR("WLKSettingsStore - Connection interrupted."));
}

void __31__WLKSettingsStore__connection__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  _QWORD *v6;

  NSLog(CFSTR("WLKSettingsStore - Connection invalidated."));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[2];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __31__WLKSettingsStore__connection__block_invoke_3;
    block[3] = &unk_1E68A80F8;
    v6 = WeakRetained;
    dispatch_async(v4, block);

  }
}

void __31__WLKSettingsStore__connection__block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 80);
  *(_QWORD *)(v1 + 80) = 0;

}

- (void)setOptedInVal:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDate)lastSyncToCloudDate
{
  return self->_lastSyncToCloudDate;
}

- (void)setIgnoreChangesCount:(int)a3
{
  self->_ignoreChangesCount = a3;
}

- (BOOL)hasOutstandingChanges
{
  return self->_hasOutstandingChanges;
}

- (void)setHasOutstandingChanges:(BOOL)a3
{
  self->_hasOutstandingChanges = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSyncToCloudDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDate, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_defaultsAccessor, 0);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_optedInVal, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_readWriteQueue, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
