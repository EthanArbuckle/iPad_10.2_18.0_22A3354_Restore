@implementation PUTabbedLibraryViewController

- (UINavigationController)selectedNavigationController
{
  void *v2;
  void *v3;
  UINavigationController *v4;

  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PUTabbedLibraryViewController _updateForYouBadges](self, "_updateForYouBadges");
}

- (void)_updateForYouBadges
{
  void *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[PUTabbedLibraryViewController _navigationControllerForContentMode:](self, "_navigationControllerForContentMode:", 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_forYouTabBadgeIsDirty && v3 != 0)
  {
    v11 = v3;
    -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      v7 = 0;
    }
    else
    {
      if (-[PUTabbedLibraryViewController selectedContentMode](self, "selectedContentMode") == 11)
      {
        v7 = 0;
        goto LABEL_8;
      }
      -[PUTabbedLibraryViewController badgeManager](self, "badgeManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v9, "unreadBadgeCount");

      if (!v7)
        goto LABEL_8;
      PLSharedCountFormatter();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromNumber:", v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_8:
    objc_msgSend(v11, "tabBarItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBadgeValue:", v7);

    self->_forYouTabBadgeIsDirty = 0;
    v3 = v11;
  }

}

- (int)selectedContentMode
{
  void *v2;
  void *v3;
  int v4;

  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tabBarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tag");

  return v4;
}

- (void)updateDisplayedTabsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  _BYTE v32[128];
  _QWORD v33[2];

  v3 = a3;
  v33[1] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0DC3470], "shouldMakeUIForDefaultPNG"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photoCollectionViewBackgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v8);

    v9 = -[PUTabbedLibraryViewController _newNavigationControllerWithRootController:](self, "_newNavigationControllerWithRootController:", v5);
    v33[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTabbedLibraryViewController setViewControllers:](self, "setViewControllers:", v10);
LABEL_31:

    goto LABEL_32;
  }
  if (!self->_filteredAlbumListsByContentMode)
    return;
  v11 = (void *)MEMORY[0x1E0C99DE8];
  -[PUTabbedLibraryViewModel tabInfos](self->_viewModel, "tabInfos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithCapacity:", objc_msgSend(v12, "count"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[PUTabbedLibraryViewModel tabInfos](self->_viewModel, "tabInfos", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "contentMode");
        if (-[PUTabbedLibraryViewModel tabbedLibraryViewController:shouldShowTabForContentMode:](self->_viewModel, "tabbedLibraryViewController:shouldShowTabForContentMode:", self, v18))
        {
          -[PUTabbedLibraryViewController _navigationControllerForContentMode:](self, "_navigationControllerForContentMode:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v15);
  }

  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(v5, "containsObject:", v9) & 1) == 0)
  {
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v9;
      _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_INFO, "TabbedLibraryViewController: Selected view controller for content mode (%@) has been removed. Falling back to Photos tab.", buf, 0xCu);
    }

    -[PUTabbedLibraryViewController _navigateToContentMode:defaultLocationIfNeverDisplayed:animated:](self, "_navigateToContentMode:defaultLocationIfNeverDisplayed:animated:", 10, 1, v3);
  }
  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  -[PUTabbedLibraryViewController setViewControllers:animated:](self, "setViewControllers:animated:", v5, v3);
  if (self->_pendingSelectedContentMode == -1)
  {
    if (v22)
      goto LABEL_29;
  }
  else
  {
    -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      -[PUTabbedLibraryViewController setSelectedViewController:](self, "setSelectedViewController:", v23);
    self->_pendingSelectedContentMode = -1;

  }
  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController pendingNavigationRequest](self, "pendingNavigationRequest");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    -[PUTabbedLibraryViewController setPendingNavigationRequest:](self, "setPendingNavigationRequest:", 0);
    PXProgrammaticNavigationRequestExecute();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[PUTabbedLibraryViewController navigateToInitialLocationInNavigationController:](self, "navigateToInitialLocationInNavigationController:", v24);
  }

LABEL_29:
  if (objc_msgSend(v5, "count") != v22)
  {
    -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTabbedLibraryViewController setSelectedViewController:](self, "setSelectedViewController:", v10);
    goto LABEL_31;
  }
LABEL_32:

}

- (id)_navigationControllerForContentMode:(int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  id v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = -[PUTabbedLibraryViewController newRootViewControllerForContentMode:](self, "newRootViewControllerForContentMode:", v3);
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = -[PUTabbedLibraryViewController _newNavigationControllerWithRootController:](self, "_newNavigationControllerWithRootController:", v6);
      v5 = v7;
      -[PUTabbedLibraryViewModel tabbedLibraryViewController:tabBarItemForContentMode:](self->_viewModel, "tabbedLibraryViewController:tabBarItemForContentMode:", self, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTabBarItem:", v8);

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)_existingNavigationControllerForContentMode:(int)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          && -[PUTabbedLibraryViewController _contentModeForNavigationController:](self, "_contentModeForNavigationController:", v10) == a3)
        {
          v11 = v10;
          goto LABEL_12;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_12:

  return v11;
}

- (int)_contentModeForNavigationController:(id)a3
{
  void *v3;
  int v4;

  if (!a3)
    return -1;
  objc_msgSend(a3, "tabBarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "tag");

  return v4;
}

- (id)newRootViewControllerForContentMode:(int)a3
{
  uint64_t v3;
  NSObject *v6;
  PUSearchHomeViewController *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  PUAlbumsGadgetDataSourceManager *v12;
  void *v13;
  void *v14;
  void *v15;
  PUImportViewController *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  __CFString *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  PUSearchHomeViewController *v31;
  void *v32;
  void *v33;
  PUAlbumsGadgetDataSourceManager *v34;
  void *v35;
  void *v36;
  void *v37;
  PUAlbumsGadgetViewController *v38;
  void *v39;
  PUAlbumsGadgetViewController *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  PUPhotosGridViewController *v47;
  void *v48;
  PUPhotosGridViewController *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  __CFString *v56;
  void *v58;
  uint8_t buf[4];
  __CFString *v60;
  uint64_t v61;

  v3 = *(_QWORD *)&a3;
  v61 = *MEMORY[0x1E0C80C00];
  -[PUTabbedLibraryViewController tabbedLibraryLog](self, "tabbedLibraryLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 67240192;
    LODWORD(v60) = v3;
    _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CreateRootController", "%{public}d", buf, 8u);
  }
  v7 = 0;
  switch((int)v3)
  {
    case -1:
    case 3:
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 764, CFSTR("Invalid content mode requested: %i"), v3);

      abort();
    case 0:
    case 4:
    case 5:
    case 7:
    case 9:
      goto LABEL_28;
    case 1:
      -[PUTabbedLibraryViewControllerSpec createSharedAlbumListViewController](self->_spec, "createSharedAlbumListViewController");
      v7 = (PUSearchHomeViewController *)objc_claimAutoreleasedReturnValue();
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "px_virtualCollections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sharedAlbumsCollectionList");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v10);
      -[PUSearchHomeViewController setDataSourceManagerConfiguration:](v7, "setDataSourceManagerConfiguration:", v11);
      PULocalizedString(CFSTR("SHARED_TAB_ROOT_SHARED_ALBUM_LIST_TITLE"));
      v12 = (PUAlbumsGadgetDataSourceManager *)objc_claimAutoreleasedReturnValue();
      -[PUSearchHomeViewController setTitle:](v7, "setTitle:", v12);
      -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSearchHomeViewController setSessionInfo:](v7, "setSessionInfo:", v13);

      -[PUSearchHomeViewController navigationItem](v7, "navigationItem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      PULocalizedString(CFSTR("SHARED_TAB_ROOT_SHARED_ALBUM_LIST_BACK_BUTTON_TITLE"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pu_setDefaultBackBarButtonItemWithTitle:", v15);

      goto LABEL_13;
    case 2:
      -[PUTabbedLibraryViewControllerSpec createAlbumListViewController](self->_spec, "createAlbumListViewController");
      v7 = (PUSearchHomeViewController *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CD14E0];
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "librarySpecificFetchOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "fetchRootAlbumCollectionListWithOptions:", v21);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (PUAlbumsGadgetDataSourceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B710]), "initWithCollectionList:", v11);
      -[PUAlbumsGadgetDataSourceManager setIncludePeopleAlbum:](v12, "setIncludePeopleAlbum:", 1);
      -[PUAlbumsGadgetDataSourceManager setSeparateSectionsForSmartAndUserCollections:](v12, "setSeparateSectionsForSmartAndUserCollections:", 1);
      -[PUAlbumsGadgetDataSourceManager setCollectionTypesToInclude:](v12, "setCollectionTypesToInclude:", 5083088);
      -[PUSearchHomeViewController setDataSourceManagerConfiguration:](v7, "setDataSourceManagerConfiguration:", v12);
      -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSearchHomeViewController setSessionInfo:](v7, "setSessionInfo:", v22);

      PULocalizedString(CFSTR("ALBUMS_TAB_ROOT_CONTROLLER_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUSearchHomeViewController setTitle:](v7, "setTitle:", v14);
LABEL_13:

      goto LABEL_27;
    case 6:
      v16 = self->_importViewController;
      goto LABEL_15;
    case 10:
      v23 = objc_alloc(MEMORY[0x1E0D7B2C8]);
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PUSearchHomeViewController *)objc_msgSend(v23, "initWithPhotoLibrary:", v24);

      v25 = CFSTR("CURATED_LIBRARY_TAB");
      goto LABEL_18;
    case 11:
      v26 = objc_alloc(MEMORY[0x1E0D7B468]);
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTabbedLibraryViewController libraryFilterState](self, "libraryFilterState");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTabbedLibraryViewController badgeManager](self, "badgeManager");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (PUSearchHomeViewController *)objc_msgSend(v26, "initWithPhotoLibrary:libraryFilterState:badgeManager:", v27, v28, v29);

      v25 = CFSTR("FOR_YOU_TAB");
LABEL_18:
      PULocalizedString(v25);
      v30 = objc_claimAutoreleasedReturnValue();
      goto LABEL_20;
    case 12:
      v31 = [PUSearchHomeViewController alloc];
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[PXSearchHomeViewController initWithPhotoLibrary:](v31, "initWithPhotoLibrary:", v32);

      PXLocalizedString();
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_20:
      v33 = (void *)v30;
      -[PUSearchHomeViewController setTitle:](v7, "setTitle:", v30);

      goto LABEL_28;
    case 13:
      v10 = objc_alloc_init(MEMORY[0x1E0D7B490]);
      -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = [PUAlbumsGadgetDataSourceManager alloc];
      -[PUTabbedLibraryViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTabbedLibraryViewController libraryFilterState](self, "libraryFilterState");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PUAlbumsGadgetDataSourceManager initWithTraitCollection:sessionInfo:photoLibrary:libraryFilterState:](v34, "initWithTraitCollection:sessionInfo:photoLibrary:libraryFilterState:", v35, v11, v36, v37);

      v38 = -[PUAlbumsGadgetViewController initWithLayout:dataSourceManager:]([PUAlbumsGadgetViewController alloc], "initWithLayout:dataSourceManager:", v10, v12);
      -[PUAlbumsGadgetViewController setSessionInfo:](v38, "setSessionInfo:", v11);
      PULocalizedString(CFSTR("ALBUMS_TAB_ROOT_CONTROLLER_TITLE"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUAlbumsGadgetViewController setTitle:](v38, "setTitle:", v39);

      v40 = v38;
      -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v36) = objc_msgSend(v41, "isSelectingAssets");

      v7 = (PUSearchHomeViewController *)v40;
      if ((_DWORD)v36)
      {
        v7 = -[PUTabbedLibraryViewController _newNavigationControllerWithRootController:](self, "_newNavigationControllerWithRootController:", v40);
        -[PUSearchHomeViewController navigationBar](v7, "navigationBar");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setPrefersLargeTitles:", 0);

      }
      goto LABEL_26;
    case 14:
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "librarySpecificFetchOptions");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "setIncludeAllPhotosSmartAlbum:", 1);
      objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000205, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (PUAlbumsGadgetDataSourceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithCollectionListFetchResult:options:", v11, 2);
      v40 = (PUAlbumsGadgetViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v12);
      -[PUTabbedLibraryViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[PULegacyViewControllerSpec specForIdiom:](PUPhotosAlbumViewControllerSpec, "specForIdiom:", objc_msgSend(v44, "userInterfaceIdiom"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "gridSpec");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = [PUPhotosGridViewController alloc];
      -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -[PUPhotosGridViewController initWithSpec:photoLibrary:](v47, "initWithSpec:photoLibrary:", v46, v48);

      PULocalizedString(CFSTR("ALL_PHOTOS_TAB"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController setTitle:](v49, "setTitle:", v50);

      -[PUPhotosGridViewController setPhotosDataSource:](v49, "setPhotosDataSource:", v40);
      -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUPhotosGridViewController setSessionInfo:](v49, "setSessionInfo:", v51);

      -[PUPhotosGridViewController setInitiallyScrolledToBottom:](v49, "setInitiallyScrolledToBottom:", 1);
      -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v48) = objc_msgSend(v52, "isSelectingAssets");

      if ((_DWORD)v48)
        -[PUPhotosGridViewController setShowsSelectionSessionCancelButtonItemOnLeft:](v49, "setShowsSelectionSessionCancelButtonItemOnLeft:", 1);
      v7 = -[PUTabbedLibraryViewController _newNavigationControllerWithRootController:](self, "_newNavigationControllerWithRootController:", v49);
      -[PUSearchHomeViewController navigationBar](v7, "navigationBar");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "setPrefersLargeTitles:", 0);

LABEL_26:
LABEL_27:

      goto LABEL_28;
    default:
      if ((v3 - 1000) < 2)
        goto LABEL_6;
      if ((_DWORD)v3 == 990)
      {
        -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        PXSoftLinkedProtoPrototypeViewController();
        v7 = (PUSearchHomeViewController *)objc_claimAutoreleasedReturnValue();

        if (!v7)
        {
          PXAssertGetLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_ERROR, "couldn't load prototype view controller", buf, 2u);
          }

LABEL_6:
          __69__PUTabbedLibraryViewController_newRootViewControllerForContentMode___block_invoke();
          v16 = (PUImportViewController *)objc_claimAutoreleasedReturnValue();
LABEL_15:
          v7 = (PUSearchHomeViewController *)v16;
        }
      }
LABEL_28:
      -[PUSearchHomeViewController navigationItem](v7, "navigationItem");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "px_setPreferredLargeTitleDisplayMode:", 1);

      -[PUSearchHomeViewController title](v7, "title");
      v55 = objc_claimAutoreleasedReturnValue();
      if (v55)
        v56 = (__CFString *)v55;
      else
        v56 = &stru_1E58AD278;
      if (os_signpost_enabled(v6))
      {
        *(_DWORD *)buf = 138543362;
        v60 = v56;
        _os_signpost_emit_with_name_impl(&dword_1AAB61000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CreateRootController", "%{public}@", buf, 0xCu);
      }

      return v7;
  }
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_os_log)tabbedLibraryLog
{
  if (tabbedLibraryLog_onceToken != -1)
    dispatch_once(&tabbedLibraryLog_onceToken, &__block_literal_global_623);
  return (OS_os_log *)(id)tabbedLibraryLog_tabbedLibraryLog;
}

- (id)_newNavigationControllerWithRootController:(id)a3
{
  id v4;
  PUNavigationController *v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (PUNavigationController *)v4;
  }
  else
  {
    v5 = -[PUNavigationController initWithRootViewController:]([PUNavigationController alloc], "initWithRootViewController:", v4);
    -[PUNavigationController navigationBar](v5, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPrefersLargeTitles:", 1);

    -[PUNavigationController setDelegate:](v5, "setDelegate:", self);
  }

  return v5;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  -[PUTabbedLibraryViewController _updateRootViewControllersInNavigationControllers:tabBarHidden:](self, "_updateRootViewControllersInNavigationControllers:tabBarHidden:", v6, -[PUTabbedLibraryViewController px_hidesTabBarForCurrentHorizontalSizeClass](self, "px_hidesTabBarForCurrentHorizontalSizeClass"));
  v10.receiver = self;
  v10.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController setViewControllers:animated:](&v10, sel_setViewControllers_animated_, v6, v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", *MEMORY[0x1E0D7C750], self);

  -[PUTabbedLibraryViewController sidebarViewController](self, "sidebarViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController px_navigationDestination](self, "px_navigationDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectItemForDestination:", v9);

}

- (PUSidebarViewController)sidebarViewController
{
  return (PUSidebarViewController *)objc_loadWeakRetained((id *)&self->_sidebarViewController);
}

- (PXProgrammaticNavigationDestination)px_navigationDestination
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController px_navigationDestination](&v3, sel_px_navigationDestination);
  return (PXProgrammaticNavigationDestination *)(id)objc_claimAutoreleasedReturnValue();
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (void)_updateRootViewControllersInNavigationControllers:(id)a3 tabBarHidden:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "bottomViewController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setHidesBottomBarWhenPushed:", v4);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (PXForYouBadgeManager)badgeManager
{
  PXForYouBadgeManager *badgeManager;
  id v4;
  void *v5;
  PXForYouBadgeManager *v6;
  PXForYouBadgeManager *v7;

  badgeManager = self->_badgeManager;
  if (!badgeManager)
  {
    v4 = objc_alloc(MEMORY[0x1E0D7B460]);
    -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PXForYouBadgeManager *)objc_msgSend(v4, "initWithPhotoLibrary:", v5);
    v7 = self->_badgeManager;
    self->_badgeManager = v6;

    -[PXForYouBadgeManager registerChangeObserver:context:](self->_badgeManager, "registerChangeObserver:context:", self, PXForYouBadgeManagerObservationContext);
    px_dispatch_on_main_queue_when_idle_after_delay();
    badgeManager = self->_badgeManager;
  }
  return badgeManager;
}

- (void)setSelectedViewController:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSString *v14;
  NSString *v15;
  __CFString *v16;
  char v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  int v29;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[PUTabbedLibraryViewController _contentModeForNavigationController:](self, "_contentModeForNavigationController:", v4);
  v6 = -[PUTabbedLibraryViewController tabIdentifierForContentMode:](self, "tabIdentifierForContentMode:", v5);
  objc_msgSend(MEMORY[0x1E0D7BB98], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCurrentTab:", v6);

  v8 = 0;
  if (v6 > 989)
  {
    v9 = CFSTR("ppt_PXTabIdentifierBlank");
    v10 = CFSTR("ppt_PXTabIdentifierNil");
    if (v6 != 1001)
      v10 = 0;
    if (v6 != 1000)
      v9 = v10;
    if (v6 == 990)
      v8 = CFSTR("PXTabIdentifierPrototype");
    else
      v8 = (__CFString *)v9;
  }
  else
  {
    switch(v6)
    {
      case 0:
        v8 = CFSTR("PXTabIdentifierUndefined");
        break;
      case 2:
        v8 = CFSTR("PXTabIdentifierMemories");
        break;
      case 3:
        v8 = CFSTR("PXTabIdentifierShared");
        break;
      case 4:
        v8 = CFSTR("PXTabIdentifierAlbums");
        break;
      case 5:
        v8 = CFSTR("PXTabIdentifierLibrary");
        break;
      case 6:
        v8 = CFSTR("PXTabIdentifierForYou");
        break;
      case 7:
        v8 = CFSTR("PXTabIdentifierSearch");
        break;
      case 8:
        v8 = CFSTR("PXTabIdentifierConsolidatedAlbums");
        break;
      case 10:
        v8 = CFSTR("PXTabIdentifierImport");
        break;
      case 11:
        v8 = CFSTR("PXTabIdentifierAllPhotos");
        break;
      default:
        break;
    }
  }
  -[PUTabbedLibraryViewController parentViewController](self, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByAppendingFormat:](v8, "stringByAppendingFormat:", CFSTR("_%@"), v13);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v14 = self->_lastSelectedTabDescription;
  if (v8 == (__CFString *)v14)
  {

  }
  else
  {
    v15 = v14;
    v16 = v8;
    v17 = -[__CFString isEqualToString:](v16, "isEqualToString:", v15);

    if ((v17 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_lastSelectedTabDescription, v8);
      v18 = (void *)MEMORY[0x1E0D09910];
      v19 = *MEMORY[0x1E0D09740];
      v33 = *MEMORY[0x1E0D09860];
      v34[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "sendEvent:withPayload:", v19, v20);

    }
  }
  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController setSelectedViewController:](&v30, sel_setSelectedViewController_, v4);
  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 != v22)
  {
    -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "viewControllers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v25, "setEditing:animated:", 0, 0);
    -[PUTabbedLibraryViewController sidebarViewController](self, "sidebarViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_navigationDestination");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "selectItemForDestination:", v27);

    PLPPTGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v32 = v5;
      _os_log_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_DEFAULT, "Switched to tab with content mode %d", buf, 8u);
    }

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v29 = -[PUTabbedLibraryViewController _contentModeForNavigationController:](self, "_contentModeForNavigationController:", v4);
    -[NSMutableIndexSet addIndex:](self->_everDisplayedContentModes, "addIndex:", v29);
    if (v29 == 13 || v29 == 2)
      -[PUTabbedLibraryViewController setShouldNavigateToAllPhotosAlbum:](self, "setShouldNavigateToAllPhotosAlbum:", 0);
  }

}

- (unint64_t)tabIdentifierForContentMode:(int)a3
{
  unint64_t result;
  unint64_t v4;
  uint64_t v5;

  result = 0;
  if (a3 > 989)
  {
    v4 = 1000;
    v5 = 1001;
    if (a3 != 1001)
      v5 = 0;
    if (a3 != 1000)
      v4 = v5;
    if (a3 == 990)
      return 990;
    else
      return v4;
  }
  else
  {
    switch(a3)
    {
      case 1:
        result = 3;
        break;
      case 2:
        result = 4;
        break;
      case 6:
        result = 10;
        break;
      case 10:
        result = 5;
        break;
      case 11:
        result = 6;
        break;
      case 12:
        result = 7;
        break;
      case 13:
        result = 8;
        break;
      case 14:
        result = 11;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (PXProgrammaticNavigationRequest)pendingNavigationRequest
{
  return self->_pendingNavigationRequest;
}

- (void)navigateToInitialLocationInNavigationController:(id)a3
{
  -[PUTabbedLibraryViewController _navigateToDefaultLocationInNavigationController:animated:](self, "_navigateToDefaultLocationInNavigationController:animated:", a3, 0);
}

- (PUTabbedLibraryViewController)initWithSpec:(id)a3 photoLibrary:(id)a4 libraryFilterState:(id)a5
{
  id v10;
  id v11;
  id v12;
  PUTabbedLibraryViewController *v13;
  uint64_t v14;
  PUTabbedLibraryViewModel *viewModel;
  NSMutableIndexSet *v16;
  NSMutableIndexSet *everDisplayedContentModes;
  id v18;
  void *v19;
  uint64_t v20;
  NSMutableDictionary *filteredAlbumListsByContentMode;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  id v38;
  _QWORD v39[4];
  PUTabbedLibraryViewController *v40;
  objc_super v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v41.receiver = self;
  v41.super_class = (Class)PUTabbedLibraryViewController;
  v13 = -[PUTabbedLibraryViewController initWithNibName:bundle:](&v41, sel_initWithNibName_bundle_, 0, 0);
  if (v13)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PUTabbedLibraryViewController.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("spec"));

    }
    v38 = v12;
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PUTabbedLibraryViewController.m"), 172, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

    }
    objc_storeStrong((id *)&v13->_spec, a3);
    objc_storeStrong((id *)&v13->_photoLibrary, a4);
    objc_storeStrong((id *)&v13->_libraryFilterState, a5);
    v13->_pendingSelectedContentMode = -1;
    +[PUTabbedLibraryViewModel viewModelWithDefaultParameters](PUTabbedLibraryViewModel, "viewModelWithDefaultParameters");
    v14 = objc_claimAutoreleasedReturnValue();
    viewModel = v13->_viewModel;
    v13->_viewModel = (PUTabbedLibraryViewModel *)v14;

    v16 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    everDisplayedContentModes = v13->_everDisplayedContentModes;
    v13->_everDisplayedContentModes = v16;

    v13->_forYouTabBadgeIsDirty = 1;
    v18 = objc_alloc(MEMORY[0x1E0C99E08]);
    -[PUTabbedLibraryViewModel tabInfos](v13->_viewModel, "tabInfos");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithCapacity:", objc_msgSend(v19, "count"));
    filteredAlbumListsByContentMode = v13->_filteredAlbumListsByContentMode;
    v13->_filteredAlbumListsByContentMode = (NSMutableDictionary *)v20;

    objc_msgSend(MEMORY[0x1E0D7B328], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "springLoadingEnabled");
    -[PUTabbedLibraryViewController tabBar](v13, "tabBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setSpringLoaded:", v23);

    v25 = objc_alloc_init(MEMORY[0x1E0DC3D30]);
    objc_msgSend(v25, "configureWithTransparentBackground");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setBackgroundColor:", v26);

    -[PUTabbedLibraryViewController tabBar](v13, "tabBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setScrollEdgeAppearance:", v25);

    objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0DC5338];
    -[PUTabbedLibraryViewController view](v13, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "window");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "windowScene");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v13, sel__sceneWillEnterForeground_, v29, v32);

    objc_msgSend(v28, "addAssetContainerChangeObserver:container:", v13, 0);
    objc_msgSend(v28, "addAssetContainerListChangeObserver:containerList:", v13, 0);
    objc_msgSend(v28, "addInvitationRecordsObserver:", v13);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v13, sel__didFinishPostingNotifications_, *MEMORY[0x1E0D71CF8], 0);

    objc_msgSend(MEMORY[0x1E0D7B860], "sharedScheduler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __78__PUTabbedLibraryViewController_initWithSpec_photoLibrary_libraryFilterState___block_invoke;
    v39[3] = &unk_1E58ABD10;
    v40 = v13;
    objc_msgSend(v34, "scheduleMainQueueTask:", v39);

    v12 = v38;
  }

  return v13;
}

- (BOOL)_navigateToDefaultLocationInNavigationController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  int v7;
  int v8;
  id v9;
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
  void *v21;
  id v22;

  v4 = a4;
  v6 = a3;
  v7 = -[PUTabbedLibraryViewController _contentModeForNavigationController:](self, "_contentModeForNavigationController:", v6);
  LOBYTE(v8) = 0;
  if (v7 <= 9)
  {
    if (v7 == 1)
    {
      objc_msgSend(v6, "topViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "conformsToProtocol:", &unk_1EEC81460))
      {
        objc_msgSend(v18, "navigateToNewestContentAnimated:", v4);
        LOBYTE(v8) = 0;
      }
      else
      {
        objc_msgSend(v6, "viewControllers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v8 = objc_msgSend(v20, "conformsToProtocol:", &unk_1EEC47440);
        if (v8)
        {
          objc_msgSend(v6, "topViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 != v20)
          {
            v22 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 0);
            v4 = 0;
          }
          objc_msgSend(v20, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", v4, 0, 0);
        }

      }
      goto LABEL_23;
    }
    if (v7 != 2)
      goto LABEL_23;
    goto LABEL_8;
  }
  switch(v7)
  {
    case 14:
LABEL_5:
      v9 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 1);
LABEL_14:
      LOBYTE(v8) = 0;
      break;
    case 13:
LABEL_8:
      if (!-[PUTabbedLibraryViewController shouldNavigateToAllPhotosAlbum](self, "shouldNavigateToAllPhotosAlbum"))
        goto LABEL_14;
      objc_msgSend(v6, "viewControllers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EEC471B0);
      if (v8)
      {
        objc_msgSend(v6, "topViewController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12 != v11)
        {
          v13 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 0);
          v4 = 0;
        }
        -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "librarySpecificFetchOptions");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchUserLibraryAlbumWithOptions:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "navigateToCollection:animated:completion:", v17, v4, 0);

      }
      break;
    case 10:
      goto LABEL_5;
  }
LABEL_23:

  return v8;
}

- (NSArray)excludedContentModes
{
  return self->_excludedContentModes;
}

- (PUSessionInfo)sessionInfo
{
  return self->_sessionInfo;
}

- (PUImportViewController)importViewController
{
  return self->_importViewController;
}

- (unint64_t)supportedInterfaceOrientations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTabbedLibraryViewController;
  return -[PUTabbedLibraryViewController supportedInterfaceOrientations](&v3, sel_supportedInterfaceOrientations);
}

- (BOOL)_navigationControllerShouldCrossFadeBottomBars:(id)a3
{
  return +[PUNavigationTransition shouldCrossFadeBottomBarsForNavigationController:](PUNavigationTransition, "shouldCrossFadeBottomBarsForNavigationController:", a3);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v8 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "navigationController:willShowViewController:animated:", v8, v7, v5);

}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;

  v5 = a5;
  v8 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v8, "navigationController:didShowViewController:animated:", v8, v7, v5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    -[PUTabbedLibraryViewController updateDisplayedTabsAnimated:](self, "updateDisplayedTabsAnimated:", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUTabbedLibraryViewController px_enableExtendedTraitCollection](self, "px_enableExtendedTraitCollection");
  self->_forYouTabBadgeIsDirty = 1;
}

void __49__PUTabbedLibraryViewController_tabbedLibraryLog__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photos.ui", "TabbedLibrary");
  v1 = (void *)tabbedLibraryLog_tabbedLibraryLog;
  tabbedLibraryLog_tabbedLibraryLog = (uint64_t)v0;

}

- (void)_sceneWillEnterForeground:(id)a3
{
  void *v4;
  uint64_t v5;

  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[PUTabbedLibraryViewController updateDisplayedTabsAnimated:](self, "updateDisplayedTabsAnimated:", 1);
}

- (void)px_setHidesTabBarForRegularHorizontalSizeClass:(BOOL)a3
{
  id v4;

  if (self->_px_hidesTabBarForRegularHorizontalSizeClass != a3)
  {
    self->_px_hidesTabBarForRegularHorizontalSizeClass = a3;
    -[PUTabbedLibraryViewController traitCollection](self, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PUTabbedLibraryViewController _updateTabBarVisibilityForHorizontalSizeClass:](self, "_updateTabBarVisibilityForHorizontalSizeClass:", objc_msgSend(v4, "horizontalSizeClass"));

  }
}

- (void)setSelectedContentMode:(int)a3
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a3;
  if (v5)
  {
    -[PUTabbedLibraryViewController setSelectedViewController:](self, "setSelectedViewController:", v5);
    v6 = -1;
  }
  self->_pendingSelectedContentMode = v6;
  if (a3 != 1)
    goto LABEL_11;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v7 = getSBSSpringBoardServerPortSymbolLoc_ptr_92179;
  v17 = getSBSSpringBoardServerPortSymbolLoc_ptr_92179;
  if (!getSBSSpringBoardServerPortSymbolLoc_ptr_92179)
  {
    v8 = SpringBoardServicesLibrary_92180();
    v7 = dlsym(v8, "SBSSpringBoardServerPort");
    v15[3] = (uint64_t)v7;
    getSBSSpringBoardServerPortSymbolLoc_ptr_92179 = v7;
  }
  _Block_object_dispose(&v14, 8);
  if (v7)
  {
    v9 = ((uint64_t (*)(void))v7)();
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v10 = getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr;
    v17 = getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr;
    if (!getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr)
    {
      v11 = SpringBoardServicesLibrary_92180();
      v10 = dlsym(v11, "SBShowNetworkPromptsIfNecessary");
      v15[3] = (uint64_t)v10;
      getSBShowNetworkPromptsIfNecessarySymbolLoc_ptr = v10;
    }
    _Block_object_dispose(&v14, 8);
    if (v10)
    {
      ((void (*)(uint64_t, _QWORD))v10)(v9, 0);
LABEL_11:

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "kern_return_t softlink_SBShowNetworkPromptsIfNecessary(mach_port_t, uint8_t)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PUTabbedLibraryViewController.m"), 125, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mach_port_t softlink_SBSSpringBoardServerPort(void)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("PUTabbedLibraryViewController.m"), 124, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

void __78__PUTabbedLibraryViewController_initWithSpec_photoLibrary_libraryFilterState___block_invoke(uint64_t a1)
{
  id v2;

  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addKeyObserver:", *(_QWORD *)(a1 + 32));

}

uint64_t __45__PUTabbedLibraryViewController_badgeManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1312), "startListeningForChanges");
}

- (id)px_gridPresentation
{
  void *v3;
  void *v4;

  createGridPresentationWithViewController(self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController sessionInfo](self, "sessionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSessionInfo:", v4);

  return v3;
}

- (PUTabbedLibraryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 204, CFSTR("%s is not available as initializer"), "-[PUTabbedLibraryViewController initWithNibName:bundle:]");

  abort();
}

- (PUTabbedLibraryViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 208, CFSTR("%s is not available as initializer"), "-[PUTabbedLibraryViewController initWithCoder:]");

  abort();
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[PUTabbedLibrarySettings sharedInstance](PUTabbedLibrarySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeKeyObserver:", self);

  objc_msgSend(MEMORY[0x1E0D715F0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController dealloc](&v6, sel_dealloc);
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PUTabbedLibraryViewController;
  v7 = a4;
  -[PUTabbedLibraryViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v14, sel_willTransitionToTraitCollection_withTransitionCoordinator_, v6, v7);
  -[PUTabbedLibraryViewController traitCollection](self, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "horizontalSizeClass");

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__PUTabbedLibraryViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E58A8878;
  v11[4] = self;
  v12 = v6;
  v13 = v9;
  v10 = v6;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v11);

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "shouldAutorotateToInterfaceOrientation:", a3);
  else
    v6 = a3 == 1;

  return v6;
}

- (BOOL)shouldExposeShortcutForTabBarItem:(id)a3 atIndex:(unint64_t)a4
{
  return -[PUTabbedLibraryViewController px_isTabBarHidden](self, "px_isTabBarHidden", a3, a4) ^ 1;
}

- (id)localizedDiscoverabilityTitleForTabBarItem:(id)a3 atIndex:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PUTabbedLibraryViewModel tabInfoForContentMode:](self->_viewModel, "tabInfoForContentMode:", objc_msgSend(a3, "tag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "labelKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("SWITCH_TO_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)pu_shouldSelectViewController:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  id v8;
  _BOOL4 v9;
  int v10;
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v4 = a3;
  -[PUTabbedLibraryViewController tabBar](self, "tabBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isUserInteractionEnabled");

  if (v6)
  {
    v7 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v14 = 1;
LABEL_23:

      goto LABEL_24;
    }
    -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v9 = -[PUTabbedLibraryViewController _isNavigationControllerBadged:](self, "_isNavigationControllerBadged:", v7);
    v10 = -[PUTabbedLibraryViewController _contentModeForNavigationController:](self, "_contentModeForNavigationController:", v7);
    v11 = -[NSMutableIndexSet containsIndex:](self->_everDisplayedContentModes, "containsIndex:", v10) ^ 1 | v9;
    switch(v10)
    {
      case 13:
        goto LABEL_6;
      case 10:
        goto LABEL_7;
      case 2:
LABEL_6:
        if (((-[PUTabbedLibraryViewController shouldNavigateToAllPhotosAlbum](self, "shouldNavigateToAllPhotosAlbum") | v11) & 1) != 0)
          goto LABEL_7;
        break;
      default:
        if (v11)
        {
LABEL_7:
          v12 = -[PUTabbedLibraryViewController _navigateToDefaultLocationInNavigationController:animated:](self, "_navigateToDefaultLocationInNavigationController:animated:", v7, v8 == v7);
          v13 = v8 == v7 && v12;
          v14 = !v13;
          if (v13)
            goto LABEL_23;
LABEL_16:
          if (v8 == v7)
          {
            objc_msgSend(v7, "topViewController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v15, "pu_handleSecondTabTap") & 1) != 0)
            {
              v14 = 0;
            }
            else
            {
              -[PUTabbedLibraryViewController _snapBackRootViewControllerInNavigationController:](self, "_snapBackRootViewControllerInNavigationController:", v7);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v16 == 0;
              if (v16)
                v17 = (id)objc_msgSend(v7, "popToViewController:animated:", v16, 1);

            }
          }
          goto LABEL_23;
        }
        break;
    }
    v14 = 1;
    goto LABEL_16;
  }
  v14 = 0;
LABEL_24:

  return v14;
}

- (id)_albumListForContentMode:(int)a3 library:(id)a4
{
  uint64_t v4;
  id v6;
  NSMutableDictionary *filteredAlbumListsByContentMode;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  void *v15;
  int v16;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  filteredAlbumListsByContentMode = self->_filteredAlbumListsByContentMode;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](filteredAlbumListsByContentMode, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0D71908], "filteredAlbumListForContentMode:library:", v4, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v9 = (void *)v10;
      v11 = self->_filteredAlbumListsByContentMode;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v9, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_filteredAlbumListsByContentMode;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v12, v14);

      v9 = 0;
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "isEqual:", v15);

  if (v16)
  {

    v9 = 0;
  }

  return v9;
}

- (int)_contentModeForAlbum:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  void *v19;
  id obj;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0D719A8], "systemMainQueuePhotoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v7)
    {
      v8 = v7;
      v21 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v21)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "tabBarItem");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "tag");

          -[PUTabbedLibraryViewController _albumListForContentMode:library:](self, "_albumListForContentMode:library:", v11, v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v11 == 13)
          {
            -[PUTabbedLibraryViewController _albumListForContentMode:library:](self, "_albumListForContentMode:library:", 1, v6);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          objc_msgSend(v12, "albums");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v4);

          if (v15)
          {

            goto LABEL_18;
          }
          objc_msgSend(v13, "albums");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "containsObject:", v4);

          if ((v17 & 1) != 0)
            goto LABEL_18;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        LODWORD(v11) = -1;
        if (v8)
          continue;
        break;
      }
    }
    else
    {
      LODWORD(v11) = -1;
    }
LABEL_18:

    v5 = v19;
  }
  else
  {
    LODWORD(v11) = -1;
  }

  return v11;
}

- (NSArray)rootViewControllers
{
  void *v2;
  void *v3;

  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (int)contentModeForTabIdentifier:(unint64_t)a3
{
  int result;
  int v4;
  int v5;

  result = 0;
  if ((uint64_t)a3 > 989)
  {
    if (a3 == 1001)
      v4 = 1001;
    else
      v4 = 0;
    if (a3 == 1000)
      v5 = 1000;
    else
      v5 = v4;
    if (a3 == 990)
      return 990;
    else
      return v5;
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
      case 2uLL:
        result = -1;
        break;
      case 3uLL:
        result = 1;
        break;
      case 4uLL:
        result = 2;
        break;
      case 5uLL:
        result = 10;
        break;
      case 6uLL:
        result = 11;
        break;
      case 7uLL:
        result = 12;
        break;
      case 8uLL:
        result = 13;
        break;
      case 0xAuLL:
        result = 6;
        break;
      case 0xBuLL:
        result = 14;
        break;
      default:
        return result;
    }
  }
  return result;
}

- (BOOL)_isNavigationControllerBadged:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "tabBarItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "badgeValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "length") != 0;
  return (char)v3;
}

- (void)assetContainerListDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PUTabbedLibraryViewController_assetContainerListDidChange___block_invoke;
  v6[3] = &unk_1E58A88E0;
  v7 = v4;
  v5 = v4;
  -[PUTabbedLibraryViewController _enumerateViewControllersWithBlock:](self, "_enumerateViewControllersWithBlock:", v6);

}

- (void)assetContainerDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PUTabbedLibraryViewController_assetContainerDidChange___block_invoke;
  v6[3] = &unk_1E58A88E0;
  v7 = v4;
  v5 = v4;
  -[PUTabbedLibraryViewController _enumerateViewControllersWithBlock:](self, "_enumerateViewControllersWithBlock:", v6);

}

- (void)invitationRecordsDidChange:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __60__PUTabbedLibraryViewController_invitationRecordsDidChange___block_invoke;
  v6[3] = &unk_1E58A88E0;
  v7 = v4;
  v5 = v4;
  -[PUTabbedLibraryViewController _enumerateViewControllersWithBlock:](self, "_enumerateViewControllersWithBlock:", v6);

}

- (void)_didFinishPostingNotifications:(id)a3
{
  -[PUTabbedLibraryViewController updateDisplayedTabsAnimated:](self, "updateDisplayedTabsAnimated:", 1);
}

- (void)_enumerateViewControllersWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  char isKindOfClass;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController presentedViewController](self, "presentedViewController");
  v6 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v5);

    v5 = v7;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v15 = (void *)MEMORY[0x1E0C99D20];
        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v13, "viewControllers");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "arrayWithArray:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v13);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v18 = objc_msgSend(v17, "count") - 1;
        if (v18 >= 0)
        {
          do
          {
            objc_msgSend(v17, "objectAtIndex:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v4[2](v4, v19);

            --v18;
          }
          while (v18 != -1);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

}

- (void)_updateTabBarVisibilityForHorizontalSizeClass:(int64_t)a3
{
  _BOOL8 v5;
  void *v6;

  v5 = a3 == 2;
  -[PUTabbedLibraryViewController viewControllers](self, "viewControllers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController _updateRootViewControllersInNavigationControllers:tabBarHidden:](self, "_updateRootViewControllersInNavigationControllers:tabBarHidden:", v6, v5);

  if (a3 == 2)
    -[PUTabbedLibraryViewController hideBarWithTransition:](self, "hideBarWithTransition:", 0);
  else
    -[PUTabbedLibraryViewController showBarWithTransition:](self, "showBarWithTransition:", 0);
}

- (void)navigateToInitialLocationInCurrentNavigationController
{
  void *v3;
  id v4;

  -[PUTabbedLibraryViewController _navigateToRootOfCurrentTabAnimated:](self, "_navigateToRootOfCurrentTabAnimated:", 0);
  -[PUTabbedLibraryViewController selectedNavigationController](self, "selectedNavigationController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_scrollToInitialPositionAnimated:", 0);

}

- (void)navigateToAlbumsTabRoot
{
  -[PUTabbedLibraryViewController navigateToContentMode:animated:completion:](self, "navigateToContentMode:animated:completion:", 13, 0, 0);
  -[PUTabbedLibraryViewController navigateToInitialLocationInCurrentNavigationController](self, "navigateToInitialLocationInCurrentNavigationController");
}

- (void)_navigateToAlbum:(id)a3 andPerformAction:(int)a4 initiallyHidden:(BOOL)a5 animated:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  void (**v13)(id, _QWORD);
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  __CFString *v27;
  __CFString *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD aBlock[5];
  id v33;
  id v34;
  void (**v35)(id, _QWORD);
  int v36;
  int v37;
  BOOL v38;
  BOOL v39;
  uint8_t buf[4];
  __CFString *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v8 = a6;
  v44 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = (void (**)(id, _QWORD))a7;
  v14 = -[PUTabbedLibraryViewController _contentModeForAlbum:](self, "_contentModeForAlbum:", v12);
  if ((_DWORD)v14 == -1)
  {
    PLUIGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_ERROR, "destinationContentMode == kPLLibraryContentInvalid", buf, 2u);
    }

    if (v13)
      v13[2](v13, 0);
  }
  else
  {
    v15 = v14;
    -[PUTabbedLibraryViewController selectedNavigationController](self, "selectedNavigationController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "viewControllers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v16, "count");

    -[PUTabbedLibraryViewController selectedViewController](self, "selectedViewController", v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tabBarItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "tag");

    v20 = -[PUTabbedLibraryViewController _navigateToRootOfCurrentTabAnimated:](self, "_navigateToRootOfCurrentTabAnimated:", v8);
    -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20 && v21)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __103__PUTabbedLibraryViewController__navigateToAlbum_andPerformAction_initiallyHidden_animated_completion___block_invoke;
      aBlock[3] = &unk_1E58A8958;
      aBlock[4] = self;
      v33 = v21;
      v36 = v15;
      v37 = a4;
      v34 = v12;
      v38 = v8;
      v35 = v13;
      v39 = a5;
      v23 = _Block_copy(aBlock);
      v24 = v23;
      if (v19 == (int)v15 && v8)
      {
        objc_msgSend(MEMORY[0x1E0DC3EE8], "defaultDurationForTransition:", 1);
        PLDispatchOnMainAfter();
      }
      else
      {
        (*((void (**)(void *))v23 + 2))(v23);
      }
      v29 = v31;

    }
    else
    {
      PLUIGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = CFSTR("NO");
        if (v20)
          v27 = CFSTR("YES");
        v28 = v27;
        *(_DWORD *)buf = 138412546;
        v41 = v28;
        v42 = 2112;
        v43 = v22;
        _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_ERROR, "navigateToRootSucceeded:%@ destNavController:%@", buf, 0x16u);

      }
      v29 = v31;
      if (v13)
        v13[2](v13, 0);
    }

  }
}

- (void)navigateToAlbum:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PUTabbedLibraryViewController _navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:](self, "_navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:", a3, 1, 0, a4, a5);
}

- (void)navigateToRevealAlbum:(id)a3 initiallyHidden:(BOOL)a4 animated:(BOOL)a5
{
  -[PUTabbedLibraryViewController _navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:](self, "_navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:", a3, 0, a4, a5, 0);
}

- (void)_navigateToAsset:(id)a3 andPerformAction:(int)a4 inAlbum:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  PUTabbedLibraryViewController *v14;
  id v15;
  int v16;
  BOOL v17;

  v6 = a6;
  v10 = a3;
  -[PUTabbedLibraryViewController _availableAlbumToNavigateToAsset:preferredAlbum:](self, "_availableAlbumToNavigateToAsset:preferredAlbum:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __84__PUTabbedLibraryViewController__navigateToAsset_andPerformAction_inAlbum_animated___block_invoke;
    v12[3] = &unk_1E58A8980;
    v16 = a4;
    v13 = v10;
    v14 = self;
    v15 = v11;
    v17 = v6;
    -[PUTabbedLibraryViewController _navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:](self, "_navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:", v15, 1, 0, v6, v12);

  }
}

- (void)navigateToAsset:(id)a3 inAlbum:(id)a4 animated:(BOOL)a5
{
  -[PUTabbedLibraryViewController _navigateToAsset:andPerformAction:inAlbum:animated:](self, "_navigateToAsset:andPerformAction:inAlbum:animated:", a3, 1, a4, a5);
}

- (void)navigateToRevealAsset:(id)a3 inAlbum:(id)a4 animated:(BOOL)a5
{
  -[PUTabbedLibraryViewController _navigateToAsset:andPerformAction:inAlbum:animated:](self, "_navigateToAsset:andPerformAction:inAlbum:animated:", a3, 0, a4, a5);
}

- (void)navigateToComment:(id)a3 forAsset:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v5 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v7, "albums", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v9)
  {
LABEL_16:

    goto LABEL_17;
  }
  v10 = v9;
  v11 = *(_QWORD *)v18;
LABEL_3:
  v12 = 0;
  while (1)
  {
    if (*(_QWORD *)v18 != v11)
      objc_enumerationMutation(v8);
    v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
    if (!-[PUTabbedLibraryViewController albumIsAvailableForNavigation:](self, "albumIsAvailableForNavigation:", v13))
      goto LABEL_11;
    objc_msgSend(v13, "assets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "containsObject:", v7) & 1) == 0)
    {

      goto LABEL_11;
    }
    v15 = objc_msgSend(v13, "canShowComments");

    if ((v15 & 1) != 0)
      break;
LABEL_11:
    if (v10 == ++v12)
    {
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        goto LABEL_3;
      goto LABEL_16;
    }
  }
  v16 = v13;

  if (v16)
  {
    -[PUTabbedLibraryViewController _navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:](self, "_navigateToAlbum:andPerformAction:initiallyHidden:animated:completion:", v16, 1, 0, v5, &__block_literal_global_554_92098);
    v8 = v16;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)navigateToContentMode:(int)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[PUTabbedLibraryViewController _navigateToContentMode:animated:dismissAnyPresentedViewController:completion:](self, "_navigateToContentMode:animated:dismissAnyPresentedViewController:completion:", *(_QWORD *)&a3, a4, 1, a5);
}

- (void)_navigateToContentMode:(int)a3 animated:(BOOL)a4 dismissAnyPresentedViewController:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  uint64_t v8;
  _BOOL8 v10;
  void *v11;
  id v12;

  v6 = a5;
  v7 = a4;
  v8 = *(_QWORD *)&a3;
  v12 = a6;
  v10 = -[PUTabbedLibraryViewController _navigateToRootOfCurrentTabAnimated:dismissAnyPresentedViewController:](self, "_navigateToRootOfCurrentTabAnimated:dismissAnyPresentedViewController:", v7, v6);
  if (v10)
    -[PUTabbedLibraryViewController setSelectedContentMode:](self, "setSelectedContentMode:", v8);
  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, _BOOL8))v12 + 2))(v12, v10);
    v11 = v12;
  }

}

- (void)_navigateToContentMode:(int)a3 defaultLocationIfNeverDisplayed:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  uint64_t v7;
  id v9;

  v5 = a5;
  v6 = a4;
  v7 = *(_QWORD *)&a3;
  if ((-[NSMutableIndexSet containsIndex:](self->_everDisplayedContentModes, "containsIndex:", a3) & 1) != 0 || !v6)
  {
    -[PUTabbedLibraryViewController navigateToContentMode:animated:completion:](self, "navigateToContentMode:animated:completion:", v7, v5, 0);
  }
  else
  {
    -[PUTabbedLibraryViewController _navigationControllerForContentMode:](self, "_navigationControllerForContentMode:", v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[PUTabbedLibraryViewController _navigateToDefaultLocationInNavigationController:animated:](self, "_navigateToDefaultLocationInNavigationController:animated:", v9, v5);

  }
}

- (void)navigateToCloudFeedWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PUTabbedLibraryViewController_navigateToCloudFeedWithCompletion___block_invoke;
  v6[3] = &unk_1E58AB7D8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PUTabbedLibraryViewController navigateToContentMode:animated:completion:](self, "navigateToContentMode:animated:completion:", 11, 0, v6);

}

- (void)navigateToRevealCloudFeedAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PUTabbedLibraryViewController_navigateToRevealCloudFeedAsset_completion___block_invoke;
  v10[3] = &unk_1E58A89E8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUTabbedLibraryViewController navigateToCloudFeedWithCompletion:](self, "navigateToCloudFeedWithCompletion:", v10);

}

- (void)navigateToCloudFeedAsset:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PUTabbedLibraryViewController_navigateToCloudFeedAsset_completion___block_invoke;
  v10[3] = &unk_1E58A89E8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUTabbedLibraryViewController navigateToCloudFeedWithCompletion:](self, "navigateToCloudFeedWithCompletion:", v10);

}

- (void)navigateToRevealCloudFeedComment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__PUTabbedLibraryViewController_navigateToRevealCloudFeedComment_completion___block_invoke;
  v10[3] = &unk_1E58A89E8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUTabbedLibraryViewController navigateToCloudFeedWithCompletion:](self, "navigateToCloudFeedWithCompletion:", v10);

}

- (void)navigateToCloudFeedComment:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PUTabbedLibraryViewController_navigateToCloudFeedComment_completion___block_invoke;
  v10[3] = &unk_1E58A89E8;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUTabbedLibraryViewController navigateToCloudFeedWithCompletion:](self, "navigateToCloudFeedWithCompletion:", v10);

}

- (void)navigateToRevealCloudFeedInvitationForAlbum:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(id, void *);

  v10 = (void (**)(id, void *))a4;
  v6 = a3;
  -[PUTabbedLibraryViewController _navigateToForYou](self, "_navigateToForYou");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "navigateToSharedAlbumInviteWithUUID:animated:", v9, 0);
  if (v10)
    v10[2](v10, v7);

}

- (BOOL)_navigateToRootOfCurrentTabAnimated:(BOOL)a3
{
  return -[PUTabbedLibraryViewController _navigateToRootOfCurrentTabAnimated:dismissAnyPresentedViewController:](self, "_navigateToRootOfCurrentTabAnimated:dismissAnyPresentedViewController:", a3, 1);
}

- (BOOL)_navigateToRootOfCurrentTabAnimated:(BOOL)a3 dismissAnyPresentedViewController:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[PUTabbedLibraryViewController selectedNavigationController](self, "selectedNavigationController", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController _tabRootViewControllerInNavigationController:](self, "_tabRootViewControllerInNavigationController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (void *)MEMORY[0x1E0DC3F20];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __103__PUTabbedLibraryViewController__navigateToRootOfCurrentTabAnimated_dismissAnyPresentedViewController___block_invoke;
    v12[3] = &unk_1E58A8A10;
    v16 = a4;
    v15 = &v17;
    v13 = v7;
    v14 = v6;
    objc_msgSend(v9, "_performWithoutDeferringTransitions:", v12);

  }
  v10 = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)contentModeIsAvailableForNavigation:(int)a3
{
  void *v3;
  BOOL v4;

  -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:", *(_QWORD *)&a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)albumIsAvailableForNavigation:(id)a3
{
  return -[PUTabbedLibraryViewController _contentModeForAlbum:](self, "_contentModeForAlbum:", a3) != -1;
}

- (BOOL)cloudFeedIsAvailableForNavigation
{
  BOOL v3;

  v3 = -[PUTabbedLibraryViewController contentModeIsAvailableForNavigation:](self, "contentModeIsAvailableForNavigation:", 1);
  return v3 | -[PUTabbedLibraryViewController contentModeIsAvailableForNavigation:](self, "contentModeIsAvailableForNavigation:", 11);
}

- (id)_availableAlbumToNavigateToAsset:(id)a3 preferredAlbum:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "assets");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "containsObject:", v6) & 1) != 0)
    {
      v10 = -[PUTabbedLibraryViewController albumIsAvailableForNavigation:](self, "albumIsAvailableForNavigation:", v8);

      if (v10)
      {
        v11 = v8;
        goto LABEL_18;
      }
    }
    else
    {

    }
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "albums", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (-[PUTabbedLibraryViewController albumIsAvailableForNavigation:](self, "albumIsAvailableForNavigation:", v17))
        {
          objc_msgSend(v17, "assets");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "containsObject:", v6);

          if (v19)
          {
            v11 = v17;
            goto LABEL_17;
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_17:

LABEL_18:
  return v11;
}

- (id)_navigateToForYou
{
  id v2;
  _QWORD v4[7];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__92088;
  v9 = __Block_byref_object_dispose__92089;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__PUTabbedLibraryViewController__navigateToForYou__block_invoke;
  v4[3] = &unk_1E58A9260;
  v4[4] = self;
  v4[5] = &v5;
  v4[6] = a2;
  objc_msgSend(MEMORY[0x1E0DC3F20], "_performWithoutDeferringTransitions:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)navigateToRevealTheMostRecentMemoryAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PUTabbedLibraryViewController _navigateToForYou](self, "_navigateToForYou");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigateToRevealTheMostRecentMemoryAnimated:", v3);

}

- (void)navigateToFeaturedPhotoWithSuggestionIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  NSObject *v23;
  id v24;
  id location[2];
  _QWORD v26[2];

  v4 = a4;
  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIncludeGuestAssets:", 1);
  v10 = (void *)MEMORY[0x1E0CD13B8];
  v26[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchAssetCollectionsWithLocalIdentifiers:options:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = v13;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject px_descriptionForAssertionMessage](v14, "px_descriptionForAssertionMessage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 1475, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("suggestionAssetCollection"), v20, v21);

    }
    if (-[NSObject featuredState](v14, "featuredState") == 1)
    {
      v15 = -[PUTabbedLibraryViewController shouldSuppressAnimationsDuringProgrammaticNavigation](self, "shouldSuppressAnimationsDuringProgrammaticNavigation");
      -[PUTabbedLibraryViewController setShouldSuppressAnimationsDuringProgrammaticNavigation:](self, "setShouldSuppressAnimationsDuringProgrammaticNavigation:", v4 ^ 1);
      -[PUTabbedLibraryViewController _navigateToForYou](self, "_navigateToForYou");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUTabbedLibraryViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__navigateToSuggestionFromCuratedLibrary_, v14, 3.0);
      objc_initWeak(location, self);
      objc_msgSend(v16, "navigationHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __90__PUTabbedLibraryViewController_navigateToFeaturedPhotoWithSuggestionIdentifier_animated___block_invoke;
      v22[3] = &unk_1E58AB210;
      objc_copyWeak(&v24, location);
      v23 = v14;
      objc_msgSend(v17, "navigateToFeaturedPhotoWithSuggestionIdentifier:animated:completionHandler:", v7, v4, v22);

      -[PUTabbedLibraryViewController setShouldSuppressAnimationsDuringProgrammaticNavigation:](self, "setShouldSuppressAnimationsDuringProgrammaticNavigation:", v15);
      objc_destroyWeak(&v24);
      objc_destroyWeak(location);

    }
    else
    {
      -[PUTabbedLibraryViewController _navigateToSuggestionFromCuratedLibrary:](self, "_navigateToSuggestionFromCuratedLibrary:", v14);
    }
  }
  else
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "Could not navigate to suggestion identifier %@ because suggestion not found", (uint8_t *)location, 0xCu);
    }
  }

}

- (void)_navigateToSuggestionFromCuratedLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CD1570], "px_standardFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetsInAssetCollection:options:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLUIGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "localIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "Navigating to key asset %@ from suggestion id %@ in curated library", buf, 0x16u);

    }
    if ((unint64_t)objc_msgSend(v6, "count") >= 2)
    {
      PLUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "localIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v21 = v13;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_ERROR, "Encountered multiple key assets for suggestion id %@, only taking one", buf, 0xCu);

      }
    }
    v14 = objc_alloc(MEMORY[0x1E0D7B868]);
    objc_msgSend(v7, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithType:revealMode:assetUUID:assetCollectionUUID:", 5, 1, v15, 0);

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __73__PUTabbedLibraryViewController__navigateToSuggestionFromCuratedLibrary___block_invoke;
    v18[3] = &unk_1E58A8A60;
    v19 = v16;
    v9 = v16;
    -[PUTabbedLibraryViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v9, 0, v18);

  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v4, "localIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v17;
    _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "Could not navigate to suggestion %@ because keyAsset is not available", buf, 0xCu);

  }
}

- (void)navigateToInvitationCMMWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v6 = a3;
  -[PUTabbedLibraryViewController _navigateToForYou](self, "_navigateToForYou");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "navigateToInvitationCMMWithUUID:animated:", v6, v4);

}

- (void)navigateToPeopleAlbumAnimated:(BOOL)a3 revealPersonWithLocalIdentifier:(id)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD aBlock[5];
  id location;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  -[PUTabbedLibraryViewController photoLibrary](self, "photoLibrary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_virtualCollections");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "peopleCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v12, 1);
  if (v6)
    v14 = 2;
  else
    v14 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __106__PUTabbedLibraryViewController_navigateToPeopleAlbumAnimated_revealPersonWithLocalIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E58A8A88;
  aBlock[4] = self;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __106__PUTabbedLibraryViewController_navigateToPeopleAlbumAnimated_revealPersonWithLocalIdentifier_completion___block_invoke_2;
  v18[3] = &unk_1E58A8AB0;
  v18[4] = self;
  v15 = _Block_copy(aBlock);
  v20 = v15;
  v16 = v8;
  v19 = v16;
  objc_copyWeak(&v22, &location);
  v17 = v9;
  v21 = v17;
  -[PUTabbedLibraryViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v13, v14, v18);

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)navigateToPlacesAlbumAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CD13B8], "px_smartAlbumWithSubtype:", 1000000203);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B868]), "initWithObject:revealMode:", v7, 1);
  if (v3)
    v6 = 2;
  else
    v6 = 0;
  -[PUTabbedLibraryViewController navigateToDestination:options:completionHandler:](self, "navigateToDestination:options:completionHandler:", v5, v6, &__block_literal_global_578);

}

- (id)_snapBackRootViewControllerInNavigationController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "viewControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObjectPassingTest:", &__block_literal_global_580);
  if ((unint64_t)(v6 - 1) > 0x7FFFFFFFFFFFFFFDLL)
    goto LABEL_10;
  v7 = v6;
  objc_msgSend(v5, "objectAtIndexedSubscript:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "pu_wantsTabBarVisible") & 1) == 0)
  {
    v10 = v7 - 2;
    while (v10 + 1 >= 1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      --v10;
      v8 = v9;
      if ((objc_msgSend(v9, "pu_wantsTabBarVisible") & 1) != 0)
        goto LABEL_7;
    }

    goto LABEL_10;
  }
  v9 = v8;
LABEL_7:
  if (!v9)
  {
LABEL_10:
    -[PUTabbedLibraryViewController _tabRootViewControllerInNavigationController:](self, "_tabRootViewControllerInNavigationController:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_tabRootViewControllerInNavigationController:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "pu_shouldActAsTabRootViewController") & 1) != 0)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v9;

    if (v10)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  objc_msgSend(v3, "firstObject");
  v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v10;
}

- (void)_navigateToSearchWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v10 = a3;
  -[PUTabbedLibraryViewController selectedNavigationController](self, "selectedNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTabbedLibraryViewController _tabRootViewControllerInNavigationController:](self, "_tabRootViewControllerInNavigationController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_5;
  v8 = v5;
  if (!objc_msgSend(v8, "searchBarIsActive"))
  {

LABEL_5:
    v9 = (void *)MEMORY[0x1E0DC3F20];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__PUTabbedLibraryViewController__navigateToSearchWithCompletion___block_invoke;
    v11[3] = &unk_1E58AB968;
    v11[4] = self;
    v12 = v10;
    objc_msgSend(v9, "_performWithoutDeferringTransitions:", v11);

    goto LABEL_6;
  }
  (*((void (**)(id, id))v10 + 2))(v10, v8);

LABEL_6:
}

- (void)navigateToSearch
{
  -[PUTabbedLibraryViewController _navigateToSearchWithCompletion:](self, "_navigateToSearchWithCompletion:", &__block_literal_global_583);
}

- (void)navigateToOneYearAgoSearch
{
  -[PUTabbedLibraryViewController _navigateToSearchWithCompletion:](self, "_navigateToSearchWithCompletion:", &__block_literal_global_584);
}

- (void)navigateToSearchWithHashtag:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__PUTabbedLibraryViewController_navigateToSearchWithHashtag___block_invoke;
  v6[3] = &unk_1E58A8BB8;
  v7 = v4;
  v5 = v4;
  -[PUTabbedLibraryViewController _navigateToSearchWithCompletion:](self, "_navigateToSearchWithCompletion:", v6);

}

- (void)navigateToSearchWithTerms:(id)a3 searchCategories:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PUTabbedLibraryViewController_navigateToSearchWithTerms_searchCategories___block_invoke;
  v10[3] = &unk_1E58A8BE0;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PUTabbedLibraryViewController _navigateToSearchWithCompletion:](self, "_navigateToSearchWithCompletion:", v10);

}

- (BOOL)assetIsAvailableForNavigation:(id)a3 inAlbum:(id)a4
{
  void *v4;
  BOOL v5;

  -[PUTabbedLibraryViewController _availableAlbumToNavigateToAsset:preferredAlbum:](self, "_availableAlbumToNavigateToAsset:preferredAlbum:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)commentIsAvailableForNavigation:(id)a3 inAsset:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a4;
  objc_msgSend(a3, "asset");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7 == v6
    && -[PUTabbedLibraryViewController assetIsAvailableForNavigation:inAlbum:](self, "assetIsAvailableForNavigation:inAlbum:", v6, 0);

  return v8;
}

- (BOOL)cloudFeedAssetIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[PUTabbedLibraryViewController cloudFeedIsAvailableForNavigation](self, "cloudFeedIsAvailableForNavigation")
    && (objc_msgSend(v4, "cloudFeedAssetsEntry"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[PUTabbedLibraryViewController _nextCloudFeedNavigatingObject](self, "_nextCloudFeedNavigatingObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "cloudFeedAssetIsAvailableForNavigation:", v4);
    else
      v8 = 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)cloudFeedCommentIsAvailableForNavigation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (-[PUTabbedLibraryViewController cloudFeedIsAvailableForNavigation](self, "cloudFeedIsAvailableForNavigation")
    && (objc_msgSend(v4, "cloudFeedEntry"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[PUTabbedLibraryViewController _nextCloudFeedNavigatingObject](self, "_nextCloudFeedNavigatingObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = objc_msgSend(v6, "cloudFeedCommentIsAvailableForNavigation:", v4);
    else
      v8 = 1;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)cloudFeedInvitationForAlbumIsAvailableForNavigation:(id)a3
{
  id v4;
  _BOOL4 v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = -[PUTabbedLibraryViewController cloudFeedIsAvailableForNavigation](self, "cloudFeedIsAvailableForNavigation");
  v6 = 0;
  if (v4 && v5)
  {
    -[PUTabbedLibraryViewController _nextCloudFeedNavigatingObject](self, "_nextCloudFeedNavigatingObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v6 = objc_msgSend(v7, "cloudFeedInvitationForAlbumIsAvailableForNavigation:", v4);
    else
      v6 = 1;

  }
  return v6;
}

- (id)_nextCloudFeedNavigatingObject
{
  void *v2;
  void *v3;
  void *v4;

  -[PUTabbedLibraryViewController _existingNavigationControllerForContentMode:](self, "_existingNavigationControllerForContentMode:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_1EEC47318) & 1) == 0)
  {

    v4 = 0;
  }

  return v4;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "topViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_navigationTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  return v5;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "navigationController:interactionControllerForAnimationController:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (-[PUTabbedLibraryViewController shouldSuppressAnimationsDuringProgrammaticNavigation](self, "shouldSuppressAnimationsDuringProgrammaticNavigation")|| (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v10, "navigationController:animationControllerForOperation:fromViewController:toViewController:", v10, a4, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  return 1;
}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  return objc_msgSend(MEMORY[0x1E0D7B658], "contentModeForNavigationDestination:", a3) != -1;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  objc_super v15;

  v8 = (void *)MEMORY[0x1E0D7B658];
  v9 = a5;
  v10 = a3;
  LODWORD(v8) = objc_msgSend(v8, "contentModeForNavigationDestination:", v10);
  if ((_DWORD)v8 != -[PUTabbedLibraryViewController selectedContentMode](self, "selectedContentMode"))
  {
    -[PUTabbedLibraryViewController selectedNavigationController](self, "selectedNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "viewControllers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = PXExists();

    if (v13)
      -[PUTabbedLibraryViewController _navigateToRootOfCurrentTabAnimated:](self, "_navigateToRootOfCurrentTabAnimated:", 0);
  }
  v14 = objc_msgSend(MEMORY[0x1E0D7B658], "launchContentModeForNavigationDestination:", v10);
  objc_msgSend(MEMORY[0x1E0D7B658], "setPersistedLibraryContentModeSelection:", v14);
  v15.receiver = self;
  v15.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController navigateToDestination:options:completionHandler:](&v15, sel_navigateToDestination_options_completionHandler_, v10, a4, v9);

}

- (void)px_switchToTabAndNavigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  -[PUTabbedLibraryViewController setSelectedContentMode:](self, "setSelectedContentMode:", objc_msgSend(MEMORY[0x1E0D7B658], "contentModeForNavigationDestination:", v8));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *MEMORY[0x1E0D71E70];
  v17[0] = *MEMORY[0x1E0D71E78];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PUTabbedLibraryViewController selectedContentMode](self, "selectedContentMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = *MEMORY[0x1E0D71E80];
  v18[0] = v12;
  v18[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "postNotificationName:object:userInfo:", v11, 0, v13);

  -[PUTabbedLibraryViewController nextExistingParticipantOnRouteToDestination:](self, "nextExistingParticipantOnRouteToDestination:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "navigateToDestination:options:completionHandler:", v8, a4, v9);
  }
  else
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B870]), "initWithDestination:options:completionHandler:", v8, a4, v9);
    -[PUTabbedLibraryViewController setPendingNavigationRequest:](self, "setPendingNavigationRequest:", v16);

  }
}

- (id)nextExistingParticipantOnRouteToDestination:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;

  v4 = a3;
  -[PUTabbedLibraryViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = -[PUTabbedLibraryViewController selectedContentMode](self, "selectedContentMode");
  if (v6 != objc_msgSend(MEMORY[0x1E0D7B658], "contentModeForNavigationDestination:", v4))
    goto LABEL_5;
  -[PUTabbedLibraryViewController selectedNavigationController](self, "selectedNavigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

- (void)setImportViewController:(id)a3 forImportSource:(id)a4
{
  id v7;
  id v8;
  PUImportViewController *v9;
  PUImportViewController *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  if (v11)
  {
    v8 = v11;
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (PUImportViewController *)v8;
      v10 = v9;
    }
    else
    {

      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (PUImportViewController *)objc_claimAutoreleasedReturnValue();
      -[PUImportViewController handleFailureInMethod:object:file:lineNumber:description:](v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 1907, CFSTR("Was passed an import view controller that is not of type PUImportViewController"));
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  if (v10 != self->_importViewController)
  {
    -[PUTabbedLibraryViewController willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("importViewController"));
    objc_storeStrong((id *)&self->_importViewController, v10);
    -[PUTabbedLibraryViewController didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("importViewController"));
    -[PUTabbedLibraryViewController updateDisplayedTabsAnimated:](self, "updateDisplayedTabsAnimated:", self->_importViewController != 0);
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  -[PUTabbedLibraryViewController updateDisplayedTabsAnimated:](self, "updateDisplayedTabsAnimated:", 0, a4);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;

  v6 = a4;
  v9 = a3;
  if ((void *)PXForYouBadgeManagerObservationContext == a5)
  {
    if ((v6 & 1) != 0)
      px_dispatch_on_main_queue();
  }
  else
  {
    if ((void *)PXSharedLibrarySuggestionsObservationContext != a5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 1944, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if ((v6 & 8) != 0)
    {
      self->_forYouTabBadgeIsDirty = 1;
      -[PUTabbedLibraryViewController _updateForYouBadges](self, "_updateForYouBadges");
    }
  }

}

- (void)ppt_runTabSwitchingTestWithName:(id)a3 options:(id)a4 delegate:(id)a5 completionHandler:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SEL v19;
  dispatch_time_t v20;
  id v21;
  void *v22;
  objc_class *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  uint64_t v28;
  SEL v29;
  void *v30;
  objc_class *v31;
  SEL v32;
  void *v33;
  void *v34;
  void *v35;
  int64_t delta;
  _QWORD block[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  objc_super v43;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[PUTabbedLibraryViewController px_splitViewController](self, "px_splitViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    if ((objc_msgSend(v15, "isSidebarVisible") & 1) != 0)
    {
      delta = 0;
    }
    else
    {
      objc_msgSend(v16, "toggleSidebarVisibilityAnimated");
      delta = 1000000000;
    }
    objc_msgSend(v16, "sidebarViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_8;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (objc_class *)objc_opt_class();
      NSStringFromClass(v25);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "px_descriptionForAssertionMessage");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 1968, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("splitViewController.sidebarViewController"), v24, v34);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUTabbedLibraryViewController.m"), 1968, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("splitViewController.sidebarViewController"), v24);
    }

LABEL_8:
    objc_msgSend(v17, "topViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = a2;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_10:
        v20 = dispatch_time(0, delta);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __100__PUTabbedLibraryViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke;
        block[3] = &unk_1E58A8C48;
        v38 = v18;
        v39 = v11;
        v40 = v12;
        v41 = v13;
        v42 = v14;
        v21 = v18;
        dispatch_after(v20, MEMORY[0x1E0C80D38], block);

        goto LABEL_11;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (objc_class *)objc_opt_class();
      NSStringFromClass(v31);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_descriptionForAssertionMessage");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v19;
      v26 = v35;
      objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", v32, self, CFSTR("PUTabbedLibraryViewController.m"), 1969, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sidebarNavigationController.topViewController"), v30, v33);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = a2;
      v30 = (void *)v28;
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", v29, self, CFSTR("PUTabbedLibraryViewController.m"), 1969, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sidebarNavigationController.topViewController"), v28);
    }

    goto LABEL_10;
  }
  v43.receiver = self;
  v43.super_class = (Class)PUTabbedLibraryViewController;
  -[PUTabbedLibraryViewController ppt_runTabSwitchingTestWithName:options:delegate:completionHandler:](&v43, sel_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler_, v11, v12, v13, v14);
LABEL_11:

}

- (CGRect)px_frameForTabItem:(unint64_t)a3 inCoordinateSpace:(id)a4
{
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _QWORD v34[6];
  uint8_t buf[4];
  PUTabbedLibraryViewController *v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;
  CGRect v42;
  CGRect result;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = *MEMORY[0x1E0C9D628];
  v8 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  -[PUTabbedLibraryViewController tabBar](self, "tabBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isHidden") & 1) == 0)
  {
    objc_msgSend(v11, "items");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "count");

    if (v13)
    {
      -[PUTabbedLibraryViewController tabBar](self, "tabBar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "items");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __70__PUTabbedLibraryViewController_px_frameForTabItem_inCoordinateSpace___block_invoke;
      v34[3] = &unk_1E58A8C70;
      v34[4] = self;
      v34[5] = a3;
      v16 = objc_msgSend(v15, "indexOfObjectPassingTest:", v34);

      if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v11, "subviews");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_618);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "filteredArrayUsingPredicate:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_621);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 < objc_msgSend(v20, "count"))
        {
          if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", objc_msgSend(v11, "semanticContentAttribute")))
          {
            v16 = objc_msgSend(v20, "count") + ~v16;
          }
          objc_msgSend(v20, "objectAtIndexedSubscript:", v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "bounds");
          objc_msgSend(v21, "convertRect:toCoordinateSpace:", v6);
          v7 = v22;
          v8 = v23;
          v9 = v24;
          v10 = v25;

        }
      }
    }
  }
  v42.origin.x = v7;
  v42.origin.y = v8;
  v42.size.width = v9;
  v42.size.height = v10;
  if (CGRectIsNull(v42))
  {
    PLUIGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[PUTabbedLibraryViewController tabBar](self, "tabBar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "items");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "valueForKeyPath:", CFSTR("title"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v36 = self;
      v37 = 2048;
      v38 = a3;
      v39 = 2112;
      v40 = v29;
      _os_log_impl(&dword_1AAB61000, v26, OS_LOG_TYPE_DEFAULT, "%@ unable to find tab for tabItem:%lu [%@]", buf, 0x20u);

    }
  }

  v30 = v7;
  v31 = v8;
  v32 = v9;
  v33 = v10;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)setSessionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_sessionInfo, a3);
}

- (void)setImportViewController:(id)a3
{
  objc_storeStrong((id *)&self->_importViewController, a3);
}

- (BOOL)px_hidesTabBarForRegularHorizontalSizeClass
{
  return self->_px_hidesTabBarForRegularHorizontalSizeClass;
}

- (void)setExcludedContentModes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1296);
}

- (void)setSidebarViewController:(id)a3
{
  objc_storeWeak((id *)&self->_sidebarViewController, a3);
}

- (BOOL)shouldNavigateToAllPhotosAlbum
{
  return self->_shouldNavigateToAllPhotosAlbum;
}

- (void)setShouldNavigateToAllPhotosAlbum:(BOOL)a3
{
  self->_shouldNavigateToAllPhotosAlbum = a3;
}

- (void)setBadgeManager:(id)a3
{
  objc_storeStrong((id *)&self->_badgeManager, a3);
}

- (void)setPendingNavigationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_pendingNavigationRequest, a3);
}

- (BOOL)shouldSuppressAnimationsDuringProgrammaticNavigation
{
  return self->_shouldSuppressAnimationsDuringProgrammaticNavigation;
}

- (void)setShouldSuppressAnimationsDuringProgrammaticNavigation:(BOOL)a3
{
  self->_shouldSuppressAnimationsDuringProgrammaticNavigation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNavigationRequest, 0);
  objc_storeStrong((id *)&self->_badgeManager, 0);
  objc_destroyWeak((id *)&self->_sidebarViewController);
  objc_storeStrong((id *)&self->_excludedContentModes, 0);
  objc_storeStrong((id *)&self->_importViewController, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_everDisplayedContentModes, 0);
  objc_storeStrong((id *)&self->_filteredAlbumListsByContentMode, 0);
  objc_storeStrong((id *)&self->_lastSelectedTabDescription, 0);
  objc_storeStrong((id *)&self->_sessionInfo, 0);
  objc_storeStrong((id *)&self->_spec, 0);
}

BOOL __70__PUTabbedLibraryViewController_px_frameForTabItem_inCoordinateSpace___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "tag");
  return v3 == (int)objc_msgSend(*(id *)(a1 + 32), "contentModeForTabIdentifier:", *(_QWORD *)(a1 + 40));
}

uint64_t __70__PUTabbedLibraryViewController_px_frameForTabItem_inCoordinateSpace___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "frame");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "frame");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __70__PUTabbedLibraryViewController_px_frameForTabItem_inCoordinateSpace___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __100__PUTabbedLibraryViewController_ppt_runTabSwitchingTestWithName_options_delegate_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "ppt_runTabSwitchingTestWithName:options:delegate:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __62__PUTabbedLibraryViewController_observable_didChange_context___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1228) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_updateForYouBadges");
}

uint64_t __81__PUTabbedLibraryViewController_navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __76__PUTabbedLibraryViewController_navigateToSearchWithTerms_searchCategories___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentSearchWithTerms:searchCategories:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __61__PUTabbedLibraryViewController_navigateToSearchWithHashtag___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentForSearchHashtag:", *(_QWORD *)(a1 + 32));
}

uint64_t __59__PUTabbedLibraryViewController_navigateToOneYearAgoSearch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentOneYearAgo");
}

uint64_t __49__PUTabbedLibraryViewController_navigateToSearch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "activateSearchField");
}

void __65__PUTabbedLibraryViewController__navigateToSearchWithCompletion___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __65__PUTabbedLibraryViewController__navigateToSearchWithCompletion___block_invoke_2;
  v2[3] = &unk_1E58AB7D8;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "navigateToContentMode:animated:completion:", 12, 0, v2);

}

void __65__PUTabbedLibraryViewController__navigateToSearchWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  char isKindOfClass;
  dispatch_time_t v7;
  NSObject *v8;
  uint8_t v9[16];
  _QWORD block[4];
  NSObject *v11;
  NSObject *v12;

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "_navigateToRootOfCurrentTabAnimated:", 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topViewController");
    v4 = objc_claimAutoreleasedReturnValue();

    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = dispatch_time(0, 100000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__PUTabbedLibraryViewController__navigateToSearchWithCompletion___block_invoke_3;
      block[3] = &unk_1E58AB968;
      v12 = *(id *)(a1 + 40);
      v11 = v4;
      dispatch_after(v7, MEMORY[0x1E0C80D38], block);

      v8 = v12;
    }
    else
    {
      PLUIGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "Did not get expected PUSearchHomeViewController for topViewController", v9, 2u);
      }
    }

  }
  else
  {
    PLUIGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_ERROR, "Failed navigate to Search tab", v9, 2u);
    }
  }

}

uint64_t __65__PUTabbedLibraryViewController__navigateToSearchWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __83__PUTabbedLibraryViewController__snapBackRootViewControllerInNavigationController___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __63__PUTabbedLibraryViewController_navigateToPlacesAlbumAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (a2 != 1)
  {
    PLUIGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 134218242;
      v7 = a2;
      v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_ERROR, "Could not navigate to Places Album with result: %li error: %@", (uint8_t *)&v6, 0x16u);
    }

  }
}

id __106__PUTabbedLibraryViewController_navigateToPeopleAlbumAnimated_revealPersonWithLocalIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type != %d && (verifiedType == %d || verifiedType == %d)"), -1, 2, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setPredicate:", v6);

    objc_msgSend(v5, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __106__PUTabbedLibraryViewController_navigateToPeopleAlbumAnimated_revealPersonWithLocalIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x1E0D7B688]);
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "initWithPeople:ignoreSharedLibraryFilters:", v10, 0);

      WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
      objc_msgSend(v7, "showViewController:sender:", v11, WeakRetained);

      v7 = (void *)v11;
    }

  }
  else
  {
    v7 = 0;
  }
  v13 = *(_QWORD *)(a1 + 56);
  if (v13)
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v7);

}

void __73__PUTabbedLibraryViewController__navigateToSuggestionFromCuratedLibrary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2 != 1)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "publicDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = a2;
      v10 = 2112;
      v11 = v5;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, "Could not navigate to suggestion: %li error: %@ destination: %{public}@", (uint8_t *)&v8, 0x20u);

    }
  }

}

void __90__PUTabbedLibraryViewController_navigateToFeaturedPhotoWithSuggestionIdentifier_animated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", WeakRetained, sel__navigateToSuggestionFromCuratedLibrary_, *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

uint64_t __50__PUTabbedLibraryViewController__navigateToForYou__block_invoke(uint64_t a1)
{
  _QWORD v2[4];
  __int128 v3;
  uint64_t v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50__PUTabbedLibraryViewController__navigateToForYou__block_invoke_2;
  v2[3] = &unk_1E58A8A38;
  v3 = *(_OWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 48);
  return objc_msgSend((id)v3, "navigateToContentMode:animated:completion:", 11, 0, v2);
}

void __50__PUTabbedLibraryViewController__navigateToForYou__block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  void *v9;
  id v10;
  __int16 v11;
  uint8_t buf[2];

  if (!a2)
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11 = 0;
      v7 = "Failed to navigate to the for you tab";
      v8 = (uint8_t *)&v11;
LABEL_10:
      _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_ERROR, v7, v8, 2u);
    }
LABEL_11:

    return;
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "_navigateToRootOfCurrentTabAnimated:", 0))
  {
    PLUIGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v7 = "Failed to navigate to the root of the for you tab";
      v8 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "topViewController");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("PUTabbedLibraryViewController.m"), 1448, CFSTR("unexpected view controller while trying to navigate to for you"));

  }
}

uint64_t __103__PUTabbedLibraryViewController__navigateToRootOfCurrentTabAnimated_dismissAnyPresentedViewController___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(result + 56))
  {
    result = objc_msgSend(*(id *)(result + 32), "px_dismissViewControllerIfAllowedAnimated:forced:", 0, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = result;
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 48) + 8) + 24) = 1;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24))
  {
    result = objc_msgSend(*(id *)(v1 + 40), "pu_popToViewControllerIfAllowed:animated:forced:", *(_QWORD *)(v1 + 32), 0, 0);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = result;
  }
  return result;
}

void __71__PUTabbedLibraryViewController_navigateToCloudFeedComment_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC81460))
    objc_msgSend(v3, "navigateToCloudFeedComment:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __77__PUTabbedLibraryViewController_navigateToRevealCloudFeedComment_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC81460))
    objc_msgSend(v3, "navigateToRevealCloudFeedComment:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __69__PUTabbedLibraryViewController_navigateToCloudFeedAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC81460))
    objc_msgSend(v3, "navigateToCloudFeedAsset:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __75__PUTabbedLibraryViewController_navigateToRevealCloudFeedAsset_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC81460))
    objc_msgSend(v3, "navigateToRevealCloudFeedAsset:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __67__PUTabbedLibraryViewController_navigateToCloudFeedWithCompletion___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  id v6;

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "_navigateToRootOfCurrentTabAnimated:", 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EEC47440);
    v5 = *(_QWORD *)(a1 + 40);
    if (v4)
    {
      objc_msgSend(v3, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", 0, 0, v5);
    }
    else if (v5)
    {
      (*(void (**)(_QWORD, void *))(v5 + 16))(*(_QWORD *)(a1 + 40), v3);
    }

  }
}

void __84__PUTabbedLibraryViewController__navigateToAsset_andPerformAction_inAlbum_animated___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a2;
  v3 = objc_msgSend(v21, "conformsToProtocol:", &unk_1EEC30F58);
  v4 = v21;
  if (v3)
  {
    v5 = v21;
    v6 = *(_DWORD *)(a1 + 56);
    if (v6)
    {
      if (v6 == 1)
      {
        v7 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "pl_PHAssetFromPhotoLibrary:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0CD13B8];
        v11 = *(_QWORD *)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v11, v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "navigateToPhoto:inAssetContainer:refetchIfNeeded:animated:", v9, v13, 1, *(unsigned __int8 *)(a1 + 60));

        if (objc_msgSend(*(id *)(a1 + 48), "isCloudSharedAlbum"))
        {
          if (objc_msgSend(*(id *)(a1 + 48), "conformsToProtocol:", &unk_1EED7B898))
            objc_msgSend(MEMORY[0x1E0D71BA8], "userDidNavigateIntoSharedAlbum:", *(_QWORD *)(a1 + 48));
        }
      }
    }
    else
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "pl_PHAssetFromPhotoLibrary:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0CD13B8];
      v18 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v18, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "navigateToRevealPhoto:inAssetContainer:animated:", v16, v20, *(unsigned __int8 *)(a1 + 60));

    }
    v4 = v21;
  }

}

void __103__PUTabbedLibraryViewController__navigateToAlbum_andPerformAction_initiallyHidden_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  int64_t v17;
  dispatch_time_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  int v27;
  char v28;
  char v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "selectedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  objc_msgSend(*(id *)(a1 + 40), "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5 >= 2)
  {
    v6 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(*(id *)(a1 + 40), "viewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "setViewControllers:animated:", v9, 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "setSelectedContentMode:", *(unsigned int *)(a1 + 64));
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__92088;
  v35 = __Block_byref_object_dispose__92089;
  objc_msgSend(*(id *)(a1 + 40), "topViewController");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (*(_DWORD *)(a1 + 64) == 1 && objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1EEC47440))
  {
    v10 = *(void **)(a1 + 40);
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __103__PUTabbedLibraryViewController__navigateToAlbum_andPerformAction_initiallyHidden_animated_completion___block_invoke_299;
    v30[3] = &unk_1E58A8908;
    v30[4] = &v31;
    objc_msgSend(v10, "navigateToSharedAlbumActivityFeedAnimated:configuration:completion:", 0, 0, v30);
  }
  if (objc_msgSend((id)v32[5], "conformsToProtocol:", &unk_1EEC471B0))
  {
    v11 = v2 == v3;
    v12 = (id)v32[5];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __103__PUTabbedLibraryViewController__navigateToAlbum_andPerformAction_initiallyHidden_animated_completion___block_invoke_2;
    v22[3] = &unk_1E58A8930;
    v27 = *(_DWORD *)(a1 + 68);
    v13 = *(id *)(a1 + 48);
    v14 = *(_QWORD *)(a1 + 32);
    v23 = v13;
    v24 = v14;
    v25 = v12;
    v28 = *(_BYTE *)(a1 + 72);
    v26 = *(id *)(a1 + 56);
    v29 = *(_BYTE *)(a1 + 73);
    v15 = v12;
    v16 = _Block_copy(v22);
    if (v11)
      v17 = 100000000;
    else
      v17 = 300000000;
    v18 = dispatch_time(0, v17);
    dispatch_after(v18, MEMORY[0x1E0C80D38], v16);

  }
  else
  {
    PLUIGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = v32[5];
      *(_DWORD *)buf = 138412290;
      v38 = v20;
      _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_ERROR, "destinationTopViewController %@ is not conformed to <PXNavigableCollectionContainer>", buf, 0xCu);
    }

    v21 = *(_QWORD *)(a1 + 56);
    if (v21)
      (*(void (**)(uint64_t, _QWORD))(v21 + 16))(v21, 0);
  }
  _Block_object_dispose(&v31, 8);

}

void __103__PUTabbedLibraryViewController__navigateToAlbum_andPerformAction_initiallyHidden_animated_completion___block_invoke_299(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __103__PUTabbedLibraryViewController__navigateToAlbum_andPerformAction_initiallyHidden_animated_completion___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 64);
  if (v2)
  {
    if (v2 == 1)
    {
      v3 = (void *)MEMORY[0x1E0CD13B8];
      v4 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v4, v5);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v6 = v13;
      if (v13)
      {
        objc_msgSend(*(id *)(a1 + 48), "navigateToCollection:animated:completion:", v13, *(unsigned __int8 *)(a1 + 68), *(_QWORD *)(a1 + 56));
        v6 = v13;
      }
      goto LABEL_8;
    }
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)MEMORY[0x1E0CD13B8];
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pl_PHAssetCollectionForAssetContainer:photoLibrary:", v8, v9);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "navigateToRevealAssetCollection:initiallyHidden:animated:", v14, *(unsigned __int8 *)(a1 + 69), *(unsigned __int8 *)(a1 + 68));
    v6 = v14;
LABEL_8:

    return;
  }
  PLUIGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v11 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109632;
    v16 = v11;
    v17 = 1024;
    v18 = 1;
    v19 = 1024;
    v20 = 0;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_ERROR, "action %d is not supported (PUNavigationActionEnter:%d, PUNavigationActionReveal:%d)", buf, 0x14u);
  }

  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);
}

void __60__PUTabbedLibraryViewController_invitationRecordsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "invitationRecordsDidChange:", *(_QWORD *)(a1 + 32));

}

void __57__PUTabbedLibraryViewController_assetContainerDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "pu_assetContainerDidChange:", *(_QWORD *)(a1 + 32));

}

void __61__PUTabbedLibraryViewController_assetContainerListDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "assetContainerListDidChange:", *(_QWORD *)(a1 + 32));

}

id __69__PUTabbedLibraryViewController_newRootViewControllerForContentMode___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v1);

  return v0;
}

uint64_t __52__PUTabbedLibraryViewController_rootViewControllers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bottomViewController");
}

uint64_t __91__PUTabbedLibraryViewController_willTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "px_hidesTabBarForRegularHorizontalSizeClass");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 40), "horizontalSizeClass");
    if (*(_QWORD *)(a1 + 48) != result)
      return objc_msgSend(*(id *)(a1 + 32), "_updateTabBarVisibilityForHorizontalSizeClass:", result);
  }
  return result;
}

+ (BOOL)_shouldForwardViewWillTransitionToSize
{
  return 1;
}

@end
