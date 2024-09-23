@implementation SCWatchlist

- (SCWatchlist)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaultsProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SCWatchlist *v12;
  SCWatchlist *v13;
  uint64_t v14;
  NSHashTable *observers;
  SCKStartupQueue *v16;
  SCKStartupQueue *startupQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *callbackQueue;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCWatchlist;
  v12 = -[SCWatchlist init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v13->_metadataProvider, a4);
    objc_storeStrong((id *)&v13->_defaultsProvider, a5);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 517, 0);
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = -[SCKStartupQueue initWithDeferredStartup:]([SCKStartupQueue alloc], "initWithDeferredStartup:", 1);
    startupQueue = v13->_startupQueue;
    v13->_startupQueue = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("SCWatchlist.callback", v18);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(v9, "addObserver:forZone:", v13, CFSTR("Watchlist"));
    -[SCWatchlist _enqueueStartupSequence](v13, "_enqueueStartupSequence");
  }

  return v13;
}

- (SCWatchlist)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCWatchlistInlineDefaultsProvider *v11;
  SCWatchlist *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SCWatchlistInlineDefaultsProvider initWithDefaults:]([SCWatchlistInlineDefaultsProvider alloc], "initWithDefaults:", v8);

  v12 = -[SCWatchlist initWithDatabase:metadataProvider:defaultsProvider:](self, "initWithDatabase:metadataProvider:defaultsProvider:", v10, v9, v11);
  return v12;
}

- (void)fetchStocksWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCWatchlist startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke;
  v7[3] = &unk_24D74BB48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, void *);
  void *v8;
  uint64_t v9;
  id v10;

  v5 = MEMORY[0x24BDAC760];
  v6 = 3221225472;
  v7 = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_2;
  v8 = &unk_24D74BBE8;
  v2 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v3 = (void *)MEMORY[0x219A0B984](&v5);
  objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v3);

}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18[7];
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v18[0] = (id)MEMORY[0x24BDAC760];
    v18[1] = (id)3221225472;
    v18[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_3;
    v18[3] = &unk_24D74BB70;
    v7 = *(void **)(a1 + 40);
    v18[5] = *(id *)(a1 + 32);
    v18[6] = v7;
    v18[4] = v5;
    v8 = v7;
    __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_3(v18);
  }
  else
  {
    objc_msgSend(a2, "recordWithName:", CFSTR("watchlist"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptedValuesByKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("symbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    StocksLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_21736B000, v11, OS_LOG_TYPE_DEFAULT, "fetch stocks CK record ordered symbols: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "metadataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_10;
    v15[3] = &unk_24D74BBC0;
    v13 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = v13;
    v14 = v10;
    objc_msgSend(v12, "fetchMetadataForSymbols:completion:", v14, v15);

  }
}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_3(id *a1)
{
  NSObject *v2;
  id v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_21736B000, v2, OS_LOG_TYPE_DEFAULT, "fetch stocks read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_8;
    v5[3] = &unk_24D74BB48;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_10(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  StocksLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_21736B000, v7, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provider returned stocks: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_sortedStocks:withSymbolOrder:", v5, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  StocksLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_21736B000, v9, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provided ordered stocks: %@", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_11;
    block[3] = &unk_24D74BB98;
    v14 = *(id *)(a1 + 48);
    v12 = v8;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __41__SCWatchlist_fetchStocksWithCompletion___block_invoke_11(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addStock:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v5 = a4;
  if (v5)
  {
    -[SCWatchlist callbackQueue](self, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __35__SCWatchlist_addStock_completion___block_invoke;
    block[3] = &unk_24D74BC10;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __35__SCWatchlist_addStock_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeSymbol:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;

  v5 = a4;
  if (v5)
  {
    -[SCWatchlist callbackQueue](self, "callbackQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __39__SCWatchlist_removeSymbol_completion___block_invoke;
    block[3] = &unk_24D74BC10;
    v8 = v5;
    dispatch_async(v6, block);

  }
}

uint64_t __39__SCWatchlist_removeSymbol_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v6 = a5;
  if (v6)
  {
    -[SCWatchlist callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __52__SCWatchlist_reorderSymbol_afterSymbol_completion___block_invoke;
    block[3] = &unk_24D74BC10;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __52__SCWatchlist_reorderSymbol_afterSymbol_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 completion:(id)a5
{
  id v6;
  NSObject *v7;
  _QWORD block[4];
  id v9;

  v6 = a5;
  if (v6)
  {
    -[SCWatchlist callbackQueue](self, "callbackQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __51__SCWatchlist_replaceSymbol_withSymbol_completion___block_invoke;
    block[3] = &unk_24D74BC10;
    v9 = v6;
    dispatch_async(v7, block);

  }
}

uint64_t __51__SCWatchlist_replaceSymbol_withSymbol_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCWatchlist observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCWatchlist observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)synchronize
{
  id v2;

  -[SCWatchlist database](self, "database");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronize");

}

- (void)removeStock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a3, "symbol");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SCWatchlist removeSymbol:completion:](self, "removeSymbol:completion:", v7, v6);

}

- (void)reorderStock:(id)a3 toIndex:(unint64_t)a4 completion:(id)a5
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;

  v6 = a5;
  -[SCWatchlist startupQueue](self, "startupQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "executeAfterStartup:", &__block_literal_global_6);

  if (v6)
  {
    -[SCWatchlist callbackQueue](self, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__SCWatchlist_reorderStock_toIndex_completion___block_invoke_2;
    block[3] = &unk_24D74BC10;
    v10 = v6;
    dispatch_async(v8, block);

  }
}

uint64_t __47__SCWatchlist_reorderStock_toIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)zoneSchema
{
  SCKRecordFieldSchema *v2;
  void *v3;
  SCKRecordSchema *v4;
  SCKZoneSchema *v5;
  void *v6;
  SCKZoneSchema *v7;
  SCKRecordSchema *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v2 = -[SCKRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCKRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("symbols"), objc_opt_class(), 1, 1);
  v10[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SCKRecordSchema initWithRecordType:fieldSchemas:]([SCKRecordSchema alloc], "initWithRecordType:fieldSchemas:", CFSTR("Watchlist"), v3);
  v5 = [SCKZoneSchema alloc];
  v9 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCKZoneSchema initWithName:atomic:recordSchemas:](v5, "initWithName:atomic:recordSchemas:", CFSTR("Watchlist"), 1, v6);

  return v7;
}

+ (id)zoneMergeHandler
{
  return (id)objc_opt_new();
}

+ (id)supportedCommands
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  SCWatchlist *v23;

  v8 = a6;
  objc_msgSend(a5, "recordWithName:", CFSTR("watchlist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "recordWithName:", CFSTR("watchlist"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "encryptedValuesByKey");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("symbols"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "encryptedValuesByKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("symbols"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObjectsFromArray:", v12);
  objc_msgSend(v15, "addObjectsFromArray:", v14);
  -[SCWatchlist metadataProvider](self, "metadataProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "allObjects");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __46__SCWatchlist_database_didChangeZone_from_to___block_invoke;
  v20[3] = &unk_24D74BC60;
  v21 = v12;
  v22 = v14;
  v23 = self;
  v18 = v14;
  v19 = v12;
  objc_msgSend(v16, "fetchMetadataForSymbols:completion:", v17, v20);

}

void __46__SCWatchlist_database_didChangeZone_from_to___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SCWatchlistDiff *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD block[6];
  SCWatchlistDiff *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v10, "symbol");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sck_objectsForKeys:", *(_QWORD *)(a1 + 32));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sck_objectsForKeys:", *(_QWORD *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SCWatchlistDiff initWithOldStocks:newStocks:]([SCWatchlistDiff alloc], "initWithOldStocks:newStocks:", v12, v13);
  if (!-[SCWatchlistDiff isEmpty](v14, "isEmpty"))
  {
    v24 = v13;
    v25 = v12;
    v26 = v5;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "observers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "copy");

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v30 != v19)
            objc_enumerationMutation(v16);
          v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j);
          objc_msgSend(*(id *)(a1 + 48), "callbackQueue");
          v22 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __46__SCWatchlist_database_didChangeZone_from_to___block_invoke_2;
          block[3] = &unk_24D74BC38;
          v23 = *(_QWORD *)(a1 + 48);
          block[4] = v21;
          block[5] = v23;
          v28 = v14;
          dispatch_async(v22, block);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v18);
    }

    v12 = v25;
    v5 = v26;
    v13 = v24;
  }

}

uint64_t __46__SCWatchlist_database_didChangeZone_from_to___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlist:didChangeWithDiff:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)_sortedStocks:(id)a3 withSymbolOrder:(id)a4
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
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v13, "symbol");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v16 = v6;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v25 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
        objc_msgSend(v7, "objectForKeyedSubscript:", v21, (_QWORD)v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v15, "addObject:", v22);
          objc_msgSend(v7, "removeObjectForKey:", v21);
        }

      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v18);
  }

  return v15;
}

- (void)_enqueueStartupSequence
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[5];
  _QWORD v9[6];
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  -[SCWatchlist startupQueue](self, "startupQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke;
  v9[3] = &unk_24D74BCB0;
  v9[4] = self;
  v9[5] = v10;
  objc_msgSend(v3, "enqueueStartupBlock:", v9);

  -[SCWatchlist startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_24;
  v8[3] = &unk_24D74BD28;
  v8[4] = v10;
  objc_msgSend(v5, "enqueueStartupBlock:", v8);

  -[SCWatchlist startupQueue](self, "startupQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_36;
  v7[3] = &unk_24D74BDA0;
  v7[4] = self;
  v7[5] = v10;
  objc_msgSend(v6, "enqueueStartupBlock:", v7);

  _Block_object_dispose(v10, 8);
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_2;
  v7[3] = &unk_24D74BC88;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v7);

}

uint64_t __38__SCWatchlist__enqueueStartupSequence__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(a2, "recordWithName:", CFSTR("watchlist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    StocksLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21736B000, v4, OS_LOG_TYPE_DEFAULT, "skipping migration because the watchlist record already exists", v6, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_24(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void (**v9)(_QWORD);
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  void (**v13)(_QWORD);
  uint8_t buf[8];
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1888], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_3;
    v15[3] = &unk_24D74BCD8;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v16 = v7;
    v18 = v8;
    v17 = v4;
    v9 = (void (**)(_QWORD))MEMORY[0x219A0B984](v15);
    if (NSClassFromString(CFSTR("XCTest")))
    {
      StocksLogForCategory(4);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21736B000, v10, OS_LOG_TYPE_DEFAULT, "skipping KVS synchronization because we're running unit tests", buf, 2u);
      }

      v9[2](v9);
    }
    else
    {
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_34;
      v11[3] = &unk_24D74BD00;
      v12 = v7;
      v13 = v9;
      objc_msgSend(v12, "synchronizeWithCompletionHandler:", v11);

    }
  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  uint64_t v12;
  NSObject *v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "arrayForKey:", CFSTR("stocks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("symbol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  StocksLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v23 = objc_msgSend(v3, "count");
    v24 = 2112;
    v25 = v3;
    _os_log_impl(&dword_21736B000, v4, OS_LOG_TYPE_DEFAULT, "in the KVS we found %lu stocks to migrate: %@", buf, 0x16u);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  +[SCWatchlistDefaults defaultsHistoryForCurrentCountry](SCWatchlistDefaults, "defaultsHistoryForCurrentCountry", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "defaultSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToArray:", v3);

      if ((v11 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }

    StocksLogForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v16 = "skipping KVS migration because the contents of the KVS match a default set";
    goto LABEL_17;
  }
LABEL_11:

  v12 = objc_msgSend(v3, "count");
  StocksLogForCategory(4);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v14)
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v16 = "skipping KVS migration because the KVS is empty";
LABEL_17:
    _os_log_impl(&dword_21736B000, v13, OS_LOG_TYPE_DEFAULT, v16, buf, 2u);
LABEL_18:

    goto LABEL_19;
  }
  if (v14)
  {
    v15 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v23 = v15;
    _os_log_impl(&dword_21736B000, v13, OS_LOG_TYPE_DEFAULT, "migrating %lu stocks from KVS to watchlist", buf, 0xCu);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_19:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    StocksLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __38__SCWatchlist__enqueueStartupSequence__block_invoke_34_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "synchronize");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_36(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    StocksLogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21736B000, v5, OS_LOG_TYPE_DEFAULT, "attempting to fetch watchlist defaults", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "defaultsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_38;
    v7[3] = &unk_24D74BD78;
    v8 = v4;
    objc_msgSend(v6, "fetchWatchlistDefaultsWithCompletion:", v7);

  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_39;
    v10[3] = &unk_24D74BD50;
    v7 = *(_QWORD *)(a1 + 32);
    v10[4] = v6;
    v10[5] = v7;
    v8 = v6;
    __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_39((uint64_t)v10);

  }
  else
  {
    StocksLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v12 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_21736B000, v9, OS_LOG_TYPE_DEFAULT, "saving %lu default symbolss to watchlist", buf, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_39(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_39_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (SCKDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (SCWatchlistMetadataProviding)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metadataProvider, a3);
}

- (SCWatchlistDefaultsProviding)defaultsProvider
{
  return self->_defaultsProvider;
}

- (void)setDefaultsProvider:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsProvider, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (SCKStartupQueue)startupQueue
{
  return self->_startupQueue;
}

- (void)setStartupQueue:(id)a3
{
  objc_storeStrong((id *)&self->_startupQueue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_startupQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_defaultsProvider, 0);
  objc_storeStrong((id *)&self->_metadataProvider, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_34_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21736B000, a2, a3, "KVS synchronization failed but we'll migrate whatever's in there if non-empty (error was %{public}@", a5, a6, a7, a8, 2u);
}

void __38__SCWatchlist__enqueueStartupSequence__block_invoke_2_39_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_21736B000, a2, a3, "failed to fetch watchlist defaults with error: %{public}@", a5, a6, a7, a8, 2u);
}

@end
