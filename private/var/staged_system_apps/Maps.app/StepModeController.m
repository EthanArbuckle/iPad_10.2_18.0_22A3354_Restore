@implementation StepModeController

- (StepModeController)initWithRoute:(id)a3 initialStepIndex:(unint64_t)a4 desiredUserTrackingMode:(id)a5
{
  id v9;
  id v10;
  StepModeController *v11;
  StepModeController *v12;
  NavigationPowerLogger *v13;
  NavigationPowerLogger *powerLogger;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)StepModeController;
  v11 = -[StepModeController init](&v16, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_route, a3);
    v12->_initialStepIndex = a4;
    if (v10)
    {
      v12->_initializedWithUserTrackingMode = 1;
      v12->_desiredTrackingMode = (int64_t)objc_msgSend(v10, "integerValue");
    }
    if (-[GEOComposedRoute transportType](v12->_route, "transportType") == 1)
    {
      v13 = objc_alloc_init(NavigationPowerLogger);
      powerLogger = v12->_powerLogger;
      v12->_powerLogger = v13;

      -[NavigationPowerLogger startLogging](v12->_powerLogger, "startLogging");
    }
  }

  return v12;
}

- (void)setDesiredInitialCamera:(id)a3
{
  MKMapCamera *v4;
  MKMapCamera *desiredInitialCamera;

  v4 = (MKMapCamera *)objc_msgSend(a3, "copy");
  desiredInitialCamera = self->_desiredInitialCamera;
  self->_desiredInitialCamera = v4;

}

- (void)updateWithDisplayedStep:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v5, "updateWithDisplayedStep:", v4);

}

- (StepActionCoordination)actionCoordinator
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stepActionCoordinator"));

  return (StepActionCoordination *)v3;
}

- (void)setChromeViewController:(id)a3
{
  IOSBasedChromeViewController **p_chromeViewController;
  id v5;

  p_chromeViewController = &self->_chromeViewController;
  v5 = a3;
  objc_storeWeak((id *)p_chromeViewController, v5);
  -[ContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", v5);

}

- (StepContainerViewController)containerViewController
{
  StepContainerViewController *containerViewController;
  _BOOL4 initializedWithUserTrackingMode;
  StepContainerViewController *v5;
  GEOComposedRoute *route;
  unint64_t initialStepIndex;
  StepContainerViewController *v8;
  StepContainerViewController *v9;
  void *v10;

  containerViewController = self->_containerViewController;
  if (!containerViewController)
  {
    initializedWithUserTrackingMode = self->_initializedWithUserTrackingMode;
    v5 = [StepContainerViewController alloc];
    route = self->_route;
    initialStepIndex = self->_initialStepIndex;
    if (initializedWithUserTrackingMode)
      v8 = -[StepContainerViewController initWithRoute:initialStepIndex:desiredTrackingMode:](v5, "initWithRoute:initialStepIndex:desiredTrackingMode:", route, initialStepIndex, self->_desiredTrackingMode);
    else
      v8 = -[StepContainerViewController initWithRoute:initialStepIndex:](v5, "initWithRoute:initialStepIndex:", route, initialStepIndex);
    v9 = self->_containerViewController;
    self->_containerViewController = v8;

    -[ContainerViewController setChromeContext:](self->_containerViewController, "setChromeContext:", self);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
    -[ContainerViewController setChromeViewController:](self->_containerViewController, "setChromeViewController:", v10);

    containerViewController = self->_containerViewController;
  }
  return containerViewController;
}

- (BOOL)usesDefaultTransitions
{
  return 0;
}

- (id)transitionControllerForPushFromMode:(id)a3
{
  return objc_opt_new(ModeTransitionController);
}

- (id)transitionControllerForPopToMode:(id)a3
{
  return objc_opt_new(ModeTransitionController);
}

- (id)mapViewDelegate
{
  return self->_containerViewController;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsCompassLayoutControl
{
  return sub_1002A8AA0(self->_containerViewController) != 5;
}

- (id)personalizedItemSources
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v3;
  id v4;
  GEOComposedRoute *route;

  if (self->_route)
  {
    route = self->_route;
    v3 = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &route, 1));
    objc_msgSend(v3, "setRoutes:", v4, route);

  }
  else
  {
    v4 = a3;
    objc_msgSend(v4, "setRoutes:", 0);
  }

  return 1;
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
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
  v9[2] = sub_100B95E78;
  v9[3] = &unk_1011AD1E8;
  objc_copyWeak(&v11, &location);
  v8 = v6;
  v10 = v8;
  objc_msgSend(v7, "addPreparation:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

- (void)_becomeTopContextInChromeViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  char *v15;
  char v16;
  _BYTE v17[23];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "_locationManagerApprovalDidChange:", MKLocationManagerApprovalDidChangeNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

  objc_msgSend(v6, "setCompassEnabled:", 1);
  objc_msgSend(v6, "setScaleEnabled:", 0);
  objc_msgSend(v6, "_setLocationPropagationEnabled:", 0);
  objc_msgSend(v6, "_setShouldAnimatePositionWithRouteMatch:", 0);
  *(_OWORD *)v17 = *(_OWORD *)((char *)VKAnnotationTrackingBehaviorDefault + 1);
  *(_QWORD *)&v17[15] = VKAnnotationTrackingBehaviorDefault[2];
  v16 = 0;
  objc_msgSend(v6, "_setUserTrackingBehavior:", &v16);
  objc_msgSend(v6, "_setAlwaysShowHeadingIndicatorIfSupported:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController actionCoordinator](self, "actionCoordinator"));
  objc_msgSend(v6, "_setShowHeadingIndicatorForStepping:", objc_msgSend(v7, "isAuthorizedForPreciseLocation"));

  objc_msgSend(v6, "_setApplicationState:", 3);
  if (-[GEOComposedRoute transportType](self->_route, "transportType") == 1)
  {
    v11 = sub_1004318FC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[StepModeController _becomeTopContextInChromeViewController:]";
      v20 = 2080;
      v21 = "StepModeController.m";
      v22 = 1024;
      v23 = 193;
      v24 = 2080;
      v25 = "_route.transportType != GEOTransportType_TRANSIT";
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
  -[GEOComposedRoute setManeuverDisplayEnabled:](self->_route, "setManeuverDisplayEnabled:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v8, "updateViewMode:animated:", 0, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userLocationView"));

  objc_msgSend(v10, "setMode:animated:", 0, 1);
  self->_previousHeadingIndicatorStyle = (int64_t)objc_msgSend(v10, "headingIndicatorStyle");
  objc_msgSend(v10, "setHeadingIndicatorStyle:", 0);
  self->_previousEnabledStatus = objc_msgSend(v10, "isEnabled");
  objc_msgSend(v10, "setEnabled:", 0);
  if (-[GEOComposedRoute transportType](self->_route, "transportType"))
    objc_msgSend(v6, "setShowsTraffic:", 0);
  if (self->_desiredInitialCamera)
    objc_msgSend(v6, "setCamera:");

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
  v9[2] = sub_100B962A4;
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  uint64_t v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3));
  objc_msgSend(v4, "removeObserver:name:object:", self, MKLocationManagerApprovalDidChangeNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapView"));

  objc_msgSend(v6, "_setLocationPropagationEnabled:", 1);
  objc_msgSend(v6, "_setShouldAnimatePositionWithRouteMatch:", 1);
  objc_msgSend(v6, "_setClearUserLocationOnLocationReset:", 1);
  v10 = *(_OWORD *)VKAnnotationTrackingBehaviorDefault;
  v11 = VKAnnotationTrackingBehaviorDefault[2];
  objc_msgSend(v6, "_setUserTrackingBehavior:", &v10);
  objc_msgSend(v6, "_setAlwaysShowHeadingIndicatorIfSupported:", 1);
  objc_msgSend(v6, "_setShowHeadingIndicatorForStepping:", 0);
  objc_msgSend(v6, "_setApplicationState:", 0);
  objc_msgSend(v6, "_clearRouteContext");
  if (objc_msgSend(v6, "userTrackingMode"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
    objc_msgSend(v7, "setTrackingMode:monitorBatteryState:", 0, 0);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController chromeViewController](self, "chromeViewController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userLocationView"));

  objc_msgSend(v9, "setHeadingIndicatorStyle:", self->_previousHeadingIndicatorStyle);
  objc_msgSend(v9, "setEnabled:", self->_previousEnabledStatus);
  objc_msgSend(v6, "_setShouldSplitRouteLine:", 0);
  -[GEOComposedRoute setManeuverDisplayEnabled:](self->_route, "setManeuverDisplayEnabled:", 0);
  -[NavigationPowerLogger stopLogging](self->_powerLogger, "stopLogging");

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[App switcher title] Directions to <destination>"), CFSTR("localized string not found"), 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController route](self, "route"));
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

- (void)_locationManagerApprovalDidChange:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100B96614;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)supportsLockscreen
{
  return -[GEOComposedRoute transportType](self->_route, "transportType") == 1;
}

- (void)willBeginDisplayingInSecureLockScreen
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
  objc_msgSend(v2, "willBeginDisplayingInSecureLockScreen");

}

- (BOOL)shouldResetStateAfterResigning
{
  return 1;
}

- (BOOL)wantsStatusBarControl
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
  v3 = objc_msgSend(v2, "prefersStatusBarHidden");

  return v3;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
  v3 = objc_msgSend(v2, "preferredStatusBarStyle");

  return (int64_t)v3;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "statusBarBackgroundViewStyle"));

  return (StatusBarBackgroundViewStyle *)v3;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[StepModeController containerViewController](self, "containerViewController"));
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

- (GEOComposedRoute)route
{
  return self->_route;
}

- (void)setRoute:(id)a3
{
  objc_storeStrong((id *)&self->_route, a3);
}

- (IOSBasedChromeViewController)chromeViewController
{
  return (IOSBasedChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_containerViewController, a3);
}

- (int64_t)desiredTrackingMode
{
  return self->_desiredTrackingMode;
}

- (void)setDesiredTrackingMode:(int64_t)a3
{
  self->_desiredTrackingMode = a3;
}

- (BOOL)initializedWithUserTrackingMode
{
  return self->_initializedWithUserTrackingMode;
}

- (void)setInitializedWithUserTrackingMode:(BOOL)a3
{
  self->_initializedWithUserTrackingMode = a3;
}

- (MKMapCamera)desiredInitialCamera
{
  return self->_desiredInitialCamera;
}

- (unint64_t)initialStepIndex
{
  return self->_initialStepIndex;
}

- (void)setInitialStepIndex:(unint64_t)a3
{
  self->_initialStepIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_desiredInitialCamera, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_powerLogger, 0);
}

@end
