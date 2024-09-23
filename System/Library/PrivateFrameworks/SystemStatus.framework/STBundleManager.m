@implementation STBundleManager

- (id)_initWithBundleRecordClass:(Class)a3 directoryURLs:(id)a4 allowedBundleRecordIdentifiers:(id)a5
{
  id v8;
  id v9;
  STBundleManager *v10;
  STBundleManager *v11;
  uint64_t v12;
  NSArray *directoryURLs;
  uint64_t v14;
  NSSet *allowedBundleRecordIdentifiers;
  uint64_t v16;
  NSHashTable *queue_observers;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *callOutQueue;
  NSObject *v24;
  _QWORD block[4];
  STBundleManager *v27;
  objc_super v28;

  v8 = a4;
  v9 = a5;
  v28.receiver = self;
  v28.super_class = (Class)STBundleManager;
  v10 = -[STBundleManager init](&v28, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_bundleRecordClass, a3);
    v12 = objc_msgSend(v8, "copy");
    directoryURLs = v11->_directoryURLs;
    v11->_directoryURLs = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    allowedBundleRecordIdentifiers = v11->_allowedBundleRecordIdentifiers;
    v11->_allowedBundleRecordIdentifiers = (NSSet *)v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v16 = objc_claimAutoreleasedReturnValue();
    queue_observers = v11->_queue_observers;
    v11->_queue_observers = (NSHashTable *)v16;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.SystemStatus.BundleManager.work", v18);
    queue = v11->_queue;
    v11->_queue = (OS_dispatch_queue *)v19;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.SystemStatus.BundleManager.callout", v21);
    callOutQueue = v11->_callOutQueue;
    v11->_callOutQueue = (OS_dispatch_queue *)v22;

    v24 = v11->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__STBundleManager__initWithBundleRecordClass_directoryURLs_allowedBundleRecordIdentifiers___block_invoke;
    block[3] = &unk_1E91E4E40;
    v27 = v11;
    dispatch_sync(v24, block);

  }
  return v11;
}

uint64_t __91__STBundleManager__initWithBundleRecordClass_directoryURLs_allowedBundleRecordIdentifiers___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_prepareInternalPreferences");
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateAllBundleRecords");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_registerForInternalPreferenceChanges");
}

- (STBundleManager)initWithBundleRecordClass:(Class)a3
{
  void *v5;
  void *v6;
  STBundleManager *v7;

  objc_msgSend((id)objc_opt_class(), "_defaultBundleRecordDirectoriesForClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_defaultBundleRecordIdentifierAllowListForClass:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STBundleManager _initWithBundleRecordClass:directoryURLs:allowedBundleRecordIdentifiers:](self, "_initWithBundleRecordClass:directoryURLs:allowedBundleRecordIdentifiers:", a3, v5, v6);

  return v7;
}

+ (id)_defaultBundleRecordDirectoriesForClass:(Class)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x1D17E6298]("+[STBundleManager _defaultBundleRecordDirectoriesForClass:]"))
  {
    +[STSystemStatusDefaults standardDefaults](STSystemStatusDefaults, "standardDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldEnableInternalBundles");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", &unk_1E91FAE80);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "arrayByAddingObject:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
  }
  -[objc_class recordType](a3, "recordType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__STBundleManager__defaultBundleRecordDirectoriesForClass___block_invoke;
  v13[3] = &unk_1E91E5428;
  v14 = v9;
  v10 = v9;
  objc_msgSend(v4, "bs_map:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __59__STBundleManager__defaultBundleRecordDirectoriesForClass___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E98];
  v4 = a2;
  BSSystemRootDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = v4;
  v9[2] = CFSTR("SystemStatus");
  v9[3] = CFSTR("Bundles");
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPathComponents:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_defaultBundleRecordIdentifierAllowListForClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  -[objc_class recordType](a3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__STBundleManager__defaultBundleRecordIdentifierAllowListForClass___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1ED0CB410 != -1)
    dispatch_once(&qword_1ED0CB410, block);
  objc_msgSend((id)_MergedGlobals_7, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __67__STBundleManager__defaultBundleRecordIdentifierAllowListForClass___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  id v7;
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLForResource:withExtension:", CFSTR("BundleAllowList"), CFSTR("plist"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfURL:error:", v1, &v8);
  v3 = v8;
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v7 = v2;
    v6 = _MergedGlobals_7;
    _MergedGlobals_7 = (uint64_t)v7;
  }
  else
  {
    STSystemStatusLogBundleLoading();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v4;
      _os_log_error_impl(&dword_1D12C7000, v6, OS_LOG_TYPE_ERROR, "Unable to load bundle allow list: %@", buf, 0xCu);
    }
  }

}

- (id)bundleRecordForRecordIdentifier:(id)a3
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
  v15 = __Block_byref_object_copy__1;
  v16 = __Block_byref_object_dispose__1;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__STBundleManager_bundleRecordForRecordIdentifier___block_invoke;
  block[3] = &unk_1E91E4BC8;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __51__STBundleManager_bundleRecordForRecordIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 56), "objectForKey:", a1[5]);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copyWithZone:", 0);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSSet)recordIdentifiers
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
  v9 = __Block_byref_object_copy__1;
  v10 = __Block_byref_object_dispose__1;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__STBundleManager_recordIdentifiers__block_invoke;
  v5[3] = &unk_1E91E5470;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSSet *)v3;
}

void __36__STBundleManager_recordIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__STBundleManager_addObserver___block_invoke;
  block[3] = &unk_1E91E4AD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __31__STBundleManager_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__STBundleManager_removeObserver___block_invoke;
  block[3] = &unk_1E91E4AD8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __34__STBundleManager_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_runBlockOnObservers:(id)a3
{
  id v4;
  void *v5;
  NSObject *callOutQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSHashTable allObjects](self->_queue_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __46__STBundleManager__queue_runBlockOnObservers___block_invoke;
  v9[3] = &unk_1E91E5498;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_async(callOutQueue, v9);

}

uint64_t __46__STBundleManager__queue_runBlockOnObservers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_updateAllBundleRecords
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[STBundleManager _queue_loadAllBundleRecords](self, "_queue_loadAllBundleRecords");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[STBundleManager _queue_updateAllBundleRecordsForAllBundleRecords:](self, "_queue_updateAllBundleRecordsForAllBundleRecords:", v3);

}

- (id)_queue_loadAllBundleRecords
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSArray bs_mapNoNulls:](self->_directoryURLs, "bs_mapNoNulls:", &__block_literal_global_8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_flatten");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_filter:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__STBundleManager__queue_loadAllBundleRecords__block_invoke_3;
  v8[3] = &unk_1E91E5520;
  v8[4] = self;
  objc_msgSend(v5, "bs_mapNoNulls:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __46__STBundleManager__queue_loadAllBundleRecords__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3620];
  v3 = a2;
  objc_msgSend(v2, "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v3, 0, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __46__STBundleManager__queue_loadAllBundleRecords__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "pathExtension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("bundle")) == 0;

  return v3;
}

id __46__STBundleManager__queue_loadAllBundleRecords__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "bundleRecordForBundleAtURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v6 + 72)
    || (v7 = *(void **)(v6 + 24),
        objc_msgSend(v4, "recordIdentifier"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v7) = objc_msgSend(v7, "containsObject:", v8),
        v8,
        (_DWORD)v7))
  {
    STSystemStatusLogBundleLoading();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v14 = 138543618;
      v15 = v3;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_INFO, "Loaded bundle at %{public}@:\n%{public}@", (uint8_t *)&v14, 0x16u);
    }
    v10 = v5;
  }
  else
  {
    if (!MEMORY[0x1D17E6298]("-[STBundleManager _queue_loadAllBundleRecords]_block_invoke"))
    {
      v10 = 0;
      goto LABEL_7;
    }
    STSystemStatusLogBundleLoading();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "recordIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v3;
      v16 = 2114;
      v17 = v13;
      _os_log_error_impl(&dword_1D12C7000, v9, OS_LOG_TYPE_ERROR, "Not loading bundle at %{public}@, either add %{public}@ to the allow list, or configure SystemStatus for debugging.", (uint8_t *)&v14, 0x16u);

    }
    v10 = 0;
  }

LABEL_7:
  v11 = v10;

  return v11;
}

- (void)_queue_updateAllBundleRecordsForAllBundleRecords:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSDictionary *v13;
  NSDictionary *queue_allBundleRecordsByIdentifier;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "recordIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v11, v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  if ((BSEqualObjects() & 1) == 0)
  {
    v13 = (NSDictionary *)objc_msgSend(v5, "copy");
    queue_allBundleRecordsByIdentifier = self->_queue_allBundleRecordsByIdentifier;
    self->_queue_allBundleRecordsByIdentifier = v13;

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __68__STBundleManager__queue_updateAllBundleRecordsForAllBundleRecords___block_invoke;
    v15[3] = &unk_1E91E5548;
    v15[4] = self;
    -[STBundleManager _queue_runBlockOnObservers:](self, "_queue_runBlockOnObservers:", v15);
  }

}

uint64_t __68__STBundleManager__queue_updateAllBundleRecordsForAllBundleRecords___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordBundlesChangedForBundleManager:", *(_QWORD *)(a1 + 32));
}

- (void)_queue_prepareInternalPreferences
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ((MEMORY[0x1D17E6298]("-[STBundleManager _queue_prepareInternalPreferences]") & 1) != 0)
  {
    +[STSystemStatusDefaults standardDefaults](STSystemStatusDefaults, "standardDefaults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    self->_queue_ignoreAllowList = objc_msgSend(v3, "shouldEnableUnknownBundles");

  }
  else
  {
    self->_queue_ignoreAllowList = 0;
  }
}

- (void)_queue_registerForInternalPreferenceChanges
{
  void *v3;
  OS_dispatch_queue *queue;
  BSDefaultObserver *v5;
  BSDefaultObserver *internalDefaultsObserver;
  _QWORD v7[4];
  id v8;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_initWeak(&location, self);
  +[STSystemStatusDefaults standardDefaults](STSystemStatusDefaults, "standardDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__STBundleManager__queue_registerForInternalPreferenceChanges__block_invoke;
  v7[3] = &unk_1E91E4B50;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "observeDefault:onQueue:withBlock:", CFSTR("shouldEnableUnknownBundles"), queue, v7);
  v5 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  internalDefaultsObserver = self->_internalDefaultsObserver;
  self->_internalDefaultsObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __62__STBundleManager__queue_registerForInternalPreferenceChanges__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  +[STSystemStatusDefaults standardDefaults](STSystemStatusDefaults, "standardDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_queue_setIgnoreAllowedList:", objc_msgSend(v1, "shouldEnableUnknownBundles"));

}

- (void)_queue_unregisterForInternalPreferenceChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[BSDefaultObserver invalidate](self->_internalDefaultsObserver, "invalidate");
}

- (void)_queue_setIgnoreAllowedList:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (MEMORY[0x1D17E6298]("-[STBundleManager _queue_setIgnoreAllowedList:]")
    && self->_queue_ignoreAllowList != v3)
  {
    self->_queue_ignoreAllowList = v3;
    STSystemStatusLogBundleLoading();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("Disabling");
      if (v3)
        v6 = CFSTR("Enabling");
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_DEFAULT, "%@ bundles which are not on the allow list and re-scanning...", (uint8_t *)&v7, 0xCu);
    }

    -[STBundleManager _queue_updateAllBundleRecords](self, "_queue_updateAllBundleRecords");
  }
}

- (Class)bundleRecordClass
{
  return self->_bundleRecordClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_allBundleRecordsByIdentifier, 0);
  objc_storeStrong((id *)&self->_internalDefaultsObserver, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_allowedBundleRecordIdentifiers, 0);
  objc_storeStrong((id *)&self->_directoryURLs, 0);
  objc_storeStrong((id *)&self->_bundleRecordClass, 0);
}

@end
