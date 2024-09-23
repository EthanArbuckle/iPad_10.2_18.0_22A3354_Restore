@implementation PXPhotoKitAssetCollectionPickerActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIViewController *v14;
  void *pickerController;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PXActionPerformer delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[PXActionPerformer delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "memoryAssetsActionFactory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetsPickerPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "presentAssetPicker");
      goto LABEL_11;
    }
  }
  else
  {

  }
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "Presenting picker for adding assets to assetCollection %@", (uint8_t *)&v16, 0xCu);

  }
  v9 = objc_alloc(MEMORY[0x1E0CD2168]);
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v9, "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v11);

  objc_msgSend(v6, "setSelectionLimit:", 0);
  objc_msgSend(v6, "setDisabledCapabilities:", 16);
  objc_msgSend(v6, "_setDisabledPrivateCapabilities:", 7);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v6);
  objc_msgSend(v12, "setDelegate:", self);
  objc_msgSend(v12, "presentationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setDelegate:", self);

  if (-[PXActionPerformer presentViewController:](self, "presentViewController:", v12))
  {
    v14 = v12;
    pickerController = self->_pickerController;
    self->_pickerController = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("PXPhotoKitAssetCollectionPickerActionPerformer: Failed to present Picker"));
    pickerController = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 0, pickerController);
  }

LABEL_11:
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[16];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self->_pickerDidFinishPicking)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1A6789000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring picker did finish picking callback because the action is already finished (dismissed via swipe gesture or Cancel + Done were tapped at the same time).", v16, 2u);
    }
  }
  else
  {
    self->_pickerDidFinishPicking = 1;
    PXMap();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v5, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fetchAssetsWithLocalIdentifiers:options:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_orderedAssetsFromAssets:sortDescriptors:", v11, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetCollectionPickerActionPerformer _handlePickedAssets:](self, "_handlePickedAssets:", v15);
  }

}

- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  UIViewController *pickerController;
  id v7;

  v4 = a3;
  pickerController = self->_pickerController;
  v7 = a4;
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", pickerController, 0);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v4, v7);

}

- (void)_handlePickedAssets:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  UIViewController *pickerController;
  _QWORD v10[5];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 134218242;
      v14 = v6;
      v15 = 2112;
      v16 = v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "Picked %lu assets to add to %@", buf, 0x16u);
    }

    if (objc_msgSend(v5, "px_isSharedAlbum"))
    {
      pickerController = self->_pickerController;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __70__PXPhotoKitAssetCollectionPickerActionPerformer__handlePickedAssets___block_invoke;
      v10[3] = &unk_1E51457C8;
      v10[4] = self;
      v11 = v4;
      v12 = v5;
      -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", pickerController, v10);

    }
    else
    {
      -[PXPhotoKitAssetCollectionPickerActionPerformer _addAssets:toUserAlbum:](self, "_addAssets:toUserAlbum:", v4, v5);
    }
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      v14 = (uint64_t)v5;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "Finishing picker action with no picked assets for assetCollection %@", buf, 0xCu);
    }

    -[PXPhotoKitAssetCollectionPickerActionPerformer _dismissPickerControllerAndCompleteTaskWithSuccess:error:](self, "_dismissPickerControllerAndCompleteTaskWithSuccess:error:", 1, 0);
  }

}

- (void)_addAssets:(id)a3 toUserAlbum:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  PXAddAssetsToAssetCollectionAction *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  PXPhotoKitAssetCollectionPickerActionPerformer *v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "canPerformEditOperation:", 3) & 1) == 0)
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_error_impl(&dword_1A6789000, v8, OS_LOG_TYPE_ERROR, "Attempting add to collection that does not support adding content: %@", buf, 0xCu);
    }

  }
  v9 = -[PXAddAssetsToAssetCollectionAction initWithAssets:assetCollection:]([PXAddAssetsToAssetCollectionAction alloc], "initWithAssets:assetCollection:", v6, v7);
  if (v9)
  {
    -[PXActionPerformer undoManager](self, "undoManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__PXPhotoKitAssetCollectionPickerActionPerformer__addAssets_toUserAlbum___block_invoke;
    v12[3] = &unk_1E5146AF0;
    v13 = v6;
    v14 = v7;
    v15 = self;
    -[PXAction executeWithUndoManager:completionHandler:](v9, "executeWithUndoManager:completionHandler:", v10, v12);

  }
  else
  {
    PLUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v7;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_INFO, "Finishing picker action with no assets needed to be added to assetCollection %@", buf, 0xCu);
    }

    -[PXPhotoKitAssetCollectionPickerActionPerformer _dismissPickerControllerAndCompleteTaskWithSuccess:error:](self, "_dismissPickerControllerAndCompleteTaskWithSuccess:error:", 1, 0);
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  NSObject *v3;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_pickerDidFinishPicking)
  {
    PLUIGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_1A6789000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring swipe to dismiss callback because the action is already finished (dismissed via the Cancel/Add button).", (uint8_t *)&v6, 2u);
    }
  }
  else
  {
    self->_pickerDidFinishPicking = 1;
    -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection", a3);
    v3 = objc_claimAutoreleasedReturnValue();
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_INFO, "Picker action manually dismissed with no picked assets for assetCollection %@", (uint8_t *)&v6, 0xCu);
    }

    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerController, 0);
}

void __73__PXPhotoKitAssetCollectionPickerActionPerformer__addAssets_toUserAlbum___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLUIGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = objc_msgSend(*(id *)(a1 + 32), "count");
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      v10 = "Picker action added %lu assets to asset collection %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_INFO;
      v13 = 22;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v11, v12, v10, buf, v13);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend(*(id *)(a1 + 32), "count");
    v15 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218498;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v5;
    v10 = "Failed to add %lu assets to asset collection %@. Error: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
    goto LABEL_6;
  }

  v16 = v5;
  px_dispatch_on_main_queue();

}

uint64_t __73__PXPhotoKitAssetCollectionPickerActionPerformer__addAssets_toUserAlbum___block_invoke_933(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissPickerControllerAndCompleteTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __70__PXPhotoKitAssetCollectionPickerActionPerformer__handlePickedAssets___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "fetchedObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAssets:toSharedAlbum:", v3, *(_QWORD *)(a1 + 48));

}

uint64_t __74__PXPhotoKitAssetCollectionPickerActionPerformer_picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "assetIdentifier");
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v7 = a4;
  objc_msgSend(a3, "assetCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2489, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v14);
LABEL_10:

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
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 2489, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v14, v16);

    goto LABEL_10;
  }
LABEL_3:
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v7, "memoryAssetsActionFactory"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v9))
  {
    v10 = 1;
  }
  else
  {
    v10 = objc_msgSend(v8, "canPerformEditOperation:", 3);
  }

  return v10;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridAddPhotosActionMenuTitle"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("plus");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeAddToAlbumFromPicker"), a5);
}

@end
