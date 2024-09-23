@implementation SDAppUninstallMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  return (id)sSDAppUninstallMonitor;
}

void __39__SDAppUninstallMonitor_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sSDAppUninstallMonitor;
  sSDAppUninstallMonitor = v0;

}

+ (id)applicationsExcludedFromUninstall
{
  if (applicationsExcludedFromUninstall_onceToken != -1)
    dispatch_once(&applicationsExcludedFromUninstall_onceToken, &__block_literal_global_58);
  return (id)applicationsExcludedFromUninstall_sSet;
}

void __58__SDAppUninstallMonitor_applicationsExcludedFromUninstall__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24CF6FDB8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)applicationsExcludedFromUninstall_sSet;
  applicationsExcludedFromUninstall_sSet = v0;

}

- (SDAppUninstallMonitor)init
{
  SDAppUninstallMonitor *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *startupSemaphore;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  uint64_t v9;
  NSMutableSet *pcsForPendingPurges;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SDAppUninstallMonitor;
  v2 = -[SDAppUninstallMonitor init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    startupSemaphore = v2->_startupSemaphore;
    v2->_startupSemaphore = (OS_dispatch_semaphore *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();

    v7 = dispatch_queue_create("com.apple.searchd.appUninstallMonitor", v6);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    v9 = objc_opt_new();
    pcsForPendingPurges = v2->_pcsForPendingPurges;
    v2->_pcsForPendingPurges = (NSMutableSet *)v9;

  }
  return v2;
}

- (void)ready
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_startupSemaphore);
}

- (void)unlock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__SDAppUninstallMonitor_unlock__block_invoke;
  block[3] = &unk_24CF63D90;
  block[4] = self;
  dispatch_async(queue, block);
}

void __31__SDAppUninstallMonitor_unlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  dispatch_time_t v3;
  uint64_t v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v2, v3);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 16))
  {
    if (*(_BYTE *)(v4 + 17))
    {
      *(_BYTE *)(v4 + 17) = 0;
LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "_deleteItemsForUninstalledAppsFromIndex");
      return;
    }
    if (!*(_QWORD *)(v4 + 32) && objc_msgSend(*(id *)(v4 + 40), "count"))
      goto LABEL_12;
  }
  else
  {
    *(_BYTE *)(v4 + 16) = 1;
    objc_msgSend(MEMORY[0x24BEB0098], "sharedLockHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "migrationComplete");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16) = 1;
    SPLogForSPLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = "";
      if (v6)
        v8 = " (purge)";
      v9 = 136315138;
      v10 = v8;
      _os_log_impl(&dword_213202000, v7, OS_LOG_TYPE_DEFAULT, "### Uninstall monitor unlock%s", (uint8_t *)&v9, 0xCu);
    }

    if ((v6 & 1) != 0)
      goto LABEL_12;
  }
}

- (void)registerHandlerWithEventMonitor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v4 = a3;
  if (!v4)
    -[SDAppUninstallMonitor registerHandlerWithEventMonitor:].cold.1();
  v5 = v4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke;
  v7[3] = &unk_24CF63FA8;
  v7[4] = self;
  v6 = (void *)MEMORY[0x2199AE320](v7);
  objc_msgSend(v5, "registerHandler:forEventName:", v6, CFSTR("com.apple.LaunchServices.applicationUnregistered"));

}

void __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    SPLogForSPLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v10;
      _os_log_error_impl(&dword_213202000, v11, OS_LOG_TYPE_ERROR, "Error in event monitor for name:\"%@\", userInfo:%@, error:%@", buf, 0x20u);
    }
  }
  else
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("isPlaceholder"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "BOOLValue");

    SPLogForSPLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v23 = v8;
      v24 = 2112;
      v25 = v9;
      v26 = 2112;
      v27 = v12;
      _os_log_impl(&dword_213202000, v14, OS_LOG_TYPE_DEFAULT, "Received a notification for name:\"%@\", userInfo:%@, bundleIDs:%@", buf, 0x20u);
    }

    SPBuildApplications(0);
    SPTransactionCreate(&unk_24CF6FDD0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(NSObject **)(v16 + 24);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_85;
    block[3] = &unk_24CF63F80;
    block[4] = v16;
    v20 = v12;
    v21 = v15;
    v18 = v15;
    v11 = v12;
    dispatch_async(v17, block);

  }
}

void __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_85(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_2;
  v6[3] = &unk_24CF63F58;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_deleteAllItemsForBundleIDs:completionBlock:", v4, v6);

}

void __57__SDAppUninstallMonitor_registerHandlerWithEventMonitor___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_213202000, v4, OS_LOG_TYPE_DEFAULT, "_deleteAllItemsForBundleIDs:%@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "_allInstalledApplicationsIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v7, "addObjectsFromArray:", v3);

    v6 = v7;
  }
  objc_msgSend((id)objc_opt_class(), "_writeAppsListToDisk:", v6);
  SPTransactionDone(*(void **)(a1 + 48));

}

- (void)_deleteItemsForUninstalledAppsFromIndex
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_log_type_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  os_log_type_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  os_log_type_t v21;
  _QWORD v22[4];
  id v23;
  SDAppUninstallMonitor *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_213202000, v3, OS_LOG_TYPE_DEFAULT, "_deleteItemsForUninstalledAppsFromIndex", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SDAppUninstallMonitor _allInstalledApplicationsIdentifiers](self, "_allInstalledApplicationsIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v7, v8))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl(&dword_213202000, v7, v8, "installedApps: %@", buf, 0xCu);
  }

  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend((id)objc_opt_class(), "_installedAppsBundleIDsListFilePath");
    v9 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "fileExistsAtPath:", v9) & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "_installedAppsListFromDisk");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      SPLogForSPLogCategoryDefault();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v11, v12))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v10;
        _os_log_impl(&dword_213202000, v11, v12, "previouslyInstalledApps: %@", buf, 0xCu);
      }

      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "minusSet:", v14);

        SPLogForSPLogCategoryDefault();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v15, v16))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v13;
          _os_log_impl(&dword_213202000, v15, v16, "uninstalledApps: %@", buf, 0xCu);
        }

        if (objc_msgSend(v13, "count"))
        {
          SPLogForSPLogCategoryDefault();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v13, "allObjects");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v26 = v18;
            _os_log_impl(&dword_213202000, v17, OS_LOG_TYPE_DEFAULT, "_deleteItemsForUninstalledAppsFromIndex: %@", buf, 0xCu);

          }
          objc_msgSend(v13, "allObjects");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __64__SDAppUninstallMonitor__deleteItemsForUninstalledAppsFromIndex__block_invoke;
          v22[3] = &unk_24CF63A28;
          v23 = v6;
          v24 = self;
          -[SDAppUninstallMonitor _deleteAllItemsForBundleIDs:completionBlock:](self, "_deleteAllItemsForBundleIDs:completionBlock:", v19, v22);

        }
      }

    }
    else
    {
      SPLogForSPLogCategoryDefault();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = 2 * (gSPLogDebugAsDefault == 0);
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v6;
        _os_log_impl(&dword_213202000, v20, v21, "Writing %@ to disk for the first time", buf, 0xCu);
      }

      objc_msgSend((id)objc_opt_class(), "_writeAppsListToDisk:", v6);
    }
  }
  else
  {
    SPLogForSPLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_213202000, v9, OS_LOG_TYPE_DEFAULT, "Skipping _deleteItemsForUninstalledAppsFromIndex; no installed apps",
        buf,
        2u);
    }
  }

}

void __64__SDAppUninstallMonitor__deleteItemsForUninstalledAppsFromIndex__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v3);
  objc_msgSend((id)objc_opt_class(), "_writeAppsListToDisk:", *(_QWORD *)(a1 + 32));

}

- (id)_deleteAllItemsForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  id obj;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = v4;
    _os_log_impl(&dword_213202000, v5, OS_LOG_TYPE_DEFAULT, "Deleting all items for bundleID:%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEB00A8], "allProtectionClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = objc_alloc_init(MEMORY[0x24BEB0090]);
  objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIndexer:", v9);

  objc_msgSend(v8, "setClientBundleID:", v4);
  objc_msgSend(v8, "setIsInternal:", 1);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v30;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v30 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v13);
        v15 = dispatch_group_create();
        dispatch_group_enter(v15);
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke;
        v23[3] = &unk_24CF63FF8;
        v16 = v4;
        v17 = v4;
        v24 = v17;
        v25 = v14;
        v26 = v7;
        v18 = v8;
        v27 = v18;
        v28 = v15;
        v19 = v15;
        v20 = v17;
        v4 = v16;
        objc_msgSend(v18, "deleteAllSearchableItemsWithBundleID:protectionClass:shouldGC:completionHandler:", v20, v14, 0, v23);
        dispatch_group_wait(v19, 0xFFFFFFFFFFFFFFFFLL);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v11);
  }

  return v7;
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  SPLogForSPLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_213202000, v5, OS_LOG_TYPE_DEFAULT, "Deleted all items for bundleID:%@, protectionClass:%@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3 == 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

  v9 = *(void **)(a1 + 56);
  v10 = *(void **)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_93;
  v14[3] = &unk_24CF63FD0;
  v12 = v10;
  v13 = *(_QWORD *)(a1 + 40);
  v15 = v12;
  v16 = v13;
  v17 = *(id *)(a1 + 64);
  objc_msgSend(v9, "deleteAllInteractionsWithBundleID:protectionClass:options:completionHandler:", v12, v11, 0, v14);

}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_93(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SPLogForSPLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_93_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)_deleteAllInteractionsForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id obj;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_213202000, v5, OS_LOG_TYPE_DEFAULT, "Deleting all interactions for bundleID:%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BEB00A8], "allProtectionClasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x24BEB0090]);
  objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIndexer:", v8);

  objc_msgSend(v7, "setClientBundleID:", v4);
  objc_msgSend(v7, "setIsInternal:", 1);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12);
        v14 = dispatch_group_create();
        dispatch_group_enter(v14);
        v18[0] = MEMORY[0x24BDAC760];
        v18[1] = 3221225472;
        v18[2] = __59__SDAppUninstallMonitor__deleteAllInteractionsForBundleID___block_invoke;
        v18[3] = &unk_24CF63FD0;
        v15 = v4;
        v19 = v15;
        v20 = v13;
        v21 = v14;
        v16 = v14;
        objc_msgSend(v7, "deleteAllInteractionsWithBundleID:protectionClass:options:completionHandler:", v15, v13, 0, v18);
        dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

}

void __59__SDAppUninstallMonitor__deleteAllInteractionsForBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    SPLogForSPLogCategoryDefault();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_93_cold_1();

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

- (void)_purgeWithProtectionClasses:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  SDAppUninstallMonitor *v20;
  id v21;
  id obj;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint8_t buf[4];
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v20 = self;
  v21 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = dispatch_group_create();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v8);
        SPLogForSPLogCategoryIndex();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v13;
          _os_log_impl(&dword_213202000, v14, OS_LOG_TYPE_DEFAULT, "Merging the index for dataclass:%@", buf, 0xCu);
        }

        objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v33, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke;
        v26[3] = &unk_24CF64020;
        v26[4] = v13;
        v27 = v7;
        v28 = v8;
        objc_msgSend(v15, "mergeWithProtectionClasses:completionHandler:", v16, v26);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
    }
    while (v10);
  }

  queue = v20->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_100;
  block[3] = &unk_24CF63DD8;
  v24 = v7;
  v25 = v21;
  v18 = v7;
  v19 = v21;
  dispatch_group_notify(v8, queue, block);

}

void __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  SPLogForSPLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v7 = *(_QWORD *)(a1 + 32);
    if (v4)
      v6 = "YES";
    *(_DWORD *)buf = 138412546;
    v18 = v7;
    v19 = 2080;
    v20 = v6;
    _os_log_impl(&dword_213202000, v5, OS_LOG_TYPE_DEFAULT, "Finished merging the index for dataclass:%@, merged:%s", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *(_QWORD *)(a1 + 32));
  if ((v4 & 1) != 0)
  {
    SPLogForSPLogCategoryIndex();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v18 = v9;
      _os_log_impl(&dword_213202000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up the index for dataclass:%@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEB00A8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_98;
    v13[3] = &unk_24CF64020;
    v12 = *(void **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v14 = v12;
    v15 = *(id *)(a1 + 48);
    objc_msgSend(v10, "cleanupStringsWithProtectionClasses:completionHandler:", v11, v13);

  }
  else
  {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
}

void __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_98(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  SPLogForSPLogCategoryIndex();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "NO";
    v7 = *(_QWORD *)(a1 + 32);
    if ((_DWORD)v4)
      v6 = "YES";
    v9 = 138412546;
    v10 = v7;
    v11 = 2080;
    v12 = v6;
    _os_log_impl(&dword_213202000, v5, OS_LOG_TYPE_DEFAULT, "Finished cleaning up strings for dataclass:%@, done:%s", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __64__SDAppUninstallMonitor__purgeWithProtectionClasses_completion___block_invoke_100(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

+ (id)_pendingPurgesFilePath
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(CFSTR("PendingPurges"), "stringByAppendingString:", CFSTR(".plist"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_trackingInfoDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_pendingPurgesFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "_pendingPurgesFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "fileExistsAtPath:", v4) & 1) == 0)
    {

      goto LABEL_24;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v4);

    if (v6)
    {
      v22 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, 0, 0, &v22);
      v7 = objc_claimAutoreleasedReturnValue();
      v17 = v22;
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_13:
          objc_msgSend(MEMORY[0x24BEB00A8], "allProtectionClasses");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v10 = v7;
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v19;
            do
            {
              v14 = 0;
              do
              {
                if (*(_QWORD *)v19 != v13)
                  objc_enumerationMutation(v10);
                v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "containsObject:", v15))
                  objc_msgSend(v3, "addObject:", v15);
                ++v14;
              }
              while (v12 != v14);
              v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
            }
            while (v12);
          }

          goto LABEL_24;
        }
        SPLogForSPLogCategoryDefault();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          +[SDAppUninstallMonitor _pendingPurgesFromDisk].cold.2((uint64_t)v7, v8);

      }
      else
      {
        SPLogForSPLogCategoryDefault();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          +[SDAppUninstallMonitor _pendingPurgesFromDisk].cold.1();
      }

      v7 = 0;
      goto LABEL_13;
    }
  }
LABEL_24:

  return v3;
}

+ (BOOL)_writePendingPurgesToDisk:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  char v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  char v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  NSObject *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_trackingInfoDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_pendingPurgesFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    if ((objc_msgSend(v5, "fileExistsAtPath:", v6) & 1) != 0)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v23 = 0;
    v10 = objc_msgSend(v5, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v23);
    v11 = v23;
    v8 = v11;
    if ((v10 & 1) != 0)
    {
LABEL_6:
      v12 = (void *)MEMORY[0x24BDD1770];
      objc_msgSend(v4, "allObjects");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      objc_msgSend(v12, "dataWithPropertyList:format:options:error:", v13, 200, 0, &v22);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v22;

      if (v14)
      {
        v21 = v15;
        v16 = -[NSObject writeToFile:options:error:](v14, "writeToFile:options:error:", v7, 1073741825, &v21);
        v8 = v21;

        if ((v16 & 1) != 0)
        {
          v9 = 1;
LABEL_22:

          goto LABEL_23;
        }
        SPLogForSPLogCategoryDefault();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v25 = v14;
          v26 = 2112;
          v27 = v7;
          v28 = 2112;
          v29 = v8;
          _os_log_error_impl(&dword_213202000, v17, OS_LOG_TYPE_ERROR, "Failed writing data %@ to path %@: %@", buf, 0x20u);
        }
        v15 = v8;
      }
      else
      {
        SPLogForSPLogCategoryDefault();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[SDAppUninstallMonitor _writePendingPurgesToDisk:].cold.1((uint64_t)v15, v17);
      }

      v9 = 0;
      v8 = v15;
      goto LABEL_22;
    }
    objc_msgSend(v11, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v19 = objc_msgSend(v8, "code");

      if (v19 == 516)
        goto LABEL_6;
    }
    else
    {

    }
    SPLogForSPLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[SDAppUninstallMonitor _writePendingPurgesToDisk:].cold.2();
    v9 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v5, "removeItemAtPath:error:", v7, 0);
  v9 = 1;
LABEL_23:

  return v9;
}

- (void)_deleteAllItemsForBundleIDs:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSMutableSet *pcsForPendingPurges;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  BOOL v17;
  NSMutableSet *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  const char *v22;
  NSMutableSet *v23;
  const char *v24;
  dispatch_time_t v25;
  NSObject *timer;
  OS_dispatch_source *v27;
  OS_dispatch_source *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD);
  id v34;
  id v35;
  id obj;
  _QWORD handler[5];
  _QWORD v38[4];
  id v39;
  _BYTE *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE buf[24];
  const char *v46;
  __int16 v47;
  NSMutableSet *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v33 = (void (**)(_QWORD, _QWORD))v7;
  if (!v7)
    -[SDAppUninstallMonitor _deleteAllItemsForBundleIDs:completionBlock:].cold.1();
  SPLogForSPLogCategoryDefault();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    pcsForPendingPurges = self->_pcsForPendingPurges;
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = pcsForPendingPurges;
    _os_log_impl(&dword_213202000, v8, OS_LOG_TYPE_DEFAULT, "Deleting all the items for bundleIDs:%@, pcs:%@", buf, 0x16u);
  }

  SPTransactionCreate(&unk_24CF6FDE8);
  v31 = objc_claimAutoreleasedReturnValue();
  v34 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend((id)objc_opt_class(), "applicationsExcludedFromUninstall");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (id)objc_opt_new();
  v44 = 0u;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  obj = v6;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        if (objc_msgSend(v10, "containsObject:", v14, v31))
        {
          SPLogForSPLogCategoryDefault();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v14;
            _os_log_impl(&dword_213202000, v15, OS_LOG_TYPE_DEFAULT, "Special case bundleID:%@ since it's excluded from uninstall", buf, 0xCu);
          }

          -[SDAppUninstallMonitor _deleteAllInteractionsForBundleID:](self, "_deleteAllInteractionsForBundleID:", v14);
        }
        else
        {
          -[SDAppUninstallMonitor _deleteAllItemsForBundleID:](self, "_deleteAllItemsForBundleID:", v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v46) = 0;
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke;
          v38[3] = &unk_24CF64048;
          v39 = v35;
          v40 = buf;
          objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v38);
          if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
            objc_msgSend(v34, "addObject:", v14);

          _Block_object_dispose(buf, 8);
        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v11);
  }

  v17 = objc_msgSend(v34, "count") != 0;
  v18 = self->_pcsForPendingPurges;
  self->_hasFailedDeletes = v17;
  objc_msgSend(v35, "unionSet:", v18);
  objc_msgSend((id)objc_opt_class(), "_pendingPurgesFromDisk");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "unionSet:", v19);
  objc_storeStrong((id *)&self->_pcsForPendingPurges, v35);
  v20 = ((objc_msgSend(v35, "isEqualToSet:", v19) & 1) != 0
      || objc_msgSend((id)objc_opt_class(), "_writePendingPurgesToDisk:", v35))
     && objc_msgSend(v35, "count", v31) != 0;
  SPLogForSPLogCategoryDefault();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = "YES";
    v23 = self->_pcsForPendingPurges;
    if (self->_hasFailedDeletes)
      v24 = "YES";
    else
      v24 = "NO";
    *(_DWORD *)buf = 138413058;
    if (!v20)
      v22 = "NO";
    *(_QWORD *)&buf[4] = obj;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v24;
    *(_WORD *)&buf[22] = 2080;
    v46 = v22;
    v47 = 2112;
    v48 = v23;
    _os_log_impl(&dword_213202000, v21, OS_LOG_TYPE_DEFAULT, "Finished deleting all items for bundleIDs:%@, hasFailedDeletes:%s, purge:%s, pcs:%@", buf, 0x2Au);
  }

  if (v20)
  {
    v25 = dispatch_time(0, 10000000000);
    timer = self->_timer;
    if (timer)
    {
      dispatch_source_set_timer(timer, v25, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      v27 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_queue);
      v28 = self->_timer;
      self->_timer = v27;

      v29 = self->_timer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_112;
      handler[3] = &unk_24CF63D90;
      handler[4] = self;
      dispatch_source_set_event_handler(v29, handler);
      dispatch_source_set_timer((dispatch_source_t)self->_timer, v25, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume((dispatch_object_t)self->_timer);
    }
  }
  objc_msgSend(v34, "allObjects", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v33)[2](v33, v30);

  SPTransactionDone(v32);
}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  else
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_112(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v2;
    _os_log_impl(&dword_213202000, v3, OS_LOG_TYPE_DEFAULT, "Purging, pcs:%@", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v2, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_113;
  v8[3] = &unk_24CF64098;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v2;
  v10 = v6;
  v7 = v2;
  objc_msgSend(v4, "_purgeWithProtectionClasses:completion:", v5, v8);

}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_113(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_2;
  v9[3] = &unk_24CF64070;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend((id)objc_opt_class(), "_writePendingPurgesToDisk:", *(_QWORD *)(a1 + 32));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 40), *(id *)(a1 + 32));
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 32);
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(void **)(v5 + 32);
    *(_QWORD *)(v5 + 32) = 0;

  }
  SPLogForSPLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v12 = v8;
    _os_log_impl(&dword_213202000, v7, OS_LOG_TYPE_DEFAULT, "Finished purging, pcs:%@", buf, 0xCu);
  }

}

void __69__SDAppUninstallMonitor__deleteAllItemsForBundleIDs_completionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "BOOLValue"))
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v5);

}

+ (id)_filename
{
  return (id)objc_msgSend(CFSTR("InstalledApps"), "stringByAppendingString:", CFSTR(".plist"));
}

+ (id)_trackingInfoDir
{
  if (_trackingInfoDir_onceToken != -1)
    dispatch_once(&_trackingInfoDir_onceToken, &__block_literal_global_114);
  return (id)_trackingInfoDir_bundleInfoPath;
}

void __41__SDAppUninstallMonitor__trackingInfoDir__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  SPSpotlightSupportDirectoryPath();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("BundleInfo"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_trackingInfoDir_bundleInfoPath;
  _trackingInfoDir_bundleInfoPath = v0;

}

+ (id)_installedAppsBundleIDsListFilePath
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "_trackingInfoDir");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_filename");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_installedAppsListFromDisk
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v10;
  id v11;

  objc_msgSend(a1, "_installedAppsBundleIDsListFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "fileExistsAtPath:", v2) & 1) != 0)
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithContentsOfFile:", v2);

      if (v4)
      {
        v11 = 0;
        objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v4, 0, 0, &v11);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = v11;
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
LABEL_15:
            v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
            _sanitizePlistData(v5, v10);
            objc_msgSend(v10, "allObjects");
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_11;
          }
          SPLogForSPLogCategoryDefault();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
            +[SDAppUninstallMonitor _installedAppsListFromDisk].cold.2((uint64_t)v5, v7);

        }
        else
        {
          SPLogForSPLogCategoryDefault();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
            +[SDAppUninstallMonitor _installedAppsListFromDisk].cold.1();
        }

        v5 = 0;
        goto LABEL_15;
      }
    }
    else
    {

    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

+ (void)_writeAppsListToDisk:(id)a3
{
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  SPLogForSPLogCategoryDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = 2 * (gSPLogDebugAsDefault == 0);
  if (os_log_type_enabled(v5, v6))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v4;
    _os_log_impl(&dword_213202000, v5, v6, "Will write %@ to disk", buf, 0xCu);
  }

  objc_msgSend(a1, "_trackingInfoDir");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_installedAppsBundleIDsListFilePath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v26);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v26;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "fileExistsAtPath:", v7);

    if ((v12 & 1) != 0)
      goto LABEL_7;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v10;
    v14 = objc_msgSend(v13, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, &v25);
    v15 = v25;

    if ((v14 & 1) != 0)
    {
LABEL_6:
      v10 = v15;
LABEL_7:
      v16 = v10;
      v24 = v10;
      v17 = objc_msgSend(v9, "writeToFile:options:error:", v8, 1, &v24);
      v10 = v24;

      SPLogForSPLogCategoryDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if ((v17 & 1) != 0)
      {
        v20 = 2 * (gSPLogDebugAsDefault == 0);
        if (os_log_type_enabled(v18, v20))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v4;
          _os_log_impl(&dword_213202000, v19, v20, "Succesfully wrote %@ to disk", buf, 0xCu);
        }
      }
      else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v28 = v9;
        v29 = 2112;
        v30 = v8;
        v31 = 2112;
        v32 = v10;
        _os_log_error_impl(&dword_213202000, v19, OS_LOG_TYPE_ERROR, "Error writing data %@ to path %@: %@", buf, 0x20u);
      }
      goto LABEL_21;
    }
    objc_msgSend(v15, "domain");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) != 0)
    {
      v23 = objc_msgSend(v15, "code");

      if (v23 == 516)
        goto LABEL_6;
    }
    else
    {

    }
    SPLogForSPLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[SDAppUninstallMonitor _writeAppsListToDisk:].cold.2();
    v10 = v15;
  }
  else
  {
    SPLogForSPLogCategoryDefault();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[SDAppUninstallMonitor _writeAppsListToDisk:].cold.1((uint64_t)v10, v19, v21);
  }
LABEL_21:

}

- (id)_allInstalledApplicationsIdentifiers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  NSSet *v7;
  NSSet *allAppSet;
  NSObject *v9;
  NSSet *v10;
  void *v11;
  int v13;
  NSSet *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  SPLogForSPLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_213202000, v3, OS_LOG_TYPE_DEFAULT, "_allInstalledApplicationsIdentifiers", (uint8_t *)&v13, 2u);
  }

  SPFastApplicationsGet();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  allAppSet = self->_allAppSet;
  self->_allAppSet = v7;

  SPLogForSPLogCategoryDefault();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = self->_allAppSet;
    v13 = 138412290;
    v14 = v10;
    _os_log_impl(&dword_213202000, v9, OS_LOG_TYPE_DEFAULT, "_allInstalledApplicationsIdentifiers: %@", (uint8_t *)&v13, 0xCu);
  }

  -[NSSet allObjects](self->_allAppSet, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (BOOL)unlocked
{
  return self->_unlocked;
}

- (void)setUnlocked:(BOOL)a3
{
  self->_unlocked = a3;
}

- (BOOL)hasFailedDeletes
{
  return self->_hasFailedDeletes;
}

- (void)setHasFailedDeletes:(BOOL)a3
{
  self->_hasFailedDeletes = a3;
}

- (NSMutableSet)pcsForPendingPurges
{
  return self->_pcsForPendingPurges;
}

- (void)setPcsForPendingPurges:(id)a3
{
  objc_storeStrong((id *)&self->_pcsForPendingPurges, a3);
}

- (NSSet)allAppSet
{
  return self->_allAppSet;
}

- (void)setAllAppSet:(id)a3
{
  objc_storeStrong((id *)&self->_allAppSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAppSet, 0);
  objc_storeStrong((id *)&self->_pcsForPendingPurges, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_startupSemaphore, 0);
}

- (void)registerHandlerWithEventMonitor:.cold.1()
{
  __assert_rtn("-[SDAppUninstallMonitor registerHandlerWithEventMonitor:]", "SDAppUninstallMonitor.m", 110, "_eventMonitor");
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_213202000, v0, v1, "Failed to delete all items for bundleID:%@, protectionClass:%@, error:%@");
  OUTLINED_FUNCTION_8();
}

void __52__SDAppUninstallMonitor__deleteAllItemsForBundleID___block_invoke_93_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_3_0(&dword_213202000, v0, v1, "Failed to delete all interactions for bundleID:%@, protectionClass:%@, error:%@");
  OUTLINED_FUNCTION_8();
}

+ (void)_pendingPurgesFromDisk
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_7_0(v3);
  OUTLINED_FUNCTION_5_0(&dword_213202000, a2, v5, "Property list isn't a NSArray, instead class:%@", v6);

  OUTLINED_FUNCTION_8();
}

+ (void)_writePendingPurgesToDisk:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const __CFString *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 138412546;
  v3 = CFSTR("PendingPurges");
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_213202000, a2, OS_LOG_TYPE_ERROR, "Failed serializing %@ property list, error:%@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_5();
}

+ (void)_writePendingPurgesToDisk:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_213202000, v0, v1, "Failed to create a directory at %@, error:%@");
  OUTLINED_FUNCTION_5();
}

- (void)_deleteAllItemsForBundleIDs:completionBlock:.cold.1()
{
  __assert_rtn("-[SDAppUninstallMonitor _deleteAllItemsForBundleIDs:completionBlock:]", "SDAppUninstallMonitor.m", 345, "completionBlock");
}

+ (void)_installedAppsListFromDisk
{
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_class();
  v4 = OUTLINED_FUNCTION_7_0(v3);
  OUTLINED_FUNCTION_5_0(&dword_213202000, a2, v5, "Error, property list is not expected class NSArray, instead class:%@", v6);

  OUTLINED_FUNCTION_8();
}

+ (void)_writeAppsListToDisk:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_5_0(&dword_213202000, a2, a3, "Error serializing installedAppsBundleIDs property list: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_5();
}

+ (void)_writeAppsListToDisk:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_213202000, v0, v1, "Error creating directory at path %@: %@");
  OUTLINED_FUNCTION_5();
}

@end
