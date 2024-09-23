@implementation PXCMMMomentsInvitationsDataSourceManager

- (PXCMMMomentsInvitationsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentsInvitationsDataSourceManager.m"), 55, CFSTR("%s is not available as initializer"), "-[PXCMMMomentsInvitationsDataSourceManager init]");

  abort();
}

- (PXCMMMomentsInvitationsDataSourceManager)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXCMMMomentsInvitationsDataSourceManager *v7;
  PXCMMMomentsInvitationsDataSourceManager *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workerQueue;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSMutableOrderedSet *remainingAssetCollectionObjectIDsToFetch;
  PXCMMMomentsInvitationsDataSourceState *v22;
  uint64_t v23;
  PXCMMMomentsInvitationsDataSourceState *state;
  void *v26;
  objc_super v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentsInvitationsDataSourceManager.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v27.receiver = self;
  v27.super_class = (Class)PXCMMMomentsInvitationsDataSourceManager;
  v7 = -[PXSectionedDataSourceManager init](&v27, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
    -[PHPhotoLibrary px_registerChangeObserver:](v8->_photoLibrary, "px_registerChangeObserver:", v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v11 = dispatch_queue_create("com.apple.photos.PXCMMMomentsInvitationsDataSourceManager", v10);
    workerQueue = v8->_workerQueue;
    v8->_workerQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(v6, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setSortDescriptors:", v15);

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("estimatedAssetCount > 8"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPredicate:", v16);

    objc_msgSend(v13, "setFetchLimit:", 6);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsWithOptions:", v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x1E0C99E10];
    objc_msgSend(v17, "fetchedObjectIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orderedSetWithArray:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    remainingAssetCollectionObjectIDsToFetch = v8->__remainingAssetCollectionObjectIDsToFetch;
    v8->__remainingAssetCollectionObjectIDsToFetch = (NSMutableOrderedSet *)v20;

    v22 = [PXCMMMomentsInvitationsDataSourceState alloc];
    v23 = -[PXCMMMomentsInvitationsDataSourceState initWithAssetCollections:invitationsByAssetCollectionObjectID:](v22, "initWithAssetCollections:invitationsByAssetCollectionObjectID:", v17, MEMORY[0x1E0C9AA70]);
    state = v8->__state;
    v8->__state = (PXCMMMomentsInvitationsDataSourceState *)v23;

  }
  return v8;
}

- (id)mediaProvider
{
  return objc_alloc_init(PXPhotoKitUIMediaProvider);
}

- (id)assetCollections
{
  void *v2;
  void *v3;

  -[PXCMMMomentsInvitationsDataSourceManager _state](self, "_state");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)createInitialDataSource
{
  void *v3;

  -[PXCMMMomentsInvitationsDataSourceManager _createInvitationsDataSourceFromCurrentState](self, "_createInvitationsDataSourceFromCurrentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasCreatedInitialDataSource = 1;
  -[PXCMMMomentsInvitationsDataSourceManager startLoadingIfNeeded](self, "startLoadingIfNeeded");
  return v3;
}

- (id)_createInvitationsDataSourceFromCurrentState
{
  PXCMMMomentsInvitationsDataSource *v3;
  void *v4;
  PXCMMMomentsInvitationsDataSource *v5;

  v3 = [PXCMMMomentsInvitationsDataSource alloc];
  -[PXCMMMomentsInvitationsDataSourceManager _state](self, "_state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXCMMMomentsInvitationsDataSource initWithState:](v3, "initWithState:", v4);

  return v5;
}

- (void)startLoadingIfNeeded
{
  void *v3;
  NSObject *workerQueue;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_isLoading)
  {
    -[PXCMMMomentsInvitationsDataSourceManager _remainingAssetCollectionObjectIDsToFetch](self, "_remainingAssetCollectionObjectIDsToFetch");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      self->_isLoading = 1;
      objc_initWeak(&location, self);
      workerQueue = self->_workerQueue;
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __64__PXCMMMomentsInvitationsDataSourceManager_startLoadingIfNeeded__block_invoke;
      v5[3] = &unk_1E5148D30;
      objc_copyWeak(&v6, &location);
      dispatch_async(workerQueue, v5);
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_workerQueue_fetchRemainingAssetCollectionsInBatches
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  PXCMMMomentsInvitationsDataSourceManager *val;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id location;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  val = self;
  -[PXCMMMomentsInvitationsDataSourceManager _remainingAssetCollectionObjectIDsToFetch](self, "_remainingAssetCollectionObjectIDsToFetch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v48;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v48 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v11);
      v13 = objc_alloc(MEMORY[0x1E0CD1620]);
      v52 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMMomentsInvitationsDataSourceManager photoLibrary](val, "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v15, v16, 0, 0, 1);

      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCMMMomentsInvitation invitationWithAssetCollection:](PXCMMMomentsInvitation, "invitationWithAssetCollection:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, v12);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v21 = v20 - v6;

      if (v21 > 0.25 || v21 < 0.0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectsInArray:", v22);

  }
  if (!objc_msgSend(v7, "count"))
    -[PXCMMMomentsInvitationsDataSourceManager set_remainingAssetCollectionObjectIDsToFetch:](val, "set_remainingAssetCollectionObjectIDsToFetch:", 0);
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMMomentsInvitationsDataSourceManager assetCollections](val, "assetCollections");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchedObjectIDs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v26 = v3;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v44 != v29)
          objc_enumerationMutation(v26);
        v31 = objc_msgSend(v25, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
        if (v31 != 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v23, "addIndex:", v31);
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v28);
  }

  v32 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v23);
  objc_initWeak(&location, val);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __96__PXCMMMomentsInvitationsDataSourceManager__workerQueue_fetchRemainingAssetCollectionsInBatches__block_invoke;
  block[3] = &unk_1E51429B8;
  objc_copyWeak(&v41, &location);
  v38 = v26;
  v39 = v32;
  v40 = v24;
  v33 = v24;
  v34 = v32;
  v35 = v26;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v41);
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
  PXCMMMomentsInvitationsDataSourceState *v15;
  void *v16;
  PXCMMMomentsInvitationsDataSourceState *v17;
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
  PXCMMMomentsInvitationsDataSourceState *v36;
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
  -[PXCMMMomentsInvitationsDataSourceManager _state](self, "_state");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invitationsByAssetCollectionObjectID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __110__PXCMMMomentsInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke;
  v41[3] = &unk_1E51341C0;
  v14 = v13;
  v42 = v14;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v41);
  v15 = [PXCMMMomentsInvitationsDataSourceState alloc];
  objc_msgSend(v11, "assetCollections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXCMMMomentsInvitationsDataSourceState initWithAssetCollections:invitationsByAssetCollectionObjectID:](v15, "initWithAssetCollections:invitationsByAssetCollectionObjectID:", v16, v14);

  -[PXCMMMomentsInvitationsDataSourceManager set_state:](self, "set_state:", v17);
  if (self->_hasCreatedInitialDataSource)
  {
    v36 = v17;
    v37 = v11;
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMMomentsInvitationsDataSourceManager _createInvitationsDataSourceFromCurrentState](self, "_createInvitationsDataSourceFromCurrentState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMMomentsInvitationsDataSourceManager assetCollections](self, "assetCollections");
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
      objc_msgSend(v22, "assetCollections");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_state");
      v24 = v18;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "assetCollections");
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
    v43 = &unk_1E53EE5F8;
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
  self->_isLoading = 0;
  -[PXCMMMomentsInvitationsDataSourceManager startLoadingIfNeeded](self, "startLoadingIfNeeded");

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
  v16 = __Block_byref_object_copy__193611;
  v17 = __Block_byref_object_dispose__193612;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXCMMMomentsInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
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
  -[PXCMMMomentsInvitationsDataSourceManager _state](self, "_state");
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
    -[PXCMMMomentsInvitationsDataSourceManager set_state:](self, "set_state:", v10);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMMomentsInvitationsDataSourceManager _createInvitationsDataSourceFromCurrentState](self, "_createInvitationsDataSourceFromCurrentState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc((Class)off_1E50B4A18);
    v14 = objc_msgSend(v21, "identifier");
    v22 = v6;
    v15 = objc_msgSend(v13, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = &unk_1E53EE5F8;
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

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXCMMMomentsInvitationsDataSourceState)_state
{
  return self->__state;
}

- (void)set_state:(id)a3
{
  objc_storeStrong((id *)&self->__state, a3);
}

- (NSMutableOrderedSet)_remainingAssetCollectionObjectIDsToFetch
{
  return (NSMutableOrderedSet *)objc_getProperty(self, a2, 160, 1);
}

- (void)set_remainingAssetCollectionObjectIDsToFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__remainingAssetCollectionObjectIDsToFetch, 0);
  objc_storeStrong((id *)&self->__state, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
}

void __73__PXCMMMomentsInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
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

void __110__PXCMMMomentsInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __96__PXCMMMomentsInvitationsDataSourceManager__workerQueue_fetchRemainingAssetCollectionsInBatches__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_handleFinishedFetchingBatch:preparedChangeDetails:forFetchResult:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __64__PXCMMMomentsInvitationsDataSourceManager_startLoadingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingAssetCollectionsInBatches");

}

@end
