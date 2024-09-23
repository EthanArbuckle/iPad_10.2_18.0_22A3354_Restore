@implementation PLMomentGeneration

- (PLMomentGeneration)initWithMomentGenerationDataManager:(id)a3 bundle:(id)a4
{
  return -[PLMomentGeneration initWithMomentGenerationDataManager:bundle:locale:](self, "initWithMomentGenerationDataManager:bundle:locale:", a3, a4, 0);
}

- (PLMomentGeneration)initWithMomentGenerationDataManager:(id)a3 bundle:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLMomentGeneration *v11;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *pendingInsertsAndUpdates;
  NSMutableDictionary *v14;
  NSMutableDictionary *pendingDeletes;
  NSMutableArray *v16;
  NSMutableArray *pendingCompletionBlocks;
  NSMutableOrderedSet *v18;
  NSMutableOrderedSet *pendingUpdatesForHighlights;
  NSMutableOrderedSet *v20;
  NSMutableOrderedSet *pendingMomentUpdatesForHighlights;
  NSMutableDictionary *v22;
  NSMutableDictionary *pendingSharedAssetContainerIncrementalChanges;
  dispatch_queue_t v24;
  OS_dispatch_queue *incrementalGenerationStateQueue;
  PLDateRangeTitleGenerator *v26;
  PLDateRangeTitleGenerator *dateRangeTitleGenerator;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  PLLazyObject *lazyFrequentLocationManager;
  id v33;
  id v34;
  uint64_t v35;
  PLLazyObject *lazyLocalCreationDateCreator;
  PLMomentGenerationThrottle *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  PLMomentGenerationThrottle *incrementalMomentGenThrottle;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _QWORD v47[4];
  id v48;
  id location;
  objc_super v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v50.receiver = self;
  v50.super_class = (Class)PLMomentGeneration;
  v11 = -[PLMomentGeneration init](&v50, sel_init);
  if ((PLPlatformMomentsSupported() & 1) != 0)
  {
    if (v11)
    {
      objc_storeWeak((id *)&v11->_momentGenerationDataManager, v8);
      v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      pendingInsertsAndUpdates = v11->_pendingInsertsAndUpdates;
      v11->_pendingInsertsAndUpdates = v12;

      v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      pendingDeletes = v11->_pendingDeletes;
      v11->_pendingDeletes = v14;

      v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      pendingCompletionBlocks = v11->_pendingCompletionBlocks;
      v11->_pendingCompletionBlocks = v16;

      v18 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      pendingUpdatesForHighlights = v11->_pendingUpdatesForHighlights;
      v11->_pendingUpdatesForHighlights = v18;

      v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
      pendingMomentUpdatesForHighlights = v11->_pendingMomentUpdatesForHighlights;
      v11->_pendingMomentUpdatesForHighlights = v20;

      v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      pendingSharedAssetContainerIncrementalChanges = v11->_pendingSharedAssetContainerIncrementalChanges;
      v11->_pendingSharedAssetContainerIncrementalChanges = v22;

      v24 = dispatch_queue_create("com.apple.moment.generation.pendingIsolation", 0);
      incrementalGenerationStateQueue = v11->_incrementalGenerationStateQueue;
      v11->_incrementalGenerationStateQueue = (OS_dispatch_queue *)v24;

      objc_storeStrong((id *)&v11->_libraryBundle, a4);
      if (v10)
        v26 = -[PLDateRangeTitleGenerator initWithLocale:]([PLDateRangeTitleGenerator alloc], "initWithLocale:", v10);
      else
        v26 = objc_alloc_init(PLDateRangeTitleGenerator);
      dateRangeTitleGenerator = v11->_dateRangeTitleGenerator;
      v11->_dateRangeTitleGenerator = v26;

      v28 = objc_initWeak(&location, v11);
      v29 = objc_alloc(MEMORY[0x1E0D73248]);
      v30 = MEMORY[0x1E0C809B0];
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke;
      v47[3] = &unk_1E36759D8;
      objc_copyWeak(&v48, &location);
      v31 = objc_msgSend(v29, "initWithRetriableBlock:", v47);
      objc_destroyWeak(&v48);
      objc_destroyWeak(&location);
      lazyFrequentLocationManager = v11->_lazyFrequentLocationManager;
      v11->_lazyFrequentLocationManager = (PLLazyObject *)v31;

      v33 = objc_initWeak(&location, v11);
      v34 = objc_alloc(MEMORY[0x1E0D73248]);
      v45[0] = v30;
      v45[1] = 3221225472;
      v45[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_2;
      v45[3] = &unk_1E36759D8;
      objc_copyWeak(&v46, &location);
      v35 = objc_msgSend(v34, "initWithRetriableBlock:", v45);
      objc_destroyWeak(&v46);
      objc_destroyWeak(&location);
      lazyLocalCreationDateCreator = v11->_lazyLocalCreationDateCreator;
      v11->_lazyLocalCreationDateCreator = (PLLazyObject *)v35;

      objc_initWeak(&location, v11);
      v37 = [PLMomentGenerationThrottle alloc];
      v38 = objc_msgSend(v8, "isLightweightMigrationManager");
      objc_msgSend(v8, "isolationQueue");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v30;
      v43[1] = 3221225472;
      v43[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_3;
      v43[3] = &unk_1E3675A28;
      objc_copyWeak(&v44, &location);
      v40 = -[PLMomentGenerationThrottle initWithName:canDelayAnyQOS:singleThreadedMode:timeProvider:targetQueue:target:](v37, "initWithName:canDelayAnyQOS:singleThreadedMode:timeProvider:targetQueue:target:", CFSTR("MomentGeneration"), 0, v38, 0, v39, v43);
      incrementalMomentGenThrottle = v11->_incrementalMomentGenThrottle;
      v11->_incrementalMomentGenThrottle = (PLMomentGenerationThrottle *)v40;

      objc_destroyWeak(&v44);
      objc_destroyWeak(&location);
    }
  }
  else
  {

    v11 = 0;
  }

  return v11;
}

- (BOOL)isGenerationPassInProgress
{
  return !-[PLMomentGenerationThrottle isIdle](self->_incrementalMomentGenThrottle, "isIdle");
}

- (void)_updateIncrementalMomentGeneration
{
  -[PLMomentGenerationThrottle update](self->_incrementalMomentGenThrottle, "update");
}

- (BOOL)_hasWorkWorkRemainingWithCompletionBlocks:(id *)a3
{
  char v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__94626;
  v14 = __Block_byref_object_dispose__94627;
  v15 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  pl_dispatch_sync();
  if (a3)
    *a3 = objc_retainAutorelease((id)v11[5]);
  v4 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(&v10, 8);

  return v4;
}

- (void)releaseMemoryIntensiveObjects
{
  id WeakRetained;

  -[PLLazyObject resetObject](self->_lazyLocalCreationDateCreator, "resetObject");
  -[PLLazyObject resetObject](self->_lazyFrequentLocationManager, "resetObject");
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "releaseMemoryIntensiveObjects");

}

- (void)_runIncrementalMomentGenerationIfItemsArePendingWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  BOOL v5;
  PLMomentGenerationThrottle *v6;
  id WeakRetained;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  PLMomentGenerationThrottle *v15;
  id v16;
  void (**v17)(_QWORD);
  uint64_t *v18;
  _QWORD *v19;
  CFAbsoluteTime Current;
  _QWORD v21[4];
  id v22;
  _QWORD *v23;
  id obj;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  _QWORD v29[5];
  id v30;

  v4 = (void (**)(_QWORD))a3;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__94626;
  v29[4] = __Block_byref_object_dispose__94627;
  v30 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  obj = 0;
  v5 = -[PLMomentGeneration _hasWorkWorkRemainingWithCompletionBlocks:](self, "_hasWorkWorkRemainingWithCompletionBlocks:", &obj);
  objc_storeStrong(&v30, obj);
  v28 = v5;
  v6 = self->_incrementalMomentGenThrottle;
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "isolationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke;
  v21[3] = &unk_1E3677C68;
  v23 = v29;
  v10 = v8;
  v22 = v10;
  v11 = MEMORY[0x19AEC174C](v21);
  v12 = (void *)v11;
  if (*((_BYTE *)v26 + 24))
  {
    v13 = (void *)MEMORY[0x19AEC1554]();
    v14[0] = v9;
    v14[1] = 3221225472;
    v14[2] = __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke_3;
    v14[3] = &unk_1E3675A50;
    Current = CFAbsoluteTimeGetCurrent();
    v18 = &v25;
    v14[4] = self;
    v19 = v29;
    v15 = v6;
    v16 = v12;
    v17 = v4;
    -[PLMomentGeneration _runIncrementalGenerationPassWithCompletionHandler:](self, "_runIncrementalGenerationPassWithCompletionHandler:", v14);

    objc_autoreleasePoolPop(v13);
  }
  else
  {
    (*(void (**)(uint64_t))(v11 + 16))(v11);
    v4[2](v4);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v29, 8);

}

- (id)_newPublicGlobalUUIDsToAssetsMappingWithAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "moment", (_QWORD)v13);

        objc_msgSend(v10, "globalUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "setObject:forKey:", v10, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (BOOL)_isAsset:(id)a3 identicalToAssetForMoments:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "dateCreated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateCreated");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    if (v8 && (objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
      goto LABEL_4;
LABEL_9:
    v13 = 0;
    goto LABEL_12;
  }
  if (v8)
    goto LABEL_9;
LABEL_4:
  objc_msgSend(v5, "location");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = (v10 | v11) == 0;
  if (v10 && v11)
  {
    objc_msgSend((id)v10, "coordinate");
    v15 = v14;
    objc_msgSend(v12, "coordinate");
    if (v15 == v16)
    {
      objc_msgSend((id)v10, "coordinate");
      v18 = v17;
      objc_msgSend(v12, "coordinate");
      v13 = v18 == v19;
    }
    else
    {
      v13 = 0;
    }
  }

LABEL_12:
  return v13;
}

- (void)saveChangesForAssetInsertsAndUpdates:(id)a3 assetDeletes:(id)a4 assetUpdatesForHighlights:(id)a5 momentUpdatesForHighlights:(id)a6 sharedAssetContainerIncrementalChangesByAssetID:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (PLPlatformMomentsSupported()
    && (objc_msgSend(v11, "count")
     || objc_msgSend(v12, "count")
     || objc_msgSend(v13, "count")
     || objc_msgSend(v14, "count")))
  {
    v16 = v11;
    v17 = v12;
    v18 = v13;
    v19 = v14;
    v20 = v15;
    pl_dispatch_sync();

  }
}

- (void)generateWithAssetInsertsAndUpdates:(id)a3 assetDeletes:(id)a4 assetUpdatesForHighlights:(id)a5 momentUpdatesForHighlights:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id WeakRetained;
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (PLPlatformMomentsSupported()
    && (objc_msgSend(v18, "count")
     || objc_msgSend(v12, "count")
     || objc_msgSend(v13, "count")
     || objc_msgSend(v14, "count")))
  {
    -[PLMomentGeneration saveChangesForAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:sharedAssetContainerIncrementalChangesByAssetID:](self, "saveChangesForAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:sharedAssetContainerIncrementalChangesByAssetID:", v18, v12, v13, v14, 0);
    -[PLMomentGeneration generateWithIncrementalDataCompletionHandler:](self, "generateWithIncrementalDataCompletionHandler:", v15);
  }
  else if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    objc_msgSend(WeakRetained, "isolationQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
}

- (void)generateWithIncrementalDataCompletionHandler:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  PLMomentGeneration *v11;
  id v12;

  v4 = a3;
  if ((PLPlatformMomentsSupported() & 1) != 0)
  {
    if (v4)
    {
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __67__PLMomentGeneration_generateWithIncrementalDataCompletionHandler___block_invoke;
      v10 = &unk_1E3675C58;
      v11 = self;
      v12 = v4;
      pl_dispatch_sync();

    }
    -[PLMomentGeneration _updateIncrementalMomentGeneration](self, "_updateIncrementalMomentGeneration", v7, v8, v9, v10, v11);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    objc_msgSend(WeakRetained, "isolationQueue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
}

- (void)_runIncrementalGenerationPassWithCompletionHandler:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  SEL v17;
  _QWORD v18[4];
  NSObject *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  uint8_t *v24;
  _QWORD *v25;
  uint64_t v26;
  os_signpost_id_t v27;
  mach_timebase_info v28;
  _QWORD v29[4];
  NSObject *v30;
  PLMomentGeneration *v31;
  id v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint8_t *v36;
  _QWORD *v37;
  _QWORD *v38;
  SEL v39;
  _QWORD v40[4];
  _QWORD v41[5];
  _QWORD v42[3];
  os_signpost_id_t v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  NSObject *v49;
  mach_timebase_info info;
  _QWORD v51[3];
  uint64_t v52;
  _QWORD v53[5];
  id v54;

  v5 = a3;
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__94626;
  v53[4] = __Block_byref_object_dispose__94627;
  v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  v52 = 0;
  v52 = objc_msgSend(v6, "hardGenerationBatchSizeLimit");
  PLMomentGenerationGetLog();
  v17 = a2;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  info = 0;
  mach_timebase_info(&info);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "IncrementalMomentGeneration", ", buf, 2u);
  }

  v11 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v45 = buf;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__94626;
  v48 = __Block_byref_object_dispose__94627;
  v12 = v10;
  v49 = v12;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v43 = 0;
  v43 = os_signpost_id_generate(v12);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2810000000;
  v41[3] = &unk_199CADF31;
  v41[4] = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v40[3] = 0;
  v13 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke;
  v29[3] = &unk_1E3675B40;
  v30 = v12;
  v31 = self;
  v33 = v51;
  v14 = v6;
  v38 = v40;
  v39 = v17;
  v32 = v14;
  v34 = v53;
  v35 = v41;
  v36 = buf;
  v37 = v42;
  v18[0] = v13;
  v18[1] = 3221225472;
  v18[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_58;
  v18[3] = &unk_1E3675B68;
  v21 = v53;
  v22 = v40;
  v23 = v41;
  v24 = buf;
  v25 = v42;
  v26 = v11;
  v28 = info;
  v15 = v30;
  v19 = v15;
  v27 = v8;
  v16 = v5;
  v20 = v16;
  objc_msgSend(v14, "performDataTransaction:synchronously:completionHandler:", v29, 0, v18);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(v42, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(v53, 8);

}

- (id)localCreationDateCreator
{
  return (id)-[PLLazyObject objectValue](self->_lazyLocalCreationDateCreator, "objectValue");
}

- (id)newLocalCreationDateCreator
{
  PLLocalCreationDateCreator *v3;
  void *v4;
  PLLocalCreationDateCreator *v5;

  v3 = [PLLocalCreationDateCreator alloc];
  -[PLPhotoLibraryBundle timeZoneLookup](self->_libraryBundle, "timeZoneLookup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLLocalCreationDateCreator initWithTimeZoneLookup:](v3, "initWithTimeZoneLookup:", v4);

  return v5;
}

- (id)frequentLocationManager
{
  return (id)-[PLLazyObject objectValue](self->_lazyFrequentLocationManager, "objectValue");
}

- (id)newFrequentLocationManager
{
  PLMomentGenerationDataManagement **p_momentGenerationDataManager;
  id WeakRetained;
  char v4;
  PLFrequentLocationManager *v5;
  PLFrequentLocationManager *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v13;

  p_momentGenerationDataManager = &self->_momentGenerationDataManager;
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  v4 = objc_msgSend(WeakRetained, "cameraIsActive");

  if ((v4 & 1) != 0)
    return 0;
  v6 = [PLFrequentLocationManager alloc];
  v7 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
  v5 = -[PLFrequentLocationManager initWithMomentGenerationDataManager:](v6, "initWithMomentGenerationDataManager:", v7);

  v8 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
  v13 = 0;
  objc_msgSend(v8, "allMomentsWithError:", &v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_loadWeakRetained((id *)p_momentGenerationDataManager);
  objc_msgSend((id)objc_opt_class(), "processingMomentsFromMoments:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLFrequentLocationManager frequentLocationsDidChangeFromUpdateWithAllMoments:](v5, "frequentLocationsDidChangeFromUpdateWithAllMoments:", v11);
  return v5;
}

- (id)_highlightGenerator
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PLPhotosHighlightGenerator *v7;
  id WeakRetained;
  PLPhotosHighlightGenerator *v9;

  v3 = (void *)MEMORY[0x1E0D73280];
  -[PLPhotoLibraryBundle libraryServicesManager](self->_libraryBundle, "libraryServicesManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "shouldProcessHighlightsForWellKnownPhotoLibraryIdentifier:", objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier"));

  if ((_DWORD)v3)
  {
    -[PLMomentGeneration localCreationDateCreator](self, "localCreationDateCreator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMomentGeneration frequentLocationManager](self, "frequentLocationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [PLPhotosHighlightGenerator alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    v9 = -[PLPhotosHighlightGenerator initWithDataManager:frequentLocationManager:localCreationDateCreator:dateRangeTitleGenerator:](v7, "initWithDataManager:frequentLocationManager:localCreationDateCreator:dateRangeTitleGenerator:", WeakRetained, v6, v5, self->_dateRangeTitleGenerator);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)_runMomentAndHighlightGenerationForAssets:(id)a3 hiddenAssets:(id)a4 updatedAssetIDsForHighlights:(id)a5 updatedMomentIDsForHighlights:(id)a6 affectedMoments:(id)a7 highlightsWithDeletedMoments:(id)a8 sharedAssetContainerIncrementalChanges:(id)a9 insertedOrUpdatedMoments:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  PLAssetCollectionGenerator *v23;
  void *v24;
  PLAssetCollectionGenerator *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t j;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  PLPhotoLibraryBundle *libraryBundle;
  id v70;
  id v71;
  id v72;
  id v73;
  void *context;
  id v75;
  id v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97;
  _QWORD v98[4];
  id v99;
  _QWORD v100[4];
  id v101;
  id v102;
  _BYTE v103[128];
  _BYTE v104[128];
  uint8_t v105[128];
  uint8_t buf[4];
  PLPhotoLibraryBundle *v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v83 = a5;
  v82 = a6;
  v18 = a7;
  v80 = a8;
  v19 = a9;
  -[PLMomentGeneration localCreationDateCreator](self, "localCreationDateCreator");
  v20 = objc_claimAutoreleasedReturnValue();
  -[PLMomentGeneration frequentLocationManager](self, "frequentLocationManager");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x19AEC1554]();
  v23 = [PLAssetCollectionGenerator alloc];
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)v21;
  v79 = (void *)v20;
  v25 = -[PLAssetCollectionGenerator initWithDataManager:frequentLocationManager:localCreationDateCreator:](v23, "initWithDataManager:frequentLocationManager:localCreationDateCreator:", v24, v21, v20);

  v81 = v18;
  -[PLAssetCollectionGenerator processMomentsWithAssets:affectedMoments:](v25, "processMomentsWithAssets:affectedMoments:", v16, v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v22);
  objc_msgSend(v26, "insertedOrUpdatedMoments");
  *a10 = (id)objc_claimAutoreleasedReturnValue();
  -[PLMomentGeneration _highlightGenerator](self, "_highlightGenerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    context = (void *)MEMORY[0x19AEC1554]();
    -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v17;
    v77 = v16;
    objc_msgSend(v27, "beginGenerationWithAssets:hiddenAssets:", v16, v17);
    v29 = MEMORY[0x1E0C809B0];
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke;
    v100[3] = &unk_1E3675B90;
    v30 = v28;
    v101 = v30;
    v72 = v27;
    v102 = v72;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v100);
    v98[0] = v29;
    v98[1] = 3221225472;
    v98[2] = __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke_2;
    v98[3] = &unk_1E3677E90;
    v73 = v30;
    v99 = v73;
    v75 = v19;
    objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v98);
    -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = 0;
    objc_msgSend(v31, "momentsForAssetsWithUniqueIDs:error:", v83, &v97);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v97;
    v34 = (void *)MEMORY[0x1E0C9AA60];
    if (v32)
      v35 = v32;
    else
      v35 = (void *)MEMORY[0x1E0C9AA60];
    v70 = v35;

    -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = v33;
    objc_msgSend(v36, "momentsWithUniqueIDs:error:", v82, &v96);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = v96;

    if (v37)
      v38 = v37;
    else
      v38 = v34;
    v39 = v38;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(v26, "insertedOrUpdatedMoments");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v93;
      do
      {
        for (i = 0; i != v44; ++i)
        {
          if (*(_QWORD *)v93 != v45)
            objc_enumerationMutation(v42);
          v47 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * i);
          if (objc_msgSend(v47, "isDeleted", v70, v71))
            v48 = v41;
          else
            v48 = v40;
          objc_msgSend(v48, "addObject:", v47);
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v92, v105, 16);
      }
      while (v44);
    }

    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v49 = v70;
    v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
    if (v50)
    {
      v51 = v50;
      v52 = *(_QWORD *)v89;
      do
      {
        for (j = 0; j != v51; ++j)
        {
          if (*(_QWORD *)v89 != v52)
            objc_enumerationMutation(v49);
          v54 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * j);
          if (objc_msgSend(v54, "isDeleted", v70))
            v55 = v41;
          else
            v55 = v40;
          objc_msgSend(v55, "addObject:", v54);
        }
        v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v88, v104, 16);
      }
      while (v51);
    }

    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v56 = v39;
    v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
    if (v57)
    {
      v58 = v57;
      v59 = *(_QWORD *)v85;
      do
      {
        for (k = 0; k != v58; ++k)
        {
          if (*(_QWORD *)v85 != v59)
            objc_enumerationMutation(v56);
          v61 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * k);
          if (objc_msgSend(v61, "isDeleted", v70))
            v62 = v41;
          else
            v62 = v40;
          objc_msgSend(v62, "addObject:", v61);
        }
        v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v84, v103, 16);
      }
      while (v58);
    }

    v16 = v77;
    v63 = v78;
    if (objc_msgSend(v40, "count") || objc_msgSend(v41, "count"))
      objc_msgSend(v78, "invalidateCurrentFrequentLocations", v70);
    v64 = v80;
    objc_msgSend(v72, "registerHighlightsWithDeletedMoments:", v80, v70);
    objc_msgSend(v72, "generateHighlightsForUpsertedMoments:frequentLocationsDidChange:", v40, objc_msgSend(v26, "frequentLocationsDidChange"));
    objc_msgSend(v72, "finishGeneration");

    objc_autoreleasePoolPop(context);
    v19 = v75;
    v17 = v76;
    v65 = v26;
    v67 = v82;
    v66 = v83;
  }
  else
  {
    v65 = v26;
    v67 = v82;
    v66 = v83;
    PLMomentsGetLog();
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      libraryBundle = self->_libraryBundle;
      *(_DWORD *)buf = 138412290;
      v107 = libraryBundle;
      _os_log_impl(&dword_199541000, v68, OS_LOG_TYPE_DEFAULT, "Skipping highlight generation on photoLibrary: %@", buf, 0xCu);
    }

    v64 = v80;
    v63 = v78;
  }

}

- (void)rebuildAllMomentsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CFAbsoluteTime Current;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  id WeakRetained;
  void *v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  os_signpost_id_t v26;
  CFAbsoluteTime v27;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD *v31;
  uint8_t *v32;
  char v33;
  uint8_t buf[8];
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  _QWORD v40[3];
  char v41;

  v6 = a3;
  v7 = a4;
  if ((PLPlatformMomentsSupported() & 1) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    PLMomentsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild starting", buf, 2u);
    }

    PLMomentGenerationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);
    v12 = v10;
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FullRebuild", ", buf, 2u);
    }

    objc_msgSend(v6, "objectForKey:", PLMomentGenerationShouldDeleteAllMomentsKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x2020000000;
    v41 = 0;
    *(_QWORD *)buf = 0;
    v35 = buf;
    v36 = 0x3032000000;
    v37 = __Block_byref_object_copy__94626;
    v38 = __Block_byref_object_dispose__94627;
    v39 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke;
    v28[3] = &unk_1E3675BB8;
    v33 = v15;
    v31 = v40;
    v18 = v16;
    v29 = v18;
    v32 = buf;
    v30 = v6;
    objc_msgSend(v18, "performDataTransaction:synchronously:completionHandler:", v28, 1, 0);
    if (objc_msgSend(v18, "wantsMomentReplayLogging"))
      -[PLMomentGeneration _clearReplayLog](self, "_clearReplayLog");
    v19 = *((_QWORD *)v35 + 5);
    v23[0] = v17;
    v23[1] = 3221225472;
    v23[2] = __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke_93;
    v23[3] = &unk_1E3675BE0;
    v20 = v13;
    v24 = v20;
    v26 = v11;
    v27 = Current;
    v25 = v7;
    -[PLMomentGeneration generateWithAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:completionHandler:](self, "generateWithAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:completionHandler:", v19, 0, 0, 0, v23);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v40, 8);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    objc_msgSend(WeakRetained, "isolationQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
}

- (void)rebuildAllHighlightsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  CFAbsoluteTime Current;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  _BOOL8 v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  id WeakRetained;
  void *v26;
  __int16 v27;
  _QWORD v28[4];
  NSObject *v29;
  NSObject *v30;
  id v31;
  os_signpost_id_t v32;
  CFAbsoluteTime v33;
  _QWORD v34[4];
  id v35;
  _QWORD *v36;
  uint8_t *v37;
  char v38;
  uint8_t buf[8];
  uint8_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  char v46;

  v6 = a3;
  v7 = a4;
  if ((PLPlatformMomentsSupported() & 1) != 0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    PLMomentsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild starting", buf, 2u);
    }

    PLMomentGenerationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);
    v12 = v10;
    v13 = v12;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "FullRebuild", ", buf, 2u);
    }

    objc_msgSend(v6, "objectForKey:", PLMomentGenerationShouldDeleteAllHighlightsKey);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLValue");

    -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    v46 = 0;
    *(_QWORD *)buf = 0;
    v40 = buf;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__94626;
    v43 = __Block_byref_object_dispose__94627;
    v44 = 0;
    v17 = MEMORY[0x1E0C809B0];
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke;
    v34[3] = &unk_1E3675C08;
    v38 = v15;
    v36 = v45;
    v18 = v16;
    v35 = v18;
    v37 = buf;
    objc_msgSend(v18, "performDataTransaction:synchronously:completionHandler:", v34, 1, 0);
    if (objc_msgSend(v18, "wantsMomentReplayLogging"))
      -[PLMomentGeneration _clearReplayLog](self, "_clearReplayLog");
    v19 = dispatch_group_create();
    dispatch_group_enter(v19);
    v20 = -[PLMomentGenerationThrottle singleThreaded](self->_incrementalMomentGenThrottle, "singleThreaded");
    -[PLMomentGenerationThrottle setSingleThreaded:](self->_incrementalMomentGenThrottle, "setSingleThreaded:", 1);
    v21 = *((_QWORD *)v40 + 5);
    v28[0] = v17;
    v28[1] = 3221225472;
    v28[2] = __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke_94;
    v28[3] = &unk_1E3675C30;
    v22 = v13;
    v29 = v22;
    v32 = v11;
    v33 = Current;
    v31 = v7;
    v23 = v19;
    v30 = v23;
    -[PLMomentGeneration generateWithAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:completionHandler:](self, "generateWithAssetInsertsAndUpdates:assetDeletes:assetUpdatesForHighlights:momentUpdatesForHighlights:completionHandler:", MEMORY[0x1E0C9AA60], 0, 0, v21, v28);
    PLMomentsGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 0;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild, waiting for completion...", (uint8_t *)&v27, 2u);
    }

    dispatch_group_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
    -[PLMomentGenerationThrottle setSingleThreaded:](self->_incrementalMomentGenThrottle, "setSingleThreaded:", v20);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v45, 8);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
    objc_msgSend(WeakRetained, "isolationQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    pl_dispatch_async();

  }
}

- (void)processRecentHighlightsWithCompletionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "isolationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  pl_dispatch_async();

}

- (void)processUnprocessedMomentLocationsWithCompletionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "isolationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  pl_dispatch_async();

}

- (void)updateHighlightTitlesWithCompletionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "isolationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  pl_dispatch_async();

}

- (void)cleanupEmptyHighlightsWithCompletionBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
  objc_msgSend(WeakRetained, "isolationQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  pl_dispatch_async();

}

- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:(id)a3
{
  -[PLMomentGeneration invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:completionBlock:](self, "invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:completionBlock:", 0, a3);
}

- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale:(BOOL)a3 completionBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  PLMomentGeneration *v14;
  BOOL v15;

  v6 = a4;
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke;
  v12[3] = &unk_1E3675C80;
  v15 = a3;
  v13 = v7;
  v14 = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke_108;
  v10[3] = &unk_1E3676CD8;
  v11 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "performDataTransaction:synchronously:completionHandler:", v12, 1, v10);

}

- (id)momentGenerationStatus
{
  const __CFString *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6 = MEMORY[0x1E0C809B0];
  pl_dispatch_sync();
  if (*((_BYTE *)v21 + 24))
    v2 = CFSTR("YES");
  else
    v2 = CFSTR("NO");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("In Progress: %@\n"), v2, v6, 3221225472, __44__PLMomentGeneration_momentGenerationStatus__block_invoke, &unk_1E3675CA8, self, &v20, &v16, &v12, &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*((_BYTE *)v21 + 24))
    objc_msgSend(v3, "appendFormat:", CFSTR("\tIn progress count: %lu\n"), v17[3]);
  objc_msgSend(v4, "appendFormat:", CFSTR("Pending Update Count: %lu\n"), v13[3]);
  objc_msgSend(v4, "appendFormat:", CFSTR("Pending Delete Count: %lu\n"), v9[3]);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v4;
}

- (BOOL)_writeDetails:(id)a3 toFilepath:(id)a4 withDefaultFilename:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  char v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "pathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:", &stru_1E36789C0))
    goto LABEL_7;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v8, &v18);

  if (v12)
  {
    if (!v18)
      goto LABEL_7;
    objc_msgSend(v8, "stringByAppendingPathComponent:", v9);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v8, "stringByAppendingPathExtension:", CFSTR("plist"));
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;

  v8 = v14;
LABEL_7:
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v7, 100, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "writeToFile:options:error:", v8, 1073741825, 0);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_detailsForAsset:(id)a3 simpleOnly:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "coordinate");
      v10 = v9;
      v12 = v11;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = CFSTR("AssetLocationLatitude");
      v29[1] = CFSTR("AssetLocationLongitude");
      v30[0] = v13;
      v30[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("AssetLocation"));
    objc_msgSend(v5, "dateCreated");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v15, CFSTR("AssetDateCreated"));

    if (!a4)
    {
      objc_msgSend(v5, "cloudAssetGUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v16)
        v19 = v16;
      else
        v19 = (void *)v17;
      objc_msgSend(v6, "setValue:forKey:", v19, CFSTR("AssetCloudOrLocalID"));
      objc_msgSend(v5, "modificationDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v20, CFSTR("AssetModificationDate"));

      v21 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v5, "duration");
      objc_msgSend(v21, "numberWithDouble:");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v22, CFSTR("AssetDuration"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v5, "favorite"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v23, CFSTR("AssetIsFavorite"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v5, "kind"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v24, CFSTR("AssetKind"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v5, "kindSubtype"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v25, CFSTR("AssetKindSubtype"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)objc_msgSend(v5, "height"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v26, CFSTR("AssetHeight"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", (__int16)objc_msgSend(v5, "width"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setValue:forKey:", v27, CFSTR("AssetWidth"));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_clearReplayLog
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replayLogPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v11);
  v6 = v11;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    PLMomentsGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Error deleting replay log file: %@", buf, 0xCu);

    }
  }

}

- (void)_appendAssetsToReplayLog:(id)a3 forBatchUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  int v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  NSObject *v35;
  uint32_t v36;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v4 = a4;
  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "replayLogPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v42 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v9, 0, 0, &v42);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v42;
    if (v11)
    {
      PLMomentsGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v13;
        _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error reading replay log: %@", buf, 0xCu);

      }
    }
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKey:", &unk_1E3760E18, CFSTR("ReplayLogAssetCount"));
LABEL_10:
  objc_msgSend(v14, "objectForKey:", CFSTR("ReplayLogAssetCount"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "integerValue");

  if ((unint64_t)(objc_msgSend(v6, "count") + v16) < 0x2711)
  {
    v18 = objc_msgSend(v6, "count") + v16;
    objc_msgSend(v14, "objectForKey:", CFSTR("ReplayStream"));
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      -[PLMomentGeneration _logEntryForAssets:isBatchUpdate:](self, "_logEntryForAssets:isBatchUpdate:", v6, v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v20);

    }
    v21 = v19;
    objc_msgSend(v14, "setObject:forKey:", v19, CFSTR("ReplayStream"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v22, CFSTR("ReplayLogAssetCount"));

    v41 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v14, 200, 0, &v41);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v41;

    if (v24)
    {
      PLMomentsGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v24, "localizedDescription");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v26;
        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Error reading moments replay log plist: %@", buf, 0xCu);

      }
      goto LABEL_30;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v25 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if ((-[NSObject fileExistsAtPath:](v25, "fileExistsAtPath:") & 1) != 0
      || (v40 = 0,
          v27 = -[NSObject createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v25, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v38, 0, 0, &v40), v28 = v40, v29 = v28, v27)&& !v28)
    {
      v39 = 0;
      v30 = objc_msgSend(v23, "writeToFile:options:error:", v8, 0, &v39);
      v31 = v39;
      v29 = v31;
      if (v30)
      {
        v24 = 0;
        if (!v31)
          goto LABEL_29;
      }
      PLMomentsGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v29, "localizedDescription");
        v37 = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v44 = v33;
        v34 = "Error writing moments replay log data: %@";
        v35 = v37;
        v36 = 12;
LABEL_27:
        _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);

        v32 = v37;
      }
    }
    else
    {
      PLMomentsGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v29, "localizedDescription");
        v37 = v32;
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v35 = v37;
        v44 = v38;
        v45 = 2112;
        v46 = v33;
        v34 = "Unable to create directory at %@ for moments replay log: %@";
        v36 = 22;
        goto LABEL_27;
      }
    }

    v24 = v29;
LABEL_29:

LABEL_30:
    v11 = v24;
    goto LABEL_31;
  }
  PLMomentsGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v17, OS_LOG_TYPE_DEFAULT, "Moment generation has exceeded the maximum replay log size. Not logging", buf, 2u);
  }
LABEL_31:

}

- (id)_logEntryForAssets:(id)a3 isBatchUpdate:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("EntryIsBatchUpdate"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[PLMomentGeneration _detailsForAsset:simpleOnly:](self, "_detailsForAsset:simpleOnly:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14), 1, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(v7, "setObject:forKey:", v9, CFSTR("AllAssets"));
  return v7;
}

- (id)allAssetMetadataWriteToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  PLMomentGeneration *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__94626;
  v21 = __Block_byref_object_dispose__94627;
  v22 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __50__PLMomentGeneration_allAssetMetadataWriteToFile___block_invoke;
  v13 = &unk_1E3676EA0;
  v6 = v5;
  v15 = self;
  v16 = &v17;
  v14 = v6;
  objc_msgSend(v6, "performBlock:synchronously:completionHandler:", &v10, 1, 0);
  if (v4)
  {
    if (!-[PLMomentGeneration _writeDetails:toFilepath:withDefaultFilename:](self, "_writeDetails:toFilepath:withDefaultFilename:", v18[5], v4, CFSTR("metadataDump.plist")))NSLog(CFSTR("There was an error trying to write to %@"), v4, v10, v11, v12, v13);
    v7 = (void *)v18[5];
    v18[5] = 0;

  }
  v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)_detailsForMoment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[2];
  _QWORD v33[4];

  v33[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "approximateLocation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "approximateLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "coordinate");
      v9 = v8;
      v11 = v10;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = CFSTR("MomentApproximateLocationLatitude");
      v32[1] = CFSTR("MomentApproximateLocationLongitude");
      v33[0] = v12;
      v33[1] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v15, CFSTR("MomentStartDate"));

    objc_msgSend(v5, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v16, CFSTR("MomentEndDate"));

    objc_msgSend(v5, "representativeDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKey:", v17, CFSTR("MomentRepresentativeDate"));

    objc_msgSend(v14, "setValue:forKey:", v6, CFSTR("MomentApproximateLocation"));
    objc_msgSend(v5, "assets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v18, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v28 != v23)
            objc_enumerationMutation(v20);
          -[PLMomentGeneration _detailsForAsset:simpleOnly:](self, "_detailsForAsset:simpleOnly:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), 0, (_QWORD)v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v22);
    }

    objc_msgSend(v14, "setValue:forKey:", v19, CFSTR("MomentAssets"));
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)allMomentsMetadataWriteToFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  PLMomentGeneration *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  id v22;

  v4 = a3;
  -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__94626;
  v21[4] = __Block_byref_object_dispose__94627;
  v22 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__94626;
  v19 = __Block_byref_object_dispose__94627;
  v20 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__PLMomentGeneration_allMomentsMetadataWriteToFile___block_invoke;
  v10[3] = &unk_1E3676348;
  v13 = v21;
  v6 = v5;
  v14 = &v15;
  v11 = v6;
  v12 = self;
  objc_msgSend(v6, "performBlock:synchronously:completionHandler:", v10, 1, 0);
  if (v4)
  {
    if (!-[PLMomentGeneration _writeDetails:toFilepath:withDefaultFilename:](self, "_writeDetails:toFilepath:withDefaultFilename:", v16[5], v4, CFSTR("momentsMetadataDump.plist")))NSLog(CFSTR("There was an error trying to write to %@"), v4);
    v7 = (void *)v16[5];
    v16[5] = 0;

  }
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v21, 8);

  return v8;
}

- (void)validateLibraryWithCompletionBlock:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  int v6;
  unint64_t v7;
  char v8;
  char v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  PLMomentGeneration *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD v31[5];
  id v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  id v36;
  _QWORD v37[3];
  char v38;

  v4 = (void (**)(_QWORD))a3;
  if (-[PLMomentGeneration isGenerationPassInProgress](self, "isGenerationPassInProgress"))
  {
    if (v4)
      v4[2](v4);
  }
  else
  {
    -[PLMomentGeneration momentGenerationDataManager](self, "momentGenerationDataManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "shouldPerformLightweightValidation") & 1) != 0
      && (v6 = +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"),
          v7 = objc_msgSend(v5, "previousValidatedModelVersion"),
          v8 = objc_msgSend(v5, "previousValidationSucceeded"),
          v7 < v6))
    {
      v9 = v8;
      PLMomentGenerationGetLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v38 = 1;
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x3032000000;
      v35[3] = __Block_byref_object_copy__94626;
      v35[4] = __Block_byref_object_dispose__94627;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v36 = (id)objc_claimAutoreleasedReturnValue();
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x3032000000;
      v33[3] = __Block_byref_object_copy__94626;
      v33[4] = __Block_byref_object_dispose__94627;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v34 = (id)objc_claimAutoreleasedReturnValue();
      v31[0] = 0;
      v31[1] = v31;
      v31[2] = 0x3032000000;
      v31[3] = __Block_byref_object_copy__94626;
      v31[4] = __Block_byref_object_dispose__94627;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v11 = v6;
      v32 = (id)objc_claimAutoreleasedReturnValue();
      v12 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke;
      v23[3] = &unk_1E3675CD0;
      v13 = v10;
      v24 = v13;
      v27 = v37;
      v28 = v35;
      v25 = v5;
      v26 = self;
      v29 = v33;
      v30 = v31;
      v14[0] = v12;
      v14[1] = 3221225472;
      v14[2] = __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke_197;
      v14[3] = &unk_1E3675CF8;
      v22 = v9;
      v17 = v37;
      v18 = v35;
      v19 = v33;
      v20 = v31;
      v15 = v25;
      v21 = v11;
      v16 = v4;
      objc_msgSend(v15, "performDataTransaction:synchronously:completionHandler:", v23, 0, v14);

      _Block_object_dispose(v31, 8);
      _Block_object_dispose(v33, 8);

      _Block_object_dispose(v35, 8);
      _Block_object_dispose(v37, 8);

    }
    else if (v4)
    {
      v4[2](v4);
    }

  }
}

- (BOOL)regenerateMonthHighlightTitlesWithManager:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  PLMomentGeneration *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__94626;
  v23 = __Block_byref_object_dispose__94627;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__PLMomentGeneration_regenerateMonthHighlightTitlesWithManager_error___block_invoke;
  v10[3] = &unk_1E3676348;
  v7 = v6;
  v13 = &v15;
  v14 = &v19;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "performDataTransaction:synchronously:completionHandler:", v10, 1, 0);
  if (a4)
    *a4 = objc_retainAutorelease((id)v20[5]);
  v8 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v19, 8);

  return v8;
}

- (PLMomentGenerationDataManagement)momentGenerationDataManager
{
  return (PLMomentGenerationDataManagement *)objc_loadWeakRetained((id *)&self->_momentGenerationDataManager);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_momentGenerationDataManager);
  objc_storeStrong((id *)&self->_dateRangeTitleGenerator, 0);
  objc_storeStrong((id *)&self->_libraryBundle, 0);
  objc_storeStrong((id *)&self->_incrementalMomentGenThrottle, 0);
  objc_storeStrong((id *)&self->_lazyLocalCreationDateCreator, 0);
  objc_storeStrong((id *)&self->_lazyFrequentLocationManager, 0);
  objc_storeStrong((id *)&self->_incrementalGenerationStateQueue, 0);
  objc_storeStrong((id *)&self->_pendingCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_pendingSharedAssetContainerIncrementalChanges, 0);
  objc_storeStrong((id *)&self->_pendingMomentUpdatesForHighlights, 0);
  objc_storeStrong((id *)&self->_pendingUpdatesForHighlights, 0);
  objc_storeStrong((id *)&self->_pendingDeletes, 0);
  objc_storeStrong((id *)&self->_pendingInsertsAndUpdates, 0);
}

void __70__PLMomentGeneration_regenerateMonthHighlightTitlesWithManager_error___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Re-generating month highlight titles.", buf, 2u);
  }

  v3 = (void *)a1[4];
  v8 = 0;
  objc_msgSend(v3, "allPhotosHighlightsOfKind:error:", 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  v6 = v8;
  if (v4)
  {
    +[PLPhotosHighlightGenerator updateTitleForHighlights:forKind:forceUpdateLocale:dateRangeTitleGenerator:](PLPhotosHighlightGenerator, "updateTitleForHighlights:forKind:forceUpdateLocale:dateRangeTitleGenerator:", v4, 1, 0, *(_QWORD *)(a1[5] + 104));
  }
  else
  {
    PLMomentsGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_ERROR, "Fetching Months failed: %@", buf, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v5);
  }

}

void __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  char *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint32_t v23;
  uint64_t v24;
  uint32_t numer;
  uint32_t denom;
  NSObject *v27;
  NSObject *v28;
  uint64_t (*__ptr32 *v29)();
  NSObject *v30;
  os_signpost_id_t v31;
  NSObject *v32;
  NSObject *v33;
  id WeakRetained;
  void *v35;
  char *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  char *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  os_log_type_t v48;
  uint32_t v49;
  uint64_t v50;
  uint32_t v51;
  uint32_t v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t (*__ptr32 *v55)();
  NSObject *v56;
  os_signpost_id_t v57;
  NSObject *v58;
  NSObject *v59;
  id v60;
  void *v61;
  char *v62;
  void *v63;
  NSObject *v64;
  uint64_t v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t k;
  void *v73;
  double v74;
  char *v75;
  NSObject *v76;
  const char *v77;
  NSObject *v78;
  os_log_type_t v79;
  uint32_t v80;
  uint64_t v81;
  uint32_t v82;
  uint32_t v83;
  NSObject *v84;
  NSObject *v85;
  os_signpost_id_t v86;
  NSObject *v87;
  NSObject *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  void *v92;
  char *v93;
  uint64_t v94;
  os_signpost_id_t spid;
  os_signpost_id_t spida;
  NSObject *spidb;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  unint64_t v101;
  char *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  char *v108;
  mach_timebase_info v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  char *v114;
  mach_timebase_info v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  id v120;
  mach_timebase_info info;
  _BYTE v122[128];
  uint8_t v123[128];
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  double v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = os_signpost_id_generate(v2);
  info = 0;
  mach_timebase_info(&info);
  v4 = v2;
  v5 = v4;
  v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "ValidateAssetsPerBatch", ", buf, 2u);
  }

  v7 = mach_absolute_time();
  v8 = *(void **)(a1 + 40);
  v120 = 0;
  objc_msgSend(v8, "allInvalidAssetsWithError:", &v120);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (char *)v120;
  v103 = v9;
  if (!v9)
  {
    PLBackendGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      goto LABEL_23;
    *(_DWORD *)buf = 138412290;
    v125 = v10;
    v20 = "[MomentsGeneration.Validation] Could not fetch invalid assets with error:%@";
    v21 = v13;
    v22 = OS_LOG_TYPE_ERROR;
    v23 = 12;
LABEL_22:
    _os_log_impl(&dword_199541000, v21, v22, v20, buf, v23);
    goto LABEL_23;
  }
  if (!objc_msgSend(v9, "count"))
  {
    PLMomentsGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      goto LABEL_23;
    *(_WORD *)buf = 0;
    v20 = "[MomentsGeneration.Validation] All assets valid";
    v21 = v13;
    v22 = OS_LOG_TYPE_DEFAULT;
    v23 = 2;
    goto LABEL_22;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend(v9, "count");
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Detected %lu invalid assets", buf, 0xCu);
  }

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v13 = v9;
  v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
  if (v14)
  {
    v15 = v14;
    spid = v7;
    v100 = v10;
    v16 = *(_QWORD *)v117;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v117 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v116 + 1) + 8 * i), "uuid");
        v18 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v18);
        PLBackendGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v125 = v18;
          _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Invalid asset with identifier:%@", buf, 0xCu);
        }

      }
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v116, v128, 16);
    }
    while (v15);
    v10 = v100;
    v6 = v3 - 1;
    v7 = spid;
  }
LABEL_23:

  v24 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v27 = v5;
  v28 = v27;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v28, OS_SIGNPOST_INTERVAL_END, v3, "ValidateAssetsPerBatch", ", buf, 2u);
  }

  v29 = &off_199B99000;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v125 = "ValidateAssetsPerBatch";
    v126 = 2048;
    v127 = (float)((float)((float)((float)(v24 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v30 = *(id *)(a1 + 32);
  v31 = os_signpost_id_generate(v30);
  v115 = 0;
  mach_timebase_info(&v115);
  v32 = v30;
  v33 = v32;
  v101 = v31 - 1;
  if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v33, OS_SIGNPOST_INTERVAL_BEGIN, v31, "ValidateMomentsPerBatch", ", buf, 2u);
  }

  v98 = mach_absolute_time();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 112));
  v114 = v10;
  objc_msgSend(WeakRetained, "allInvalidMomentsWithError:", &v114);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v114;

  spida = v31;
  if (!v35)
  {
    PLBackendGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      goto LABEL_50;
    *(_DWORD *)buf = 138412290;
    v125 = v36;
    v46 = "[MomentsGeneration.Validation] Could not fetch invalid moments with error:%@";
    v47 = v39;
    v48 = OS_LOG_TYPE_ERROR;
    v49 = 12;
LABEL_49:
    _os_log_impl(&dword_199541000, v47, v48, v46, buf, v49);
    goto LABEL_50;
  }
  if (!objc_msgSend(v35, "count"))
  {
    PLMomentsGetLog();
    v39 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      goto LABEL_50;
    *(_WORD *)buf = 0;
    v46 = "[MomentsGeneration.Validation] All moments valid";
    v47 = v39;
    v48 = OS_LOG_TYPE_DEFAULT;
    v49 = 2;
    goto LABEL_49;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  PLBackendGetLog();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    v38 = objc_msgSend(v35, "count");
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v38;
    _os_log_impl(&dword_199541000, v37, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Detected %lu invalid moments", buf, 0xCu);
  }

  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v39 = v35;
  v40 = -[NSObject countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
  if (v40)
  {
    v41 = v40;
    v91 = v35;
    v93 = v36;
    v88 = v28;
    v42 = *(_QWORD *)v111;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v111 != v42)
          objc_enumerationMutation(v39);
        objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * j), "uuid");
        v44 = (char *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", v44);
        PLBackendGetLog();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v125 = v44;
          _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Invalid moment with identifier:%@", buf, 0xCu);
        }

      }
      v41 = -[NSObject countByEnumeratingWithState:objects:count:](v39, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
    }
    while (v41);
    v28 = v88;
    v29 = &off_199B99000;
    v35 = v91;
    v36 = v93;
  }
LABEL_50:

  v50 = mach_absolute_time();
  v52 = v115.numer;
  v51 = v115.denom;
  v53 = v33;
  v54 = v53;
  if (v101 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v54, OS_SIGNPOST_INTERVAL_END, spida, "ValidateMomentsPerBatch", ", buf, 2u);
  }

  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v29 + 211);
    v125 = "ValidateMomentsPerBatch";
    v126 = 2048;
    v127 = (float)((float)((float)((float)(v50 - v98) * (float)v52) / (float)v51) / 1000000.0);
    _os_log_impl(&dword_199541000, v54, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v55 = v29;
  v56 = *(id *)(a1 + 32);
  v57 = os_signpost_id_generate(v56);
  v109 = 0;
  mach_timebase_info(&v109);
  v58 = v56;
  v59 = v58;
  v99 = v57 - 1;
  if (v57 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v58))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v59, OS_SIGNPOST_INTERVAL_BEGIN, v57, "ValidateHighlightsPerBatch", ", buf, 2u);
  }
  spidb = v59;

  v94 = mach_absolute_time();
  v60 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 112));
  v108 = v36;
  objc_msgSend(v60, "allInvalidPhotosHighlightsOfAllKindsWithError:", &v108);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v108;

  v63 = v61;
  v102 = v62;
  if (!v61)
  {
    PLBackendGetLog();
    v67 = objc_claimAutoreleasedReturnValue();
    v65 = (uint64_t)v55;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v125 = v62;
      v77 = "[MomentsGeneration.Validation] Could not fetch invalid highlights with error:%@";
      v78 = v67;
      v79 = OS_LOG_TYPE_ERROR;
      v80 = 12;
LABEL_76:
      _os_log_impl(&dword_199541000, v78, v79, v77, buf, v80);
    }
LABEL_77:
    v69 = v103;
    goto LABEL_78;
  }
  if (!objc_msgSend(v61, "count"))
  {
    PLMomentsGetLog();
    v67 = objc_claimAutoreleasedReturnValue();
    v65 = (uint64_t)v55;
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v77 = "[MomentsGeneration.Validation] All highlights valid";
      v78 = v67;
      v79 = OS_LOG_TYPE_DEFAULT;
      v80 = 2;
      goto LABEL_76;
    }
    goto LABEL_77;
  }
  v90 = v61;
  v92 = v35;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  PLBackendGetLog();
  v64 = objc_claimAutoreleasedReturnValue();
  v65 = (uint64_t)v55;
  if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
  {
    v66 = objc_msgSend(v90, "count");
    *(_DWORD *)buf = 134217984;
    v125 = (const char *)v66;
    _os_log_impl(&dword_199541000, v64, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Detected %lu invalid highlights", buf, 0xCu);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v63 = v90;
  v67 = v90;
  v68 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
  v69 = v103;
  if (v68)
  {
    v70 = v68;
    v86 = v57;
    v87 = v54;
    v89 = v28;
    v71 = *(_QWORD *)v105;
    do
    {
      for (k = 0; k != v70; ++k)
      {
        if (*(_QWORD *)v105 != v71)
          objc_enumerationMutation(v67);
        v73 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * k);
        objc_msgSend(v73, "uuid", v86, v87);
        v74 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", *(_QWORD *)&v74);
        +[PLPhotosHighlight stringFromHighlightKind:](PLPhotosHighlight, "stringFromHighlightKind:", objc_msgSend(v73, "kind"));
        v75 = (char *)objc_claimAutoreleasedReturnValue();
        PLBackendGetLog();
        v76 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v125 = v75;
          v126 = 2112;
          v127 = v74;
          _os_log_impl(&dword_199541000, v76, OS_LOG_TYPE_ERROR, "[MomentsGeneration.Validation] Invalid %@ highlight with identifier:%@", buf, 0x16u);
        }

      }
      v70 = -[NSObject countByEnumeratingWithState:objects:count:](v67, "countByEnumeratingWithState:objects:count:", &v104, v122, 16);
    }
    while (v70);
    v69 = v103;
    v54 = v87;
    v28 = v89;
    v65 = 0x199B99000;
    v63 = v90;
    v35 = v92;
    v57 = v86;
  }
LABEL_78:

  v81 = mach_absolute_time();
  v83 = v109.numer;
  v82 = v109.denom;
  v84 = spidb;
  v85 = v84;
  if (v99 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v85, OS_SIGNPOST_INTERVAL_END, v57, "ValidateHighlightsPerBatch", ", buf, 2u);
  }

  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *(_QWORD *)(v65 + 1688);
    v125 = "ValidateHighlightsPerBatch";
    v126 = 2048;
    v127 = (float)((float)((float)((float)(v81 - v94) * (float)v83) / (float)v82) / 1000000.0);
    _os_log_impl(&dword_199541000, v85, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

uint64_t __57__PLMomentGeneration_validateLibraryWithCompletionBlock___block_invoke_197(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  void *v21;
  void *v22;
  uint64_t result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) && *(_BYTE *)(a1 + 88))
  {
    v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
    v3 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count");
    v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n\n"), CFSTR("Photos has detected some inconsistencies in the curation."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count"))
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%lu asset identifiers:\n"), v2);
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v6 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v33 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i));
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
        }
        while (v8);
      }

      objc_msgSend(v5, "appendString:", CFSTR("\n"));
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "count"))
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%lu moment identifiers:\n"), v3);
      objc_msgSend(v5, "appendString:", CFSTR("Moment identifiers:\n"));
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v11 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v29;
        do
        {
          for (j = 0; j != v13; ++j)
          {
            if (*(_QWORD *)v29 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j));
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
        }
        while (v13);
      }

      objc_msgSend(v5, "appendString:", CFSTR("\n"));
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count"))
    {
      objc_msgSend(v5, "appendFormat:", CFSTR("%lu highlight identifiers:\n"), v4);
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v16 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v25;
        do
        {
          for (k = 0; k != v18; ++k)
          {
            if (*(_QWORD *)v25 != v19)
              objc_enumerationMutation(v16);
            objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * k));
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
        }
        while (v18);
      }

      objc_msgSend(v5, "appendString:", CFSTR("\n"));
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Please file a radar to help diagnose the problem."), CFSTR("Photos has detected some inconsistencies in the curation."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Photos Clustering Error (%lu, %lu, %lu)"), v2, v3, v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDiagnostics fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:](PLDiagnostics, "fileRadarUserNotificationWithHeader:message:radarTitle:radarDescription:", CFSTR("Photos Curation Inconsistencies"), v21, v22, v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "setPreviousValidatedModelVersion:", *(_QWORD *)(a1 + 80));
  objc_msgSend(*(id *)(a1 + 32), "setPreviousValidationSucceeded:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __52__PLMomentGeneration_allMomentsMetadataWriteToFile___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allMomentsWithError:", 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x19AEC1554](v10);
        objc_msgSend(*(id *)(a1 + 40), "_detailsForMoment:", v14, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v16);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v11 = v10;
    }
    while (v10);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setValue:forKey:", v8, CFSTR("AllMoments"));
}

void __50__PLMomentGeneration_allAssetMetadataWriteToFile___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "allAssetsToBeIncludedInMomentsWithError:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("AllMoments"));

  v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("AllMomentLists"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v2;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v23;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(a1 + 40), "_detailsForAsset:simpleOnly:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v15), 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        ++v15;
        v17 = v13 + v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13 + v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("AssetID"));

        objc_msgSend(v10, "addObject:", v16);
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v13 += v15;
    }
    while (v12);
  }
  else
  {
    v17 = 0;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setValue:forKey:", v10, CFSTR("AllAssets"));
  v19 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("CurrentMaxID"));

}

uint64_t __44__PLMomentGeneration_momentGenerationStatus__block_invoke(_QWORD *a1)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 88), "isIdle") ^ 1;
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 8);
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(*(id *)(a1[4] + 16), "count");
  result = objc_msgSend(*(id *)(a1[4] + 24), "count");
  *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24) = result;
  return result;
}

void __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint32_t denom;
  uint32_t numer;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint32_t v35;
  uint32_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint32_t v49;
  uint32_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  void *context;
  id v55;
  uint64_t v56;
  unint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  id v62;
  id v63;
  id v64;
  mach_timebase_info info;
  uint8_t v66[128];
  uint8_t buf[4];
  const char *v68;
  __int16 v69;
  double v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = CFSTR("yes");
    else
      v3 = CFSTR("no");
    *(_DWORD *)buf = 138412290;
    v68 = (const char *)v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Invalidating highlight subtitles and re-generating highlight titles, forceUpdateLocale: %@.", buf, 0xCu);
  }

  PLMomentGenerationGetLog();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = os_signpost_id_generate(v4);
  info = 0;
  mach_timebase_info(&info);
  v6 = v4;
  v7 = v6;
  v57 = v5 - 1;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "RegenerateTitle", ", buf, 2u);
  }

  v8 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "invalidateAllHighlightSubtitles");
  v9 = *(id *)(*(_QWORD *)(a1 + 40) + 104);
  v10 = (void *)MEMORY[0x19AEC1554]();
  v11 = *(void **)(a1 + 32);
  v64 = 0;
  objc_msgSend(v11, "allPhotosHighlightsOfKind:error:", 1, &v64);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (char *)v64;
  PLMomentsGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v13;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Fetching Months failed: %@", buf, 0xCu);
    }

    v16 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v19 = v7;
    v20 = v19;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", ", buf, 2u);
    }

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_27;
    goto LABEL_26;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134217984;
    v68 = (const char *)v21;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Generating highlight titles/subtitles for %zu month highlights.", buf, 0xCu);
  }

  +[PLPhotosHighlightGenerator updateTitleForHighlights:forKind:forceUpdateLocale:dateRangeTitleGenerator:](PLPhotosHighlightGenerator, "updateTitleForHighlights:forKind:forceUpdateLocale:dateRangeTitleGenerator:", v12, 1, *(unsigned __int8 *)(a1 + 48), v9);
  objc_autoreleasePoolPop(v10);
  v10 = (void *)MEMORY[0x19AEC1554]();
  v22 = *(void **)(a1 + 32);
  v63 = 0;
  objc_msgSend(v22, "allPhotosHighlightsOfKind:error:", 2, &v63);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (char *)v63;
  PLMomentsGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v13)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v13;
      _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_ERROR, "Fetching Years failed: %@", buf, 0xCu);
    }

    v16 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v25 = v7;
    v20 = v25;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v20, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", ", buf, 2u);
    }

    if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      goto LABEL_27;
LABEL_26:
    *(_DWORD *)buf = 136315394;
    v68 = "RegenerateTitle";
    v69 = 2048;
    v70 = (float)((float)((float)((float)(v16 - v8) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
LABEL_27:

    objc_autoreleasePoolPop(v10);
    goto LABEL_28;
  }
  v56 = v8;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v12, "count");
    *(_DWORD *)buf = 134217984;
    v68 = (const char *)v26;
    _os_log_impl(&dword_199541000, v24, OS_LOG_TYPE_DEFAULT, "Generating highlight titles/subtitles for %zu year highlights.", buf, 0xCu);
  }

  +[PLPhotosHighlightGenerator updateTitleForHighlights:forKind:forceUpdateLocale:dateRangeTitleGenerator:](PLPhotosHighlightGenerator, "updateTitleForHighlights:forKind:forceUpdateLocale:dateRangeTitleGenerator:", v12, 2, *(unsigned __int8 *)(a1 + 48), v9);
  objc_autoreleasePoolPop(v10);
  v27 = (void *)MEMORY[0x19AEC1554]();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %ld OR %K = %ld"), CFSTR("kind"), 0, CFSTR("kind"), 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *(void **)(a1 + 32);
  v62 = 0;
  objc_msgSend(v29, "allPhotosHighlightsWithPredicate:error:", v28, &v62);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (char *)v62;
  PLMomentsGetLog();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v31)
  {
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v31;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Fetching Days and DayGroups failed: %@", buf, 0xCu);
    }

    v34 = mach_absolute_time();
    v36 = info.numer;
    v35 = info.denom;
    v37 = v7;
    v38 = v37;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v38, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", ", buf, 2u);
    }

    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "RegenerateTitle";
      v69 = 2048;
      v70 = (float)((float)((float)((float)(v34 - v56) * (float)v36) / (float)v35) / 1000000.0);
      _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    objc_autoreleasePoolPop(v27);
  }
  else
  {
    v53 = v28;
    context = v27;
    v55 = v9;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(v30, "count");
      *(_DWORD *)buf = 134217984;
      v68 = (const char *)v39;
      _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_DEFAULT, "Generating highlight titles/subtitles for %zu day/dayGroup highlights.", buf, 0xCu);
    }

    v40 = *(unsigned __int8 *)(a1 + 48);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v41 = v30;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v43; ++i)
        {
          if (*(_QWORD *)v59 != v44)
            objc_enumerationMutation(v41);
          v46 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          v47 = (void *)MEMORY[0x19AEC1554]();
          +[PLPhotosHighlightGenerator updateTitlesForHighlight:dateRangeTitleGenerator:options:](PLPhotosHighlightGenerator, "updateTitlesForHighlight:dateRangeTitleGenerator:options:", v46, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), v40);
          objc_autoreleasePoolPop(v47);
        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v58, v66, 16);
      }
      while (v43);
    }

    objc_autoreleasePoolPop(context);
    v48 = mach_absolute_time();
    v50 = info.numer;
    v49 = info.denom;
    v51 = v7;
    v52 = v51;
    if (v57 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_199541000, v52, OS_SIGNPOST_INTERVAL_END, v5, "RegenerateTitle", ", buf, 2u);
    }

    v9 = v55;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v68 = "RegenerateTitle";
      v69 = 2048;
      v70 = (float)((float)((float)((float)(v48 - v56) * (float)v50) / (float)v49) / 1000000.0);
      _os_log_impl(&dword_199541000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
LABEL_28:

}

uint64_t __116__PLMomentGeneration_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithForceUpdateLocale_completionBlock___block_invoke_108(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  os_signpost_id_t v13;
  CFAbsoluteTime v14;
  _QWORD v15[5];
  uint8_t buf[16];

  Current = CFAbsoluteTimeGetCurrent();
  PLMomentGenerationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CleanupEmptyHighlights", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_97;
  v15[3] = &unk_1E3677AA0;
  v8 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_2;
  v10[3] = &unk_1E3675BE0;
  v11 = v6;
  v13 = v4;
  v14 = Current;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "performDataTransaction:synchronously:completionHandler:", v15, 1, v10);

}

void __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_97(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_highlightGenerator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "cleanupEmptyHighlights");

}

uint64_t __64__PLMomentGeneration_cleanupEmptyHighlightsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t result;
  int v8;
  CFAbsoluteTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "CleanupEmptyHighlights", ", (uint8_t *)&v8, 2u);
  }

  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v8 = 134217984;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Cleanup Empty Highlights finished in %.2f", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  os_signpost_id_t v13;
  CFAbsoluteTime v14;
  _QWORD v15[5];
  uint8_t buf[16];

  Current = CFAbsoluteTimeGetCurrent();
  PLMomentGenerationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "UpdateHighlightTitles", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_96;
  v15[3] = &unk_1E3677AA0;
  v8 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_2;
  v10[3] = &unk_1E3675BE0;
  v11 = v6;
  v13 = v4;
  v14 = Current;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "performDataTransaction:synchronously:completionHandler:", v15, 1, v10);

}

void __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_96(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_highlightGenerator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateHighlightTitles");

}

uint64_t __63__PLMomentGeneration_updateHighlightTitlesWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t result;
  int v8;
  CFAbsoluteTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "UpdateHighlightTitles", ", (uint8_t *)&v8, 2u);
  }

  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v8 = 134217984;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Update Highlight Titles finished in %.2f", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[5];

  objc_msgSend(*(id *)(a1 + 32), "momentGenerationDataManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_2;
  v6[3] = &unk_1E3677AA0;
  v3 = *(void **)(a1 + 40);
  v6[4] = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_3;
  v4[3] = &unk_1E3676CD8;
  v5 = v3;
  objc_msgSend(v2, "performDataTransaction:synchronously:completionHandler:", v6, 1, v4);

}

void __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_highlightGenerator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processUnprocessedMomentLocations");

}

uint64_t __75__PLMomentGeneration_processUnprocessedMomentLocationsWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke(uint64_t a1)
{
  CFAbsoluteTime Current;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  id v12;
  os_signpost_id_t v13;
  CFAbsoluteTime v14;
  _QWORD v15[5];
  uint8_t buf[16];

  Current = CFAbsoluteTimeGetCurrent();
  PLMomentGenerationGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ProcessRecentHighlights", ", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "momentGenerationDataManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_95;
  v15[3] = &unk_1E3677AA0;
  v8 = *(void **)(a1 + 40);
  v15[4] = *(_QWORD *)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_2;
  v10[3] = &unk_1E3675BE0;
  v11 = v6;
  v13 = v4;
  v14 = Current;
  v12 = v8;
  v9 = v6;
  objc_msgSend(v7, "performDataTransaction:synchronously:completionHandler:", v15, 1, v10);

}

void __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_95(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_highlightGenerator");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "processRecentHighlights");

}

uint64_t __65__PLMomentGeneration_processRecentHighlightsWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t result;
  int v8;
  CFAbsoluteTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "ProcessRecentHighlights", ", (uint8_t *)&v8, 2u);
  }

  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v8 = 134217984;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Process Recent Highlights finished in %.2f", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 56))
  {
    PLMomentsGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "Deleting existing highlights...", buf, 2u);
    }

    v3 = *(void **)(a1 + 32);
    v14 = 0;
    v4 = objc_msgSend(v3, "deleteAllHighlightsWithError:", &v14);
    v5 = v14;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4;
    if (v5)
    {
      PLMomentsGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v5;
        _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "Error deleting existing highlights %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v5 = 0;
  }
  v7 = *(void **)(a1 + 32);
  v13 = v5;
  objc_msgSend(v7, "allMomentIDsWithError:", &v13);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v13;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (v9)
  {
    PLMomentsGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Error fetching moments %@", buf, 0xCu);
    }

  }
}

void __72__PLMomentGeneration_rebuildAllHighlightsWithOptions_completionHandler___block_invoke_94(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t v7;
  int v8;
  CFAbsoluteTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 56);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FullRebuild", ", (uint8_t *)&v8, 2u);
  }

  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 64);
    v8 = 134217984;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild finished in %f", (uint8_t *)&v8, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 48);
  if (v7)
    (*(void (**)(void))(v7 + 16))();
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  char v7;
  id v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    PLMomentsGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Deleting existing moments and highlights", buf, 2u);
    }

    v3 = *(void **)(a1 + 32);
    v25 = 0;
    v4 = objc_msgSend(v3, "deleteAllHighlightsWithError:", &v25);
    v5 = v25;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v4;
    v6 = *(void **)(a1 + 32);
    v24 = v5;
    v7 = objc_msgSend(v6, "deleteAllMomentsWithError:", &v24);
    v8 = v24;

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_BYTE *)(v9 + 24))
      v10 = v7;
    else
      v10 = 0;
    *(_BYTE *)(v9 + 24) = v10;
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", PLMomentGenerationTargetedAssetOIDsKey);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

  v14 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
  if (v14)
  {
    v15 = v14;
    PLMomentsGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v27 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Rebuilding moments with %tu targetted assets", buf, 0xCu);
    }
  }
  else
  {
    v17 = *(void **)(a1 + 32);
    v23 = v8;
    objc_msgSend(v17, "allAssetIDsToBeIncludedInMomentsWithError:", &v23);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v23;

    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v18;

    PLMomentsGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v22 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "count");
      *(_DWORD *)buf = 134217984;
      v27 = v22;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Rebuilding for all moments with %tu assests", buf, 0xCu);
    }
    v8 = v19;
  }

}

uint64_t __69__PLMomentGeneration_rebuildAllMomentsWithOptions_completionHandler___block_invoke_93(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  CFAbsoluteTime v6;
  uint64_t result;
  int v8;
  CFAbsoluteTime v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = v2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    LOWORD(v8) = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v3, OS_SIGNPOST_INTERVAL_END, v4, "FullRebuild", ", (uint8_t *)&v8, 2u);
  }

  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 56);
    v8 = 134217984;
    v9 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment incremental rebuild finished in %.2f s", (uint8_t *)&v8, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke(uint64_t a1, void *a2, void *a3)
{
  int v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = objc_msgSend(a3, "hasSharingChanges");
  v6 = v8;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "assetWithUniqueID:error:", v8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(a1 + 40), "markHighlightNeedingNewKeyAssetsWithAsset:", v7);

    v6 = v8;
  }

}

void __245__PLMomentGeneration__runMomentAndHighlightGenerationForAssets_hiddenAssets_updatedAssetIDsForHighlights_updatedMomentIDsForHighlights_affectedMoments_highlightsWithDeletedMoments_sharedAssetContainerIncrementalChanges_insertedOrUpdatedMoments___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  const __CFString *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  char v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  int v33;
  PLSharedAssetsContainerIncrementalChange *v34;
  PLSharedAssetsContainerIncrementalChange *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id obj;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v45 = a1;
  objc_msgSend(*(id *)(a1 + 32), "assetWithUniqueID:error:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "hasSharingOrSuggestionChanges")
    || objc_msgSend(v5, "collectionChangeType")
    || (objc_msgSend(v5, "highlightContainerChanges"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    v42 = v6;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    objc_msgSend(v5, "highlightContainerChanges");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
    if (v46)
    {
      v44 = *(_QWORD *)v48;
      while (2)
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v48 != v44)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
          objc_msgSend(v11, "relationshipKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("highlightBeingAssets"));

          v14 = CFSTR("assetsCount");
          if ((v13 & 1) == 0)
          {
            objc_msgSend(v11, "relationshipKey");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("highlightBeingExtendedAssets"));

            v14 = CFSTR("extendedCount");
            if ((v16 & 1) == 0)
            {
              objc_msgSend(v11, "relationshipKey");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("highlightBeingSummaryAssets"));

              v14 = CFSTR("summaryCount");
              if ((v18 & 1) == 0)
              {
                objc_msgSend(v11, "relationshipKey");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("dayGroupHighlightBeingAssets"));

                v14 = CFSTR("dayGroupAssetsCount");
                if ((v20 & 1) == 0)
                {
                  objc_msgSend(v11, "relationshipKey");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("dayGroupHighlightBeingExtendedAssets"));

                  v14 = CFSTR("dayGroupExtendedAssetsCount");
                  if ((v22 & 1) == 0)
                  {
                    objc_msgSend(v11, "relationshipKey");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("dayGroupHighlightBeingSummaryAssets"));

                    v14 = CFSTR("dayGroupSummaryAssetsCount");
                    if ((v24 & 1) == 0)
                    {
                      PLMomentsGetLog();
                      v40 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                      {
                        objc_msgSend(v11, "relationshipKey");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138543362;
                        v52 = v41;
                        _os_log_impl(&dword_199541000, v40, OS_LOG_TYPE_ERROR, "Unexpected relationship name: %{public}@", buf, 0xCu);

                      }
                      goto LABEL_39;
                    }
                  }
                }
              }
            }
          }
          objc_msgSend(*(id *)(v45 + 32), "managedObjectContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "persistentStoreCoordinator");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "sourceHighlightURI");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "managedObjectIDForURIRepresentation:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "persistentStoreCoordinator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "destinationHighlightURI");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "managedObjectIDForURIRepresentation:", v30);
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          v32 = objc_msgSend(v5, "sharingChange");
          v33 = objc_msgSend(v5, "suggestionStateChange");
          v34 = objc_alloc_init(PLSharedAssetsContainerIncrementalChange);
          v35 = v34;
          if (v32 == 1)
            v36 = 1;
          else
            v36 = 2;
          -[PLSharedAssetsContainerIncrementalChange setSharingChange:](v34, "setSharingChange:", v36);
          if (v33 == 1)
            v37 = 1;
          else
            v37 = 2;
          -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](v35, "setSuggestionStateChange:", v37);
          -[PLSharedAssetsContainerIncrementalChange setMediaType:](v35, "setMediaType:", objc_msgSend(v5, "mediaType"));
          if (v31)
          {
            objc_msgSend(v25, "existingObjectWithID:error:", v31, 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (v38)
            {
              -[PLSharedAssetsContainerIncrementalChange setCollectionChangeType:](v35, "setCollectionChangeType:", 1);
              if (objc_msgSend(v9, "containsObject:", v38))
                -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](v35, "setSuggestionStateChange:", 0);
              objc_msgSend(v38, "reportSharedAssetContainerIncrementalChange:forAllAssetsCountKey:", v35, v14);
              objc_msgSend(v9, "addObject:", v38);
            }

          }
          if (v28)
          {
            objc_msgSend(v25, "existingObjectWithID:error:", v28, 0);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            if (v39)
            {
              -[PLSharedAssetsContainerIncrementalChange setCollectionChangeType:](v35, "setCollectionChangeType:", 2);
              if (objc_msgSend(v9, "containsObject:", v39))
                -[PLSharedAssetsContainerIncrementalChange setSuggestionStateChange:](v35, "setSuggestionStateChange:", 0);
              objc_msgSend(v39, "reportSharedAssetContainerIncrementalChange:forAllAssetsCountKey:", v35, v14);
              objc_msgSend(v9, "addObject:", v39);
            }

          }
        }
        v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v53, 16);
        if (v46)
          continue;
        break;
      }
    }
LABEL_39:

    v6 = v42;
  }
  else
  {
    objc_msgSend(v6, "reportSharedAssetIncrementalChange:", v5);
  }

}

void __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t (*__ptr32 *v33)();
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  NSObject *v46;
  id v47;
  uint64_t v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t k;
  void *v87;
  void *v88;
  char *v89;
  void *v90;
  uint64_t m;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t n;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t ii;
  void *v107;
  void *v108;
  void *v109;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t jj;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t kk;
  void *v123;
  uint64_t v124;
  uint32_t numer;
  uint32_t denom;
  NSObject *v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  NSObject *v131;
  float v132;
  id v133;
  void *v134;
  id v135;
  id v136;
  NSObject *v137;
  NSObject *v138;
  os_signpost_id_t v139;
  void *v140;
  os_signpost_id_t spid;
  uint64_t v142;
  id v143;
  unint64_t v144;
  void *v145;
  void *v146;
  NSObject *v147;
  id v148;
  id v149;
  id v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  void *v156;
  void *v157;
  id v158;
  id obj;
  uint64_t v160;
  int v161;
  uint64_t v162;
  void *v163;
  void *v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  char *v168;
  uint64_t v169;
  id v170;
  id v171;
  id v172;
  char *v173;
  unsigned int v174;
  void *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  void *context;
  void *contexta;
  void *contextb;
  id v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  id v224[6];
  id v225;
  id v226;
  id v227;
  id v228;
  id v229;
  uint64_t v230;
  mach_timebase_info info;
  _BYTE v232[128];
  _BYTE v233[128];
  _BYTE v234[128];
  _BYTE v235[128];
  _BYTE v236[128];
  _BYTE v237[128];
  _BYTE v238[128];
  uint8_t v239[128];
  uint8_t buf[4];
  const char *v241;
  __int16 v242;
  _BYTE v243[18];
  _BYTE v244[128];
  _BYTE v245[128];
  uint64_t v246;

  v246 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  v3 = os_signpost_id_generate(v2);
  info = 0;
  mach_timebase_info(&info);
  v4 = v2;
  v5 = v4;
  v144 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "CollectAffectedAssetsAndMoments", ", buf, 2u);
  }
  spid = v3;
  v147 = v5;

  v142 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(a1 + 40);
  v224[1] = (id)MEMORY[0x1E0C809B0];
  v224[2] = (id)3221225472;
  v224[3] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_37;
  v224[4] = &unk_1E3675B18;
  v224[5] = v11;
  v151 = v7;
  v225 = v151;
  v12 = v8;
  v13 = *(_QWORD *)(a1 + 56);
  v150 = v12;
  v226 = v12;
  v230 = v13;
  v14 = v6;
  v227 = v14;
  v148 = v9;
  v228 = v148;
  v149 = v10;
  v229 = v149;
  pl_dispatch_sync();
  if (objc_msgSend(*(id *)(a1 + 48), "hasChanges"))
  {
    v15 = *(void **)(a1 + 48);
    v224[0] = 0;
    v16 = objc_msgSend(v15, "save:", v224);
    v17 = v224[0];
    if ((v16 & 1) == 0)
    {
      PLMomentsGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v17, "userInfo");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v241 = (const char *)v17;
        v242 = 2112;
        *(_QWORD *)v243 = v19;
        _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "[MomentsGeneration] Error saving changes, error: %@, userInfo: %@", buf, 0x16u);

      }
    }

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "assetsWithUniqueIDs:error:", v14, 0);
  v220 = 0u;
  v221 = 0u;
  v222 = 0u;
  v223 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v245, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v221;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v221 != v24)
          objc_enumerationMutation(obj);
        v26 = *(void **)(*((_QWORD *)&v220 + 1) + 8 * i);
        v27 = (void *)MEMORY[0x19AEC1554]();
        if (v26 && (objc_msgSend(v26, "isDeleted") & 1) == 0)
        {
          if (objc_msgSend(v26, "visibilityStateIsEqualToState:", 0))
            v28 = (void *)v20;
          else
            v28 = v21;
          objc_msgSend(v28, "addObject:", v26);
        }
        objc_autoreleasePoolPop(v27);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v220, v245, 16);
    }
    while (v23);
  }
  v145 = v14;

  if (objc_msgSend(*(id *)(a1 + 48), "wantsMomentReplayLogging"))
    objc_msgSend(*(id *)(a1 + 40), "_appendAssetsToReplayLog:forBatchUpdate:", v20, 1);
  v153 = (void *)v20;
  v169 = a1;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v216 = 0u;
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v31 = v21;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v216, v244, 16);
  v33 = &off_199B99000;
  v155 = v31;
  if (!v32)
  {
    v156 = 0;
    v152 = 0;
    v57 = v31;
    goto LABEL_57;
  }
  v34 = v32;
  v156 = 0;
  v152 = 0;
  v154 = 0;
  v35 = *(_QWORD *)v217;
  v177 = *(_QWORD *)v217;
  do
  {
    for (j = 0; j != v34; ++j)
    {
      if (*(_QWORD *)v217 != v35)
        objc_enumerationMutation(v31);
      v37 = *(void **)(*((_QWORD *)&v216 + 1) + 8 * j);
      v38 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v37, "moment");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39;
      if (v39 && (objc_msgSend(v39, "isDeleted") & 1) == 0)
      {
        if (objc_msgSend(v37, "visibilityStateIsEqualToState:", 2))
        {
          objc_msgSend(v37, "globalUUID");
          v41 = objc_claimAutoreleasedReturnValue();
          if (v41)
          {
            v42 = (void *)v41;
            v43 = v156;
            if (!v156)
              v43 = (void *)objc_msgSend(*(id *)(v169 + 40), "_newPublicGlobalUUIDsToAssetsMappingWithAssets:", v153);
            v156 = v43;
            objc_msgSend(v43, "objectForKey:", v42);
            context = (void *)objc_claimAutoreleasedReturnValue();
            if (context)
            {
              objc_msgSend(v40, "assets");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = objc_msgSend(v44, "containsObject:", v37);

              v35 = v177;
              if (v45)
              {
                if (objc_msgSend(*(id *)(v169 + 40), "_isAsset:identicalToAssetForMoments:", v37, context))
                {
                  PLMomentsGetLog();
                  v46 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend(v37, "uniqueObjectID");
                    v173 = (char *)(id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(context, "uniqueObjectID");
                    v47 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v40, "uniqueObjectID");
                    v170 = (id)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v241 = v173;
                    v242 = 2112;
                    *(_QWORD *)v243 = v47;
                    *(_WORD *)&v243[8] = 2112;
                    *(_QWORD *)&v243[10] = v170;
                    _os_log_impl(&dword_199541000, v46, OS_LOG_TYPE_DEBUG, "Asset %@ was replaced by %@ in moment %@", buf, 0x20u);

                  }
                  v174 = objc_msgSend(v37, "reverseLocationDataIsValid");
                  objc_msgSend(v37, "reverseLocationData");
                  v48 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(context, "setReverseLocationDataIsValid:", v174);
                  v175 = (void *)v48;
                  objc_msgSend(context, "setReverseLocationData:", v48);
                  objc_msgSend(v40, "removeAssetData:", v37);
                  objc_msgSend(v40, "insertAssetData:", context);
                  objc_msgSend(context, "setMoment:", v40);
                  objc_msgSend(v156, "removeObjectForKey:", v42);
                  v49 = v154;
                  if (!v154)
                    v49 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                  v154 = v49;
                  v50 = v152;
                  if (!v152)
                    v50 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                  objc_msgSend(v37, "uniqueObjectID");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v152 = v50;
                  objc_msgSend(v50, "addObject:", v51);

                  objc_msgSend(v154, "addObject:", context);
                  v31 = v155;
                  v35 = v177;
LABEL_49:

                  objc_msgSend(v37, "setMoment:", 0);
                  goto LABEL_50;
                }
              }
            }

            v31 = v155;
          }
        }
        objc_msgSend(v29, "addObject:", v40);
        objc_msgSend(v157, "addObject:", v40);
        objc_msgSend(v40, "removeAssetData:", v37);
        objc_msgSend(v40, "assets");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v42, "count"))
          objc_msgSend(v30, "addObject:", v40);
        goto LABEL_49;
      }
LABEL_50:

      objc_autoreleasePoolPop(v38);
    }
    v34 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v216, v244, 16);
  }
  while (v34);

  if (!v154)
  {
    if (!v152)
    {
      v152 = 0;
      v33 = &off_199B99000;
      goto LABEL_60;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v169 + 104), *(_QWORD *)(v169 + 40), CFSTR("PLMomentGeneration.m"), 585, CFSTR("Should not have switched deleted assets without switching some inserted asset"));
    v33 = &off_199B99000;
LABEL_57:

LABEL_60:
    v54 = v153;
    v56 = v148;
    v154 = 0;
    goto LABEL_61;
  }
  v52 = objc_msgSend(v152, "count");
  if (v52 != objc_msgSend(v154, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v140 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v155;
    objc_msgSend(v140, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(v169 + 104), *(_QWORD *)(v169 + 40), CFSTR("PLMomentGeneration.m"), 572, CFSTR("Number of switched deleted assets (%lu) does not match the number of switched inserted assets (%lu)"), objc_msgSend(v152, "count"), objc_msgSend(v154, "count"), spid);

  }
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v153);
  objc_msgSend(v53, "minusSet:", v154);
  objc_msgSend(v53, "allObjects");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v148, "mutableCopy");
  objc_msgSend(v55, "removeObjectsForKeys:", v152);
  v56 = v55;

  v33 = &off_199B99000;
LABEL_61:
  if (!objc_msgSend(v56, "count")
    && !objc_msgSend(v54, "count")
    && !objc_msgSend(v30, "count")
    && !objc_msgSend(v29, "count")
    && !objc_msgSend(v151, "count")
    && !objc_msgSend(v150, "count")
    && !objc_msgSend(v149, "count"))
  {
    goto LABEL_167;
  }
  v146 = v56;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  v212 = 0u;
  v213 = 0u;
  v214 = 0u;
  v215 = 0u;
  v143 = v54;
  v167 = v54;
  v59 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v212, v239, 16);
  if (!v59)
    goto LABEL_97;
  v60 = v59;
  v61 = *(_QWORD *)v213;
  v161 = *((_QWORD *)v33 + 194);
  v165 = *(_QWORD *)v213;
  while (2)
  {
    v62 = 0;
    while (2)
    {
      if (*(_QWORD *)v213 != v61)
        objc_enumerationMutation(v167);
      v63 = *(void **)(*((_QWORD *)&v212 + 1) + 8 * v62);
      v64 = (void *)MEMORY[0x19AEC1554]();
      objc_msgSend(v63, "dateCreated");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v63, "isDeleted"))
      {
        if (v65)
        {
          v66 = v65;
          objc_msgSend(v63, "moment");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          if (v67)
          {
            objc_msgSend(v29, "addObject:", v67);
            objc_msgSend(v157, "addObject:", v67);
            objc_msgSend(v67, "removeAssetData:", v63);
            objc_msgSend(v63, "setMoment:", 0);
          }
          v178 = v64;

          v65 = v66;
LABEL_79:
          contexta = v65;
          objc_msgSend(v164, "addObject:", v65);
          objc_msgSend(v63, "highlightBeingAssets");
          v68 = objc_claimAutoreleasedReturnValue();
          v69 = v68;
          if (v68)
          {
            -[NSObject startDate](v68, "startDate");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject endDate](v69, "endDate");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (v70)
              objc_msgSend(v164, "addObject:", v70);
            if (v71)
              objc_msgSend(v164, "addObject:", v71);

          }
          goto LABEL_85;
        }
      }
      else
      {
        v178 = v64;
        if (v65)
          goto LABEL_79;
        contexta = 0;
        PLMomentsGetLog();
        v69 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        {
          v79 = objc_msgSend(v63, "isDeleted");
          v80 = *(_QWORD *)(v169 + 48);
          *(_DWORD *)buf = v161;
          v241 = (const char *)v63;
          v242 = 1024;
          *(_DWORD *)v243 = v79;
          *(_WORD *)&v243[4] = 2048;
          *(_QWORD *)&v243[6] = v80;
          _os_log_impl(&dword_199541000, v69, OS_LOG_TYPE_ERROR, "Missing dateCreated?! %@ isDeleted %d manager %p", buf, 0x1Cu);
        }
LABEL_85:

        objc_msgSend(v63, "moment");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "highlightBeingAssets");
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = (void *)v73;
        if (v72 && v73)
        {
          objc_msgSend(v72, "startDate");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v171 = (id)objc_msgSend(contexta, "compare:", v75);

          objc_msgSend(v72, "endDate");
          v76 = v60;
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(contexta, "compare:", v77);

          v60 = v76;
          v61 = v165;
          if (v171 == (id)-1 || v78 == 1)
          {
            objc_msgSend(v58, "addObject:", v63);
            objc_msgSend(v29, "addObject:", v72);
            objc_msgSend(v72, "removeAssetData:", v63);
            objc_msgSend(v63, "setMoment:", 0);
          }
        }
        else
        {
          objc_msgSend(v58, "addObject:", v63);
        }

        v64 = v178;
        v65 = contexta;
      }

      objc_autoreleasePoolPop(v64);
      if (v60 != ++v62)
        continue;
      break;
    }
    v81 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v212, v239, 16);
    v60 = v81;
    if (v81)
      continue;
    break;
  }
LABEL_97:

  v210 = 0u;
  v211 = 0u;
  v208 = 0u;
  v209 = 0u;
  v82 = v146;
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v208, v238, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v209;
    do
    {
      for (k = 0; k != v84; ++k)
      {
        if (*(_QWORD *)v209 != v85)
          objc_enumerationMutation(v82);
        objc_msgSend(v82, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v208 + 1) + 8 * k));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("dateCreated"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        if (v88)
          objc_msgSend(v164, "addObject:", v88);

      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v208, v238, 16);
    }
    while (v84);
  }

  objc_msgSend(v164, "sortUsingSelector:", sel_compare_);
  objc_msgSend((id)objc_opt_class(), "dateIntervalsAroundSortedDates:minimumIntervalDuration:", v164, 115200.0);
  v204 = 0u;
  v205 = 0u;
  v206 = 0u;
  v207 = 0u;
  v158 = (id)objc_claimAutoreleasedReturnValue();
  v162 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v204, v237, 16);
  if (v162)
  {
    v160 = *(_QWORD *)v205;
    do
    {
      v89 = 0;
      do
      {
        if (*(_QWORD *)v205 != v160)
          objc_enumerationMutation(v158);
        v168 = v89;
        v166 = *(_QWORD *)(*((_QWORD *)&v204 + 1) + 8 * (_QWORD)v89);
        objc_msgSend(*(id *)(v169 + 48), "highlightsIntersectingDateInterval:ofKind:");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v200 = 0u;
        v201 = 0u;
        v202 = 0u;
        v203 = 0u;
        v172 = v90;
        v179 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v200, v236, 16);
        if (v179)
        {
          v176 = *(_QWORD *)v201;
          do
          {
            for (m = 0; m != v179; ++m)
            {
              if (*(_QWORD *)v201 != v176)
                objc_enumerationMutation(v172);
              v92 = *(void **)(*((_QWORD *)&v200 + 1) + 8 * m);
              contextb = (void *)MEMORY[0x19AEC1554]();
              objc_msgSend(v92, "moments");
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              v196 = 0u;
              v197 = 0u;
              v198 = 0u;
              v199 = 0u;
              v94 = v93;
              v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v196, v235, 16);
              if (v95)
              {
                v96 = v95;
                v97 = *(_QWORD *)v197;
                do
                {
                  for (n = 0; n != v96; ++n)
                  {
                    if (*(_QWORD *)v197 != v97)
                      objc_enumerationMutation(v94);
                    v99 = *(void **)(*((_QWORD *)&v196 + 1) + 8 * n);
                    objc_msgSend(v29, "addObject:", v99);
                    objc_msgSend(v99, "assets");
                    v100 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v100, "count"))
                      objc_msgSend(v58, "unionSet:", v100);
                    else
                      objc_msgSend(v30, "addObject:", v99);

                  }
                  v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v196, v235, 16);
                }
                while (v96);
              }

              objc_autoreleasePoolPop(contextb);
            }
            v179 = objc_msgSend(v172, "countByEnumeratingWithState:objects:count:", &v200, v236, 16);
          }
          while (v179);
        }

        objc_msgSend(*(id *)(v169 + 48), "momentsIntersectingDateInterval:", v166);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        v195 = 0u;
        v102 = v101;
        v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v192, v234, 16);
        if (v103)
        {
          v104 = v103;
          v105 = *(_QWORD *)v193;
          do
          {
            for (ii = 0; ii != v104; ++ii)
            {
              if (*(_QWORD *)v193 != v105)
                objc_enumerationMutation(v102);
              v107 = *(void **)(*((_QWORD *)&v192 + 1) + 8 * ii);
              v108 = (void *)MEMORY[0x19AEC1554]();
              objc_msgSend(v29, "addObject:", v107);
              objc_msgSend(v107, "assets");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v109, "count"))
                objc_msgSend(v58, "unionSet:", v109);
              else
                objc_msgSend(v30, "addObject:", v107);

              objc_autoreleasePoolPop(v108);
            }
            v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v192, v234, 16);
          }
          while (v104);
        }

        v89 = v168 + 1;
      }
      while (v168 + 1 != (char *)v162);
      v162 = objc_msgSend(v158, "countByEnumeratingWithState:objects:count:", &v204, v237, 16);
    }
    while (v162);
  }

  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  v110 = v30;
  v111 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v188, v233, 16);
  if (v111)
  {
    v112 = v111;
    v113 = *(_QWORD *)v189;
    do
    {
      for (jj = 0; jj != v112; ++jj)
      {
        if (*(_QWORD *)v189 != v113)
          objc_enumerationMutation(v110);
        v115 = *(void **)(*((_QWORD *)&v188 + 1) + 8 * jj);
        objc_msgSend(v115, "highlight");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "parentDayGroupPhotosHighlight");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (v116)
          objc_msgSend(v163, "addObject:", v116);
        if (v117)
          objc_msgSend(v163, "addObject:", v117);
        objc_msgSend(v115, "delete");

      }
      v112 = objc_msgSend(v110, "countByEnumeratingWithState:objects:count:", &v188, v233, 16);
    }
    while (v112);
  }

  v186 = 0u;
  v187 = 0u;
  v184 = 0u;
  v185 = 0u;
  v118 = v157;
  v119 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v184, v232, 16);
  if (v119)
  {
    v120 = v119;
    v121 = *(_QWORD *)v185;
    do
    {
      for (kk = 0; kk != v120; ++kk)
      {
        if (*(_QWORD *)v185 != v121)
          objc_enumerationMutation(v118);
        objc_msgSend(*(id *)(*((_QWORD *)&v184 + 1) + 8 * kk), "assets");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "unionSet:", v123);

      }
      v120 = objc_msgSend(v118, "countByEnumeratingWithState:objects:count:", &v184, v232, 16);
    }
    while (v120);
  }

  v124 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v127 = v147;
  v128 = v127;
  if (v144 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
  {
    v129 = objc_msgSend(v58, "count");
    v130 = objc_msgSend(v29, "count");
    *(_DWORD *)buf = 134218240;
    v241 = (const char *)v129;
    v242 = 2048;
    *(_QWORD *)v243 = v130;
    _os_signpost_emit_with_name_impl(&dword_199541000, v128, OS_SIGNPOST_INTERVAL_END, spid, "CollectAffectedAssetsAndMoments", "affectedAssets: %lu, affectedMoments %lu", buf, 0x16u);
  }

  v131 = v128;
  v31 = v155;
  if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
  {
    v132 = (float)((float)((float)(v124 - v142) * (float)numer) / (float)denom) / 1000000.0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("affectedAssets: %lu, affectedMoments %lu"), objc_msgSend(v58, "count"), objc_msgSend(v29, "count"));
    v133 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v241 = "CollectAffectedAssetsAndMoments";
    v242 = 2112;
    *(_QWORD *)v243 = v133;
    *(_WORD *)&v243[8] = 2048;
    *(double *)&v243[10] = v132;
    _os_log_impl(&dword_199541000, v131, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  v134 = *(void **)(v169 + 40);
  v183 = 0;
  objc_msgSend(v134, "_runMomentAndHighlightGenerationForAssets:hiddenAssets:updatedAssetIDsForHighlights:updatedMomentIDsForHighlights:affectedMoments:highlightsWithDeletedMoments:sharedAssetContainerIncrementalChanges:insertedOrUpdatedMoments:", v58, v155, v151, v150, v29, v163, v149, &v183);
  v135 = v183;
  v136 = v183;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v169 + 64) + 8) + 40), v135);
  mach_timebase_info((mach_timebase_info_t)(*(_QWORD *)(*(_QWORD *)(v169 + 72) + 8) + 32));
  v137 = *(id *)(*(_QWORD *)(*(_QWORD *)(v169 + 80) + 8) + 40);
  v138 = v137;
  v139 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v169 + 88) + 8) + 24);
  if (v139 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v137))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v138, OS_SIGNPOST_INTERVAL_BEGIN, v139, "ExecuteLibraryBatchTransaction", ", buf, 2u);
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v169 + 96) + 8) + 24) = mach_absolute_time();
  v54 = v143;
  v56 = v146;
LABEL_167:

}

uint64_t __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_58(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  float v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t result;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
  v3 = mach_absolute_time();
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(_DWORD *)(v5 + 32);
  v6 = *(_DWORD *)(v5 + 36);
  v8 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v9 = v8;
  v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v9, OS_SIGNPOST_INTERVAL_END, v10, "ExecuteLibraryBatchTransaction", ", buf, 2u);
  }

  v11 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "ExecuteLibraryBatchTransaction";
    v27 = 2048;
    v28 = (float)((float)((float)((float)(v3 - v4) * (float)v7) / (float)v6) / 1000000.0);
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v12 = mach_absolute_time();
  v13 = *(_QWORD *)(a1 + 88);
  v15 = *(_DWORD *)(a1 + 104);
  v14 = *(_DWORD *)(a1 + 108);
  v16 = *(id *)(a1 + 32);
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 96);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_DWORD *)buf = 134217984;
    v26 = (const char *)v2;
    _os_signpost_emit_with_name_impl(&dword_199541000, v17, OS_SIGNPOST_INTERVAL_END, v18, "IncrementalMomentGeneration", "updatedMoments: %lu", buf, 0xCu);
  }

  v19 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (float)((float)((float)(v12 - v13) * (float)v15) / (float)v14) / 1000000.0;
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = v19;
    objc_msgSend(v21, "stringWithFormat:", CFSTR("updatedMoments: %lu"), v2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v26 = "IncrementalMomentGeneration";
    v27 = 2112;
    v28 = *(double *)&v23;
    v29 = 2048;
    v30 = v20;
    _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", buf, 0x20u);

  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _BYTE *v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  uint8_t v60[128];
  _BYTE buf[24];
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count"))
  {
    v2 = (void *)MEMORY[0x19AEC1554]();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    v5 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(v3 + 16), "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "minusSet:", v7);

    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_2;
    v58[3] = &unk_1E3675AA0;
    v59 = v8;
    v10 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v58);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "minusSet:", v10);

    objc_autoreleasePoolPop(v2);
  }
  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObjectsFromArray:", v12);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  v13 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObjectsFromArray:", v14);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                                 + 24))
  {
    v15 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v17 = v15 - v16;
    objc_msgSend(MEMORY[0x1E0C99E40], "orderedSetWithOrderedSet:range:copyItems:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), v15 - v16, v16, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectsInRange:", v17, v16);
    v19 = *(void **)(a1 + 56);
    objc_msgSend(v18, "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

  }
  else
  {
    v21 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "array");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
    && (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count") > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                                 + 24))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v62 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_3;
    v53[3] = &unk_1E3675AC8;
    v54 = *(id *)(a1 + 64);
    v25 = v23;
    v55 = v25;
    v56 = buf;
    v57 = *(_QWORD *)(a1 + 80);
    objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v53);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectsForKeys:", v25);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 64), "setDictionary:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  }
  v26 = objc_msgSend(*(id *)(a1 + 56), "count");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = objc_msgSend(*(id *)(a1 + 64), "count") + v26;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 56), "count"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v28 = *(id *)(a1 + 56);
  v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
  if (v29)
  {
    v30 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v50 != v30)
          objc_enumerationMutation(v28);
        v32 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v33;
        if (v33)
        {
          if ((objc_msgSend(v33, "hasChangesAffectingSharingComposition") & 1) == 0
            && objc_msgSend(v34, "hasNoOtherAssetChangesRequiringMomentGeneration"))
          {
            objc_msgSend(v27, "addObject:", v32);
          }
          objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v34, v32);
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", v32);
        }

      }
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v49, v60, 16);
    }
    while (v29);
  }

  objc_msgSend(*(id *)(a1 + 56), "removeObjectsInArray:", v27);
  if (!objc_msgSend(*(id *)(a1 + 72), "count") && objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v36 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_4;
    v45[3] = &unk_1E3675AF0;
    v46 = *(id *)(a1 + 72);
    v47 = v35;
    v48 = *(_QWORD *)(a1 + 80);
    v37 = v35;
    objc_msgSend(v36, "enumerateKeysAndObjectsUsingBlock:", v45);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectsForKeys:", v37);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") || objc_msgSend(*(id *)(a1 + 72), "count"))
  {
    PLMomentsGetLog();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_msgSend(*(id *)(a1 + 72), "count");
      v40 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v39;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v40;
      _os_log_impl(&dword_199541000, v38, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Identified %lu shared asset container changes for current batch. %lu remain", buf, 0x16u);
    }

  }
  PLMomentsGetLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = *(_QWORD *)(a1 + 32);
    v43 = *(_QWORD *)(v42 + 8);
    v44 = objc_msgSend(*(id *)(v42 + 16), "count");
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v43;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v44;
    _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Beginning moment generation pass with %lu changes. %lu remain", buf, 0x16u);
  }

}

uint64_t __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "setObject:forKey:", a3, v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  if (++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 24))
    *a4 = 1;
}

unint64_t __73__PLMomentGeneration__runIncrementalGenerationPassWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  unint64_t result;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", a3, v8);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result >= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *a4 = 1;
  return result;
}

void __67__PLMomentGeneration_generateWithIncrementalDataCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v3 = (void *)MEMORY[0x19AEC174C]();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __173__PLMomentGeneration_saveChangesForAssetInsertsAndUpdates_assetDeletes_assetUpdatesForHighlights_momentUpdatesForHighlights_sharedAssetContainerIncrementalChangesByAssetID___block_invoke(_QWORD *a1)
{
  void *v2;
  _QWORD v4[5];

  objc_msgSend(*(id *)(a1[4] + 16), "addObjectsFromArray:", a1[5]);
  objc_msgSend(*(id *)(a1[4] + 24), "addEntriesFromDictionary:", a1[6]);
  objc_msgSend(*(id *)(a1[4] + 32), "addObjectsFromArray:", a1[7]);
  objc_msgSend(*(id *)(a1[4] + 40), "addObjectsFromArray:", a1[8]);
  v2 = (void *)a1[9];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __173__PLMomentGeneration_saveChangesForAssetInsertsAndUpdates_assetDeletes_assetUpdatesForHighlights_momentUpdatesForHighlights_sharedAssetContainerIncrementalChangesByAssetID___block_invoke_2;
  v4[3] = &unk_1E3677E90;
  v4[4] = a1[4];
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __173__PLMomentGeneration_saveChangesForAssetInsertsAndUpdates_assetDeletes_assetUpdatesForHighlights_momentUpdatesForHighlights_sharedAssetContainerIncrementalChangesByAssetID___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "mergeChangesFrom:", v6);
  else
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKeyedSubscript:", v6, v9);

}

uint64_t __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke(uint64_t result)
{
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40))
    return pl_dispatch_async();
  return result;
}

uint64_t __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  CFAbsoluteTime v3;
  void *v4;
  uint64_t v5;
  char v6;
  id obj;
  uint8_t buf[4];
  CFAbsoluteTime v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLMomentsGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 80);
    *(_DWORD *)buf = 134217984;
    v10 = v3;
    _os_log_impl(&dword_199541000, v2, OS_LOG_TYPE_DEFAULT, "[MomentsGeneration] Moment generation pass completed in %.2f s", buf, 0xCu);
  }

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v4, "_hasWorkWorkRemainingWithCompletionBlocks:", &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    objc_msgSend(*(id *)(a1 + 40), "update");
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __85__PLMomentGeneration__runIncrementalMomentGenerationIfItemsArePendingWithCompletion___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

uint64_t __64__PLMomentGeneration__hasWorkWorkRemainingWithCompletionBlocks___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count");
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (v2 | v3 | v4 | v5 | result) != 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeAllObjects");
    return objc_msgSend(*(id *)(a1 + 32), "releaseMemoryIntensiveObjects");
  }
  return result;
}

id __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newFrequentLocationManager");
  else
    v3 = 0;

  return v3;
}

id __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newLocalCreationDateCreator");
  else
    v3 = 0;

  return v3;
}

void __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_initWeak(&location, WeakRetained);
  PLMomentsGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = CFSTR("MomentGeneration");
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_DEFAULT, "[MomentGenerationThrottle] %{public}@ executing target, waiting for completion...", buf, 0xCu);
  }

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_32;
  v7[3] = &unk_1E3675A00;
  objc_copyWeak(&v9, &location);
  v6 = v3;
  v8 = v6;
  objc_msgSend(WeakRetained, "_runIncrementalMomentGenerationIfItemsArePendingWithCompletion:", v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __72__PLMomentGeneration_initWithMomentGenerationDataManager_bundle_locale___block_invoke_32(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  double v4;
  double v5;
  id *v6;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained[11], "timeProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentTime");
    v5 = v4;

    (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v5);
    WeakRetained = v6;
  }

}

+ (id)dateIntervalsAroundSortedDates:(id)a3 minimumIntervalDuration:(double)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a4 * 0.5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -(a4 * 0.5);
    objc_msgSend(v6, "dateByAddingTimeInterval:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v6;
    objc_msgSend(v6, "dateByAddingTimeInterval:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v5;
    v12 = v5;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        v17 = v10;
        v18 = v11;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v12);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v16);
          if (objc_msgSend(v18, "compare:", v19) == -1)
          {
            v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v17);
            objc_msgSend(v27, "addObject:", v20);
            objc_msgSend(v19, "dateByAddingTimeInterval:", v8);
            v21 = objc_claimAutoreleasedReturnValue();

            v9 = (void *)v21;
          }
          objc_msgSend(v19, "dateByAddingTimeInterval:", v7);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v10, "dateByAddingTimeInterval:", v7);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          ++v16;
          v17 = v10;
          v18 = v11;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v14);
    }

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
    objc_msgSend(v27, "addObject:", v22);
    v23 = v27;

    v5 = v26;
  }
  else
  {
    v23 = (id)MEMORY[0x1E0C9AA60];
  }

  return v23;
}

@end
