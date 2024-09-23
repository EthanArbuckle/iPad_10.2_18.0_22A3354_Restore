@implementation WBSHistory

- (void)computeFrequentlyVisitedSites:(unint64_t)a3 minimalVisitCountScore:(unint64_t)a4 blockList:(id)a5 allowList:(id)a6 options:(unint64_t)a7 currentTime:(double)a8 completionHandler:(id)a9
{
  -[WBSHistoryStore computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:](self->_historyStore, "computeFrequentlyVisitedSites:minimalVisitCountScore:blockList:allowList:options:currentTime:completionHandler:", a3, a4, a5, a6, a7, a9, a8);
}

void __36__WBSHistory__dispatchHistoryLoaded__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v6 = CFSTR("WBSHistoryInMemoryDatabase");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(v3 + 56), "isUsingInMemoryDatabase"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSHistoryWasLoadedNotification"), v3, v5);

}

void __42__WBSHistory__sendNotification_withItems___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

uint64_t __47__WBSHistory_loadHistoryAsynchronouslyIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_loadHistory");
}

- (NSString)databaseID
{
  return self->_databaseID;
}

uint64_t __34__WBSHistory_releaseCloudHistory___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "releaseCloudHistory:", *(_QWORD *)(a1 + 40));
}

+ (id)existingSharedHistory
{
  return (id)existingSharedHistory;
}

uint64_t __108__WBSHistory_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "getHighLevelHTTPFamilyDomainsVisitedAfterDate:beforeDate:onlyFromThisDevice:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

void __26__WBSHistory__loadHistory__block_invoke(uint64_t a1)
{
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
}

- (WBSHistory)initWithDatabaseID:(id)a3
{
  id v5;
  id v6;
  WBSHistoryActivityThrottler *v7;
  void *v8;
  dispatch_queue_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  dispatch_queue_t v15;
  void *v16;
  id v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WBSHistory;
  v6 = -[WBSHistory init](&v19, sel_init);
  if (v6)
  {
    v7 = -[WBSHistoryActivityThrottler initWithLimitPerSecond:]([WBSHistoryActivityThrottler alloc], "initWithLimitPerSecond:", 20);
    v8 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v7;

    v9 = dispatch_queue_create("com.apple.SafariShared.WBSHistory.entriesByURLString", 0);
    v10 = (void *)*((_QWORD *)v6 + 1);
    *((_QWORD *)v6 + 1) = v9;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v6 + 2);
    *((_QWORD *)v6 + 2) = v11;

    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v6 + 3);
    *((_QWORD *)v6 + 3) = v13;

    v15 = dispatch_queue_create("com.apple.SafariShared.WBSHistory.waitUntilHistoryHasLoaded", 0);
    v16 = (void *)*((_QWORD *)v6 + 6);
    *((_QWORD *)v6 + 6) = v15;

    dispatch_suspend(*((dispatch_object_t *)v6 + 6));
    objc_storeStrong((id *)v6 + 9, a3);
    if (!v5)
    {
      objc_storeStrong((id *)&existingSharedHistory, v6);
      objc_storeStrong((id *)v6 + 9, (id)*MEMORY[0x1E0D89E20]);
    }
    v17 = v6;
  }

  return (WBSHistory *)v6;
}

- (void)_loadHistory
{
  NSObject *v3;
  NSObject *v4;
  _QWORD v5[5];
  uint8_t buf[16];

  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v4, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  if (!self->_hasStartedLoadingHistory)
  {
    self->_hasStartedLoadingHistory = 1;
    -[WBSHistory _createHistoryStoreIfNeeded](self, "_createHistoryStoreIfNeeded");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __26__WBSHistory__loadHistory__block_invoke;
    v5[3] = &unk_1E4B2AD70;
    v5[4] = self;
    -[WBSHistory _loadHistoryWithCompletionHandler:](self, "_loadHistoryWithCompletionHandler:", v5);
  }
}

- (void)_createHistoryStoreIfNeeded
{
  WBSHistoryStore *v3;
  WBSHistoryStore *historyStore;

  if (!self->_historyStore)
  {
    -[WBSHistory _createHistoryStore](self, "_createHistoryStore");
    v3 = (WBSHistoryStore *)objc_claimAutoreleasedReturnValue();
    historyStore = self->_historyStore;
    self->_historyStore = v3;

    -[WBSHistoryStore setDelegate:](self->_historyStore, "setDelegate:", self);
  }
}

- (void)_loadHistoryWithCompletionHandler:(id)a3
{
  -[WBSHistoryStore loadWithCompletionHandler:](self->_historyStore, "loadWithCompletionHandler:", a3);
}

+ (id)historyDatabaseURL
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __32__WBSHistory_historyDatabaseURL__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSHistory historyDatabaseURL]::onceToken != -1)
    dispatch_once(&+[WBSHistory historyDatabaseURL]::onceToken, block);
  return (id)+[WBSHistory historyDatabaseURL]::historyURL;
}

void __39__WBSHistory_enumerateItemsUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)historyLoader:(id)a3 didLoadItems:(id)a4 stringsForUserTypeDomainExpansion:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v10, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  if (v8)
  {
    if (self->_stringsForUserTypedDomainExpansion)
      -[NSCountedSet unionSet:](self->_stringsForUserTypedDomainExpansion, "unionSet:", v8);
    else
      objc_storeStrong((id *)&self->_stringsForUserTypedDomainExpansion, a5);
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        -[WBSHistory _addItem:addToStringsForUserTypedDomainExpansions:](self, "_addItem:addToStringsForUserTypedDomainExpansions:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), v8 == 0, (_QWORD)v15);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v12);
  }

  -[WBSHistory _dispatchHistoryItemsLoaded:](self, "_dispatchHistoryItemsLoaded:", v11);
}

- (void)_sendNotification:(id)a3 withItems:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  WBSHistory *v14;
  id v15;
  _QWORD block[4];
  id v17;
  WBSHistory *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v19 = CFSTR("WBSHistoryItemsKey");
    v20[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __42__WBSHistory__sendNotification_withItems___block_invoke_2;
    v12[3] = &unk_1E4B2B2A8;
    v13 = v6;
    v14 = self;
    v15 = v8;
    v9 = v8;
    v10 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], v12);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__WBSHistory__sendNotification_withItems___block_invoke;
    block[3] = &unk_1E4B2B448;
    v17 = v6;
    v18 = self;
    v11 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v9 = v17;
  }

}

- (void)_dispatchHistoryItemsLoaded:(id)a3
{
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryItemsWereLoadedNotification"), a3);
}

- (void)getHighLevelHTTPFamilyDomainsVisitedAfterDate:(id)a3 beforeDate:(id)a4 onlyFromThisDevice:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__WBSHistory_getHighLevelHTTPFamilyDomainsVisitedAfterDate_beforeDate_onlyFromThisDevice_completionHandler___block_invoke;
  v16[3] = &unk_1E4B3AD40;
  v16[4] = self;
  v17 = v10;
  v20 = a5;
  v18 = v11;
  v19 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[WBSHistory performBlockAfterHistoryHasLoaded:](self, "performBlockAfterHistoryHasLoaded:", v16);

}

- (void)waitUntilHistoryHasLoaded
{
  -[WBSHistory loadHistoryAsynchronouslyIfNeeded](self, "loadHistoryAsynchronouslyIfNeeded");
  dispatch_sync((dispatch_queue_t)self->_waitUntilHistoryHasLoadedQueue, &__block_literal_global_52);
}

- (void)performBlockAfterHistoryHasLoaded:(id)a3
{
  dispatch_block_t block;

  block = a3;
  -[WBSHistory loadHistoryAsynchronouslyIfNeeded](self, "loadHistoryAsynchronouslyIfNeeded");
  dispatch_async((dispatch_queue_t)self->_waitUntilHistoryHasLoadedQueue, block);

}

- (void)loadHistoryAsynchronouslyIfNeeded
{
  _QWORD block[5];

  if (!self->_hasStartedLoadingHistory)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__WBSHistory_loadHistoryAsynchronouslyIfNeeded__block_invoke;
    block[3] = &unk_1E4B2A2C8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)historyLoaderDidFinishLoading:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1A3D90000, v5, OS_LOG_TYPE_INFO, "Read Safari history", v6, 2u);
  }

  -[WBSHistory _dispatchHistoryLoaded](self, "_dispatchHistoryLoaded");
}

- (void)_dispatchHistoryLoaded
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__WBSHistory__dispatchHistoryLoaded__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)releaseCloudHistory:(id)a3
{
  id v4;
  NSObject *waitUntilHistoryHasLoadedQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  waitUntilHistoryHasLoadedQueue = self->_waitUntilHistoryHasLoadedQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__WBSHistory_releaseCloudHistory___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(waitUntilHistoryHasLoadedQueue, v7);

}

- (void)enumerateItemsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSObject *entriesByURLStringAccessQueue;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17;
  v19 = __Block_byref_object_dispose__17;
  v20 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__WBSHistory_enumerateItemsUsingBlock___block_invoke;
  block[3] = &unk_1E4B2BDF8;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (id)v16[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

+ (id)defaultHistoryDatabaseDirectoryURL
{
  if (+[WBSHistory defaultHistoryDatabaseDirectoryURL]::onceToken != -1)
    dispatch_once(&+[WBSHistory defaultHistoryDatabaseDirectoryURL]::onceToken, &__block_literal_global_56);
  return (id)+[WBSHistory defaultHistoryDatabaseDirectoryURL]::historyDirectoryURL;
}

void __48__WBSHistory_defaultHistoryDatabaseDirectoryURL__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_nonContaineredSettingsDirectoryURL");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[WBSHistory defaultHistoryDatabaseDirectoryURL]::historyDirectoryURL;
  +[WBSHistory defaultHistoryDatabaseDirectoryURL]::historyDirectoryURL = v0;

}

void __32__WBSHistory_historyDatabaseURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "defaultHistoryDatabaseDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("History.db"), 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)+[WBSHistory historyDatabaseURL]::historyURL;
  +[WBSHistory historyDatabaseURL]::historyURL = v1;

}

+ (id)profileDirectoryURLForProfileID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_profileDirectoryURLWithID:createIfNeeded:", v4, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "defaultHistoryDatabaseDirectoryURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)historyDatabaseWriteAheadLogURL
{
  void *v3;
  void *v4;

  {
    v3 = (void *)MEMORY[0x1E0D89CC0];
    objc_msgSend(a1, "historyDatabaseURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "writeAheadLogURLForDatabaseURL:", v4);
    +[WBSHistory historyDatabaseWriteAheadLogURL]::historyWriteAheadLogURL = objc_claimAutoreleasedReturnValue();

  }
  return (id)+[WBSHistory historyDatabaseWriteAheadLogURL]::historyWriteAheadLogURL;
}

- (NSString)profileLocalIdentifier
{
  return self->_databaseID;
}

- (id)itemForURLString:(id)a3
{
  -[WBSHistory itemForURLString:createIfNeeded:](self, "itemForURLString:createIfNeeded:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemForURLString:(id)a3 createIfNeeded:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *entriesByURLStringAccessQueue;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__17;
    v19 = __Block_byref_object_dispose__17;
    v20 = 0;
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __46__WBSHistory_itemForURLString_createIfNeeded___block_invoke;
    v11[3] = &unk_1E4B3AC78;
    v13 = &v15;
    v11[4] = self;
    v12 = v6;
    v14 = a4;
    dispatch_sync(entriesByURLStringAccessQueue, v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __46__WBSHistory_itemForURLString_createIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_BYTE *)(a1 + 56))
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v5 = objc_msgSend(objc_alloc((Class)objc_msgSend(*(id *)(a1 + 32), "_historyItemClass")), "initWithURLString:", *(_QWORD *)(a1 + 40));
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
    }
  }
}

- (id)lastVisitForHighLevelDomain:(id)a3
{
  id v4;
  NSObject *entriesByURLStringAccessQueue;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  BOOL v19;
  uint64_t v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__17;
    v31 = __Block_byref_object_dispose__17;
    v32 = 0;
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __42__WBSHistory_lastVisitForHighLevelDomain___block_invoke;
    block[3] = &unk_1E4B2BDF8;
    block[4] = self;
    block[5] = &v27;
    dispatch_sync(entriesByURLStringAccessQueue, block);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (id)v28[5];
    v7 = 0;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "url", (_QWORD)v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "safari_userVisibleHostWithoutWWWSubdomain");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v4);

          if ((v14 & 1) != 0)
          {
            if (!v7
              || (objc_msgSend(v7, "visitTime"),
                  v16 = v15,
                  objc_msgSend(v11, "lastVisit"),
                  v17 = (void *)objc_claimAutoreleasedReturnValue(),
                  objc_msgSend(v17, "visitTime"),
                  v19 = v16 > v18,
                  v17,
                  !v19))
            {
              objc_msgSend(v11, "lastVisit");
              v20 = objc_claimAutoreleasedReturnValue();

              v7 = (void *)v20;
            }
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v33, 16);
      }
      while (v8);
    }

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __42__WBSHistory_lastVisitForHighLevelDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasItemSince:(id)a3
{
  id v4;
  NSObject *entriesByURLStringAccessQueue;
  id v6;
  _QWORD block[5];
  id v9;
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
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __27__WBSHistory_hasItemSince___block_invoke;
  block[3] = &unk_1E4B3ACC8;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  LOBYTE(entriesByURLStringAccessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)entriesByURLStringAccessQueue;
}

void __27__WBSHistory_hasItemSince___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__WBSHistory_hasItemSince___block_invoke_2;
  v6[3] = &unk_1E4B3ACA0;
  v4 = v2;
  v5 = a1[6];
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v6);

}

void __27__WBSHistory_hasItemSince___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  unint64_t v7;

  objc_msgSend(a3, "lastVisitedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);

  if ((unint64_t)v6 >= v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)removeItemsInResponseToUserAction:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
    -[WBSHistory _removeItemsInResponseToUserAction:completionHandler:](self, "_removeItemsInResponseToUserAction:completionHandler:", v4, 0);

}

- (void)_removeHistoryItemsInResponseToUserAction:(id)a3
{
  -[WBSHistory _removeItemsInResponseToUserAction:completionHandler:](self, "_removeItemsInResponseToUserAction:completionHandler:", a3, 0);
}

- (void)_removeItemsInResponseToUserAction:(id)a3 completionHandler:(id)a4
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  WBSHistoryStore *historyStore;
  id v15;
  id v16;
  id v17;
  id obj;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  -[WBSHistory _waitUntilHistoryHasLoadedMainThread](self, "_waitUntilHistoryHasLoadedMainThread");
  v6 = dispatch_group_create();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v16;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v8 = MEMORY[0x1E0C809B0];
  if (v7)
  {
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v11, "urlString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[WBSHistory _removeItemForURLString:](self, "_removeItemForURLString:", v12);

        dispatch_group_enter(v6);
        historyStore = self->_historyStore;
        v21[0] = v8;
        v21[1] = 3221225472;
        v21[2] = __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke;
        v21[3] = &unk_1E4B2A2C8;
        v22 = v6;
        -[WBSHistoryStore removePastHistoryVisitsForItem:completionHandler:](historyStore, "removePastHistoryVisitsForItem:completionHandler:", v11, v21);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke_2;
  block[3] = &unk_1E4B2B038;
  v20 = v17;
  v15 = v17;
  dispatch_group_notify(v6, MEMORY[0x1E0C80D38], block);

}

void __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __67__WBSHistory__removeItemsInResponseToUserAction_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (id)itemForURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "safari_originalDataAsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory itemForURLString:](self, "itemForURLString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addAutocompleteTrigger:(id)a3 forURLString:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    -[WBSHistory itemForURLString:](self, "itemForURLString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[WBSHistoryStore addAutocompleteTrigger:forItem:](self->_historyStore, "addAutocompleteTrigger:forItem:", v8, v7);

  }
}

- (void)getAutocompleteTriggersForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "length"))
  {
    -[WBSHistory itemForURLString:](self, "itemForURLString:", v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[WBSHistoryStore getAutocompleteTriggersForItem:completionHandler:](self->_historyStore, "getAutocompleteTriggersForItem:completionHandler:", v7, v6);

  }
}

- (void)_addItem:(id)a3 addToStringsForUserTypedDomainExpansions:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *entriesByURLStringAccessQueue;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[5];
  id v19;
  id v20;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "urlString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[WBSHistory _removeItemForURLString:](self, "_removeItemForURLString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v6, "mergeDataFromItem:", v8);
      -[WBSHistoryStore itemWasReplaced:byItem:](self->_historyStore, "itemWasReplaced:byItem:", v8, v6);
    }

    if (v4)
      -[WBSHistory _addItemToStringsForUserTypedDomainExpansion:](self, "_addItemToStringsForUserTypedDomainExpansion:", v6);
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__WBSHistory__addItem_addToStringsForUserTypedDomainExpansions___block_invoke;
    block[3] = &unk_1E4B2B2A8;
    block[4] = self;
    v19 = v7;
    v20 = v6;
    dispatch_sync(entriesByURLStringAccessQueue, block);

  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSHistory _addItem:addToStringsForUserTypedDomainExpansions:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
  }

}

uint64_t __64__WBSHistory__addItem_addToStringsForUserTypedDomainExpansions___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (id)_removeItemForURLString:(id)a3
{
  id v4;
  void *v5;
  NSObject *entriesByURLStringAccessQueue;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD block[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__17;
    v24 = __Block_byref_object_dispose__17;
    v25 = 0;
    entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__WBSHistory__removeItemForURLString___block_invoke;
    block[3] = &unk_1E4B384C0;
    v19 = &v20;
    block[4] = self;
    v18 = v4;
    dispatch_sync(entriesByURLStringAccessQueue, block);
    if (v21[5])
    {
      -[WBSHistory _removeItemFromStringsForUserTypedDomainExpansion:](self, "_removeItemFromStringsForUserTypedDomainExpansion:");
      if (!-[NSMutableDictionary count](self->_entriesByURLString, "count"))
        -[WBSHistory _removeAllVisitedLinks](self, "_removeAllVisitedLinks");
      v7 = (id)v21[5];
    }
    else
    {
      v7 = 0;
    }

    _Block_object_dispose(&v20, 8);
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSHistory _removeItemForURLString:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    v7 = 0;
  }

  return v7;
}

uint64_t __38__WBSHistory__removeItemForURLString___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 16), "removeObjectForKey:", a1[5]);
}

- (BOOL)_isStringForUserTypedDomainExpansionInHistory:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if (v4)
    v5 = -[NSCountedSet containsObject:](self->_stringsForUserTypedDomainExpansion, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (void)_addItemToStringsForUserTypedDomainExpansion:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringForUserTypedDomainExpansion");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSCountedSet addObject:](self->_stringsForUserTypedDomainExpansion, "addObject:", v4);

}

- (void)_removeItemFromStringsForUserTypedDomainExpansion:(id)a3
{
  id v4;

  objc_msgSend(a3, "stringForUserTypedDomainExpansion");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[NSCountedSet removeObject:](self->_stringsForUserTypedDomainExpansion, "removeObject:", v4);

}

- (NSArray)allItems
{
  NSObject *entriesByURLStringAccessQueue;
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
  v9 = __Block_byref_object_copy__17;
  v10 = __Block_byref_object_dispose__17;
  v11 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __22__WBSHistory_allItems__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(entriesByURLStringAccessQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __22__WBSHistory_allItems__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)hasAnyHistoryItems
{
  return -[WBSHistory numberOfHistoryItems](self, "numberOfHistoryItems") != 0;
}

- (unint64_t)numberOfHistoryItems
{
  NSObject *entriesByURLStringAccessQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__WBSHistory_numberOfHistoryItems__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(entriesByURLStringAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__WBSHistory_numberOfHistoryItems__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfHistoryItemsOnHistoryQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)numberOfHistoryItemsOnHistoryQueue
{
  return -[NSMutableDictionary count](self->_entriesByURLString, "count");
}

- (void)enumerateItemsAsynchronouslyUsingBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *entriesByURLStringAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke;
  block[3] = &unk_1E4B3AD18;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(entriesByURLStringAccessQueue, block);

}

void __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)a1[5];
  v3 = *(void **)(a1[4] + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke_2;
  v5[3] = &unk_1E4B3ACF0;
  v6 = v2;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v5);
  v4 = a1[6];
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

uint64_t __71__WBSHistory_enumerateItemsAsynchronouslyUsingBlock_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getAllItemsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *entriesByURLStringAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__WBSHistory_getAllItemsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B29E18;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(entriesByURLStringAccessQueue, v7);

}

void __47__WBSHistory_getAllItemsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)setHistoryAgeLimit:(double)a3
{
  if (self->_historyAgeLimit != a3)
  {
    self->_historyAgeLimit = a3;
    -[WBSHistoryStore setHistoryAgeLimit:](self->_historyStore, "setHistoryAgeLimit:");
  }
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 wasHTTPNonGet:(BOOL)a5 wasFailure:(BOOL)a6 increaseVisitCount:(BOOL)a7
{
  -[WBSHistory itemVisitedAtURLString:title:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:](self, "itemVisitedAtURLString:title:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:", a3, a4, a5, a6, a7, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 wasHTTPNonGet:(BOOL)a5 wasFailure:(BOOL)a6 increaseVisitCount:(BOOL)a7 statusCode:(int64_t)a8
{
  _BOOL8 v9;
  _BOOL8 v10;
  _BOOL8 v11;
  id v14;
  id v15;
  void *v16;

  v9 = a7;
  v10 = a6;
  v11 = a5;
  v14 = a3;
  v15 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:](self, "itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:", v14, v15, v11, v10, v9, a8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 origin:(int64_t)a9
{
  -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:](self, "itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:", a3, a4, a6, a7, a8, 0, a5, a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 statusCode:(int64_t)a9 origin:(int64_t)a10
{
  -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:attributes:](self, "itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:attributes:", a3, a4, a6, a7, a8, a9, a5, a10, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 origin:(int64_t)a9 attributes:(unint64_t)a10
{
  -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:attributes:](self, "itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:attributes:", a3, a4, a6, a7, a8, 0, a5, a9, a10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemVisitedAtURLString:(id)a3 title:(id)a4 timeOfVisit:(double)a5 wasHTTPNonGet:(BOOL)a6 wasFailure:(BOOL)a7 increaseVisitCount:(BOOL)a8 statusCode:(int64_t)a9 origin:(int64_t)a10 attributes:(unint64_t)a11
{
  _BOOL4 v12;
  uint64_t v13;
  id v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  NSObject *entriesByURLStringAccessQueue;
  NSObject *v33;
  WBSHistoryVisit *v34;
  void *v35;
  WBSHistoryStore *historyStore;
  void *v37;
  NSObject *v38;
  unsigned int v40;
  id v41;
  _QWORD block[5];
  id v43;
  id v44;
  WBSHistoryVisit *v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v12 = a7;
  v13 = a6;
  v50 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v41 = a4;
  if (!v17)
  {
    v22 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:attributes:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
    goto LABEL_24;
  }
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18 && os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v19, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  -[WBSHistory loadHistoryAsynchronouslyIfNeeded](self, "loadHistoryAsynchronouslyIfNeeded");
  -[WBSHistory itemForURLString:](self, "itemForURLString:", v17);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (-[WBSHistoryActivityThrottler shouldRecordHistoryVisitAtTime:](self->_entryCreationThrottler, "shouldRecordHistoryVisitAtTime:", a5))
    {
      v30 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 141558275;
        v47 = 1752392040;
        v48 = 2117;
        v49 = v17;
        _os_log_impl(&dword_1A3D90000, v30, OS_LOG_TYPE_INFO, "Adding new global history item for %{sensitive, mask.hash}@", buf, 0x16u);
      }
      v31 = (void *)objc_msgSend(objc_alloc(-[WBSHistory _historyItemClass](self, "_historyItemClass")), "initWithURLString:", v17);
      v40 = v13;
      entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __128__WBSHistory_itemVisitedAtURLString_title_timeOfVisit_wasHTTPNonGet_wasFailure_increaseVisitCount_statusCode_origin_attributes___block_invoke;
      block[3] = &unk_1E4B2B2A8;
      block[4] = self;
      v43 = v17;
      v21 = v31;
      v44 = v21;
      dispatch_sync(entriesByURLStringAccessQueue, block);
      -[WBSHistory _addItemToStringsForUserTypedDomainExpansion:](self, "_addItemToStringsForUserTypedDomainExpansion:", v21);

      v13 = v40;
      goto LABEL_13;
    }
    v38 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138739971;
      v47 = (uint64_t)v17;
      _os_log_impl(&dword_1A3D90000, v38, OS_LOG_TYPE_DEFAULT, "Did not create history item for %{sensitive}@ because of excessive history activity requests", buf, 0xCu);
    }
LABEL_24:
    v34 = 0;
    goto LABEL_25;
  }
  -[WBSHistory _dispatchHistoryItemWillChange:](self, "_dispatchHistoryItemWillChange:", v20);
  v21 = (id)v20;
LABEL_13:
  v33 = WBS_LOG_CHANNEL_PREFIXHistory();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 141558275;
    v47 = 1752392040;
    v48 = 2117;
    v49 = v17;
    _os_log_impl(&dword_1A3D90000, v33, OS_LOG_TYPE_INFO, "Updating global history item %{sensitive, mask.hash}@", buf, 0x16u);
  }
  v34 = -[WBSHistoryVisit initWithHistoryItem:visitTime:loadWasSuccesful:wasHTTPNonGet:origin:attributes:]([WBSHistoryVisit alloc], "initWithHistoryItem:visitTime:loadWasSuccesful:wasHTTPNonGet:origin:attributes:", v21, !v12, v13, a10, a11, a5);
  WBSHistoryTruncatePageTitle(v41, 0x200uLL);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryVisit setTitle:](v34, "setTitle:", v35);

  objc_msgSend(v21, "wasVisited:", v34);
  if (WBSStatusCodeGroupFromStatusCode()
    || (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled") & 1) == 0)
  {
    objc_msgSend(v21, "setStatusCode:", a9);
  }
  -[WBSHistory _dispatchHistoryVisitAdded:](self, "_dispatchHistoryVisitAdded:", v34);
  if (v20)
    -[WBSHistory _dispatchHistoryItemDidChange:byUserInitiatedAction:](self, "_dispatchHistoryItemDidChange:byUserInitiatedAction:", v21, (unint64_t)(a10 - 4) < 0xFFFFFFFFFFFFFFFDLL);
  else
    -[WBSHistory _dispatchHistoryItemAdded:withVisitOrigin:](self, "_dispatchHistoryItemAdded:withVisitOrigin:", v21, a10);
  historyStore = self->_historyStore;
  v45 = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v45, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryStore visitsWereAdded:](historyStore, "visitsWereAdded:", v37);

LABEL_25:
  return v34;
}

uint64_t __128__WBSHistory_itemVisitedAtURLString_title_timeOfVisit_wasHTTPNonGet_wasFailure_increaseVisitCount_statusCode_origin_attributes___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (id)itemRedirectedFrom:(id)a3 to:(id)a4 origin:(int64_t)a5 date:(id)a6
{
  -[WBSHistory itemRedirectedFrom:to:origin:date:statusCode:](self, "itemRedirectedFrom:to:origin:date:statusCode:", a3, a4, a5, a6, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)itemRedirectedFrom:(id)a3 to:(id)a4 origin:(int64_t)a5 date:(id)a6 statusCode:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  double v17;
  WBSHistoryVisit *v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  id v23;
  WBSHistoryVisit *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  NSObject *entriesByURLStringAccessQueue;
  void *v31;
  WBSHistoryStore *historyStore;
  void *v33;
  WBSHistoryStore *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  _QWORD block[5];
  id v40;
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  id v49;
  WBSHistoryVisit *v50;
  _QWORD v51[3];

  v51[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15 && os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v16, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  if (!-[WBSHistory canRecordRedirectFromVisit:to:](self, "canRecordRedirectFromVisit:to:", v12, v13))
  {
    v18 = (WBSHistoryVisit *)v12;
LABEL_14:
    v24 = v18;
    goto LABEL_32;
  }
  -[WBSHistory loadHistoryAsynchronouslyIfNeeded](self, "loadHistoryAsynchronouslyIfNeeded");
  if (v14)
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = v17;
  objc_msgSend(v12, "item");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (v21)
  {
    -[WBSHistory itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:](self, "itemVisitedAtURLString:title:timeOfVisit:wasHTTPNonGet:wasFailure:increaseVisitCount:statusCode:origin:", v13, 0, 0, 0, 1, a7, v19, 0);
    v18 = (WBSHistoryVisit *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  if (v13)
  {
    -[WBSHistory itemForURLString:](self, "itemForURLString:", v13);
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[WBSHistory _dispatchHistoryItemWillChange:](self, "_dispatchHistoryItemWillChange:", v22);
      v23 = (id)v22;
    }
    else
    {
      v28 = WBS_LOG_CHANNEL_PREFIXHistory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 141558275;
        v43 = 1752392040;
        v44 = 2117;
        v45 = v13;
        _os_log_impl(&dword_1A3D90000, v28, OS_LOG_TYPE_INFO, "Synthesizing item for destination of redirect: %{sensitive, mask.hash}@", buf, 0x16u);
      }
      v29 = (void *)objc_msgSend(objc_alloc(-[WBSHistory _historyItemClass](self, "_historyItemClass")), "initWithURLString:", v13);
      entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __59__WBSHistory_itemRedirectedFrom_to_origin_date_statusCode___block_invoke;
      block[3] = &unk_1E4B2B2A8;
      block[4] = self;
      v40 = v13;
      v23 = v29;
      v41 = v23;
      dispatch_sync(entriesByURLStringAccessQueue, block);
      -[WBSHistory _addItemToStringsForUserTypedDomainExpansion:](self, "_addItemToStringsForUserTypedDomainExpansion:", v23);

    }
    objc_msgSend(v12, "item");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistory _dispatchHistoryItemWillChange:](self, "_dispatchHistoryItemWillChange:", v31);
    v24 = -[WBSHistoryVisit initWithHistoryItem:visitTime:loadWasSuccesful:wasHTTPNonGet:origin:attributes:]([WBSHistoryVisit alloc], "initWithHistoryItem:visitTime:loadWasSuccesful:wasHTTPNonGet:origin:attributes:", v23, 1, 0, a5, 0, v19);
    objc_msgSend(v23, "wasRedirectedFrom:to:", v12, v24);
    if (WBSStatusCodeGroupFromStatusCode()
      || (objc_msgSend(MEMORY[0x1E0D89BE8], "isStreamlinedCompletionListEnabled") & 1) == 0)
    {
      objc_msgSend(v23, "setStatusCode:", a7);
    }
    -[WBSHistory _dispatchHistoryVisitAdded:](self, "_dispatchHistoryVisitAdded:", v24);
    -[WBSHistory _dispatchHistoryItemDidChange:byUserInitiatedAction:](self, "_dispatchHistoryItemDidChange:byUserInitiatedAction:", v31, (unint64_t)(a5 - 4) < 0xFFFFFFFFFFFFFFFDLL);
    if (v22)
      -[WBSHistory _dispatchHistoryItemDidChange:byUserInitiatedAction:](self, "_dispatchHistoryItemDidChange:byUserInitiatedAction:", v23, (unint64_t)(a5 - 4) < 0xFFFFFFFFFFFFFFFDLL);
    else
      -[WBSHistory _dispatchHistoryItemAdded:withVisitOrigin:](self, "_dispatchHistoryItemAdded:withVisitOrigin:", v23, a5);
    if (objc_msgSend(v12, "didUserInteractWithPage"))
      objc_msgSend(v12, "setAttributes:", objc_msgSend(v12, "attributes") | 0x10);
    historyStore = self->_historyStore;
    v51[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistoryStore visitsWereModified:](historyStore, "visitsWereModified:", v33);

    v34 = self->_historyStore;
    v50 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHistoryStore visitsWereAdded:](v34, "visitsWereAdded:", v35);

    v36 = (id)WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v31, "urlString");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 141558787;
      v43 = 1752392040;
      v44 = 2117;
      v45 = v37;
      v46 = 2160;
      v47 = 1752392040;
      v48 = 2117;
      v49 = v13;
      _os_log_impl(&dword_1A3D90000, v36, OS_LOG_TYPE_INFO, "Recorded redirect from %{sensitive, mask.hash}@ to %{sensitive, mask.hash}@", buf, 0x2Au);

    }
  }
  else
  {
    v25 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[WBSHistory itemRedirectedFrom:to:origin:date:statusCode:].cold.1(v25, v26, v27);
    v24 = 0;
  }
LABEL_32:

  return v24;
}

uint64_t __59__WBSHistory_itemRedirectedFrom_to_origin_date_statusCode___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 16), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)getVisitsCreatedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  ct_green_tea_logger_create_static();
  getCTGreenTeaOsLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3D90000, v12, OS_LOG_TYPE_INFO, "Read Safari history", buf, 2u);
  }

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __69__WBSHistory_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke;
  v16[3] = &unk_1E4B39360;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  -[WBSHistory performBlockAfterHistoryHasLoaded:](self, "performBlockAfterHistoryHasLoaded:", v16);

}

uint64_t __69__WBSHistory_getVisitsCreatedAfterDate_beforeDate_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 56), "getVisitsCreatedAfterDate:beforeDate:completionHandler:", a1[5], a1[6], a1[7]);
}

- (void)checkIfLocalVisitExistsInAnyOfItems:(id)a3 withCompletion:(id)a4
{
  -[WBSHistoryStore checkIfLocalVisitExistsInAnyOfItems:withCompletion:](self->_historyStore, "checkIfLocalVisitExistsInAnyOfItems:withCompletion:", a3, a4);
}

- (BOOL)canRecordRedirectFromVisit:(id)a3 to:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "item");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "urlString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isEqualToString:", v6))
  {
    v9 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v16 = 141558275;
      v17 = 1752392040;
      v18 = 2117;
      v19 = v6;
      v10 = "Ignoring redirect from %{sensitive, mask.hash}@ to itself";
      v11 = v9;
      v12 = 22;
LABEL_7:
      _os_log_impl(&dword_1A3D90000, v11, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v16, v12);
    }
  }
  else
  {
    if ((unint64_t)objc_msgSend(v5, "redirectSourceChainLength") < 0x15)
    {
      v14 = 1;
      goto LABEL_10;
    }
    v13 = WBS_LOG_CHANNEL_PREFIXHistory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v16 = 141558787;
      v17 = 1752392040;
      v18 = 2117;
      v19 = v8;
      v20 = 2160;
      v21 = 1752392040;
      v22 = 2117;
      v23 = v6;
      v10 = "Ignoring redirect from %{sensitive, mask.hash}@ to %{sensitive, mask.hash}@ due to exceeding maximum redirect chain length";
      v11 = v13;
      v12 = 42;
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_10:

  return v14;
}

- (void)updateTitle:(id)a3 forVisit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  id v11;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    WBSHistoryTruncatePageTitle(v6, 0x200uLL);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v10 & 1) == 0)
    {
      -[WBSHistory _dispatchHistoryItemWillChange:](self, "_dispatchHistoryItemWillChange:", v8);
      objc_msgSend(v7, "setTitle:");
      -[WBSHistory _dispatchHistoryItemDidChange:byUserInitiatedAction:](self, "_dispatchHistoryItemDidChange:byUserInitiatedAction:", v8, 0);
      -[WBSHistoryStore visitTitleWasUpdated:](self->_historyStore, "visitTitleWasUpdated:", v7);
    }
  }
  else
  {
    v11 = v6;
  }

}

- (void)_setAttributes:(unint64_t)a3 forVisit:(id)a4
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(v7, "item");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory _dispatchHistoryItemWillChange:](self, "_dispatchHistoryItemWillChange:", v6);
  objc_msgSend(v7, "setAttributes:", a3);
  -[WBSHistory _dispatchHistoryItemDidChange:byUserInitiatedAction:](self, "_dispatchHistoryItemDidChange:byUserInitiatedAction:", v6, 0);
  -[WBSHistoryStore visitAttributeWasUpdated:removeAttributes:addAttributes:](self->_historyStore, "visitAttributeWasUpdated:removeAttributes:addAttributes:", v7, 0, a3);

}

- (void)addAttributes:(unint64_t)a3 toVisit:(id)a4
{
  id v6;

  v6 = a4;
  if ((objc_msgSend(v6, "hasAttributes:", a3) & 1) == 0)
    -[WBSHistory _setAttributes:forVisit:](self, "_setAttributes:forVisit:", objc_msgSend(v6, "attributes") | a3, v6);

}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 completionHandler:(id)a5
{
  -[WBSHistoryStore fetchTopicsFromStartDate:toEndDate:completionHandler:](self->_historyStore, "fetchTopicsFromStartDate:toEndDate:completionHandler:", a3, a4, a5);
}

- (void)fetchTopicsFromStartDate:(id)a3 toEndDate:(id)a4 limit:(unint64_t)a5 minimumItemCount:(unint64_t)a6 sortOrder:(int64_t)a7 completionHandler:(id)a8
{
  -[WBSHistoryStore fetchTopicsFromStartDate:toEndDate:limit:minimumItemCount:sortOrder:completionHandler:](self->_historyStore, "fetchTopicsFromStartDate:toEndDate:limit:minimumItemCount:sortOrder:completionHandler:", a3, a4, a5, a6, a7, a8);
}

- (void)addTagWithIdentifier:(id)a3 title:(id)a4 toItemAtURL:(id)a5 level:(int64_t)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  WBSHistoryStore *historyStore;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  WBSHistory *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  -[WBSHistory itemForURL:](self, "itemForURL:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    historyStore = self->_historyStore;
    v26[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke;
    v20[3] = &unk_1E4B3AD90;
    v21 = v12;
    v24 = v15;
    v22 = self;
    v23 = v16;
    -[WBSHistoryStore tagsWithIdentifiers:type:level:creatingIfNecessary:withTitles:completionHandler:](historyStore, "tagsWithIdentifiers:type:level:creatingIfNecessary:withTitles:completionHandler:", v18, 1, a6, 1, v19, v20);

  }
  else
  {
    (*((void (**)(id, uint64_t, _QWORD))v15 + 2))(v15, 1, 0);
  }

}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v7 && v8)
  {
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 48);
    v12 = *(void **)(*(_QWORD *)(a1 + 40) + 56);
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_47;
    v22[3] = &unk_1E4B3AD68;
    v23 = v11;
    v24 = *(id *)(a1 + 32);
    v25 = *(id *)(a1 + 56);
    objc_msgSend(v12, "assignHistoryItem:toTopicTags:completionHandler:", v23, v10, v22);

  }
  else
  {
    v13 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "safari_privacyPreservingDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_2(v14, (uint64_t)v26, v13);
    }

    v15 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_1(a1, v15, v16, v17, v18, v19, v20, v21);
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_47(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "databaseID");
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_47_cold_2(v8, v15, v7, v6);
    }

    v9 = WBS_LOG_CHANNEL_PREFIXSiriIntelligence();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_47_cold_1(a1, v9, (uint64_t)v5, v10, v11, v12, v13, v14);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)setTitle:(id)a3 ofTag:(id)a4 completionHandler:(id)a5
{
  -[WBSHistoryStore setTitle:ofTag:completionHandler:](self->_historyStore, "setTitle:ofTag:completionHandler:", a3, a4, a5);
}

- (void)getItemCountBeforeDate:(id)a3 completionHandler:(id)a4
{
  -[WBSHistoryStore getItemCountBeforeDate:completionHandler:](self->_historyStore, "getItemCountBeforeDate:completionHandler:", a3, a4);
}

- (void)clearHistoryVisitsAddedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  -[WBSHistoryStore clearHistoryVisitsAddedAfterDate:beforeDate:completionHandler:](self->_historyStore, "clearHistoryVisitsAddedAfterDate:beforeDate:completionHandler:", a3, a4, a5);
}

- (void)clearHistory
{
  -[WBSHistory clearHistoryWithCompletionHandler:](self, "clearHistoryWithCompletionHandler:", 0);
}

- (void)clearHistoryWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *entriesByURLStringAccessQueue;
  uint64_t v6;
  id v7;
  void *v8;
  WBSHistoryStore *historyStore;
  _QWORD v10[5];
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v4 = a3;
  -[WBSHistory _waitUntilHistoryHasLoadedMainThread](self, "_waitUntilHistoryHasLoadedMainThread");
  v16 = 0;
  v17 = &v16;
  if (!v4)
    v4 = &__block_literal_global_50;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__17;
  v20 = __Block_byref_object_dispose__17;
  v21 = 0;
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E4B2BDF8;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E4B3ADD8;
  v7 = v4;
  v12[4] = self;
  v13 = v7;
  v14 = &v16;
  v8 = (void *)MEMORY[0x1A8599ED0](v12);
  if (objc_msgSend((id)v17[5], "count"))
  {
    historyStore = self->_historyStore;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_4;
    v10[3] = &unk_1E4B2A250;
    v10[4] = self;
    v11 = v8;
    -[WBSHistoryStore clearHistoryWithCompletionHandler:](historyStore, "clearHistoryWithCompletionHandler:", v10);

  }
  else
  {
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }

  _Block_object_dispose(&v16, 8);
}

void __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 16);
  *(_QWORD *)(v6 + 16) = v5;

}

uint64_t __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchHistoryCleared:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
}

uint64_t __48__WBSHistory_clearHistoryWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeAllVisitedLinks");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)vacuumHistoryWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__WBSHistory_vacuumHistoryWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E4B2A250;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[WBSHistory performBlockAfterHistoryHasLoaded:](self, "performBlockAfterHistoryHasLoaded:", v6);

}

uint64_t __49__WBSHistory_vacuumHistoryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "vacuumHistoryWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

- (void)performMaintenance
{
  -[WBSHistory performMaintenance:](self, "performMaintenance:", 0);
}

- (void)performMaintenance:(id)a3
{
  -[WBSHistoryStore performMaintenance:](self->_historyStore, "performMaintenance:", a3);
}

- (void)close
{
  -[WBSHistoryStore closeWithCompletionHandler:](self->_historyStore, "closeWithCompletionHandler:", 0);
}

- (void)closeWithCompletionHandler:(id)a3
{
  -[WBSHistoryStore closeWithCompletionHandler:](self->_historyStore, "closeWithCompletionHandler:", a3);
}

- (void)_waitUntilHistoryHasLoadedMainThread
{
  -[WBSHistory _loadHistory](self, "_loadHistory");
  -[WBSHistoryStore waitForLoadingToComplete](self->_historyStore, "waitForLoadingToComplete");
}

- (void)savePendingChangesBeforeTerminationWithCompletionHandler:(id)a3
{
  id v4;
  WBSHistoryStore *historyStore;
  id v6;

  v4 = a3;
  historyStore = self->_historyStore;
  v6 = v4;
  if (historyStore)
    -[WBSHistoryStore closeWithCompletionHandler:](historyStore, "closeWithCompletionHandler:", v4);
  else
    (*((void (**)(id))v4 + 2))(v4);

}

- (void)historyStore:(id)a3 didPrepareToDeleteWithDeletionPlan:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSHistory *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__WBSHistory_historyStore_didPrepareToDeleteWithDeletionPlan___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __62__WBSHistory_historyStore_didPrepareToDeleteWithDeletionPlan___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
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

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "discoveredItemsToDelete");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v2 = v22;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v28 != v4)
            objc_enumerationMutation(v2);
          v6 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "urlString");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (id)objc_msgSend(v6, "_removeItemForURLString:", v7);

        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v3);
    }

    v9 = *(void **)(a1 + 40);
    objc_msgSend(v2, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_dispatchHistoryItemsRemoved:", v10);

  }
  objc_msgSend(*(id *)(a1 + 32), "allVisitsToDeleteByItemExcludingItemsBeingDeleted");
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        objc_msgSend(v11, "objectForKey:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "updatedLastVisitsByItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKey:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v19 = *(void **)(a1 + 40);
          objc_msgSend(v15, "urlString");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "itemForURLString:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v19) = v21 == 0;

          if ((v19 & 1) == 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "_dispatchHistoryItemWillChange:", v15);
            objc_msgSend(v15, "removeVisits:candidateLastVisit:", v16, v18);
            objc_msgSend(*(id *)(a1 + 40), "_dispatchHistoryItemDidChange:byUserInitiatedAction:", v15, 0);
          }
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v12);
  }

}

void __42__WBSHistory__sendNotification_withItems___block_invoke_2(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", a1[4], a1[5], a1[6]);

}

- (void)_dispatchHistoryItemAdded:(id)a3 withVisitOrigin:(int64_t)a4
{
  id v6;
  WBSHistoryStore *historyStore;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  historyStore = self->_historyStore;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryStore itemsWereAdded:byUserInitiatedAction:](historyStore, "itemsWereAdded:byUserInitiatedAction:", v8, (unint64_t)(a4 - 4) < 0xFFFFFFFFFFFFFFFDLL);

  -[WBSHistory _addVisitedLinkForItemIfNeeded:withVisitOrigin:](self, "_addVisitedLinkForItemIfNeeded:withVisitOrigin:", v6, a4);
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryItemsWereAddedNotification"), v9);

}

- (void)_dispatchHistoryItemWillChange:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v6[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryItemWillChangeNotification"), v5);

}

- (void)_dispatchHistoryItemDidChange:(id)a3 byUserInitiatedAction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  WBSHistoryStore *historyStore;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  historyStore = self->_historyStore;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistoryStore itemsWereModified:byUserInitiatedAction:](historyStore, "itemsWereModified:byUserInitiatedAction:", v8, v4);

  v10 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryItemDidChangeNotification"), v9);

}

- (void)_dispatchHistoryItemsRemoved:(id)a3
{
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryItemsWereRemovedNotification"), a3);
}

- (void)_dispatchHistoryCleared:(id)a3
{
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryWasClearedNotification"), a3);
}

- (void)_dispatchHistoryVisitAdded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = CFSTR("WBSHistoryVisitKey");
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("WBSHistoryVisitWasAddedNotification"), self, v6);

}

- (BOOL)historyStoreShouldCheckDatabaseIntegrity:(id)a3
{
  return 0;
}

- (void)historyStoreWasCleared:(id)a3
{
  -[WBSHistory _sendNotification:withItems:](self, "_sendNotification:withItems:", CFSTR("WBSHistoryWasClearedNotification"), 0);
}

- (void)historyStore:(id)a3 didAddVisits:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  WBSHistory *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v26;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v11), "item");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          objc_msgSend(v12, "lastVisitOnSynchronizationQueue");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14 == 0;

          if (v15)
            v16 = v7;
          else
            v16 = v6;
          objc_msgSend(v16, "addObject:", v13);
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v9);
  }

  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __40__WBSHistory_historyStore_didAddVisits___block_invoke;
  v20[3] = &unk_1E4B399F0;
  v21 = v6;
  v22 = self;
  v23 = v8;
  v24 = v7;
  v17 = v7;
  v18 = v8;
  v19 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v20);

}

uint64_t __40__WBSHistory_historyStore_didAddVisits___block_invoke(id *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t result;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1[4], "count"))
    objc_msgSend(a1[5], "_sendNotification:withItems:", CFSTR("WBSHistoryItemWillChangeNotification"), a1[4]);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = a1[6];
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(v6, "item", (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
          objc_msgSend(v7, "addExistingVisit:", v6);

      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

  if (objc_msgSend(a1[4], "count"))
    objc_msgSend(a1[5], "_sendNotification:withItems:", CFSTR("WBSHistoryItemDidChangeNotification"), a1[4]);
  result = objc_msgSend(a1[7], "count", (_QWORD)v10);
  if (result)
    return objc_msgSend(a1[5], "_sendNotification:withItems:", CFSTR("WBSHistoryItemsWereAddedNotification"), a1[7]);
  return result;
}

- (void)historyStore:(id)a3 didRemoveVisits:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__WBSHistory_historyStore_didRemoveVisits___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __43__WBSHistory_historyStore_didRemoveVisits___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("WBSHistoryVisitsKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSHistoryVisitsWereRemovedFromDatabaseNotification"), v4, v5);

}

- (void)historyStore:(id)a3 didRemoveItems:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__WBSHistory_historyStore_didRemoveItems___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __42__WBSHistory_historyStore_didRemoveItems___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = CFSTR("WBSHistoryItemsKey");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSHistoryItemsWereRemovedFromDatabaseNotification"), v4, v5);

}

- (void)historyStore:(id)a3 didRemoveHostnames:(id)a4
{
  void *v4;
  id v5;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("WBSHistoryDidRemoveHostnamesNotification"), v5);

}

- (void)historyStore:(id)a3 didRemoveHighLevelDomains:(id)a4
{
  void *v4;
  id v5;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("WBSHistoryDidRemoveHighLevelDomainsNotification"), v5);

}

- (id)historyStore:(id)a3 itemForURLString:(id)a4 createIfNeeded:(BOOL)a5
{
  -[WBSHistory itemForURLString:createIfNeeded:](self, "itemForURLString:createIfNeeded:", a4, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)searchForUserTypedString:(id)a3 options:(unint64_t)a4 currentTime:(double)a5 enumerationBlock:(id)a6 completionHandler:(id)a7
{
  -[WBSHistoryStore searchForUserTypedString:options:currentTime:enumerationBlock:completionHandler:](self->_historyStore, "searchForUserTypedString:options:currentTime:enumerationBlock:completionHandler:", a3, a4, a6, a7, a5);
}

- (void)initializeCloudHistoryWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *waitUntilHistoryHasLoadedQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  waitUntilHistoryHasLoadedQueue = self->_waitUntilHistoryHasLoadedQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__WBSHistory_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(waitUntilHistoryHasLoadedQueue, block);

}

uint64_t __72__WBSHistory_initializeCloudHistoryWithConfiguration_completionHandler___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 56), "initializeCloudHistoryWithConfiguration:completionHandler:", a1[5], a1[6]);
}

+ (void)clearExistingSharedHistory
{
  void *v2;

  if (existingSharedHistory)
  {
    objc_msgSend(*(id *)(existingSharedHistory + 56), "closeWithCompletionHandler:", 0);
    v2 = (void *)existingSharedHistory;
    existingSharedHistory = 0;

  }
}

- (void)_unload
{
  NSObject *entriesByURLStringAccessQueue;
  WBSHistoryStore *historyStore;
  _QWORD block[5];

  self->_hasStartedLoadingHistory = 0;
  dispatch_suspend((dispatch_object_t)self->_waitUntilHistoryHasLoadedQueue);
  entriesByURLStringAccessQueue = self->_entriesByURLStringAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__WBSHistory__unload__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(entriesByURLStringAccessQueue, block);
  historyStore = self->_historyStore;
  self->_historyStore = 0;

}

uint64_t __21__WBSHistory__unload__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

- (id)_createHistoryStore
{
  return 0;
}

- (Class)_historyItemClass
{
  return (Class)objc_opt_class();
}

- (void)fetchHistoricalHighLevelDomainsWithCompletionHandler:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = (void (**)(id, id))a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__WBSHistory_fetchHistoricalHighLevelDomainsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B3AE20;
  v6 = v5;
  v8 = v6;
  -[WBSHistory enumerateItemsUsingBlock:](self, "enumerateItemsUsingBlock:", v7);
  v4[2](v4, v6);

}

void __67__WBSHistory_fetchHistoricalHighLevelDomainsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_highLevelDomainFromHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (double)historyAgeLimit
{
  return self->_historyAgeLimit;
}

- (WBSHistoryTagMap)historyTagMap
{
  return self->_historyTagMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_historyTagMap, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong((id *)&self->_entryCreationThrottler, 0);
  objc_storeStrong((id *)&self->_historyStore, 0);
  objc_storeStrong((id *)&self->_waitUntilHistoryHasLoadedQueue, 0);
  objc_storeStrong((id *)&self->_stringsForUserTypedDomainExpansion, 0);
  objc_storeStrong((id *)&self->_entriesByURLString, 0);
  objc_storeStrong((id *)&self->_entriesByURLStringAccessQueue, 0);
}

- (void)_addItem:(uint64_t)a3 addToStringsForUserTypedDomainExpansions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Can't add item with a nil URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)_removeItemForURLString:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Can't remove item with a nil URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)itemVisitedAtURLString:(uint64_t)a3 title:(uint64_t)a4 timeOfVisit:(uint64_t)a5 wasHTTPNonGet:(uint64_t)a6 wasFailure:(uint64_t)a7 increaseVisitCount:(uint64_t)a8 statusCode:origin:attributes:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1A3D90000, a1, a3, "Unable to create WBSHistoryVisit: received nil URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)itemRedirectedFrom:(uint64_t)a3 to:origin:date:statusCode:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a1, a3, "Destination URL for redirect is nil: %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Identifier: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_cold_2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_1A3D90000, a3, (uint64_t)a3, "Could not find or create a topic tag with error: %{public}@", (uint8_t *)a2);

}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_47_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_7(&dword_1A3D90000, a2, a3, "Identifier: %{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_2();
}

void __77__WBSHistory_addTagWithIdentifier_title_toItemAtURL_level_completionHandler___block_invoke_47_cold_2(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_1A3D90000, log, OS_LOG_TYPE_ERROR, "Could not assign history item (%ld) to topic with error: %{public}@", buf, 0x16u);

}

@end
