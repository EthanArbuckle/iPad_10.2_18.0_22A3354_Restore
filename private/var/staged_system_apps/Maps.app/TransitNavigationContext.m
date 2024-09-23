@implementation TransitNavigationContext

- (void)dealloc
{
  GEOTransitVehicleUpdater *transitVehicleUpdater;
  objc_super v4;

  -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", 0);
  transitVehicleUpdater = self->_transitVehicleUpdater;
  self->_transitVehicleUpdater = 0;

  v4.receiver = self;
  v4.super_class = (Class)TransitNavigationContext;
  -[TransitNavigationContext dealloc](&v4, "dealloc");
}

- (TransitNavigationContext)init
{
  TransitNavigationContext *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TransitNavigationContext;
  v2 = -[TransitNavigationContext init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sceneDidEnterBackground:", UISceneDidEnterBackgroundNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_sceneWillEnterForeground:", UISceneWillEnterForegroundNotification, 0);

  }
  return v2;
}

- (BOOL)showsMapView
{
  return 1;
}

- (BOOL)wantsNavigationDisplay
{
  return 1;
}

- (void)configureNavigationDisplay:(id)a3
{
  -[TransitNavigationContext _updateNavigationDisplayConfigurationForDisplayedStep:](self, "_updateNavigationDisplayConfigurationForDisplayedStep:", a3);
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

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchPinsManager"));

  if (!v4)
    return &__NSArray0__struct;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeStartEndItemSource"));
  v10 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  return v8;
}

- (void)enterStackInChromeViewController:(id)a3 withAnimation:(id)a4
{
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1008E2764;
  v4[3] = &unk_1011AC860;
  v4[4] = self;
  objc_msgSend(a4, "addPreparation:", v4);
}

- (void)becomeTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  TransitNavigationContext *v11;
  _QWORD v12[5];
  id v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1008E28AC;
  v12[3] = &unk_1011AC8B0;
  v12[4] = self;
  v6 = a3;
  v13 = v6;
  v7 = a4;
  objc_msgSend(v7, "addPreparation:", v12);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008E28F4;
  v9[3] = &unk_1011AC8B0;
  v10 = v6;
  v11 = self;
  v8 = v6;
  objc_msgSend(v7, "addAnimations:", v9);

}

- (void)resignTopContextInChromeViewController:(id)a3 withAnimation:(id)a4
{
  id v5;
  _QWORD v6[5];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008E29D8;
  v6[3] = &unk_1011AC8B0;
  v6[4] = self;
  v7 = a3;
  v5 = v7;
  objc_msgSend(a4, "addPreparation:", v6);

}

- (void)_setupMapView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "_setApplicationState:", 3);
  objc_msgSend(v4, "setScaleEnabled:", 0);
  objc_msgSend(v4, "_setLocationPropagationEnabled:", 0);
  objc_msgSend(v4, "_setShouldAnimatePositionWithRouteMatch:", 0);
  objc_msgSend(v4, "_setAlwaysShowHeadingIndicatorIfSupported:", 0);
  objc_msgSend(v4, "_setClearUserLocationOnLocationReset:", 0);
  objc_msgSend(v4, "_setShowHeadingIndicatorForStepping:", -[TransitNavigationContext _isAuthorizedForPreciseLocation](self, "_isAuthorizedForPreciseLocation"));

}

- (void)_restoreMapView:(id)a3
{
  id v3;
  __int128 v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "_setLocationPropagationEnabled:", 1);
  objc_msgSend(v3, "_setShouldAnimatePositionWithRouteMatch:", 1);
  objc_msgSend(v3, "_setClearUserLocationOnLocationReset:", 1);
  v4 = *(_OWORD *)VKAnnotationTrackingBehaviorDefault;
  v5 = VKAnnotationTrackingBehaviorDefault[2];
  objc_msgSend(v3, "_setUserTrackingBehavior:", &v4);
  objc_msgSend(v3, "_setAlwaysShowHeadingIndicatorIfSupported:", 1);
  objc_msgSend(v3, "_setShowHeadingIndicatorForStepping:", 0);
  objc_msgSend(v3, "_setShouldSplitRouteLine:", 0);
  objc_msgSend(v3, "_clearRouteContext");

}

- (BOOL)_isAuthorizedForPreciseLocation
{
  void *v2;
  unsigned __int8 v3;
  char v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v3 = objc_msgSend(v2, "isLocationServicesApproved");
  v4 = v3 & objc_msgSend(v2, "isAuthorizedForPreciseLocation");

  return v4;
}

- (id)fetchCurrentRoute
{
  -[TransitNavigationContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_updateCurrentRouteIfNeeded
{
  void *v3;
  GEOComposedRoute **p_route;
  GEOComposedRoute *route;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext fetchCurrentRoute](self, "fetchCurrentRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "uniqueRouteID"));
  route = self->_route;
  p_route = &self->_route;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](route, "uniqueRouteID"));
  v7 = v3;
  v8 = v6;
  if (v7 | v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
      objc_storeStrong((id *)p_route, obj);
  }

}

- (void)_updateAnnotationsForCurrentRoute
{
  id v3;

  -[GEOComposedRoute setManeuverDisplayEnabled:](self->_route, "setManeuverDisplayEnabled:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  objc_msgSend(v3, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (BOOL)wantsRouteAnnotationsControl
{
  return 1;
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  NSArray *lastReceivedVehiclePositions;
  id v5;
  void *v6;

  lastReceivedVehiclePositions = self->_lastReceivedVehiclePositions;
  v5 = a3;
  objc_msgSend(v5, "setTransitVehiclePositions:", lastReceivedVehiclePositions);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitVehicleUpdater tripIDs](self->_transitVehicleUpdater, "tripIDs"));
  objc_msgSend(v5, "filterTransitVehiclePositionsForTripsNotInSet:", v6);

  return 1;
}

- (BOOL)isDisplayingManuallySelectedStep
{
  -[TransitNavigationContext doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)wantsMapSelectionControl
{
  return 0;
}

- (id)_navCameraController
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationDisplay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cameraController"));

  return v4;
}

- (BOOL)isNavigationCameraTracking
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "navigationDisplay"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "configuration"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cameraPaused"));
  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue") ^ 1;

  return (char)v3;
}

- (BOOL)_shouldUseManualFraming
{
  return self->_forceManualFraming
      || -[TransitNavigationContext isDisplayingManuallySelectedStep](self, "isDisplayingManuallySelectedStep")
      || self->_temporarilyFramedStep != 0;
}

- (void)manuallyFrameCurrentStep
{
  GEOComposedRouteStep **p_temporarilyFramedStep;
  GEOComposedRouteStep *temporarilyFramedStep;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  int v10;
  id v11;

  p_temporarilyFramedStep = &self->_temporarilyFramedStep;
  temporarilyFramedStep = self->_temporarilyFramedStep;
  v5 = sub_10043309C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (temporarilyFramedStep)
  {
    if (v7)
    {
      v8 = -[GEOComposedRouteStep stepIndex](*p_temporarilyFramedStep, "stepIndex");
      v10 = 134217984;
      v11 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will temporarily frame step %lu", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    if (v7)
    {
      v9 = -[GEOComposedRouteStep stepIndex](self->_displayedStep, "stepIndex");
      v10 = 134217984;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Will frame current/displayed step %lu", (uint8_t *)&v10, 0xCu);
    }

    p_temporarilyFramedStep = &self->_displayedStep;
  }
  -[TransitNavigationContext _manuallyFrameStep:](self, "_manuallyFrameStep:", *p_temporarilyFramedStep);
}

- (void)temporarilyFrameStep:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GEOComposedRouteStep *temporarilyFramedStep;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_10043309C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v4, "stepIndex");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Asked to temporarily frame step %lu", (uint8_t *)&v8, 0xCu);
  }

  temporarilyFramedStep = self->_temporarilyFramedStep;
  self->_temporarilyFramedStep = (GEOComposedRouteStep *)v4;

  -[TransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
  -[TransitNavigationContext updateFramingForCurrentStep](self, "updateFramingForCurrentStep");
}

- (void)_manuallyFrameStep:(id)a3
{
  id v4;
  TransitSteppingCameraFramer *v5;
  TransitSteppingCameraFramer *manualSteppingFramer;
  id v7;
  TransitSteppingCameraFramer *v8;
  _QWORD v9[5];
  id v10;
  id location;

  v4 = a3;
  if (!self->_manualSteppingFramer)
  {
    v5 = objc_alloc_init(TransitSteppingCameraFramer);
    manualSteppingFramer = self->_manualSteppingFramer;
    self->_manualSteppingFramer = v5;

  }
  -[TransitNavigationContext willManuallyFrameStep](self, "willManuallyFrameStep");
  v7 = objc_msgSend(v4, "stepIndex");
  objc_initWeak(&location, self);
  v8 = self->_manualSteppingFramer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008E315C;
  v9[3] = &unk_1011BFCC8;
  objc_copyWeak(&v10, &location);
  v9[4] = self;
  -[TransitSteppingCameraFramer rectForStep:currentStepIndex:handler:](v8, "rectForStep:currentStepIndex:handler:", v4, v7, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (void)_checkRouteProximityForManualFraming:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  const __CFString *v16;
  id v17;
  NSObject *v18;
  __CFString *v19;
  __CFString *v20;
  uint64_t v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  uint64_t v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = objc_msgSend(v5, "isCurrentLocation");

  if ((v6 & 1) != 0)
  {
    if (self->_forceManualFraming)
    {
      v7 = sub_10043309C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Route is from current location, disable forced manual framing", (uint8_t *)&v22, 2u);
      }

      self->_forceManualFraming = 0;
    }
  }
  else if (!self->_forceManualFraming)
  {
    if (GEOConfigGetBOOL(MapsConfig_TransitNavigationCheckProximityForAutomaticFraming, off_1014B4698))
    {
      v9 = v4;
      if (v9)
      {
        v10 = objc_msgSend(objc_alloc((Class)MNRouteProximitySensor), "initWithRoute:", v9);
        objc_msgSend(v10, "setProximityThreshold:", GEOConfigGetDouble(MapsConfig_TransitNavigationProximityForAutomaticFraming, off_1014B46A8));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext fetchLastLocation](self, "fetchLastLocation"));
        v12 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v11);
        objc_msgSend(v10, "updateForLocation:", v12);
        v13 = objc_msgSend(v10, "proximity");
        self->_forceManualFraming = (unint64_t)v13 < 2;
        v14 = sub_10043309C();
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          if ((unint64_t)v13 > 4)
            v16 = &stru_1011EB268;
          else
            v16 = *(&off_1011DB440 + (_QWORD)v13);
          if (self->_forceManualFraming)
            v19 = CFSTR("YES");
          else
            v19 = CFSTR("NO");
          v20 = v19;
          objc_msgSend(v10, "proximityThreshold");
          v22 = 138543874;
          v23 = v16;
          v24 = 2114;
          v25 = v19;
          v26 = 2048;
          v27 = v21;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Route is point-to-point, proximity to route is %{public}@, force manual framing: %{public}@ (threshold: %#.1lfm)", (uint8_t *)&v22, 0x20u);

        }
      }

    }
    else
    {
      v17 = sub_10043309C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Route is point-to-point, force manual framing", (uint8_t *)&v22, 2u);
      }

      self->_forceManualFraming = 1;
    }
  }

}

- (void)updateFramingForCurrentStep
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v3 = sub_10043309C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating camera behaviour for current step...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "navigationDisplay"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008E37F0;
  v13[3] = &unk_1011AD430;
  v13[4] = self;
  objc_msgSend(v6, "configureDisplay:animated:", v13, 1);

  if (-[TransitNavigationContext isNavigationCameraTracking](self, "isNavigationCameraTracking")
    && (-[TransitNavigationContext isCameraPanningOrZoomed](self, "isCameraPanningOrZoomed") & 1) == 0)
  {
    v7 = sub_10043309C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Automatically returning to puck, navigation display is unpaused and user has no panned/zoomed map", buf, 2u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapView"));
    objc_msgSend(v10, "navigationCameraReturnToPuck");

  }
  if (-[TransitNavigationContext _shouldUseManualFraming](self, "_shouldUseManualFraming"))
  {
    v11 = sub_10043309C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will manually frame current step", buf, 2u);
    }

    -[TransitNavigationContext manuallyFrameCurrentStep](self, "manuallyFrameCurrentStep");
  }
}

- (void)_updateNavigationDisplayConfigurationForDisplayedStep:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];
  uint8_t v17[16];

  v4 = a3;
  v5 = v4;
  if (self->_displayedStep)
  {
    objc_msgSend(v4, "setCameraStyle:", 1);
    if (-[TransitNavigationContext _shouldUseManualFraming](self, "_shouldUseManualFraming"))
    {
      if (-[TransitNavigationContext isNavigationCameraTracking](self, "isNavigationCameraTracking"))
      {
        v6 = sub_10043309C();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Pausing camera to frame step manually", buf, 2u);
        }

        v8 = &__kCFBooleanTrue;
LABEL_14:
        objc_msgSend(v5, "setCameraPaused:", v8);
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cameraPaused"));
      v12 = objc_msgSend(v11, "BOOLValue");

      if (v12)
      {
        v13 = sub_10043309C();
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Starting camera for automatic step framing", v15, 2u);
        }

        v8 = &__kCFBooleanFalse;
        goto LABEL_14;
      }
    }
  }
  else
  {
    v9 = sub_10043309C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "No displayedStep set to configure in navigation display", v17, 2u);
    }

  }
}

- (BOOL)shouldShowRecenterButton
{
  return (-[TransitNavigationContext isCameraPanningOrZoomed](self, "isCameraPanningOrZoomed") & 1) != 0
      || -[TransitNavigationContext isDisplayingManuallySelectedStep](self, "isDisplayingManuallySelectedStep")
      || self->_temporarilyFramedStep != 0;
}

- (void)recenterOnActiveStep
{
  id v3;
  NSObject *v4;
  GEOComposedRouteStep *temporarilyFramedStep;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if (-[TransitNavigationContext shouldShowRecenterButton](self, "shouldShowRecenterButton"))
  {
    if (self->_temporarilyFramedStep)
    {
      v3 = sub_10043309C();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Camera clearing temporarily-framed step (recenter button)", buf, 2u);
      }

      temporarilyFramedStep = self->_temporarilyFramedStep;
      self->_temporarilyFramedStep = 0;

      -[TransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
      -[TransitNavigationContext updateFramingForCurrentStep](self, "updateFramingForCurrentStep");
    }
    else if (-[TransitNavigationContext isNavigationCameraTracking](self, "isNavigationCameraTracking"))
    {
      v6 = sub_10043309C();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Camera returning to automatic/puck framing (recenter button)", v13, 2u);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapView"));
      objc_msgSend(v9, "navigationCameraReturnToPuck");

    }
    else if (-[TransitNavigationContext _shouldUseManualFraming](self, "_shouldUseManualFraming"))
    {
      v10 = sub_10043309C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Camera returning to point-to-point framing (recenter button)", v12, 2u);
      }

      -[TransitNavigationContext manuallyFrameCurrentStep](self, "manuallyFrameCurrentStep");
    }
  }
}

- (id)transitVehicleUpdater:(id)a3 shouldUpdateVehiclePositionsForTripIDs:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  id UInteger;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext _stepForTransitVehicleUpdater](self, "_stepForTransitVehicleUpdater"));
  if (v6 && (v7 = objc_opt_class(GEOComposedTransitRouteStep), (objc_opt_isKindOfClass(v6, v7) & 1) != 0))
  {
    v8 = v6;
    UInteger = (id)GEOConfigGetUInteger(MapsConfig_TransitMaximumNumberOfVehiclesToDisplay, off_1014B2D88);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", UInteger));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "vehicleEntries", 0));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "upcomingTripIDs"));

    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16);
        if (objc_msgSend(v5, "containsObject:", v17))
          objc_msgSend(v10, "addObject:", v17);
        if (objc_msgSend(v10, "count") == UInteger)
          break;
        if (v14 == (id)++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v14)
            goto LABEL_5;
          break;
        }
      }
    }

    v18 = objc_msgSend(v10, "copy");
  }
  else
  {
    v18 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  }

  return v18;
}

- (void)transitVehicleUpdater:(id)a3 didUpdateVehiclePositions:(id)a4 forTripIDs:(id)a5
{
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  id v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allObjects", a3));
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, v6);
  -[TransitNavigationContext _updateAnnotationsForCurrentRoute](self, "_updateAnnotationsForCurrentRoute");
  if (objc_msgSend(v6, "count")
    && !-[TransitNavigationContext _shouldFrameVehiclePositions](self, "_shouldFrameVehiclePositions"))
  {
    v7 = sub_10043309C();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 134217984;
      v11 = objc_msgSend(v6, "count");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Will not frame %lu vehicle positions, displayed step is not active step", (uint8_t *)&v10, 0xCu);
    }

    v6 = &__NSArray0__struct;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext _navCameraController](self, "_navCameraController"));
  objc_msgSend(v9, "frameVehiclePositions:", v6);

}

- (id)_stepForTransitVehicleUpdater
{
  return self->_displayedStep;
}

- (void)updateTransitVehicleUpdaterIfNeeded
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t v15[16];

  if (self->_transitVehicleUpdater)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext _stepForTransitVehicleUpdater](self, "_stepForTransitVehicleUpdater"));
    if (v3
      && (v4 = objc_opt_class(GEOComposedTransitRouteStep), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    {
      v5 = v3;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleEntries"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "vehicleEntries"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tripIDs"));

      }
      else
      {
        v8 = &__NSArray0__struct;
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v8));
      -[GEOTransitVehicleUpdater setTripIDs:](self->_transitVehicleUpdater, "setTripIDs:", v9);

    }
    else
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      -[GEOTransitVehicleUpdater setTripIDs:](self->_transitVehicleUpdater, "setTripIDs:", v5);
    }

    -[TransitNavigationContext _updateAnnotationsForCurrentRoute](self, "_updateAnnotationsForCurrentRoute");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEOTransitVehicleUpdater tripIDs](self->_transitVehicleUpdater, "tripIDs"));
    if (objc_msgSend(v10, "count")
      && !-[TransitNavigationContext _shouldFrameVehiclePositions](self, "_shouldFrameVehiclePositions"))
    {
      v11 = sub_10043309C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Will not frame any vehicle positions, displayed step is not active step", v15, 2u);
      }

      v13 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
      v10 = (void *)v13;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext _navCameraController](self, "_navCameraController"));
    objc_msgSend(v14, "filterVehiclePositionsForTripsNotInSet:", v10);

  }
}

- (BOOL)_shouldFrameVehiclePositions
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext _stepForTransitVehicleUpdater](self, "_stepForTransitVehicleUpdater"));
  v4 = objc_msgSend(v3, "stepIndex");

  if (v4 == -[GEOComposedRouteStep stepIndex](self->_activeStep, "stepIndex"))
    return 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v6, "BOOLForKey:", CFSTR("NavigationTransitFrameVehiclePositionsForSelectedStep")))
    v5 = v4 == -[GEOComposedRouteStep stepIndex](self->_displayedStep, "stepIndex");
  else
    v5 = 0;

  return v5;
}

- (void)_sceneDidEnterBackground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (v9 == v8)
    -[TransitNavigationContext _pauseOrResumeRealtimeUpdatesIfNeeded](self, "_pauseOrResumeRealtimeUpdatesIfNeeded");

}

- (void)_sceneWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  if (v9 == v8)
    -[TransitNavigationContext _pauseOrResumeRealtimeUpdatesIfNeeded](self, "_pauseOrResumeRealtimeUpdatesIfNeeded");

}

- (void)startRequestingRealtimeUpdates
{
  -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", 1);
}

- (void)stopRequestingRealtimeUpdates
{
  -[GEOTransitVehicleUpdater setActive:](self->_transitVehicleUpdater, "setActive:", 0);
}

- (void)_pauseOrResumeRealtimeUpdatesIfNeeded
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  if (!self->_requestingRealtimeUpdates)
  {
LABEL_5:
    if (!-[TransitNavigationContext _sceneInBackground](self, "_sceneInBackground"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
      v6 = objc_msgSend(v5, "isTopContext:", self);

      if (v6)
      {
        v7 = sub_10043309C();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Resuming realtime updates from context", v11, 2u);
        }

        self->_requestingRealtimeUpdates = 1;
        -[TransitNavigationContext startRequestingRealtimeUpdates](self, "startRequestingRealtimeUpdates");
      }
    }
    return;
  }
  if (!-[TransitNavigationContext _sceneInBackground](self, "_sceneInBackground"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
    v4 = objc_msgSend(v3, "isTopContext:", self);

    if ((v4 & 1) != 0)
    {
      if (self->_requestingRealtimeUpdates)
        return;
      goto LABEL_5;
    }
  }
  v9 = sub_10043309C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Pausing realtime updates from context", buf, 2u);
  }

  self->_requestingRealtimeUpdates = 0;
  -[TransitNavigationContext stopRequestingRealtimeUpdates](self, "stopRequestingRealtimeUpdates");
}

- (BOOL)_sceneInBackground
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "window"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "windowScene"));

  if (objc_msgSend(v5, "activationState"))
    v6 = objc_msgSend(v5, "activationState") != (id)1;
  else
    v6 = 0;

  return v6;
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapRowForItem:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "matchingRouteStepIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext displayedStep](self, "displayedStep"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext displayedStep](self, "displayedStep"));
    v11 = (uint64_t)objc_msgSend(v10, "stepIndex");

  }
  else
  {
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if ((id)v11 == v8)
  {
    -[TransitNavigationContext didReselectDisplayedStep](self, "didReselectDisplayedStep");
  }
  else
  {
    v12 = sub_10043309C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134218496;
      v21 = v8;
      v22 = 2048;
      v23 = v11;
      v24 = 2048;
      v25 = objc_msgSend(v6, "activeComposedRouteStepIndex");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Will manually select stepIndex: %lu, previous: %lu, auto-advance: %lu", (uint8_t *)&v20, 0x20u);
    }

    v14 = objc_msgSend(v6, "displayedItemIndex");
    v15 = objc_msgSend(v6, "indexOfItem:", v7);
    v16 = -[TransitNavigationContext currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v15 - v14));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedItemIndexForAnalytics"));
    +[GEOAPPortal captureUserAction:target:value:transitStep:](GEOAPPortal, "captureUserAction:target:value:transitStep:", 235, v16, v18, v19);

    objc_msgSend(v6, "setDisplayedComposedRouteStepIndex:", objc_msgSend(v7, "matchingRouteStepIndex"));
    -[TransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
  }

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateDisplayedGuidanceStep:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(-[TransitNavigationContext displayedStep](self, "displayedStep"));
  if (!v6
    || (v7 = (void *)v6,
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext displayedStep](self, "displayedStep")),
        v9 = objc_msgSend(v8, "stepIndex"),
        v10 = objc_msgSend(v5, "stepIndex"),
        v8,
        v7,
        v9 != v10))
  {
    v11 = sub_10043309C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext displayedStep](self, "displayedStep"));
      v14 = 134218240;
      v15 = objc_msgSend(v13, "stepIndex");
      v16 = 2048;
      v17 = objc_msgSend(v5, "stepIndex");
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Notified displayed step changed from %lu to %lu", (uint8_t *)&v14, 0x16u);

    }
    -[TransitNavigationContext setDisplayedStep:](self, "setDisplayedStep:", v5);
    -[TransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
    -[TransitNavigationContext updateTransitVehicleUpdaterIfNeeded](self, "updateTransitVehicleUpdaterIfNeeded");
    -[TransitNavigationContext updateFramingForCurrentStep](self, "updateFramingForCurrentStep");
  }

}

- (void)transitDirectionsStepsListDataSource:(id)a3 didUpdateActiveGuidanceStep:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));
  if (!v8
    || (v9 = (void *)v8,
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep")),
        v11 = objc_msgSend(v10, "stepIndex"),
        v12 = objc_msgSend(v7, "stepIndex"),
        v10,
        v9,
        v11 != v12))
  {
    v13 = sub_10043309C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitNavigationContext activeStep](self, "activeStep"));
      v18 = 134218240;
      v19 = objc_msgSend(v15, "stepIndex");
      v20 = 2048;
      v21 = objc_msgSend(v7, "stepIndex");
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Notified active step changed from %lu to %lu", (uint8_t *)&v18, 0x16u);

    }
    -[TransitNavigationContext setActiveStep:](self, "setActiveStep:", v7);
    -[TransitNavigationContext canRecenterDidChange](self, "canRecenterDidChange");
    v16 = -[TransitNavigationContext currentUITargetForAnalytics](self, "currentUITargetForAnalytics");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "displayedItemIndexForAnalytics"));
    +[GEOAPPortal captureUserAction:target:value:transitStep:](GEOAPPortal, "captureUserAction:target:value:transitStep:", 3066, v16, 0, v17);

  }
}

- (void)transitDirectionsStepsListDataSource:(id)a3 didTapIncidentsCell:(id)a4 withAdvisory:(id)a5
{
  -[TransitNavigationContext presentAdvisory:](self, "presentAdvisory:", a5, a4);
}

- (int)currentUITargetForAnalytics
{
  return 610;
}

- (int)currentMapViewTargetForAnalytics
{
  return 505;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (GEOComposedRouteStep)activeStep
{
  return self->_activeStep;
}

- (void)setActiveStep:(id)a3
{
  objc_storeStrong((id *)&self->_activeStep, a3);
}

- (GEOComposedRouteStep)displayedStep
{
  return self->_displayedStep;
}

- (void)setDisplayedStep:(id)a3
{
  objc_storeStrong((id *)&self->_displayedStep, a3);
}

- (BOOL)forceManualFraming
{
  return self->_forceManualFraming;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_lastReceivedVehiclePositions, 0);
  objc_storeStrong((id *)&self->_transitVehicleUpdater, 0);
  objc_storeStrong((id *)&self->_temporarilyFramedStep, 0);
  objc_storeStrong((id *)&self->_manualSteppingFramer, 0);
  objc_storeStrong((id *)&self->_displayedStep, 0);
  objc_storeStrong((id *)&self->_activeStep, 0);
  objc_storeStrong((id *)&self->_route, 0);
}

@end
