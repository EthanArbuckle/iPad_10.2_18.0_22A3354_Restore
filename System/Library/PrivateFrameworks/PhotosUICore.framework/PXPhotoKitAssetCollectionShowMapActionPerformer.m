@implementation PXPhotoKitAssetCollectionShowMapActionPerformer

+ (BOOL)canPerformActionType:(id)a3 onAssetCollectionReference:(id)a4 withInputs:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  void *v28;
  objc_class *v29;
  void *v30;
  objc_class *v31;
  void *v32;
  _QWORD v33[6];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v10)
    goto LABEL_6;
  objc_msgSend(v10, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionShowMapActionPerformer.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v30, v32);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionShowMapActionPerformer.m"), 50, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v30);
  }

LABEL_4:
  v13 = objc_msgSend(v12, "assetCollectionSubtype");

  if (v13 == 101)
  {
    v14 = 0;
    goto LABEL_12;
  }
LABEL_6:
  objc_msgSend(v11, "assetsFetchResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetsDataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_effectiveAssetsFetchResultWithAssetsFetchResult:assetCollectionReference:dataSource:", v15, v10, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v18 = objc_msgSend(v17, "count");
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __110__PXPhotoKitAssetCollectionShowMapActionPerformer_canPerformActionType_onAssetCollectionReference_withInputs___block_invoke;
  v33[3] = &unk_1E5126B80;
  v33[4] = &v34;
  v33[5] = v18;
  objc_msgSend(v17, "enumerateObjectsWithOptions:usingBlock:", 2, v33);
  if (*((_BYTE *)v35 + 24))
  {
    v14 = 1;
  }
  else
  {
    objc_msgSend(v17, "fetchedObjectIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      v20 = (void *)MEMORY[0x1E0CD1570];
      objc_msgSend(v17, "photoLibrary");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "fetchOptionsWithPhotoLibrary:orObject:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "setFetchLimit:", 1);
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in (%@) AND additionalAttributes.locationHash != 0"), v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setInternalPredicate:", v24);

      objc_msgSend(v23, "setInternalSortDescriptors:", MEMORY[0x1E0C9AA60]);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count") != 0;
      *((_BYTE *)v35 + 24) = v26;

    }
    v14 = *((_BYTE *)v35 + 24) != 0;
  }
  _Block_object_dispose(&v34, 8);

LABEL_12:
  return v14;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsShowMap"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("map");
}

+ (id)_effectiveAssetsFetchResultWithAssetsFetchResult:(id)a3 assetCollectionReference:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v14;
  void *v15;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  _OWORD v24[2];
  _OWORD v25[2];

  v9 = a3;
  v10 = a5;
  v11 = v9;
  v12 = v11;
  if (v11)
    goto LABEL_2;
  memset(v25, 0, sizeof(v25));
  objc_msgSend(v10, "assetCollectionReferenceForAssetCollectionReference:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
    objc_msgSend(v14, "indexPath");
  else
    memset(v25, 0, sizeof(v25));

  if (*(_QWORD *)&v25[0] != *(_QWORD *)off_1E50B7E98
    && *((_QWORD *)&v25[0] + 1) != 0x7FFFFFFFFFFFFFFFLL
    && *(_QWORD *)&v25[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24[0] = v25[0];
    v24[1] = v25[1];
    objc_msgSend(v10, "uncuratedAssetsInSectionIndexPath:", v24);
    v18 = objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v12 = (void *)v18;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_2;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionShowMapActionPerformer.m"), 102, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[assetsDataSource uncuratedAssetsInSectionIndexPath:indexPath]"), v21, v22);
LABEL_21:

      goto LABEL_2;
    }
  }
  if (objc_msgSend(v10, "numberOfSections") != 1)
  {
    v12 = 0;
    goto LABEL_2;
  }
  *(_QWORD *)&v25[0] = objc_msgSend(v10, "identifier");
  *(_OWORD *)((char *)v25 + 8) = xmmword_1A7C0C1F0;
  *((_QWORD *)&v25[1] + 1) = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v10, "uncuratedAssetsInSectionIndexPath:", v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionShowMapActionPerformer.m"), 107, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[assetsDataSource uncuratedAssetsInSectionIndexPath:indexPath]"), v21, v22);
      goto LABEL_21;
    }
  }
LABEL_2:

  return v12;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeShowMap"), a5);
}

void __110__PXPhotoKitAssetCollectionShowMapActionPerformer_canPerformActionType_onAssetCollectionReference_withInputs___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;

  objc_msgSend(a2, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7 != 0;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)
    || (unint64_t)(*(_QWORD *)(a1 + 40) - a3) >= 0xC9)
  {
    *a4 = 1;
  }
}

- (id)localizedTitleForUseCase:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitleForUseCase:assetCollectionReference:withInputs:", a3, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activitySystemImageName
{
  return CFSTR("map");
}

- (id)activityType
{
  __CFString *v2;

  v2 = CFSTR("PXActivityTypeShowMap");
  return CFSTR("PXActivityTypeShowMap");
}

- (BOOL)canPerformWithActivityItems:(id)a3 forActivity:(id)a4
{
  void *v6;
  void *v7;
  void *v9;

  objc_msgSend(a4, "activityType", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetCollectionShowMapActionPerformer activityType](self, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionShowMapActionPerformer.m"), 129, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activity.activityType == self.activityType"));

  }
  return 1;
}

- (void)performUserInteractionTask
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  PXLibraryFilterState *v14;
  _BOOL8 v15;
  uint64_t v16;
  PXPlacesMapFetchResultController *v17;
  PXPlacesMapFetchResultViewController *v18;
  PXPlacesMapFetchResultViewController *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  PXPlacesMapFetchResultController *v24;
  _QWORD v25[4];
  id v26;
  id location;

  v4 = (void *)objc_opt_class();
  -[PXAssetCollectionActionPerformer assetsFetchResult](self, "assetsFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer assetsDataSource](self, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_effectiveAssetsFetchResultWithAssetsFetchResult:assetCollectionReference:dataSource:", v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionShowMapActionPerformer.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsFetchResult"));

  }
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer assetCollectionReference](self, "assetCollectionReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;

  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v13);
  v15 = PXPhotoKitAssetCollectionSupportsNearbyAssetsAffordance(v12);
  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    v17 = -[PXPlacesMapFetchResultController initWithLibraryFilterState:photoLibrary:]([PXPlacesMapFetchResultController alloc], "initWithLibraryFilterState:photoLibrary:", v14, v9);
    v18 = [PXPlacesMapFetchResultViewController alloc];
    v19 = -[PXPlacesMapFetchResultViewController initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:](v18, "initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:", v15, 1, v9, v17, *MEMORY[0x1E0CC1568], *(double *)(MEMORY[0x1E0CC1568] + 8), *(double *)(MEMORY[0x1E0CC1568] + 16), *(double *)(MEMORY[0x1E0CC1568] + 24));
    -[PXPlacesMapFetchResultViewController mapFetchResultsController](v19, "mapFetchResultsController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setContentMode:", 1);
    -[PXPlacesMapFetchResultViewController setStyle:](v19, "setStyle:", 1);
    objc_msgSend(v20, "preloadMap");
    v21 = objc_initWeak(&location, v20);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __77__PXPhotoKitAssetCollectionShowMapActionPerformer_performUserInteractionTask__block_invoke;
    v25[3] = &unk_1E5148D30;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v20, "loadFetchResult:withCompletion:", v8, v25);

    if (-[PXActionPerformer pushViewController:](self, "pushViewController:", v19))
    {
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
    }
    else
    {
      v24 = v17;
      objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to push placesViewController"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v22);

      v17 = v24;
    }
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);

    goto LABEL_15;
  }
  v16 = -[PXLibraryFilterState viewMode](v14, "viewMode");
  +[PXLemonadeMapView makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:](_TtC12PhotosUICore17PXLemonadeMapView, "makeViewWithPhotoLibrary:collection:libraryFilterViewMode:initialCenterCoordinate:wantsNearbyAssetsAffordance:enableGridView:", v9, v12, v16, v15, 1, *MEMORY[0x1E0C9E500], *(double *)(MEMORY[0x1E0C9E500] + 8));
  v17 = (PXPlacesMapFetchResultController *)objc_claimAutoreleasedReturnValue();
  if (!-[PXActionPerformer presentViewController:](self, "presentViewController:", v17))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Failed to present mapViewController"));
    v19 = (PXPlacesMapFetchResultViewController *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, v19);
LABEL_15:

    goto LABEL_16;
  }
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
LABEL_16:

}

void __77__PXPhotoKitAssetCollectionShowMapActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD v3[4];
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __77__PXPhotoKitAssetCollectionShowMapActionPerformer_performUserInteractionTask__block_invoke_2;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, v1);
  objc_msgSend(WeakRetained, "reloadContentModeWithCompletion:", v3);

  objc_destroyWeak(&v4);
}

void __77__PXPhotoKitAssetCollectionShowMapActionPerformer_performUserInteractionTask__block_invoke_2(uint64_t a1)
{
  id v1;

  objc_copyWeak(&v1, (id *)(a1 + 32));
  px_dispatch_on_main_queue();
  objc_destroyWeak(&v1);
}

void __77__PXPhotoKitAssetCollectionShowMapActionPerformer_performUserInteractionTask__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "focusOnProvidedAssetsAnimated:", 1);

}

@end
