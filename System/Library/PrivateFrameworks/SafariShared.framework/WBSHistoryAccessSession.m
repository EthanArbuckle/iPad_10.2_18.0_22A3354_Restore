@implementation WBSHistoryAccessSession

- (WBSHistoryAccessSession)initWithHistoryService:(id)a3
{
  id v5;
  WBSHistoryAccessSession *v6;
  WBSHistoryAccessSession *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  WBSHistoryAccessSession *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSHistoryAccessSession;
  v6 = -[WBSHistoryAccessSession init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_historyService, a3);
    v8 = dispatch_queue_create("com.apple.SafariShared.WBSHistoryAccessSession", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7;
  }

  return v7;
}

- (void)getHistoryItemsVisitedAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  OS_dispatch_queue *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WBSHistoryService databaseAccessBroker](self->_historyService, "databaseAccessBroker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke;
  v16[3] = &unk_1E4B3AE48;
  v13 = v10;
  v19 = v13;
  v14 = v8;
  v17 = v14;
  v15 = v9;
  v18 = v15;
  objc_msgSend(v11, "requestAccessType:onQueue:completionHandler:", 0, queue, v16);

}

void __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
    v19 = v7;
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    v18 = v8;
    SafariShared::WBSSQLiteDatabaseFetch<double,double>(v5, CFSTR("SELECT history_items.*, history_visits.* FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item WHERE (history_visits.visit_time > ? AND history_visits.visit_time < ?) AND     NOT EXISTS (SELECT * FROM history_visits v2                 WHERE history_visits.history_item = v2.history_item AND                     (v2.visit_time > history_visits.visit_time OR                         (v2.visit_time = history_visits.visit_time AND                             (v2.synthesized < history_visits.synthesized OR                                 (v2.synthesized = history_visits.synthesized AND v2.id > history_visits.id)))))"), (double *)&v19, (double *)&v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSHistoryItem synchronizationQueue](WBSHistoryItem, "synchronizationQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke_2;
    v15[3] = &unk_1E4B2B448;
    v12 = v9;
    v16 = v12;
    v13 = v10;
    v17 = v13;
    dispatch_sync(v11, v15);

    (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13, 0, v14);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __88__WBSHistoryAccessSession_getHistoryItemsVisitedAfterDate_beforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  WBSHistoryItem *v5;
  void *v6;
  WBSRemoteHistoryItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WBSRemoteHistoryItem *v12;
  id obj;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v15;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v15 != v3)
          objc_enumerationMutation(obj);
        v5 = -[WBSHistoryItem initWithSQLiteRow:]([WBSHistoryItem alloc], "initWithSQLiteRow:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v4));
        -[WBSHistoryItem lastVisitOnSynchronizationQueue](v5, "lastVisitOnSynchronizationQueue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = [WBSRemoteHistoryItem alloc];
        -[WBSHistoryItem url](v5, "url");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "title");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v6, "visitTime");
        objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[WBSRemoteHistoryItem initWithURL:title:lastVisitTime:](v7, "initWithURL:title:lastVisitTime:", v8, v9, v11);

        objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v2);
  }

}

- (void)getHistoryVisitsAfterDate:(id)a3 beforeDate:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  OS_dispatch_queue *queue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WBSHistoryService databaseAccessBroker](self->_historyService, "databaseAccessBroker");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke;
  v16[3] = &unk_1E4B3AE48;
  v13 = v10;
  v19 = v13;
  v14 = v8;
  v17 = v14;
  v15 = v9;
  v18 = v15;
  objc_msgSend(v11, "requestAccessType:onQueue:completionHandler:", 0, queue, v16);

}

void __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
    v19 = v7;
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
    v18 = v8;
    SafariShared::WBSSQLiteDatabaseFetch<double &,double &>(v5, CFSTR("SELECT history_items.url, history_visits.visit_time FROM history_visits INNER JOIN history_items ON history_items.id = history_visits.history_item WHERE visit_time BETWEEN ? AND ?"), (double *)&v19, (double *)&v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[WBSHistoryItem synchronizationQueue](WBSHistoryItem, "synchronizationQueue");
    v11 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke_2;
    v15[3] = &unk_1E4B2B448;
    v12 = v9;
    v16 = v12;
    v13 = v10;
    v17 = v13;
    dispatch_sync(v11, v15);

    (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v13, 0, v14);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __82__WBSHistoryAccessSession_getHistoryVisitsAfterDate_beforeDate_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  WBSRemoteHistoryVisit *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v7 = (void *)MEMORY[0x1E0C99E98];
        objc_msgSend(v6, "stringAtIndex:", 0, (_QWORD)v14);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_URLWithDataAsString:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v6, "doubleAtIndex:", 1);
          objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = *(void **)(a1 + 40);
          v13 = -[WBSRemoteHistoryVisit initWithURL:date:]([WBSRemoteHistoryVisit alloc], "initWithURL:date:", v9, v11);
          objc_msgSend(v12, "addObject:", v13);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_historyService, 0);
}

@end
