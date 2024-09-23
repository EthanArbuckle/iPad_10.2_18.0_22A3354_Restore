@implementation SCWWatchlistManager

+ (id)zoneMergeHandler
{
  return (id)objc_opt_new();
}

+ (id)supportedCommands
{
  _QWORD v3[21];

  v3[20] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 20);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)zoneSchema
{
  SCWRecordFieldSchema *v2;
  SCWRecordFieldSchema *v3;
  void *v4;
  SCWRecordSchema *v5;
  SCWRecordFieldSchema *v6;
  void *v7;
  SCWRecordSchema *v8;
  SCWZoneSchema *v9;
  void *v10;
  SCWZoneSchema *v11;
  SCWRecordFieldSchema *v13;
  SCWRecordFieldSchema *v14;
  SCWRecordFieldSchema *v15;
  _QWORD v16[2];
  SCWRecordFieldSchema *v17;
  _QWORD v18[6];

  v18[5] = *MEMORY[0x1E0C80C00];
  v15 = -[SCWRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCWRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("symbols"), objc_opt_class(), 1, 1);
  v14 = -[SCWRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCWRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("name"), objc_opt_class(), 0, 1);
  v13 = -[SCWRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCWRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("sortState"), objc_opt_class(), 0, 0);
  v2 = -[SCWRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCWRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("sortOrderState"), objc_opt_class(), 0, 0);
  v3 = -[SCWRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCWRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("displayState"), objc_opt_class(), 0, 0);
  v18[0] = v15;
  v18[1] = v14;
  v18[2] = v13;
  v18[3] = v2;
  v18[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWRecordSchema initWithRecordType:fieldSchemas:]([SCWRecordSchema alloc], "initWithRecordType:fieldSchemas:", CFSTR("Watchlist"), v4);
  v6 = -[SCWRecordFieldSchema initWithName:valueClass:required:encrypted:]([SCWRecordFieldSchema alloc], "initWithName:valueClass:required:encrypted:", CFSTR("watchlistIDs"), objc_opt_class(), 1, 1);
  v17 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SCWRecordSchema initWithRecordType:fieldSchemas:]([SCWRecordSchema alloc], "initWithRecordType:fieldSchemas:", CFSTR("WatchlistOrder"), v7);
  v9 = [SCWZoneSchema alloc];
  v16[0] = v5;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SCWZoneSchema initWithName:atomic:version:recordSchemas:](v9, "initWithName:atomic:version:recordSchemas:", CFSTR("Watchlist"), 1, 1, v10);

  return v11;
}

- (SCWWatchlistManager)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaultsProvider:(id)a5
{
  id v9;
  id v10;
  id v11;
  SCWWatchlistManager *v12;
  SCWWatchlistManager *v13;
  uint64_t v14;
  NSHashTable *observers;
  SCWStartupQueue *v16;
  SCWStartupQueue *startupQueue;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *callbackQueue;
  objc_super v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)SCWWatchlistManager;
  v12 = -[SCWWatchlistManager init](&v22, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong((id *)&v13->_metadataProvider, a4);
    objc_storeStrong((id *)&v13->_defaultsProvider, a5);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v13->_observers;
    v13->_observers = (NSHashTable *)v14;

    v16 = -[SCWStartupQueue initWithDeferredStartup:]([SCWStartupQueue alloc], "initWithDeferredStartup:", 1);
    startupQueue = v13->_startupQueue;
    v13->_startupQueue = v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("SCWWatchlistManager.callback", v18);
    callbackQueue = v13->_callbackQueue;
    v13->_callbackQueue = (OS_dispatch_queue *)v19;

    objc_msgSend(v9, "addObserver:forZone:", v13, CFSTR("Watchlist"));
    -[SCWWatchlistManager _enqueueStartupSequence](v13, "_enqueueStartupSequence");
  }

  return v13;
}

- (SCWWatchlistManager)initWithDatabase:(id)a3 metadataProvider:(id)a4 defaults:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCWWatchlistInlineDefaultsProvider *v11;
  SCWWatchlistManager *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[SCWWatchlistInlineDefaultsProvider initWithDefaults:]([SCWWatchlistInlineDefaultsProvider alloc], "initWithDefaults:", v8);

  v12 = -[SCWWatchlistManager initWithDatabase:metadataProvider:defaultsProvider:](self, "initWithDatabase:metadataProvider:defaultsProvider:", v10, v9, v11);
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
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke;
  v7[3] = &unk_1E5AF1DE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke(uint64_t a1)
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

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_2;
  v8 = &unk_1E5AF27D0;
  v2 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v3 = _Block_copy(&v5);
  objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v3);

}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v18[0] = (id)MEMORY[0x1E0C809B0];
    v18[1] = (id)3221225472;
    v18[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_3;
    v18[3] = &unk_1E5AF2008;
    v7 = *(void **)(a1 + 40);
    v18[5] = *(id *)(a1 + 32);
    v18[6] = v7;
    v18[4] = v5;
    v8 = v7;
    __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_3(v18);
  }
  else
  {
    objc_msgSend(a2, "recordWithName:", CFSTR("watchlist"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("symbols"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    StocksLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1ABCEF000, v11, OS_LOG_TYPE_DEFAULT, "fetch stocks CK record ordered symbols: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "metadataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_24;
    v15[3] = &unk_1E5AF27A8;
    v13 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v17 = v13;
    v14 = v10;
    objc_msgSend(v12, "fetchMetadataForSymbols:completion:", v14, v15);

  }
}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_3(id *a1)
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

  v10 = *MEMORY[0x1E0C80C00];
  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "fetch stocks read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_22;
    v5[3] = &unk_1E5AF1DE8;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_24(uint64_t a1, void *a2, void *a3)
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

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  StocksLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1ABCEF000, v7, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provider returned stocks: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_sortedStocks:withSymbolOrder:", v5, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  StocksLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1ABCEF000, v9, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provided ordered stocks: %@", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_25;
    block[3] = &unk_1E5AF2780;
    v14 = *(id *)(a1 + 48);
    v12 = v8;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __49__SCWWatchlistManager_fetchStocksWithCompletion___block_invoke_25(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addStock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SCWWatchlistManager *v16;

  v6 = a3;
  v7 = a4;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43__SCWWatchlistManager_addStock_completion___block_invoke;
  v14[3] = &unk_1E5AF1C90;
  v10 = v6;
  v15 = v10;
  v16 = self;
  objc_msgSend(v8, "executeAfterStartup:", v14);

  if (v7)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __43__SCWWatchlistManager_addStock_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v13 = v7;
    dispatch_async(v11, block);

  }
}

void __43__SCWWatchlistManager_addStock_completion___block_invoke(uint64_t a1)
{
  SCWatchlistAddSymbolCommand *v2;
  void *v3;
  void *v4;
  SCWatchlistAddSymbolCommand *v5;

  v2 = [SCWatchlistAddSymbolCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "symbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWatchlistAddSymbolCommand initWithSymbol:](v2, "initWithSymbol:", v3);

  objc_msgSend(*(id *)(a1 + 40), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v5);

}

uint64_t __43__SCWWatchlistManager_addStock_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeSymbol:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SCWWatchlistManager *v16;

  v6 = a3;
  v7 = a4;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __47__SCWWatchlistManager_removeSymbol_completion___block_invoke;
  v14[3] = &unk_1E5AF1C90;
  v10 = v6;
  v15 = v10;
  v16 = self;
  objc_msgSend(v8, "executeAfterStartup:", v14);

  if (v7)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __47__SCWWatchlistManager_removeSymbol_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v13 = v7;
    dispatch_async(v11, block);

  }
}

void __47__SCWWatchlistManager_removeSymbol_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SCWatchlistRemoveSymbolCommand *v3;

  v3 = -[SCWatchlistRemoveSymbolCommand initWithSymbol:]([SCWatchlistRemoveSymbolCommand alloc], "initWithSymbol:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v3);

}

uint64_t __47__SCWWatchlistManager_removeSymbol_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SCWatchlistReorderSymbolCommand *v3;

  v3 = -[SCWatchlistReorderSymbolCommand initWithSymbol:precedingSymbol:]([SCWatchlistReorderSymbolCommand alloc], "initWithSymbol:precedingSymbol:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v3);

}

uint64_t __60__SCWWatchlistManager_reorderSymbol_afterSymbol_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SCWatchlistReplaceSymbolCommand *v3;

  v3 = -[SCWatchlistReplaceSymbolCommand initWithOldSymbol:replacementSymbol:]([SCWatchlistReplaceSymbolCommand alloc], "initWithOldSymbol:replacementSymbol:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v3);

}

uint64_t __59__SCWWatchlistManager_replaceSymbol_withSymbol_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchAllWatchlistsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke;
  v7[3] = &unk_1E5AF1DE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke(uint64_t a1)
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

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2;
  v8 = &unk_1E5AF27D0;
  v2 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v3 = _Block_copy(&v5);
  objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v3);

}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20[7];
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v20[0] = (id)MEMORY[0x1E0C809B0];
    v20[1] = (id)3221225472;
    v20[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_3;
    v20[3] = &unk_1E5AF2008;
    v7 = *(void **)(a1 + 40);
    v20[5] = *(id *)(a1 + 32);
    v20[6] = v7;
    v20[4] = v5;
    v8 = v7;
    __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_3(v20);
  }
  else
  {
    objc_msgSend(a2, "recordsOfType:", CFSTR("Watchlist"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2_34;
    v18[3] = &unk_1E5AF27F8;
    v11 = v9;
    v19 = v11;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v18);
    StocksLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl(&dword_1ABCEF000, v12, OS_LOG_TYPE_DEFAULT, "fetch watchlist list returned watchlists :%@", buf, 0xCu);
    }

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = v10;
      block[1] = 3221225472;
      block[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_37;
      block[3] = &unk_1E5AF2780;
      v17 = *(id *)(a1 + 40);
      v15 = v11;
      v16 = 0;
      dispatch_async(v13, block);

    }
  }

}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_3(id *a1)
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

  v10 = *MEMORY[0x1E0C80C00];
  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "fetch watchlist list read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_32;
    v5[3] = &unk_1E5AF1DE8;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_32(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_2_34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SCWWatchlist *v10;
  void *v11;
  void *v12;
  SCWWatchlist *v13;
  id v14;

  v3 = a2;
  objc_msgSend(v3, "encryptedValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("symbols"));
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "encryptedValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sortState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("sortOrderState"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("displayState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [SCWWatchlist alloc];
  objc_msgSend(v3, "recordID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "recordName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SCWWatchlist initWithIdentifier:name:symbols:sortState:sortOrderState:displayState:](v10, "initWithIdentifier:name:symbols:sortState:sortOrderState:displayState:", v12, v6, v14, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v13);
}

uint64_t __56__SCWWatchlistManager_fetchAllWatchlistsWithCompletion___block_invoke_37(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)fetchStocksFromWatchlist:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke;
  v11[3] = &unk_1E5AF2780;
  v12 = v6;
  v13 = v7;
  v11[4] = self;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "executeAfterStartup:", v11);

}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD aBlock[5];
  id v8;
  id v9;

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2;
  aBlock[3] = &unk_1E5AF2820;
  v2 = *(id *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v9 = v2;
  aBlock[4] = v3;
  v8 = v4;
  v5 = _Block_copy(aBlock);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v5);

}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29[7];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v29[0] = (id)MEMORY[0x1E0C809B0];
    v29[1] = (id)3221225472;
    v29[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3;
    v29[3] = &unk_1E5AF2008;
    v8 = a1[6];
    v9 = a1[4];
    v29[4] = v6;
    v29[5] = v9;
    v29[6] = v8;
    v10 = v8;
    __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3(v29);
  }
  else
  {
    objc_msgSend(a1[5], "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordWithName:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "encryptedValues");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("symbols"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      StocksLogForCategory(4);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(a1[5], "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[5], "identifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v31 = v15;
        v32 = 2114;
        v33 = v16;
        v34 = 2112;
        v35 = v13;
        _os_log_impl(&dword_1ABCEF000, v14, OS_LOG_TYPE_DEFAULT, "fetch stocks from watchlist name: %@, identifier: %{public}@, ordered symbols: %@", buf, 0x20u);

      }
      objc_msgSend(a1[4], "metadataProvider");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_41;
      v22[3] = &unk_1E5AF27A8;
      v22[4] = a1[4];
      v23 = v13;
      v24 = a1[6];
      objc_msgSend(v17, "fetchMetadataForSymbols:completion:", v23, v22);

    }
    else
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_39;
      v25[3] = &unk_1E5AF2008;
      v18 = a1[6];
      v19 = a1[4];
      v26 = a1[5];
      v27 = v19;
      v28 = v18;
      v20 = v18;
      v21 = v26;
      __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_39((uint64_t)v25);

    }
  }

}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3(id *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3_cold_1((uint64_t)a1, v2, v3);

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_38;
    v5[3] = &unk_1E5AF1DE8;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_39(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_39_cold_1(a1, v2);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "callbackQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_40;
    block[3] = &unk_1E5AF1DC0;
    v5 = *(id *)(a1 + 48);
    dispatch_async(v3, block);

  }
}

uint64_t __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_41(uint64_t a1, void *a2, void *a3)
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

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  StocksLogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1ABCEF000, v7, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provider returned stocks: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_sortedStocks:withSymbolOrder:", v5, *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  StocksLogForCategory(4);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1ABCEF000, v9, OS_LOG_TYPE_DEFAULT, "fetch stocks metadata provided ordered stocks: %@", buf, 0xCu);
  }

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_42;
    block[3] = &unk_1E5AF2780;
    v14 = *(id *)(a1 + 48);
    v12 = v8;
    v13 = v6;
    dispatch_async(v10, block);

  }
}

uint64_t __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_42(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)legacyWatchlistSortState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke;
  v7[3] = &unk_1E5AF1DE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke(uint64_t a1)
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

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_2;
  v8 = &unk_1E5AF27D0;
  v2 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v3 = _Block_copy(&v5);
  objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v3);

}

void __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17[7];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v17[0] = (id)MEMORY[0x1E0C809B0];
    v17[1] = (id)3221225472;
    v17[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_3;
    v17[3] = &unk_1E5AF2008;
    v7 = *(void **)(a1 + 40);
    v17[5] = *(id *)(a1 + 32);
    v17[6] = v7;
    v17[4] = v5;
    v8 = v7;
    __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_3(v17);
  }
  else
  {
    objc_msgSend(a2, "recordWithName:", CFSTR("watchlist"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("sortState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    StocksLogForCategory(4);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      _os_log_impl(&dword_1ABCEF000, v11, OS_LOG_TYPE_DEFAULT, "legacy watchlist has sortState=%@", buf, 0xCu);
    }

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v12 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_44;
      v13[3] = &unk_1E5AF2780;
      v16 = *(id *)(a1 + 40);
      v14 = v10;
      v15 = 0;
      dispatch_async(v12, v13);

    }
  }

}

void __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_3(id *a1)
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

  v10 = *MEMORY[0x1E0C80C00];
  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "legacy watchlist sort state read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_43;
    v5[3] = &unk_1E5AF1DE8;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_43(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __48__SCWWatchlistManager_legacyWatchlistSortState___block_invoke_44(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)migrateToDefaultWatchlist:(id)a3 sortState:(id)a4 sortOrderState:(id)a5 displayState:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[16];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  StocksLogForCategory(4);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABCEF000, v17, OS_LOG_TYPE_DEFAULT, "Start migrateToDefaultWatchlist", buf, 2u);
  }

  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke;
  v24[3] = &unk_1E5AF2870;
  v24[4] = self;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v28 = v15;
  v29 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  v23 = v16;
  objc_msgSend(v18, "executeAfterStartup:", v24);

}

void __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_2;
  v10 = &unk_1E5AF2848;
  v2 = *(id *)(a1 + 72);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v16 = v2;
  v11 = v3;
  v12 = v4;
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = *(id *)(a1 + 64);
  v5 = _Block_copy(&v7);
  objc_msgSend(*(id *)(a1 + 32), "database", v7, v8, v9, v10, v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v5);

}

void __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  SCWWatchlistAddNewWatchlistCommand *v17;
  void *v18;
  SCWWatchlistAddToWatchlistOrderCommand *v19;
  void *v20;
  SCWWatchlistAddToWatchlistOrderCommand *v21;
  void *v22;
  SCWWatchlist *v23;
  NSObject *v24;
  _QWORD block[4];
  SCWWatchlist *v26;
  id v27;
  id v28;
  id v29[7];
  const __CFString *v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v29[0] = (id)MEMORY[0x1E0C809B0];
    v29[1] = (id)3221225472;
    v29[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_3;
    v29[3] = &unk_1E5AF2008;
    v7 = *(void **)(a1 + 72);
    v8 = *(void **)(a1 + 32);
    v29[4] = v5;
    v29[5] = v8;
    v29[6] = v7;
    v9 = v7;
    __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_3(v29);
  }
  else
  {
    objc_msgSend(a2, "recordWithName:", CFSTR("watchlist"));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "encryptedValues");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("symbols"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    StocksLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(a1 + 48);
      v15 = *(_QWORD *)(a1 + 56);
      v16 = *(_QWORD *)(a1 + 64);
      *(_DWORD *)buf = 138544386;
      v32 = v13;
      v33 = 2112;
      v34 = v11;
      v35 = 2112;
      v36 = v14;
      v37 = 2112;
      v38 = v15;
      v39 = 2112;
      v40 = v16;
    }

    v17 = -[SCWWatchlistAddNewWatchlistCommand initWithName:identifier:sortState:sortOrderState:displayState:]([SCWWatchlistAddNewWatchlistCommand alloc], "initWithName:identifier:sortState:sortOrderState:displayState:", *(_QWORD *)(a1 + 40), CFSTR("watchlist"), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "database");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v17);

    v19 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
    v30 = CFSTR("watchlist");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SCWWatchlistAddToWatchlistOrderCommand initWithWatchlistIdentifiers:](v19, "initWithWatchlistIdentifiers:", v20);

    objc_msgSend(*(id *)(a1 + 32), "database");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v21);

    v23 = -[SCWWatchlist initWithIdentifier:name:symbols:sortState:sortOrderState:displayState:]([SCWWatchlist alloc], "initWithIdentifier:name:symbols:sortState:sortOrderState:displayState:", CFSTR("watchlist"), *(_QWORD *)(a1 + 40), v11, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    if (*(_QWORD *)(a1 + 72))
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v24 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_49;
      block[3] = &unk_1E5AF2780;
      v28 = *(id *)(a1 + 72);
      v26 = v23;
      v27 = 0;
      dispatch_async(v24, block);

    }
  }

}

void __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_3(id *a1)
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

  v10 = *MEMORY[0x1E0C80C00];
  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "migrate to default watchlist read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_45;
    v5[3] = &unk_1E5AF1DE8;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __98__SCWWatchlistManager_migrateToDefaultWatchlist_sortState_sortOrderState_displayState_completion___block_invoke_49(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addWatchlist:(id)a3 identifier:(id)a4 sortState:(id)a5 sortOrderState:(id)a6 displayState:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  _QWORD block[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  SCWWatchlistManager *v35;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke;
  v29[3] = &unk_1E5AF2898;
  v21 = v14;
  v30 = v21;
  v22 = v15;
  v31 = v22;
  v23 = v16;
  v32 = v23;
  v24 = v17;
  v33 = v24;
  v25 = v18;
  v34 = v25;
  v35 = self;
  objc_msgSend(v20, "executeAfterStartup:", v29);

  if (v19)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v28 = v19;
    dispatch_async(v26, block);

  }
}

void __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SCWWatchlistAddNewWatchlistCommand *v3;

  v3 = -[SCWWatchlistAddNewWatchlistCommand initWithName:identifier:sortState:sortOrderState:displayState:]([SCWWatchlistAddNewWatchlistCommand alloc], "initWithName:identifier:sortState:sortOrderState:displayState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 72), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v3);

}

uint64_t __96__SCWWatchlistManager_addWatchlist_identifier_sortState_sortOrderState_displayState_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeWatchlist:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SCWWatchlistManager *v16;

  v6 = a3;
  v7 = a4;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke;
  v14[3] = &unk_1E5AF1C90;
  v10 = v6;
  v15 = v10;
  v16 = self;
  objc_msgSend(v8, "executeAfterStartup:", v14);

  if (v7)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v13 = v7;
    dispatch_async(v11, block);

  }
}

void __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SCWWatchlistRemoveWatchlistCommand *v3;

  v3 = -[SCWWatchlistRemoveWatchlistCommand initWithWatchlistIdentifier:]([SCWWatchlistRemoveWatchlistCommand alloc], "initWithWatchlistIdentifier:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v3);

}

uint64_t __50__SCWWatchlistManager_removeWatchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)renameWatchlist:(id)a3 newName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke(uint64_t a1)
{
  void *v2;
  SCWWatchlistRenameWatchlistCommand *v3;

  v3 = -[SCWWatchlistRenameWatchlistCommand initWithWatchlistIdentifier:updatedName:]([SCWWatchlistRenameWatchlistCommand alloc], "initWithWatchlistIdentifier:updatedName:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v3);

}

uint64_t __58__SCWWatchlistManager_renameWatchlist_newName_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addStock:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke(id *a1)
{
  SCWWatchlistAddSymbolToWatchlistCommand *v2;
  void *v3;
  void *v4;
  void *v5;
  SCWWatchlistAddSymbolToWatchlistCommand *v6;

  v2 = [SCWWatchlistAddSymbolToWatchlistCommand alloc];
  objc_msgSend(a1[4], "symbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCWWatchlistAddSymbolToWatchlistCommand initWithSymbol:watchlistIdentifier:](v2, "initWithSymbol:watchlistIdentifier:", v3, v4);

  objc_msgSend(a1[6], "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v6);

}

uint64_t __53__SCWWatchlistManager_addStock_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeSymbol:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  NSObject *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  SCWWatchlistManager *v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "name");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v11 != CFSTR("watchlist"))
  {

    goto LABEL_8;
  }
  objc_msgSend(v9, "symbols");
  v12 = objc_claimAutoreleasedReturnValue();
  if ((-[NSObject containsObject:](v12, "containsObject:", v8) & 1) != 0)
  {
    objc_msgSend(v9, "symbols");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 != 1)
      goto LABEL_8;
    StocksLogForCategory(4);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      -[SCWWatchlistManager removeSymbol:watchlist:completion:].cold.1(v12, v15, v16);
  }

LABEL_8:
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke;
  v24[3] = &unk_1E5AF1F28;
  v19 = v8;
  v25 = v19;
  v20 = v9;
  v26 = v20;
  v27 = self;
  objc_msgSend(v17, "executeAfterStartup:", v24);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke_2;
    v22[3] = &unk_1E5AF1DC0;
    v23 = v10;
    dispatch_async(v21, v22);

  }
}

void __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistRemoveSymbolFromWatchlistCommand *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  SCWWatchlistRemoveSymbolFromWatchlistCommand *v6;

  v2 = [SCWWatchlistRemoveSymbolFromWatchlistCommand alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCWWatchlistRemoveSymbolFromWatchlistCommand initWithSymbol:watchlistIdentifier:](v2, "initWithSymbol:watchlistIdentifier:", v3, v4);

  objc_msgSend(*(id *)(a1 + 48), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v6);

}

uint64_t __57__SCWWatchlistManager_removeSymbol_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reorderSymbol:(id)a3 afterSymbol:(id)a4 watchlist:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  SCWWatchlistManager *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke;
  v22[3] = &unk_1E5AF28C0;
  v16 = v10;
  v23 = v16;
  v17 = v11;
  v24 = v17;
  v18 = v12;
  v25 = v18;
  v26 = self;
  objc_msgSend(v14, "executeAfterStartup:", v22);

  if (v13)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v21 = v13;
    dispatch_async(v19, block);

  }
}

void __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistReorderSymbolInWatchlistCommand *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  SCWWatchlistReorderSymbolInWatchlistCommand *v7;

  v2 = [SCWWatchlistReorderSymbolInWatchlistCommand alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCWWatchlistReorderSymbolInWatchlistCommand initWithSymbol:precedingSymbol:watchlistIdentifier:](v2, "initWithSymbol:precedingSymbol:watchlistIdentifier:", v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 56), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v7);

}

uint64_t __70__SCWWatchlistManager_reorderSymbol_afterSymbol_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reorderSymbols:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistReorderAllSymbolsInWatchlistCommand *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  SCWWatchlistReorderAllSymbolsInWatchlistCommand *v6;

  v2 = [SCWWatchlistReorderAllSymbolsInWatchlistCommand alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCWWatchlistReorderAllSymbolsInWatchlistCommand initWithSymbols:watchlistIdentifier:](v2, "initWithSymbols:watchlistIdentifier:", v3, v4);

  objc_msgSend(*(id *)(a1 + 48), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v6);

}

uint64_t __59__SCWWatchlistManager_reorderSymbols_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)replaceSymbol:(id)a3 withSymbol:(id)a4 watchlist:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  SCWWatchlistManager *v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke;
  v22[3] = &unk_1E5AF28C0;
  v16 = v10;
  v23 = v16;
  v17 = v11;
  v24 = v17;
  v18 = v12;
  v25 = v18;
  v26 = self;
  objc_msgSend(v14, "executeAfterStartup:", v22);

  if (v13)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v19 = objc_claimAutoreleasedReturnValue();
    block[0] = v15;
    block[1] = 3221225472;
    block[2] = __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v21 = v13;
    dispatch_async(v19, block);

  }
}

void __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistReplaceSymbolInWatchlistCommand *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  SCWWatchlistReplaceSymbolInWatchlistCommand *v7;

  v2 = [SCWWatchlistReplaceSymbolInWatchlistCommand alloc];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SCWWatchlistReplaceSymbolInWatchlistCommand initWithOldSymbol:replacementSymbol:watchlistIdentifier:](v2, "initWithOldSymbol:replacementSymbol:watchlistIdentifier:", v3, v4, v5);

  objc_msgSend(*(id *)(a1 + 56), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v7);

}

uint64_t __69__SCWWatchlistManager_replaceSymbol_withSymbol_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateSortState:(id)a3 newSortOrderState:(id)a4 newDisplayState:(id)a5 watchlist:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  SCWWatchlistManager *v31;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke;
  v26[3] = &unk_1E5AF2688;
  v19 = v15;
  v27 = v19;
  v20 = v12;
  v28 = v20;
  v21 = v13;
  v29 = v21;
  v22 = v14;
  v30 = v22;
  v31 = self;
  objc_msgSend(v17, "executeAfterStartup:", v26);

  if (v16)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v23 = objc_claimAutoreleasedReturnValue();
    v24[0] = v18;
    v24[1] = 3221225472;
    v24[2] = __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke_2;
    v24[3] = &unk_1E5AF1DC0;
    v25 = v16;
    dispatch_async(v23, v24);

  }
}

void __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistUpdateSortStateInWatchlistCommand *v2;
  void *v3;
  void *v4;
  SCWWatchlistUpdateSortStateInWatchlistCommand *v5;

  v2 = [SCWWatchlistUpdateSortStateInWatchlistCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWWatchlistUpdateSortStateInWatchlistCommand initWithWatchlistIdentifier:sortState:sortOrderState:displayState:](v2, "initWithWatchlistIdentifier:sortState:sortOrderState:displayState:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_msgSend(*(id *)(a1 + 64), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v5);

}

uint64_t __94__SCWWatchlistManager_updateSortState_newSortOrderState_newDisplayState_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)updateDisplayState:(id)a3 watchlist:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v9;
  v19 = v13;
  v14 = v8;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistUpdateDisplayStateInWatchlistCommand *v2;
  void *v3;
  void *v4;
  SCWWatchlistUpdateDisplayStateInWatchlistCommand *v5;

  v2 = [SCWWatchlistUpdateDisplayStateInWatchlistCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWWatchlistUpdateDisplayStateInWatchlistCommand initWithWatchlistIdentifier:displayState:](v2, "initWithWatchlistIdentifier:displayState:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v5);

}

uint64_t __63__SCWWatchlistManager_updateDisplayState_watchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)fetchWatchlistOrderWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke;
  v7[3] = &unk_1E5AF1DE8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "executeAfterStartup:", v7);

}

void __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke(uint64_t a1)
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

  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_2;
  v8 = &unk_1E5AF27D0;
  v2 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = v2;
  v3 = _Block_copy(&v5);
  objc_msgSend(*(id *)(a1 + 32), "database", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v3);

}

void __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20[7];
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v20[0] = (id)MEMORY[0x1E0C809B0];
    v20[1] = (id)3221225472;
    v20[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_3;
    v20[3] = &unk_1E5AF2008;
    v7 = *(void **)(a1 + 40);
    v20[5] = *(id *)(a1 + 32);
    v20[6] = v7;
    v20[4] = v5;
    v8 = v7;
    __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_3(v20);
  }
  else
  {
    objc_msgSend(a2, "recordWithName:", CFSTR("watchlistorder"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encryptedValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("watchlistIDs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    StocksLogForCategory(4);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v13;
      _os_log_impl(&dword_1ABCEF000, v14, OS_LOG_TYPE_DEFAULT, "fetch watchlist order returned with watchlistIDs: %@", buf, 0xCu);
    }

    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(*(id *)(a1 + 32), "callbackQueue");
      v15 = objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_60;
      v16[3] = &unk_1E5AF2780;
      v19 = *(id *)(a1 + 40);
      v17 = v13;
      v18 = 0;
      dispatch_async(v15, v16);

    }
  }

}

void __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_3(id *a1)
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

  v10 = *MEMORY[0x1E0C80C00];
  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1ABCEF000, v2, OS_LOG_TYPE_DEFAULT, "fetch watchlist order read zone error: %@", buf, 0xCu);
  }

  if (a1[6])
  {
    objc_msgSend(a1[5], "callbackQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_59;
    v5[3] = &unk_1E5AF1DE8;
    v7 = a1[6];
    v6 = a1[4];
    dispatch_async(v4, v5);

  }
}

uint64_t __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_59(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __57__SCWWatchlistManager_fetchWatchlistOrderWithCompletion___block_invoke_60(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)addWatchlistToWatchlistOrder:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SCWWatchlistManager *v16;

  v6 = a3;
  v7 = a4;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke;
  v14[3] = &unk_1E5AF1C90;
  v10 = v6;
  v15 = v10;
  v16 = self;
  objc_msgSend(v8, "executeAfterStartup:", v14);

  if (v7)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v13 = v7;
    dispatch_async(v11, block);

  }
}

void __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistAddToWatchlistOrderCommand *v2;
  void *v3;
  void *v4;
  SCWWatchlistAddToWatchlistOrderCommand *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWWatchlistAddToWatchlistOrderCommand initWithWatchlistIdentifiers:](v2, "initWithWatchlistIdentifiers:", v4);

  objc_msgSend(*(id *)(a1 + 40), "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v5);

}

uint64_t __63__SCWWatchlistManager_addWatchlistToWatchlistOrder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeWatchlistFromWatchlistOrder:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  _QWORD block[4];
  id v13;
  _QWORD v14[4];
  id v15;
  SCWWatchlistManager *v16;

  v6 = a3;
  v7 = a4;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke;
  v14[3] = &unk_1E5AF1C90;
  v10 = v6;
  v15 = v10;
  v16 = self;
  objc_msgSend(v8, "executeAfterStartup:", v14);

  if (v7)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke_2;
    block[3] = &unk_1E5AF1DC0;
    v13 = v7;
    dispatch_async(v11, block);

  }
}

void __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke(uint64_t a1)
{
  SCWWatchlistRemoveFromWatchlistOrderCommand *v2;
  void *v3;
  void *v4;
  SCWWatchlistRemoveFromWatchlistOrderCommand *v5;

  v2 = [SCWWatchlistRemoveFromWatchlistOrderCommand alloc];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWWatchlistRemoveFromWatchlistOrderCommand initWithWatchlistIdentifier:](v2, "initWithWatchlistIdentifier:", v3);

  objc_msgSend(*(id *)(a1 + 40), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v5);

}

uint64_t __68__SCWWatchlistManager_removeWatchlistFromWatchlistOrder_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)reorderWatchlist:(id)a3 afterWatchlist:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  SCWWatchlistManager *v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke;
  v18[3] = &unk_1E5AF1F28;
  v13 = v8;
  v19 = v13;
  v14 = v9;
  v20 = v14;
  v21 = self;
  objc_msgSend(v11, "executeAfterStartup:", v18);

  if (v10)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke_2;
    v16[3] = &unk_1E5AF1DC0;
    v17 = v10;
    dispatch_async(v15, v16);

  }
}

void __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke(id *a1)
{
  SCWatchlistReorderWatchlistCommand *v2;
  void *v3;
  void *v4;
  void *v5;
  SCWatchlistReorderWatchlistCommand *v6;

  v2 = [SCWatchlistReorderWatchlistCommand alloc];
  objc_msgSend(a1[4], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCWatchlistReorderWatchlistCommand initWithWatchlistIdentifier:precedingWatchlistIdentifier:](v2, "initWithWatchlistIdentifier:precedingWatchlistIdentifier:", v3, v4);

  objc_msgSend(a1[6], "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v6);

}

uint64_t __66__SCWWatchlistManager_reorderWatchlist_afterWatchlist_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCWWatchlistManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCWWatchlistManager observers](self, "observers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)synchronize
{
  id v2;

  -[SCWWatchlistManager database](self, "database");
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
  -[SCWWatchlistManager removeSymbol:completion:](self, "removeSymbol:completion:", v7, v6);

}

- (void)reorderStock:(id)a3 toIndex:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  SCWWatchlistManager *v18;
  unint64_t v19;

  v8 = a3;
  v9 = a5;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke;
  v16[3] = &unk_1E5AF28E8;
  v12 = v8;
  v18 = self;
  v19 = a4;
  v17 = v12;
  objc_msgSend(v10, "executeAfterStartup:", v16);

  if (v9)
  {
    -[SCWWatchlistManager callbackQueue](self, "callbackQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke_2;
    v14[3] = &unk_1E5AF1DC0;
    v15 = v9;
    dispatch_async(v13, v14);

  }
}

void __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke(uint64_t a1)
{
  SCWatchlistReorderSymbol2Command *v2;
  void *v3;
  void *v4;
  SCWatchlistReorderSymbol2Command *v5;

  v2 = [SCWatchlistReorderSymbol2Command alloc];
  objc_msgSend(*(id *)(a1 + 32), "symbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SCWatchlistReorderSymbol2Command initWithSymbol:toIndex:](v2, "initWithSymbol:toIndex:", v3, *(_QWORD *)(a1 + 48));

  objc_msgSend(*(id *)(a1 + 40), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v5);

}

uint64_t __55__SCWWatchlistManager_reorderStock_toIndex_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)database:(id)a3 didChangeZone:(id)a4 from:(id)a5 to:(id)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  SCWWatchlistDiff *v52;
  BOOL v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t m;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  SCWWatchlistOrderDiff *v77;
  BOOL v78;
  _BOOL4 v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t n;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  void *v90;
  void *v91;
  SCWWatchlistManager *v92;
  id obj;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  NSObject *v106;
  void *v107;
  unint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  os_log_t log;
  NSObject *loga;
  _QWORD v117[6];
  SCWWatchlistOrderDiff *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _QWORD block[6];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint8_t v129;
  char v130[15];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  _BYTE v143[128];
  uint8_t v144[128];
  uint8_t buf[4];
  unint64_t v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  void *v150;
  __int16 v151;
  void *v152;
  __int16 v153;
  void *v154;
  __int16 v155;
  uint64_t v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  os_log_t v160;
  __int16 v161;
  void *v162;
  __int16 v163;
  void *v164;
  _BYTE v165[128];
  _BYTE v166[128];
  _BYTE v167[128];
  uint64_t v168;

  v168 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v96 = a5;
  v95 = a6;
  StocksLogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v146 = (unint64_t)v9;
    _os_log_impl(&dword_1ABCEF000, v10, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager received change in database for zone: %@", buf, 0xCu);
  }
  v91 = v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = 0u;
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  objc_msgSend(v96, "recordsOfType:", CFSTR("Watchlist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v139, v167, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v140;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v140 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v139 + 1) + 8 * i), "recordID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "recordName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v18);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v139, v167, 16);
    }
    while (v14);
  }

  v137 = 0u;
  v138 = 0u;
  v135 = 0u;
  v136 = 0u;
  objc_msgSend(v95, "recordsOfType:", CFSTR("Watchlist"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v135, v166, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v136;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v136 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v135 + 1) + 8 * j), "recordID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "recordName");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v25);

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v135, v166, 16);
    }
    while (v21);
  }
  v92 = self;

  v133 = 0u;
  v134 = 0u;
  v131 = 0u;
  v132 = 0u;
  v90 = v11;
  objc_msgSend(v11, "allObjects");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v165, 16);
  if (v97)
  {
    v94 = *(_QWORD *)v132;
    do
    {
      for (k = 0; k != v97; ++k)
      {
        if (*(_QWORD *)v132 != v94)
          objc_enumerationMutation(obj);
        v27 = *(_QWORD *)(*((_QWORD *)&v131 + 1) + 8 * k);
        objc_msgSend(v96, "recordWithName:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = v27;
        objc_msgSend(v95, "recordWithName:", v27);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "encryptedValues");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("name"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "encryptedValues");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("name"));
        v33 = objc_claimAutoreleasedReturnValue();

        v108 = (unint64_t)v31;
        v113 = v33;
        if (objc_msgSend(v31, "compare:", v33))
          v34 = (void *)v33;
        else
          v34 = 0;
        v35 = v34;
        objc_msgSend(v28, "encryptedValues");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("symbols"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "encryptedValues");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("symbols"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sortState"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("sortState"));
        v40 = objc_claimAutoreleasedReturnValue();
        v111 = v39;
        LODWORD(v38) = objc_msgSend(v39, "intValue");
        log = v40;
        if ((_DWORD)v38 == -[NSObject intValue](v40, "intValue"))
          v41 = 0;
        else
          v41 = v40;
        v42 = v41;
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("sortOrderState"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("sortOrderState"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = v43;
        v45 = objc_msgSend(v43, "intValue");
        v102 = v44;
        if (v45 == objc_msgSend(v44, "intValue"))
          v46 = 0;
        else
          v46 = v44;
        v47 = v46;
        v103 = v28;
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("displayState"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = v29;
        objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("displayState"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v109 = v48;
        LODWORD(v48) = objc_msgSend(v48, "intValue");
        if ((_DWORD)v48 == objc_msgSend(v49, "intValue"))
          v50 = 0;
        else
          v50 = v49;
        v51 = v50;
        v106 = v42;
        v107 = v35;
        v104 = v47;
        v52 = -[SCWWatchlistDiff initWithOldSymbols:newSymbols:updatedName:updatedSortState:updatedSortOrderState:updatedDisplayState:]([SCWWatchlistDiff alloc], "initWithOldSymbols:newSymbols:updatedName:updatedSortState:updatedSortOrderState:updatedDisplayState:", v37, v100, v35, v42, v47, v51);
        v53 = -[SCWWatchlistDiff isEmpty](v52, "isEmpty");
        StocksLogForCategory(4);
        v54 = objc_claimAutoreleasedReturnValue();
        v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
        if (v53)
        {
          v56 = (void *)v108;
          if (v55)
          {
            *(_DWORD *)buf = 138412290;
            v146 = v108;
            _os_log_impl(&dword_1ABCEF000, v54, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistDiff is empty for watchlistName: %@", buf, 0xCu);
          }

          v57 = (void *)v113;
          v58 = v105;
          v60 = v102;
          v59 = v103;
        }
        else
        {
          v56 = (void *)v108;
          v58 = v105;
          v60 = v102;
          if (v55)
          {
            *(_DWORD *)buf = 138414594;
            v146 = v108;
            v147 = 2112;
            v148 = v37;
            v149 = 2112;
            v150 = v111;
            v151 = 2112;
            v152 = v105;
            v153 = 2112;
            v154 = v109;
            v155 = 2112;
            v156 = v113;
            v157 = 2112;
            v158 = v100;
            v159 = 2112;
            v160 = log;
            v161 = 2112;
            v162 = v102;
            v163 = 2112;
            v164 = v49;
            _os_log_impl(&dword_1ABCEF000, v54, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistDiff [watchlistOldName: %@ oldOrderedSymbols: %@ watchlistOldSortState: %@ watchlistOldSortOrderState: %@ watchlistOldDisplayState: %@], [watchlistNewName: %@  newOrderedSymbols: %@ watchlistNewSortState: %@ watchlistNewSortOrderState: %@ watchlistNewDisplayState: %@]", buf, 0x66u);
          }

          v57 = (void *)v113;
          v59 = v103;
          if (!(v108 | v113) && !objc_msgSend(v100, "count") && !log && !v102 && !v49)
          {
            StocksLogForCategory(4);
            v61 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT))
              -[SCWWatchlistManager database:didChangeZone:from:to:].cold.1(&v129, v130, v61);

            v57 = (void *)v113;
          }
          objc_msgSend(v98, "setObject:forKey:", v52, v99);
        }

      }
      v97 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v131, v165, 16);
    }
    while (v97);
  }

  if (objc_msgSend(v98, "count"))
  {
    v127 = 0u;
    v128 = 0u;
    v125 = 0u;
    v126 = 0u;
    -[SCWWatchlistManager observers](v92, "observers");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = (void *)objc_msgSend(v62, "copy");

    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v125, v144, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v126;
      v67 = MEMORY[0x1E0C809B0];
      do
      {
        for (m = 0; m != v65; ++m)
        {
          if (*(_QWORD *)v126 != v66)
            objc_enumerationMutation(v63);
          v69 = *(_QWORD *)(*((_QWORD *)&v125 + 1) + 8 * m);
          -[SCWWatchlistManager callbackQueue](v92, "callbackQueue");
          v70 = objc_claimAutoreleasedReturnValue();
          block[0] = v67;
          block[1] = 3221225472;
          block[2] = __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke;
          block[3] = &unk_1E5AF1F28;
          block[4] = v69;
          block[5] = v92;
          v124 = v98;
          dispatch_async(v70, block);

        }
        v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v125, v144, 16);
      }
      while (v65);
    }

  }
  objc_msgSend(v96, "recordWithName:", CFSTR("watchlistorder"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v95, "recordWithName:", CFSTR("watchlistorder"));
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "encryptedValues");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "objectForKeyedSubscript:", CFSTR("watchlistIDs"));
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v72, "encryptedValues");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("watchlistIDs"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();

  v77 = -[SCWWatchlistOrderDiff initWithOldWatchlistIDs:newWatchlistIDs:]([SCWWatchlistOrderDiff alloc], "initWithOldWatchlistIDs:newWatchlistIDs:", v74, v76);
  v78 = -[SCWWatchlistOrderDiff isEmpty](v77, "isEmpty");
  StocksLogForCategory(4);
  loga = objc_claimAutoreleasedReturnValue();
  v79 = os_log_type_enabled(loga, OS_LOG_TYPE_DEFAULT);
  if (v78)
  {
    if (v79)
    {
      *(_DWORD *)buf = 138412290;
      v146 = (unint64_t)v74;
      _os_log_impl(&dword_1ABCEF000, loga, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistOrderDiff is empty oldWatchlistOrder: %@", buf, 0xCu);
    }
LABEL_73:
    v89 = v90;
    goto LABEL_74;
  }
  if (v79)
  {
    *(_DWORD *)buf = 138412546;
    v146 = (unint64_t)v74;
    v147 = 2112;
    v148 = v76;
    _os_log_impl(&dword_1ABCEF000, loga, OS_LOG_TYPE_DEFAULT, "SCWWatchlistManager watchlistOrderDiff oldWatchlistOrder: %@ newWatchlistOrder: %@", buf, 0x16u);
  }

  v121 = 0u;
  v122 = 0u;
  v119 = 0u;
  v120 = 0u;
  -[SCWWatchlistManager observers](v92, "observers");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "copy");

  loga = v81;
  v82 = -[NSObject countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
  if (!v82)
    goto LABEL_73;
  v83 = v82;
  v110 = v76;
  v112 = v74;
  v114 = v71;
  v84 = *(_QWORD *)v120;
  v85 = MEMORY[0x1E0C809B0];
  do
  {
    for (n = 0; n != v83; ++n)
    {
      if (*(_QWORD *)v120 != v84)
        objc_enumerationMutation(v81);
      v87 = *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * n);
      -[SCWWatchlistManager callbackQueue](v92, "callbackQueue");
      v88 = objc_claimAutoreleasedReturnValue();
      v117[0] = v85;
      v117[1] = 3221225472;
      v117[2] = __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke_76;
      v117[3] = &unk_1E5AF1F28;
      v117[4] = v87;
      v117[5] = v92;
      v118 = v77;
      dispatch_async(v88, v117);

    }
    v83 = -[NSObject countByEnumeratingWithState:objects:count:](v81, "countByEnumeratingWithState:objects:count:", &v119, v143, 16);
  }
  while (v83);
  v89 = v90;
  v71 = v114;
  v76 = v110;
  v74 = v112;
LABEL_74:

}

uint64_t __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlistManager:didChangeInWatchlist:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __54__SCWWatchlistManager_database_didChangeZone_from_to___block_invoke_76(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "watchlistManager:didChangeInWatchlistOrder:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
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

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
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

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
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
  _QWORD v8[6];
  _QWORD v9[6];
  _QWORD v10[3];
  char v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 1;
  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke;
  v9[3] = &unk_1E5AF2938;
  v9[4] = self;
  v9[5] = v10;
  objc_msgSend(v3, "enqueueStartupBlock:", v9);

  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_78;
  v8[3] = &unk_1E5AF29B0;
  v8[4] = self;
  v8[5] = v10;
  objc_msgSend(v5, "enqueueStartupBlock:", v8);

  -[SCWWatchlistManager startupQueue](self, "startupQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_90;
  v7[3] = &unk_1E5AF29B0;
  v7[4] = self;
  v7[5] = v10;
  objc_msgSend(v6, "enqueueStartupBlock:", v7);

  _Block_object_dispose(v10, 8);
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke(uint64_t a1, void *a2)
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
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2;
  v7[3] = &unk_1E5AF2910;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "readContentsOfZone:withBlock:", CFSTR("Watchlist"), v7);

}

uint64_t __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2(uint64_t a1, void *a2)
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
      _os_log_impl(&dword_1ABCEF000, v4, OS_LOG_TYPE_DEFAULT, "skipping migration because the watchlist record already exists", v6, 2u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_78(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  void (**v14)(_QWORD);
  uint8_t buf[16];
  _QWORD aBlock[4];
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3A38], "defaultStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_3;
    aBlock[3] = &unk_1E5AF2960;
    v7 = v5;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v17 = v7;
    v18 = v8;
    v20 = v9;
    v19 = v4;
    v10 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (NSClassFromString(CFSTR("XCTest")))
    {
      StocksLogForCategory(4);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1ABCEF000, v11, OS_LOG_TYPE_DEFAULT, "skipping KVS synchronization because we're running unit tests", buf, 2u);
      }

      v10[2](v10);
    }
    else
    {
      v12[0] = v6;
      v12[1] = 3221225472;
      v12[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_88;
      v12[3] = &unk_1E5AF2988;
      v13 = v7;
      v14 = v10;
      objc_msgSend(v13, "synchronizeWithCompletionHandler:", v12);

    }
  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_3(uint64_t a1)
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
  SCWatchlistAddDefaultSymbolsCommand *v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  SCWWatchlistAddToWatchlistOrderCommand *v17;
  void *v18;
  SCWWatchlistAddToWatchlistOrderCommand *v19;
  void *v20;
  const char *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "arrayForKey:", CFSTR("stocks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForKeyPath:", CFSTR("symbol"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  StocksLogForCategory(4);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v29 = objc_msgSend(v3, "count");
    v30 = 2112;
    v31 = v3;
    _os_log_impl(&dword_1ABCEF000, v4, OS_LOG_TYPE_DEFAULT, "in the KVS we found %lu stocks to migrate: %@", buf, 0x16u);
  }

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  +[SCWWatchlistDefaults defaultsHistoryForCurrentCountry](SCWWatchlistDefaults, "defaultsHistoryForCurrentCountry", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v9), "defaultSymbols");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToArray:", v3);

      if ((v11 & 1) != 0)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v7)
          goto LABEL_5;
        goto LABEL_11;
      }
    }

    StocksLogForCategory(4);
    v13 = (SCWatchlistAddDefaultSymbolsCommand *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT))
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v21 = "skipping KVS migration because the contents of the KVS match a default set";
LABEL_17:
    _os_log_impl(&dword_1ABCEF000, &v13->super, OS_LOG_TYPE_DEFAULT, v21, buf, 2u);
    goto LABEL_18;
  }
LABEL_11:

  v12 = objc_msgSend(v3, "count");
  StocksLogForCategory(4);
  v13 = (SCWatchlistAddDefaultSymbolsCommand *)objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(&v13->super, OS_LOG_TYPE_DEFAULT);
  if (!v12)
  {
    if (!v14)
      goto LABEL_18;
    *(_WORD *)buf = 0;
    v21 = "skipping KVS migration because the KVS is empty";
    goto LABEL_17;
  }
  if (v14)
  {
    v15 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v29 = v15;
    _os_log_impl(&dword_1ABCEF000, &v13->super, OS_LOG_TYPE_DEFAULT, "migrating %lu stocks from KVS to watchlist", buf, 0xCu);
  }

  v13 = -[SCWatchlistAddDefaultSymbolsCommand initWithSymbols:deferUpload:]([SCWatchlistAddDefaultSymbolsCommand alloc], "initWithSymbols:deferUpload:", v3, 0);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v13);

  v17 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
  v26 = CFSTR("watchlist");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SCWWatchlistAddToWatchlistOrderCommand initWithWatchlistIdentifiers:](v17, "initWithWatchlistIdentifiers:", v18);

  objc_msgSend(*(id *)(a1 + 40), "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v19);

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
LABEL_18:

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_88(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;

  v3 = a2;
  if (v3)
  {
    StocksLogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_88_cold_1((uint64_t)v3, v4, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "synchronize");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_90(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
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
      _os_log_impl(&dword_1ABCEF000, v5, OS_LOG_TYPE_DEFAULT, "attempting to fetch watchlist defaults", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "defaultsProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_92;
    v8[3] = &unk_1E5AF29D8;
    v7 = v4;
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v6, "fetchWatchlistDefaultsWithCompletion:", v8);

  }
  else
  {
    (*((void (**)(id))v3 + 2))(v3);
  }

}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_92(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  SCWatchlistAddDefaultSymbolsCommand *v8;
  NSObject *v9;
  void *v10;
  SCWWatchlistAddToWatchlistOrderCommand *v11;
  void *v12;
  SCWWatchlistAddToWatchlistOrderCommand *v13;
  void *v14;
  _QWORD v15[6];
  const __CFString *v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || !objc_msgSend(v5, "count"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_93;
    v15[3] = &unk_1E5AF1D28;
    v7 = *(_QWORD *)(a1 + 40);
    v15[4] = v6;
    v15[5] = v7;
    v8 = (SCWatchlistAddDefaultSymbolsCommand *)v6;
    __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_93((uint64_t)v15);
  }
  else
  {
    StocksLogForCategory(4);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1ABCEF000, v9, OS_LOG_TYPE_DEFAULT, "saving %lu default symbolss to watchlist", buf, 0xCu);
    }

    v8 = -[SCWatchlistAddDefaultSymbolsCommand initWithSymbols:deferUpload:]([SCWatchlistAddDefaultSymbolsCommand alloc], "initWithSymbols:deferUpload:", v5, 1);
    objc_msgSend(*(id *)(a1 + 32), "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v8);

    v11 = [SCWWatchlistAddToWatchlistOrderCommand alloc];
    v16 = CFSTR("watchlist");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SCWWatchlistAddToWatchlistOrderCommand initWithWatchlistIdentifiers:](v11, "initWithWatchlistIdentifiers:", v12);

    objc_msgSend(*(id *)(a1 + 32), "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "modifyContentsOfZone:withCommand:", CFSTR("Watchlist"), v13);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_93(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  StocksLogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_93_cold_1(a1, v2, v3);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (SCWDatabase)database
{
  return self->_database;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (SCWWatchlistMetadataProviding)metadataProvider
{
  return self->_metadataProvider;
}

- (void)setMetadataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_metadataProvider, a3);
}

- (SCWWatchlistDefaultsProviding)defaultsProvider
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

- (SCWStartupQueue)startupQueue
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

- (void)sc_synchronize
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SCWWatchlistManager synchronize](self, "synchronize");
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_3_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1ABCEF000, a2, a3, "fetch stocks read zone error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

void __59__SCWWatchlistManager_fetchStocksFromWatchlist_completion___block_invoke_2_39_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1ABCEF000, a2, v4, "fetch stocks missing watchlist record for identifier: %{public}@", (uint8_t *)&v5);

}

- (void)removeSymbol:(NSObject *)a1 watchlist:(uint64_t)a2 completion:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_1_1(&dword_1ABCEF000, a1, a3, "SCWWatchlistManager removing last symbol from default watchlist", v3);
}

- (void)database:(NSObject *)a3 didChangeZone:from:to:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_1_1(&dword_1ABCEF000, a3, (uint64_t)a3, "SCWWatchlistManager watchlist diff removes all symbols in default watchlist along with nil values for order/display/sort state", a1);
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_88_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1ABCEF000, a2, a3, "KVS synchronization failed but we'll migrate whatever's in there if non-empty (error was %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __46__SCWWatchlistManager__enqueueStartupSequence__block_invoke_2_93_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1ABCEF000, a2, a3, "failed to fetch watchlist defaults with error: %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

@end
