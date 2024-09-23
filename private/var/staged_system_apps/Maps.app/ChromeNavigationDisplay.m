@implementation ChromeNavigationDisplay

- (void)dealloc
{
  objc_super v3;

  -[ChromeNavigationDisplay stopRunningNavigationAnimated:](self, "stopRunningNavigationAnimated:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ChromeNavigationDisplay;
  -[ChromeNavigationDisplay dealloc](&v3, "dealloc");
}

- (ChromeNavigationDisplay)init
{
  return -[ChromeNavigationDisplay initWithChromeViewController:](self, "initWithChromeViewController:", 0);
}

- (ChromeNavigationDisplay)initWithChromeViewController:(id)a3
{
  id v4;
  ChromeNavigationDisplay *v5;
  ChromeNavigationDisplay *v6;
  id v7;
  uint64_t v8;
  ChromeNavigationDisplayConfiguration *configuration;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ChromeNavigationDisplay;
  v5 = -[ChromeNavigationDisplay init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend((id)objc_opt_class(v5), "defaultConfiguration");
    v8 = objc_claimAutoreleasedReturnValue(v7);
    configuration = v6->_configuration;
    v6->_configuration = (ChromeNavigationDisplayConfiguration *)v8;

    -[ChromeNavigationDisplay setChromeViewController:](v6, "setChromeViewController:", v4);
  }

  return v6;
}

- (MKMapView)mapView
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mapView"));

  return (MKMapView *)v3;
}

- (id)mapViewDelegate
{
  return self->_navigationDisplay;
}

+ (id)defaultConfiguration
{
  ChromeNavigationDisplayConfiguration *v2;

  v2 = objc_opt_new(ChromeNavigationDisplayConfiguration);
  -[ChromeNavigationDisplayConfiguration setCameraStyle:](v2, "setCameraStyle:", 1);
  -[ChromeNavigationDisplayConfiguration setCameraPaused:](v2, "setCameraPaused:", &__kCFBooleanFalse);
  -[ChromeNavigationDisplayConfiguration setShowsRoadLabel:](v2, "setShowsRoadLabel:", &__kCFBooleanTrue);
  return v2;
}

- (void)configureDisplay:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(id, id);
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;

  v4 = a4;
  v6 = (void (**)(id, id))a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
  v8 = objc_msgSend(v7, "copy");
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    v11 = objc_msgSend((id)objc_opt_class(self), "defaultConfiguration");
    v10 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  v16 = v10;

  v6[2](v6, v16);
  -[ChromeNavigationDisplay _setConfiguration:animated:](self, "_setConfiguration:animated:", v16, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
  v13 = objc_opt_respondsToSelector(v12, "chromeNavigationDisplay:configurationDidChange:");

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
    v15 = -[ChromeNavigationDisplayConfiguration copy](self->_configuration, "copy");
    objc_msgSend(v14, "chromeNavigationDisplay:configurationDidChange:", self, v15);

  }
}

- (void)_setConfiguration:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  id v8;
  ChromeNavigationDisplayConfiguration **p_configuration;
  id v10;
  NSObject *v11;
  id v12;
  ChromeNavigationDisplayConfiguration *lastAppliedConfiguration;
  const char *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  ChromeNavigationDisplayConfiguration *v24;
  int v25;
  id v26;

  v4 = a4;
  v6 = a3;
  v7 = objc_msgSend(v6, "cameraStyle");
  if (!v7)
  {
    v8 = objc_msgSend(v6, "copy");

    objc_msgSend(v8, "setCameraStyle:", -[ChromeNavigationDisplayConfiguration cameraStyle](self->_configuration, "cameraStyle"));
    v6 = v8;
  }
  p_configuration = &self->_configuration;
  objc_storeStrong((id *)&self->_configuration, v6);
  v10 = sub_100B782E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v25 = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v25, 0xCu);
  }

  if (-[ChromeNavigationDisplay isSuppressed](self, "isSuppressed"))
  {
    v12 = sub_100B782E8();
    lastAppliedConfiguration = (ChromeNavigationDisplayConfiguration *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(&lastAppliedConfiguration->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      v14 = "Will not update for current configuration, currently suppressed";
LABEL_18:
      _os_log_impl((void *)&_mh_execute_header, &lastAppliedConfiguration->super, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v25, 2u);
    }
  }
  else if (self->_navigationDisplay)
  {
    if (v7)
      -[ChromeNavigationDisplay _transitionToCameraStyle:animated:](self, "_transitionToCameraStyle:animated:", v7, v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration routeGeniusEntry](self->_configuration, "routeGeniusEntry"));
    -[ChromeNavigationDisplay _updateWithRouteGeniusEntry:](self, "_updateWithRouteGeniusEntry:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration cameraPaused](self->_configuration, "cameraPaused"));
    if (v16)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration cameraPaused](*p_configuration, "cameraPaused"));
      v18 = objc_msgSend(v17, "BOOLValue");

      if (v18)
      {
        v19 = sub_100B782E8();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v25) = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will force stop navigation camera motion", (uint8_t *)&v25, 2u);
        }

        -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 0, v4);
        -[ChromeNavigationDisplay _stopNavigationCameraMotion](self, "_stopNavigationCameraMotion");
      }
      else
      {
        -[ChromeNavigationDisplay _startNavigationCameraMotionAnimated:](self, "_startNavigationCameraMotionAnimated:", v4);
      }
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration showsRoadLabel](*p_configuration, "showsRoadLabel"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplayConfiguration showsRoadLabel](self->_configuration, "showsRoadLabel"));
      -[NavigationDisplay setShowsRoadLabel:](self->_navigationDisplay, "setShowsRoadLabel:", objc_msgSend(v23, "BOOLValue"));

    }
    else
    {
      -[NavigationDisplay setShowsRoadLabel:](self->_navigationDisplay, "setShowsRoadLabel:", 1);
    }
    v24 = (ChromeNavigationDisplayConfiguration *)-[ChromeNavigationDisplayConfiguration copy](self->_configuration, "copy");
    lastAppliedConfiguration = self->_lastAppliedConfiguration;
    self->_lastAppliedConfiguration = v24;
  }
  else
  {
    v21 = sub_100B782E8();
    lastAppliedConfiguration = (ChromeNavigationDisplayConfiguration *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(&lastAppliedConfiguration->super, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v25) = 0;
      v14 = "Will not update for current configuration, navigation display not ready";
      goto LABEL_18;
    }
  }

}

- (void)updateWithRoute:(id)a3
{
  GEOComposedRoute *v4;

  v4 = (GEOComposedRoute *)a3;
  -[NavigationDisplay updateWithRoute:](self->_navigationDisplay, "updateWithRoute:", v4);
  if (self->_route == v4)
    -[ChromeNavigationDisplay _updateForCurrentRoute](self, "_updateForCurrentRoute");
  else
    -[ChromeNavigationDisplay _setRoute:](self, "_setRoute:", v4);

}

- (void)_updateWithRouteGeniusEntry:(id)a3
{
  -[NavigationDisplay setRouteGeniusEntry:](self->_navigationDisplay, "setRouteGeniusEntry:");
  if (a3)
    -[ChromeNavigationDisplay updateWithRoute:](self, "updateWithRoute:", 0);
}

- (void)_captureCurrentNavigationState
{
  void *v3;
  uint64_t v4;
  void *v5;
  GEOComposedRoute *route;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  if (objc_msgSend(v3, "isInNavigatingState")
    && (v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "route"))) != 0)
  {
    v5 = (void *)v4;
    route = self->_route;
    if (!route || route != (GEOComposedRoute *)v4)
    {
      v7 = sub_100B782E8();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "navDisplayName"));
        v13 = 138412290;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will capture current navigation state (route:%@)", (uint8_t *)&v13, 0xCu);

      }
      -[ChromeNavigationDisplay _setRoute:](self, "_setRoute:", v5);
    }
  }
  else
  {
    v11 = sub_100B782E8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Will reset navigation state, not navigating", (uint8_t *)&v13, 2u);
    }

    -[ChromeNavigationDisplay _setRoute:](self, "_setRoute:", 0);
    v5 = 0;
  }
  self->_hasArrived = objc_msgSend(v3, "state") == (id)6;

}

- (void)_setRoute:(id)a3
{
  GEOComposedRoute *v4;
  GEOComposedRoute *v5;
  void *v6;
  id v7;
  NSObject *v8;
  GEOComposedRoute **p_route;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;

  v4 = (GEOComposedRoute *)a3;
  v5 = v4;
  if (v4)
  {
    if (-[GEOComposedRoute transportType](v4, "transportType"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay carChromeViewController](self, "carChromeViewController"));

      if (v6)
      {
        v7 = sub_100B782E8();
        v8 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v14) = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Trying to display a non-driving route in ChromeNavigationDisplay while in CarPlay, ignoring it", (uint8_t *)&v14, 2u);
        }

        v5 = 0;
      }
    }
  }
  p_route = &self->_route;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, v5);
    v10 = sub_100B782E8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](*p_route, "uniqueRouteID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "UUIDString"));
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Got a new route: %@", (uint8_t *)&v14, 0xCu);

    }
    if (*p_route)
    {
      -[ChromeNavigationDisplay _updateWithRouteGeniusEntry:](self, "_updateWithRouteGeniusEntry:", 0);
      -[ChromeNavigationDisplay _updateForCurrentRoute](self, "_updateForCurrentRoute");
    }
    else
    {
      -[ChromeNavigationDisplay _clearAnnotations](self, "_clearAnnotations");
    }
  }

}

- (void)_updateForCurrentRoute
{
  id v3;
  NSObject *v4;
  const char *v5;
  GEOComposedRoute *route;
  id v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;

  if (-[ChromeNavigationDisplay isSuppressed](self, "isSuppressed"))
  {
    v3 = sub_100B782E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      v5 = "Will not update route, currently suppressed";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v11, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  route = self->_route;
  v7 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v7);
  v8 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!route)
  {
    if (v8)
    {
      LOWORD(v11) = 0;
      v5 = "Will not update for current route, there is no route";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute uniqueRouteID](self->_route, "uniqueRouteID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "UUIDString"));
    v11 = 138412290;
    v12 = v10;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Updating for the current route: %@", (uint8_t *)&v11, 0xCu);

  }
  -[ChromeNavigationDisplay _updateDirectionsAnnotationManagerDisplayedRoutes](self, "_updateDirectionsAnnotationManagerDisplayedRoutes");
}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  int64_t v9;
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
  char v21;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "updateNavConfigurationWithCurrentRoute:incidentAlert:", self->_route, self->_trafficAlert);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay mapView](self, "mapView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_mapLayer"));
  v7 = objc_msgSend(v6, "carDisplayType") != (id)2;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
  if (objc_msgSend(v8, "cameraStyle") != (id)2 && !self->_trafficAlert)
    v7 = 0;
  objc_msgSend(v4, "setAlternateRoutesEnabled:", v7);

  v9 = -[ChromeNavigationDisplayConfiguration cameraStyle](self->_configuration, "cameraStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay trafficAlert](self, "trafficAlert"));
  objc_msgSend(v4, "setRouteMarkerOptions:", -[ChromeNavigationDisplay _routeMarkerOptionsForCameraStyle:incidentAlert:](self, "_routeMarkerOptionsForCameraStyle:incidentAlert:", v9, v10));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "arrivalInfo"));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "isInArrivalState"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "destination"));
    v15 = 2;
  }
  else
  {
    v16 = -[GEOComposedRoute legIndexForStepIndex:](self->_route, "legIndexForStepIndex:", objc_msgSend(v11, "stepIndex"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self->_route, "legs"));
    if (v16 >= objc_msgSend(v17, "count"))
    {
      v19 = 0;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute legs](self->_route, "legs"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v16));

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "destination"));
    v15 = v14 != 0;

  }
  objc_msgSend(v4, "setCurrentNavigationWaypoint:", v14);
  objc_msgSend(v4, "setProximityToCurrentNavigationWaypoint:", v15);
  if (self->_route)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
    v21 = objc_opt_respondsToSelector(v20, "chromeNavigationDisplayDidRenderRoute:");

    if ((v21 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
      objc_msgSend(v22, "chromeNavigationDisplayDidRenderRoute:", self);

    }
  }

  return 1;
}

- (void)_updateDirectionsAnnotationManagerDisplayedRoutes
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  objc_msgSend(v2, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)_clearAnnotations
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Clearing annotations", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "searchPinsManager"));
  objc_msgSend(v6, "clearDirectionsPins");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  objc_msgSend(v7, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (void)_updateWithMatchedLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeAnnotationsController"));
  objc_msgSend(v6, "updateMatchedLocation:", v4);

  -[NavigationDisplay updateWithLocation:](self->_navigationDisplay, "updateWithLocation:", v4);
  -[ChromeNavigationDisplay updateDisplayRate](self, "updateDisplayRate");
}

- (void)setTrafficAlert:(id)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNTrafficIncidentAlert alertID](self->_trafficAlert, "alertID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "alertID"));
  v7 = v5;
  v8 = v6;
  if (v7 | v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_trafficAlert, a3);
      -[ChromeNavigationDisplayRateThrottle setTemporaryDisplayRate:forDuration:](self->_throttle, "setTemporaryDisplayRate:forDuration:", -1, -1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay cameraController](self, "cameraController"));
      objc_msgSend(v11, "setTrafficIncidentAlert:", v12);

      -[ChromeNavigationDisplay _updateDirectionsAnnotationManagerDisplayedRoutes](self, "_updateDirectionsAnnotationManagerDisplayedRoutes");
    }
  }

}

- (void)_ioHIDRepeatCurrentGuidance:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "IOHID has requested repeat current guidance", v6, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v5, "repeatCurrentGuidance:", 0);

}

- (NavCameraController)cameraController
{
  return -[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController");
}

- (void)zoomIn
{
  id v3;
  NSObject *v4;
  void *v5;
  char *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will zoom in", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
  v6 = (char *)objc_msgSend(v5, "cameraStyle");

  if ((unint64_t)(v6 - 1) <= 3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));
    objc_msgSend(v7, "_zoomIn");

  }
}

- (void)zoomOut
{
  id v3;
  NSObject *v4;
  void *v5;
  char *v6;
  void *v7;
  uint8_t v8[16];

  v3 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will zoom out", v8, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
  v6 = (char *)objc_msgSend(v5, "cameraStyle");

  if ((unint64_t)(v6 - 1) <= 3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));
    objc_msgSend(v7, "_zoomOut");

  }
}

- (void)setSuppressed:(BOOL)a3
{
  -[ChromeNavigationDisplay setSuppressed:animated:](self, "setSuppressed:animated:", a3, 0);
}

- (void)setSuppressed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  _BOOL4 isRunning;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  ChromeNavigationDisplayConfiguration *lastAppliedConfiguration;
  void *v12;
  int v13;
  void *v14;

  if (self->_suppressed == a3)
    return;
  v4 = a4;
  v5 = a3;
  self->_suppressed = a3;
  isRunning = self->_isRunning;
  v8 = sub_100B782E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (!isRunning)
  {
    if (v10)
    {
      LOWORD(v13) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Not navigating, will not pause", (uint8_t *)&v13, 2u);
    }
    goto LABEL_15;
  }
  if (!v5)
  {
    if (v10)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will unsuppress navigation display and unpause camera display by refreshing current configuration (configuration:%@)", (uint8_t *)&v13, 0xCu);

    }
    if (self->_route)
      -[ChromeNavigationDisplay _updateForCurrentRoute](self, "_updateForCurrentRoute");
    else
      -[ChromeNavigationDisplay _clearAnnotations](self, "_clearAnnotations");
    -[ChromeNavigationDisplay _prepareNavigationDisplay](self, "_prepareNavigationDisplay");
    v9 = objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
    -[ChromeNavigationDisplay _setConfiguration:animated:](self, "_setConfiguration:animated:", v9, v4);
LABEL_15:

    return;
  }
  if (v10)
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Will suppress navigation display and pause camera", (uint8_t *)&v13, 2u);
  }

  lastAppliedConfiguration = self->_lastAppliedConfiguration;
  self->_lastAppliedConfiguration = 0;

  -[ChromeNavigationDisplay updateDisplayRate](self, "updateDisplayRate");
  -[ChromeNavigationDisplay _pauseNavigationCameraMotion](self, "_pauseNavigationCameraMotion");
}

- (void)stopRunningNavigationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 isRunning;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  __CFString *v15;

  v3 = a3;
  isRunning = self->_isRunning;
  v6 = sub_100B782E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (isRunning)
  {
    if (v8)
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v10 = v9;
      v14 = 138412290;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will stop running navigation (animated:%@)", (uint8_t *)&v14, 0xCu);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v11, "unregisterObserver:", self);

    -[ChromeNavigationDisplay _setRoute:](self, "_setRoute:", 0);
    -[ChromeNavigationDisplay _cleanupNavigationDisplay](self, "_cleanupNavigationDisplay");
    self->_isRunning = 0;
  }
  else
  {
    if (v8)
    {
      v12 = CFSTR("NO");
      if (v3)
        v12 = CFSTR("YES");
      v13 = v12;
      v14 = 138412290;
      v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will not stop running navigation, not running (animated:%@)", (uint8_t *)&v14, 0xCu);

    }
  }
}

- (void)startRunningNavigationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 isRunning;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  int v12;
  __CFString *v13;

  v3 = a3;
  isRunning = self->_isRunning;
  v6 = sub_100B782E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (isRunning)
  {
    if (v8)
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will not start running navigation, already running", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    if (v8)
    {
      v9 = CFSTR("NO");
      if (v3)
        v9 = CFSTR("YES");
      v10 = v9;
      v12 = 138412290;
      v13 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Will start running navigation (animated:%@)", (uint8_t *)&v12, 0xCu);

    }
    self->_isRunning = 1;
    -[ChromeNavigationDisplay _captureCurrentNavigationState](self, "_captureCurrentNavigationState");
    self->_currentStepIndex = 0x7FFFFFFFFFFFFFFFLL;
    -[ChromeNavigationDisplay _prepareNavigationDisplay](self, "_prepareNavigationDisplay");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
    -[ChromeNavigationDisplay _setConfiguration:animated:](self, "_setConfiguration:animated:", v11, v3);

    v7 = objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    -[NSObject registerObserver:](v7, "registerObserver:", self);
  }

}

- (void)_cleanupNavigationDisplay
{
  ChromeNavigationDisplayRateThrottle *throttle;
  ChromeNavigationDisplayConfiguration *lastAppliedConfiguration;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 mapClearsUserLocationOnReset;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NavigationDisplay *navigationDisplay;

  -[ChromeNavigationDisplay _applyHorizontalCameraOffset:animated:](self, "_applyHorizontalCameraOffset:animated:", 0, 0);
  -[ChromeNavigationDisplay _stopNavigationCameraMotion](self, "_stopNavigationCameraMotion");
  -[ChromeNavigationDisplayRateThrottle setDelegate:](self->_throttle, "setDelegate:", 0);
  -[ChromeNavigationDisplayRateThrottle setMapView:](self->_throttle, "setMapView:", 0);
  throttle = self->_throttle;
  self->_throttle = 0;

  lastAppliedConfiguration = self->_lastAppliedConfiguration;
  self->_lastAppliedConfiguration = 0;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay mapView](self, "mapView"));
  objc_msgSend(v5, "setShowsTraffic:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_mapLayer"));
  objc_msgSend(v7, "setFocusedLabelsPolyline:", 0);

  mapClearsUserLocationOnReset = self->_mapClearsUserLocationOnReset;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));
  objc_msgSend(v9, "_setClearUserLocationOnLocationReset:", mapClearsUserLocationOnReset);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));
  objc_msgSend(v10, "_setShouldSplitRouteLine:", 0);

  -[NavigationDisplay clearAllAnnotations](self->_navigationDisplay, "clearAllAnnotations");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
  objc_msgSend(v11, "resetMapViewNavigationState");

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay userLocationAnnotationView](self->_navigationDisplay, "userLocationAnnotationView"));
  objc_msgSend(v12, "setInNavMode:animated:", 0, 0);

  -[NavigationDisplay setUserLocationAnnotationView:](self->_navigationDisplay, "setUserLocationAnnotationView:", 0);
  -[NavigationDisplay setChromeViewController:](self->_navigationDisplay, "setChromeViewController:", 0);
  -[NavigationDisplay setDelegate:](self->_navigationDisplay, "setDelegate:", 0);
  navigationDisplay = self->_navigationDisplay;
  self->_navigationDisplay = 0;

}

- (void)_prepareNavigationDisplay
{
  id v3;
  NSObject *v4;
  NavigationDisplay *v5;
  NavigationDisplay *navigationDisplay;
  void *v7;
  ChromeNavigationDisplayRateThrottle *v8;
  ChromeNavigationDisplayRateThrottle *throttle;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NavigationDisplay *v19;
  NavigationDisplay *v20;
  id v21;
  NavigationDisplay *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  _BYTE v27[23];
  uint8_t buf[16];

  if (-[ChromeNavigationDisplay isSuppressed](self, "isSuppressed"))
  {
    v3 = sub_100B782E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Will not prepare navigation display, currently paused", buf, 2u);
    }
  }
  else
  {
    if (!self->_navigationDisplay)
    {
      v5 = objc_alloc_init(NavigationDisplay);
      navigationDisplay = self->_navigationDisplay;
      self->_navigationDisplay = v5;

      -[NavigationDisplay setDelegate:](self->_navigationDisplay, "setDelegate:", self);
    }
    v4 = objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay carChromeViewController](self, "carChromeViewController"));
    if (v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
      objc_msgSend(v7, "setIncidentsDisabled:", -[NSObject sceneType](v4, "sceneType") == (id)2);

    }
    if (!self->_throttle
      && +[ChromeNavigationDisplayRateThrottle isAvailable](ChromeNavigationDisplayRateThrottle, "isAvailable"))
    {
      v8 = objc_alloc_init(ChromeNavigationDisplayRateThrottle);
      throttle = self->_throttle;
      self->_throttle = v8;

      -[ChromeNavigationDisplayRateThrottle setDelegate:](self->_throttle, "setDelegate:", self);
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay mapView](self, "mapView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));

    if (v10 != v11)
      self->_mapClearsUserLocationOnReset = objc_msgSend(v10, "_clearUserLocationOnLocationReset");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
    -[NavigationDisplay setChromeViewController:](self->_navigationDisplay, "setChromeViewController:", v12);

    -[ChromeNavigationDisplayRateThrottle setMapView:](self->_throttle, "setMapView:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v14 = objc_msgSend(v13, "isInNavigatingState");

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "route"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "destination"));

      -[NavigationDisplay setDestinationWaypoint:](self->_navigationDisplay, "setDestinationWaypoint:", v17);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay carChromeViewController](self, "carChromeViewController"));

    v19 = self->_navigationDisplay;
    if (v18)
    {
      -[NavigationDisplay setSky:](v19, "setSky:", 2);
      objc_msgSend(v10, "_setCanSelectPOIs:", 0);
      objc_msgSend(v10, "setShowsTraffic:", 0);
      v20 = self->_navigationDisplay;
      v21 = 0;
    }
    else
    {
      -[NavigationDisplay setSky:](v19, "setSky:", 0);
      v22 = self->_navigationDisplay;
      v21 = -[GEOComposedRoute transportType](self->_route, "transportType");
      v20 = v22;
    }
    -[NavigationDisplay setTransportType:](v20, "setTransportType:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userLocationView"));
    -[NavigationDisplay setUserLocationAnnotationView:](self->_navigationDisplay, "setUserLocationAnnotationView:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay userLocationAnnotationView](self->_navigationDisplay, "userLocationAnnotationView"));
    objc_msgSend(v25, "setInNavMode:animated:", 1, 0);

    *(_OWORD *)v27 = *(_OWORD *)((char *)VKAnnotationTrackingBehaviorDefault + 1);
    *(_QWORD *)&v27[15] = VKAnnotationTrackingBehaviorDefault[2];
    v26 = 0;
    objc_msgSend(v10, "_setUserTrackingBehavior:", &v26);
    objc_msgSend(v10, "_setClearUserLocationOnLocationReset:", 0);
    objc_msgSend(v10, "_setShouldSplitRouteLine:", 1);

  }
}

- (void)recenterCameraAnimated:(BOOL)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;

  -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 0, a3);
  v4 = sub_10043157C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay mapView](self, "mapView"));
    v8 = 136315394;
    v9 = "-[ChromeNavigationDisplay recenterCameraAnimated:]";
    v10 = 2114;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s, navigationCameraReturnToPuck! on mapView: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay mapView](self, "mapView"));
  objc_msgSend(v7, "navigationCameraReturnToPuck");

}

- (void)_applyHorizontalCameraOffset:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  id *v9;
  double v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  double v19;

  v4 = a4;
  v5 = a3;
  v7 = 0.0;
  if (a3 && self->_navigationDisplay)
  {
    -[ChromeNavigationDisplay _horizontalCameraOffset](self, "_horizontalCameraOffset");
    v7 = v8;
  }
  if (self->_currentCameraOffset != v7)
  {
    self->_currentCameraOffset = v7;
    v9 = (id *)&kCAMediaTimingFunctionEaseInEaseOut;
    if (v4)
      v10 = 2.5;
    else
      v10 = 0.0;
    if (!v5)
      v9 = (id *)&kCAMediaTimingFunctionDefault;
    v11 = *v9;
    v12 = sub_100B782E8();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 134217984;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will set camera offset (offset:%lf)", (uint8_t *)&v18, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapView"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_mapLayer"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v11));

    objc_msgSend(v16, "setCameraHorizontalOffset:duration:timingFunction:", v17, v7, v10);
  }
}

- (double)_horizontalCameraOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double MidX;
  CGRect v26;
  CGRect v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "layoutIfNeeded");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  objc_msgSend(v5, "unobscuredMapContentBoundsInContainingView");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "mapView"));
  objc_msgSend(v15, "frame");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  MidX = CGRectGetMidX(v26);
  v27.origin.x = v17;
  v27.origin.y = v19;
  v27.size.width = v21;
  v27.size.height = v23;
  return MidX - CGRectGetMidX(v27);
}

- (void)mapInsetsDidChangeAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
  -[ChromeNavigationDisplay _applyHorizontalCameraOffset:animated:](self, "_applyHorizontalCameraOffset:animated:", ((unint64_t)objc_msgSend(v5, "cameraStyle") & 0xFFFFFFFFFFFFFFFDLL) != 0, v3);

}

- (void)_startNavigationCameraMotionAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  int v27;
  __CFString *v28;
  __int16 v29;
  __CFString *v30;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cameraPaused"));
  v7 = objc_msgSend(v6, "BOOLValue");

  if (v7)
  {
    v8 = sub_100B782E8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cameraPaused"));
      if (objc_msgSend(v11, "BOOLValue"))
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      v13 = v12;
      if (v3)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v15 = v14;
      v27 = 138412546;
      v28 = v13;
      v29 = 2112;
      v30 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will not start navigation camera (cameraPaused:%@, animated:%@)", (uint8_t *)&v27, 0x16u);

    }
  }
  else
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
    v17 = objc_msgSend(v16, "cameraStyle");

    if (+[ChromeNavigationDisplayConfiguration _cameraStyleRequiresCameraMotion:](ChromeNavigationDisplayConfiguration, "_cameraStyleRequiresCameraMotion:", v17))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self->_navigationDisplay, "mapView"));
      objc_msgSend(v18, "setUserTrackingMode:", 0);

      v19 = sub_100B782E8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = CFSTR("NO");
        if (v3)
          v21 = CFSTR("YES");
        v22 = v21;
        v27 = 138412290;
        v28 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Will start navigation camera (animated:%@)", (uint8_t *)&v27, 0xCu);

      }
      -[ChromeNavigationDisplay setCameraPanning:](self, "setCameraPanning:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
      -[ChromeNavigationDisplay _applyHorizontalCameraOffset:animated:](self, "_applyHorizontalCameraOffset:animated:", ((unint64_t)objc_msgSend(v23, "cameraStyle") & 0xFFFFFFFFFFFFFFFDLL) != 0, v3);

      -[ChromeNavigationDisplay updateDisplayRate](self, "updateDisplayRate");
      -[NavigationDisplay startMotion:](self->_navigationDisplay, "startMotion:", v3);
    }
    else
    {
      v24 = sub_100B782E8();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
        v27 = 138412290;
        v28 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Will not start navigation camera (cameraStyle:%@)", (uint8_t *)&v27, 0xCu);

      }
    }
  }
}

- (void)_pauseNavigationCameraMotion
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will pause navigation camera", v5, 2u);
  }

  -[NavigationDisplay pauseCameraMotion](self->_navigationDisplay, "pauseCameraMotion");
}

- (void)_stopNavigationCameraMotion
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_100B782E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Will stop navigation camera", v5, 2u);
  }

  -[NavigationDisplay stopCameraMotion](self->_navigationDisplay, "stopCameraMotion");
}

- (void)setCameraPanning:(BOOL)a3
{
  -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", a3, 0);
}

- (void)setCameraPanning:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  char v9;
  id v10;

  if (self->_cameraPanning != a3)
  {
    v4 = a4;
    v5 = a3;
    self->_cameraPanning = a3;
    if (!a3)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
      objc_msgSend(v7, "clearMapGesturesAndAnimations");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "chromeNavigationDisplay:didChangePanning:animated:");

    if ((v9 & 1) != 0)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
      objc_msgSend(v10, "chromeNavigationDisplay:didChangePanning:animated:", self, v5, v4);

    }
  }
}

- (void)_transitionToCameraStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  int64_t v12;
  unint64_t currentCameraMode;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  BOOL v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  __CFString *v25;

  v4 = a4;
  v7 = sub_100B782E8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4)
      v9 = CFSTR(".Unknown");
    else
      v9 = *(&off_1011E7258 + a3);
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    v11 = v10;
    *(_DWORD *)buf = 138412546;
    v23 = v9;
    v24 = 2112;
    v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Will configure camera style %@ (animated:%@)", buf, 0x16u);

  }
  if (-[ChromeNavigationDisplay isCameraPanning](self, "isCameraPanning"))
    -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 0, v4);
  v12 = -[ChromeNavigationDisplayConfiguration cameraStyle](self->_lastAppliedConfiguration, "cameraStyle");
  switch(a3)
  {
    case 0:
      return;
    case 1:
      currentCameraMode = 0;
      self->_currentCameraMode = 0;
      break;
    case 2:
      currentCameraMode = 1;
      goto LABEL_16;
    case 3:
      currentCameraMode = 2;
      goto LABEL_16;
    case 4:
      currentCameraMode = 3;
LABEL_16:
      self->_currentCameraMode = currentCameraMode;
      break;
    default:
      currentCameraMode = self->_currentCameraMode;
      break;
  }
  -[NavigationDisplay setNavigationCameraMode:](self->_navigationDisplay, "setNavigationCameraMode:", currentCameraMode);
  -[ChromeNavigationDisplay _startNavigationCameraMotionAnimated:](self, "_startNavigationCameraMotionAnimated:", v4);
  if (v12 != a3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
    objc_msgSend(v14, "setNeedsUpdateMapInsets");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay mapView](self, "mapView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "_mapLayer"));
    v17 = objc_msgSend(v16, "carDisplayType") != (id)2;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "routeAnnotationsController"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100B7A1FC;
    v20[3] = &unk_1011E7218;
    v20[4] = self;
    v20[5] = a3;
    v21 = v17;
    objc_msgSend(v19, "updateConfigurationWithBlock:", v20);

  }
}

- (unint64_t)_routeMarkerOptionsForCameraStyle:(int64_t)a3 incidentAlert:(id)a4
{
  if (!a3)
    return 0;
  if (a3 != 4 && a3 != 1)
    return 3;
  if (a4)
    return 3;
  return 0;
}

- (void)updateDisplayRate
{
  void *v3;
  unsigned __int8 v4;
  _BOOL4 v5;
  void *v6;
  ChromeNavigationDisplayRateThrottle *v7;
  int64_t v8;
  void *v9;
  ChromeNavigationDisplayRateThrottle *throttle;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  char v23;

  if (self->_throttle)
  {
    if (-[ChromeNavigationDisplay isSuppressed](self, "isSuppressed")
      || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController")),
          v4 = objc_msgSend(v3, "isThrottlingMapViewFrameRate"),
          v3,
          (v4 & 1) != 0))
    {
      v5 = 0;
    }
    else
    {
      throttle = self->_throttle;
      if (throttle && (-[ChromeNavigationDisplayRateThrottle settings](throttle, "settings"), v23))
      {
        v5 = 1;
      }
      else
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay configuration](self, "configuration"));
        v5 = objc_msgSend(v13, "cameraStyle") == (id)2;

      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay carChromeViewController](self, "carChromeViewController"));

    if (v6 && v5)
    {
      v7 = self->_throttle;
      if (v7)
      {
        -[ChromeNavigationDisplayRateThrottle settings](v7, "settings");
        if (BYTE1(v22))
          goto LABEL_11;
      }
      else
      {
        v22 = 0;
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v16 = 0u;
        v17 = 0u;
        v14 = 0u;
        v15 = 0u;
      }
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance", v14, v15, v16, v17, v18, v19, v20, v21, v22));
      v12 = objc_msgSend(v11, "connectionType");

      if (v12 != (id)2)
        goto LABEL_17;
    }
    else if (!v5)
    {
LABEL_17:
      -[ChromeNavigationDisplayRateThrottle setEnabled:](self->_throttle, "setEnabled:", 0);
      return;
    }
LABEL_11:
    -[ChromeNavigationDisplayRateThrottle setEnabled:](self->_throttle, "setEnabled:", 1);
    v8 = -[ChromeNavigationDisplayRateThrottle calculateThrottledDisplayRate](self->_throttle, "calculateThrottledDisplayRate");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
    objc_msgSend(v9, "setDesiredDisplayRate:", v8);

  }
}

- (void)setTemporaryDisplayRate:(int64_t)a3 forDuration:(double)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a3 == -1)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay carChromeViewController](self, "carChromeViewController"));
    if (v6)
    {
      v7 = (void *)v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
      v9 = objc_msgSend(v8, "connectionType");

      if (v9 == (id)2)
        a3 = 12;
      else
        a3 = 15;
    }
    else
    {
      a3 = 15;
    }
  }
  -[ChromeNavigationDisplayRateThrottle setTemporaryDisplayRate:forDuration:](self->_throttle, "setTemporaryDisplayRate:forDuration:", a3, a4);
}

- (void)throttle:(id)a3 calculatedNewDisplayRate:(int64_t)a4
{
  void *v6;
  unsigned __int8 v7;
  id v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController", a3));
  v7 = objc_msgSend(v6, "isThrottlingMapViewFrameRate");

  if ((v7 & 1) == 0)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[NavigationDisplay cameraController](self->_navigationDisplay, "cameraController"));
    objc_msgSend(v8, "setDesiredDisplayRate:", a4);

  }
}

- (void)navigationDisplay:(id)a3 didChangeUserTrackingMode:(int64_t)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate", a3));
  objc_msgSend(v5, "setTrackingMode:monitorBatteryState:", a4, 0);

}

- (void)mapView:(id)a3 willStartRespondingToGesture:(int64_t)a4 animated:(BOOL)a5
{
  id v6;

  if (!a4)
  {
    v6 = a3;
    -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 1, 1);
    -[ChromeNavigationDisplay mapViewNavigationCameraHasStartedPanning:](self, "mapViewNavigationCameraHasStartedPanning:", v6);

  }
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 1, 1);
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 0, 1);
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  void *v7;
  char v8;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "chromeNavigationDisplay:userDidTapMap:atPoint:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay delegate](self, "delegate"));
    objc_msgSend(v9, "chromeNavigationDisplay:userDidTapMap:atPoint:", self, v10, x, y);

  }
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, a3))
    -[ChromeNavigationDisplay setCameraPanning:animated:](self, "setCameraPanning:animated:", 0, 0);
}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if ((MNNavigationServiceStateChangedToNavigating(a4, a5, a3) & 1) != 0
    || MNNavigationServiceStateChangedFromNavigatingToStopped(a4, a5))
  {
    -[ChromeNavigationDisplay _captureCurrentNavigationState](self, "_captureCurrentNavigationState");
  }
  else if (a5 != a4 && (a5 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    -[ChromeNavigationDisplay _updateDirectionsAnnotationManagerDisplayedRoutes](self, "_updateDirectionsAnnotationManagerDisplayedRoutes");
  }
}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
  v9 = objc_opt_respondsToSelector(v8, "mapView:shouldSelectLabelMarker:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
    v11 = objc_msgSend(v10, "mapView:shouldSelectLabelMarker:", v6, v7);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  ChromeNavigationDisplayRateThrottle *throttle;
  id v7;

  throttle = self->_throttle;
  v7 = a4;
  -[ChromeNavigationDisplayRateThrottle setTemporaryDisplayRate:forDuration:](throttle, "setTemporaryDisplayRate:forDuration:", -1, -1.0);
  -[ChromeNavigationDisplay _setRoute:](self, "_setRoute:", v7);

}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  -[ChromeNavigationDisplay _setRoute:](self, "_setRoute:", a5, *(_QWORD *)&a4);
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  -[ChromeNavigationDisplay _updateWithMatchedLocation:](self, "_updateWithMatchedLocation:", a4);
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  id v7;
  id v8;

  v7 = a3;
  -[ChromeNavigationDisplay _updateDirectionsAnnotationManagerDisplayedRoutes](self, "_updateDirectionsAnnotationManagerDisplayedRoutes");
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "route"));

  self->_hasArrived = objc_msgSend(v8, "isLegIndexOfLastLeg:", a5);
}

- (void)navigationService:(id)a3 didReceiveTrafficIncidentAlert:(id)a4 responseCallback:(id)a5
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a4;
  v6 = sub_100B782E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertTitles"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v10 = 138412290;
    v11 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(alert:%@)", (uint8_t *)&v10, 0xCu);

  }
}

- (void)navigationService:(id)a3 didUpdateTrafficIncidentAlert:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a4;
  v5 = sub_100B782E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(alert:%@)", (uint8_t *)&v9, 0xCu);

  }
}

- (void)navigationService:(id)a3 didInvalidateTrafficIncidentAlert:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v4 = a4;
  v5 = sub_100B782E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alertTitles"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(alert:%@)", (uint8_t *)&v9, 0xCu);

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
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ChromeNavigationDisplay chromeViewController](self, "chromeViewController"));
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

- (ChromeNavigationDisplayConfiguration)configuration
{
  return self->_configuration;
}

- (ChromeNavigationDisplayDelegate)delegate
{
  return (ChromeNavigationDisplayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isSuppressed
{
  return self->_suppressed;
}

- (BOOL)isCameraPanning
{
  return self->_cameraPanning;
}

- (MNTrafficIncidentAlert)trafficAlert
{
  return self->_trafficAlert;
}

- (unint64_t)currentCameraMode
{
  return self->_currentCameraMode;
}

- (void)setCurrentCameraMode:(unint64_t)a3
{
  self->_currentCameraMode = a3;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void)setChromeViewController:(id)a3
{
  objc_storeWeak((id *)&self->_chromeViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_trafficAlert, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastAppliedConfiguration, 0);
  objc_storeStrong((id *)&self->_throttle, 0);
  objc_storeStrong((id *)&self->_navigationDisplay, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
