@implementation VCSpotlightSyncService

- (VCSpotlightSyncService)initWithDatabaseProvider:(id)a3 eventHandler:(id)a4
{
  id v7;
  id v8;
  VCSpotlightSyncService *v9;
  VCSpotlightSyncService *v10;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  NSMutableSet *v15;
  NSMutableSet *queuedModified;
  NSMutableSet *v17;
  NSMutableSet *queuedInserted;
  NSMutableSet *v19;
  NSMutableSet *queuedRemoved;
  id v21;
  uint64_t v22;
  CSSearchableIndex *index;
  uint64_t v24;
  WFDebouncer *debouncer;
  VCSpotlightSyncService *v26;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CA6B38], "isIndexingAvailable") & 1) != 0)
  {
    v28.receiver = self;
    v28.super_class = (Class)VCSpotlightSyncService;
    v9 = -[VCSpotlightSyncService init](&v28, sel_init);
    if (!v9)
    {
      v26 = 0;
      goto LABEL_8;
    }
    v10 = v9;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create("com.apple.VoiceShortcuts.SpotlightSyncService", v12);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v10->_databaseProvider, a3);
    objc_storeStrong((id *)&v10->_eventHandler, a4);
    v15 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queuedModified = v10->_queuedModified;
    v10->_queuedModified = v15;

    v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queuedInserted = v10->_queuedInserted;
    v10->_queuedInserted = v17;

    v19 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    queuedRemoved = v10->_queuedRemoved;
    v10->_queuedRemoved = v19;

    v21 = objc_alloc(MEMORY[0x1E0CA6B38]);
    v22 = objc_msgSend(v21, "initWithName:bundleIdentifier:", CFSTR("voiceshortcuts-spotlight-index-name"), *MEMORY[0x1E0DC7FD8]);
    index = v10->_index;
    v10->_index = (CSSearchableIndex *)v22;

    v10->_isFetchingClientState = 0;
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD9D10]), "initWithDelay:queue:", v10->_queue, 3.0);
    debouncer = v10->_debouncer;
    v10->_debouncer = (WFDebouncer *)v24;

    -[WFDebouncer addTarget:action:](v10->_debouncer, "addTarget:action:", v10, sel_sync);
    self = v10;
    v26 = self;
  }
  else
  {
    getWFSpotlightSyncLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[VCSpotlightSyncService initWithDatabaseProvider:eventHandler:]";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEBUG, "%s Spotlight indexing is not available.", buf, 0xCu);
    }
    v26 = 0;
  }

LABEL_8:
  return v26;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[VCSpotlightSyncService eventHandler](self, "eventHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:", self, CFSTR("com.apple.mobile.keybagd.first_unlock"));

  v4.receiver = self;
  v4.super_class = (Class)VCSpotlightSyncService;
  -[VCSpotlightSyncService dealloc](&v4, sel_dealloc);
}

- (void)start
{
  void *v3;
  void *v4;
  id v5;

  -[VCSpotlightSyncService databaseProvider](self, "databaseProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "databaseWithError:", 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "addObjectObserver:", self);
    -[VCSpotlightSyncService requestSync](self, "requestSync");
  }
  else
  {
    -[VCSpotlightSyncService eventHandler](self, "eventHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:", self, sel_start, CFSTR("com.apple.mobile.keybagd.first_unlock"));

  }
}

- (void)databaseDidChange:(id)a3 modified:(id)a4 inserted:(id)a5 removed:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WFWorkflowChangeset *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  VCSpotlightSyncService *v28;
  void *v29;
  VCSpotlightSyncService *v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = a3;
  getWFSpotlightSyncLogObject();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v33 = "-[VCSpotlightSyncService databaseDidChange:modified:inserted:removed:]";
    v34 = 2050;
    v35 = objc_msgSend(v10, "count");
    v36 = 2050;
    v37 = objc_msgSend(v11, "count");
    v38 = 2050;
    v39 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_INFO, "%s Database results updated: %{public}lu modified, %{public}lu inserted, %{public}lu removed records", buf, 0x2Au);
  }

  VCWorkflowReferencesFromDescriptors(v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  VCWorkflowReferencesFromDescriptors(v13, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  VCWorkflowReferencesFromDescriptors(v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  v20 = -[WFWorkflowChangeset initWithModifiedWorkflows:insertedWorkflows:removedWorkflows:]([WFWorkflowChangeset alloc], "initWithModifiedWorkflows:insertedWorkflows:removedWorkflows:", v17, v15, v19);
  -[WFWorkflowChangeset changesetForVisibleWorkflows](v20, "changesetForVisibleWorkflows");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "isEmpty"))
  {
    getWFSpotlightSyncLogObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v33 = "-[VCSpotlightSyncService databaseDidChange:modified:inserted:removed:]";
      _os_log_impl(&dword_1C146A000, v22, OS_LOG_TYPE_INFO, "%s Received db change notification, but no shortcuts were changed. Skipping sync.", buf, 0xCu);
    }

  }
  else
  {
    v30 = self;
    v31 = v10;
    objc_msgSend(v21, "inserted");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "count");
    objc_msgSend(v21, "modified");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "count") + v24;

    if (v26 < 0xB)
    {
      v28 = v30;
      v29 = v21;
    }
    else
    {
      getWFSpotlightSyncLogObject();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v33 = "-[VCSpotlightSyncService databaseDidChange:modified:inserted:removed:]";
        v34 = 2048;
        v35 = v26;
        v36 = 2048;
        v37 = 10;
        _os_log_impl(&dword_1C146A000, v27, OS_LOG_TYPE_DEFAULT, "%s We have delta update information, but the # of changed records larger than our batch size. Dropping down to regular indexing to stay within batch size (totalToIndex=%lu, batchSize=%lu)", buf, 0x20u);
      }

      v28 = v30;
      v29 = 0;
    }
    -[VCSpotlightSyncService syncWithChangeset:](v28, "syncWithChangeset:", v29);
    v10 = v31;
  }

}

- (void)requestSync
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = 136315138;
    v6 = "-[VCSpotlightSyncService requestSync]";
    _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_DEBUG, "%s Poking the debouncer to manually request a sync", (uint8_t *)&v5, 0xCu);
  }

  -[VCSpotlightSyncService debouncer](self, "debouncer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "poke");

}

- (void)sync
{
  -[VCSpotlightSyncService syncWithChangeset:](self, "syncWithChangeset:", 0);
}

- (void)syncWithChangeset:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  getWFSpotlightSyncLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v12 = "-[VCSpotlightSyncService syncWithChangeset:]";
    _os_log_impl(&dword_1C146A000, v5, OS_LOG_TYPE_INFO, "%s Starting a spotlight index sync", buf, 0xCu);
  }

  -[VCSpotlightSyncService queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__VCSpotlightSyncService_syncWithChangeset___block_invoke;
  block[3] = &unk_1E7AA7330;
  block[4] = self;
  v9 = v4;
  v10 = v4 != 0;
  v7 = v4;
  dispatch_async(v6, block);

}

- (void)syncOperationFinishedWithRequestToRelaunch:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  -[VCSpotlightSyncService queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__VCSpotlightSyncService_syncOperationFinishedWithRequestToRelaunch___block_invoke;
  v6[3] = &unk_1E7AA7358;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (WFDebouncer)debouncer
{
  return self->_debouncer;
}

- (SwiftVCDaemonXPCEventHandler)eventHandler
{
  return self->_eventHandler;
}

- (VCSpotlightSyncOperation)syncOperation
{
  return self->_syncOperation;
}

- (void)setSyncOperation:(id)a3
{
  objc_storeStrong((id *)&self->_syncOperation, a3);
}

- (WFDatabaseProvider)databaseProvider
{
  return self->_databaseProvider;
}

- (CSSearchableIndex)index
{
  return self->_index;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSMutableSet)queuedModified
{
  return self->_queuedModified;
}

- (void)setQueuedModified:(id)a3
{
  objc_storeStrong((id *)&self->_queuedModified, a3);
}

- (NSMutableSet)queuedInserted
{
  return self->_queuedInserted;
}

- (void)setQueuedInserted:(id)a3
{
  objc_storeStrong((id *)&self->_queuedInserted, a3);
}

- (NSMutableSet)queuedRemoved
{
  return self->_queuedRemoved;
}

- (void)setQueuedRemoved:(id)a3
{
  objc_storeStrong((id *)&self->_queuedRemoved, a3);
}

- (BOOL)isFetchingClientState
{
  return self->_isFetchingClientState;
}

- (void)setIsFetchingClientState:(BOOL)a3
{
  self->_isFetchingClientState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedRemoved, 0);
  objc_storeStrong((id *)&self->_queuedInserted, 0);
  objc_storeStrong((id *)&self->_queuedModified, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_syncOperation, 0);
  objc_storeStrong((id *)&self->_eventHandler, 0);
  objc_storeStrong((id *)&self->_debouncer, 0);
}

void __69__VCSpotlightSyncService_syncOperationFinishedWithRequestToRelaunch___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  WFWorkflowChangeset *v4;
  void *v5;
  void *v6;
  void *v7;
  WFWorkflowChangeset *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  getWFSpotlightSyncLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = CFSTR("YES");
    if (!*(_BYTE *)(a1 + 40))
      v3 = CFSTR("NO");
    v9 = 136315394;
    v10 = "-[VCSpotlightSyncService syncOperationFinishedWithRequestToRelaunch:]_block_invoke";
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_1C146A000, v2, OS_LOG_TYPE_INFO, "%s Sync operation finished with changes: (%@)", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CBDB38], "_resetCache");
  objc_msgSend(*(id *)(a1 + 32), "setSyncOperation:", 0);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "count")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "count"))
  {
    v4 = [WFWorkflowChangeset alloc];
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
    v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
    v7 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "copy");
    v8 = -[WFWorkflowChangeset initWithModifiedWorkflows:insertedWorkflows:removedWorkflows:](v4, "initWithModifiedWorkflows:insertedWorkflows:removedWorkflows:", v5, v6, v7);

    objc_msgSend(*(id *)(a1 + 32), "syncWithChangeset:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeAllObjects");
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeAllObjects");

  }
  else if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "sync");
  }
}

void __44__VCSpotlightSyncService_syncWithChangeset___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  char v17;
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "syncOperation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {

LABEL_4:
    getWFSpotlightSyncLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
      _os_log_impl(&dword_1C146A000, v3, OS_LOG_TYPE_INFO, "%s Sync in progress, dropping request.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "queuedModified");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "modified");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", v5);

    objc_msgSend(*(id *)(a1 + 32), "queuedInserted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "inserted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unionSet:", v7);

    objc_msgSend(*(id *)(a1 + 32), "queuedRemoved");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "removed");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v9);

    goto LABEL_7;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isFetchingClientState") & 1) != 0)
    goto LABEL_4;
  VCOSTransactionWithName((uint64_t)CFSTR("VCSpotlightSyncService"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  getWFSpotlightSyncLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
    _os_log_impl(&dword_1C146A000, v11, OS_LOG_TYPE_INFO, "%s Fetching last client state.", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setIsFetchingClientState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "index");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[2] = __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_123;
  v14[3] = &unk_1E7AA7308;
  v13 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v14[1] = 3221225472;
  v17 = *(_BYTE *)(a1 + 48);
  v15 = v13;
  v16 = v10;
  v8 = v10;
  objc_msgSend(v12, "fetchLastClientStateWithCompletionHandler:", v14);

LABEL_7:
}

void __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_123(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  char v18;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_2;
  v12[3] = &unk_1E7AA72E0;
  v13 = v6;
  v14 = v5;
  v18 = *(_BYTE *)(a1 + 56);
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v16 = v9;
  v17 = *(id *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

void __44__VCSpotlightSyncService_syncWithChangeset___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  void *v6;
  int v7;
  int v8;
  VCSpotlightSyncOperation *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  VCSpotlightSyncOperation *v14;
  void *v15;
  VCSpotlightSyncOperation *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  if (*(_QWORD *)(a1 + 32))
  {
    getWFSpotlightSyncLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke_2";
      v3 = "%s Error fetching last client state.";
      v4 = v2;
      v5 = 12;
LABEL_6:
      _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_DEBUG, v3, buf, v5);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "getBytes:length:", &v23, 8);
    getWFSpotlightSyncLogObject();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
      v26 = 2048;
      v27 = v23;
      v3 = "%s Fetched last client state = (%llu)";
      v4 = v2;
      v5 = 22;
      goto LABEL_6;
    }
  }

  VCGetLocalSpotlightState();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isConsistentWithClientState:", v23);
  v8 = v7;
  if (*(_BYTE *)(a1 + 72) && v7)
  {
    v9 = [VCSpotlightSyncOperation alloc];
    objc_msgSend(*(id *)(a1 + 48), "modified");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "inserted");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "removed");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "index");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[VCSpotlightSyncOperation initWithModifiedReferences:inserted:removed:spotlightIndex:localState:transaction:](v9, "initWithModifiedReferences:inserted:removed:spotlightIndex:localState:transaction:", v10, v11, v12, v13, v6, *(_QWORD *)(a1 + 64));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 56), "databaseProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v15, "databaseWithError:", &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v22;

    if (v11)
    {
      objc_msgSend(v11, "sortedVisibleWorkflowsByName");
      v12 = objc_claimAutoreleasedReturnValue();
      v16 = [VCSpotlightSyncOperation alloc];
      -[NSObject descriptors](v12, "descriptors");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "index");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v19 = v6;
      else
        v19 = 0;
      v14 = -[VCSpotlightSyncOperation initWithReferences:forceFullResync:spotlightIndex:localState:transaction:](v16, "initWithReferences:forceFullResync:spotlightIndex:localState:transaction:", v17, v8 ^ 1u, v18, v19, *(_QWORD *)(a1 + 64));

    }
    else
    {
      getWFSpotlightSyncLogObject();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v20 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        v25 = "-[VCSpotlightSyncService syncWithChangeset:]_block_invoke";
        v26 = 2114;
        v27 = v20;
        _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s Failed to load database, not creating sync operation, error = %{public}@", buf, 0x16u);
      }
      v11 = 0;
      v14 = 0;
    }
  }

  -[VCSpotlightSyncOperation setDelegate:](v14, "setDelegate:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 56), "setSyncOperation:", v14);
  objc_msgSend(*(id *)(a1 + 56), "syncOperation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "start");

  objc_msgSend(*(id *)(a1 + 56), "setIsFetchingClientState:", 0);
}

@end
