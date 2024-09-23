@implementation MapsSunsetSunriseObserver

- (MapsSunsetSunriseObserver)initWithLocationManager:(id)a3 sunsetSunriseCalculator:(id)a4 platformController:(id)a5
{
  return -[MapsSunsetSunriseObserver initWithLocationManager:sunsetSunriseCalculator:platformController:transportTypeSupportProvider:](self, "initWithLocationManager:sunsetSunriseCalculator:platformController:transportTypeSupportProvider:", a3, a4, a5, 0);
}

- (MapsSunsetSunriseObserver)initWithLocationManager:(id)a3 sunsetSunriseCalculator:(id)a4 platformController:(id)a5 transportTypeSupportProvider:(Class)a6
{
  id v11;
  id v12;
  id v13;
  MapsSunsetSunriseObserver *v14;
  id v15;
  NSObject *v16;
  id v17;
  id WeakRetained;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  GEOObserverHashTable *v28;
  GEOObserverHashTable *observers;
  objc_super v31;
  uint8_t buf[4];
  MapsSunsetSunriseObserver *v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v31.receiver = self;
  v31.super_class = (Class)MapsSunsetSunriseObserver;
  v14 = -[MapsSunsetSunriseObserver init](&v31, "init");
  if (v14)
  {
    v15 = sub_100C05BC4();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v14->_locationManager, a3);
    -[MKLocationManager listenForLocationUpdates:](v14->_locationManager, "listenForLocationUpdates:", v14);
    objc_storeStrong((id *)&v14->_sunsetSunriseCalculator, a4);
    v17 = objc_storeWeak((id *)&v14->_platformController, v13);
    objc_msgSend(v13, "addObserver:", v14);

    WeakRetained = objc_loadWeakRetained((id *)&v14->_platformController);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "currentSession"));

    v20 = objc_opt_class(NavigationSession);
    if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0)
      v21 = v19;
    else
      v21 = 0;
    v22 = v21;

    -[MapsSunsetSunriseObserver setNavigationSession:](v14, "setNavigationSession:", v22);
    v23 = objc_loadWeakRetained((id *)&v14->_platformController);
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "currentSession"));

    v25 = objc_opt_class(RoutePlanningSession);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      v26 = v24;
    else
      v26 = 0;
    v27 = v26;

    -[MapsSunsetSunriseObserver setRoutePlanningSession:](v14, "setRoutePlanningSession:", v27);
    objc_storeStrong((id *)&v14->_transportTypeSupportProvider, a6);
    v28 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___MapsSunsetSunriseObservation, &_dispatch_main_q);
    observers = v14->_observers;
    v14->_observers = v28;

    -[MapsSunsetSunriseObserver _calculateState](v14, "_calculateState");
  }

  return v14;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  objc_super v6;
  uint8_t buf[4];
  MapsSunsetSunriseObserver *v8;

  v3 = sub_100C05BC4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  -[MKLocationManager stopListeningForLocationUpdates:](self->_locationManager, "stopListeningForLocationUpdates:", self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_platformController);
  objc_msgSend(WeakRetained, "removeObserver:", self);

  -[NavigationSession removeObserver:](self->_navigationSession, "removeObserver:", self);
  -[RoutePlanningSession removeObserver:](self->_routePlanningSession, "removeObserver:", self);
  v6.receiver = self;
  v6.super_class = (Class)MapsSunsetSunriseObserver;
  -[MapsSunsetSunriseObserver dealloc](&v6, "dealloc");
}

- (void)registerObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  MapsSunsetSunriseObserver *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100C05BC4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Registering observer: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver observers](self, "observers"));
  objc_msgSend(v7, "registerObserver:", v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  MapsSunsetSunriseObserver *v9;
  __int16 v10;
  id v11;

  v4 = a3;
  v5 = sub_100C05BC4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134349314;
    v9 = self;
    v10 = 2112;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}p] Unregistering observer: %@", (uint8_t *)&v8, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver observers](self, "observers"));
  objc_msgSend(v7, "unregisterObserver:", v4);

}

- (void)setNavigationSession:(id)a3
{
  NavigationSession *v5;
  id v6;
  NSObject *v7;
  int v8;
  MapsSunsetSunriseObserver *v9;
  __int16 v10;
  NavigationSession *v11;

  v5 = (NavigationSession *)a3;
  if (self->_navigationSession != v5)
  {
    v6 = sub_100C05BC4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349314;
      v9 = self;
      v10 = 2112;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Got new NavigationSession: %@", (uint8_t *)&v8, 0x16u);
    }

    -[NavigationSession removeObserver:](self->_navigationSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_navigationSession, a3);
    -[NavigationSession addObserver:](self->_navigationSession, "addObserver:", self);
  }

}

- (void)setRoutePlanningSession:(id)a3
{
  RoutePlanningSession *v5;
  id v6;
  NSObject *v7;
  int v8;
  MapsSunsetSunriseObserver *v9;
  __int16 v10;
  RoutePlanningSession *v11;

  v5 = (RoutePlanningSession *)a3;
  if (self->_routePlanningSession != v5)
  {
    v6 = sub_100C05BC4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134349314;
      v9 = self;
      v10 = 2112;
      v11 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Got new RoutePlanningSession: %@", (uint8_t *)&v8, 0x16u);
    }

    -[RoutePlanningSession removeObserver:](self->_routePlanningSession, "removeObserver:", self);
    objc_storeStrong((id *)&self->_routePlanningSession, a3);
    -[RoutePlanningSession addObserver:](self->_routePlanningSession, "addObserver:", self);
  }

}

- (void)setCurrentState:(int64_t)a3
{
  id v4;

  if (self->_currentState != a3)
  {
    self->_currentState = a3;
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver observers](self, "observers"));
    objc_msgSend(v4, "sunsetSunriseObserver:didUpdateState:", self, self->_currentState);

  }
}

- (int64_t)_currentTransportType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver routePlanningSession](self, "routePlanningSession"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver routePlanningSession](self, "routePlanningSession"));
LABEL_5:
    v6 = v4;
    v7 = objc_msgSend(v4, "currentTransportType");

    return (int64_t)v7;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver navigationSession](self, "navigationSession"));

  if (v5)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver navigationSession](self, "navigationSession"));
    goto LABEL_5;
  }
  return 0;
}

- (void)_calculateState
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  id v13;
  NSObject *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  MapsSunsetSunriseObserver *v20;
  __int16 v21;
  const __CFString *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver locationManager](self, "locationManager"));
  v4 = objc_msgSend(v3, "hasLocation");

  v5 = sub_100C05BC4();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[MapsSunsetSunriseObserver offsetThreshold](self, "offsetThreshold");
      v19 = 134349312;
      v20 = self;
      v21 = 2048;
      v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculating sunset/sunrise state with offset threshold: %f", (uint8_t *)&v19, 0x16u);
    }

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver sunsetSunriseCalculator](self, "sunsetSunriseCalculator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver locationManager](self, "locationManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastLocation"));
    -[MapsSunsetSunriseObserver offsetThreshold](self, "offsetThreshold");
    v12 = (char *)objc_msgSend(v9, "currentStateForLocation:offsetThreshold:", v11);

    v13 = sub_100C05BC4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(v12 - 1) > 3)
        v15 = CFSTR("Unknown");
      else
        v15 = off_1011E9198[(_QWORD)(v12 - 1)];
      v19 = 134349314;
      v20 = self;
      v21 = 2112;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}p] Calculated sunset/sunrise state: %@", (uint8_t *)&v19, 0x16u);
    }

    -[MapsSunsetSunriseObserver setCurrentState:](self, "setCurrentState:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    -[MapsSunsetSunriseObserver setLastCheckTime:](self, "setLastCheckTime:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver locationManager](self, "locationManager"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "lastLocation"));
    -[MapsSunsetSunriseObserver setLastCheckLocation:](self, "setLastCheckLocation:", v18);

  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v19 = 134349056;
      v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}p] No location estimate available; cannot calculate sunset/sunrise state",
        (uint8_t *)&v19,
        0xCu);
    }

    -[MapsSunsetSunriseObserver setCurrentState:](self, "setCurrentState:", 0);
    -[MapsSunsetSunriseObserver setLastCheckLocation:](self, "setLastCheckLocation:", 0);
  }
}

- (BOOL)_shouldCalculateState
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  id v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  const __CFString *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  double v31;
  double DistanceCoordinates;
  double v33;
  double v34;
  double v35;
  id v36;
  NSObject *v37;
  __CFString *v38;
  __CFString *v39;
  int v41;
  MapsSunsetSunriseObserver *v42;
  __int16 v43;
  const __CFString *v44;

  v3 = objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver lastCheckLocation](self, "lastCheckLocation"));
  if (v3
    && (v4 = (void *)v3,
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver lastCheckTime](self, "lastCheckTime")),
        v5,
        v4,
        v5))
  {
    if (!-[MapsSunsetSunriseObserver transportTypeSupportProvider](self, "transportTypeSupportProvider"))
    {
LABEL_18:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver lastCheckTime](self, "lastCheckTime"));
      objc_msgSend(v15, "timeIntervalSinceNow");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver lastCheckTime](self, "lastCheckTime"));
      objc_msgSend(v18, "timeIntervalSinceNow");
      v20 = v19;

      v21 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver locationManager](self, "locationManager"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastLocation"));

      -[NSObject coordinate](v11, "coordinate");
      v23 = v22;
      -[NSObject coordinate](v11, "coordinate");
      v25 = v24;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver lastCheckLocation](self, "lastCheckLocation"));
      objc_msgSend(v26, "coordinate");
      v28 = v27;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver lastCheckLocation](self, "lastCheckLocation"));
      v30 = objc_msgSend(v29, "coordinate");
      DistanceCoordinates = CLClientGetDistanceCoordinates(v30, v23, v25, v28, v31);

      -[MapsSunsetSunriseObserver minimumDistanceThreshold](self, "minimumDistanceThreshold");
      if (DistanceCoordinates >= v33)
      {
        v12 = 1;
      }
      else
      {
        if (v17 >= 0.0)
          v34 = v20;
        else
          v34 = -v20;
        -[MapsSunsetSunriseObserver minimumTimeThreshold](self, "minimumTimeThreshold");
        v12 = v34 >= v35;
      }
      v36 = sub_100C05BC4();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = CFSTR("NO");
        if (v12)
          v38 = CFSTR("YES");
        v39 = v38;
        v41 = 134349314;
        v42 = self;
        v43 = 2112;
        v44 = v39;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "[%{public}p] shouldCalculateState %@", (uint8_t *)&v41, 0x16u);

      }
      goto LABEL_29;
    }
    v6 = -[MapsSunsetSunriseObserver _currentTransportType](self, "_currentTransportType");
    if (!v6
      || (-[objc_class isSupportedForTransportType:](-[MapsSunsetSunriseObserver transportTypeSupportProvider](self, "transportTypeSupportProvider"), "isSupportedForTransportType:", v6) & 1) != 0)
    {
      v7 = sub_100C05BC4();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        if ((unint64_t)(v6 - 1) > 4)
          v9 = CFSTR("Undefined");
        else
          v9 = off_1011E91D8[v6 - 1];
        v41 = 134349314;
        v42 = self;
        v43 = 2112;
        v44 = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}p] Current transport type (%@) is supported", (uint8_t *)&v41, 0x16u);
      }

      goto LABEL_18;
    }
    v13 = sub_100C05BC4();
    v11 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if ((unint64_t)(v6 - 2) > 3)
        v14 = CFSTR("Drive");
      else
        v14 = off_1011E91B8[v6 - 2];
      v41 = 134349314;
      v42 = self;
      v43 = 2112;
      v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Current transport type (%@) is NOT supported", (uint8_t *)&v41, 0x16u);
    }
    LOBYTE(v12) = 0;
  }
  else
  {
    v10 = sub_100C05BC4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v41 = 134349056;
      v42 = self;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}p] Initial state check", (uint8_t *)&v41, 0xCu);
    }
    LOBYTE(v12) = 1;
  }
LABEL_29:

  return v12;
}

- (id)_sunset
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver sunsetSunriseCalculator](self, "sunsetSunriseCalculator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver locationManager](self, "locationManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_sunsetForLocation:", v5));

  return v6;
}

- (id)_sunrise
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver sunsetSunriseCalculator](self, "sunsetSunriseCalculator"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSunsetSunriseObserver locationManager](self, "locationManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_sunriseForLocation:", v5));

  return v6;
}

- (void)locationManagerUpdatedLocation:(id)a3
{
  if (-[MapsSunsetSunriseObserver _shouldCalculateState](self, "_shouldCalculateState", a3))
    -[MapsSunsetSunriseObserver _calculateState](self, "_calculateState");
}

- (BOOL)locationManagerShouldPauseLocationUpdates:(id)a3
{
  return 0;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a5;
  v7 = objc_opt_class(NavigationSession);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  -[MapsSunsetSunriseObserver setNavigationSession:](self, "setNavigationSession:", v9);

  v13 = v6;
  v10 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v13, v10) & 1) != 0)
    v11 = v13;
  else
    v11 = 0;
  v12 = v11;

  -[MapsSunsetSunriseObserver setRoutePlanningSession:](self, "setRoutePlanningSession:", v12);
  if (-[MapsSunsetSunriseObserver _shouldCalculateState](self, "_shouldCalculateState"))
    -[MapsSunsetSunriseObserver _calculateState](self, "_calculateState");

}

- (void)navigationSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4
{
  if (-[MapsSunsetSunriseObserver _shouldCalculateState](self, "_shouldCalculateState", a3, a4))
    -[MapsSunsetSunriseObserver _calculateState](self, "_calculateState");
}

- (void)routePlanningSession:(id)a3 didChangeCurrentTransportType:(int64_t)a4 userInitiated:(BOOL)a5
{
  if (-[MapsSunsetSunriseObserver _shouldCalculateState](self, "_shouldCalculateState", a3, a4, a5))
    -[MapsSunsetSunriseObserver _calculateState](self, "_calculateState");
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (double)offsetThreshold
{
  return self->_offsetThreshold;
}

- (void)setOffsetThreshold:(double)a3
{
  self->_offsetThreshold = a3;
}

- (double)minimumTimeThreshold
{
  return self->_minimumTimeThreshold;
}

- (void)setMinimumTimeThreshold:(double)a3
{
  self->_minimumTimeThreshold = a3;
}

- (double)minimumDistanceThreshold
{
  return self->_minimumDistanceThreshold;
}

- (void)setMinimumDistanceThreshold:(double)a3
{
  self->_minimumDistanceThreshold = a3;
}

- (MKLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (SunsetSunriseCalculator)sunsetSunriseCalculator
{
  return self->_sunsetSunriseCalculator;
}

- (void)setSunsetSunriseCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_sunsetSunriseCalculator, a3);
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (Class)transportTypeSupportProvider
{
  return self->_transportTypeSupportProvider;
}

- (void)setTransportTypeSupportProvider:(Class)a3
{
  objc_storeStrong((id *)&self->_transportTypeSupportProvider, a3);
}

- (NavigationSession)navigationSession
{
  return self->_navigationSession;
}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (CLLocation)lastCheckLocation
{
  return self->_lastCheckLocation;
}

- (void)setLastCheckLocation:(id)a3
{
  objc_storeStrong((id *)&self->_lastCheckLocation, a3);
}

- (NSDate)lastCheckTime
{
  return self->_lastCheckTime;
}

- (void)setLastCheckTime:(id)a3
{
  objc_storeStrong((id *)&self->_lastCheckTime, a3);
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lastCheckTime, 0);
  objc_storeStrong((id *)&self->_lastCheckLocation, 0);
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
  objc_storeStrong((id *)&self->_navigationSession, 0);
  objc_storeStrong((id *)&self->_transportTypeSupportProvider, 0);
  objc_destroyWeak((id *)&self->_platformController);
  objc_storeStrong((id *)&self->_sunsetSunriseCalculator, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

@end
