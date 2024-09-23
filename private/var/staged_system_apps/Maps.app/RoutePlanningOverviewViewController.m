@implementation RoutePlanningOverviewViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

+ (id)routePlanningOverviewViewControllerWithDataCoordinator:(id)a3
{
  id v3;
  void *v4;
  id v5;
  __objc2_class **v6;
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = off_101197660;
  if (v5 != (id)5)
    v6 = off_101196D78;
  v7 = objc_msgSend(objc_alloc(*v6), "initWithDataCoordinator:", v3);

  return v7;
}

- (RoutePlanningOverviewViewController)initWithDataCoordinator:(id)a3
{
  id v4;
  RoutePlanningOverviewViewController *v5;
  RoutePlanningOverviewViewController *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RoutePlanningOverviewViewController;
  v5 = -[RoutePlanningOverviewViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataCoordinator, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v7, "registerObserver:", v6);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController dealloc](&v4, "dealloc");
}

- (RouteSearchViewController)routeSearchViewController
{
  return 0;
}

- (ErrorModeView)errorModeView
{
  ErrorModeView *errorModeView;
  ErrorModeView *v4;
  ErrorModeView *v5;

  errorModeView = self->_errorModeView;
  if (!errorModeView)
  {
    v4 = objc_alloc_init(ErrorModeView);
    v5 = self->_errorModeView;
    self->_errorModeView = v4;

    -[ErrorModeView setAutoresizingMask:](self->_errorModeView, "setAutoresizingMask:", 18);
    errorModeView = self->_errorModeView;
  }
  return errorModeView;
}

- (void)_prepareRideBookingForFirstUse
{
  RideBookingOutlineController *v3;
  void *v4;
  RideBookingOutlineController *v5;
  RideBookingOutlineController *rideBookingSource;
  id v7;

  if (sub_10048286C() && !self->_rideBookingSource)
  {
    v3 = [RideBookingOutlineController alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v5 = -[RideBookingOutlineController initWithCollectionView:](v3, "initWithCollectionView:", v4);
    rideBookingSource = self->_rideBookingSource;
    self->_rideBookingSource = v5;

    -[RideBookingOutlineController setDelegate:](self->_rideBookingSource, "setDelegate:", self);
    v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    -[RoutePlanningOutlineController setHideContent:](self->_rideBookingSource, "setHideContent:", objc_msgSend(v7, "hideContent"));

  }
}

- (void)viewDidLoad
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningOverviewViewController;
  -[ContaineeViewController viewDidLoad](&v14, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("ViewController"), &stru_1011EB268));
  -[RoutePlanningOverviewViewController setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v7);

  -[RoutePlanningOverviewViewController _setupSubviews](self, "_setupSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController _initialConstraints](self, "_initialConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v8);
  +[DynamicTypeWizard makeObject:performSelector:whenSizeCategoryChangesWithOrder:](DynamicTypeWizard, "makeObject:performSelector:whenSizeCategoryChangesWithOrder:", self, "_contentSizeCategoryDidChange", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v9, "addObserver:", self);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v10, "setupDataForObserver:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v11, "addObserver:selector:name:object:", self, "_resetCountOfRideOptionsBooked", UIApplicationDidEnterBackgroundNotification, 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v12, "addObserver:selector:name:object:", self, "_resetCountOfRideOptionsBooked", CFSTR("RidesharingDidRequestRideNotificationKey"), 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v13, "registerObserver:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningOverviewViewController;
  -[ContaineeViewController viewWillAppear:](&v10, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = (unint64_t)objc_msgSend(v4, "containerStyle");
  v6 = (v5 > 7) | (0x5Cu >> v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v7, "setAllowPersistentHighlight:", v6 & 1);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeCollection"));
  -[RoutePlanningOverviewViewController _updateDataSourceRouteCollection:](self, "_updateDataSourceRouteCollection:", v9);

  -[RoutePlanningOverviewViewController _loadGarage](self, "_loadGarage");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewDidDisappear:](&v4, "viewDidDisappear:", a3);
  -[RoutePlanningOverviewViewController _updateDataSourceRouteCollection:](self, "_updateDataSourceRouteCollection:", 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RoutePlanningOverviewViewController;
  -[ContaineeViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView superview](self->_errorModeView, "superview"));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView superview](self->_loadingModeView, "superview"));

    if (!v4)
      return;
  }
  -[RoutePlanningOverviewViewController _loadingAndErrorViewFrame](self, "_loadingAndErrorViewFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[ErrorModeView setFrame:](self->_errorModeView, "setFrame:");
  -[LoadingModeView setFrame:](self->_loadingModeView, "setFrame:", v6, v8, v10, v12);
}

- (CGRect)_loadingAndErrorViewFrame
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  CGFloat v12;
  id *p_errorModeView;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double Height;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "frame");
  v12 = v11;

  p_errorModeView = (id *)&self->_errorModeView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView superview](self->_errorModeView, "superview"));

  if (v14
    || (p_errorModeView = (id *)&self->_loadingModeView,
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView superview](self->_loadingModeView, "superview")),
        v15,
        v15))
  {
    objc_msgSend(*p_errorModeView, "fittingHeight");
    v17 = v16;
  }
  else
  {
    v17 = 0.0;
  }
  v27.origin.x = v5;
  v27.origin.y = v12;
  v27.size.width = v7;
  v27.size.height = v9;
  Height = CGRectGetHeight(v27);
  v28.origin.x = v5;
  v28.origin.y = v12;
  v28.size.width = v7;
  v28.size.height = v9;
  v19 = Height - CGRectGetMinY(v28);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v20, "bottomSafeOffset");
  v22 = v19 - v21;

  if (v17 <= v22)
    v23 = v22;
  else
    v23 = v17;
  v24 = v5;
  v25 = v12;
  v26 = v7;
  result.size.height = v23;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (void)didMoveToParentViewController:(id)a3
{
  int64_t v4;
  _BOOL8 v6;
  id v7;

  v4 = -[RoutePlanningOverviewViewController _currentSceneActivationState](self, "_currentSceneActivationState", a3);
  v6 = v4 != 2 && v4 != -1;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));
  objc_msgSend(v7, "setActive:", v6);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v9 = (unint64_t)objc_msgSend(v8, "containerStyle");
  if (v9 > 7 || ((1 << v9) & 0xA3) == 0)
    goto LABEL_5;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v11 = objc_msgSend(v10, "containeeLayout");

  if (v11 != (id)3)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v8, "wantsLayout:", 3);
LABEL_5:

  }
  v12.receiver = self;
  v12.super_class = (Class)RoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController didUpdateFocusInContext:withAnimationCoordinator:](&v12, "didUpdateFocusInContext:withAnimationCoordinator:", v6, v7);

}

- (void)updateTheme
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOverviewViewController;
  -[MapsThemeViewController updateTheme](&v3, "updateTheme");
  -[RoutePlanningOverviewViewController setRouteCellsHeight:](self, "setRouteCellsHeight:", -1.0);
}

- (int64_t)_currentSceneActivationState
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "windowScene"));

  if (v4)
    v5 = (int64_t)objc_msgSend(v4, "activationState");
  else
    v5 = -1;

  return v5;
}

- (void)_setupSubviews
{
  _RoutePlanningCollectionView *v3;
  void *v4;
  _RoutePlanningCollectionView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  ContainerHeaderView *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  TransportTypePicker *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  LoadingModeView *v39;
  void *v40;
  void *v41;
  LoadingModeView *v42;
  void *v43;
  RoutePlanningOutlineRootController *v44;
  void *v45;
  RoutePlanningOutlineRootController *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v3 = [_RoutePlanningCollectionView alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningOutlineController defaultCollectionViewLayout](RoutePlanningOutlineController, "defaultCollectionViewLayout"));
  v5 = -[_RoutePlanningCollectionView initWithFrame:collectionViewLayout:](v3, "initWithFrame:collectionViewLayout:", v4, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[RoutePlanningOverviewViewController setCollectionView:](self, "setCollectionView:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setBackgroundColor:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v9, "setAlwaysBounceVertical:", 1);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v10, "setRemembersLastFocusedIndexPath:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v11, "setAllowsMultipleSelection:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "setPreservesSuperviewLayoutMargins:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v14 = (objc_class *)objc_opt_class(self);
  v15 = NSStringFromClass(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  objc_msgSend(v13, "setAccessibilityIdentifier:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v17, "_setVisibleRectEdgeInsets:", -10000.0, 0.0, -10000.0, 0.0);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v18, "addSubview:", v19);

  if (sub_1002A8AA0(self) == 5)
    v20 = 16.0;
  else
    v20 = 12.0;
  v21 = -[ContainerHeaderView initWithHairlineMargin:]([ContainerHeaderView alloc], "initWithHairlineMargin:", v20);
  -[RoutePlanningOverviewViewController setContainerHeaderView:](self, "setContainerHeaderView:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v23, "setDelegate:", self);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  LODWORD(v25) = 1148846080;
  objc_msgSend(v24, "setContentCompressionResistancePriority:forAxis:", 1, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v28 = (objc_class *)objc_opt_class(v27);
  v29 = NSStringFromClass(v28);
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("RoutePlanning"), "stringByAppendingString:", v30));
  objc_msgSend(v26, "setAccessibilityIdentifier:", v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v32, "addSubview:", v33);

  if (-[RoutePlanningOverviewViewController _supportsTransportTypePicker](self, "_supportsTransportTypePicker"))
  {
    v34 = objc_alloc_init(TransportTypePicker);
    -[RoutePlanningOverviewViewController setTransportTypePicker:](self, "setTransportTypePicker:", v34);

    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    objc_msgSend(v35, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    objc_msgSend(v36, "setDelegate:", self);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    LODWORD(v38) = 1148846080;
    objc_msgSend(v37, "setContentCompressionResistancePriority:forAxis:", 1, v38);

  }
  v39 = [LoadingModeView alloc];
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Loading ..."), CFSTR("localized string not found"), 0));
  v42 = -[LoadingModeView initWithTitle:](v39, "initWithTitle:", v41);
  -[RoutePlanningOverviewViewController setLoadingModeView:](self, "setLoadingModeView:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController loadingModeView](self, "loadingModeView"));
  objc_msgSend(v43, "setAutoresizingMask:", 18);

  v44 = [RoutePlanningOutlineRootController alloc];
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v46 = -[RoutePlanningOutlineRootController initWithCollectionView:](v44, "initWithCollectionView:", v45);
  -[RoutePlanningOverviewViewController setRootController:](self, "setRootController:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v48, "setDataCoordinator:", v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v49, "setRouteCellDelegate:", self);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v50, "setRouteCreationDelegate:", self);

  v51 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v51, "setRouteSelectionDelegate:", self);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v53, "setTransitPayActionDelegate:", v52);

  v54 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v54, "setHeaderSize:", 0);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v55, "setShouldCenterButtonVertically:", 0);

  v56 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  objc_msgSend(v56, "setHairLineAlpha:", 0.0);

}

- (id)_initialConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:", v7));
  -[RoutePlanningOverviewViewController setCollectionViewToBottomConstraint:](self, "setCollectionViewToBottomConstraint:", v8);

  if (-[RoutePlanningOverviewViewController isCollectionViewVisible](self, "isCollectionViewVisible"))
    v9 = 749.0;
  else
    v9 = 50.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionViewToBottomConstraint](self, "collectionViewToBottomConstraint"));
  *(float *)&v11 = v9;
  objc_msgSend(v10, "setPriority:", v11);

  v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  LODWORD(v15) = 1148846080;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_maps_constraintsEqualToEdgesOfView:priority:", v14, v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allConstraints"));
  objc_msgSend(v12, "addObjectsFromArray:", v17);

  return v12;
}

- (void)_loadGarage
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1004C7054;
  v3[3] = &unk_1011AD100;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "virtualGarageGetGarageWithReply:", v3);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)floatingControlsOptions
{
  if (sub_1002A8AA0(self) == 5)
    return 255;
  else
    return 267;
}

- (void)willChangeLayout:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RoutePlanningOverviewViewController;
  -[ContaineeViewController willChangeLayout:](&v14, "willChangeLayout:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v6 = objc_msgSend(v5, "containeeLayout");

  if ((((unint64_t)v6 - 1) | (a3 - 3)) <= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", 3010, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));

    if (v9 == v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rideOptionStateObserver"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "analyticsBookingSession"));
      objc_msgSend(v13, "setComparedRideOptions:", 1);

    }
  }
}

- (void)shouldDismissForHorizontalSwipe_nonUIKitCardsOnly
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v3, "closeRoutePlanningViewController:withSender:", self, 0);

}

- (BOOL)supportTapToHide
{
  return 0;
}

- (double)heightForLayout:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  char *v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v5 = sub_1004318FC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v11 = 136315650;
    v12 = "-[RoutePlanningOverviewViewController heightForLayout:]";
    v13 = 2080;
    v14 = "RoutePlanningOverviewViewController.m";
    v15 = 1024;
    v16 = 612;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v11, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v7 = sub_1004318FC();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v11, 0xCu);

    }
  }
  -[RoutePlanningOverviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0.0;
}

- (double)_heightForFullLayout
{
  double result;

  -[RoutePlanningOverviewViewController heightForLayout:](self, "heightForLayout:", 3);
  return result;
}

- (BOOL)allowsLongPressToMarkLocation
{
  return (MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(self, a2) & 1) != 0
      || (MapsFeature_IsEnabled_Maps420() & 1) != 0
      || (MapsFeature_IsEnabled_Maps182() & 1) != 0
      || sub_1002A8AA0(self) == 5;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t v18[16];

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v5, "platformController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentSession"));

  v8 = objc_opt_class(NavigationSession);
  LOBYTE(v5) = objc_opt_isKindOfClass(v7, v8);

  if ((v5 & 1) != 0 && v7)
  {
    v9 = sub_10043214C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "User tapped route planning close button but we are currently in navigation; ignoring",
        v18,
        2u);
    }

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v11, "captureUserAction:onTarget:eventValue:", 4, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
    objc_msgSend(v12, "cancelCapturingAnalytics");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v13, "viewControllerGoPreviousState:withSender:", self, v4);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
    objc_msgSend(v14, "tableViewDismissed");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "rideOptionStateObserver"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "analyticsBookingSession"));
    objc_msgSend(v17, "endSessionOnView:state:", 1, 2);

    -[RoutePlanningOverviewViewController _resetCountOfRideOptionsBooked](self, "_resetCountOfRideOptionsBooked");
  }

}

- (double)_cardHeightMinusTableViewHeight
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  -[ContaineeViewController headerHeight](self, "headerHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v5, "bottomSafeOffset");
  v7 = v4 + v6;

  return v7;
}

- (CGRect)_rectOfRowToKeepVisible
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "transportType");

  if (v4 == (id)4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionViewLayout"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layoutAttributesForItemAtIndexPath:", v5));

    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "platformController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentSession"));

    v20 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      v21 = v19;
    else
      v21 = 0;
    v22 = v21;

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "currentRouteCollection"));

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRoute"));
    objc_msgSend(v5, "mostImportantRectToFrameWithSelectedRoute:", v23);
    v10 = v24;
    v12 = v25;
    v14 = v26;
    v16 = v27;

  }
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v28, "bottomSafeOffset");
  v30 = v16 + v29;

  v31 = v10;
  v32 = v12;
  v33 = v14;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  unsigned int v3;
  id v4;

  v3 = (a3 > 7) | (0x5Cu >> a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v4, "setAllowPersistentHighlight:", v3 & 1);

}

- (void)willBecomeCurrent:(BOOL)a3
{
  void *v4;
  unint64_t v5;
  unsigned int v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningOverviewViewController;
  -[ContaineeViewController willBecomeCurrent:](&v8, "willBecomeCurrent:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v5 = (unint64_t)objc_msgSend(v4, "containerStyle");
  v6 = (v5 > 7) | (0x5Cu >> v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  objc_msgSend(v7, "setAllowPersistentHighlight:", v6 & 1);

  if (self->_hasPushedRouteCreation)
  {
    self->_hasPushedRouteCreation = 0;
    self->_restoreRoutePlanningAfterRouteCreation = 1;
  }
}

- (void)didBecomeCurrent
{
  void *v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningOverviewViewController;
  -[ContaineeViewController didBecomeCurrent](&v8, "didBecomeCurrent");
  if (self->_restoreRoutePlanningAfterRouteCreation)
  {
    self->_restoreRoutePlanningAfterRouteCreation = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController _maps_platformController](self, "_maps_platformController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSession"));
    v5 = objc_opt_class(NavigationSession);
    isKindOfClass = objc_opt_isKindOfClass(v4, v5);

    if ((isKindOfClass & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      objc_msgSend(v7, "resume");

    }
  }
}

- (void)viewSafeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RoutePlanningOverviewViewController;
  -[RoutePlanningOverviewViewController viewSafeAreaInsetsDidChange](&v3, "viewSafeAreaInsetsDidChange");
  -[RoutePlanningOverviewViewController _updateLoadingViewBottomInset](self, "_updateLoadingViewBottomInset");
}

- (int64_t)observedRoutePlanningData
{
  return 23676;
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateResolvedWaypointSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v5 = a3;
  v6 = objc_alloc((Class)CLLocation);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypointSet"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "origin"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latLng"));
  objc_msgSend(v8, "lat");
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypointSet"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "origin"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "latLng"));
  objc_msgSend(v13, "lng");
  v15 = objc_msgSend(v6, "initWithLatitude:longitude:", v10, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "rideOptionStateObserver"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "analyticsBookingSession"));
  objc_msgSend(v18, "setOrigin:", v15);

  v19 = objc_alloc((Class)CLLocation);
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypointSet"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "destination"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "latLng"));
  objc_msgSend(v21, "lat");
  v23 = v22;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "resolvedWaypointSet"));

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "destination"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "latLng"));
  objc_msgSend(v26, "lng");
  v28 = objc_msgSend(v19, "initWithLatitude:longitude:", v23, v27);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rideOptionStateObserver"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "analyticsBookingSession"));
  objc_msgSend(v31, "setDestination:", v28);

  -[RoutePlanningOverviewViewController _updateDigitalIssuanceStateWithUpdateFlag:](self, "_updateDigitalIssuanceStateWithUpdateFlag:", 4);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateOriginName:(id)a4 destinationName:(id)a5
{
  -[RoutePlanningOverviewViewController setOriginName:](self, "setOriginName:", a4);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateTransportType:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
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
  void *v36;
  void *v37;
  void *v38;
  id v39;

  v39 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "dismissRoutePlanningPlaceCardIfNeeded");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    objc_msgSend(v8, "setSelectedType:", a4);

  }
  v9 = sub_10048286C();
  if (a4 != 4 || !v9)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rideOptionStateObserver"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "analyticsBookingSession"));
    objc_msgSend(v15, "endSessionOnView:state:", 1, 2);

    -[RoutePlanningOverviewViewController _resetCountOfRideOptionsBooked](self, "_resetCountOfRideOptionsBooked");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "routeCollection"));
    objc_msgSend(v16, "updateWithTransportType:routeCollection:isInACustomRouteRegion:", a4, v17, objc_msgSend(v39, "inACustomRouteRegion"));

    if (a4 == 3)
      -[RoutePlanningOverviewViewController _startReferenceDateUpdates](self, "_startReferenceDateUpdates");
    else
      -[RoutePlanningOverviewViewController _stopReferenceDateUpdates](self, "_stopReferenceDateUpdates");
    -[RoutePlanningOverviewViewController _refreshContactsDisplayForAutomaticTripSharing](self, "_refreshContactsDisplayForAutomaticTripSharing");
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "dataSource"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    if (v19 == v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "delegate"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));

      if (v22 == v23)
        goto LABEL_16;
    }
    else
    {

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
    objc_msgSend(v24, "setCollectionView:", 0);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v26, "setCollectionView:", v25);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "headerView"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v29, "setHeaderView:", v28);

    -[RoutePlanningOverviewViewController _scrollToCellToShowAtMediumLayoutAnimated:](self, "_scrollToCellToShowAtMediumLayoutAnimated:", -[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip") ^ 1);
    goto LABEL_16;
  }
  -[RoutePlanningOverviewViewController _stopReferenceDateUpdates](self, "_stopReferenceDateUpdates");
  -[RoutePlanningOverviewViewController _prepareRideBookingForFirstUse](self, "_prepareRideBookingForFirstUse");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
  if (v11 != v12)
  {

LABEL_15:
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v33, "setCollectionView:", 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
    objc_msgSend(v35, "setCollectionView:", v34);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "headerView"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
    objc_msgSend(v38, "setHeaderView:", v37);

    goto LABEL_16;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "delegate"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));

  if (v31 != v32)
    goto LABEL_15;
LABEL_16:
  -[RoutePlanningOverviewViewController _refreshTimingDisplay](self, "_refreshTimingDisplay");
  -[RoutePlanningOverviewViewController _refreshOptionsVisibility](self, "_refreshOptionsVisibility");
  -[RoutePlanningOverviewViewController _refreshContentInset](self, "_refreshContentInset");

}

- (void)_refreshOptionsVisibility
{
  -[RoutePlanningOverviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRideBookingRideOptionState:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
  objc_msgSend(v6, "configureWithRideBookingRideOptionState:", v5);

}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRequestState:(int64_t)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v6, "refreshRoutePlanningTimingIfNeeded");

  -[RoutePlanningOverviewViewController _updateForEquivalentRequestState:](self, "_updateForEquivalentRequestState:", a4);
}

- (void)_updateRidesharingAnalytics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));

  if (v4 == v5)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rideOptionStateObserver"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rideOptionState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rideOptionStatusMap"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v14)
            objc_enumerationMutation(v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "rideOptions"));
          v13 += (uint64_t)objc_msgSend(v16, "count");

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "rideOptionStateObserver"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "analyticsBookingSession"));
    objc_msgSend(v19, "captureRideOptionCount:", v13);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "rideOptionStateObserver"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "analyticsBookingSession"));
    objc_msgSend(v22, "captureView:", 1);

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRouteCollection:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenuSystem mainSystem](UIMenuSystem, "mainSystem"));
  objc_msgSend(v7, "setNeedsRebuild");

  -[RoutePlanningOverviewViewController setRouteCellsHeight:](self, "setRouteCellsHeight:", -1.0);
  if (objc_msgSend(v6, "count"))
  {
    +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
    v8 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(v16, "desiredTransportType");
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
      v12 = objc_msgSend(v11, "selectedType");

      if (v10 != v12)
      {
        v13 = objc_msgSend(v16, "desiredTransportType");
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
        objc_msgSend(v14, "setSelectedType:", v13);

      }
    }
    -[RoutePlanningOverviewViewController _refreshTimingDisplay](self, "_refreshTimingDisplay");
    -[RoutePlanningOverviewViewController _refreshContactsDisplayForAutomaticTripSharing](self, "_refreshContactsDisplayForAutomaticTripSharing");
    -[RoutePlanningOverviewViewController _updateDataSourceRouteCollection:](self, "_updateDataSourceRouteCollection:", v6);
    -[RoutePlanningOverviewViewController _scrollToCellToShowAtMediumLayoutAnimated:](self, "_scrollToCellToShowAtMediumLayoutAnimated:", -[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip") ^ 1);
    -[RoutePlanningOverviewViewController _setupAdvisoryFooterView](self, "_setupAdvisoryFooterView");
    -[RoutePlanningOverviewViewController _animateUpdatingHeightForSingleTrip](self, "_animateUpdatingHeightForSingleTrip");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v15, "postNotificationName:object:", CFSTR("MapsRoutePlanningShowingRoutesNotification"), self);

  }
}

- (void)routePlanningDataCoordinator:(id)a3 didUpdateRoutes:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a4;
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateSummary"), 0, 0);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController", (_QWORD)v13));
        objc_msgSend(v12, "reloadExistingCellForRoute:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateSummary"), 0, 0);
}

- (void)_finishLaunchingIntoNavIfPossible:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  _BYTE v8[56];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = objc_msgSend(v5, "isInNavigatingState");

  v7 = -[RoutePlanningOverviewViewController _hasModalViewControllerInTransition](self, "_hasModalViewControllerInTransition");
  if ((v6 & 1) == 0 && (v7 & 1) == 0)
  {
    +[StartNavigationDetailsBuilder defaultNavigationDetailsOptions](StartNavigationDetailsBuilder, "defaultNavigationDetailsOptions");
    -[RoutePlanningOverviewViewController _startNavigationForRouteCollection:navigationDetailsOptions:](self, "_startNavigationForRouteCollection:navigationDetailsOptions:", v4, v8);
  }

}

- (BOOL)_hasModalViewControllerInTransition
{
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController presentedViewController](self, "presentedViewController"));
  if ((objc_msgSend(v3, "isBeingPresented") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController presentedViewController](self, "presentedViewController"));
    v4 = objc_msgSend(v5, "isBeingDismissed");

  }
  return v4;
}

- (void)_updateDataSourceRouteCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v6 = objc_msgSend(v5, "transportType");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v8, "updateWithTransportType:routeCollection:isInACustomRouteRegion:", v6, v4, objc_msgSend(v7, "inACustomRouteRegion"));

}

- (void)_refreshTimingDisplay
{
  -[RoutePlanningOverviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_refreshContentInset
{
  -[RoutePlanningOverviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_refreshContactsDisplayForAutomaticTripSharing
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  char *v20;
  const __CFString *v21;
  int v22;
  id v23;
  __int16 v24;
  const __CFString *v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "automaticSharingContacts"));

  if (-[RoutePlanningOverviewViewController _shouldPermitAutomaticSharingContacts](self, "_shouldPermitAutomaticSharingContacts"))
  {
    v11 = sub_10043237C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v22 = 134217984;
      v23 = objc_msgSend(v10, "count");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "RoutePlanningOverviewViewController updating routes list with %lu autosharing contacts", (uint8_t *)&v22, 0xCu);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v14 = v13;
    v15 = v10;
LABEL_15:
    objc_msgSend(v13, "setAutomaticSharingContacts:", v15);

    goto LABEL_16;
  }
  if (objc_msgSend(v10, "count"))
  {
    v16 = sub_10043237C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = objc_msgSend(v10, "count");
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v20 = (char *)objc_msgSend(v19, "transportType");
      if ((unint64_t)(v20 - 1) > 4)
        v21 = CFSTR("Undefined");
      else
        v21 = *(&off_1011B8F30 + (_QWORD)(v20 - 1));
      v22 = 134218242;
      v23 = v18;
      v24 = 2112;
      v25 = v21;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "RoutePlanningOverviewViewController have %lu autosharing contacts but incompatible transport type: %@", (uint8_t *)&v22, 0x16u);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v14 = v13;
    v15 = &__NSArray0__struct;
    goto LABEL_15;
  }
LABEL_16:

}

- (BOOL)_shouldPermitAutomaticSharingContacts
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v3 = MSPSharedTripSharingSupportedForTransportType(objc_msgSend(v2, "transportType"));

  return v3;
}

- (void)_presentEbikeOptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "transportType");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v4 = objc_msgSend(v5, "desiredTransportType");

  }
  if (v4 == (id)5)
  {
    if (sub_1003C76E0())
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v6, "presentRoutePlanningViewType:", 8);

    }
  }
}

- (void)_presentRouteOptions
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "transportType");

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v4 = objc_msgSend(v5, "desiredTransportType");

  }
  v6 = 17099;
  switch((unint64_t)v4)
  {
    case 0uLL:
      return;
    case 1uLL:
      v6 = 3036;
      goto LABEL_7;
    case 3uLL:
      v6 = 3035;
      goto LABEL_7;
    case 5uLL:
      v6 = 3048;
      goto LABEL_7;
    default:
LABEL_7:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", v6, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

      v8 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v8, "presentRoutePlanningViewType:", 4);

      return;
  }
}

- (void)_markFeatureDiscoveryShown
{
  id v3;

  if (-[RoutePlanningOverviewViewController _areWaypointsInCountryCode:](self, "_areWaypointsInCountryCode:", CFSTR("FR")))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v3, "markFeatureDiscoveryShown");

  }
}

- (BOOL)_areWaypointsInCountryCode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned int v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController", 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeCollection"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentRoute"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "waypoints"));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "mapItemStorage"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "_bestAvailableCountryCode"));
        v15 = objc_msgSend(v14, "isEqual:", v4);

        if (!v15)
        {
          v16 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v10)
        continue;
      break;
    }
  }
  v16 = 1;
LABEL_11:

  return v16;
}

- (void)headerViewButtonTapped:(id)a3 buttonType:(unint64_t)a4
{
  id v5;

  v5 = a3;
  -[RoutePlanningOverviewViewController _markFeatureDiscoveryShown](self, "_markFeatureDiscoveryShown");
  -[RoutePlanningOverviewViewController handleDismissAction:](self, "handleDismissAction:", v5);

}

- (void)dataSourceRequiresReload:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataSource"));

  if (v6 == v4)
  {
    -[RoutePlanningOverviewViewController _updateRidesharingAnalytics](self, "_updateRidesharingAnalytics");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    objc_msgSend(v7, "_maps_reloadDataWithoutFocus");

    -[RoutePlanningOverviewViewController _animateUpdatingHeightForSingleTrip](self, "_animateUpdatingHeightForSingleTrip");
  }
}

- (void)dataSource:(id)a3 requiresReloadOfSection:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  _QWORD v16[5];
  _QWORD v17[6];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));

  if (v7 != v6)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[RoutePlanningOverviewViewController dataSource:requiresReloadOfSection:]";
      v20 = 2080;
      v21 = "RoutePlanningOverviewViewController.m";
      v22 = 1024;
      v23 = 987;
      v24 = 2080;
      v25 = "dataSource == self.rideBookingSource";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v13 = sub_1004318FC();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));

  if (v9 == v6)
  {
    -[RoutePlanningOverviewViewController _updateRidesharingAnalytics](self, "_updateRidesharingAnalytics");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v16[4] = self;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1004C9098;
    v17[3] = &unk_1011AD518;
    v17[4] = self;
    v17[5] = a4;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1004C90F8;
    v16[3] = &unk_1011AE8F8;
    objc_msgSend(v10, "performBatchUpdates:completion:", v17, v16);

  }
}

- (void)dataSource:(id)a3 requiresDeletionOfIndexSet:(id)a4 reloadOfIndexSet:(id)a5 insertionOfIndexSet:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));

  if (v14 != v10)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v28 = "-[RoutePlanningOverviewViewController dataSource:requiresDeletionOfIndexSet:reloadOfIndexSet:insertionOfIndexSet:]";
      v29 = 2080;
      v30 = "RoutePlanningOverviewViewController.m";
      v31 = 1024;
      v32 = 1004;
      v33 = 2080;
      v34 = "dataSource == self.rideBookingSource";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dataSource"));

  if (v16 == v10)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1004C93A8;
    v23[3] = &unk_1011AF1B0;
    v23[4] = self;
    v24 = v12;
    v25 = v11;
    v26 = v13;
    objc_msgSend(v17, "performBatchUpdates:completion:", v23, &stru_1011B8D88);

  }
}

- (void)didTapRouteCreationButtonForCell:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CLLocationDegrees v10;
  CLLocationDegrees v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  CLLocationDegrees v20;
  CLLocationDegrees v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  CLLocationCoordinate2D v35;
  CLLocationCoordinate2D v36;

  if (!self->_hasPushedRouteCreation)
  {
    v4 = sub_10043214C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Pressed enter route creation (new route)", buf, 2u);
    }

    self->_hasPushedRouteCreation = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedWaypointSet"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "origin"));

    if (v8
      && (objc_msgSend(v8, "coordinate"),
          v10 = v9,
          objc_msgSend(v8, "coordinate"),
          v35 = CLLocationCoordinate2DMake(v10, v11),
          CLLocationCoordinate2DIsValid(v35)))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mkMapItem"));
      v13 = sub_10043214C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortDescription"));
        *(_DWORD *)buf = 138477827;
        v34 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Providing a pre-selected origin: %{private}@", buf, 0xCu);

      }
    }
    else
    {
      v16 = sub_10043214C();
      v14 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Origin doesn't have a valid coordinate to use", buf, 2u);
      }
      v12 = 0;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "resolvedWaypointSet"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "destination"));

    if (v18
      && (objc_msgSend(v18, "coordinate"),
          v20 = v19,
          objc_msgSend(v18, "coordinate"),
          v36 = CLLocationCoordinate2DMake(v20, v21),
          CLLocationCoordinate2DIsValid(v36)))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "mkMapItem"));
      v23 = sub_10043214C();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "shortDescription"));
        *(_DWORD *)buf = 138477827;
        v34 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Providing a pre-selected destination: %{private}@", buf, 0xCu);

      }
    }
    else
    {
      v26 = sub_10043214C();
      v24 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Destination doesn't have a valid coordinate to use", buf, 2u);
      }
      v22 = 0;
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v27, "captureUserAction:onTarget:eventValue:", 465, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "appCoordinator"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1004C97CC;
    v31[3] = &unk_1011AC860;
    v32 = v6;
    v30 = v6;
    objc_msgSend(v29, "enterRouteCreationWithRoute:originMapItem:destinationMapItem:userInfo:completion:", 0, v12, v22, 0, v31);

  }
}

- (void)didTapGoButtonForRouteOverviewCell:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  char *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  NSObject *v48;
  id v49;
  NSObject *v50;
  char *v51;
  int v52;
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const char *v59;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v6 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  v7 = sub_10043214C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v52 = 138412290;
    v53 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Go button was tapped at cell indexPath: %@", (uint8_t *)&v52, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "platformController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "auxiliaryTasksManager"));
  v12 = objc_msgSend(v11, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  objc_msgSend(v13, "cancelNavigationAutoLaunchIfNeccessary");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataSource"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));

  if (v15 == v16)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "routeCollection"));

    if (!-[NSObject count](v25, "count"))
    {
      v47 = sub_1004318FC();
      v48 = objc_claimAutoreleasedReturnValue(v47);
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        v52 = 136315906;
        v53 = "-[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:]";
        v54 = 2080;
        v55 = "RoutePlanningOverviewViewController.m";
        v56 = 1024;
        v57 = 1058;
        v58 = 2080;
        v59 = "routeCollection.count > 0";
        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v52, 0x26u);
      }

      if (sub_100A70734())
      {
        v49 = sub_1004318FC();
        v50 = objc_claimAutoreleasedReturnValue(v49);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          v51 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v52 = 138412290;
          v53 = v51;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);

        }
      }
    }
    if (-[NSObject count](v25, "count"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
      v29 = objc_msgSend(v28, "indexOfRouteForRowAtIndexPath:", v6);

      if (v29 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = sub_10043214C();
        v31 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v52 = 138412290;
          v53 = v6;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not find a route at indexPath %@", (uint8_t *)&v52, 0xCu);
        }

        v32 = sub_1004318FC();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v52 = 136315650;
          v53 = "-[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:]";
          v54 = 2080;
          v55 = "RoutePlanningOverviewViewController.m";
          v56 = 1024;
          v57 = 1063;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v52, 0x1Cu);
        }

        if (!sub_100A70734())
          goto LABEL_29;
        v34 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v34);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v35 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v52 = 138412290;
          v53 = v35;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);

        }
        goto LABEL_22;
      }
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      objc_msgSend(v44, "updateCurrentRouteIndex:", v29);

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "routeCollection"));

      -[RoutePlanningOverviewViewController _doPromptsAndStartNavForRouteCollection:](self, "_doPromptsAndStartNavForRouteCollection:", v46);
      v25 = v46;
    }
    else
    {
      v42 = sub_10043214C();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v52 = 138477827;
        v53 = (const char *)v25;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_ERROR, "Attempt to start navigation but the routes data source doesn't have any routes: %{private}@", (uint8_t *)&v52, 0xCu);
      }

    }
    -[RoutePlanningOverviewViewController _markFeatureDiscoveryShown](self, "_markFeatureDiscoveryShown");
    goto LABEL_29;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dataSource"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));

  if (v18 == v19)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "dataSource"));

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject outlineSectionAtIndex:](v25, "outlineSectionAtIndex:", objc_msgSend(v6, "section")));
    objc_msgSend(v37, "didSelectItemAtIndexPath:", v6);
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v39 = -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "section")));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringValue"));
    objc_msgSend(v38, "captureUserAction:onTarget:eventValue:", 14003, v39, v41);

    goto LABEL_29;
  }
  v20 = sub_10043214C();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v52) = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Data source is neither route planning nor ride booking; ignoring go button tap",
      (uint8_t *)&v52,
      2u);
  }

  v22 = sub_1004318FC();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    v52 = 136315650;
    v53 = "-[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:]";
    v54 = 2080;
    v55 = "RoutePlanningOverviewViewController.m";
    v56 = 1024;
    v57 = 1084;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v52, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_29:

      goto LABEL_30;
    }
    v26 = objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v52 = 138412290;
    v53 = (const char *)v26;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v52, 0xCu);
LABEL_22:

    goto LABEL_29;
  }
LABEL_30:

}

- (void)_doPromptsAndStartNavForRouteCollection:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (SBUIIsSystemApertureEnabled(v4))
  {
    -[RoutePlanningOverviewViewController _promptForSimulationAndStartNavigationForRouteCollection:](self, "_promptForSimulationAndStartNavigationForRouteCollection:", v4);
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1004C9F7C;
    v5[3] = &unk_1011B8DB0;
    v5[4] = self;
    v6 = v4;
    +[PushNotificationPrompt checkShouldRepeatForUserAction:](PushNotificationPrompt, "checkShouldRepeatForUserAction:", v5);

  }
}

- (void)_promptForSimulationAndStartNavigationForRouteCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE location[12];
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;

  v4 = a3;
  if (!v4)
  {
    v22 = sub_1004318FC();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[RoutePlanningOverviewViewController _promptForSimulationAndStartNavigationForRouteCollection:]";
      v38 = 2080;
      v39 = "RoutePlanningOverviewViewController.m";
      v40 = 1024;
      v41 = 1117;
      v42 = 2080;
      v43 = "routeCollection != nil";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", location, 0x26u);
    }

    if (sub_100A70734())
    {
      v24 = sub_1004318FC();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController _maps_platformController](self, "_maps_platformController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "currentSession"));
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));
    if ((-[NSObject isMultipointRoute](v9, "isMultipointRoute") & 1) == 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject origin](v9, "origin"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "geoMapItem"));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject destination](v9, "destination"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "geoMapItem"));

      if (v11 && v13)
      {
        v14 = -[NSObject transportType](v9, "transportType");
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsSuggestionsPredictor sharedPredictor](MapsSuggestionsPredictor, "sharedPredictor"));
        v16 = MapsSuggestionsMapItemConvertIfNeeded(v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        v18 = MapsSuggestionsMapItemConvertIfNeeded(v13);
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        objc_msgSend(v15, "captureActualTransportationMode:originMapItem:destinationMapItem:", v14, v17, v19);

      }
    }
    objc_initWeak((id *)location, self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));
    v21 = objc_msgSend(v20, "isNavigationTracePlayback");
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1004CA624;
    v34[3] = &unk_1011B8DD8;
    objc_copyWeak(&v36, (id *)location);
    v35 = v4;
    +[NavigationSimulationPromptController promptIfNeededForSimulationForRoute:navigationTracePlayback:continueWithOptions:](NavigationSimulationPromptController, "promptIfNeededForSimulationForRoute:navigationTracePlayback:continueWithOptions:", v9, v21, v34);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)location);
  }
  else
  {
    v27 = sub_1004318FC();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315906;
      *(_QWORD *)&location[4] = "-[RoutePlanningOverviewViewController _promptForSimulationAndStartNavigationForRouteCollection:]";
      v38 = 2080;
      v39 = "RoutePlanningOverviewViewController.m";
      v40 = 1024;
      v41 = 1121;
      v42 = 2080;
      v43 = "routePlanningSession != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", location, 0x26u);
    }

    if (sub_100A70734())
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)location = 138412290;
        *(_QWORD *)&location[4] = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", location, 0xCu);

      }
    }
    v32 = sub_10043214C();
    v9 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)location = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Attempt to go from route planning to navigation without a currently active RoutePlanningSession", location, 2u);
    }
  }

}

- (void)_startNavigationForRouteCollection:(id)a3 navigationDetailsOptions:(NavigationDetailsOptions *)a4
{
  id v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];
  unint64_t navigationModeContext;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v8 = *(_OWORD *)&a4->guidanceType;
  v9[0] = *(_OWORD *)&a4->shouldSimulateLocations;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a4->isReconnecting;
  navigationModeContext = a4->navigationModeContext;
  objc_msgSend(v7, "viewController:startNavigationWithRouteCollection:navigationDetailsOptions:", self, v6, v9);

}

- (void)didTapDetailsButtonForRouteOverviewCell:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));

  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "indexPathForCell:", v16));

    v9 = sub_1002A8AA0(self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v11 = v10;
    if (v9 == 5)
    {
      objc_msgSend(v10, "toggleStepsExpansionForRouteAtIndexPath:", v8);
    }
    else
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeForRowAtIndexPath:", v8));

      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
        objc_msgSend(v13, "updateCurrentRoute:", v12);

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
        objc_msgSend(v14, "presentRoutePlanningViewType:", 2);

        v11 = (void *)v12;
      }
      else
      {
        v11 = 0;
      }
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v15, "captureUserAction:onTarget:eventValue:", 3004, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  }
}

- (void)didTapAutomaticSharingButtonForRouteOverviewCell:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate", a3));
  objc_msgSend(v3, "presentRoutePlanningViewType:", 7);

}

- (void)dataSource:(id)a3 didSelectRowForRoute:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (-[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRoute"));
    v10 = objc_msgSend(v6, "isEqual:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v11, "presentRoutePlanningViewType:", 2);

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 3004, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);
LABEL_8:

      goto LABEL_9;
    }
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));

  if (v13 == v19)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v14, "dismissRoutePlanningPlaceCardIfNeeded");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    objc_msgSend(v15, "updateCurrentRoute:", v6);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v17 = objc_msgSend(v16, "allowsPersistentHighlight");

    if ((v17 & 1) == 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v18, "wantsLayout:", 2);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:routeIndex:", 3015, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0, objc_msgSend(v6, "_maps_routeIndex"));
    goto LABEL_8;
  }
LABEL_9:

}

- (BOOL)_supportsTransportTypePicker
{
  return 1;
}

- (void)transportTypePicker:(id)a3 typeSelected:(int64_t)a4
{
  -[RoutePlanningOverviewViewController _updateToTransportType:](self, "_updateToTransportType:", a4);
}

- (void)_updateToTransportType:(int64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  const __CFString *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v6 = objc_msgSend(v5, "transportType");

  if (v6 != (id)a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    if ((unint64_t)a3 > 5)
      v8 = 3012;
    else
      v8 = dword_100E3769C[a3];
    objc_msgSend(v7, "captureUserAction:onTarget:eventValue:", v8, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  objc_msgSend(v9, "updateTransportType:", a3);

  -[RoutePlanningOverviewViewController _refreshTimingDisplay](self, "_refreshTimingDisplay");
  -[RoutePlanningOverviewViewController _refreshOptionsVisibility](self, "_refreshOptionsVisibility");
  -[RoutePlanningOverviewViewController _refreshContentInset](self, "_refreshContentInset");
  -[RoutePlanningOverviewViewController _refreshSelectedVehicleDisplay](self, "_refreshSelectedVehicleDisplay");
  if (sub_1002A8AA0(self) == 5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "updateHeightForCurrentLayout");

  }
  v11 = sub_10043214C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 4)
      v13 = CFSTR("Undefined");
    else
      v13 = *(&off_1011B8F30 + a3 - 1);
    v19 = 138412290;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "User manually changed the transport type: %@", (uint8_t *)&v19, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "platformController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "auxiliaryTasksManager"));
  v17 = objc_msgSend(v16, "auxilaryTaskForClass:", objc_opt_class(NavigationStateMonitoringTask));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  objc_msgSend(v18, "cancelNavigationAutoLaunchIfNeccessary");
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator", a3));
  v5 = objc_msgSend(v4, "transportType");

  switch((unint64_t)v5)
  {
    case 0uLL:
    case 4uLL:
      v6 = sub_1004318FC();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315650;
        v16 = "-[RoutePlanningOverviewViewController didTapReportAProblemButtonOnRoutePlanningFooterView:]";
        v17 = 2080;
        v18 = "RoutePlanningOverviewViewController.m";
        v19 = 1024;
        v20 = 1250;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v15, 0x1Cu);
      }

      if (sub_100A70734())
      {
        v8 = sub_1004318FC();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v15 = 138412290;
          v16 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

        }
      }
      goto LABEL_8;
    case 1uLL:
      v11 = 301;
      break;
    case 2uLL:
      v11 = 302;
      break;
    case 3uLL:
      v11 = 303;
      break;
    case 5uLL:
      v11 = 305;
      break;
    default:
LABEL_8:
      v11 = 0;
      break;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v12, "captureUserAction:onTarget:eventValue:", 5013, v11, 0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "rapPresenter"));
  objc_msgSend(v14, "presentReportAProblemForRouteFromEntryPoint:", v11);

}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  if (v5 == v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v8 = objc_msgSend(v7, "transportType");

    if (v8 != (id)3)
      return;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v9, "reloadVisibleRouteCells");
  }
  else
  {

  }
}

- (void)_startReferenceDateUpdates
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BOOL8 v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  id v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  v4 = objc_msgSend(v3, "transportType");

  if (v4 == (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));

    if (!v5)
    {
      v6 = objc_msgSend(objc_alloc((Class)MKTransitItemReferenceDateUpdater), "initWithDelegate:", self);
      -[RoutePlanningOverviewViewController setReferenceDateUpdater:](self, "setReferenceDateUpdater:", v6);

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v7, "addObserver:selector:name:object:", self, "_sceneWillForeground:", UISceneWillEnterForegroundNotification, 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_sceneDidBackground:", UISceneDidEnterBackgroundNotification, 0);

    }
    v9 = -[RoutePlanningOverviewViewController _currentSceneActivationState](self, "_currentSceneActivationState");
    v11 = v9 != 2 && v9 != -1;
    v19 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));
    objc_msgSend(v19, "setActive:", v11);

  }
  else
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v21 = "-[RoutePlanningOverviewViewController _startReferenceDateUpdates]";
      v22 = 2080;
      v23 = "RoutePlanningOverviewViewController.m";
      v24 = 1024;
      v25 = 1276;
      v26 = 2080;
      v27 = "viewingTransitRoutes";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v21 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v17 = sub_10043214C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Attempted to start reference date updates but current routes are not Transit", buf, 2u);
    }

    -[RoutePlanningOverviewViewController _stopReferenceDateUpdates](self, "_stopReferenceDateUpdates");
  }
}

- (void)_stopReferenceDateUpdates
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));
    objc_msgSend(v4, "setActive:", 0);

    -[RoutePlanningOverviewViewController setReferenceDateUpdater:](self, "setReferenceDateUpdater:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, UISceneWillEnterForegroundNotification, 0);

    v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "removeObserver:name:object:", self, UISceneDidEnterBackgroundNotification, 0);

  }
}

- (void)_sceneWillForeground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

  if (v4 == v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));
    objc_msgSend(v8, "setActive:", 1);

  }
}

- (void)_sceneDidBackground:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "windowScene"));

  if (v4 == v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController referenceDateUpdater](self, "referenceDateUpdater"));
    objc_msgSend(v8, "setActive:", 0);

  }
}

- (void)didSelectFeedbackWithAppIdentifier:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
    objc_msgSend(v5, "viewController:continueRideBookingSessionWithApplicationIdentifier:", self, v4);

  }
}

- (void)didSelectAppStoreSuggestionWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  objc_msgSend(v5, "captureUserAction:onTarget:eventValue:", 14001, -[RoutePlanningOverviewViewController currentUITargetForAnalytics](self, "currentUITargetForAnalytics"), 0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v6, "viewController:displayStoreViewControllerForAppWithiTunesIdentifier:clientIdentifier:", self, v4, CFSTR("RidesharingStoreProductClientIdentifier"));

}

- (void)didSelectRideOption:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
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
  id v26;
  NSObject *v27;
  id v28;
  int v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;

  v4 = a3;
  if (v4)
  {
    -[RoutePlanningOverviewViewController _incrementCountOfRideOptionsBooked](self, "_incrementCountOfRideOptionsBooked");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
    +[RidesharingAppPreferenceManager recordAppSelection:](RidesharingAppPreferenceManager, "recordAppSelection:", v5);

    +[RidesharingAppPreferenceManager recordRideChoice:](RidesharingAppPreferenceManager, "recordRideChoice:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivityForBookingInApplication"));

    if (!v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rideOptionStateObserver"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "analyticsBookingSession"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "version"));
      objc_msgSend(v14, "captureBookedApp:version:", v16, v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "rideOptionStateObserver"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "analyticsBookingSession"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      objc_msgSend(v21, "captureBookedRideOptionName:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "rideOptionStateObserver"));
      objc_msgSend(v24, "startRequestRideForRideOption:", v4);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
      objc_msgSend(v25, "viewController:startRideBookingSessionWithRideBookingRideOption:", self, v4);

      goto LABEL_7;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userActivityForBookingInApplication"));
    objc_msgSend(v7, "openWithActivity:", v8);

    v9 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject rideOptionStateObserver](v9, "rideOptionStateObserver"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "analyticsBookingSession"));
    objc_msgSend(v11, "endSessionOnView:state:", 1, 4);

    goto LABEL_4;
  }
  v26 = sub_1004318FC();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
  {
    v29 = 136315906;
    v30 = "-[RoutePlanningOverviewViewController didSelectRideOption:]";
    v31 = 2080;
    v32 = "RoutePlanningOverviewViewController.m";
    v33 = 1024;
    v34 = 1338;
    v35 = 2080;
    v36 = "nil != rideOption";
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v29, 0x26u);
  }

  if (sub_100A70734())
  {
    v28 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v29 = 138412290;
    v30 = (const char *)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v29, 0xCu);
LABEL_4:

LABEL_5:
  }
LABEL_7:

}

- (void)_incrementCountOfRideOptionsBooked
{
  unint64_t v2;
  _BOOL8 v3;
  void *v4;
  void *v5;
  id v6;

  v2 = self->_countOfRideOptionsBooked + 1;
  self->_countOfRideOptionsBooked = v2;
  v3 = v2 > 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rideOptionStateObserver"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "analyticsBookingSession"));
  objc_msgSend(v5, "setExploredOtherOptions:", v3);

}

- (void)_resetCountOfRideOptionsBooked
{
  void *v2;
  void *v3;
  id v4;

  self->_countOfRideOptionsBooked = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideOptionStateObserver"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "analyticsBookingSession"));
  objc_msgSend(v3, "setExploredOtherOptions:", 0);

}

- (void)_updateForEquivalentRequestState:(int64_t)a3
{
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v5 = sub_1002A8AA0(self);
  v6 = v5 == 5;
  switch(a3)
  {
    case 0:
      v14 = 0;
      v7 = 0;
      goto LABEL_4;
    case 1:
      v14 = 0;
      v7 = 0;
      v8 = 0;
      v6 = 1;
      v9 = 1;
      break;
    case 2:
      -[RoutePlanningOverviewViewController _setupAdvisoryFooterView](self, "_setupAdvisoryFooterView");
      v14 = 0;
      v8 = 0;
      v9 = 0;
      v7 = 1;
      v6 = 1;
      break;
    case 3:
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routePlanningError"));

      v7 = 0;
      v9 = 0;
      v6 = 1;
      v8 = 1;
      break;
    default:
      v14 = 0;
      v7 = 0;
      v6 = 0;
LABEL_4:
      v8 = 0;
      v9 = 0;
      break;
  }
  -[RoutePlanningOverviewViewController _setLoadingViewVisible:](self, "_setLoadingViewVisible:", v9);
  -[RoutePlanningOverviewViewController _setCollectionViewVisible:](self, "_setCollectionViewVisible:", v7);
  -[RoutePlanningOverviewViewController _setErrorViewVisible:routePlanningError:](self, "_setErrorViewVisible:routePlanningError:", v8, v14);
  if (objc_msgSend(v14, "errorCode") == (id)16)
    -[RoutePlanningOverviewViewController _forceChangeOrigin](self, "_forceChangeOrigin");
  if (v6)
  {
    if (v5 == 5
      && (v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController")),
          v12 = objc_msgSend(v11, "containeeLayout"),
          v11,
          v12 != (id)2))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v13, "wantsLayout:", 2);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v13, "updateHeightForCurrentLayoutAnimated:", 1);
    }

  }
}

- (BOOL)_shouldShowAdvisoryCard
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "advisoriesInfo"));

  if (v4
    && (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "genericAdvisorys")),
        v6 = objc_msgSend(v5, "count"),
        v5,
        v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "genericAdvisorys"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

    if (objc_msgSend(v8, "shouldAlwaysShowAdvisoryCard"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
      v10 = objc_msgSend(v9, "transportType") == (id)1;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_setupAdvisoryFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));

  if (MapsFeature_IsEnabled_FrenchClimateLaw()
    && -[RoutePlanningOverviewViewController _shouldShowAdvisoryCard](self, "_shouldShowAdvisoryCard"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "advisoriesInfo"));

    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1004CBD5C;
    v8[3] = &unk_1011B8E00;
    objc_copyWeak(&v10, &location);
    v7 = v6;
    v9 = v7;
    objc_msgSend(v4, "setupAdvisoryInfoLayout:tapHandler:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);

  }
  else
  {
    objc_msgSend(v4, "setupAdvisoryInfoLayout:tapHandler:", 0, 0);
  }

}

- (void)_forceChangeOrigin
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  char *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;

  v4 = sub_1004318FC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v9 = 136315650;
    v10 = "-[RoutePlanningOverviewViewController _forceChangeOrigin]";
    v11 = 2080;
    v12 = "RoutePlanningOverviewViewController.m";
    v13 = 1024;
    v14 = 1475;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v9 = 138412290;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);

    }
  }
  -[RoutePlanningOverviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)isCollectionViewVisible
{
  void *v2;
  unsigned int v3;

  if (self->_collectionView)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v3 = objc_msgSend(v2, "hideContent") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)_setCollectionViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  float v7;
  double v8;
  id v9;

  v3 = a3;
  if (-[RoutePlanningOverviewViewController isCollectionViewVisible](self, "isCollectionViewVisible") != a3)
  {
    -[RoutePlanningOverviewViewController setRouteCellsHeight:](self, "setRouteCellsHeight:", -1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rideBookingSource](self, "rideBookingSource"));
    objc_msgSend(v5, "setHideContent:", !v3);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v6, "setHideContent:", !v3);

    if (v3)
      v7 = 749.0;
    else
      v7 = 50.0;
    v9 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionViewToBottomConstraint](self, "collectionViewToBottomConstraint"));
    *(float *)&v8 = v7;
    objc_msgSend(v9, "setPriority:", v8);

  }
}

- (BOOL)isLoadingViewVisible
{
  RoutePlanningOverviewViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LoadingModeView superview](self->_loadingModeView, "superview"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)_setLoadingViewVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;

  v3 = a3;
  if (-[RoutePlanningOverviewViewController isLoadingViewVisible](self, "isLoadingViewVisible") != a3)
  {
    if (v3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController loadingModeView](self, "loadingModeView"));
      objc_msgSend(v5, "addSubview:", v6);

      -[RoutePlanningOverviewViewController _loadingAndErrorViewFrame](self, "_loadingAndErrorViewFrame");
      v8 = v7;
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController loadingModeView](self, "loadingModeView"));
      objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

    }
    else
    {
      -[LoadingModeView removeFromSuperview](self->_loadingModeView, "removeFromSuperview");
    }
    -[RoutePlanningOverviewViewController _updateLoadingViewBottomInset](self, "_updateLoadingViewBottomInset");
  }
}

- (void)_updateLoadingViewBottomInset
{
  uint64_t v3;
  LoadingModeView *loadingModeView;
  double v5;
  double v6;
  void *v7;
  double v8;
  id v9;

  v3 = sub_1002A8AA0(self);
  loadingModeView = self->_loadingModeView;
  if (v3 == 5)
  {
    -[LoadingModeView setBottomInset:](loadingModeView, "setBottomInset:", 10.0);
  }
  else
  {
    -[LoadingModeView fittingHeight](loadingModeView, "fittingHeight");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "bottomSafeOffset");
    -[LoadingModeView setBottomInset:](self->_loadingModeView, "setBottomInset:");

    if (-[RoutePlanningOverviewViewController isLoadingViewVisible](self, "isLoadingViewVisible"))
    {
      -[LoadingModeView fittingHeight](self->_loadingModeView, "fittingHeight");
      if (vabdd_f64(v8, v6) > 2.22044605e-16)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v9, "updateHeightForCurrentLayout");

      }
    }
  }
}

- (BOOL)isErrorViewVisible
{
  RoutePlanningOverviewViewController *v2;
  void *v3;
  void *v4;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ErrorModeView superview](self->_errorModeView, "superview"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](v2, "contentView"));
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)_setErrorViewVisible:(BOOL)a3 routePlanningError:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  v4 = a3;
  v23 = a4;
  if (-[RoutePlanningOverviewViewController isErrorViewVisible](self, "isErrorViewVisible") != v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "errorTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "errorMessage"));
    objc_msgSend(v6, "setTitle:andMessage:", v7, v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "bottomSafeOffset");
    objc_msgSend(v9, "setVerticalAdjustment:", -v11);

    -[RoutePlanningOverviewViewController _updateErrorViewButtonVisibilityWithError:](self, "_updateErrorViewButtonVisibilityWithError:", v23);
    if (v4)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
      objc_msgSend(v12, "addSubview:", v13);

      -[RoutePlanningOverviewViewController _loadingAndErrorViewFrame](self, "_loadingAndErrorViewFrame");
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

    }
    else
    {
      -[ErrorModeView removeFromSuperview](self->_errorModeView, "removeFromSuperview");
    }
  }

}

- (void)_updateErrorViewButtonVisibilityWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  Block_layout *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;

  v4 = a3;
  if (!objc_msgSend(v4, "errorViewShouldShowRoutingApps")
    || !GEOConfigGetBOOL(MapsConfig_RoutePlanningShowOutOfCoverageRoutingAppsButton, off_1014B3A58))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorViewFeatureAvailabilityPunchoutURL"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Learn More [Route Planning Cycling Coverage]"), CFSTR("localized string not found"), 0));

      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "errorViewFeatureAvailabilityPunchoutURL"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_1004CCA8C;
      v37[3] = &unk_1011B08A8;
      v38 = v12;
      v14 = v12;
      objc_msgSend(v13, "setButtonTitle:handler:", v11, v37);

LABEL_7:
LABEL_13:

      goto LABEL_14;
    }
    if (objc_msgSend(v4, "errorViewShouldShowRegularDirectionsFallback"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("View Directions [Route Planning EV fallback]"), CFSTR("localized string not found"), 0));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
      v17 = v16;
      v18 = &stru_1011B8E20;
    }
    else
    {
      if (objc_msgSend(v4, "errorCode") != (id)21)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incidentMessage"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "transitIncidents"));
        v22 = objc_msgSend(v21, "count");

        if (!v22)
        {
          if (!GEOConfigGetBOOL(MapsConfig_OfflineOnlyData, off_1014B4C08)
            || objc_msgSend(v4, "errorCode") != (id)2 && objc_msgSend(v4, "errorCode") != (id)22)
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
            objc_msgSend(v31, "setButtonTitle:handler:", 0, 0);

            goto LABEL_14;
          }
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("Turn Off"), CFSTR("localized string not found"), CFSTR("Offline")));

          objc_initWeak(&location, self);
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_1004CCBA4;
          v32[3] = &unk_1011B4EB8;
          v8 = &v33;
          objc_copyWeak(&v33, &location);
          objc_msgSend(v7, "setButtonTitle:handler:", v6, v32);
          goto LABEL_4;
        }
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "incidentMessage"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "transitIncidents"));

        v25 = objc_msgSend(v24, "count");
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v27 = v26;
        if (v25 == (id)1)
          v28 = CFSTR("View Incident Singular [SideView]");
        else
          v28 = CFSTR("View Incident Plural [SideView]");
        v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", v28, CFSTR("localized string not found"), 0));

        objc_initWeak(&location, self);
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1004CCB4C;
        v34[3] = &unk_1011B03B8;
        objc_copyWeak(&v36, &location);
        v11 = v24;
        v35 = v11;
        objc_msgSend(v29, "setButtonTitle:handler:", v14, v34);

        objc_destroyWeak(&v36);
        objc_destroyWeak(&location);
        goto LABEL_7;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("View Directions [Route Planning LPR fallback]"), CFSTR("localized string not found"), 0));

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
      v17 = v16;
      v18 = &stru_1011B8E40;
    }
    objc_msgSend(v16, "setButtonTitle:handler:", v11, v18);

    goto LABEL_13;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("View Routing apps [Route Planning]"), CFSTR("localized string not found"), 0));

  objc_initWeak(&location, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController errorModeView](self, "errorModeView"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1004CCA44;
  v39[3] = &unk_1011B4EB8;
  v8 = &v40;
  objc_copyWeak(&v40, &location);
  objc_msgSend(v7, "setButtonTitle:handler:", v6, v39);
LABEL_4:

  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

LABEL_14:
}

- (BOOL)isDisplayingSingleTrip
{
  if (sub_1002A8AA0(self) == 5)
    return 0;
  else
    return -[RoutePlanningOverviewViewController isFittingHeightToRoutes](self, "isFittingHeightToRoutes");
}

- (BOOL)isFittingHeightToRoutes
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  v3 = objc_msgSend(v2, "containeeLayout") == (id)2;

  return v3;
}

- (id)_indexPathOfCellToShowAtMediumLayout
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = objc_msgSend(v3, "transportType");

  if (v4 == (id)4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentRoute"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostImportantIndexPathWithSelectedRoute:", v9));

  }
  return v5;
}

- (void)_scrollToCellToShowAtMediumLayoutAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double MinY;
  void *v24;
  _BOOL4 v25;
  double MaxY;
  void *v27;
  void *v28;
  double v29;
  int v30;
  void *v31;
  double v32;
  double MidY;
  double v34;
  double v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  CGFloat rect;
  id v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v3 = a3;
  v42 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController _indexPathOfCellToShowAtMediumLayout](self, "_indexPathOfCellToShowAtMediumLayout"));
  if (v42)
  {
    if (!-[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip"))
    {
      -[RoutePlanningOverviewViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      objc_msgSend(v14, "convertRect:toView:", 0, v7, v9, v11, v13);
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;

      v43.origin.x = v7;
      rect = v9;
      v43.origin.y = v9;
      v43.size.width = v11;
      v43.size.height = v13;
      MinY = CGRectGetMinY(v43);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      objc_msgSend(v24, "bounds");
      v25 = MinY < CGRectGetMinY(v44);

      v45.origin.x = v16;
      v45.origin.y = v18;
      v45.size.width = v20;
      v45.size.height = v22;
      MaxY = CGRectGetMaxY(v45);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "window"));
      objc_msgSend(v28, "bounds");
      v29 = CGRectGetMaxY(v46);

      v30 = MaxY > v29 || v25;
      if (MaxY <= v29)
      {
        MidY = rect;
        if (!v30)
          goto LABEL_13;
      }
      else
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v31, "bottomSafeOffset");
        v13 = v13 - v32;

        v47.origin.x = v7;
        v47.origin.y = rect;
        v47.size.width = v11;
        v47.size.height = v13;
        MidY = CGRectGetMidY(v47);
        if (!v30)
          goto LABEL_13;
      }
      v34 = v13 * 0.5;
      v48.origin.x = v7;
      v48.origin.y = MidY;
      v48.size.width = v11;
      v48.size.height = v13 * 0.5;
      v35 = CGRectGetMaxY(v48);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "collectionViewLayout"));
      objc_msgSend(v37, "collectionViewContentSize");
      v39 = v35 - v38;

      v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      objc_msgSend(v40, "scrollRectToVisible:animated:", v3, v7, MidY, v11, v34 - fmax(v39, 0.0));

      goto LABEL_13;
    }
    -[RoutePlanningOverviewViewController _snapToRectOfRowToKeepVisible](self, "_snapToRectOfRowToKeepVisible");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    objc_msgSend(v5, "setContentOffset:animated:", 0, CGPointZero.x, CGPointZero.y);

  }
LABEL_13:

}

- (void)_snapToRectOfRowToKeepVisible
{
  double MinY;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  int v21;
  RoutePlanningOverviewViewController *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  uint64_t v26;
  CGRect v27;

  -[RoutePlanningOverviewViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
  MinY = CGRectGetMinY(v27);
  v4 = -(MinY * (double)-[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v5, "contentInset");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v12, "setContentInset:", v4, v7, v9, v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v13, "adjustedContentInset");
  v15 = v14 - v4;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v16, "setContentOffset:", 0.0, -(v15 - MinY));

  v17 = sub_1004CD150();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    objc_msgSend(v19, "contentOffset");
    v21 = 134349568;
    v22 = self;
    v23 = 2048;
    v24 = v4;
    v25 = 2048;
    v26 = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "[%{public}p] Snapping to contentInset.top: %#.1lf, contentOffset.y: %#.1lf", (uint8_t *)&v21, 0x20u);

  }
}

- (void)_animateUpdatingHeightForSingleTrip
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double Height;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];
  CGRect v20;

  if (-[RoutePlanningOverviewViewController isFittingHeightToRoutes](self, "isFittingHeightToRoutes"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController viewIfLoaded](self, "viewIfLoaded"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));

    if (v4)
    {
      -[RoutePlanningOverviewViewController _fittingHeightForMediumLayout](self, "_fittingHeightForMediumLayout");
      v6 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
      objc_msgSend(v7, "frame");
      Height = CGRectGetHeight(v20);

      if (vabdd_f64(v6, Height) >= 2.22044605e-16)
      {
        if (-[RoutePlanningOverviewViewController isAnimatingHeightForMediumLayout](self, "isAnimatingHeightForMediumLayout"))
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "window"));
          objc_msgSend(v10, "_removeAllAnimations:", 1);

        }
        -[RoutePlanningOverviewViewController setIsAnimatingHeightForMediumLayout:](self, "setIsAnimatingHeightForMediumLayout:", 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
        objc_msgSend(v11, "updateHeightForCurrentLayout");

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
        objc_msgSend(v12, "layoutIfNeeded");

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v14 = objc_msgSend(v13, "userInterfaceIdiom");

        if (v14 == (id)5)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
          objc_msgSend(v15, "layoutBelowIfNeeded");

          v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController loadingModeView](self, "loadingModeView"));
          objc_msgSend(v16, "_maps_alignTopToView:", v17);

        }
        v18[4] = self;
        v19[0] = _NSConcreteStackBlock;
        v19[1] = 3221225472;
        v19[2] = sub_1004CD380;
        v19[3] = &unk_1011AC860;
        v19[4] = self;
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_1004CD3B0;
        v18[3] = &unk_1011AE8F8;
        +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v18, 0.25);
      }
    }
  }
}

- (void)_contentSizeCategoryDidChange
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  objc_msgSend(v3, "reloadData");

  -[RoutePlanningOverviewViewController _scrollToCellToShowAtMediumLayoutAnimated:](self, "_scrollToCellToShowAtMediumLayoutAnimated:", -[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip") ^ 1);
  if (-[RoutePlanningOverviewViewController isDisplayingSingleTrip](self, "isDisplayingSingleTrip"))
  {
    if (!-[RoutePlanningOverviewViewController isAnimatingHeightForMediumLayout](self, "isAnimatingHeightForMediumLayout"))
    {
      v4 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
      objc_msgSend(v4, "updateHeightForCurrentLayout");

    }
  }
}

- (double)_calculatedRouteCellsHeight
{
  double v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  CGRect v24;

  v3 = -1.0;
  if (-[RoutePlanningOverviewViewController isCollectionViewVisible](self, "isCollectionViewVisible"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v5 = objc_msgSend(v4, "numberOfSections");

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      objc_msgSend(v6, "layoutIfNeeded");

      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
      v8 = (uint64_t)objc_msgSend(v7, "numberOfSections");

      if (v8 < 1)
      {
        return 0.0;
      }
      else
      {
        v9 = 0;
        v3 = 0.0;
        while (1)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
          v11 = (uint64_t)objc_msgSend(v10, "numberOfItemsInSection:", v9);

          if (v11 >= 1)
            break;
LABEL_9:
          ++v9;
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
          v22 = objc_msgSend(v21, "numberOfSections");

          if (v9 >= (uint64_t)v22)
            return v3;
        }
        v12 = 0;
        while (1)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v12, v9));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "cellForItemAtIndexPath:", v13));

          if (!v15)
            break;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentView"));
          objc_msgSend(v15, "frame");
          objc_msgSend(v16, "_maps_compressedSizeForWidth:withBlock:", 0, CGRectGetWidth(v24));
          v18 = v17;

          v3 = v3 + v18;
          ++v12;
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
          v20 = objc_msgSend(v19, "numberOfItemsInSection:", v9);

          if (v12 >= (uint64_t)v20)
            goto LABEL_9;
        }

        return -1.0;
      }
    }
  }
  return v3;
}

- (double)_fittingHeightForMediumLayout
{
  double v3;
  double v4;
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
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;
  double v42;
  void *v44;
  uint64_t v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double Height;
  void *v51;
  double v52;
  double v53;
  void *v54;
  double v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  CGRect v60;
  CGRect v61;

  -[RoutePlanningOverviewViewController _cardHeightMinusTableViewHeight](self, "_cardHeightMinusTableViewHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController viewIfLoaded](self, "viewIfLoaded"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screen"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "window"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "screen"));
    objc_msgSend(v9, "nativeScale");
    v11 = v10;

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v8, "nativeScale");
    v11 = v12;
  }

  if (v11 <= 0.0)
    v13 = 1.0;
  else
    v13 = 1.0 / v11;

  +[RouteOverviewCell minimumHeight](RouteOverviewCell, "minimumHeight");
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v17 = objc_msgSend(v16, "requestState");

  if (v17 == (id)3)
  {
    v18 = 176;
LABEL_11:
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + v18), "fittingHeight");
    v22 = v21;
    goto LABEL_12;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v20 = objc_msgSend(v19, "requestState");

  if (v20 == (id)1)
  {
    v18 = 168;
    goto LABEL_11;
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  if (objc_msgSend(v44, "requestState") != (id)2)
  {

    goto LABEL_35;
  }
  v45 = sub_1002A8AA0(self);

  if (v45 != 5)
  {
LABEL_35:
    -[RoutePlanningOverviewViewController _rectOfRowToKeepVisible](self, "_rectOfRowToKeepVisible");
    Height = CGRectGetHeight(v61);
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v51, "bottomSafeOffset");
    v53 = Height - v52;

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
    objc_msgSend(v54, "estimatedFeatureDiscoveryHeight");
    v22 = v53 - v13 + v55;

    goto LABEL_12;
  }
  -[RoutePlanningOverviewViewController routeCellsHeight](self, "routeCellsHeight");
  if (fabs(v46 + 1.0) <= 2.22044605e-16)
  {
    -[RoutePlanningOverviewViewController _calculatedRouteCellsHeight](self, "_calculatedRouteCellsHeight");
    -[RoutePlanningOverviewViewController setRouteCellsHeight:](self, "setRouteCellsHeight:");
  }
  -[RoutePlanningOverviewViewController routeCellsHeight](self, "routeCellsHeight");
  if (v47 == -1.0)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "collectionViewLayout"));
    objc_msgSend(v57, "collectionViewContentSize");
    v49 = v58 - v13;

  }
  else
  {
    -[RoutePlanningOverviewViewController routeCellsHeight](self, "routeCellsHeight");
    v49 = v48;
  }
  +[RouteOverviewCell minimumVerticalPadding](RouteOverviewCell, "minimumVerticalPadding");
  v22 = v49 + v59;
LABEL_12:
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
  v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessoryView"));
  if (!v24)
  {
LABEL_15:

    goto LABEL_16;
  }
  v25 = (void *)v24;
  v26 = sub_1002A8AA0(self);

  if (v26 != 5)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController containerHeaderView](self, "containerHeaderView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "accessoryView"));
    objc_msgSend(v27, "bounds");
    v22 = v22 + CGRectGetHeight(v60) + 10.0;

    goto LABEL_15;
  }
LABEL_16:
  v28 = objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController transportTypePicker](self, "transportTypePicker"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "superview"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v33 = v31 == v32;

    if (v33)
      v22 = v22 + 48.0;
  }
  if (v22 <= v15)
    v34 = v15;
  else
    v34 = v22;
  v35 = v4 + v34;
  if (sub_1002A8AA0(self) != 5)
  {
    -[RoutePlanningOverviewViewController _minimumMediumCardHeight](self, "_minimumMediumCardHeight");
    if (v35 <= v36)
    {
      -[RoutePlanningOverviewViewController _minimumMediumCardHeight](self, "_minimumMediumCardHeight");
      v35 = v37;
    }
    -[RoutePlanningOverviewViewController _maximumMediumCardHeight](self, "_maximumMediumCardHeight");
    if (v35 >= v38)
    {
      -[RoutePlanningOverviewViewController _maximumMediumCardHeight](self, "_maximumMediumCardHeight");
      v35 = v39;
    }
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController viewIfLoaded](self, "viewIfLoaded"));
  v42 = UIRoundToViewScale(v40, v41, v35);

  return v42;
}

- (double)_minimumMediumCardHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  CGRect v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  if (CGRectGetWidth(v8) <= 325.0)
  {
    v6 = 380.0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v4, "availableHeight");
    v6 = v5 * 0.5;

  }
  return v6;
}

- (double)_maximumMediumCardHeight
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v3, "availableHeight");
  v5 = v4 * 0.649999976;
  -[RoutePlanningOverviewViewController _heightForFullLayout](self, "_heightForFullLayout");
  if (v5 >= v6 + -34.0)
  {
    -[RoutePlanningOverviewViewController _heightForFullLayout](self, "_heightForFullLayout");
    v9 = v10 + -34.0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v7, "availableHeight");
    v9 = v8 * 0.649999976;

  }
  return v9;
}

- (void)_updateDigitalIssuanceStateWithUpdateFlag:(int64_t)a3
{
  -[RoutePlanningOverviewViewController setDigitalIssuanceUpdateFlags:](self, "setDigitalIssuanceUpdateFlags:", -[RoutePlanningOverviewViewController digitalIssuanceUpdateFlags](self, "digitalIssuanceUpdateFlags") | a3);
  if ((-[RoutePlanningOverviewViewController digitalIssuanceUpdateFlags](self, "digitalIssuanceUpdateFlags") & 4) != 0)
  {
    -[RoutePlanningOverviewViewController setHasIncrementedDigitalIssuanceCountForRoute:](self, "setHasIncrementedDigitalIssuanceCountForRoute:", 0);
    -[RoutePlanningOverviewViewController setDigitalIssuanceUpdateFlags:](self, "setDigitalIssuanceUpdateFlags:", 0);
  }
}

- (void)pptTestStartNavigation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController rootController](self, "rootController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeCollection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForRoute:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController collectionView](self, "collectionView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForItemAtIndexPath:", v10));

  v9 = objc_opt_class(RouteOverviewCell);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    -[RoutePlanningOverviewViewController didTapGoButtonForRouteOverviewCell:](self, "didTapGoButtonForRouteOverviewCell:", v8);

}

- (void)pptTestEndNavigation
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "-[RoutePlanningOverviewViewController pptTestEndNavigation]";
    v9 = 2080;
    v10 = "RoutePlanningOverviewViewController.m";
    v11 = 1024;
    v12 = 1826;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)pptTestTransitionBetweenFullAndLightGuidance
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;

  v2 = sub_1004318FC();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v7 = 136315650;
    v8 = "-[RoutePlanningOverviewViewController pptTestTransitionBetweenFullAndLightGuidance]";
    v9 = 2080;
    v10 = "RoutePlanningOverviewViewController.m";
    v11 = 1024;
    v12 = 1831;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v7, 0x1Cu);
  }

  if (sub_100A70734())
  {
    v4 = sub_1004318FC();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      v7 = 138412290;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (int)currentUITargetForAnalytics
{
  void *v2;
  char *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v3 = (char *)objc_msgSend(v2, "transportType");
  if ((unint64_t)(v3 - 1) >= 5)
    v4 = 0;
  else
    v4 = (_DWORD)v3 + 300;

  return v4;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004CDF84;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_refreshSelectedVehicleDisplay
{
  -[RoutePlanningOverviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_refreshRoutePlanning
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "platformController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    objc_msgSend(v8, "requestUpdatedRouteWithRefreshedOrigin:", 0);
    -[RoutePlanningOverviewViewController _updateForEquivalentRequestState:](self, "_updateForEquivalentRequestState:", 1);
  }
  else
  {
    v9 = sub_10043214C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Couldn't refresh route planning as there wasn't a current route planning session", v11, 2u);
    }

  }
}

- (BOOL)shouldRefreshRoutePlanningWithCurrentGarage:(id)a3 previousGarage:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t IsEnabled_EVRouting;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  unsigned int v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  BOOL v31;
  id v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  id v36;
  unsigned int v37;
  id v38;
  id v39;
  id v40;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  unsigned __int8 v47;
  id v48;
  unsigned int v49;
  id v50;
  void *v51;
  void *v52;
  unsigned int v53;
  id v54;
  NSObject *v55;
  unsigned __int8 v56;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  IsEnabled_EVRouting = MapsFeature_IsEnabled_EVRouting(v6, v7);
  if ((IsEnabled_EVRouting & 1) != 0 || MapsFeature_IsEnabled_Alberta(IsEnabled_EVRouting))
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectedVehicle"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedVehicle"));
    if (!(v9 | v10))
    {
      v31 = 0;
LABEL_30:

      goto LABEL_31;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "identifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "identifier"));
    v13 = v11;
    v14 = v12;
    if (v13 | v14)
    {
      v15 = (void *)v14;
      v16 = objc_msgSend((id)v13, "isEqual:", v14);

      if ((v16 & 1) == 0)
      {
        v32 = sub_10043214C();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v34 = "Will refresh RP because selected vehicle.";
LABEL_27:
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, v34, buf, 2u);
        }
LABEL_28:
        v31 = 1;
LABEL_29:

        goto LABEL_30;
      }
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "licensePlate"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "licensePlate"));
    v19 = v17;
    v20 = v18;
    if (!(v19 | v20)
      || (v21 = objc_msgSend((id)v19, "isEqual:", v20), (id)v20, (id)v19, v21))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "lprPowerType"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "lprPowerType"));
      v24 = v22;
      v25 = v23;
      if (!(v24 | v25)
        || (v26 = objc_msgSend((id)v24, "isEqual:", v25), (id)v25,
                                                                        (id)v24,
                                                                        v26))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "lprVehicleType"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "lprVehicleType"));
        v29 = v27;
        v30 = v28;
        if (!(v29 | v30))
        {

          goto LABEL_17;
        }
        v35 = (void *)v30;
        v56 = objc_msgSend((id)v29, "isEqual:", v30);

        if ((v56 & 1) != 0)
        {
LABEL_17:
          v36 = objc_msgSend((id)v9, "supportedConnectors");
          if (v36 == objc_msgSend((id)v10, "supportedConnectors"))
          {
            v37 = objc_msgSend((id)v9, "usesPreferredNetworksForRouting");
            if (v37 == objc_msgSend((id)v10, "usesPreferredNetworksForRouting"))
            {
              v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "preferredChargingNetworks"));
              v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "preferredChargingNetworks"));
              v44 = v42;
              v45 = v43;
              if (v44 | v45)
              {
                v46 = (void *)v45;
                v47 = objc_msgSend((id)v44, "isEqual:", v45);

                if ((v47 & 1) == 0)
                {
                  if (objc_msgSend((id)v9, "usesPreferredNetworksForRouting"))
                  {
                    v48 = sub_10043214C();
                    v33 = objc_claimAutoreleasedReturnValue(v48);
                    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                      goto LABEL_28;
                    *(_WORD *)buf = 0;
                    v34 = "Will refresh RP because preferredNetworks changed.";
                    goto LABEL_27;
                  }
                }
              }
              v49 = objc_msgSend(v5, "shouldAssumeFullCharge");
              if (v49 == objc_msgSend(v6, "shouldAssumeFullCharge"))
              {
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "currentVehicleState"));
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v10, "currentVehicleState"));
                v53 = objc_msgSend(v51, "isSignificantlyDifferentFromVehicleState:", v52);

                v54 = sub_10043214C();
                v55 = objc_claimAutoreleasedReturnValue(v54);
                v33 = v55;
                if (v53)
                {
                  v31 = 1;
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Will refresh RP because the selected vehicle's state changed significantly.", buf, 2u);
                  }
                }
                else
                {
                  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "Will not refresh RP because the latest change in vehicle was not significant.", buf, 2u);
                  }
                  v31 = 0;
                }
                goto LABEL_29;
              }
              v50 = sub_10043214C();
              v33 = objc_claimAutoreleasedReturnValue(v50);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                v34 = "Will refresh RP because shouldAssumeFullCharge changed.";
                goto LABEL_27;
              }
            }
            else
            {
              v38 = sub_10043214C();
              v33 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)buf = 0;
                v34 = "Will refresh RP because usesPreferredNetworksForRouting changed.";
                goto LABEL_27;
              }
            }
          }
          else
          {
            v39 = sub_10043214C();
            v33 = objc_claimAutoreleasedReturnValue(v39);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)buf = 0;
              v34 = "Will refresh RP because supportedConnectors changed.";
              goto LABEL_27;
            }
          }
          goto LABEL_28;
        }
LABEL_25:
        v40 = sub_10043214C();
        v33 = objc_claimAutoreleasedReturnValue(v40);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v34 = "Will refresh RP because lprInfo changed.";
          goto LABEL_27;
        }
        goto LABEL_28;
      }

    }
    goto LABEL_25;
  }
  v31 = 0;
LABEL_31:

  return v31;
}

- (BOOL)hasValidEVRoute
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  if (objc_msgSend(v3, "isEVRoute"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "origin"));
    v5 = objc_msgSend(v4, "isCurrentLocation");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)chargingInfoForWaypointAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  if (-[RoutePlanningOverviewViewController hasValidEVRoute](self, "hasValidEVRoute"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));
    if ((unint64_t)objc_msgSend(v7, "count") <= a3)
    {
      v9 = 0;
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chargingInfo"));

    return v16;
  }
  else
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315650;
      v18 = "-[RoutePlanningOverviewViewController chargingInfoForWaypointAtIndex:]";
      v19 = 2080;
      v20 = "RoutePlanningOverviewViewController.m";
      v21 = 1024;
      v22 = 1954;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v17, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v17 = 138412290;
        v18 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

      }
    }
    return 0;
  }
}

- (id)evStepInfoForWaypointAtIndex:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  id v25;
  char *v26;
  id v27;
  NSObject *v28;
  id v29;
  char *v30;
  void *v31;
  id v33;
  NSObject *v34;
  id v35;
  char *v36;
  void *v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t v43[128];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  if (-[RoutePlanningOverviewViewController hasValidEVRoute](self, "hasValidEVRoute"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningOverviewViewController dataCoordinator](self, "dataCoordinator"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));

    if (!a3)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject firstEVStep](v6, "firstEVStep"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "evInfo"));
LABEL_40:

      goto LABEL_41;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject waypoints](v6, "waypoints"));
    if ((unint64_t)objc_msgSend(v7, "count") <= a3)
    {

    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject waypoints](v6, "waypoints"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", a3));

      if (v9)
      {
        v41 = 0u;
        v42 = 0u;
        v39 = 0u;
        v40 = 0u;
        v38 = v6;
        v10 = objc_claimAutoreleasedReturnValue(-[NSObject legs](v6, "legs"));
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v40;
          while (2)
          {
            for (i = 0; i != v12; i = (char *)i + 1)
            {
              if (*(_QWORD *)v40 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "destination"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "uniqueID"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));
              v19 = objc_msgSend(v17, "isEqual:", v18);

              if ((v19 & 1) != 0)
              {
                v6 = v38;
                v37 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject lastEVStepInLegWithIndex:](v38, "lastEVStepInLegWithIndex:", objc_msgSend(v15, "legIndex")));
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "evInfo"));

                goto LABEL_39;
              }
            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
            if (v12)
              continue;
            break;
          }
        }

        v20 = sub_10043214C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        v6 = v38;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v22 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueID"));
          *(_DWORD *)buf = 138412546;
          v45 = v22;
          v46 = 2112;
          v47 = (const char *)v38;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Could not find waypointId: %@ in route: %@", buf, 0x16u);

        }
        v23 = sub_1004318FC();
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v45 = "-[RoutePlanningOverviewViewController evStepInfoForWaypointAtIndex:]";
          v46 = 2080;
          v47 = "RoutePlanningOverviewViewController.m";
          v48 = 1024;
          v49 = 1988;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v25 = sub_1004318FC();
          v10 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v45 = v26;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
          goto LABEL_35;
        }
LABEL_37:
        v31 = 0;
        goto LABEL_40;
      }
    }
    v33 = sub_1004318FC();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v45 = "-[RoutePlanningOverviewViewController evStepInfoForWaypointAtIndex:]";
      v46 = 2080;
      v47 = "RoutePlanningOverviewViewController.m";
      v48 = 1024;
      v49 = 1977;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v35 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v36 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v45 = v36;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
      v9 = 0;
LABEL_35:
      v31 = 0;
LABEL_39:

      goto LABEL_40;
    }
    v9 = 0;
    goto LABEL_37;
  }
  v27 = sub_1004318FC();
  v28 = objc_claimAutoreleasedReturnValue(v27);
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v45 = "-[RoutePlanningOverviewViewController evStepInfoForWaypointAtIndex:]";
    v46 = 2080;
    v47 = "RoutePlanningOverviewViewController.m";
    v48 = 1024;
    v49 = 1966;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (!sub_100A70734())
    return 0;
  v29 = sub_1004318FC();
  v6 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    v45 = v30;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

  }
  v31 = 0;
LABEL_41:

  return v31;
}

- (LoadingModeView)loadingModeView
{
  return self->_loadingModeView;
}

- (void)setLoadingModeView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingModeView, a3);
}

- (void)setErrorModeView:(id)a3
{
  objc_storeStrong((id *)&self->_errorModeView, a3);
}

- (RoutePlanningDataCoordinator)dataCoordinator
{
  return (RoutePlanningDataCoordinator *)objc_loadWeakRetained((id *)&self->_dataCoordinator);
}

- (UIView)routeOptionsPopoverSourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_routeOptionsPopoverSourceView);
}

- (NSString)originName
{
  return self->_originName;
}

- (void)setOriginName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (BOOL)hasIncrementedDigitalIssuanceCountForRoute
{
  return self->_hasIncrementedDigitalIssuanceCountForRoute;
}

- (void)setHasIncrementedDigitalIssuanceCountForRoute:(BOOL)a3
{
  self->_hasIncrementedDigitalIssuanceCountForRoute = a3;
}

- (int64_t)digitalIssuanceUpdateFlags
{
  return self->_digitalIssuanceUpdateFlags;
}

- (void)setDigitalIssuanceUpdateFlags:(int64_t)a3
{
  self->_digitalIssuanceUpdateFlags = a3;
}

- (UIAlertController)simulationPromptAlertController
{
  return self->_simulationPromptAlertController;
}

- (void)setSimulationPromptAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_simulationPromptAlertController, a3);
}

- (ContainerHeaderView)containerHeaderView
{
  return self->_containerHeaderView;
}

- (void)setContainerHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_containerHeaderView, a3);
}

- (TransportTypePicker)transportTypePicker
{
  return self->_transportTypePicker;
}

- (void)setTransportTypePicker:(id)a3
{
  objc_storeStrong((id *)&self->_transportTypePicker, a3);
}

- (BOOL)isAnimatingHeightForMediumLayout
{
  return self->_isAnimatingHeightForMediumLayout;
}

- (void)setIsAnimatingHeightForMediumLayout:(BOOL)a3
{
  self->_isAnimatingHeightForMediumLayout = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (UICollectionViewCompositionalLayout)collectionViewLayout
{
  return self->_collectionViewLayout;
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewLayout, a3);
}

- (NSLayoutConstraint)collectionViewToBottomConstraint
{
  return self->_collectionViewToBottomConstraint;
}

- (void)setCollectionViewToBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_collectionViewToBottomConstraint, a3);
}

- (RoutePlanningOutlineRootController)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
  objc_storeStrong((id *)&self->_rootController, a3);
}

- (double)routeCellsHeight
{
  return self->_routeCellsHeight;
}

- (void)setRouteCellsHeight:(double)a3
{
  self->_routeCellsHeight = a3;
}

- (RideBookingOutlineController)rideBookingSource
{
  return self->_rideBookingSource;
}

- (void)setRideBookingSource:(id)a3
{
  objc_storeStrong((id *)&self->_rideBookingSource, a3);
}

- (RideBookingRideOptionState)cachedRideOptionState
{
  return self->_cachedRideOptionState;
}

- (void)setCachedRideOptionState:(id)a3
{
  objc_storeStrong((id *)&self->_cachedRideOptionState, a3);
}

- (unint64_t)countOfRideOptionsBooked
{
  return self->_countOfRideOptionsBooked;
}

- (MKTransitItemReferenceDateUpdater)referenceDateUpdater
{
  return self->_referenceDateUpdater;
}

- (void)setReferenceDateUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_referenceDateUpdater, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDateUpdater, 0);
  objc_storeStrong((id *)&self->_cachedRideOptionState, 0);
  objc_storeStrong((id *)&self->_rideBookingSource, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_collectionViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_transportTypePicker, 0);
  objc_storeStrong((id *)&self->_containerHeaderView, 0);
  objc_storeStrong((id *)&self->_simulationPromptAlertController, 0);
  objc_storeStrong((id *)&self->_originName, 0);
  objc_destroyWeak((id *)&self->_routeOptionsPopoverSourceView);
  objc_destroyWeak((id *)&self->_dataCoordinator);
  objc_storeStrong((id *)&self->_errorModeView, 0);
  objc_storeStrong((id *)&self->_loadingModeView, 0);
  objc_storeStrong((id *)&self->_virtualGarageAtLastRouteRequest, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
}

@end
