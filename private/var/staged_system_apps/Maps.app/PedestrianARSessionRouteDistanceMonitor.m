@implementation PedestrianARSessionRouteDistanceMonitor

- (PedestrianARSessionRouteDistanceMonitor)initWithObserver:(id)a3 platformController:(id)a4 navigationService:(id)a5 locationManager:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  PedestrianARSessionRouteDistanceMonitor *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  char *v29;
  id v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  id v37;
  NSObject *v38;
  char *v39;
  objc_super v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v25 = sub_1004318FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARSessionRouteDistanceMonitor initWithObserver:platformController:navigationService:locationManager:]";
      v43 = 2080;
      v44 = "PedestrianARSessionRouteDistanceMonitor.m";
      v45 = 1024;
      v46 = 54;
      v47 = 2080;
      v48 = "platformController != nil";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v12)
  {
    v30 = sub_1004318FC();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARSessionRouteDistanceMonitor initWithObserver:platformController:navigationService:locationManager:]";
      v43 = 2080;
      v44 = "PedestrianARSessionRouteDistanceMonitor.m";
      v45 = 1024;
      v46 = 55;
      v47 = 2080;
      v48 = "navigationService != nil";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v32 = sub_1004318FC();
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v34;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  if (!v13)
  {
    v35 = sub_1004318FC();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v42 = "-[PedestrianARSessionRouteDistanceMonitor initWithObserver:platformController:navigationService:locationManager:]";
      v43 = 2080;
      v44 = "PedestrianARSessionRouteDistanceMonitor.m";
      v45 = 1024;
      v46 = 56;
      v47 = 2080;
      v48 = "locationManager != nil";
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100A70734())
    {
      v37 = sub_1004318FC();
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v42 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v40.receiver = self;
  v40.super_class = (Class)PedestrianARSessionRouteDistanceMonitor;
  v14 = -[PedestrianARSessionMonitor initWithObserver:](&v40, "initWithObserver:", v10);
  if (v14)
  {
    v15 = sub_100AD9AC8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v42 = (const char *)v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v17 = objc_storeWeak((id *)&v14->_platformController, v11);
    objc_msgSend(v11, "addObserver:", v14);

    objc_storeWeak((id *)&v14->_locationManager, v13);
    v18 = objc_storeWeak((id *)&v14->_navigationService, v12);
    objc_msgSend(v12, "registerObserver:", v14);

    WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentSession"));

    v21 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
      v22 = v20;
    else
      v22 = 0;
    v23 = v22;

    -[PedestrianARSessionRouteDistanceMonitor setRoutePlanningSession:](v14, "setRoutePlanningSession:", v23);
    -[PedestrianARSessionRouteDistanceMonitor updateState](v14, "updateState");
  }

  return v14;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  id v7;
  objc_super v8;
  uint8_t buf[4];
  PedestrianARSessionRouteDistanceMonitor *v10;

  v3 = sub_100AD9AC8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v10 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_navigationService);
  objc_msgSend(WeakRetained, "unregisterObserver:", self);

  v6 = objc_loadWeakRetained((id *)&self->_locationManager);
  objc_msgSend(v6, "stopListeningForLocationUpdates:", self);

  v7 = objc_loadWeakRetained((id *)&self->_platformController);
  objc_msgSend(v7, "removeObserver:", self);

  v8.receiver = self;
  v8.super_class = (Class)PedestrianARSessionRouteDistanceMonitor;
  -[PedestrianARSessionMonitor dealloc](&v8, "dealloc");
}

- (void)updateState
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  double Double;
  double v17;
  double v18;
  void *v19;
  unint64_t v20;
  id v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  __CFString *v25;
  const char *v26;
  id v27;
  void *v28;
  char *v29;
  const __CFString *v30;
  id v31;
  const char *v32;
  PedestrianARSessionRouteDistanceMonitor *v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  void *v37;
  unsigned int v38;
  void *v39;
  id v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  double v44;
  id v45;
  NSObject *v46;
  _BOOL4 v47;
  PedestrianARSessionRouteDistanceMonitor *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  NSObject *v53;
  id v54;
  uint8_t buf[4];
  PedestrianARSessionRouteDistanceMonitor *v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor routePlanningSession](self, "routePlanningSession"));

  if (!v3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor navigationService](self, "navigationService"));
    v20 = (unint64_t)objc_msgSend(v19, "state");
    if (v20 <= 6 && ((1 << v20) & 0x47) != 0)
    {

      v21 = sub_100AD9AC8();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor navigationService](self, "navigationService"));
      v24 = MNNavigationServiceStateAsString(objc_msgSend(v23, "state"));
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 134349314;
      v56 = self;
      v57 = 2112;
      v58 = *(double *)&v25;
      v26 = "[%{public}p] We are not in route planning nor in a pedestrian AR navigation state (%@); will not interfere w"
            "ith feature availability";
    }
    else
    {

      v35 = sub_100AD9AC8();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349056;
        v56 = self;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "[%{public}p] Checking whether to allow feature during active guidance", buf, 0xCu);
      }

      v37 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor navigationService](self, "navigationService"));
      v38 = objc_msgSend(v37, "navigationTransportType");

      if (v38 == 2)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor navigationService](self, "navigationService"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "lastLocation"));

        if (v9)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeMatch"));
          goto LABEL_8;
        }
        v54 = sub_100AD9AC8();
        v22 = objc_claimAutoreleasedReturnValue(v54);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349056;
          v56 = self;
          v32 = "[%{public}p] We are navigating but do not have a last location estimate; will not interfere with feature availability";
          goto LABEL_21;
        }
LABEL_24:

        v33 = self;
        v34 = 1;
        goto LABEL_25;
      }
      v50 = sub_100AD9AC8();
      v22 = objc_claimAutoreleasedReturnValue(v50);
      if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        goto LABEL_24;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor navigationService](self, "navigationService"));
      v51 = objc_msgSend(v23, "navigationTransportType");
      if (v51 >= 7)
        v25 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v51));
      else
        v25 = off_1011E1F98[(int)v51];
      *(_DWORD *)buf = 134349314;
      v56 = self;
      v57 = 2112;
      v58 = *(double *)&v25;
      v26 = "[%{public}p] We are navigating with a non-walking transport type (%@); will not interfere with feature availability";
    }
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v26, buf, 0x16u);

    goto LABEL_24;
  }
  v4 = sub_100AD9AC8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v56 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}p] Checking whether to allow feature during route planning", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor routePlanningSession](self, "routePlanningSession"));
  v7 = objc_msgSend(v6, "currentTransportType");

  if (v7 != (id)2)
  {
    v27 = sub_100AD9AC8();
    v22 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor routePlanningSession](self, "routePlanningSession"));
      v29 = (char *)objc_msgSend(v28, "currentTransportType");
      if ((unint64_t)(v29 - 1) > 4)
        v30 = CFSTR("Undefined");
      else
        v30 = off_1011E1FD0[(_QWORD)(v29 - 1)];
      *(_DWORD *)buf = 134349314;
      v56 = self;
      v57 = 2112;
      v58 = *(double *)&v30;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}p] We are route planning with a non-walking transport type (%@); will not interfere with feature availability",
        buf,
        0x16u);

    }
    goto LABEL_24;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor locationManager](self, "locationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastLocation"));

  if (!v9)
  {
    v31 = sub_100AD9AC8();
    v22 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v56 = self;
      v32 = "[%{public}p] We are in route planning but do not have a last location estimate; will not interfere with feat"
            "ure availability";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, v32, buf, 0xCu);
      goto LABEL_24;
    }
    goto LABEL_24;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor routePlanningSession](self, "routePlanningSession"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "currentRouteCollection"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentRoute"));

  if (v12)
  {
    v13 = objc_msgSend(objc_alloc((Class)GEOLocation), "initWithCLLocation:", v9);
    v14 = objc_msgSend(objc_alloc((Class)GEORouteMatcher), "initWithRoute:auditToken:", v12, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "matchToRouteWithLocation:", v13));

LABEL_8:
    Double = GEOConfigGetDouble(MapsConfig_PedestrianARSessionRouteDistanceMonitorDistanceOverride, off_1014B55E8);
    if (Double >= 0.0)
    {
      v18 = Double;
      v42 = sub_100AD9AC8();
      v43 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134349312;
        v56 = self;
        v57 = 2048;
        v58 = v18;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "[%{public}p] Using debug overridden distance value: %f", buf, 0x16u);
      }

      goto LABEL_37;
    }
    if (v15)
    {
      objc_msgSend(v15, "distanceFromRoute");
      v18 = v17;
LABEL_37:
      v44 = GEOConfigGetDouble(MapsConfig_PedestrianARSessionRouteDistanceThreshold, off_1014B4758);
      v45 = sub_100AD9AC8();
      v46 = objc_claimAutoreleasedReturnValue(v45);
      v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
      if (v18 >= v44)
      {
        if (v47)
        {
          *(_DWORD *)buf = 134349568;
          v56 = self;
          v57 = 2048;
          v58 = v18;
          v59 = 2048;
          v60 = v44;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[%{public}p] The user is too far from the route (%f >= %f); will not allow the feature to be visible",
            buf,
            0x20u);
        }

        v48 = self;
        v49 = 0;
      }
      else
      {
        if (v47)
        {
          *(_DWORD *)buf = 134349568;
          v56 = self;
          v57 = 2048;
          v58 = v18;
          v59 = 2048;
          v60 = v44;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "[%{public}p] The user is sufficiently close to the route (%f < %f); will allow the feature to be visible",
            buf,
            0x20u);
        }

        v48 = self;
        v49 = 1;
      }
      -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](v48, "setShouldShowPedestrianAR:", v49);

      return;
    }
    v52 = sub_100AD9AC8();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134349056;
      v56 = self;
      _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "[%{public}p] We don't have a route match; will not allow the feature to be visible",
        buf,
        0xCu);
    }

    v33 = self;
    v34 = 0;
LABEL_25:
    -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](v33, "setShouldShowPedestrianAR:", v34);
    return;
  }
  v40 = sub_100AD9AC8();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v56 = self;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%{public}p] We are in route planning but do not have a route; will not interfere with feature availability",
      buf,
      0xCu);
  }

  -[PedestrianARSessionMonitor setShouldShowPedestrianAR:](self, "setShouldShowPedestrianAR:", 1);
}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v4;
  RoutePlanningSession *routePlanningSession;
  RoutePlanningSession *v6;
  RoutePlanningSession *v7;
  void *v8;
  id v9;

  v4 = (RoutePlanningSession *)a3;
  -[RoutePlanningSession removeObserver:](self->_routePlanningSession, "removeObserver:", self);
  routePlanningSession = self->_routePlanningSession;
  self->_routePlanningSession = v4;
  v6 = v4;

  -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
  v7 = self->_routePlanningSession;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor locationManager](self, "locationManager"));
  v9 = v8;
  if (v7)
    objc_msgSend(v8, "listenForLocationUpdates:", self);
  else
    objc_msgSend(v8, "stopListeningForLocationUpdates:", self);

}

+ (BOOL)isEnabled
{
  return 1;
}

- (NSString)debugDescription
{
  id v2;
  void *v3;
  NSString *v4;
  void *v5;

  v2 = objc_msgSend((id)objc_opt_class(self), "friendlyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\nmax distance threshold: %f\n"), v3, GEOConfigGetDouble(MapsConfig_PedestrianARSessionRouteDistanceThreshold, off_1014B4758));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (NSString *)v5;
}

+ (id)friendlyName
{
  return CFSTR("Route Distance Monitor");
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  PedestrianARSessionRouteDistanceMonitor *v9;
  __int16 v10;
  void *v11;

  v4 = a3;
  v5 = sub_100AD9AC8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new location update: %@", (uint8_t *)&v8, 0x16u);

  }
  -[PedestrianARSessionRouteDistanceMonitor updateState](self, "updateState");

}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  int v13;
  PedestrianARSessionRouteDistanceMonitor *v14;
  __int16 v15;
  id v16;

  v6 = a5;
  v7 = sub_100AD9AC8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v13 = 134349314;
    v14 = self;
    v15 = 2112;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Got a new session: %@", (uint8_t *)&v13, 0x16u);
  }

  v9 = v6;
  v10 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  -[PedestrianARSessionRouteDistanceMonitor setRoutePlanningSession:](self, "setRoutePlanningSession:", v12);
  -[PedestrianARSessionRouteDistanceMonitor updateState](self, "updateState");

}

- (void)routePlanningSession:(id)a3 didUpdateRouteCollectionResult:(id)a4 forTransportType:(int64_t)a5
{
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  int v11;
  PedestrianARSessionRouteDistanceMonitor *v12;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PedestrianARSessionRouteDistanceMonitor routePlanningSession](self, "routePlanningSession", a3, a4));
  v8 = objc_msgSend(v7, "currentTransportType");

  if (v8 == (id)a5)
  {
    v9 = sub_100AD9AC8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = 134349056;
      v12 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning updated the route collection for the current transport type", (uint8_t *)&v11, 0xCu);
    }

    -[PedestrianARSessionRouteDistanceMonitor updateState](self, "updateState");
  }
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  id v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  PedestrianARSessionRouteDistanceMonitor *v11;
  __int16 v12;
  const __CFString *v13;

  v7 = sub_100AD9AC8();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    if ((unint64_t)(a4 - 1) > 4)
      v9 = CFSTR("Undefined");
    else
      v9 = off_1011E1FD0[a4 - 1];
    v10 = 134349314;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Route planning updated the current transport type: %@", (uint8_t *)&v10, 0x16u);
  }

  -[PedestrianARSessionRouteDistanceMonitor updateState](self, "updateState");
}

- (MKLocationManager)locationManager
{
  return (MKLocationManager *)objc_loadWeakRetained((id *)&self->_locationManager);
}

- (void)setLocationManager:(id)a3
{
  objc_storeWeak((id *)&self->_locationManager, a3);
}

- (MNNavigationService)navigationService
{
  return (MNNavigationService *)objc_loadWeakRetained((id *)&self->_navigationService);
}

- (void)setNavigationService:(id)a3
{
  objc_storeWeak((id *)&self->_navigationService, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_destroyWeak((id *)&self->_navigationService);
  objc_destroyWeak((id *)&self->_locationManager);
}

@end
