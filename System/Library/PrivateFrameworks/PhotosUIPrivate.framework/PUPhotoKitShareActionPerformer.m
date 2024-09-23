@implementation PUPhotoKitShareActionPerformer

- (id)_createSharingViewControllerFromCurrentSelection
{
  PUPhotoKitShareActionPerformer *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PUPhotoSelectionManager *v12;
  unint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  void *v17;
  PUActivitySharingConfiguration *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PUPhotoKitShareActionPerformer *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  double v31;
  double v32;
  PUActivitySharingController *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  objc_class *v41;
  objc_class *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  SEL v46;
  void *v47;
  void *v48;
  PUPhotoSelectionManager *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  _QWORD v55[5];
  void *v56;
  uint8_t buf[4];
  void *v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v3 = self;
  v63 = *MEMORY[0x1E0C80C00];
  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PUPhotoKitAssetActionManager.m"), 1726, CFSTR("There can be only one asset in a share action"));

  }
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitActionPerformer photosDataSource](v3, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("PUPhotoKitAssetActionManager.m"), 1731, CFSTR("Share performer should have a photosDataSource set."));

  }
  objc_msgSend(v6, "collectionListFetchResult");
  v7 = objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitShareActionPerformer _assetsFetchResultByAssetCollectionFromCollectionListFetchResult:inDataSource:](v3, "_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:inDataSource:", v7, v6);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAssetActionPerformer assetsByAssetCollection](v3, "assetsByAssetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPathForAsset:inCollection:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUPhotoSelectionManager initWithOptions:]([PUPhotoSelectionManager alloc], "initWithOptions:", 0);
  v13 = objc_msgSend(v11, "item");
  v50 = (void *)v10;
  objc_msgSend(v6, "assetsInSection:", objc_msgSend(v6, "sectionForAssetCollection:", v10));
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v13;
  if (v13 >= objc_msgSend(v52, "count")
    || (objc_msgSend(v52, "objectAtIndexedSubscript:", v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqual:", v5),
        v14,
        (v15 & 1) == 0))
  {
    v53 = objc_msgSend(v52, "indexOfObject:", v5);
    PLUIGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v53);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v58 = v5;
      v59 = 2112;
      v60 = v11;
      v61 = 2112;
      v62 = v17;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_DEFAULT, "Index is invalid for current asset %@. Fixing up %@ => %@.", buf, 0x20u);

    }
  }
  v48 = v11;
  v46 = a2;
  v47 = (void *)v7;
  v49 = v12;
  v18 = -[PUActivitySharingConfiguration initWithCollectionsFetchResult:selectionManager:]([PUActivitySharingConfiguration alloc], "initWithCollectionsFetchResult:selectionManager:", v7, v12);
  if (_os_feature_enabled_impl())
  {
    v19 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v5, "objectID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v22 = v6;
    v23 = v5;
    v24 = v3;
    v25 = v4;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "librarySpecificFetchOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchAssetsWithObjectIDs:options:", v21, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivitySharingConfiguration setInitialAssetsFetchResult:](v18, "setInitialAssetsFetchResult:", v28);

    v4 = v25;
    v3 = v24;
    v5 = v23;
    v6 = v22;

  }
  -[PUActivitySharingConfiguration setAssetsFetchResultsByAssetCollection:](v18, "setAssetsFetchResultsByAssetCollection:", v51);
  -[PUActivitySharingConfiguration setPhotosDataSource:](v18, "setPhotosDataSource:", v6);
  +[PUActivityViewController excludedPhotosActivityTypesForPresentationSource:](PUActivityViewController, "excludedPhotosActivityTypesForPresentationSource:", 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setExcludedActivityTypes:](v18, "setExcludedActivityTypes:", v29);

  v30 = 1;
  -[PUActivitySharingConfiguration setAllowsAirPlayActivity:](v18, "setAllowsAirPlayActivity:", 1);
  objc_msgSend(v5, "faceAreaMaxX");
  if (v31 <= 0.0)
  {
    objc_msgSend(v5, "faceAreaMaxY");
    v30 = v32 > 0.0;
  }
  -[PUActivitySharingConfiguration setAllowsSuggestLessPersonActivity:](v18, "setAllowsSuggestLessPersonActivity:", v30);
  v33 = -[PUActivitySharingController initWithActivitySharingConfiguration:]([PUActivitySharingController alloc], "initWithActivitySharingConfiguration:", v18);
  objc_storeStrong((id *)&v3->_activitySharingController, v33);
  if (v53 != 0x7FFFFFFFFFFFFFFFLL)
    -[PUPhotoSelectionManager selectAssetAtIndex:inAssetCollection:](v49, "selectAssetAtIndex:inAssetCollection:", v53, v50);
  -[PUActivitySharingController activityViewController](v3->_activitySharingController, "activityViewController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v48;
  if (!v34)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (objc_class *)objc_opt_class();
    NSStringFromClass(v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v40;
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v46, v3, CFSTR("PUPhotoKitAssetActionManager.m"), 1769, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("_activitySharingController.activityViewController"), v45);
    v36 = v47;
LABEL_21:

    goto LABEL_18;
  }
  objc_opt_class();
  v36 = v47;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (objc_class *)objc_opt_class();
    NSStringFromClass(v42);
    v43 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "px_descriptionForAssertionMessage");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)v43;
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", v46, v3, CFSTR("PUPhotoKitAssetActionManager.m"), 1769, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("_activitySharingController.activityViewController"), v43, v44);

    v35 = v48;
    goto LABEL_21;
  }
LABEL_18:
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __82__PUPhotoKitShareActionPerformer__createSharingViewControllerFromCurrentSelection__block_invoke;
  v55[3] = &unk_1E58ABD10;
  v55[4] = v3;
  objc_msgSend(v34, "setReadyToInteractHandler:", v55);

  return v34;
}

- (void)preheatUserInteractionTask
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];
  uint8_t buf[16];

  -[PUAssetActionPerformer actionPerformerLog](self, "actionPerformerLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayPreheat", ", buf, 2u);
  }
  -[PUPhotoKitShareActionPerformer _createSharingViewControllerFromCurrentSelection](self, "_createSharingViewControllerFromCurrentSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoKitShareActionPerformer setPreheatedSharingViewController:](self, "setPreheatedSharingViewController:", v4);

  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayPreheat", ", v5, 2u);
  }

}

- (void)performUserInteractionTask
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  -[PUAssetActionPerformer assets](self, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetActionManager.m"), 1787, CFSTR("There can be only one asset in a share action"));

  }
  -[PUAssetActionPerformer actionPerformerLog](self, "actionPerformerLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", ", buf, 2u);
  }
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", v10, 2u);
  }
  -[PUPhotoKitShareActionPerformer preheatedSharingViewController](self, "preheatedSharingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[PUPhotoKitShareActionPerformer _createSharingViewControllerFromCurrentSelection](self, "_createSharingViewControllerFromCurrentSelection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", -[PUAssetActionPerformer presentViewController:](self, "presentViewController:", v7), 0);
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayLatency", ", v9, 2u);
  }

}

- (id)_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:(id)a3 inDataSource:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        if (v6)
        {
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_msgSend(v6, "assetsInSection:", objc_msgSend(v6, "sectionForAssetCollection:", v13, (_QWORD)v19));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            goto LABEL_9;
          v15 = objc_alloc(MEMORY[0x1E0CD1620]);
          objc_msgSend(v6, "photoLibrary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchType");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (void *)objc_msgSend(v15, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", MEMORY[0x1E0C9AA60], v16, v17, 0, 0, 0);

          if (v14)
          {
LABEL_9:
            objc_msgSend(v7, "setObject:forKey:", v14, v13);

          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  return v7;
}

- (UIViewController)preheatedSharingViewController
{
  return self->_preheatedSharingViewController;
}

- (void)setPreheatedSharingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_preheatedSharingViewController, a3);
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)setActivitySharingController:(id)a3
{
  objc_storeStrong((id *)&self->_activitySharingController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_storeStrong((id *)&self->_preheatedSharingViewController, 0);
}

void __82__PUPhotoKitShareActionPerformer__createSharingViewControllerFromCurrentSelection__block_invoke(uint64_t a1)
{
  NSObject *v1;
  uint8_t v2[16];

  objc_msgSend(*(id *)(a1 + 32), "actionPerformerLog");
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ShareSheetDisplayDuration", " enableTelemetry=YES ", v2, 2u);
  }

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4
{
  id v5;
  id v6;
  int v7;
  char v8;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "isPhotoIrisPlaceholder");
  v8 = objc_msgSend(v6, "canPerformSharingAction");

  if ((v8 & 1) != 0 || v7)
    v7 = objc_msgSend(v5, "isTrashBin") ^ 1;

  return v7;
}

+ (BOOL)shouldEnableOnAsset:(id)a3 inAssetCollection:(id)a4
{
  return objc_msgSend(a3, "isPhotoIrisPlaceholder") ^ 1;
}

@end
