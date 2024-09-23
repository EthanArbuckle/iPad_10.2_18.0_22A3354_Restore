@implementation StockUpdateManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_3);
  return (id)sharedManager___stockUpdaterInstance;
}

void __35__StockUpdateManager_sharedManager__block_invoke()
{
  StockUpdateManager *v0;
  void *v1;

  v0 = objc_alloc_init(StockUpdateManager);
  v1 = (void *)sharedManager___stockUpdaterInstance;
  sharedManager___stockUpdaterInstance = (uint64_t)v0;

}

- (StockUpdateManager)init
{
  StockUpdateManager *v2;
  NSMutableArray *v3;
  NSMutableArray *activeUpdaters;
  NSMutableArray *v5;
  NSMutableArray *inactiveUpdaters;
  uint64_t v7;
  NSHashTable *updateObservers;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)StockUpdateManager;
  v2 = -[StockUpdateManager init](&v12, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    activeUpdaters = v2->_activeUpdaters;
    v2->_activeUpdaters = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    inactiveUpdaters = v2->_inactiveUpdaters;
    v2->_inactiveUpdaters = v5;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    updateObservers = v2->_updateObservers;
    v2->_updateObservers = (NSHashTable *)v7;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)stocksDidUpdateRemotely, CFSTR("StocksDidUpdateQuotesDarwin"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__stocksDidReload, CFSTR("StocksDidReloadFromDefaultsNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  -[StockUpdateManager reset](self, "reset");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("StocksDidUpdateQuotesDarwin"), 0);
  v4.receiver = self;
  v4.super_class = (Class)StockUpdateManager;
  -[StockUpdateManager dealloc](&v4, sel_dealloc);
}

- (void)stocksDidUpdateRemotely
{
  void *v3;

  if (!self->_postingRemoteUpdateNotification)
  {
    +[StockManager sharedManager](StockManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadStocksFromDefaults");

  }
  self->_postingRemoteUpdateNotification = 0;
}

- (void)addUpdateObserver:(id)a3
{
  -[NSHashTable addObject:](self->_updateObservers, "addObject:", a3);
}

- (void)removeUpdateObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_updateObservers, "removeObject:", a3);
}

- (void)_enumerateObserversRespondingToSelector:(SEL)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  SEL v11;

  v6 = a4;
  -[NSHashTable allObjects](self->_updateObservers, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __73__StockUpdateManager__enumerateObserversRespondingToSelector_usingBlock___block_invoke;
  v9[3] = &unk_24D74B878;
  v10 = v6;
  v11 = a3;
  v8 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

void __73__StockUpdateManager__enumerateObserversRespondingToSelector_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_stocksDidReload
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  +[StockManager sharedManager](StockManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stocksList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__StockUpdateManager__stocksDidReload__block_invoke;
  v6[3] = &unk_24D74B8A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[StockUpdateManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_stockUpdateManager_didUpdateStocks_updates_, v6);

}

uint64_t __38__StockUpdateManager__stocksDidReload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stockUpdateManager:didUpdateStocks:updates:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);
}

- (void)stockUpdater:(id)a3 didRequestUpdateForStocks:(id)a4 isComprehensive:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;

  v5 = a5;
  v7 = a4;
  v8 = 3;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  if (!v5)
    v8 = 1;
  v10[2] = __77__StockUpdateManager_stockUpdater_didRequestUpdateForStocks_isComprehensive___block_invoke;
  v10[3] = &unk_24D74B8C8;
  v10[4] = self;
  v11 = v7;
  v12 = v8;
  v9 = v7;
  -[StockUpdateManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_stockUpdateManager_didRequestUpdateForStocks_updates_, v10);

}

uint64_t __77__StockUpdateManager_stockUpdater_didRequestUpdateForStocks_isComprehensive___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "stockUpdateManager:didRequestUpdateForStocks:updates:", a1[4], a1[5], a1[6]);
}

- (void)stockUpdater:(id)a3 didUpdateStocks:(id)a4 isComprehensive:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  uint64_t v8;
  id v9;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v11[5];
  id v12;
  uint64_t v13;

  v5 = a5;
  v7 = a4;
  v8 = 3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  if (!v5)
    v8 = 1;
  v11[2] = __67__StockUpdateManager_stockUpdater_didUpdateStocks_isComprehensive___block_invoke;
  v11[3] = &unk_24D74B8C8;
  v11[4] = self;
  v12 = v7;
  v13 = v8;
  v9 = v7;
  -[StockUpdateManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_stockUpdateManager_didUpdateStocks_updates_, v11);
  if (!v5)
  {
    self->_postingRemoteUpdateNotification = 1;
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("StocksDidUpdateQuotesDarwin"), 0, 0, 1u);
  }

}

uint64_t __67__StockUpdateManager_stockUpdater_didUpdateStocks_isComprehensive___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "stockUpdateManager:didUpdateStocks:updates:", a1[4], a1[5], a1[6]);
}

- (void)stockUpdater:(id)a3 didFailWithError:(id)a4 whileUpdatingStocks:(id)a5 comprehensive:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint64_t v18;

  v6 = a6;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  v12 = 3;
  if (!v6)
    v12 = 1;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __86__StockUpdateManager_stockUpdater_didFailWithError_whileUpdatingStocks_comprehensive___block_invoke;
  v15[3] = &unk_24D74B8F0;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v18 = v12;
  v13 = v9;
  v14 = v11;
  -[StockUpdateManager _enumerateObserversRespondingToSelector:usingBlock:](self, "_enumerateObserversRespondingToSelector:usingBlock:", sel_stockUpdateManager_failedToUpdateStocks_updates_error_, v15);

}

uint64_t __86__StockUpdateManager_stockUpdater_didFailWithError_whileUpdatingStocks_comprehensive___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "stockUpdateManager:failedToUpdateStocks:updates:error:", a1[4], a1[5], a1[7], a1[6]);
}

- (void)resetUpdaters
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_activeUpdaters, "makeObjectsPerformSelector:", sel_cancel);
  -[NSMutableArray addObjectsFromArray:](self->_inactiveUpdaters, "addObjectsFromArray:", self->_activeUpdaters);
  -[NSMutableArray removeAllObjects](self->_activeUpdaters, "removeAllObjects");
}

- (id)availableStockUpdater
{
  void *v3;

  if (-[NSMutableArray count](self->_inactiveUpdaters, "count"))
  {
    -[NSMutableArray lastObject](self->_inactiveUpdaters, "lastObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeLastObject](self->_inactiveUpdaters, "removeLastObject");
  }
  else
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setDelegate:", self);
  }
  -[NSMutableArray addObject:](self->_activeUpdaters, "addObject:", v3);
  return v3;
}

- (BOOL)isLoading
{
  return -[NSMutableArray count](self->_activeUpdaters, "count") != 0;
}

- (BOOL)hadError
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
  v2 = self->_inactiveUpdaters;
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
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "hadError", (_QWORD)v7) & 1) != 0)
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

- (void)failWithError:(id)a3
{
  -[NSMutableArray makeObjectsPerformSelector:withObject:](self->_activeUpdaters, "makeObjectsPerformSelector:withObject:", sel_failWithError_, a3);
}

- (void)cancel
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_activeUpdaters, "makeObjectsPerformSelector:", sel_cancel);
  -[NSMutableArray makeObjectsPerformSelector:](self->_inactiveUpdaters, "makeObjectsPerformSelector:", sel_cancel);
}

- (void)reset
{
  -[NSMutableArray makeObjectsPerformSelector:](self->_activeUpdaters, "makeObjectsPerformSelector:", sel_cancelAndInvalidate);
  -[NSMutableArray makeObjectsPerformSelector:](self->_inactiveUpdaters, "makeObjectsPerformSelector:", sel_cancelAndInvalidate);
  -[NSMutableArray removeAllObjects](self->_activeUpdaters, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_inactiveUpdaters, "removeAllObjects");
}

- (void)updateStocksComprehensive:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  StocksLogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isNetworkReachable");
    v8 = "NO";
    if (v7)
      v8 = "YES";
    v12 = 136315138;
    v13 = v8;
    _os_log_impl(&dword_21736B000, v5, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStocksComprehensive (reachable: %s)", (uint8_t *)&v12, 0xCu);

  }
  if (objc_msgSend(v4, "count"))
  {
    +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isNetworkReachable");

    if (v10)
    {
      -[StockUpdateManager availableStockUpdater](self, "availableStockUpdater");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[StockUpdateManager _kickoffUpdater:forStocks:comprehensive:forceUpdate:completion:](self, "_kickoffUpdater:forStocks:comprehensive:forceUpdate:completion:", v11, v4, 1, 0, 0);

    }
  }

}

- (void)updateStockComprehensive:(id)a3
{
  -[StockUpdateManager updateStockComprehensive:withCompletion:](self, "updateStockComprehensive:withCompletion:", a3, 0);
}

- (void)updateStockComprehensive:(id)a3 withCompletion:(id)a4
{
  -[StockUpdateManager updateStockComprehensive:forced:withCompletion:](self, "updateStockComprehensive:forced:withCompletion:", a3, 0, a4);
}

- (void)updateStockComprehensive:(id)a3 forced:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  _BOOL4 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  const char *v42;
  _BYTE v43[128];
  uint64_t v44;

  v6 = a4;
  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (v8
    && (+[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isNetworkReachable"),
        v10,
        (v11 & 1) != 0))
  {
    v30 = v6;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = self->_activeUpdaters;
    v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          if (objc_msgSend(v17, "isComprehensive"))
          {
            objc_msgSend(v17, "requestStocks");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "containsObject:", v8);

            if (v19)
            {
              StocksLogForCategory(0);
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v8, "symbol");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v40 = v27;
                _os_log_impl(&dword_21736B000, v26, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStockComprehensive rolling update for %@ into existing update request", buf, 0xCu);

              }
              objc_msgSend(v17, "updateCompletionHandler");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v31[0] = MEMORY[0x24BDAC760];
              v31[1] = 3221225472;
              v31[2] = __69__StockUpdateManager_updateStockComprehensive_forced_withCompletion___block_invoke;
              v31[3] = &unk_24D74B918;
              v32 = v28;
              v33 = v9;
              v29 = v28;
              objc_msgSend(v17, "setUpdateCompletionHandler:", v31);

              goto LABEL_22;
            }
          }
        }
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v14)
          continue;
        break;
      }
    }

    -[StockUpdateManager availableStockUpdater](self, "availableStockUpdater");
    v12 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    StocksLogForCategory(0);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "symbol");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isNetworkReachable");
      v24 = "NO";
      if (v23)
        v24 = "YES";
      *(_DWORD *)buf = 138412546;
      v40 = v21;
      v41 = 2080;
      v42 = v24;
      _os_log_impl(&dword_21736B000, v20, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStockComprehensive: %@ (reachable: %s)", buf, 0x16u);

    }
    v38 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v38, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockUpdateManager _kickoffUpdater:forStocks:comprehensive:forceUpdate:completion:](self, "_kickoffUpdater:forStocks:comprehensive:forceUpdate:completion:", v12, v25, 1, v30, v9);

LABEL_22:
  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

void __69__StockUpdateManager_updateStockComprehensive_forced_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v5);
    v5 = v8;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
    v5 = v8;
  }

}

- (void)updateAllStocksBasic
{
  -[StockUpdateManager updateAllStocksBasicWithCompletion:](self, "updateAllStocksBasicWithCompletion:", 0);
}

- (void)updateAllStocksBasic:(id)a3 withCompletion:(id)a4
{
  -[StockUpdateManager _updateStocksBasic:forced:withCompletion:](self, "_updateStocksBasic:forced:withCompletion:", a3, 1, a4);
}

- (void)updateStockBasicWithCompletion:(id)a3 withCompletion:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[StockUpdateManager _updateStocksBasic:forced:withCompletion:](self, "_updateStocksBasic:forced:withCompletion:", v9, 1, v7, v10, v11);
}

- (void)updateAllStocksBasicWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[StockManager sharedManager](StockManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stocksList");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[StockUpdateManager _updateStocksBasic:forced:withCompletion:](self, "_updateStocksBasic:forced:withCompletion:", v6, 1, v4);
}

- (void)updateStaleStocksBasicWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[StockManager sharedManager](StockManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stocksList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexesOfObjectsPassingTest:", &__block_literal_global_41);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectsAtIndexes:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  StocksLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_21736B000, v9, OS_LOG_TYPE_DEFAULT, "#StockUpdater Found stale stocks for basic update: %@", (uint8_t *)&v10, 0xCu);
  }

  -[StockUpdateManager _updateStocksBasic:forced:withCompletion:](self, "_updateStocksBasic:forced:withCompletion:", v8, 0, v4);
}

uint64_t __59__StockUpdateManager_updateStaleStocksBasicWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isQuoteStale");
}

- (void)_updateStocksBasic:(id)a3 forced:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  void *v13;
  int v14;
  const char *v15;
  void *v16;
  int v17;
  const char *v18;
  uint64_t v19;

  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "count")
    && (+[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "isNetworkReachable"),
        v10,
        (v11 & 1) != 0))
  {
    StocksLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      +[NetPreferences sharedPreferences](NetPreferences, "sharedPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isNetworkReachable");
      v15 = "NO";
      if (v14)
        v15 = "YES";
      v17 = 136315138;
      v18 = v15;
      _os_log_impl(&dword_21736B000, v12, OS_LOG_TYPE_DEFAULT, "#StockUpdater updateStocksBasic (reachable: %s)", (uint8_t *)&v17, 0xCu);

    }
    -[StockUpdateManager availableStockUpdater](self, "availableStockUpdater");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[StockUpdateManager _kickoffUpdater:forStocks:comprehensive:forceUpdate:completion:](self, "_kickoffUpdater:forStocks:comprehensive:forceUpdate:completion:", v16, v8, 0, v6, v9);

  }
  else if (v9)
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);
  }

}

- (void)_kickoffUpdater:(id)a3 forStocks:(id)a4 comprehensive:(BOOL)a5 forceUpdate:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, void *);
  void *v19;
  StockUpdateManager *v20;
  id v21;
  id v22;
  id location;

  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_initWeak(&location, v12);
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __85__StockUpdateManager__kickoffUpdater_forStocks_comprehensive_forceUpdate_completion___block_invoke;
  v19 = &unk_24D74B980;
  v20 = self;
  objc_copyWeak(&v22, &location);
  v15 = v14;
  v21 = v15;
  objc_msgSend(v12, "setUpdateCompletionHandler:", &v16);
  objc_msgSend(v12, "_updateStocks:comprehensive:forceUpdate:", v13, v9, v8, v16, v17, v18, v19, v20);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

void __85__StockUpdateManager__kickoffUpdater_forStocks_comprehensive_forceUpdate_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  v8 = a3;
  v5 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v5, "_updaterDidCancelOrFinish:", WeakRetained);

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);

}

- (void)_updaterDidCancelOrFinish:(id)a3
{
  NSMutableArray *inactiveUpdaters;
  id v5;

  inactiveUpdaters = self->_inactiveUpdaters;
  v5 = a3;
  -[NSMutableArray addObject:](inactiveUpdaters, "addObject:", v5);
  -[NSMutableArray removeObject:](self->_activeUpdaters, "removeObject:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateObservers, 0);
  objc_storeStrong((id *)&self->_inactiveUpdaters, 0);
  objc_storeStrong((id *)&self->_activeUpdaters, 0);
}

@end
