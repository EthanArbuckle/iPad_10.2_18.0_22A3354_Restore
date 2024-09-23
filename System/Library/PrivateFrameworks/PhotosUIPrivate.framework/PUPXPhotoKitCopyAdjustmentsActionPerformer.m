@implementation PUPXPhotoKitCopyAdjustmentsActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  PUPhotoEditCopyEditsViewController *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id location;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 869, CFSTR("Adjustments can only be copied from one unique asset"));

  }
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
  objc_msgSend(MEMORY[0x1E0D7CA48], "synchronousCompositionControllerForAsset:networkAccessAllowed:disposition:originalComposition:", v7, 0, &v21, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if (-[PXPhotoKitAssetActionPerformer shouldSkipUserConfirmation](self, "shouldSkipUserConfirmation")
      || !+[PUPhotoEditCopyEditsViewController shouldPresentForCopyingFromCompositionController:asset:](PUPhotoEditCopyEditsViewController, "shouldPresentForCopyingFromCompositionController:asset:", v8, v7))
    {
      objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "copyPresetFromAsset:removeCrop:", v7, 1);

      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
    }
    else
    {
      v9 = -[PUPhotoEditCopyEditsViewController initWithCompositionController:asset:]([PUPhotoEditCopyEditsViewController alloc], "initWithCompositionController:asset:", v8, v7);
      objc_initWeak(&location, self);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __72__PUPXPhotoKitCopyAdjustmentsActionPerformer_performUserInteractionTask__block_invoke;
      v18[3] = &unk_1E58AA420;
      objc_copyWeak(&v19, &location);
      -[PUPhotoEditCopyEditsViewController setCompletionHandler:](v9, "setCompletionHandler:", v18);
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v9);
      objc_msgSend(v10, "setModalPresentationStyle:", 7);
      objc_msgSend(v10, "popoverPresentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "adaptiveSheetPresentationController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3C78], "mediumDetent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDetents:", v14);

      -[PXActionPerformer presentViewController:](self, "presentViewController:", v10);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);

    }
  }
  else
  {
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location) = 0;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Failed to copy edits, composition controller failed to load", (uint8_t *)&location, 2u);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  }

}

void __72__PUPXPhotoKitCopyAdjustmentsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

+ (BOOL)canPerformWithSelectionSnapshot:(id)a3 person:(id)a4 socialGroup:(id)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;

  v6 = a3;
  objc_msgSend(v6, "selectedIndexPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 == 1)
  {
    objc_msgSend(v6, "firstObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;

      if (v10)
      {
        v11 = objc_msgSend(a1, "_canPerformOnAsset:", v10);
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      v10 = 0;
    }
    v11 = 0;
    goto LABEL_9;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

+ (BOOL)_canPerformOnAsset:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;

  v3 = a3;
  +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "enableSpatialMediaEditing");

  if (objc_msgSend(v3, "canPerformEditOperation:", 2)
    && objc_msgSend(MEMORY[0x1E0D7CB58], "canPerformEditOnAsset:", v3))
  {
    objc_msgSend(MEMORY[0x1E0D7CA80], "sharedPresetManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPhotoEditProtoSettings sharedInstance](PUPhotoEditProtoSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "assetHasCopyableAdjustments:removeCrop:", v3, objc_msgSend(v7, "enableSelectiveCopyEdits") ^ 1);
    if (((v8 ^ 1 | v5) & 1) == 0)
      v8 = objc_msgSend(v3, "isSpatialMedia") ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("COPY_ACTIVITY_ADJUSTMENTS"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("slider.horizontal.2.square.on.square");
}

@end
