@implementation PLSearchIndexingRebuildEngine

- (PLSearchIndexingRebuildEngine)initWithDelegate:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  PLSearchIndexingRebuildEngine *v8;
  PLSearchIndexingRebuildEngine *v9;
  objc_class *v10;
  void *v11;
  id v12;
  const char *v13;
  qos_class_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *queue;
  dispatch_group_t v18;
  OS_dispatch_group *lock_group;
  id v20;
  id v21;
  uint64_t v22;
  PLLazyObject *lazyCoreAnalyticsEventManager;
  uint64_t v24;
  PLFileBackedLogger *logger;
  NSMutableDictionary *v26;
  NSMutableDictionary *iteratorsBySearchEntity;
  uint64_t v29;
  uint64_t v30;
  id (*v31)(uint64_t);
  void *v32;
  id v33;
  id location;
  objc_super v35;

  v6 = a3;
  v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)PLSearchIndexingRebuildEngine;
  v8 = -[PLSearchIndexingRebuildEngine init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR(".searchIndexRebuildCompletion"));
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");
    v14 = qos_class_self();
    dispatch_queue_attr_make_with_qos_class(0, v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create(v13, v15);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    v9->_lock._os_unfair_lock_opaque = 0;
    v18 = dispatch_group_create();
    lock_group = v9->_lock_group;
    v9->_lock_group = (OS_dispatch_group *)v18;

    v20 = objc_initWeak(&location, v9);
    v21 = objc_alloc(MEMORY[0x1E0D73248]);
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __59__PLSearchIndexingRebuildEngine_initWithDelegate_provider___block_invoke;
    v32 = &unk_1E36759D8;
    objc_copyWeak(&v33, &location);
    v22 = objc_msgSend(v21, "initWithBlock:", &v29);
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
    lazyCoreAnalyticsEventManager = v9->_lazyCoreAnalyticsEventManager;
    v9->_lazyCoreAnalyticsEventManager = (PLLazyObject *)v22;

    v9->_coreAnalyticsRebuildToken = 0.0;
    objc_msgSend(v7, "createLogger", v29, v30, v31, v32);
    v24 = objc_claimAutoreleasedReturnValue();
    logger = v9->_logger;
    v9->_logger = (PLFileBackedLogger *)v24;

    v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    iteratorsBySearchEntity = v9->_iteratorsBySearchEntity;
    v9->_iteratorsBySearchEntity = v26;

  }
  return v9;
}

- (id)analyticsEventManager
{
  return (id)-[PLLazyObject objectValue](self->_lazyCoreAnalyticsEventManager, "objectValue");
}

- (void)resumeSearchIndexRebuildIfNeededForLibrary:(id)a3 calledBy:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24 = 0;
  v25 = 0;
  v23 = 0;
  v11 = -[PLSearchIndexingRebuildEngine _rebuildTypeForLibrary:entityInProgress:resumeObjectID:rebuildReasons:](self, "_rebuildTypeForLibrary:entityInProgress:resumeObjectID:rebuildReasons:", v8, &v25, &v23, &v24);
  v12 = v23;
  v13 = 0;
  if ((v24 & 8) != 0)
  {
    -[PLSearchIndexingRebuildEngine delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSpotlightReindexing spotlightReasonForReindexingAllItemsForLibraryIdentifier:](PLSpotlightReindexing, "spotlightReasonForReindexingAllItemsForLibraryIdentifier:", objc_msgSend(v14, "wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:", self));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v15 = v12;
  PLRunWithUnfairLock();
  if (v11)
  {
    v19 = v8;
    v20 = v9;
    v21 = v13;
    v22 = v10;
    PLSafeRunWithUnfairLock();

  }
  else
  {
    v16 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "successWithResult:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *, _QWORD))v10 + 2))(v10, v18, 0);
  }

}

- (void)pauseSearchIndexRebuildWithSourceName:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  PLSafeRunWithUnfairLock();

}

- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id *v9;
  unint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  id obj[8];
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v6 = a3;
  v7 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__10153;
  v21 = __Block_byref_object_dispose__10154;
  v22 = 0;
  v8 = MEMORY[0x1E0C809B0];
  obj[1] = (id)MEMORY[0x1E0C809B0];
  obj[2] = (id)3221225472;
  obj[3] = __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke;
  obj[4] = &unk_1E3662538;
  obj[5] = self;
  obj[6] = &v23;
  obj[7] = &v17;
  if ((PLBoolResultWithUnfairLock() & 1) != 0
    || (v9 = v18 + 5,
        obj[0] = v18[5],
        v10 = -[PLSearchIndexingRebuildEngine _rebuildTypeForLibrary:entityInProgress:resumeObjectID:rebuildReasons:](self, "_rebuildTypeForLibrary:entityInProgress:resumeObjectID:rebuildReasons:", v6, v24 + 3, obj, 0), objc_storeStrong(v9, obj[0]), v10))
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2;
    v11[3] = &unk_1E366F278;
    v14 = &v23;
    v15 = &v17;
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v12, "performBlock:", v11);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD, double))v7 + 2))(v7, 0, 0, 0.0);
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
}

- (unint64_t)_currentEntity
{
  void *v2;
  unint64_t v3;

  PLSafeResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)_resumeObjectID
{
  PLSafeResultWithUnfairLock();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_iteratorForSearchEntity:(unint64_t)a3 library:(id)a4 resumeObjectID:(id)a5
{
  id v7;
  NSMutableDictionary *iteratorsBySearchEntity;
  void *v9;
  PLManagedObjectPagingIterator *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __objc2_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  PLManagedObjectPagingIterator *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  iteratorsBySearchEntity = self->_iteratorsBySearchEntity;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](iteratorsBySearchEntity, "objectForKeyedSubscript:", v9);
  v10 = (PLManagedObjectPagingIterator *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[PLSearchIndexingRebuildEngine delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:", self);
    v28 = v7;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v10 = 0;
    switch(a3)
    {
      case 1uLL:
        +[PLManagedAsset entityName](PLManagedAsset, "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLManagedAsset, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLManagedAsset propertiesToFetch](PLManagedAsset, "propertiesToFetch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = PLManagedAsset;
        goto LABEL_7;
      case 2uLL:
      case 6uLL:
        break;
      case 3uLL:
        +[PLGenericAlbum entityName](PLGenericAlbum, "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLGenericAlbum, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", v12);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLGenericAlbum propertiesToFetch](PLGenericAlbum, "propertiesToFetch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = PLGenericAlbum;
        goto LABEL_7;
      case 4uLL:
        +[PLPhotosHighlight entityName](PLPhotosHighlight, "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLPhotosHighlight isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLPhotosHighlight, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", v12);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v19;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLPhotosHighlight propertiesToFetch](PLPhotosHighlight, "propertiesToFetch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = PLPhotosHighlight;
        goto LABEL_7;
      case 5uLL:
        +[PLMemory entityName](PLMemory, "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:](PLMemory, "isEligibleForSearchIndexingPredicateForLibraryIdentifier:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        +[PLMemory propertiesToFetch](PLMemory, "propertiesToFetch");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = PLMemory;
LABEL_7:
        -[__objc2_class relationshipKeyPathsToPrefetch](v18, "relationshipKeyPathsToPrefetch");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          goto LABEL_8;
        goto LABEL_12;
      case 7uLL:
        +[PLGraphNode entityName](PLGraphNode, "entityName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLSearchEntity predicateForSearchEntitySourceNodes](PLSearchEntity, "predicateForSearchEntitySourceNodes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v24;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = 0;
        v13 = 0;
        if (v16)
        {
LABEL_8:
          objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v15);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = [PLManagedObjectPagingIterator alloc];
          if (_PLRebuildPagingFetchLimit_onceToken != -1)
            dispatch_once(&_PLRebuildPagingFetchLimit_onceToken, &__block_literal_global_10206);
          v10 = -[PLManagedObjectPagingIterator initWithEntityName:resultType:resumeObjectID:additionalPredicate:batchSize:propertiesToFetch:relationshipKeyPathsToPrefetch:](v23, "initWithEntityName:resultType:resumeObjectID:additionalPredicate:batchSize:propertiesToFetch:relationshipKeyPathsToPrefetch:", v16, 0, v28, v22, _PLRebuildPagingFetchLimit__pagingFetchLimit, v14, v13);

        }
        else
        {
LABEL_12:
          v10 = 0;
        }
        break;
      default:
        v14 = 0;
        v15 = 0;
        v16 = 0;
        v10 = 0;
        break;
    }

    v25 = self->_iteratorsBySearchEntity;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v25, "setObject:forKeyedSubscript:", v10, v26);

  }
  return v10;
}

- (void)_prepareForRebuildForLibrary:(id)a3 type:(unint64_t)a4 sceneTaxonomyDigests:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  OS_dispatch_queue *queue;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  __int128 *v31;
  unint64_t v32;
  _QWORD v33[4];
  id v34;
  NSObject *v35;
  __int128 *p_buf;
  uint8_t v37[4];
  id v38;
  __int128 buf;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  PLSearchBackendIndexRebuildGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "libraryID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Preparing to rebuild search index for library: %@", (uint8_t *)&buf, 0xCu);

  }
  v15 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__10153;
  v42 = __Block_byref_object_dispose__10154;
  v16 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "successWithResult:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = v18;
  v19 = MEMORY[0x1E0C809B0];
  if (a4 == 2)
  {
    PLSearchBackendIndexRebuildGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v37 = 138412290;
      v38 = v10;
      _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Dropping search index for library %@", v37, 0xCu);
    }

    dispatch_group_enter(v15);
    -[PLSearchIndexingRebuildEngine delegate](self, "delegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v19;
    v33[1] = 3221225472;
    v33[2] = __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke;
    v33[3] = &unk_1E366AF38;
    v34 = v10;
    p_buf = &buf;
    v35 = v15;
    objc_msgSend(v21, "dropSearchIndexForSearchIndexingRebuildEngine:completion:", self, v33);

  }
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v27[0] = v19;
  v27[1] = 3221225472;
  v27[2] = __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_32;
  v27[3] = &unk_1E3672020;
  v31 = &buf;
  v24 = v10;
  v28 = v24;
  v32 = a4;
  v25 = v11;
  v29 = v25;
  v26 = v12;
  v30 = v26;
  objc_msgSend(v22, "groupNotify:queue:block:", v15, queue, v27);

  _Block_object_dispose(&buf, 8);
}

- (unint64_t)_rebuildTypeForLibrary:(id)a3 entityInProgress:(unint64_t *)a4 resumeObjectID:(id *)a5 rebuildReasons:(unint64_t *)a6
{
  id v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v26;
  void *v27;
  __CFString *v28;
  __CFString *v29;
  int v30;
  __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[PLSearchIndexingRebuildEngine delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[PLSpotlightReindexing shouldReindexAllItemsForLibraryIdentifier:](PLSpotlightReindexing, "shouldReindexAllItemsForLibraryIdentifier:", objc_msgSend(v11, "wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:", self));

  objc_msgSend(v10, "globalValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLSearchIndexingRebuildEngine delegate](self, "delegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sceneTaxonomyDigestsForSearchIndexingRebuildEngine:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v13, "searchIndexRebuildReasonsWithSceneTaxonomyDigests:spotlightRequestedRebuild:pathManager:", v15, v12, v16);

  if ((v17 & 0x62) != 0)
  {
    v18 = 2;
LABEL_5:
    PLSearchBackendIndexRebuildGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = CFSTR("drop");
      if ((v17 & 0x62) == 0)
        v20 = CFSTR("overwrite");
      v21 = v20;
      PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v17, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 138543618;
      v31 = v21;
      v32 = 2114;
      v33 = v22;
      _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Detected search index rebuild required, type: %{public}@, reason: %{public}@", (uint8_t *)&v30, 0x16u);

    }
    v23 = 0;
    v24 = 1;
    goto LABEL_10;
  }
  if ((v17 & 0x38D) != 0)
  {
    v18 = 1;
    goto LABEL_5;
  }
  if ((v17 & 0x10) != 0)
  {
    objc_msgSend(v10, "globalValues");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v26, "searchIndexingEntityToRebuild");

    if (v24)
    {
      objc_msgSend(v10, "globalValues");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "searchIndexRebuildResumeObjectID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      PLSearchBackendIndexRebuildGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        if (v24 > 8)
          v28 = CFSTR("invalid");
        else
          v28 = off_1E366EDE0[v24];
        v29 = v28;
        v30 = 138543618;
        v31 = v29;
        v32 = 2114;
        v33 = v23;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "Detected search index rebuild in progress, entity: %{public}@, resume objectID: %{public}@", (uint8_t *)&v30, 0x16u);

      }
      v18 = 3;
    }
    else
    {
      PLSearchBackendIndexRebuildGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "Detected rebuild in progress but no entity to rebuild, will not resume rebuild", (uint8_t *)&v30, 2u);
      }
      v23 = 0;
      v24 = 0;
      v18 = 0;
    }
LABEL_10:

    if (!a4)
      goto LABEL_12;
    goto LABEL_11;
  }
  v23 = 0;
  v24 = 0;
  v18 = 0;
  if (a4)
LABEL_11:
    *a4 = v24;
LABEL_12:
  if (a5)
    *a5 = objc_retainAutorelease(v23);
  if (a6)
    *a6 = v17;

  return v18;
}

- (void)_handleDonationFailureForRebuildWithManagedObjects:(id)a3 entity:(unint64_t)a4 library:(id)a5
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v21 = a5;
  v8 = a4 - 1;
  if (a4 - 1 > 6)
    v9 = 2;
  else
    v9 = qword_199B9FD00[v8];
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        switch(v8)
        {
          case 0uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v14), "uuid");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
              goto LABEL_11;
            break;
          case 6uLL:
            v19 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14));
            objc_msgSend(v19, "encodedIdentifierString");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
LABEL_11:
              objc_msgSend(v21, "managedObjectContext");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:](PLBackgroundJobWorkItem, "insertBackgroundJobWorkItemWithIdentifier:jobType:jobFlags:inManagedObjectContext:", v15, 3, v9, v16);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 300.0);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setDelayUntilDate:", v18);

            }
            break;
          default:
            break;
        }
        ++v14;
      }
      while (v12 != v14);
      v20 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v12 = v20;
    }
    while (v20);
  }

}

- (void)_rebuildManagedObjectsFromIterator:(id)a3 ofEntity:(unint64_t)a4 queue:(id)a5 library:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  void (**v13)(id, void *);
  PLTimedDispatchGroup *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  unint64_t v37;
  unint64_t v38;
  NSObject *v39;
  const __CFString *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  PLTimedDispatchGroup *v49;
  void *v50;
  id v51;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  PLSearchIndexingRebuildEngine *v60;
  id v61;
  void (**v62)(id, void *);
  unint64_t v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  PLSearchIndexingRebuildEngine *v69;
  id v70;
  id v71;
  id v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (*v76)(uint64_t);
  void *v77;
  PLSearchIndexingRebuildEngine *v78;
  id v79;
  id v80;
  uint8_t buf[4];
  const __CFString *v82;
  __int16 v83;
  void *v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void (**)(id, void *))a7;
  v14 = -[PLTimedDispatchGroup initWithQueue:name:]([PLTimedDispatchGroup alloc], "initWithQueue:name:", v11, CFSTR("Rebuild donation"));
  -[PLTimedDispatchGroup enterWithName:](v14, "enterWithName:", CFSTR("Rebuild donation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = MEMORY[0x1E0C809B0];
  v75 = 3221225472;
  v76 = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke;
  v77 = &unk_1E3662560;
  v78 = self;
  v17 = v15;
  v79 = v17;
  v18 = v16;
  v80 = v18;
  if (PLBoolResultWithUnfairLock())
  {
    objc_msgSend(v17, "leave");
    v19 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "failureWithError:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v21);

    v22 = v12;
  }
  else
  {
    v51 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedObjectContext");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "nextBatchWithManagedObjectContext:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v12;
    v25 = v24;
    if (v24)
    {
      if (objc_msgSend(v24, "isFailure"))
      {
        objc_msgSend(v17, "leave");
        PLSearchBackendIndexRebuildGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v53, "entityName");
          v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "error");
          v28 = v22;
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v82 = v27;
          v83 = 2112;
          v84 = v29;
          _os_log_impl(&dword_199541000, v26, OS_LOG_TYPE_ERROR, "Rebuild failed to enumerate objects of entity: %{public}@, error: %@", buf, 0x16u);

          v22 = v28;
        }

        v30 = (void *)MEMORY[0x1E0D732B8];
        objc_msgSend(v25, "error");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "failureWithError:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v13[2](v13, v32);

      }
      else
      {
        v49 = v14;
        v37 = -[PLSearchIndexingRebuildEngine _rebuildTypeForLibrary:entityInProgress:resumeObjectID:rebuildReasons:](self, "_rebuildTypeForLibrary:entityInProgress:resumeObjectID:rebuildReasons:", v22, 0, 0, 0);
        if (v37 != 3)
        {
          v38 = v37;
          PLSearchBackendIndexRebuildGetLog();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            if (v38 > 2)
              v40 = CFSTR("invalid");
            else
              v40 = off_1E3662618[v38];
            *(_DWORD *)buf = 138543362;
            v82 = v40;
            _os_log_impl(&dword_199541000, v39, OS_LOG_TYPE_DEFAULT, "Rebuild in progress, but required rebuild type is %{public}@", buf, 0xCu);
          }

        }
        v64[0] = MEMORY[0x1E0C809B0];
        v64[1] = 3221225472;
        v64[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_43;
        v64[3] = &unk_1E3662588;
        v48 = v25;
        v47 = v25;
        v65 = v47;
        v66 = v18;
        v41 = v53;
        v67 = v41;
        v42 = v50;
        v68 = v42;
        v69 = self;
        v73 = a4;
        v43 = v22;
        v70 = v43;
        v44 = v11;
        v71 = v44;
        v45 = v17;
        v72 = v45;
        objc_msgSend(v43, "performBlock:", v64);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_2;
        v54[3] = &unk_1E36625B0;
        v55 = v45;
        v62 = v13;
        v56 = v47;
        v57 = v41;
        v58 = v42;
        v59 = v43;
        v60 = self;
        v63 = a4;
        v46 = v44;
        v25 = v48;
        v14 = v49;
        v61 = v46;
        -[PLTimedDispatchGroup notify:](v49, "notify:", v54);

        v31 = v65;
      }
    }
    else
    {
      objc_msgSend(v17, "leave");
      PLSearchBackendIndexRebuildGetLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v53, "entityName");
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v82 = v34;
        v83 = 2112;
        v84 = v22;
        _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_INFO, "Search rebuild complete for entity: %{public}@ in library: %@", buf, 0x16u);

      }
      v35 = (void *)MEMORY[0x1E0D732B8];
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "successWithResult:", v36);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v13[2](v13, v31);
    }

    v11 = v51;
  }

}

- (void)_rebuildAllRemainingEntitiesForLibrary:(id)a3 queue:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  PLSearchIndexingRebuildEngine *v27;
  id v28;
  id v29;
  unint64_t v30;
  uint8_t buf[4];
  __CFString *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[PLSearchIndexingRebuildEngine _currentEntity](self, "_currentEntity");
  if (v11 < 9)
  {
    v17 = v11;
    if (((0xBAu >> v11) & 1) != 0)
    {
      -[PLSearchIndexingRebuildEngine _resumeObjectID](self, "_resumeObjectID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLSearchIndexingRebuildEngine _iteratorForSearchEntity:library:resumeObjectID:](self, "_iteratorForSearchEntity:library:resumeObjectID:", v17, v8, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      PLSearchBackendIndexRebuildGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = off_1E366EDE0[v17];
        objc_msgSend(v19, "resumeObjectID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "libraryID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v21;
        v33 = 2114;
        v34 = v22;
        v35 = 2112;
        v36 = v23;
        _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "Resuming search index rebuild from entity: %{public}@ token: %{public}@ for library %@", buf, 0x20u);

      }
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke;
      v25[3] = &unk_1E36625D8;
      v30 = v17;
      v26 = v8;
      v27 = self;
      v28 = v9;
      v29 = v10;
      -[PLSearchIndexingRebuildEngine _rebuildManagedObjectsFromIterator:ofEntity:queue:library:completion:](self, "_rebuildManagedObjectsFromIterator:ofEntity:queue:library:completion:", v19, v17, v28, v26, v25);

    }
    else
    {
      v24 = MEMORY[0x1E0C809B0];
      PLRunWithUnfairLock();
      -[PLSearchIndexingRebuildEngine _rebuildAllRemainingEntitiesForLibrary:queue:completion:](self, "_rebuildAllRemainingEntitiesForLibrary:queue:completion:", v8, v9, v10, v24, 3221225472, __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_49, &unk_1E3677AA0, self);
    }
  }
  else
  {
    PLSearchBackendIndexRebuildGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "libraryID");
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v32 = v13;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "Search index rebuild completed for library %@", buf, 0xCu);

    }
    v14 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "successWithResult:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(id, void *))v10 + 2))(v10, v16);
  }

}

- (void)_startRebuildForLibrary:(id)a3
{
  id v4;
  OS_dispatch_queue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PLSearchIndexingRebuildEngine _inq_rebuildAnalyticsStartTimer](self, "_inq_rebuildAnalyticsStartTimer");
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke;
  v7[3] = &unk_1E366B0F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[PLSearchIndexingRebuildEngine _rebuildAllRemainingEntitiesForLibrary:queue:completion:](self, "_rebuildAllRemainingEntitiesForLibrary:queue:completion:", v6, queue, v7);

}

- (void)_lock_startPrepareAndRebuildForLibrary:(id)a3 type:(unint64_t)a4 calledBy:(id)a5 rebuildReasons:(unint64_t)a6 spotlightReasonForReindexingAllItems:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  OS_dispatch_queue *queue;
  id v26;
  id v27;
  id v28;
  void *v29;
  _QWORD v31[4];
  id v32;
  id v33;
  PLSearchIndexingRebuildEngine *v34;
  id v35;
  __int128 *v36;
  unint64_t v37;
  _QWORD v38[4];
  NSObject *v39;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (!a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLSearchIndexingRebuildEngine.m"), 719, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rebuildType != PLSearchIndexRebuildTypeNone"));

  }
  PLSearchBackendIndexRebuildGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v13;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Resuming search index rebuild, called by: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v16 = dispatch_group_create();
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__10153;
  v44 = __Block_byref_object_dispose__10154;
  v17 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "successWithResult:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v19;
  v20 = self->_lock_currentEntity == 1 && self->_lock_resumeObjectID == 0;
  v21 = MEMORY[0x1E0C809B0];
  if (a4 - 1 < 2 || v20)
  {
    dispatch_group_enter(v16);
    -[PLSearchIndexingRebuildEngine delegate](self, "delegate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sceneTaxonomyDigestsForSearchIndexingRebuildEngine:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v21;
    v38[1] = 3221225472;
    v38[2] = __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke;
    v38[3] = &unk_1E3667FC0;
    p_buf = &buf;
    v39 = v16;
    -[PLSearchIndexingRebuildEngine _prepareForRebuildForLibrary:type:sceneTaxonomyDigests:completion:](self, "_prepareForRebuildForLibrary:type:sceneTaxonomyDigests:completion:", v12, a4, v23, v38);

  }
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v31[0] = v21;
  v31[1] = 3221225472;
  v31[2] = __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_2;
  v31[3] = &unk_1E36741F8;
  v36 = &buf;
  v26 = v12;
  v32 = v26;
  v37 = a6;
  v27 = v13;
  v33 = v27;
  v34 = self;
  v28 = v14;
  v35 = v28;
  objc_msgSend(v24, "groupNotify:queue:block:", v16, queue, v31);

  _Block_object_dispose(&buf, 8);
}

- (void)_inq_rebuildAnalyticsSetupAndPublishWithLibrary:(id)a3 rebuildType:(unint64_t)a4 rebuildInitiatedBy:(id)a5 rebuildReasons:(unint64_t)a6 spotlightReasonForReindexingAllItems:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  void *v19;
  _OWORD *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  void *v42;
  _OWORD v43[32];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  if (a4 - 1 <= 1
    && -[PLSearchIndexingRebuildEngine _inq_isValidForCoreAnalyticsCaptureWithRebuildReason:](self, "_inq_isValidForCoreAnalyticsCaptureWithRebuildReason:", a6))
  {
    -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0D73C40];
    objc_msgSend(v15, "removeEventWithName:", *MEMORY[0x1E0D73C40]);
    self->_coreAnalyticsRebuildToken = 0.0;
    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v36 = 0;
    v29 = 0;
    v30 = (double *)&v29;
    v31 = 0x2020000000;
    v32 = 0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __164__PLSearchIndexingRebuildEngine__inq_rebuildAnalyticsSetupAndPublishWithLibrary_rebuildType_rebuildInitiatedBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke;
    v24[3] = &unk_1E3673340;
    v25 = v12;
    v26 = &v37;
    v27 = &v33;
    v28 = &v29;
    objc_msgSend(v25, "performBlockAndWait:", v24);
    -[PLSearchIndexingRebuildEngine _inq_rebuildAnalyticsSetupDataWithRebuildType:rebuildInitiatedBy:rebuildReasons:mediaCount:uptimeSinceLastRebuild:spotlightReasonForReindexingAllItems:](self, "_inq_rebuildAnalyticsSetupDataWithRebuildType:rebuildInitiatedBy:rebuildReasons:mediaCount:uptimeSinceLastRebuild:spotlightReasonForReindexingAllItems:", a4, v13, a6, v34[3] + v38[3], v14, v30[3]);
    v23 = *MEMORY[0x1E0D73C48];
    objc_msgSend(v15, "setPayloadValue:forKey:onEventWithName:", &unk_1E375D890);
    if (self->_logger)
    {
      PLSearchBackendIndexRebuildGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

      if (v18)
      {
        memset(v43, 0, sizeof(v43));
        PLSearchBackendIndexRebuildGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
        objc_msgSend(v15, "descriptionForEventName:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = 138543362;
        v42 = v19;
        LODWORD(v21) = 12;
        v20 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v20, "PLSearchIndexingRebuildEngine.m", 784, 0, &v41, v21);
        if (v20 != v43)
          free(v20);
      }
    }
    objc_msgSend(v15, "publishEventWithName:", v16);
    -[PLSearchIndexingRebuildEngine _inq_rebuildAnalyticsSetupDataWithRebuildType:rebuildInitiatedBy:rebuildReasons:mediaCount:uptimeSinceLastRebuild:spotlightReasonForReindexingAllItems:](self, "_inq_rebuildAnalyticsSetupDataWithRebuildType:rebuildInitiatedBy:rebuildReasons:mediaCount:uptimeSinceLastRebuild:spotlightReasonForReindexingAllItems:", a4, v13, a6, v34[3] + v38[3], v14, v30[3]);
    objc_msgSend(v15, "setPayloadValue:forKey:onEventWithName:", &unk_1E375D8A8, v23, v16);
    -[PLFileBackedLogger flush](self->_logger, "flush");

    _Block_object_dispose(&v29, 8);
    _Block_object_dispose(&v33, 8);
    _Block_object_dispose(&v37, 8);

  }
}

- (BOOL)_inq_isValidForCoreAnalyticsCaptureWithRebuildReason:(unint64_t)a3
{
  if ((a3 & 0x109) == 1)
    return 0;
  else
    return MEMORY[0x19AEC0720](self, a2) ^ 1;
}

- (void)_inq_rebuildAnalyticsSetupDataWithRebuildType:(unint64_t)a3 rebuildInitiatedBy:(id)a4 rebuildReasons:(unint64_t)a5 mediaCount:(unint64_t)a6 uptimeSinceLastRebuild:(double)a7 spotlightReasonForReindexingAllItems:(id)a8
{
  id v14;
  id v15;
  void *v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  void *v26;
  id v27;

  v14 = a8;
  v15 = a4;
  -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 > 3)
    v17 = CFSTR("invalid");
  else
    v17 = off_1E3662630[a3];
  v18 = *MEMORY[0x1E0D73C40];
  v27 = v16;
  objc_msgSend(v16, "setPayloadValue:forKey:onEventWithName:", v17, *MEMORY[0x1E0D73C88], *MEMORY[0x1E0D73C40]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v19, *MEMORY[0x1E0D73C80], v18);

  objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v15, *MEMORY[0x1E0D73C58], v18);
  PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(a5, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v20, *MEMORY[0x1E0D73C70], v18);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v21, *MEMORY[0x1E0D73C68], v18);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v22, *MEMORY[0x1E0D73C90], v18);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  v24 = _os_feature_enabled_impl();
  if (_os_feature_enabled_impl())
    v25 = v24 | 2;
  else
    v25 = v24;
  objc_msgSend(v23, "numberWithUnsignedChar:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setPayloadValue:forKey:onEventWithName:", v26, *MEMORY[0x1E0D73C50], v18);

}

- (void)_inq_rebuildAnalyticsStartTimer
{
  void *v3;
  int v4;
  double v5;
  id v6;

  -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEventWithName:", *MEMORY[0x1E0D73C40]);

  if (v4)
  {
    if (self->_coreAnalyticsRebuildToken == 0.0)
    {
      -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startRecordingTimedEventToken");
      self->_coreAnalyticsRebuildToken = v5;

    }
  }
}

- (void)_inq_rebuildAnalyticsPauseTimer
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (-[PLSearchIndexingRebuildEngine _inq_rebuildAnalyticsEventIsValid](self, "_inq_rebuildAnalyticsEventIsValid"))
  {
    -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *MEMORY[0x1E0D73C60];
    v4 = *MEMORY[0x1E0D73C40];
    objc_msgSend(v8, "valueForKey:onEventWithName:", *MEMORY[0x1E0D73C60], *MEMORY[0x1E0D73C40]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 + 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPayloadValue:forKey:onEventWithName:", v7, v3, v4);

  }
}

- (void)_inq_rebuildAnalyticsCompletedWithResult:(id)a3
{
  id v4;
  void *v5;
  int HasDomainAndCode;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  _OWORD *v16;
  uint64_t v17;
  int v18;
  void *v19;
  _OWORD v20[32];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLSearchIndexingRebuildEngine _inq_rebuildAnalyticsEventIsValid](self, "_inq_rebuildAnalyticsEventIsValid"))
  {
    if (objc_msgSend(v4, "isFailure")
      && (objc_msgSend(v4, "error"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode(),
          v5,
          HasDomainAndCode))
    {
      -[PLSearchIndexingRebuildEngine _inq_rebuildAnalyticsPauseTimer](self, "_inq_rebuildAnalyticsPauseTimer");
    }
    else
    {
      -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *MEMORY[0x1E0D73C40];
      objc_msgSend(v7, "addRecordingTimedEventSnippetWithToken:forKey:onEventWithName:", *MEMORY[0x1E0D73C30], *MEMORY[0x1E0D73C40], self->_coreAnalyticsRebuildToken);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "isSuccess"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setPayloadValue:forKey:onEventWithName:", v9, *MEMORY[0x1E0D73C78], v8);

      if (objc_msgSend(v4, "isFailure"))
      {
        objc_msgSend(v4, "error");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        PLErrorCodeStringOfTopLevelErrorAndAllUnderlyingErrors();
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "setPayloadValue:forKey:onEventWithName:", v11, *MEMORY[0x1E0D73C38], v8);
      }
      if (self->_logger)
      {
        PLSearchBackendIndexRebuildGetLog();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

        if (v13)
        {
          memset(v20, 0, sizeof(v20));
          PLSearchBackendIndexRebuildGetLog();
          v14 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
          objc_msgSend(v7, "descriptionForEventName:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v15;
          LODWORD(v17) = 12;
          v16 = (_OWORD *)_os_log_send_and_compose_impl();

          -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v16, "PLSearchIndexingRebuildEngine.m", 873, 0, &v18, v17);
          if (v16 != v20)
            free(v16);
        }
      }
      objc_msgSend(v7, "publishEventWithName:", v8);

    }
  }

}

- (BOOL)_inq_rebuildAnalyticsEventIsValid
{
  void *v3;
  char v4;

  if (self->_coreAnalyticsRebuildToken == 0.0)
    return 0;
  -[PLSearchIndexingRebuildEngine analyticsEventManager](self, "analyticsEventManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasEventWithName:", *MEMORY[0x1E0D73C40]);

  return v4;
}

- (PLSearchIndexingRebuildEngineDelegate)delegate
{
  return (PLSearchIndexingRebuildEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_lazyCoreAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_lock_donationProgress, 0);
  objc_storeStrong((id *)&self->_lock_donationInFlightDispatchGroupSession, 0);
  objc_storeStrong((id *)&self->_lock_result, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_lock_resumeObjectID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_iteratorsBySearchEntity, 0);
}

void __164__PLSearchIndexingRebuildEngine__inq_rebuildAnalyticsSetupAndPublishWithLibrary_rebuildType_rebuildInitiatedBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "getPhotoCount:videoCount:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchIndexUptimeIsRebuildInProgress:", 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v2;

}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  __CFString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "isSuccess"))
  {
    objc_msgSend(*(id *)(a1 + 32), "globalValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(a1 + 72) | objc_msgSend(v2, "unpackedSearchIndexRebuildCoalescedReasons");

    v4 = (v3 << 59 >> 63) & 3;
    if ((v3 & 0x38D) != 0)
      v4 = 1;
    if ((v3 & 0x62) != 0)
      v5 = 2;
    else
      v5 = v4;
    PLSearchBackendIndexRebuildGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = off_1E3662630[v5];
      PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v18 = v7;
      v19 = 2114;
      v20 = v8;
      v21 = 2114;
      v22 = v9;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Rebuild preparation complete, starting reindexing, rebuild type: %{public}@, reasons: %{public}@, called by: %{public}@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 48), "_inq_rebuildAnalyticsSetupAndPublishWithLibrary:rebuildType:rebuildInitiatedBy:rebuildReasons:spotlightReasonForReindexingAllItems:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 40), v3, *(_QWORD *)(a1 + 56));
    v10 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_60;
    v15[3] = &unk_1E3677AA0;
    v16 = v10;
    objc_msgSend(v16, "performTransactionAndWait:", v15);
    objc_msgSend(*(id *)(a1 + 48), "_startRebuildForLibrary:", *(_QWORD *)(a1 + 32));
    v11 = v16;
  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("Unable to prepare for search index rebuild, search will be in an inconsistent state"), *MEMORY[0x1E0CB2938]);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CB3388]);

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 46502, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    PLSafeRunWithUnfairLock();

  }
}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_60(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setSearchIndexRebuildCoalescedReasons:", 0);

}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_2_63(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 48) = 0;
  objc_msgSend(MEMORY[0x1E0D732B8], "failureWithError:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
}

void __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char HasDomainAndCode;
  uint64_t v6;
  void *v7;
  uint64_t *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v3 = a2;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__10153;
  v26 = __Block_byref_object_dispose__10154;
  v27 = 0;
  if (objc_msgSend(v3, "isFailure"))
  {
    objc_msgSend(v3, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();

    if ((HasDomainAndCode & 1) != 0)
      goto LABEL_6;
    objc_msgSend(v3, "resultByWrappingUnderlyingErrorWithDomain:code:debugDescription:", *MEMORY[0x1E0D74498], 46511, CFSTR("Search index rebuild failed"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v23[5];
    v23[5] = v6;
  }
  else
  {
    v8 = v23;
    v9 = v3;
    v7 = (void *)v8[5];
    v8[5] = (uint64_t)v9;
  }

LABEL_6:
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v10 = *(void **)(a1 + 32);
  v11 = MEMORY[0x1E0C809B0];
  location[1] = (id)MEMORY[0x1E0C809B0];
  location[2] = (id)3221225472;
  location[3] = __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_2;
  location[4] = &unk_1E3677830;
  location[5] = v10;
  location[6] = &v22;
  location[7] = &v18;
  PLSafeRunWithUnfairLock();
  if (*((_BYTE *)v19 + 24))
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v14[0] = v11;
    v14[1] = 3221225472;
    v14[2] = __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_52;
    v14[3] = &unk_1E3677B80;
    objc_copyWeak(&v16, location);
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v12, "dispatchAsync:block:", v13, v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(location);
  }
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);

}

void __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint8_t v8[16];

  if (*(_BYTE *)(a1[4] + 49) && !*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    PLSearchBackendIndexRebuildGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Paused search index rebuild", v8, 2u);
    }

    v3 = (void *)MEMORY[0x1E0D732B8];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "failureWithError:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    *(_BYTE *)(a1[4] + 48) = 0;
    objc_storeStrong((id *)(a1[4] + 64), *(id *)(*(_QWORD *)(a1[5] + 8) + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 56));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
}

void __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_52(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_startRebuildForLibrary:", *(_QWORD *)(a1 + 32));

}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isSuccess"))
  {
    v4 = *(_QWORD *)(a1 + 64);
    if (v4 > 8)
      v5 = 0;
    else
      v5 = qword_199B9F630[v4];
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_2;
    v9[3] = &unk_1E3674C18;
    v10 = v8;
    v11 = v5;
    objc_msgSend(v10, "performTransactionAndWait:", v9);
    PLRunWithUnfairLock();
    objc_msgSend(*(id *)(a1 + 40), "_rebuildAllRemainingEntitiesForLibrary:queue:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
  else
  {
    PLSearchBackendIndexRebuildGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to rebuild search index with error: %@", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_49(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "markRebuildPhaseCompleted:", *(_QWORD *)(a1 + 40));

  if ((v3 & 1) == 0)
  {
    PLSearchBackendIndexRebuildGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      PLSearchIndexingStatusDescription(*(_QWORD *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Marking rebuild phase (%{public}@) complete failed unexpectedly, status already shows rebuild phase completed", (uint8_t *)&v6, 0xCu);

    }
  }
}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_48(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

uint64_t __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 48));
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 49);
}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_43(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:", objc_msgSend(v2, "count"));
  PLSearchBackendIndexRebuildGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = objc_msgSend(v2, "count");
    objc_msgSend(*(id *)(a1 + 48), "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
    *(_DWORD *)buf = 134218498;
    v18 = v4;
    v19 = 2114;
    v20 = v5;
    v21 = 2048;
    v22 = v7;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_INFO, "Search rebuild donating batch of %tu managed objects (%{public}@), elapsed: %f sec", buf, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 64), "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 48), "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 80);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_44;
  v15[3] = &unk_1E366B0A0;
  v16 = *(id *)(a1 + 88);
  objc_msgSend(v8, "inLibraryPerform_donateForSearchIndexingRebuildEngine:managedObjects:entity:entityName:library:progress:queue:completion:", v9, v2, v10, v11, v13, v12, v14, v15);

}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t (*__ptr32 *v10)();
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint64_t v35;
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "wasCancelled"))
  {
    v2 = *(_QWORD *)(a1 + 88);
    objc_msgSend(*(id *)(a1 + 32), "result");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "result");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "resumeObjectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isFailure");
    PLSearchBackendIndexRebuildGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = MEMORY[0x1E0C809B0];
    v10 = &off_199B99000;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v11 = objc_msgSend(v3, "count");
        objc_msgSend(*(id *)(a1 + 48), "entityName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        v15 = v14;
        objc_msgSend(v4, "error");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134219010;
        v37 = v11;
        v10 = &off_199B99000;
        v38 = 2114;
        v39 = v12;
        v40 = 2114;
        v41 = v5;
        v42 = 2048;
        v43 = v15;
        v44 = 2112;
        v45 = v16;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "Search rebuild donation failure, %tu objects (%{public}@), current resume token: %{public}@ elapsed: %f sec, error: %@", buf, 0x34u);

        v9 = MEMORY[0x1E0C809B0];
      }

      v32[0] = v9;
      v32[1] = *((_QWORD *)v10 + 184);
      v32[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_45;
      v32[3] = &unk_1E3674F30;
      v17 = *(void **)(a1 + 64);
      v32[4] = *(_QWORD *)(a1 + 72);
      v18 = v3;
      v19 = *(_QWORD *)(a1 + 96);
      v33 = v18;
      v35 = v19;
      v34 = *(id *)(a1 + 64);
      objc_msgSend(v17, "performTransactionAndWait:", v32);

    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v20 = objc_msgSend(v3, "count");
        objc_msgSend(*(id *)(a1 + 48), "entityName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 56));
        *(_DWORD *)buf = 134218754;
        v37 = v20;
        v38 = 2114;
        v39 = v21;
        v40 = 2114;
        v41 = v5;
        v42 = 2048;
        v43 = v23;
        _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "Search rebuild donation complete, %tu objects (%{public}@), current resume token: %{public}@ elapsed: %f sec", buf, 0x2Au);

        v10 = &off_199B99000;
      }

    }
    v24 = *(void **)(a1 + 64);
    v29[0] = v9;
    v29[1] = *((_QWORD *)v10 + 184);
    v29[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_46;
    v29[3] = &unk_1E3677C18;
    v30 = v24;
    v25 = v5;
    v31 = v25;
    objc_msgSend(v30, "performTransactionAndWait:", v29);
    v28 = v25;
    v26 = v25;
    PLRunWithUnfairLock();
    objc_msgSend(*(id *)(a1 + 72), "_rebuildManagedObjectsFromIterator:ofEntity:queue:library:completion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 88));

  }
}

uint64_t __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleDonationFailureForRebuildWithManagedObjects:entity:library:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_46(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSearchIndexRebuildResumeObjectID:", v1);

}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_2_47(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

uint64_t __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_44(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "leaveWithResult:", a2);
}

void __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFailure"))
  {
    PLSearchBackendIndexRebuildGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "error");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_199541000, v4, OS_LOG_TYPE_ERROR, "Aborting attempt to begin search index rebuild for library: %@ due to failure to drop search index, error: %@", (uint8_t *)&v10, 0x16u);

    }
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v3;
  v9 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_32(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isSuccess"))
  {
    v2 = *(void **)(a1 + 32);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_2;
    v11[3] = &unk_1E3677C40;
    v14 = *(_QWORD *)(a1 + 64);
    v12 = v2;
    v13 = *(id *)(a1 + 40);
    objc_msgSend(v12, "performTransactionAndWait:", v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "libraryServicesManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wellKnownPhotoLibraryIdentifier");

  if (v4 == 3
    || +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:](PLSpotlightDonationUtilities, "shouldUseSpotlightPrivateIndexForLibraryIdentifier:", v4))
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  }
  else
  {
    +[PLSpotlightReindexing deleteFile](PLSpotlightReindexing, "deleteFile");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isFailure"))
    {
      PLSearchBackendIndexRebuildGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "error");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v16 = v7;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Failed to remove spotlight reindexing file with error: %@", buf, 0xCu);

      }
    }
    v8 = *(_QWORD *)(a1 + 48);
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isFailure");
    v10 = v5;
    if (v9)
      v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v10);

  }
}

void __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  if ((unint64_t)(*(_QWORD *)(a1 + 48) - 1) <= 1)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "globalValues");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setSearchIndexRebuildStartDate:", v2);

  }
  objc_msgSend(*(id *)(a1 + 32), "globalValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[PLBackgroundJobWorkItem deleteAllSearchIndexJobsInManagedObjectContext:](PLBackgroundJobWorkItem, "deleteAllSearchIndexJobsInManagedObjectContext:", v6);

}

id __48__PLSearchIndexingRebuildEngine__resumeObjectID__block_invoke(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 40);
}

uint64_t __47__PLSearchIndexingRebuildEngine__currentEntity__block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(_QWORD *)(a1[4] + 32);
  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), *(id *)(a1[4] + 40));
  return *(unsigned __int8 *)(a1[4] + 48);
}

void __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2(uint64_t a1, __n128 a2)
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v3 > 8)
  {
    v4 = 0;
  }
  else
  {
    v4 = 0;
    a2.n128_u64[0] = 138543618;
    v16 = a2;
    do
    {
      if (v3 == *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      else
        v5 = 0;
      v6 = v5;
      if (v3 <= 8 && ((0xBAu >> v3) & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "_iteratorForSearchEntity:library:resumeObjectID:", v3, *(_QWORD *)(a1 + 40), v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "countRemainingWithManagedObjectContext:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v9, "isSuccess"))
        {
          objc_msgSend(v9, "result");
          v10 = objc_claimAutoreleasedReturnValue();
          v4 += -[NSObject unsignedIntegerValue](v10, "unsignedIntegerValue");
        }
        else
        {
          PLSearchBackendIndexRebuildGetLog();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v7, "entityName");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "error");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v16.n128_u32[0];
            v21 = v11;
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch count of remaining work for entity: %{public}@, error: %@", buf, 0x16u);

          }
        }

      }
      ++v3;
    }
    while (v3 != 9);
  }
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter", *(_OWORD *)&v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(_QWORD *)(v14 + 16);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_28;
  v17[3] = &unk_1E3674C40;
  v17[4] = v14;
  v18 = *(id *)(a1 + 48);
  v19 = v4;
  objc_msgSend(v13, "dispatchAsync:block:", v15, v17);

}

uint64_t __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_28(uint64_t a1)
{
  PLBoolResultWithUnfairLock();
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 40) + 16))(0.0);
}

BOOL __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2_29(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  return !*(_BYTE *)(v1 + 48) || *(_BYTE *)(v1 + 49) != 0;
}

void __71__PLSearchIndexingRebuildEngine_pauseSearchIndexRebuildWithSourceName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("Background Job")) & 1) == 0)
  {
    v2 = *(_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(v2 + 88);
    if (v3)
      *(_QWORD *)(v2 + 88) = v3 - 1;
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(v4 + 48))
  {
    v5 = *(_QWORD *)(v4 + 88);
    PLSearchBackendIndexRebuildGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 32);
        v13 = 138543362;
        v14 = v8;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Deferring pause search index rebuild for source: %{public}@ because other clients have requested rebuild", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (v7)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_DEFAULT, "Pausing search index rebuild for source: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      *(_BYTE *)(*(_QWORD *)(a1 + 40) + 49) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "cancel");
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(v10 + 72);
      *(_QWORD *)(v10 + 72) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "cancel");
      v12 = *(_QWORD *)(a1 + 40);
      v6 = *(NSObject **)(v12 + 80);
      *(_QWORD *)(v12 + 80) = 0;
    }

  }
}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = *(_QWORD *)(a1 + 48);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 49) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (!*(_BYTE *)(v2 + 48))
  {
    *(_BYTE *)(v2 + 48) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeAllObjects");
    dispatch_group_enter(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(a1 + 32), "_lock_startPrepareAndRebuildForLibrary:type:calledBy:rebuildReasons:spotlightReasonForReindexingAllItems:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 56));
    +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v5 + 56);
    v7 = *(_QWORD *)(v5 + 16);
    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_3;
    v14[3] = &unk_1E3677AA0;
    v14[4] = v5;
    objc_msgSend(v4, "groupNotify:queue:block:", v6, v7, v14);

  }
  if ((objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("Background Job")) & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 88);
  +[PLConcurrencyLimiter sharedLimiter](PLConcurrencyLimiter, "sharedLimiter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(v9 + 56);
  v11 = *(_QWORD *)(v9 + 16);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_5;
  v12[3] = &unk_1E3675C58;
  v12[4] = v9;
  v13 = *(id *)(a1 + 64);
  objc_msgSend(v8, "groupNotify:queue:block:", v10, v11, v12);

}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_3(uint64_t a1)
{
  void *v2;

  PLSafeResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_inq_rebuildAnalyticsCompletedWithResult:", v2);

}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_5(uint64_t a1)
{
  void *v2;

  PLSafeResultWithUnfairLock();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(_QWORD, void *, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v2, objc_msgSend(v2, "isSuccess"));

}

id __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

id __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_4(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  return *(id *)(*(_QWORD *)(a1 + 32) + 64);
}

id __59__PLSearchIndexingRebuildEngine_initWithDelegate_provider___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    v2 = objc_alloc_init(MEMORY[0x1E0D731C0]);
  else
    v2 = 0;

  return v2;
}

+ (BOOL)hasRebuildWorkToDoForLibrary:(id)a3 identifier:(int64_t)a4 sceneTaxonomyDigests:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v9 = +[PLSpotlightReindexing shouldReindexAllItemsForLibraryIdentifier:](PLSpotlightReindexing, "shouldReindexAllItemsForLibraryIdentifier:", a4);
  objc_msgSend(v7, "globalValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "searchIndexRebuildReasonsWithSceneTaxonomyDigests:spotlightRequestedRebuild:pathManager:", v8, v9, v11);

  if (v12)
  {
    PLSearchBackendIndexRebuildGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v12, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v14;
      v18 = 2112;
      v19 = v7;
      _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_DEFAULT, "Detected rebuild reasons: %{public}@ for library: %@", (uint8_t *)&v16, 0x16u);

    }
  }

  return v12 != 0;
}

+ (BOOL)requiresImmediateDropIndexForLibrary:(id)a3 reasons:(unint64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "globalValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "searchIndexRebuildReasonsWithSceneTaxonomyDigests:spotlightRequestedRebuild:pathManager:", 0, 0, v7);

  v9 = v8 & 0x62;
  if ((v8 & 0x62) != 0)
  {
    v10 = v8 & 0xFFFFFFFFFFFFFFFBLL;
    PLSearchBackendIndexRebuildGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v10, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v5;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "Immediate search index drop required for reasons: %{public}@ for library: %@", (uint8_t *)&v14, 0x16u);

    }
    if (a4)
      *a4 = v10;
  }

  return v9 != 0;
}

@end
