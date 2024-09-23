@implementation RouteStepListViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (RouteStepListViewController)initWithOptions:(unint64_t)a3 metrics:(id)a4
{
  id v7;
  RouteStepListViewController *v8;
  RouteStepListViewController *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id location;
  objc_super v16;

  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RouteStepListViewController;
  v8 = -[RouteStepListViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_options = a3;
    objc_storeStrong((id *)&v8->_metrics, a4);
    objc_initWeak(&location, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v10, "registerObserver:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100A78D44;
    v13[3] = &unk_1011AD100;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v11, "virtualGarageGetGarageWithReply:", v13);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v9;
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
  NSLayoutConstraint *v10;
  NSLayoutConstraint *collectionViewTopConstraint;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *collectionViewBottomConstraint;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSLayoutConstraint *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[4];

  v30.receiver = self;
  v30.super_class = (Class)RouteStepListViewController;
  -[RouteStepListViewController viewDidLoad](&v30, "viewDidLoad");
  -[RouteStepListViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("RouteStepList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("RouteStepListCollectionView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v4, "addSubview:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v9));
  collectionViewTopConstraint = self->_collectionViewTopConstraint;
  self->_collectionViewTopConstraint = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bottomAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  collectionViewBottomConstraint = self->_collectionViewBottomConstraint;
  self->_collectionViewBottomConstraint = v16;

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leadingAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "leadingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v18));
  v31[0] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v23));
  v25 = self->_collectionViewTopConstraint;
  v31[1] = v24;
  v31[2] = v25;
  v31[3] = self->_collectionViewBottomConstraint;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

  -[RouteStepListViewController _updateCollectionViewHeader](self, "_updateCollectionViewHeader");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteStepListViewController;
  -[RouteStepListViewController viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[RouteStepListViewController setDebugViewControllerEnabled:](self, "setDebugViewControllerEnabled:", -[RouteStepListViewController _shouldShowDebugViewController](self, "_shouldShowDebugViewController"));
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteStepListViewController;
  -[RouteStepListViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
  -[RouteStepListViewController _scrollToStepAtIndex:animated:](self, "_scrollToStepAtIndex:animated:", objc_msgSend(v4, "activeStepIndex"), 0);

}

- (void)viewDidLayoutSubviews
{
  NSNumber *computedWidth;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  NSNumber *v11;
  NSNumber *v12;
  _QWORD block[5];
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RouteStepListViewController;
  -[RouteStepListViewController viewDidLayoutSubviews](&v14, "viewDidLayoutSubviews");
  computedWidth = self->_computedWidth;
  if (!computedWidth
    || (-[NSNumber cgFloatValue](computedWidth, "cgFloatValue"),
        v5 = v4,
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view")),
        objc_msgSend(v6, "frame"),
        v8 = vabdd_f64(v5, v7),
        v6,
        v8 > 2.22044605e-16))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
    objc_msgSend(v9, "frame");
    v11 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v10));
    v12 = self->_computedWidth;
    self->_computedWidth = v11;

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100A7924C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteStepListViewController;
  -[RouteStepListViewController traitCollectionDidChange:](&v5, "traitCollectionDidChange:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController traitCollection](self, "traitCollection"));
  -[RouteStepListDataSource setTraitCollection:](self->_dataSource, "setTraitCollection:", v4);

}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOComposedRoute *v11;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    if ((self->_options & 0x10) != 0
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController route](self, "route")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "elevationProfile")),
          v7,
          v6,
          v7))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController graphHeaderView](self, "graphHeaderView"));
      objc_msgSend(v8, "setRoute:", v11);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController graphHeaderView](self, "graphHeaderView"));
      -[RouteStepListViewController setHeaderView:](self, "setHeaderView:", v9);

    }
    else
    {
      -[RouteStepListViewController setHeaderView:](self, "setHeaderView:", 0);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
    objc_msgSend(v10, "setRoute:", v11);

    v5 = v11;
  }

}

- (UICollectionView)collectionView
{
  UICollectionView *collectionView;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  UICollectionView *v8;
  UICollectionView *v9;
  objc_class *v10;
  UICollectionView *v11;
  NSString *v12;
  void *v13;
  objc_class *v14;
  UICollectionView *v15;
  NSString *v16;
  void *v17;
  objc_class *v18;
  UICollectionView *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void **v24;
  uint64_t v25;
  id (*v26)(uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  id location;

  collectionView = self->_collectionView;
  if (!collectionView)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc((Class)UICollectionViewCompositionalLayout);
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100A79664;
    v27 = &unk_1011B5F50;
    objc_copyWeak(&v28, &location);
    v5 = objc_msgSend(v4, "initWithSectionProvider:", &v24);
    v6 = objc_opt_class(RouteStepListSectionBackgroundView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RouteStepListSectionBackgroundView decorationViewKind](RouteStepListSectionBackgroundView, "decorationViewKind", v24, v25, v26, v27));
    objc_msgSend(v5, "registerClass:forDecorationViewOfKind:", v6, v7);

    v8 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", v5, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v9 = self->_collectionView;
    self->_collectionView = v8;

    v10 = -[RouteStepListViewController cellClassForItemType:](self, "cellClassForItemType:", 0);
    v11 = self->_collectionView;
    v12 = NSStringFromClass(v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v11, "registerClass:forCellWithReuseIdentifier:", v10, v13);

    v14 = -[RouteStepListViewController cellClassForItemType:](self, "cellClassForItemType:", 1);
    v15 = self->_collectionView;
    v16 = NSStringFromClass(v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v15, "registerClass:forCellWithReuseIdentifier:", v14, v17);

    v18 = -[RouteStepListViewController cellClassForItemType:](self, "cellClassForItemType:", 2);
    v19 = self->_collectionView;
    v20 = NSStringFromClass(v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](v19, "registerClass:forCellWithReuseIdentifier:", v18, v21);

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v22);

    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
    collectionView = self->_collectionView;
  }
  return collectionView;
}

- (RouteStepListDataSource)dataSource
{
  RouteStepListDataSource *dataSource;
  RouteStepListDataSource *v4;
  void *v5;
  RouteStepListDataSource *v6;
  RouteStepListDataSource *v7;

  dataSource = self->_dataSource;
  if (!dataSource)
  {
    v4 = [RouteStepListDataSource alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController traitCollection](self, "traitCollection"));
    v6 = -[RouteStepListDataSource initWithTraitCollection:options:metrics:context:](v4, "initWithTraitCollection:options:metrics:context:", v5, self->_options, self->_metrics, 2);
    v7 = self->_dataSource;
    self->_dataSource = v6;

    -[RouteStepListDataSource setDelegate:](self->_dataSource, "setDelegate:", self);
    dataSource = self->_dataSource;
  }
  return dataSource;
}

- (NavigationDebugViewsController)debugViewController
{
  NavigationDebugViewsController *debugViewController;
  NavigationDebugViewsController *v4;
  NavigationDebugViewsController *v5;

  debugViewController = self->_debugViewController;
  if (!debugViewController)
  {
    v4 = objc_opt_new(NavigationDebugViewsController);
    v5 = self->_debugViewController;
    self->_debugViewController = v4;

    -[NavigationDebugViewsController setShowTraceControlsForStaleLocations:](self->_debugViewController, "setShowTraceControlsForStaleLocations:", 0);
    -[NavigationDebugViewsController setAutomaticallyHideTraceControls:](self->_debugViewController, "setAutomaticallyHideTraceControls:", 0);
    -[NavigationDebugViewsController setUpCameraSnapshotPickerVCFromViewController:](self->_debugViewController, "setUpCameraSnapshotPickerVCFromViewController:", self);
    debugViewController = self->_debugViewController;
  }
  return debugViewController;
}

- (void)setDebugViewControllerEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NavigationDebugViewsController *debugViewController;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];

  if (self->_debugViewControllerEnabled != a3)
  {
    self->_debugViewControllerEnabled = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController debugViewController](self, "debugViewController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugControlsView"));

      objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
      objc_msgSend(v6, "addSubview:", v5);

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "safeAreaLayoutGuide"));

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
      objc_msgSend(v9, "layoutMargins");
      v11 = v10;
      v13 = v12;
      v15 = v14;

      objc_msgSend(v5, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
      v17 = v16;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v32, v11));
      v34[0] = v31;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
      v30 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v18, -v15));
      v34[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "heightAnchor"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToConstant:", v17));
      v34[2] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23, -v13));
      v34[3] = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v34, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v25);

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController debugViewController](self, "debugViewController"));
      objc_msgSend(v26, "didManuallyAddDebugViews");

      -[NSLayoutConstraint setConstant:](self->_collectionViewBottomConstraint, "setConstant:", -v17);
    }
    else
    {
      debugViewController = self->_debugViewController;
      if (debugViewController)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController debugControlsView](debugViewController, "debugControlsView"));
        objc_msgSend(v28, "removeFromSuperview");

        -[NavigationDebugViewsController didManuallyRemoveDebugViews](self->_debugViewController, "didManuallyRemoveDebugViews");
        -[NSLayoutConstraint setConstant:](self->_collectionViewBottomConstraint, "setConstant:", 0.0);
      }
    }
  }
}

- (void)setDisplayRouteFromNavigationService:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  if (self->_displayRouteFromNavigationService != a3)
  {
    v3 = a3;
    self->_displayRouteFromNavigationService = a3;
    -[DirectionsElevationGraphHeaderView setStyleForNavigation:](self->_graphHeaderView, "setStyleForNavigation:");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v6 = v5;
    if (v3)
    {
      objc_msgSend(v5, "registerObserver:", self);

      -[RouteStepListViewController _updateRouteFromNavigationService](self, "_updateRouteFromNavigationService");
      v9 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v7 = objc_msgSend(v9, "stepIndex");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
      objc_msgSend(v8, "setActiveStepIndex:", v7);

    }
    else
    {
      objc_msgSend(v5, "unregisterObserver:", self);

      -[RouteStepListViewController setRoute:](self, "setRoute:", 0);
      v9 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
      objc_msgSend(v9, "setActiveStepIndex:", 0);
    }

  }
}

- (double)maximumHeaderHeight
{
  uint64_t v3;
  void *v4;
  DirectionsElevationGraphHeaderView *v5;
  DirectionsElevationGraphHeaderView *graphHeaderView;
  void *v8;
  double v9;
  double v10;

  v3 = objc_claimAutoreleasedReturnValue(-[RouteStepListViewController headerView](self, "headerView"));
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  v5 = (DirectionsElevationGraphHeaderView *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController headerView](self, "headerView"));
  graphHeaderView = self->_graphHeaderView;

  if (v5 != graphHeaderView)
    return 0.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController graphHeaderView](self, "graphHeaderView"));
  objc_msgSend(v8, "maximumHeight");
  v10 = v9;

  return v10;
}

- (double)minimumHeaderHeight
{
  uint64_t v3;
  void *v4;
  DirectionsElevationGraphHeaderView *v5;
  DirectionsElevationGraphHeaderView *graphHeaderView;
  void *v8;
  double v9;
  double v10;

  v3 = objc_claimAutoreleasedReturnValue(-[RouteStepListViewController headerView](self, "headerView"));
  if (!v3)
    return 0.0;
  v4 = (void *)v3;
  v5 = (DirectionsElevationGraphHeaderView *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController headerView](self, "headerView"));
  graphHeaderView = self->_graphHeaderView;

  if (v5 != graphHeaderView)
    return 0.0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController graphHeaderView](self, "graphHeaderView"));
  objc_msgSend(v8, "minimumHeight");
  v10 = v9;

  return v10;
}

- (void)setHeaderView:(id)a3
{
  UIView *v5;
  UIView *headerView;
  NSLayoutConstraint *headerViewHeightConstraint;
  double v8;
  double v9;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];

  v5 = (UIView *)a3;
  headerView = self->_headerView;
  if (headerView != v5)
  {
    -[UIView removeFromSuperview](headerView, "removeFromSuperview");
    -[NSLayoutConstraint setActive:](self->_headerViewHeightConstraint, "setActive:", 0);
    headerViewHeightConstraint = self->_headerViewHeightConstraint;
    self->_headerViewHeightConstraint = 0;

    objc_storeStrong((id *)&self->_headerView, a3);
    if (v5)
    {
      -[RouteStepListViewController maximumHeaderHeight](self, "maximumHeaderHeight");
      v9 = v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
      objc_msgSend(v10, "addSubview:", v5);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v5, "heightAnchor"));
      v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToConstant:", v9));
      v13 = self->_headerViewHeightConstraint;
      self->_headerViewHeightConstraint = v12;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5, "leadingAnchor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "leadingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
      v28[0] = v24;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5, "trailingAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v15));
      v28[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5, "topAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController view](self, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));
      v21 = self->_headerViewHeightConstraint;
      v28[2] = v20;
      v28[3] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

    }
    -[RouteStepListViewController _updateCollectionViewHeader](self, "_updateCollectionViewHeader");
  }

}

- (DirectionsElevationGraphHeaderView)graphHeaderView
{
  DirectionsElevationGraphHeaderView *graphHeaderView;
  DirectionsElevationGraphHeaderView *v4;
  DirectionsElevationGraphHeaderView *v5;

  graphHeaderView = self->_graphHeaderView;
  if (!graphHeaderView)
  {
    v4 = -[DirectionsElevationGraphHeaderView initWithFrame:]([DirectionsElevationGraphHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_graphHeaderView;
    self->_graphHeaderView = v4;

    -[DirectionsElevationGraphHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_graphHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DirectionsElevationGraphHeaderView setDelegate:](self->_graphHeaderView, "setDelegate:", self);
    -[DirectionsElevationGraphHeaderView setStyleForNavigation:](self->_graphHeaderView, "setStyleForNavigation:", -[RouteStepListViewController displayRouteFromNavigationService](self, "displayRouteFromNavigationService"));
    graphHeaderView = self->_graphHeaderView;
  }
  return graphHeaderView;
}

- (UIScrollView)scrollView
{
  void *collectionView;

  collectionView = self->_collectionView;
  if (!collectionView)
    collectionView = self->_tableView;
  return (UIScrollView *)collectionView;
}

- (void)reloadDataSource:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView", a3));
  objc_msgSend(v4, "reloadData");

  -[RouteStepListViewController _scrollToStepAtIndex:animated:](self, "_scrollToStepAtIndex:animated:", 0, 0);
}

- (void)reloadIndexPaths:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "reloadItemsAtIndexPaths:", v4);

}

- (void)reloadStepIndices:(id)a3 forDataSource:(id)a4
{
  id v5;
  void *v6;
  NSMutableArray *v7;
  _QWORD v8[4];
  NSMutableArray *v9;

  v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100A7A380;
  v8[3] = &unk_1011B1E88;
  v9 = objc_opt_new(NSMutableArray);
  v7 = v9;
  objc_msgSend(v5, "enumerateIndexesUsingBlock:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "reloadItemsAtIndexPaths:", v7);

}

- (Class)cellClassForItemType:(unint64_t)a3
{
  uint64_t v3;

  if (a3 <= 2)
  {
    v3 = objc_opt_class(*(&off_1011E1020)[a3]);
    self = (RouteStepListViewController *)objc_claimAutoreleasedReturnValue(v3);
  }
  return (Class)self;
}

- (void)customizeItem:(id)a3 forDataSource:(id)a4
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setShowsHairline:", 1);
  v5 = objc_opt_class(RouteStepFooterItem);
  if ((objc_opt_isKindOfClass(v6, v5) & 1) != 0)
    objc_msgSend(v6, "setDelegate:", self);

}

- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "directionsStepsListDidTapShareButton:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    objc_msgSend(v6, "directionsStepsListDidTapShareButton:", self);

  }
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "directionsStepsListDidTapRAPButton:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    objc_msgSend(v6, "directionsStepsListDidTapRAPButton:", self);

  }
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));
  v6 = objc_msgSend(v5, "count");

  return (int64_t)v6;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "items"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v6, "row")));

  v11 = NSStringFromClass((Class)objc_msgSend(v10, "cellClass"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v6));

  objc_msgSend(v13, "setItem:", v10);
  objc_msgSend(v13, "setShouldUseTextToBottomConstraint:", 1);

  return v13;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  char isKindOfClass;
  uint64_t v12;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));
  v8 = objc_msgSend(v5, "row");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v8));
  if (-[RouteStepListViewController allowsSelection](self, "allowsSelection"))
  {
    v10 = objc_opt_class(RouteStepManeuverItem);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      v12 = objc_opt_class(RouteStepWaypointItem);
      isKindOfClass = objc_opt_isKindOfClass(v9, v12);
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v26 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v26, "row")));

  v8 = objc_opt_class(RouteStepManeuverItem);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "step"));

    objc_msgSend(v10, "directionsStepsList:didTapRowForRouteStep:", self, v11);
LABEL_17:

    goto LABEL_18;
  }
  v12 = objc_opt_class(RouteStepWaypointItem);
  if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
  {
    if (objc_msgSend(v26, "row"))
    {
      v13 = (char *)objc_msgSend(v26, "row") + 1;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "items"));
      v16 = (char *)objc_msgSend(v15, "count");

      if (v13 < v16)
      {
        v17 = (uint64_t)objc_msgSend(v26, "row");
        if (v17 >= 1)
        {
          v18 = v17;
          while (1)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "items"));
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v18));

            v21 = objc_opt_class(RouteStepManeuverItem);
            if ((objc_opt_isKindOfClass(v10, v21) & 1) != 0)
              break;

            if (v18-- <= 1)
              goto LABEL_14;
          }
          if (v10)
            goto LABEL_16;
        }
      }
LABEL_14:
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastStepManeuverItem"));
    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
      v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstStepManeuverItem"));
    }
    v10 = (void *)v24;

    if (v10)
    {
LABEL_16:
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "step"));
      objc_msgSend(v11, "directionsStepsList:didTapRowForRouteStep:", self, v25);

      goto LABEL_17;
    }
  }
LABEL_18:

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  double v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewWillBeginDragging:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    objc_msgSend(v6, "scrollViewWillBeginDragging:", v8);

  }
  objc_msgSend(v8, "contentOffset");
  -[RouteStepListViewController setScrollViewOffsetStart:](self, "setScrollViewOffsetStart:", v7);

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  char v10;
  void *v11;
  id v12;

  y = a4.y;
  x = a4.x;
  v12 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "scrollViewWillEndDragging:withVelocity:targetContentOffset:");

  if ((v10 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    objc_msgSend(v11, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v12, a5, x, y);

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  unint64_t v16;
  unsigned int v17;
  unsigned int *v18;
  uint64_t v19;
  void *v20;
  id v21;

  v4 = a4;
  v21 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
  v7 = objc_opt_respondsToSelector(v6, "scrollViewDidEndDragging:willDecelerate:");

  if ((v7 & 1) != 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    objc_msgSend(v8, "scrollViewDidEndDragging:willDecelerate:", v21, v4);

  }
  objc_msgSend(v21, "contentOffset");
  v10 = v9;
  -[RouteStepListViewController scrollViewOffsetStart](self, "scrollViewOffsetStart");
  if (v10 != v11)
  {
    -[RouteStepListViewController scrollViewOffsetStart](self, "scrollViewOffsetStart");
    if (v10 >= v12)
      v13 = 7;
    else
      v13 = 8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController route](self, "route"));
    v15 = objc_msgSend(v14, "transportType");

    if (v15 - 1 > 5)
      v16 = 0;
    else
      v16 = qword_100E3D1D0[v15 - 1] - 1;
    v17 = -[RouteStepListViewController displayRouteFromNavigationService](self, "displayRouteFromNavigationService");
    if (v16 > 4)
    {
      v19 = 0;
    }
    else
    {
      v18 = (unsigned int *)&unk_100E3D214;
      if (v17)
        v18 = (unsigned int *)&unk_100E3D200;
      v19 = v18[v16];
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v20, "captureUserAction:onTarget:eventValue:", v13, v19, 0);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewDidScroll:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController delegate](self, "delegate"));
    objc_msgSend(v6, "scrollViewDidScroll:", v7);

  }
  -[RouteStepListViewController _updateCollectionViewHeader](self, "_updateCollectionViewHeader");

}

- (void)_scrollToStepAtIndex:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource"));
  v8 = objc_msgSend(v7, "itemIndexForStepIndex:", a3);

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v8;
  v11 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "scrollToItemAtIndexPath:atScrollPosition:animated:", v11, 1, v4);

}

- (void)_updateCollectionViewHeader
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double left;
  double bottom;
  double right;
  void *v25;

  -[RouteStepListViewController minimumHeaderHeight](self, "minimumHeaderHeight");
  v4 = v3;
  -[RouteStepListViewController maximumHeaderHeight](self, "maximumHeaderHeight");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v7, "contentOffset");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "adjustedContentInset");
  v12 = v9 + v11;

  v13 = v6 - fmax(v12, 0.0);
  -[NSLayoutConstraint setConstant:](self->_collectionViewTopConstraint, "setConstant:", v4);
  if (v13 > v4 != -[DirectionsElevationGraphHeaderView isBottomHairlineHidden](self->_graphHeaderView, "isBottomHairlineHidden"))-[DirectionsElevationGraphHeaderView setBottomHairlineHidden:](self->_graphHeaderView, "setBottomHairlineHidden:", v13 > v4);
  if (v13 <= v4)
    v13 = v4;
  if (self->_headerView)
    v14 = 10.0;
  else
    v14 = 0.0;
  -[UICollectionView contentInset](self->_collectionView, "contentInset");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v21, "setContentInset:", v6 - v4 + v14, v16, v18, v20);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController collectionView](self, "collectionView"));
  objc_msgSend(v25, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

  -[NSLayoutConstraint setConstant:](self->_headerViewHeightConstraint, "setConstant:", v13);
  -[NSLayoutConstraint setActive:](self->_headerViewHeightConstraint, "setActive:", 1);
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteStepListViewController dataSource](self, "dataSource", a3, a4, a5));
  objc_msgSend(v7, "setActiveStepIndex:", a4);

  -[RouteStepListViewController _scrollToStepAtIndex:animated:](self, "_scrollToStepAtIndex:animated:", a4, 1);
  -[RouteStepListViewController _updateCollectionViewHeader](self, "_updateCollectionViewHeader");
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, a3))
    -[RouteStepListViewController _updateRouteFromNavigationService](self, "_updateRouteFromNavigationService");
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
  objc_msgSend(v9, "distance");
  v11 = v10;
  objc_msgSend(v8, "distanceRemainingToEndOfLeg");
  if (v11 - v12 < 0.0)
  {
    -[DirectionsElevationGraphHeaderView setNavigationProgress:](self->_graphHeaderView, "setNavigationProgress:", 0.0);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "route"));
    objc_msgSend(v13, "distance");
    v15 = v14;
    objc_msgSend(v8, "distanceRemainingToEndOfLeg");
    -[DirectionsElevationGraphHeaderView setNavigationProgress:](self->_graphHeaderView, "setNavigationProgress:", v15 - v16);

  }
}

- (void)_updateRouteFromNavigationService
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v7, "state");
  if (MNNavigationServiceStateIsNavigating(v3, v4)
    && (v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"))) != 0)
  {
    v6 = (void *)v5;
    -[RouteStepListViewController setRoute:](self, "setRoute:", v5);

  }
  else
  {
    -[RouteStepListViewController setRoute:](self, "setRoute:", 0);
  }

}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A7B144;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)directionsElevationGraphHeaderViewWillRecalculateHeights:(id)a3
{
  -[NSLayoutConstraint setActive:](self->_headerViewHeightConstraint, "setActive:", 0);
}

- (BOOL)_shouldShowDebugViewController
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v2, "BOOLForKey:", CFSTR("PlaybackControls")))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    if (objc_msgSend(v3, "isCarAppSceneHostingNavigation"))
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v5 = objc_msgSend(v4, "isNavigatingFromTrace");

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)showsHairline
{
  return self->_showsHairline;
}

- (void)setShowsHairline:(BOOL)a3
{
  self->_showsHairline = a3;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (BOOL)displayRouteFromNavigationService
{
  return self->_displayRouteFromNavigationService;
}

- (BOOL)allowsSelection
{
  return self->_allowsSelection;
}

- (void)setAllowsSelection:(BOOL)a3
{
  self->_allowsSelection = a3;
}

- (RouteStepListDelegate)delegate
{
  return (RouteStepListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setDebugViewController:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewController, a3);
}

- (BOOL)debugViewControllerEnabled
{
  return self->_debugViewControllerEnabled;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (double)scrollViewOffsetStart
{
  return self->_scrollViewOffsetStart;
}

- (void)setScrollViewOffsetStart:(double)a3
{
  self->_scrollViewOffsetStart = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setGraphHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_graphHeaderView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphHeaderView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_debugViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_computedWidth, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_collectionViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_headerViewHeightConstraint, 0);
}

@end
