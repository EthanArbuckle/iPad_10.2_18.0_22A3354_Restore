@implementation PEEditActionBatch

- (PEEditActionBatch)initWithAssets:(id)a3 actionMap:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  PEEditActionBatch *v11;
  PEEditActionBatch *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PEEditActionBatch;
  v11 = -[PEEditActionBatch init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    -[PEEditActionBatch _setupWithActionMap:assets:progress:](v11, "_setupWithActionMap:assets:progress:", v9, v8, v10);
    v12->_actionType = 1;
  }

  return v12;
}

- (PEEditActionBatch)initWithAssets:(id)a3 action:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  id v10;
  PEEditActionBatch *v11;
  void *v12;
  objc_super v14;
  const __CFString *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PEEditActionBatch;
  v11 = -[PEEditActionBatch init](&v14, sel_init);
  if (v11)
  {
    if (v9)
    {
      v15 = CFSTR("PESingleActionKey");
      v16[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    -[PEEditActionBatch _setupWithActionMap:assets:progress:](v11, "_setupWithActionMap:assets:progress:", v12, v8, v10);
    v11->_actionType = objc_msgSend(v9, "actionType");

  }
  return v11;
}

- (void)runActionWithBatchSize:(unint64_t)a3 completion:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  NSArray *v9;
  unint64_t v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *loadingIdMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *progressMap;
  unint64_t v15;
  NSObject *loadingQueue;
  id v17;
  NSArray *v18;
  _QWORD v19[4];
  NSArray *v20;
  PEEditActionBatch *v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;

  v6 = a4;
  self->_state = 1;
  v7 = -[PEEditActionBatch actionType](self, "actionType");
  -[PEEditActionBatch delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "batch:willStartAction:", self, v7);

  v9 = self->_assets;
  v10 = -[NSArray count](v9, "count");
  v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v10);
  loadingIdMap = self->_loadingIdMap;
  self->_loadingIdMap = v11;

  v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v10);
  progressMap = self->_progressMap;
  self->_progressMap = v13;

  if (v10 >= a3)
    v15 = a3;
  else
    v15 = v10;
  loadingQueue = self->_loadingQueue;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke;
  v19[3] = &unk_24C618C68;
  v24 = v15;
  v25 = v10;
  v20 = v9;
  v21 = self;
  v22 = v6;
  v23 = vcvtpd_u64_f64((double)v10 / (double)v15);
  v17 = v6;
  v18 = v9;
  dispatch_async(loadingQueue, v19);

}

- (void)cancel
{
  int64_t v3;
  NSObject *v4;
  NSObject *v5;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  int64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = -[PEEditActionBatch state](self, "state");
  PLPhotoEditGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3 == 1)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v5, OS_LOG_TYPE_INFO, "PEEditActionBatch: Canceled.", buf, 2u);
    }

    self->_state = 3;
    -[PEResourceManager cancelAllRequests](self->_resourceManager, "cancelAllRequests");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = self->_mediaRequestIds;
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          -[PEPhotoKitMediaDestination cancelRequestWithIdentifier:](self->_mediaDestination, "cancelRequestWithIdentifier:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "intValue", (_QWORD)v11));
        }
        while (v8 != v10);
        v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[PEEditActionBatch _cancelLoading](self, "_cancelLoading");
  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v3;
      _os_log_impl(&dword_20D13D000, v5, OS_LOG_TYPE_ERROR, "PEEditActionBatch: Attempted to cancel, but batch is not in progress. PEEditActionBatchState: %lu", buf, 0xCu);
    }

  }
}

- (BOOL)hasAssets
{
  return -[NSArray count](self->_assets, "count") != 0;
}

- (void)_setupWithActionMap:(id)a3 assets:(id)a4 progress:(id)a5
{
  NSDictionary *v8;
  NSArray *v9;
  NSProgress *v10;
  NSDictionary *actionMap;
  NSArray *assets;
  NSArray *v13;
  OS_dispatch_queue *v14;
  OS_dispatch_queue *loadingQueue;
  PEResourceManager *v16;
  PEResourceManager *resourceManager;
  PEPhotoKitMediaDestination *v18;
  PEPhotoKitMediaDestination *mediaDestination;
  NSMutableSet *v20;
  NSMutableSet *mediaRequestIds;
  NSProgress *progress;
  NSDictionary *v23;

  v8 = (NSDictionary *)a3;
  v9 = (NSArray *)a4;
  v10 = (NSProgress *)a5;
  self->_state = 0;
  actionMap = self->_actionMap;
  self->_actionMap = v8;
  v23 = v8;

  assets = self->_assets;
  self->_assets = v9;
  v13 = v9;

  v14 = (OS_dispatch_queue *)dispatch_queue_create("PEEditActionBatch", 0);
  loadingQueue = self->_loadingQueue;
  self->_loadingQueue = v14;

  v16 = objc_alloc_init(PEResourceManager);
  resourceManager = self->_resourceManager;
  self->_resourceManager = v16;

  v18 = objc_alloc_init(PEPhotoKitMediaDestination);
  mediaDestination = self->_mediaDestination;
  self->_mediaDestination = v18;

  v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
  mediaRequestIds = self->_mediaRequestIds;
  self->_mediaRequestIds = v20;

  -[NSProgress setTotalUnitCount:](v10, "setTotalUnitCount:", 100);
  progress = self->_progress;
  self->_progress = v10;

}

- (id)_presetForAsset:(id)a3
{
  NSDictionary *actionMap;
  void *v5;
  void *v6;

  actionMap = self->_actionMap;
  objc_msgSend(a3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKey:](actionMap, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[NSDictionary objectForKey:](self->_actionMap, "objectForKey:", CFSTR("PESingleActionKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_processAssets:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  PEEditActionResult *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v19;
  id obj;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  PEEditActionBatch *v24;
  NSObject *v25;
  id v26;
  void *v27;
  _QWORD *v28;
  uint8_t *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[5];
  PEEditActionResult *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id location;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  PLPhotoEditGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D13D000, v4, OS_LOG_TYPE_INFO, "PEEditActionBatch _processAssets:", buf, 2u);
  }

  if (-[PEEditActionBatch state](self, "state") == 3)
  {
    PLPhotoEditGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v5, OS_LOG_TYPE_INFO, "PEEditActionBatch: Skipping _processAssets due to batch cancelation", buf, 2u);
    }

    v6 = 0;
  }
  else
  {
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__1830;
    v45 = __Block_byref_object_dispose__1831;
    v46 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v19, "count"));
    objc_initWeak(&location, self);
    v7 = dispatch_group_create();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = v19;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    if (v8)
    {
      v21 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v37 != v21)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          -[PEEditActionBatch _presetForAsset:](self, "_presetForAsset:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v34[0] = 0;
          v34[1] = v34;
          v34[2] = 0x3032000000;
          v34[3] = __Block_byref_object_copy__1830;
          v34[4] = __Block_byref_object_dispose__1831;
          v12 = [PEEditActionResult alloc];
          objc_msgSend(v10, "uuid");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = -[PEEditActionResult initWithAssetUUID:targetAction:](v12, "initWithAssetUUID:targetAction:", v13, v11);

          -[PEEditActionBatch _processWillBeginWithAsset:progress:](self, "_processWillBeginWithAsset:progress:", v10, 0.01);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          dispatch_group_enter(v7);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __36__PEEditActionBatch__processAssets___block_invoke;
          v31[3] = &unk_24C618C90;
          objc_copyWeak(&v33, &location);
          v15 = v14;
          v32 = v15;
          v22[0] = MEMORY[0x24BDAC760];
          v22[1] = 3221225472;
          v22[2] = __36__PEEditActionBatch__processAssets___block_invoke_2;
          v22[3] = &unk_24C618CE0;
          objc_copyWeak(&v30, &location);
          v16 = v15;
          v23 = v16;
          v24 = self;
          v25 = v7;
          v28 = v34;
          v17 = v11;
          v29 = buf;
          v26 = v17;
          v27 = v10;
          -[PEEditActionBatch _requestResourcesForAsset:progressHandler:resultHandler:](self, "_requestResourcesForAsset:progressHandler:resultHandler:", v10, v31, v22);

          objc_destroyWeak(&v30);
          objc_destroyWeak(&v33);

          _Block_object_dispose(v34, 8);
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
      }
      while (v8);
    }

    dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
    v6 = *((id *)v42 + 5);

    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);

  }
  return v6;
}

- (void)_requestResourcesForAsset:(id)a3 progressHandler:(id)a4 resultHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  NSObject *v12;
  PEResourceManager *resourceManager;
  uint64_t v14;
  id v15;
  NSObject *v16;
  PEResourceManager *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  NSObject *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1830;
  v39 = __Block_byref_object_dispose__1831;
  v40 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__1830;
  v33 = __Block_byref_object_dispose__1831;
  v34 = 0;
  v11 = -[PEEditActionBatch forceRunAsUnadjustedAsset](self, "forceRunAsUnadjustedAsset");
  v12 = dispatch_group_create();
  dispatch_group_enter(v12);
  resourceManager = self->_resourceManager;
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke;
  v24[3] = &unk_24C618D08;
  v27 = &v35;
  v28 = &v29;
  v15 = v8;
  v25 = v15;
  v16 = v12;
  v26 = v16;
  -[PEResourceManager loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:](resourceManager, "loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:", v15, 1, v11, v9, v24);
  dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  if (v11)
  {
    v17 = self->_resourceManager;
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke_2;
    v19[3] = &unk_24C618D70;
    v20 = v15;
    v22 = &v35;
    v21 = v10;
    v23 = &v29;
    -[PEResourceManager loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:](v17, "loadResourceForAsset:requireLocalResources:forceRunAsUnadjustedAsset:progressHandler:resultHandler:", v20, 1, 0, &__block_literal_global_1847, v19);

  }
  else
  {
    objc_msgSend((id)v36[5], "compositionController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v36[5], "setAdjustedSourceCompositionController:", v18);

    (*((void (**)(id, uint64_t, uint64_t))v10 + 2))(v10, v36[5], v30[5]);
  }

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);

}

- (void)_processResult:(id)a3 targetPreset:(id)a4 completion:(id)a5
{
  id v8;
  PEAdjustmentPreset *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  PEAdjustmentPreset *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id location;

  v8 = a3;
  v9 = (PEAdjustmentPreset *)a4;
  v10 = a5;
  objc_msgSend(v8, "compositionController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  if (!v9)
  {
    v12 = objc_alloc(MEMORY[0x24BE71C40]);
    objc_msgSend(v8, "originalComposition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithComposition:", v13);

    v15 = [PEAdjustmentPreset alloc];
    objc_msgSend(v8, "asset");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PEAdjustmentPreset initWithCompositionController:asset:](v15, "initWithCompositionController:asset:", v14, v16);

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke;
  v20[3] = &unk_24C618DC0;
  objc_copyWeak(&v24, &location);
  v17 = v11;
  v21 = v17;
  v18 = v8;
  v22 = v18;
  v19 = v10;
  v23 = v19;
  -[PEAdjustmentPreset applyToLoadResult:completion:](v9, "applyToLoadResult:completion:", v18, v20);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_commitComposition:(id)a3 toResource:(id)a4 changeType:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  PEPhotoKitMediaDestination *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v19;
  uint64_t v20;
  NSMutableSet *mediaRequestIds;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  NSMutableSet *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint8_t buf[4];
  int64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (-[PEEditActionBatch state](self, "state") == 3)
  {
    PLPhotoEditGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v14 = "PEEditActionBatch commit: cancelled";
LABEL_9:
      _os_log_impl(&dword_20D13D000, v13, OS_LOG_TYPE_INFO, v14, buf, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (a5)
  {
    objc_msgSend(v11, "asset");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(PEPhotoKitMediaDestination);
    if (objc_msgSend(MEMORY[0x24BE71F80], "isIdentityCompositionController:", v10))
    {
      objc_msgSend(v10, "slomoAdjustmentController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 == 0;

    }
    else
    {
      v18 = 0;
    }
    if (a5 == 2 || v18)
    {
      v37[0] = MEMORY[0x24BDAC760];
      v37[1] = 3221225472;
      v37[2] = __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke;
      v37[3] = &unk_24C618DE8;
      v38 = v12;
      v20 = -[PEPhotoKitMediaDestination revertEditsForAsset:completionHandler:](v16, "revertEditsForAsset:completionHandler:", v15, v37);
      mediaRequestIds = self->_mediaRequestIds;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](mediaRequestIds, "addObject:", v22);

      v23 = v38;
    }
    else if (a5 == 1)
    {
      if (-[PEEditActionBatch actionType](self, "actionType") == 4)
        v19 = 1;
      else
        v19 = objc_msgSend(v11, "retrievedVersion");
      objc_msgSend(v11, "contentEditingInput");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      +[PESerializationUtility contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:](PESerializationUtility, "contentEditingOutputForContentEditingInput:compositionController:asset:async:onlyChangingOriginalChoice:", v25, v10, v15, -[PEEditActionBatch async](self, "async"), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = 0;
      if (objc_msgSend(v15, "isLivePhoto"))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v15;
          objc_msgSend(v27, "fetchPropertySetsIfNeeded");
          objc_msgSend(v27, "photoIrisProperties");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v26 = objc_msgSend(v28, "photoIrisVisibilityState");
        }
        else
        {
          v26 = 0;
        }
      }
      v32 = MEMORY[0x24BDAC760];
      v33 = 3221225472;
      v34 = __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke_42;
      v35 = &unk_24C618DE8;
      v36 = v12;
      v29 = -[PEPhotoKitMediaDestination saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:](v16, "saveInternalEditsForAsset:usingCompositionController:contentEditingOutput:version:livePhotoState:completionHandler:", v15, v10, v23, v19, v26, &v32);
      v30 = self->_mediaRequestIds;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v29, v32, v33, v34, v35);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](v30, "addObject:", v31);

    }
    else
    {
      PLPhotoEditGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v40 = a5;
        _os_log_impl(&dword_20D13D000, v24, OS_LOG_TYPE_ERROR, "PEEditActionBatch commit: finished with unexpected change type: %lu", buf, 0xCu);
      }

      if (!v12)
        goto LABEL_29;
      objc_msgSend(v11, "asset");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v23, 0);
    }

LABEL_29:
    goto LABEL_30;
  }
  PLPhotoEditGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    v14 = "PEEditActionBatch commit: no asset changes to commit";
    goto LABEL_9;
  }
LABEL_10:

  objc_msgSend(v11, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))v12 + 2))(v12, v15, 0);
LABEL_30:

}

- (id)_processWillBeginWithAsset:(id)a3 progress:(double)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  double v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  -[PEEditActionBatch loadingStatusManager](self, "loadingStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__1830;
  v21 = __Block_byref_object_dispose__1831;
  v22 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__PEEditActionBatch__processWillBeginWithAsset_progress___block_invoke;
  v12[3] = &unk_24C618E10;
  v15 = &v17;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v16 = a4;
  +[PESupport syncMainThread:](PESupport, "syncMainThread:", v12);
  v10 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (void)_processDidUpdateWithID:(id)a3 progress:(double)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  double v13;

  v6 = a3;
  -[PEEditActionBatch _updateProgress:forLoadingID:](self, "_updateProgress:forLoadingID:", v6, a4);
  -[PEEditActionBatch loadingStatusManager](self, "loadingStatusManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __54__PEEditActionBatch__processDidUpdateWithID_progress___block_invoke;
  v10[3] = &unk_24C618E38;
  v11 = v7;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = v7;
  +[PESupport syncMainThread:](PESupport, "syncMainThread:", v10);

}

- (void)_processDidCompleteWithID:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  PEEditActionBatch *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[PEEditActionBatch _updateProgress:forLoadingID:](self, "_updateProgress:forLoadingID:", v6, 1.0);
    -[PEEditActionBatch loadingStatusManager](self, "loadingStatusManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __53__PEEditActionBatch__processDidCompleteWithID_error___block_invoke;
    v10[3] = &unk_24C6190A8;
    v11 = v6;
    v12 = self;
    v13 = v8;
    v14 = v7;
    v9 = v8;
    +[PESupport syncMainThread:](PESupport, "syncMainThread:", v10);

  }
}

- (void)_cancelLoading
{
  void *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  -[PEEditActionBatch loadingStatusManager](self, "loadingStatusManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __35__PEEditActionBatch__cancelLoading__block_invoke;
  v5[3] = &unk_24C618E60;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  +[PESupport syncMainThread:](PESupport, "syncMainThread:", v5);

}

- (void)_updateProgress:(double)a3 forLoadingID:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  double v10;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __50__PEEditActionBatch__updateProgress_forLoadingID___block_invoke;
  v8[3] = &unk_24C618E38;
  v10 = a3;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  +[PESupport syncMainThread:](PESupport, "syncMainThread:", v8);

}

- (PELoadingStatusDelegate)loadingStatusManager
{
  return (PELoadingStatusDelegate *)objc_loadWeakRetained((id *)&self->_loadingStatusManager);
}

- (void)setLoadingStatusManager:(id)a3
{
  objc_storeWeak((id *)&self->_loadingStatusManager, a3);
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)forceRunAsUnadjustedAsset
{
  return self->_forceRunAsUnadjustedAsset;
}

- (void)setForceRunAsUnadjustedAsset:(BOOL)a3
{
  self->_forceRunAsUnadjustedAsset = a3;
}

- (BOOL)async
{
  return self->_async;
}

- (void)setAsync:(BOOL)a3
{
  self->_async = a3;
}

- (int64_t)actionType
{
  return self->_actionType;
}

- (int64_t)state
{
  return self->_state;
}

- (PEEditActionBatchDelegate)delegate
{
  return (PEEditActionBatchDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_destroyWeak((id *)&self->_loadingStatusManager);
  objc_storeStrong((id *)&self->_mediaDestination, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_mediaRequestIds, 0);
  objc_storeStrong((id *)&self->_progressMap, 0);
  objc_storeStrong((id *)&self->_loadingIdMap, 0);
  objc_storeStrong((id *)&self->_actionMap, 0);
}

void __50__PEEditActionBatch__updateProgress_forLoadingID___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  float v12;
  double v13;
  void *v14;
  unint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v3 = *(double *)(a1 + 48);
  *(float *)&v3 = v3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v4, *(_QWORD *)(a1 + 40));

  v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "count");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "floatValue");
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v13 = v10 / (double)v5;
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = llround(v13 * (double)objc_msgSend(v14, "totalUnitCount"));
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCompletedUnitCount:", v15);

}

uint64_t __35__PEEditActionBatch__cancelLoading__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "didCancelLoadOperationWithTrackingID:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");
}

uint64_t __53__PEEditActionBatch__processDidCompleteWithID_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(result + 32))
  {
    v1 = result;
    objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 16), "removeObjectForKey:");
    return objc_msgSend(*(id *)(v1 + 48), "didCompleteLoadOperationWithTrackingID:withSuccess:error:", *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 56) == 0);
  }
  return result;
}

uint64_t __54__PEEditActionBatch__processDidUpdateWithID_progress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didUpdateLoadOperationWithTrackingID:withProgress:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

void __57__PEEditActionBatch__processWillBeginWithAsset_progress___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    goto LABEL_2;
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
  {
    objc_msgSend(v7, "willBeginLoadOperationWithItemIdentifier:", v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
  else
  {
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v8;
    v9 = v14;
  }

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v15)
  {
    v16 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v15, v17);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
LABEL_2:
      objc_msgSend(*(id *)(a1 + 32), "_processDidUpdateWithID:progress:", *(double *)(a1 + 64));
  }
}

void __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_ERROR, "PEEditActionBatch commit: failed to revert adjustments with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PEEditActionBatch commit: reverted adjustments on asset: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void __73__PEEditActionBatch__commitComposition_toResource_changeType_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_ERROR, "PEEditActionBatch commit: failed to save adjustments with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543362;
    v12 = v9;
    _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PEEditActionBatch commit: saved adjustments on asset: %{public}@", (uint8_t *)&v11, 0xCu);

  }
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v5, v6);

}

void __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke(id *a1, void *a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  id v7;
  id v8[2];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke_2;
  block[3] = &unk_24C618D98;
  objc_copyWeak(v8, a1 + 7);
  v5 = a1[4];
  v6 = a1[5];
  v8[1] = a2;
  v7 = a1[6];
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(v8);
}

void __60__PEEditActionBatch__processResult_targetPreset_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_commitComposition:toResource:changeType:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48));

}

void __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "compositionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    PLPhotoEditGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_20D13D000, v9, OS_LOG_TYPE_ERROR, "PEEditActionBatch failed to fetch resources for asset: %{public}@ error:%@", (uint8_t *)&v11, 0x16u);

    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __77__PEEditActionBatch__requestResourcesForAsset_progressHandler_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(a2, "compositionController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v8;
      v11 = 2112;
      v12 = v5;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "PEEditActionBatch failed to fetch adjusted resources for asset: %{public}@ error:%@", (uint8_t *)&v9, 0x16u);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAdjustedSourceCompositionController:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __36__PEEditActionBatch__processAssets___block_invoke(uint64_t a1, double a2)
{
  double v3;
  id WeakRetained;

  v3 = a2 * 0.75;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_processDidUpdateWithID:progress:", *(_QWORD *)(a1 + 32), v3);

}

void __36__PEEditActionBatch__processAssets___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  PEAdjustmentPreset *v10;
  void *v11;
  PEAdjustmentPreset *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  objc_msgSend(WeakRetained, "_processDidUpdateWithID:progress:", *(_QWORD *)(a1 + 32), 0.75);

  if (objc_msgSend(*(id *)(a1 + 40), "state") == 3)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_INFO, "PEEditActionBatch: Dropping resource due to batch cancelation", buf, 2u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
  }
  else
  {
    objc_msgSend(v5, "adjustedSourceCompositionController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [PEAdjustmentPreset alloc];
      objc_msgSend(v5, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PEAdjustmentPreset initWithCompositionController:asset:](v10, "initWithCompositionController:asset:", v9, v11);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setSourceAction:", v12);

    }
    objc_msgSend(v5, "compositionController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = *(void **)(a1 + 40);
      v15 = *(_QWORD *)(a1 + 56);
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __36__PEEditActionBatch__processAssets___block_invoke_32;
      v19[3] = &unk_24C618CB8;
      v22 = *(_OWORD *)(a1 + 72);
      objc_copyWeak(&v23, (id *)(a1 + 88));
      v20 = *(id *)(a1 + 32);
      v21 = *(id *)(a1 + 48);
      objc_msgSend(v14, "_processResult:targetPreset:completion:", v5, v15, v19);

      objc_destroyWeak(&v23);
    }
    else
    {
      PLPhotoEditGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(a1 + 64), "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v17;
        _os_log_impl(&dword_20D13D000, v16, OS_LOG_TYPE_ERROR, "PEEditActionBatch: Failed to fetch preset from asset: %{public}@", buf, 0xCu);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setError:", v6);
      v18 = objc_loadWeakRetained((id *)(a1 + 88));
      objc_msgSend(v18, "_processDidCompleteWithID:error:", *(_QWORD *)(a1 + 32), v6);

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
    }

  }
}

void __36__PEEditActionBatch__processAssets___block_invoke_32(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id WeakRetained;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = a3;
  objc_msgSend(v5, "setSavedAsset:", a2);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setError:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_processDidCompleteWithID:error:", *(_QWORD *)(a1 + 32), v6);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  if (*(_QWORD *)(a1 + 56))
  {
    v3 = 0;
    do
    {
      v4 = *(_QWORD *)(a1 + 64);
      v5 = *(_QWORD *)(a1 + 72);
      v6 = v4 * v3;
      if (v4 * v3 + v4 <= v5)
        v7 = *(_QWORD *)(a1 + 64);
      else
        v7 = v5 - v4 * v3;
      v8 = (void *)MEMORY[0x212B9EB94]();
      objc_msgSend(*(id *)(a1 + 32), "subarrayWithRange:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "_processAssets:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        objc_msgSend(v2, "addObjectsFromArray:", v10);

      objc_autoreleasePoolPop(v8);
      ++v3;
    }
    while (v3 < *(_QWORD *)(a1 + 56));
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke_2;
  v16[3] = &unk_24C618C40;
  v16[4] = &v17;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v16);
  v11 = objc_msgSend(*(id *)(a1 + 40), "state");
  v12 = v11;
  if (v11 == 3)
  {
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject batch:didCancelAction:](v13, "batch:didCancelAction:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 40), "actionType"));
  }
  else if (v11 == 1)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) = 2;
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(void **)(a1 + 40);
    v15 = objc_msgSend(v14, "actionType");
    -[NSObject batch:didCompleteAction:hasError:](v13, "batch:didCompleteAction:hasError:", v14, v15, *((unsigned __int8 *)v18 + 24));
  }
  else
  {
    PLPhotoEditGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v22 = v12;
      _os_log_impl(&dword_20D13D000, v13, OS_LOG_TYPE_ERROR, "PEEditActionBatch: Unexpected state in _batchDidStop: %lu", buf, 0xCu);
    }
  }

  (*(void (**)(_QWORD, void *, BOOL))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v2, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104) == 3);
  _Block_object_dispose(&v17, 8);

}

void __55__PEEditActionBatch_runActionWithBatchSize_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

@end
