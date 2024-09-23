@implementation NavModeController

- (void)willBeginDisplayingInSecureLockScreen
{
  id v3;
  NSObject *v4;
  NavModeController *v5;
  NavModeController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  __CFString *v23;
  __int16 v24;
  const char *v25;

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v23 = v12;
    v24 = 2080;
    v25 = "-[NavModeController willBeginDisplayingInSecureLockScreen]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v13, "willBeginDisplayingInSecureLockScreen");

  if (!-[NavModeController isShowingFullScreenDirectionsList](self, "isShowingFullScreenDirectionsList"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v14, "dismissPlacecard");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v15, "dismissSearchAlongRoute");

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v16, "dismissModalContainee");

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v17, "dismissShareETA");

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v18, "dismissTray");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v19, "dismissAddStop");

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v20, "dismissReportAnIncident");

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController powerLogger](self, "powerLogger"));
  objc_msgSend(v21, "setDisplayingNavOnLockScreen:", 1);

}

- (void)didEndDisplayingInLockScreen
{
  id v3;
  NSObject *v4;
  NavModeController *v5;
  NavModeController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;
  __int16 v17;
  const char *v18;

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v16 = v12;
    v17 = 2080;
    v18 = "-[NavModeController didEndDisplayingInLockScreen]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController powerLogger](self, "powerLogger"));
  objc_msgSend(v13, "setDisplayingNavOnLockScreen:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v14, "didEndDisplayingInLockScreen");

}

- (BOOL)supportsLockscreen
{
  return 1;
}

- (NavModeController)initWithPlatformController:(id)a3
{
  id v5;
  NavModeController *v6;
  id v7;
  NSObject *v8;
  NavModeController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  GuidanceObserver *v16;
  GuidanceObserver *guidanceObserver;
  NavigationDisplay *v18;
  NavigationDisplay *navigationDisplay;
  NavigationCustomFeaturesSource *v20;
  void *v21;
  NavigationCustomFeaturesSource *v22;
  NavigationCustomFeaturesSource *featuresSource;
  RAPNavigationTracker *v24;
  RAPNavigationTracker *rapNavigationTracker;
  NavActionCoordinator *v26;
  void *v27;
  void *v28;
  void *v29;
  NavActionCoordinator *v30;
  NavActionCoordinator *navActionCoordinator;
  NavigationPowerLogger *v32;
  NavigationPowerLogger *powerLogger;
  NavContainerViewController *v34;
  void *v35;
  void *v36;
  NavContainerViewController *v37;
  NavContainerViewController *containerViewController;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  NSObject *v44;
  id v45;
  NSObject *v46;
  char *v47;
  objc_super v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  int v54;
  __int16 v55;
  const char *v56;

  v5 = a3;
  v48.receiver = self;
  v48.super_class = (Class)NavModeController;
  v6 = -[NavModeController init](&v48, "init");
  if (!v6)
    goto LABEL_11;
  v7 = sub_100431C0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = v6;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v50 = v15;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] Initializing", buf, 0xCu);

  }
  objc_storeStrong((id *)&v6->_platformController, a3);
  v6->_navigationCameraMode = 0;
  v16 = objc_alloc_init(GuidanceObserver);
  guidanceObserver = v6->_guidanceObserver;
  v6->_guidanceObserver = v16;

  v18 = objc_alloc_init(NavigationDisplay);
  navigationDisplay = v6->_navigationDisplay;
  v6->_navigationDisplay = v18;

  -[NavigationDisplay setDelegate:](v6->_navigationDisplay, "setDelegate:", v6);
  v20 = [NavigationCustomFeaturesSource alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](v6->_navigationDisplay, "cameraController"));
  v22 = -[NavigationCustomFeaturesSource initWithPointsFramer:](v20, "initWithPointsFramer:", v21);
  featuresSource = v6->_featuresSource;
  v6->_featuresSource = v22;

  -[NavigationCustomFeaturesSource setFramingMode:](v6->_featuresSource, "setFramingMode:", 1);
  -[PersonalizedItemSource addObserver:](v6->_featuresSource, "addObserver:", v6);
  v24 = -[RAPNavigationTracker initWithPlatformController:]([RAPNavigationTracker alloc], "initWithPlatformController:", v6->_platformController);
  rapNavigationTracker = v6->_rapNavigationTracker;
  v6->_rapNavigationTracker = v24;

  v26 = [NavActionCoordinator alloc];
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController featuresSource](v6, "featuresSource"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](v6, "navigationDisplay"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController guidanceObserver](v6, "guidanceObserver"));
  v30 = -[NavActionCoordinator initWithMapItemDisplayer:navigationDisplay:guidanceObserver:navigationCameraModeController:rapNavigationTracker:](v26, "initWithMapItemDisplayer:navigationDisplay:guidanceObserver:navigationCameraModeController:rapNavigationTracker:", v27, v28, v29, v6, v6->_rapNavigationTracker);
  navActionCoordinator = v6->_navActionCoordinator;
  v6->_navActionCoordinator = v30;

  if ((-[NavActionCoordinator conformsToProtocol:](v6->_navActionCoordinator, "conformsToProtocol:", &OBJC_PROTOCOL___ChromeMapSelectionDelegate) & 1) == 0)
  {
    v43 = sub_1004318FC();
    v44 = objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v50 = "-[NavModeController initWithPlatformController:]";
      v51 = 2080;
      v52 = "NavModeController.m";
      v53 = 1024;
      v54 = 186;
      v55 = 2080;
      v56 = "[_navActionCoordinator conformsToProtocol:@protocol(ChromeMapSelectionDelegate)]";
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v45 = sub_1004318FC();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v47 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v50 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  -[NavActionCoordinator setMapViewZoomDelegate:](v6->_navActionCoordinator, "setMapViewZoomDelegate:", v6);
  -[PersonalizedItemSource addObserver:](v6->_featuresSource, "addObserver:", v6->_navActionCoordinator);
  v32 = objc_alloc_init(NavigationPowerLogger);
  powerLogger = v6->_powerLogger;
  v6->_powerLogger = v32;

  -[NavigationPowerLogger startLogging](v6->_powerLogger, "startLogging");
  v34 = [NavContainerViewController alloc];
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](v6, "navActionCoordinator"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController guidanceObserver](v6, "guidanceObserver"));
  v37 = -[NavContainerViewController initWithCoordinator:guidanceObserver:platformController:](v34, "initWithCoordinator:guidanceObserver:platformController:", v35, v36, v6->_platformController);
  containerViewController = v6->_containerViewController;
  v6->_containerViewController = v37;

  v39 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v39, "registerObserver:", v6);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v40, "addObserver:selector:name:object:", v6, "vlfSessionTaskWillShowVLFUINotification:", CFSTR("VLFSessionTaskWillShowVLFUINotification"), 0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v41, "addObserver:selector:name:object:", v6, "vlfContaineeViewControllerDidDisappearNotification:", off_1014BB950, 0);

LABEL_11:
  return v6;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  NavModeController *v5;
  NavModeController *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  __CFString *v16;

  v3 = sub_100431C0C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Deallocing", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v13, "unregisterObserver:", self);

  v14.receiver = self;
  v14.super_class = (Class)NavModeController;
  -[NavModeController dealloc](&v14, "dealloc");
}

- (NavActionCoordination)actionCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "coordinator"));

  return (NavActionCoordination *)v3;
}

- (NavigationSession)navigationSession
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NavigationSession *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController platformController](self, "platformController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSession"));

  v4 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (void)setMapView:(id)a3
{
  MKMapView *v5;
  MKMapView *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  MKMapView *v10;

  v5 = (MKMapView *)a3;
  v6 = v5;
  if (self->_mapView != v5)
  {
    v10 = v5;
    if (!v5
      || (v7 = -[NavModeController isShowingFullScreenDirectionsList](self, "isShowingFullScreenDirectionsList"),
          v6 = v10,
          (v7 & 1) == 0))
    {
      objc_storeStrong((id *)&self->_mapView, a3);
      -[NavigationPowerLogger setMapType:](self->_powerLogger, "setMapType:", -[NavModeController _mapTypeFromMapView:](self, "_mapTypeFromMapView:", v10));
      if (self->_mapView)
      {
        -[NavModeController _setupMapView](self, "_setupMapView");
        -[NavModeController _setRoute:](self, "_setRoute:", self->_route);
      }
      else
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchPinsManager"));
        objc_msgSend(v9, "clearDirectionsPins");

      }
      v6 = v10;
    }
  }

}

- (void)setShowFullScreenDirectionsList:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  NSObject *v7;
  NavModeController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id chromeDeactivationToken;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  MKMapView *mapView;
  void *v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  __CFString *v32;

  if (self->_showFullScreenDirectionsList == a3)
    return;
  v3 = a3;
  self->_showFullScreenDirectionsList = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v5, "setShowFullScreenDirectionsList:", v3);

  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

    v15 = CFSTR("NO");
    if (v3)
      v15 = CFSTR("YES");
    v16 = v15;
    *(_DWORD *)buf = 138543618;
    v30 = v14;
    v31 = 2112;
    v32 = v16;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Setting show fullscreen directions list: %@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
    objc_msgSend(v19, "setResumeRouteBannerHidden:", v3);

    chromeDeactivationToken = self->_chromeDeactivationToken;
    if (v3)
    {
      if (!chromeDeactivationToken)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "acquireChromeDeactivationTokenForReason:", CFSTR("full-screen directions list")));
        v23 = self->_chromeDeactivationToken;
        self->_chromeDeactivationToken = v22;

      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
      objc_msgSend(v24, "clearCache");

      mapView = self->_mapView;
      self->_mapView = 0;

    }
    else
    {
      self->_chromeDeactivationToken = 0;

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mapView"));
      -[NavModeController setMapView:](self, "setMapView:", v27);

      -[NavModeController _startNavigationCameraMotionAnimated:](self, "_startNavigationCameraMotionAnimated:", 0);
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v28, "presentTray");

  }
}

- (void)setNavigationCameraMode:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  NavModeController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t navigationCameraMode;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  unint64_t v31;

  if (self->_navigationCameraMode == a3)
    return;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    navigationCameraMode = self->_navigationCameraMode;
    *(_DWORD *)buf = 138543874;
    v27 = v13;
    v28 = 2048;
    v29 = navigationCameraMode;
    v30 = 2048;
    v31 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Changing navigationCameraMode from %lu to %lu", buf, 0x20u);

  }
  self->_navigationCameraMode = a3;
  if (a3 == 1)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    v16 = objc_msgSend(v15, "lowGuidanceUserPreferredHeadingOverride");

    v17 = 0;
    v18 = 1;
  }
  else
  {
    v18 = 0;
    v16 = 0;
    v17 = 1;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v19, "setDefaultMapViewZoom:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  v21 = objc_msgSend(v20, "currentMapViewZoom") == (id)2;

  objc_msgSend(v19, "resetMapViewZoomToDefaultAndStartCameraTracking:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v22, "setSignStyle:", v17);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "cameraController"));
  objc_msgSend(v24, "setNavigationCameraHeadingOverride:", v16);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v25, "setNavigationDestinationState:", 1);

}

- (void)setUtteringGuidanceAudio:(BOOL)a3
{
  unsigned __int8 v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];

  if (self->_utteringGuidanceAudio != a3)
  {
    self->_utteringGuidanceAudio = a3;
    v4 = -[NavModeController _anyNavUIForeground](self, "_anyNavUIForeground");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "arrivalInfo"));
    v7 = objc_msgSend(v6, "isInArrivalState");
    v8 = objc_msgSend(v6, "legIndex");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "route"));
    v10 = objc_msgSend(v9, "isLegIndexOfLastLeg:", v8);

    if (!self->_utteringGuidanceAudio && (v4 & 1) == 0 && v7 && v10)
    {
      v11 = sub_100431C0C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "setUtteringGuidanceAudio: uttering ended while the app is backgrounded and we're in arrival state -> ending navigation", v13, 2u);
      }

      -[NavModeController endNavModeAnimated:](self, "endNavModeAnimated:", 0);
    }

  }
}

- (void)_setupMapView
{
  void *v3;
  id v4;

  -[MKMapView _setApplicationState:](self->_mapView, "_setApplicationState:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (v4)
    -[MKMapView deselectAnnotation:animated:](self->_mapView, "deselectAnnotation:animated:", v4, 0);
  -[MKMapView _deselectLabelMarkerAnimated:](self->_mapView, "_deselectLabelMarkerAnimated:", 0);

}

- (void)_setRoute:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  NavModeController *v8;
  NavModeController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  GEOComposedRoute *route;
  GEOComposedRoute **p_route;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  RouteAnnotationsMutableConfiguration *routeAnnotationsConfiguration;
  void *v24;
  void *v25;
  uint8_t buf[4];
  __CFString *v27;
  __int16 v28;
  id v29;

  v5 = a3;
  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    goto LABEL_11;
  v8 = self;
  v9 = v8;
  if (!v8)
  {
    v15 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v10 = (objc_class *)objc_opt_class(v8);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
    v14 = v13;
    if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
    {
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

      goto LABEL_8;
    }

  }
  v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v27 = v15;
  v28 = 2112;
  v29 = v5;
  _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating route: %@", buf, 0x16u);

LABEL_11:
  p_route = &self->_route;
  route = self->_route;
  if (route)
    v18 = -[GEOComposedRoute transportType](route, "transportType");
  else
    v18 = 4;
  v19 = objc_msgSend(v5, "transportType");
  objc_storeStrong((id *)&self->_route, a3);
  if (-[GEOComposedRoute transportType](*p_route, "transportType") == 2
    && ((GEOConfigGetBOOL(MapsConfig_NavigationWalkingShowManeuverArrowsOnMap, off_1014B42D8) & 1) != 0
     || ((unint64_t)objc_msgSend(v5, "source") & 0xFFFFFFFFFFFFFFFELL) == 2))
  {
    -[GEOComposedRoute setManeuverDisplayEnabled:](*p_route, "setManeuverDisplayEnabled:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute steps](*p_route, "steps"));
    -[GEOComposedRoute setManeuverDisplaySteps:](*p_route, "setManeuverDisplaySteps:", v20);

  }
  else
  {
    -[GEOComposedRoute setManeuverDisplayEnabled:](*p_route, "setManeuverDisplayEnabled:", 0);
    -[GEOComposedRoute setManeuverDisplaySteps:](*p_route, "setManeuverDisplaySteps:", 0);
  }
  -[NavigationDisplay updateWithRoute:](self->_navigationDisplay, "updateWithRoute:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v22, "setRoute:", v21);

  routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  self->_routeAnnotationsConfiguration = 0;

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v24, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

  if (v18 != (_DWORD)v19)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
    objc_msgSend(v25, "setTransportType:animated:", v19, v18 == 4);

  }
}

- (void)_receivedNewRoute:(id)a3 traffic:(id)a4
{
  -[NavModeController _setRoute:](self, "_setRoute:", a3, a4);
  -[NavModeController _updateDetour](self, "_updateDetour");
  -[NavModeController _archiveMapsActivity](self, "_archiveMapsActivity");
}

- (BOOL)_shouldShowAlternateRoutesForZoom:(unint64_t)a3
{
  void *v5;
  BOOL result;
  char BOOL;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController _originalRoute](self, "_originalRoute"));

  if (v5)
    return 1;
  BOOL = GEOConfigGetBOOL(NavigationConfig_NavigationShowLiveAlternateRoutesInTrenchMode[0], NavigationConfig_NavigationShowLiveAlternateRoutesInTrenchMode[1]);
  result = 1;
  if (!a3 && (BOOL & 1) == 0)
    return self->_incidentAlert != 0;
  return result;
}

- (id)_originalRoute
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "originalRoute"));
  if (objc_msgSend(v3, "source") == (id)2 || objc_msgSend(v3, "source") == (id)3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "route"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uniqueRouteID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uniqueRouteID"));
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if (v7)
      v8 = 0;
    else
      v8 = v3;
    v9 = v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_routeMarkerOptionsForMapViewZoom:(unint64_t)a3 incidentAlert:(id)a4
{
  if (a3 | (unint64_t)a4)
    return 3;
  else
    return 0;
}

- (void)_updateDetour
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NavModeController *v9;
  NavModeController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  void *v19;
  NavContainerBannerAction *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  NavContainerBannerAction *v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  __CFString *v32;
  __int16 v33;
  void *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = objc_msgSend(v3, "isDetour");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bannerAction"));

  v7 = sub_100431C0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    goto LABEL_13;
  v9 = self;
  v10 = v9;
  if (!v9)
  {
    v16 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v11 = (objc_class *)objc_opt_class(v9);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
    v15 = v14;
    if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
    {
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

      goto LABEL_8;
    }

  }
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
  v17 = CFSTR("NO");
  if (v4)
    v17 = CFSTR("YES");
  v18 = v17;
  *(_DWORD *)buf = 138543874;
  v30 = v16;
  v31 = 2112;
  v32 = v18;
  v33 = 2112;
  v34 = v6;
  _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] _updateDetour: %@ existingAction: %@", buf, 0x20u);

LABEL_13:
  if (!v4)
  {
    v20 = 0;
LABEL_20:
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
    objc_msgSend(v25, "setBannerAction:animated:", v20, 1);
    goto LABEL_21;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v20 = (NavContainerBannerAction *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "originalDestinationName"));

  v21 = -[NavContainerBannerAction length](v20, "length");
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v23 = v22;
  if (v21)
  {
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Navigation Top Banner View] Resume Route to %@"), CFSTR("localized string not found"), 0));

    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v20));
    v23 = (void *)v24;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("[Navigation Top Banner View] Resume Original Route"), CFSTR("localized string not found"), 0));
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  v27 = objc_msgSend(v26, "isEqualToString:", v25);

  if ((v27 & 1) == 0)
  {
    v28 = objc_opt_new(NavContainerBannerAction);
    -[NavContainerBannerAction setTitle:](v28, "setTitle:", v25);
    -[NavContainerBannerAction setActionHandler:](v28, "setActionHandler:", &stru_1011BD2F0);

    v20 = v28;
    goto LABEL_20;
  }
LABEL_21:

}

- (BOOL)_anyNavUIForeground
{
  void *v2;
  void *v3;

  if (SBUIIsSystemApertureEnabled(self)
    && (v2 = (void *)objc_claimAutoreleasedReturnValue(+[IPCServer sharedServer](IPCServer, "sharedServer")),
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeBannerViewController")),
        v2,
        v3,
        v3))
  {
    return 1;
  }
  else
  {
    return +[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground");
  }
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)fullscreenViewControllerPresentationTransition
{
  return objc_opt_new(ModeTransitionController);
}

- (id)fullscreenViewControllerDismissalTransition
{
  return objc_opt_new(ModeTransitionController);
}

- (id)mapViewDelegate
{
  return self->_navigationDisplay;
}

- (BOOL)showsMapView
{
  return 1;
}

- (int64_t)desiredFloatingControls
{
  return 0;
}

- (void)enterPedestrianAR
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v2, "enterPedestrianAR");

}

- (id)personalizedItemSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v10[0] = self->_featuresSource;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 2));

  return v8;
}

- (void)prepareToEnterStackInChromeViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NavModeController *v7;
  NavModeController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  id v21;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    v20 = 2112;
    v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Preparing to enter stack in chrome VC: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "customPOIsController"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v16, "setCustomPOIsController:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v17, "setChromeViewController:", v4);

}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  NavModeController *v8;
  NavModeController *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  __CFString *v20;
  __int16 v21;
  id v22;

  v5 = a3;
  v6 = sub_100431C0C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v8 = self;
    v9 = v8;
    if (!v8)
    {
      v15 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v10 = (objc_class *)objc_opt_class(v8);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v20 = v15;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Entering stack in chrome VC: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "route"));

  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
    objc_msgSend(v18, "loadViewIfNeeded");

    -[NavModeController _setRoute:](self, "_setRoute:", v17);
  }
  -[NavModeController _archiveMapsActivity](self, "_archiveMapsActivity");

}

- (void)leaveStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  NSObject *v6;
  NavModeController *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;

  if (self->_isPedestrianARActive)
  {
    v5 = sub_100431C0C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      -[NavModeController performTeardown](self, "performTeardown");
      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v15 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Leaving stack while Pedestrian AR is active; performing teardown now",
      buf,
      0xCu);

    goto LABEL_9;
  }
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  unsigned __int8 v13;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = objc_msgSend(v7, "isAnimated");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005DC814;
  v10[3] = &unk_1011B0408;
  objc_copyWeak(&v12, &location);
  v9 = v6;
  v11 = v9;
  v13 = v8;
  objc_msgSend(v7, "addPreparation:", v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)_becomeTopContextInChromeViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  NSObject *v8;
  NavModeController *v9;
  NavModeController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  id v20;
  NSObject *v21;
  NavModeController *v22;
  NavModeController *v23;
  objc_class *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  unsigned int v39;
  id chromeDeactivationToken;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  MKMapView *mapView;
  void *v46;
  void *v47;
  id v48;
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
  uint8_t buf[4];
  __CFString *v65;
  __int16 v66;
  id v67;

  v4 = a4;
  v6 = a3;
  v7 = sub_100431C0C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = v9;
    if (!v9)
    {
      v16 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v11 = (objc_class *)objc_opt_class(v9);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v65 = v16;
    v66 = 2112;
    v67 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Becoming top context in chrome VC: %@", buf, 0x16u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousTopContext"));
  v18 = objc_opt_class(PedestrianARContext);
  isKindOfClass = objc_opt_isKindOfClass(v17, v18);

  if ((isKindOfClass & 1) != 0)
  {
    v20 = sub_100431C0C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
LABEL_36:

      self->_isPedestrianARActive = 0;
      v35 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
      objc_msgSend(v35, "setLayoutIfSupported:animated:", 1, 0);
      goto LABEL_37;
    }
    v22 = self;
    v23 = v22;
    if (!v22)
    {
      v29 = CFSTR("<nil>");
      goto LABEL_35;
    }
    v24 = (objc_class *)objc_opt_class(v22);
    v25 = NSStringFromClass(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    if ((objc_opt_respondsToSelector(v23, "accessibilityIdentifier") & 1) != 0)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v23, "performSelector:", "accessibilityIdentifier"));
      v28 = v27;
      if (v27 && !objc_msgSend(v27, "isEqualToString:", v26))
      {
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v26, v23, v28));

        goto LABEL_19;
      }

    }
    v29 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v26, v23));
LABEL_19:

LABEL_35:
    *(_DWORD *)buf = 138543362;
    v65 = v29;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEBUG, "[%{public}@] Previous top context is the PedestrianAR one; not doing the usual setup",
      buf,
      0xCu);

    goto LABEL_36;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousTopContext"));
  if ((objc_opt_respondsToSelector(v30, "fullscreenViewController") & 1) != 0)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "previousTopContext"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fullscreenViewController"));

    v33 = objc_opt_class(ContainerViewController);
    if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
      v34 = v32;
    else
      v34 = 0;
    v35 = v34;

  }
  else
  {
    v35 = 0;
  }

  objc_msgSend(v35, "setContaineesHidden:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v36, "setChromeContext:", self);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v38, "setChromeViewController:", v37);

  v39 = -[NavModeController isShowingFullScreenDirectionsList](self, "isShowingFullScreenDirectionsList");
  chromeDeactivationToken = self->_chromeDeactivationToken;
  if (v39)
  {
    if (!chromeDeactivationToken)
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "acquireChromeDeactivationTokenForReason:", CFSTR("full-screen directions list")));
      v43 = self->_chromeDeactivationToken;
      self->_chromeDeactivationToken = v42;

    }
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
    objc_msgSend(v44, "clearCache");

    mapView = self->_mapView;
    self->_mapView = 0;
  }
  else
  {
    self->_chromeDeactivationToken = 0;

    mapView = (MKMapView *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView mapView](mapView, "mapView"));
    -[NavModeController setMapView:](self, "setMapView:", v46);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v48 = objc_msgSend(v47, "desiredNavigationType");

  if (!v48)
  {
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v48 = objc_msgSend(v49, "navigationType");

  }
  -[NavModeController setNavigationCameraMode:](self, "setNavigationCameraMode:", v48 != (id)3);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "userLocationView"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  objc_msgSend(v52, "setUserLocationAnnotationView:", v51);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "mapView"));
  objc_msgSend(v54, "_setShouldSplitRouteLine:", 1);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "route"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "destination"));
  objc_msgSend(v55, "setDestinationWaypoint:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationDisplay](self, "navigationDisplay"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v59, "setTransportType:", objc_msgSend(v60, "navigationTransportType"));

  -[NavModeController _startNavigationCameraMotionAnimated:](self, "_startNavigationCameraMotionAnimated:", v4);
  v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v61, "addObserver:selector:name:object:", self, "_sceneBackgroundedWithOurViewVisible:", UISceneDidEnterBackgroundNotification, 0);
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
  objc_msgSend(v62, "acquireSecureAppAssertionIfNeeded");

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v63, "updateStatusBarColor");

LABEL_37:
}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005DCF7C;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addPreparation:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_resignTopContextInChromeViewController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NavModeController *v7;
  NavModeController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  char isKindOfClass;
  id v18;
  NSObject *v19;
  NavModeController *v20;
  NavModeController *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  uint8_t buf[4];
  __CFString *v30;
  __int16 v31;
  id v32;

  v4 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v30 = v14;
    v31 = 2112;
    v32 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Resign top context in chrome VC: %@", buf, 0x16u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextTopContext"));
  v16 = objc_opt_class(PedestrianARContext);
  isKindOfClass = objc_opt_isKindOfClass(v15, v16);

  if ((isKindOfClass & 1) != 0)
  {
    v18 = sub_100431C0C();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
LABEL_23:

      self->_isPedestrianARActive = 1;
      goto LABEL_24;
    }
    v20 = self;
    v21 = v20;
    if (!v20)
    {
      v27 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v22 = (objc_class *)objc_opt_class(v20);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_19;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_19:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v30 = v27;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "[%{public}@] Next top context is the PedestrianAR one; not doing the usual teardown",
      buf,
      0xCu);

    goto LABEL_23;
  }
  -[NavModeController performTeardown](self, "performTeardown");
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController iosBasedChromeViewController](self, "iosBasedChromeViewController"));
  objc_msgSend(v28, "setStatusBarAdditionalColor:", 0);

LABEL_24:
}

- (void)performTeardown
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id chromeDeactivationToken;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route"));
  v4 = objc_msgSend(v3, "transportType");

  if (v4 == 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route"));
    objc_msgSend(v5, "setManeuverDisplayEnabled:", 0);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "removeObserver:", self);

  chromeDeactivationToken = self->_chromeDeactivationToken;
  self->_chromeDeactivationToken = 0;

  -[MKMapView _setDisplayedSearchResultsType:](self->_mapView, "_setDisplayedSearchResultsType:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v8, "setFocusedLabelsPolyline:", 0);

  -[MKMapView _setApplicationState:](self->_mapView, "_setApplicationState:", 0);
  -[MKMapView _clearRouteContext](self->_mapView, "_clearRouteContext");
  if (v4 == 2)
    -[MKMapView _setShowHeadingIndicatorForStepping:](self->_mapView, "_setShowHeadingIndicatorForStepping:", 0);
  -[NavModeController setMapView:](self, "setMapView:", 0);
  -[MKMapView _setDebugConsoleAdditionalInfoProvider:](self->_mapView, "_setDebugConsoleAdditionalInfoProvider:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
  objc_msgSend(v9, "setTrafficIncidentAlert:", 0);

  -[NavigationDisplay stopCameraMotion](self->_navigationDisplay, "stopCameraMotion");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
  objc_msgSend(v10, "resetMapViewNavigationState");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay userLocationAnnotationView](self->_navigationDisplay, "userLocationAnnotationView"));
  objc_msgSend(v11, "setInNavMode:animated:", 0, 1);

  -[NavigationDisplay setUserLocationAnnotationView:](self->_navigationDisplay, "setUserLocationAnnotationView:", 0);
  -[NavigationDisplay setChromeViewController:](self->_navigationDisplay, "setChromeViewController:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trafficIncidentAlertCoordinator"));
  objc_msgSend(v13, "dismissVisibleTrafficAlertView:", 1);

  v14 = (id)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v14, "stopMonitoringWithObserver:", self);

}

- (void)getCurrentSceneTitleWithCompletion:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = (void (**)(id, id))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Directions to <destination>"), CFSTR("localized string not found"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destination"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v12));

  }
  else
  {
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Directions"), CFSTR("localized string not found"), 0));
  }

  v4[2](v4, v13);
}

- (BOOL)requiresStaleMapEffect
{
  return 1;
}

- (BOOL)wantsDefaultDimmingOverlayForStaleMapEffect
{
  return 0;
}

- (void)insertDimmingOverlayForStaleMapEffectWithBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v5, "insertDimmingOverlayForStaleMapEffectWithBlock:", v4);

}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (RouteAnnotationsConfiguration)routeAnnotationsConfiguration
{
  void *v3;
  void *v4;
  id v5;
  RouteAnnotationsMutableConfiguration *routeAnnotationsConfiguration;
  RouteAnnotationsMutableConfiguration *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  RouteAnnotationsMutableConfiguration *v15;
  id v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));

  if (!v3)
    return (RouteAnnotationsConfiguration *)0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navigationSession](self, "navigationSession"));
  v5 = objc_msgSend(v4, "sessionState");

  if (v5 != (id)1)
  {
    v17 = sub_100431C0C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Cannot update annotations when not navigating", buf, 2u);
    }

    return (RouteAnnotationsConfiguration *)0;
  }
  routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  if (!routeAnnotationsConfiguration)
  {
    v7 = (RouteAnnotationsMutableConfiguration *)objc_claimAutoreleasedReturnValue(+[RouteAnnotationsMutableConfiguration navConfigurationWithCurrentRoute:incidentAlert:](RouteAnnotationsMutableConfiguration, "navConfigurationWithCurrentRoute:incidentAlert:", self->_route, self->_incidentAlert));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController _originalRoute](self, "_originalRoute"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteAnnotationsConfiguration routes](v7, "routes"));
      v10 = objc_msgSend(v9, "mutableCopy");

      objc_msgSend(v10, "addObject:", v8);
      -[RouteAnnotationsConfiguration setRoutes:](v7, "setRoutes:", v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueRouteID"));
    -[RouteAnnotationsConfiguration setOriginalRouteID:](v7, "setOriginalRouteID:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[RouteAnnotationsConfiguration setOriginalRouteDivergenceCoordinate:](v7, "setOriginalRouteDivergenceCoordinate:", objc_msgSend(v12, "originalRouteDivergenceCoordinate"));

    v13 = sub_100431C0C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Created new route annotations configuration", v19, 2u);
    }

    v15 = self->_routeAnnotationsConfiguration;
    self->_routeAnnotationsConfiguration = v7;

    routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  }
  -[NavModeController _updateWaypointAndOptionsOnRouteAnnotationsConfiguration:](self, "_updateWaypointAndOptionsOnRouteAnnotationsConfiguration:", routeAnnotationsConfiguration);
  return (RouteAnnotationsConfiguration *)self->_routeAnnotationsConfiguration;
}

- (void)_updateWaypointAndOptionsOnRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  GEOComposedRoute *route;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController actionCoordinator](self, "actionCoordinator"));
  v6 = objc_msgSend(v5, "currentMapViewZoom");

  objc_msgSend(v4, "setAlternateRoutesEnabled:", -[NavModeController _shouldShowAlternateRoutesForZoom:](self, "_shouldShowAlternateRoutesForZoom:", v6));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController incidentAlert](self, "incidentAlert"));
  objc_msgSend(v4, "setRouteMarkerOptions:", -[NavModeController _routeMarkerOptionsForMapViewZoom:incidentAlert:](self, "_routeMarkerOptionsForMapViewZoom:incidentAlert:", v6, v7));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrivalInfo"));
  v10 = v9;
  if (v9 && objc_msgSend(v9, "isInArrivalState"))
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "destination"));
    v12 = 0;
    v13 = 2;
  }
  else
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));
    if (v14
      && (v15 = (void *)v14,
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation")),
          v17 = objc_msgSend(v16, "state"),
          v16,
          v15,
          v17 == (id)1))
    {
      route = self->_route;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "routeMatch"));
      v28 = 0;
      v29 = 0;
      -[GEOComposedRoute nextWaypointOrAnchorPointFromRouteCoordinate:outWaypoint:outAnchorPoint:](route, "nextWaypointOrAnchorPointFromRouteCoordinate:outWaypoint:outAnchorPoint:", objc_msgSend(v20, "routeCoordinate"), &v29, &v28);
      v11 = (uint64_t)v29;
      v12 = (unint64_t)v28;

      v13 = (v11 | v12) != 0;
    }
    else
    {
      v21 = -[GEOComposedRoute legIndexForStepIndex:](self->_route, "legIndexForStepIndex:", objc_msgSend(v8, "stepIndex"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self->_route, "legs"));
      if (v21 >= objc_msgSend(v22, "count"))
      {
        v24 = 0;
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self->_route, "legs"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectAtIndexedSubscript:", v21));

      }
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "destination"));
      v13 = v11 != 0;

      v12 = 0;
    }
  }
  if (v11)
    v25 = v11;
  else
    v25 = v12;
  objc_msgSend(v4, "setCurrentNavigationWaypoint:", v25);
  objc_msgSend(v4, "setProximityToCurrentNavigationWaypoint:", v13);
  v26 = sub_100431C0C();
  v27 = objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v4;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Updated route annotations configuration: %{public}@", buf, 0xCu);
  }

}

- (void)_startNavigationCameraMotionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  -[NavigationDisplay startMotion:](self->_navigationDisplay, "startMotion:");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavigationDisplay userLocationAnnotationView](self->_navigationDisplay, "userLocationAnnotationView"));
  objc_msgSend(v5, "setInNavMode:animated:", 1, v3);

}

- (void)_pauseNavigationCameraMotion
{
  -[NavigationDisplay pauseCameraMotion](self->_navigationDisplay, "pauseCameraMotion");
}

- (void)_stopNavigationCameraMotion
{
  -[NavigationDisplay stopCameraMotion](self->_navigationDisplay, "stopCameraMotion");
}

- (void)_updateWithMatchedLocation:(id)a3
{
  NavigationDisplay *navigationDisplay;
  id v5;
  void *v6;
  id v7;

  navigationDisplay = self->_navigationDisplay;
  v5 = a3;
  -[NavigationDisplay updateWithLocation:](navigationDisplay, "updateWithLocation:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeAnnotationsController"));
  objc_msgSend(v6, "updateMatchedLocation:", v5);

}

- (void)_archiveMapsActivity
{
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController actionCoordinator](self, "actionCoordinator"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "appCoordinator"));
  objc_msgSend(v2, "archiveMapsActivity");

}

- (void)_updateArrivalState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  NavModeController *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  id v18;
  NSObject *v19;
  NavModeController *v20;
  objc_class *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NavModeController *v30;
  objc_class *v31;
  NSString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  id v41;
  NSObject *v42;
  NavModeController *v43;
  objc_class *v44;
  NSString *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  NavModeController *v52;
  objc_class *v53;
  NSString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  unsigned int v64;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrivalInfo"));
  if (!objc_msgSend(v4, "arrivalState") || objc_msgSend(v4, "arrivalState") == (id)-1)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
    objc_msgSend(v38, "stopMonitoringWithObserver:", self);
LABEL_32:

    goto LABEL_33;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"));
  v7 = objc_msgSend(v6, "isLegIndexOfLastLeg:", objc_msgSend(v4, "legIndex"));

  if (v7)
  {
    -[NavModeController _archiveMapsActivity](self, "_archiveMapsActivity");
    if (!self->_route)
      goto LABEL_13;
    v8 = sub_100431C0C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      +[HistoryEntryRecentsItem markRouteAsComplete:](HistoryEntryRecentsItem, "markRouteAsComplete:", self->_route);
LABEL_13:
      v17 = objc_msgSend(v4, "isInArrivalState");
      v18 = sub_100431C0C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        goto LABEL_20;
      v20 = self;
      v21 = (objc_class *)objc_opt_class(v20);
      v22 = NSStringFromClass(v21);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      if ((objc_opt_respondsToSelector(v20, "accessibilityIdentifier") & 1) != 0)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v20, "performSelector:", "accessibilityIdentifier"));
        v25 = v24;
        if (v24 && !objc_msgSend(v24, "isEqualToString:", v23))
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v23, v20, v25));

          goto LABEL_19;
        }

      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v23, v20));
LABEL_19:

      *(_DWORD *)buf = 138543618;
      v62 = v26;
      v63 = 1024;
      v64 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}@] Should auto end nav: %d", buf, 0x12u);

LABEL_20:
      if ((v17 & 1) == 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
        objc_msgSend(v27, "stopMonitoringWithObserver:", self);

      }
      if (+[UIApplication _maps_isAnyCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyCarPlayApplicationSceneForeground"))
      {
        v28 = sub_100431C0C();
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (!os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
LABEL_30:

          v37 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
          objc_msgSend(v37, "dismissShareETA");

          goto LABEL_33;
        }
        v30 = self;
        v31 = (objc_class *)objc_opt_class(v30);
        v32 = NSStringFromClass(v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
        if ((objc_opt_respondsToSelector(v30, "accessibilityIdentifier") & 1) != 0)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v30, "performSelector:", "accessibilityIdentifier"));
          v35 = v34;
          if (v34 && !objc_msgSend(v34, "isEqualToString:", v33))
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v33, v30, v35));

            goto LABEL_29;
          }

        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v33, v30));
LABEL_29:

        *(_DWORD *)buf = 138543362;
        v62 = v36;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: while CarPlay Maps is foreground", buf, 0xCu);

        goto LABEL_30;
      }
      if (+[UIApplication _maps_isAnySceneForegroundForRole:](UIApplication, "_maps_isAnySceneForegroundForRole:", _UIWindowSceneSessionTypeCoverSheet)|| (v39 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor")), v40 = objc_msgSend(v39, "isLocked"), v39, v40))
      {
        v41 = sub_100431C0C();
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (!os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          goto LABEL_43;
        v43 = self;
        v44 = (objc_class *)objc_opt_class(v43);
        v45 = NSStringFromClass(v44);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        if ((objc_opt_respondsToSelector(v43, "accessibilityIdentifier") & 1) != 0)
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v43, "performSelector:", "accessibilityIdentifier"));
          v48 = v47;
          if (v47 && !objc_msgSend(v47, "isEqualToString:", v46))
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v46, v43, v48));

            goto LABEL_42;
          }

        }
        v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v46, v43));
LABEL_42:

        *(_DWORD *)buf = 138543362;
        v62 = v49;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: while Maps is in the lockscreen or the device is locked", buf, 0xCu);

LABEL_43:
        if (!v17)
          goto LABEL_33;
        goto LABEL_53;
      }
      v50 = sub_100431C0C();
      v51 = objc_claimAutoreleasedReturnValue(v50);
      if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
LABEL_52:

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
        objc_msgSend(v59, "dismissShareETA");

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
        objc_msgSend(v60, "dismissSearchAlongRoute");

        if (!v17)
          goto LABEL_33;
LABEL_53:
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
        objc_msgSend(v38, "startMonitoringWithObserver:", self);
        goto LABEL_32;
      }
      v52 = self;
      v53 = (objc_class *)objc_opt_class(v52);
      v54 = NSStringFromClass(v53);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v54);
      if ((objc_opt_respondsToSelector(v52, "accessibilityIdentifier") & 1) != 0)
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v52, "performSelector:", "accessibilityIdentifier"));
        v57 = v56;
        if (v56 && !objc_msgSend(v56, "isEqualToString:", v55))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v55, v52, v57));

          goto LABEL_51;
        }

      }
      v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v55, v52));
LABEL_51:

      *(_DWORD *)buf = 138543362;
      v62 = v58;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: while Maps is foreground", buf, 0xCu);

      goto LABEL_52;
    }
    v10 = self;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_11;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_11:

    *(_DWORD *)buf = 138543362;
    v62 = v16;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] navigationServiceDidArrive: will mark route as complete", buf, 0xCu);

    goto LABEL_12;
  }
LABEL_33:

}

- (void)navigationDisplay:(id)a3 didChangeUserTrackingMode:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate", a3));
  objc_msgSend(v5, "setTrackingMode:monitorBatteryState:", a4, 0);

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v9, a2);

  if ((a2 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    v11 = objc_msgSend(v10, "mapView:shouldSelectLabelMarker:", v7, v8);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  CLLocationDegrees v11;
  CLLocationDegrees v12;
  CLLocationCoordinate2D v13;
  void *v14;
  id v15;

  v15 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v8, a2);

  if ((a2 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v9, "mapView:didSelectLabelMarker:", v15, v7);

  }
  if ((objc_msgSend(v7, "isRouteAnnotation") & 1) == 0
    && (objc_msgSend(v7, "isRouteEta") & 1) == 0)
  {
    objc_msgSend(v7, "coordinate");
    v11 = v10;
    objc_msgSend(v7, "coordinate");
    v13 = CLLocationCoordinate2DMake(v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController featuresSource](self, "featuresSource"));
    objc_msgSend(v14, "setOverriddenPointToFrame:", v13.latitude, v13.longitude);

  }
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  double longitude;
  void *v11;
  id v12;

  v12 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v8, a2);

  if ((a2 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v9, "mapView:didDeselectLabelMarker:", v12, v7);

  }
  longitude = kCLLocationCoordinate2DInvalid.longitude;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController featuresSource](self, "featuresSource"));
  objc_msgSend(v11, "setOverriddenPointToFrame:", kCLLocationCoordinate2DInvalid.latitude, longitude);

}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v6, "mapViewNavigationCameraHasStartedPanning:", v7);

  }
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v6, "mapViewNavigationCameraHasStoppedPanning:", v7);

  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v6, "mapViewNavigationCameraDidLeaveDefaultZoom:", v7);

  }
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  LOBYTE(a2) = objc_opt_respondsToSelector(v5, a2);

  if ((a2 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v6, "mapViewNavigationCameraDidReturnToDefaultZoom:", v7);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  MKMapView *mapView;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  y = a4.y;
  x = a4.x;
  v18 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeAnnotationsController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "configuration"));

  if (!objc_msgSend(v9, "alternateRoutesEnabled"))
  {
    v16 = 0;
LABEL_6:
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    objc_msgSend(v17, "didTapMapView:atPoint:", v18, x, y);
    goto LABEL_7;
  }
  mapView = self->_mapView;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routes"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "selectedRoute"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v14 = sub_100479B6C(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[RouteAnnotationsResponder routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:](RouteAnnotationsResponder, "routeAtPoint:inMapView:withRoutes:selectedRoute:overlappingRouteSelectorBlock:", mapView, v11, v12, v15, x, y));

  if (!v16 || ((unint64_t)objc_msgSend(v16, "source") & 0xFFFFFFFFFFFFFFFELL) == 2)
    goto LABEL_6;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  objc_msgSend(v17, "viewController:switchNavigationToRoute:", 0, v16);
LABEL_7:

}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v7, "mapView:didUpdateYaw:", v6, a4);

}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "annotation"));
  objc_msgSend(v6, "deselectAnnotation:animated:", v7, 0);

  v8 = objc_opt_class(MapsUserLocationView);
  if ((objc_opt_isKindOfClass(v13, v8) & 1) != 0 && objc_msgSend(v13, "isVLFPuckVisible"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController platformController](self, "platformController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "auxiliaryTasksManager"));
    v11 = objc_msgSend(v10, "auxilaryTaskForClass:", objc_opt_class(VLFSessionTask));
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    objc_msgSend(v12, "showVLFUI");
  }

}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  UIAccessibilityNotifications v5;
  id v6;
  unint64_t v7;

  v5 = UIAccessibilityLayoutChangedNotification;
  v6 = a3;
  UIAccessibilityPostNotification(v5, 0);
  v7 = -[NavModeController _mapTypeFromMapView:](self, "_mapTypeFromMapView:", v6);

  -[NavigationPowerLogger setMapType:](self->_powerLogger, "setMapType:", v7);
}

- (unint64_t)_mapTypeFromMapView:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  if ((objc_msgSend(v3, "_isShowingCuratedElevatedGround") & 1) != 0)
  {
    v4 = 2;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_visibleTileSets", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      v4 = 1;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        v11 = objc_opt_class(GEORPVisibleTileSet);
        if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0 && objc_msgSend(v10, "style") == 68)
          break;
        if (v7 == (id)++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v7)
            goto LABEL_5;
          goto LABEL_12;
        }
      }
    }
    else
    {
LABEL_12:
      v4 = 0;
    }

  }
  return v4;
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  -[NavModeController _updateWithMatchedLocation:](self, "_updateWithMatchedLocation:", a4);
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;
  id v7;

  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traffic"));
  -[NavModeController _receivedNewRoute:traffic:](self, "_receivedNewRoute:traffic:", v6, v7);

}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  -[NavModeController _receivedNewRoute:traffic:](self, "_receivedNewRoute:traffic:", a5, a6);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  RouteAnnotationsMutableConfiguration *routeAnnotationsConfiguration;
  void *v13;
  id v14;

  v14 = a3;
  if (a5)
  {
    if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "route"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traffic"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "route"));
      -[NavModeController _receivedNewRoute:traffic:](self, "_receivedNewRoute:traffic:", v11, v10);

    }
    else if (a5 != a4 && a5 - 3 <= 2)
    {
      routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
      self->_routeAnnotationsConfiguration = 0;

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
      objc_msgSend(v13, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

      -[NavModeController _archiveMapsActivity](self, "_archiveMapsActivity");
    }
  }
  else
  {
    -[NavModeController endNavModeAnimated:](self, "endNavModeAnimated:", 1);
  }

}

- (void)navigationService:(id)a3 didResumeNavigatingFromWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5 reason:(unint64_t)a6
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController", a3, a4, a5, a6));
  objc_msgSend(v6, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  NavModeController *v16;
  id v17;

  v7 = a4;
  v8 = a5;
  if (!-[NavModeController isShowingFullScreenDirectionsList](self, "isShowingFullScreenDirectionsList"))
  {
    -[NavModeController setIncidentAlert:](self, "setIncidentAlert:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trafficIncidentAlertCoordinator"));
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_1005DEEF4;
    v15 = &unk_1011B1EB0;
    v16 = self;
    v17 = v8;
    objc_msgSend(v10, "presentAlertViewForTrafficIncidentAlert:responseCallback:", v7, &v12);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController", v12, v13, v14, v15, v16));
    objc_msgSend(v11, "updateLayoutAnimated:", 1);

  }
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  if (!-[NavModeController isShowingFullScreenDirectionsList](self, "isShowingFullScreenDirectionsList"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bannerID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trafficIncidentAlertCoordinator"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "presentedAlert"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerID"));
    v10 = objc_msgSend(v5, "isEqualToString:", v9);

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
      objc_msgSend(v11, "setTrafficIncidentAlert:", v14);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trafficIncidentAlertCoordinator"));
      objc_msgSend(v13, "updatedAlertViewWithTrafficIncidentAlert:", v14);

    }
  }

}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  void *v5;
  id v6;

  if (!-[NavModeController isShowingFullScreenDirectionsList](self, "isShowingFullScreenDirectionsList", a3, a4))
  {
    -[NavModeController _dismissTrafficIncidentMapDisplay](self, "_dismissTrafficIncidentMapDisplay");
    v6 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trafficIncidentAlertCoordinator"));
    objc_msgSend(v5, "dismissVisibleTrafficAlertView:", 0);

  }
}

- (void)navigationService:(id)a3 didUpdateTrafficForRouteID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  unsigned int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeAnnotationsController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routes", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "uniqueRouteID"));
        v16 = objc_msgSend(v15, "isEqual:", v5);

        if (v16)
          objc_msgSend(v14, "_maps_refreshTrafficIncidentsOnRoute");
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  RouteAnnotationsMutableConfiguration *routeAnnotationsConfiguration;
  id v7;

  routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
  self->_routeAnnotationsConfiguration = 0;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)navigationService:(id)a3 didUpdateStepIndex:(unint64_t)a4 segmentIndex:(unint64_t)a5
{
  void *v7;
  unsigned int v8;
  void *v9;
  id v10;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route", a3, a4, a5));
  v8 = objc_msgSend(v7, "transportType");

  if (v8 == 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController route](self, "route"));
    objc_msgSend(v9, "setCurrentDisplayStep:", a4);

  }
  v10 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v10, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)navigationService:(id)a3 didUpdateTargetLegIndex:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController", a3, a4));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)navigationService:(id)a3 willProcessSpeechEvent:(id)a4
{
  -[NavModeController setUtteringGuidanceAudio:](self, "setUtteringGuidanceAudio:", 1, a4);
}

- (void)navigationService:(id)a3 didProcessSpeechEvent:(id)a4
{
  -[NavModeController setUtteringGuidanceAudio:](self, "setUtteringGuidanceAudio:", 0, a4);
}

- (void)navigationService:(id)a3 didUpdateUpcomingAnchorPointIndex:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController", a3, a4));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)_dismissTrafficIncidentMapDisplay
{
  void *v3;
  id v4;

  -[NavModeController setIncidentAlert:](self, "setIncidentAlert:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController navActionCoordinator](self, "navActionCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapSelectionManager"));
  objc_msgSend(v3, "clearSelection");

}

- (void)setIncidentAlert:(id)a3
{
  void *v5;
  RouteAnnotationsMutableConfiguration *routeAnnotationsConfiguration;
  void *v7;
  MNTrafficIncidentAlert *v8;

  v8 = (MNTrafficIncidentAlert *)a3;
  if (self->_incidentAlert != v8)
  {
    objc_storeStrong((id *)&self->_incidentAlert, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
    objc_msgSend(v5, "setTrafficIncidentAlert:", v8);

    routeAnnotationsConfiguration = self->_routeAnnotationsConfiguration;
    self->_routeAnnotationsConfiguration = 0;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController"));
    objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

  }
}

- (void)endNavModeAnimated:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  NavModeController *v7;
  NavModeController *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  _BOOL4 v21;

  v3 = a3;
  v5 = sub_100431C0C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_8;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v19 = v14;
    v20 = 1024;
    v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] endNavModeAnimated: %d", buf, 0x12u);

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
  objc_msgSend(v15, "stopMonitoringWithObserver:", self);

  -[NavigationPowerLogger stopLogging](self->_powerLogger, "stopLogging");
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController actionCoordinator](self, "actionCoordinator"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "appCoordinator"));
  objc_msgSend(v17, "endNavigationAndReturnToRoutePlanning:", 0);

}

- (void)_sceneBackgroundedWithOurViewVisible:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  id v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  if (+[UIApplication _maps_isAnyApplicationOrCarPlayApplicationSceneForeground](UIApplication, "_maps_isAnyApplicationOrCarPlayApplicationSceneForeground", a3))
  {
    v4 = sub_100431C0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: there is at least one foreground scene, ignoring this call.", buf, 2u);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "arrivalInfo"));

    if ((-[NSObject isInArrivalState](v5, "isInArrivalState") & 1) != 0)
    {
      v7 = -[NavModeController isUtteringGuidanceAudio](self, "isUtteringGuidanceAudio");
      v8 = sub_100431C0C();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v7)
      {
        if (v10)
        {
          *(_WORD *)v14 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: while arrived, but still uttering. Will end nav when we stop uttering.", v14, 2u);
        }

      }
      else
      {
        if (v10)
        {
          *(_WORD *)v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: while arrived, ending navigation", v13, 2u);
        }

        -[NavModeController endNavModeAnimated:](self, "endNavModeAnimated:", 0);
      }
    }
    else
    {
      v11 = sub_100431C0C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "_sceneBackgroundedWithOurViewVisible: not in arrival state, continue navigation", v15, 2u);
      }

    }
  }

}

- (void)personalizedItemSourceDidChangeItems:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  MKMapView *mapView;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController featuresSource](self, "featuresSource"));

  if (v5 == v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController featuresSource](self, "featuresSource"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allItems"));
    v8 = objc_msgSend(v7, "count");

    if (v8 == (id)1)
    {
      mapView = self->_mapView;
      v10 = 4;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController featuresSource](self, "featuresSource"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "allItems"));
      v13 = objc_msgSend(v12, "count");

      mapView = self->_mapView;
      v10 = v13 != 0;
    }
    -[MKMapView _setDisplayedSearchResultsType:](mapView, "_setDisplayedSearchResultsType:", v10);
  }
}

- (void)navActionCoordinator:(id)a3 didChangeMapViewZoom:(unint64_t)a4
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[NavModeController chromeViewController](self, "chromeViewController", a3, a4));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)screenLayoutDidChangeWithReason:(unint64_t)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint8_t buf[16];

  v10 = (id)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor", a3));
  if (objc_msgSend(v10, "isScreenOn"))
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "arrivalInfo"));
    v6 = objc_msgSend(v5, "isInArrivalState");

    if (v6)
    {
      v7 = sub_100431C0C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Screen turned off while arrived, ending navigation", buf, 2u);
      }

      -[NavModeController endNavModeAnimated:](self, "endNavModeAnimated:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsScreenLayoutMonitor sharedMonitor](MapsScreenLayoutMonitor, "sharedMonitor"));
      objc_msgSend(v9, "stopMonitoringWithObserver:", self);

    }
  }
}

- (BOOL)notifyCurrentStateWhenStartMonitoring
{
  return 0;
}

- (void)vlfContaineeViewControllerDidDisappearNotification:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005DFA94;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)wantsStatusBarControl
{
  void *v2;
  id v3;
  uint64_t v4;
  char IsNavigating;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v3 = objc_msgSend(v2, "state");
  IsNavigating = MNNavigationServiceStateIsNavigating(v3, v4);

  return IsNavigating;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v3 = objc_msgSend(v2, "prefersStatusBarHidden");

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return (int64_t)v3;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "statusBarBackgroundViewStyle"));

  return (StatusBarBackgroundViewStyle *)v3;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NavModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "statusBarSupplementaryView"));

  return (StatusBarSupplementaryView *)v3;
}

- (BOOL)wantsWeatherShowing
{
  return 0;
}

- (BOOL)permitsWeatherShowing
{
  return 0;
}

- (BOOL)wantsLookAroundShowing
{
  return 0;
}

- (BOOL)permitsLookAroundShowing
{
  return 0;
}

- (unint64_t)navigationCameraMode
{
  return self->_navigationCameraMode;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (NavActionCoordinator)navActionCoordinator
{
  return self->_navActionCoordinator;
}

- (NavContainerViewController)containerViewController
{
  return self->_containerViewController;
}

- (GuidanceObserver)guidanceObserver
{
  return self->_guidanceObserver;
}

- (NavigationDisplay)navigationDisplay
{
  return self->_navigationDisplay;
}

- (void)setNavigationDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_navigationDisplay, a3);
}

- (BOOL)isShowingFullScreenDirectionsList
{
  return self->_showFullScreenDirectionsList;
}

- (NavigationCustomFeaturesSource)featuresSource
{
  return self->_featuresSource;
}

- (NavigationPowerLogger)powerLogger
{
  return self->_powerLogger;
}

- (MNTrafficIncidentAlert)incidentAlert
{
  return self->_incidentAlert;
}

- (BOOL)isUtteringGuidanceAudio
{
  return self->_utteringGuidanceAudio;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incidentAlert, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
  objc_storeStrong((id *)&self->_featuresSource, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_guidanceObserver, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_storeStrong((id *)&self->_navActionCoordinator, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_routeAnnotationsConfiguration, 0);
  objc_storeStrong(&self->_chromeDeactivationToken, 0);
  objc_storeStrong((id *)&self->_rapNavigationTracker, 0);
  objc_storeStrong((id *)&self->_mapView, 0);
}

@end
