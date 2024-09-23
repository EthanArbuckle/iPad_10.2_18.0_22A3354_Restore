@implementation StockManager

+ (id)sharedManager
{
  void *v2;
  StockManager *v3;
  void *v4;

  v2 = (void *)__sharedStockManager;
  if (!__sharedStockManager)
  {
    v3 = objc_alloc_init(StockManager);
    v4 = (void *)__sharedStockManager;
    __sharedStockManager = (uint64_t)v3;

    v2 = (void *)__sharedStockManager;
  }
  return v2;
}

+ (void)clearSharedManager
{
  void *v2;

  v2 = (void *)__sharedStockManager;
  __sharedStockManager = 0;

}

- (StockManager)init
{
  StockManager *v2;
  StockManager *v3;
  id v4;
  void *v5;
  id v6;
  char isKindOfClass;
  uint64_t v8;
  NSMutableArray *stocksList;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  Stock *v16;
  uint64_t v17;
  NSUbiquitousKeyValueStore *syncedKVStore;
  void *v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  NSMutableArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  NSObject *v33;
  Stock *v34;
  NSMutableArray *v35;
  NSMutableArray *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  double v41;
  uint64_t v42;
  NSMutableArray *defaultListStockSymbols;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  NSMutableArray *v49;
  void *v50;
  void *v51;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v53;
  __CFNotificationCenter *v54;
  __CFNotificationCenter *v55;
  _BOOL4 v57;
  void *v58;
  void *v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  objc_super v73;
  uint8_t v74[128];
  uint8_t buf[4];
  uint64_t v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v73.receiver = self;
  v73.super_class = (Class)StockManager;
  v2 = -[StockManager init](&v73, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_shouldPostSyncNotifications = 1;
    if ((objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG") & 1) == 0)
    {
      v4 = +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
      +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "synchronize");
      v60 = v5;
      objc_msgSend(v5, "objectForKey:", CFSTR("stocks"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v8 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
        stocksList = v3->_stocksList;
        v3->_stocksList = (NSMutableArray *)v8;

        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v10 = v6;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v70;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v70 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = -[Stock initWithDictionary:]([Stock alloc], "initWithDictionary:", v15);
                if (v16)
                  -[NSMutableArray addObject:](v3->_stocksList, "addObject:", v16);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
          }
          while (v12);
        }

      }
      objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
      v17 = objc_claimAutoreleasedReturnValue();
      syncedKVStore = v3->_syncedKVStore;
      v3->_syncedKVStore = (NSUbiquitousKeyValueStore *)v17;

      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObserver:selector:name:object:", v3, sel_handleSyncedDataChanged_, *MEMORY[0x24BDD1378], v3->_syncedKVStore);

      -[NSUbiquitousKeyValueStore arrayForKey:](v3->_syncedKVStore, "arrayForKey:", CFSTR("stocks"));
      v20 = objc_claimAutoreleasedReturnValue();
      -[StockManager _defaultStockDictionaries](v3, "_defaultStockDictionaries");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = (void *)v20;
      v59 = v21;
      if ((isKindOfClass & 1) != 0)
      {
        v22 = 0;
      }
      else
      {
        StocksLogForCategory(1);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21736B000, v23, OS_LOG_TYPE_DEFAULT, "#StockManager init - NO LOCAL DEFAULTS", buf, 2u);
        }

        if (v20)
        {
          StocksLogForCategory(1);
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21736B000, v24, OS_LOG_TYPE_DEFAULT, "#StockManager setting local stocks to synced stock list", buf, 2u);
          }

          v22 = -[StockManager setLocalStockListFromSyncableStockList:](v3, "setLocalStockListFromSyncableStockList:", v20);
        }
        else
        {
          v25 = v21;

          v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v25, "count"));
          v27 = v3->_stocksList;
          v3->_stocksList = (NSMutableArray *)v26;

          v65 = 0u;
          v66 = 0u;
          v57 = objc_msgSend(v25, "count") != 0;
          v67 = 0u;
          v68 = 0u;
          v6 = v25;
          v28 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v66;
            do
            {
              for (j = 0; j != v29; ++j)
              {
                if (*(_QWORD *)v66 != v30)
                  objc_enumerationMutation(v6);
                v32 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * j);
                StocksLogForCategory(1);
                v33 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v76 = v32;
                  _os_log_impl(&dword_21736B000, v33, OS_LOG_TYPE_DEFAULT, "#StockManager adding from default stocks: %@", buf, 0xCu);
                }

                v34 = -[Stock initWithDictionary:]([Stock alloc], "initWithDictionary:", v32);
                -[NSMutableArray addObject:](v3->_stocksList, "addObject:", v34);

              }
              v29 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
            }
            while (v29);
          }

          v21 = v59;
          v22 = v57;
        }
      }
      if (!v3->_stocksList)
      {
        v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v36 = v3->_stocksList;
        v3->_stocksList = v35;

      }
      objc_msgSend(v60, "objectForKey:", CFSTR("lastModified"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (v37)
      {
        objc_msgSend(v37, "doubleValue");
        v3->_lastModifiedTime = v39;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "timeIntervalSince1970");
        v3->_lastModifiedTime = v41;

      }
      v42 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v21, "count"));
      defaultListStockSymbols = v3->_defaultListStockSymbols;
      v3->_defaultListStockSymbols = (NSMutableArray *)v42;

      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v44 = v6;
      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
      if (v45)
      {
        v46 = v45;
        v47 = *(_QWORD *)v62;
        do
        {
          for (k = 0; k != v46; ++k)
          {
            if (*(_QWORD *)v62 != v47)
              objc_enumerationMutation(v44);
            v49 = v3->_defaultListStockSymbols;
            objc_msgSend(*(id *)(*((_QWORD *)&v61 + 1) + 8 * k), "objectForKey:", CFSTR("symbol"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableArray addObject:](v49, "addObject:", v50);

          }
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v61, v74, 16);
        }
        while (v46);
      }

      if (v22)
        -[StockManager saveListChanges](v3, "saveListChanges");
      if (DefaultStocksOverride)
      {
        -[NSMutableArray removeAllObjects](v3->_stocksList, "removeAllObjects");
        -[NSMutableArray addObjectsFromArray:](v3->_stocksList, "addObjectsFromArray:", DefaultStocksOverride);
      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "addObserver:selector:name:object:", v3, sel_clearCachedChartData, *MEMORY[0x24BDF7538], 0);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)GizmoSettingsChanged, CFSTR("com.apple.stocks.PreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
      v53 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v53, v3->_stocksList, (CFNotificationCallback)StockWasModified, (CFStringRef)StockWasAddedDarwinNotification, v3, CFNotificationSuspensionBehaviorCoalesce);
      v54 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v54, v3->_stocksList, (CFNotificationCallback)StockWasModified, (CFStringRef)StockWasMovedDarwinNotification, v3, CFNotificationSuspensionBehaviorCoalesce);
      v55 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v55, v3->_stocksList, (CFNotificationCallback)StockWasModified, (CFStringRef)StockWasDeletedDarwinNotification, v3, CFNotificationSuspensionBehaviorCoalesce);

    }
  }
  return v3;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v4;
  __CFNotificationCenter *v5;
  __CFNotificationCenter *v6;
  objc_super v7;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.stocks.PreferencesChangedNotification"), 0);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self->_stocksList, (CFNotificationName)StockWasAddedDarwinNotification, self);
  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v5, self->_stocksList, (CFNotificationName)StockWasMovedDarwinNotification, self);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self->_stocksList, (CFNotificationName)StockWasDeletedDarwinNotification, self);
  v7.receiver = self;
  v7.super_class = (Class)StockManager;
  -[StockManager dealloc](&v7, sel_dealloc);
}

- (id)stockForURL:(id)a3
{
  void *v4;
  void *v5;

  +[Stock symbolForURL:](Stock, "symbolForURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[StockManager stockWithSymbol:](self, "stockWithSymbol:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_defaultStockDictionaries
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCWatchlistDefaults defaultsForCurrentCountry](SCWatchlistDefaults, "defaultsForCurrentCountry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SCWatchlistDefaults defaultsFromCarrierBundle](SCWatchlistDefaults, "defaultsFromCarrierBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v3;
  objc_msgSend(v3, "defaultsByAppendingDefaults:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v5, "defaultSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v19 = CFSTR("symbol");
        v20 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v8);
  }

  return v2;
}

- (void)reloadStocksFromDefaults
{
  NSObject *v3;
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[16];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  StocksLogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21736B000, v3, OS_LOG_TYPE_DEFAULT, "#StockManager reloadStocksFromDefaults", buf, 2u);
  }

  +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadExchangesFromDefaults");

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "synchronize");

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("stocks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v7;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v13, "objectForKey:", CFSTR("symbol"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[StockManager stockWithSymbol:](self, "stockWithSymbol:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
              objc_msgSend(v15, "populateFromDictionary:", v13);

          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v10);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postNotificationName:object:", CFSTR("StocksDidReloadFromDefaultsNotification"), 0);

    v7 = v17;
  }

}

- (void)handleSyncedDataChanged:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  NSObject *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  StockManager *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  StockManager *v34;
  void *v35;
  void *v36;
  id obj;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint8_t v50[128];
  uint8_t buf[4];
  uint64_t v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDD1368]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  -[NSUbiquitousKeyValueStore arrayForKey:](self->_syncedKVStore, "arrayForKey:", CFSTR("stocks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  StocksLogForCategory(1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v52 = v6;
    _os_log_impl(&dword_21736B000, v8, OS_LOG_TYPE_DEFAULT, "#StockManager #sync changeReason: %lu", buf, 0xCu);
  }

  if (SyncedStocksOverride)
  {

    v7 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_9;
  }
  if (v6 != 3 || v7 != 0)
  {
LABEL_9:
    v35 = v7;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v7);
    v11 = v10;
    if (SyncedStocksOverride)
    {
      objc_msgSend(v10, "removeAllObjects");
      objc_msgSend(v11, "addObjectsFromArray:", SyncedStocksOverride);
    }
    v12 = -[NSMutableArray count](self->_stocksList, "count");
    if (v12 == objc_msgSend(v11, "count"))
    {
      if (!-[NSMutableArray count](self->_stocksList, "count"))
      {
LABEL_45:

        return;
      }
      v13 = 0;
      while (1)
      {
        -[NSMutableArray objectAtIndex:](self->_stocksList, "objectAtIndex:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "symbol");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "objectAtIndex:", v13);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v16, "objectForKey:", CFSTR("symbol"));
        v17 = self;
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        LOBYTE(v16) = objc_msgSend(v15, "isEqualToString:", v18);
        self = v17;

        if ((v16 & 1) == 0)
          break;
        if (-[NSMutableArray count](v17->_stocksList, "count") <= (unint64_t)++v13)
          goto LABEL_45;
      }
    }
    v19 = 0x24BDD1000uLL;
    if (self->_shouldPostSyncNotifications)
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "postNotificationName:object:", StocksWillSyncNotification, 0);

    }
    switch(v6)
    {
      case 0u:
        goto LABEL_41;
      case 1u:
      case 3u:
        v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v11);
        v45 = 0u;
        v46 = 0u;
        v47 = 0u;
        v48 = 0u;
        v34 = self;
        -[StockManager makeSyncableStockListFromList:](self, "makeSyncableStockListFromList:", self->_stocksList);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (!v40)
          goto LABEL_37;
        v38 = *(_QWORD *)v46;
        v39 = v11;
        break;
      case 2u:
        StocksLogForCategory(1);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21736B000, v31, OS_LOG_TYPE_DEFAULT, "NSUbiquitousKeyValueStore Quota Violation", buf, 2u);
        }

LABEL_41:
        -[StockManager setLocalStockListFromSyncableStockList:](self, "setLocalStockListFromSyncableStockList:", v11);
        goto LABEL_42;
      default:
        goto LABEL_42;
    }
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v46 != v38)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v22, "objectForKey:", CFSTR("symbol"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v24 = v11;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v42;
          while (2)
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v42 != v27)
                objc_enumerationMutation(v24);
              objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * j), "objectForKey:", CFSTR("symbol"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v23, "isEqualToString:", v29);

              if ((v30 & 1) != 0)
              {

                goto LABEL_35;
              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
            if (v26)
              continue;
            break;
          }
        }

        objc_msgSend(v36, "addObject:", v22);
LABEL_35:

        v11 = v39;
      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    }
    while (v40);
LABEL_37:

    self = v34;
    -[StockManager setLocalStockListFromSyncableStockList:](v34, "setLocalStockListFromSyncableStockList:", v36);

    v19 = 0x24BDD1000;
LABEL_42:
    if (self->_shouldPostSyncNotifications)
    {
      objc_msgSend(*(id *)(v19 + 1744), "defaultCenter");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "postNotificationName:object:", StockListDidChangeNotification, 0);

    }
    -[StockManager saveListChanges](self, "saveListChanges");
    objc_msgSend(*(id *)(v19 + 1744), "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "postNotificationName:object:", StockListDidSaveNotification, 0);

    goto LABEL_45;
  }
}

- (id)makeSyncableStockListFromList:(id)a3
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v23;
  void *v24;
  id obj;
  uint64_t v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", SyncedPropertyNames, 4);
  if (objc_msgSend(v3, "count")
    && (objc_msgSend(v3, "objectAtIndex:", 0),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v4,
        (isKindOfClass & 1) != 0))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v39 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "archiveDictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      }
      while (v9);
    }

  }
  else
  {
    v6 = v3;
  }
  v28 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v13)
  {
    v14 = v13;
    v27 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v35 != v27)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v29, "count"));
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v18 = v29;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v31;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v31 != v21)
                objc_enumerationMutation(v18);
              v23 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
              objc_msgSend(v16, "objectForKey:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (v24)
                objc_msgSend(v17, "setObject:forKey:", v24, v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
          }
          while (v20);
        }

        objc_msgSend(v28, "addObject:", v17);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v14);
  }

  return v28;
}

- (BOOL)setLocalStockListFromSyncableStockList:(id)a3
{
  id v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *stocksList;
  __int128 v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  char v23;
  __CFString *v24;
  void *v25;
  void *v26;
  Stock *v27;
  NSObject *v28;
  __int128 v30;
  id obj;
  char v32;
  uint64_t v33;
  void *v34;
  StockManager *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[NSMutableArray count](self->_stocksList, "count"));
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v35 = self;
  v6 = self->_stocksList;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v42 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v11, "symbol");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v8);
  }

  v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  stocksList = v35->_stocksList;
  v35->_stocksList = (NSMutableArray *)v13;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v36)
  {
    v32 = 0;
    v33 = *(_QWORD *)v38;
    *(_QWORD *)&v15 = 138412290;
    v30 = v15;
    v34 = v5;
    do
    {
      for (j = 0; j != v36; ++j)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
        objc_msgSend(v17, "objectForKey:", CFSTR("symbol"), v30);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "archiveDictionary");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v20, "mutableCopy");

        if (v21)
        {
          v22 = 0;
          v23 = 0;
          do
          {
            v24 = SyncedPropertyNames[v22];
            objc_msgSend(v17, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "isEqualToString:", v25) & 1) == 0)
            {
              if (v25)
                objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, v24);
              else
                objc_msgSend(v21, "removeObjectForKey:", v24);
              v23 = 1;
            }

            ++v22;
          }
          while (v22 != 4);
          if ((v23 & 1) != 0)
          {
            objc_msgSend(v19, "populateFromDictionary:", v21);
            v32 = 1;
          }
        }
        else
        {
          v27 = -[Stock initWithDictionary:]([Stock alloc], "initWithDictionary:", v17);

          v32 = 1;
          v19 = v27;
        }
        -[NSMutableArray addObject:](v35->_stocksList, "addObject:", v19);
        StocksLogForCategory(1);
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v30;
          v46 = v19;
          _os_log_impl(&dword_21736B000, v28, OS_LOG_TYPE_DEFAULT, "#StockManager #sync setLocalStockListFromSyncableStockList adding stock: %@", buf, 0xCu);
        }

        v5 = v34;
      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v36);
  }
  else
  {
    v32 = 0;
  }

  return v32 & 1;
}

- (id)stocksList
{
  if (self->_stocksList)
    return self->_stocksList;
  else
    return MEMORY[0x24BDBD1A8];
}

- (id)stockWithSymbol:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_stocksList;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "symbol", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)addStock:(id)a3
{
  -[StockManager _addStock:withRemoteNotification:](self, "_addStock:withRemoteNotification:", a3, 1);
}

- (void)_addStock:(id)a3 withRemoteNotification:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v4 = a4;
  v12 = a3;
  -[StockManager stocksList](self, "stocksList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", StockListDidChangeNotification, 0);

  +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "exchange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "containsExchange:", v9);

  if ((v10 & 1) == 0)
  {
    objc_msgSend(v12, "exchange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addExchange:", v11);

  }
  if (v4)
    self->_needRemoteAddNotification = 1;

}

- (void)removeStock:(id)a3
{
  -[StockManager _removeStock:withRemoteNotification:](self, "_removeStock:withRemoteNotification:", a3, 1);
}

- (void)_removeStock:(id)a3 withRemoteNotification:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *stocksList;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", StockWillBeRemovedNotification[0], v6);

  -[NSMutableArray removeObjectIdenticalTo:](self->_stocksList, "removeObjectIdenticalTo:", v6);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", StockListDidChangeNotification, 0);

  objc_msgSend(v6, "exchange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  stocksList = self->_stocksList;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __52__StockManager__removeStock_withRemoteNotification___block_invoke;
  v16 = &unk_24D74C558;
  v11 = v9;
  v17 = v11;
  v18 = &v19;
  -[NSMutableArray enumerateObjectsUsingBlock:](stocksList, "enumerateObjectsUsingBlock:", &v13);
  if (!*((_BYTE *)v20 + 24))
  {
    +[ExchangeManager sharedManager](ExchangeManager, "sharedManager", v13, v14, v15, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeExchange:", v11);

    if (!v4)
      goto LABEL_4;
    goto LABEL_3;
  }
  if (v4)
LABEL_3:
    self->_needRemoteDeleteNotification = 1;
LABEL_4:

  _Block_object_dispose(&v19, 8);
}

void __52__StockManager__removeStock_withRemoteNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;

  objc_msgSend(a2, "exchange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)moveStockFromIndex:(int64_t)a3 toIndex:(int64_t)a4
{
  void *v7;
  id v8;

  -[NSMutableArray objectAtIndex:](self->_stocksList, "objectAtIndex:");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectAtIndex:](self->_stocksList, "removeObjectAtIndex:", a3);
  -[NSMutableArray insertObject:atIndex:](self->_stocksList, "insertObject:atIndex:", v8, a4);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", StockListDidChangeNotification, 0);

  self->_needRemoteMoveNotification = 1;
}

- (void)RemoveChartDataFromLRU:(id)a3
{
  id v4;
  NSMutableArray *chartDataLRUCache;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    chartDataLRUCache = self->_chartDataLRUCache;
    v8 = v4;
    if (chartDataLRUCache)
    {
      -[NSMutableArray removeObjectIdenticalTo:](chartDataLRUCache, "removeObjectIdenticalTo:", v4);
    }
    else
    {
      v6 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 50);
      v7 = self->_chartDataLRUCache;
      self->_chartDataLRUCache = v6;

    }
    v4 = v8;
  }

}

- (void)DeleteChartData:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a3;
  objc_msgSend(v3, "stock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "chartInterval");

  objc_msgSend(v5, "setChartData:forInterval:", 0, v4);
}

- (void)UpdateChartDataInLRU:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    -[StockManager RemoveChartDataFromLRU:](self, "RemoveChartDataFromLRU:", v4);
    if (-[NSMutableArray count](self->_chartDataLRUCache, "count") == 50)
    {
      -[NSMutableArray objectAtIndex:](self->_chartDataLRUCache, "objectAtIndex:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[StockManager DeleteChartData:](self, "DeleteChartData:", v5);

    }
    -[NSMutableArray addObject:](self->_chartDataLRUCache, "addObject:", v6);
    v4 = v6;
  }

}

- (void)clearCachedChartData
{
  uint64_t v3;
  void *v4;
  uint64_t v5;

  -[NSMutableArray lastObject](self->_chartDataLRUCache, "lastObject");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      -[StockManager DeleteChartData:](self, "DeleteChartData:", v4);
      -[NSMutableArray lastObject](self->_chartDataLRUCache, "lastObject");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
    while (v5);
  }
}

- (void)clearCachedChartDataImageSets
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_chartDataLRUCache, "makeObjectsPerformSelector:", sel_clearAllImageSets);
}

- (BOOL)anyMarketOpen
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_stocksList;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "marketIsOpen", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_saveDataChangesWithStockDictionaries:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  self->_lastModifiedTime = v7;

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_lastModifiedTime);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKey:", v8, CFSTR("lastModified"));

  objc_msgSend(v10, "setObject:forKey:", v5, CFSTR("stocks"));
  objc_msgSend(v10, "synchronize");
  +[ExchangeManager sharedManager](ExchangeManager, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "saveChanges");

}

- (void)saveListChanges
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  void *v19;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v21;
  __CFNotificationCenter *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_stocksList, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = self->_stocksList;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v8), "archiveDictionary");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v6);
    }

    -[StockManager makeSyncableStockListFromList:](self, "makeSyncableStockListFromList:", v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v10, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v24;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v24 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "objectForKey:", CFSTR("symbol"), (_QWORD)v23);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v14);
    }

    -[NSUbiquitousKeyValueStore arrayForKey:](self->_syncedKVStore, "arrayForKey:", CFSTR("stocks"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18
      || (objc_msgSend(v18, "isEqual:", v12) & 1) == 0
      && (objc_msgSend(v19, "count")
       || (-[NSMutableArray isEqual:](self->_defaultListStockSymbols, "isEqual:", v11) & 1) == 0))
    {
      -[NSUbiquitousKeyValueStore setObject:forKey:](self->_syncedKVStore, "setObject:forKey:", v12, CFSTR("stocks"), (_QWORD)v23);
      -[NSUbiquitousKeyValueStore synchronize](self->_syncedKVStore, "synchronize");
    }
    -[StockManager _saveDataChangesWithStockDictionaries:](self, "_saveDataChangesWithStockDictionaries:", v3, (_QWORD)v23);
    if (self->_needRemoteAddNotification)
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)StockWasAddedDarwinNotification, 0, 0, 0);
      self->_needRemoteAddNotification = 0;
    }
    if (self->_needRemoteDeleteNotification)
    {
      v21 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v21, (CFNotificationName)StockWasDeletedDarwinNotification, 0, 0, 0);
      self->_needRemoteDeleteNotification = 0;
    }
    if (self->_needRemoteMoveNotification)
    {
      v22 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v22, (CFNotificationName)StockWasMovedDarwinNotification, 0, 0, 0);
      self->_needRemoteMoveNotification = 0;
    }

  }
}

- (void)saveDataChanges
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSMutableArray count](self->_stocksList, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_stocksList;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "archiveDictionary", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[StockManager _saveDataChangesWithStockDictionaries:](self, "_saveDataChangesWithStockDictionaries:", v3);
}

- (void)purgeTransientData
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_stocksList;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v9, "isTransient"))
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v6);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = v3;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        -[StockManager _removeStock:withRemoteNotification:](self, "_removeStock:withRemoteNotification:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), 0, (_QWORD)v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

}

- (void)_checkForAddedStocks
{
  void *v3;
  void *v4;
  void *v5;
  double lastModifiedTime;
  double v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  Stock *v18;
  void *v19;
  char v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastModified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    lastModifiedTime = self->_lastModifiedTime;
    objc_msgSend(v5, "doubleValue");
    if (lastModifiedTime < v7)
    {
      +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("stocks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v11)
        {
          v12 = v11;
          v19 = v9;
          v20 = 0;
          v13 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v22 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "objectForKey:", CFSTR("symbol"));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                if (v16)
                {
                  -[StockManager stockWithSymbol:](self, "stockWithSymbol:", v16);
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (v17)
                  {
                    v18 = (Stock *)v17;
                  }
                  else
                  {
                    v18 = -[Stock initWithDictionary:]([Stock alloc], "initWithDictionary:", v15);
                    if (v18)
                    {
                      -[StockManager _addStock:withRemoteNotification:](self, "_addStock:withRemoteNotification:", v18, 0);
                      v20 = 1;
                    }
                  }

                }
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v12);

          v9 = v19;
          if ((v20 & 1) == 0)
            goto LABEL_22;
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "postNotificationName:object:", StockListDidChangeNotification, 0);
        }

      }
LABEL_22:

    }
  }

}

- (void)_checkForDeletedStocks
{
  void *v3;
  void *v4;
  void *v5;
  double lastModifiedTime;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastModified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    lastModifiedTime = self->_lastModifiedTime;
    objc_msgSend(v5, "doubleValue");
    if (lastModifiedTime < v7)
    {
      v36 = v5;
      +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("stocks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v12 = v9;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v46;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v46 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v17, "objectForKey:", CFSTR("symbol"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                objc_msgSend(v10, "addObject:", v18);

            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
        }
        while (v14);
      }
      v35 = v12;

      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v19 = self->_stocksList;
      v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
            objc_msgSend(v24, "symbol", v35);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v10, "containsObject:", v25);

            if ((v26 & 1) == 0)
            {
              objc_msgSend(v24, "symbol");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v27);

            }
          }
          v21 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
        }
        while (v21);
      }

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v11;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v28);
            -[StockManager stockWithSymbol:](self, "stockWithSymbol:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * k), v35);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            -[StockManager _removeStock:withRemoteNotification:](self, "_removeStock:withRemoteNotification:", v33, 0);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v30);
      }

      if (objc_msgSend(v28, "count"))
      {
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "postNotificationName:object:", StockListDidChangeNotification, 0);

      }
      v5 = v36;
    }
  }

}

- (void)_checkForMovedStocks
{
  void *v3;
  void *v4;
  void *v5;
  double lastModifiedTime;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

  +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastModified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    lastModifiedTime = self->_lastModifiedTime;
    objc_msgSend(v5, "doubleValue");
    if (lastModifiedTime < v7)
    {
      +[StocksPreferences sharedPreferences](StocksPreferences, "sharedPreferences");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("stocks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v20 = v5;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v9, "count"));
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v16, "objectForKey:", CFSTR("symbol"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                if (v17)
                {
                  -[StockManager stockWithSymbol:](self, "stockWithSymbol:", v17);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v18)
                    objc_msgSend(v10, "addObject:", v18);

                }
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v13);
        }

        if ((-[NSMutableArray isEqual:](self->_stocksList, "isEqual:", v10) & 1) == 0)
        {
          -[NSMutableArray removeAllObjects](self->_stocksList, "removeAllObjects");
          -[NSMutableArray addObjectsFromArray:](self->_stocksList, "addObjectsFromArray:", v10);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "postNotificationName:object:", StockListDidChangeNotification, 0);

        }
        v5 = v20;
      }

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncedKVStore, 0);
  objc_storeStrong((id *)&self->_chartDataLRUCache, 0);
  objc_storeStrong((id *)&self->_stocksList, 0);
  objc_storeStrong((id *)&self->_defaultListStockSymbols, 0);
}

@end
