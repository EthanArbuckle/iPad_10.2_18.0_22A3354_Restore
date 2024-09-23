@implementation PXPhotoKitAssetContentSyndicationFileRadarActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  void *v7;
  int v8;
  char v9;

  v6 = a3;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canShowInternalUI");

  if (v8)
  {
    if ((objc_msgSend(v6, "px_isSyndicatedAsset") & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v6, "px_wasSavedThroughSyndication");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("File Hubble Radar");
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("ant.circle");
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __87__PXPhotoKitAssetContentSyndicationFileRadarActionPerformer_performUserInteractionTask__block_invoke;
  v8 = &unk_1E5142510;
  objc_copyWeak(&v9, &location);
  PXFileRadarViewControllerForContentSyndicationAssets(v3, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXActionPerformer presentViewController:](self, "presentViewController:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __87__PXPhotoKitAssetContentSyndicationFileRadarActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, 0);

}

@end
