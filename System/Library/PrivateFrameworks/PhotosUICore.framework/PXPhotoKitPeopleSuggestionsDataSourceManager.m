@implementation PXPhotoKitPeopleSuggestionsDataSourceManager

- (PXPhotoKitPeopleSuggestionsDataSourceManager)initWithPeopleFetchResult:(id)a3
{
  id v4;
  PXPhotoKitPeopleSuggestionsDataSourceManager *v5;
  PXPhotoKitPeopleSuggestionsDataSourceState *v6;
  uint64_t v7;
  PXPhotoKitPeopleSuggestionsDataSourceState *state;
  uint64_t v9;
  NSMutableOrderedSet *remainingPeopleToFetch;
  NSMutableOrderedSet *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXPhotoKitPeopleSuggestionsDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v15, sel_init);
  if (v5)
  {
    v6 = [PXPhotoKitPeopleSuggestionsDataSourceState alloc];
    v7 = -[PXPhotoKitPeopleSuggestionsDataSourceState initWithPeople:personSuggestionsByPerson:](v6, "initWithPeople:personSuggestionsByPerson:", v4, MEMORY[0x1E0C9AA70]);
    state = v5->__state;
    v5->__state = (PXPhotoKitPeopleSuggestionsDataSourceState *)v7;

    if (v4 && objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
      v9 = objc_claimAutoreleasedReturnValue();
      remainingPeopleToFetch = v5->__remainingPeopleToFetch;
      v5->__remainingPeopleToFetch = (NSMutableOrderedSet *)v9;

      v11 = v5->__remainingPeopleToFetch;
      objc_msgSend(v4, "fetchedObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableOrderedSet addObjectsFromArray:](v11, "addObjectsFromArray:", v12);

    }
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "px_registerChangeObserver:", v5);

  }
  return v5;
}

- (id)_initWithAssetCollection:(id)a3
{
  id v5;
  PXPhotoKitPeopleSuggestionsDataSourceManager *v6;
  PXPhotoKitPeopleSuggestionsDataSourceManager *v7;

  v5 = a3;
  v6 = -[PXPhotoKitPeopleSuggestionsDataSourceManager initWithPeopleFetchResult:](self, "initWithPeopleFetchResult:", 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_assetCollection, a3);
    v7->_needsDeferredLoading = 1;
  }

  return v7;
}

- (void)startLoading
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (self->_needsDeferredLoading
    && !-[PXPhotoKitPeopleSuggestionsDataSourceManager hasStartedLoadingFinalDataSource](self, "hasStartedLoadingFinalDataSource"))
  {
    -[PXPhotoKitPeopleSuggestionsDataSourceManager setHasStartedLoadingFinalDataSource:](self, "setHasStartedLoadingFinalDataSource:", 1);
    objc_initWeak(&location, self);
    objc_msgSend((id)objc_opt_class(), "sharedWorkerQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__PXPhotoKitPeopleSuggestionsDataSourceManager_startLoading__block_invoke;
    v4[3] = &unk_1E5148D30;
    objc_copyWeak(&v5, &location);
    dispatch_async(v3, v4);

    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

- (void)boostLoading
{
  void *v2;
  uint64_t v3;
  dispatch_block_t v4;
  NSObject *queue;

  -[PXPhotoKitPeopleSuggestionsDataSourceManager people](self, "people");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "sharedWorkerQueue");
    queue = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INITIATED, 0, &__block_literal_global_131_136952);
    dispatch_async(queue, v4);

  }
}

- (BOOL)isLoading
{
  _BOOL4 v3;

  v3 = -[PXPhotoKitPeopleSuggestionsDataSourceManager hasStartedLoadingFinalDataSource](self, "hasStartedLoadingFinalDataSource");
  if (v3)
    LOBYTE(v3) = !-[PXPhotoKitPeopleSuggestionsDataSourceManager hasFinishedLoadingFinalDataSource](self, "hasFinishedLoadingFinalDataSource");
  return v3;
}

- (id)mediaProvider
{
  return objc_alloc_init(PXPhotoKitPeopleSuggestionsMediaProvider);
}

- (void)_loadFinalDataSource
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
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id location;

  -[PXPhotoKitPeopleSuggestionsDataSourceManager assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CD16C0];
  -[PXPhotoKitPeopleSuggestionsDataSourceManager assetCollection](self, "assetCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchSuggestedPersonsForAssetCollection:options:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitPeopleSuggestionsDataSourceManager set_remainingPeopleToFetch:](self, "set_remainingPeopleToFetch:", v9);

    -[PXPhotoKitPeopleSuggestionsDataSourceManager _remainingPeopleToFetch](self, "_remainingPeopleToFetch");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

  }
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__PXPhotoKitPeopleSuggestionsDataSourceManager__loadFinalDataSource__block_invoke;
  block[3] = &unk_1E5147280;
  objc_copyWeak(&v15, &location);
  v14 = v8;
  v12 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

- (void)_handleFinishedLoadingFinalDataSourceFetchResult:(id)a3
{
  id v4;
  PXPhotoKitPeopleSuggestionsDataSourceState *v5;
  PXPhotoKitPeopleSuggestionsDataSourceState *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  PXPhotoKitPeopleSuggestionsDataSourceState *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_hasFinishedLoadingFinalDataSource = 1;
  v5 = [PXPhotoKitPeopleSuggestionsDataSourceState alloc];
  v6 = -[PXPhotoKitPeopleSuggestionsDataSourceState initWithPeople:personSuggestionsByPerson:](v5, "initWithPeople:personSuggestionsByPerson:", v4, MEMORY[0x1E0C9AA70]);
  -[PXPhotoKitPeopleSuggestionsDataSourceManager people](self, "people");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitPeopleSuggestionsDataSourceManager set_state:](self, "set_state:", v6);
  if (self->_hasCreatedInitialDataSource)
  {
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitPeopleSuggestionsDataSourceManager _createSuggestionsDataSourceFromCurrentState](self, "_createSuggestionsDataSourceFromCurrentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fetchedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:", v9, v10, MEMORY[0x1E0C9AA60]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc((Class)off_1E50B4A18);
    v12 = objc_msgSend(v21, "identifier");
    v13 = objc_msgSend(v8, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v14 = v4;
    v15 = v6;
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = &unk_1E53ED9F8;
    v23[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v11, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v12, v13, v17, v18, 0);

    v7 = v16;
    v6 = v15;
    v4 = v14;
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v8, v19);

  }
  self->_isPrefetching = 0;
  -[PXPhotoKitPeopleSuggestionsDataSourceManager startPrefetchingIfNeeded](self, "startPrefetchingIfNeeded");

}

- (id)people
{
  void *v2;
  void *v3;

  -[PXPhotoKitPeopleSuggestionsDataSourceManager _state](self, "_state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "people");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createInitialDataSource
{
  void *v3;

  -[PXPhotoKitPeopleSuggestionsDataSourceManager _createSuggestionsDataSourceFromCurrentState](self, "_createSuggestionsDataSourceFromCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasCreatedInitialDataSource = 1;
  -[PXPhotoKitPeopleSuggestionsDataSourceManager startPrefetchingIfNeeded](self, "startPrefetchingIfNeeded");
  return v3;
}

- (id)_createSuggestionsDataSourceFromCurrentState
{
  PXPhotoKitPeopleSuggestionsDataSource *v3;
  void *v4;
  PXPhotoKitPeopleSuggestionsDataSource *v5;

  v3 = [PXPhotoKitPeopleSuggestionsDataSource alloc];
  -[PXPhotoKitPeopleSuggestionsDataSourceManager _state](self, "_state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotoKitPeopleSuggestionsDataSource initWithState:](v3, "initWithState:", v4);

  return v5;
}

- (void)startPrefetchingIfNeeded
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_isPrefetching)
  {
    -[PXPhotoKitPeopleSuggestionsDataSourceManager _remainingPeopleToFetch](self, "_remainingPeopleToFetch");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = -[PXPhotoKitPeopleSuggestionsDataSourceManager hasFinishedLoadingFinalDataSource](self, "hasFinishedLoadingFinalDataSource");

      if (v5)
      {
        self->_isPrefetching = 1;
        objc_initWeak(&location, self);
        objc_msgSend((id)objc_opt_class(), "sharedWorkerQueue");
        v6 = objc_claimAutoreleasedReturnValue();
        v7[0] = MEMORY[0x1E0C809B0];
        v7[1] = 3221225472;
        v7[2] = __72__PXPhotoKitPeopleSuggestionsDataSourceManager_startPrefetchingIfNeeded__block_invoke;
        v7[3] = &unk_1E5148D30;
        objc_copyWeak(&v8, &location);
        dispatch_async(v6, v7);

        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);
      }
    }
  }
}

- (void)_workerQueue_fetchRemainingPeopleInBatches
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD block[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id location;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitPeopleSuggestionsDataSourceManager _remainingPeopleToFetch](self, "_remainingPeopleToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitPeopleSuggestionsDataSourceManager people](self, "people");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v7 = v6;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v12);
      +[PXPhotoKitPersonSuggestion personSuggestionWithPerson:](PXPhotoKitPersonSuggestion, "personSuggestionWithPerson:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, v13);
      v15 = objc_msgSend(v5, "indexOfObject:", v13);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v23, "addIndex:", v15);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v17 = v16 - v7;

      if (v17 > 0.25 || v17 < 0.0)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v18);

  }
  if (!objc_msgSend(v8, "count"))
    -[PXPhotoKitPeopleSuggestionsDataSourceManager set_remainingPeopleToFetch:](self, "set_remainingPeopleToFetch:", 0);
  v19 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v23);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__PXPhotoKitPeopleSuggestionsDataSourceManager__workerQueue_fetchRemainingPeopleInBatches__block_invoke;
  block[3] = &unk_1E51429B8;
  objc_copyWeak(&v28, &location);
  v25 = v3;
  v26 = v19;
  v27 = v5;
  v20 = v5;
  v21 = v19;
  v22 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v28);
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
  PXPhotoKitPeopleSuggestionsDataSourceState *v15;
  void *v16;
  PXPhotoKitPeopleSuggestionsDataSourceState *v17;
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
  PXPhotoKitPeopleSuggestionsDataSourceState *v36;
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
  -[PXPhotoKitPeopleSuggestionsDataSourceManager _state](self, "_state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "personSuggestionsByPerson");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __114__PXPhotoKitPeopleSuggestionsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke;
  v41[3] = &unk_1E512C6B0;
  v14 = v13;
  v42 = v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v41);
  v15 = [PXPhotoKitPeopleSuggestionsDataSourceState alloc];
  objc_msgSend(v11, "people");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXPhotoKitPeopleSuggestionsDataSourceState initWithPeople:personSuggestionsByPerson:](v15, "initWithPeople:personSuggestionsByPerson:", v16, v14);

  -[PXPhotoKitPeopleSuggestionsDataSourceManager set_state:](self, "set_state:", v17);
  if (self->_hasCreatedInitialDataSource)
  {
    v36 = v17;
    v37 = v11;
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitPeopleSuggestionsDataSourceManager _createSuggestionsDataSourceFromCurrentState](self, "_createSuggestionsDataSourceFromCurrentState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitPeopleSuggestionsDataSourceManager people](self, "people");
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
      objc_msgSend(v22, "people");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_state");
      v24 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "people");
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
    v43 = &unk_1E53ED9F8;
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
  self->_isPrefetching = 0;
  -[PXPhotoKitPeopleSuggestionsDataSourceManager startPrefetchingIfNeeded](self, "startPrefetchingIfNeeded");

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
  v16 = __Block_byref_object_copy__136904;
  v17 = __Block_byref_object_dispose__136905;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXPhotoKitPeopleSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5148AA8;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v5 = (void *)v14[5];
  v11 = 0;
  objc_msgSend(v5, "stateUpdatedWithChange:changeDetails:", v4, &v11);
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
  -[PXPhotoKitPeopleSuggestionsDataSourceManager _state](self, "_state");
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
    objc_msgSend(v8, "stateUpdatedWithChange:changeDetails:", v6, &v23);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v23;
  }
  v12 = v11;
  if (v10 != v8)
  {
    -[PXPhotoKitPeopleSuggestionsDataSourceManager set_state:](self, "set_state:", v10);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitPeopleSuggestionsDataSourceManager _createSuggestionsDataSourceFromCurrentState](self, "_createSuggestionsDataSourceFromCurrentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc((Class)off_1E50B4A18);
    v14 = objc_msgSend(v21, "identifier");
    v22 = v6;
    v15 = objc_msgSend(v13, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = &unk_1E53ED9F8;
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

- (PXPhotoKitPeopleSuggestionsDataSourceState)_state
{
  return self->__state;
}

- (void)set_state:(id)a3
{
  objc_storeStrong((id *)&self->__state, a3);
}

- (NSMutableOrderedSet)_remainingPeopleToFetch
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 136, 1);
}

- (void)set_remainingPeopleToFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (void)setAssetCollection:(id)a3
{
  objc_storeStrong((id *)&self->_assetCollection, a3);
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_updater, a3);
}

- (BOOL)hasStartedLoadingFinalDataSource
{
  return self->_hasStartedLoadingFinalDataSource;
}

- (void)setHasStartedLoadingFinalDataSource:(BOOL)a3
{
  self->_hasStartedLoadingFinalDataSource = a3;
}

- (BOOL)hasFinishedLoadingFinalDataSource
{
  return self->_hasFinishedLoadingFinalDataSource;
}

- (void)setHasFinishedLoadingFinalDataSource:(BOOL)a3
{
  self->_hasFinishedLoadingFinalDataSource = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
  objc_storeStrong((id *)&self->__remainingPeopleToFetch, 0);
  objc_storeStrong((id *)&self->__state, 0);
}

void __77__PXPhotoKitPeopleSuggestionsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
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

void __114__PXPhotoKitPeopleSuggestionsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __90__PXPhotoKitPeopleSuggestionsDataSourceManager__workerQueue_fetchRemainingPeopleInBatches__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleFinishedFetchingBatch:preparedChangeDetails:forFetchResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __72__PXPhotoKitPeopleSuggestionsDataSourceManager_startPrefetchingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingPeopleInBatches");

}

void __68__PXPhotoKitPeopleSuggestionsDataSourceManager__loadFinalDataSource__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleFinishedLoadingFinalDataSourceFetchResult:", *(_QWORD *)(a1 + 32));

}

void __60__PXPhotoKitPeopleSuggestionsDataSourceManager_startLoading__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_loadFinalDataSource");

}

+ (OS_dispatch_queue)sharedWorkerQueue
{
  if (sharedWorkerQueue_onceToken != -1)
    dispatch_once(&sharedWorkerQueue_onceToken, &__block_literal_global_136977);
  return (OS_dispatch_queue *)(id)sharedWorkerQueue__sharedWorkerQueue;
}

+ (id)sharedLibraryPeopleSuggestionsDataSourceManager
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  PXPhotoKitPeopleSuggestionsDataSourceManager *v20;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "librarySpecificFetchOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!PFOSVariantHasInternalUI())
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("PXPeopleSuggestionsDataSourceManagerPersonUUID"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mockPersonSuggestionForSetupAssistant");

    if ((v13 & 1) != 0)
    {
      objc_msgSend(v4, "setFetchLimit:", 3);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(verifiedType = %ld) || (verifiedType = %ld)"), 1, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setPredicate:", v14);

      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("type"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setSortDescriptors:", v16);

      objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithOptions:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLUIGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "firstObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = v19;
        _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "Using mock people suggestion: \"%@\", buf, 0xCu);

      }
      goto LABEL_11;
    }
LABEL_10:
    objc_msgSend(a1, "personsForClient:fetchOptions:", 4, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = (void *)v6;

  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Using provided person UUID for people suggestion: \"%@\", buf, 0xCu);
  }

  v9 = (void *)MEMORY[0x1E0CD16C0];
  v23 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchPersonsWithLocalIdentifiers:options:", v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
  v20 = -[PXPhotoKitPeopleSuggestionsDataSourceManager initWithPeopleFetchResult:]([PXPhotoKitPeopleSuggestionsDataSourceManager alloc], "initWithPeopleFetchResult:", v11);

  return v20;
}

+ (id)personsForClient:(unint64_t)a3 fetchOptions:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD block[4];
  id v13;
  uint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__136904;
  v20 = __Block_byref_object_dispose__136905;
  v21 = 0;
  objc_msgSend(a1, "sharedWorkerQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PXPhotoKitPeopleSuggestionsDataSourceManager_personsForClient_fetchOptions___block_invoke;
  block[3] = &unk_1E5141AE0;
  v14 = &v16;
  v15 = a3;
  v8 = v6;
  v13 = v8;
  dispatch_async(v7, block);

  objc_msgSend(a1, "sharedWorkerQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  px_dispatch_queue_wait();

  v10 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v10;
}

+ (id)mockDataSourceManagerFromPeopleInPhotosInAssetCollection:(id)a3
{
  void *v3;
  PXPhotoKitPeopleSuggestionsDataSourceManager *v4;

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsForAssetCollection:options:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotoKitPeopleSuggestionsDataSourceManager initWithPeopleFetchResult:]([PXPhotoKitPeopleSuggestionsDataSourceManager alloc], "initWithPeopleFetchResult:", v3);

  return v4;
}

+ (id)photosGraphPeopleSuggestionsDataSourceManagerWithAssetCollection:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = -[PXPhotoKitPeopleSuggestionsDataSourceManager _initWithAssetCollection:]([PXPhotoKitPeopleSuggestionsDataSourceManager alloc], "_initWithAssetCollection:", v3);

  return v4;
}

void __78__PXPhotoKitPeopleSuggestionsDataSourceManager_personsForClient_fetchOptions___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchSuggestedPersonsForClient:options:", a1[6], a1[4]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__PXPhotoKitPeopleSuggestionsDataSourceManager_sharedWorkerQueue__block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *attr;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_UTILITY, 0);
  attr = objc_claimAutoreleasedReturnValue();

  v1 = dispatch_queue_create("com.apple.photos.PXPhotoKitPeopleSuggestionsDataSourceManager-sharedWorkerQueue", attr);
  v2 = (void *)sharedWorkerQueue__sharedWorkerQueue;
  sharedWorkerQueue__sharedWorkerQueue = (uint64_t)v1;

}

@end
