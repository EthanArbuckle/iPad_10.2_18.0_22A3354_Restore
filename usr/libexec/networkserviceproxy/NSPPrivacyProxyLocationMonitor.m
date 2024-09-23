@implementation NSPPrivacyProxyLocationMonitor

+ (id)sharedMonitor
{
  if (qword_100112DB0 != -1)
    dispatch_once(&qword_100112DB0, &stru_1000F53B0);
  return (id)qword_100112DA8;
}

- (NSPPrivacyProxyLocationMonitor)init
{
  NSPPrivacyProxyLocationMonitor *v2;
  NSPPrivacyProxyLocationMonitor *v3;
  NSTimer *locationMonitorTimer;
  SEL v5;
  id v6;
  uint64_t v7;
  void *v8;
  CLLocationManager *v9;
  CLLocationManager *clLocationManager;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  unsigned int v16;
  const char *v17;
  objc_super v19;
  uint8_t buf[4];
  NSPPrivacyProxyLocationMonitor *v21;
  __int16 v22;
  const char *v23;

  v19.receiver = self;
  v19.super_class = (Class)NSPPrivacyProxyLocationMonitor;
  v2 = -[NSPPrivacyProxyLocationMonitor init](&v19, "init");
  v3 = v2;
  if (v2)
  {
    v2->_isMonitoringEnabled = 0;
    locationMonitorTimer = v2->_locationMonitorTimer;
    v2->_locationMonitorTimer = 0;

    objc_setProperty_atomic(v3, v5, 0, 32);
    -[NSPPrivacyProxyLocationMonitor setDelegate:](v3, "setDelegate:", 0);
    -[NSPPrivacyProxyLocationMonitor setMonitorTimeInterval:](v3, "setMonitorTimeInterval:", 1800.0);
    v6 = objc_alloc((Class)CLLocationManager);
    v7 = NPGetInternalQueue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (CLLocationManager *)objc_msgSend(v6, "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/NetworkServiceProxy.framework"), v3, v8);
    clLocationManager = v3->_clLocationManager;
    v3->_clLocationManager = v9;

    v14 = nplog_obj(v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = -[NSPPrivacyProxyLocationMonitor isAuthorized](v3, "isAuthorized");
      v17 = "is not";
      if (v16)
        v17 = "is";
      *(_DWORD *)buf = 138412546;
      v21 = v3;
      v22 = 2080;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%@: networkserviceproxy %s authorized to access location", buf, 0x16u);
    }

    -[CLLocationManager setDesiredAccuracy:](v3->_clLocationManager, "setDesiredAccuracy:", kCLLocationAccuracyReduced);
  }
  return v3;
}

- (id)geohashFromLocation:(id)a3
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;

  if (!a3)
    return 0;
  v3 = a3;
  objc_msgSend(v3, "coordinate");
  v5 = v4;
  objc_msgSend(v3, "coordinate");

  v6 = latitudeLongitudeToGeohash(4, v5);
  return (id)objc_claimAutoreleasedReturnValue(v6);
}

- (void)refreshCountryPlusTimezone:(id)a3
{
  const char *v4;
  uint64_t v5;
  void (**v6)(_QWORD);
  const char *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[5];
  void (**v17)(_QWORD);
  uint8_t buf[4];
  const char *v19;

  v6 = (void (**)(_QWORD))a3;
  if (!v6)
  {
    v15 = nplog_obj(0, v4, v5);
    v9 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v19 = "-[NSPPrivacyProxyLocationMonitor refreshCountryPlusTimezone:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "%s called with null completion", buf, 0xCu);
    }
    goto LABEL_12;
  }
  if (self)
  {
    if (!objc_getProperty(self, v4, 40, 1))
    {
      v8 = objc_getProperty(self, v7, 32, 1);
      if (v8)
      {
        v9 = v8;
        v12 = objc_alloc_init((Class)CLGeocoder);
        if (v12)
        {
          v16[0] = _NSConcreteStackBlock;
          v16[1] = 3221225472;
          v16[2] = sub_1000064F4;
          v16[3] = &unk_1000F53D8;
          v16[4] = self;
          v17 = v6;
          objc_msgSend(v12, "reverseGeocodeLocation:completionHandler:", v9, v16);

        }
        else
        {
          v13 = nplog_obj(0, v10, v11);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to initialize geocoder", buf, 2u);
          }

          v6[2](v6);
        }

LABEL_12:
        goto LABEL_13;
      }
    }
  }
  v6[2](v6);
LABEL_13:

}

- (NSString)currentCountryPlusTimezone
{
  if (self)
    self = (NSPPrivacyProxyLocationMonitor *)objc_getProperty(self, a2, 40, 1);
  return (NSString *)self;
}

- (void)startLocationMonitor
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  double monitorTimeInterval;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  NSPPrivacyProxyLocationMonitor *v13;

  if (self)
  {
    if (self->_isMonitoringEnabled)
    {
      v3 = -[NSPPrivacyProxyLocationMonitor isAuthorized](self, "isAuthorized");
      if (v3 && !self->_locationMonitorTimer)
      {
        v6 = nplog_obj(v3, v4, v5);
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v13 = self;
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%@: starting location monitoring", buf, 0xCu);
        }

        -[CLLocationManager requestLocation](self->_clLocationManager, "requestLocation");
        monitorTimeInterval = self->_monitorTimeInterval;
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_10000686C;
        v11[3] = &unk_1000F5400;
        v11[4] = self;
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer timerWithTimeInterval:repeats:block:](NSTimer, "timerWithTimeInterval:repeats:block:", 1, v11, monitorTimeInterval));
        objc_storeStrong((id *)&self->_locationMonitorTimer, v9);

        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
        objc_msgSend(v10, "addTimer:forMode:", self->_locationMonitorTimer, NSDefaultRunLoopMode);

        -[NSPPrivacyProxyLocationMonitor setUserEventAgentTimer](self, "setUserEventAgentTimer");
      }
    }
  }
}

- (void)start
{
  NSPPrivacyProxyLocationMonitor *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = self;
  if (self)
  {
    self->_isMonitoringEnabled = 1;
    self = (NSPPrivacyProxyLocationMonitor *)self->_clLocationManager;
  }
  -[NSPPrivacyProxyLocationMonitor setDelegate:](self, "setDelegate:", v2);
  objc_opt_self(NSPPrivacyProxyLocationMonitor);
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("NSPLastGeohash"), kCFPreferencesCurrentApplication);
  if (v3 && (v4 = objc_opt_class(NSString), (objc_opt_isKindOfClass(v3, v4) & 1) != 0))
    v5 = v3;
  else
    v5 = 0;

  -[NSPPrivacyProxyLocationMonitor setLastGeohash:](v2, "setLastGeohash:", v5);
  -[NSPPrivacyProxyLocationMonitor startLocationMonitor](v2, "startLocationMonitor");
}

- (void)stopLocationMonitor
{
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  int v6;
  NSPPrivacyProxyLocationMonitor *v7;

  if (self && self->_locationMonitorTimer)
  {
    v4 = nplog_obj(self, a2, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: stopping location monitoring", (uint8_t *)&v6, 0xCu);
    }

    -[NSTimer invalidate](self->_locationMonitorTimer, "invalidate");
    sub_1000062B8((uint64_t)self, 0);
  }
}

- (void)stop
{
  const char *v3;
  SEL v4;

  -[NSPPrivacyProxyLocationMonitor stopLocationMonitor](self, "stopLocationMonitor");
  -[NSPPrivacyProxyLocationMonitor setDelegate:](self, "setDelegate:", 0);
  if (self)
  {
    objc_setProperty_atomic(self, v3, 0, 32);
    -[NSPPrivacyProxyLocationMonitor setLastGeohash:](self, "setLastGeohash:", 0);
    objc_setProperty_atomic(self, v4, 0, 40);
    -[CLLocationManager setDelegate:](self->_clLocationManager, "setDelegate:", 0);
    self->_isMonitoringEnabled = 0;
  }
  else
  {
    objc_msgSend(0, "setLastGeohash:", 0);
    objc_msgSend(0, "setDelegate:", 0);
  }
}

- (BOOL)isCoreWLANAuthorized
{
  return 0;
}

- (BOOL)isAuthorized
{
  return +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/LocationBundles/NetworkServiceProxy.framework"))- 3 < 2;
}

- (void)setMonitorTimeInterval:(double)a3
{
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  int v8;
  NSPPrivacyProxyLocationMonitor *v9;
  __int16 v10;
  double v11;

  if (a3 >= 60.0 && a3 <= 1800.0)
  {
    v6 = nplog_obj(self, a2, v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138412546;
      v9 = self;
      v10 = 2048;
      v11 = a3;
      _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@: location monitoring interval changed to %lf", (uint8_t *)&v8, 0x16u);
    }

    self->_monitorTimeInterval = a3;
    -[NSPPrivacyProxyLocationMonitor stopLocationMonitor](self, "stopLocationMonitor");
    -[NSPPrivacyProxyLocationMonitor startLocationMonitor](self, "startLocationMonitor");
  }
}

- (void)setLastGeohash:(id)a3
{
  objc_storeStrong((id *)&self->_lastGeohash, a3);
}

- (void)setLastCountryPlusTimezone:(id)a3
{
  objc_storeStrong((id *)&self->_latestCountryPlusTimezone, a3);
}

- (void)setUserEventAgentTimer
{
  uint64_t v3;
  NSObject *v4;
  _QWORD v5[6];
  _QWORD v6[5];
  id v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = sub_1000030CC;
  v6[4] = sub_100006D40;
  v7 = (id)os_transaction_create("com.apple.networkserviceproxy.resetUEADates");
  v3 = NPGetInternalQueue(v7);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006D48;
  v5[3] = &unk_1000F5428;
  v5[4] = self;
  v5[5] = v6;
  dispatch_async(v4, v5);

  _Block_object_dispose(v6, 8);
}

- (BOOL)checkSignificantLocationChange:(id)a3
{
  id v4;
  NSString *lastGeohash;
  NSString *v6;
  void *v7;
  unsigned int v8;
  BOOL v9;

  v4 = a3;
  v9 = 0;
  if (self)
  {
    lastGeohash = self->_lastGeohash;
    if (lastGeohash)
    {
      v6 = lastGeohash;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringWithRange:", 0, 2));
      v8 = -[NSString hasPrefix:](v6, "hasPrefix:", v7);

      if (!v8)
        v9 = 1;
    }
  }

  return v9;
}

- (void)handleLocationUpdate:(id)a3
{
  const char *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  NSString *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *v20;
  unsigned int v21;
  uint64_t v22;
  NSObject *v23;
  SEL v24;
  _QWORD v25[5];
  uint8_t buf[4];
  NSPPrivacyProxyLocationMonitor *v27;

  v5 = a3;
  if (self)
    objc_setProperty_atomic(self, v4, v5, 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyLocationMonitor geohashFromLocation:](self, "geohashFromLocation:", v5));
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isEqualToString:", self->_lastGeohash) & 1) == 0)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyLocationMonitor delegate](self, "delegate"));

    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSPPrivacyProxyLocationMonitor delegate](self, "delegate"));
      objc_msgSend(v9, "didUpdateGeohash:", v7);

    }
    v10 = v7;
    objc_opt_self(NSPPrivacyProxyLocationMonitor);
    v11 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    {
      CFPreferencesSetAppValue(CFSTR("NSPLastGeohash"), v10, kCFPreferencesCurrentApplication);
      v12 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
      if (!(_DWORD)v12)
      {
        v15 = nplog_obj(v12, v13, v14);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to store Geohash to preferences", buf, 2u);
        }

      }
    }

    v17 = self->_lastGeohash;
    if (!v17
      || (v20 = v17,
          v21 = -[NSPPrivacyProxyLocationMonitor checkSignificantLocationChange:](self, "checkSignificantLocationChange:", v10), v20, v21))
    {
      v22 = nplog_obj(v17, v18, v19);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%@: location changed significantly", buf, 0xCu);
      }

      objc_setProperty_atomic(self, v24, 0, 40);
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000070A8;
      v25[3] = &unk_1000F5450;
      v25[4] = self;
      -[NSPPrivacyProxyLocationMonitor refreshCountryPlusTimezone:](self, "refreshCountryPlusTimezone:", v25);
    }
    -[NSPPrivacyProxyLocationMonitor setLastGeohash:](self, "setLastGeohash:", v10);
  }

}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  unsigned int v6;
  const char *v7;
  int v8;
  NSPPrivacyProxyLocationMonitor *v9;
  __int16 v10;
  const char *v11;

  v4 = nplog_obj(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = -[NSPPrivacyProxyLocationMonitor isAuthorized](self, "isAuthorized");
    v7 = "unauthorized";
    if (v6)
      v7 = "authorized";
    v8 = 138412546;
    v9 = self;
    v10 = 2080;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: received location authorization status update: [%s]", (uint8_t *)&v8, 0x16u);
  }

  if (-[NSPPrivacyProxyLocationMonitor isAuthorized](self, "isAuthorized"))
    -[NSPPrivacyProxyLocationMonitor startLocationMonitor](self, "startLocationMonitor");
  else
    -[NSPPrivacyProxyLocationMonitor stopLocationMonitor](self, "stopLocationMonitor");
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  NSPPrivacyProxyLocationMonitor *v12;
  __int16 v13;
  void *v14;

  v5 = a4;
  v8 = nplog_obj(v5, v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    v11 = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v10;
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@: failed with error: %@", (uint8_t *)&v11, 0x16u);

  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  NSPPrivacyProxyLocationMonitor *v16;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v10 = nplog_obj(v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%@: received location update", (uint8_t *)&buf, 0xCu);
  }

  if (v7 && objc_msgSend(v7, "count"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v19 = 0x3032000000;
    v20 = sub_1000030CC;
    v21 = sub_100006D40;
    v22 = (id)os_transaction_create("com.apple.networkserviceproxy.didUpdateLocations");
    v12 = NPGetInternalQueue(v22);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100007484;
    block[3] = &unk_1000F5320;
    v15 = v7;
    v16 = self;
    p_buf = &buf;
    dispatch_async(v13, block);

    _Block_object_dispose(&buf, 8);
  }

}

- (NSPPrivacyProxyLocationMonitorDelegate)delegate
{
  return (NSPPrivacyProxyLocationMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastGeohash, 0);
  objc_storeStrong((id *)&self->_locationMonitorTimer, 0);
  objc_storeStrong((id *)&self->_latestCountryPlusTimezone, 0);
  objc_storeStrong((id *)&self->_latestLocation, 0);
  objc_storeStrong((id *)&self->_clLocationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
