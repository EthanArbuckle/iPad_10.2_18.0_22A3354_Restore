@implementation PXFetchResultBasedMemoriesDataSourceManager

- (PXFetchResultBasedMemoriesDataSourceManager)initWithMemoriesFetchResult:(id)a3
{
  id v5;
  PXFetchResultBasedMemoriesDataSourceManager *v6;
  PXMemoriesDataSourceState *v7;
  uint64_t v8;
  PXMemoriesDataSourceState *state;
  uint64_t v10;
  NSMutableOrderedSet *remainingMemoriesToFetch;
  NSMutableOrderedSet *v12;
  void *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workerQueue;
  void *v16;
  void *v18;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXFetchResultBasedMemoriesDataSourceManager;
  v6 = -[PXSectionedDataSourceManager init](&v19, sel_init);
  if (v6)
  {
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("PXMemoriesDataSourceManager.m"), 51, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("memories != nil"));

    }
    v7 = [PXMemoriesDataSourceState alloc];
    v8 = -[PXMemoriesDataSourceState initWithMemories:infosByMemory:](v7, "initWithMemories:infosByMemory:", v5, MEMORY[0x1E0C9AA70]);
    state = v6->__state;
    v6->__state = (PXMemoriesDataSourceState *)v8;

    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v10 = objc_claimAutoreleasedReturnValue();
    remainingMemoriesToFetch = v6->__remainingMemoriesToFetch;
    v6->__remainingMemoriesToFetch = (NSMutableOrderedSet *)v10;

    v12 = v6->__remainingMemoriesToFetch;
    objc_msgSend(v5, "fetchedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet addObjectsFromArray:](v12, "addObjectsFromArray:", v13);

    v14 = dispatch_queue_create("com.apple.photos.memoriesDataSource-workerQueue", 0);
    workerQueue = v6->_workerQueue;
    v6->_workerQueue = (OS_dispatch_queue *)v14;

    objc_msgSend(v5, "photoLibrary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "px_registerChangeObserver:", v6);

  }
  return v6;
}

- (PHFetchResult)memories
{
  void *v2;
  void *v3;

  -[PXFetchResultBasedMemoriesDataSourceManager _state](self, "_state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "memories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHFetchResult *)v3;
}

- (id)createInitialDataSource
{
  void *v3;

  -[PXFetchResultBasedMemoriesDataSourceManager _createMemoriesDataSourceFromCurrentState](self, "_createMemoriesDataSourceFromCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasCreatedInitialDataSource = 1;
  -[PXFetchResultBasedMemoriesDataSourceManager startLoadingIfNeeded](self, "startLoadingIfNeeded");
  return v3;
}

- (void)startLoadingIfNeeded
{
  void *v3;
  BOOL v4;
  NSObject *workerQueue;
  _QWORD block[4];
  id v7;
  BOOL v8;
  id location;

  if (!self->_isWorking)
  {
    -[PXFetchResultBasedMemoriesDataSourceManager _remainingMemoriesToFetch](self, "_remainingMemoriesToFetch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      self->_isWorking = 1;
      v4 = -[PXFetchResultBasedMemoriesDataSourceManager loadFromEnd](self, "loadFromEnd");
      objc_initWeak(&location, self);
      workerQueue = self->_workerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__PXFetchResultBasedMemoriesDataSourceManager_startLoadingIfNeeded__block_invoke;
      block[3] = &unk_1E5145760;
      objc_copyWeak(&v7, &location);
      v8 = v4;
      dispatch_async(workerQueue, block);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFetchResultBasedMemoriesDataSourceManager _remainingMemoriesToFetch](self, "_remainingMemoriesToFetch");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v6;
  if (a3)
    objc_msgSend(v6, "reverseObjectEnumerator");
  else
    objc_msgSend(v6, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", v32);
  v9 = v8;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v45;
LABEL_6:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v45 != v13)
        objc_enumerationMutation(v10);
      v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v14);
      +[PXMemoryInfo memoryInfoWithMemory:](PXMemoryInfo, "memoryInfoWithMemory:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v15);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v18 = v17 - v9;

      if (v18 > 0.25 || v18 < 0.0)
        break;
      if (v12 == ++v14)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
        if (v12)
          goto LABEL_6;
        break;
      }
    }
  }

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "allKeys");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "removeObjectsInArray:", v19);

  }
  if (!objc_msgSend(v33, "count"))
    -[PXFetchResultBasedMemoriesDataSourceManager _setRemainingMemoriesToFetch:](self, "_setRemainingMemoriesToFetch:", 0);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXFetchResultBasedMemoriesDataSourceManager memories](self, "memories");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v22 = v5;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v41 != v25)
          objc_enumerationMutation(v22);
        v27 = objc_msgSend(v21, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v20, "addIndex:", v27);
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    }
    while (v24);
  }

  v28 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v20);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PXFetchResultBasedMemoriesDataSourceManager__workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd___block_invoke;
  block[3] = &unk_1E51429B8;
  objc_copyWeak(&v38, &location);
  v35 = v22;
  v36 = v28;
  v37 = v21;
  v29 = v21;
  v30 = v28;
  v31 = v22;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&location);

}

- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  PXMemoriesDataSourceState *v15;
  void *v16;
  PXMemoriesDataSourceState *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PXMemoriesDataSourceState *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXFetchResultBasedMemoriesDataSourceManager _state](self, "_state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "infosByMemory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __113__PXFetchResultBasedMemoriesDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke;
  v41[3] = &unk_1E513C5B0;
  v14 = v13;
  v42 = v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v41);
  v15 = [PXMemoriesDataSourceState alloc];
  objc_msgSend(v11, "memories");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXMemoriesDataSourceState initWithMemories:infosByMemory:](v15, "initWithMemories:infosByMemory:", v16, v14);

  -[PXFetchResultBasedMemoriesDataSourceManager _setState:](self, "_setState:", v17);
  if (self->_hasCreatedInitialDataSource)
  {
    v36 = v17;
    v37 = v11;
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFetchResultBasedMemoriesDataSourceManager _createMemoriesDataSourceFromCurrentState](self, "_createMemoriesDataSourceFromCurrentState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFetchResultBasedMemoriesDataSourceManager memories](self, "memories");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    v38 = v10;
    v39 = v9;
    v40 = v8;
    if (v20 == v10)
    {
      v28 = v9;
    }
    else
    {
      objc_msgSend(v8, "allKeys");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0CD1588];
      objc_msgSend(v18, "_state");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "memories");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_state");
      v24 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "memories");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v23, v26, v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v24;
      objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v27);
      v28 = (id)objc_claimAutoreleasedReturnValue();

    }
    v29 = objc_alloc((Class)off_1E50B4A18);
    v30 = objc_msgSend(v18, "identifier");
    v31 = objc_msgSend(v19, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = &unk_1E53EF1B0;
    v44[0] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v29, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v30, v31, v32, v33, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v19, v34);
    v9 = v39;
    v8 = v40;
    v11 = v37;
    v10 = v38;
    v17 = v36;
  }
  self->_isWorking = 0;
  -[PXFetchResultBasedMemoriesDataSourceManager startLoadingIfNeeded](self, "startLoadingIfNeeded");

}

- (id)_createMemoriesDataSourceFromCurrentState
{
  PXStateBasedMemoriesDataSource *v3;
  void *v4;
  PXStateBasedMemoriesDataSource *v5;

  v3 = [PXStateBasedMemoriesDataSource alloc];
  -[PXFetchResultBasedMemoriesDataSourceManager _state](self, "_state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXStateBasedMemoriesDataSource initWithState:](v3, "initWithState:", v4);

  return v5;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v11;
  _QWORD block[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__241858;
  v17 = __Block_byref_object_dispose__241859;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__PXFetchResultBasedMemoriesDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v5 = (void *)v14[5];
  v11 = 0;
  objc_msgSend(v5, "stateUpdatedWithChange:outMemoriesChangeDetails:", v4, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  v8 = v14[5];
  v19[0] = CFSTR("preparedForCurrentState");
  v19[1] = CFSTR("preparedState");
  v20[0] = v8;
  v20[1] = v6;
  v19[2] = CFSTR("preparedChangeDetails");
  v20[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXFetchResultBasedMemoriesDataSourceManager _state](self, "_state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedForCurrentState"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedChangeDetails"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
    objc_msgSend(v8, "stateUpdatedWithChange:outMemoriesChangeDetails:", v6, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;
  }
  v12 = v11;
  if (v10 != v8)
  {
    -[PXFetchResultBasedMemoriesDataSourceManager _setState:](self, "_setState:", v10);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXFetchResultBasedMemoriesDataSourceManager _createMemoriesDataSourceFromCurrentState](self, "_createMemoriesDataSourceFromCurrentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc((Class)off_1E50B4A18);
    v14 = objc_msgSend(v21, "identifier");
    v22 = v6;
    v15 = objc_msgSend(v13, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = &unk_1E53EF1B0;
    v25[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v17 = v7;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v20, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v14, v15, v16, v18, 0);

    v7 = v17;
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v13, v19);

    v6 = v22;
  }

}

- (BOOL)loadFromEnd
{
  return self->_loadFromEnd;
}

- (void)setLoadFromEnd:(BOOL)a3
{
  self->_loadFromEnd = a3;
}

- (PXMemoriesDataSourceState)_state
{
  return self->__state;
}

- (void)_setState:(id)a3
{
  objc_storeStrong((id *)&self->__state, a3);
}

- (NSMutableOrderedSet)_remainingMemoriesToFetch
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)_setRemainingMemoriesToFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remainingMemoriesToFetch, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

void __76__PXFetchResultBasedMemoriesDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_state");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __113__PXFetchResultBasedMemoriesDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

void __102__PXFetchResultBasedMemoriesDataSourceManager__workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleFinishedFetchingBatch:preparedChangeDetails:forFetchResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __67__PXFetchResultBasedMemoriesDataSourceManager_startLoadingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingMemoriesInBatchesFromTheEnd:", *(unsigned __int8 *)(a1 + 40));

}

@end
