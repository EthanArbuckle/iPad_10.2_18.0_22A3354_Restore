@implementation PXSharedLibrarySharingSuggestionsDataSourceManager

- (PXSharedLibrarySharingSuggestionsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsDataSourceManager.m"), 147, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySharingSuggestionsDataSourceManager init]");

  abort();
}

- (PXSharedLibrarySharingSuggestionsDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXSharedLibrarySharingSuggestionsDataSourceManager *v6;
  PXSharedLibrarySharingSuggestionsDataSourceManager *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_promiseByContainer;
  uint64_t v10;
  OS_dispatch_queue *queue;
  uint64_t v12;
  NSDate *aggregateBeforeDate;
  uint64_t v14;
  PXSharedLibrarySharingSuggestionsCountsManager *countsManager;
  uint64_t v16;
  NSDate *considerNewAfterDate;
  uint64_t v18;
  PXUpdater *updater;
  objc_super v21;

  v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v21, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    lock_promiseByContainer = v7->_lock_promiseByContainer;
    v7->_lock_promiseByContainer = v8;

    +[PXSharedLibrarySharingSuggestionsDataSourceManager sharedQueue](PXSharedLibrarySharingSuggestionsDataSourceManager, "sharedQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -15552000.0);
    v12 = objc_claimAutoreleasedReturnValue();
    aggregateBeforeDate = v7->_aggregateBeforeDate;
    v7->_aggregateBeforeDate = (NSDate *)v12;

    objc_msgSend(v5, "px_sharedLibrarySharingSuggestionsCountsManager");
    v14 = objc_claimAutoreleasedReturnValue();
    countsManager = v7->_countsManager;
    v7->_countsManager = (PXSharedLibrarySharingSuggestionsCountsManager *)v14;

    -[PXSharedLibrarySharingSuggestionsCountsManager registerChangeObserver:context:](v7->_countsManager, "registerChangeObserver:context:", v7, PXSharedLibrarySharingSuggestionsCountsManagerObserverContext);
    -[PXSharedLibrarySharingSuggestionsCountsManager mostRecentUserSeenAddedDate](v7->_countsManager, "mostRecentUserSeenAddedDate");
    v16 = objc_claimAutoreleasedReturnValue();
    considerNewAfterDate = v7->_considerNewAfterDate;
    v7->_considerNewAfterDate = (NSDate *)v16;

    v18 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v7, sel__setNeedsUpdate);
    updater = v7->_updater;
    v7->_updater = (PXUpdater *)v18;

    -[PXUpdater addUpdateSelector:](v7->_updater, "addUpdateSelector:", sel__updatePromisesUnreadState);
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    objc_msgSend(v5, "px_registerChangeObserver:", v7);
  }

  return v7;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXSharedLibrarySharingSuggestionsDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (void)setConsiderNewAfterDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;
  char v7;
  NSDate *v8;

  v8 = (NSDate *)a3;
  v5 = self->_considerNewAfterDate;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[NSDate isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_considerNewAfterDate, a3);
      -[PXSharedLibrarySharingSuggestionsDataSourceManager _invalidatePromisesUnreadState](self, "_invalidatePromisesUnreadState");
    }
  }

}

- (id)_fetchInitialDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PXSharedLibrarySharingSuggestionsDataSourceManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1708], "fetchSharedLibrarySharingSuggestionsWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSharedLibrarySharingSuggestionsDataSourceManager _createDataSourceWithSharingSuggestions:](self, "_createDataSourceWithSharingSuggestions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createInitialDataSource
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  PXSharedLibrarySharingSuggestionsDataSourceManager *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[PXSharedLibrarySharingSuggestionsDataSourceManager isPerformingInitialLoad](self, "isPerformingInitialLoad"))
  {
    PLSharedLibraryGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543618;
      v17 = objc_opt_class();
      v18 = 2048;
      v19 = self;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEBUG, "<%{public}@:%p>: Creating initial data source asynchronously", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isPerformingInitialLoad = 1;
    objc_initWeak((id *)buf, self);
    -[PXSharedLibrarySharingSuggestionsDataSourceManager queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke;
    block[3] = &unk_1E5147B18;
    objc_copyWeak(&v15, (id *)buf);
    block[4] = self;
    v14 = v4;
    v6 = v4;
    dispatch_async(v5, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  v7 = objc_alloc(MEMORY[0x1E0CD1620]);
  -[PXSharedLibrarySharingSuggestionsDataSourceManager photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1708], "fetchType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v8, v9, 0, 0, 0);

  -[PXSharedLibrarySharingSuggestionsDataSourceManager _createDataSourceWithSharingSuggestions:](self, "_createDataSourceWithSharingSuggestions:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)_handleInitialDataSourceLoaded:(id)a3
{
  self->_isPerformingInitialLoad = 0;
  self->_hasLoadedInitially = 1;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", a3, 0);
}

- (void)setDataSource:(id)a3 changeDetails:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __82__PXSharedLibrarySharingSuggestionsDataSourceManager_setDataSource_changeDetails___block_invoke;
  v10[3] = &unk_1E5127940;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager performChanges:](self, "performChanges:", v10);

}

- (id)_createDataSourceWithSharingSuggestions:(id)a3
{
  id v4;
  PXSharedLibrarySharingSuggestionsDataSource *v5;
  void *v6;
  PXSharedLibrarySharingSuggestionsDataSource *v7;

  v4 = a3;
  v5 = [PXSharedLibrarySharingSuggestionsDataSource alloc];
  -[PXSharedLibrarySharingSuggestionsDataSourceManager aggregateBeforeDate](self, "aggregateBeforeDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXSharedLibrarySharingSuggestionsDataSource initWithSharingSuggestions:aggregateBeforeDate:](v5, "initWithSharingSuggestions:aggregateBeforeDate:", v4, v6);

  -[PXSharedLibrarySharingSuggestionsDataSource setDelegate:](v7, "setDelegate:", self);
  return v7;
}

- (id)_promiseForContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  PXSharedLibrarySharingSuggestionPromise *v12;
  void *v13;
  uint64_t v14;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_lock_promiseByContainer, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v5, "container");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_sl_containedSharingSuggestionObjectIDs");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_sl_containedSharingSuggestionObjectIDs");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

    goto LABEL_6;
  }
  v10 = v9;
  v11 = objc_msgSend(v8, "isEqual:", v9);

  if ((v11 & 1) == 0)
  {
LABEL_4:
    v12 = [PXSharedLibrarySharingSuggestionPromise alloc];
    -[PXSharedLibrarySharingSuggestionsDataSourceManager considerNewAfterDate](self, "considerNewAfterDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXSharedLibrarySharingSuggestionPromise initWithContainer:considerNewAfterDate:lightweightPlaceholder:](v12, "initWithContainer:considerNewAfterDate:lightweightPlaceholder:", v4, v13, 1);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_promiseByContainer, "setObject:forKeyedSubscript:", v14, v4);
    -[PXSharedLibrarySharingSuggestionsDataSourceManager _scheduleFulfillRemainingPromises](self, "_scheduleFulfillRemainingPromises");
    v6 = (void *)v14;
  }
LABEL_6:
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (void)_setPromise:(id)a3 forContainer:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_lock_promiseByContainer, "setObject:forKeyedSubscript:", v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_scheduleFulfillRemainingPromises
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXSharedLibrarySharingSuggestionsDataSourceManager queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __87__PXSharedLibrarySharingSuggestionsDataSourceManager__scheduleFulfillRemainingPromises__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_queue_fulfillRemainingPromises
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;
  id v13;
  _QWORD aBlock[4];
  id v15;
  id v16;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableDictionary copy](self->_lock_promiseByContainer, "copy");
  os_unfair_lock_unlock(p_lock);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke;
  aBlock[3] = &unk_1E5147280;
  v7 = v5;
  v15 = v7;
  objc_copyWeak(&v16, &location);
  v8 = _Block_copy(aBlock);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_3;
  v11[3] = &unk_1E5127968;
  v11[4] = self;
  v9 = v7;
  v12 = v9;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v11);
  v10[2](v10);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)_publishChangesForForContainers:(id)a3
{
  id v4;
  PXSharedLibrarySharingSuggestionsDataSourceManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  void *v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager currentDataSource](self, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v11);
        objc_msgSend(v6, "containers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "indexOfObject:", v12);

        if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          -[PXSharedLibrarySharingSuggestionsDataSourceManager _setPromise:forContainer:](v5, "_setPromise:forContainer:", 0, v12);
        else
          objc_msgSend(v7, "addIndex:", v14);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v9);
  }

  v15 = v7;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "sharingSuggestions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSharedLibrarySharingSuggestionsDataSourceManager _createDataSourceWithSharingSuggestions:](v5, "_createDataSourceWithSharingSuggestions:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_alloc((Class)off_1E50B4A18);
    v18 = objc_msgSend(v6, "identifier");
    v19 = objc_msgSend(v17, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = &unk_1E53ED470;
    v15 = v7;
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v24, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v18, v19, v20, v22, 0);

    -[PXSharedLibrarySharingSuggestionsDataSourceManager setDataSource:changeDetails:](v5, "setDataSource:changeDetails:", v17, v23);
  }

}

- (void)_setNeedsUpdate
{
  -[PXSharedLibrarySharingSuggestionsDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidatePromisesUnreadState
{
  id v2;

  -[PXSharedLibrarySharingSuggestionsDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updatePromisesUnreadState);

}

- (void)_updatePromisesUnreadState
{
  void *v3;
  id v4;
  id v5;
  NSMutableDictionary *lock_promiseByContainer;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  os_unfair_lock_t lock;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[PXSharedLibrarySharingSuggestionsDataSourceManager considerNewAfterDate](self, "considerNewAfterDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_promiseByContainer = self->_lock_promiseByContainer;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __80__PXSharedLibrarySharingSuggestionsDataSourceManager__updatePromisesUnreadState__block_invoke;
  v23[3] = &unk_1E5127990;
  v18 = v3;
  v24 = v18;
  v7 = v4;
  v25 = v7;
  v8 = v5;
  v26 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lock_promiseByContainer, "enumerateKeysAndObjectsUsingBlock:", v23);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = self->_lock_promiseByContainer;
        objc_msgSend(v14, "container", lock, v18, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v14, v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(lock);
  if (objc_msgSend(v8, "count"))
    -[PXSharedLibrarySharingSuggestionsDataSourceManager _publishChangesForForContainers:](self, "_publishChangesForForContainers:", v8);

}

- (id)dataSource:(id)a3 promiseForContainer:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BOOL4 hasLoadedInitially;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager currentDataSource](self, "currentDataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
  {

    goto LABEL_5;
  }
  hasLoadedInitially = self->_hasLoadedInitially;

  if (!hasLoadedInitially)
  {
LABEL_5:
    -[PXSharedLibrarySharingSuggestionsDataSourceManager _promiseForContainer:](self, "_promiseForContainer:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v10 = 0;
LABEL_6:

  return v10;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];

  v6 = a4;
  v9 = a3;
  if ((void *)PXSharedLibrarySharingSuggestionsCountsManagerObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySharingSuggestionsDataSourceManager.m"), 378, CFSTR("%@ got unexpected observer context:%p"), self, a5);

    abort();
  }
  v10 = v9;
  if ((v6 & 4) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __83__PXSharedLibrarySharingSuggestionsDataSourceManager_observable_didChange_context___block_invoke;
    v12[3] = &unk_1E51279B8;
    v12[4] = self;
    -[PXSharedLibrarySharingSuggestionsDataSourceManager performChanges:](self, "performChanges:", v12);
  }

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  NSMutableDictionary *lock_promiseByContainer;
  id v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__111120;
  v18 = __Block_byref_object_dispose__111121;
  v19 = 0;
  lock_promiseByContainer = self->_lock_promiseByContainer;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __83__PXSharedLibrarySharingSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  v11 = &unk_1E51279E0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lock_promiseByContainer, "enumerateKeysAndObjectsUsingBlock:", &v8);
  if (v15[5])
    -[NSMutableDictionary removeObjectsForKeys:](self->_lock_promiseByContainer, "removeObjectsForKeys:", v8, v9, v10, v11);
  os_unfair_lock_unlock(&self->_lock);

  _Block_object_dispose(&v14, 8);
  return 0;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
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
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PXSharedLibrarySharingSuggestionsDataSourceManager currentDataSource](self, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "sharingSuggestions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "changeDetailsForFetchResult:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "fetchResultAfterChanges");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSharedLibrarySharingSuggestionsDataSourceManager _createDataSourceWithSharingSuggestions:](self, "_createDataSourceWithSharingSuggestions:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "containers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "containers");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "changedObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:objectComparator:", v12, v13, v14, &__block_literal_global_172);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = objc_alloc((Class)off_1E50B4A18);
      v16 = objc_msgSend(v7, "identifier");
      v17 = objc_msgSend(v11, "identifier");
      objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = &unk_1E53ED470;
      v23[0] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v15, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v16, v17, v18, v19, 0);

      -[PXSharedLibrarySharingSuggestionsDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v11, v20);
    }
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (BOOL)isPerformingInitialLoad
{
  return self->_isPerformingInitialLoad;
}

- (BOOL)hasLoadedInitially
{
  return self->_hasLoadedInitially;
}

- (OS_dispatch_queue)sharedQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSharedQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXSharedLibrarySharingSuggestionsCountsManager)countsManager
{
  return self->_countsManager;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (NSDate)considerNewAfterDate
{
  return self->_considerNewAfterDate;
}

- (NSDate)aggregateBeforeDate
{
  return self->_aggregateBeforeDate;
}

- (void)setAggregateBeforeDate:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateBeforeDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_aggregateBeforeDate, 0);
  objc_storeStrong((id *)&self->_considerNewAfterDate, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_countsManager, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_sharedQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_lock_promiseByContainer, 0);
}

uint64_t __104__PXSharedLibrarySharingSuggestionsDataSourceManager_photoLibraryDidChangeOnMainQueue_withPreparedInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;
  id v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "px_sl_identifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_sl_identifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {

    v10 = 0;
  }
  else
  {
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((_BYTE *)v4 - (_BYTE *)v5 >= 1)
      v9 = 1;
    else
      v9 = ((_BYTE *)v4 - (_BYTE *)v5) >> 63;
    if ((v8 & 1) != 0)
      v10 = 0;
    else
      v10 = v9;
  }

  return v10;
}

void __83__PXSharedLibrarySharingSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "px_sl_containedSharingSuggestionObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updatedObjectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "intersectsSet:", v4);

  if (v5)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v9 = *(void **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;

      v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v6, "addObject:", v10);
  }

}

void __83__PXSharedLibrarySharingSuggestionsDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "countsManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mostRecentUserSeenAddedDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setConsiderNewAfterDate:", v2);

}

void __80__PXSharedLibrarySharingSuggestionsDataSourceManager__updatePromisesUnreadState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  v5 = (void *)objc_msgSend(a3, "copyIfNeededWithUpdatedConsiderNewAfterDate:", *(_QWORD *)(a1 + 32));
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v6);
  }

}

void __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_2;
    v4[3] = &unk_1E5147280;
    objc_copyWeak(&v6, (id *)(a1 + 40));
    v5 = v2;
    v3 = v2;
    dispatch_async(MEMORY[0x1E0C80D38], v4);

    objc_destroyWeak(&v6);
  }
}

void __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  PXSharedLibrarySharingSuggestionPromise *v5;
  void *v6;
  PXSharedLibrarySharingSuggestionPromise *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(a3, "isPlaceholder"))
  {
    v5 = [PXSharedLibrarySharingSuggestionPromise alloc];
    objc_msgSend(*(id *)(a1 + 32), "considerNewAfterDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXSharedLibrarySharingSuggestionPromise initWithContainer:considerNewAfterDate:lightweightPlaceholder:](v5, "initWithContainer:considerNewAfterDate:lightweightPlaceholder:", v8, v6, 0);

    objc_msgSend(*(id *)(a1 + 32), "_setPromise:forContainer:", v7, v8);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") >= 2)
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __85__PXSharedLibrarySharingSuggestionsDataSourceManager__queue_fulfillRemainingPromises__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_publishChangesForForContainers:", *(_QWORD *)(a1 + 32));

}

void __87__PXSharedLibrarySharingSuggestionsDataSourceManager__scheduleFulfillRemainingPromises__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_fulfillRemainingPromises");

}

id __82__PXSharedLibrarySharingSuggestionsDataSourceManager_setDataSource_changeDetails___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  objc_msgSend(*(id *)(a1 + 32), "dataSourceIfExists");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    objc_msgSend(*(id *)(a1 + 32), "dataSourceIfExists");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsAnyItems");
    v6 = objc_msgSend(*(id *)(a1 + 40), "containsAnyItems");

    if (v5 != v6)
      objc_msgSend(*(id *)(a1 + 32), "signalChange:", 2);
  }
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)PXSharedLibrarySharingSuggestionsDataSourceManager;
  return objc_msgSendSuper2(&v10, sel_setDataSource_changeDetails_, v7, v8);
}

void __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));

  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend(v4, "_fetchInitialDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke_2;
    v8[3] = &unk_1E51429B8;
    v6 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v5;
    v10 = v6;
    v7 = v5;
    objc_copyWeak(&v11, v2);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
    objc_destroyWeak(&v11);

  }
}

void __77__PXSharedLibrarySharingSuggestionsDataSourceManager_createInitialDataSource__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  PLSharedLibraryGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_opt_class();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = objc_msgSend(*(id *)(a1 + 40), "totalNumberOfItems");
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
    v9 = 138544130;
    v10 = v3;
    v11 = 2048;
    v12 = v4;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v7;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "<%{public}@:%p>: Initial data source created async with %lu items. Took %.1fs", (uint8_t *)&v9, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleInitialDataSourceLoaded:", *(_QWORD *)(a1 + 40));

}

+ (id)sharedQueue
{
  if (sharedQueue_onceToken_111307 != -1)
    dispatch_once(&sharedQueue_onceToken_111307, &__block_literal_global_111308);
  return (id)sharedQueue_sharedQueue_111309;
}

+ (void)loadAsyncDataSourcesImmediately
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  dispatch_block_t v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLSharedLibraryGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = a1;
    _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "<%{public}@>: Loading Async Data Sources immediately", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(a1, "sharedQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_activate(v4);

  objc_msgSend(a1, "sharedQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ASSIGN_CURRENT, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_136_111306);
  dispatch_async(v5, v6);

}

void __65__PXSharedLibrarySharingSuggestionsDataSourceManager_sharedQueue__block_invoke()
{
  NSObject *v0;
  NSObject *v1;
  dispatch_queue_t v2;
  void *v3;
  void *v4;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_initially_inactive(v1);
  attr = objc_claimAutoreleasedReturnValue();

  v2 = dispatch_queue_create("com.apple.photos.sharedLibrary.sharing-suggestions-fetch-queue", attr);
  v3 = (void *)sharedQueue_sharedQueue_111309;
  sharedQueue_sharedQueue_111309 = (uint64_t)v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scheduleMainQueueTask:", &__block_literal_global_135_111312);

}

void __65__PXSharedLibrarySharingSuggestionsDataSourceManager_sharedQueue__block_invoke_2()
{
  dispatch_activate((dispatch_object_t)sharedQueue_sharedQueue_111309);
}

@end
