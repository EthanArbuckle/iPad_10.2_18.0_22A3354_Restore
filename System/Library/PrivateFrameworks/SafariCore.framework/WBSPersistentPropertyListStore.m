@implementation WBSPersistentPropertyListStore

- (void)setCreateEmptyStoreHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WBSPersistentPropertyListStore)initWithBackingStoreURL:(id)a3
{
  return -[WBSPersistentPropertyListStore initWithBackingStoreURL:fileResourceValues:](self, "initWithBackingStoreURL:fileResourceValues:", a3, 0);
}

- (WBSPersistentPropertyListStore)initWithBackingStoreURL:(id)a3 fileResourceValues:(id)a4
{
  id v6;
  id v7;
  WBSPersistentPropertyListStore *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  uint64_t v11;
  NSURL *backingStoreURL;
  WBSCoalescedAsynchronousWriter *v13;
  OS_dispatch_queue *v14;
  uint64_t v15;
  WBSCoalescedAsynchronousWriter *writer;
  WBSPersistentPropertyListStore *v17;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)WBSPersistentPropertyListStore;
  v8 = -[WBSPersistentPropertyListStore init](&v22, sel_init);
  if (v8)
  {
    v9 = dispatch_queue_create("com.apple.SafariShared.WBSPersistentPropertyListStore", 0);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v9;

    if (v6)
    {
      objc_initWeak(&location, v8);
      v11 = objc_msgSend(v6, "copy");
      backingStoreURL = v8->_backingStoreURL;
      v8->_backingStoreURL = (NSURL *)v11;

      v13 = [WBSCoalescedAsynchronousWriter alloc];
      v14 = v8->_queue;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __77__WBSPersistentPropertyListStore_initWithBackingStoreURL_fileResourceValues___block_invoke;
      v19[3] = &unk_1E649E968;
      objc_copyWeak(&v20, &location);
      v15 = -[WBSCoalescedAsynchronousWriter initWithName:fileURL:dataSourceQueue:dataSourceBlock:fileResourceValues:](v13, "initWithName:fileURL:dataSourceQueue:dataSourceBlock:fileResourceValues:", CFSTR("WBSPersistentPropertyListStore"), v6, v14, v19, v7);
      writer = v8->_writer;
      v8->_writer = (WBSCoalescedAsynchronousWriter *)v15;

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    v17 = v8;
  }

  return v8;
}

void __41__WBSPersistentPropertyListStore_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadDataIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __47__WBSPersistentPropertyListStore_objectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_loadDataIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_loadDataIfNecessary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *store;
  void (**validateLoadedStoreHandler)(void);
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  if (!self->_store)
  {
    -[WBSPersistentPropertyListStore _existingSavedData](self, "_existingSavedData");
    v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    store = self->_store;
    self->_store = v3;

    if (!self->_store)
      goto LABEL_8;
    validateLoadedStoreHandler = (void (**)(void))self->_validateLoadedStoreHandler;
    if (validateLoadedStoreHandler)
    {
      validateLoadedStoreHandler[2]();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqual:", self->_store) & 1) == 0)
      {
        v7 = (NSMutableDictionary *)objc_msgSend(v6, "mutableCopy");
        v8 = self->_store;
        self->_store = v7;

        -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_writer, "scheduleWrite");
      }

      if (!self->_store)
LABEL_8:
        -[WBSPersistentPropertyListStore _prepareEmptyStore](self, "_prepareEmptyStore");
    }
  }
}

- (id)_existingSavedData
{
  id v3;
  NSURL *backingStoreURL;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;

  if (!self->_backingStoreURL)
    return 0;
  v3 = objc_alloc(MEMORY[0x1E0C99D50]);
  backingStoreURL = self->_backingStoreURL;
  v15 = 0;
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:options:error:", backingStoreURL, 0, &v15);
  v6 = v15;
  v7 = v6;
  if (v5)
  {
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 0, 0, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (v8)
    {
      v10 = (void *)objc_msgSend(v8, "mutableCopy");
    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[WBSPersistentPropertyListStore _existingSavedData].cold.2(v13, v9);
      v10 = 0;
    }

  }
  else
  {
    if ((objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CB28A8], 260) & 1) == 0)
    {
      v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[WBSPersistentPropertyListStore _existingSavedData].cold.1(v12, v7);
    }
    v10 = 0;
    v9 = v7;
  }

  return v10;
}

- (id)dictionaryForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WBSPersistentPropertyListStore _objectForKey:ofClass:](self, "_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_objectForKey:(id)a3 ofClass:(Class)a4
{
  void *v4;
  id v5;

  -[WBSPersistentPropertyListStore objectForKey:](self, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (id)objectForKey:(id)a3
{
  id v4;
  NSObject *queue;
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
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__WBSPersistentPropertyListStore_objectForKey___block_invoke;
  block[3] = &unk_1E649D5A8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allKeys
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__WBSPersistentPropertyListStore_allKeys__block_invoke;
  v5[3] = &unk_1E649C470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

id __77__WBSPersistentPropertyListStore_initWithBackingStoreURL_fileResourceValues___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)_prepareEmptyStore
{
  void (**createEmptyStoreHandler)(id, SEL);
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *store;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;

  createEmptyStoreHandler = (void (**)(id, SEL))self->_createEmptyStoreHandler;
  if (createEmptyStoreHandler)
  {
    createEmptyStoreHandler[2](createEmptyStoreHandler, a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
    store = self->_store;
    self->_store = v5;

    if (-[NSMutableDictionary count](self->_store, "count"))
      -[WBSCoalescedAsynchronousWriter scheduleWrite](self->_writer, "scheduleWrite");
  }
  else
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8 = self->_store;
    self->_store = v7;

  }
}

- (id)_dataRepresentation
{
  NSMutableDictionary *store;
  void *v3;
  id v4;
  NSObject *v5;
  id v7;

  store = self->_store;
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", store, 200, 0, &v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v7;
  if (!v3)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[WBSPersistentPropertyListStore _dataRepresentation].cold.1(v5, v4);
  }

  return v3;
}

- (id)stringForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WBSPersistentPropertyListStore _objectForKey:ofClass:](self, "_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)numberForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WBSPersistentPropertyListStore _objectForKey:ofClass:](self, "_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dataForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WBSPersistentPropertyListStore _objectForKey:ofClass:](self, "_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)dateForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WBSPersistentPropertyListStore _objectForKey:ofClass:](self, "_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)arrayForKey:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[WBSPersistentPropertyListStore _objectForKey:ofClass:](self, "_objectForKey:ofClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__WBSPersistentPropertyListStore_setObject_forKey___block_invoke;
  block[3] = &unk_1E649C7E0;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, block);

}

void __51__WBSPersistentPropertyListStore_setObject_forKey___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "_loadDataIfNecessary");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 48));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "scheduleWrite");
  }
}

- (void)saveStoreSynchronously
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__WBSPersistentPropertyListStore_saveStoreSynchronously__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __56__WBSPersistentPropertyListStore_saveStoreSynchronously__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "scheduleWrite");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "performScheduledWriteSynchronously");
}

- (void)clearStoreSynchronously
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__WBSPersistentPropertyListStore_clearStoreSynchronously__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __57__WBSPersistentPropertyListStore_clearStoreSynchronously__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_prepareEmptyStore");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "scheduleWrite");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "performScheduledWriteSynchronously");
}

- (void)saveAndCloseStoreSynchronously
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__WBSPersistentPropertyListStore_saveAndCloseStoreSynchronously__block_invoke;
  block[3] = &unk_1E649B768;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __64__WBSPersistentPropertyListStore_saveAndCloseStoreSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "completePendingWriteSynchronously");
}

- (id)createEmptyStoreHandler
{
  return self->_createEmptyStoreHandler;
}

- (id)validateLoadedStoreHandler
{
  return self->_validateLoadedStoreHandler;
}

- (void)setValidateLoadedStoreHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_validateLoadedStoreHandler, 0);
  objc_storeStrong(&self->_createEmptyStoreHandler, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_backingStoreURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_existingSavedData
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to decode backing store: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)_dataRepresentation
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_19(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4(&dword_1B2621000, v5, v6, "Failed to encode backing store: %{public}@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_4();
}

@end
