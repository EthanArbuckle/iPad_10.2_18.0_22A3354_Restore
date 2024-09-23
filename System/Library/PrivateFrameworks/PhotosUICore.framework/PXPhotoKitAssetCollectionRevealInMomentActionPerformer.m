@implementation PXPhotoKitAssetCollectionRevealInMomentActionPerformer

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
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_assetToRevealInAssetCollection:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __84__PXPhotoKitAssetCollectionRevealInMomentActionPerformer_performUserInteractionTask__block_invoke;
    v8[3] = &unk_1E5144F70;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v6, "px_navigateToMomentsViewRevealingAsset:completionHandler:", v5, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_errorWithDomain:code:debugDescription:", CFSTR("PXCMMErrorDomain"), -1012, CFSTR("Failed to locate an asset to reveal"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v7);

  }
}

void __84__PXPhotoKitAssetCollectionRevealInMomentActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id *v4;
  id v5;
  id WeakRetained;
  id v7;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", a2, v5);

  if ((_DWORD)a2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("PXPhotoKitShowInLibraryActionPerformerCompleted"), 0);

  }
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  uint64_t v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;

  v7 = a4;
  objc_msgSend(a3, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (objc_class *)objc_opt_class();
    NSStringFromClass(v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1560, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v22, v24);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1560, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v22);
  }

LABEL_3:
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v7, "people");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  if (objc_msgSend(v8, "estimatedAssetCount") == 1 && !objc_msgSend(v9, "count"))
  {
    objc_msgSend(v7, "assetsFetchResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v13;
    if (v13
      || (objc_msgSend(a1, "_assetToRevealInAssetCollection:", v8),
          (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      if ((objc_msgSend(v14, "isHidden") & 1) == 0)
      {
        v15 = objc_msgSend(v14, "isTrashed");
        v10 = v15 ^ 1;
        if (!v13 || (v15 & 1) != 0)
          goto LABEL_14;
        if (objc_msgSend(v14, "sourceType") == 8)
        {
          v10 = PXCanAttemptToRevealMomentSharedAsset(v14, 0);
          goto LABEL_14;
        }
        objc_msgSend(v14, "photoLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "wellKnownPhotoLibraryIdentifier");

        if (v17 != 3)
          goto LABEL_14;
        objc_msgSend(v14, "fetchPropertySetsIfNeeded");
        if ((objc_msgSend(v14, "isSyndicatedAssetSavedToUserLibrary") & 1) != 0
          || objc_msgSend(v14, "isGuestAsset"))
        {
          +[PXUserDefaults standardUserDefaults](PXUserDefaults, "standardUserDefaults");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "includeSharedWithYou");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v19, "BOOLValue");

          goto LABEL_14;
        }
      }
    }
    v10 = 0;
LABEL_14:

    goto LABEL_9;
  }
  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)createBarButtonItemForAssetCollectionReference:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBarButtonSystemItem:target:action:", 4, v7, a5);

  return v8;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  if (a3 > 2)
    return 0;
  PXLocalizedStringFromTable(CFSTR("PXPhotoKitAssetCollectionManagerStandardActionTitle_RevealInMoment"), CFSTR("PhotosUICore"));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("photo.on.rectangle");
}

+ (id)_assetToRevealInAssetCollection:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v3 = (void *)MEMORY[0x1E0CD1570];
  v4 = a3;
  objc_msgSend(v3, "fetchOptionsWithPhotoLibrary:orObject:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setReverseSortOrder:", 1);
  objc_msgSend(v5, "setFetchLimit:", 1);
  objc_msgSend(v5, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "sourceType") == 8)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PXAssetToRevealForMomentSharedAsset(v7, 0, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = v8;
LABEL_5:

    v7 = (void *)v9;
    goto LABEL_6;
  }
  objc_msgSend(v7, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "wellKnownPhotoLibraryIdentifier");

  if (v11 == 3)
  {
    PXAssetToRevealForSyndicationLibraryAsset(v7);
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

@end
