@implementation CRNightModeFallbackManager

- (CRNightModeFallbackManager)initWithSessionStatus:(id)a3
{
  id v5;
  CRNightModeFallbackManager *v6;
  CRNightModeFallbackManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRNightModeFallbackManager;
  v6 = -[CRNightModeFallbackManager init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_sessionStatus, a3);
    objc_msgSend(v5, "addSessionObserver:", v7);
  }

  return v7;
}

- (void)setNightMode:(BOOL)a3
{
  unsigned __int8 *p_nightMode;
  _BOOL4 v4;
  uint64_t v6;
  NSObject *v7;

  p_nightMode = (unsigned __int8 *)&self->_nightMode;
  if (self->_nightMode != a3)
  {
    v4 = a3;
    *p_nightMode = a3;
    v6 = CarGeneralLogging(self);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_100068668(p_nightMode, v7);

    notify_set_state(self->_nightModeChangeNotificationToken, v4);
    notify_post("com.apple.private.carkit.fallbackNightModeChanged");
  }
}

- (void)dealloc
{
  objc_super v3;

  -[CRNightModeFallbackManager _stop](self, "_stop");
  v3.receiver = self;
  v3.super_class = (Class)CRNightModeFallbackManager;
  -[CRNightModeFallbackManager dealloc](&v3, "dealloc");
}

- (void)sessionDidConnect:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006604;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)sessionDidDisconnect:(id)a3
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000066A8;
  block[3] = &unk_1000B51B8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "lastObject", a3));
  -[CRNightModeFallbackManager _handleLocationUpdateToLocation:](self, "_handleLocationUpdateToLocation:", v5);

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;

  v4 = a4;
  v5 = CarGeneralLogging(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100068748((uint64_t)v4, v6, v7);

}

- (void)_start
{
  uint64_t v3;
  NSObject *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t state;
  uint64_t v7;
  NSObject *v8;
  GEOAlmanac *v9;
  GEOAlmanac *almanac;
  id v11;
  id v12;
  void *v13;
  id v14;
  CLLocationManager *v15;
  CLLocationManager *locationManager;
  uint64_t state64;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006883C();

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_10000690C, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  notify_register_check("com.apple.private.carkit.fallbackNightModeChanged", &self->_nightModeChangeNotificationToken);
  state64 = 0;
  state = notify_get_state(self->_nightModeChangeNotificationToken, &state64);
  self->_nightMode = state64 != 0;
  v7 = CarGeneralLogging(state);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_1000687B4((unsigned __int8 *)&self->_nightMode, v8);

  v9 = (GEOAlmanac *)objc_alloc_init((Class)GEOAlmanac);
  almanac = self->_almanac;
  self->_almanac = v9;

  v11 = objc_alloc((Class)CLLocationManager);
  v12 = objc_alloc((Class)NSBundle);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle")));
  v14 = objc_msgSend(v12, "initWithURL:", v13);
  v15 = (CLLocationManager *)objc_msgSend(v11, "initWithEffectiveBundle:delegate:onQueue:", v14, self, &_dispatch_main_q);
  locationManager = self->_locationManager;
  self->_locationManager = v15;

  -[CLLocationManager setDesiredAccuracy:](self->_locationManager, "setDesiredAccuracy:", kCLLocationAccuracyThreeKilometers);
  -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
}

- (void)_stop
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;

  -[CRNightModeFallbackManager setAlmanac:](self, "setAlmanac:", 0);
  -[CRNightModeFallbackManager setLocationManager:](self, "setLocationManager:", 0);
  -[CRNightModeFallbackManager setCurrentLocation:](self, "setCurrentLocation:", 0);
  -[CRNightModeFallbackManager setInitialTimerLocation:](self, "setInitialTimerLocation:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager nextNightModeChangeTimer](self, "nextNightModeChangeTimer"));
  objc_msgSend(v3, "invalidate");

  -[CRNightModeFallbackManager setNextNightModeChangeTimer:](self, "setNextNightModeChangeTimer:", 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  notify_cancel(self->_nightModeChangeNotificationToken);
  self->_nightModeChangeNotificationToken = 0;
}

- (BOOL)_isNightForLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager almanac](self, "almanac"));
  objc_msgSend(v4, "coordinate");
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "calculateAstronomicalTimeForLocation:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager almanac](self, "almanac"));
  LOBYTE(v4) = objc_msgSend(v10, "isDayLight") ^ 1;

  return (char)v4;
}

- (void)_updateNightModeForNextSunsetOrSunrise
{
  uint64_t v3;
  NSObject *v4;
  void *v5;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100068868();

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager nextNightModeChangeTimer](self, "nextNightModeChangeTimer"));
  objc_msgSend(v5, "invalidate");

  -[CRNightModeFallbackManager setNextNightModeChangeTimer:](self, "setNextNightModeChangeTimer:", 0);
  -[CRNightModeFallbackManager _updateNightMode](self, "_updateNightMode");
}

- (void)_updateNightMode
{
  void *v3;
  _BOOL8 v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager currentLocation](self, "currentLocation"));
  -[CRNightModeFallbackManager setNightMode:](self, "setNightMode:", -[CRNightModeFallbackManager _isNightForLocation:](self, "_isNightForLocation:", v3));

  v4 = -[CRNightModeFallbackManager _shouldScheduleTimerForNextNightModeChange](self, "_shouldScheduleTimerForNextNightModeChange");
  if (v4)
  {
    v5 = CarGeneralLogging(v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_100068894();

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager nextNightModeChangeTimer](self, "nextNightModeChangeTimer"));
    objc_msgSend(v7, "invalidate");

    -[CRNightModeFallbackManager setNextNightModeChangeTimer:](self, "setNextNightModeChangeTimer:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager currentLocation](self, "currentLocation"));
    -[CRNightModeFallbackManager setInitialTimerLocation:](self, "setInitialTimerLocation:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager _nextNightModeChangeDate](self, "_nextNightModeChangeDate"));
    objc_msgSend(v9, "timeIntervalSinceNow");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_updateNightModeForNextSunsetOrSunrise", 0, 0));
    -[CRNightModeFallbackManager setNextNightModeChangeTimer:](self, "setNextNightModeChangeTimer:", v10);

  }
}

- (void)_handleLocationUpdateToLocation:(id)a3
{
  id v4;
  id v5;
  double v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  id v12;
  double v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "horizontalAccuracy");
  if (v6 < 0.0)
  {
    v7 = CarGeneralLogging(v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      sub_1000688C0();
    goto LABEL_17;
  }
  v8 = objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager currentLocation](self, "currentLocation"));
  v9 = CarGeneralLogging(v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v11)
      sub_100068970();

    v12 = objc_msgSend(v4, "distanceFromLocation:", v8);
    if (v13 < 3000.0)
    {
      v14 = CarGeneralLogging(v12);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_100068944();

      goto LABEL_17;
    }
  }
  else
  {
    if (v11)
      sub_100068918();

  }
  v16 = CarGeneralLogging(v12);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_1000688EC();

  -[CRNightModeFallbackManager setCurrentLocation:](self, "setCurrentLocation:", v4);
  -[CRNightModeFallbackManager _updateNightMode](self, "_updateNightMode");
LABEL_17:

}

- (void)_timeDidChangeSignificantly
{
  uint64_t v3;
  NSObject *v4;
  void *v5;

  v3 = CarGeneralLogging(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_10006899C();

  -[CRNightModeFallbackManager setCurrentLocation:](self, "setCurrentLocation:", 0);
  -[CRNightModeFallbackManager setInitialTimerLocation:](self, "setInitialTimerLocation:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager nextNightModeChangeTimer](self, "nextNightModeChangeTimer"));
  objc_msgSend(v5, "invalidate");

  -[CRNightModeFallbackManager setNextNightModeChangeTimer:](self, "setNextNightModeChangeTimer:", 0);
}

- (BOOL)_shouldScheduleTimerForNextNightModeChange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager currentLocation](self, "currentLocation"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager nextNightModeChangeTimer](self, "nextNightModeChangeTimer"));

  if (!v4)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager initialTimerLocation](self, "initialTimerLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRNightModeFallbackManager currentLocation](self, "currentLocation"));
  objc_msgSend(v5, "distanceFromLocation:", v6);
  v8 = v7 > 100000.0;

  return v8;
}

- (id)_nextNightModeChangeDate
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  uint64_t v30;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAlmanac sunset](self->_almanac, "sunset"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[GEOAlmanac nextSunset](self->_almanac, "nextSunset"));
  v6 = v5;
  if (objc_msgSend(v4, "compare:", v3) == (id)1)
  {
    v6 = v4;

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GEOAlmanac sunrise](self->_almanac, "sunrise"));
  v8 = (id)objc_claimAutoreleasedReturnValue(-[GEOAlmanac nextSunrise](self->_almanac, "nextSunrise"));
  v9 = v8;
  if (objc_msgSend(v7, "compare:", v3) == (id)1)
  {
    v9 = v7;

  }
  v10 = v6;
  v11 = objc_msgSend(v10, "compare:", v9);
  v12 = v10;
  if (v11 == (id)1)
  {
    v12 = v9;

  }
  v13 = CarGeneralLogging(v11);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v12);
    v17 = 138413826;
    v18 = v3;
    v19 = 2112;
    v20 = v4;
    v21 = 2112;
    v22 = v5;
    v23 = 2112;
    v24 = v7;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v12;
    v29 = 2048;
    v30 = v16;
    _os_log_debug_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[NightModeFallback] schedule timer for next sunset or sunrise: now(%@) today's sunset(%@), tmw's sunset(%@), today's sunrise(%@), tmw's sunrise(%@), target(%@), timeInterval=%lf", (uint8_t *)&v17, 0x48u);
  }

  return v12;
}

- (CARSessionStatus)sessionStatus
{
  return self->_sessionStatus;
}

- (void)setSessionStatus:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStatus, a3);
}

- (CLLocation)currentLocation
{
  return self->_currentLocation;
}

- (void)setCurrentLocation:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocation, a3);
}

- (CLLocation)initialTimerLocation
{
  return self->_initialTimerLocation;
}

- (void)setInitialTimerLocation:(id)a3
{
  objc_storeStrong((id *)&self->_initialTimerLocation, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (GEOAlmanac)almanac
{
  return self->_almanac;
}

- (void)setAlmanac:(id)a3
{
  objc_storeStrong((id *)&self->_almanac, a3);
}

- (BOOL)nightMode
{
  return self->_nightMode;
}

- (int)nightModeChangeNotificationToken
{
  return self->_nightModeChangeNotificationToken;
}

- (void)setNightModeChangeNotificationToken:(int)a3
{
  self->_nightModeChangeNotificationToken = a3;
}

- (NSTimer)nextNightModeChangeTimer
{
  return self->_nextNightModeChangeTimer;
}

- (void)setNextNightModeChangeTimer:(id)a3
{
  objc_storeStrong((id *)&self->_nextNightModeChangeTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextNightModeChangeTimer, 0);
  objc_storeStrong((id *)&self->_almanac, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_initialTimerLocation, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_sessionStatus, 0);
}

@end
