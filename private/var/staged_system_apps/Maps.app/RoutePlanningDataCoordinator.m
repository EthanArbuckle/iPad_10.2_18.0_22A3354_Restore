@implementation RoutePlanningDataCoordinator

- (RoutePlanningDataCoordinator)initWithPlatformController:(id)a3
{
  id v5;
  RoutePlanningDataCoordinator *v6;
  RoutePlanningDataCoordinator *v7;
  uint64_t v8;
  NSHashTable *observers;
  MKMapSize size;
  uint64_t v11;
  RoutePlanningTiming *timing;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  RoutePlanningDataCoordinator *v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  uint8_t v33[128];
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  const char *v41;

  v5 = a3;
  if (!v5)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v35 = "-[RoutePlanningDataCoordinator initWithPlatformController:]";
      v36 = 2080;
      v37 = "RoutePlanningDataCoordinator.m";
      v38 = 1024;
      v39 = 107;
      v40 = 2080;
      v41 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v35 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v32.receiver = self;
  v32.super_class = (Class)RoutePlanningDataCoordinator;
  v6 = -[RoutePlanningDataCoordinator init](&v32, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platformController, a3);
    -[PlatformController addObserver:](v7->_platformController, "addObserver:", v7);
    v8 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    size = MKMapRectNull.size;
    v7->_currentRouteDisplayedMapRect.origin = ($69B62588CC25CB7767350DB9F5F34ADF)MKMapRectNull.origin;
    v7->_currentRouteDisplayedMapRect.size = ($D4775485B13497D55C4F339E01923D43)size;
    v11 = objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming leaveNowTiming](RoutePlanningTiming, "leaveNowTiming"));
    timing = v7->_timing;
    v7->_timing = (RoutePlanningTiming *)v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", &off_101274100);
    objc_msgSend(v14, "addObjectsFromArray:", &off_1012742C8);
    objc_msgSend(v14, "addObjectsFromArray:", &off_101274358);
    objc_msgSend(v14, "addObjectsFromArray:", &off_101273158);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v14;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v7, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), 0, off_1014B9310, (_QWORD)v28);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v17);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v7, "_applicationWillEnterForeground", UIApplicationWillEnterForegroundNotification, 0);

    v21 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", &off_101274100);
  objc_msgSend(v5, "addObjectsFromArray:", &off_1012742C8);
  objc_msgSend(v5, "addObjectsFromArray:", &off_101274358);
  objc_msgSend(v5, "addObjectsFromArray:", &off_101273158);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v4, "removeObserver:forKeyPath:", self, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  v11.receiver = self;
  v11.super_class = (Class)RoutePlanningDataCoordinator;
  -[RoutePlanningDataCoordinator dealloc](&v11, "dealloc");
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  RoutePlanningTiming *v22;
  RoutePlanningTiming *timing;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  int isKindOfClass;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  _BOOL4 v49;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id location;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_class(RideBookingPlanningSession);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;
  v13 = v12;
  -[RoutePlanningDataCoordinator setRideBookingPlanningSession:](self, "setRideBookingPlanningSession:", v13);

  v14 = v10;
  v15 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    v16 = v14;
  else
    v16 = 0;
  v17 = v16;

  -[RoutePlanningDataCoordinator setRoutePlanningSession:](self, "setRoutePlanningSession:", v17);
  v18 = v14;
  v19 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    v20 = v18;
  else
    v20 = 0;
  v21 = v20;

  -[RoutePlanningDataCoordinator setNavigationSession:](self, "setNavigationSession:", v21);
  -[RoutePlanningDataCoordinator setDesiredTransportType:](self, "setDesiredTransportType:", 0);
  if (!v18 || !self->_timing)
  {
    v22 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming leaveNowTiming](RoutePlanningTiming, "leaveNowTiming"));
    timing = self->_timing;
    self->_timing = v22;

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v24)
    -[RoutePlanningDataCoordinator setStashedRoutePlanningSession:](self, "setStashedRoutePlanningSession:", 0);
  v25 = objc_opt_class(RideBookingPlanningSession);
  if ((objc_opt_isKindOfClass(v18, v25) & 1) != 0)
  {
    v26 = objc_opt_class(RideBookingPlanningSession);
    if ((objc_opt_isKindOfClass(v9, v26) & 1) != 0)
    {
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionStack"));
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v57;
        do
        {
          v30 = 0;
          do
          {
            if (*(_QWORD *)v57 != v29)
              objc_enumerationMutation(v27);
            v31 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * (_QWORD)v30);
            v32 = objc_opt_class(RoutePlanningSession);
            if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
              objc_msgSend(v31, "setShortcutIdentifier:", 0);
            v30 = (char *)v30 + 1;
          }
          while (v28 != v30);
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        }
        while (v28);
      }

    }
  }
  -[RoutePlanningDataCoordinator _updateIsEnabled](self, "_updateIsEnabled");
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "chromeViewController"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "contexts"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "lastObject"));
  v36 = objc_opt_class(MapsRouteCreationContext);
  isKindOfClass = objc_opt_isKindOfClass(v35, v36);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator navigationSession](self, "navigationSession"));
  LODWORD(v33) = v38 != 0;

  if (((v33 | isKindOfClass) & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator delegate](self, "delegate"));
    objc_msgSend(v39, "routePlanningDataCoordinator:isEnabled:", self, -[RoutePlanningDataCoordinator isEnabled](self, "isEnabled"));

    -[RoutePlanningDataCoordinator _notifyDidUpdateOriginDestinationWaypointRequest](self, "_notifyDidUpdateOriginDestinationWaypointRequest");
    -[RoutePlanningDataCoordinator updateCurrentRouteDisplayedMapRect:](self, "updateCurrentRouteDisplayedMapRect:", MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
    -[RoutePlanningDataCoordinator _notifyDidUpdateRouteCollection:](self, "_notifyDidUpdateRouteCollection:", v40);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v42 = v41 == 0;

  if (v42)
  {
    v46 = (id)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v46, "unregisterObserver:", self);
  }
  else
  {
    v43 = v9;
    v44 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v43, v44) & 1) != 0)
      v45 = v43;
    else
      v45 = 0;
    v46 = v45;

    if (v46)
    {
      v47 = objc_msgSend(v46, "currentTransportType");
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      v49 = v47 != objc_msgSend(v48, "currentTransportType");

    }
    else
    {
      v49 = 0;
    }
    v50 = objc_opt_class(RideBookingPlanningSession);
    if (((v49 | objc_opt_isKindOfClass(v43, v50)) & 1) != 0)
    {
      -[RoutePlanningDataCoordinator _notifyDidUpdateTransportType](self, "_notifyDidUpdateTransportType");
    }
    else if (v46)
    {
      -[RoutePlanningDataCoordinator _notifyResultRouteCollectionChangeForCurrentTransportType](self, "_notifyResultRouteCollectionChangeForCurrentTransportType");
    }
    objc_initWeak(&location, self);
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v51, "registerObserver:", self);

    v52 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100A4D344;
    v53[3] = &unk_1011AD100;
    objc_copyWeak(&v54, &location);
    objc_msgSend(v52, "virtualGarageGetGarageWithReply:", v53);

    objc_destroyWeak(&v54);
    objc_destroyWeak(&location);
  }

}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession *v7;

  v5 = (RoutePlanningSession *)a3;
  routePlanningSession = self->_routePlanningSession;
  if (routePlanningSession != v5)
  {
    v7 = v5;
    -[RoutePlanningSession removeObserver:](routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setRideBookingPlanningSession:(id)a3
{
  RideBookingPlanningSession *v5;
  RideBookingPlanningSession *rideBookingPlanningSession;
  RideBookingPlanningSession *v7;

  v5 = (RideBookingPlanningSession *)a3;
  rideBookingPlanningSession = self->_rideBookingPlanningSession;
  if (rideBookingPlanningSession != v5)
  {
    v7 = v5;
    -[RideBookingPlanningSession removeObserver:](rideBookingPlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_rideBookingPlanningSession, a3);
    -[RideBookingPlanningSession addObserver:](self->_rideBookingPlanningSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)setNavigationSession:(id)a3
{
  NavigationSession *v5;
  NavigationSession *navigationSession;
  NavigationSession *v7;

  v5 = (NavigationSession *)a3;
  navigationSession = self->_navigationSession;
  if (navigationSession != v5)
  {
    v7 = v5;
    -[NavigationSession removeObserver:](navigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationSession, a3);
    -[NavigationSession addObserver:](self->_navigationSession, "addObserver:", self);
    v5 = v7;
  }

}

- (void)_updateIsEnabled
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator navigationSession](self, "navigationSession"));
      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator navigationSession](self, "navigationSession"));
        v4 = objc_msgSend(v7, "sessionState") == 0;

      }
      else
      {
        v4 = 0;
      }

    }
  }

  if (self->_enabled != v4)
  {
    self->_enabled = v4;
    -[RoutePlanningDataCoordinator _notifyDidUpdateEnabled](self, "_notifyDidUpdateEnabled");
  }
}

- (void)mapsSession:(id)a3 didChangeState:(unint64_t)a4
{
  -[RoutePlanningDataCoordinator _updateIsEnabled](self, "_updateIsEnabled", a3);
  if (a4 == 1)
    -[RoutePlanningDataCoordinator _notifyDidUpdateRequestState:](self, "_notifyDidUpdateRequestState:", -[RoutePlanningDataCoordinator requestState](self, "requestState"));
}

- (void)routePlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A4D798;
  v5[3] = &unk_1011E0950;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A4D7A0;
  v4[3] = &unk_1011B1BE0;
  objc_msgSend(a4, "withValue:orError:", v5, v4);
}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  if (-[RoutePlanningDataCoordinator transportType](self, "transportType", a3, a4) == a5)
    -[RoutePlanningDataCoordinator _notifyResultRouteCollectionChangeForCurrentTransportType](self, "_notifyResultRouteCollectionChangeForCurrentTransportType");
}

- (void)routePlanningSession:(id)a3 didReceiveUpdates:(id)a4 forRoutesResult:(id)a5
{
  _QWORD v5[5];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A4D840;
  v5[3] = &unk_1011B7B30;
  v5[4] = self;
  objc_msgSend(a5, "withValue:orError:", v5, &stru_1011E0970);
}

- (void)routePlanningSession:(id)a3 didUpdateAutomaticSharingContacts:(id)a4
{
  -[RoutePlanningDataCoordinator _notifyDidUpdateAutomaticSharingContacts:](self, "_notifyDidUpdateAutomaticSharingContacts:", a4);
}

- (BOOL)inACustomRouteRegion
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = objc_msgSend(v2, "inACustomRouteRegion");

  return v3;
}

- (void)routePlanningSession:(id)a3 didChangeRouteCreationRegion:(BOOL)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection", a3, a4));
  -[RoutePlanningDataCoordinator _notifyDidUpdateRouteCollection:](self, "_notifyDidUpdateRouteCollection:", v5);

}

- (void)RideBookingPlanningSession:(id)a3 didFinishResolvingWaypointSet:(id)a4
{
  _QWORD v4[5];
  _QWORD v5[5];

  v4[4] = self;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A4D948;
  v5[3] = &unk_1011E0950;
  v5[4] = self;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A4D950;
  v4[3] = &unk_1011B1BE0;
  objc_msgSend(a4, "withValue:orError:", v5, v4);
}

- (void)RideBookingPlanningSession:(id)a3 rideOptionStateDidChange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = a4;
  -[RoutePlanningDataCoordinator _notifyDidUpdateRequestState:](self, "_notifyDidUpdateRequestState:", -[RoutePlanningDataCoordinator requestState](self, "requestState"));
  if (!objc_msgSend(v5, "noRideOptionsAvailable")
    || (objc_msgSend(v5, "loadingAppStoreSuggestions") & 1) == 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v11, "observedRoutePlanningData") & 0x400) != 0)
            objc_msgSend(v11, "routePlanningDataCoordinator:didUpdateRideBookingRideOptionState:", self, v5);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  const char *label;
  const char *v17;
  void *v18;
  _QWORD v19[2];
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  RoutePlanningDataCoordinator *v23;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (off_1014B9310 == a6)
  {
    v13 = &_dispatch_main_q;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v20 = sub_100A4DC1C;
    v21 = &unk_1011AC8B0;
    v22 = v10;
    v23 = self;
    v14 = &_dispatch_main_q;
    v15 = v19;
    label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
    v17 = dispatch_queue_get_label(0);
    if (label == v17 || label && v17 && !strcmp(label, v17))
    {
      v18 = objc_autoreleasePoolPush();
      v20((uint64_t)v15);
      objc_autoreleasePoolPop(v18);
    }
    else
    {
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v15);
    }

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)RoutePlanningDataCoordinator;
    -[RoutePlanningDataCoordinator observeValueForKeyPath:ofObject:change:context:](&v24, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
  }

}

- (void)addObserver:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "observedRoutePlanningData"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observers](self, "observers"));
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observers](self, "observers"));
  objc_msgSend(v5, "removeObject:", v4);

}

- (NSHashTable)observersIfEnabled
{
  void *v3;
  id v4;

  if (-[RoutePlanningDataCoordinator _shouldNotifyObservers](self, "_shouldNotifyObservers"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observers](self, "observers"));
    v4 = objc_msgSend(v3, "copy");

  }
  else
  {
    v4 = 0;
  }
  return (NSHashTable *)v4;
}

- (void)setupDataForObserver:(id)a3
{
  id v4;
  id v5;
  int v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
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
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  int v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;

  v4 = a3;
  v5 = objc_msgSend(v4, "observedRoutePlanningData");
  if (!v5)
    goto LABEL_18;
  v6 = (int)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observers](self, "observers"));
  v8 = objc_msgSend(v7, "containsObject:", v4);

  if ((v8 & 1) == 0)
  {
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v28 = 136315906;
      v29 = "-[RoutePlanningDataCoordinator setupDataForObserver:]";
      v30 = 2080;
      v31 = "RoutePlanningDataCoordinator.m";
      v32 = 1024;
      v33 = 445;
      v34 = 2080;
      v35 = "[self.observers containsObject:observer]";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v28, 0x26u);
    }

    if (sub_100A70734())
    {
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v28 = 138412290;
        v29 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v28, 0xCu);

      }
    }
  }
  if ((v6 & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator originWaypointRequest](self, "originWaypointRequest"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator destinationWaypointRequest](self, "destinationWaypointRequest"));
    objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateOriginWaypointRequest:destinationWaypointRequest:", self, v11, v12);

    if ((v6 & 0x10) == 0)
    {
LABEL_5:
      if ((v6 & 0x20) == 0)
        goto LABEL_6;
      goto LABEL_21;
    }
  }
  else if ((v6 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateTransportType:", self, -[RoutePlanningDataCoordinator transportType](self, "transportType"));
  if ((v6 & 0x20) == 0)
  {
LABEL_6:
    if ((v6 & 0x40) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateRequestState:", self, -[RoutePlanningDataCoordinator requestState](self, "requestState"));
  if ((v6 & 0x40) == 0)
  {
LABEL_7:
    if ((v6 & 0x80) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateRouteCollection:", self, v13);

  if ((v6 & 0x80) == 0)
  {
LABEL_8:
    if ((v6 & 0x10000) == 0)
      goto LABEL_9;
    goto LABEL_24;
  }
LABEL_23:
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator drivePreferences](self, "drivePreferences"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateDrivePreferences:", self, v14);

  if ((v6 & 0x10000) == 0)
  {
LABEL_9:
    if ((v6 & 0x100) == 0)
      goto LABEL_10;
    goto LABEL_25;
  }
LABEL_24:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator walkPreferences](self, "walkPreferences"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateWalkPreferences:", self, v15);

  if ((v6 & 0x100) == 0)
  {
LABEL_10:
    if ((v6 & 0x1000) == 0)
      goto LABEL_11;
    goto LABEL_26;
  }
LABEL_25:
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator transitPreferences](self, "transitPreferences"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateTransitPreferences:", self, v16);

  if ((v6 & 0x1000) == 0)
  {
LABEL_11:
    if ((v6 & 0x2000) == 0)
      goto LABEL_12;
    goto LABEL_27;
  }
LABEL_26:
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator cyclePreferences](self, "cyclePreferences"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateCyclePreferences:", self, v17);

  if ((v6 & 0x2000) == 0)
  {
LABEL_12:
    if ((v6 & 4) == 0)
      goto LABEL_13;
    goto LABEL_28;
  }
LABEL_27:
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator virtualGarage](self, "virtualGarage"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateVirtualGarage:", self, v18);

  if ((v6 & 4) == 0)
  {
LABEL_13:
    if ((v6 & 8) == 0)
      goto LABEL_14;
    goto LABEL_29;
  }
LABEL_28:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator resolvedWaypointSet](self, "resolvedWaypointSet"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateResolvedWaypointSet:", self, v19);

  if ((v6 & 8) == 0)
  {
LABEL_14:
    if ((v6 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_30;
  }
LABEL_29:
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator originName](self, "originName"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator destinationName](self, "destinationName"));
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateOriginName:destinationName:", self, v20, v21);

  if ((v6 & 0x200) == 0)
  {
LABEL_15:
    if ((v6 & 0x4000) == 0)
      goto LABEL_16;
LABEL_31:
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator timing](self, "timing"));
    objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateTiming:", self, v22);

    if ((v6 & 0x20000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_30:
  -[RoutePlanningDataCoordinator currentRouteDisplayedMapRect](self, "currentRouteDisplayedMapRect");
  objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateCurrentRouteDisplayedMapRect:", self);
  if ((v6 & 0x4000) != 0)
    goto LABEL_31;
LABEL_16:
  if ((v6 & 0x20000) != 0)
  {
LABEL_17:
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "automaticSharingContacts"));
    objc_msgSend(v4, "routePlanningDataCoordinator:didUpdateAutomaticSharingContacts:", self, v10);

  }
LABEL_18:

}

- (void)setupDataForCurrentObservers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observers](self, "observers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[RoutePlanningDataCoordinator setupDataForObserver:](self, "setupDataForObserver:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (RouteCollection)routeCollection
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeCollectionForTransportType:", -[RoutePlanningDataCoordinator transportType](self, "transportType")));

  return (RouteCollection *)v4;
}

- (GEOAdvisoriesInfo)advisoriesInfo
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "advisoriesInfo"));

  return (GEOAdvisoriesInfo *)v3;
}

- (GEOComposedRoute)currentRoute
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentRoute"));

  return (GEOComposedRoute *)v3;
}

- ($C79183323B9A0D5602617FF3BE5395AC)currentRouteDisplayedMapRect
{
  double x;
  double y;
  double width;
  double height;
  $C79183323B9A0D5602617FF3BE5395AC result;

  x = self->_currentRouteDisplayedMapRect.origin.x;
  y = self->_currentRouteDisplayedMapRect.origin.y;
  width = self->_currentRouteDisplayedMapRect.size.width;
  height = self->_currentRouteDisplayedMapRect.size.height;
  result.var1.var1 = height;
  result.var1.var0 = width;
  result.var0.var1 = y;
  result.var0.var0 = x;
  return result;
}

- (DrivePreferences)drivePreferences
{
  void *v2;
  void *v3;
  void *v4;
  DrivePreferences *v5;
  DrivePreferences *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "drivePreferences"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [DrivePreferences alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = -[DrivePreferences initWithDefaults:](v6, "initWithDefaults:", v7);

  }
  return v5;
}

- (WalkPreferences)walkPreferences
{
  void *v2;
  void *v3;
  void *v4;
  WalkPreferences *v5;
  WalkPreferences *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "walkPreferences"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [WalkPreferences alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = -[WalkPreferences initWithDefaults:](v6, "initWithDefaults:", v7);

  }
  return v5;
}

- (TransitPreferences)transitPreferences
{
  void *v2;
  void *v3;
  void *v4;
  TransitPreferences *v5;
  TransitPreferences *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "transitPreferences"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [TransitPreferences alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = -[WatchSyncedPreferences initWithDefaults:](v6, "initWithDefaults:", v7);

  }
  return v5;
}

- (GEORouteDisplayHints)displayHints
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator currentRoute](self, "currentRoute"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "displayHints"));

  return (GEORouteDisplayHints *)v3;
}

- (CyclePreferences)cyclePreferences
{
  void *v2;
  void *v3;
  void *v4;
  CyclePreferences *v5;
  CyclePreferences *v6;
  void *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "cyclePreferences"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = [CyclePreferences alloc];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = -[CyclePreferences initWithDefaults:](v6, "initWithDefaults:", v7);

  }
  return v5;
}

- (int64_t)transportType
{
  void *v3;
  void *v4;
  id v5;
  void *v7;
  _BOOL4 v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v5 = objc_msgSend(v4, "currentTransportType");

    return (int64_t)v5;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    v8 = v7 != 0;

    return 4 * v8;
  }
}

- (int64_t)desiredTransportType
{
  int64_t result;

  result = -[RoutePlanningDataCoordinator transportType](self, "transportType");
  if (!result)
    return self->_desiredTransportType;
  return result;
}

- (int64_t)requestState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "requestState");

    return (int64_t)v7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    goto LABEL_5;
  }
  return 0;
}

- (RoutePlanningError)routePlanningError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  RoutePlanningDataCoordinator *v23;
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "resolvedWaypoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mapItemStorage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "resolvedWaypoints"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destination"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mapItemStorage"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routeCollectionResultForTransportType:", -[RoutePlanningDataCoordinator transportType](self, "transportType")));
LABEL_5:
    v14 = (void *)v13;

    goto LABEL_6;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

  if (v14)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rideOptionStateObserverResult"));
    goto LABEL_5;
  }
LABEL_6:
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_100A4EAE4;
  v31 = sub_100A4EAF4;
  v32 = 0;
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_100A4EB00;
  v22 = &unk_1011E09B8;
  v26 = &v27;
  v23 = self;
  v15 = v6;
  v24 = v15;
  v16 = v10;
  v25 = v16;
  objc_msgSend(v14, "withValue:orError:", &stru_1011E0990, &v19);
  if (-[RoutePlanningDataCoordinator disableNotReachableError](self, "disableNotReachableError", v19, v20, v21, v22, v23)&& objc_msgSend((id)v28[5], "errorCode") == (id)16)
  {
    objc_msgSend((id)v28[5], "setErrorCode:", 1);
  }
  v17 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return (RoutePlanningError *)v17;
}

- (NSArray)waypointRequests
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "waypointRequests"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

    if (!v7)
      return (NSArray *)0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originRequest"));
    v11[0] = v5;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "destinationRequest"));
    v11[1] = v9;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));

  }
  return (NSArray *)v6;
}

- (RoutePlanningWaypointRequest)originWaypointRequest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator waypointRequests](self, "waypointRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  return (RoutePlanningWaypointRequest *)v3;
}

- (RoutePlanningWaypointRequest)destinationWaypointRequest
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator waypointRequests](self, "waypointRequests"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastObject"));

  return (RoutePlanningWaypointRequest *)v3;
}

- (WaypointSet)resolvedWaypointSet
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
LABEL_5:
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resolvedWaypoints"));

    return (WaypointSet *)v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    goto LABEL_5;
  }
  return (WaypointSet *)v5;
}

- (RideBookingRideOptionStateObserverProxy)rideOptionStateObserver
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rideOptionStateObserver"));

  return (RideBookingRideOptionStateObserverProxy *)v3;
}

- (NSString)originName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
LABEL_5:
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "originName"));

    return (NSString *)v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    goto LABEL_5;
  }
  return (NSString *)v5;
}

- (NSString)destinationName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
LABEL_5:
    v6 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destinationName"));

    return (NSString *)v5;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    goto LABEL_5;
  }
  return (NSString *)v5;
}

- (void)updateCurrentRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
  v6 = objc_msgSend(v5, "indexOfRoute:", v4);

  -[RoutePlanningDataCoordinator updateCurrentRouteIndex:](self, "updateCurrentRouteIndex:", v6);
}

- (void)updateCurrentRouteIndex:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  char *v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  NSObject *v25;
  char *v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  void *v36;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (!v6)
  {
    v13 = sub_1004318FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ should only be called when a RoutePlanningSession is active"), v16));
      *(_DWORD *)buf = 136316162;
      v28 = "-[RoutePlanningDataCoordinator updateCurrentRouteIndex:]";
      v29 = 2080;
      v30 = "RoutePlanningDataCoordinator.m";
      v31 = 1024;
      v32 = 665;
      v33 = 2080;
      v34 = "self.routePlanningSession != nil";
      v35 = 2112;
      v36 = v17;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v18 = sub_1004318FC();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v28 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
    v9 = objc_msgSend(v8, "count");

    if ((unint64_t)v9 <= a3)
    {
      v21 = sub_1004318FC();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("routeIndex (%lu) is not part of the current routeCollection"), a3));
        *(_DWORD *)buf = 136316162;
        v28 = "-[RoutePlanningDataCoordinator updateCurrentRouteIndex:]";
        v29 = 2080;
        v30 = "RoutePlanningDataCoordinator.m";
        v31 = 1024;
        v32 = 670;
        v33 = 2080;
        v34 = "routeIndex < self.routeCollection.count";
        v35 = 2112;
        v36 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

      }
      if (sub_100A70734())
      {
        v24 = sub_1004318FC();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
    v11 = objc_msgSend(v10, "count");

    if ((unint64_t)v11 > a3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      objc_msgSend(v12, "setSelectedRouteIndex:forTransportType:", a3, -[RoutePlanningDataCoordinator transportType](self, "transportType"));

    }
  }
}

- (void)updateCurrentRouteDisplayedMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  BOOL v8;
  BOOL v9;

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v8 = self->_currentRouteDisplayedMapRect.origin.x == a3.var0.var0
    && self->_currentRouteDisplayedMapRect.origin.y == a3.var0.var1;
  if (!v8
    || (self->_currentRouteDisplayedMapRect.size.width == a3.var1.var0
      ? (v9 = self->_currentRouteDisplayedMapRect.size.height == a3.var1.var1)
      : (v9 = 0),
        !v9))
  {
    -[RoutePlanningDataCoordinator setCurrentRouteDisplayedMapRect:](self, "setCurrentRouteDisplayedMapRect:", a3.var0.var0, a3.var0.var1, a3.var1.var0, a3.var1.var1);
    -[RoutePlanningDataCoordinator _notifyDidUpdateCurrentRouteDisplayedMapRect:](self, "_notifyDidUpdateCurrentRouteDisplayedMapRect:", v6, v5, var0, var1);
  }
}

- (void)updateTransportType:(int64_t)a3
{
  _BOOL4 v5;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  RoutePlanningSessionConfiguration *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  RideBookingPlanningSession *v32;
  void *v33;
  RideBookingPlanningSession *v34;
  void *v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  char *v40;
  RoutePlanningSession *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  char isKindOfClass;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  NSObject *v54;
  void *v55;
  int v56;
  id v57;
  NSObject *v58;
  id v59;
  char *v60;
  void *v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  const char *v65;
  __int16 v66;
  int v67;

  -[RoutePlanningDataCoordinator setDesiredTransportType:](self, "setDesiredTransportType:");
  v5 = sub_10048286C();
  if (a3 != 4 || v5)
    v7 = a3;
  else
    v7 = 1;
  if (v7 != -[RoutePlanningDataCoordinator transportType](self, "transportType"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "waypointRequests"));

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "traits"));
      v13 = objc_msgSend(v12, "copyByIncrementingSessionCounters");

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sessionStack"));
      v16 = sub_10039E080(v15, &stru_1011E09D8);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastObject"));

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
      v20 = objc_msgSend(v19, "isResumingMultipointRoute");

      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "resumeRouteHandle"));

      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "persistentData"));

      v61 = (void *)v10;
      v25 = -[RoutePlanningSessionConfiguration initWithWaypointRequests:traits:existingTiming:isResumingMultipointRoute:resumeRouteHandle:persistentData:]([RoutePlanningSessionConfiguration alloc], "initWithWaypointRequests:traits:existingTiming:isResumingMultipointRoute:resumeRouteHandle:persistentData:", v10, v13, self->_timing, v20, v22, v24);
      if (-[RoutePlanningSessionConfiguration hasTransportType:](v25, "hasTransportType:", v7))
      {
        -[RoutePlanningSessionConfiguration setInitialTransportType:](v25, "setInitialTransportType:", v7);
      }
      else
      {
        v36 = sub_1004318FC();
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v63 = "-[RoutePlanningDataCoordinator updateTransportType:]";
          v64 = 2080;
          v65 = "RoutePlanningDataCoordinator.m";
          v66 = 1024;
          v67 = 716;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
        }

        if (sub_100A70734())
        {
          v38 = sub_1004318FC();
          v39 = objc_claimAutoreleasedReturnValue(v38);
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            v40 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            *(_DWORD *)buf = 138412290;
            v63 = v40;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

          }
        }
      }
      v41 = -[RoutePlanningSession initWithInitiator:configuration:]([RoutePlanningSession alloc], "initWithInitiator:configuration:", 1, v25);
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
      objc_msgSend(v42, "popIfCurrentSession:", v43);

      v44 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "currentSession"));
      v46 = objc_opt_class(RoutePlanningSession);
      isKindOfClass = objc_opt_isKindOfClass(v45, v46);

      v48 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
      v49 = v48;
      if ((isKindOfClass & 1) != 0)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "currentSession"));

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "shortcutIdentifier"));
        -[RoutePlanningSession setShortcutIdentifier:](v41, "setShortcutIdentifier:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
        objc_msgSend(v52, "replaceCurrentSessionWithSession:", v41);

        v49 = v50;
      }
      else
      {
        objc_msgSend(v48, "pushSession:", v41);
      }

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

      if (v26)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "configuration"));
        v29 = v28;
        if (v7 == 4)
        {

          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject traits](v29, "traits"));
          v31 = objc_msgSend(v30, "copyByIncrementingSessionCounters");

          v32 = [RideBookingPlanningSession alloc];
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject waypointRequests](v29, "waypointRequests"));
          v34 = -[RideBookingPlanningSession initWithInitiator:waypointRequests:traits:](v32, "initWithInitiator:waypointRequests:traits:", 1, v33, v31);

          v35 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
          objc_msgSend(v35, "pushSession:", v34);

        }
        else
        {
          v53 = -[NSObject hasTransportType:](v28, "hasTransportType:", v7);

          v54 = objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
          v29 = v54;
          if (v53)
          {
            -[NSObject safelySetCurrentTransportType:](v54, "safelySetCurrentTransportType:", v7);
          }
          else
          {
            v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject configuration](v54, "configuration"));
            v56 = objc_msgSend(v55, "isNavigationTracePlayback");

            if ((v56 & 1) != 0)
              goto LABEL_27;
            v57 = sub_1004318FC();
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 136315650;
              v63 = "-[RoutePlanningDataCoordinator updateTransportType:]";
              v64 = 2080;
              v65 = "RoutePlanningDataCoordinator.m";
              v66 = 1024;
              v67 = 745;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
            }

            if (!sub_100A70734())
              goto LABEL_27;
            v59 = sub_1004318FC();
            v29 = objc_claimAutoreleasedReturnValue(v59);
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              v60 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
              *(_DWORD *)buf = 138412290;
              v63 = v60;
              _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

            }
          }
        }

      }
    }
LABEL_27:
    -[RoutePlanningDataCoordinator _notifyDidUpdateTransportType](self, "_notifyDidUpdateTransportType");
  }
}

- (BOOL)updateTiming:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  RoutePlanningTiming *timing;
  void *v13;
  void *v14;
  int v16;
  RoutePlanningTiming *v17;
  __int16 v18;
  unint64_t v19;

  v5 = a3;
  v6 = self->_timing;
  v7 = (unint64_t)v5;
  if (v7 | v6
    && (v8 = objc_msgSend((id)v6, "isEqual:", v7),
        (id)v7,
        (id)v6,
        (v8 & 1) == 0))
  {
    v10 = sub_100431C0C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      timing = self->_timing;
      v16 = 138412546;
      v17 = timing;
      v18 = 2112;
      v19 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Changing timing from %@ to %@", (uint8_t *)&v16, 0x16u);
    }

    objc_storeStrong((id *)&self->_timing, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator drivePreferences](self, "drivePreferences"));
    -[RoutePlanningDataCoordinator _reloadUsingNewDrivePreferences:](self, "_reloadUsingNewDrivePreferences:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator transitPreferences](self, "transitPreferences"));
    -[RoutePlanningDataCoordinator _reloadUsingNewTransitPreferences:](self, "_reloadUsingNewTransitPreferences:", v14);

    -[RoutePlanningDataCoordinator _notifyDidUpdateTiming](self, "_notifyDidUpdateTiming");
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)updateDrivePreferences:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator drivePreferences](self, "drivePreferences"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "synchronize");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      +[MapsAnalyticStateProvider updateDriveOptionsInformation:](MapsAnalyticStateProvider, "updateDriveOptionsInformation:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator drivePreferences](self, "drivePreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateDrivePreferences:](self, "_notifyDidUpdateDrivePreferences:", v9);

      }
    }
  }
  else
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = "-[RoutePlanningDataCoordinator updateDrivePreferences:]";
      v17 = 2080;
      v18 = "RoutePlanningDataCoordinator.m";
      v19 = 1024;
      v20 = 770;
      v21 = 2080;
      v22 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

      }
    }
  }

}

- (void)updateWalkPreferences:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator walkPreferences](self, "walkPreferences"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "synchronize");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      +[MapsAnalyticStateProvider updateWalkOptionsInformation:](MapsAnalyticStateProvider, "updateWalkOptionsInformation:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator walkPreferences](self, "walkPreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateWalkPreferences:](self, "_notifyDidUpdateWalkPreferences:", v9);

      }
    }
  }
  else
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = "-[RoutePlanningDataCoordinator updateWalkPreferences:]";
      v17 = 2080;
      v18 = "RoutePlanningDataCoordinator.m";
      v19 = 1024;
      v20 = 784;
      v21 = 2080;
      v22 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

      }
    }
  }

}

- (void)_reloadUsingNewDrivePreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RoutePlanningSession *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = a3;
  if (!v4)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315906;
      v24 = "-[RoutePlanningDataCoordinator _reloadUsingNewDrivePreferences:]";
      v25 = 2080;
      v26 = "RoutePlanningDataCoordinator.m";
      v27 = 1024;
      v28 = 798;
      v29 = 2080;
      v30 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v23, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v23 = 138412290;
        v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeLoadingTaskFactory"));

    v9 = objc_opt_class(NavdRouteLoadingTaskFactory);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      if ((id)-[RoutePlanningDataCoordinator transportType](self, "transportType") == (id)1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "factoryByModifyingDrivePreferences:timing:", v4, self->_timing));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waypointRequestResults"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationByModifyingRouteLoadingTaskFactory:andDedupingWaypointRequests:", v10, v13));

        objc_msgSend(v14, "setInitialTransportType:", -[RoutePlanningDataCoordinator transportType](self, "transportType"));
        objc_msgSend(v14, "setInitialRoutesBeingFetchedExternally:", 0);
        v15 = -[RoutePlanningSession initWithInitiator:configuration:]([RoutePlanningSession alloc], "initWithInitiator:configuration:", 1, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
        objc_msgSend(v16, "replaceCurrentSessionWithSession:", v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator drivePreferences](self, "drivePreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateDrivePreferences:](self, "_notifyDidUpdateDrivePreferences:", v17);

      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        objc_msgSend(v10, "purgeRouteCollectionForTransportType:", 1);
      }

    }
  }

}

- (void)_reloadUsingNewWalkPreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RoutePlanningSession *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = a3;
  if (!v4)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315906;
      v24 = "-[RoutePlanningDataCoordinator _reloadUsingNewWalkPreferences:]";
      v25 = 2080;
      v26 = "RoutePlanningDataCoordinator.m";
      v27 = 1024;
      v28 = 825;
      v29 = 2080;
      v30 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v23, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v23 = 138412290;
        v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeLoadingTaskFactory"));

    v9 = objc_opt_class(NavdRouteLoadingTaskFactory);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      if ((id)-[RoutePlanningDataCoordinator transportType](self, "transportType") == (id)2)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "factoryByModifyingWalkPreferences:timing:", v4, self->_timing));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waypointRequestResults"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationByModifyingRouteLoadingTaskFactory:andDedupingWaypointRequests:", v10, v13));

        objc_msgSend(v14, "setInitialTransportType:", -[RoutePlanningDataCoordinator transportType](self, "transportType"));
        objc_msgSend(v14, "setInitialRoutesBeingFetchedExternally:", 0);
        v15 = -[RoutePlanningSession initWithInitiator:configuration:]([RoutePlanningSession alloc], "initWithInitiator:configuration:", 1, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
        objc_msgSend(v16, "replaceCurrentSessionWithSession:", v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator walkPreferences](self, "walkPreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateWalkPreferences:](self, "_notifyDidUpdateWalkPreferences:", v17);

      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        objc_msgSend(v10, "purgeRouteCollectionForTransportType:", 2);
      }

    }
  }

}

- (void)updateTransitPreferences:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = (unint64_t)(id)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator transitPreferences](self, "transitPreferences"));
  v6 = (unint64_t)v4;
  if (v6 | v5)
  {
    v9 = (id)v6;
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    v6 = (unint64_t)v9;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v9, "synchronize");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

      v6 = (unint64_t)v9;
      if (!v8)
      {
        -[RoutePlanningDataCoordinator _notifyDidUpdateTransitPreferences:](self, "_notifyDidUpdateTransitPreferences:", v9);
        v6 = (unint64_t)v9;
      }
    }
  }

}

- (void)updateVirtualGarage:(id)a3
{
  VGVirtualGarage *v4;
  const char *label;
  const char *v6;
  BOOL v7;
  VGVirtualGarage *virtualGarage;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  const char *v25;

  v4 = (VGVirtualGarage *)a3;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v6 = dispatch_queue_get_label(0);
  if (label != v6)
  {
    v7 = !label || v6 == 0;
    if (v7 || strcmp(label, v6))
    {
      v9 = sub_1004318FC();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v14 = 136316418;
        v15 = "-[RoutePlanningDataCoordinator updateVirtualGarage:]";
        v16 = 2080;
        v17 = "RoutePlanningDataCoordinator.m";
        v18 = 1024;
        v19 = 864;
        v20 = 2080;
        v21 = "dispatch_get_main_queue()";
        v22 = 2080;
        v23 = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
        v24 = 2080;
        v25 = dispatch_queue_get_label(0);
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion on queue failed: %s/%s; actual queue: %s",
          (uint8_t *)&v14,
          0x3Au);

      }
      if (sub_100A70734())
      {
        v11 = sub_1004318FC();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v14 = 138412290;
          v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v14, 0xCu);

        }
      }
    }
  }
  virtualGarage = self->_virtualGarage;
  self->_virtualGarage = v4;

  -[RoutePlanningDataCoordinator _notifyDidUpdateVirtualGarage](self, "_notifyDidUpdateVirtualGarage");
}

- (void)updateCyclePreferences:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  char *v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator cyclePreferences](self, "cyclePreferences"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "synchronize");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      +[MapsAnalyticStateProvider updateCycleOptionsInformation:](MapsAnalyticStateProvider, "updateCycleOptionsInformation:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator cyclePreferences](self, "cyclePreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateCyclePreferences:](self, "_notifyDidUpdateCyclePreferences:", v9);

      }
    }
  }
  else
  {
    v10 = sub_1004318FC();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315906;
      v16 = "-[RoutePlanningDataCoordinator updateCyclePreferences:]";
      v17 = 2080;
      v18 = "RoutePlanningDataCoordinator.m";
      v19 = 1024;
      v20 = 871;
      v21 = 2080;
      v22 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v15, 0x26u);
    }

    if (sub_100A70734())
    {
      v12 = sub_1004318FC();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v15 = 138412290;
        v16 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);

      }
    }
  }

}

- (void)_reloadUsingNewCyclePreferences:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  RoutePlanningSession *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  char *v22;
  int v23;
  const char *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const char *v30;

  v4 = a3;
  if (!v4)
  {
    v18 = sub_1004318FC();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315906;
      v24 = "-[RoutePlanningDataCoordinator _reloadUsingNewCyclePreferences:]";
      v25 = 2080;
      v26 = "RoutePlanningDataCoordinator.m";
      v27 = 1024;
      v28 = 885;
      v29 = 2080;
      v30 = "preferences != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", (uint8_t *)&v23, 0x26u);
    }

    if (sub_100A70734())
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v23 = 138412290;
        v24 = v22;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v23, 0xCu);

      }
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "configuration"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeLoadingTaskFactory"));

    v9 = objc_opt_class(NavdRouteLoadingTaskFactory);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      if ((id)-[RoutePlanningDataCoordinator transportType](self, "transportType") == (id)5)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "factoryByModifyingCyclePreferences:timing:", v4, self->_timing));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configuration"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "waypointRequestResults"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configurationByModifyingRouteLoadingTaskFactory:andDedupingWaypointRequests:", v10, v13));

        objc_msgSend(v14, "setInitialTransportType:", -[RoutePlanningDataCoordinator transportType](self, "transportType"));
        objc_msgSend(v14, "setInitialRoutesBeingFetchedExternally:", 0);
        v15 = -[RoutePlanningSession initWithInitiator:configuration:]([RoutePlanningSession alloc], "initWithInitiator:configuration:", 1, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
        objc_msgSend(v16, "replaceCurrentSessionWithSession:", v15);

        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator cyclePreferences](self, "cyclePreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateCyclePreferences:](self, "_notifyDidUpdateCyclePreferences:", v17);

      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        objc_msgSend(v10, "purgeRouteCollectionForTransportType:", 5);
      }

    }
  }

}

- (void)_reloadUsingNewTransitPreferences:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  RoutePlanningSession *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeLoadingTaskFactory"));

    v8 = objc_opt_class(NavdRouteLoadingTaskFactory);
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    {
      if ((id)-[RoutePlanningDataCoordinator transportType](self, "transportType") == (id)3)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "factoryByModifyingTransitPreferences:timing:", v17, self->_timing));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "configuration"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "waypointRequestResults"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "configurationByModifyingRouteLoadingTaskFactory:andDedupingWaypointRequests:", v9, v12));

        objc_msgSend(v13, "setInitialTransportType:", -[RoutePlanningDataCoordinator transportType](self, "transportType"));
        objc_msgSend(v13, "setInitialRoutesBeingFetchedExternally:", 0);
        v14 = -[RoutePlanningSession initWithInitiator:configuration:]([RoutePlanningSession alloc], "initWithInitiator:configuration:", 1, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
        objc_msgSend(v15, "replaceCurrentSessionWithSession:", v14);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator transitPreferences](self, "transitPreferences"));
        -[RoutePlanningDataCoordinator _notifyDidUpdateTransitPreferences:](self, "_notifyDidUpdateTransitPreferences:", v16);

      }
      else
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
        objc_msgSend(v9, "purgeRouteCollectionForTransportType:", 3);
      }

    }
  }

}

- (NSUUID)originalHistoryEntryIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuration"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "originalHistoryEntryIdentifier"));

  }
  else
  {
    v6 = 0;
  }
  return (NSUUID *)v6;
}

- (NSArray)automaticSharingContacts
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSArray *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "configuration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "automaticSharingContacts"));
  v5 = v4;
  if (!v4)
    v4 = &__NSArray0__struct;
  v6 = v4;

  return v6;
}

- (void)startWithDirectionItem:(id)a3 traits:(id)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  RoutePlanningSession *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DisableNotReachableErrorInRoutePlanning")));
  -[RoutePlanningDataCoordinator setDisableNotReachableError:](self, "setDisableNotReachableError:", objc_msgSend(v10, "BOOLValue"));

  if (!v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timing"));
    if (!v14)
      goto LABEL_9;
    goto LABEL_8;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithUserInfo:](RoutePlanningTiming, "timingWithUserInfo:", v8));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "timing"));
  v14 = v13;

  if (v14)
LABEL_8:
    objc_storeStrong((id *)&self->_timing, v14);
LABEL_9:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "waypointRequestResults"));
  v17 = sub_1009C26BC(v20, v9, v16, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
  objc_msgSend(v19, "replaceCurrentSessionWithSession:", v18);

}

- (BOOL)canAddStop
{
  void *v3;
  void *v4;
  uint64_t IsEnabled_Maps420;
  uint64_t v6;
  _BOOL4 v7;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  int IsEnabled_Maps182;
  unint64_t UInteger;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A511F4;
    v12[3] = &unk_1011E0A00;
    v12[4] = &v13;
    objc_msgSend(v4, "enumerateRequestsOrWaypointsUsingBlock:", v12);

    IsEnabled_Maps420 = -[RoutePlanningDataCoordinator transportType](self, "transportType");
    v7 = 0;
    switch(IsEnabled_Maps420)
    {
      case 0:
        IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v6);
        if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
        {
          IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
          if ((IsEnabled_Maps420 & 1) == 0)
            goto LABEL_7;
        }
        v7 = 1;
        break;
      case 1:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v6);
        goto LABEL_10;
      case 2:
LABEL_7:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
        goto LABEL_10;
      case 5:
        IsEnabled_Maps182 = MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
LABEL_10:
        v7 = IsEnabled_Maps182;
        break;
      default:
        break;
    }
    UInteger = GEOConfigGetUInteger(MapsConfig_MPRWaypointLimit, off_1014B4858);
    if (v7)
    {
      if (UInteger)
        LOBYTE(v7) = v14[3] < UInteger;
      else
        LOBYTE(v7) = 1;
    }
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (DirectionItem)directionItemForCurrentSession
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
    v5 = objc_claimAutoreleasedReturnValue(+[DirectionItem directionItemWithRoutePlanningSession:](DirectionItem, "directionItemWithRoutePlanningSession:", v4));
LABEL_5:
    v6 = (void *)v5;

    return (DirectionItem *)v6;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    v5 = objc_claimAutoreleasedReturnValue(+[DirectionItem directionItemWithRideBookingSession:](DirectionItem, "directionItemWithRideBookingSession:", v4));
    goto LABEL_5;
  }
  return (DirectionItem *)v6;
}

- (void)refreshRidesharingOptionsIfVisible
{
  void *v3;
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
  __int16 v15;
  const char *v16;

  if ((id)-[RoutePlanningDataCoordinator transportType](self, "transportType") == (id)4
    && sub_10048286C()
    && -[RoutePlanningDataCoordinator isEnabled](self, "isEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"));
    if (!v3)
    {
      v4 = sub_1004318FC();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v9 = 136315906;
        v10 = "-[RoutePlanningDataCoordinator refreshRidesharingOptionsIfVisible]";
        v11 = 2080;
        v12 = "RoutePlanningDataCoordinator.m";
        v13 = 1024;
        v14 = 1010;
        v15 = 2080;
        v16 = "existingSession != nil";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v9, 0x26u);
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
    }
    objc_msgSend(v3, "refresh");

  }
}

- (void)refreshVirtualGarage
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  objc_msgSend(v3, "registerObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100A5155C;
  v5[3] = &unk_1011AD100;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "virtualGarageGetGarageWithReply:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (BOOL)isSuspended
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator stashedRoutePlanningSession](self, "stashedRoutePlanningSession"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator stashedRoutePlanningSession](self, "stashedRoutePlanningSession"));
    v5 = objc_msgSend(v4, "sessionState") == (id)2;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)suspend
{
  uint64_t v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[RoutePlanningDataCoordinator isSuspended](self, "isSuspended");

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      -[RoutePlanningDataCoordinator setStashedRoutePlanningSession:](self, "setStashedRoutePlanningSession:", v6);

      v8 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
      objc_msgSend(v8, "popIfCurrentSession:", v7);

    }
  }
}

- (void)resume
{
  void *v3;
  id v4;

  if (-[RoutePlanningDataCoordinator isSuspended](self, "isSuspended"))
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator stashedRoutePlanningSession](self, "stashedRoutePlanningSession"));
    objc_msgSend(v4, "replaceCurrentSessionWithSession:", v3);

  }
}

- (void)stop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  char *v11;
  int v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routePlanningSession](self, "routePlanningSession"));
  if (v3
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator rideBookingPlanningSession](self, "rideBookingPlanningSession"))) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentSession"));

    if (v5 != v3)
    {
      v7 = sub_1004318FC();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v12 = 136315906;
        v13 = "-[RoutePlanningDataCoordinator stop]";
        v14 = 2080;
        v15 = "RoutePlanningDataCoordinator.m";
        v16 = 1024;
        v17 = 1057;
        v18 = 2080;
        v19 = "self.platformController.currentSession == session";
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v12, 0x26u);
      }

      if (sub_100A70734())
      {
        v9 = sub_1004318FC();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v12 = 138412290;
          v13 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v12, 0xCu);

        }
      }
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator platformController](self, "platformController"));
    objc_msgSend(v6, "clearIfCurrentSession:", v3);

  }
}

- (void)_notifyDidUpdateEnabled
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = -[RoutePlanningDataCoordinator isEnabled](self, "isEnabled");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observers](self, "observers", 0));
  v5 = objc_msgSend(v4, "copy");

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x8000) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didEnable:", self, v3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateRouteCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x40) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateRouteCollection:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateRoutes:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x800) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateRoutes:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateCurrentRouteDisplayedMapRect:(id)a3
{
  double var1;
  double var0;
  double v5;
  double v6;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  var1 = a3.var1.var1;
  var0 = a3.var1.var0;
  v5 = a3.var0.var1;
  v6 = a3.var0.var0;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v13, "observedRoutePlanningData") & 0x200) != 0)
          objc_msgSend(v13, "routePlanningDataCoordinator:didUpdateCurrentRouteDisplayedMapRect:", self, v6, v5, var0, var1);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)_notifyDidUpdateTransportType
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "observedRoutePlanningData") & 0x10) != 0)
          objc_msgSend(v8, "routePlanningDataCoordinator:didUpdateTransportType:", self, -[RoutePlanningDataCoordinator desiredTransportType](self, "desiredTransportType"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[RoutePlanningDataCoordinator _notifyResultRouteCollectionChangeForCurrentTransportType](self, "_notifyResultRouteCollectionChangeForCurrentTransportType");
  -[RoutePlanningDataCoordinator _notifyDidUpdateOriginDestinationNames](self, "_notifyDidUpdateOriginDestinationNames");
}

- (void)_notifyDidUpdateDrivePreferences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x80) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateDrivePreferences:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateWalkPreferences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x10000) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateWalkPreferences:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateTransitPreferences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x100) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateTransitPreferences:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateCyclePreferences:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x1000) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateCyclePreferences:", self, v4);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateVirtualGarage
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "observedRoutePlanningData") & 0x2000) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator virtualGarage](self, "virtualGarage"));
          objc_msgSend(v8, "routePlanningDataCoordinator:didUpdateVirtualGarage:", self, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_notifyDidUpdateRequestState:(int64_t)a3
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "observedRoutePlanningData") & 0x20) != 0)
          objc_msgSend(v10, "routePlanningDataCoordinator:didUpdateRequestState:", self, a3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_notifyDidUpdateOriginDestinationWaypointRequest
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "observedRoutePlanningData") & 1) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator originWaypointRequest](self, "originWaypointRequest"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator destinationWaypointRequest](self, "destinationWaypointRequest"));
          objc_msgSend(v8, "routePlanningDataCoordinator:didUpdateOriginWaypointRequest:destinationWaypointRequest:", self, v9, v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[RoutePlanningDataCoordinator _notifyDidUpdateOriginDestinationNames](self, "_notifyDidUpdateOriginDestinationNames");
}

- (void)_notifyDidUpdateWaypointSet
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  RoutePlanningTiming *timing;
  RoutePlanningTiming *v20;
  void *v21;
  RoutePlanningTiming *v22;
  RoutePlanningTiming *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "observedRoutePlanningData") & 4) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator resolvedWaypointSet](self, "resolvedWaypointSet"));
          objc_msgSend(v8, "routePlanningDataCoordinator:didUpdateResolvedWaypointSet:", self, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v5);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator resolvedWaypointSet](self, "resolvedWaypointSet"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "origin"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "geoMapItem"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "timezone"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator resolvedWaypointSet](self, "resolvedWaypointSet"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "geoMapItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "timezone"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](self->_timing, "arrivalDate"));
  if (v18)
  {
    timing = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming arrivalDate](self->_timing, "arrivalDate"));
    v20 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithArrivalDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithArrivalDate:departureTimeZone:arrivalTimeZone:", timing, v13, v17));
  }
  else
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](self->_timing, "departureDate"));

    if (!v21)
    {
      v23 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithArrivalDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithArrivalDate:departureTimeZone:arrivalTimeZone:", 0, v13, v17));
      timing = self->_timing;
      self->_timing = v23;
      goto LABEL_15;
    }
    timing = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(-[RoutePlanningTiming departureDate](self->_timing, "departureDate"));
    v20 = (RoutePlanningTiming *)objc_claimAutoreleasedReturnValue(+[RoutePlanningTiming timingWithDepartureDate:departureTimeZone:arrivalTimeZone:](RoutePlanningTiming, "timingWithDepartureDate:departureTimeZone:arrivalTimeZone:", timing, v13, v17));
  }
  v22 = self->_timing;
  self->_timing = v20;

LABEL_15:
  -[RoutePlanningDataCoordinator _notifyDidUpdateTiming](self, "_notifyDidUpdateTiming");
  -[RoutePlanningDataCoordinator _notifyDidUpdateOriginDestinationNames](self, "_notifyDidUpdateOriginDestinationNames");

}

- (void)_notifyDidUpdateTiming
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "observedRoutePlanningData") & 0x4000) != 0)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator timing](self, "timing"));
          objc_msgSend(v8, "routePlanningDataCoordinator:didUpdateTiming:", self, v9);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)_notifyDidUpdateOriginDestinationNames
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v4 = objc_msgSend(v3, "copy");

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "observedRoutePlanningData") & 8) != 0)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator originName](self, "originName"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator destinationName](self, "destinationName"));
          objc_msgSend(v9, "routePlanningDataCoordinator:didUpdateOriginName:destinationName:", self, v10, v11);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)_notifyResultRouteCollectionChangeForCurrentTransportType
{
  void *v3;

  -[RoutePlanningDataCoordinator updateCurrentRouteDisplayedMapRect:](self, "updateCurrentRouteDisplayedMapRect:", MKMapRectNull.origin.x, MKMapRectNull.origin.y, MKMapRectNull.size.width, MKMapRectNull.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator routeCollection](self, "routeCollection"));
  -[RoutePlanningDataCoordinator _notifyDidUpdateRouteCollection:](self, "_notifyDidUpdateRouteCollection:", v3);

  -[RoutePlanningDataCoordinator _notifyDidUpdateRequestState:](self, "_notifyDidUpdateRequestState:", -[RoutePlanningDataCoordinator requestState](self, "requestState"));
}

- (void)_notifyDidUpdateAutomaticSharingContacts:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningDataCoordinator observersIfEnabled](self, "observersIfEnabled", 0));
  v6 = objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "observedRoutePlanningData") & 0x20000) != 0)
          objc_msgSend(v11, "routePlanningDataCoordinator:didUpdateAutomaticSharingContacts:", self, v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)_applicationWillEnterForeground
{
  if ((id)-[RoutePlanningDataCoordinator transportType](self, "transportType") == (id)4)
    -[RoutePlanningDataCoordinator refreshRidesharingOptionsIfVisible](self, "refreshRidesharingOptionsIfVisible");
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100A52EF8;
  v4[3] = &unk_1011AC8B0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (RoutePlanningTiming)timing
{
  return self->_timing;
}

- (VGVirtualGarage)virtualGarage
{
  return self->_virtualGarage;
}

- (PlatformController)platformController
{
  return self->_platformController;
}

- (RoutePlanningDataCoordinatorPresentationDelegate)delegate
{
  return (RoutePlanningDataCoordinatorPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (RideBookingPlanningSession)rideBookingPlanningSession
{
  return self->_rideBookingPlanningSession;
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (RoutePlanningSession)stashedRoutePlanningSession
{
  return self->_stashedRoutePlanningSession;
}

- (void)setStashedRoutePlanningSession:(id)a3
{
  objc_storeStrong((id *)&self->_stashedRoutePlanningSession, a3);
}

- (void)setDesiredTransportType:(int64_t)a3
{
  self->_desiredTransportType = a3;
}

- (void)setCurrentRouteDisplayedMapRect:(id)a3
{
  self->_currentRouteDisplayedMapRect = ($99E9129AA7BA404914A9E870D54E0AD8)a3;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (NSDate)routesLastLoadedDate
{
  return self->_routesLastLoadedDate;
}

- (void)setRoutesLastLoadedDate:(id)a3
{
  objc_storeStrong((id *)&self->_routesLastLoadedDate, a3);
}

- (BOOL)disableNotReachableError
{
  return self->_disableNotReachableError;
}

- (void)setDisableNotReachableError:(BOOL)a3
{
  self->_disableNotReachableError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesLastLoadedDate, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stashedRoutePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_rideBookingPlanningSession, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_platformController, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_timing, 0);
}

@end
