@implementation PUPXPhotoKitShareAssetActionPerformer

- (void)_presentShareSheet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PUPhotoSelectionManager *v7;
  PUActivitySharingConfiguration *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PUActivitySharingController *v21;
  uint64_t v22;
  id v23;
  PUPhotoSelectionManager *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  PUPhotoSelectionManager *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "collectionListFetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPXPhotoKitShareAssetActionPerformer _assetsFetchResultByAssetCollectionFromCollectionListFetchResult:inDataSource:](self, "_assetsFetchResultByAssetCollectionFromCollectionListFetchResult:inDataSource:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PUPhotoSelectionManager initWithOptions:]([PUPhotoSelectionManager alloc], "initWithOptions:", 0);
  v8 = -[PUActivitySharingConfiguration initWithCollectionsFetchResult:selectionManager:]([PUActivitySharingConfiguration alloc], "initWithCollectionsFetchResult:selectionManager:", v5, v7);
  if (_os_feature_enabled_impl())
  {
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__56917;
    v40 = __Block_byref_object_dispose__56918;
    v41 = 0;
    v9 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v3, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "selectedIndexPaths");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke;
    v32[3] = &unk_1E58A3900;
    v33 = v4;
    v35 = &v36;
    v13 = v11;
    v34 = v13;
    objc_msgSend(v12, "enumerateItemIndexPathsUsingBlock:", v32);

    v14 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend((id)v37[5], "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetsWithObjectIDs:options:", v13, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUActivitySharingConfiguration setInitialAssetsFetchResult:](v8, "setInitialAssetsFetchResult:", v16);

    _Block_object_dispose(&v36, 8);
  }
  -[PXPhotoKitAssetActionPerformer person](self, "person");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setPerson:](v8, "setPerson:", v17);

  -[PXPhotoKitAssetActionPerformer socialGroup](self, "socialGroup");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setSocialGroup:](v8, "setSocialGroup:", v18);

  -[PUActivitySharingConfiguration setAssetsFetchResultsByAssetCollection:](v8, "setAssetsFetchResultsByAssetCollection:", v6);
  -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setPhotosDataSource:](v8, "setPhotosDataSource:", v19);

  +[PUActivityViewController excludedPhotosActivityTypesForPresentationSource:](PUActivityViewController, "excludedPhotosActivityTypesForPresentationSource:", -[PXPhotoKitAssetActionPerformer presentationSource](self, "presentationSource"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUActivitySharingConfiguration setExcludedActivityTypes:](v8, "setExcludedActivityTypes:", v20);

  -[PUActivitySharingConfiguration setAllowsAirPlayActivity:](v8, "setAllowsAirPlayActivity:", -[PXPhotoKitAssetActionPerformer supportsAirPlay](self, "supportsAirPlay"));
  v21 = -[PUActivitySharingController initWithActivitySharingConfiguration:]([PUActivitySharingController alloc], "initWithActivitySharingConfiguration:", v8);
  -[PUActivitySharingController setDelegate:](v21, "setDelegate:", self);
  objc_storeStrong((id *)&self->_activitySharingController, v21);
  objc_msgSend(v3, "selectedIndexPaths");
  v22 = objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke_2;
  v29 = &unk_1E58A3928;
  v23 = v4;
  v30 = v23;
  v24 = v7;
  v31 = v24;
  objc_msgSend((id)v22, "enumerateItemIndexSetsUsingBlock:", &v26);

  -[PUActivitySharingController activityViewController](self->_activitySharingController, "activityViewController", v26, v27, v28, v29);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v22) = -[PXActionPerformer presentViewController:](self, "presentViewController:", v25);

  if ((v22 & 1) == 0)
    -[PUPXPhotoKitShareAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);

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

- (void)activitySharingControllerDidCancel:(id)a3
{
  PUActivitySharingController *activitySharingController;

  activitySharingController = self->_activitySharingController;
  self->_activitySharingController = 0;

  if (-[PXActionPerformer state](self, "state") == 10)
    -[PUPXPhotoKitShareAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
}

- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  PUActivitySharingController *activitySharingController;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  uint8_t buf[16];

  v5 = a5;
  v9 = a3;
  v10 = a4;
  activitySharingController = self->_activitySharingController;
  if (activitySharingController)
  {
    if (v5)
    {
      self->_activitySharingController = 0;

    }
    v12 = v9;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_6:
        objc_msgSend(v12, "currentAsset");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotoKitAssetActionPerformer person](self, "person");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotoKitAssetActionPerformer socialGroup](self, "socialGroup");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "selectionSnapshot");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPXPhotoKitShareAssetActionPerformer _didCompleteWithActivityType:success:asset:person:socialGroup:selectionSnapshot:](self, "_didCompleteWithActivityType:success:asset:person:socialGroup:selectionSnapshot:", v10, v5, v13, v14, v15, v16);

        goto LABEL_10;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "px_descriptionForAssertionMessage");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 319, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController"), v20, v22);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 319, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController"), v20);
    }

    goto LABEL_6;
  }
  PLUIGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_ERROR, "didCompleteWithActivityType: was called whereas _activitySharingController == nil.", buf, 2u);
  }

LABEL_10:
}

- (void)_didCompleteWithActivityType:(id)a3 success:(BOOL)a4 asset:(id)a5 person:(id)a6 socialGroup:(id)a7 selectionSnapshot:(id)a8
{
  _BOOL4 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  PUPXPhotoKitShareAssetActionPerformer *v27;
  uint64_t v28;
  _QWORD v29[5];
  _QWORD v30[4];
  id v31;
  PUPXPhotoKitShareAssetActionPerformer *v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  id v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v12 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  PLUIGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("NO");
    if (v12)
      v19 = CFSTR("YES");
    v20 = v19;
    *(_DWORD *)buf = 138412546;
    v36 = v14;
    v37 = 2112;
    v38 = v20;
    _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "[PUPXPhotoKitShareAssetActionPerformer] didCompleteWithActivityType: %@, success %@", buf, 0x16u);

  }
  if (v12)
  {
    if (v15 && a6)
    {
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D7BDF0]))
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke;
        v34[3] = &unk_1E58AB060;
        v34[4] = self;
        -[PUPXPhotoKitShareAssetActionPerformer _performSetKeyFaceWithAsset:completionHandler:](self, "_performSetKeyFaceWithAsset:completionHandler:", v15, v34);
        goto LABEL_26;
      }
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D7BDB0]))
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_174;
        v33[3] = &unk_1E58AB060;
        v33[4] = self;
        -[PUPXPhotoKitShareAssetActionPerformer _performNotThisPersonWithCompletionHandler:](self, "_performNotThisPersonWithCompletionHandler:", v33);
        goto LABEL_26;
      }
    }
    if (v15 && v16 && objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D7BE08]))
    {
      v21 = (void *)MEMORY[0x1E0D7B6B8];
      -[PXActionPerformer undoManager](self, "undoManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_177;
      v30[3] = &unk_1E58AA020;
      v31 = v16;
      v32 = self;
      objc_msgSend(v21, "performSetSocialGroupKeyPhotoWithAsset:socialGroup:undoManager:completionHandler:", v15, v31, v22, v30);

    }
    else if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D7BE38])
           && (-[PXPhotoKitAssetActionPerformer createPerformerWithClass:actionType:](self, "createPerformerWithClass:actionType:", objc_opt_class(), *MEMORY[0x1E0D7C0E8]), (v23 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v24 = (void *)v23;
      objc_msgSend(v17, "selectedIndexPaths");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "count");

      if (v26 < 1)
      {
        -[PUPXPhotoKitShareAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
      }
      else
      {
        objc_msgSend(v24, "setSelectionSnapshot:", v17);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_179;
        v29[3] = &unk_1E58AB060;
        v29[4] = self;
        objc_msgSend(v24, "performActionWithCompletionHandler:", v29);
      }

    }
    else
    {
      if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0D96D88]))
      {
        v27 = self;
        v28 = 0;
      }
      else
      {
        v27 = self;
        v28 = 1;
      }
      -[PUPXPhotoKitShareAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](v27, "completeUserInteractionTaskWithSuccess:error:", v28, 0);
    }
  }
LABEL_26:

}

- (void)_performSetKeyFaceWithAsset:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[PXPhotoKitAssetActionPerformer person](self, "person");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B260]), "initWithPerson:asset:", v10, v7);

  -[PXActionPerformer undoManager](self, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "executeWithUndoManager:completionHandler:", v9, v6);

}

- (void)_performNotThisPersonWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[PXPhotoKitAssetActionPerformer person](self, "person");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetActionPerformer instantlyExcludeAssetsFromDataSource](self, "instantlyExcludeAssetsFromDataSource");
  -[PXAssetActionPerformer selectionSnapshot](self, "selectionSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectedIndexPaths");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotoKitAssetActionPerformer photosDataSourceSnapshot](self, "photosDataSourceSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchResultWithAssetsAtIndexPaths:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B638]), "initWithPerson:assets:", v11, v8);
  -[PXActionPerformer undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeWithUndoManager:completionHandler:", v10, v4);

}

- (void)completeUserInteractionTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  unint64_t v10;
  uint64_t v11;

  v4 = a3;
  v11 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (-[PXActionPerformer state](self, "state") == 10)
  {
    v8.receiver = self;
    v8.super_class = (Class)PUPXPhotoKitShareAssetActionPerformer;
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](&v8, sel_completeUserInteractionTaskWithSuccess_error_, v4, v6);
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v10 = -[PXActionPerformer state](self, "state");
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "[PUPXPhotoKitShareAssetActionPerformer]: Failed to completeUserInteractionTaskWithSuccess because state is %lu", buf, 0xCu);
    }

  }
}

- (BOOL)actionPerformer:(id)a3 presentViewController:(id)a4
{
  BOOL v5;

  v5 = -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
  if (!v5)
    -[PUPXPhotoKitShareAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  return v5;
}

- (BOOL)actionPerformer:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  BOOL v6;

  v6 = -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
  if (!v6)
    -[PUPXPhotoKitShareAssetActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, 0);
  return v6;
}

- (id)undoManagerForActionPerformer:(id)a3
{
  void *v4;
  void *v5;

  -[PXActionPerformer delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManagerForActionPerformer:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activitySharingController, 0);
}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_174(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_177(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = *(id *)(a1 + 32);
  v5 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_179(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, a3);
}

void __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_2_178(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  const char *v4;
  NSObject *v5;
  os_log_type_t v6;
  uint32_t v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v2;
      v4 = "Setting new key photo succeeded for social group: %@";
      v5 = v3;
      v6 = OS_LOG_TYPE_INFO;
      v7 = 12;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v5, v6, v4, (uint8_t *)&v9, v7);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "stopExcludingAssetsFromDataSource");
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = 138412546;
      v10 = v2;
      v11 = 2112;
      v12 = v8;
      v4 = "Setting new key photo failed for social group: %@ with error: %@";
      v5 = v3;
      v6 = OS_LOG_TYPE_ERROR;
      v7 = 22;
      goto LABEL_6;
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_2_175(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  os_log_type_t v5;
  uint32_t v6;
  uint64_t v7;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
  {
    PLUIGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      v3 = "[PUPXPhotoKitShareAssetActionPerformer] Not This Person succeeded.";
      v4 = v2;
      v5 = OS_LOG_TYPE_DEFAULT;
      v6 = 2;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v4, v5, v3, (uint8_t *)&v9, v6);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stopExcludingAssetsFromDataSource");
    PLUIGetLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v9 = 138412290;
      v10 = v7;
      v3 = "[PUPXPhotoKitShareAssetActionPerformer] Not This Person failed with error %@.";
      v4 = v2;
      v5 = OS_LOG_TYPE_ERROR;
      v6 = 12;
      goto LABEL_6;
    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

uint64_t __121__PUPXPhotoKitShareAssetActionPerformer__didCompleteWithActivityType_success_asset_person_socialGroup_selectionSnapshot___block_invoke_2(uint64_t a1)
{
  int v2;
  NSObject *v3;
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  os_log_type_t v7;
  uint32_t v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(a1 + 48);
  PLUIGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      v5 = "[PUPXPhotoKitShareAssetActionPerformer] Set Key Face succeeded";
      v6 = v4;
      v7 = OS_LOG_TYPE_DEFAULT;
      v8 = 2;
LABEL_6:
      _os_log_impl(&dword_1AAB61000, v6, v7, v5, (uint8_t *)&v11, v8);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138412290;
    v12 = v9;
    v5 = "[PUPXPhotoKitShareAssetActionPerformer] Set Key Face failed with error %@.";
    v6 = v4;
    v7 = OS_LOG_TYPE_ERROR;
    v8 = 12;
    goto LABEL_6;
  }

  return objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

void __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke(_QWORD *a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[2];

  v3 = (void *)a1[4];
  v4 = a2[1];
  v12[0] = *a2;
  v12[1] = v4;
  objc_msgSend(v3, "assetAtSimpleIndexPath:", v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = (void *)a1[5];
  objc_msgSend(v6, "objectID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

}

void __59__PUPXPhotoKitShareAssetActionPerformer__presentShareSheet__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)(a1 + 32);
  v7 = a4;
  objc_msgSend(v6, "assetCollectionForSection:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "selectAssetsAtIndexes:inAssetCollection:", v7, v8);

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  int v7;

  v6 = a3;
  if (objc_msgSend(v6, "canPerformSharingAction") && (objc_msgSend(v6, "isTrashed") & 1) == 0)
    v7 = objc_msgSend(v6, "isRecoveredAsset") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  objc_class *v6;
  id v7;
  void *v8;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBarButtonSystemItem:target:action:", 9, v7, a4);

  objc_msgSend(v8, "setImageInsets:", -0.5, 0.0, 0.5, 0.0);
  return v8;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0DC3428];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PUPXPhotoKitShareAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke;
  v12[3] = &unk_1E58A63F8;
  v13 = v7;
  v9 = v7;
  objc_msgSend(v8, "actionWithTitle:image:identifier:handler:", a3, a4, 0, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB3940];
  PXActionPerformerTitleUseCaseDescription();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PXPhotoKitAssetActionManager%@Title_Share"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("square.and.arrow.up");
}

uint64_t __84__PUPXPhotoKitShareAssetActionPerformer_createPreviewActionWithTitle_image_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
