@implementation PXPhotoKitDuplicateActionController

- (PXPhotoKitDuplicateActionController)initWithSelectionSnapshot:(id)a3 undoManager:(id)a4
{
  id v6;
  id v7;
  PXPhotoKitDuplicateActionController *v8;
  PXDuplicateAssetsAction *v9;
  PXDuplicateAssetsAction *action;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotoKitDuplicateActionController;
  v8 = -[PXPhotoKitDuplicateActionController init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PXDuplicateAssetsAction initWithSelectionSnapshot:]([PXDuplicateAssetsAction alloc], "initWithSelectionSnapshot:", v6);
    action = v8->_action;
    v8->_action = v9;

    objc_storeStrong((id *)&v8->_undoManager, a4);
  }

  return v8;
}

- (PXPhotoKitDuplicateActionController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDuplicateActionController.m"), 57, CFSTR("%s is not available as initializer"), "-[PXPhotoKitDuplicateActionController init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  -[PXDuplicateAssetsAction setDownloadCompletionHandler:](self->_action, "setDownloadCompletionHandler:", 0);
  -[PXPhotoKitDuplicateActionController setProgress:](self, "setProgress:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PXPhotoKitDuplicateActionController;
  -[PXPhotoKitDuplicateActionController dealloc](&v3, sel_dealloc);
}

- (BOOL)shouldUseAlertController
{
  return -[PXDuplicateAssetsAction canExtractStill](self->_action, "canExtractStill");
}

- (id)alertConfigurationForDuplicateActionWithUserConfirmationHandler:(id)a3
{
  id v4;
  PXDuplicateAssetsAction *action;
  PXAlertConfiguration *v6;

  v4 = a3;
  action = self->_action;
  if (action && -[PXDuplicateAssetsAction canExtractStill](action, "canExtractStill"))
  {
    v6 = objc_alloc_init(PXAlertConfiguration);
    -[PXPhotoKitDuplicateActionController configureAlertConfiguration:withUserConfirmationHandler:](self, "configureAlertConfiguration:withUserConfirmationHandler:", v6, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)configureAlertConfiguration:(id)a3 withUserConfirmationHandler:(id)a4
{
  id v6;
  id v7;
  PXDuplicateAssetsAction *action;
  uint64_t v9;
  BOOL v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;

  v6 = a3;
  v7 = a4;
  action = self->_action;
  if (action && -[PXDuplicateAssetsAction canExtractStill](action, "canExtractStill"))
  {
    v9 = -[PXDuplicateAssetsAction assetCount](self->_action, "assetCount");
    v10 = v9 <= 1;
    if (v9 <= 1)
      v11 = CFSTR("PXPhotoKitDuplicateAssetActionPerformer_LIVE_WARNING_MESSAGE_ONE_ITEM");
    else
      v11 = CFSTR("PXPhotoKitDuplicateAssetActionPerformer_LIVE_WARNING_MESSAGE_N_ITEMS");
    if (v10)
      v12 = CFSTR("PXPhotoKitDuplicateAssetActionPerformer_STILL_CONFIRMATION_MESSAGE_ONE_ITEM");
    else
      v12 = CFSTR("PXPhotoKitDuplicateAssetActionPerformer_STILL_CONFIRMATION_MESSAGE_N_ITEMS");
    if (v10)
      v13 = CFSTR("PXPhotoKitDuplicateAssetActionPerformer_LIVE_CONFIRMATION_MESSAGE_ONE_ITEM");
    else
      v13 = CFSTR("PXPhotoKitDuplicateAssetActionPerformer_LIVE_CONFIRMATION_MESSAGE_N_ITEMS");
    PXLocalizedStringFromTable(v11, CFSTR("PhotosUICore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v12, CFSTR("PhotosUICore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(v13, CFSTR("PhotosUICore"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTitle:", v14);
    objc_msgSend(v6, "setStyle:", 0);
    v18 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke;
    v25[3] = &unk_1E5148A40;
    v19 = v7;
    v26 = v19;
    objc_msgSend(v6, "addActionWithTitle:style:action:", v17, 1, v25);
    v23[0] = v18;
    v23[1] = 3221225472;
    v23[2] = __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_2;
    v23[3] = &unk_1E5148A40;
    v20 = v19;
    v24 = v20;
    objc_msgSend(v6, "addActionWithTitle:style:action:", v16, 0, v23);
    v21[0] = v18;
    v21[1] = 3221225472;
    v21[2] = __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_3;
    v21[3] = &unk_1E5148A40;
    v22 = v20;
    objc_msgSend(v6, "addActionWithTitle:style:action:", v15, 0, v21);

  }
}

- (BOOL)_validateOriginalAssetResourcesForDuplicateAction:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PXAssetsSelectionAction selectedAssets](self->_action, "selectedAssets", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x1E0C809B0];
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v5);
      +[PXAssetSupportChecker checkIsSupportedAsset:type:completionHandler:](PXAssetSupportChecker, "checkIsSupportedAsset:type:completionHandler:", v8, 3221225472, __89__PXPhotoKitDuplicateActionController__validateOriginalAssetResourcesForDuplicateAction___block_invoke, &unk_1E511BFA8, self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), &v16, a2);
      if (!*((_BYTE *)v17 + 24))
        break;
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  v10 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)performDuplicateAction:(int64_t)a3 newStillImageTime:(id *)a4 completionHandler:(id)a5
{
  id v8;
  PXDuplicateAssetsAction *v9;
  void *v10;
  PXActivityProgressController *v11;
  void *v12;
  uint64_t v13;
  id v14;
  PXActivityProgressController *v15;
  PXDuplicateAssetsAction *action;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  PXActivityProgressController *v22;
  id v23[2];
  __int128 v24;
  int64_t var3;
  id location;
  _QWORD v27[4];
  id v28;

  v8 = a5;
  if (a3
    && (v9 = self->_action) != 0
    && (a3 != 2 || -[PXDuplicateAssetsAction canExtractStill](v9, "canExtractStill"))
    && -[PXPhotoKitDuplicateActionController _validateOriginalAssetResourcesForDuplicateAction:](self, "_validateOriginalAssetResourcesForDuplicateAction:", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB38A8], "progressWithTotalUnitCount:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(PXActivityProgressController);
    PXLocalizedStringFromTable(CFSTR("PXPhotoKitDuplicateAssetActionPerformer_DOWNLOADING"), CFSTR("PhotosUICore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActivityProgressController setTitle:](v11, "setTitle:", v12);

    v13 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke;
    v27[3] = &unk_1E5149198;
    v14 = v10;
    v28 = v14;
    -[PXActivityProgressController setCancellationHandler:](v11, "setCancellationHandler:", v27);
    -[PXActivityProgressController showAnimated:allowDelay:](v11, "showAnimated:allowDelay:", 1, 1);
    objc_initWeak(&location, self);
    -[PXDuplicateAssetsAction setDuplicatesAsStill:](self->_action, "setDuplicatesAsStill:", a3 == 2);
    v24 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[PXDuplicateAssetsAction setStillImageTime:](self->_action, "setStillImageTime:", &v24);
    -[PXDuplicateAssetsAction setActionProgress:](self->_action, "setActionProgress:", v14);
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_2;
    v21[3] = &unk_1E511BFD0;
    v15 = v11;
    v22 = v15;
    objc_copyWeak(v23, &location);
    v23[1] = (id)a3;
    -[PXDuplicateAssetsAction setDownloadCompletionHandler:](self->_action, "setDownloadCompletionHandler:", v21);
    -[PXPhotoKitDuplicateActionController setProgress:](self, "setProgress:", v14);
    -[PXPhotoKitDuplicateActionController setProgressController:](self, "setProgressController:", v15);
    action = self->_action;
    -[PXPhotoKitDuplicateActionController undoManager](self, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_3;
    v18[3] = &unk_1E5141338;
    objc_copyWeak(&v20, &location);
    v19 = v8;
    -[PXAction executeWithUndoManager:completionHandler:](action, "executeWithUndoManager:completionHandler:", v17, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(v23);

    objc_destroyWeak(&location);
  }
  else if (v8)
  {
    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)_presentAlertWithError:(id)a3
{
  int64_t v4;
  _QWORD v5[5];
  char v6;
  char v7;
  __int16 v8;

  v8 = 0;
  -[PXPhotoKitDuplicateActionController _checkHasPhotos:hasVideos:](self, "_checkHasPhotos:hasVideos:", (char *)&v8 + 1, &v8);
  v4 = -[PXDuplicateAssetsAction assetCount](self->_action, "assetCount");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PXPhotoKitDuplicateActionController__presentAlertWithError___block_invoke;
  v5[3] = &__block_descriptor_42_e5_v8__0l;
  v5[4] = v4;
  v6 = HIBYTE(v8);
  v7 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v5);
}

- (void)setProgress:(id)a3
{
  NSProgress *v5;
  NSProgress *progress;
  NSProgress *v7;

  v5 = (NSProgress *)a3;
  progress = self->_progress;
  if (progress != v5)
  {
    v7 = v5;
    -[NSProgress removeObserver:forKeyPath:](progress, "removeObserver:forKeyPath:", self, CFSTR("fractionCompleted"));
    objc_storeStrong((id *)&self->_progress, a3);
    -[NSProgress addObserver:forKeyPath:options:context:](self->_progress, "addObserver:forKeyPath:options:context:", self, CFSTR("fractionCompleted"), 4, &PUDuplicateProgressObserverFractionCompletedContext);
    v5 = v7;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a6 == &PUDuplicateProgressObserverFractionCompletedContext)
  {
    -[PXPhotoKitDuplicateActionController progress](self, "progress");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v11)
    {
      objc_initWeak(&location, self);
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __86__PXPhotoKitDuplicateActionController_observeValueForKeyPath_ofObject_change_context___block_invoke;
      v18 = &unk_1E5148D30;
      objc_copyWeak(&v19, &location);
      px_dispatch_on_main_queue();
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PXPhotoKitDuplicateActionController;
    -[PXPhotoKitDuplicateActionController observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  }

}

- (void)_progressFractionCompletedDidChange
{
  double v3;
  double v4;
  void *v5;
  id v6;

  -[PXPhotoKitDuplicateActionController progress](self, "progress");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fractionCompleted");
  v4 = v3;
  -[PXPhotoKitDuplicateActionController progressController](self, "progressController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFractionCompleted:", v4);

}

- (void)_finishedDuplicationWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (v4)
  {
    -[PXPhotoKitDuplicateActionController progressController](self, "progressController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFractionCompleted:", 1.0);

  }
  else if (v6)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v7;
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Duplication failed with error %@.", (uint8_t *)&v11, 0xCu);
    }

    -[PXPhotoKitDuplicateActionController _presentAlertWithError:](self, "_presentAlertWithError:", v7);
  }
  -[PXPhotoKitDuplicateActionController progressController](self, "progressController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hideAnimated:allowDelay:", 1, v4);

  -[PXPhotoKitDuplicateActionController setProgressController:](self, "setProgressController:", 0);
  -[PXPhotoKitDuplicateActionController setProgress:](self, "setProgress:", 0);

}

- (void)_checkHasPhotos:(BOOL *)a3 hasVideos:(BOOL *)a4
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDuplicateActionController.m"), 259, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasPhotos"));

    if (a4)
      goto LABEL_3;
LABEL_21:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitDuplicateActionController.m"), 260, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("hasVideos"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_21;
LABEL_3:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[PXAssetsSelectionAction selectedAssets](self->_action, "selectedAssets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (!v9)
  {
    LOBYTE(v11) = 0;
    LOBYTE(v12) = 0;
    goto LABEL_19;
  }
  v10 = v9;
  LOBYTE(v11) = 0;
  LOBYTE(v12) = 0;
  v13 = *(_QWORD *)v19;
  while (2)
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v19 != v13)
        objc_enumerationMutation(v8);
      v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if ((v12 & 1) != 0)
      {
        v12 = 1;
        if ((v11 & 1) == 0)
          goto LABEL_10;
      }
      else
      {
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "isPhoto");
        if ((v11 & 1) == 0)
        {
LABEL_10:
          v11 = objc_msgSend(v15, "isVideo");
          goto LABEL_13;
        }
      }
      v11 = 1;
LABEL_13:
      if ((v12 & v11 & 1) != 0)
      {
        LOBYTE(v11) = 1;
        LOBYTE(v12) = 1;
        goto LABEL_19;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
      continue;
    break;
  }
LABEL_19:

  *a3 = v12;
  *a4 = v11;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (PXActivityProgressController)progressController
{
  return self->_progressController;
}

- (void)setProgressController:(id)a3
{
  objc_storeStrong((id *)&self->_progressController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressController, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_undoManager, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

void __86__PXPhotoKitDuplicateActionController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_progressFractionCompletedDidChange");

}

uint64_t __62__PXPhotoKitDuplicateActionController__presentAlertWithError___block_invoke(uint64_t a1)
{
  return +[PXPhotoKitDuplicateActionController _presentDuplicationWasInterruptedWithItemCount:hasPhotos:hasVideos:](PXPhotoKitDuplicateActionController, "_presentDuplicationWasInterruptedWithItemCount:hasPhotos:hasVideos:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

uint64_t __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;

  if (!a2)
    return 0;
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitDuplicateAssetActionPerformer_DUPLICATING"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTitle:", v3);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_msgSend(WeakRetained, "_validateOriginalAssetResourcesForDuplicateAction:", *(_QWORD *)(a1 + 48));

  return v5;
}

uint64_t __98__PXPhotoKitDuplicateActionController_performDuplicateAction_newStillImageTime_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id *v5;
  id v6;
  id WeakRetained;
  uint64_t result;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_finishedDuplicationWithSuccess:error:", a2, v6);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

void __89__PXPhotoKitDuplicateActionController__validateOriginalAssetResourcesForDuplicateAction___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)v8;
  if ((a2 & 1) == 0)
  {
    if (!(v7 | v8))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXPhotoKitDuplicateActionController.m"), 121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("isSupported || (uti || codecName)"));

    }
    objc_msgSend(*(id *)(a1 + 32), "progress");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cancel");

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v19 = v12;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEBUG, "Duplication failed for unsupported asset: %@", buf, 0xCu);
    }

    buf[0] = 0;
    v17 = 0;
    v13 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "assetCount");
    objc_msgSend(*(id *)(a1 + 32), "_checkHasPhotos:hasVideos:", buf, &v17);
    _ConditionallyFormattedString(buf[0], v17, CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_ONE_PHOTO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_N_PHOTOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_ONE_VIDEO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_N_VIDEOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_ONE_ITEM"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_TITLE_N_ITEMS"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _ConditionallyFormattedString(buf[0], v17, CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_ONE_PHOTO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_N_PHOTOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_ONE_VIDEO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_N_VIDEOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_ONE_ITEM"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_UNSUPPORTED_FORMAT_MESSAGE_N_ITEMS"), v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXAssetSupportChecker presentAlertWithTitle:message:uti:codecName:alertControllerPresenter:completionHandler:](PXAssetSupportChecker, "presentAlertWithTitle:message:uti:codecName:alertControllerPresenter:completionHandler:", v14, v15, v7, v9, &__block_literal_global_38698, 0);

  }
}

uint64_t __89__PXPhotoKitDuplicateActionController__validateOriginalAssetResourcesForDuplicateAction___block_invoke_179(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0DC3470];
  v3 = a2;
  objc_msgSend(v2, "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "px_firstKeyWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pl_presentViewController:animated:", v3, 1);

  return 1;
}

uint64_t __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 1);
  return result;
}

uint64_t __95__PXPhotoKitDuplicateActionController_configureAlertConfiguration_withUserConfirmationHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, 1, 2);
  return result;
}

+ (void)_presentDuplicationWasInterruptedWithItemCount:(int64_t)a3 hasPhotos:(BOOL)a4 hasVideos:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a5;
  v6 = a4;
  _ConditionallyFormattedString(a4, a5, CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_ONE_PHOTO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_N_PHOTOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_ONE_VIDEO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_N_VIDEOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_ONE_ITEM"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_TITLE_N_ITEMS"), a3);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  _ConditionallyFormattedString(v6, v5, CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_ONE_PHOTO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_N_PHOTOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_ONE_VIDEO"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_N_VIDEOS"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_ONE_ITEM"), CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILED_MESSAGE_N_ITEMS"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v15, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0DC3448];
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitDuplicateAssetActionPerformer_FAILURE_OK_BUTTON"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "actionWithTitle:style:handler:", v11, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v12);

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "px_firstKeyWindow");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pl_presentViewController:animated:", v9, 1);

}

@end
