@implementation PUAddToAlbumActivity

- (BOOL)_presentActivityOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  UIViewController **p_presenterViewController;
  id v9;
  id v10;
  objc_super v12;

  v5 = a4;
  p_presenterViewController = &self->_presenterViewController;
  v9 = a5;
  v10 = a3;
  objc_storeWeak((id *)p_presenterViewController, v10);
  v12.receiver = self;
  v12.super_class = (Class)PUAddToAlbumActivity;
  LOBYTE(v5) = -[PXActivity _presentActivityOnViewController:animated:completion:](&v12, sel__presentActivityOnViewController_animated_completion_, v10, v5, v9);

  return v5;
}

- (id)_albumPickerViewControllerWithAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __objc2_class **v12;
  id v13;
  id WeakRetained;
  void *v15;
  PUAlbumPickerSessionInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PUAlbumPickerSessionInfo *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  PUAlbumPickerViewController *v30;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  PUAddToAlbumActivity *v37;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E40];
  objc_msgSend(MEMORY[0x1E0CD1390], "pl_managedAssetsForAssets:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedSetWithArray:", v6);
  v7 = objc_claimAutoreleasedReturnValue();

  -[PXActivity itemSourceController](self, "itemSourceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activityViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_extendedTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "userInterfaceIdiom");
  v12 = off_1E5885758;
  if (v11 != 1)
    v12 = off_1E5885750;
  v13 = objc_alloc_init(*v12);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
  objc_msgSend(WeakRetained, "undoManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = (void *)v7;
  v16 = -[PUAlbumPickerSessionInfo initWithSourceAlbum:transferredAssets:]([PUAlbumPickerSessionInfo alloc], "initWithSourceAlbum:transferredAssets:", 0, v7);
  v17 = (void *)MEMORY[0x1E0CD14E0];
  objc_msgSend(v4, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "librarySpecificFetchOptions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "fetchRootAlbumCollectionListWithOptions:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (_os_feature_enabled_impl())
  {
    -[PUAddToAlbumActivity setSelectedAssets:](self, "setSelectedAssets:", v4);
    v32 = v22;
    objc_msgSend(v4, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "photoLibrary");
    v24 = v16;
    v25 = v10;
    v26 = v15;
    v27 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUPickerUtilities pickerConfigurationForAddToAlbumWithPhotoLibrary:](PUPickerUtilities, "pickerConfigurationForAddToAlbumWithPhotoLibrary:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v27;
    v15 = v26;
    v10 = v25;
    v16 = v24;

    v30 = (PUAlbumPickerViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD2180]), "initWithConfiguration:", v29);
    -[PUAlbumPickerViewController setDelegate:](v30, "setDelegate:", self);

    v22 = v32;
  }
  else
  {
    v30 = -[PUAlbumPickerViewController initWithSpec:sessionInfo:]([PUAlbumPickerViewController alloc], "initWithSpec:sessionInfo:", v13, v16);
    -[PUAlbumPickerViewController setCollectionList:](v30, "setCollectionList:", v22);
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __61__PUAddToAlbumActivity__albumPickerViewControllerWithAssets___block_invoke;
    v34[3] = &unk_1E589B970;
    v35 = v4;
    v36 = v15;
    v37 = self;
    -[PUAlbumPickerViewController setCompletionHandler:](v30, "setCompletionHandler:", v34);

  }
  -[PUAlbumPickerViewController setModalInPresentation:](v30, "setModalInPresentation:", 1);

  return v30;
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
  id WeakRetained;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  id v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    -[PUAddToAlbumActivity selectedAssets](self, "selectedAssets");
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
    v25[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchAssetCollectionsWithLocalIdentifiers:options:", v13, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
    objc_msgSend(WeakRetained, "undoManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v18 = objc_alloc(MEMORY[0x1E0D7B170]);
      -[PUAddToAlbumActivity selectedAssets](self, "selectedAssets");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithAssets:assetCollection:", v19, v15);

      objc_msgSend(v20, "setShouldSortAssetsByCreationDate:", 1);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __48__PUAddToAlbumActivity_picker_didFinishPicking___block_invoke;
      v23[3] = &unk_1E58AA020;
      v23[4] = self;
      v24 = v15;
      objc_msgSend(v20, "executeWithUndoManager:completionHandler:", v17, v23);

    }
    v21 = v15 != 0;
  }
  else
  {
    v21 = 0;
  }
  v22 = objc_loadWeakRetained((id *)&self->_presenterViewController);
  objc_msgSend(v22, "dismissViewControllerAnimated:completion:", 1, 0);

  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v21);
}

- (void)_dismissPickerControllerAndCompleteTaskWithSuccess:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id WeakRetained;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  -[UIActivity activityDidFinish:](self, "activityDidFinish:", v4);
}

- (id)activityType
{
  return (id)*MEMORY[0x1E0D7BC60];
}

- (id)activityTitle
{
  return PULocalizedString(CFSTR("ADD_TO_ALBUM_ACTIVITY"));
}

- (id)_systemImageName
{
  return CFSTR("rectangle.stack.badge.plus");
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_opt_class();
  -[PXActivity itemSourceController](self, "itemSourceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "canPerformWithItemSourceController:", v5);

  return (char)v4;
}

- (void)performActivity
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  uint8_t v9[16];

  -[PXActivity itemSourceController](self, "itemSourceController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUAddToAlbumActivity _albumPickerViewControllerWithAssets:](self, "_albumPickerViewControllerWithAssets:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presenterViewController);
    objc_msgSend(WeakRetained, "px_presentOverTopmostPresentedViewController:animated:completion:", v6, 1, 0);

  }
  else
  {
    PLUIGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Share Sheet: Failed to create album picker for adding assets to album.", v9, 2u);
    }

    -[UIActivity activityDidFinish:](self, "activityDidFinish:", 0);
  }

}

- (NSArray)selectedAssets
{
  return self->_selectedAssets;
}

- (void)setSelectedAssets:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAssets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAssets, 0);
  objc_destroyWeak((id *)&self->_presenterViewController);
}

void __48__PUAddToAlbumActivity_picker_didFinishPicking___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "selectedAssets");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);

    }
  }

}

void __61__PUAddToAlbumActivity__albumPickerViewControllerWithAssets___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B170]), "initWithAssets:assetCollection:", *(_QWORD *)(a1 + 32), v3);
    objc_msgSend(v4, "setShouldSortAssetsByCreationDate:", 1);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__PUAddToAlbumActivity__albumPickerViewControllerWithAssets___block_invoke_2;
    v7[3] = &unk_1E58AA020;
    v5 = *(_QWORD *)(a1 + 40);
    v8 = *(id *)(a1 + 32);
    v9 = v3;
    objc_msgSend(v4, "executeWithUndoManager:completionHandler:", v5, v7);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + 216));
  objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, 0);

  objc_msgSend(*(id *)(a1 + 48), "activityDidFinish:", v3 != 0);
}

void __61__PUAddToAlbumActivity__albumPickerViewControllerWithAssets___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v5;
      v11 = 2112;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "failed adding assets to album: %@ %@ %@", (uint8_t *)&v9, 0x20u);
    }

  }
}

+ (BOOL)canPerformWithItemSourceController:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;

  v3 = a3;
  if (objc_msgSend(v3, "isPreparingIndividualItems"))
  {
    objc_msgSend(v3, "assets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_4838) == 0x7FFFFFFFFFFFFFFFLL;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (int64_t)activityCategory
{
  return 0;
}

BOOL __59__PUAddToAlbumActivity_canPerformWithItemSourceController___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "sourceType");
  return v2 == 2 || v2 == 8;
}

@end
