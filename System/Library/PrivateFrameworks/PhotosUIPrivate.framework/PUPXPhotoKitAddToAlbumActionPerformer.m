@implementation PUPXPhotoKitAddToAlbumActionPerformer

- (void)_presentAlbumPickerForAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PUAlbumPickerSessionInfo *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PUAlbumPickerViewController *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id location;

  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPickerUtilities pickerConfigurationForAddToAlbumWithPhotoLibrary:](PUPickerUtilities, "pickerConfigurationForAddToAlbumWithPhotoLibrary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (PUAlbumPickerSessionInfo *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v7);
    -[PUAlbumPickerSessionInfo setDelegate:](v8, "setDelegate:", self);
    -[PUAlbumPickerSessionInfo setModalInPresentation:](v8, "setModalInPresentation:", 1);
    -[PUPXPhotoKitAddToAlbumActionPerformer setAlbumPickerViewController:](self, "setAlbumPickerViewController:", v8);
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C99E40];
    objc_msgSend(MEMORY[0x1E0CD1390], "pl_managedAssetsForAssets:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "orderedSetWithArray:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[PUAlbumPickerSessionInfo initWithSourceAlbum:transferredAssets:]([PUAlbumPickerSessionInfo alloc], "initWithSourceAlbum:transferredAssets:", 0, v7);
    v11 = (void *)MEMORY[0x1E0CD14E0];
    objc_msgSend(v4, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchRootAlbumCollectionListWithOptions:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PUAlbumPickerViewController initWithSessionInfo:]([PUAlbumPickerViewController alloc], "initWithSessionInfo:", v8);
    -[PUAlbumPickerViewController setCollectionList:](v17, "setCollectionList:", v16);
    -[PUAlbumPickerViewController setModalPresentationStyle:](v17, "setModalPresentationStyle:", 2);
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__PUPXPhotoKitAddToAlbumActionPerformer__presentAlbumPickerForAssets___block_invoke;
    v19[3] = &unk_1E58A3978;
    objc_copyWeak(&v21, &location);
    v20 = v4;
    -[PUAlbumPickerViewController setCompletionHandler:](v17, "setCompletionHandler:", v19);
    -[PUPXPhotoKitAddToAlbumActionPerformer setAlbumPickerViewController:](self, "setAlbumPickerViewController:", v17);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  -[PUPXPhotoKitAddToAlbumActionPerformer albumPickerViewController](self, "albumPickerViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentViewController:](self, "presentViewController:", v18);

}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer presentationEnvironment](self, "presentationEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_copyWeak(&v5, &location);
  PXPromptToSaveUnsavedSyndicatedAssetsIfNecessary();

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    -[PXPhotoKitAssetActionPerformer assets](self, "assets");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "itemIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CD13B8];
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotoKitAssetActionPerformer assets](self, "assets");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPXPhotoKitAddToAlbumActionPerformer _handlePickedAlbum:assets:](self, "_handlePickedAlbum:assets:", v15, v16);

  }
  else
  {
    -[PUPXPhotoKitAddToAlbumActionPerformer _dismissPickerControllerAndCompleteTaskWithSuccess:error:](self, "_dismissPickerControllerAndCompleteTaskWithSuccess:error:", 1, 0);
  }

}

- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  -[PUPXPhotoKitAddToAlbumActionPerformer albumPickerViewController](self, "albumPickerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v6, 0);

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v4, v7);
}

- (void)_handlePickedAlbum:(id)a3 assets:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  if (!v6)
  {
    v10 = CFSTR("Missing asset collection");
LABEL_6:
    objc_copyWeak(&v11, &location);
    px_dispatch_on_main_queue();

    objc_destroyWeak(&v11);
    goto LABEL_7;
  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B170]), "initWithAssets:assetCollection:", v7, v6);
  if (!v8)
  {
    v10 = CFSTR("Failed to create add to asset collection action");
    goto LABEL_6;
  }
  objc_msgSend((id)objc_opt_class(), "_configureAction:", v8);
  -[PXActionPerformer undoManager](self, "undoManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke;
  v12[3] = &unk_1E58A39C8;
  v13 = v7;
  v14 = v6;
  objc_copyWeak(&v15, &location);
  objc_msgSend(v8, "executeWithUndoManager:completionHandler:", v9, v12);

  objc_destroyWeak(&v15);
LABEL_7:
  objc_destroyWeak(&location);

}

- (void)_handleUserInteractionTaskResult:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPXPhotoKitAssetActionManager.m"), 732, CFSTR("%s must be called on the main thread"), "-[PUPXPhotoKitAddToAlbumActionPerformer _handleUserInteractionTaskResult:error:]");

  }
  objc_initWeak(&location, self);
  -[PUPXPhotoKitAddToAlbumActionPerformer albumPickerViewController](self, "albumPickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__PUPXPhotoKitAddToAlbumActionPerformer__handleUserInteractionTaskResult_error___block_invoke;
  v10[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v11, &location);
  -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", v8, v10);

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v4, v7);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (UIViewController)albumPickerViewController
{
  return self->_albumPickerViewController;
}

- (void)setAlbumPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_albumPickerViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_albumPickerViewController, 0);
}

void __80__PUPXPhotoKitAddToAlbumActionPerformer__handleUserInteractionTaskResult_error___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlbumPickerViewController:", 0);

}

void __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  char v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v13 = v5;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", buf, 0x20u);
    }

  }
  objc_copyWeak(&v10, (id *)(a1 + 48));
  v11 = a2;
  v9 = v5;
  px_dispatch_on_main_queue();

  objc_destroyWeak(&v10);
}

void __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_handleUserInteractionTaskResult:error:", 0, v2);

}

void __67__PUPXPhotoKitAddToAlbumActionPerformer__handlePickedAlbum_assets___block_invoke_339(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_handleUserInteractionTaskResult:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

void __67__PUPXPhotoKitAddToAlbumActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (v7)
    objc_msgSend(WeakRetained, "_presentAlbumPickerForAssets:", v10);
  else
    objc_msgSend(WeakRetained, "completeUserInteractionTaskWithSuccess:error:", 0, v6);

}

void __70__PUPXPhotoKitAddToAlbumActionPerformer__presentAlbumPickerForAssets___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "_handlePickedAlbum:assets:", v4, *(_QWORD *)(a1 + 32));

}

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v7;
  id v8;
  uint64_t v9;
  BOOL v10;

  v7 = a3;
  v8 = a4;
  v9 = objc_msgSend(v7, "sourceType");
  if ((objc_msgSend(v7, "isTrashed") & 1) != 0 || (objc_msgSend(v7, "isRecoveredAsset") & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    v10 = 0;
    if (v9 != 2 && v9 != 8)
      v10 = objc_msgSend(v8, "assetCollectionType") != 7;
  }

  return v10;
}

+ (id)createPreviewActionWithTitle:(id)a3 image:(id)a4 handler:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3428], "actionWithTitle:image:identifier:handler:", a3, a4, 0, a5);
}

+ (id)createBarButtonItemWithTarget:(id)a3 action:(SEL)a4 actionManager:(id)a5
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (objc_class *)MEMORY[0x1E0DC34F0];
  v7 = a3;
  v8 = [v6 alloc];
  PULocalizedString(CFSTR("ADD_TO_ALBUM_BUTTON_TITLE"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithTitle:style:target:action:", v9, 0, v7, a4);

  return v10;
}

+ (void)_configureAction:(id)a3
{
  objc_msgSend(a3, "setShouldSortAssetsByCreationDate:", 1);
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return PULocalizedString(CFSTR("ADD_TO_ALBUM"));
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("rectangle.stack.badge.plus");
}

@end
