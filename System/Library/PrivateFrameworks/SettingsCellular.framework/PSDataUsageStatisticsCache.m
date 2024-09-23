@implementation PSDataUsageStatisticsCache

+ (id)sharedInstance
{
  if (qword_253E97608 != -1)
    dispatch_once(&qword_253E97608, &__block_literal_global_0);
  return (id)_MergedGlobals_3;
}

void __44__PSDataUsageStatisticsCache_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[PSDataUsageStatisticsCache initPrivate]([PSDataUsageStatisticsCache alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_3;
  _MergedGlobals_3 = (uint64_t)v0;

}

- (id)initPrivate
{
  id v3;
  void *v4;
  void *v5;
  PSDataUsageStatisticsCache *v6;

  v3 = objc_alloc(MEMORY[0x24BDC2810]);
  +[SettingsCellularSharedUtils createCTClientSerialQueue:](SettingsCellularSharedUtils, "createCTClientSerialQueue:", CFSTR("data_usage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithQueue:", v4);

  v6 = -[PSDataUsageStatisticsCache initWithCoreTelephonyClient:](self, "initWithCoreTelephonyClient:", v5);
  return v6;
}

- (PSDataUsageStatisticsCache)initWithCoreTelephonyClient:(id)a3
{
  id v5;
  PSDataUsageStatisticsCache *v6;
  PSDataUsageStatisticsCache *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSDataUsageStatisticsCache;
  v6 = -[PSDataUsageStatisticsCache init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[PSDataUsageStatisticsCache _clearCache](v6, "_clearCache");
    objc_storeStrong((id *)&v7->_client, a3);
    -[CoreTelephonyClient setDelegate:](v7->_client, "setDelegate:", v7);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v7, sel_willEnterForeground, *MEMORY[0x24BDF75D0], 0);

  }
  return v7;
}

- (PSDataUsageStatisticsCache)init
{
  NSObject *v2;
  uint8_t v3[16];

  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v3 = 0;
    _os_log_error_impl(&dword_2188BE000, v2, OS_LOG_TYPE_ERROR, "unsupported initializer called", v3, 2u);
  }

  objc_exception_throw((id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE88]), "initWithName:reason:userInfo:", CFSTR("Unsupported initializer"), CFSTR("Unsupported initializer called"), 0));
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PSDataUsageStatisticsCache;
  -[PSDataUsageStatisticsCache dealloc](&v4, sel_dealloc);
}

- (void)willEnterForeground
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Re-querying usage due to entering foreground", v4, 2u);
  }

  -[PSDataUsageStatisticsCache _handleUsageOrInfoChanged](self, "_handleUsageOrInfoChanged");
}

- (void)_clearCache
{
  NSObject *v3;
  PSDataUsageStatisticsCache *v4;
  uint8_t v5[16];

  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Clearing data usage stats cache", v5, 2u);
  }

  v4 = self;
  objc_sync_enter(v4);
  -[PSDataUsageStatisticsCache setCachedDeviceDataUsage:](v4, "setCachedDeviceDataUsage:", 0);
  -[PSDataUsageStatisticsCache setWorkspaceInfo:](v4, "setWorkspaceInfo:", 0);
  -[PSDataUsageStatisticsCache setHotspotClientsUsage:](v4, "setHotspotClientsUsage:", 0);
  -[PSDataUsageStatisticsCache setCacheNeedsRefresh:](v4, "setCacheNeedsRefresh:", 1);
  objc_sync_exit(v4);

}

- (void)fetchDeviceDataUsage
{
  PSDataUsageStatisticsCache *v2;
  NSObject *v3;
  NSObject *v4;
  CoreTelephonyClient *client;
  _QWORD v6[5];
  uint8_t buf[16];

  v2 = self;
  objc_sync_enter(v2);
  if (-[PSDataUsageStatisticsCache refreshInProgress](v2, "refreshInProgress"))
  {
    -[PSDataUsageStatisticsCache getLogger](v2, "getLogger");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Refresh already in progress", buf, 2u);
    }

    objc_sync_exit(v2);
  }
  else
  {
    -[PSDataUsageStatisticsCache setWorkspaceInfo:](v2, "setWorkspaceInfo:", 0);
    -[PSDataUsageStatisticsCache setRefreshInProgress:](v2, "setRefreshInProgress:", 1);
    objc_sync_exit(v2);

    -[PSDataUsageStatisticsCache getLogger](v2, "getLogger");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2188BE000, v4, OS_LOG_TYPE_INFO, "Executing fetch", buf, 2u);
    }

    client = v2->_client;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __50__PSDataUsageStatisticsCache_fetchDeviceDataUsage__block_invoke;
    v6[3] = &unk_24D96EC40;
    v6[4] = v2;
    -[CoreTelephonyClient dataUsageForLastPeriods:completion:](client, "dataUsageForLastPeriods:completion:", 2, v6);
  }
}

void __50__PSDataUsageStatisticsCache_fetchDeviceDataUsage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  char *v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void (**v11)(void);
  NSObject *v12;
  NSObject *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "setRefreshInProgress:", 0);
  objc_msgSend(*(id *)(a1 + 32), "getLogger");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = v6;
      _os_log_error_impl(&dword_2188BE000, v8, OS_LOG_TYPE_ERROR, "Fetch failed: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v5;
      _os_log_impl(&dword_2188BE000, v8, OS_LOG_TYPE_DEFAULT, "Fetch succeeded: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCachedDeviceDataUsage:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setCacheNeedsRefresh:", 0);
    objc_msgSend(*(id *)(a1 + 32), "refreshCompletionHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = *(void **)(a1 + 32);
    if (v9)
    {
      objc_msgSend(v10, "refreshCompletionHandler");
      v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v11[2]();

      objc_msgSend(*(id *)(a1 + 32), "setRefreshCompletionHandler:", 0);
    }
    else
    {
      objc_msgSend(v10, "getLogger");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v15) = 0;
        _os_log_error_impl(&dword_2188BE000, v12, OS_LOG_TYPE_ERROR, "Missing completion handler for fetch", (uint8_t *)&v15, 2u);
      }

    }
    objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PSWirelessDataUsageCacheRefreshedNotification"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "getLogger");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[PSDataUsageStatisticsCache fetchDeviceDataUsage]_block_invoke";
      v17 = 2112;
      v18 = CFSTR("PSWirelessDataUsageCacheRefreshedNotification");
      _os_log_impl(&dword_2188BE000, v13, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v15, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v8, 0);

  }
}

- (void)fetchDeviceDataUsageWithCompletion:(id)a3
{
  -[PSDataUsageStatisticsCache setRefreshCompletionHandler:](self, "setRefreshCompletionHandler:", a3);
  -[PSDataUsageStatisticsCache fetchDeviceDataUsage](self, "fetchDeviceDataUsage");
}

- (void)refreshCacheIfNeeded
{
  if (-[PSDataUsageStatisticsCache cacheNeedsRefresh](self, "cacheNeedsRefresh"))
    -[PSDataUsageStatisticsCache fetchDeviceDataUsage](self, "fetchDeviceDataUsage");
}

- (void)fetchHotspotClientsUsage
{
  uint64_t v3;
  const void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = WiFiManagerClientCreate();
  if (v3)
  {
    v4 = (const void *)v3;
    v5 = (void *)WiFiManagerClientCopyProperty();
    -[PSDataUsageStatisticsCache setHotspotClientsUsage:](self, "setHotspotClientsUsage:", v5);

    -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_debug_impl(&dword_2188BE000, v6, OS_LOG_TYPE_DEBUG, "Hotspot usage: %{public}@", (uint8_t *)&v9, 0xCu);

    }
    CFRelease(v4);
  }
  else
  {
    -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9) = 0;
      _os_log_error_impl(&dword_2188BE000, v7, OS_LOG_TYPE_ERROR, "Could not create WiFiManagerClient", (uint8_t *)&v9, 2u);
    }

  }
}

- (id)bundleIDsForAppType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  PSDataUsageStatisticsCache *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  v5 = (void *)objc_opt_new();
  switch(a3)
  {
    case 0uLL:
      v6 = (void *)MEMORY[0x24BDBCE30];
      v24 = self;
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appDataUsageForPeriod:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 1uLL:
      v6 = (void *)MEMORY[0x24BDBCE30];
      v24 = self;
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uninstalledAppDataUsageForPeriod:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2uLL:
      v6 = (void *)MEMORY[0x24BDBCE30];
      v24 = self;
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "proxiedOnlyAppDataUsageForPeriod:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3uLL:
      -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
        -[PSDataUsageStatisticsCache fetchHotspotClientsUsage](self, "fetchHotspotClientsUsage");
      v6 = (void *)MEMORY[0x24BDBCE30];
      v24 = self;
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "systemServiceDataUsageForPeriod:", 0);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v11 = (void *)v8;
      objc_msgSend(v6, "arrayWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 4uLL:
      -[PSDataUsageStatisticsCache hotspotClientIDsForPeriod:](self, "hotspotClientIDsForPeriod:", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    default:
      v24 = self;
      v9 = 0;
LABEL_10:
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v26;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v26 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v16);
            if (a3 != 3
              || (objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v16), "bundleId"),
                  v18 = (void *)objc_claimAutoreleasedReturnValue(),
                  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.datausage.personalhotspot")),
                  v18,
                  !v19)
              || (-[PSDataUsageStatisticsCache hotspotClientsUsage](v24, "hotspotClientsUsage"),
                  v20 = (void *)objc_claimAutoreleasedReturnValue(),
                  v20,
                  !v20))
            {
              objc_msgSend(v17, "bundleId");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "addObject:", v21);

            }
            ++v16;
          }
          while (v14 != v16);
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        }
        while (v14);
      }

      objc_msgSend(v5, "allObjects");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_22:
      return v22;
  }
}

- (id)displayNamesForBundleIDs:(id)a3 appType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  PSDataUsageStatisticsCache *v30;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v30 = self;
  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  switch(a4)
  {
    case 0uLL:
      v8 = (void *)MEMORY[0x24BDBCE30];
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "appDataUsageForPeriod:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      v8 = (void *)MEMORY[0x24BDBCE30];
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "uninstalledAppDataUsageForPeriod:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2uLL:
      v8 = (void *)MEMORY[0x24BDBCE30];
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "proxiedOnlyAppDataUsageForPeriod:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3uLL:
      v8 = (void *)MEMORY[0x24BDBCE30];
      -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "systemServiceDataUsageForPeriod:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v11 = (void *)v10;
      objc_msgSend(v8, "arrayWithArray:", v10);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v31 = 0;
      break;
  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v6;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v38;
    v27 = *(_QWORD *)v38;
    v28 = a4;
    do
    {
      v15 = 0;
      v29 = v13;
      do
      {
        if (*(_QWORD *)v38 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v15);
        if (a4 == 4)
        {
          -[PSDataUsageStatisticsCache displayNameForHotspotClientID:](v30, "displayNameForHotspotClientID:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v15));
          v17 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v17, v16);
        }
        else
        {
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          v17 = v31;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                if (*(_QWORD *)v34 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v22, "bundleId", v27, v28);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = objc_msgSend(v16, "isEqualToString:", v23);

                if (v24)
                {
                  objc_msgSend(v22, "displayName");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v7, "setObject:forKey:", v25, v16);

                }
              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v19);
            v14 = v27;
            a4 = v28;
            v13 = v29;
          }
        }

        ++v15;
      }
      while (v15 != v13);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v13);
  }

  return v7;
}

- (id)totalWatchOnlyAppUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalProxiedOnlyAppDataUsedForPeriod:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalSystemServicesUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalSystemServiceDataUsedForPeriod:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)totalUninstalledAppUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalUninstalledAppDataUsedForPeriod:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hotspotClientIDsForPeriod:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v27;
  unint64_t v28;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v5 = -[PSDataUsageStatisticsCache totalHotspotClientUsageForPeriod:](self, "totalHotspotClientUsageForPeriod:");
  -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[PSDataUsageStatisticsCache fetchHotspotClientsUsage](self, "fetchHotspotClientsUsage");
  v7 = (void *)objc_opt_new();
  -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "count"))
  {
    v27 = v11;
    v28 = v5;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v11;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    v12 = 0;
    if (v32)
    {
      v31 = *(_QWORD *)v42;
      v30 = *MEMORY[0x24BE67ED0];
      v36 = *MEMORY[0x24BE67EE0];
      v35 = *MEMORY[0x24BE67EC0];
      v13 = *MEMORY[0x24BE67EA0];
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(obj);
          v33 = v14;
          objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v14), "objectForKey:", v30, v27, v28);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v34 = v15;
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v38;
            do
            {
              for (i = 0; i != v17; ++i)
              {
                if (*(_QWORD *)v38 != v18)
                  objc_enumerationMutation(v34);
                v20 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
                objc_msgSend(v20, "objectForKey:", v36);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKey:", v35);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "unsignedIntegerValue");
                v12 += v23 + objc_msgSend(v21, "unsignedIntegerValue");
                objc_msgSend(v20, "objectForKey:", v13);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "addObject:", v24);

              }
              v17 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            }
            while (v17);
          }

          v14 = v33 + 1;
        }
        while (v33 + 1 != v32);
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v32);
    }

    v11 = v27;
    v5 = v28;
  }
  else
  {
    v12 = 0;
  }
  if (v5 > v12)
    objc_msgSend(v7, "addObject:", CFSTR("Others"));
  if (v7)
  {
    objc_msgSend(v7, "allObjects");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)displayNameForHotspotClientID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v25;
  id obj;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
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
  v4 = a3;
  -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[PSDataUsageStatisticsCache fetchHotspotClientsUsage](self, "fetchHotspotClientsUsage");
  -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "count"))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v9;
    obj = v9;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    v10 = 0;
    if (v30)
    {
      v29 = *(_QWORD *)v36;
      v28 = *MEMORY[0x24BE67ED0];
      v11 = *MEMORY[0x24BE67EA0];
      v27 = *MEMORY[0x24BE67EA8];
      do
      {
        for (i = 0; i != v30; ++i)
        {
          if (*(_QWORD *)v36 != v29)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "objectForKey:", v28, v25);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = 0u;
          v32 = 0u;
          v33 = 0u;
          v34 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v32;
            while (2)
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v32 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
                objc_msgSend(v19, "objectForKey:", v11);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v20, "isEqualToString:", v4))
                {
                  objc_msgSend(v19, "objectForKey:", v27);
                  v21 = objc_claimAutoreleasedReturnValue();

                  v10 = (void *)v21;
                  goto LABEL_20;
                }

              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
              if (v16)
                continue;
              break;
            }
          }
LABEL_20:

        }
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v30);
    }

    v9 = v25;
  }
  else
  {
    v10 = 0;
  }
  if (v10)
    v22 = v10;
  else
    v22 = v4;
  v23 = v22;

  return v23;
}

- (unint64_t)totalHotspotClientUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache usageForBundleID:inPeriod:](self, "usageForBundleID:inPeriod:", CFSTR("com.apple.datausage.personalhotspot"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "native");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "cellularHome");
    objc_msgSend(v6, "native");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "cellularRoaming") + v8;
    objc_msgSend(v6, "proxied");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "cellularHome");
    objc_msgSend(v6, "proxied");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10 + v12 + objc_msgSend(v13, "cellularRoaming");

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (unint64_t)usageForHotspotClientID:(id)a3 inPeriod:(unint64_t)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  void *v29;
  unint64_t v30;
  id obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v39 = a3;
  v6 = -[PSDataUsageStatisticsCache totalHotspotClientUsageForPeriod:](self, "totalHotspotClientUsageForPeriod:", a4);
  -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    -[PSDataUsageStatisticsCache fetchHotspotClientsUsage](self, "fetchHotspotClientsUsage");
  -[PSDataUsageStatisticsCache hotspotClientsUsage](self, "hotspotClientsUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 && objc_msgSend(v11, "count"))
  {
    v29 = v11;
    v30 = v6;
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v11;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    v12 = 0;
    if (v34)
    {
      v35 = 0;
      v33 = *(_QWORD *)v45;
      v32 = *MEMORY[0x24BE67ED0];
      v38 = *MEMORY[0x24BE67EA0];
      v37 = *MEMORY[0x24BE67EE0];
      v13 = *MEMORY[0x24BE67EC0];
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v45 != v33)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "objectForKey:", v32);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v16 = v15;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          if (v17)
          {
            v18 = v17;
            v36 = i;
            v19 = *(_QWORD *)v41;
            while (2)
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v41 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                objc_msgSend(v21, "objectForKey:", v38);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKey:", v37);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKey:", v13);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v24, "unsignedIntegerValue");
                v12 += v25 + objc_msgSend(v23, "unsignedIntegerValue");
                if (objc_msgSend(v22, "isEqualToString:", v39))
                {
                  v26 = objc_msgSend(v24, "unsignedIntegerValue");
                  v35 += v26 + objc_msgSend(v23, "unsignedIntegerValue");

                  goto LABEL_20;
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
              if (v18)
                continue;
              break;
            }
LABEL_20:
            i = v36;
          }

        }
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v34);
    }
    else
    {
      v35 = 0;
    }

    v11 = v29;
    v6 = v30;
    v27 = v35;
  }
  else
  {
    v12 = 0;
    v27 = 0;
  }
  if ((objc_msgSend(v39, "isEqualToString:", CFSTR("Others")) & (v6 > v12)) != 0)
    v27 = v6 - v12;

  return v27;
}

- (id)usageForBundleID:(id)a3 inPeriod:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *m;
  void *v43;
  void *v44;
  char v45;
  unint64_t v47;
  PSDataUsageStatisticsCache *obj;
  id obja;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appDataUsageForPeriod:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v63;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v63 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        objc_msgSend(v14, "bundleId");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "isEqualToString:", v15);

        if ((v16 & 1) != 0)
        {
          objc_msgSend(v14, "used");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = v9;
          goto LABEL_41;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      if (v11)
        continue;
      break;
    }
  }

  obj = self;
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "proxiedOnlyAppDataUsageForPeriod:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v59;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v59 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
        objc_msgSend(v24, "bundleId");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v6, "isEqualToString:", v25);

        if ((v26 & 1) != 0)
        {
          objc_msgSend(v24, "used");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v19;
          goto LABEL_40;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      if (v21)
        continue;
      break;
    }
  }

  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](obj, "cachedDeviceDataUsage");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = a4;
  objc_msgSend(v27, "systemServiceDataUsageForPeriod:", a4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v29 = v28;
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v55;
    while (2)
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v55 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
        objc_msgSend(v34, "bundleId");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v6, "isEqualToString:", v35);

        if ((v36 & 1) != 0)
        {
          objc_msgSend(v34, "used");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v29;
          goto LABEL_39;
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      if (v31)
        continue;
      break;
    }
  }

  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](obj, "cachedDeviceDataUsage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "uninstalledAppDataUsageForPeriod:", v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v39 = v38;
  v40 = (void *)objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v51;
    obja = v39;
    while (2)
    {
      for (m = 0; m != v40; m = (char *)m + 1)
      {
        if (*(_QWORD *)v51 != v41)
          objc_enumerationMutation(obja);
        v43 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)m);
        objc_msgSend(v43, "bundleId");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v6, "isEqualToString:", v44);

        if ((v45 & 1) != 0)
        {
          objc_msgSend(v43, "used");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = obja;
          goto LABEL_38;
        }
      }
      v39 = obja;
      v40 = (void *)objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      if (v40)
        continue;
      break;
    }
  }
LABEL_38:

LABEL_39:
LABEL_40:

LABEL_41:
  return v40;
}

- (id)wifiAssistUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalWifiAssistUsageForPeriod:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)totalCellularUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalDataUsedForPeriod:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "native");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cellularHome");
  objc_msgSend(v6, "native");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cellularRoaming") + v8;
  objc_msgSend(v6, "proxied");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "cellularHome");
  objc_msgSend(v6, "proxied");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 + v12 + objc_msgSend(v13, "cellularRoaming");

  return v14;
}

- (unint64_t)totalRoamingUsageForPeriod:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[PSDataUsageStatisticsCache refreshCacheIfNeeded](self, "refreshCacheIfNeeded");
  -[PSDataUsageStatisticsCache cachedDeviceDataUsage](self, "cachedDeviceDataUsage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "totalDataUsedForPeriod:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "native");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cellularRoaming");
  objc_msgSend(v6, "proxied");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "cellularRoaming") + v8;

  return v10;
}

- (void)fetchWorkspaceInfo
{
  NSObject *v3;
  CoreTelephonyClient *client;
  void *v5;
  id v6;
  PSDataUsageStatisticsCache *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEBUG, "Fetching workspace info", buf, 2u);
  }

  client = self->_client;
  v8 = 0;
  -[CoreTelephonyClient getCellularUsageWorkspaceInfo:](client, "getCellularUsageWorkspaceInfo:", &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v6)
  {
    -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
    v7 = (PSDataUsageStatisticsCache *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_error_impl(&dword_2188BE000, &v7->super, OS_LOG_TYPE_ERROR, "Failed to get the data usage workspace information with error: %@", buf, 0xCu);
    }
  }
  else
  {
    v7 = self;
    objc_sync_enter(v7);
    -[PSDataUsageStatisticsCache setWorkspaceInfo:](v7, "setWorkspaceInfo:", v5);
    objc_sync_exit(v7);
  }

}

- (BOOL)billingCycleSupported
{
  void *v3;
  PSDataUsageStatisticsCache *v4;
  void *v5;
  void *v6;
  char v7;

  -[PSDataUsageStatisticsCache workspaceInfo](self, "workspaceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSDataUsageStatisticsCache fetchWorkspaceInfo](self, "fetchWorkspaceInfo");
  v4 = self;
  objc_sync_enter(v4);
  -[PSDataUsageStatisticsCache workspaceInfo](v4, "workspaceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "billingCycleSupported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_sync_exit(v4);
  return v7;
}

- (BOOL)useCalendarMonthBillingCycle
{
  void *v3;
  PSDataUsageStatisticsCache *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  char v10;

  -[PSDataUsageStatisticsCache workspaceInfo](self, "workspaceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSDataUsageStatisticsCache fetchWorkspaceInfo](self, "fetchWorkspaceInfo");
  v4 = self;
  objc_sync_enter(v4);
  -[PSDataUsageStatisticsCache workspaceInfo](v4, "workspaceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "billingCycleSupported");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  -[PSDataUsageStatisticsCache workspaceInfo](v4, "workspaceInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "carrierSpaceSupported");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_sync_exit(v4);
  return v7 & (v10 ^ 1);
}

- (id)billingCycleEndDate
{
  void *v3;
  PSDataUsageStatisticsCache *v4;
  void *v5;
  void *v6;

  -[PSDataUsageStatisticsCache workspaceInfo](self, "workspaceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSDataUsageStatisticsCache fetchWorkspaceInfo](self, "fetchWorkspaceInfo");
  v4 = self;
  objc_sync_enter(v4);
  -[PSDataUsageStatisticsCache workspaceInfo](v4, "workspaceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "billingCycleEndDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v6;
}

- (id)previousBillingCycleEndDate
{
  void *v3;
  PSDataUsageStatisticsCache *v4;
  void *v5;
  void *v6;

  -[PSDataUsageStatisticsCache workspaceInfo](self, "workspaceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PSDataUsageStatisticsCache fetchWorkspaceInfo](self, "fetchWorkspaceInfo");
  v4 = self;
  objc_sync_enter(v4);
  -[PSDataUsageStatisticsCache workspaceInfo](v4, "workspaceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "previousBillingCycleDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v4);
  return v6;
}

- (void)_handleUsageOrInfoChanged
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[PSDataUsageStatisticsCache _clearCache](self, "_clearCache");
  objc_msgSend(MEMORY[0x24BDD16C8], "notificationWithName:object:", CFSTR("PSWirelessDataUsageChangedNotification"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[PSDataUsageStatisticsCache _handleUsageOrInfoChanged]";
    v8 = 2112;
    v9 = CFSTR("PSWirelessDataUsageChangedNotification");
    _os_log_impl(&dword_2188BE000, v4, OS_LOG_TYPE_DEFAULT, "%s posting notification %@ from main thread", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_postNotification_, v3, 0);

}

- (void)refreshDataUsageUINotification
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Received notification to refresh data usage UI", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PSDataUsageStatisticsCache_refreshDataUsageUINotification__block_invoke;
  block[3] = &unk_24D96EC68;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __60__PSDataUsageStatisticsCache_refreshDataUsageUINotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleUsageOrInfoChanged");
}

- (void)dataRatesChanged
{
  NSObject *v3;
  uint8_t v4[16];

  -[PSDataUsageStatisticsCache getLogger](self, "getLogger");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2188BE000, v3, OS_LOG_TYPE_DEFAULT, "Data Rates Changed.", v4, 2u);
  }

  -[PSDataUsageStatisticsCache refreshDataUsageUINotification](self, "refreshDataUsageUINotification");
}

- (id)getLogger
{
  return +[Logger loggerWithCategory:](Logger, "loggerWithCategory:", CFSTR("DataUsage"));
}

- (CoreTelephonyClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (CTDeviceDataUsage)cachedDeviceDataUsage
{
  return (CTDeviceDataUsage *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCachedDeviceDataUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BOOL)refreshInProgress
{
  return self->_refreshInProgress;
}

- (void)setRefreshInProgress:(BOOL)a3
{
  self->_refreshInProgress = a3;
}

- (id)refreshCompletionHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setRefreshCompletionHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (CTCellularUsageWorkspaceInfo)workspaceInfo
{
  return (CTCellularUsageWorkspaceInfo *)objc_getProperty(self, a2, 40, 1);
}

- (void)setWorkspaceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)hotspotClientsUsage
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setHotspotClientsUsage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)cacheNeedsRefresh
{
  return self->_cacheNeedsRefresh;
}

- (void)setCacheNeedsRefresh:(BOOL)a3
{
  self->_cacheNeedsRefresh = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hotspotClientsUsage, 0);
  objc_storeStrong((id *)&self->_workspaceInfo, 0);
  objc_storeStrong(&self->_refreshCompletionHandler, 0);
  objc_storeStrong((id *)&self->_cachedDeviceDataUsage, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
