@implementation PXPlacesMapContainerViewController

- (PXPlacesMapContainerViewController)initWithPhotoLibrary:(id)a3 configuration:(id)a4
{
  id v7;
  id v8;
  PXPlacesMapContainerViewController *v9;
  PXPlacesMapContainerViewController *v10;
  void *v11;
  PXLibraryFilterState *v12;
  PXPlacesMapFetchResultController *v13;
  PXPlacesMapFetchResultViewController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  PXPlacesMapFetchResultViewController *fetchResultViewController;
  void *v21;
  _QWORD v23[4];
  char v24;
  objc_super v25;

  v7 = a3;
  v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)PXPlacesMapContainerViewController;
  v9 = -[PXPlacesMapContainerViewController initWithNibName:bundle:](&v25, sel_initWithNibName_bundle_, 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v11);
    v13 = -[PXPlacesMapFetchResultController initWithLibraryFilterState:photoLibrary:]([PXPlacesMapFetchResultController alloc], "initWithLibraryFilterState:photoLibrary:", v12, v7);
    v14 = [PXPlacesMapFetchResultViewController alloc];
    objc_msgSend(v8, "initialCoordinateRegion");
    v19 = -[PXPlacesMapFetchResultViewController initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:](v14, "initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:", objc_msgSend(v8, "enableNearbyAssetsAffordance"), 1, v7, v13, v15, v16, v17, v18);
    fetchResultViewController = v10->_fetchResultViewController;
    v10->_fetchResultViewController = (PXPlacesMapFetchResultViewController *)v19;

    -[PXPlacesMapFetchResultViewController setPxOneUpPresentationViewController:](v10->_fetchResultViewController, "setPxOneUpPresentationViewController:", v10);
    -[PXPlacesMapFetchResultViewController setBarButtonsDelegate:](v10->_fetchResultViewController, "setBarButtonsDelegate:", v10);
    v10->_previousNavigationBarSegmentedControlSelectedIndex = 0;
    LOBYTE(v14) = -[PXPlacesMapFetchResultViewController prefersToolbarVisible](v10->_fetchResultViewController, "prefersToolbarVisible");
    -[UIViewController px_enableBarAppearance](v10, "px_enableBarAppearance");
    -[UIViewController px_enablePrefersViewIsAppearingForAppearanceUpdates](v10, "px_enablePrefersViewIsAppearingForAppearanceUpdates");
    -[UIViewController px_barAppearance](v10, "px_barAppearance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__PXPlacesMapContainerViewController_initWithPhotoLibrary_configuration___block_invoke;
    v23[3] = &__block_descriptor_33_e34_v16__0___PXMutableBarAppearance__8l;
    v24 = (char)v14;
    objc_msgSend(v21, "performChangesWithAnimationOptions:changes:", 0, v23);

  }
  return v10;
}

- (PXPlacesMapContainerViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapContainerViewController.m"), 98, CFSTR("%s is not available as initializer"), "-[PXPlacesMapContainerViewController init]");

  abort();
}

- (PXPlacesMapContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapContainerViewController.m"), 102, CFSTR("%s is not available as initializer"), "-[PXPlacesMapContainerViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapContainerViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapContainerViewController.m"), 106, CFSTR("%s is not available as initializer"), "-[PXPlacesMapContainerViewController initWithCoder:]");

  abort();
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  -[PXPlacesMapContainerViewController nibName](self, "nibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPlacesMapContainerViewController;
    -[PXPlacesMapContainerViewController loadView](&v6, sel_loadView);
  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 200.0, 200.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[PXPlacesMapContainerViewController setView:](self, "setView:", v5);
  }
}

- (void)viewDidLoad
{
  void *v3;
  int v4;
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
  objc_super v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PXPlacesMapContainerViewController;
  -[PXPlacesMapContainerViewController viewDidLoad](&v15, sel_viewDidLoad);
  -[PXPlacesMapContainerViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "gridViewEnabled");

  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3C58]);
    PXLocalizedStringFromTable(CFSTR("PXPlacesMapContainerSubviewMapTitle"), CFSTR("PhotosUICore"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v6;
    PXLocalizedStringFromTable(CFSTR("PXPlacesMapContainerSubviewGridTitle"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithItems:", v8);

    objc_msgSend(MEMORY[0x1E0DC3C58], "px_defaultMinimumSegmentWidth");
    objc_msgSend(v9, "px_setMinimumSegmentWidth:");
    objc_msgSend(v9, "setSelectedSegmentIndex:", 0);
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_subviewControlChanged_, 4096);
    -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTitleView:", v9);

    -[PXPlacesMapContainerViewController setSubviewControl:](self, "setSubviewControl:", v9);
    -[PXPlacesMapContainerViewController _resetNavigationItem](self, "_resetNavigationItem");

  }
  else
  {
    -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftBarButtonItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapContainerViewController setInitialLeftBarButtonItems:](self, "setInitialLeftBarButtonItems:", v12);

    -[PXPlacesMapContainerViewController _updateNavigationItemTitleWithConfigurationIfPossible](self, "_updateNavigationItemTitleWithConfigurationIfPossible");
  }
  -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLargeTitleDisplayMode:", 2);

  -[PXPlacesMapContainerViewController fetchResultViewController](self, "fetchResultViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v14, 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[PXPlacesMapContainerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_initialNavigationBarStyle = objc_msgSend(v7, "style");

    -[PXPlacesMapContainerViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStyle:", 0);

  }
  v10.receiver = self;
  v10.super_class = (Class)PXPlacesMapContainerViewController;
  -[PXPlacesMapContainerViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  int64_t initialNavigationBarStyle;
  void *v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  -[PXPlacesMapContainerViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    initialNavigationBarStyle = self->_initialNavigationBarStyle;
    -[PXPlacesMapContainerViewController navigationController](self, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setStyle:", initialNavigationBarStyle);

  }
  v10.receiver = self;
  v10.super_class = (Class)PXPlacesMapContainerViewController;
  -[PXPlacesMapContainerViewController viewWillDisappear:](&v10, sel_viewWillDisappear_, v3);
}

- (void)subviewControlChanged:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v5, "selectedSegmentIndex");
    if (v4 != -[PXPlacesMapContainerViewController previousNavigationBarSegmentedControlSelectedIndex](self, "previousNavigationBarSegmentedControlSelectedIndex"))
    {
      -[PXPlacesMapContainerViewController setPreviousNavigationBarSegmentedControlSelectedIndex:](self, "setPreviousNavigationBarSegmentedControlSelectedIndex:", v4);
      if (v4 == 1)
      {
        -[PXPlacesMapContainerViewController _switchToLegacyGridController](self, "_switchToLegacyGridController");
      }
      else if (!v4)
      {
        -[PXPlacesMapContainerViewController _switchToMapController](self, "_switchToMapController");
      }
    }
  }

}

- (void)_switchToMapController
{
  id v3;

  -[PXPlacesMapContainerViewController fetchResultViewController](self, "fetchResultViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapContainerViewController _resetNavigationItem](self, "_resetNavigationItem");
  -[UIViewController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v3, 1);
  objc_msgSend(v3, "reloadStyle");
  -[PXPlacesMapContainerViewController _updateShouldOptOutFromChromelessBars](self, "_updateShouldOptOutFromChromelessBars");

}

- (void)_switchToLegacyGridController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXPhotosUIViewController *v8;
  id v9;

  -[PXPlacesMapContainerViewController fetchResultViewController](self, "fetchResultViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapFetchResultsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visibleGeotaggables");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPlacesMapContainerViewController photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXPhotosViewConfigurationForPlacesMomentsWithAllowedAssets(v9, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  PXLocalizedStringFromTable(CFSTR("PXPlacesFullSizeViewTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v7);

  objc_msgSend(v6, "setWantsTabBarHidden:", 1);
  objc_msgSend(v6, "setOneUpPresentationOrigin:", 7);
  v8 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v6);
  -[PXPhotosUIViewController setContainerViewController:](v8, "setContainerViewController:", self);
  -[PXPhotosUIViewController setGridPresentationBarsUpdateDelegate:](v8, "setGridPresentationBarsUpdateDelegate:", self);
  -[PXPlacesMapContainerViewController _resetNavigationItem](self, "_resetNavigationItem");
  -[UIViewController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v8, 1);
  -[PXPlacesMapContainerViewController _updateShouldOptOutFromChromelessBars](self, "_updateShouldOptOutFromChromelessBars");

}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return -[PXPlacesMapContainerViewController previousNavigationBarSegmentedControlSelectedIndex](self, "previousNavigationBarSegmentedControlSelectedIndex") == 0;
}

- (void)_updateShouldOptOutFromChromelessBars
{
  void *v2;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = self;
  v3 = -[PXPlacesMapContainerViewController pu_shouldOptOutFromChromelessBars](self, "pu_shouldOptOutFromChromelessBars");
  objc_msgSend(v2, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  if (v3)
  {
    objc_msgSend(v4, "navigationBar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "standardAppearance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v9;
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v4, "navigationBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScrollEdgeAppearance:", v5);

  if (v3)
  {

    objc_msgSend(v9, "toolbar");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "standardAppearance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v9, "toolbar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setScrollEdgeAppearance:", v7);

  if (v3)
  {

  }
}

- (void)legacyStrategyForHandleViewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v5 = a5;
  v6 = a4;
  v18 = a3;
  -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = -[PXPlacesMapContainerViewController gridControllerEditing](self, "gridControllerEditing");
    -[PXPlacesMapContainerViewController setGridControllerEditing:](self, "setGridControllerEditing:", v5);
    if (v5)
    {
      objc_msgSend(v8, "setTitleView:", 0);
      objc_msgSend(v9, "title");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v11);

      objc_msgSend(v9, "leftBarButtonItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setLeftBarButtonItems:animated:", v12, v6);

    }
    else if (v10)
    {
      -[PXPlacesMapContainerViewController subviewControl](self, "subviewControl");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitleView:", v15);

      objc_msgSend(v8, "setLeftBarButtonItems:animated:", MEMORY[0x1E0C9AA60], v6);
    }
    objc_msgSend(v9, "rightBarButtonItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItems:animated:", v16, v6);

    objc_msgSend(v18, "toolbarItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapContainerViewController setToolbarItems:animated:](self, "setToolbarItems:animated:", v14, v6);
  }
  else if (v5)
  {
    -[PXPlacesMapContainerViewController setGridControllerEditing:](self, "setGridControllerEditing:", 1);
    objc_msgSend(v8, "setTitleView:", 0);
    objc_msgSend(v9, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTitle:", v13);

    objc_msgSend(v9, "leftBarButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setLeftBarButtonItems:animated:", v14, v6);
  }
  else
  {
    if (-[PXPlacesMapContainerViewController gridControllerEditing](self, "gridControllerEditing"))
    {
      -[PXPlacesMapContainerViewController subviewControl](self, "subviewControl");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitleView:", v17);

    }
    objc_msgSend(v9, "rightBarButtonItems");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setRightBarButtonItems:animated:", v14, v6);
  }

}

- (void)viewControllerDidUpdateNavigationItemAppearance:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "standardAppearance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStandardAppearance:", v6);

  objc_msgSend(v5, "compactAppearance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCompactAppearance:", v7);

  objc_msgSend(v5, "scrollEdgeAppearance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollEdgeAppearance:", v8);

}

- (void)_resetNavigationItem
{
  void *v3;
  void *v4;
  id v5;

  -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapContainerViewController initialLeftBarButtonItems](self, "initialLeftBarButtonItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItems:", v3);

  objc_msgSend(v5, "setRightBarButtonItems:", 0);
  -[PXPlacesMapContainerViewController subviewControl](self, "subviewControl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitleView:", v4);

  objc_msgSend(v5, "setStandardAppearance:", 0);
  objc_msgSend(v5, "setCompactAppearance:", 0);
  objc_msgSend(v5, "setScrollEdgeAppearance:", 0);

}

- (void)_updateNavigationItemTitleWithConfigurationIfPossible
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXPlacesMapContainerViewController configuration](self, "configuration");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedNavigationItemTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    PXLocalizedStringFromTable(CFSTR("PXPlacesFullSizeViewTitle"), CFSTR("PhotosUICore"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  if (!v3)
}

- (void)setNavigationBarButtons:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRightBarButtonItems:", v4);

}

- (unint64_t)routingOptionsForDestination:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;

  v3 = a3;
  if (objc_msgSend(v3, "type") == 8)
  {
    objc_msgSend(v3, "collection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "px_isPlacesSmartAlbum");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)navigateToDestination:(id)a3 options:(unint64_t)a4 completionHandler:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void (**v15)(id, uint64_t, _QWORD);

  v15 = (void (**)(id, uint64_t, _QWORD))a5;
  v7 = a3;
  v8 = -[PXPlacesMapContainerViewController routingOptionsForDestination:](self, "routingOptionsForDestination:", v7);
  objc_msgSend(v7, "sidebarBackNavigationRootDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "collection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "px_isPlacesSmartAlbum");

  if (v11)
  {
    -[PXPlacesMapContainerViewController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_setHidesBackButtonInRegularWidth:", 1);
    -[PXPlacesMapContainerViewController traitCollection](self, "traitCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_updateBackButtonVisibilityForTraitCollection:", v13);

  }
  if (v8 == 1)
    v14 = 1;
  else
    v14 = 2;
  v15[2](v15, v14, 0);

}

- (id)px_navigationDestination
{
  PXProgrammaticNavigationDestination *px_navigationDestination;
  void *v4;
  void *v5;
  PXProgrammaticNavigationDestination *v6;
  PXProgrammaticNavigationDestination *v7;

  px_navigationDestination = self->_px_navigationDestination;
  if (!px_navigationDestination)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "px_assetCollectionForSmartAlbumWithSubtype:", 1000000203);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PXProgrammaticNavigationDestination initWithObject:revealMode:]([PXProgrammaticNavigationDestination alloc], "initWithObject:revealMode:", v5, 0);
    v7 = self->_px_navigationDestination;
    self->_px_navigationDestination = v6;

    px_navigationDestination = self->_px_navigationDestination;
  }
  return px_navigationDestination;
}

- (PXPlacesMapFetchResultViewController)fetchResultViewController
{
  return self->_fetchResultViewController;
}

- (unint64_t)previousNavigationBarSegmentedControlSelectedIndex
{
  return self->_previousNavigationBarSegmentedControlSelectedIndex;
}

- (void)setPreviousNavigationBarSegmentedControlSelectedIndex:(unint64_t)a3
{
  self->_previousNavigationBarSegmentedControlSelectedIndex = a3;
}

- (UISegmentedControl)subviewControl
{
  return self->_subviewControl;
}

- (void)setSubviewControl:(id)a3
{
  objc_storeStrong((id *)&self->_subviewControl, a3);
}

- (BOOL)gridControllerEditing
{
  return self->_gridControllerEditing;
}

- (void)setGridControllerEditing:(BOOL)a3
{
  self->_gridControllerEditing = a3;
}

- (int64_t)initialNavigationBarStyle
{
  return self->_initialNavigationBarStyle;
}

- (void)setInitialNavigationBarStyle:(int64_t)a3
{
  self->_initialNavigationBarStyle = a3;
}

- (PXPlacesMapContainerConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)initialLeftBarButtonItems
{
  return self->_initialLeftBarButtonItems;
}

- (void)setInitialLeftBarButtonItems:(id)a3
{
  objc_storeStrong((id *)&self->_initialLeftBarButtonItems, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_initialLeftBarButtonItems, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_subviewControl, 0);
  objc_storeStrong((id *)&self->_fetchResultViewController, 0);
  objc_storeStrong((id *)&self->_px_navigationDestination, 0);
}

void __73__PXPlacesMapContainerViewController_initWithPhotoLibrary_configuration___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPrefersStatusBarVisible:", 1);
  objc_msgSend(v3, "setPrefersNavigationBarVisible:", 1);
  objc_msgSend(v3, "setPrefersToolbarVisible:", *(unsigned __int8 *)(a1 + 32));
  objc_msgSend(v3, "setPrefersTabBarVisible:", 0);

}

@end
