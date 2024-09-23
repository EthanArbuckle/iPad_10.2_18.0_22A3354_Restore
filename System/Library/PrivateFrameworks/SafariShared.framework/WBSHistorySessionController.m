@implementation WBSHistorySessionController

+ (id)sharedSessionController
{
  if (+[WBSHistorySessionController sharedSessionController]::onceToken != -1)
    dispatch_once(&+[WBSHistorySessionController sharedSessionController]::onceToken, &__block_literal_global_66);
  return (id)+[WBSHistorySessionController sharedSessionController]::shared;
}

void __54__WBSHistorySessionController_sharedSessionController__block_invoke()
{
  WBSHistorySessionController *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WBSHistorySessionController alloc];
  +[WBSHistory existingSharedHistory](WBSHistory, "existingSharedHistory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WBSHistorySessionController initWithHistory:](v0, "initWithHistory:");
  v2 = (void *)+[WBSHistorySessionController sharedSessionController]::shared;
  +[WBSHistorySessionController sharedSessionController]::shared = v1;

}

- (WBSHistorySessionController)initWithHistory:(id)a3
{
  id v5;
  WBSHistorySessionController *v6;
  WBSHistorySessionController *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *sessionCacheAccessQueue;
  uint64_t v10;
  NSMutableDictionary *itemsBySession;
  WBSHistorySessionIntervalCache *v12;
  WBSHistorySessionIntervalCache *intervalCache;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  WBSHistorySessionController *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  objc_super v33;
  _QWORD v34[3];
  _BYTE v35[128];
  _QWORD v36[3];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v33.receiver = self;
  v33.super_class = (Class)WBSHistorySessionController;
  v6 = -[WBSHistorySessionController init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_history, a3);
    v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistorySessionController.sessionCacheAccess", 0);
    sessionCacheAccessQueue = v7->_sessionCacheAccessQueue;
    v7->_sessionCacheAccessQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    itemsBySession = v7->_itemsBySession;
    v7->_itemsBySession = (NSMutableDictionary *)v10;

    v12 = objc_alloc_init(WBSHistorySessionIntervalCache);
    intervalCache = v7->_intervalCache;
    v7->_intervalCache = v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v36[0] = CFSTR("WBSHistoryItemsWereLoadedNotification");
    v36[1] = CFSTR("WBSHistoryItemsWereAddedNotification");
    v36[2] = CFSTR("WBSHistoryItemDidChangeNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v30 != v17)
            objc_enumerationMutation(v15);
          objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__historyItemsWereAdded_, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v5);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v16);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v34[0] = CFSTR("WBSHistoryWasClearedNotification");
    v34[1] = CFSTR("WBSHistoryItemsWereRemovedNotification");
    v34[2] = CFSTR("WBSHistoryItemWillChangeNotification");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v26 != v21)
            objc_enumerationMutation(v19);
          objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__historyItemsWereRemoved_, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j), v5);
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      }
      while (v20);
    }

    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__timeZoneDidChange_, *MEMORY[0x1E0C998A0], 0);
    -[WBSHistorySessionController _loadSessionCache](v7, "_loadSessionCache");
    v23 = v7;

  }
  return v7;
}

- (void)enumerateOrderedItemsLastVisitedInSession:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionCacheAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSHistorySessionController_enumerateOrderedItemsLastVisitedInSession_usingBlock___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(sessionCacheAccessQueue, block);

}

void __84__WBSHistorySessionController_enumerateOrderedItemsLastVisitedInSession_usingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  id v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v4 = objc_msgSend(v2, "_getKey:forDate:", &v14);
  v5 = v14;

  if ((v4 & 1) != 0)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
          (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)orderedItemsNewerThanDate:(id)a3 maxCount:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *sessionCacheAccessQueue;
  uint64_t v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__WBSHistorySessionController_orderedItemsNewerThanDate_maxCount_completionHandler___block_invoke;
  v13[3] = &unk_1E4B3B798;
  v15 = v11;
  v13[4] = self;
  v14 = v9;
  v16 = a4;
  v12 = v9;
  dispatch_async(sessionCacheAccessQueue, v13);

}

void __84__WBSHistorySessionController_orderedItemsNewerThanDate_maxCount_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_orderedSessionKeys");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v16;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v24;
    v15 = *(_QWORD *)v24;
    do
    {
      v6 = 0;
      v17 = v3;
      do
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v6);
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v7, v15);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v20;
          v11 = v4;
          while (2)
          {
            v12 = 0;
            v4 = v11 + v9;
            do
            {
              if (*(_QWORD *)v20 != v10)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
              objc_msgSend(v13, "lastVisitedTimeInterval");
              if (v14 < *(double *)(a1 + 48) || v11 + v12 == *(_QWORD *)(a1 + 56))
              {
                (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

                goto LABEL_19;
              }
              objc_msgSend(v2, "addObject:", v13);
              ++v12;
            }
            while (v9 != v12);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            v11 = v4;
            v5 = v15;
            if (v9)
              continue;
            break;
          }
        }

        ++v6;
      }
      while (v6 != v17);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v3);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_19:

}

- (id)itemLastVisitedInSession:(id)a3 atIndex:(unint64_t)a4
{
  id v6;
  NSObject *sessionCacheAccessQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__25;
  v19 = __Block_byref_object_dispose__25;
  v20 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __64__WBSHistorySessionController_itemLastVisitedInSession_atIndex___block_invoke;
  v11[3] = &unk_1E4B3C548;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(sessionCacheAccessQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __64__WBSHistorySessionController_itemLastVisitedInSession_atIndex___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v4 = objc_msgSend(v2, "_getKey:forDate:", &v11);
  v5 = v11;

  if ((v4 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") <= *(_QWORD *)(a1 + 56))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;
    }

  }
}

- (unint64_t)numberOfSessions
{
  NSObject *sessionCacheAccessQueue;
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
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__WBSHistorySessionController_numberOfSessions__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionCacheAccessQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__WBSHistorySessionController_numberOfSessions__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)numberOfItemsVisitedInSession:(id)a3
{
  id v4;
  NSObject *sessionCacheAccessQueue;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__WBSHistorySessionController_numberOfItemsVisitedInSession___block_invoke;
  block[3] = &unk_1E4B3ACC8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(sessionCacheAccessQueue, block);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __61__WBSHistorySessionController_numberOfItemsVisitedInSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v6 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v6);
  v4 = v6;

  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v5, "count");

  }
}

- (id)itemsLastVisitedInSession:(id)a3
{
  id v4;
  NSObject *sessionCacheAccessQueue;
  id v6;
  id v7;
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
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  v17 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSHistorySessionController_itemsLastVisitedInSession___block_invoke;
  block[3] = &unk_1E4B3ACC8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(sessionCacheAccessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__WBSHistorySessionController_itemsLastVisitedInSession___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v9);
  v4 = v9;

  if ((v2 & 1) != 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (NSArray)orderedSessions
{
  NSObject *sessionCacheAccessQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__25;
  v10 = __Block_byref_object_dispose__25;
  v11 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__WBSHistorySessionController_orderedSessions__block_invoke;
  v5[3] = &unk_1E4B2BDF8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sessionCacheAccessQueue, v5);
  objc_msgSend((id)v7[5], "safari_mapObjectsUsingBlock:", &__block_literal_global_20_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __46__WBSHistorySessionController_orderedSessions__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_orderedSessionKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

WBSHistorySession *__46__WBSHistorySessionController_orderedSessions__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WBSHistorySession *v3;
  void *v4;
  void *v5;
  WBSHistorySession *v6;

  v2 = a2;
  v3 = [WBSHistorySession alloc];
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSHistorySession initWithSessionStartDate:](v3, "initWithSessionStartDate:", v5);

  return v6;
}

- (void)orderedSessionsWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *sessionCacheAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__WBSHistorySessionController_orderedSessionsWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B2A250;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(sessionCacheAccessQueue, v7);

}

void __68__WBSHistorySessionController_orderedSessionsWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_orderedSessionKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapObjectsUsingBlock:", &__block_literal_global_23_0);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

WBSHistorySession *__68__WBSHistorySessionController_orderedSessionsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  WBSHistorySession *v3;
  void *v4;
  void *v5;
  WBSHistorySession *v6;

  v2 = a2;
  v3 = [WBSHistorySession alloc];
  v4 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v2, "doubleValue");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSHistorySession initWithSessionStartDate:](v3, "initWithSessionStartDate:", v5);

  return v6;
}

- (id)sessionForItem:(id)a3
{
  id v4;
  NSObject *sessionCacheAccessQueue;
  id v6;
  id v7;
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
  v15 = __Block_byref_object_copy__25;
  v16 = __Block_byref_object_dispose__25;
  v17 = 0;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__WBSHistorySessionController_sessionForItem___block_invoke;
  block[3] = &unk_1E4B3ACC8;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(sessionCacheAccessQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __46__WBSHistorySessionController_sessionForItem___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  WBSHistorySession *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastVisitedTimeInterval");
  objc_msgSend(v2, "beginningOfSessionContainingTime:");
  v4 = v3;
  v5 = [WBSHistorySession alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = -[WBSHistorySession initWithSessionStartDate:](v5, "initWithSessionStartDate:");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)_orderedSessionKeys
{
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *orderedSessions;

  if (!-[NSArray count](self->_orderedSessions, "count")
    && -[NSMutableDictionary count](self->_itemsBySession, "count"))
  {
    -[NSMutableDictionary allKeys](self->_itemsBySession, "allKeys");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sortedArrayUsingSelector:", sel_compare_);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reverseObjectEnumerator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    orderedSessions = self->_orderedSessions;
    self->_orderedSessions = v6;

  }
  return self->_orderedSessions;
}

- (BOOL)_getKey:(id *)a3 forDate:(double)a4
{
  void *v6;
  id v7;
  void *v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[WBSHistorySessionIntervalCache beginningOfSessionContainingTime:](self->_intervalCache, "beginningOfSessionContainingTime:", a4);
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *a3 = v7;
  -[NSMutableDictionary objectForKey:](self->_itemsBySession, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = v8 != 0;

  return (char)a3;
}

- (void)_requestSessionKeyForDate:(id)a3 withBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *sessionCacheAccessQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__WBSHistorySessionController__requestSessionKeyForDate_withBlock___block_invoke;
  block[3] = &unk_1E4B2B178;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(sessionCacheAccessQueue, block);

}

void __67__WBSHistorySessionController__requestSessionKeyForDate_withBlock___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v4 = 0;
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v4);
  v3 = v4;
  if ((v2 & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (unint64_t)_insertItem:(id)a3 withSessionKey:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  unsigned int v10;
  void *v11;
  double v12;
  double v13;
  unint64_t v14;
  void *v15;
  double v16;
  double v17;
  unsigned int v18;
  void *v19;
  double v20;
  double v21;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_itemsBySession, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "lastVisitedTimeInterval");
    v9 = v8;
    v10 = objc_msgSend(v7, "count");
    if (v10
      && (objc_msgSend(v7, "objectAtIndexedSubscript:", 0),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "lastVisitedTimeInterval"),
          v13 = v12,
          v11,
          v13 >= v9))
    {
      objc_msgSend(v7, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "lastVisitedTimeInterval");
      v17 = v16;

      if (v17 >= v9)
      {
        objc_msgSend(v7, "addObject:", v6);
        v14 = objc_msgSend(v7, "count") - 1;
      }
      else
      {
        LODWORD(v14) = 0;
        do
        {
          v18 = v14 + ((v10 - v14) >> 1);
          objc_msgSend(v7, "objectAtIndexedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "lastVisitedTimeInterval");
          v21 = v20;

          if (v21 >= v9)
            v14 = v18 + 1;
          else
            v14 = v14;
          if (v21 < v9)
            v10 = v18;
        }
        while (v14 < v10);
        objc_msgSend(v7, "insertObject:atIndex:", v6, v14);
      }
    }
    else
    {
      objc_msgSend(v7, "insertObject:atIndex:", v6, 0);
      v14 = 0;
    }
  }
  else
  {
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v14;
}

- (void)_addItemsToSessionCache:(id)a3 shouldPostChangeNotification:(BOOL)a4
{
  id v6;
  NSObject *sessionCacheAccessQueue;
  id v8;
  _QWORD block[4];
  id v10;
  WBSHistorySessionController *v11;
  BOOL v12;

  v6 = a3;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke;
  block[3] = &unk_1E4B2AB18;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(sessionCacheAccessQueue, block);

}

void __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  WBSHistorySession *v19;
  void *v20;
  void *v21;
  WBSHistorySession *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD block[5];
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v30 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "lastVisit");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "hasAttributes:", 16);

        objc_msgSend(v7, "lastVisitRedirectDestinationItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          v11 = v9;
        else
          v11 = 1;

        if ((v11 & 1) != 0)
        {
          objc_msgSend(v7, "lastVisitedTimeInterval");
          v12 = *(void **)(a1 + 40);
          v28 = 0;
          v13 = objc_msgSend(v12, "_getKey:forDate:", &v28);
          v14 = v28;
          if (v13)
          {
            v15 = objc_msgSend(*(id *)(a1 + 40), "_insertItem:withSessionKey:", v7, v14);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", v16, v14);

            v17 = *(_QWORD *)(a1 + 40);
            v18 = *(void **)(v17 + 24);
            *(_QWORD *)(v17 + 24) = 0;

            v15 = 0;
          }
          if (*(_BYTE *)(a1 + 48))
          {
            v19 = [WBSHistorySession alloc];
            v20 = (void *)MEMORY[0x1E0C99D68];
            objc_msgSend(v14, "doubleValue");
            objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[WBSHistorySession initWithSessionStartDate:](v19, "initWithSessionStartDate:", v21);

            objc_msgSend(v2, "objectForKey:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (v23)
            {
              objc_msgSend(v23, "addIndex:", v15);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3788], "indexSetWithIndex:", v15);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v2, "setObject:forKey:", v25, v22);

            }
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v4);
  }

  if (objc_msgSend(v2, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke_2;
    block[3] = &unk_1E4B2B448;
    block[4] = *(_QWORD *)(a1 + 40);
    v27 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __84__WBSHistorySessionController__addItemsToSessionCache_shouldPostChangeNotification___block_invoke_2(uint64_t a1)
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
  v6 = CFSTR("WBSHistorySessionsWithAddedItems");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSHistorySessionsDidChangeNotification"), v4, v5);

}

- (void)_removeItemsFromSessionCache:(id)a3
{
  id v4;
  NSObject *sessionCacheAccessQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  WBSHistorySessionController *v9;

  v4 = a3;
  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke;
  v7[3] = &unk_1E4B2B448;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(sessionCacheAccessQueue, v7);

}

void __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id obj;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  id v22;
  _QWORD block[5];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = *v2;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v20)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v3 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v3, "lastVisitedTimeInterval");
        v4 = *(void **)(a1 + 40);
        v29 = 0;
        objc_msgSend(v4, "_getKey:forDate:", &v29);
        v22 = v29;
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = v5;
        if (v5 && (v7 = objc_msgSend(v5, "indexOfObjectIdenticalTo:", v3), v7 != 0x7FFFFFFFFFFFFFFFLL))
        {
LABEL_18:
          objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "addObject:", v15);

          objc_msgSend(v6, "removeObjectAtIndex:", v7);
          if (objc_msgSend(v6, "count"))
            goto LABEL_21;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "removeObjectForKey:", v22);
          v16 = *(_QWORD *)(a1 + 40);
          v8 = *(id *)(v16 + 24);
          *(_QWORD *)(v16 + 24) = 0;
        }
        else
        {
          v27 = 0u;
          v28 = 0u;
          v25 = 0u;
          v26 = 0u;
          v8 = *(id *)(*(_QWORD *)(a1 + 40) + 16);
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v9)
          {
            v10 = *(_QWORD *)v26;
            while (2)
            {
              v11 = 0;
              v12 = v6;
              do
              {
                if (*(_QWORD *)v26 != v10)
                  objc_enumerationMutation(v8);
                v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v11);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "objectForKeyedSubscript:", v13);
                v6 = (void *)objc_claimAutoreleasedReturnValue();

                v7 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v3);
                if (v7 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v14 = v13;

                  v22 = v14;
                  goto LABEL_18;
                }
                ++v11;
                v12 = v6;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
              if (v9)
                continue;
              break;
            }
          }
        }

LABEL_21:
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v20);
  }

  if (objc_msgSend(v18, "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke_2;
    block[3] = &unk_1E4B2B448;
    block[4] = *(_QWORD *)(a1 + 40);
    v24 = v18;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __60__WBSHistorySessionController__removeItemsFromSessionCache___block_invoke_2(uint64_t a1)
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
  v6 = CFSTR("WBSHistorySessionsRemovedItems");
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WBSHistorySessionsDidChangeNotification"), v4, v5);

}

- (void)_clearSessionCache
{
  NSObject *sessionCacheAccessQueue;
  _QWORD block[5];

  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__WBSHistorySessionController__clearSessionCache__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(sessionCacheAccessQueue, block);
}

void __49__WBSHistorySessionController__clearSessionCache__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

}

- (void)_loadSessionCache
{
  void *v3;
  NSObject *sessionCacheAccessQueue;
  _QWORD block[5];

  -[WBSHistory allItems](self->_history, "allItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSHistorySessionController _addItemsToSessionCache:shouldPostChangeNotification:](self, "_addItemsToSessionCache:shouldPostChangeNotification:", v3, 0);

  sessionCacheAccessQueue = self->_sessionCacheAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__WBSHistorySessionController__loadSessionCache__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(sessionCacheAccessQueue, block);
}

void __48__WBSHistorySessionController__loadSessionCache__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  LOBYTE(v2) = objc_msgSend(v2, "_getKey:forDate:", &v6);
  v4 = v6;

  if ((v2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v5, v4);

  }
}

- (void)_dispatchHistorySessionsDidChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("WBSHistorySessionsDidChangeNotification"), self);

}

- (void)_historyItemsWereAdded:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_arrayForKey:", CFSTR("WBSHistoryItemsKey"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
    -[WBSHistorySessionController _addItemsToSessionCache:shouldPostChangeNotification:](self, "_addItemsToSessionCache:shouldPostChangeNotification:", v5, 1);

}

- (void)_historyItemsWereRemoved:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "safari_arrayForKey:", CFSTR("WBSHistoryItemsKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      -[WBSHistorySessionController _removeItemsFromSessionCache:](self, "_removeItemsFromSessionCache:", v5);

    v4 = v6;
  }

}

- (void)_timeZoneDidChange:(id)a3
{
  NSObject *v4;
  _QWORD block[5];

  dispatch_get_global_queue(0, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSHistorySessionController__timeZoneDidChange___block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __50__WBSHistorySessionController__timeZoneDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[5];
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  v4 = *(NSObject **)(v2 + 8);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_2;
  block[3] = &unk_1E4B2A2C8;
  block[4] = v2;
  dispatch_sync(v4, block);
  objc_msgSend(*(id *)(a1 + 32), "_clearSessionCache");
  objc_msgSend(*(id *)(a1 + 32), "_loadSessionCache");
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_3;
  v5[3] = &unk_1E4B2A2C8;
  v5[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

void __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_2(uint64_t a1)
{
  WBSHistorySessionIntervalCache *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(WBSHistorySessionIntervalCache);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

uint64_t __50__WBSHistorySessionController__timeZoneDidChange___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dispatchHistorySessionsDidChangeNotification");
}

- (WBSHistory)history
{
  return self->_history;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_intervalCache, 0);
  objc_storeStrong((id *)&self->_orderedSessions, 0);
  objc_storeStrong((id *)&self->_itemsBySession, 0);
  objc_storeStrong((id *)&self->_sessionCacheAccessQueue, 0);
}

@end
