@implementation PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v7 = a3;
  v8 = a4;
  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canShowInternalUI");

  if (v10)
  {
    objc_msgSend(v7, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "hasSharedLibraryOrPreview"))
    {
      v13 = objc_msgSend(v8, "assetCollectionSubtype");
      LOBYTE(v10) = v13 == 1000000205 || v13 == 1000000301;
    }
    else
    {
      LOBYTE(v10) = 0;
    }

  }
  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("(Internal) File Shared Library Radar");
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
  v7 = __88__PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer_performUserInteractionTask__block_invoke;
  v8 = &unk_1E5142510;
  objc_copyWeak(&v9, &location);
  PXFileRadarViewControllerForSharedLibraryAssets(v3, &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXActionPerformer presentViewController:](self, "presentViewController:", v4, v5, v6, v7, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __88__PXPhotoKitInternalFileRadarForSharedLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, 0);

}

@end
