@implementation PXCMMMomentShareInvitationsDataSourceManager

- (PXCMMMomentShareInvitationsDataSourceManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 86, CFSTR("%s is not available as initializer"), "-[PXCMMMomentShareInvitationsDataSourceManager init]");

  abort();
}

- (PXCMMMomentShareInvitationsDataSourceManager)initWithPhotoLibrary:(id)a3 fetchLimit:(int64_t)a4
{
  id v8;
  PXCMMMomentShareInvitationsDataSourceManager *v9;
  PXCMMMomentShareInvitationsDataSourceManager *v10;
  void **p_photoLibrary;
  NSObject *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workerQueue;
  uint64_t v16;
  PXCMMMomentShareInvitationsDataSourceState *state;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSMutableOrderedSet *remainingMomentShareObjectIDsToFetch;
  void *v24;
  objc_super v25;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 90, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v25.receiver = self;
  v25.super_class = (Class)PXCMMMomentShareInvitationsDataSourceManager;
  v9 = -[PXSectionedDataSourceManager init](&v25, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_filter = 0;
    p_photoLibrary = (void **)&v9->_photoLibrary;
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v10->_fetchLimit = a4;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = dispatch_queue_create("com.apple.photos.PXCMMMomentShareInvitationsDataSourceManager", v13);
    workerQueue = v10->_workerQueue;
    v10->_workerQueue = (OS_dispatch_queue *)v14;

    _DataSourceState(*p_photoLibrary, v10->_filter, v10->_fetchLimit);
    v16 = objc_claimAutoreleasedReturnValue();
    state = v10->_state;
    v10->_state = (PXCMMMomentShareInvitationsDataSourceState *)v16;

    v18 = (void *)MEMORY[0x1E0C99E10];
    -[PXCMMMomentShareInvitationsDataSourceState momentShares](v10->_state, "momentShares");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchedObjectIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "orderedSetWithArray:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    remainingMomentShareObjectIDsToFetch = v10->_remainingMomentShareObjectIDsToFetch;
    v10->_remainingMomentShareObjectIDsToFetch = (NSMutableOrderedSet *)v21;

    objc_msgSend(*p_photoLibrary, "px_registerChangeObserver:", v10);
  }

  return v10;
}

- (id)mediaProvider
{
  return objc_alloc_init(PXCMMPreviewUIImageProvider);
}

- (void)setFilter:(int64_t)a3
{
  PXCMMMomentShareInvitationsDataSourceState *v4;
  PXCMMMomentShareInvitationsDataSourceState *state;
  PXCMMMomentShareInvitationsDataSource *v6;
  void *v7;
  void *v8;
  PXCMMMomentShareInvitationsDataSource *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (self->_filter != a3)
  {
    self->_filter = a3;
    _DataSourceState(self->_photoLibrary, a3, self->_fetchLimit);
    v4 = (PXCMMMomentShareInvitationsDataSourceState *)objc_claimAutoreleasedReturnValue();
    state = self->_state;
    self->_state = v4;

    v6 = -[PXCMMMomentShareInvitationsDataSource initWithState:]([PXCMMMomentShareInvitationsDataSource alloc], "initWithState:", self->_state);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99D20];
    v9 = v6;
    objc_msgSend(v7, "state");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "momentShares");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithArray:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)MEMORY[0x1E0C99D20];
    -[PXCMMMomentShareInvitationsDataSource state](v9, "state");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "momentShares");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchedObjects");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayWithArray:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(off_1E50B1608, "changeDetailsFromArray:toArray:changedObjects:objectComparator:", v25, v17, MEMORY[0x1E0C9AA60], &__block_literal_global_15438);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc((Class)off_1E50B4A18);
    v20 = objc_msgSend(v7, "identifier");
    v21 = -[PXCMMMomentShareInvitationsDataSource identifier](v9, "identifier");

    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = &unk_1E53EAFF8;
    v27[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v20, v21, v22, v23, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v9, v24);
  }
}

- (id)createInitialDataSource
{
  PXCMMMomentShareInvitationsDataSource *v3;
  void *v6;

  if (self->_hasCreatedInitialDataSource)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_hasCreatedInitialDataSource"));

  }
  v3 = -[PXCMMMomentShareInvitationsDataSource initWithState:]([PXCMMMomentShareInvitationsDataSource alloc], "initWithState:", self->_state);
  self->_hasCreatedInitialDataSource = 1;
  -[PXCMMMomentShareInvitationsDataSourceManager _startLoadingIfNeeded](self, "_startLoadingIfNeeded");
  return v3;
}

- (id)momentShares
{
  return -[PXCMMMomentShareInvitationsDataSourceState momentShares](self->_state, "momentShares");
}

- (void)_startLoadingIfNeeded
{
  void *v3;
  NSObject *workerQueue;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  if (!self->_isLoading)
  {
    if (self->_remainingMomentShareObjectIDsToFetch)
    {
      self->_isLoading = 1;
      -[PXCMMMomentShareInvitationsDataSourceManager momentShares](self, "momentShares");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      workerQueue = self->_workerQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69__PXCMMMomentShareInvitationsDataSourceManager__startLoadingIfNeeded__block_invoke;
      block[3] = &unk_1E5147280;
      objc_copyWeak(&v8, &location);
      v7 = v3;
      v5 = v3;
      dispatch_async(workerQueue, block);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares:(id)a3
{
  void *v4;
  double v5;
  double v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  PHPhotoLibrary *photoLibrary;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSMutableOrderedSet *remainingMomentShareObjectIDsToFetch;
  void *v23;
  NSMutableOrderedSet *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  PXCMMMomentShareInvitationsDataSourceManager *val;
  _QWORD block[4];
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id location;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v6 = v5;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  val = self;
  v7 = self->_remainingMomentShareObjectIDsToFetch;
  v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v11);
      v13 = objc_alloc(MEMORY[0x1E0CD1620]);
      v60 = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      photoLibrary = val->_photoLibrary;
      objc_msgSend(MEMORY[0x1E0CD1680], "fetchType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v13, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, photoLibrary, v16, 0, 0, 1);

      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXCMMMomentShareInvitation invitationWithMomentShare:](PXCMMMomentShareInvitation, "invitationWithMomentShare:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v12);
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      v21 = v20 - v6;

      if (v21 > 0.25 || v21 < 0.0)
        break;
      if (v9 == ++v11)
      {
        v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

  if (objc_msgSend(v4, "count"))
  {
    remainingMomentShareObjectIDsToFetch = val->_remainingMomentShareObjectIDsToFetch;
    objc_msgSend(v4, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableOrderedSet removeObjectsInArray:](remainingMomentShareObjectIDsToFetch, "removeObjectsInArray:", v23);

  }
  if (!-[NSMutableOrderedSet count](val->_remainingMomentShareObjectIDsToFetch, "count"))
  {
    v24 = val->_remainingMomentShareObjectIDsToFetch;
    val->_remainingMomentShareObjectIDsToFetch = 0;

  }
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "fetchedObjectIDs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v28 = v4;
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
  if (v29)
  {
    v30 = v29;
    v31 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v30; ++i)
      {
        if (*(_QWORD *)v52 != v31)
          objc_enumerationMutation(v28);
        v33 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
        v34 = objc_msgSend(v27, "indexOfObject:", v33);
        if (v34 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v25, "addIndex:", v34);
          objc_msgSend(v28, "objectForKeyedSubscript:", v33);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "momentShare");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v36);

        }
      }
      v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    }
    while (v30);
  }

  v37 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v25);
  objc_initWeak(&location, val);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __113__PXCMMMomentShareInvitationsDataSourceManager__workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares___block_invoke;
  block[3] = &unk_1E512BD68;
  objc_copyWeak(&v49, &location);
  v45 = v28;
  v46 = v37;
  v47 = v42;
  v48 = v26;
  v38 = v26;
  v39 = v42;
  v40 = v37;
  v41 = v28;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v49);
  objc_destroyWeak(&location);

}

- (void)_handleFinishedFetchingBatch:(id)a3 preparedChangeDetails:(id)a4 forFetchResult:(id)a5 changedObjects:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXCMMMomentShareInvitationsDataSourceState **p_state;
  PXCMMMomentShareInvitationsDataSourceState *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  PXCMMMomentShareInvitationsDataSourceState *v19;
  void *v20;
  PXCMMMomentShareInvitationsDataSourceState *v21;
  void *v22;
  PXCMMMomentShareInvitationsDataSource *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  PXCMMMomentShareInvitationsDataSourceState *v38;
  PXCMMMomentShareInvitationsDataSourceState *v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  void *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  p_state = &self->_state;
  v14 = self->_state;
  v15 = a3;
  -[PXCMMMomentShareInvitationsDataSourceState invitationsByMomentShareObjectID](v14, "invitationsByMomentShareObjectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "mutableCopy");

  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __129__PXCMMMomentShareInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult_changedObjects___block_invoke;
  v43[3] = &unk_1E51188F8;
  v18 = v17;
  v44 = v18;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v43);

  v19 = [PXCMMMomentShareInvitationsDataSourceState alloc];
  -[PXCMMMomentShareInvitationsDataSourceState momentShares](v14, "momentShares");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[PXCMMMomentShareInvitationsDataSourceState initWithMomentShares:invitationsByMomentShareObjectID:](v19, "initWithMomentShares:invitationsByMomentShareObjectID:", v20, v18);

  objc_storeStrong((id *)&self->_state, v21);
  if (self->_hasCreatedInitialDataSource)
  {
    v38 = v14;
    v39 = v21;
    v42 = v12;
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PXCMMMomentShareInvitationsDataSource initWithState:]([PXCMMMomentShareInvitationsDataSource alloc], "initWithState:", *p_state);
    -[PXCMMMomentShareInvitationsDataSourceState momentShares](*p_state, "momentShares");
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v40 = v11;
    v41 = v10;
    if (v24 == v11)
    {
      v31 = v10;
    }
    else
    {
      v25 = (void *)MEMORY[0x1E0CD1588];
      objc_msgSend(v22, "state");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "momentShares");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCMMMomentShareInvitationsDataSource state](v23, "state");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "momentShares");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "changeDetailsFromFetchResult:toFetchResult:changedObjects:", v27, v29, v42);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(off_1E50B1608, "changeDetailsFromFetchResultChangeDetails:", v30);
      v31 = (id)objc_claimAutoreleasedReturnValue();

    }
    v32 = objc_alloc((Class)off_1E50B4A18);
    v33 = objc_msgSend(v22, "identifier");
    v34 = -[PXCMMMomentShareInvitationsDataSource identifier](v23, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = &unk_1E53EAFF8;
    v46[0] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(v32, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v33, v34, v35, v36, 0);

    -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v23, v37);
    v11 = v40;
    v10 = v41;
    v12 = v42;
    v14 = v38;
    v21 = v39;
  }
  self->_isLoading = 0;
  -[PXCMMMomentShareInvitationsDataSourceManager _startLoadingIfNeeded](self, "_startLoadingIfNeeded");

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
  v16 = __Block_byref_object_copy__15410;
  v17 = __Block_byref_object_dispose__15411;
  v18 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PXCMMMomentShareInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
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
  PXCMMMomentShareInvitationsDataSourceState *v8;
  PXCMMMomentShareInvitationsDataSourceState *v9;
  PXCMMMomentShareInvitationsDataSourceState *v10;
  id v11;
  void *v12;
  PXCMMMomentShareInvitationsDataSource *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  PXCMMMomentShareInvitationsDataSourceManager *v18;
  void *v19;
  void *v20;
  PXCMMMomentShareInvitationsDataSourceManager *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = self->_state;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedForCurrentState"));
  v9 = (PXCMMMomentShareInvitationsDataSourceState *)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedState"));
    v10 = (PXCMMMomentShareInvitationsDataSourceState *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("preparedChangeDetails"));
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
    -[PXCMMMomentShareInvitationsDataSourceState stateUpdatedWithChange:changeDetails:](v8, "stateUpdatedWithChange:changeDetails:", v6, &v25);
    v10 = (PXCMMMomentShareInvitationsDataSourceState *)objc_claimAutoreleasedReturnValue();
    v11 = v25;
  }
  v12 = v11;
  if (v10 != v8)
  {
    objc_storeStrong((id *)&self->_state, v10);
    -[PXSectionedDataSourceManager dataSource](self, "dataSource");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXCMMMomentShareInvitationsDataSource initWithState:]([PXCMMMomentShareInvitationsDataSource alloc], "initWithState:", self->_state);
    v22 = objc_alloc((Class)off_1E50B4A18);
    v14 = objc_msgSend(v23, "identifier");
    v24 = v6;
    v15 = -[PXCMMMomentShareInvitationsDataSource identifier](v13, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = &unk_1E53EAFF8;
    v27[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v17 = v7;
    v18 = self;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v22, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v14, v15, v16, v19, 0);

    v21 = v18;
    v7 = v17;
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v21, "setDataSource:changeDetails:", v13, v20);

    v6 = v24;
  }

}

- (int64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingMomentShareObjectIDsToFetch, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_workerQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __77__PXCMMMomentShareInvitationsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 152));
}

void __129__PXCMMMomentShareInvitationsDataSourceManager__handleFinishedFetchingBatch_preparedChangeDetails_forFetchResult_changedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __113__PXCMMMomentShareInvitationsDataSourceManager__workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_handleFinishedFetchingBatch:preparedChangeDetails:forFetchResult:changedObjects:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __69__PXCMMMomentShareInvitationsDataSourceManager__startLoadingIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_workerQueue_fetchRemainingMomentSharesInBatchesWithMomentShares:", *(_QWORD *)(a1 + 32));

}

+ (id)mostRecentCreationDate
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "mostRecentCreationDateForPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mostRecentCreationDateForPhotoLibrary:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXCMMMomentShareInvitationsDataSourceManager.m"), 71, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v8);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(status != %d && publishState == %d)"), 0, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  objc_msgSend(v6, "setFetchLimit:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 7, 0x7FFFFFFFFFFFFFFFLL, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "creationDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
