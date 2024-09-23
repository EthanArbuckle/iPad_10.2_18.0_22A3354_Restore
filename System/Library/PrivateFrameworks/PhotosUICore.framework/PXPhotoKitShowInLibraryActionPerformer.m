@implementation PXPhotoKitShowInLibraryActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  BOOL v8;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v7 = a3;
  if ((objc_msgSend(v7, "isHidden") & 1) != 0
    || (objc_msgSend(v7, "isTrashed") & 1) != 0
    || (objc_msgSend(v7, "isRecoveredAsset") & 1) != 0
    || (objc_msgSend(v7, "isCloudSharedAsset") & 1) != 0
    || objc_msgSend(v7, "px_isSyndicatedAsset")
    && (objc_msgSend(v7, "px_wasSavedThroughSyndication") & 1) == 0
    && (+[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v10, "includeSharedWithYou"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "BOOLValue"),
        v11,
        v10,
        !v12))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1, "_assetToRevealFromAsset:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v13 != 0;

  }
  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v5 = 0;
  else
    v5 = off_1E5124918[a3];
  v6 = v5;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_ShowInLibrary"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v7, CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("photo.on.rectangle");
}

+ (id)_assetToRevealFromAsset:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier");

  if (v5 == 3)
  {
    PXAssetToRevealForSyndicationLibraryAsset(v3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v8 = v6;
    goto LABEL_7;
  }
  if (objc_msgSend(v3, "sourceType") != 8)
  {
    v6 = v3;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXAssetToRevealForMomentSharedAsset(v3, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v8;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (void *)objc_opt_class();
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_assetToRevealFromAsset:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PXPhotoKitShowInLibraryActionPerformer_performUserInteractionTask__block_invoke;
  v8[3] = &unk_1E5144F70;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v7, "px_navigateToMomentsViewRevealingAsset:completionHandler:", v6, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __68__PXPhotoKitShowInLibraryActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id WeakRetained;
  id v7;

  v7 = a3;
  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:", CFSTR("PXPhotoKitShowInLibraryActionPerformerCompleted"), 0);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, v7);

}

@end
