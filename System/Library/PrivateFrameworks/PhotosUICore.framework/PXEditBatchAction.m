@implementation PXEditBatchAction

- (PXEditBatchAction)initWithPresetManager:(id)a3 syncProgress:(id)a4 asyncProgress:(id)a5 asyncLoadingStatusManager:(id)a6 forAssets:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  PXEditBatchAction *v18;
  uint64_t v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *actionQueue;
  uint64_t v22;
  NSMutableDictionary *undoActionMap;
  uint64_t v24;
  NSArray *assets;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v32.receiver = self;
  v32.super_class = (Class)PXEditBatchAction;
  v18 = -[PXEditBatchAction init](&v32, sel_init);
  if (v18)
  {
    objc_initWeak(&location, v18);
    v19 = MEMORY[0x1E0C809B0];
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke;
    v29[3] = &unk_1E5148D30;
    objc_copyWeak(&v30, &location);
    objc_msgSend(v14, "setCancellationHandler:", v29);
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke_2;
    v27[3] = &unk_1E5148D30;
    objc_copyWeak(&v28, &location);
    objc_msgSend(v15, "setCancellationHandler:", v27);
    objc_storeStrong((id *)&v18->_syncProgress, a4);
    objc_storeStrong((id *)&v18->_asyncProgress, a5);
    objc_msgSend(v13, "setAsyncLoadingStatusManager:", v16);
    objc_storeStrong((id *)&v18->_manager, a3);
    v20 = dispatch_queue_create("PXEditBatchAction", 0);
    actionQueue = v18->_actionQueue;
    v18->_actionQueue = (OS_dispatch_queue *)v20;

    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v17, "count"));
    undoActionMap = v18->_undoActionMap;
    v18->_undoActionMap = (NSMutableDictionary *)v22;

    -[PXEditBatchAction prefetchOriginalMetadataForAssets:](v18, "prefetchOriginalMetadataForAssets:", v17);
    v24 = objc_claimAutoreleasedReturnValue();
    assets = v18->_assets;
    v18->_assets = (NSArray *)v24;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (void)executeWithUndoManager:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  objc_super v11;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  -[PXEditBatchAction manager](self, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBusyWithBatchAction");

  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Could not perform PXEditBatchAction: Edit manager is busy.", buf, 2u);
    }

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)PXEditBatchAction;
    -[PXAction executeWithUndoManager:completionHandler:](&v11, sel_executeWithUndoManager_completionHandler_, v6, v7);
  }

}

- (void)performAction:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditBatchAction.m"), 74, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXEditBatchAction performAction:]", v8);

  abort();
}

- (void)performUndo:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *actionQueue;
  id v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  if (!-[NSMutableDictionary count](self->_undoActionMap, "count"))
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "No successful actions in PXEditBatchAction to undo.";
      goto LABEL_7;
    }
LABEL_8:

    (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
    goto LABEL_13;
  }
  -[PXEditBatchAction manager](self, "manager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBusyWithBatchAction");

  if (v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v8 = "Could not undo PXEditBatchAction: Edit manager is busy.";
LABEL_7:
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, v8, buf, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  -[PXEditBatchAction localizedProgressToastUndoTitle](self, "localizedProgressToastUndoTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    -[PXAction undoMenuItemTitle](self, "undoMenuItemTitle");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  -[PXEditBatchAction syncAssets](self, "syncAssets");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditBatchAction willBeginActionWithLocalizedTitle:isAsync:itemCount:](self, "willBeginActionWithLocalizedTitle:isAsync:itemCount:", v12, 0, objc_msgSend(v13, "count"));
  actionQueue = self->_actionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__PXEditBatchAction_performUndo___block_invoke;
  block[3] = &unk_1E5145688;
  block[4] = self;
  v17 = v13;
  v18 = v4;
  v15 = v13;
  dispatch_async(actionQueue, block);

LABEL_13:
}

- (void)_syncUndoDidFinishWithResults:(id)a3 didCancel:(BOOL)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSMutableDictionary *undoActionMap;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a5;
  -[PXEditBatchAction asyncAssets](self, "asyncAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a4 || !objc_msgSend(v10, "count"))
  {
    -[PXEditBatchAction _saveResults:needsUndoMap:completion:](self, "_saveResults:needsUndoMap:completion:", v8, 0, v9);
  }
  else
  {
    objc_initWeak(&location, self);
    -[PXEditBatchAction localizedProgressToastUndoTitle](self, "localizedProgressToastUndoTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      -[PXAction undoMenuItemTitle](self, "undoMenuItemTitle");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v14;

    -[PXEditBatchAction willBeginActionWithLocalizedTitle:isAsync:itemCount:](self, "willBeginActionWithLocalizedTitle:isAsync:itemCount:", v15, 1, objc_msgSend(v11, "count"));
    -[PXEditBatchAction manager](self, "manager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    undoActionMap = self->_undoActionMap;
    -[PXEditBatchAction asyncProgress](self, "asyncProgress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __79__PXEditBatchAction__syncUndoDidFinishWithResults_didCancel_completionHandler___block_invoke;
    v19[3] = &unk_1E513A688;
    v20 = v8;
    objc_copyWeak(&v22, &location);
    v21 = v9;
    objc_msgSend(v16, "replacePresets:onAssets:async:progress:completion:", undoActionMap, v11, 1, v18, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

}

- (void)willBeginActionIsAsync:(BOOL)a3 itemCount:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  -[PXAction redoMenuItemTitle](self, "redoMenuItemTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXEditBatchAction localizedProgressToastRedoTitle](self, "localizedProgressToastRedoTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      -[PXEditBatchAction localizedProgressToastRedoTitle](self, "localizedProgressToastRedoTitle");
    else
      -[PXAction redoMenuItemTitle](self, "redoMenuItemTitle");
  }
  else
  {
    -[PXEditBatchAction localizedProgressToastOngoingTitle](self, "localizedProgressToastOngoingTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      -[PXEditBatchAction localizedProgressToastOngoingTitle](self, "localizedProgressToastOngoingTitle");
    else
      -[PXAction localizedActionName](self, "localizedActionName");
  }
  v9 = objc_claimAutoreleasedReturnValue();
  v11 = (id)v9;
  -[PXEditBatchAction willBeginActionWithLocalizedTitle:isAsync:itemCount:](self, "willBeginActionWithLocalizedTitle:isAsync:itemCount:", v9, v5, a4);

}

- (void)willBeginActionWithLocalizedTitle:(id)a3 isAsync:(BOOL)a4 itemCount:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD block[5];
  id v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;

  v8 = a3;
  -[PXEditBatchAction assets](self, "assets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PXEditBatchAction_willBeginActionWithLocalizedTitle_isAsync_itemCount___block_invoke;
  block[3] = &unk_1E5127F98;
  v16 = a4;
  v14 = a5;
  v15 = v10;
  block[4] = self;
  v13 = v8;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (BOOL)isEligibleForAsyncProcessingOnAsset:(id)a3
{
  return 1;
}

- (BOOL)shouldRenderSynchronouslyForAsset:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  BOOL v10;

  v4 = a3;
  if (-[PXEditBatchAction allowSynchronousRendering](self, "allowSynchronousRendering"))
  {
    if (-[PXEditBatchAction isEligibleForAsyncProcessingOnAsset:](self, "isEligibleForAsyncProcessingOnAsset:", v4))
    {
      objc_msgSend(v4, "originalMetadataProperties");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "originalWidth");
      v7 = (double)(objc_msgSend(v5, "originalHeight") * v6) / 1000000.0;
      v8 = objc_msgSend(v4, "RAWBadgeAttributes");
      v10 = v7 >= 25.0 || v8 != 0;

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)syncAssets
{
  NSArray *syncAssets;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  syncAssets = self->_syncAssets;
  if (!syncAssets)
  {
    -[PXEditBatchAction assets](self, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PFFilter();
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_syncAssets;
    self->_syncAssets = v5;

    syncAssets = self->_syncAssets;
  }
  return syncAssets;
}

- (id)asyncAssets
{
  NSArray *asyncAssets;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  asyncAssets = self->_asyncAssets;
  if (!asyncAssets)
  {
    -[PXEditBatchAction assets](self, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PFFilter();
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_asyncAssets;
    self->_asyncAssets = v5;

    asyncAssets = self->_asyncAssets;
  }
  return asyncAssets;
}

- (NSArray)assets
{
  NSObject *actionQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__113665;
  v10 = __Block_byref_object_dispose__113666;
  v11 = 0;
  actionQueue = self->_actionQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __27__PXEditBatchAction_assets__block_invoke;
  v5[3] = &unk_1E5148AA8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(actionQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (void)saveResults:(id)a3 completion:(id)a4
{
  -[PXEditBatchAction _saveResults:needsUndoMap:completion:](self, "_saveResults:needsUndoMap:completion:", a3, 1, a4);
}

- (void)_saveResults:(id)a3 needsUndoMap:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = PFExists();
  if ((_DWORD)v10 && v6)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__PXEditBatchAction__saveResults_needsUndoMap_completion___block_invoke_2;
    v11[3] = &unk_1E5145688;
    v11[4] = self;
    v12 = v8;
    v13 = v9;
    -[PXEditBatchAction _saveUndoMapFromResults:completion:](self, "_saveUndoMapFromResults:completion:", v12, v11);

  }
  else
  {
    -[PXEditBatchAction _reportResults:](self, "_reportResults:", v8);
    (*((void (**)(id, uint64_t, _QWORD))v9 + 2))(v9, v10, 0);
  }

}

- (void)_cancel
{
  id v2;

  -[PXEditBatchAction manager](self, "manager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelCurrentBatchAction");

}

- (void)_reportResults:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  PXEditBatchAction *v8;

  v4 = a3;
  -[PXEditBatchAction completionHandler](self, "completionHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__PXEditBatchAction__reportResults___block_invoke;
    v6[3] = &unk_1E5148D08;
    v7 = v4;
    v8 = self;
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

- (void)_saveUndoMapFromResults:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *actionQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  actionQueue = self->_actionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__PXEditBatchAction__saveUndoMapFromResults_completion___block_invoke;
  block[3] = &unk_1E5145688;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(actionQueue, block);

}

- (id)prefetchOriginalMetadataForAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssets:title:", v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CD1570];
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v12[0] = *MEMORY[0x1E0CD1A08];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFetchPropertySets:", v8);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchedObjects");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = v3;
  }

  return v10;
}

- (id)localizedProgressToastOngoingTitle
{
  return 0;
}

- (id)localizedProgressToastSuccessTitle
{
  return 0;
}

- (id)localizedProgressToastUndoTitle
{
  return 0;
}

- (id)localizedProgressToastRedoTitle
{
  return 0;
}

- (PXEditPresetManager)manager
{
  return self->_manager;
}

- (BOOL)allowSynchronousRendering
{
  return self->_allowSynchronousRendering;
}

- (void)setAllowSynchronousRendering:(BOOL)a3
{
  self->_allowSynchronousRendering = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSProgress)syncProgress
{
  return self->_syncProgress;
}

- (NSProgress)asyncProgress
{
  return self->_asyncProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asyncProgress, 0);
  objc_storeStrong((id *)&self->_syncProgress, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_undoActionMap, 0);
  objc_storeStrong((id *)&self->_syncAssets, 0);
  objc_storeStrong((id *)&self->_asyncAssets, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_actionQueue, 0);
}

void __56__PXEditBatchAction__saveUndoMapFromResults_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "removeAllObjects");
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v8, "sourceAction");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "sourceAssetUUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "savedAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          v12 = v9 == 0;
        else
          v12 = 1;
        if (!v12 && v10 != 0)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "setObject:forKey:", v9, v10);
          objc_msgSend(v2, "addObject:", v11);
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "prefetchOriginalMetadataForAssets:", v2);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 72);
  *(_QWORD *)(v15 + 72) = v14;

  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(void **)(v17 + 88);
  *(_QWORD *)(v17 + 88) = 0;

  v19 = *(_QWORD *)(a1 + 32);
  v20 = *(void **)(v19 + 80);
  *(_QWORD *)(v19 + 80) = 0;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __36__PXEditBatchAction__reportResults___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "error", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "completionHandler");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v9)[2](v9, v2);

}

uint64_t __58__PXEditBatchAction__saveResults_needsUndoMap_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reportResults:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

BOOL __58__PXEditBatchAction__saveResults_needsUndoMap_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

void __27__PXEditBatchAction_assets__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __32__PXEditBatchAction_asyncAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldRenderSynchronouslyForAsset:", a2) ^ 1;
}

uint64_t __31__PXEditBatchAction_syncAssets__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "shouldRenderSynchronouslyForAsset:", a2);
}

void __73__PXEditBatchAction_willBeginActionWithLocalizedTitle_isAsync_itemCount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_QWORD *)(a1 + 48) >= *(_QWORD *)(a1 + 56))
      v2 = 0;
    else
      v2 = 21;
  }
  else
  {
    v2 = 22;
  }
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "asyncProgress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLocalizedDescription:", v3);

  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "syncProgress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocalizedDescription:", v5);

  v7 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(v7, "asyncProgress");
  else
    objc_msgSend(v7, "syncProgress");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompletedUnitCount:", 0);
  PXLocalizedAssetCountForUsage(*(_QWORD *)(a1 + 48), 0, 0, v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLocalizedAdditionalDescription:", v8);

}

void __79__PXEditBatchAction__syncUndoDidFinishWithResults_didCancel_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v6 = (id)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v6, "addObjectsFromArray:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_saveResults:needsUndoMap:completion:", v6, 0, *(_QWORD *)(a1 + 40));

}

void __33__PXEditBatchAction_performUndo___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "count"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "manager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3[12];
    objc_msgSend(v3, "syncProgress");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__PXEditBatchAction_performUndo___block_invoke_2;
    v7[3] = &unk_1E513A660;
    objc_copyWeak(&v9, &location);
    v8 = *(id *)(a1 + 48);
    objc_msgSend(v2, "replacePresets:onAssets:async:progress:completion:", v5, v4, 0, v6, v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

void __33__PXEditBatchAction_performUndo___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id *v5;
  id v6;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_syncUndoDidFinishWithResults:didCancel:completionHandler:", v6, a3, *(_QWORD *)(a1 + 32));

}

void __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

void __106__PXEditBatchAction_initWithPresetManager_syncProgress_asyncProgress_asyncLoadingStatusManager_forAssets___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

@end
