@implementation PXPhotoKitDuplicateAssetActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return +[PXDuplicateAssetsAction canPerformOnAsset:inAssetCollection:](PXDuplicateAssetsAction, "canPerformOnAsset:inAssetCollection:", a3, a4, a5, a6);
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitDuplicateAssetActionPerformer_Title"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("plus.square.on.square");
}

- (void)_setupActionControllerWithAssets:(id)a3 updateSelection:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  PXPhotoKitDuplicateActionController *v9;
  void *v10;
  PXPhotoKitDuplicateActionController *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  __int16 v15[8];
  _QWORD v16[4];
  PXPhotoKitDuplicateActionController *v17;
  PXPhotoKitDuplicateAssetActionPerformer *v18;

  v4 = a4;
  v6 = a3;
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    PXContentSyndicationSelectionSnapshotForAssets((uint64_t)v6);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v8;
  }
  v9 = [PXPhotoKitDuplicateActionController alloc];
  -[PXActionPerformer undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPhotoKitDuplicateActionController initWithSelectionSnapshot:undoManager:](v9, "initWithSelectionSnapshot:undoManager:", v7, v10);

  -[PXPhotoKitDuplicateAssetActionPerformer setDuplicateActionController:](self, "setDuplicateActionController:", v11);
  if (-[PXPhotoKitDuplicateActionController shouldUseAlertController](v11, "shouldUseAlertController"))
  {
    -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke;
    v16[3] = &unk_1E5142AB0;
    v17 = v11;
    v18 = self;
    objc_msgSend(v12, "presentAlertWithConfigurationHandler:", v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      PXAssertGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15[0] = 0;
        _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "Failed to present the duplicate assets confirmation alert", (uint8_t *)v15, 2u);
      }

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
    }

  }
  else
  {
    -[PXPhotoKitDuplicateAssetActionPerformer setAction:](self, "setAction:", 1);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PXPhotoKitDuplicateAssetActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5142AD8;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)performBackgroundTask
{
  void *v4;
  int64_t v5;
  _QWORD v6[6];
  _BYTE v7[24];

  -[PXPhotoKitDuplicateAssetActionPerformer duplicateActionController](self, "duplicateActionController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotoKitDuplicateAssetActionPerformer action](self, "action");
  -[PXPhotoKitDuplicateAssetActionPerformer stillImageTime](self, "stillImageTime");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PXPhotoKitDuplicateAssetActionPerformer_performBackgroundTask__block_invoke;
  v6[3] = &unk_1E5142B00;
  v6[4] = self;
  v6[5] = a2;
  objc_msgSend(v4, "performDuplicateAction:newStillImageTime:completionHandler:", v5, v7, v6);

}

- (PXPhotoKitDuplicateActionController)duplicateActionController
{
  return self->_duplicateActionController;
}

- (void)setDuplicateActionController:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateActionController, a3);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)stillImageTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 208);
  return self;
}

- (void)setStillImageTime:(id *)a3
{
  int64_t var3;

  var3 = a3->var3;
  *(_OWORD *)&self->_stillImageTime.value = *(_OWORD *)&a3->var0;
  self->_stillImageTime.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_duplicateActionController, 0);
}

uint64_t __64__PXPhotoKitDuplicateAssetActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v5;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXPhotoKitDuplicateAssetActionPerformer.m"), 88, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[NSThread isMainThread]"));

  }
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, 0);
}

void __69__PXPhotoKitDuplicateAssetActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  v7 = a4;
  if (objc_msgSend(v9, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "_setupActionControllerWithAssets:updateSelection:", v9, a2 == 3);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 0, v7);
  }

}

uint64_t __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke_2;
  v4[3] = &unk_1E5142A88;
  v2 = *(void **)(a1 + 32);
  v4[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v2, "configureAlertConfiguration:withUserConfirmationHandler:", a2, v4);
}

uint64_t __92__PXPhotoKitDuplicateAssetActionPerformer__setupActionControllerWithAssets_updateSelection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setAction:");
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, 0);
}

@end
