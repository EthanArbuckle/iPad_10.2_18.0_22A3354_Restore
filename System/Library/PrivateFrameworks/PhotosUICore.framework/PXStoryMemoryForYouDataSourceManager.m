@implementation PXStoryMemoryForYouDataSourceManager

- (PXStoryMemoryForYouDataSourceManager)initWithPhotoLibrary:(id)a3 libraryFilterState:(id)a4
{
  id v7;
  id v8;
  PXStoryMemoryForYouDataSourceManager *v9;
  PXStoryMemoryForYouDataSourceManager *v10;
  objc_class *v11;
  id v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  PXUpdater *updater;
  NSObject *v17;
  _QWORD block[4];
  PXStoryMemoryForYouDataSourceManager *v20;
  objc_super v21;

  v7 = a3;
  v8 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryMemoryForYouDataSourceManager;
  v9 = -[PXSectionedDataSourceManager init](&v21, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_libraryFilterState, a4);
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = dispatch_queue_create((const char *)objc_msgSend(v12, "UTF8String"), 0);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v13;

    v15 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:needsUpdateSelector:", v10, sel__setNeedsUpdate);
    updater = v10->_updater;
    v10->_updater = (PXUpdater *)v15;

    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateChildDataSourceManager);
    -[PXUpdater addUpdateSelector:](v10->_updater, "addUpdateSelector:", sel__updateDataSource);
    -[PXStoryMemoryForYouDataSourceManager _rebuildChildDataSourceManager](v10, "_rebuildChildDataSourceManager");
    -[PXLibraryFilterState registerChangeObserver:context:](v10->_libraryFilterState, "registerChangeObserver:context:", v10, PXLibraryFilterStateObservationContext_91668);
    -[PXStoryMemoryForYouDataSourceManager queue](v10, "queue");
    v17 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__PXStoryMemoryForYouDataSourceManager_initWithPhotoLibrary_libraryFilterState___block_invoke;
    block[3] = &unk_1E5149198;
    v20 = v10;
    dispatch_sync(v17, block);

  }
  return v10;
}

- (PXStoryMemoryForYouDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryForYouDataSourceManager.m"), 77, CFSTR("%s is not available as initializer"), "-[PXStoryMemoryForYouDataSourceManager init]");

  abort();
}

- (void)_rebuildChildDataSourceManager
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __70__PXStoryMemoryForYouDataSourceManager__rebuildChildDataSourceManager__block_invoke;
  v2[3] = &unk_1E5124CE8;
  v2[4] = self;
  -[PXStoryMemoryForYouDataSourceManager performChanges:](self, "performChanges:", v2);
}

- (void)_rebuildDataSource
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__PXStoryMemoryForYouDataSourceManager__rebuildDataSource__block_invoke;
  v2[3] = &unk_1E5124CE8;
  v2[4] = self;
  -[PXStoryMemoryForYouDataSourceManager performChanges:](self, "performChanges:", v2);
}

- (id)forYouMemoryFetchOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  -[PXStoryMemoryForYouDataSourceManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setWantsIncrementalChangeDetails:", 1);
  +[PXForYouSettings sharedInstance](PXForYouSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v5, "maxMemoriesToFetch"));

  objc_msgSend(v4, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("rejected = NO AND featuredState != %d"), -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v6);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSortDescriptors:", v9);

  v15 = *MEMORY[0x1E0CD1D28];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFetchPropertySets:", v10);

  -[PXStoryMemoryForYouDataSourceManager libraryFilterState](self, "libraryFilterState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "viewMode");
  if (v12 == 2)
    v13 = 1;
  else
    v13 = 2 * (v12 != 1);
  objc_msgSend(v4, "setSharingFilter:", v13);

  return v4;
}

- (id)dailyMemoriesFromMemoryFetchResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__PXStoryMemoryForYouDataSourceManager_dailyMemoriesFromMemoryFetchResult___block_invoke;
  v22[3] = &unk_1E5124D10;
  v22[4] = &v23;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v22);
  objc_msgSend(v4, "fetchedObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v24[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    PLMemoriesGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_DEBUG, "[PXStoryMemoryForYouDataSourceManager] No featured memory found", buf, 2u);
    }

    v8 = v24[3];
    v9 = v6;
  }
  else
  {
    PLMemoriesGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = v24[3];
      *(_DWORD *)buf = 134217984;
      v28 = v11;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEBUG, "[PXStoryMemoryForYouDataSourceManager] Found oldest featured memory at index:%ld", buf, 0xCu);
    }

    v8 = v24[3];
    v9 = v8 + 1;
  }
  v12 = v9 <= 5 || v8 == 0x7FFFFFFFFFFFFFFFLL;
  v13 = 5;
  if (!v12)
    v13 = v9;
  if (v13 < v6)
    v6 = v13;
  PLMemoriesGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v28 = v6;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_DEBUG, "[PXStoryMemoryForYouDataSourceManager] Preparing %ld daily memories", buf, 0xCu);
  }

  objc_msgSend(v5, "subarrayWithRange:", 0, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0CD1620]);
  -[PXStoryMemoryForYouDataSourceManager photoLibrary](self, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchPropertySets");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v16, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v15, v17, v18, v19, 0, 1);

  _Block_object_dispose(&v23, 8);
  return v20;
}

- (id)dataSourceFromFetchResult:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  PXMemoriesDataSourceState *v12;
  PXStateBasedMemoriesDataSource *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", v10, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v12 = -[PXMemoriesDataSourceState initWithMemories:infosByMemory:]([PXMemoriesDataSourceState alloc], "initWithMemories:infosByMemory:", v5, v4);
  v13 = -[PXStateBasedMemoriesDataSource initWithState:]([PXStateBasedMemoriesDataSource alloc], "initWithState:", v12);

  return v13;
}

- (PHFetchResult)memories
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_state");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "memories");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (PHFetchResult *)v5;
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXStoryMemoryForYouDataSourceManager;
  -[PXStoryMemoryForYouDataSourceManager performChanges:](&v3, sel_performChanges_, a3);
}

- (void)didPerformChanges
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXStoryMemoryForYouDataSourceManager;
  -[PXStoryMemoryForYouDataSourceManager didPerformChanges](&v4, sel_didPerformChanges);
  -[PXStoryMemoryForYouDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateIfNeeded");

}

- (BOOL)hasAnyMemories
{
  void *v2;
  void *v3;
  BOOL v4;

  -[PXStoryMemoryForYouDataSourceManager forYouMemoriesDataSourceManager](self, "forYouMemoriesDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (NSDate)mostRecentCreationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PXStoryMemoryForYouDataSourceManager forYouMemoriesDataSourceManager](self, "forYouMemoriesDataSourceManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setIsActive:(BOOL)a3
{
  void *v4;

  if (self->_isActive != a3)
  {
    self->_isActive = a3;
    -[PXStoryMemoryForYouDataSourceManager signalChange:](self, "signalChange:", 2);
    if (self->_isActive)
    {
      -[PXStoryMemoryForYouDataSourceManager forYouMemoriesDataSourceManager](self, "forYouMemoriesDataSourceManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startLoadingIfNeeded");

      -[PXStoryMemoryForYouDataSourceManager _invalidateDataSource](self, "_invalidateDataSource");
    }
  }
}

- (id)createInitialDataSource
{
  return (id)objc_msgSend(off_1E50B4A10, "emptyDataSource");
}

- (id)pauseChangeDeliveryWithTimeout:(double)a3 identifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  -[PXStoryMemoryForYouDataSourceManager photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_beginPausingChangesWithTimeout:identifier:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)resumeChangeDeliveryAndBackgroundLoading:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXStoryMemoryForYouDataSourceManager photoLibrary](self, "photoLibrary");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_endPausingChanges:", v4);

}

- (void)_setNeedsUpdate
{
  -[PXStoryMemoryForYouDataSourceManager signalChange:](self, "signalChange:", 0);
}

- (void)_invalidateChildDataSourceManager
{
  void *v3;
  id v4;

  -[PXStoryMemoryForYouDataSourceManager updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateOf:", sel__updateChildDataSourceManager);

  -[PXStoryMemoryForYouDataSourceManager updater](self, "updater");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdateOf:", sel__updateDataSource);

}

- (void)_updateChildDataSourceManager
{
  PXFetchResultBasedMemoriesDataSourceManager *forYouMemoriesDataSourceManager;
  void *v4;
  PXFetchResultBasedMemoriesDataSourceManager *v5;
  PXFetchResultBasedMemoriesDataSourceManager *v6;
  id v7;

  forYouMemoriesDataSourceManager = self->_forYouMemoriesDataSourceManager;
  if (forYouMemoriesDataSourceManager)
    -[PXSectionedDataSourceManager unregisterChangeObserver:context:](forYouMemoriesDataSourceManager, "unregisterChangeObserver:context:", self, ForYouMemoriesDataSourceManagerObservationContext);
  -[PXStoryMemoryForYouDataSourceManager forYouMemoryFetchOptions](self, "forYouMemoryFetchOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXFetchResultBasedMemoriesDataSourceManager initWithMemoriesFetchResult:]([PXFetchResultBasedMemoriesDataSourceManager alloc], "initWithMemoriesFetchResult:", v4);
  v6 = self->_forYouMemoriesDataSourceManager;
  self->_forYouMemoriesDataSourceManager = v5;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_forYouMemoriesDataSourceManager, "registerChangeObserver:context:", self, ForYouMemoriesDataSourceManagerObservationContext);
}

- (void)_invalidateDataSource
{
  id v2;

  -[PXStoryMemoryForYouDataSourceManager updater](self, "updater");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdateOf:", sel__updateDataSource);

}

- (void)_updateDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  char v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[PXStoryMemoryForYouDataSourceManager forYouMemoriesDataSourceManager](self, "forYouMemoriesDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMemoryForYouDataSourceManager previousForYouMemoriesDataSource](self, "previousForYouMemoriesDataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "memories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXStoryMemoryForYouDataSourceManager dailyMemoriesFromMemoryFetchResult:](self, "dailyMemoriesFromMemoryFetchResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryMemoryForYouDataSourceManager previousForYouMemoriesDataSource](self, "previousForYouMemoriesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v38 = v8;
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "_state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "memories");
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "changeHistory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", objc_msgSend(v4, "identifier"), objc_msgSend(v5, "identifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "count") == 1)
    {
      objc_msgSend(v13, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "itemChangesInSection:", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "hasIncrementalChanges") & 1) != 0)
      {
        objc_msgSend(v15, "changedIndexes");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_9;
      }
      else
      {

      }
    }
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v7, "count"));
LABEL_9:
    objc_msgSend(v7, "objectsAtIndexes:", v16);
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = v38;
    v37 = (void *)v18;
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CD1588], "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v11, v38, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v39;
        if (!objc_msgSend(v19, "hasAnyChanges"))
        {
LABEL_24:

          goto LABEL_25;
        }
        v36 = v11;
        LOBYTE(v11) = 1;
LABEL_16:
        PLMemoriesGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v43 = v38;
          _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_DEBUG, "[PXStoryMemoryForYouDataSourceManager] Update daily memories:%@", buf, 0xCu);
        }

        -[PXStoryMemoryForYouDataSourceManager dataSourceFromFetchResult:](self, "dataSourceFromFetchResult:", v38);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v11 ^ 1;
        if (!v21)
          v24 = 1;
        if ((v24 & 1) != 0)
        {
          v32 = 0;
        }
        else
        {
          v35 = v3;
          objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v20);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_alloc((Class)off_1E50B4A18);
          v25 = objc_msgSend(v21, "identifier");
          v26 = v4;
          v27 = v25;
          v28 = objc_msgSend(v23, "identifier");
          objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = &unk_1E53ECF00;
          v41 = v34;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v27;
          v4 = v26;
          v32 = (void *)objc_msgSend(v33, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v31, v28, v29, v30, 0);

          v8 = v38;
          v3 = v35;

        }
        v11 = v36;
        -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v23, v32);

        v21 = v39;
        goto LABEL_24;
      }
      v36 = v11;
      LOBYTE(v11) = 0;
    }
    else
    {
      v36 = 0;
      v20 = 0;
    }
    v21 = v39;
    goto LABEL_16;
  }
  -[PXStoryMemoryForYouDataSourceManager dataSourceFromFetchResult:](self, "dataSourceFromFetchResult:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v17, 0);

LABEL_25:
  -[PXStoryMemoryForYouDataSourceManager setPreviousForYouMemoriesDataSource:](self, "setPreviousForYouMemoriesDataSource:", v5);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[5];

  v6 = a4;
  v9 = a3;
  if ((void *)ForYouMemoriesDataSourceManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
    {
      v12 = v9;
      -[PXStoryMemoryForYouDataSourceManager queue](self, "queue");
      v10 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PXStoryMemoryForYouDataSourceManager_observable_didChange_context___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_sync(v10, block);

      goto LABEL_7;
    }
  }
  else
  {
    if ((void *)PXLibraryFilterStateObservationContext_91668 != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryMemoryForYouDataSourceManager.m"), 313, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 1) != 0)
    {
      v12 = v9;
      -[PXStoryMemoryForYouDataSourceManager _rebuildChildDataSourceManager](self, "_rebuildChildDataSourceManager");
LABEL_7:
      v9 = v12;
    }
  }

}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)queue_isInitialized
{
  return self->_queue_isInitialized;
}

- (void)setQueue_isInitialized:(BOOL)a3
{
  self->_queue_isInitialized = a3;
}

- (BOOL)queue_forYouMemoriesDataSourceDidChangeDuringInitialization
{
  return self->_queue_forYouMemoriesDataSourceDidChangeDuringInitialization;
}

- (void)setQueue_forYouMemoriesDataSourceDidChangeDuringInitialization:(BOOL)a3
{
  self->_queue_forYouMemoriesDataSourceDidChangeDuringInitialization = a3;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXFetchResultBasedMemoriesDataSourceManager)forYouMemoriesDataSourceManager
{
  return self->_forYouMemoriesDataSourceManager;
}

- (PXStateBasedMemoriesDataSource)previousForYouMemoriesDataSource
{
  return self->_previousForYouMemoriesDataSource;
}

- (void)setPreviousForYouMemoriesDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_previousForYouMemoriesDataSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousForYouMemoriesDataSource, 0);
  objc_storeStrong((id *)&self->_forYouMemoriesDataSourceManager, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __69__PXStoryMemoryForYouDataSourceManager_observable_didChange_context___block_invoke(uint64_t a1)
{
  char v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "queue_isInitialized");
  v3 = *(void **)(a1 + 32);
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "_rebuildDataSource");
  else
    return objc_msgSend(v3, "setQueue_forYouMemoriesDataSourceDidChangeDuringInitialization:", 1);
}

uint64_t __75__PXStoryMemoryForYouDataSourceManager_dailyMemoriesFromMemoryFetchResult___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "featuredState");
  if (result == 1)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a3;
  return result;
}

uint64_t __58__PXStoryMemoryForYouDataSourceManager__rebuildDataSource__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateDataSource");
}

uint64_t __70__PXStoryMemoryForYouDataSourceManager__rebuildChildDataSourceManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateChildDataSourceManager");
}

void __80__PXStoryMemoryForYouDataSourceManager_initWithPhotoLibrary_libraryFilterState___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "setQueue_isInitialized:", 1);
  if (objc_msgSend(*(id *)(a1 + 32), "queue_forYouMemoriesDataSourceDidChangeDuringInitialization"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(off_1E50B4758, "sharedScheduler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __80__PXStoryMemoryForYouDataSourceManager_initWithPhotoLibrary_libraryFilterState___block_invoke_2;
    v3[3] = &unk_1E5148D30;
    objc_copyWeak(&v4, &location);
    objc_msgSend(v2, "dispatchOnMainThreadWhenNotScrolling:", v3);

    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __80__PXStoryMemoryForYouDataSourceManager_initWithPhotoLibrary_libraryFilterState___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_rebuildDataSource");

}

@end
