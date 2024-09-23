@implementation STStorageAppsMonitor

+ (id)sharedMonitor
{
  if (sharedMonitor_monitorOnce != -1)
    dispatch_once(&sharedMonitor_monitorOnce, &__block_literal_global_1);
  return (id)_gSharedMonitor;
}

void __37__STStorageAppsMonitor_sharedMonitor__block_invoke()
{
  STStorageAppsMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(STStorageAppsMonitor);
  v1 = (void *)_gSharedMonitor;
  _gSharedMonitor = (uint64_t)v0;

}

- (STStorageAppsMonitor)init
{
  STStorageAppsMonitor *v2;
  NSOperationQueue *v3;
  NSOperationQueue *serialQueue;
  NSLock *v5;
  NSLock *appsLock;
  uint64_t v7;
  NSDictionary *appsByID;
  void *v9;
  STStorageAppsMonitor *v10;
  uint64_t v11;
  NSOperation *initialLoadOperation;
  _QWORD v14[4];
  STStorageAppsMonitor *v15;
  id v16;
  id location;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)STStorageAppsMonitor;
  v2 = -[STStorageAppsMonitor init](&v18, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_serialQueue, "setMaxConcurrentOperationCount:", 1);
    v5 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    appsLock = v2->_appsLock;
    v2->_appsLock = v5;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    appsByID = v2->_appsByID;
    v2->_appsByID = (NSDictionary *)v7;

    v2->_sharedContainerClass = NSClassFromString(CFSTR("STStorageSharedContainer"));
    objc_initWeak(&location, v2);
    v9 = (void *)MEMORY[0x24BDD1478];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __28__STStorageAppsMonitor_init__block_invoke;
    v14[3] = &unk_24C75F5C8;
    objc_copyWeak(&v16, &location);
    v10 = v2;
    v15 = v10;
    objc_msgSend(v9, "blockOperationWithBlock:", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    initialLoadOperation = v10->_initialLoadOperation;
    v10->_initialLoadOperation = (NSOperation *)v11;

    -[NSOperationQueue addOperation:](v2->_serialQueue, "addOperation:", v10->_initialLoadOperation);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __28__STStorageAppsMonitor_init__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  id WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  STUsageBundleRegistry *v9;

  +[STMSizer sharedAppSizer](STMSizer, "sharedAppSizer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAppSizer:", v2);

  v5 = *(_QWORD *)(a1 + 32);
  v6 = objc_loadWeakRetained(v3);
  objc_msgSend(v6, "appSizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v5);

  v9 = objc_alloc_init(STUsageBundleRegistry);
  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "setUsageBundles:", v9);

}

- (void)dealloc
{
  objc_super v3;

  -[STStorageAppsMonitor stopMonitor](self, "stopMonitor");
  v3.receiver = self;
  v3.super_class = (Class)STStorageAppsMonitor;
  -[STStorageAppsMonitor dealloc](&v3, sel_dealloc);
}

- (void)startMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSOperationQueue *serialQueue;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  +[STUpdateMonitor sharedMonitor](STUpdateMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startMonitor");

  +[STFileProviderMonitor sharedMonitor](STFileProviderMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startMonitor");

  +[STStorageMediaMonitor sharedMonitor](STStorageMediaMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMonitor");

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __36__STStorageAppsMonitor_startMonitor__block_invoke;
  v18 = &unk_24C75F5F0;
  objc_copyWeak(&v19, &location);
  -[NSOperationQueue addOperationWithBlock:](serialQueue, "addOperationWithBlock:", &v15);
  v8 = -[STStorageAppsMonitor updateApps](self, "updateApps", v15, v16, v17, v18);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", self, sel_refreshApps_, CFSTR("STNotify_AppsAdded"), v10);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", self, sel_appsStateChanged_, CFSTR("STNotify_AppsStateChanged"), v12);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_mediaSizesChanged_, CFSTR("STNotify_MediaSizesChanged"), v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __36__STStorageAppsMonitor_startMonitor__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "appSizer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "startSizer");

}

- (void)stopMonitor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("STNotify_AppsAdded"), v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("STNotify_AppsStateChanged"), v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, CFSTR("STNotify_MediaSizesChanged"), v8);

  +[STUpdateMonitor sharedMonitor](STUpdateMonitor, "sharedMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stopMonitor");

  +[STFileProviderMonitor sharedMonitor](STFileProviderMonitor, "sharedMonitor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stopMonitor");

  +[STStorageMediaMonitor sharedMonitor](STStorageMediaMonitor, "sharedMonitor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stopMonitor");

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:", self);

  -[STMSizer stopSizer](self->_appSizer, "stopSizer");
}

- (id)usageBundleForIdentifier:(id)a3
{
  return -[STUsageBundleRegistry usageBundleForIdentifier:](self->_usageBundles, "usageBundleForIdentifier:", a3);
}

- (void)loadApps
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __uint64_t v13;
  __uint64_t v14;
  void *v15;
  __uint64_t v16;
  __uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  __uint64_t v23;
  uint64_t v24;
  STSizeDict *categorySizes;
  __uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  NSDictionary *v72;
  uint64_t v73;
  uint64_t j;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  void *v87;
  void *v88;
  void *v89;
  NSDictionary *appsByID;
  NSDictionary *v91;
  NSDictionary *childAppsByParentID;
  NSDictionary *v93;
  void *v94;
  STStorageAppsMonitor *v95;
  NSDictionary *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  void *v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  STLog(1, CFSTR("%s"), v2, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageAppsMonitor loadApps]");
  v9 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  -[STStorageAppsMonitor prevApps](self, "prevApps");
  v10 = objc_claimAutoreleasedReturnValue();
  -[STStorageAppsMonitor usageBundles](self, "usageBundles");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = (void *)v10;
  +[STStorageDataManager updateAppsWithPrevious:usageBundles:skipAppRecordBlock:](STStorageDataManager, "updateAppsWithPrevious:usageBundles:skipAppRecordBlock:", v10, v11, &__block_literal_global_28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[STStorageAppsMonitor setPrevApps:](self, "setPrevApps:", v12);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v96 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v13 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  -[STMSizer addApps:](self->_appSizer, "addApps:", v12);
  v14 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  +[STLaunchDates sharedDates](STLaunchDates, "sharedDates");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "refreshDates");

  v16 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v95 = self;
  -[STMSizer flushCacheAsynchronously](self->_appSizer, "flushCacheAsynchronously");
  v17 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v106 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v105 + 1) + 8 * i), "refreshAppState");
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    }
    while (v20);
  }

  v23 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  +[STStorageDataManager computeCategoriesForApps:](STStorageDataManager, "computeCategoriesForApps:", v18);
  v24 = objc_claimAutoreleasedReturnValue();
  categorySizes = v95->_categorySizes;
  v95->_categorySizes = (STSizeDict *)v24;

  v26 = clock_gettime_nsec_np(_CLOCK_UPTIME_RAW);
  STLog(1, CFSTR("%0.3f secs: update apps"), v27, v28, v29, v30, v31, v32, COERCE__INT64((double)(v13 - v9) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: add entries to cache"), v33, v34, v35, v36, v37, v38, COERCE__INT64((double)(v14 - v13) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: update launch times"), v39, v40, v41, v42, v43, v44, COERCE__INT64((double)(v16 - v14) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: sync cache sizes"), v45, v46, v47, v48, v49, v50, COERCE__INT64((double)(v17 - v16) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: update app info"), v51, v52, v53, v54, v55, v56, COERCE__INT64((double)(v23 - v17) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs: compute categories"), v57, v58, v59, v60, v61, v62, COERCE__INT64((double)(v26 - v23) / 1000000000.0));
  STLog(1, CFSTR("%0.3f secs total load time"), v63, v64, v65, v66, v67, v68, COERCE__INT64((double)(v26 - v9) / 1000000000.0));
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  v69 = v18;
  v70 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (!v70)
  {
    v72 = 0;
    goto LABEL_28;
  }
  v71 = v70;
  v72 = 0;
  v73 = *(_QWORD *)v102;
  do
  {
    for (j = 0; j != v71; ++j)
    {
      if (*(_QWORD *)v102 != v73)
        objc_enumerationMutation(v69);
      v75 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
      objc_msgSend(v75, "appRecord");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "linkedParentApplication");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      if (v77)
      {
        objc_msgSend(v77, "bundleIdentifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v78, "length"))
        {
          if (!v72)
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 10);
            v72 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          }
          -[NSDictionary objectForKey:](v72, "objectForKey:", v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          if (v79)
          {
            v80 = v79;
            objc_msgSend(v79, "arrayByAddingObject:", v75);
            v81 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v110 = v75;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v110, 1);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[NSDictionary setObject:forKey:](v72, "setObject:forKey:", v81, v78);

        }
      }
      else
      {
        if (!objc_msgSend(v75, "userVisible"))
          goto LABEL_24;
        objc_msgSend(v75, "appIdentifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKey:](v96, "setObject:forKey:", v75, v78);
      }

LABEL_24:
    }
    v71 = objc_msgSend(v69, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  }
  while (v71);
LABEL_28:

  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v82 = v69;
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v98;
    do
    {
      for (k = 0; k != v84; ++k)
      {
        if (*(_QWORD *)v98 != v85)
          objc_enumerationMutation(v82);
        v87 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * k);
        objc_msgSend(v87, "bundleIdentifier");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v88, "length"))
        {
          -[NSDictionary objectForKey:](v72, "objectForKey:", v88);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setChildApps:", v89);

        }
        else
        {
          objc_msgSend(v87, "setChildApps:", 0);
        }

      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v97, v109, 16);
    }
    while (v84);
  }

  -[NSLock lock](v95->_appsLock, "lock");
  appsByID = v95->_appsByID;
  v95->_appsByID = v96;
  v91 = v96;

  childAppsByParentID = v95->_childAppsByParentID;
  v95->_childAppsByParentID = v72;
  v93 = v72;

  v95->_sortNeeded = 1;
  -[NSLock unlock](v95->_appsLock, "unlock");
  -[STStorageAppsMonitor logAppSizes](v95, "logAppSizes");
  -[STStorageAppsMonitor notifyAppsChanged](v95, "notifyAppsChanged");

}

BOOL __32__STStorageAppsMonitor_loadApps__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if (objc_msgSend(v2, "developerType") == 3
    || (objc_msgSend(v2, "isDeletable") & 1) != 0
    || (objc_msgSend(v2, "isPlaceholder") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[STAppOverrides overridesFor:](STAppOverrides, "overridesFor:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v3 = !v6 || (objc_msgSend(v6, "forceVisible") & 1) == 0;

  }
  return v3;
}

- (id)updateApps
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  STStorageAppsMonitor *v9;
  NSOperation *updateAppsOperation;
  void *v11;
  uint64_t v12;
  NSOperation *v13;
  NSOperation *v14;
  _QWORD v16[4];
  id v17;
  id location;

  STLog(1, CFSTR("%s"), v2, v3, v4, v5, v6, v7, (uint64_t)"-[STStorageAppsMonitor updateApps]");
  v9 = self;
  objc_sync_enter(v9);
  updateAppsOperation = v9->_updateAppsOperation;
  if (!updateAppsOperation || -[NSOperation isFinished](updateAppsOperation, "isFinished"))
  {
    objc_initWeak(&location, v9);
    v11 = (void *)MEMORY[0x24BDD1478];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __34__STStorageAppsMonitor_updateApps__block_invoke;
    v16[3] = &unk_24C75F5F0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v11, "blockOperationWithBlock:", v16);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v9->_updateAppsOperation;
    v9->_updateAppsOperation = (NSOperation *)v12;

    -[NSOperation addDependency:](v9->_updateAppsOperation, "addDependency:", v9->_initialLoadOperation);
    -[NSOperationQueue addOperation:](v9->_serialQueue, "addOperation:", v9->_updateAppsOperation);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  v14 = v9->_updateAppsOperation;
  objc_sync_exit(v9);

  return v14;
}

void __34__STStorageAppsMonitor_updateApps__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 32));
  v1 = (void *)MEMORY[0x212BA72F0]();
  v2 = objc_loadWeakRetained(&to);
  objc_msgSend(v2, "loadApps");

  objc_autoreleasePoolPop(v1);
  objc_destroyWeak(&to);
}

- (void)mediaSizesChanged:(id)a3
{
  id v3;

  v3 = -[STStorageAppsMonitor updateApps](self, "updateApps", a3);
}

- (void)appsStateChanged:(id)a3
{
  id v3;

  v3 = -[STStorageAppsMonitor updateApps](self, "updateApps", a3);
}

- (void)refreshApps:(id)a3
{
  id v4;

  -[STStorageAppsMonitor setPrevApps:](self, "setPrevApps:", 0);
  v4 = -[STStorageAppsMonitor updateApps](self, "updateApps");
}

- (void)applicationsDidInstall:(id)a3
{
  -[STStorageAppsMonitor refreshApps:](self, "refreshApps:", 0);
}

- (void)applicationsDidUninstall:(id)a3
{
  id v3;

  v3 = -[STStorageAppsMonitor updateApps](self, "updateApps", a3);
}

- (void)applicationStateDidChange:(id)a3
{
  id v3;

  v3 = -[STStorageAppsMonitor updateApps](self, "updateApps", a3);
}

- (void)applicationInstallsDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  STStorageAppsMonitor *v9;

  v4 = a3;
  STSharedSerialQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke;
  v7[3] = &unk_24C75F680;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_time_t v15;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "lock");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v7), "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "length"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v2, "addObject:", v9);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "unlock");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v2;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14++), "refreshAppState");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v12);
  }

  v15 = dispatch_time(0, 100000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke_2;
  block[3] = &unk_24C75F658;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_after(v15, MEMORY[0x24BDAC9B8], block);

}

uint64_t __53__STStorageAppsMonitor_applicationInstallsDidChange___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyAppsChanged");
}

- (void)notifyAppsChanged
{
  id v2;

  +[STStorageDataNotifier sharedNotifier](STStorageDataNotifier, "sharedNotifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postAppSizesChanged:", 0);

}

- (void)sizeCacheItemsUpdated:(id)a3
{
  id v3;

  v3 = -[STStorageAppsMonitor updateApps](self, "updateApps", a3);
}

- (id)filteredApps:(id)a3 sortedUsingBlock:(id)a4
{
  uint64_t (**v6)(id, _QWORD);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = (uint64_t (**)(id, _QWORD))a3;
  v7 = a4;
  -[STStorageAppsMonitor apps](self, "apps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (objc_msgSend(v9, "count"))
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if ((v6[2](v6, v15) & 1) == 0)
              objc_msgSend(v9, "removeObject:", v15);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v12);
      }

    }
    if (!v7)
    {
      v17 = STStorageAppSortByNameBlock;
      v16 = v9;
      goto LABEL_17;
    }
    if ((id)STStorageAppSortBySizeBlock != v7)
    {
      v16 = v9;
      v17 = (uint64_t)v7;
LABEL_17:
      objc_msgSend(v16, "sortUsingComparator:", v17);
    }
  }

  return v9;
}

- (id)appsSortedBySize
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  -[NSLock lock](self->_appsLock, "lock");
  -[NSDictionary allValues](self->_appsByID, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock unlock](self->_appsLock, "unlock");
  v30 = objc_msgSend(v3, "count");
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "appSizeIfComputed");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = objc_msgSend(v11, "userTotal");
          if (v13 <= 4096)
            goto LABEL_16;
          v14 = v13;
          if ((unint64_t)v13 <= 0xF423F && (objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_16;
        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "addObject:", v10);
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v18, v15);

        }
LABEL_16:

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_53);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v32 != v25)
          objc_enumerationMutation(v22);
        objc_msgSend(v4, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v27, "count") >= 2)
        {
          objc_msgSend(v27, "sortedArrayUsingComparator:", STStorageAppSortByNameBlock);
          v28 = objc_claimAutoreleasedReturnValue();

          v27 = (void *)v28;
        }
        objc_msgSend(v21, "addObjectsFromArray:", v27);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v24);
  }

  return v21;
}

uint64_t __40__STStorageAppsMonitor_appsSortedBySize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "longLongValue");
  v6 = objc_msgSend(v4, "longLongValue");

  if (v5 > v6)
    return -1;
  else
    return v6 > v5;
}

- (NSArray)apps
{
  NSArray *v3;
  NSArray *allApps;
  NSArray *v5;

  -[NSLock lock](self->_appsLock, "lock");
  if (self->_sortNeeded)
  {
    -[NSLock unlock](self->_appsLock, "unlock");
    -[STStorageAppsMonitor appsSortedBySize](self, "appsSortedBySize");
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSLock lock](self->_appsLock, "lock");
    self->_sortNeeded = 0;
    allApps = self->_allApps;
    self->_allApps = v3;

  }
  v5 = self->_allApps;
  -[NSLock unlock](self->_appsLock, "unlock");
  return v5;
}

- (NSArray)demotableApps
{
  return (NSArray *)-[STStorageAppsMonitor filteredApps:sortedUsingBlock:](self, "filteredApps:sortedUsingBlock:", &__block_literal_global_55, STStorageAppSortBySizeBlock);
}

uint64_t __37__STStorageAppsMonitor_demotableApps__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDemotable");
}

- (NSArray)demotedApps
{
  return (NSArray *)-[STStorageAppsMonitor filteredApps:sortedUsingBlock:](self, "filteredApps:sortedUsingBlock:", &__block_literal_global_56, STStorageAppSortBySizeBlock);
}

uint64_t __35__STStorageAppsMonitor_demotedApps__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDemoted");
}

- (id)appWithIdentifier:(id)a3
{
  NSLock *appsLock;
  id v5;
  void *v6;

  appsLock = self->_appsLock;
  v5 = a3;
  -[NSLock lock](appsLock, "lock");
  -[NSDictionary objectForKey:](self->_appsByID, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSLock unlock](self->_appsLock, "unlock");
  return v6;
}

- (void)setSortNeeded
{
  self->_sortNeeded = 1;
}

- (id)childAppsForApp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    -[NSLock lock](self->_appsLock, "lock");
    -[NSDictionary objectForKey:](self->_childAppsByParentID, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSLock unlock](self->_appsLock, "unlock");
  }
  else
  {
    v5 = 0;
  }
  if (v5)
    v6 = v5;
  else
    v6 = (void *)MEMORY[0x24BDBD1A8];
  v7 = v6;

  return v7;
}

- (void)addNumber:(int64_t)a3 toDict:(id)a4 forKey:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;

  if (a3)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = a5;
    v9 = a4;
    objc_msgSend(v7, "numberWithLongLong:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v8);

  }
}

- (void)addDeviceInfoToDict:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)MGGetStringAnswer();
  objc_msgSend(v8, "setObject:forKey:", v4, CFSTR("device-type"));
  v5 = (void *)MGGetStringAnswer();
  objc_msgSend(v8, "setObject:forKey:", v5, CFSTR("os-version"));
  +[STStorageDiskMonitor sharedMonitor](STStorageDiskMonitor, "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storageSpace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v6, "deviceSize"), v8, CFSTR("device-size"));
  -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v7, "usedBytes"), v8, CFSTR("device-used"));
  -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v7, "purgeableBytes"), v8, CFSTR("device-purgeable"));
  if (objc_msgSend(v7, "isLowSpace"))
  {
    objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("is-low-space"));
    if (objc_msgSend(v7, "isVeryLowSpace"))
      objc_msgSend(v8, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("is-very-low-space"));
  }

}

- (void)addTimestampToDict:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDD15D0];
  v4 = a3;
  v7 = objc_alloc_init(v3);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("date"));

}

- (id)storageInfoDict
{
  uint64_t v3;
  void *v4;
  unsigned int i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 8);
  v3 = objc_claimAutoreleasedReturnValue();
  -[STStorageAppsMonitor addTimestampToDict:](self, "addTimestampToDict:", v3);
  v21 = (void *)v3;
  -[STStorageAppsMonitor addDeviceInfoToDict:](self, "addDeviceInfoToDict:", v3);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSizeDict dictionary](self->_categorySizes, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 9; ++i)
  {
    STKeyForCategory(i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isZero") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, CFSTR("id"));
      STNameForCategoryKey(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("name"));

      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v8, "userTotal"), v11, CFSTR("total"));
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v8, "fixed"), v11, CFSTR("fixed"));
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v8, "dynamic"), v11, CFSTR("dynamic"));
      -[STStorageAppsMonitor addNumber:toDict:forKey:](self, "addNumber:toDict:forKey:", objc_msgSend(v8, "purgeable"), v11, CFSTR("purgeable"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("sizes"));
      objc_msgSend(v22, "addObject:", v9);

    }
  }
  -[STStorageAppsMonitor apps](self, "apps");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * j), "infoDict");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("categories"));
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, CFSTR("apps"));

  return v21;
}

- (id)appSizesDict
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[STStorageAppsMonitor apps](self, "apps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v9, "appSize", (_QWORD)v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "userTotal");

        if (v11)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v12, v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)categorySizesDict
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStorageAppsMonitor addTimestampToDict:](self, "addTimestampToDict:", v3);
  -[STStorageAppsMonitor addDeviceInfoToDict:](self, "addDeviceInfoToDict:", v3);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSizeDict dictionary](self->_categorySizes, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != 9; ++i)
  {
    STKeyForCategory(i);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && (objc_msgSend(v8, "isZero") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", objc_msgSend(v9, "userTotal"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, v7);

    }
  }
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("categories"));

  return v3;
}

- (void)sync
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[NSOperation waitUntilFinished](self->_initialLoadOperation, "waitUntilFinished");
  +[STFileProviderMonitor sharedMonitor](STFileProviderMonitor, "sharedMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sync");

  +[STUpdateMonitor sharedMonitor](STUpdateMonitor, "sharedMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sync");

  +[STStorageDiskMonitor sharedMonitor](STStorageDiskMonitor, "sharedMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sync");

  +[STStorageMediaMonitor sharedMonitor](STStorageMediaMonitor, "sharedMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sync");

  v7 = (void *)MEMORY[0x212BA72F0]();
  -[STMSizer startSizer](self->_appSizer, "startSizer");
  -[STStorageAppsMonitor updateApps](self, "updateApps");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "waitUntilFinished");
  -[STMSizer stopSizer](self->_appSizer, "stopSizer");
  -[STMSizeCache writeCacheToPref](self->_appSizer, "writeCacheToPref");

  objc_autoreleasePoolPop(v7);
}

- (void)_logAppSizes:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  -[NSDictionary allValues](self->_appsByID, "allValues", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSizeDict dictionary](self->_categorySizes, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(17, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __37__STStorageAppsMonitor__logAppSizes___block_invoke;
  v9[3] = &unk_24C75F680;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, v9);

}

void __37__STStorageAppsMonitor__logAppSizes___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  unsigned int i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  void *v166;
  id obj;
  uint64_t v168;
  void *v169;
  uint64_t v170;
  void *v171;
  uint64_t v172;
  void *v173;
  uint64_t v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  _BYTE v179[128];
  uint64_t v180;

  v180 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sortedArrayUsingComparator:", &__block_literal_global_64);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("Categories"), v2, v3, v4, v5, v6, v7, v161);
  v8 = 0;
  for (i = 0; i != 9; ++i)
  {
    STKeyForCategory(i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)MEMORY[0x24BDD16A8];
      STNameForCategoryKey(v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      STFormattedSize(objc_msgSend(v11, "userTotal"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@: %@"), v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "purgeable"))
      {
        STFormattedSize(objc_msgSend(v11, "purgeable"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appendFormat:", CFSTR(" (+ %@ purgeable)"), v22);

      }
      STLog(1, CFSTR("%@"), v16, v17, v18, v19, v20, v21, (uint64_t)v15);
      v8 = v15;
    }

  }
  STLog(1, CFSTR("Application Sizes"), v23, v24, v25, v26, v27, v28, v162);
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  obj = v173;
  v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v179, 16);
  if (v170)
  {
    v172 = 0;
    v174 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v168 = *(_QWORD *)v176;
    do
    {
      v32 = 0;
      v33 = v8;
      do
      {
        if (*(_QWORD *)v176 != v168)
          objc_enumerationMutation(obj);
        v34 = *(void **)(*((_QWORD *)&v175 + 1) + 8 * v32);
        objc_msgSend(v34, "appSize");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "userTotal");

        v37 = (void *)MEMORY[0x24BDD16A8];
        STFormattedSize(v36);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "bundleIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "appIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "stringWithFormat:", CFSTR("%@: %@ (%@)"), v38, v39, v40);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "appSize");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "fixed");

        v31 += v42;
        AppendSizeInfo(v8, CFSTR("APP"), v42);
        v43 = objc_msgSend(v34, "dataContainerSize");
        v44 = v43 + v172;
        AppendSizeInfo(v8, CFSTR("DAT"), v43);
        v45 = objc_msgSend(v34, "coreMLDataSize");
        v172 = v44 + v45;
        AppendSizeInfo(v8, CFSTR("CML"), v45);
        v46 = objc_msgSend(v34, "sharedContainerSize");
        v30 += v46;
        AppendSizeInfo(v8, CFSTR("SHR"), v46);
        v47 = objc_msgSend(v34, "externalSize");
        v29 += v47;
        AppendSizeInfo(v8, CFSTR("EXT"), v47);
        v48 = objc_msgSend(v34, "dataPurgeableSize");
        v49 = objc_msgSend(v34, "sharedPurgeableSize") + v48;
        v50 = v49 + objc_msgSend(v34, "assetPurgeableSize");
        AppendSizeInfo(v8, CFSTR("PRG"), v50);
        v51 = objc_msgSend(v34, "externalPurgeableSize");
        v174 += v50 + v51;
        AppendSizeInfo(v8, CFSTR("EPRG"), v51);
        STLog(4, CFSTR("%@"), v52, v53, v54, v55, v56, v57, (uint64_t)v8);
        ++v32;
        v33 = v8;
      }
      while (v170 != v32);
      v170 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v175, v179, 16);
    }
    while (v170);
  }
  else
  {
    v172 = 0;
    v174 = 0;
    v29 = 0;
    v30 = 0;
    v31 = 0;
  }

  +[STStorageApp sizeOfPluginKitContainers](STStorageApp, "sizeOfPluginKitContainers");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "dynamic");
  v60 = objc_msgSend(v58, "purgeable");
  v61 = (void *)MEMORY[0x24BDD16A8];
  v171 = v58;
  STFormattedSize(objc_msgSend(v58, "userTotal"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "stringWithFormat:", CFSTR("%@: PluginKit"), v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  AppendSizeInfo(v63, CFSTR("DAT"), v59);
  AppendSizeInfo(v63, CFSTR("PRG"), v60);
  v169 = v63;
  STLog(4, CFSTR("%@"), v64, v65, v66, v67, v68, v69, (uint64_t)v63);
  STSizeOfPath(CFSTR("/var/mobile/Library/Logs"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = objc_msgSend(v70, "longLongValue");
  STSizeOfPath(CFSTR("/Library/Logs"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v73 = objc_msgSend(v72, "longLongValue") + v71;
  STSizeOfPath(CFSTR("/var/log"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = objc_msgSend(v74, "longLongValue");
  STSizeOfPath(CFSTR("/var/logs"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = v73 + v75 + objc_msgSend(v76, "longLongValue");
  STSizeOfPath(CFSTR("/var/tmp/powerlog"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  v79 = objc_msgSend(v78, "longLongValue");
  STSizeOfPath(CFSTR("/var/wireless/Library/Logs"));
  v80 = (void *)objc_claimAutoreleasedReturnValue();

  v166 = v80;
  v81 = v77 + v79 + objc_msgSend(v80, "longLongValue");
  +[STStorageCacheDelete sharedMonitor](STStorageCacheDelete, "sharedMonitor");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "cacheDeleteDict");
  v83 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = v83;
  objc_msgSend(v83, "objectForKey:", CFSTR("CACHE_DELETE_ITEMIZED_NONPURGEABLE"));
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "objectForKey:", CFSTR("com.apple.logd.cachedelete"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = v81 + objc_msgSend(v85, "longLongValue");

  if (v86 >= 10000001)
  {
    STFormattedSize(v86);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    STLog(1, CFSTR("Logs: %@"), v94, v95, v96, v97, v98, v99, (uint64_t)v93);

  }
  v100 = v59 + v172;
  STLog(1, &stru_24C7607E8, v87, v88, v89, v90, v91, v92, v163);
  STFormattedSize(v31);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("Total static: %@"), v102, v103, v104, v105, v106, v107, (uint64_t)v101);

  STFormattedSize(v100);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("Total dynamic: %@"), v109, v110, v111, v112, v113, v114, (uint64_t)v108);

  STFormattedSize(v30);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("Total shared: %@"), v116, v117, v118, v119, v120, v121, (uint64_t)v115);

  STFormattedSize(v29);
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("Total external: %@"), v123, v124, v125, v126, v127, v128, (uint64_t)v122);

  STFormattedSize(v60 + v174);
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("Total purgeable: %@"), v130, v131, v132, v133, v134, v135, (uint64_t)v129);

  STFormattedSize(v30 + v29 + v31 + v100 - (v60 + v174));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("User footprint: %@"), v137, v138, v139, v140, v141, v142, (uint64_t)v136);

  v143 = STSizeOfSystemVolume();
  STFormattedSize(v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("System disk size: %@"), v145, v146, v147, v148, v149, v150, (uint64_t)v144);

  +[STStorageDiskMonitor sharedMonitor](STStorageDiskMonitor, "sharedMonitor");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v151, "storageSpace");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  STFormattedSize(objc_msgSend(v152, "usedBytes"));
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  STFormattedSize(objc_msgSend(v151, "deviceSize"));
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  STFormattedSize(objc_msgSend(v152, "purgeableBytes"));
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  STLog(1, CFSTR("%@ of %@ used on device (%@ total purgeable)"), v155, v156, v157, v158, v159, v160, (uint64_t)v153);

}

uint64_t __37__STStorageAppsMonitor__logAppSizes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "appSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userTotal");
  objc_msgSend(v5, "appSize");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userTotal");

  if (v7 <= v9)
  {
    objc_msgSend(v5, "appSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "userTotal");
    objc_msgSend(v4, "appSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userTotal");

    if (v12 <= v14)
    {
      objc_msgSend(v4, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "name");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v15, "localizedCaseInsensitiveCompare:", v16);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (void)logAppSizes
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__STStorageAppsMonitor_logAppSizes__block_invoke;
  block[3] = &unk_24C75F658;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __35__STStorageAppsMonitor_logAppSizes__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", *(_QWORD *)(a1 + 32), sel__logAppSizes_, 0);
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", sel__logAppSizes_, 0, 3.0);
}

- (NSArray)allApps
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)appsLoaded
{
  return self->_appsLoaded;
}

- (BOOL)containersSized
{
  return self->_containersSized;
}

- (int64_t)pluginkitDataSize
{
  return self->_pluginkitDataSize;
}

- (int64_t)localStorageContainerSize
{
  return self->_localStorageContainerSize;
}

- (SUDownload)currentSoftwareUpdate
{
  return (SUDownload *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCurrentSoftwareUpdate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (int64_t)currentSoftwareUpdateSize
{
  return self->_currentSoftwareUpdateSize;
}

- (STSizeDict)categorySizes
{
  return (STSizeDict *)objc_getProperty(self, a2, 128, 1);
}

- (void)setCategorySizes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (STUsageBundleRegistry)usageBundles
{
  return (STUsageBundleRegistry *)objc_getProperty(self, a2, 136, 1);
}

- (void)setUsageBundles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (STMSizer)appSizer
{
  return (STMSizer *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAppSizer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSArray)prevApps
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setPrevApps:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevApps, 0);
  objc_storeStrong((id *)&self->_appSizer, 0);
  objc_storeStrong((id *)&self->_usageBundles, 0);
  objc_storeStrong((id *)&self->_categorySizes, 0);
  objc_storeStrong((id *)&self->_currentSoftwareUpdate, 0);
  objc_storeStrong((id *)&self->_sharedContainers, 0);
  objc_storeStrong((id *)&self->_pkContainers, 0);
  objc_storeStrong((id *)&self->_initialLoadOperation, 0);
  objc_storeStrong((id *)&self->_updateAppsOperation, 0);
  objc_storeStrong((id *)&self->_childAppsByParentID, 0);
  objc_storeStrong((id *)&self->_appsByID, 0);
  objc_storeStrong((id *)&self->_allApps, 0);
  objc_storeStrong((id *)&self->_appsLock, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end
