@implementation PUAlbumsGadgetViewController

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (PUAlbumsGadgetViewController)initWithLayout:(id)a3 dataSourceManager:(id)a4
{
  id v6;
  PUAlbumsGadgetViewController *v7;
  id v8;
  uint64_t v9;
  PHPhotoLibrary *photoLibrary;
  uint64_t v11;
  PXLibraryFilterState *libraryFilterState;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  PXSharedLibraryStatusProvider *sharedLibraryStatusProvider;
  objc_super v18;

  v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)PUAlbumsGadgetViewController;
  v7 = -[PUAlbumsGadgetViewController initWithLayout:dataSourceManager:](&v18, sel_initWithLayout_dataSourceManager_, a3, v6);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v6;
      objc_msgSend(v8, "photoLibrary");
      v9 = objc_claimAutoreleasedReturnValue();
      photoLibrary = v7->_photoLibrary;
      v7->_photoLibrary = (PHPhotoLibrary *)v9;

      objc_msgSend(v8, "libraryFilterState");
      v11 = objc_claimAutoreleasedReturnValue();
      libraryFilterState = v7->_libraryFilterState;
      v7->_libraryFilterState = (PXLibraryFilterState *)v11;

      objc_msgSend(v8, "traitCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "userInterfaceIdiom") == 1)
      {
        v14 = 1;
      }
      else
      {
        if (objc_msgSend(v13, "userInterfaceIdiom") != 2)
        {
LABEL_10:
          objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:", v7->_photoLibrary);
          v15 = objc_claimAutoreleasedReturnValue();
          sharedLibraryStatusProvider = v7->_sharedLibraryStatusProvider;
          v7->_sharedLibraryStatusProvider = (PXSharedLibraryStatusProvider *)v15;

          -[PXSharedLibraryStatusProvider registerChangeObserver:context:](v7->_sharedLibraryStatusProvider, "registerChangeObserver:context:", v7, PXSharedLibraryStatusProviderObservationContext_10639);
          -[PXLibraryFilterState registerChangeObserver:context:](v7->_libraryFilterState, "registerChangeObserver:context:", v7, PXLibraryFilterStateObservationContext_10640);

          goto LABEL_11;
        }
        if (objc_msgSend(v13, "layoutOrientation") == 1)
          v14 = 3;
        else
          v14 = 2;
      }
      -[PUAlbumsGadgetViewController setNumberOfInitialGadgetsToLoad:](v7, "setNumberOfInitialGadgetsToLoad:", v14);
      goto LABEL_10;
    }
  }
LABEL_11:

  return v7;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAlbumsGadgetViewController;
  -[PUAlbumsGadgetViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[PUAlbumsGadgetViewController _updateNavigationBar](self, "_updateNavigationBar");
  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventSourceWillAppear:sender:", 14, self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PUAlbumsGadgetViewController;
  -[PUAlbumsGadgetViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventSourceDidDisappear:sender:", 14, self);

}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a4;
  if (sel_newSharedAlbum_ == a3)
  {
    v8 = (void *)MEMORY[0x1E0D719E0];
    -[PUAlbumsGadgetViewController photoLibrary](self, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "photoLibraryURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "sharedStreamsEnabledForPhotoLibraryURL:", v10);

  }
  else if (sel_newSmartAlbum_ == a3)
  {
    v7 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PUAlbumsGadgetViewController;
    v7 = -[PUAlbumsGadgetViewController canPerformAction:withSender:](&v12, sel_canPerformAction_withSender_, a3, v6);
  }

  return v7;
}

- (void)newAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[PUAlbumsGadgetViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PULegacyViewControllerSpec specForIdiom:](PUAlbumListViewControllerSpec, "specForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLSAggregateDictionaryAddValueForScalarKey();
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.plusButtonNewAlbumSelected"), MEMORY[0x1E0C9AA70]);
  -[PUAlbumsGadgetViewController photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PUAlbumListViewController newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:](PUAlbumListViewController, "newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:", v6, 0, v7);

  -[PUAlbumsGadgetViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __41__PUAlbumsGadgetViewController_newAlbum___block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v8;
  v14 = v4;
  v10 = v4;
  v11 = v8;
  objc_msgSend(v9, "px_pushViewController:animated:completion:", v11, 1, v12);

}

- (void)newSharedAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[PUAlbumsGadgetViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PULegacyViewControllerSpec specForIdiom:](PUAlbumListViewControllerSpec, "specForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLSAggregateDictionaryAddValueForScalarKey();
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.plusButtonNewSharedAlbumSelected"), MEMORY[0x1E0C9AA70]);
  -[PUAlbumsGadgetViewController photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PUAlbumListViewController newSharedAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:](PUAlbumListViewController, "newSharedAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:", v6, 0, v7);

  -[PUAlbumsGadgetViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __47__PUAlbumsGadgetViewController_newSharedAlbum___block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v8;
  v14 = v4;
  v10 = v4;
  v11 = v8;
  objc_msgSend(v9, "px_pushViewController:animated:completion:", v11, 1, v12);

}

- (void)newFolder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[PUAlbumsGadgetViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PULegacyViewControllerSpec specForIdiom:](PUAlbumListViewControllerSpec, "specForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLSAggregateDictionaryAddValueForScalarKey();
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.plusButtonNewFolderSelected"), MEMORY[0x1E0C9AA70]);
  -[PUAlbumsGadgetViewController photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PUAlbumListViewController newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:](PUAlbumListViewController, "newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:", v6, 0, v7);

  -[PUAlbumsGadgetViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__PUAlbumsGadgetViewController_newFolder___block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v8;
  v14 = v4;
  v10 = v4;
  v11 = v8;
  objc_msgSend(v9, "px_pushViewController:animated:completion:", v11, 1, v12);

}

- (void)newSmartAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  -[PUAlbumsGadgetViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PULegacyViewControllerSpec specForIdiom:](PUAlbumListViewControllerSpec, "specForIdiom:", objc_msgSend(v5, "userInterfaceIdiom"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PLSAggregateDictionaryAddValueForScalarKey();
  objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.plusButtonNewSmartAlbumSelected"), MEMORY[0x1E0C9AA70]);
  -[PUAlbumsGadgetViewController photoLibrary](self, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[PUAlbumListViewController newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:](PUAlbumListViewController, "newMyAlbumsViewControllerWithSpec:sessionInfo:photoLibrary:", v6, 0, v7);

  -[PUAlbumsGadgetViewController navigationController](self, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __46__PUAlbumsGadgetViewController_newSmartAlbum___block_invoke;
  v12[3] = &unk_1E58ABCA8;
  v13 = v8;
  v14 = v4;
  v10 = v4;
  v11 = v8;
  objc_msgSend(v9, "px_pushViewController:animated:completion:", v11, 1, v12);

}

- (void)configureSectionHeader:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAlbumsGadgetViewController;
  v4 = a3;
  -[PUAlbumsGadgetViewController configureSectionHeader:](&v6, sel_configureSectionHeader_, v4);
  -[PUAlbumsGadgetViewController sessionInfo](self, "sessionInfo", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldShowDividerOnFirstSection:", objc_msgSend(v5, "isForAssetPicker") ^ 1);

}

- (int64_t)scrollAnimationIdentifier
{
  return 2;
}

- (BOOL)allowsBarManagement
{
  void *v3;
  void *v4;
  char v5;

  -[PUAlbumsGadgetViewController sessionInfo](self, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isForAssetPicker"))
  {
    -[PUAlbumsGadgetViewController sessionInfo](self, "sessionInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "allowsMultipleSelection");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)_navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PUAlbumsGadgetViewController _navigableGadgetForCollection:](self, "_navigableGadgetForCollection:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[PUAlbumsGadgetViewController navigationHelper](self, "navigationHelper");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v10, v6, 0);

    objc_msgSend(v10, "navigateToCollection:animated:completion:", v8, v6, v9);
    goto LABEL_15;
  }
  -[PUAlbumsGadgetViewController px_gridPresentation](self, "px_gridPresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "createViewControllerForAssetCollection:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      PLUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v8;
        _os_log_impl(&dword_1AAB61000, v15, OS_LOG_TYPE_ERROR, "Failed to navigate to collection %@", buf, 0xCu);
      }

      v14 = 0;
      goto LABEL_11;
    }
    objc_msgSend(v12, "createAlbumListViewControllerWithCollectionList:", v8);
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_11:
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __74__PUAlbumsGadgetViewController__navigateToCollection_animated_completion___block_invoke;
  v23 = &unk_1E58AB968;
  v25 = v9;
  v16 = v14;
  v24 = v16;
  v17 = _Block_copy(&v20);
  v18 = v17;
  if (v16)
  {
    -[PUAlbumsGadgetViewController navigationController](self, "navigationController", v20, v21, v22, v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "px_pushViewController:animated:completion:", v16, v6, v18);

  }
  else
  {
    (*((void (**)(void *))v17 + 2))(v17);
  }

LABEL_15:
}

- (id)_navigableGadgetForCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  -[PUAlbumsGadgetViewController dataSourceManager](self, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadRemainingGadgetsIfNeeded");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__10681;
  v17 = __Block_byref_object_dispose__10682;
  v18 = 0;
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__PUAlbumsGadgetViewController__navigableGadgetForCollection___block_invoke;
  v10[3] = &unk_1E589C898;
  v7 = v4;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateGadgetsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (BOOL)canNavigateToCollection:(id)a3
{
  return -[PUAlbumsGadgetViewController _canNavigateToCollection:skipGadgets:](self, "_canNavigateToCollection:skipGadgets:", a3, 0);
}

- (BOOL)_canNavigateToCollection:(id)a3 skipGadgets:(BOOL)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  unint64_t v10;

  v6 = a3;
  if (a4
    || (-[PUAlbumsGadgetViewController _navigableGadgetForCollection:](self, "_navigableGadgetForCollection:", v6),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v6;
      v10 = objc_msgSend(v9, "assetCollectionType");
      if (v10 <= 9 && ((1 << v10) & 0x206) != 0)
        v8 = 1;
      else
        v8 = objc_msgSend(v9, "px_isContentSyndicationAlbum");

    }
    else
    {
      objc_opt_class();
      v8 = (objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v6, "collectionListType") & 0xFFFFFFFFFFFFFFFELL) == 2;
    }
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (void)navigateToCollection:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a4;
  v8 = a5;
  v9 = (objc_class *)MEMORY[0x1E0D7B868];
  v10 = a3;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithObject:revealMode:", v10, 1);

  if (v5)
    v12 = 3;
  else
    v12 = 1;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __73__PUAlbumsGadgetViewController_navigateToCollection_animated_completion___block_invoke;
  v14[3] = &unk_1E589C8C0;
  v14[4] = self;
  v15 = v8;
  v13 = v8;
  -[PUAlbumsGadgetViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v11, v12, v14);

}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  unint64_t v3;
  unint64_t v4;

  v3 = objc_msgSend(a3, "type");
  v4 = 3;
  if (((1 << v3) & 0x10020180) == 0)
    v4 = 0;
  if (v3 <= 0x1C)
    return v4;
  else
    return 0;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PUAlbumsGadgetViewController *v17;
  id v18;
  SEL v19;
  unint64_t v20;

  v9 = a3;
  v10 = a5;
  -[PUAlbumsGadgetViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumsGadgetViewController dataSourceManager](self, "dataSourceManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__PUAlbumsGadgetViewController_navigateToDestination_options_completionHandler___block_invoke;
  v15[3] = &unk_1E589C910;
  v16 = v9;
  v17 = self;
  v18 = v10;
  v19 = a2;
  v20 = a4;
  v13 = v10;
  v14 = v9;
  objc_msgSend(v12, "loadRemainingGadgetsIfNeeded:", v15);

}

- (void)provideViewControllersForDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, uint64_t, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  PUAlbumsGadgetViewController *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  char v24;
  void *v25;
  PUAlbumsGadgetViewController **v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  PUAlbumsGadgetViewController **v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[5];
  void (**v34)(id, void *, uint64_t, _QWORD);
  PUAlbumsGadgetViewController *v35;
  _QWORD v36[2];
  PUAlbumsGadgetViewController *v37;
  _QWORD v38[2];
  PUAlbumsGadgetViewController *v39;
  _QWORD v40[2];
  PUAlbumsGadgetViewController *v41;
  PUAlbumsGadgetViewController *v42;
  uint8_t buf[4];
  PUAlbumsGadgetViewController *v44;
  __int16 v45;
  PUAlbumsGadgetViewController *v46;
  __int16 v47;
  id v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, uint64_t, _QWORD))a5;
  objc_msgSend(v8, "collectionHierarchy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D7B2A8], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "dataSourceType") != 5)
  {

LABEL_5:
    if (!objc_msgSend(v11, "px_isMediaTypesFolder"))
      goto LABEL_7;
    goto LABEL_6;
  }
  objc_msgSend(v8, "assetCollection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "px_isContentSyndicationAlbum");

  if ((v14 & 1) == 0)
    goto LABEL_5;
LABEL_6:
  objc_msgSend(v8, "assetCollection");
  v15 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v15;
LABEL_7:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v11;
  else
    v16 = 0;
  v17 = v16;
  if (v17
    && -[PUAlbumsGadgetViewController _canNavigateToCollection:skipGadgets:](self, "_canNavigateToCollection:skipGadgets:", v17, 1))
  {
    if (-[PUAlbumsGadgetViewController px_isTransientCollectionWithIdentifier:](v17, "px_isTransientCollectionWithIdentifier:", *MEMORY[0x1E0D7C8D8]))
    {
      -[PUAlbumsGadgetViewController setPx_navigationDestination:](self, "setPx_navigationDestination:", v8);
      v41 = self;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v18, 1, 0);
      goto LABEL_17;
    }
    -[PUAlbumsGadgetViewController px_gridPresentation](self, "px_gridPresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v18, "createViewControllerForAssetCollection:", v17);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PLUIGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v44 = v17;
          _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_ERROR, "Failed to navigate to collection %@", buf, 0xCu);
        }

        v22 = 0;
LABEL_26:
        v24 = objc_msgSend(v22, "routingOptionsForDestination:", v8);
        if ((v24 & 2) != 0)
        {
          -[PUAlbumsGadgetViewController setPx_navigationDestination:](self, "setPx_navigationDestination:", 0);
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __95__PUAlbumsGadgetViewController_provideViewControllersForDestination_options_completionHandler___block_invoke;
          v33[3] = &unk_1E589C938;
          v33[4] = self;
          v34 = v9;
          objc_msgSend(v22, "provideViewControllersForDestination:options:completionHandler:", v8, a4, v33);

LABEL_45:
          goto LABEL_17;
        }
        if ((v24 & 1) != 0)
        {
          -[PUAlbumsGadgetViewController setPx_navigationDestination:](self, "setPx_navigationDestination:", 0);
          v40[0] = self;
          v40[1] = v22;
          v25 = (void *)MEMORY[0x1E0C99D20];
          v26 = (PUAlbumsGadgetViewController **)v40;
        }
        else
        {
          if (objc_msgSend(v8, "type") == 17)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[PUAlbumsGadgetViewController setPx_navigationDestination:](self, "setPx_navigationDestination:", v8);
              v39 = self;
              v25 = (void *)MEMORY[0x1E0C99D20];
              v26 = &v39;
LABEL_42:
              v27 = 1;
              goto LABEL_43;
            }
          }
          if (objc_msgSend(v8, "type") != 28)
          {
            -[PUAlbumsGadgetViewController setPx_navigationDestination:](self, "setPx_navigationDestination:", 0);
            PXAssertGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v44 = self;
              v45 = 2112;
              v46 = v17;
              v47 = 2112;
              v48 = v8;
              _os_log_error_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_ERROR, "Albums gadget %@ failed to continue navigation after navigating to collection %@ for destination %@", buf, 0x20u);
            }

            if (v22)
            {
              v36[0] = self;
              v36[1] = v22;
              v29 = (void *)MEMORY[0x1E0C99D20];
              v30 = (PUAlbumsGadgetViewController **)v36;
              v31 = 2;
            }
            else
            {
              v35 = self;
              v29 = (void *)MEMORY[0x1E0C99D20];
              v30 = &v35;
              v31 = 1;
            }
            objc_msgSend(v29, "arrayWithObjects:count:", v30, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v9[2](v9, v32, 2, 0);
            goto LABEL_44;
          }
          -[PUAlbumsGadgetViewController setPx_navigationDestination:](self, "setPx_navigationDestination:", v8);
          if (!v22)
          {
            v37 = self;
            v25 = (void *)MEMORY[0x1E0C99D20];
            v26 = &v37;
            goto LABEL_42;
          }
          v38[0] = self;
          v38[1] = v22;
          v25 = (void *)MEMORY[0x1E0C99D20];
          v26 = (PUAlbumsGadgetViewController **)v38;
        }
        v27 = 2;
LABEL_43:
        objc_msgSend(v25, "arrayWithObjects:count:", v26, v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v32, 1, 0);
LABEL_44:

        goto LABEL_45;
      }
      objc_msgSend(v18, "createAlbumListViewControllerWithCollectionList:", v17);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v21;
    goto LABEL_26;
  }
  PLUIGetLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412802;
    v44 = self;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = v8;
    _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "Albums gadget %@ failed to navigate to collection %@ for destination %@", buf, 0x20u);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("Albums gadget %@ failed to navigate to collection %@ for destination %@"), self, v17, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, uint64_t, void *))v9)[2](v9, v20, 5, v18);

LABEL_17:
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  PXProgrammaticNavigationDestination *px_navigationDestination;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXProgrammaticNavigationDestination *v8;
  PXProgrammaticNavigationDestination *v9;

  px_navigationDestination = self->_px_navigationDestination;
  if (!px_navigationDestination)
  {
    v4 = objc_alloc(MEMORY[0x1E0D7B868]);
    -[PUAlbumsGadgetViewController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_virtualCollections");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allAlbumsCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (PXProgrammaticNavigationDestination *)objc_msgSend(v4, "initWithObject:revealMode:", v7, 0);
    v9 = self->_px_navigationDestination;
    self->_px_navigationDestination = v8;

    px_navigationDestination = self->_px_navigationDestination;
  }
  return px_navigationDestination;
}

- (BOOL)navigationHelperCanCurrentlyNavigate:(id)a3
{
  char v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUAlbumsGadgetViewController;
  if (-[PUAlbumsGadgetViewController navigationHelperCanCurrentlyNavigate:](&v7, sel_navigationHelperCanCurrentlyNavigate_, a3))
  {
    return 1;
  }
  -[PUAlbumsGadgetViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v5, "px_isVisible");

  return v4;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUAlbumsGadgetViewController;
  -[PUAlbumsGadgetViewController collectionView:cellForItemAtIndexPath:](&v6, sel_collectionView_cellForItemAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);
  return v4;
}

- (id)_createPlusButton
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  _QWORD v21[5];
  _QWORD v22[5];

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:primaryAction:", 4, 0);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("NEW_ALBUM_BUTTON"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.badge.plus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __49__PUAlbumsGadgetViewController__createPlusButton__block_invoke;
  v22[3] = &unk_1E58A6930;
  v22[4] = self;
  objc_msgSend(v5, "actionWithTitle:image:identifier:handler:", v6, v7, 0, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  v10 = (void *)MEMORY[0x1E0DC3428];
  PULocalizedString(CFSTR("NEW_FOLDER_BUTTON"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("folder.badge.plus"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  v21[1] = 3221225472;
  v21[2] = __49__PUAlbumsGadgetViewController__createPlusButton__block_invoke_2;
  v21[3] = &unk_1E58A6930;
  v21[4] = self;
  objc_msgSend(v10, "actionWithTitle:image:identifier:handler:", v11, v12, 0, v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

  if (-[PUAlbumsGadgetViewController canPerformAction:withSender:](self, "canPerformAction:withSender:", sel_newSharedAlbum_, 0))
  {
    v14 = (void *)MEMORY[0x1E0DC3428];
    PULocalizedString(CFSTR("NEW_PHOTO_STREAM"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("rectangle.stack.badge.person.crop"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __49__PUAlbumsGadgetViewController__createPlusButton__block_invoke_3;
    v20[3] = &unk_1E58A6930;
    v20[4] = self;
    objc_msgSend(v14, "actionWithTitle:image:identifier:handler:", v15, v16, 0, v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v17);

  }
  objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithTitle:children:", &stru_1E58AD278, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMenu:", v18);

  return v3;
}

- (void)_updateNavigationBar
{
  void *v3;
  void (**v4)(void);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[PUAlbumsGadgetViewController navigationItem](self, "navigationItem");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[PUAlbumsGadgetViewController sessionInfo](self, "sessionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[PUAlbumsGadgetViewController _createPlusButton](self, "_createPlusButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v9);

    objc_msgSend(v13, "setLeftBarButtonItems:", v5);
    -[PUAlbumsGadgetViewController sharedLibraryStatusProvider](self, "sharedLibraryStatusProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "hasSharedLibraryOrPreview"))
    {
      -[PUAlbumsGadgetViewController libraryFilterState](self, "libraryFilterState");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "hasPreview");
      PXSharedLibrarySwitchLibraryButtonItems();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumsGadgetViewController navigationItem](self, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setRightBarButtonItems:", v11);

    }
    else
    {
      -[PUAlbumsGadgetViewController navigationItem](self, "navigationItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRightBarButtonItems:", 0);
    }
    goto LABEL_11;
  }
  -[PUSessionInfo bannerGenerator](self->_sessionInfo, "bannerGenerator");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PUAlbumsGadgetViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pu_setBanner:", v5);

  objc_msgSend(v3, "localizedPrompt");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "promptLocation"))
  {
    if (objc_msgSend(v3, "promptLocation") == 1)
    {
      objc_msgSend(v5, "bannerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v7);

    }
  }
  else
  {
    objc_msgSend(v13, "setPrompt:", v7);
  }
  if (objc_msgSend(v3, "isSelectingAssets"))
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDoneButton_);
    objc_msgSend(v13, "setRightBarButtonItem:", v10);
LABEL_11:

  }
}

- (void)_handleDoneButton:(id)a3
{
  id v3;

  -[PUAlbumsGadgetViewController sessionInfo](self, "sessionInfo", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatus:", 1);

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  objc_super v9;

  v8 = a3;
  if ((void *)PXSharedLibraryStatusProviderObservationContext_10639 == a5
    || (void *)PXLibraryFilterStateObservationContext_10640 == a5)
  {
    if ((a4 & 3) != 0)
      -[PUAlbumsGadgetViewController _updateNavigationBar](self, "_updateNavigationBar");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PUAlbumsGadgetViewController;
    -[PUAlbumsGadgetViewController observable:didChange:context:](&v9, sel_observable_didChange_context_, v8, a4, a5);
  }

}

- (void)setPx_navigationDestination:(id)a3
{
  objc_storeStrong((id *)&self->_px_navigationDestination, a3);
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  return self->_sharedLibraryStatusProvider;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_sharedLibraryStatusProvider, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_px_navigationDestination, 0);
}

uint64_t __49__PUAlbumsGadgetViewController__createPlusButton__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newAlbum:", 0);
}

uint64_t __49__PUAlbumsGadgetViewController__createPlusButton__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newFolder:", 0);
}

uint64_t __49__PUAlbumsGadgetViewController__createPlusButton__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newSharedAlbum:", 0);
}

void __95__PUAlbumsGadgetViewController_provideViewControllersForDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = *(_QWORD *)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a4;
  v8 = a2;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v8, v11, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__PUAlbumsGadgetViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "collectionHierarchy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (v5 && (objc_msgSend(*(id *)(a1 + 40), "canNavigateToCollection:", v5) & 1) != 0)
  {
    if (!objc_msgSend(v5, "px_isTransientCollectionWithIdentifier:", *MEMORY[0x1E0D7C8D8]))
    {
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __80__PUAlbumsGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_162;
      v16[3] = &unk_1E589C8E8;
      v8 = *(void **)(a1 + 40);
      v9 = *(id *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      v11 = *(void **)(a1 + 48);
      v17 = v9;
      v18 = v10;
      v21 = *(_QWORD *)(a1 + 64);
      v12 = v11;
      v13 = *(_QWORD *)(a1 + 56);
      v20 = v12;
      v22 = v13;
      v19 = v5;
      objc_msgSend(v8, "_navigateToCollection:animated:completion:", v19, 0, v16);

      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 40), "setPx_navigationDestination:", *(_QWORD *)(a1 + 32));
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    PXAssertGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v24 = v14;
      v25 = 2112;
      v26 = v5;
      v27 = 2112;
      v28 = v15;
      _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Albums gadget %@ failed to navigate to collection %@ for destination %@", buf, 0x20u);
    }

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v6();
LABEL_12:

}

void __80__PUAlbumsGadgetViewController_navigateToDestination_options_completionHandler___block_invoke_162(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void (*v6)(void);
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "routingOptionsForDestination:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "type") == 8)
    {
      v4 = *(void **)(a1 + 40);
      v5 = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 32), "type") != 17 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        objc_msgSend(*(id *)(a1 + 40), "setPx_navigationDestination:", 0);
        PXAssertGetLog();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          v9 = *(_QWORD *)(a1 + 40);
          v8 = *(_QWORD *)(a1 + 48);
          v10 = *(_QWORD *)(a1 + 32);
          v11 = 138412802;
          v12 = v9;
          v13 = 2112;
          v14 = v8;
          v15 = 2112;
          v16 = v10;
          _os_log_error_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_ERROR, "Albums gadget %@ failed to continue navigation after navigating to collection %@ for destination %@", (uint8_t *)&v11, 0x20u);
        }

        v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
        goto LABEL_12;
      }
      v5 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(a1 + 40);
    }
    objc_msgSend(v4, "setPx_navigationDestination:", v5);
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
LABEL_12:
    v6();
    goto LABEL_13;
  }
  objc_msgSend(*(id *)(a1 + 40), "setPx_navigationDestination:", 0);
  objc_msgSend(v3, "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
LABEL_13:

}

void __73__PUAlbumsGadgetViewController_navigateToCollection_animated_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

void __62__PUAlbumsGadgetViewController__navigableGadgetForCollection___block_invoke(uint64_t a1, void *a2)
{
  char v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  v4 = objc_opt_respondsToSelector();
  v5 = v7;
  if ((v4 & 1) != 0)
  {
    v6 = v7;
    if (objc_msgSend(v6, "canNavigateToCollection:", *(_QWORD *)(a1 + 32)))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

    v5 = v7;
  }

}

uint64_t __74__PUAlbumsGadgetViewController__navigateToCollection_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

uint64_t __46__PUAlbumsGadgetViewController_newSmartAlbum___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newSmartAlbum:", *(_QWORD *)(a1 + 40));
}

uint64_t __42__PUAlbumsGadgetViewController_newFolder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newFolder:", *(_QWORD *)(a1 + 40));
}

uint64_t __47__PUAlbumsGadgetViewController_newSharedAlbum___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newSharedAlbum:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__PUAlbumsGadgetViewController_newAlbum___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "newAlbum:", *(_QWORD *)(a1 + 40));
}

- (id)px_gridPresentation
{
  void *v3;
  void *v4;

  createGridPresentationWithViewController(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUAlbumsGadgetViewController sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionInfo:", v4);

  return v3;
}

@end
