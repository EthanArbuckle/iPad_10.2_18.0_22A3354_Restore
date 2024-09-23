@implementation PUPXPhotoKitAddToLastUsedAlbumActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v5, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_performUserInteractionTaskWithAssets:(id)a3
{
  objc_class *v4;
  id v5;
  PXAddAssetsToLastUsedAssetCollectionAction *v6;
  id v7;
  PXAddAssetsToLastUsedAssetCollectionAction *preparedAction;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0D7B178];
  v5 = a3;
  v22 = 0;
  v6 = (PXAddAssetsToLastUsedAssetCollectionAction *)objc_msgSend([v4 alloc], "initWithAssets:error:", v5, &v22);

  v7 = v22;
  preparedAction = self->_preparedAction;
  self->_preparedAction = v6;

  if (v7)
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_fault_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_FAULT, "unable to create action, %@", buf, 0xCu);
    }

  }
  -[PXAddAssetsToLastUsedAssetCollectionAction underlyingAction](self->_preparedAction, "underlyingAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "localizedTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v11;
      _os_log_fault_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_FAULT, "missing title for album %@", buf, 0xCu);
    }

  }
  v14 = (void *)MEMORY[0x1E0D7BB08];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __87__PUPXPhotoKitAddToLastUsedAlbumActionPerformer__performUserInteractionTaskWithAssets___block_invoke;
  v20 = &unk_1E58A7870;
  v21 = v12;
  v15 = v12;
  v16 = (id)objc_msgSend(v14, "show:", &v17);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0, v17, v18, v19, v20);

}

- (void)performBackgroundTask
{
  PXAddAssetsToLastUsedAssetCollectionAction *v3;
  PXAddAssetsToLastUsedAssetCollectionAction *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  PXAddAssetsToLastUsedAssetCollectionAction *v8;

  v3 = self->_preparedAction;
  v4 = v3;
  if (v3)
  {
    -[PXAddAssetsToLastUsedAssetCollectionAction underlyingAction](v3, "underlyingAction");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPXPhotoKitAddToAlbumActionPerformer _configureAction:](PUPXPhotoKitAddToAlbumActionPerformer, "_configureAction:", v5);

    -[PXActionPerformer undoManager](self, "undoManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__PUPXPhotoKitAddToLastUsedAlbumActionPerformer_performBackgroundTask__block_invoke;
    v7[3] = &unk_1E58AA020;
    v7[4] = self;
    v8 = v4;
    -[PXAddAssetsToLastUsedAssetCollectionAction executeWithUndoManager:completionHandler:](v8, "executeWithUndoManager:completionHandler:", v6, v7);

  }
  else
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 0, 0);
  }

}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D7B178];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commandTitleWithPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedAction, 0);
}

void __70__PUPXPhotoKitAddToLastUsedAlbumActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v3 = a2;
  v12[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0D09910];
    v6 = *MEMORY[0x1E0D7BEE8];
    v11[0] = *MEMORY[0x1E0D09830];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    v11[1] = *MEMORY[0x1E0D09828];
    objc_msgSend(*(id *)(a1 + 40), "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendEvent:withPayload:", v6, v10);

  }
}

uint64_t __87__PUPXPhotoKitAddToLastUsedAlbumActionPerformer__performUserInteractionTaskWithAssets___block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFString *v2;

  if (*(_QWORD *)(a1 + 32))
    v2 = *(const __CFString **)(a1 + 32);
  else
    v2 = CFSTR("?");
  return objc_msgSend(MEMORY[0x1E0D7B178], "configureToast:withAlbumName:", a2, v2);
}

void __75__PUPXPhotoKitAddToLastUsedAlbumActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7)
    objc_msgSend(WeakRetained, "_performUserInteractionTaskWithAssets:", v10);
  else
    objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  NSObject *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!+[PUPXPhotoKitAddToAlbumActionPerformer canPerformOnAsset:inAssetCollection:person:socialGroup:](PUPXPhotoKitAddToAlbumActionPerformer, "canPerformOnAsset:inAssetCollection:person:socialGroup:", v9, a4, a5, a6))
  {
    PLUIGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEBUG, "can't add %@ to last used album because PUPXPhotoKitAddToAlbumActionPerformer denies it", buf, 0xCu);
    }
    goto LABEL_9;
  }
  v10 = (void *)MEMORY[0x1E0D7B178];
  objc_msgSend(v9, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "targetAssetCollectionInPhotoLibrary:error:", v11, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v17;

  if (!v12)
  {
    PLUIGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v19 = v9;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_DEBUG, "can't add %@ to last used album because the target asset collection is missing: %@", buf, 0x16u);
    }

LABEL_9:
    v14 = 0;
    goto LABEL_10;
  }
  v14 = 1;
LABEL_10:

  return v14;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("rectangle.badge.plus");
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0D7B178];
  objc_msgSend(a4, "photoLibrary", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commandTitleWithPhotoLibrary:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
