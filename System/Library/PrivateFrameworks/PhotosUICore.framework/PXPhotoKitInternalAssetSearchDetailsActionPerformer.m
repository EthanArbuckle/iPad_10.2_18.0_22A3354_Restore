@implementation PXPhotoKitInternalAssetSearchDetailsActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  void *v7;
  char v8;
  BOOL v9;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canShowInternalUI");
  if (a3)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("Search Details");
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("magnifyingglass");
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  id v10;

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer assetsByAssetCollection](self, "assetsByAssetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[PXSearchDiagnosticsService viewControllerForDetailsOfAsset:](PXSearchDiagnosticsService, "viewControllerForDetailsOfAsset:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXActionPerformer presentViewController:](self, "presentViewController:", v8);

  }
  else
  {
    v9 = 0;
  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v9, 0);

}

@end
