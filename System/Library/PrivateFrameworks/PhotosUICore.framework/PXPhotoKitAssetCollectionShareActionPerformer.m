@implementation PXPhotoKitAssetCollectionShareActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  int v4;
  uint64_t v5;
  PXPhotosDataSourceConfiguration *v6;
  PXPhotosDataSourceConfiguration *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  PXPhotosDataSource *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXActivitySharingContext *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  PXPhotosDataSource *v42;
  _QWORD v43[2];
  _QWORD v44[3];
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (objc_class *)objc_opt_class();
    NSStringFromClass(v33);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "px_descriptionForAssertionMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2087, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.assetCollection"), v28, v34);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2087, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.assetCollection"), v28);
  }

LABEL_3:
  v4 = objc_msgSend(v3, "px_wantsCurationByDefault");
  if (v4)
    v5 = 80;
  else
    v5 = 0;
  v6 = -[PXPhotosDataSourceConfiguration initWithAssetCollection:options:]([PXPhotosDataSourceConfiguration alloc], "initWithAssetCollection:options:", v3, v5);
  v7 = v6;
  if (v4)
  {
    -[PXPhotosDataSourceConfiguration setCurationKind:](v6, "setCurationKind:", 1);
    -[PXPhotosDataSourceConfiguration setWantsCurationByDefault:](v7, "setWantsCurationByDefault:", 1);
    PLSharingGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "localizedTitle");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v46 = v9;
      v47 = 2114;
      v48 = v10;
      v49 = 2112;
      v50 = v12;
      _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "PXPhotoKitAssetCollectionShareActionPerformer: Asset collection \"%@\" (UUID: %{public}@) is curated by default (type: %@), so bringing up share sheet with only curated assets", buf, 0x20u);

    }
  }
  v13 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v7);
  -[PXActionPerformer hostViewController](self, "hostViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "keyAssetReference");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "asset");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = v13;
  v18 = -[PXActivitySharingContext initWithAssetCollection:photosDataSource:]([PXActivitySharingContext alloc], "initWithAssetCollection:photosDataSource:", v3, v13);
  -[PXActivitySharingContext setKeyAsset:](v18, "setKeyAsset:", v17);
  -[PXActivitySharingContext setSourceOrigin:](v18, "setSourceOrigin:", 3);
  v44[0] = CFSTR("com.apple.Photos.activity.SlideShow");
  v44[1] = CFSTR("PUActivityTypeEditDateTime");
  v44[2] = CFSTR("PUActivityTypeEditLocation");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setExcludedActivityTypes:](v18, "setExcludedActivityTypes:", v19);

  -[PXActivitySharingContext excludedActivityTypes](v18, "excludedActivityTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = CFSTR("PUActivityTypeHide");
  v43[1] = CFSTR("PUActivityTypeDuplicate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayByAddingObjectsFromArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActivitySharingContext setExcludedActivityTypes:](v18, "setExcludedActivityTypes:", v22);

  objc_msgSend(v14, "px_sharePresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v23)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2118, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sharePresentation"));

  }
  objc_msgSend(v23, "createActivitySharingControllerWithContext:", v18);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "selectInitialAssets");
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2121, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

  }
  objc_msgSend(v24, "activityViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v25)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2122, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController.activityViewController"), v40);
LABEL_22:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = (objc_class *)objc_opt_class();
    NSStringFromClass(v35);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "px_descriptionForAssertionMessage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v40 = (void *)v36;
    v31 = v39;
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2122, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController.activityViewController"), v37, v38);

    goto LABEL_22;
  }
LABEL_16:
  objc_msgSend(v14, "presentViewController:animated:completion:", v25, 1, 0);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);

}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  BOOL v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2059, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v14);
LABEL_12:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2059, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v14, v16);

    goto LABEL_12;
  }
LABEL_3:
  if ((objc_msgSend(v6, "px_isMomentShare") & 1) != 0
    || (objc_msgSend(v6, "px_isHiddenSmartAlbum") & 1) != 0
    || (objc_msgSend(v6, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
    || (objc_msgSend(v6, "px_isMemory") & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setFetchLimit:", 1);
    objc_msgSend(v10, "setWantsIncrementalChangeDetails:", 0);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v11, "count") != 0;

  }
  return v7;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0CB3940];
  if (a3 > 2)
    v6 = 0;
  else
    v6 = off_1E5124918[a3];
  v7 = v6;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("PXPhotoKitAssetCollectionActionManager%@Title_Share"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("square.and.arrow.up");
}

@end
