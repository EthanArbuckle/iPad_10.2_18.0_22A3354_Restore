@implementation NavigationDisplay

- (NavigationDisplay)init
{
  NavigationDisplay *v2;
  NavCameraController *v3;
  NavCameraController *cameraController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NavigationDisplay;
  v2 = -[NavigationDisplay init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(NavCameraController);
    cameraController = v2->_cameraController;
    v2->_cameraController = v3;

    v2->_transportType = 4;
    v2->_showsRoadLabel = 1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[NavigationDisplay _stopObservingChromeIfNeeded](self, "_stopObservingChromeIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)NavigationDisplay;
  -[NavigationDisplay dealloc](&v3, "dealloc");
}

- (void)_updateSky
{
  unint64_t sky;
  double v3;
  id v4;

  sky = self->_sky;
  v3 = 0.0;
  if (sky <= 2)
    v3 = dbl_100E37550[sky];
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v4, "setCanonicalSkyHeight:", v3);

}

- (void)setSky:(int64_t)a3
{
  if (self->_sky != a3)
  {
    self->_sky = a3;
    -[NavigationDisplay _updateSky](self, "_updateSky");
  }
}

- (void)setChromeViewController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NavigationDisplay _stopObservingChromeIfNeeded](self, "_stopObservingChromeIfNeeded");
  objc_storeWeak((id *)&self->_chromeViewController, v4);
  -[NavigationDisplay _startObservingChromeIfNeeded](self, "_startObservingChromeIfNeeded");
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapView"));

  -[NavigationDisplay setMapView:](self, "setMapView:", v5);
}

- (void)setMapView:(id)a3
{
  MKMapView *v5;
  id *p_mapView;
  MKMapView *mapView;
  _BOOL4 scaleEnabled;
  _BOOL4 rotateEnabled;
  _BOOL4 panWithMomentum;
  _BOOL4 locationPropagationEnabled;
  _BOOL4 compassEnabled;
  _BOOL8 canSelectPOIs;
  MKMapView *v14;
  BOOL *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned __int8 v20;
  unsigned __int8 v21;
  unsigned __int8 v22;
  id v23;
  unsigned __int8 v24;
  char v25;
  BOOL v26;
  int transportType;
  void *v28;
  _BOOL8 v29;
  id v30;
  NavigationDebugAnnotationsProvider *v31;
  NavigationDebugAnnotationsProvider *debugAnnotationsProvider;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  MapViewResponder *v39;
  MapViewResponder *mapViewResponder;
  uint64_t v41;
  int64_t userTrackingMode;
  unsigned __int8 v43;
  _BOOL4 zoomEnabled;
  MKMapView *v45;

  v5 = (MKMapView *)a3;
  p_mapView = (id *)&self->_mapView;
  if (self->_mapView != v5)
  {
    v45 = v5;
    -[NavigationDisplay clearAllAnnotations](self, "clearAllAnnotations");
    mapView = self->_mapView;
    if (mapView)
    {
      zoomEnabled = self->_mapViewFlagsToRestore.zoomEnabled;
      userTrackingMode = self->_mapViewFlagsToRestore.userTrackingMode;
      LODWORD(v41) = self->_mapViewFlagsToRestore.shouldAnimatePositionWithRouteMatch;
      HIDWORD(v41) = self->_mapViewFlagsToRestore.showsUserLocation;
      scaleEnabled = self->_mapViewFlagsToRestore.scaleEnabled;
      rotateEnabled = self->_mapViewFlagsToRestore.rotateEnabled;
      panWithMomentum = self->_mapViewFlagsToRestore.panWithMomentum;
      locationPropagationEnabled = self->_mapViewFlagsToRestore.locationPropagationEnabled;
      compassEnabled = self->_mapViewFlagsToRestore.compassEnabled;
      canSelectPOIs = self->_mapViewFlagsToRestore.canSelectPOIs;
      v14 = mapView;
      -[MKMapView _setCanSelectPOIs:](v14, "_setCanSelectPOIs:", canSelectPOIs);
      -[MKMapView setCompassEnabled:](v14, "setCompassEnabled:", compassEnabled);
      -[MKMapView _setLocationPropagationEnabled:](v14, "_setLocationPropagationEnabled:", locationPropagationEnabled);
      -[MKMapView _setPanWithMomentum:](v14, "_setPanWithMomentum:", panWithMomentum);
      -[MKMapView setRotateEnabled:](v14, "setRotateEnabled:", rotateEnabled);
      -[MKMapView setScaleEnabled:](v14, "setScaleEnabled:", scaleEnabled);
      -[MKMapView _setShouldAnimatePositionWithRouteMatch:](v14, "_setShouldAnimatePositionWithRouteMatch:", (_DWORD)v41 != 0);
      -[MKMapView setShowsUserLocation:](v14, "setShowsUserLocation:", HIDWORD(v41) != 0);
      -[MKMapView setUserTrackingMode:](v14, "setUserTrackingMode:", userTrackingMode);
      -[MKMapView setZoomEnabled:](v14, "setZoomEnabled:", zoomEnabled);

    }
    v15 = &self->_mapViewFlagsToRestore.zoomEnabled + 1;
    objc_storeStrong((id *)&self->_mapView, a3);
    v16 = *p_mapView;
    if (*p_mapView)
    {
      v17 = v16;
      v43 = objc_msgSend(v17, "_canSelectPOIs");
      HIDWORD(v41) = objc_msgSend(v17, "isCompassEnabled");
      LODWORD(v41) = objc_msgSend(v17, "_isLocationPropagationEnabled");
      v18 = objc_msgSend(v17, "_panWithMomentum");
      v19 = objc_msgSend(v17, "isRotateEnabled");
      v20 = objc_msgSend(v17, "isScaleEnabled");
      v21 = objc_msgSend(v17, "_shouldAnimatePositionWithRouteMatch");
      v22 = objc_msgSend(v17, "showsUserLocation");
      v23 = objc_msgSend(v17, "userTrackingMode");
      v24 = objc_msgSend(v17, "isZoomEnabled");

      v26 = v41;
      v25 = BYTE4(v41);
      LOBYTE(v16) = v43;
      v15 = &self->_mapViewFlagsToRestore.zoomEnabled + 1;
    }
    else
    {
      v24 = 0;
      v23 = 0;
      v22 = 0;
      v21 = 0;
      v20 = 0;
      v19 = 0;
      v18 = 0;
      v26 = 0;
      v25 = 0;
    }
    self->_mapViewFlagsToRestore.canSelectPOIs = (char)v16;
    self->_mapViewFlagsToRestore.compassEnabled = v25;
    self->_mapViewFlagsToRestore.locationPropagationEnabled = v26;
    self->_mapViewFlagsToRestore.panWithMomentum = v18;
    self->_mapViewFlagsToRestore.rotateEnabled = v19;
    self->_mapViewFlagsToRestore.scaleEnabled = v20;
    self->_mapViewFlagsToRestore.shouldAnimatePositionWithRouteMatch = v21;
    self->_mapViewFlagsToRestore.showsUserLocation = v22;
    self->_mapViewFlagsToRestore.userTrackingMode = (int64_t)v23;
    self->_mapViewFlagsToRestore.zoomEnabled = v24;
    *(_DWORD *)v15 = 0;
    *(_DWORD *)(v15 + 3) = 0;
    transportType = self->_transportType;
    if (v45)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView traitCollection](v45, "traitCollection"));
      v29 = objc_msgSend(v28, "userInterfaceIdiom") != (id)3;

    }
    else
    {
      v29 = 1;
    }
    if (*p_mapView)
    {
      v30 = *p_mapView;
      objc_msgSend(v30, "_setCanSelectPOIs:", 1);
      objc_msgSend(v30, "setCompassEnabled:", 0);
      objc_msgSend(v30, "_setLocationPropagationEnabled:", 0);
      objc_msgSend(v30, "_setPanWithMomentum:", 1);
      objc_msgSend(v30, "setRotateEnabled:", 1);
      objc_msgSend(v30, "setScaleEnabled:", 0);
      objc_msgSend(v30, "_setShouldAnimatePositionWithRouteMatch:", transportType == 0);
      objc_msgSend(v30, "setShowsUserLocation:", 1);
      objc_msgSend(v30, "setUserTrackingMode:", 0);
      objc_msgSend(v30, "setZoomEnabled:", v29);

    }
    -[NavigationDisplay _updateSky](self, "_updateSky", v41);
    if (self->_transportType != 4)
      -[NavigationDisplay _updateCartographicConfiguration](self, "_updateCartographicConfiguration");
    v31 = -[NavigationDebugAnnotationsProvider initWithMapView:]([NavigationDebugAnnotationsProvider alloc], "initWithMapView:", self->_mapView);
    debugAnnotationsProvider = self->_debugAnnotationsProvider;
    self->_debugAnnotationsProvider = v31;

    -[NavigationDebugAnnotationsProvider setUserLocationMarkerMode:](self->_debugAnnotationsProvider, "setUserLocationMarkerMode:", -[UserLocationView mode](self->_userLocationAnnotationView, "mode"));
    -[NavigationDebugAnnotationsProvider updateWithRoute:](self->_debugAnnotationsProvider, "updateWithRoute:", self->_route);
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView selectedAnnotations](self->_mapView, "selectedAnnotations"));
    v34 = objc_msgSend(v33, "count");

    if (v34)
    {
      v35 = *p_mapView;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_mapView, "selectedAnnotations"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "firstObject"));
      objc_msgSend(v35, "deselectAnnotation:animated:", v37, 1);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*p_mapView, "_selectedLabelMarker"));

    if (v38)
      objc_msgSend(*p_mapView, "_deselectLabelMarkerAnimated:", 1);
    -[NavCameraController setMapView:](self->_cameraController, "setMapView:", self->_mapView);
    v39 = -[MapViewResponder initWithMapView:]([MapViewResponder alloc], "initWithMapView:", self->_mapView);
    mapViewResponder = self->_mapViewResponder;
    self->_mapViewResponder = v39;

    -[MapViewResponder setTarget:](self->_mapViewResponder, "setTarget:", self);
    v5 = v45;
  }

}

- (void)setUserLocationAnnotationView:(id)a3
{
  UserLocationView *v5;

  v5 = (UserLocationView *)a3;
  if (self->_userLocationAnnotationView != v5)
  {
    objc_storeStrong((id *)&self->_userLocationAnnotationView, a3);
    -[UserLocationView setCanShowCallout:](self->_userLocationAnnotationView, "setCanShowCallout:", 0);
    -[NavigationDebugAnnotationsProvider setUserLocationMarkerMode:](self->_debugAnnotationsProvider, "setUserLocationMarkerMode:", -[UserLocationView mode](v5, "mode"));
    -[NavigationDisplay _updateUserAnnotationViewForCurrentTransportTypeAnimated:](self, "_updateUserAnnotationViewForCurrentTransportTypeAnimated:", 1);
  }

}

- (void)updateWithLocation:(id)a3
{
  void *v5;
  id v6;

  objc_storeStrong((id *)&self->_matchedLocation, a3);
  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "roadName"));
  -[NavigationDisplay _updateRoadDescription:](self, "_updateRoadDescription:", v5);

  -[NavigationDebugAnnotationsProvider updateWithLocation:](self->_debugAnnotationsProvider, "updateWithLocation:", v6);
}

- (void)updateWithRoute:(id)a3
{
  GEOComposedRoute *v5;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    objc_storeStrong((id *)&self->_route, a3);
    -[NavigationDebugAnnotationsProvider updateWithRoute:](self->_debugAnnotationsProvider, "updateWithRoute:", v5);
    -[NavigationDisplay _updateMapViewAndCameraController](self, "_updateMapViewAndCameraController");
    -[NavigationDisplay _updateDestinationBuildingId](self, "_updateDestinationBuildingId");
  }

}

- (void)setRouteGeniusEntry:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_routeGeniusEntry, a3);
  v5 = a3;
  -[NavCameraDriveProvider setRouteGeniusEntry:](self->_driveCameraProvider, "setRouteGeniusEntry:", v5);

}

- (void)clearAllAnnotations
{
  -[NavigationDebugAnnotationsProvider clearAllAnnotationsAndOverlays](self->_debugAnnotationsProvider, "clearAllAnnotationsAndOverlays");
}

- ($F9C4767691F2EDF2F3162F5FE7B1523A)cartographicConfigurationForTransportType:(SEL)a3
{
  void *v7;
  unsigned int v8;
  $F9C4767691F2EDF2F3162F5FE7B1523A *result;
  void *v10;
  int64_t v11;
  void *v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;

  *(_QWORD *)&retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  _MKCartographicConfigurationDefault(retstr, self);
  retstr->var4 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay chromeViewController](self, "chromeViewController"));
  v8 = objc_msgSend(v7, "shouldUseModernMap");

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay chromeViewController](self, "chromeViewController"));
    v11 = (int64_t)objc_msgSend(v10, "modernMapProjectionType");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay chromeViewController](self, "chromeViewController"));
    v13 = (int64_t)objc_msgSend(v12, "modernMapTerrainMode");

    v14 = v13;
    v15 = v11;
    v16 = v13;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v14 = 2;
    v13 = 1;
    v11 = 1;
  }
  switch(a4)
  {
    case 0:
      retstr->var3 = v13;
      goto LABEL_9;
    case 1:
      retstr->var2 = v15;
      retstr->var3 = v16;
      v17 = 4;
      goto LABEL_10;
    case 2:
      retstr->var2 = v11;
      retstr->var3 = v14;
      return result;
    case 3:
      retstr->var3 = v14;
LABEL_9:
      v17 = 3;
      retstr->var2 = v11;
LABEL_10:
      retstr->var1 = v17;
      break;
    default:
      return result;
  }
  return result;
}

- (void)_updateCartographicConfiguration
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _OWORD v9[3];
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = 0;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  -[NavigationDisplay cartographicConfigurationForTransportType:](self, "cartographicConfigurationForTransportType:", self->_transportType);
  v3 = objc_alloc((Class)_MKCartographicMapConfiguration);
  v9[0] = v11;
  v9[1] = v12;
  v9[2] = v13;
  v10 = v14;
  v4 = objc_msgSend(v3, "initWithCartographicConfiguration:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView preferredConfiguration](self->_mapView, "preferredConfiguration"));
  if (objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___MKMapConfigurationHiking))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  objc_msgSend(v4, "setShowsHiking:", objc_msgSend(v7, "showsHiking"));
  v8 = objc_msgSend(v7, "showsTopographicFeatures");

  objc_msgSend(v4, "setShowsTopographicFeatures:", v8);
  -[MKMapView setPreferredConfiguration:](self->_mapView, "setPreferredConfiguration:", v4);

}

- (void)setTransportType:(int)a3
{
  -[NavigationDisplay setTransportType:animated:](self, "setTransportType:animated:", *(_QWORD *)&a3, 1);
}

- (void)setTransportType:(int)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;

  v4 = a4;
  self->_transportType = a3;
  -[NavigationDisplay _updateCartographicConfiguration](self, "_updateCartographicConfiguration");
  switch(a3)
  {
    case 0:
    case 3:
      -[MKMapView setShowsTraffic:](self->_mapView, "setShowsTraffic:", 1);
      -[MKMapView _setShowHeadingIndicatorForStepping:](self->_mapView, "_setShowHeadingIndicatorForStepping:", 0);
      -[MKMapView _setShouldAnimatePositionWithRouteMatch:](self->_mapView, "_setShouldAnimatePositionWithRouteMatch:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
      objc_msgSend(v7, "setDesiredMapMode:", 1);

      break;
    case 1:
      -[MKMapView setShowsTraffic:](self->_mapView, "setShowsTraffic:", 0);
      -[MKMapView setScaleEnabled:](self->_mapView, "setScaleEnabled:", 0);
      -[MKMapView _setShowHeadingIndicatorForStepping:](self->_mapView, "_setShowHeadingIndicatorForStepping:", 1);
      -[MKMapView _setShouldAnimatePositionWithRouteMatch:](self->_mapView, "_setShouldAnimatePositionWithRouteMatch:", 0);
      -[MKMapView _setClearUserLocationOnLocationReset:](self->_mapView, "_setClearUserLocationOnLocationReset:", 0);
      goto LABEL_5;
    case 2:
      -[MKMapView setShowsTraffic:](self->_mapView, "setShowsTraffic:", 0);
      -[MKMapView _setShowHeadingIndicatorForStepping:](self->_mapView, "_setShowHeadingIndicatorForStepping:", 1);
      -[MKMapView _setShouldAnimatePositionWithRouteMatch:](self->_mapView, "_setShouldAnimatePositionWithRouteMatch:", 0);
LABEL_5:
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
      objc_msgSend(v8, "setDesiredMapMode:", 0);

      -[MKMapView setUserTrackingMode:animated:](self->_mapView, "setUserTrackingMode:animated:", 0, 0);
      break;
    default:
      break;
  }
  -[NavigationDisplay _updateUserAnnotationViewForCurrentTransportTypeAnimated:](self, "_updateUserAnnotationViewForCurrentTransportTypeAnimated:", v4);
}

- (void)_updateUserAnnotationViewForCurrentTransportTypeAnimated:(BOOL)a3
{
  uint64_t transportType;

  transportType = self->_transportType;
  if (transportType <= 3)
    -[UserLocationView setMode:animated:](self->_userLocationAnnotationView, "setMode:animated:", qword_100E37568[transportType], a3);
}

- (void)clearCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v2, "clearScene");

}

- (void)setShowsRoadLabel:(BOOL)a3
{
  id v4;

  if (self->_showsRoadLabel != a3)
  {
    self->_showsRoadLabel = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MNLocation roadName](self->_matchedLocation, "roadName"));
    -[NavigationDisplay _updateRoadDescription:](self, "_updateRoadDescription:", v4);

  }
}

- (void)_updateRoadDescription:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (!self->_showsRoadLabel)
  {

    v4 = 0;
  }
  v6 = v4;
  if (!objc_msgSend(v4, "length"))
  {

    v6 = 0;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v5, "setCurrentLocationText:", v6);

}

- (void)_setTracking:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 tracking;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  void *v13;

  if (self->_tracking != a3)
  {
    v3 = a3;
    v5 = sub_10043157C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      tracking = self->_tracking;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self, "mapView"));
      v9[0] = 67109634;
      v9[1] = tracking;
      v10 = 1024;
      v11 = v3;
      v12 = 2114;
      v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Changing _tracking from %d to %d on %{public}@", (uint8_t *)v9, 0x18u);

    }
    self->_tracking = v3;
  }
}

- (void)setNavigationCameraMode:(unint64_t)a3
{
  self->_navigationCameraMode = a3;
  -[NavigationDisplay _updateMapViewAndCameraController](self, "_updateMapViewAndCameraController");
}

- (void)_updateMapViewAndCameraController
{
  unint64_t navigationCameraMode;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  NavCameraDriveProvider *driveCameraProvider;
  NavCameraDriveProvider *v11;
  NavCameraDriveProvider *v12;
  void *v13;
  uint64_t v14;
  NavCameraDriveProvider *v15;

  navigationCameraMode = self->_navigationCameraMode;
  if (navigationCameraMode - 1 >= 2)
  {
    if (navigationCameraMode == 3)
    {
      driveCameraProvider = self->_driveCameraProvider;
      if (!driveCameraProvider)
      {
        v11 = objc_alloc_init(NavCameraDriveProvider);
        v12 = self->_driveCameraProvider;
        self->_driveCameraProvider = v11;

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay routeGeniusEntry](self, "routeGeniusEntry"));
        -[NavCameraDriveProvider setRouteGeniusEntry:](self->_driveCameraProvider, "setRouteGeniusEntry:", v13);

        driveCameraProvider = self->_driveCameraProvider;
      }
      v15 = driveCameraProvider;
      v14 = 2;
    }
    else
    {
      v15 = 0;
      v14 = 0;
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "nextWaypoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "route"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "waypoints"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));

    if (GEOConfigGetBOOL(MapsConfig_EnableEVRoutingSpecificOverviewCamera, off_1014B3CF8))
      v9 = v5 == v8;
    else
      v9 = 1;
    if (v9)
    {
      if (self->_navigationCameraMode == 2)
        v14 = 2;
      else
        v14 = 1;
    }
    else
    {
      v14 = 3;
    }

    v15 = 0;
  }
  -[MKMapView _clearGesturesAndAnimations](self->_mapView, "_clearGesturesAndAnimations");
  -[NavCameraController setNavCameraMode:](self->_cameraController, "setNavCameraMode:", v14);
  -[NavCameraController setOverrideNavigationProvider:](self->_cameraController, "setOverrideNavigationProvider:", v15);

}

- (void)_updateDestinationBuildingId
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self->_route, "destination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "geoMapItem"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_enhancedPlacement"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buildingIds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "buildingIds"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    objc_msgSend(v6, "setSelectedBuildingFeatureIds:", v8);

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v6, "setSelectedBuildingFeatureIds:", v7);
  }

}

- (void)setNavigationDestinationState:(unint64_t)a3
{
  if (a3 != 2)
    a3 = a3 == 1;
  -[NavCameraController setNavigationDestination:](self->_cameraController, "setNavigationDestination:", a3);
}

- (void)startMotion:(BOOL)a3
{
  _BOOL8 v3;
  int transportType;
  BOOL v6;
  uint64_t v7;
  void *v8;
  MNLocation *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  id v21;
  NavCameraController *cameraController;
  _QWORD v23[5];

  v3 = a3;
  -[NavigationDisplay _setTracking:](self, "_setTracking:", 1);
  transportType = self->_transportType;
  if ((transportType - 1) < 2)
  {
    v7 = 0;
  }
  else
  {
    if (transportType)
      v6 = transportType == 3;
    else
      v6 = 1;
    if (v6)
    {
      -[NavigationDisplay _updateCartographicConfiguration](self, "_updateCartographicConfiguration");
      v7 = 1;
    }
    else
    {
      v7 = -1;
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView _mapLayer](self->_mapView, "_mapLayer"));
  objc_msgSend(v8, "setDesiredMapMode:", v7);

  v9 = self->_matchedLocation;
  if (!v9)
  {
    if (!-[MKMapView hasUserLocation](self->_mapView, "hasUserLocation")
      || (v10 = objc_alloc((Class)MNLocation),
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MKMapView userLocation](self->_mapView, "userLocation")),
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location")),
          v9 = (MNLocation *)objc_msgSend(v10, "initWithRawLocation:", v12),
          v12,
          v11,
          !v9))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "originalOrigin"));

      if (v14)
      {
        v15 = objc_alloc((Class)CLLocation);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "latLng"));
        objc_msgSend(v16, "lat");
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "latLng"));
        objc_msgSend(v19, "lng");
        v21 = objc_msgSend(v15, "initWithLatitude:longitude:", v18, v20);

        v9 = (MNLocation *)objc_msgSend(objc_alloc((Class)MNLocation), "initWithRawLocation:", v21);
      }
      else
      {
        v9 = 0;
      }

    }
  }
  cameraController = self->_cameraController;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1004A8EBC;
  v23[3] = &unk_1011AE8F8;
  v23[4] = self;
  -[NavCameraController transitionToTrackingInMapMode:animated:startLocation:startHandler:](cameraController, "transitionToTrackingInMapMode:animated:startLocation:startHandler:", v7, v3, v9, v23);

}

- (void)stopCameraMotion
{
  -[NavigationDisplay _setTracking:](self, "_setTracking:", 0);
  -[NavCameraController stopTracking](self->_cameraController, "stopTracking");
}

- (void)pauseCameraMotion
{
  -[NavigationDisplay _setTracking:](self, "_setTracking:", 0);
  -[NavCameraController pauseTracking](self->_cameraController, "pauseTracking");
}

- (void)_startObservingChromeIfNeeded
{
  id WeakRetained;
  void *v4;
  id v5;
  char v6;
  id v7;
  id v8;

  -[NavigationDisplay _stopObservingChromeIfNeeded](self, "_stopObservingChromeIfNeeded");
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v5 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v6 = objc_opt_respondsToSelector(v5, "shouldUseModernMap");

    if ((v6 & 1) != 0)
    {
      self->_observingChrome = 1;
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v7 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      objc_msgSend(v8, "addObserver:selector:name:object:", self, "_shouldUseModernMapDidUpdate:", CFSTR("ChromeViewControllerDidUpdateShouldUseModernMap"), v7);

    }
  }
}

- (void)_stopObservingChromeIfNeeded
{
  ChromeViewController **p_chromeViewController;
  id WeakRetained;
  _BOOL4 observingChrome;
  void *v6;
  id v7;

  p_chromeViewController = &self->_chromeViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (WeakRetained)
  {
    observingChrome = self->_observingChrome;

    if (observingChrome)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      v7 = objc_loadWeakRetained((id *)p_chromeViewController);
      objc_msgSend(v6, "removeObserver:name:object:", self, CFSTR("ChromeViewControllerDidUpdateShouldUseModernMap"), v7);

      self->_observingChrome = 0;
    }
  }
}

- (id)mapView:(id)a3 rendererForOverlay:(id)a4
{
  return -[NavigationDebugAnnotationsProvider mapView:rendererForOverlay:](self->_debugAnnotationsProvider, "mapView:rendererForOverlay:", a3, a4);
}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  return -[NavigationDebugAnnotationsProvider mapView:viewForAnnotation:](self->_debugAnnotationsProvider, "mapView:viewForAnnotation:", a3, a4);
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5 fromTrackingButton:(BOOL)a6
{
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = objc_opt_respondsToSelector(WeakRetained, "navigationDisplay:didChangeUserTrackingMode:");

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "navigationDisplay:didChangeUserTrackingMode:", self, a4);

  }
}

- (void)mapView:(id)a3 didUpdateYaw:(double)a4
{
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v8;
  id v9;
  id v10;

  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v8 = objc_opt_respondsToSelector(WeakRetained, "mapView:didUpdateYaw:");

  if ((v8 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "mapView:didUpdateYaw:", v10, a4);

  }
}

- (void)didTapMapView:(id)a3 atPoint:(CGPoint)a4
{
  double y;
  double x;
  NavigationDisplayDelegate **p_delegate;
  id v7;
  id WeakRetained;

  y = a4.y;
  x = a4.x;
  p_delegate = &self->_delegate;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "didTapMapView:atPoint:", v7, x, y);

}

- (id)mapViewCurrentRouteMatch:(id)a3
{
  void *v4;

  if (-[MNLocation state](self->_matchedLocation, "state", a3) == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNLocation routeMatch](self->_matchedLocation, "routeMatch"));
  else
    v4 = 0;
  return v4;
}

- (void)mapView:(id)a3 didStopRespondingToGesture:(int64_t)a4 zoomDirection:(int64_t)a5 zoomGestureType:(int64_t)a6 didDecelerate:(BOOL)a7 tiltDirection:(int64_t)a8
{
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  uint64_t v20;
  unsigned int v21;
  id v22;

  v12 = a3;
  if ((unint64_t)a4 <= 1)
  {
    if (a4)
    {
      if (a5 == 1)
      {
        v13 = 1043;
        switch(a6)
        {
          case 0:
          case 3:
            break;
          case 2:
            v13 = 1045;
            goto LABEL_7;
          case 4:
            v13 = 1047;
            goto LABEL_7;
          case 5:
            v13 = 1049;
            goto LABEL_7;
          case 6:
          case 7:
            v13 = 1002;
            goto LABEL_7;
          default:
            goto LABEL_7;
        }
      }
      else
      {
        v13 = 1044;
        switch(a6)
        {
          case 0:
          case 2:
            break;
          case 3:
            v13 = 1046;
            goto LABEL_7;
          case 4:
            v13 = 1048;
            goto LABEL_7;
          case 5:
            v13 = 1050;
            goto LABEL_7;
          case 6:
          case 7:
            v13 = 1003;
            goto LABEL_7;
          default:
            goto LABEL_7;
        }
      }
    }
    else
    {
      v13 = 1001;
LABEL_7:
      v22 = v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "mapRegion"));
      objc_msgSend(v22, "_zoomLevel");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationDisplay mapView](self, "mapView"));
      v19 = objc_msgSend(v18, "mapType");
      v20 = 1;
      switch((unint64_t)v19)
      {
        case 0uLL:
          break;
        case 1uLL:
        case 3uLL:
          v20 = 2;
          break;
        case 2uLL:
        case 4uLL:
          v20 = 3;
          break;
        default:
          if (v19 == (id)104)
            v21 = 4;
          else
            v21 = 0;
          if (v19 == (id)102)
            v20 = 1;
          else
            v20 = v21;
          break;
      }
      objc_msgSend(v14, "captureUserAction:onTarget:eventValue:mapRegion:zoomLevel:mapType:", v13, 505, 0, v15, v20, v17);

      v12 = v22;
    }
  }

}

- (BOOL)mapView:(id)a3 shouldSelectLabelMarker:(id)a4
{
  id v7;
  id v8;
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  id v11;
  unsigned __int8 v12;

  v7 = a3;
  v8 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    v12 = objc_msgSend(v11, "mapView:shouldSelectLabelMarker:", v7, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)mapView:(id)a3 didSelectLabelMarker:(id)a4
{
  id v7;
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "mapView:didSelectLabelMarker:", v11, v7);

  }
}

- (void)mapView:(id)a3 didDeselectLabelMarker:(id)a4
{
  id v7;
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  id v10;
  id v11;

  v11 = a3;
  v7 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v10, "mapView:didDeselectLabelMarker:", v11, v7);

  }
}

- (void)mapViewNavigationCameraHasStartedPanning:(id)a3
{
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "performSelector:withObject:", a2, v9);

  }
}

- (void)mapViewNavigationCameraHasStoppedPanning:(id)a3
{
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "performSelector:withObject:", a2, v9);

  }
}

- (void)mapViewNavigationCameraDidLeaveDefaultZoom:(id)a3
{
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "performSelector:withObject:", a2, v9);

  }
}

- (void)mapViewNavigationCameraDidReturnToDefaultZoom:(id)a3
{
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "performSelector:withObject:", a2, v9);

  }
}

- (void)mapView:(id)a3 didSelectAnnotationView:(id)a4
{
  id v7;
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  char v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v10 = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((v10 & 1) != 0)
  {
    v11 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v11, "performSelector:withObject:withObject:", a2, v12, v7);

  }
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  _BOOL8 v4;
  NavigationDisplayDelegate **p_delegate;
  id WeakRetained;
  id v9;
  id v10;

  v4 = a4;
  v10 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  LOBYTE(a2) = objc_opt_respondsToSelector(WeakRetained, a2);

  if ((a2 & 1) != 0)
  {
    v9 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v9, "mapView:regionDidChangeAnimated:", v10, v4);

  }
}

- (NavigationDisplayDelegate)delegate
{
  return (NavigationDisplayDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MKMapView)mapView
{
  return self->_mapView;
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (UserLocationView)userLocationAnnotationView
{
  return self->_userLocationAnnotationView;
}

- (int64_t)sky
{
  return self->_sky;
}

- (NavCameraController)cameraController
{
  return self->_cameraController;
}

- (GEOComposedWaypoint)destinationWaypoint
{
  return self->_destinationWaypoint;
}

- (void)setDestinationWaypoint:(id)a3
{
  objc_storeStrong((id *)&self->_destinationWaypoint, a3);
}

- (MapsSuggestionsRouteGeniusEntry)routeGeniusEntry
{
  return self->_routeGeniusEntry;
}

- (int)transportType
{
  return self->_transportType;
}

- (BOOL)isTracking
{
  return self->_tracking;
}

- (BOOL)showsRoadLabel
{
  return self->_showsRoadLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeGeniusEntry, 0);
  objc_storeStrong((id *)&self->_destinationWaypoint, 0);
  objc_storeStrong((id *)&self->_cameraController, 0);
  objc_storeStrong((id *)&self->_userLocationAnnotationView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong((id *)&self->_mapView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_driveCameraProvider, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong((id *)&self->_matchedLocation, 0);
  objc_storeStrong((id *)&self->_mapViewResponder, 0);
  objc_storeStrong((id *)&self->_debugAnnotationsProvider, 0);
}

@end
