@implementation RoutePlanningUpdater

- (RoutePlanningUpdater)init
{
  RoutePlanningUpdater *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)RoutePlanningUpdater;
  v2 = -[RoutePlanningUpdater init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_mapsForegrounded", UIApplicationWillEnterForegroundNotification, 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, "_mapsBackgrounded", UIApplicationDidEnterBackgroundNotification, 0);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, "_vlfSessionDidStop:", CFSTR("VLFSessionDidStopNotification"), 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
    objc_msgSend(v6, "addNetworkReachableObserver:selector:", v2, "_networkReachabilityChanged:");

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  RoutePlanningUpdater *v12;
  __int16 v13;
  id v14;

  v3 = sub_100404DC8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "dealloc - Removing %@ from session %@", buf, 0x16u);

  }
  v6 = objc_loadWeakRetained((id *)&self->_session);
  objc_msgSend(v6, "removeObserver:", self);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  objc_msgSend(v7, "stopListeningForLocationUpdates:", self);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  objc_msgSend(v8, "removeNetworkReachableObserver:", self);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  objc_msgSend(v9, "removeDelegate:", self);

  v10.receiver = self;
  v10.super_class = (Class)RoutePlanningUpdater;
  -[RoutePlanningUpdater dealloc](&v10, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

- (NSSet)eligibleTransportTypes
{
  NSSet *eligibleTransportTypes;
  NSSet *v4;
  NSSet *v5;

  eligibleTransportTypes = self->_eligibleTransportTypes;
  if (!eligibleTransportTypes)
  {
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", &off_101273218));
    v5 = self->_eligibleTransportTypes;
    self->_eligibleTransportTypes = v4;

    eligibleTransportTypes = self->_eligibleTransportTypes;
  }
  return eligibleTransportTypes;
}

- (MNRouteProximitySensor)proximitySensor
{
  void *v3;
  void *v4;
  MNRouteProximitySensor *proximitySensor;
  BOOL v6;
  MNRouteProximitySensor *v7;
  MNRouteProximitySensor *v8;
  MNRouteProximitySensor *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater currentRouteCollection](self, "currentRouteCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRoute"));

  proximitySensor = self->_proximitySensor;
  if (proximitySensor)
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    v7 = (MNRouteProximitySensor *)objc_msgSend(objc_alloc((Class)MNRouteProximitySensor), "initWithRoute:", v4);
    v8 = self->_proximitySensor;
    self->_proximitySensor = v7;

    -[MNRouteProximitySensor setProximityThreshold:](self->_proximitySensor, "setProximityThreshold:", GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterFarThresholdInMeters, off_1014B3538));
    proximitySensor = self->_proximitySensor;
  }
  v9 = proximitySensor;

  return v9;
}

- (RouteCollection)currentRouteCollection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRouteCollection"));

  return (RouteCollection *)v3;
}

- (void)setSession:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_session);

  if (WeakRetained != v4)
  {
    v6 = objc_loadWeakRetained((id *)&self->_session);
    objc_msgSend(v6, "removeObserver:", self);
    objc_storeWeak((id *)&self->_session, v4);
    self->_performedInitialRefresh = 0;
    objc_msgSend(v4, "addObserver:", self);
    v7 = sub_100404DC8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = 138412546;
      v10 = v6;
      v11 = 2112;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "session did change from %@ to %@", (uint8_t *)&v9, 0x16u);
    }

    -[RoutePlanningUpdater _updateRefreshStateWithError:](self, "_updateRefreshStateWithError:", 0);
  }

}

- (void)setPause:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  if (self->_pause != a3)
  {
    v3 = a3;
    v5 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "pause did change to %d", (uint8_t *)v7, 8u);
    }

    self->_pause = v3;
    if (v3)
      -[RoutePlanningUpdater setUpdatingRoute:](self, "setUpdatingRoute:", 0);
  }
}

- (void)platformController:(id)a3 willChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;

  v6 = a5;
  v7 = objc_opt_class(RoutePlanningSession);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
  v10 = v9;
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v9, "setDelegate:", self);
  else
    objc_msgSend(v9, "removeDelegate:", self);

}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  void *v31;
  uint8_t buf[16];

  v7 = a4;
  v8 = a5;
  v9 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;
  -[RoutePlanningUpdater setSession:](self, "setSession:", v11);

  v12 = v7;
  v13 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    v14 = v12;
  else
    v14 = 0;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
  if (v16)
  {
    if (v15)
    {
      if (objc_msgSend(v15, "guidanceType") == (id)2 && objc_msgSend(v15, "currentTransportType") == (id)2)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentRouteCollection"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "currentRoute"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uniqueRouteID"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "UUIDString"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRouteCollection"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentRoute"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uniqueRouteID"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "UUIDString"));
        v28 = objc_msgSend(v17, "isEqualToString:", v22);

        if ((v28 & 1) == 0)
        {
          v23 = sub_100404DC8();
          v24 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Detected coming back from pedestrian navigation in route preview mode with different routes; updating routes now",
              buf,
              2u);
          }

          v25 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentRouteCollection"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v26));
          objc_msgSend(v25, "updateRouteCollectionResult:forTransportType:", v27, objc_msgSend(v15, "currentTransportType"));

        }
      }
    }
  }

}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  -[RoutePlanningUpdater setPause:](self, "setPause:", a4 == 2);
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "error", a3));
  -[RoutePlanningUpdater _updateRefreshStateWithError:](self, "_updateRefreshStateWithError:", v5);

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "error", a3));
  -[RoutePlanningUpdater _updateRefreshStateWithError:](self, "_updateRefreshStateWithError:", v6);

}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  -[RoutePlanningUpdater _updateRefreshStateWithError:](self, "_updateRefreshStateWithError:", 0, a4, a5);
  if (-[RoutePlanningUpdater shouldRefreshRoutesForCurrentLocation](self, "shouldRefreshRoutesForCurrentLocation"))
    -[RoutePlanningUpdater refreshRoutesForced:](self, "refreshRoutesForced:", 1);
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double Double;
  id v16;
  void *v17;
  double v18;
  void *v19;
  unsigned int v20;
  double v21;
  id v22;
  NSObject *v23;
  id v24;
  void *v25;
  NSDate *lastRefreshTime;
  double v27;
  id v28;
  NSObject *v29;
  double v30;
  _QWORD v31[5];
  id v32;
  id location;
  uint8_t buf[4];
  double v35;
  __int16 v36;
  double v37;

  v4 = a3;
  if ((GEOConfigGetBOOL(MapsConfig_RoutePlanningUpdaterEnableRouteUpdating, off_1014B3578) & 1) == 0)
  {
    v7 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "The route planning geo default is not enabled; will not update route",
        buf,
        2u);
    }
    goto LABEL_8;
  }
  if (-[RoutePlanningUpdater isUpdatingRoute](self, "isUpdatingRoute"))
  {
    v5 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "A route update is already in progress; will not update route",
        buf,
        2u);
    }
LABEL_8:

    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));

  if (!v8)
  {
    v11 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "We don't know what the user's current location is; will not update route",
        buf,
        2u);
    }
    goto LABEL_8;
  }
  if (objc_msgSend(v4, "isLastLocationStale"))
  {
    v9 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation")));
      *(_DWORD *)buf = 138412290;
      v35 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "The user's current location is stale (%@); will not update route",
        buf,
        0xCu);

    }
    goto LABEL_8;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));
  objc_msgSend(v12, "horizontalAccuracy");
  v14 = v13;
  Double = GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterHighQualityAccuracyLimit, off_1014B3558);

  if (v14 > Double)
  {
    v16 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));
      objc_msgSend(v17, "horizontalAccuracy");
      *(_DWORD *)buf = 134218240;
      v35 = v18;
      v36 = 2048;
      v37 = GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterHighQualityAccuracyLimit, off_1014B3558);
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "The current location's horizontal accuracy (%f) is bigger than the threshold (%f); will not update route",
        buf,
        0x16u);

    }
    goto LABEL_8;
  }
  if (-[RoutePlanningUpdater shouldRefreshRoutesForLocationManagerUpdate](self, "shouldRefreshRoutesForLocationManagerUpdate"))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentLocation"));
    v20 = -[RoutePlanningUpdater shouldRefreshRoutesForUserLocation:](self, "shouldRefreshRoutesForUserLocation:", v19);

    if (v20)
    {
      v21 = GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterRouteFrequencyLimit, off_1014B3568);
      objc_initWeak(&location, self);
      v22 = sub_100404DC8();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v35 = v21;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Starting off route refresh timer with refresh interval: %f", buf, 0xCu);
      }

      v24 = &_dispatch_main_q;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100405990;
      v31[3] = &unk_1011B0FF8;
      objc_copyWeak(&v32, &location);
      v31[4] = self;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v31, v21));
      -[RoutePlanningUpdater setOffRouteRefreshTimer:](self, "setOffRouteRefreshTimer:", v25);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
  lastRefreshTime = self->_lastRefreshTime;
  if (lastRefreshTime)
  {
    -[NSDate timeIntervalSinceNow](lastRefreshTime, "timeIntervalSinceNow");
    if (GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterETAFrequencyLimit, off_1014B3598) < -v27)
    {
      v28 = sub_100404DC8();
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        v30 = GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterETAFrequencyLimit, off_1014B3598);
        *(_DWORD *)buf = 134217984;
        v35 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Route planning update frequency limit has been reached (%f); will refresh route now",
          buf,
          0xCu);
      }

      -[RoutePlanningUpdater refreshRoutesForced:](self, "refreshRoutesForced:", 0);
    }
  }
LABEL_9:

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 1;
}

- (BOOL)shouldRefreshRoutesForLocationManagerUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v13;
  NSObject *v14;
  uint8_t v15[16];

  if (GEOConfigGetBOOL(MapsConfig_RoutePlanningUpdaterEnableRouteUpdating, off_1014B3578))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater currentRouteCollection](self, "currentRouteCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentRoute"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "origin"));
    v7 = objc_msgSend(v6, "isCurrentLocation");

    if ((v7 & 1) != 0)
    {
      v8 = objc_msgSend(v3, "currentTransportType");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater eligibleTransportTypes](self, "eligibleTransportTypes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v8));
      v11 = objc_msgSend(v9, "containsObject:", v10);

      return v11;
    }
    v13 = sub_100404DC8();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Route origin is not the user's current location; should not refresh routes",
        v15,
        2u);
    }

  }
  return 0;
}

- (BOOL)shouldRefreshRoutesForCurrentLocation
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  BOOL v9;

  if (!GEOConfigGetBOOL(MapsConfig_RoutePlanningUpdaterEnableRouteUpdating, off_1014B3578))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater currentRouteCollection](self, "currentRouteCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentRoute"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = objc_msgSend(v5, "isCurrentLocation");

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentLocation"));
  v9 = -[RoutePlanningUpdater shouldRefreshRoutesForUserLocation:](self, "shouldRefreshRoutesForUserLocation:", v8);

  return v9;
}

- (BOOL)shouldRefreshRoutesForUserLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  const char *v14;
  int v16;
  id v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater proximitySensor](self, "proximitySensor"));
  objc_msgSend(v5, "updateForLocation:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater proximitySensor](self, "proximitySensor"));
  v7 = objc_msgSend(v6, "proximity");

  v8 = sub_100404DC8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v16 = 134217984;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Got proximity from route: %lu", (uint8_t *)&v16, 0xCu);
  }

  v10 = sub_100404DC8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if ((unint64_t)v7 > 1)
  {
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
      v16 = 138412290;
      v17 = v13;
      v14 = "Route proximity is NOT far nor unknown (%@); NOT scheduling route update";
      goto LABEL_8;
    }
  }
  else if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v7));
    v16 = 138412290;
    v17 = v13;
    v14 = "Route proximity is far or unknown (%@); scheduling route update";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v14, (uint8_t *)&v16, 0xCu);

  }
  return (unint64_t)v7 < 2;
}

- (void)_updateRefreshStateWithError:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *lastRefreshTime;
  char BOOL;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  -[RoutePlanningUpdater setProximitySensor:](self, "setProximitySensor:", 0);
  -[RoutePlanningUpdater setUpdatingRoute:](self, "setUpdatingRoute:", 0);
  -[RoutePlanningUpdater setOffRouteRefreshTimer:](self, "setOffRouteRefreshTimer:", 0);
  -[RoutePlanningUpdater setPeriodicRouteRefreshTimer:](self, "setPeriodicRouteRefreshTimer:", 0);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  lastRefreshTime = self->_lastRefreshTime;
  self->_lastRefreshTime = v5;

  BOOL = GEOConfigGetBOOL(MapsConfig_RoutePlanningUpdaterShouldRetryOnError, off_1014B4DD8);
  if (v4 && (BOOL & 1) != 0
    || -[RoutePlanningUpdater shouldRefreshRoutesForLocationManagerUpdate](self, "shouldRefreshRoutesForLocationManagerUpdate"))
  {
    v8 = sub_100404DC8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "updating route state to enable updates", buf, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v10, "listenForLocationUpdates:", self);

    -[RoutePlanningUpdater _preparePeriodicRouteRefreshTimerWithError:](self, "_preparePeriodicRouteRefreshTimerWithError:", v4);
  }
  else
  {
    v11 = sub_100404DC8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "updating route state to disable updates", v14, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    objc_msgSend(v13, "stopListeningForLocationUpdates:", self);

  }
}

- (void)_preparePeriodicRouteRefreshTimerWithError:(id)a3
{
  id v4;
  uint64_t *v5;
  _QWORD *v6;
  double Double;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  id v18;

  v4 = a3;
  if (GEOConfigGetBOOL(MapsConfig_RoutePlanningUpdaterEnableETAUpdating, off_1014B3588))
  {
    objc_initWeak(&location, self);
    if (v4)
      v5 = (uint64_t *)&MapsConfig_RoutePlanningUpdaterErrorRetryTimeInterval;
    else
      v5 = &MapsConfig_RoutePlanningUpdaterETAFrequencyLimit;
    v6 = &off_1014B3598;
    if (v4)
      v6 = &off_1014B4DE8;
    Double = GEOConfigGetDouble(*v5, *v6);
    v8 = sub_100404DC8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349314;
      v16 = Double;
      v17 = 2114;
      v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Scheduling route refresh in %{public}f, error: %{public}@", buf, 0x16u);
    }

    v10 = &_dispatch_main_q;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100406110;
    v12[3] = &unk_1011B53F8;
    v12[4] = self;
    objc_copyWeak(&v13, &location);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[GCDTimer scheduledTimerWithTimeInterval:queue:block:](GCDTimer, "scheduledTimerWithTimeInterval:queue:block:", &_dispatch_main_q, v12, Double));
    -[RoutePlanningUpdater setPeriodicRouteRefreshTimer:](self, "setPeriodicRouteRefreshTimer:", v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (void)_mapsForegrounded
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater periodicRouteRefreshTimer](self, "periodicRouteRefreshTimer"));
  if (v3)
  {

  }
  else if (-[RoutePlanningUpdater shouldRefreshRoutesForLocationManagerUpdate](self, "shouldRefreshRoutesForLocationManagerUpdate"))
  {
    v4 = sub_100404DC8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Enabling periodicRouteRefreshTimer", v6, 2u);
    }

    -[RoutePlanningUpdater _preparePeriodicRouteRefreshTimerWithError:](self, "_preparePeriodicRouteRefreshTimerWithError:", 0);
  }
}

- (void)_mapsBackgrounded
{
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater periodicRouteRefreshTimer](self, "periodicRouteRefreshTimer"));

  if (v3)
  {
    v4 = sub_100404DC8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Disabling periodicRouteRefreshTimer", v6, 2u);
    }

    -[RoutePlanningUpdater setPeriodicRouteRefreshTimer:](self, "setPeriodicRouteRefreshTimer:", 0);
  }
}

- (void)_vlfSessionDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  id v23;
  NSObject *v24;
  char *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  v4 = a3;
  if ((GEOConfigGetBOOL(MapsConfig_VLFSessionReloadRouteOnSuccess, off_1014B3C78) & 1) != 0)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
    v6 = objc_opt_class(VLFSession);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
      if (v9
        && (v10 = -[NSObject wasLastLocalizationSuccessful](v8, "wasLastLocalizationSuccessful"),
            v9,
            v10))
      {
        v11 = sub_100404DC8();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Detected VLF localized during route planning; waiting for another location update before force refreshing routes",
            buf,
            2u);
        }

        objc_initWeak((id *)buf, self);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10040674C;
        v26[3] = &unk_1011B5420;
        objc_copyWeak(&v27, (id *)buf);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "singleLocationUpdateWithHandler:", v26));
        objc_msgSend(v14, "start");

        objc_destroyWeak(&v27);
        objc_destroyWeak((id *)buf);
      }
      else if (-[NSObject wasLastLocalizationSuccessful](v8, "wasLastLocalizationSuccessful"))
      {
        v16 = sub_100404DC8();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "VLF localized outside of route planning; ignoring",
            buf,
            2u);
        }

      }
    }
    else
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v29 = "-[RoutePlanningUpdater _vlfSessionDidStop:]";
        v30 = 2080;
        v31 = "RoutePlanningUpdater.m";
        v32 = 1024;
        v33 = 345;
        v34 = 2080;
        v35 = "vlfSession != nil";
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
          v29 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
      v23 = sub_100404DC8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
        *(_DWORD *)buf = 138412290;
        v29 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Expected notification object to be a VLFSession and it wasn't: %@", buf, 0xCu);

      }
      v5 = 0;
    }
  }
  else
  {
    v15 = sub_100404DC8();
    v5 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "VLF ended but the geo default to reload routes was off; ignoring",
        buf,
        2u);
    }
  }

}

- (void)refreshRoutesForced:(BOOL)a3
{
  id v5;
  NSObject *v6;
  const char *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  id v19;
  NSObject *v20;
  id v21;
  NSDate *v22;
  NSDate *lastRefreshTime;
  int v24;
  double v25;

  if (-[RoutePlanningUpdater isPaused](self, "isPaused"))
  {
    v5 = sub_100404DC8();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v24) = 0;
      v7 = "Skipping route update, route planning is paused";
LABEL_18:
      v13 = v6;
      v14 = OS_LOG_TYPE_INFO;
      goto LABEL_19;
    }
  }
  else
  {
    -[NSDate timeIntervalSinceNow](self->_lastRefreshTime, "timeIntervalSinceNow");
    v9 = v8;
    -[NSDate timeIntervalSinceNow](self->_lastRefreshTime, "timeIntervalSinceNow");
    if (v9 >= 0.0)
      v11 = v10;
    else
      v11 = -v10;
    if (a3
      || !self->_lastRefreshTime
      || v11 >= GEOConfigGetDouble(MapsConfig_RoutePlanningUpdaterThresholdInSeconds, off_1014B3548))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
      v17 = objc_msgSend(v16, "isNetworkReachable");

      if ((v17 & 1) != 0)
      {
        v18 = -[RoutePlanningUpdater isUpdatingRoute](self, "isUpdatingRoute");
        v19 = sub_100404DC8();
        v20 = objc_claimAutoreleasedReturnValue(v19);
        v6 = v20;
        if ((v18 & 1) != 0)
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            LOWORD(v24) = 0;
            v7 = "An existing route request is in progress; ignoring";
            v13 = v6;
            v14 = OS_LOG_TYPE_DEBUG;
LABEL_19:
            v15 = 2;
            goto LABEL_20;
          }
        }
        else
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            LOWORD(v24) = 0;
            _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "requesting route update", (uint8_t *)&v24, 2u);
          }

          v22 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
          lastRefreshTime = self->_lastRefreshTime;
          self->_lastRefreshTime = v22;

          self->_performedInitialRefresh = 1;
          -[RoutePlanningUpdater setUpdatingRoute:](self, "setUpdatingRoute:", 1);
          v6 = objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
          -[NSObject requestUpdatedRouteWithRefreshedOrigin:](v6, "requestUpdatedRouteWithRefreshedOrigin:", 1);
        }
      }
      else
      {
        v21 = sub_100404DC8();
        v6 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          v7 = "Skipping route update, device cannot reach network";
          goto LABEL_18;
        }
      }
    }
    else
    {
      v12 = sub_100404DC8();
      v6 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v24 = 134217984;
        v25 = v11;
        v7 = "Skipping route update, last refresh happened (%f) seconds ago";
        v13 = v6;
        v14 = OS_LOG_TYPE_INFO;
        v15 = 12;
LABEL_20:
        _os_log_impl((void *)&_mh_execute_header, v13, v14, v7, (uint8_t *)&v24, v15);
      }
    }
  }

}

- (void)_networkReachabilityChanged:(id)a3
{
  id v4;
  const char *label;
  const char *v6;
  BOOL v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint8_t v24[8];
  _QWORD v25[5];
  _BYTE buf[24];
  __int128 v27;
  char *v28;
  __int16 v29;
  const char *v30;

  v4 = a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        *(_QWORD *)&buf[4] = "-[RoutePlanningUpdater _networkReachabilityChanged:]";
        *(_WORD *)&buf[12] = 2080;
        *(_QWORD *)&buf[14] = "RoutePlanningUpdater.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v27) = 401;
        WORD2(v27) = 2080;
        *(_QWORD *)((char *)&v27 + 6) = "dispatch_get_main_queue()";
        HIWORD(v27) = 2080;
        v28 = (char *)dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v29 = 2080;
        v30 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          buf,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", GEONetworkObserverReachable));
  v10 = objc_msgSend(v9, "BOOLValue");

  v11 = sub_100404DC8();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = CFSTR("NO");
    if (v10)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v13;
    v14 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Network reachability changed: %@", buf, 0xCu);

  }
  if (v10)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&v27 = sub_100406E88;
    *((_QWORD *)&v27 + 1) = sub_100406E98;
    v28 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater session](self, "session"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "currentRouteCollectionResult"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100406EA4;
    v25[3] = &unk_1011B17D0;
    v25[4] = buf;
    objc_msgSend(v16, "withValue:orError:", &stru_1011B5460, v25);

    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v17 = sub_100404DC8();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Network is now reachable and directions previously failed to load. Retrying.", v24, 2u);
      }

      -[RoutePlanningUpdater refreshRoutesForced:](self, "refreshRoutesForced:", 1);
    }
    _Block_object_dispose(buf, 8);

  }
}

- (void)offlineService:(id)a3 wouldLikeToSwitchToState:(id)a4
{
  unsigned __int8 var0;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  unsigned int v22;
  float v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  unint64_t v35;
  unsigned int v36;
  float v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  unsigned __int8 v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  NSObject *v50;
  uint32_t v51;
  id v52;
  uint64_t v53;
  _BYTE v54[32];
  __int128 v55;

  var0 = a4.var1.var0;
  v6 = a3;
  v7 = v6;
  if (var0 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_session);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "waypointConfiguration"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "origin"));
    v11 = GEOMapPointForCoordinate(objc_msgSend(v10, "coordinate"));
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "destination"));
    v15 = GEOMapPointForCoordinate(objc_msgSend(v14, "coordinate"));
    v17 = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningUpdater currentRouteCollection](self, "currentRouteCollection"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentRoute"));

    if (v19
      && GEOPolylineCoordinateIsValid(objc_msgSend(v19, "startRouteCoordinate"))
      && GEOPolylineCoordinateIsValid(objc_msgSend(v19, "endRouteCoordinate")))
    {
      v20 = objc_msgSend(v19, "startRouteCoordinate");
      v21 = objc_msgSend(v19, "endRouteCoordinate");
      if (GEOPolylineCoordinateIsInvalid(v20))
      {
        v22 = LODWORD(GEOPolylineCoordinateInvalid[0]);
        v23 = GEOPolylineCoordinateInvalid[1];
      }
      else
      {
        v23 = *((float *)&v20 + 1) - floorf(*((float *)&v20 + 1));
        v22 = vcvtms_u32_f32(*((float *)&v20 + 1)) + (_DWORD)v20;
      }
      v35 = v22 | ((unint64_t)LODWORD(v23) << 32);
      if (GEOPolylineCoordinateIsInvalid(v21))
      {
        v36 = LODWORD(GEOPolylineCoordinateInvalid[0]);
        v37 = GEOPolylineCoordinateInvalid[1];
      }
      else
      {
        v37 = *((float *)&v21 + 1) - floorf(*((float *)&v21 + 1));
        v36 = vcvtms_u32_f32(*((float *)&v21 + 1)) + (_DWORD)v21;
      }
      *(_OWORD *)&v54[16] = 0u;
      v55 = 0u;
      v30 = objc_msgSend(v19, "coarseBoundsForRange:", v35, v36 | ((unint64_t)LODWORD(v37) << 32), 0, 0, 0);
      v32.n128_u64[0] = *(_QWORD *)&v54[8];
      v31.n128_u64[0] = *(_QWORD *)v54;
      v33.n128_u64[0] = 0;
      v34.n128_u64[0] = 0;
      goto LABEL_23;
    }
    v24 = NAN;
    v25 = -180.0;
    if (v11 < 0.0
      || v13 < 0.0
      || (v26 = GEOMapRectWorld[2], v11 > v26)
      || (v27 = GEOMapRectWorld[3], v13 > v27)
      || (v24 = NAN, v15 < 0.0)
      || v17 < 0.0
      || v15 > v26)
    {
      v28 = -180.0;
      v29 = NAN;
    }
    else
    {
      v28 = -180.0;
      v29 = NAN;
      if (v17 <= v27)
      {
        *(double *)v54 = v11;
        *(double *)&v54[8] = v13;
        *(double *)&v54[16] = v15;
        *(double *)&v54[24] = v17;
        v30 = (id)GEOMapRectBoundingMapPoints(v54, 2);
LABEL_23:
        v25 = GEOCoordinateRegionForMapRect(v30, v31, v32, v33, v34);
        v28 = v38;
        v24 = v39;
        v29 = v40;
      }
    }
    if (v28 < -180.0
      || v28 > 180.0
      || v25 < -90.0
      || v25 > 90.0
      || v24 < 0.0
      || v24 > 180.0
      || v29 < 0.0
      || v29 > 360.0)
    {
      v52 = sub_100404DC8();
      v44 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v53 = GEOOfflineModeAsString(var0);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v53);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "uniqueRouteID"));
        *(_DWORD *)v54 = 138412802;
        *(_QWORD *)&v54[4] = v46;
        *(_WORD *)&v54[12] = 2112;
        *(_QWORD *)&v54[14] = v48;
        *(_WORD *)&v54[22] = 2112;
        *(_QWORD *)&v54[24] = v9;
        v49 = "GEOOfflineService wouldLikeToSwitchToState to %@, Ignoring for route %@, configuration %@";
        v50 = v44;
        v51 = 32;
        goto LABEL_36;
      }
    }
    else
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[GEOOfflineService shared](GEOOfflineService, "shared"));
      v42 = objc_msgSend(v41, "canUseOfflineForCoordinateRegion:", v25, v28, v24, v29);

      objc_msgSend(v7, "delegate:prefersMode:", self, v42);
      v43 = sub_100404DC8();
      v44 = objc_claimAutoreleasedReturnValue(v43);
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        v45 = GEOOfflineModeAsString(var0);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        v47 = GEOOfflineModeAsString(v42);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        *(_DWORD *)v54 = 138412546;
        *(_QWORD *)&v54[4] = v46;
        *(_WORD *)&v54[12] = 2112;
        *(_QWORD *)&v54[14] = v48;
        v49 = "GEOOfflineService wouldLikeToSwitchToState to %@, RoutePlanningUpdater prefers %@";
        v50 = v44;
        v51 = 22;
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, v49, v54, v51);

      }
    }

    goto LABEL_38;
  }
  objc_msgSend(v6, "delegate:prefersMode:", self, var0);
LABEL_38:

}

- (RoutePlanningSession)session
{
  return (RoutePlanningSession *)objc_loadWeakRetained((id *)&self->_session);
}

- (void)setProximitySensor:(id)a3
{
  objc_storeStrong((id *)&self->_proximitySensor, a3);
}

- (BOOL)isUpdatingRoute
{
  return self->_updatingRoute;
}

- (void)setUpdatingRoute:(BOOL)a3
{
  self->_updatingRoute = a3;
}

- (GCDTimer)offRouteRefreshTimer
{
  return self->_offRouteRefreshTimer;
}

- (void)setOffRouteRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_offRouteRefreshTimer, a3);
}

- (GCDTimer)periodicRouteRefreshTimer
{
  return self->_periodicRouteRefreshTimer;
}

- (void)setPeriodicRouteRefreshTimer:(id)a3
{
  objc_storeStrong((id *)&self->_periodicRouteRefreshTimer, a3);
}

- (BOOL)isPaused
{
  return self->_pause;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_periodicRouteRefreshTimer, 0);
  objc_storeStrong((id *)&self->_offRouteRefreshTimer, 0);
  objc_storeStrong((id *)&self->_proximitySensor, 0);
  objc_destroyWeak((id *)&self->_session);
  objc_storeStrong((id *)&self->_eligibleTransportTypes, 0);
  objc_storeStrong((id *)&self->_lastRefreshTime, 0);
}

@end
