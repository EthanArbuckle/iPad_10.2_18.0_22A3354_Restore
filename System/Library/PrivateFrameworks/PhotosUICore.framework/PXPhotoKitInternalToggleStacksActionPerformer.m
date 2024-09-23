@implementation PXPhotoKitInternalToggleStacksActionPerformer

+ (BOOL)canPerformWithActionManager:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canShowInternalUI");

  if (!v4)
    return 0;
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableStacksReviewUI");

  return v6;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("Toggle Stacks");
}

- (void)performUserInteractionTask
{
  uint64_t v3;
  void *v4;
  id v5;

  -[PXPhotoKitAssetActionPerformer photoKitDataSourceManager](self, "photoKitDataSourceManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "includeAllBurstAssets") ^ 1;
  -[PXPhotoKitAssetActionPerformer photoKitDataSourceManager](self, "photoKitDataSourceManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIncludeAllBurstAssets:", v3);

}

@end
