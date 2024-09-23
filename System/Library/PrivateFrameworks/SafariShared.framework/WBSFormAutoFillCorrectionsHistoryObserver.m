@implementation WBSFormAutoFillCorrectionsHistoryObserver

- (WBSFormAutoFillCorrectionsHistoryObserver)initWithCorrectionsStore:(id)a3
{
  id v5;
  WBSFormAutoFillCorrectionsHistoryObserver *v6;
  WBSFormAutoFillCorrectionsHistoryObserver *v7;
  uint64_t v8;
  NSMutableArray *pendingRemovedHistoryItemsToProcess;
  uint64_t v10;
  NSMutableArray *pendingRemovedHistoryVisitsToProcess;
  dispatch_queue_t v12;
  OS_dispatch_queue *processingQueue;
  void *v14;
  WBSFormAutoFillCorrectionsHistoryObserver *v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSFormAutoFillCorrectionsHistoryObserver;
  v6 = -[WBSFormAutoFillCorrectionsHistoryObserver init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_correctionsStore, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    pendingRemovedHistoryItemsToProcess = v7->_pendingRemovedHistoryItemsToProcess;
    v7->_pendingRemovedHistoryItemsToProcess = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    pendingRemovedHistoryVisitsToProcess = v7->_pendingRemovedHistoryVisitsToProcess;
    v7->_pendingRemovedHistoryVisitsToProcess = (NSMutableArray *)v10;

    v12 = dispatch_queue_create("com.apple.Safari.WBSFormAutoFillCorrectionsHistory", 0);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v12;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__historyItemsWereRemoved_, CFSTR("WBSHistoryItemsWereRemovedFromDatabaseNotification"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__historyVisitsWereRemoved_, CFSTR("WBSHistoryVisitsWereRemovedFromDatabaseNotification"), 0);
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__historyWasCleared_, CFSTR("WBSHistoryWasClearedNotification"), 0);
    v15 = v7;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)WBSFormAutoFillCorrectionsHistoryObserver;
  -[WBSFormAutoFillCorrectionsHistoryObserver dealloc](&v2, sel_dealloc);
}

- (void)flushPendingChangesAndDisconnectFromStoreAndHistory
{
  void *v3;
  NSObject *processingQueue;
  WBSFormAutoFillCorrectionsStore *correctionsStore;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__WBSFormAutoFillCorrectionsHistoryObserver_flushPendingChangesAndDisconnectFromStoreAndHistory__block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  correctionsStore = self->_correctionsStore;
  self->_correctionsStore = 0;

}

uint64_t __96__WBSFormAutoFillCorrectionsHistoryObserver_flushPendingChangesAndDisconnectFromStoreAndHistory__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateUpdateCoalescingTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_updateCorrectionsStoreNow");
}

- (void)_historyItemsWereRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *processingQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WBSHistoryItemsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  processingQueue = self->_processingQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__WBSFormAutoFillCorrectionsHistoryObserver__historyItemsWereRemoved___block_invoke;
  v10[3] = &unk_1E4B2B448;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(processingQueue, v10);

}

uint64_t __70__WBSFormAutoFillCorrectionsHistoryObserver__historyItemsWereRemoved___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateCorrectionsStoreSoon");
}

- (void)_historyVisitsWereRemoved:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *processingQueue;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WBSHistoryVisitsKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  processingQueue = self->_processingQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__WBSFormAutoFillCorrectionsHistoryObserver__historyVisitsWereRemoved___block_invoke;
  v10[3] = &unk_1E4B2B448;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_async(processingQueue, v10);

}

uint64_t __71__WBSFormAutoFillCorrectionsHistoryObserver__historyVisitsWereRemoved___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateCorrectionsStoreSoon");
}

- (void)_historyWasCleared:(id)a3
{
  NSObject *processingQueue;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke;
  block[3] = &unk_1E4B2A2C8;
  block[4] = self;
  dispatch_async(processingQueue, block);
}

uint64_t __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 48);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_2;
  v4[3] = &unk_1E4B39148;
  v4[4] = v1;
  return objc_msgSend(v2, "removeAllLocalClassificationsWithCompletionHandler:", v4);
}

void __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_3;
    block[3] = &unk_1E4B2A2C8;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

uint64_t __64__WBSFormAutoFillCorrectionsHistoryObserver__historyWasCleared___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_invalidateUpdateCoalescingTimer");
  return objc_msgSend(*(id *)(a1 + 32), "_updateCorrectionsStoreNow");
}

- (void)_invalidateUpdateCoalescingTimer
{
  NSObject *coalescingTimerSource;

  coalescingTimerSource = self->_coalescingTimerSource;
  if (coalescingTimerSource)
  {
    dispatch_source_cancel(coalescingTimerSource);
    coalescingTimerSource = self->_coalescingTimerSource;
  }
  self->_coalescingTimerSource = 0;

}

- (void)_updateCorrectionsStoreSoon
{
  OS_dispatch_source *v3;
  OS_dispatch_source *coalescingTimerSource;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[WBSFormAutoFillCorrectionsHistoryObserver _invalidateUpdateCoalescingTimer](self, "_invalidateUpdateCoalescingTimer");
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_processingQueue);
  coalescingTimerSource = self->_coalescingTimerSource;
  self->_coalescingTimerSource = v3;

  v5 = self->_coalescingTimerSource;
  v6 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v5, v6, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  v7 = self->_coalescingTimerSource;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreSoon__block_invoke;
  v8[3] = &unk_1E4B2C008;
  objc_copyWeak(&v9, &location);
  dispatch_source_set_event_handler(v7, v8);
  dispatch_resume((dispatch_object_t)self->_coalescingTimerSource);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __72__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreSoon__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateCorrectionsStoreNow");

}

- (id)_normalizeURL:(id)a3
{
  id v4;
  WBSCrowdsourcedFeedbackDomainNormalizer *domainNormalizer;
  WBSCrowdsourcedFeedbackDomainNormalizer *v6;
  WBSCrowdsourcedFeedbackDomainNormalizer *v7;
  void *v8;
  void *v9;

  v4 = a3;
  domainNormalizer = self->_domainNormalizer;
  if (!domainNormalizer)
  {
    v6 = objc_alloc_init(WBSCrowdsourcedFeedbackDomainNormalizer);
    v7 = self->_domainNormalizer;
    self->_domainNormalizer = v6;

    domainNormalizer = self->_domainNormalizer;
  }
  objc_msgSend(v4, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSCrowdsourcedFeedbackDomainNormalizer transformedValue:](domainNormalizer, "transformedValue:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_updateCorrectionsStoreNow
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableArray count](self->_pendingRemovedHistoryItemsToProcess, "count")
    || -[NSMutableArray count](self->_pendingRemovedHistoryVisitsToProcess, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v4 = self->_pendingRemovedHistoryItemsToProcess;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "url", v23);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsHistoryObserver _normalizeURL:](self, "_normalizeURL:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, v9);

        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v5);
    }

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v10 = self->_pendingRemovedHistoryVisitsToProcess;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (j = 0; j != v11; ++j)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
          objc_msgSend(v14, "item", v23);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "url");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSFormAutoFillCorrectionsHistoryObserver _normalizeURL:](self, "_normalizeURL:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "visitTime");
            v20 = v19;
            if (!v18 || (objc_msgSend(v18, "timeIntervalSinceReferenceDate"), v21 > v20))
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, v17);

            }
          }

        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v11);
    }

    -[NSMutableArray removeAllObjects](self->_pendingRemovedHistoryVisitsToProcess, "removeAllObjects");
    -[NSMutableArray removeAllObjects](self->_pendingRemovedHistoryItemsToProcess, "removeAllObjects");
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __71__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreNow__block_invoke;
    v24[3] = &unk_1E4B391B0;
    v24[4] = self;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v24);

  }
}

uint64_t __71__WBSFormAutoFillCorrectionsHistoryObserver__updateCorrectionsStoreNow__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeLocalClassificationsForDomain:recordedOnOrAfter:completionHandler:", a2, a3, &__block_literal_global_44);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_correctionsStore, 0);
  objc_storeStrong((id *)&self->_domainNormalizer, 0);
  objc_storeStrong((id *)&self->_coalescingTimerSource, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_pendingRemovedHistoryVisitsToProcess, 0);
  objc_storeStrong((id *)&self->_pendingRemovedHistoryItemsToProcess, 0);
}

@end
