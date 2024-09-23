@implementation PEAdjustmentPresetManager

- (PEAdjustmentPresetManager)init
{
  PEAdjustmentPresetManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *loadingQueue;
  PEResourceManager *v5;
  PEResourceManager *resourceManager;
  void *v7;
  PEAdjustmentPresetManager *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PEAdjustmentPresetManager;
  v2 = -[PEAdjustmentPresetManager init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("PEAdjustmentPresetManager", 0);
    loadingQueue = v2->_loadingQueue;
    v2->_loadingQueue = (OS_dispatch_queue *)v3;

    v5 = objc_alloc_init(PEResourceManager);
    resourceManager = v2->_resourceManager;
    v2->_resourceManager = v5;

    objc_msgSend(MEMORY[0x24BEBD7E8], "generalPasteboard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PEAdjustmentPresetManager setPasteboard:](v2, "setPasteboard:", v7);

    v8 = v2;
  }

  return v2;
}

- (BOOL)hasPresetOnPasteboard
{
  void *v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("com.apple.photos.adjustmentstack");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PEAdjustmentPresetManager pasteboard](self, "pasteboard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v4, "containsPasteboardTypes:", v3);

  return (char)self;
}

- (void)_copyPreset:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "serializedDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v4, 100, 0, &v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v8;
  if (v5)
  {
    -[PEAdjustmentPresetManager pasteboard](self, "pasteboard");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject setData:forPasteboardType:](v7, "setData:forPasteboardType:", v5, CFSTR("com.apple.photos.adjustmentstack"));
  }
  else
  {
    PLPhotoEditGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager failed to copy data with error: %@", buf, 0xCu);
    }
  }

}

- (PEPasteablePreset)presetFromPasteboard
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  PEPasteablePreset *v7;
  void *v8;
  int v9;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[PEAdjustmentPresetManager pasteboard](self, "pasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataForPasteboardType:", CFSTR("com.apple.photos.adjustmentstack"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v11 = 0;
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v3, 0, &v12, &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (v5)
    {
      PLPhotoEditGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v5;
        _os_log_impl(&dword_20D13D000, v6, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager failed to fetch data from pasteboard with error: %@", buf, 0xCu);
      }

    }
    if (v4)
    {
      v7 = -[PEAdjustmentPreset initWithPropertyListDictionary:]([PEPasteablePreset alloc], "initWithPropertyListDictionary:", v4);

      goto LABEL_11;
    }

  }
  +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "smartCopyPasteReviewUIEnabled");

  if (!v9)
  {
    v7 = 0;
    goto LABEL_13;
  }
  +[PESCAPReviewManager sharedReviewManager](PESCAPReviewManager, "sharedReviewManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearAll");
  v7 = 0;
LABEL_11:

LABEL_13:
  return v7;
}

- (void)copyPresetFromCompositionController:(id)a3 sourceAsset:(id)a4 smartCopyEnabled:(BOOL)a5
{
  -[PEAdjustmentPresetManager copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:configurationAnalyticsPayload:](self, "copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:configurationAnalyticsPayload:", a3, a4, a5, MEMORY[0x24BDBD1B8]);
}

- (void)copyPresetFromCompositionController:(id)a3 sourceAsset:(id)a4 smartCopyEnabled:(BOOL)a5 configurationAnalyticsPayload:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  PEPasteablePreset *v15;
  uint8_t v16[16];

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  PLPhotoEditGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_20D13D000, v13, OS_LOG_TYPE_INFO, "PEAdjustmentPresetManager copyPresetFromCompositionController", v16, 2u);
  }

  v14 = (void *)objc_msgSend(v12, "copy");
  v15 = -[PEPasteablePreset initWithCompositionController:asset:isSmart:]([PEPasteablePreset alloc], "initWithCompositionController:asset:isSmart:", v14, v11, v6);
  -[PEAdjustmentPresetManager _copyPreset:](self, "_copyPreset:", v15);
  -[PEAdjustmentPresetManager _sendAnalyticsForCopyActionOnAsset:copiedCompositionController:configurationAnalyticsPayload:](self, "_sendAnalyticsForCopyActionOnAsset:copiedCompositionController:configurationAnalyticsPayload:", v11, v12, v10);

}

- (BOOL)assetHasCopyableAdjustments:(id)a3 removeCrop:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = 0;
  if (-[PEAdjustmentPresetManager _assetHasVisibleAdjustments:shouldConsiderOpaqueAdjustments:](self, "_assetHasVisibleAdjustments:shouldConsiderOpaqueAdjustments:", v6, 0))
  {
    -[PEAdjustmentPresetManager resourceManager](self, "resourceManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "compositionControllerWithoutSource:originalComposition:editorBundleID:", v6, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v9, "removeAdjustmentWithKey:", *MEMORY[0x24BE71DA0]);
      objc_msgSend(v9, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E18]);
    }
    v7 = +[PEPasteablePreset hasValidAdjustmentsInCompositionController:](PEPasteablePreset, "hasValidAdjustmentsInCompositionController:", v9);

  }
  return v7;
}

- (BOOL)assetHasRevertibleAdjustments:(id)a3
{
  return -[PEAdjustmentPresetManager _assetHasVisibleAdjustments:shouldConsiderOpaqueAdjustments:](self, "_assetHasVisibleAdjustments:shouldConsiderOpaqueAdjustments:", a3, 1);
}

- (BOOL)_assetHasVisibleAdjustments:(id)a3 shouldConsiderOpaqueAdjustments:(BOOL)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v20 = v8;
    _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_INFO, "PEAdjustmentPresetManager _assetHasVisibleAdjustments: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v6, "isAdjusted"))
  {
    -[PEAdjustmentPresetManager resourceManager](self, "resourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v9, "compositionControllerWithoutSource:originalComposition:editorBundleID:", v6, 0, &v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v18;

    if (a4 || (v12 = 0, v10))
    {
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.camera")) & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        -[PEAdjustmentPresetManager resourceManager](self, "resourceManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "originalCompositionControllerWithoutSource:reconstructIfMissing:", v6, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = 1;
        if (v14)
        {
          objc_msgSend(v14, "composition");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v10, "isEqual:visualChangesOnly:", v15, 1);

          if ((v16 & 1) != 0)
            v12 = 0;
        }

      }
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)copyPresetFromAsset:(id)a3 removeCrop:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  PLPhotoEditGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v6, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v8;
    _os_log_impl(&dword_20D13D000, v7, OS_LOG_TYPE_INFO, "PEAdjustmentPresetManager copyPresetFromAsset: %{public}@", (uint8_t *)&v12, 0xCu);

  }
  -[PEAdjustmentPresetManager resourceManager](self, "resourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "compositionControllerWithoutSource:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "removeAdjustmentWithKey:", *MEMORY[0x24BE71DA0]);
    objc_msgSend(v10, "removeAdjustmentWithKey:", *MEMORY[0x24BE71E18]);
  }
  if (v10)
  {
    -[PEAdjustmentPresetManager copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:](self, "copyPresetFromCompositionController:sourceAsset:smartCopyEnabled:", v10, v6, 1);
  }
  else
  {
    PLPhotoEditGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_20D13D000, v11, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager failed to copy edits because of missing compositionController", (uint8_t *)&v12, 2u);
    }

  }
}

- (void)executeAction:(id)a3 onAssets:(id)a4 async:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, uint64_t);
  NSObject *v16;
  PEEditActionBatch *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  uint64_t v22;

  v9 = a5;
  v22 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, uint64_t))a7;
  if (-[PEAdjustmentPresetManager isBusyWithBatchAction](self, "isBusyWithBatchAction"))
  {
    PLPhotoEditGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v20 = 138412290;
      v21 = v12;
      _os_log_impl(&dword_20D13D000, v16, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager: Cannot start action (%@) while another batch is in process", (uint8_t *)&v20, 0xCu);
    }

    v15[2](v15, 0, 1);
  }
  else
  {
    v17 = -[PEEditActionBatch initWithAssets:action:progress:]([PEEditActionBatch alloc], "initWithAssets:action:progress:", v13, v12, v14);
    -[PEEditActionBatch setForceRunAsUnadjustedAsset:](v17, "setForceRunAsUnadjustedAsset:", objc_msgSend(v12, "forceRunAsUnadjustedAsset"));
    -[PEEditActionBatch setAsync:](v17, "setAsync:", v9);
    if (v9)
    {
      -[PEAdjustmentPresetManager asyncLoadingStatusManager](self, "asyncLoadingStatusManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PEEditActionBatch setLoadingStatusManager:](v17, "setLoadingStatusManager:", v18);

    }
    -[PEEditActionBatch setDelegate:](v17, "setDelegate:", self);
    -[PEEditActionBatch runActionWithBatchSize:completion:](v17, "runActionWithBatchSize:completion:", 3, v15);

    -[PEAdjustmentPresetManager _editActionEventBuilderForAction:assets:](self, "_editActionEventBuilderForAction:assets:", v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PEAdjustmentPresetManager setEditActionEventBuilder:](self, "setEditActionEventBuilder:", v19);

  }
}

- (void)pastePreset:(id)a3 onAssets:(id)a4 async:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  PESmartPasteablePreset *v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v9 = a5;
  v34 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a6;
  v13 = a7;
  -[PEAdjustmentPresetManager presetFromPasteboard](self, "presetFromPasteboard");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAnalyticsEventBuilderDelegate:", self);
  if (!objc_msgSend(v11, "count"))
    goto LABEL_7;
  objc_msgSend(v11, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_7:
    v16 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v15, "photoLibrary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
LABEL_8:
    v18 = 0;
    goto LABEL_9;
  }
  v32 = 0;
  v17 = objc_msgSend(v14, "isEligibleForSmartPasteWithPhotoLibrary:fallbackPayload:", v16, &v32);
  v18 = v32;
  if (v17)
  {
    v19 = -[PESmartPasteablePreset initWithPasteablePreset:]([PESmartPasteablePreset alloc], "initWithPasteablePreset:", v14);
    -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v19, v11, v9, v12, v13);
LABEL_19:

    goto LABEL_20;
  }
LABEL_9:
  -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v14, v11, v9, v12, v13);
  +[PEGlobalSettings globalSettings](PEGlobalSettings, "globalSettings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "smartCopyPasteReviewUIEnabled");

  if (v21 && v18)
  {
    v27 = v12;
    +[PESCAPReviewManager sharedReviewManager](PESCAPReviewManager, "sharedReviewManager");
    v19 = (PESmartPasteablePreset *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v11;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v29;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v29 != v25)
            objc_enumerationMutation(v22);
          -[PESmartPasteablePreset registerPayload:forAsset:](v19, "registerPayload:forAsset:", v18, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26++));
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v24);
    }

    v12 = v27;
    goto LABEL_19;
  }
LABEL_20:

}

- (void)replacePresets:(id)a3 onAssets:(id)a4 async:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  void (**v15)(id, _QWORD, uint64_t);
  NSObject *v16;
  PEEditActionBatch *v17;
  void *v18;
  PEAdjustmentPreset *v19;
  void *v20;
  uint8_t v21[16];

  v9 = a5;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = (void (**)(id, _QWORD, uint64_t))a7;
  if (-[PEAdjustmentPresetManager isBusyWithBatchAction](self, "isBusyWithBatchAction"))
  {
    PLPhotoEditGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_20D13D000, v16, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager: Cannot start replace while another batch is in process", v21, 2u);
    }

    v15[2](v15, 0, 1);
  }
  else
  {
    v17 = -[PEEditActionBatch initWithAssets:actionMap:progress:]([PEEditActionBatch alloc], "initWithAssets:actionMap:progress:", v13, v12, v14);
    -[PEEditActionBatch setForceRunAsUnadjustedAsset:](v17, "setForceRunAsUnadjustedAsset:", 0);
    -[PEEditActionBatch setAsync:](v17, "setAsync:", v9);
    if (v9)
    {
      -[PEAdjustmentPresetManager asyncLoadingStatusManager](self, "asyncLoadingStatusManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PEEditActionBatch setLoadingStatusManager:](v17, "setLoadingStatusManager:", v18);

    }
    -[PEEditActionBatch setDelegate:](v17, "setDelegate:", self);
    -[PEEditActionBatch runActionWithBatchSize:completion:](v17, "runActionWithBatchSize:completion:", 3, v15);

    v19 = objc_alloc_init(PEAdjustmentPreset);
    -[PEAdjustmentPresetManager _editActionEventBuilderForAction:assets:](self, "_editActionEventBuilderForAction:assets:", v19, v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PEAdjustmentPresetManager setEditActionEventBuilder:](self, "setEditActionEventBuilder:", v20);

  }
}

- (void)revertAdjustmentsOnAssets:(id)a3 async:(BOOL)a4 progress:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PERevertPreset *v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(PERevertPreset);
  -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v13, v12, v7, v11, v10);

}

- (BOOL)isBusyWithBatchAction
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;

  -[PEAdjustmentPresetManager currentBatchAction](self, "currentBatchAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PEAdjustmentPresetManager currentBatchAction](self, "currentBatchAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    v6 = v5 < 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)cancelCurrentBatchAction
{
  id v2;

  -[PEAdjustmentPresetManager currentBatchAction](self, "currentBatchAction");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)batch:(id)a3 willStartAction:(int64_t)a4
{
  PEEditActionBatch *v5;
  NSObject *v6;
  PEEditActionBatch *currentBatchAction;
  uint8_t v8[16];

  v5 = (PEEditActionBatch *)a3;
  if (-[PEAdjustmentPresetManager isBusyWithBatchAction](self, "isBusyWithBatchAction"))
  {
    PLPhotoEditGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_20D13D000, v6, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager: Starting while another is in process", v8, 2u);
    }

  }
  currentBatchAction = self->_currentBatchAction;
  self->_currentBatchAction = v5;

}

- (void)batch:(id)a3 didCompleteAction:(int64_t)a4 hasError:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  PEEditActionBatch *currentBatchAction;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint8_t v16[16];

  v5 = a5;
  v7 = a3;
  -[PEAdjustmentPresetManager currentBatchAction](self, "currentBatchAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v7);

  if ((v9 & 1) == 0)
  {
    PLPhotoEditGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_20D13D000, v10, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager completed with action while expecting another", v16, 2u);
    }

  }
  currentBatchAction = self->_currentBatchAction;
  self->_currentBatchAction = 0;

  -[PEAdjustmentPresetManager editActionEventBuilder](self, "editActionEventBuilder");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend(v7, "hasAssets");

    if (v14)
    {
      -[PEAdjustmentPresetManager editActionEventBuilder](self, "editActionEventBuilder");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setHasError:", v5);

      -[PEAdjustmentPresetManager _sendAnalyticsForCurrentEditAction](self, "_sendAnalyticsForCurrentEditAction");
    }
  }

}

- (void)batch:(id)a3 didCancelAction:(int64_t)a4
{
  id v5;
  void *v6;
  char v7;
  NSObject *v8;
  PEEditActionBatch *currentBatchAction;
  uint8_t v10[16];

  v5 = a3;
  -[PEAdjustmentPresetManager currentBatchAction](self, "currentBatchAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    PLPhotoEditGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_20D13D000, v8, OS_LOG_TYPE_ERROR, "PEAdjustmentPresetManager canceled action while expecting another", v10, 2u);
    }

  }
  currentBatchAction = self->_currentBatchAction;
  self->_currentBatchAction = 0;

  -[PEAdjustmentPresetManager setEditActionEventBuilder:](self, "setEditActionEventBuilder:", 0);
}

- (void)autoEnhanceAssets:(id)a3 async:(BOOL)a4 progress:(id)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  PEAutoEnhanceAction *v13;

  v7 = a4;
  v10 = a6;
  v11 = a5;
  v12 = a3;
  v13 = objc_alloc_init(PEAutoEnhanceAction);
  -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v13, v12, v7, v11, v10);

}

- (void)rotateAssets:(id)a3 direction:(int64_t)a4 async:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  PERotateAction *v15;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v15 = objc_alloc_init(PERotateAction);
  -[PERotateAction setRotateDirection:](v15, "setRotateDirection:", a4);
  -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v15, v14, v8, v13, v12);

}

- (void)setPlaybackRateOnAssets:(id)a3 playbackRate:(float)a4 async:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  double v15;
  PEPlaybackRateAction *v16;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a3;
  v16 = objc_alloc_init(PEPlaybackRateAction);
  *(float *)&v15 = a4;
  -[PEPlaybackRateAction setPlaybackRate:](v16, "setPlaybackRate:", v15);
  -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v16, v14, v8, v13, v12);

}

- (void)setAudioMixModeOnAssets:(id)a3 audioMixMode:(id)a4 async:(BOOL)a5 progress:(id)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  PEAudioMixModeAction *v16;

  v8 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(PEAudioMixModeAction);
  -[PEAudioMixModeAction setAudioMixMode:](v16, "setAudioMixMode:", v14);

  -[PEAdjustmentPresetManager executeAction:onAssets:async:progress:completion:](self, "executeAction:onAssets:async:progress:completion:", v16, v15, v8, v13, v12);
}

- (void)updateAnalyticsEventBuilderActionType:(id)a3 forAssets:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[PEAdjustmentPresetManager editActionEventBuilder](self, "editActionEventBuilder");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerActionType:forAssets:", v7, v6);

}

- (void)_sendAnalyticsForCopyActionOnAsset:(id)a3 copiedCompositionController:(id)a4 configurationAnalyticsPayload:(id)a5
{
  id v7;
  id v8;
  PECopyActionEventBuilder *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = a4;
  v9 = objc_alloc_init(PECopyActionEventBuilder);
  -[PECopyActionEventBuilder setCopiedCompositionController:](v9, "setCopiedCompositionController:", v8);

  -[PECopyActionEventBuilder setConfigurationAnalyticsPayload:](v9, "setConfigurationAnalyticsPayload:", v7);
  if (v11)
    -[PECopyActionEventBuilder setAsset:](v9, "setAsset:", v11);
  -[PECopyActionEventBuilder buildEvent](v9, "buildEvent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE121D0], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.edit.copyAdjustments"), v10);

}

- (id)_editActionEventBuilderForAction:(id)a3 assets:(id)a4
{
  id v5;
  id v6;
  PEEditActionEventBuilder *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[PEEditActionEventBuilder initWithBaseAction:assets:]([PEEditActionEventBuilder alloc], "initWithBaseAction:assets:", v6, v5);

  return v7;
}

- (void)_sendAnalyticsForCurrentEditAction
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[PEAdjustmentPresetManager editActionEventBuilder](self, "editActionEventBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PEAdjustmentPresetManager editActionEventBuilder](self, "editActionEventBuilder");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "buildEvents");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
          objc_msgSend(MEMORY[0x24BE121D0], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.edit.editAction"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[PEAdjustmentPresetManager setEditActionEventBuilder:](self, "setEditActionEventBuilder:", 0);
  }
}

- (void)apply:(id)a3 onCompositionController:(id)a4 editSource:(id)a5 asset:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char isKindOfClass;
  id *v17;
  id v18;
  uint64_t *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v12 && (isKindOfClass & 1) != 0)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __87__PEAdjustmentPresetManager_apply_onCompositionController_editSource_asset_completion___block_invoke;
    v26[3] = &unk_24C618210;
    v17 = &v27;
    v27 = v11;
    v18 = v11;
    v19 = v26;
  }
  else
  {
    v21 = MEMORY[0x24BDAC760];
    v22 = 3221225472;
    v23 = __87__PEAdjustmentPresetManager_apply_onCompositionController_editSource_asset_completion___block_invoke_2;
    v24 = &unk_24C618210;
    v17 = &v25;
    v25 = v11;
    v20 = v11;
    v19 = &v21;
  }
  objc_msgSend(v15, "applyToCompositionController:asset:editSource:completion:", v14, v12, v13, v19, v21, v22, v23, v24);

}

- (void)clearPasteboard
{
  void *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x24BDBCE50]);
  -[PEAdjustmentPresetManager pasteboard](self, "pasteboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setData:forPasteboardType:", v4, CFSTR("com.apple.photos.adjustmentstack"));

}

- (PELoadingStatusDelegate)asyncLoadingStatusManager
{
  return (PELoadingStatusDelegate *)objc_loadWeakRetained((id *)&self->_asyncLoadingStatusManager);
}

- (void)setAsyncLoadingStatusManager:(id)a3
{
  objc_storeWeak((id *)&self->_asyncLoadingStatusManager, a3);
}

- (PEEditActionBatch)currentBatchAction
{
  return self->_currentBatchAction;
}

- (OS_dispatch_queue)loadingQueue
{
  return self->_loadingQueue;
}

- (PEResourceManager)resourceManager
{
  return self->_resourceManager;
}

- (PEEditActionEventBuilder)editActionEventBuilder
{
  return self->_editActionEventBuilder;
}

- (void)setEditActionEventBuilder:(id)a3
{
  objc_storeStrong((id *)&self->_editActionEventBuilder, a3);
}

- (UIPasteboard)pasteboard
{
  return (UIPasteboard *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPasteboard:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pasteboard, 0);
  objc_storeStrong((id *)&self->_editActionEventBuilder, 0);
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_loadingQueue, 0);
  objc_storeStrong((id *)&self->_currentBatchAction, 0);
  objc_destroyWeak((id *)&self->_asyncLoadingStatusManager);
}

uint64_t __87__PEAdjustmentPresetManager_apply_onCompositionController_editSource_asset_completion___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __87__PEAdjustmentPresetManager_apply_onCompositionController_editSource_asset_completion___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2 == 1)
  {
    result = *(_QWORD *)(result + 32);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (PEAdjustmentPresetManager)sharedPresetManager
{
  if (sharedPresetManager_onceToken != -1)
    dispatch_once(&sharedPresetManager_onceToken, &__block_literal_global_374);
  return (PEAdjustmentPresetManager *)(id)sharedPresetManager_presetManager;
}

void __48__PEAdjustmentPresetManager_sharedPresetManager__block_invoke()
{
  PEAdjustmentPresetManager *v0;
  void *v1;

  v0 = objc_alloc_init(PEAdjustmentPresetManager);
  v1 = (void *)sharedPresetManager_presetManager;
  sharedPresetManager_presetManager = (uint64_t)v0;

}

@end
