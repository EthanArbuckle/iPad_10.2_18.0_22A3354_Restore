@implementation StepContainerViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (StepContainerViewController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4
{
  id v7;
  StepContainerViewController *v8;
  StepContainerViewController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSDate *startDate;
  NSMutableDictionary *v16;
  NSMutableDictionary *isExpandedMapping;
  OverlayContainerDimmingController *v18;
  void *v19;
  void *v20;
  void *v21;
  StatusIndicatorManager *v22;
  void *v23;
  void *v24;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  char *v30;
  objc_super v31;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;

  v7 = a3;
  v31.receiver = self;
  v31.super_class = (Class)StepContainerViewController;
  v8 = -[ContainerViewController initWithNibName:bundle:](&v31, "initWithNibName:bundle:", 0, 0);
  v9 = v8;
  if (v8)
  {
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[StepContainerViewController setAccessibilityIdentifier:](v9, "setAccessibilityIdentifier:", v12);

    objc_storeStrong((id *)&v9->_route, a3);
    if (-[GEOComposedRoute transportType](v9->_route, "transportType") == 1)
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v33 = "-[StepContainerViewController initWithRoute:initialStepIndex:]";
        v34 = 2080;
        v35 = "StepContainerViewController.m";
        v36 = 1024;
        v37 = 155;
        v38 = 2080;
        v39 = "_route.transportType != GEOTransportType_TRANSIT";
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v28 = sub_1004318FC();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v30 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v33 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v9->_matchedStepIndex = (unint64_t)objc_msgSend(v13, "stepIndex");

    v9->_matchedSignIndex = 0x7FFFFFFFFFFFFFFFLL;
    v9->_isGoingToEnterGuidance = 1;
    v14 = objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    startDate = v9->_startDate;
    v9->_startDate = (NSDate *)v14;

    v9->_initialStepIndex = a4;
    v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    isExpandedMapping = v9->_isExpandedMapping;
    v9->_isExpandedMapping = v16;

    v9->_userTrackingViewVisible = 1;
    v18 = sub_1004B484C();
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[OverlayContainerViewController setDimmingBehaviour:](v9, "setDimmingBehaviour:", v19);

    -[StepContainerViewController _addNavigationObservers](v9, "_addNavigationObservers");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v9, "_willEnterForeground:", UISceneWillEnterForegroundNotification, 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v21, "addObserver:selector:name:object:", v9, "_didEnterBackground:", UISceneDidEnterBackgroundNotification, 0);

    v22 = -[StatusIndicatorManager initWithDelegate:]([StatusIndicatorManager alloc], "initWithDelegate:", v9);
    -[StepContainerViewController setStatusIndicatorManager:](v9, "setStatusIndicatorManager:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v23, "addObserver:selector:name:object:", v9, "vlfSessionTaskWillShowVLFUINotification:", CFSTR("VLFSessionTaskWillShowVLFUINotification"), 0);

    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "addObserver:selector:name:object:", v9, "vlfContaineeViewControllerDidDisappearNotification:", off_1014BB950, 0);

  }
  return v9;
}

- (StepContainerViewController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4 desiredTrackingMode:(int64_t)a5
{
  StepContainerViewController *result;

  result = -[StepContainerViewController initWithRoute:initialStepIndex:](self, "initWithRoute:initialStepIndex:", a3, a4);
  if (result)
  {
    result->_hasDesiredUserTrackingMode = 1;
    result->_desiredUserTrackingMode = a5;
  }
  return result;
}

- (StepActionCoordinator)stepActionCoordinator
{
  StepActionCoordinator *stepActionCoordinator;
  StepActionCoordinator *v4;
  StepActionCoordinator *v5;

  stepActionCoordinator = self->_stepActionCoordinator;
  if (!stepActionCoordinator)
  {
    v4 = -[StepActionCoordinator initWithContainerViewController:]([StepActionCoordinator alloc], "initWithContainerViewController:", self);
    v5 = self->_stepActionCoordinator;
    self->_stepActionCoordinator = v4;

    stepActionCoordinator = self->_stepActionCoordinator;
  }
  return stepActionCoordinator;
}

- (void)_addNavigationObservers
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "registerObserver:", self);

}

- (void)_setupDebugUtilities
{
  void *v3;
  void *v4;
  unsigned int v5;
  NavDebugLocationManager *v6;
  NavDebugLocationManager *debugLocationManager;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NavigationDebugViewsController *v14;
  NavigationDebugViewsController *debugViewsController;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v5 = objc_msgSend(v4, "isInternalInstall");

  if (v5)
  {
    v6 = objc_alloc_init(NavDebugLocationManager);
    debugLocationManager = self->_debugLocationManager;
    self->_debugLocationManager = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
    -[NavDebugLocationManager setMapView:](self->_debugLocationManager, "setMapView:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_debugConsole"));
    objc_msgSend(v10, "setCustomTextEnabled:", 1);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "_debugConsole"));
    objc_msgSend(v11, "setPageIndex:", 2);

    -[StepContainerViewController _updateDebugConsoleForLocation:](self, "_updateDebugConsoleForLocation:", 0);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v13 = objc_msgSend(v12, "isNavigatingFromTrace");

  if (v13)
  {
    v14 = -[NavigationDebugViewsController initWithDelegate:]([NavigationDebugViewsController alloc], "initWithDelegate:", 0);
    debugViewsController = self->_debugViewsController;
    self->_debugViewsController = v14;

    -[NavigationDebugViewsController setShowTraceControlsForStaleLocations:](self->_debugViewsController, "setShowTraceControlsForStaleLocations:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController debugViewsController](self, "debugViewsController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v16, "addDebugViewsToView:layoutGuide:mapView:modalPresentingViewController:", v17, v18, v20, v19);

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  -[StepContainerViewController _invalidateTimers](self, "_invalidateTimers");
  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  -[StepContainerViewController dealloc](&v4, "dealloc");
}

- (void)updateWithDisplayedStep:(id)a3
{
  SteppingPageViewController *pagingVC;
  id v5;
  void *v6;
  id v7;
  void *v8;

  pagingVC = self->_pagingVC;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](pagingVC, "signGenerator"));
  v7 = objc_msgSend(v6, "signIndexForStep:", v5);

  -[SteppingPageViewController setSignIndex:](self->_pagingVC, "setSignIndex:", v7);
  if ((unint64_t)v7 <= 0x7FFFFFFFFFFFFFFELL)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController route](self, "route"));
    objc_msgSend(v8, "setCurrentDisplayStep:", v7);

  }
  -[StepContainerViewController _updateMapRegionForSignAtIndex:](self, "_updateMapRegionForSignAtIndex:", v7);
}

- (void)showOverview:(BOOL)a3 andZoomToMapRegion:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  self->_showingOverview = a3;
  if (a4)
  {
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapCameraController](self, "mapCameraController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController route](self, "route"));
      v8 = v6;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
      objc_msgSend(v5, "frameRoutes:includeCompassInset:animated:completion:", v7, 1, 1, 0);

    }
    else
    {
      -[StepContainerViewController _updateMapRegionForSignAtIndex:](self, "_updateMapRegionForSignAtIndex:", -[SteppingPageViewController signIndex](self->_pagingVC, "signIndex"));
    }
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)StepContainerViewController;
  -[OverlayContainerViewController viewDidLayoutSubviews](&v3, "viewDidLayoutSubviews");
  -[StepContainerViewController _updateCompassLayout](self, "_updateCompassLayout");
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StepContainerViewController;
  -[OverlayContainerViewController viewDidLoad](&v5, "viewDidLoad");
  -[StepContainerViewController _setupViews](self, "_setupViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  objc_msgSend(v3, "viewControllerPresentTray:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController statusIndicatorManager](self, "statusIndicatorManager"));
  objc_msgSend(v4, "updateIndicatorType");

}

- (void)_setupViews
{
  DrivingWalkingSteppingSignGenerator *v3;
  SteppingSignGenerator *signGenerator;
  void *v5;
  UIScrollView *v6;
  UIScrollView *verticalSignScrollView;
  void *v8;
  SteppingPageViewController *v9;
  SteppingPageViewController *pagingVC;
  void *v11;
  UIScrollView *v12;
  void *v13;
  UIButton *v14;
  UIButton *recenterButton;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  UIButton *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double height;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  id v35;

  v3 = -[DrivingWalkingSteppingSignGenerator initWithRoute:]([DrivingWalkingSteppingSignGenerator alloc], "initWithRoute:", self->_route);
  signGenerator = self->_signGenerator;
  self->_signGenerator = (SteppingSignGenerator *)v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingSignGenerator stepsWithCorrespondingSigns](self->_signGenerator, "stepsWithCorrespondingSigns"));
  -[GEOComposedRoute setManeuverDisplaySteps:](self->_route, "setManeuverDisplaySteps:", v5);

  v6 = (UIScrollView *)objc_msgSend(objc_alloc((Class)UIScrollView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  verticalSignScrollView = self->_verticalSignScrollView;
  self->_verticalSignScrollView = v6;

  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_verticalSignScrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_verticalSignScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setScrollEnabled:](self->_verticalSignScrollView, "setScrollEnabled:", 0);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_verticalSignScrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_verticalSignScrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setAccessibilityIdentifier:](self->_verticalSignScrollView, "setAccessibilityIdentifier:", CFSTR("StepContainerVerticalSignScrollView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v8, "addSubview:", self->_verticalSignScrollView);

  v9 = -[SteppingPageViewController initWithSignGenerator:]([SteppingPageViewController alloc], "initWithSignGenerator:", self->_signGenerator);
  pagingVC = self->_pagingVC;
  self->_pagingVC = v9;

  -[SteppingPageViewController setDelegate:](self->_pagingVC, "setDelegate:", self);
  -[SteppingPageViewController setAccessibilityIdentifier:](self->_pagingVC, "setAccessibilityIdentifier:", CFSTR("StepContainerPagingView"));
  -[ContainerViewController addChildViewController:](self, "addChildViewController:", self->_pagingVC);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = self->_verticalSignScrollView;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  -[UIScrollView addSubview:](v12, "addSubview:", v13);

  -[SteppingPageViewController didMoveToParentViewController:](self->_pagingVC, "didMoveToParentViewController:", self);
  -[SteppingSignGenerator setCellVendor:](self->_signGenerator, "setCellVendor:", self->_pagingVC);
  v14 = objc_opt_new(UIButton);
  recenterButton = self->_recenterButton;
  self->_recenterButton = v14;

  -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](self->_recenterButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  -[UIButton setBackgroundColor:](self->_recenterButton, "setBackgroundColor:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
  -[UIButton setTintColor:](self->_recenterButton, "setTintColor:", v17);

  -[UIButton setAccessibilityIdentifier:](self->_recenterButton, "setAccessibilityIdentifier:", CFSTR("RecenterButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Navigation] Recenter"), CFSTR("localized string not found"), 0));
  -[UIButton setAccessibilityLabel:](self->_recenterButton, "setAccessibilityLabel:", v19);

  -[UIButton addTarget:action:forControlEvents:](self->_recenterButton, "addTarget:action:forControlEvents:", self, "_pressedRecenterButton", 64);
  v35 = (id)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
  v20 = self->_recenterButton;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("location.fill"), v35));
  -[UIButton setImage:forState:](v20, "setImage:forState:", v21, 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v22, "setCornerRadius:", 30.0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  LODWORD(v24) = 1045220557;
  objc_msgSend(v23, "setShadowOpacity:", v24);

  height = CGSizeZero.height;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v26, "setShadowOffset:", CGSizeZero.width, height);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_recenterButton, "layer"));
  objc_msgSend(v27, "setShadowRadius:", 1.0);

  -[UIButton _setTouchInsets:](self->_recenterButton, "_setTouchInsets:", -8.0, -16.0, -8.0, -16.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  -[StepContainerViewController setUserTrackingViewVisible:](self, "setUserTrackingViewVisible:", objc_msgSend(v28, "isAuthorizedForPreciseLocation"));

  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v29, "addObserver:selector:name:object:", self, "_locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  objc_msgSend(v30, "addSubview:", self->_recenterButton);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
  -[ContainerViewController edgePadding](self, "edgePadding");
  v33 = v32;
  -[ContainerViewController edgePadding](self, "edgePadding");
  objc_msgSend(v31, "_setCompassInsets:", v33, 0.0, 0.0, v34);

  -[StepContainerViewController _setupConstraints](self, "_setupConstraints");
}

- (void)_setupConstraints
{
  void *v3;
  NSLayoutConstraint *v4;
  NSLayoutConstraint *scrollViewHeightConstraint;
  void *v6;
  void *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *userLocationBottomConstraint;
  void *v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *userLocationLeadingConstraint;
  void *v16;
  void *v17;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *userLocationTrailingConstraint;
  NSLayoutConstraint *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[15];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView heightAnchor](self->_verticalSignScrollView, "heightAnchor"));
  v4 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToConstant:", 0.0));
  scrollViewHeightConstraint = self->_scrollViewHeightConstraint;
  self->_scrollViewHeightConstraint = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](self->_recenterButton, "bottomAnchor"));
  v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));
  userLocationBottomConstraint = self->_userLocationBottomConstraint;
  self->_userLocationBottomConstraint = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](self->_recenterButton, "leadingAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
  v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
  userLocationLeadingConstraint = self->_userLocationLeadingConstraint;
  self->_userLocationLeadingConstraint = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController innerLayoutGuide](self, "innerLayoutGuide"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](self->_recenterButton, "trailingAnchor"));
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  userLocationTrailingConstraint = self->_userLocationTrailingConstraint;
  self->_userLocationTrailingConstraint = v19;

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_verticalSignScrollView, "topAnchor"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "topAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintEqualToAnchor:", v62));
  v65[0] = v61;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_verticalSignScrollView, "bottomAnchor"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "bottomAnchor"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v58));
  v65[1] = v57;
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_verticalSignScrollView, "leadingAnchor"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v54));
  v65[2] = v53;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_verticalSignScrollView, "trailingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "constraintEqualToAnchor:", v50));
  v65[3] = v49;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView widthAnchor](self->_verticalSignScrollView, "widthAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "widthAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v21 = self->_scrollViewHeightConstraint;
  v65[4] = v45;
  v65[5] = v21;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "topAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView topAnchor](self->_verticalSignScrollView, "topAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:", v42));
  v65[6] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView bottomAnchor](self->_verticalSignScrollView, "bottomAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v38));
  v65[7] = v37;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView leadingAnchor](self->_verticalSignScrollView, "leadingAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
  v65[8] = v33;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIScrollView trailingAnchor](self->_verticalSignScrollView, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));
  v65[9] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signHeightConstraint](self->_pagingVC, "signHeightConstraint"));
  v65[10] = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton widthAnchor](self->_recenterButton, "widthAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToConstant:", 60.0));
  v65[11] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton heightAnchor](self->_recenterButton, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToConstant:", 60.0));
  v31 = self->_userLocationBottomConstraint;
  v65[12] = v30;
  v65[13] = v31;
  v65[14] = self->_userLocationLeadingConstraint;
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v65, 15));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

}

- (void)_updateCompassLayout
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
  void *v13;
  void *v14;
  double v15;
  void *v16;
  id v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapView"));
  objc_msgSend(v4, "_compassInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  if (sub_1002A8AA0(self) != 5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "floatingControlsOverlay"));
    objc_msgSend(v14, "margin");
    v12 = v15;

    v6 = v12;
  }
  v17 = (id)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "mapView"));
  objc_msgSend(v16, "_setCompassInsets:", v6, v8, v10, v12);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)StepContainerViewController;
  -[ContainerViewController viewWillAppear:](&v6, "viewWillAppear:", a3);
  -[StepContainerViewController _setupDebugUtilities](self, "_setupDebugUtilities");
  if (-[StepContainerViewController _isTrackingLocation](self, "_isTrackingLocation"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));

    -[StepContainerViewController _updateUserLocationViewAppearanceWithMatchedLocation:](self, "_updateUserLocationViewAppearanceWithMatchedLocation:", v5);
  }
  if (self->_hasDesiredUserTrackingMode)
  {
    self->_mustNotBreakUserTrackingMode = 1;
    -[StepContainerViewController _setUserTrackingMode:animated:](self, "_setUserTrackingMode:animated:", self->_desiredUserTrackingMode, 1);
    self->_hasDesiredUserTrackingMode = 0;
  }
  -[StepContainerViewController _startArrivalEndTimerIfNecessary](self, "_startArrivalEndTimerIfNecessary");
  -[StepContainerViewController _updateIdleTimer](self, "_updateIdleTimer");
  -[StepContainerViewController _updateStatusBarIndicatorLayout](self, "_updateStatusBarIndicatorLayout");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  -[OverlayContainerViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[StepContainerViewController _showInitialStepIfNecessary](self, "_showInitialStepIfNecessary");
}

- (void)_showInitialStepIfNecessary
{
  uint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t initialStepIndex;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v11 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "superview"));
  if (!v3)
  {
    v10 = v11;
LABEL_10:

    return;
  }
  v4 = (void *)v3;
  v5 = -[ContainerViewController containerStyle](self, "containerStyle");

  if (v5)
  {
    initialStepIndex = self->_initialStepIndex;
    if (initialStepIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
      v8 = objc_msgSend(v7, "count");

      if (initialStepIndex < (unint64_t)v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](self->_route, "steps"));
        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", self->_initialStepIndex));

        v10 = v12;
        if (v12)
        {
          -[StepContainerViewController updateWithDisplayedStep:](self, "updateWithDisplayedStep:", v12);
          -[StepContainerViewController _setGizmoStepIndex:](self, "_setGizmoStepIndex:", objc_msgSend(v12, "stepIndex"));
          v10 = v12;
        }
        self->_initialStepIndex = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_10;
      }
    }
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  NavigationDebugViewsController *debugViewsController;
  void *v5;
  NavDebugLocationManager *debugLocationManager;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)StepContainerViewController;
  -[ContainerViewController viewDidDisappear:](&v9, "viewDidDisappear:", a3);
  debugViewsController = self->_debugViewsController;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController overlayView](self, "overlayView"));
  -[NavigationDebugViewsController removeDebugViewsFromView:](debugViewsController, "removeDebugViewsFromView:", v5);

  -[NavDebugLocationManager setMapView:](self->_debugLocationManager, "setMapView:", 0);
  debugLocationManager = self->_debugLocationManager;
  self->_debugLocationManager = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_debugConsole"));
  objc_msgSend(v8, "setCustomTextEnabled:", 0);

  -[StepContainerViewController _invalidateTimers](self, "_invalidateTimers");
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  NSMutableDictionary *v5;
  NSMutableDictionary *isExpandedMapping;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)StepContainerViewController;
  -[ContainerViewController willTransitionToTraitCollection:withTransitionCoordinator:](&v7, "willTransitionToTraitCollection:withTransitionCoordinator:", a3, a4);
  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  isExpandedMapping = self->_isExpandedMapping;
  self->_isExpandedMapping = v5;

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  -[ContainerViewController traitCollectionDidChange:](&v4, "traitCollectionDidChange:", a3);
  -[StepContainerViewController _updateStatusBarIndicatorLayout](self, "_updateStatusBarIndicatorLayout");
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  v6 = objc_msgSend(v5, "originalLayoutForViewController:", v4);

  return (unint64_t)v6;
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)StepContainerViewController;
  -[ContainerViewController updateLayoutAnimated:](&v4, "updateLayoutAnimated:", a3);
  -[StepContainerViewController _updateIdleTimer](self, "_updateIdleTimer");
}

- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3
{
  int *v5;
  int *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)StepContainerViewController;
  -[OverlayContainerViewController containerStyleManagerConfigureLayoutForStyle:](&v14, "containerStyleManagerConfigureLayoutForStyle:");
  v5 = &OBJC_IVAR___StepContainerViewController__userLocationLeadingConstraint;
  v6 = &OBJC_IVAR___StepContainerViewController__userLocationTrailingConstraint;
  v7 = 0.0;
  if (a3 <= 7 && ((1 << a3) & 0xE3) != 0)
  {
    -[ContainerViewController attributionVerticalPadding](self, "attributionVerticalPadding", 0.0);
    v6 = &OBJC_IVAR___StepContainerViewController__userLocationLeadingConstraint;
    v5 = &OBJC_IVAR___StepContainerViewController__userLocationTrailingConstraint;
  }
  -[NSLayoutConstraint setConstant:](self->_userLocationBottomConstraint, "setConstant:", v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v5), "setActive:", 0);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v6), "setActive:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "layer"));
  objc_msgSend(v9, "cornerRadius");
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController view](self->_pagingVC, "view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "layer"));
  objc_msgSend(v13, "setCornerRadius:", v11);

}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  if (!-[StepContainerViewController isVLFActive](self, "isVLFActive"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v4 = objc_opt_respondsToSelector(v3, "maxLayoutForEdgeInsetsUpdate");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  v6 = objc_msgSend(v5, "maxLayoutForEdgeInsetsUpdate");

  return (unint64_t)v6;
}

- (double)topEdgeInset
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  if (-[StepContainerViewController isVLFActive](self, "isVLFActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
    objc_msgSend(v4, "safeAreaInsets");
    v6 = v5;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)StepContainerViewController;
    -[OverlayContainerViewController topEdgeInset](&v9, "topEdgeInset");
    return v7;
  }
  return v6;
}

- (double)availableHeight
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  objc_super v23;
  CGRect v24;
  CGRect v25;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  if (objc_msgSend(v3, "userInterfaceIdiom") == (id)1)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (v5 != (id)5)
    {
LABEL_9:
      v23.receiver = self;
      v23.super_class = (Class)StepContainerViewController;
      -[ContainerViewController availableHeight](&v23, "availableHeight");
      return v21;
    }
  }
  v6 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v6 > 6 || ((1 << v6) & 0x54) == 0)
    goto LABEL_9;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v10, "frame");
  v11 = v9 - CGRectGetMaxY(v24);
  -[ContainerViewController edgePadding](self, "edgePadding");
  v13 = v11 - v12;
  v14 = 0.0;
  if (v13 >= 0.0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
    objc_msgSend(v15, "bounds");
    v17 = v16;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    objc_msgSend(v18, "frame");
    v19 = v17 - CGRectGetMaxY(v25);
    -[ContainerViewController edgePadding](self, "edgePadding");
    v14 = v19 - v20;

  }
  return v14;
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)StepContainerViewController;
  -[ContainerViewController containerStyleManagerDidChangeStyle:](&v5, "containerStyleManagerDidChangeStyle:", a3);
  -[StepContainerViewController _showInitialStepIfNecessary](self, "_showInitialStepIfNecessary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

}

- (id)passThroughView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "passThroughView"));

  return v3;
}

- (void)_pressedRecenterButton
{
  -[StepContainerViewController _setUserTrackingMode:animated:](self, "_setUserTrackingMode:animated:", 2, 1);
}

- (MKMapView)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (MapCameraController)mapCameraController
{
  MapCameraController *mapCameraController;
  MapCameraController *v4;
  void *v5;
  MapCameraController *v6;
  MapCameraController *v7;

  mapCameraController = self->_mapCameraController;
  if (!mapCameraController)
  {
    v4 = [MapCameraController alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
    v6 = -[MapCameraController initWithMapView:](v4, "initWithMapView:", v5);
    v7 = self->_mapCameraController;
    self->_mapCameraController = v6;

    mapCameraController = self->_mapCameraController;
  }
  return mapCameraController;
}

- (void)_updateMapRegionForSignAtIndex:(int64_t)a3
{
  void *v5;
  unint64_t matchedStepIndex;
  void *v7;
  _QWORD v8[5];

  if (!self->_userIsInteractingWithMap)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
    matchedStepIndex = self->_matchedStepIndex;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100B0D4A8;
    v8[3] = &unk_1011E29E0;
    v8[4] = self;
    objc_msgSend(v5, "rectForSignAtIndex:currentStepIndex:handler:", a3, matchedStepIndex, v8);

    if (self->_showingOverview)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
      objc_msgSend(v7, "viewController:showOverview:zoomToMapRegion:", self, 0, 0);

    }
  }
}

- (void)_setUserTrackingMode:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  id v8;
  id v9;

  v4 = a4;
  if (a3 && self->_matchedStepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
    v8 = objc_msgSend(v7, "signIndexForStepIndex:", self->_matchedStepIndex);

    -[SteppingPageViewController setSignIndex:](self->_pagingVC, "setSignIndex:", v8);
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
  objc_msgSend(v9, "setUserTrackingMode:animated:", a3, v4);

}

- (void)_locationManagerApprovalDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B0D67C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)setUserTrackingViewVisible:(BOOL)a3
{
  -[StepContainerViewController setUserTrackingViewVisible:animated:](self, "setUserTrackingViewVisible:animated:", a3, 0);
}

- (void)setUserTrackingViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  UIButton *v6;
  UIButton *v7;
  void ***v8;
  UIButton *v9;
  void ***v10;
  void **v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  UIButton *v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  UIButton *v21;
  BOOL v22;

  if (self->_userTrackingViewVisible != a3)
  {
    v4 = a4;
    self->_userTrackingViewVisible = a3;
    v6 = self->_recenterButton;
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_100B0D834;
    v20 = &unk_1011ACE58;
    v7 = v6;
    v21 = v7;
    v22 = a3;
    v8 = objc_retainBlock(&v17);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_100B0D874;
    v14 = &unk_1011AF4D8;
    v15 = v7;
    LOBYTE(v16) = a3;
    v9 = v7;
    v10 = objc_retainBlock(&v11);
    if (v4)
    {
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, v10, 0.25, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
    }
    else
    {
      ((void (*)(void ***))v8[2])(v8);
      ((void (*)(void ***, uint64_t))v10[2])(v10, 1);
    }

  }
}

- (void)_updateUserLocationViewAppearanceWithMatchedLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  NSTimer *v26;
  NSTimer *locationExpirationTimer;
  _QWORD v28[4];
  id v29;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeContext](self, "chromeContext"));
  v7 = objc_msgSend(v5, "isCurrentContext:", v6);

  if (v4 && v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "step"));

    v10 = -[StepContainerViewController _isStepOnTransitLine:](self, "_isStepOnTransitLine:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
    v12 = objc_msgSend(v11, "_shouldSplitRouteLine");

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "userLocationView"));

    if (v14)
    {
      v12 = (id)(objc_msgSend(v4, "isDirectional") & v10);
      objc_msgSend(v14, "updateStateFromLocation:duration:", v4, 0.0);
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
    v16 = objc_msgSend(v15, "_shouldSplitRouteLine");

    if ((_DWORD)v12 != v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
      objc_msgSend(v17, "_setShouldSplitRouteLine:", v12);

    }
    v18 = -[StepContainerViewController _shouldShowHeadingIndicatorForStep:](self, "_shouldShowHeadingIndicatorForStep:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
    objc_msgSend(v19, "_setShowHeadingIndicatorForStepping:", v18);

    -[NSTimer invalidate](self->_locationExpirationTimer, "invalidate");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));

    if (v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
      objc_msgSend(v21, "timeIntervalSinceNow");
      v22 = 0.0;
      if (v23 > 0.0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "expirationDate"));
        objc_msgSend(v24, "timeIntervalSinceNow");
        v22 = v25;

      }
      objc_initWeak(&location, self);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100B0DB24;
      v28[3] = &unk_1011ADF20;
      objc_copyWeak(&v29, &location);
      v26 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v28, v22));
      locationExpirationTimer = self->_locationExpirationTimer;
      self->_locationExpirationTimer = v26;

      objc_destroyWeak(&v29);
      objc_destroyWeak(&location);
    }

  }
}

- (BOOL)_isStepOnTransitLine:(id)a3
{
  id v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "routeSegmentType") == (id)6)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "maneuver") == 4 || objc_msgSend(v5, "maneuver") == 5;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_shouldShowHeadingIndicatorForStep:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned int v7;
  unsigned __int8 v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  v6 = objc_msgSend(v5, "isAuthorizedForPreciseLocation");

  if (v4 && objc_msgSend(v4, "transportType") == 1)
  {
    v7 = objc_msgSend(v4, "maneuver");
    if (((0x27u >> (v7 - 4)) & 1) != 0)
      v8 = 0;
    else
      v8 = v6;
    if (v7 - 4 <= 5)
      v6 = v8;
  }

  return v6;
}

- (void)_updateForMatchedStepIndex:(unint64_t)a3 matchedSegmentIndex:(unint64_t)a4
{
  unint64_t matchedStepIndex;
  void *v7;
  unsigned int v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  void *v13;
  id v14;
  void *v15;
  unint64_t matchedSignIndex;
  int64_t v17;
  void *v18;
  id v19;
  id v20;

  matchedStepIndex = self->_matchedStepIndex;
  -[SteppingSignGenerator signIndexForStepIndex:](self->_signGenerator, "signIndexForStepIndex:", a3, a4);
  self->_matchedStepIndex = a3;
  if (self->_isGoingToEnterGuidance)
    self->_isGoingToEnterGuidance = 0;
  v20 = (id)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self->_pagingVC, "collectionView"));
  if (objc_msgSend(v20, "isTracking"))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController collectionView](self->_pagingVC, "collectionView"));
  if (objc_msgSend(v7, "isDragging"))
  {

LABEL_6:
    return;
  }
  v8 = -[StepContainerViewController _isTrackingLocation](self, "_isTrackingLocation");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
    v10 = (unint64_t)objc_msgSend(v9, "signIndexForStepIndex:", a3);

    v11 = v10 >= 0x7FFFFFFFFFFFFFFFLL ? 0x7FFFFFFFFFFFFFFFLL : v10;
    v12 = -[SteppingPageViewController signIndex](self->_pagingVC, "signIndex");
    if (a3 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v11 == v12)
      {
        if (matchedStepIndex == a3)
          return;
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
        v14 = objc_msgSend(v13, "userTrackingMode");

        if (!v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segmentForStepIndex:](self->_route, "segmentForStepIndex:", a3));
          if (objc_msgSend(v15, "type") == (id)6)
            -[StepContainerViewController _updateMapRegionForSignAtIndex:](self, "_updateMapRegionForSignAtIndex:", v11);

        }
      }
      else
      {
        matchedSignIndex = self->_matchedSignIndex;
        if (matchedSignIndex != 0x7FFFFFFFFFFFFFFFLL && v11 <= matchedSignIndex)
          return;
        v17 = -[SteppingPageViewController signIndex](self->_pagingVC, "signIndex");
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
        v19 = objc_msgSend(v18, "signIndexForStepIndex:", a3);

        if (v17 >= (uint64_t)v19)
          return;
        -[SteppingPageViewController setSignIndex:](self->_pagingVC, "setSignIndex:", v11);
        self->_matchedSignIndex = v11;
      }
      -[StepContainerViewController _setGizmoStepIndex:](self, "_setGizmoStepIndex:", a3);
    }
  }
}

- (void)mapViewDidFinishLoadingMap:(id)a3
{
  self->_userIsInteractingWithMap = 0;
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  self->_userIsInteractingWithMap = 1;
  -[StepContainerViewController _stopArrivalEndTimer](self, "_stopArrivalEndTimer", a3);
}

- (void)mapViewDidStopUserInteraction:(id)a3
{
  NSDate *v4;
  NSDate *lastMapTouchDate;

  self->_userIsInteractingWithMap = 0;
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date", a3));
  lastMapTouchDate = self->_lastMapTouchDate;
  self->_lastMapTouchDate = v4;

  -[StepContainerViewController _startArrivalEndTimerIfNecessary](self, "_startArrivalEndTimerIfNecessary");
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  if (self->_userIsInteractingWithMap)
    self->_mustNotBreakUserTrackingMode = 0;
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  return -[NavDebugLocationManager rendererForOverlay:](self->_debugLocationManager, "rendererForOverlay:", a4);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  return -[NavDebugLocationManager viewForAnnotation:](self->_debugLocationManager, "viewForAnnotation:", a4);
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  v7 = objc_msgSend(v6, "canSelectVKLabelMarker:", v5);

  return v7;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  objc_msgSend(v6, "selectVKLabelMarker:", v5);

}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  objc_msgSend(v6, "deselectVKLabelMarker:", v5);

}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;

  v15 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "annotation"));
  objc_msgSend(v6, "deselectAnnotation:animated:", v7, 0);

  v8 = objc_opt_class(MapsUserLocationView);
  if ((objc_opt_isKindOfClass(v15, v8) & 1) != 0 && objc_msgSend(v15, "isVLFPuckVisible"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appCoordinator"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "auxiliaryTasksManager"));
    v13 = objc_msgSend(v12, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    objc_msgSend(v14, "showVLFUI");
  }

}

- (void)mapViewDidFinishInitialUserTrackingModeAnimation:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  id v21;

  v21 = a3;
  if (objc_msgSend(v21, "userTrackingMode"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNLocation routeMatch](self->_previousMatchedLocation, "routeMatch"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitTripStep"));

    if (objc_msgSend(v5, "maneuver") == 5)
    {
      v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "previousTransitStep"));

      v5 = (void *)v6;
    }
    if (-[StepContainerViewController _isStepOnTransitLine:](self, "_isStepOnTransitLine:", v5))
    {
      objc_msgSend(v5, "startGeoCoordinate");
      v8 = v7;
      v10 = v9;
      v11 = objc_msgSend(v5, "endGeoCoordinate");
      v14 = fmin(GEOCalculateDistance(v11, v8, v10, v12, v13) * 3.3, 8000.0);
      v15 = v14 - v14 * 0.2;
      v16 = v14 + v14 * 0.2;
    }
    else
    {
      v15 = 0.0;
      v14 = 1500.0;
      v16 = 4500.0;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "camera"));
    objc_msgSend(v17, "altitude");
    if (v18 < v15 || (objc_msgSend(v17, "altitude"), v16 < v19))
    {
      v20 = objc_msgSend(v17, "copy");

      objc_msgSend(v20, "setAltitude:", v14);
      objc_msgSend(v21, "setCamera:animated:", v20, 1);
      v17 = v20;
    }

  }
}

- (void)steppingPageViewController:(id)a3 didChangeCurrentSign:(int64_t)a4 previousSign:(int64_t)a5 fromUserGesture:(unint64_t)a6
{
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;

  v23 = a3;
  if (a6)
    -[StepContainerViewController _startArrivalEndTimerIfNecessary](self, "_startArrivalEndTimerIfNecessary");
  if (a4 != a5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController route](self, "route"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepAtSignIndex:", -[SteppingPageViewController signIndex](self->_pagingVC, "signIndex")));

    if (v12)
      v13 = (uint64_t)objc_msgSend(v12, "stepIndex");
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    v14 = objc_msgSend(v10, "segmentIndexForStepIndex:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "trayContaineeViewController"));
    objc_msgSend(v16, "setCurrentStepIndex:", v13);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView"));
    objc_msgSend(v17, "_setRouteContextInspectedSegmentIndex:inspectedStepIndex:", v14, v13);

    if ((unint64_t)a4 <= 0x7FFFFFFFFFFFFFFELL)
      objc_msgSend(v10, "setCurrentDisplayStep:", a4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v18, "timeIntervalSinceDate:", self->_lastMapTouchDate);
    v20 = v19;

    if (a6
      || (!self->_lastMapTouchDate || v20 > 4.0)
      && (v21 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController mapView](self, "mapView")),
          v22 = objc_msgSend(v21, "userTrackingMode"),
          v21,
          !v22))
    {
      -[StepContainerViewController _updateMapRegionForSignAtIndex:](self, "_updateMapRegionForSignAtIndex:", a4);
    }
    -[StepContainerViewController _setGizmoStepIndex:](self, "_setGizmoStepIndex:", v13);

  }
}

- (void)steppingPageViewControllerUserDidStartScrolling:(id)a3
{
  self->_mustNotBreakUserTrackingMode = 0;
  -[StepContainerViewController _setUserTrackingMode:animated:](self, "_setUserTrackingMode:animated:", 0, 1);
  -[StepContainerViewController _stopArrivalEndTimer](self, "_stopArrivalEndTimer");
}

- (void)steppingPageViewControllerDidChangeSignHeight:(id)a3
{
  int *v3;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned int v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  -[StepContainerViewController maximumSignHeight](self, "maximumSignHeight");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signHeightConstraint"));
  objc_msgSend(v7, "constant");
  v9 = v8;

  if (v9 <= v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "signHeightConstraint"));
    objc_msgSend(v10, "constant");
    v3 = &OBJC_IVAR___StepContainerViewController__verticalSignScrollView;
    -[NSLayoutConstraint setConstant:](self->_scrollViewHeightConstraint, "setConstant:");

    -[UIScrollView setScrollEnabled:](self->_verticalSignScrollView, "setScrollEnabled:", 0);
  }
  else
  {
    -[UIScrollView setScrollEnabled:](self->_verticalSignScrollView, "setScrollEnabled:", 1);
    -[NSLayoutConstraint setConstant:](self->_scrollViewHeightConstraint, "setConstant:", v6);
  }
  v11 = -[ContainerViewController containeeLayout](self, "containeeLayout");
  if (v11 - 3 < 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v12, "userInterfaceIdiom") == (id)1)
    {

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      v19 = objc_msgSend(v18, "userInterfaceIdiom");

      if (v19 != (id)5)
        goto LABEL_18;
    }
    goto LABEL_16;
  }
  if (v11 == 5)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    v14 = objc_msgSend(v13, "userInterfaceIdiom");
    if (v14 != (id)1)
    {
      v3 = (int *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v3, "userInterfaceIdiom") != (id)5)
        goto LABEL_17;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "cardPresentationController"));
    v17 = objc_msgSend(v16, "presentedModally");

    if (v14 == (id)1)
    {

      if (!v17)
        goto LABEL_18;
      goto LABEL_16;
    }

    if ((v17 & 1) != 0)
    {
LABEL_16:
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
      v3 = (int *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "cardPresentationController"));
      objc_msgSend(v3, "updateHeightForCurrentLayout");
LABEL_17:

    }
  }
LABEL_18:

}

- (double)maximumSignHeight
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
  objc_msgSend(v6, "frame");
  v8 = v5 - v7;
  -[ContainerViewController edgePadding](self, "edgePadding");
  v10 = v8 - v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "trayContaineeViewController"));
  objc_msgSend(v12, "heightForLayout:", 1);
  v14 = v10 - v13;
  v15 = 512.0;
  if (v14 < 512.0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
    objc_msgSend(v16, "bounds");
    v18 = v17;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[OverlayContainerViewController topContentView](self, "topContentView"));
    objc_msgSend(v19, "frame");
    v21 = v18 - v20;
    -[ContainerViewController edgePadding](self, "edgePadding");
    v23 = v21 - v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trayContaineeViewController"));
    objc_msgSend(v25, "heightForLayout:", 1);
    v15 = v23 - v26;

  }
  return v15;
}

- (void)_willEnterForeground:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSTimer *backgroundArrivalTimer;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "object"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "window"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "windowScene"));

  v7 = v9;
  if (v9 == v6)
  {
    -[NSTimer invalidate](self->_backgroundArrivalTimer, "invalidate");
    backgroundArrivalTimer = self->_backgroundArrivalTimer;
    self->_backgroundArrivalTimer = 0;

    v7 = v9;
  }

}

- (void)_didEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  MNLocation *previousMatchedLocation;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  NSTimer *v18;
  NSTimer *backgroundArrivalTimer;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  if (v5 == v8)
  {
    previousMatchedLocation = self->_previousMatchedLocation;
    if (previousMatchedLocation)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MNLocation routeMatch](previousMatchedLocation, "routeMatch"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "step"));

      if (v11)
      {
        if (objc_msgSend(v11, "isArrivalStep"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
          objc_msgSend(v12, "pressedEndWithSender:", self);
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segmentForStepIndex:](self->_route, "segmentForStepIndex:", objc_msgSend(v11, "stepIndex")));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute segments](self->_route, "segments"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lastObject"));

          if (v14 == v12)
          {
            objc_msgSend(v12, "expectedTime");
            v16 = 15.0;
            if (v15 * 3.0 >= 15.0)
            {
              objc_msgSend(v12, "expectedTime");
              v16 = v17 * 3.0;
            }
            objc_initWeak(&location, self);
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_100B0EAB0;
            v20[3] = &unk_1011ADF20;
            objc_copyWeak(&v21, &location);
            v18 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, v16));
            backgroundArrivalTimer = self->_backgroundArrivalTimer;
            self->_backgroundArrivalTimer = v18;

            objc_destroyWeak(&v21);
            objc_destroyWeak(&location);
          }
        }

      }
    }
  }

}

- (void)_startArrivalEndTimerIfNecessary
{
  NSTimer *v3;
  NSTimer *arrivalEndTimer;
  _QWORD v5[4];
  id v6;
  id location;

  if (self->_hasArrived)
  {
    -[StepContainerViewController _stopArrivalEndTimer](self, "_stopArrivalEndTimer");
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100B0EBC8;
    v5[3] = &unk_1011ADF20;
    objc_copyWeak(&v6, &location);
    v3 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v5, 15.0));
    arrivalEndTimer = self->_arrivalEndTimer;
    self->_arrivalEndTimer = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

- (void)_stopArrivalEndTimer
{
  NSTimer *arrivalEndTimer;

  -[NSTimer invalidate](self->_arrivalEndTimer, "invalidate");
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

}

- (void)_arrivalEndTimerFired
{
  NSTimer *arrivalEndTimer;
  NSTimer *backgroundArrivalTimer;
  id v5;

  -[NSTimer invalidate](self->_arrivalEndTimer, "invalidate");
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

  -[NSTimer invalidate](self->_backgroundArrivalTimer, "invalidate");
  backgroundArrivalTimer = self->_backgroundArrivalTimer;
  self->_backgroundArrivalTimer = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  objc_msgSend(v5, "pressedEndWithSender:", self);

}

- (void)_locationExpirationTimerFired
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "userLocationView"));

  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "isStale");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(v5, "locationManagerFailedToUpdateLocation");
      v3 = v5;
    }
  }

}

- (void)_backgroundArrivalTimerFired
{
  NSTimer *arrivalEndTimer;
  NSTimer *backgroundArrivalTimer;
  id v5;

  -[NSTimer invalidate](self->_arrivalEndTimer, "invalidate");
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

  -[NSTimer invalidate](self->_backgroundArrivalTimer, "invalidate");
  backgroundArrivalTimer = self->_backgroundArrivalTimer;
  self->_backgroundArrivalTimer = 0;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator"));
  objc_msgSend(v5, "pressedEndWithSender:", self);

}

- (void)_delayTimerFired
{
  NSTimer *delayAutoAdvanceTimer;
  MNLocation *previousMatchedLocation;
  id v5;
  void *v6;
  id v7;
  id v8;

  delayAutoAdvanceTimer = self->_delayAutoAdvanceTimer;
  self->_delayAutoAdvanceTimer = 0;

  previousMatchedLocation = self->_previousMatchedLocation;
  if (previousMatchedLocation)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[MNLocation routeMatch](previousMatchedLocation, "routeMatch"));
    v5 = objc_msgSend(v8, "stepIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "route"));
    v7 = objc_msgSend(v6, "segmentIndexForStepIndex:", v5);

    -[StepContainerViewController _updateForMatchedStepIndex:matchedSegmentIndex:](self, "_updateForMatchedStepIndex:matchedSegmentIndex:", v5, v7);
  }
}

- (void)_invalidateTimers
{
  NSTimer *arrivalEndTimer;
  NSTimer *backgroundArrivalTimer;
  NSTimer *locationExpirationTimer;
  NSTimer *delayAutoAdvanceTimer;

  -[NSTimer invalidate](self->_arrivalEndTimer, "invalidate");
  arrivalEndTimer = self->_arrivalEndTimer;
  self->_arrivalEndTimer = 0;

  -[NSTimer invalidate](self->_backgroundArrivalTimer, "invalidate");
  backgroundArrivalTimer = self->_backgroundArrivalTimer;
  self->_backgroundArrivalTimer = 0;

  -[NSTimer invalidate](self->_locationExpirationTimer, "invalidate");
  locationExpirationTimer = self->_locationExpirationTimer;
  self->_locationExpirationTimer = 0;

  -[NSTimer invalidate](self->_delayAutoAdvanceTimer, "invalidate");
  delayAutoAdvanceTimer = self->_delayAutoAdvanceTimer;
  self->_delayAutoAdvanceTimer = 0;

  -[StepContainerViewController setIdleTimer:](self, "setIdleTimer:", 0);
}

- (void)_setGizmoStepIndex:(unint64_t)matchedStepIndex
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
  v6 = objc_msgSend(v5, "signIndexForStepIndex:", self->_matchedStepIndex);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
  v8 = objc_msgSend(v7, "signIndexForStepIndex:", matchedStepIndex);

  if (v6 == v8)
    matchedStepIndex = self->_matchedStepIndex;
  v9 = (id)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v9, "setDisplayedStepIndex:", matchedStepIndex);

}

- (BOOL)_isTrackingLocation
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "isTrackingCurrentLocation");

  return v3;
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  NavDebugLocationManager *debugLocationManager;
  void *v7;
  id v8;

  objc_storeStrong((id *)&self->_previousMatchedLocation, a4);
  v8 = a4;
  -[StepContainerViewController _updateUserLocationViewAppearanceWithMatchedLocation:](self, "_updateUserLocationViewAppearanceWithMatchedLocation:", v8);
  debugLocationManager = self->_debugLocationManager;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rawLocation"));
  -[NavDebugLocationManager addLocation:](debugLocationManager, "addLocation:", v7);

  -[StepContainerViewController _updateDebugConsoleForLocation:](self, "_updateDebugConsoleForLocation:", v8);
}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  double Double;
  double v12;
  double v13;
  double v14;
  double v15;
  NSTimer *v16;
  NSTimer *delayAutoAdvanceTimer;
  _QWORD v18[4];
  id v19;
  id location;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDebugViewsController tracePlayer](self->_debugViewsController, "tracePlayer"));
  Double = GEOConfigGetDouble(MapsConfig_SteppingModeAutoSteppingDelay, off_1014B30B8);
  if (v10)
    objc_msgSend(v10, "speedMultiplier");
  else
    v12 = 1.0;
  v13 = Double / v12;
  objc_msgSend(v9, "timeIntervalSinceDate:", self->_startDate);
  if (v14 >= v13)
  {
    -[StepContainerViewController _updateForMatchedStepIndex:matchedSegmentIndex:](self, "_updateForMatchedStepIndex:matchedSegmentIndex:", a4, a5);
  }
  else if (!self->_delayAutoAdvanceTimer)
  {
    v15 = v13 - v14;
    objc_initWeak(&location, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100B0F1EC;
    v18[3] = &unk_1011ADF20;
    objc_copyWeak(&v19, &location);
    v16 = (NSTimer *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v18, v15));
    delayAutoAdvanceTimer = self->_delayAutoAdvanceTimer;
    self->_delayAutoAdvanceTimer = v16;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  self->_hasArrived = objc_msgSend(v7, "isLegIndexOfLastLeg:", a5);

  if (self->_hasArrived)
    -[StepContainerViewController _startArrivalEndTimerIfNecessary](self, "_startArrivalEndTimerIfNecessary");
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v6;

  if (!a5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController stepActionCoordinator](self, "stepActionCoordinator", a3, a4));
    objc_msgSend(v6, "pressedEndWithSender:", self);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = objc_msgSend(v7, "isNavigatingFromTrace");

  if (v8)
    -[StepContainerViewController _toggleTraceControls](self, "_toggleTraceControls");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController"));
  if (objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___MapViewResponderHandling))
    objc_msgSend(v9, "didTapMapView:atPoint:", v10, x, y);

}

- (int64_t)preferredStatusBarStyle
{
  int64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;

  if (!-[StepContainerViewController isVLFActive](self, "isVLFActive"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v4, "userInterfaceIdiom") != (id)1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v5, "userInterfaceIdiom") != (id)5)
      {
        v6 = -[ContainerViewController containerStyle](self, "containerStyle");
        if (v6 <= 7 && ((1 << v6) & 0xE3) != 0)
        {

          v3 = 1;
          goto LABEL_10;
        }
      }

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController theme](self, "theme"));
    v3 = (int64_t)objc_msgSend(v4, "statusBarStyle");
LABEL_10:

    return v3;
  }
  return 0;
}

- (id)statusBarBackgroundViewStyle
{
  void *v3;
  void *v4;
  StatusBarBackgroundViewStyle *v5;
  unint64_t v7;
  StatusBarBackgroundViewStyle *v8;
  void *v9;
  void *v10;

  if (!-[StepContainerViewController isVLFActive](self, "isVLFActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v3, "userInterfaceIdiom") != (id)1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
      if (objc_msgSend(v4, "userInterfaceIdiom") != (id)5)
      {
        v7 = -[ContainerViewController containerStyle](self, "containerStyle");
        if (v7 <= 7 && ((1 << v7) & 0xE3) != 0)
        {

          v8 = [StatusBarBackgroundViewStyle alloc];
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController theme](self, "theme"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navSignPrimaryColor"));
          v5 = -[StatusBarBackgroundViewStyle initWithColor:](v8, "initWithColor:", v10);

          return v5;
        }
      }

    }
  }
  v5 = (StatusBarBackgroundViewStyle *)objc_claimAutoreleasedReturnValue(+[StatusBarBackgroundViewStyle defaultBlurredStyleWithDefaultColorProvider:](StatusBarBackgroundViewStyle, "defaultBlurredStyleWithDefaultColorProvider:", &stru_1011BE7E0));
  return v5;
}

- (BOOL)showStatusBarBackgroundViewWhenResigning
{
  return 1;
}

- (BOOL)showStatusBarBackgroundViewUnderDimmingView
{
  return 1;
}

- (StatusIndicatorView)statusIndicatorView
{
  StatusIndicatorView *statusIndicatorView;
  StatusIndicatorView *v4;
  StatusIndicatorView *v5;

  statusIndicatorView = self->_statusIndicatorView;
  if (!statusIndicatorView)
  {
    v4 = -[StatusIndicatorView initForLimitedMode:]([StatusIndicatorView alloc], "initForLimitedMode:", 1);
    v5 = self->_statusIndicatorView;
    self->_statusIndicatorView = v4;

    statusIndicatorView = self->_statusIndicatorView;
  }
  return statusIndicatorView;
}

- (void)statusIndicatorTypeChanged:(unint64_t)a3
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  objc_msgSend(v5, "setType:", a3);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("statusBarSupplementaryView"), 1);

}

- (void)_updateStatusBarIndicatorLayout
{
  unint64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[ContainerViewController containerStyle](self, "containerStyle");
  if (v3 < 8 && ((0xE3u >> v3) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController traitCollection](self, "traitCollection"));
    if (objc_msgSend(v4, "userInterfaceStyle") == (id)2)
      v5 = 1;
    else
      v5 = 3;

  }
  -[StatusIndicatorView updateWithStatusBarStyle:](self->_statusIndicatorView, "updateWithStatusBarStyle:", v5);
}

- (id)statusBarSupplementaryView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  if (objc_msgSend(v3, "isVisible"))
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController statusIndicatorView](self, "statusIndicatorView"));
  else
    v4 = 0;

  return v4;
}

- (void)_updateIdleTimer
{
  void *v3;
  void *v4;
  NavIdleTimeoutTimer *v5;
  void *v6;
  void *v7;
  NavIdleTimeoutTimer *v8;
  id v9;

  if (-[StepContainerViewController isViewLoaded](self, "isViewLoaded")
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window")),
        v4,
        v3,
        v4)
    && (id)-[ContainerViewController containeeLayout](self, "containeeLayout") != (id)1)
  {
    v5 = [NavIdleTimeoutTimer alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController view](self, "view"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
    v8 = -[NavIdleTimeoutTimer initWithWindow:](v5, "initWithWindow:", v7);
    -[StepContainerViewController setIdleTimer:](self, "setIdleTimer:", v8);

    v9 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController idleTimer](self, "idleTimer"));
    objc_msgSend(v9, "setDelegate:", self);

  }
  else
  {
    -[StepContainerViewController setIdleTimer:](self, "setIdleTimer:", 0);
  }
}

- (void)idleTimerDidTimeout:(id)a3
{
  void *v4;
  uint64_t v5;
  char isKindOfClass;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController currentViewController](self, "currentViewController", a3));
  v5 = objc_opt_class(NavTrayViewController);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
    -[ContainerViewController setLayoutIfSupported:animated:](self, "setLayoutIfSupported:animated:", 1, 1);
}

- (void)vlfSessionTaskWillShowVLFUINotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setHidden:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController recenterButton](self, "recenterButton"));
  objc_msgSend(v6, "setHidden:", 1);

  -[StepContainerViewController setVlfActive:](self, "setVlfActive:", 1);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
  objc_msgSend(v5, "setHidden:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController recenterButton](self, "recenterButton"));
  objc_msgSend(v6, "setHidden:", 0);

  -[StepContainerViewController setVlfActive:](self, "setVlfActive:", 0);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("statusBarStyle"), 0);

}

- (id)_geoRouteDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  GEORouteDetails *v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stepAtSignIndex:", -[SteppingPageViewController signIndex](self->_pagingVC, "signIndex")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastLocation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeMatch"));
  v8 = objc_msgSend(v7, "isGoodMatch");

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController route](self, "route"));
  v10 = objc_msgSend(v9, "_maps_routeIndex");

  if (v4)
    v11 = (uint64_t)objc_msgSend(v4, "stepIndex");
  else
    v11 = 0xFFFFFFFFLL;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SteppingPageViewController signGenerator](self->_pagingVC, "signGenerator"));
  v13 = objc_msgSend(v12, "signIndexForStepIndex:", self->_matchedStepIndex);

  v14 = v13 == (id)-[SteppingPageViewController signIndex](self->_pagingVC, "signIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mapView"));
  v17 = objc_msgSend(v16, "userTrackingMode") != 0;

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRequest"));
  objc_msgSend(v19, "requestTime");
  v21 = v20;

  v22 = +[GEORouteDetails routeDetailsWithResultIndex:stepID:nearRoute:nearCurrentlyDisplayedStep:userTrackingOn:timeSinceResponse:](GEORouteDetails, "routeDetailsWithResultIndex:stepID:nearRoute:nearCurrentlyDisplayedStep:userTrackingOn:timeSinceResponse:", v10, v11, v8, v14, v17, CFAbsoluteTimeGetCurrent() - v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  return v23;
}

- (NSDateComponentsFormatter)debugMinsDurationFormatter
{
  NSDateComponentsFormatter *debugMinsDurationFormatter;
  NSDateComponentsFormatter *v4;
  NSDateComponentsFormatter *v5;

  debugMinsDurationFormatter = self->_debugMinsDurationFormatter;
  if (!debugMinsDurationFormatter)
  {
    v4 = (NSDateComponentsFormatter *)objc_alloc_init((Class)NSDateComponentsFormatter);
    -[NSDateComponentsFormatter setZeroFormattingBehavior:](v4, "setZeroFormattingBehavior:", 0);
    -[NSDateComponentsFormatter setUnitsStyle:](v4, "setUnitsStyle:", 0);
    -[NSDateComponentsFormatter setAllowedUnits:](v4, "setAllowedUnits:", 192);
    v5 = self->_debugMinsDurationFormatter;
    self->_debugMinsDurationFormatter = v4;

    debugMinsDurationFormatter = self->_debugMinsDurationFormatter;
  }
  return debugMinsDurationFormatter;
}

- (NSDateComponentsFormatter)debugHoursDurationFormatter
{
  NSDateComponentsFormatter *debugHoursDurationFormatter;
  void *v4;
  NSDateComponentsFormatter *v5;
  NSDateComponentsFormatter *v6;

  debugHoursDurationFormatter = self->_debugHoursDurationFormatter;
  if (!debugHoursDurationFormatter)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController debugMinsDurationFormatter](self, "debugMinsDurationFormatter"));
    v5 = (NSDateComponentsFormatter *)objc_msgSend(v4, "copy");

    -[NSDateComponentsFormatter setAllowedUnits:](v5, "setAllowedUnits:", -[NSDateComponentsFormatter allowedUnits](v5, "allowedUnits") | 0x20);
    v6 = self->_debugHoursDurationFormatter;
    self->_debugHoursDurationFormatter = v5;

    debugHoursDurationFormatter = self->_debugHoursDurationFormatter;
  }
  return debugHoursDurationFormatter;
}

- (void)_updateDebugConsoleForLocation:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __CFString *v20;
  char *v21;
  __CFString *v22;
  void *v23;
  unsigned __int8 v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v37 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform"));
  v5 = objc_msgSend(v4, "isInternalInstall");

  v6 = v37;
  if (v5)
  {
    if (v37)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "routeMatch"));
      objc_msgSend(v7, "locationCoordinate");
      v9 = v8;
      v11 = v10;
      v12 = objc_msgSend(v7, "routeCoordinate");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "step"));
      if (objc_msgSend(v13, "transportType") == 1)
        v14 = v13;
      else
        v14 = 0;
      v15 = v14;
      v16 = v15;
      if (v15)
      {
        v17 = objc_msgSend(v15, "maneuver");
        if (v17 >= 0xB)
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v17));
        else
          v18 = *(&off_1011E2A30 + (int)v17);
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lowercaseString"));

      }
      else
      {
        v21 = (char *)objc_msgSend(v13, "routeSegmentType") - 1;
        if ((unint64_t)v21 > 5)
          v22 = CFSTR("unknown");
        else
          v22 = *(&off_1011E2A00 + (_QWORD)v21);
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v24 = objc_msgSend(v23, "isNavigatingFromTrace");

      if ((v24 & 1) != 0)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
        objc_msgSend(v25, "tracePosition");
      }
      else
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v25, "timeIntervalSinceDate:", self->_startDate);
      }
      v27 = v26;

      if (v27 >= 3600.0)
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController debugHoursDurationFormatter](self, "debugHoursDurationFormatter"));
      else
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController debugMinsDurationFormatter](self, "debugMinsDurationFormatter"));
      v29 = v28;
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "stringFromTimeInterval:", v27));
      v31 = objc_msgSend(v7, "stepIndex");
      objc_msgSend(v7, "distanceFromRoute");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@,  (%0.5f %0.5f),  [%d, %0.2f],  Step %d\n[%@],  dist to route: %0.1fm"), v30, v9, v11, v12, *((float *)&v12 + 1), v31, v22, v32));
      if ((objc_msgSend(v7, "isGoodMatch") & 1) != 0)
        v33 = objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
      else
        v33 = objc_claimAutoreleasedReturnValue(+[UIColor orangeColor](UIColor, "orangeColor"));
      v19 = (void *)v33;

    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      v20 = CFSTR("No location");
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[ContainerViewController chromeViewController](self, "chromeViewController"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "mapView"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "_debugConsole"));

    objc_msgSend(v36, "updateCustomText:textColor:", v20, v19);
    v6 = v37;
  }

}

- (void)_toggleTraceControls
{
  void *v3;
  unsigned int v4;
  unsigned int v5;
  NavigationDebugViewsController *debugViewsController;

  if (self->_debugViewsController)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("PlaybackControls"));

    if (v4)
    {
      v5 = -[NavigationDebugViewsController isShowingTraceControls](self->_debugViewsController, "isShowingTraceControls");
      debugViewsController = self->_debugViewsController;
      if (v5)
        -[NavigationDebugViewsController hideTraceControlsAnimated:](debugViewsController, "hideTraceControlsAnimated:", 1);
      else
        -[NavigationDebugViewsController showTraceControls](debugViewsController, "showTraceControls");
    }
  }
}

- (BOOL)pptTestSupportStepping
{
  return 1;
}

- (int64_t)pptTestCurrentStepIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC"));
  v3 = objc_msgSend(v2, "signIndex");

  return (int64_t)v3;
}

- (BOOL)pptTestHasNextStep
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "signGenerator"));
  v5 = (uint64_t)objc_msgSend(v4, "numberOfSigns");

  if (v5 < 2)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC"));
  v8 = (char *)objc_msgSend(v7, "signIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "signGenerator"));
  v6 = (uint64_t)v8 < (uint64_t)((char *)objc_msgSend(v10, "numberOfSigns") - 1);

  return v6;
}

- (void)pptTestMoveToNextStep
{
  id v3;

  if (-[StepContainerViewController pptTestHasNextStep](self, "pptTestHasNextStep"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC"));
    objc_msgSend(v3, "setSignIndex:", (char *)objc_msgSend(v3, "signIndex") + 1);

  }
}

- (BOOL)pptTestMoveToBoardStep
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController route](self, "route"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "steps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextBoardingStep"));
  if (v6
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "signGenerator")),
        v9 = objc_msgSend(v8, "signIndexForStep:", v6),
        v8,
        v7,
        v9 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[StepContainerViewController pagingVC](self, "pagingVC"));
    objc_msgSend(v11, "setSignIndex:animated:", v9, 0);

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (unint64_t)matchedStepIndex
{
  return self->_matchedStepIndex;
}

- (void)setStepActionCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_stepActionCoordinator, a3);
}

- (SteppingPageViewController)pagingVC
{
  return self->_pagingVC;
}

- (void)setPagingVC:(id)a3
{
  objc_storeStrong((id *)&self->_pagingVC, a3);
}

- (SteppingSignGenerator)signGenerator
{
  return self->_signGenerator;
}

- (void)setSignGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_signGenerator, a3);
}

- (UIScrollView)verticalSignScrollView
{
  return self->_verticalSignScrollView;
}

- (void)setVerticalSignScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_verticalSignScrollView, a3);
}

- (NSLayoutConstraint)scrollViewHeightConstraint
{
  return self->_scrollViewHeightConstraint;
}

- (void)setScrollViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, a3);
}

- (UIButton)recenterButton
{
  return self->_recenterButton;
}

- (void)setRecenterButton:(id)a3
{
  objc_storeStrong((id *)&self->_recenterButton, a3);
}

- (void)setMapCameraController:(id)a3
{
  objc_storeStrong((id *)&self->_mapCameraController, a3);
}

- (NavDebugLocationManager)debugLocationManager
{
  return self->_debugLocationManager;
}

- (void)setDebugLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_debugLocationManager, a3);
}

- (NavigationDebugViewsController)debugViewsController
{
  return self->_debugViewsController;
}

- (void)setDebugViewsController:(id)a3
{
  objc_storeStrong((id *)&self->_debugViewsController, a3);
}

- (StatusIndicatorManager)statusIndicatorManager
{
  return self->_statusIndicatorManager;
}

- (void)setStatusIndicatorManager:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorManager, a3);
}

- (void)setStatusIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_statusIndicatorView, a3);
}

- (NSLayoutConstraint)userLocationBottomConstraint
{
  return self->_userLocationBottomConstraint;
}

- (void)setUserLocationBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_userLocationBottomConstraint, a3);
}

- (NSLayoutConstraint)userLocationLeadingConstraint
{
  return self->_userLocationLeadingConstraint;
}

- (void)setUserLocationLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_userLocationLeadingConstraint, a3);
}

- (NSLayoutConstraint)userLocationTrailingConstraint
{
  return self->_userLocationTrailingConstraint;
}

- (void)setUserLocationTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_userLocationTrailingConstraint, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)lastMapTouchDate
{
  return self->_lastMapTouchDate;
}

- (void)setLastMapTouchDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastMapTouchDate, a3);
}

- (unint64_t)matchedSignIndex
{
  return self->_matchedSignIndex;
}

- (void)setMatchedSignIndex:(unint64_t)a3
{
  self->_matchedSignIndex = a3;
}

- (BOOL)isGoingToEnterGuidance
{
  return self->_isGoingToEnterGuidance;
}

- (void)setIsGoingToEnterGuidance:(BOOL)a3
{
  self->_isGoingToEnterGuidance = a3;
}

- (MNLocation)previousMatchedLocation
{
  return self->_previousMatchedLocation;
}

- (void)setPreviousMatchedLocation:(id)a3
{
  objc_storeStrong((id *)&self->_previousMatchedLocation, a3);
}

- (BOOL)mustNotBreakUserTrackingMode
{
  return self->_mustNotBreakUserTrackingMode;
}

- (void)setMustNotBreakUserTrackingMode:(BOOL)a3
{
  self->_mustNotBreakUserTrackingMode = a3;
}

- (BOOL)hasDesiredUserTrackingMode
{
  return self->_hasDesiredUserTrackingMode;
}

- (void)setHasDesiredUserTrackingMode:(BOOL)a3
{
  self->_hasDesiredUserTrackingMode = a3;
}

- (int64_t)desiredUserTrackingMode
{
  return self->_desiredUserTrackingMode;
}

- (void)setDesiredUserTrackingMode:(int64_t)a3
{
  self->_desiredUserTrackingMode = a3;
}

- (BOOL)userIsInteractingWithMap
{
  return self->_userIsInteractingWithMap;
}

- (void)setUserIsInteractingWithMap:(BOOL)a3
{
  self->_userIsInteractingWithMap = a3;
}

- (int64_t)hasArrived
{
  return self->_hasArrived;
}

- (void)setHasArrived:(int64_t)a3
{
  self->_hasArrived = a3;
}

- (NSMutableDictionary)isExpandedMapping
{
  return self->_isExpandedMapping;
}

- (void)setIsExpandedMapping:(id)a3
{
  objc_storeStrong((id *)&self->_isExpandedMapping, a3);
}

- (BOOL)showingOverview
{
  return self->_showingOverview;
}

- (void)setShowingOverview:(BOOL)a3
{
  self->_showingOverview = a3;
}

- (unint64_t)initialStepIndex
{
  return self->_initialStepIndex;
}

- (void)setInitialStepIndex:(unint64_t)a3
{
  self->_initialStepIndex = a3;
}

- (BOOL)isVLFActive
{
  return self->_vlfActive;
}

- (void)setVlfActive:(BOOL)a3
{
  self->_vlfActive = a3;
}

- (BOOL)isUserTrackingViewVisible
{
  return self->_userTrackingViewVisible;
}

- (NSTimer)delayAutoAdvanceTimer
{
  return self->_delayAutoAdvanceTimer;
}

- (void)setDelayAutoAdvanceTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayAutoAdvanceTimer, a3);
}

- (NSTimer)locationExpirationTimer
{
  return self->_locationExpirationTimer;
}

- (void)setLocationExpirationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_locationExpirationTimer, a3);
}

- (NSTimer)arrivalEndTimer
{
  return self->_arrivalEndTimer;
}

- (void)setArrivalEndTimer:(id)a3
{
  objc_storeStrong((id *)&self->_arrivalEndTimer, a3);
}

- (NSTimer)backgroundArrivalTimer
{
  return self->_backgroundArrivalTimer;
}

- (void)setBackgroundArrivalTimer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundArrivalTimer, a3);
}

- (NavIdleTimeoutTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_backgroundArrivalTimer, 0);
  objc_storeStrong((id *)&self->_arrivalEndTimer, 0);
  objc_storeStrong((id *)&self->_locationExpirationTimer, 0);
  objc_storeStrong((id *)&self->_delayAutoAdvanceTimer, 0);
  objc_storeStrong((id *)&self->_isExpandedMapping, 0);
  objc_storeStrong((id *)&self->_previousMatchedLocation, 0);
  objc_storeStrong((id *)&self->_lastMapTouchDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_userLocationTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_userLocationLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_userLocationBottomConstraint, 0);
  objc_storeStrong((id *)&self->_statusIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusIndicatorManager, 0);
  objc_storeStrong((id *)&self->_debugViewsController, 0);
  objc_storeStrong((id *)&self->_debugLocationManager, 0);
  objc_storeStrong((id *)&self->_mapCameraController, 0);
  objc_storeStrong((id *)&self->_recenterButton, 0);
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_verticalSignScrollView, 0);
  objc_storeStrong((id *)&self->_signGenerator, 0);
  objc_storeStrong((id *)&self->_pagingVC, 0);
  objc_storeStrong((id *)&self->_stepActionCoordinator, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_debugHoursDurationFormatter, 0);
  objc_storeStrong((id *)&self->_debugMinsDurationFormatter, 0);
}

@end
