@implementation PXPhotoKitToggleFavoriteActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  return +[PXFavoriteAssetsAction canPerformOnAsset:inAssetCollection:](PXFavoriteAssetsAction, "canPerformOnAsset:inAssetCollection:", a3, a4, a5, a6);
}

+ (BOOL)canPerformOnSubsetOfSelection
{
  return 1;
}

+ (BOOL)toggledValueForActionManager:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "effectiveSelectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItemsEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = +[PXFavoriteAssetsAction toggledValueForAssets:](PXFavoriteAssetsAction, "toggledValueForAssets:", v4);
  return (char)v3;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  __CFString *v4;

  if (objc_msgSend(a1, "toggledValueForActionManager:", a4))
    v4 = CFSTR("FAVORITE_ASSET_SHORTCUT");
  else
    v4 = CFSTR("UNFAVORITE_ASSET_SHORTCUT");
  return PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  if (objc_msgSend(a1, "toggledValueForActionManager:", a3))
    return CFSTR("heart");
  else
    return CFSTR("heart.slash");
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __69__PXPhotoKitToggleFavoriteActionPerformer_performUserInteractionTask__block_invoke;
  v5[3] = &unk_1E5139990;
  v5[4] = self;
  objc_copyWeak(&v6, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary(v3, v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)performBackgroundTask
{
  NSArray *v3;
  _BOOL8 v4;
  PXFavoriteAssetsAction *v5;
  void *v6;
  NSArray *v7;
  _QWORD v8[5];
  NSArray *v9;
  BOOL v10;

  v3 = self->_assetsToProcess;
  v4 = +[PXFavoriteAssetsAction toggledValueForAssets:](PXFavoriteAssetsAction, "toggledValueForAssets:", self->_assetsToProcess);
  if (!v4 && -[PXActionPerformer prefersAssetInclusionAfterRemoval](self, "prefersAssetInclusionAfterRemoval"))
    -[PXPhotoKitAssetActionPerformer forceIncludeAssetsInDataSource](self, "forceIncludeAssetsInDataSource");
  v5 = -[PXFavoriteAssetsAction initWithAssets:favorite:]([PXFavoriteAssetsAction alloc], "initWithAssets:favorite:", v3, v4);
  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__PXPhotoKitToggleFavoriteActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E51399B8;
  v8[4] = self;
  v9 = v3;
  v10 = v4;
  v7 = v3;
  -[PXAction executeWithUndoManager:completionHandler:](v5, "executeWithUndoManager:completionHandler:", v6, v8);

}

- (void)_logEventForAssets:(id)a3 favorite:(BOOL)a4
{
  void **v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void **)MEMORY[0x1E0D096E0];
    if (!a4)
      v5 = (void **)MEMORY[0x1E0D096E8];
    v6 = *v5;
    v7 = (void *)MEMORY[0x1E0D09910];
    v8 = *MEMORY[0x1E0D09828];
    v16[0] = a3;
    v9 = *MEMORY[0x1E0D09830];
    v15[0] = v8;
    v15[1] = v9;
    v10 = v6;
    v11 = a3;
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sendEvent:withPayload:", v10, v14);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsToProcess, 0);
}

void __64__PXPhotoKitToggleFavoriteActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if ((_DWORD)a2)
    objc_msgSend(*(id *)(a1 + 32), "_logEventForAssets:favorite:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, v5);

}

void __69__PXPhotoKitToggleFavoriteActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id WeakRetained;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  if (objc_msgSend(v12, "count"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 192), a3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    v10 = 1;
    v11 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = WeakRetained;
    v10 = 0;
    v11 = v7;
  }
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", v10, v11);

}

@end
