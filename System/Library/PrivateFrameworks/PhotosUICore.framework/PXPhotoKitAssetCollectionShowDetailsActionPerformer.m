@implementation PXPhotoKitAssetCollectionShowDetailsActionPerformer

- (id)_localizedTitleForAssetCollection:(id)a3 titleCategory:(int64_t *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D716B0]), "initWithPreset:", 2);
      objc_msgSend(v5, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringFromDate:toDate:", v7, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = 5;

      v6 = (void *)v10;
    }

  }
  return v6;
}

- (id)_displayTitleInfoForDetailsOfAssetCollection:(id)a3 withTitleCategory:(int64_t)a4 preferredAttributesPromise:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v15;

  v15 = a4;
  v8 = a5;
  v9 = a3;
  -[PXPhotoKitAssetCollectionShowDetailsActionPerformer _localizedTitleForAssetCollection:titleCategory:](self, "_localizedTitleForAssetCollection:titleCategory:", v9, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E50B3470, "defaultHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "titleForDisplayableText:titleCategory:options:", v10, v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[PXDisplayTitleInfo displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:defaultTitle:defaultTitleCategory:titleKey:titleCategoryKey:defaultSubtitle:subtitleKey:simulatedLoadingDelay:preferredAttributesPromise:](PXDisplayTitleInfo, "displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:defaultTitle:defaultTitleCategory:titleKey:titleCategoryKey:defaultSubtitle:subtitleKey:simulatedLoadingDelay:preferredAttributesPromise:", v9, a4, v12, v15, *MEMORY[0x1E0CD1CD0], *MEMORY[0x1E0CD1CC8], 0.0, 0, *MEMORY[0x1E0CD1CC0], v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  PXPhotosDataSourceConfiguration *v14;
  void *v15;
  PXPhotosDataSource *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  PXPhotosDetailsContext *v23;
  PXPhotosDetailsUIViewController *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD aBlock[4];
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[3];

  v36[1] = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = objc_claimAutoreleasedReturnValue();

    v28 = (void *)v6;
    if (objc_msgSend(v4, "isTransient"))
    {
      v7 = (void *)MEMORY[0x1E0CD14E0];
      v36[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "transientCollectionListWithCollections:title:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CD14E0], "fetchCollectionsInCollectionList:options:", v9, v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = (void *)MEMORY[0x1E0CD13B8];
      objc_msgSend(v4, "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v6);
      v10 = objc_claimAutoreleasedReturnValue();

    }
    v27 = (void *)v10;
    v14 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v10, 0);
    -[PXPhotosDataSourceConfiguration setHideHiddenAssets:](v14, "setHideHiddenAssets:", 1);
    v34 = *MEMORY[0x1E0CD1958];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v14, "setFetchPropertySets:", v15);

    v16 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v14);
    v17 = objc_msgSend(v4, "titleCategory");
    if (v17)
      v18 = v17;
    else
      v18 = 6;
    v19 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke;
    aBlock[3] = &unk_1E5138A20;
    v20 = v4;
    v31 = v20;
    v21 = _Block_copy(aBlock);
    -[PXPhotoKitAssetCollectionShowDetailsActionPerformer _displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:preferredAttributesPromise:](self, "_displayTitleInfoForDetailsOfAssetCollection:withTitleCategory:preferredAttributesPromise:", v20, v18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[PXPhotosDetailsContext initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:]([PXPhotosDetailsContext alloc], "initWithPhotosDataSource:displayTitleInfo:parentContext:keyAssetsFetchResult:", v16, v22, 0, 0);
    v29[0] = v19;
    v29[1] = 3221225472;
    v29[2] = __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke_2;
    v29[3] = &__block_descriptor_40_e41_v16__0___PXMutablePhotosDetailsContext__8l;
    v29[4] = objc_msgSend((id)objc_opt_class(), "_originForAssetCollection:", v20);
    -[PXPhotosDetailsContext performChanges:](v23, "performChanges:", v29);
    v24 = -[PXPhotosDetailsUIViewController initWithContext:options:]([PXPhotosDetailsUIViewController alloc], "initWithContext:options:", v23, 0);
    PLMemoriesGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v20;
      _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_DEFAULT, "Presenting details view for asset collection %@", buf, 0xCu);
    }

    if (-[PXActionPerformer pushViewController:](self, "pushViewController:", v24))
    {
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present details view controller for asset collection %@"), v20);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v26);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Attempted to present details view for a nil asset collection from an asset collection action performer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v11);

  }
}

uint64_t __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CD1640], "preferredAttributesForMemoryCreationFromAssetCollection:proposedAttributes:", *(_QWORD *)(a1 + 32), a2);
}

uint64_t __81__PXPhotoKitAssetCollectionShowDetailsActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setViewSourceOrigin:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  objc_msgSend(a4, "assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    objc_msgSend(v6, "indexPathForAssetCollectionReference:", v5);

  return 0;
}

+ (int64_t)_originForAssetCollection:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "px_isRegularAlbum") & 1) != 0)
  {
    v4 = 7;
  }
  else if (objc_msgSend(v3, "px_isMoment"))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridShowAsMemoryActionMenuTitle"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("memories.badge.plus");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeShowDetails"), a5);
}

@end
