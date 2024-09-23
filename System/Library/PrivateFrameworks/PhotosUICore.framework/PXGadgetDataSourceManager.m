@implementation PXGadgetDataSourceManager

- (void)setNextGadgetResponder:(id)a3
{
  objc_storeWeak((id *)&self->_nextGadgetResponder, a3);
}

- (PXGadgetDataSourceManager)initWithQueueName:(id)a3
{
  id v4;
  PXGadgetDataSourceManager *v5;
  id v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *lookupQueue;
  NSMutableArray *v9;
  NSMutableArray *lookupQueue_loadedProviders;
  dispatch_group_t v11;
  OS_dispatch_group *deferredGadgetLoadingGroup;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *deferredGadgetQueue;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGadgetDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-lookup"), v4);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v7 = dispatch_queue_create((const char *)objc_msgSend(v6, "UTF8String"), 0);
    lookupQueue = v5->_lookupQueue;
    v5->_lookupQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    lookupQueue_loadedProviders = v5->_lookupQueue_loadedProviders;
    v5->_lookupQueue_loadedProviders = v9;

    v11 = dispatch_group_create();
    deferredGadgetLoadingGroup = v5->_deferredGadgetLoadingGroup;
    v5->_deferredGadgetLoadingGroup = (OS_dispatch_group *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("com.apple.photos.deferredGadgetQueue", v14);
    deferredGadgetQueue = v5->_deferredGadgetQueue;
    v5->_deferredGadgetQueue = (OS_dispatch_queue *)v15;

  }
  return v5;
}

- (PXGadgetDataSourceManager)init
{
  return -[PXGadgetDataSourceManager initWithQueueName:](self, "initWithQueueName:", CFSTR("com.mobileSlideShow.GadgetGenerator"));
}

- (id)createInitialDataSource
{
  void *v3;

  -[PXGadgetDataSourceManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetDataSourceManager setNeedsToLoadAllProviders:](self, "setNeedsToLoadAllProviders:", 1);
  return v3;
}

- (void)removeCachedProviders
{
  void *v3;

  +[PXSectionedDataSource emptyDataSource](PXGadgetDataSource, "emptyDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v3, 0);

  -[PXGadgetDataSourceManager setCachedProviders:](self, "setCachedProviders:", 0);
  -[PXGadgetDataSourceManager setNeedsToLoadAllProviders:](self, "setNeedsToLoadAllProviders:", 1);
  self->_didLoadRemainingGadgets = 0;
}

- (void)willPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGadgetDataSourceManager;
  -[PXGadgetDataSourceManager willPerformChanges](&v3, sel_willPerformChanges);
  self->_isPerformingChanges = 1;
}

- (void)didPerformChanges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGadgetDataSourceManager;
  -[PXGadgetDataSourceManager didPerformChanges](&v3, sel_didPerformChanges);
  self->_isPerformingChanges = 0;
  if (self->_dataSourceNeedsUpdate)
    -[PXGadgetDataSourceManager _updateDataSource](self, "_updateDataSource");
}

- (NSArray)gadgetProviders
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSourceManager.m"), 100, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXGadgetDataSourceManager gadgetProviders]", v6);

  abort();
}

- (id)gadgetSortComparator
{
  return 0;
}

- (id)gadgetProviderSortComparator
{
  return 0;
}

- (id)hiddenGadgetProviders
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)noContentGadget
{
  return 0;
}

- (void)beginLoadingInitialGadgets:(unint64_t)a3
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  OS_dispatch_queue *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  os_signpost_id_t spid;
  void *v25;
  unint64_t v26;
  void *v27;
  NSObject *queue;
  id v29;
  uint8_t v31[8];
  _QWORD v32[5];
  id v33;
  uint8_t *v34;
  uint8_t v35[8];
  uint8_t *v36;
  uint64_t v37;
  char v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[6];
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _QWORD block[5];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "gadgetDataSourceManagerLog");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  spid = v4;
  v26 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "LoadInitialGadgets", ", buf, 2u);
  }

  -[PXGadgetDataSourceManager cachedProviders](self, "cachedProviders");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_lookupQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  queue = v8;
  dispatch_sync((dispatch_queue_t)v8, block);
  -[PXGadgetDataSourceManager setLoadingInitialGadgets:](self, "setLoadingInitialGadgets:", 1);
  -[PXGadgetDataSourceManager _loadPriorityForProviders:](self, "_loadPriorityForProviders:", v7);
  -[PXGadgetDataSourceManager didLoadDataForPriorities](self, "didLoadDataForPriorities");
  v29 = v7;
  -[PXGadgetDataSourceManager gadgetProviderSortComparator](self, "gadgetProviderSortComparator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v29;
  if (v27)
  {
    objc_msgSend(v29, "sortedArrayUsingComparator:", v27);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v10;
  }
  v25 = v9;
  -[PXGadgetDataSourceManager _loadDataFromProviders:withGadgetMinimum:](self, "_loadDataFromProviders:withGadgetMinimum:");
  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__198984;
  v48 = __Block_byref_object_dispose__198985;
  v49 = 0;
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_16;
  v43[3] = &unk_1E5148AA8;
  v43[5] = buf;
  v43[4] = self;
  dispatch_sync(queue, v43);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v11 = *((id *)v45 + 5);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v16 = os_signpost_id_generate(v6);
        v17 = v6;
        v18 = v17;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "GenerateGadget", ", v35, 2u);
        }

        objc_msgSend(v15, "generateGadgets");
        v19 = v18;
        v20 = v19;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
        {
          *(_WORD *)v35 = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v20, OS_SIGNPOST_INTERVAL_END, v16, "GenerateGadget", ", v35, 2u);
        }

      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v12);
  }

  -[PXGadgetDataSourceManager _updateDataSource](self, "_updateDataSource");
  -[PXGadgetDataSourceManager setLoadingInitialGadgets:](self, "setLoadingInitialGadgets:", 0);
  *(_QWORD *)v35 = 0;
  v36 = v35;
  v37 = 0x2020000000;
  v38 = 0;
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_17;
  v32[3] = &unk_1E513FD98;
  v34 = v35;
  v32[4] = self;
  v21 = v29;
  v33 = v21;
  dispatch_sync(queue, v32);
  if (v36[24])
    -[PXGadgetDataSourceManager setNeedsToLoadAllProviders:](self, "setNeedsToLoadAllProviders:", 0);
  v22 = v6;
  v23 = v22;
  if (v26 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)v31 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v23, OS_SIGNPOST_INTERVAL_END, spid, "LoadInitialGadgets", ", v31, 2u);
  }

  _Block_object_dispose(v35, 8);
  _Block_object_dispose(buf, 8);

}

- (void)loadRemainingGadgetsIfNeeded
{
  -[PXGadgetDataSourceManager loadRemainingGadgetsIfNeeded:](self, "loadRemainingGadgetsIfNeeded:", 0);
}

- (void)loadRemainingGadgetsIfNeeded:(id)a3
{
  -[PXGadgetDataSourceManager loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock:completion:](self, "loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock:completion:", 0, a3);
}

- (void)loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock:(id)a3 completion:(id)a4
{
  id v6;
  OS_dispatch_group *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  dispatch_block_t v15;
  dispatch_block_t v16;
  id obj;
  OS_dispatch_queue *queue;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  OS_dispatch_queue *v25;
  PXGadgetDataSourceManager *v26;
  OS_dispatch_group *v27;
  id v28;
  _QWORD *v29;
  uint64_t *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[4];
  _QWORD block[4];
  id v37;
  PXGadgetDataSourceManager *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v6 = a4;
  v7 = self->_deferredGadgetLoadingGroup;
  v16 = v6;
  if (-[PXGadgetDataSourceManager needsToLoadAllProviders](self, "needsToLoadAllProviders"))
  {
    -[PXGadgetDataSourceManager setNeedsToLoadAllProviders:](self, "setNeedsToLoadAllProviders:", 0);
    queue = self->_lookupQueue;
    -[PXGadgetDataSourceManager cachedProviders](self, "cachedProviders");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__198984;
    v44 = __Block_byref_object_dispose__198985;
    v45 = 0;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke;
    block[3] = &unk_1E513FD98;
    v9 = v8;
    v37 = v9;
    v38 = self;
    v39 = &v40;
    dispatch_sync((dispatch_queue_t)queue, block);
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x2020000000;
    v35[3] = 0;
    objc_msgSend((id)objc_opt_class(), "gadgetDataSourceManagerLog");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = (id)v41[5];
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          dispatch_group_enter((dispatch_group_t)v7);
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_2;
          v22[3] = &unk_1E5134BC8;
          v23 = v10;
          v24 = v14;
          v25 = queue;
          v26 = self;
          v28 = v19;
          v29 = v35;
          v30 = &v40;
          v27 = v7;
          v15 = dispatch_block_create(DISPATCH_BLOCK_DETACHED, v22);
          dispatch_async((dispatch_queue_t)self->_deferredGadgetQueue, v15);

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v46, 16);
      }
      while (v11);
    }

    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_20;
    v20[3] = &unk_1E5148CE0;
    v20[4] = self;
    v21 = v16;
    dispatch_group_notify((dispatch_group_t)v7, MEMORY[0x1E0C80D38], v20);

    _Block_object_dispose(v35, 8);
    _Block_object_dispose(&v40, 8);

  }
  else if (v6)
  {
    dispatch_group_notify((dispatch_group_t)v7, MEMORY[0x1E0C80D38], v6);
  }

}

- (void)setCanLoadRemainingDataForProviders:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_canLoadRemainingDataForProviders != a3)
  {
    self->_canLoadRemainingDataForProviders = a3;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PXGadgetDataSourceManager cachedProviders](self, "cachedProviders", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
          if (self->_canLoadRemainingDataForProviders)
            objc_msgSend(v9, "startLoadingRemainingData");
          else
            objc_msgSend(v9, "pauseLoadingRemainingData");
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

- (NSArray)cachedProviders
{
  NSArray *cachedProviders;
  void *v5;
  id v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  cachedProviders = self->_cachedProviders;
  if (!cachedProviders)
  {
    -[PXGadgetDataSourceManager gadgetProviders](self, "gadgetProviders");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      v11 = 0x1E0CB3000uLL;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v13, "setDelegate:", self);
          objc_msgSend(v13, "setNextGadgetResponder:", self);
          objc_msgSend(v13, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v6, "containsObject:", v14))
          {
            objc_msgSend(*(id *)(v11 + 1160), "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetDataSourceManager.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("![gadgetProviderIdentifiers containsObject:gadgetProviderIdentifier]"));

            v11 = 0x1E0CB3000;
          }
          objc_msgSend(v6, "addObject:", v14);

        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v16 = self->_cachedProviders;
    self->_cachedProviders = v7;

    cachedProviders = self->_cachedProviders;
  }
  return cachedProviders;
}

- (void)_loadPriorityForProviders:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[PXGadgetDataSourceManager hasLoadedPriorities](self, "hasLoadedPriorities"))
  {
    -[PXGadgetDataSourceManager gadgetProviderSortComparator](self, "gadgetProviderSortComparator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = v4;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "loadDataForPriority", (_QWORD)v11);
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (void)_loadDataFromProviders:(id)a3 withGadgetMinimum:(unint64_t)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *lookupQueue;
  id v20;
  PXGadgetDataSourceManager *v21;
  id obj;
  _QWORD block[5];
  id v25;
  uint8_t buf[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v21 = self;
  objc_msgSend((id)objc_opt_class(), "gadgetDataSourceManagerLog");
  v7 = objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v28;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(obj);
      if (v10 >= a4)
        break;
      v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v12);
      v14 = os_signpost_id_generate(v7);
      v15 = v7;
      v16 = v15;
      if (v14 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      {

        objc_msgSend(v13, "loadDataForGadgets");
        v18 = v16;
      }
      else
      {
        if (os_signpost_enabled(v15))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "LoadDataForGadget", ", buf, 2u);
        }

        objc_msgSend(v13, "loadDataForGadgets");
        v17 = v16;
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1A6789000, v17, OS_SIGNPOST_INTERVAL_END, v14, "LoadDataForGadget", ", buf, 2u);
        }
      }

      objc_msgSend(v6, "addObject:", v13);
      v10 += objc_msgSend(v13, "estimatedNumberOfGadgets");
      if (v9 == ++v12)
      {
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  lookupQueue = v21->_lookupQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__PXGadgetDataSourceManager__loadDataFromProviders_withGadgetMinimum___block_invoke;
  block[3] = &unk_1E5148D08;
  block[4] = v21;
  v25 = v6;
  v20 = v6;
  dispatch_sync(lookupQueue, block);

}

- (void)_updateDataSource
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (self->_isPerformingChanges)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v16;
      v26 = 2112;
      v27 = v17;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "-[%@ %@] called while performing changes, instead of after", buf, 0x16u);

    }
  }
  self->_dataSourceNeedsUpdate = 0;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetDataSourceManager _dataSourceSnapshot](self, "_dataSourceSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetSections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gadgetSections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:objectComparator:", v7, v8, MEMORY[0x1E0C9AA60], &__block_literal_global_198966);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __46__PXGadgetDataSourceManager__updateDataSource__block_invoke_2;
  v21 = &unk_1E5134C30;
  v22 = v5;
  v23 = v10;
  v11 = v10;
  v12 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v18);
  v13 = objc_alloc((Class)off_1E50B4A18);
  v14 = (void *)objc_msgSend(v13, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", objc_msgSend(v12, "identifier", v18, v19, v20, v21), objc_msgSend(v6, "identifier"), v9, v11, 0);
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v6, v14);

}

- (id)_dataSourceSnapshot
{
  PXGadgetDataSourceManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __objc2_class **v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __objc2_class **v19;
  id v20;
  PXGadgetDataSourceManager *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  PXGadgetSection *v31;
  void *v32;
  PXGadgetSection *v33;
  PXGadgetDataSource *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  void *v43;
  _BYTE v44[128];
  uint64_t v45;

  v2 = self;
  v45 = *MEMORY[0x1E0C80C00];
  -[PXGadgetDataSourceManager cachedProviders](self, "cachedProviders");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXGadgetDataSourceManager gadgetProviderSortComparator](v2, "gadgetProviderSortComparator");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "sortUsingComparator:", v5);
  v37 = (void *)v5;
  -[PXGadgetDataSourceManager hiddenGadgetProviders](v2, "hiddenGadgetProviders");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    objc_msgSend(v4, "removeObjectsInArray:", v6);
  v36 = v6;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v40;
    v12 = off_1E50B2000;
    do
    {
      v13 = 0;
      v38 = v10;
      do
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v13);
        objc_msgSend(v14, "gadgets");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "count"))
        {
          if ((unint64_t)objc_msgSend(v15, "count") >= 2)
          {
            -[PXGadgetDataSourceManager gadgetSortComparator](v2, "gadgetSortComparator");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
            {
              objc_msgSend(v15, "sortedArrayUsingComparator:", v16);
              v17 = v11;
              v18 = v7;
              v19 = v12;
              v20 = v8;
              v21 = v2;
              v22 = objc_claimAutoreleasedReturnValue();

              v15 = (void *)v22;
              v2 = v21;
              v8 = v20;
              v12 = v19;
              v7 = v18;
              v11 = v17;
              v10 = v38;
            }

          }
          objc_msgSend(v14, "identifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(objc_alloc(v12[478]), "initWithIdentifier:gadgets:", v23, v15);
          objc_msgSend(v7, "addObject:", v24);

        }
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v10);
  }

  v25 = objc_msgSend(v7, "count");
  objc_msgSend(v7, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "gadgets");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25 || v25 == 1 && objc_msgSend(v28, "gadgetType") == 6)
  {
    -[PXGadgetDataSourceManager noContentGadget](v2, "noContentGadget");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "setDelegate:", v2);
      v31 = [PXGadgetSection alloc];
      v43 = v30;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = -[PXGadgetSection initWithIdentifier:gadgets:](v31, "initWithIdentifier:gadgets:", CFSTR("PXNoContentGadgetProvider"), v32);

      objc_msgSend(v7, "insertObject:atIndex:", v33, 0);
    }

  }
  v34 = -[PXGadgetDataSource initWithGadgetSections:]([PXGadgetDataSource alloc], "initWithGadgetSections:", v7);

  return v34;
}

- (void)invalidateGadgets
{
  if (!-[PXGadgetDataSourceManager loadingInitialGadgets](self, "loadingInitialGadgets"))
  {
    if (self->_isPerformingChanges)
      self->_dataSourceNeedsUpdate = 1;
    else
      -[PXGadgetDataSourceManager _updateDataSource](self, "_updateDataSource");
  }
}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char v15;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    v15 = objc_msgSend(v13, "gadget:transitionToViewController:animated:completion:", v10, v11, v7, v12);
  else
    v15 = 0;

  return v15;
}

- (void)presentGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentGadgetViewController:animated:completion:", v9, v5, v8);

}

- (void)dismissGadgetViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dismissGadgetViewController:animated:completion:", v9, v5, v8);

}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentationEnvironmentForGadget:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXGadgetTransition)gadgetTransition
{
  void *v2;
  void *v3;

  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadgetTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGadgetTransition *)v3;
}

- (PXGadgetNavigationHelper)rootNavigationHelper
{
  void *v2;
  void *v3;

  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootNavigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXGadgetNavigationHelper *)v3;
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_respondsToSelector();

    if ((v9 & 1) != 0)
    {
      -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "gadget:didChange:", v11, a4);

    }
  }

}

- (void)gadget:(id)a3 animateChanges:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gadget:animateChanges:", v12, v6);

    }
  }

}

- (id)gadgetViewControllerHostingGadget:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_opt_respondsToSelector(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    -[PXGadgetDataSourceManager nextGadgetResponder](self, "nextGadgetResponder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gadgetViewControllerHostingGadget:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (PXGadgetDelegate)nextGadgetResponder
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_nextGadgetResponder);
}

- (BOOL)didLoadRemainingGadgets
{
  return self->_didLoadRemainingGadgets;
}

- (BOOL)canLoadRemainingDataForProviders
{
  return self->_canLoadRemainingDataForProviders;
}

- (void)setCachedProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)hasLoadedPriorities
{
  return self->_hasLoadedPriorities;
}

- (void)setHasLoadedPriorities:(BOOL)a3
{
  self->_hasLoadedPriorities = a3;
}

- (BOOL)loadingInitialGadgets
{
  return self->_loadingInitialGadgets;
}

- (void)setLoadingInitialGadgets:(BOOL)a3
{
  self->_loadingInitialGadgets = a3;
}

- (BOOL)needsToLoadAllProviders
{
  return self->_needsToLoadAllProviders;
}

- (void)setNeedsToLoadAllProviders:(BOOL)a3
{
  self->_needsToLoadAllProviders = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedProviders, 0);
  objc_destroyWeak((id *)&self->_nextGadgetResponder);
  objc_storeStrong((id *)&self->_deferredGadgetQueue, 0);
  objc_storeStrong((id *)&self->_deferredGadgetLoadingGroup, 0);
  objc_storeStrong((id *)&self->_lookupQueue_loadedProviders, 0);
  objc_storeStrong((id *)&self->_lookupQueue, 0);
}

void __46__PXGadgetDataSourceManager__updateDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _OWORD v15[2];
  __int128 v16;
  __int128 v17;

  v5 = a2;
  v16 = 0u;
  v17 = 0u;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v6, "indexPathForGadgetSectionWithIdentifier:", v7);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }

  if ((_QWORD)v16 != *(_QWORD *)off_1E50B7E98)
  {
    v8 = *(void **)(a1 + 32);
    v15[0] = v16;
    v15[1] = v17;
    objc_msgSend(v8, "gadgetSectionAtIndexPath:", v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "gadgets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gadgets");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v10, v11, MEMORY[0x1E0C9AA60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
}

uint64_t __46__PXGadgetDataSourceManager__updateDataSource__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __70__PXGadgetDataSourceManager__loadDataFromProviders_withGadgetMinimum___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
}

void __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsInArray:", *(_QWORD *)(a1[5] + 128));
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_2(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD block[6];
  uint8_t buf[16];

  v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "LoadDataForGadget", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "loadDataForGadgets");
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v2, "LoadDataForGadget", ", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_18;
  block[3] = &unk_1E5148D08;
  v7 = *(NSObject **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 56);
  block[5] = v8;
  dispatch_sync(v7, block);
  v9 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 64);
  px_dispatch_on_main_queue();

}

uint64_t __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 154) = 1;
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_18(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "addObject:", *(_QWORD *)(a1 + 40));
}

void __100__PXGadgetDataSourceManager_loadRemainingGadgetsIfNeededWithGenerateGadgetFinishedBlock_completion___block_invoke_2_19(uint64_t a1)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  void *v10;
  uint64_t v11;
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
  v2 = os_signpost_id_generate(*(os_log_t *)(a1 + 32));
  v3 = *(id *)(a1 + 32);
  v4 = v3;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "GenerateGadget", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 40), "generateGadgets");
  v5 = *(id *)(a1 + 32);
  v6 = v5;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, v2, "GenerateGadget", ", buf, 2u);
  }

  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  v8 = ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  if (v8 == objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "count"))
  {
    v9 = *(_BYTE **)(a1 + 48);
    if (v9[155])
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v9, "cachedProviders", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "startLoadingRemainingData");
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v12);
      }

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

uint64_t __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "removeAllObjects");
}

void __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_16(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __56__PXGadgetDataSourceManager_beginLoadingInitialGadgets___block_invoke_17(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 128), "isEqualToArray:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

+ (OS_os_log)gadgetDataSourceManagerLog
{
  if (gadgetDataSourceManagerLog_predicate != -1)
    dispatch_once(&gadgetDataSourceManagerLog_predicate, &__block_literal_global_42_199018);
  return (OS_os_log *)(id)gadgetDataSourceManagerLog_log;
}

void __55__PXGadgetDataSourceManager_gadgetDataSourceManagerLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "GadgetDataSourceManager");
  v1 = (void *)gadgetDataSourceManagerLog_log;
  gadgetDataSourceManagerLog_log = (uint64_t)v0;

}

@end
