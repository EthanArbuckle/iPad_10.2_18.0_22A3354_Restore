@implementation PXPlacesMapFetchResultViewController

- (PXPlacesMapFetchResultViewController)initWithInitialCoordinateRegion:(id *)a3 enableNearbyAssetsAffordance:(BOOL)a4 wantsMapOptionsView:(BOOL)a5 photoLibrary:(id)a6 mapFetchResultController:(id)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v12;
  char v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v21;
  id v22;
  PXPlacesMapFetchResultViewController *v23;
  PXPlacesMapFetchResultViewController *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PXPlacesMapThumbnailLocationCurator *v30;
  PXPlacesMapThumbnailLocationCurator *thumbnailLocationCurator;
  void *v32;
  void *v34;
  objc_super v35;

  v12 = a5;
  v14 = (char)a3;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  v18 = v7;
  v21 = (id)a5;
  v22 = a6;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 89, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v35.receiver = self;
  v35.super_class = (Class)PXPlacesMapFetchResultViewController;
  v23 = -[PXPlacesMapFetchResultViewController initWithNibName:bundle:](&v35, sel_initWithNibName_bundle_, 0, 0);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_photoLibrary, (id)v12);
    v24->_style = 0;
    v24->_enableNearbyAssetsAffordance = v14;
    v24->_wantsMapOptionsView = a4;
    objc_storeStrong((id *)&v24->_mapFetchResultsController, a6);
    v24->_showNavigationBar = 1;
    objc_msgSend(v22, "mapControllerAccessor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "mapViewController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapFetchResultViewController addChildViewController:](v24, "addChildViewController:", v26);

    -[PXPlacesMapFetchResultController mapController](v24->_mapFetchResultsController, "mapController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setChangeDelegate:", v24);

    -[PXPlacesMapFetchResultController mapController](v24->_mapFetchResultsController, "mapController");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setSelectionDelegate:", v24);

    -[PXPlacesMapFetchResultController mapController](v24->_mapFetchResultsController, "mapController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInitialCoordinateRegion:", v18, v17, v16, v15);

    v30 = objc_alloc_init(PXPlacesMapThumbnailLocationCurator);
    thumbnailLocationCurator = v24->_thumbnailLocationCurator;
    v24->_thumbnailLocationCurator = v30;

    -[PXPlacesMapFetchResultViewController thumbnailLocationCurator](v24, "thumbnailLocationCurator");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapFetchResultController setThumbnailCurationDelegate:](v24->_mapFetchResultsController, "setThumbnailCurationDelegate:", v32);

  }
  return v24;
}

- (PXPlacesMapFetchResultViewController)initWithInitialCenterCoordinate:(CLLocationCoordinate2D)a3 enableNearbyAssetsAffordance:(BOOL)a4 wantsMapOptionsView:(BOOL)a5 photoLibrary:(id)a6 mapFetchResultController:(id)a7
{
  double longitude;
  double latitude;
  PXPlacesMapFetchResultViewController *v9;
  void *v10;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v9 = -[PXPlacesMapFetchResultViewController initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:](self, "initWithInitialCoordinateRegion:enableNearbyAssetsAffordance:wantsMapOptionsView:photoLibrary:mapFetchResultController:", a4, a5, a6, a7, *MEMORY[0x1E0CC1568], *(double *)(MEMORY[0x1E0CC1568] + 8), *(double *)(MEMORY[0x1E0CC1568] + 16), *(double *)(MEMORY[0x1E0CC1568] + 24));
  -[PXPlacesMapFetchResultController mapController](v9->_mapFetchResultsController, "mapController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setInitialCenterCoordinate:", latitude, longitude);

  return v9;
}

- (PXPlacesMapFetchResultViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7;
  id v8;
  void *v9;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 127, CFSTR("%s is not available as initializer"), "-[PXPlacesMapFetchResultViewController initWithNibName:bundle:]");

  abort();
}

- (PXPlacesMapFetchResultViewController)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 131, CFSTR("%s is not available as initializer"), "-[PXPlacesMapFetchResultViewController initWithCoder:]");

  abort();
}

- (PXPlacesMapFetchResultViewController)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 135, CFSTR("%s is not available as initializer"), "-[PXPlacesMapFetchResultViewController init]");

  abort();
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXPlacesMapFetchResultViewController;
  -[PXPlacesMapFetchResultViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  objc_super v6;

  -[PXPlacesMapFetchResultViewController nibName](self, "nibName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPlacesMapFetchResultViewController;
    -[PXPlacesMapFetchResultViewController loadView](&v6, sel_loadView);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

    -[PXPlacesMapFetchResultViewController setView:](self, "setView:", v5);
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)PXPlacesMapFetchResultViewController;
  -[PXPlacesMapFetchResultViewController viewDidLoad](&v29, sel_viewDidLoad);
  -[PXPlacesMapFetchResultViewController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v4);

  PXLocalizedStringFromTable(CFSTR("PXPlacesFullSizeViewTitle"), CFSTR("PhotosUICore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController setTitle:](self, "setTitle:", v5);

  -[PXPlacesMapFetchResultViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mapControllerAccessor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mapViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "addSubview:", v10);
  _NSDictionaryOfVariableBindings(CFSTR("mapContainerView"), v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[mapContainerView]|"), 0, 0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v12);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[mapContainerView]|"), 0, 0, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addConstraints:", v13);

  if (-[PXPlacesMapFetchResultViewController wantsMapOptionsView](self, "wantsMapOptionsView"))
    -[PXPlacesMapFetchResultViewController _setupMapModeControlsOverlay](self, "_setupMapModeControlsOverlay");
  objc_msgSend(v9, "didMoveToParentViewController:", self);
  -[PXPlacesMapFetchResultViewController reloadStyle](self, "reloadStyle");
  objc_initWeak(&location, self);
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke;
  v25[3] = &unk_1E5147280;
  v16 = v14;
  v26 = v16;
  objc_copyWeak(&v27, &location);
  objc_msgSend(v16, "reloadContentModeWithCompletion:", v25);
  if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
  {
    -[UIViewController px_enableBarAppearance](self, "px_enableBarAppearance");
    -[UIViewController px_barAppearance](self, "px_barAppearance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_4;
    v24[3] = &unk_1E512A140;
    v24[4] = self;
    objc_msgSend(v17, "performChangesWithAnimationOptions:changes:", 0, v24);
    -[PXPlacesMapFetchResultViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "navigationBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "standardAppearance");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setScrollEdgeAppearance:", v20);

    -[PXPlacesMapFetchResultViewController navigationController](self, "navigationController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "toolbar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "standardAppearance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setScrollEdgeAppearance:", v23);

  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
}

- (void)_setupMapModeControlsOverlay
{
  void *v3;
  uint64_t v4;
  PXPlacesMapOptionsController *v5;
  void *v6;
  void *v7;
  PXPlacesMapOptionsController *v8;
  PXMapOptionsView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  PXPlacesMapModeController *v36;
  _QWORD v37[6];

  v37[4] = *MEMORY[0x1E0C80C00];
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mapView");
  v4 = objc_claimAutoreleasedReturnValue();

  v35 = (void *)v4;
  v36 = -[PXPlacesMapModeController initWithMapView:prefersRealisticElevationStyle:]([PXPlacesMapModeController alloc], "initWithMapView:prefersRealisticElevationStyle:", v4, 1);
  v5 = [PXPlacesMapOptionsController alloc];
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPlacesLocationAuthorizationMonitor sharedInstance](PXPlacesLocationAuthorizationMonitor, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPlacesMapOptionsController initWithMapModeController:mapFetchResultController:locationAuthorizationMonitor:](v5, "initWithMapModeController:mapFetchResultController:locationAuthorizationMonitor:", v36, v6, v7);
  -[PXPlacesMapFetchResultViewController setMapOptionsController:](self, "setMapOptionsController:", v8);

  -[PXPlacesMapFetchResultViewController mapOptionsController](self, "mapOptionsController");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setDelegate:", self);
  v9 = -[PXMapOptionsView initWithMapView:]([PXMapOptionsView alloc], "initWithMapView:", v4);
  -[PXPlacesMapFetchResultViewController setMapOptionsView:](self, "setMapOptionsView:", v9);

  -[PXPlacesMapFetchResultViewController mapOptionsView](self, "mapOptionsView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDelegate:", v34);
  -[PXPlacesMapFetchResultViewController _updateMapOptionsView](self, "_updateMapOptionsView");
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PXPlacesMapFetchResultViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v10);

  v25 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v10, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController view](self, "view");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "safeAreaLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, 8.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v29;
  objc_msgSend(v10, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController view](self, "view");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "safeAreaLayoutGuide");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v24, -8.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v23;
  objc_msgSend(v10, "leadingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "safeAreaLayoutGuide");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToAnchor:constant:", v13, 8.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v14;
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "safeAreaLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintLessThanOrEqualToAnchor:constant:", v18, -8.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v37[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "activateConstraints:", v20);

}

- (UIBarButtonItem)filterAssetsBtn
{
  UIBarButtonItem *filterAssetsBtn;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  filterAssetsBtn = self->_filterAssetsBtn;
  if (!filterAssetsBtn)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", 0, 0, self, sel_tapFilterAssetsBtn_);
    v5 = self->_filterAssetsBtn;
    self->_filterAssetsBtn = v4;

    filterAssetsBtn = self->_filterAssetsBtn;
  }
  return filterAssetsBtn;
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXPlacesMapFetchResultViewController reloadStyle](self, "reloadStyle");
  }
}

- (void)setShowNavigationBar:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_showNavigationBar != a3)
  {
    self->_showNavigationBar = a3;
    -[UIViewController px_barAppearance](self, "px_barAppearance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __61__PXPlacesMapFetchResultViewController_setShowNavigationBar___block_invoke;
    v5[3] = &unk_1E512A140;
    v5[4] = self;
    objc_msgSend(v4, "performChangesWithAnimationOptions:changes:", 0, v5);

  }
}

- (void)reloadStyle
{
  if (-[PXPlacesMapFetchResultViewController style](self, "style") - 1 <= 1)
  {
    if (-[PXPlacesMapFetchResultViewController enableNearbyAssetsAffordance](self, "enableNearbyAssetsAffordance"))
      -[PXPlacesMapFetchResultViewController _setupNearbyAssetsToolbarLayoutWithInfoToolbarButton:](self, "_setupNearbyAssetsToolbarLayoutWithInfoToolbarButton:", 0);
  }
}

- (void)_setupNearbyAssetsToolbarLayoutWithInfoToolbarButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v7 = (void *)objc_msgSend(v5, "initWithCustomView:", v6);

  objc_msgSend(v7, "setEnabled:", 0);
  objc_msgSend(v7, "setIsAccessibilityElement:", 0);
  objc_msgSend(v4, "addObject:", v7);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  objc_msgSend(v4, "addObject:", v8);

  -[PXPlacesMapFetchResultViewController filterAssetsBtn](self, "filterAssetsBtn");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 5, 0, 0);
  objc_msgSend(v4, "addObject:", v10);

  if (v13)
    objc_msgSend(v4, "addObject:", v13);
  -[PXPlacesMapFetchResultViewController _placeToolbarItems:](self, "_placeToolbarItems:", v4);
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "contentMode");

  -[PXPlacesMapFetchResultViewController _reloadContentModeDisplay:](self, "_reloadContentModeDisplay:", v12);
}

- (void)_placeToolbarItems:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PXPlacesMapFetchResultViewController barButtonsDelegate](self, "barButtonsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPlacesMapFetchResultViewController barButtonsDelegate](self, "barButtonsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setToolbarButtons:", v6);

  }
  else
  {
    -[PXPlacesMapFetchResultViewController setToolbarItems:](self, "setToolbarItems:", v6);
  }

}

- (void)_reloadContentModeDisplay:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  id v5;

  if (a3 == 1)
  {
    -[PXPlacesMapFetchResultViewController filterAssetsBtn](self, "filterAssetsBtn");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = CFSTR("PXPlacesShowNearbyAssets");
  }
  else
  {
    if (a3)
      return;
    -[PXPlacesMapFetchResultViewController filterAssetsBtn](self, "filterAssetsBtn");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = CFSTR("PXPlacesHideNearbyAssets");
  }
  PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

}

- (void)tapFilterAssetsBtn:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "contentMode");

  -[PXPlacesMapFetchResultViewController _reloadContentModeDisplay:](self, "_reloadContentModeDisplay:", v5 == 0);
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContentMode:", v5 == 0);
  objc_msgSend(v6, "reloadContentModeWithCompletion:", 0);

}

- (void)_selectedGeotaggables:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXPlacesMapFetchResultViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PXPhotoKitAssetsDataSourceManager *v17;
  void *v18;
  __objc2_class **v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  PXPhotosUIViewController *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  uint8_t buf[16];
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    if (objc_msgSend(v5, "count") == 1)
    {
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXPlacesMapFetchResultViewController _fetchHydratedAssetForPlacesAsset:](self, "_fetchHydratedAssetForPlacesAsset:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPlacesMapFetchResultViewController setSelectedGeotaggable:](self, "setSelectedGeotaggable:", v8);

      -[PXPlacesMapFetchResultViewController selectedGeotaggable](self, "selectedGeotaggable");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        v10 = self;
        -[PXPlacesMapFetchResultViewController pxOneUpPresentationViewController](v10, "pxOneUpPresentationViewController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = v10;
        if (v11)
        {
          -[PXPlacesMapFetchResultViewController pxOneUpPresentationViewController](v10, "pxOneUpPresentationViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v12, "px_enableOneUpPresentation");
        objc_msgSend(v12, "px_oneUpPresentation");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPlacesMapFetchResultViewController selectedGeotaggable](v10, "selectedGeotaggable");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPlacesMapFetchResultViewController dataSourceForAssets:](v10, "dataSourceForAssets:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v16);
        -[PXPlacesMapFetchResultViewController setOneUpDataSourceManager:](v10, "setOneUpDataSourceManager:", v17);

        objc_msgSend(v13, "setDelegate:", v10);
        objc_msgSend(v13, "startWithConfigurationHandler:", 0);

      }
      goto LABEL_23;
    }
    objc_msgSend(v5, "anyObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_9;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_descriptionForAssertionMessage");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 432, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectedGeotaggables.anyObject"), v29, v31);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 432, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectedGeotaggables.anyObject"), v29);
    }

LABEL_9:
    objc_msgSend(v18, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      PLUIGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "Missing photoLibrary to show selectedGeotaggables", buf, 2u);
      }

      v7 = 0;
      goto LABEL_23;
    }
    v19 = off_1E50B3000;
    if (+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled"))
    {
      +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "presentZoomableGridFromMapCluster");

      if (v21)
      {
        v22 = v5;
        if (v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            PXPhotosViewConfigurationForPlacesGridWithAssetSet(v22, v7);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

            objc_msgSend(v23, "setOneUpPresentationOrigin:", 7);
            if (-[__objc2_class isLemonadeUIEnabled](v19[77], "isLemonadeUIEnabled"))
            {
              +[PXLemonadeDetailsViewFactory makeDetailsViewControllerWithPhotosViewConfiguration:](PXLemonadeDetailsViewFactory, "makeDetailsViewControllerWithPhotosViewConfiguration:", v23);
              v24 = (PXPhotosUIViewController *)objc_claimAutoreleasedReturnValue();
              -[PXPlacesMapFetchResultViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v24, 1, 0);
            }
            else
            {
              v24 = -[PXPhotosUIViewController initWithConfiguration:]([PXPhotosUIViewController alloc], "initWithConfiguration:", v23);
              -[PXPlacesMapFetchResultViewController navigationController](self, "navigationController");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "pushViewController:animated:", v24, 1);

            }
LABEL_23:

            goto LABEL_24;
          }
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "px_descriptionForAssertionMessage");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 438, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("selectedGeotaggables"), v34, v36);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPlacesMapFetchResultViewController.m"), 438, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("selectedGeotaggables"), v34);
        }

        PXPhotosViewConfigurationForPlacesGridWithAssetSet(v22, v7);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = off_1E50B3000;
        goto LABEL_16;
      }
    }
    PXPhotosViewConfigurationForPlacesMomentsWithAllowedAssets(v5, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringFromTable(CFSTR("PXPlacesFullSizeViewTitle"), CFSTR("PhotosUICore"));
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setTitle:", v22);
    goto LABEL_16;
  }
LABEL_24:

}

- (id)_fetchHydratedAssetForPlacesAsset:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("SELF in %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setPredicate:", v7);
  objc_msgSend(v9, "setIncludeAssetSourceTypes:", 5);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)dataSourceForAssets:(id)a3
{
  id v3;
  void *v4;
  void *v5;
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
  PXPhotosDataSourceConfiguration *v16;
  PXPhotosDataSource *v17;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  PXMap();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CD1570];
  objc_msgSend(v3, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "fetchOptionsWithPhotoLibrary:orObject:", 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIncludeAssetSourceTypes:", 5);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithObjectIDs:options:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CD13B8];
  PXLocalizedStringFromTable(CFSTR("PXPlacesWidgetTitle"), CFSTR("PhotosUICore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transientAssetCollectionWithAssetFetchResult:title:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CD14E0];
  v19[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transientCollectionListWithCollections:title:", v13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchCollectionsInCollectionList:options:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v15, 0);
  v17 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v16);

  return v17;
}

- (void)dataSourceDidChange:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  _QWORD block[5];

  if (-[PXPlacesMapFetchResultViewController autoRefocusOnDataChange](self, "autoRefocusOnDataChange", a3))
  {
    -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mapController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mapViewIsVisible");

    if (v6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__PXPlacesMapFetchResultViewController_dataSourceDidChange___block_invoke;
      block[3] = &unk_1E5149198;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (void)didSelectGeotaggableItems:(id)a3 fromMapView:(id)a4
{
  id v5;

  objc_msgSend(a3, "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPlacesMapFetchResultViewController _selectedGeotaggables:](self, "_selectedGeotaggables:", v5);

}

- (id)oneUpPresentationMediaProvider:(id)a3
{
  return objc_alloc_init(PXPhotoKitUIMediaProvider);
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  return 7;
}

- (id)oneUpPresentationInitialAssetReference:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PXPlacesMapFetchResultViewController oneUpDataSourceManager](self, "oneUpDataSourceManager", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startingAssetReference");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)pu_shouldOptOutFromChromelessBars
{
  return !+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
}

- (void)_updateMapOptionsView
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  if (-[PXPlacesMapFetchResultViewController wantsMapOptionsView](self, "wantsMapOptionsView"))
  {
    -[PXPlacesMapFetchResultViewController mapOptionsView](self, "mapOptionsView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlacesMapFetchResultViewController mapOptionsController](self, "mapOptionsController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPerspectiveButtonState:animated:", objc_msgSend(v4, "perspectiveButtonState"), 1);

    -[PXPlacesMapFetchResultViewController mapOptionsController](self, "mapOptionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mapStyle");
    -[PXPlacesMapFetchResultViewController mapOptionsView](self, "mapOptionsView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMapStyle:", v6);

    -[PXPlacesMapFetchResultViewController mapOptionsController](self, "mapOptionsController");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "enableUserTrackingButton");
    -[PXPlacesMapFetchResultViewController mapOptionsView](self, "mapOptionsView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnableUserTrackingButton:", v8);

  }
}

- (void)ppt_performPlacesScrollTest:(id)a3 iterations:(int64_t)a4 screenDelta:(int64_t)a5 delay:(double)a6 completion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;

  v12 = a7;
  v13 = a3;
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "mapView");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "ppt_performPlacesScrollTest:iterations:screenDelta:delay:completion:", v13, a4, a5, v12, a6);
}

- (void)ppt_performPlacesZoomTest:(id)a3 iterations:(int64_t)a4 delay:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;

  v10 = a6;
  v11 = a3;
  -[PXPlacesMapFetchResultViewController mapFetchResultsController](self, "mapFetchResultsController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mapView");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "ppt_performPlacesZoomTest:iterations:delay:completion:", v11, a4, v10, a5);
}

- (PXPlacesMapFetchResultController)mapFetchResultsController
{
  return self->_mapFetchResultsController;
}

- (PXPlacesAssetsSelectionDelegate)assetSelectionDelegate
{
  return (PXPlacesAssetsSelectionDelegate *)objc_loadWeakRetained((id *)&self->_assetSelectionDelegate);
}

- (void)setAssetSelectionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_assetSelectionDelegate, a3);
}

- (PXPlacesMapBarButtonsDelegate)barButtonsDelegate
{
  return (PXPlacesMapBarButtonsDelegate *)objc_loadWeakRetained((id *)&self->_barButtonsDelegate);
}

- (void)setBarButtonsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_barButtonsDelegate, a3);
}

- (PXPlacesMapLocationEditDelegate)editLocationDelegate
{
  return (PXPlacesMapLocationEditDelegate *)objc_loadWeakRetained((id *)&self->_editLocationDelegate);
}

- (void)setEditLocationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_editLocationDelegate, a3);
}

- (UIViewController)pxOneUpPresentationViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_pxOneUpPresentationViewController);
}

- (void)setPxOneUpPresentationViewController:(id)a3
{
  objc_storeWeak((id *)&self->_pxOneUpPresentationViewController, a3);
}

- (unint64_t)style
{
  return self->_style;
}

- (BOOL)showNavigationBar
{
  return self->_showNavigationBar;
}

- (BOOL)canEditLocation
{
  return self->_canEditLocation;
}

- (void)setCanEditLocation:(BOOL)a3
{
  self->_canEditLocation = a3;
}

- (BOOL)autoRefocusOnDataChange
{
  return self->_autoRefocusOnDataChange;
}

- (void)setAutoRefocusOnDataChange:(BOOL)a3
{
  self->_autoRefocusOnDataChange = a3;
}

- (PXPlacesGeotaggable)selectedGeotaggable
{
  return (PXPlacesGeotaggable *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setSelectedGeotaggable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (void)setFilterAssetsBtn:(id)a3
{
  objc_storeStrong((id *)&self->_filterAssetsBtn, a3);
}

- (PXPhotoKitAssetsDataSourceManager)oneUpDataSourceManager
{
  return self->_oneUpDataSourceManager;
}

- (void)setOneUpDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, a3);
}

- (PXPlacesMapThumbnailLocationCurator)thumbnailLocationCurator
{
  return self->_thumbnailLocationCurator;
}

- (void)setThumbnailLocationCurator:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailLocationCurator, a3);
}

- (BOOL)enableNearbyAssetsAffordance
{
  return self->_enableNearbyAssetsAffordance;
}

- (BOOL)wantsMapOptionsView
{
  return self->_wantsMapOptionsView;
}

- (PXMapOptionsView)mapOptionsView
{
  return self->_mapOptionsView;
}

- (void)setMapOptionsView:(id)a3
{
  objc_storeStrong((id *)&self->_mapOptionsView, a3);
}

- (PXPlacesMapOptionsController)mapOptionsController
{
  return self->_mapOptionsController;
}

- (void)setMapOptionsController:(id)a3
{
  objc_storeStrong((id *)&self->_mapOptionsController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapOptionsController, 0);
  objc_storeStrong((id *)&self->_mapOptionsView, 0);
  objc_storeStrong((id *)&self->_thumbnailLocationCurator, 0);
  objc_storeStrong((id *)&self->_oneUpDataSourceManager, 0);
  objc_storeStrong((id *)&self->_filterAssetsBtn, 0);
  objc_storeStrong((id *)&self->_selectedGeotaggable, 0);
  objc_destroyWeak((id *)&self->_pxOneUpPresentationViewController);
  objc_destroyWeak((id *)&self->_editLocationDelegate);
  objc_destroyWeak((id *)&self->_barButtonsDelegate);
  objc_destroyWeak((id *)&self->_assetSelectionDelegate);
  objc_storeStrong((id *)&self->_mapFetchResultsController, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __60__PXPlacesMapFetchResultViewController_dataSourceDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "mapFetchResultsController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "focusOnGeotaggablesAnimated:", 1);

}

uint64_t __60__PXPlacesMapFetchResultViewController_dataSourceForAssets___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

void __61__PXPlacesMapFetchResultViewController_setShowNavigationBar___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "setPrefersNavigationBarVisible:", objc_msgSend(v2, "showNavigationBar"));

}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_2;
  v3[3] = &unk_1E5147280;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "resumeWithCompletion:", v3);

  objc_destroyWeak(&v5);
}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setPrefersStatusBarVisible:", 1);
  objc_msgSend(v3, "setPrefersNavigationBarVisible:", objc_msgSend(*(id *)(a1 + 32), "showNavigationBar"));
  objc_msgSend(v3, "setPrefersToolbarVisible:", objc_msgSend(*(id *)(a1 + 32), "prefersToolbarVisible"));
  objc_msgSend(v3, "setPrefersTabBarVisible:", 0);

}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_3;
  v2[3] = &unk_1E5147280;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v2);

  objc_destroyWeak(&v4);
}

void __51__PXPlacesMapFetchResultViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = objc_msgSend(WeakRetained, "style");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "focusOnProvidedAssetsAnimated:", 0);
}

@end
