@implementation PXPhotoKitRemoveFromFeaturedPhotosActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  char v7;

  v6 = a4;
  if ((objc_msgSend(v6, "px_isSuggestion") & 1) != 0)
    v7 = 1;
  else
    v7 = objc_msgSend(v6, "px_isFeaturedPhotosCollection");

  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotoKitRemoveFromFeaturedPhotosActionPerformer_Title"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("rectangle.badge.minus");
}

+ (BOOL)isActionDestructive
{
  return 1;
}

- (void)performBackgroundTask
{
  PXRemoveAssetsFromFeaturedPhotosAction *v3;
  void *v4;
  PXRemoveAssetsFromFeaturedPhotosAction *v5;
  void *v6;
  _QWORD v7[5];

  v3 = [PXRemoveAssetsFromFeaturedPhotosAction alloc];
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXAssetsAction initWithAssets:](v3, "initWithAssets:", v4);

  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PXPhotoKitRemoveFromFeaturedPhotosActionPerformer_performBackgroundTask__block_invoke;
  v7[3] = &unk_1E5148B78;
  v7[4] = self;
  -[PXAction executeWithUndoManager:completionHandler:](v5, "executeWithUndoManager:completionHandler:", v6, v7);

}

uint64_t __74__PXPhotoKitRemoveFromFeaturedPhotosActionPerformer_performBackgroundTask__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", a2, a3);
}

@end
