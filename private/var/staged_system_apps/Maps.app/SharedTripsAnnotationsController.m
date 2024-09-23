@implementation SharedTripsAnnotationsController

- (SharedTripsAnnotationsController)init
{
  SharedTripsAnnotationsController *v2;
  SharedTripsItemSource *v3;
  SharedTripsItemSource *itemSource;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SharedTripsAnnotationsController;
  v2 = -[SharedTripsAnnotationsController init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(SharedTripsItemSource);
    itemSource = v2->_itemSource;
    v2->_itemSource = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SharedTripsAnnotationsController removeFromMapView](self, "removeFromMapView");
  v3.receiver = self;
  v3.super_class = (Class)SharedTripsAnnotationsController;
  -[SharedTripsAnnotationsController dealloc](&v3, "dealloc");
}

- (PersonalizedItemSource)itemSource
{
  return (PersonalizedItemSource *)self->_itemSource;
}

- (void)setSharedTrip:(id)a3
{
  GEOSharedNavState *v5;
  id subscriptionToken;
  GEOSharedNavState *v7;

  v5 = (GEOSharedNavState *)a3;
  if (self->_sharedTrip != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_sharedTrip, a3);
    subscriptionToken = self->_subscriptionToken;
    self->_subscriptionToken = 0;

    self->_automaticallyRecenter = 1;
    -[SharedTripsAnnotationsController _connectOrDisconnectFromMapView](self, "_connectOrDisconnectFromMapView");
    -[SharedTripsAnnotationsController _updateSubscriptions](self, "_updateSubscriptions");
    -[SharedTripsAnnotationsController reload](self, "reload");
    v5 = v7;
  }

}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    -[SharedTripsAnnotationsController _updateSubscriptions](self, "_updateSubscriptions");
  }
}

- (void)setMapView:(id)a3 mapCameraController:(id)a4 searchPinsManager:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  MKMapView **p_mapView;
  id v11;
  id v12;
  id v13;
  void *v14;

  v6 = a6;
  p_mapView = &self->_mapView;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_storeWeak((id *)p_mapView, v13);
  objc_storeWeak((id *)&self->_mapCameraController, v12);

  objc_storeWeak((id *)&self->_searchPinsManager, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));

  self->_idiom = (int64_t)objc_msgSend(v14, "userInterfaceIdiom");
  -[SharedTripsAnnotationsController _attachToMapViewIfNeeded:](self, "_attachToMapViewIfNeeded:", v6);
}

- (void)_attachToMapViewIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  GEOSharedNavState *sharedTrip;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _OWORD v20[3];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_mapView);
  if (WeakRetained)
  {
    sharedTrip = self->_sharedTrip;

    if (sharedTrip)
    {
      self->_attachedToMapView = 1;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "camera"));
      v9 = objc_msgSend(v8, "copy");

      objc_msgSend(v9, "setPitch:", 0.0);
      objc_msgSend(v9, "setHeading:", 0.0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      objc_msgSend(v10, "setCamera:animated:", v9, v3);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      objc_msgSend(v11, "setShowsTraffic:", 1);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "_cartographicConfiguration");
      }
      else
      {
        v29 = 0;
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
      }
      v14 = v27;
      *(_OWORD *)&self->_oldMapConfiguration.style = v26;
      *(_OWORD *)&self->_oldMapConfiguration.projection = v14;
      *(_OWORD *)&self->_oldMapConfiguration.mapkitUsage = v28;
      *(_QWORD *)&self->_oldMapConfiguration.gridOnly = v29;

      v29 = 0;
      v27 = 0u;
      v28 = 0u;
      v26 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      v16 = v15;
      if (v15)
      {
        objc_msgSend(v15, "_cartographicConfiguration");
      }
      else
      {
        v29 = 0;
        v27 = 0u;
        v28 = 0u;
        v26 = 0u;
      }

      v26 = xmmword_100E2F4D0;
      *(_QWORD *)&v28 = 0;
      v25 = v29;
      v22 = xmmword_100E2F4D0;
      v23 = v27;
      v24 = v28;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      v20[0] = xmmword_100E2F4D0;
      v20[1] = v23;
      v20[2] = v24;
      v21 = v25;
      objc_msgSend(v17, "_setCartographicConfiguration:", v20);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController searchPinsManager](self, "searchPinsManager"));
      objc_msgSend(v18, "addPOIShapeLoadingObserver:", self);

      -[SharedTripsAnnotationsController _updateRouteLines](self, "_updateRouteLines");
      -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", v3);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
      objc_msgSend(v19, "addReceivingObserver:", self);

    }
  }
}

- (void)_detachFromMapView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;

  if (self->_attachedToMapView)
  {
    self->_attachedToMapView = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSPSharedTripService sharedInstance](MSPSharedTripService, "sharedInstance"));
    objc_msgSend(v3, "removeReceivingObserver:", self);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView", self->_oldMapConfiguration.style, self->_oldMapConfiguration.emphasis, self->_oldMapConfiguration.projection, self->_oldMapConfiguration.terrainMode, self->_oldMapConfiguration.mapkitUsage, self->_oldMapConfiguration.mapkitClientMode, *(_QWORD *)&self->_oldMapConfiguration.gridOnly));
    objc_msgSend(v4, "_setCartographicConfiguration:", &v7);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
    objc_msgSend(v5, "removeAnnotation:", self->_userAnnotation);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController searchPinsManager](self, "searchPinsManager"));
    objc_msgSend(v6, "removePOIShapeLoadingObserver:", self);

  }
}

- (void)removeFromMapView
{
  -[SharedTripsAnnotationsController _detachFromMapView](self, "_detachFromMapView");
  objc_storeWeak((id *)&self->_mapView, 0);
  objc_storeWeak((id *)&self->_mapCameraController, 0);
  objc_storeWeak((id *)&self->_searchPinsManager, 0);
}

- (void)_connectOrDisconnectFromMapView
{
  GEOSharedNavState *sharedTrip;

  sharedTrip = self->_sharedTrip;
  if (self->_attachedToMapView)
  {
    if (!sharedTrip)
      -[SharedTripsAnnotationsController _detachFromMapView](self, "_detachFromMapView");
  }
  else if (sharedTrip)
  {
    -[SharedTripsAnnotationsController _attachToMapViewIfNeeded:](self, "_attachToMapViewIfNeeded:", 1);
  }
}

- (void)_updateSubscriptions
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  SharedTripSceneAwareSubscription *v7;
  id subscriptionToken;
  id v9;

  v3 = -[SharedTripsAnnotationsController _shouldBeActive](self, "_shouldBeActive");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "groupIdentifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController chromeViewController](self, "chromeViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_uiScene"));

  v7 = 0;
  subscriptionToken = self->_subscriptionToken;
  if (!v3 || !v9 || !v6)
    goto LABEL_6;
  if (!subscriptionToken)
  {
    v7 = -[SharedTripSceneAwareSubscription initWithTripIdentifier:scene:]([SharedTripSceneAwareSubscription alloc], "initWithTripIdentifier:scene:", v9, v6);
    subscriptionToken = self->_subscriptionToken;
LABEL_6:
    self->_subscriptionToken = v7;

  }
}

- (void)reload
{
  -[SharedTripsAnnotationsController _updateRouteLines](self, "_updateRouteLines");
  -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", 1);
}

- (BOOL)shouldShowRoute
{
  return self->_idiom != 3;
}

- (void)recenterOnRouteAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  double y;
  double height;
  double width;
  unsigned int v9;
  void *v10;
  unsigned __int8 v11;
  double v12;
  double x;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  CLLocationDegrees v27;
  CLLocationDegrees v28;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  CLLocationCoordinate2D v31;
  SharedTripUserAnnotation *userAnnotation;
  double v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id v49;
  CLLocationCoordinate2D v50;
  MKMapRect v51;
  MKMapRect v52;
  MKMapRect v53;
  MKMapRect v54;
  MKMapRect v55;
  MKMapRect v56;
  MKMapRect v57;
  MKMapRect v58;
  MKMapRect v59;
  MKMapRect v60;
  MKMapRect v61;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  if (!v5)
    goto LABEL_29;
  y = MKMapRectNull.origin.y;
  width = MKMapRectNull.size.width;
  height = MKMapRectNull.size.height;
  v49 = v5;
  v9 = objc_msgSend(v5, "hasClosed");
  v10 = v49;
  if (!v9 || (v11 = objc_msgSend(v49, "closed"), v10 = v49, (v11 & 1) == 0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "composedRoute"));
    if (v14 && -[SharedTripsAnnotationsController shouldShowRoute](self, "shouldShowRoute"))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "boundingMapRegion"));
      v17 = GEOMapRectForMapRegion(v15, v16);
      v19 = v18;
      v21 = v20;
      v23 = v22;

      v51.origin.x = MKMapRectNull.origin.x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v59.origin.x = v17;
      v59.origin.y = v19;
      v59.size.width = v21;
      v59.size.height = v23;
      v52 = MKMapRectUnion(v51, v59);
      x = v52.origin.x;
      v12 = v52.origin.y;
      width = v52.size.width;
      height = v52.size.height;
    }
    else
    {
      v12 = y;
      x = MKMapRectNull.origin.x;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "etaInfo"));
    v25 = v24;
    if (v24
      && objc_msgSend(v24, "hasLatitude")
      && objc_msgSend(v25, "hasLongitude")
      && -[SharedTripsAnnotationsController shouldShowRoute](self, "shouldShowRoute"))
    {
      objc_msgSend(v25, "latitude");
      v27 = v26;
      objc_msgSend(v25, "longitude");
      v31 = CLLocationCoordinate2DMake(v27, v28);
      longitude = v31.longitude;
      latitude = v31.latitude;
    }
    else
    {
      userAnnotation = self->_userAnnotation;
      if (!userAnnotation)
        goto LABEL_18;
      -[SharedTripUserAnnotation coordinate](userAnnotation, "coordinate");
      if (!CLLocationCoordinate2DIsValid(v50))
        goto LABEL_18;
      -[SharedTripUserAnnotation coordinate](self->_userAnnotation, "coordinate");
    }
    v60.origin.x = MKMapRectMakeWithRadialDistance(latitude, longitude, 100.0);
    v60.origin.y = v33;
    v60.size.width = v34;
    v60.size.height = v35;
    v53.origin.x = x;
    v53.origin.y = v12;
    v53.size.width = width;
    v53.size.height = height;
    v54 = MKMapRectUnion(v53, v60);
    x = v54.origin.x;
    v12 = v54.origin.y;
    width = v54.size.width;
    height = v54.size.height;
LABEL_18:

    goto LABEL_19;
  }
  v12 = y;
  x = MKMapRectNull.origin.x;
LABEL_19:
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "destinationWaypointMapItem"));
  if (v36)
  {
    v37 = objc_msgSend(objc_alloc((Class)MKMapItem), "initWithGeoMapItem:isPlaceHolderPlace:", v36, 0);
    objc_msgSend(v37, "_coordinate");
    v61.origin.x = MKMapRectMakeWithRadialDistance(v38, v39, 100.0);
    v61.origin.y = v40;
    v61.size.width = v41;
    v61.size.height = v42;
    v55.origin.x = x;
    v55.origin.y = v12;
    v55.size.width = width;
    v55.size.height = height;
    v56 = MKMapRectUnion(v55, v61);
    x = v56.origin.x;
    v12 = v56.origin.y;
    width = v56.size.width;
    height = v56.size.height;

  }
  v43 = v12 == y && x == MKMapRectNull.origin.x;
  if (!v43 && width != 0.0 && height != 0.0)
  {
    v57.origin.x = x;
    v57.origin.y = v12;
    v57.size.width = width;
    v57.size.height = height;
    v58 = MKMapRectInset(v57, width * -0.100000001, height * -0.100000001);
    v44 = v58.origin.x;
    v45 = v58.origin.y;
    v46 = v58.size.width;
    v47 = v58.size.height;
    v48 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapCameraController](self, "mapCameraController"));
    objc_msgSend(v48, "frameMapRect:animated:completion:", v3, 0, v44, v45, v46, v47);

  }
  v5 = v49;
LABEL_29:

}

- (id)_composedRouteToDisplay
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  if (objc_msgSend(v3, "hasClosed"))
    v4 = objc_msgSend(v3, "closed") ^ 1;
  else
    v4 = 1;
  v5 = 0;
  if (v3 && v4)
  {
    if (-[SharedTripsAnnotationsController shouldShowRoute](self, "shouldShowRoute")
      && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composedRoute")), v6, v6))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "composedRoute"));
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)_updateRouteLines
{
  uint64_t v3;
  void *v4;
  id v5;

  -[SharedTripsAnnotationsController _updateModernMapTokenIfNeeded](self, "_updateModernMapTokenIfNeeded");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController _composedRouteToDisplay](self, "_composedRouteToDisplay"));
  if (v5)
    v3 = 0;
  else
    v3 = 4095;
  -[RouteStartEndItemSource setVisibilityMask:](self->_itemSource, "setVisibilityMask:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController chromeViewController](self, "chromeViewController"));
  objc_msgSend(v4, "setNeedsUpdateComponent:animated:", CFSTR("routeAnnotations"), 1);

}

- (BOOL)updateRouteAnnotationsConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController _composedRouteToDisplay](self, "_composedRouteToDisplay"));
  objc_msgSend(v4, "setStyle:", 0);
  if (v5)
  {
    v9 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v4, "setRoutes:", v6);

    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "setRoutes:", &__NSArray0__struct);
    v7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  objc_msgSend(v4, "setRouteTrafficFeaturesActive:", 1);
  objc_msgSend(v4, "setSelectedRouteIndex:", v7);

  return 1;
}

- (id)_waypointSearchResults
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v3 = v2;
  if (v2 && !objc_msgSend(v2, "waypointInfosCount"))
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v16 = "-[SharedTripsAnnotationsController _waypointSearchResults]";
      v17 = 2080;
      v18 = "SharedTripsAnnotationsController.m";
      v19 = 1024;
      v20 = 288;
      v21 = 2080;
      v22 = "!trip || trip.waypointInfosCount > 0";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v16 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (objc_msgSend(v3, "hasCurrentWaypointIndex"))
    v4 = objc_msgSend(v3, "currentWaypointIndex");
  else
    v4 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "waypointInfos"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1009B6E90;
  v14[3] = &unk_1011DDCA0;
  v14[4] = v4;
  v6 = sub_10039DCD4(v5, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)_showStartEndPinsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  SharedTripsItemSource *itemSource;
  void *v6;
  void *v7;
  SharedTripUserAnnotation *userAnnotation;
  SharedTripUserAnnotation *v9;
  SharedTripUserAnnotation *v10;
  void *v11;
  SharedTripUserAnnotation *v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;
  id v18;

  v3 = a3;
  v18 = (id)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  itemSource = self->_itemSource;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController _waypointSearchResults](self, "_waypointSearchResults"));
  -[RouteStartEndItemSource setStartLocation:endLocations:](itemSource, "setStartLocation:endLocations:", 0, v6);

  if (-[SharedTripsAnnotationsController shouldShowRoute](self, "shouldShowRoute"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "lastLocation"));
    if ((!objc_msgSend(v18, "hasClosed") || objc_msgSend(v18, "closed") != 1)
      && v7
      && objc_msgSend(v7, "hasCoordinate"))
    {
      userAnnotation = self->_userAnnotation;
      if (!userAnnotation)
      {
        v9 = objc_alloc_init(SharedTripUserAnnotation);
        v10 = self->_userAnnotation;
        self->_userAnnotation = v9;

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
        objc_msgSend(v11, "addAnnotation:", self->_userAnnotation);

        userAnnotation = self->_userAnnotation;
      }
      -[SharedTripUserAnnotation setState:](userAnnotation, "setState:", v18);
      v12 = (SharedTripUserAnnotation *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "coordinate"));
      -[SharedTripUserAnnotation lat](v12, "lat");
      v14 = v13;
      -[SharedTripUserAnnotation lng](v12, "lng");
      v16 = CLLocationCoordinate2DMake(v14, v15);
      -[SharedTripUserAnnotation setCoordinate:](self->_userAnnotation, "setCoordinate:", v16.latitude, v16.longitude);
    }
    else
    {
      if (!self->_userAnnotation)
      {
LABEL_12:

        goto LABEL_13;
      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController mapView](self, "mapView"));
      objc_msgSend(v17, "removeAnnotation:", self->_userAnnotation);

      v12 = self->_userAnnotation;
      self->_userAnnotation = 0;
    }

    goto LABEL_12;
  }
LABEL_13:
  if (-[SharedTripsAnnotationsController automaticallyRecenters](self, "automaticallyRecenters"))
    -[SharedTripsAnnotationsController recenterOnRouteAnimated:](self, "recenterOnRouteAnimated:", v3);

}

- (id)mapView:(id)a3 viewForAnnotation:(id)a4
{
  id v5;
  uint64_t v6;
  SharedTripContactAnnotationView *userAnnotationView;
  SharedTripContactAnnotationView *v8;
  SharedTripContactAnnotationView *v9;
  SharedTripContactAnnotationView *v10;
  SharedTripContactAnnotationView *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];

  v5 = a4;
  v6 = objc_opt_class(SharedTripUserAnnotation);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    userAnnotationView = self->_userAnnotationView;
    if (userAnnotationView)
    {
      -[SharedTripContactAnnotationView setAnnotation:](userAnnotationView, "setAnnotation:", v5);
    }
    else
    {
      v9 = [SharedTripContactAnnotationView alloc];
      -[SharedTripsAnnotationsController _userAnnotationViewImageSideLength](self, "_userAnnotationViewImageSideLength");
      v10 = -[SharedTripContactAnnotationView initWithAnnotation:reuseIdentifier:imageSideLength:](v9, "initWithAnnotation:reuseIdentifier:imageSideLength:", v5, CFSTR("UserAnnotation"));
      v11 = self->_userAnnotationView;
      self->_userAnnotationView = v10;

      -[SharedTripContactAnnotationView setTranslatesAutoresizingMaskIntoConstraints:](self->_userAnnotationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView widthAnchor](self->_userAnnotationView, "widthAnchor"));
      -[SharedTripsAnnotationsController _userAnnotationViewImageSideLength](self, "_userAnnotationViewImageSideLength");
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToConstant:"));
      v18[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripContactAnnotationView heightAnchor](self->_userAnnotationView, "heightAnchor"));
      -[SharedTripsAnnotationsController _userAnnotationViewImageSideLength](self, "_userAnnotationViewImageSideLength");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:"));
      v18[1] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v18, 2));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

    }
    v8 = self->_userAnnotationView;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)_userAnnotationViewImageSideLength
{
  double result;

  result = 40.0;
  if (self->_idiom == 3)
    return 34.0;
  return result;
}

- (void)poiShapeLoader:(id)a3 didLoadStartPOIShape:(id)a4 endPOIShapes:(id)a5
{
  if (-[SharedTripsAnnotationsController automaticallyRecenters](self, "automaticallyRecenters", a3, a4, a5))
    -[SharedTripsAnnotationsController recenterOnRouteAnimated:](self, "recenterOnRouteAnimated:", 1);
}

- (BOOL)_shouldBeActive
{
  void *v2;
  BOOL v3;

  if (!self->_attachedToMapView)
    return 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v3 = v2 != 0;

  return v3;
}

- (void)_updateModernMapTokenIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id modernMapToken;
  id v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController chromeViewController](self, "chromeViewController"));
  v4 = objc_opt_class(IOSBasedChromeViewController);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeInfo"));
    if (v8)
    {
      v9 = (void *)v8;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeInfo"));
      v12 = objc_msgSend(v11, "routingPathLegsCount");

      if (!v12)
      {
        if (!self->_modernMapToken)
        {
          v13 = sub_10043237C();
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Acquiring map type suppression token to display trip from older client", buf, 2u);
          }

          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "acquireModernMapTokenForReason:", 2));
          modernMapToken = self->_modernMapToken;
          self->_modernMapToken = v15;
LABEL_16:

          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
    else
    {

    }
  }
  if (self->_modernMapToken)
  {
    v17 = sub_10043237C();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Releasing map type suppression token", v19, 2u);
    }

    modernMapToken = self->_modernMapToken;
    self->_modernMapToken = 0;
    goto LABEL_16;
  }
LABEL_17:

}

- (void)sharedTripService:(id)a3 didUpdateRouteForSharedTrip:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  GEOSharedNavState *v9;
  GEOSharedNavState *sharedTrip;
  id v11;

  v11 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "groupIdentifier"));
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v9 = (GEOSharedNavState *)objc_msgSend(v11, "copy");
    sharedTrip = self->_sharedTrip;
    self->_sharedTrip = v9;

    -[SharedTripsAnnotationsController _updateRouteLines](self, "_updateRouteLines");
    -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", 1);
  }

}

- (void)sharedTripService:(id)a3 didUpdateETAForSharedTrip:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", 1);
  }

}

- (void)sharedTripService:(id)a3 didUpdateDestinationForSharedTrip:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", 1);
  }

}

- (void)sharedTripService:(id)a3 didRemoveSharedTrip:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "groupIdentifier"));

  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", v8);
  if ((_DWORD)v5)
    -[SharedTripsAnnotationsController setSharedTrip:](self, "setSharedTrip:", 0);
}

- (void)sharedTripService:(id)a3 didUpdateClosedTrip:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    -[SharedTripsAnnotationsController _updateRouteLines](self, "_updateRouteLines");
    -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", 1);
  }

}

- (void)sharedTripService:(id)a3 didUpdateReachedDestinationForSharedTrip:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;

  v10 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsAnnotationsController sharedTrip](self, "sharedTrip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupIdentifier"));
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    objc_storeStrong((id *)&self->_sharedTrip, a4);
    -[SharedTripsAnnotationsController _updateRouteLines](self, "_updateRouteLines");
    -[SharedTripsAnnotationsController _showStartEndPinsAnimated:](self, "_showStartEndPinsAnimated:", 1);
  }

}

- (void)setChromeViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_chromeViewController, obj);
    if (obj)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "mapView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "mapCameraController"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "searchPinsManager"));
      -[SharedTripsAnnotationsController setMapView:mapCameraController:searchPinsManager:animated:](self, "setMapView:mapCameraController:searchPinsManager:animated:", v6, v7, v8, 0);

    }
    else
    {
      -[SharedTripsAnnotationsController removeFromMapView](self, "removeFromMapView");
    }
    v5 = obj;
  }

}

- (GEOSharedNavState)sharedTrip
{
  return self->_sharedTrip;
}

- (BOOL)isActive
{
  return self->_active;
}

- (BOOL)automaticallyRecenters
{
  return self->_automaticallyRecenter;
}

- (void)setAutomaticallyRecenter:(BOOL)a3
{
  self->_automaticallyRecenter = a3;
}

- (MKMapView)mapView
{
  return (MKMapView *)objc_loadWeakRetained((id *)&self->_mapView);
}

- (MapCameraController)mapCameraController
{
  return (MapCameraController *)objc_loadWeakRetained((id *)&self->_mapCameraController);
}

- (SearchPinsManager)searchPinsManager
{
  return (SearchPinsManager *)objc_loadWeakRetained((id *)&self->_searchPinsManager);
}

- (ChromeViewController)chromeViewController
{
  return (ChromeViewController *)objc_loadWeakRetained((id *)&self->_chromeViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_searchPinsManager);
  objc_destroyWeak((id *)&self->_mapCameraController);
  objc_destroyWeak((id *)&self->_mapView);
  objc_storeStrong((id *)&self->_sharedTrip, 0);
  objc_storeStrong(&self->_modernMapToken, 0);
  objc_storeStrong(&self->_subscriptionToken, 0);
  objc_storeStrong((id *)&self->_itemSource, 0);
  objc_storeStrong((id *)&self->_userAnnotationView, 0);
  objc_storeStrong((id *)&self->_userAnnotation, 0);
}

@end
