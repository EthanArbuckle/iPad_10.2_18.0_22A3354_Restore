@implementation WeatherLocationManager

+ (id)sharedWeatherLocationManager
{
  if (sharedWeatherLocationManager_onceToken != -1)
    dispatch_once(&sharedWeatherLocationManager_onceToken, &__block_literal_global_7);
  return (id)__sharedWeatherLocationManager;
}

void __54__WeatherLocationManager_sharedWeatherLocationManager__block_invoke()
{
  WeatherLocationManager *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [WeatherLocationManager alloc];
  +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[WeatherLocationManager initWithPreferences:](v0, "initWithPreferences:", v3);
  v2 = (void *)__sharedWeatherLocationManager;
  __sharedWeatherLocationManager = v1;

}

+ (void)clearSharedLocationManager
{
  id v2;

  NSStringFromSelector(a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@ is a nop.  Please re-consider how you use this code.  If you need to clear the WeatherLocationManager, you should not use the singleton."), v2);

}

+ (int)locationManagerAuthorizationWithEffectiveBundleId:(id)a3
{
  if (!a3)
    a3 = CFSTR("com.apple.weather");
  return objc_msgSend(MEMORY[0x24BDBFA88], "authorizationStatusForBundleIdentifier:", a3);
}

- (WeatherLocationManager)initWithPreferences:(id)a3
{
  id v4;
  WeatherLocationManager *v5;
  WeatherPreferences *v6;
  WeatherPreferences *preferences;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  unint64_t updateInterval;
  objc_super v19;
  uint8_t buf[4];
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WeatherLocationManager;
  v5 = -[WeatherLocationManager init](&v19, sel_init);
  if (v5)
  {
    if (v4)
    {
      v6 = (WeatherPreferences *)v4;
    }
    else
    {
      +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
      v6 = (WeatherPreferences *)objc_claimAutoreleasedReturnValue();
    }
    preferences = v5->_preferences;
    v5->_preferences = v6;

    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.weather"));

    v11 = 1800;
    if (v10)
      v11 = 300;
    v5->_updateInterval = v11;
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isInternalBuild = objc_msgSend(v12, "isInternalInstall");

    objc_storeStrong((id *)&v5->_effectiveBundleIdentifier, CFSTR("com.apple.weather"));
    if (v5->_isInternalBuild)
    {
      +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectForKey:", CFSTR("ShouldLocalWeatherUpdateRapidly"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "BOOLValue");

      if (v15)
      {
        v5->_updateInterval = 10;
        WALogForCategory(4);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          updateInterval = v5->_updateInterval;
          *(_DWORD *)buf = 134217984;
          v21 = updateInterval;
          _os_log_impl(&dword_21AAEC000, v16, OS_LOG_TYPE_DEFAULT, "Overriding local weather location update interval via user defaults - %lus", buf, 0xCu);
        }

      }
    }
  }

  return v5;
}

- (WeatherLocationManager)initWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4
{
  id v6;
  WeatherLocationManager *v7;
  WeatherLocationManager *v8;
  uint64_t v9;
  NSString *effectiveBundleIdentifier;

  v6 = a4;
  v7 = -[WeatherLocationManager initWithPreferences:](self, "initWithPreferences:", a3);
  v8 = v7;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "copy");
    effectiveBundleIdentifier = v8->_effectiveBundleIdentifier;
    v8->_effectiveBundleIdentifier = (NSString *)v9;

  }
  return v8;
}

- (WeatherLocationManager)init
{
  return -[WeatherLocationManager initWithPreferences:](self, "initWithPreferences:", 0);
}

- (void)dealloc
{
  objc_super v3;

  -[WeatherLocationManager cancelAccuracyFallbackTimer](self, "cancelAccuracyFallbackTimer");
  -[WeatherLocationManager cancelDelayedUpdateTimer](self, "cancelDelayedUpdateTimer");
  v3.receiver = self;
  v3.super_class = (Class)WeatherLocationManager;
  -[WeatherLocationManager dealloc](&v3, sel_dealloc);
}

- (double)distanceFilter
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[WeatherLocationManager locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WeatherLocationManager locationManager](self, "locationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "distanceFilter");
    v6 = v5;

  }
  else
  {
    v6 = 500.0;
  }

  return v6;
}

- (BOOL)limitsPrecision
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v7;
  uint8_t v8[16];

  -[WeatherLocationManager locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[WeatherLocationManager locationManager](self, "locationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_limitsPrecision");

    return v5;
  }
  else
  {
    WALogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Do not have an instance of the location manager. Use coarse location.", v8, 2u);
    }

    return 1;
  }
}

- (BOOL)localWeatherAuthorized
{
  unsigned int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = -[WeatherLocationManager authorizationStatus](self, "authorizationStatus");
  WALogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "autorizationStatus %d", (uint8_t *)v5, 8u);
  }

  return v2 > 2;
}

- (void)askForLocationManagerAuthorization
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WALogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "Requesting permission for in-use location usage", v5, 2u);
  }

  -[WeatherLocationManager locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestWhenInUseAuthorization");

}

- (void)forceLocationManagerAuthorization
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  WALogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "Force request permission for in-use location usage", v5, 2u);
  }

  -[WeatherLocationManager locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "requestWhenInUseAuthorizationWithPrompt");

}

- (int)forceLoadingAuthorizationStatus
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_class();
  -[WeatherLocationManager effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherLocationManager setAuthorizationStatus:](self, "setAuthorizationStatus:", objc_msgSend(v3, "locationManagerAuthorizationWithEffectiveBundleId:", v4));

  return self->_authorizationStatus;
}

- (void)setLocationTrackingReady:(BOOL)a3 activelyTracking:(BOOL)a4 watchKitExtension:(BOOL)a5
{
  -[WeatherLocationManager setLocationTrackingReady:activelyTracking:watchKitExtension:shouldRequestAuthorization:](self, "setLocationTrackingReady:activelyTracking:watchKitExtension:shouldRequestAuthorization:", a3, a4, a5, 1);
}

- (void)setLocationTrackingReady:(BOOL)a3 activelyTracking:(BOOL)a4 watchKitExtension:(BOOL)a5 shouldRequestAuthorization:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  const char *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  id v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v9 = a3;
  v31 = *MEMORY[0x24BDAC8D0];
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = "not ready";
    if (v9)
      v11 = "ready";
    v29 = 136315138;
    v30 = (void *)v11;
    _os_log_impl(&dword_21AAEC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Setting location tracking %s", (uint8_t *)&v29, 0xCu);
  }
  if (v9)
  {
    -[WeatherLocationManager locationManager](self, "locationManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      -[WeatherLocationManager delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        NSLog(CFSTR("Cannot enable location tracking without delegate"));
      WALogForCategory(4);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        -[WeatherLocationManager effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (const __CFString *)v15;
        else
          v17 = CFSTR("com.apple.weather");
        v29 = 138412290;
        v30 = (void *)v17;
        _os_log_impl(&dword_21AAEC000, v14, OS_LOG_TYPE_DEFAULT, "Initializing CLLocationManager with %@", (uint8_t *)&v29, 0xCu);

      }
      v18 = objc_alloc(MEMORY[0x24BDBFA88]);
      -[WeatherLocationManager effectiveBundleIdentifier](self, "effectiveBundleIdentifier");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      if (v19)
        v21 = (const __CFString *)v19;
      else
        v21 = CFSTR("com.apple.weather");
      v22 = (void *)objc_msgSend(v18, "initWithEffectiveBundleIdentifier:", v21);
      -[WeatherLocationManager setLocationManager:](self, "setLocationManager:", v22);

      -[WeatherLocationManager locationManager](self, "locationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setDelegate:", self);

      -[WeatherLocationManager locationManager](self, "locationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setDistanceFilter:", 500.0);

      v25 = *MEMORY[0x24BDBFB48];
      -[WeatherLocationManager locationManager](self, "locationManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setDesiredAccuracy:", v25);

      if (v6)
      {
        -[WeatherLocationManager locationManager](self, "locationManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "requestWhenInUseAuthorization");

      }
      -[WeatherLocationManager locationManager](self, "locationManager");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setIsActuallyAWatchKitExtension:", v7);

      -[WeatherLocationManager setLocationTrackingActive:](self, "setLocationTrackingActive:", v8);
    }
  }
  else
  {
    -[WeatherLocationManager setLocationTrackingActive:](self, "setLocationTrackingActive:", v8);
    -[WeatherLocationManager clearLastLocationUpdateTime](self, "clearLastLocationUpdateTime");
    -[WeatherLocationManager setAuthorizationStatus:](self, "setAuthorizationStatus:", 0);
    -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 0);
    -[WeatherLocationManager setLocationManager:](self, "setLocationManager:", 0);
  }
  -[WeatherLocationManager setLocationTrackingIsReady:](self, "setLocationTrackingIsReady:", v9);
}

- (void)monitorLocationAuthorization
{
  -[WeatherLocationManager setLocationTrackingReady:activelyTracking:watchKitExtension:shouldRequestAuthorization:](self, "setLocationTrackingReady:activelyTracking:watchKitExtension:shouldRequestAuthorization:", 1, 0, 0, 0);
}

- (void)setLocationTrackingActive:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  double v23;
  BOOL v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  char *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  double v33;
  void *v34;
  void *v35;
  int v36;
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v3 = a3;
  v40 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = "inactive";
    if (v3)
      v6 = "active";
    v36 = 136315138;
    v37 = v6;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Setting location tracking %s", (uint8_t *)&v36, 0xCu);
  }

  -[WeatherLocationManager cancelDelayedUpdateTimer](self, "cancelDelayedUpdateTimer");
  if (v3)
  {
    -[WeatherLocationManager preferences](self, "preferences");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "readDefaultValueForKey:", CFSTR("LastLocationUpdateTime"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:");

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;
    -[WeatherLocationManager lastLocationUpdateTime](self, "lastLocationUpdateTime");
    v13 = v11 - v12;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSince1970");
    v16 = v15;
    objc_msgSend(v7, "readDefaultValueForKey:", CFSTR("LastLocationParseTime"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "doubleValue");
    v19 = v18;

    v20 = (double)-[WeatherLocationManager updateInterval](self, "updateInterval");
    v21 = v13 >= 0.0 && v13 < v20;
    if (v21
      && ((v22 = v16 - v19, v23 = (double)-[WeatherLocationManager updateInterval](self, "updateInterval"), v22 >= 0.0)
        ? (v24 = v22 < v23)
        : (v24 = 0),
          v24 && -[WeatherLocationManager authorizationStatus](self, "authorizationStatus")))
    {
      WALogForCategory(4);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_21AAEC000, v25, OS_LOG_TYPE_DEFAULT, "schedule delayed location update", (uint8_t *)&v36, 2u);
      }

      -[WeatherLocationManager scheduleDelayedUpdate:](self, "scheduleDelayedUpdate:", (double)-[WeatherLocationManager updateInterval](self, "updateInterval") - v13);
    }
    else
    {
      WALogForCategory(4);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v36) = 0;
        _os_log_impl(&dword_21AAEC000, v27, OS_LOG_TYPE_DEFAULT, "First location update check passed", (uint8_t *)&v36, 2u);
      }

      WALogForCategory(4);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[WeatherLocationManager locationUpdatesEnabled](self, "locationUpdatesEnabled"));
        v29 = (char *)objc_claimAutoreleasedReturnValue();
        -[WeatherLocationManager locationManager](self, "locationManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138412546;
        v37 = v29;
        v38 = 2112;
        v39 = v30;
        _os_log_impl(&dword_21AAEC000, v28, OS_LOG_TYPE_DEFAULT, "locationUpdatesEnabled = %@, self.locationManager = %@", (uint8_t *)&v36, 0x16u);

      }
      if (!-[WeatherLocationManager locationUpdatesEnabled](self, "locationUpdatesEnabled"))
      {
        -[WeatherLocationManager locationManager](self, "locationManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          WALogForCategory(4);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v36) = 0;
            _os_log_impl(&dword_21AAEC000, v32, OS_LOG_TYPE_DEFAULT, "LocationUpdatesEnabled=NO", (uint8_t *)&v36, 2u);
          }

          -[WeatherLocationManager oldestAllowedUpdateTime](self, "oldestAllowedUpdateTime");
          if (v33 == -1.0)
          {
            objc_msgSend(MEMORY[0x24BDBCE60], "date");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "timeIntervalSince1970");
            -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:");

          }
          -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 1);
          objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "postNotificationName:object:", CFSTR("BeganTrackingLocationNotification"), 0);

        }
      }
    }

  }
  else
  {
    WALogForCategory(4);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v36) = 0;
      _os_log_impl(&dword_21AAEC000, v26, OS_LOG_TYPE_DEFAULT, "Disable location tracking, setting locationUpdatesEnabled=NO", (uint8_t *)&v36, 2u);
    }

    -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 0);
    -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:", -1.0);
    -[WeatherLocationManager cancelDelayedUpdateTimer](self, "cancelDelayedUpdateTimer");
  }
}

- (void)updateLocationWithNoConditionCheck
{
  NSObject *v3;
  double v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  WALogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "Update location with no condition check", v7, 2u);
  }

  -[WeatherLocationManager cancelDelayedUpdateTimer](self, "cancelDelayedUpdateTimer");
  if (!-[WeatherLocationManager locationUpdatesEnabled](self, "locationUpdatesEnabled"))
  {
    -[WeatherLocationManager oldestAllowedUpdateTime](self, "oldestAllowedUpdateTime");
    if (v4 == -1.0)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSince1970");
      -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:");

    }
    -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 1);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("BeganTrackingLocationNotification"), 0);

  }
}

- (BOOL)isLocalStaleOrOutOfDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  float v12;

  -[WeatherLocationManager lastLocationTimeStamp](self, "lastLocationTimeStamp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[WeatherLocationManager preferences](self, "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localWeatherCity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherLocationManager setLastLocationTimeStamp:](self, "setLastLocationTimeStamp:", v6);

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherLocationManager lastLocationTimeStamp](self, "lastLocationTimeStamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;
  v11 = (double)-[WeatherLocationManager updateInterval](self, "updateInterval");

  -[WeatherLocationManager lastLocationAccuracy](self, "lastLocationAccuracy");
  return v10 > v11 || v12 > 1500.0;
}

- (BOOL)isCacheOutOfDate
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[WeatherLocationManager lastLocationUpdateTime](self, "lastLocationUpdateTime");
  if (v3 == 0.0)
  {
    -[WeatherLocationManager preferences](self, "preferences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "readDefaultValueForKey:", CFSTR("LastLocationUpdateTime"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:");

  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;
  -[WeatherLocationManager lastLocationUpdateTime](self, "lastLocationUpdateTime");
  v10 = v8 - v9;

  return v10 > (double)-[WeatherLocationManager updateInterval](self, "updateInterval");
}

- (BOOL)hasCrossedHourBoundary
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  v2 = (void *)MEMORY[0x24BDBCE60];
  -[WeatherLocationManager lastLocationUpdateTime](self, "lastLocationUpdateTime");
  objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = DatesAreNotWithinSameHour(v3, v4);

  return v5;
}

- (BOOL)isLocationWithInRange:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  v4 = (objc_class *)MEMORY[0x24BDBFA80];
  v5 = a3;
  v6 = [v4 alloc];
  -[WeatherLocationManager lastLocationCoord](self, "lastLocationCoord");
  v8 = v7;
  -[WeatherLocationManager lastLocationCoord](self, "lastLocationCoord");
  v9 = (void *)objc_msgSend(v6, "initWithLatitude:longitude:", v8);
  objc_msgSend(v9, "distanceFromLocation:", v5);
  v11 = v10;

  -[WeatherLocationManager distanceFilter](self, "distanceFilter");
  LOBYTE(self) = v11 < v12;

  return (char)self;
}

- (void)scheduleDelayedUpdate:(double)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[WeatherLocationManager delayedUpdateTimer](self, "delayedUpdateTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDD14F8]);
    WALogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "stringFromTimeInterval:", a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Delaying location update for %@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    -[WeatherLocationManager setNextPlannedUpdate:](self, "setNextPlannedUpdate:", v10 + a3);

    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_delayedUpdateTimerDidFire_, 0, 0, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherLocationManager setDelayedUpdateTimer:](self, "setDelayedUpdateTimer:", v11);

  }
}

- (void)cancelDelayedUpdateTimer
{
  void *v3;

  -[WeatherLocationManager delayedUpdateTimer](self, "delayedUpdateTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WeatherLocationManager setDelayedUpdateTimer:](self, "setDelayedUpdateTimer:", 0);
  -[WeatherLocationManager cancelAccuracyFallbackTimer](self, "cancelAccuracyFallbackTimer");
}

- (void)forceLocationUpdate
{
  NSObject *v3;
  uint8_t v4[16];

  WALogForCategory(4);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "Forcing location update upon request", v4, 2u);
  }

  -[WeatherLocationManager clearLastLocationUpdateTime](self, "clearLastLocationUpdateTime");
  -[WeatherLocationManager setLocationTrackingActive:](self, "setLocationTrackingActive:", 1);
}

- (void)clearLastLocationUpdateTime
{
  void *v3;
  void *v4;
  id v5;

  -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:", 0.0);
  -[WeatherLocationManager preferences](self, "preferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[WeatherLocationManager lastLocationUpdateTime](self, "lastLocationUpdateTime");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeDefaultValue:forKey:", v4, CFSTR("LastLocationUpdateTime"));

}

- (void)clearLocalWeatherUpdateState
{
  void *v3;
  id v4;

  -[WeatherLocationManager cancelDelayedUpdateTimer](self, "cancelDelayedUpdateTimer");
  -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:", -1.0);
  -[WeatherLocationManager preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "saveToDiskWithLocalWeatherCity:", 0);

  -[WeatherLocationManager preferences](self, "preferences");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "writeDefaultValue:forKey:", &unk_24DDB16B0, CFSTR("LastLocationUpdateTime"));

}

- (void)stopLocationUpdate
{
  -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 0);
}

- (void)delayedUpdateTimerDidFire:(id)a3
{
  void *v4;
  id v5;

  -[WeatherLocationManager cancelDelayedUpdateTimer](self, "cancelDelayedUpdateTimer", a3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:");

  -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 1);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("BeganTrackingLocationNotification"), 0);

}

- (void)accuracyFallbackTimerDidFire:(id)a3
{
  id v4;

  objc_msgSend(a3, "userInfo");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WeatherLocationManager updateLocation:](self, "updateLocation:", v4);

}

- (void)updateLocation:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  float v24;
  double v25;
  NSObject *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  char v32;
  NSObject *v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  double v46;
  __int16 v47;
  double v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WALogForCategory(4);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v44 = "-[WeatherLocationManager updateLocation:]";
    v45 = 2112;
    v46 = *(double *)&v5;
    _os_log_impl(&dword_21AAEC000, v6, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
  }

  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WeatherLocationManager.m"), 393, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("info"));

  }
  -[WeatherLocationManager preferences](self, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("MANAGER"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LOCATIONS"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[WeatherLocationManager isInternalBuild](self, "isInternalBuild"))
  {
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("LocationSimulation"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "BOOLValue");

    if (v13)
    {
      +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKey:", CFSTR("LocationSimulationHAccuracy"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", CFSTR("LocationSimulationLatitude"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "floatValue");
      v21 = v20;
      +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectForKey:", CFSTR("LocationSimulationLongitude"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      v25 = v24;

      WALogForCategory(4);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218496;
        v44 = *(const char **)&v21;
        v45 = 2048;
        v46 = v25;
        v47 = 2048;
        v48 = v17;
        _os_log_impl(&dword_21AAEC000, v26, OS_LOG_TYPE_DEFAULT, "Overriding weather location position and accuracy via user defaults - (%f, %f) %fm", buf, 0x20u);
      }

      v27 = objc_alloc(MEMORY[0x24BDBFA80]);
      objc_msgSend(v10, "timestamp");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v28, v21, v25, 0.0, v17, 1.0);

      objc_msgSend(v9, "arrayByAddingObject:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v29;
      v9 = (void *)v30;
    }
  }
  -[WeatherLocationManager delegate](self, "delegate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_opt_respondsToSelector();

  if ((v32 & 1) != 0)
  {
    WALogForCategory(4);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      -[WeatherLocationManager delegate](self, "delegate");
      v34 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v34;
      _os_log_impl(&dword_21AAEC000, v33, OS_LOG_TYPE_DEFAULT, "Notifying clients of updated location, %@", buf, 0xCu);

    }
    -[WeatherLocationManager delegate](self, "delegate");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "locationManager:didUpdateLocations:", v8, v9);

    if (-[WeatherLocationManager isInternalBuild](self, "isInternalBuild"))
    {
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "postNotificationName:object:", CFSTR("BeganDataRequestNotification"), 0);

    }
  }
  -[WeatherLocationManager setLocationUpdatesEnabled:](self, "setLocationUpdatesEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "timeIntervalSince1970");
  -[WeatherLocationManager setLastLocationUpdateTime:](self, "setLastLocationUpdateTime:");

  v38 = (void *)MEMORY[0x24BDD16E0];
  -[WeatherLocationManager lastLocationUpdateTime](self, "lastLocationUpdateTime");
  objc_msgSend(v38, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "writeDefaultValue:forKey:", v39, CFSTR("LastLocationUpdateTime"));

  objc_msgSend(v7, "synchronizeStateToDisk");
  -[WeatherLocationManager scheduleDelayedUpdate:](self, "scheduleDelayedUpdate:", (double)-[WeatherLocationManager updateInterval](self, "updateInterval"));
  -[WeatherLocationManager setOldestAllowedUpdateTime:](self, "setOldestAllowedUpdateTime:", -1.0);
  v40 = *MEMORY[0x24BDBFB48];
  -[WeatherLocationManager locationManager](self, "locationManager");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setDesiredAccuracy:", v40);

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  NSObject *v13;
  void *v14;
  char v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  float v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  BOOL v28;
  char v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  NSObject *v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  __int128 v44;
  _BOOL4 v45;
  __int16 v46;
  double v47;
  _QWORD v48[2];
  _QWORD v49[3];

  v49[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!self->_locationUpdatesEnabled)
  {
    WALogForCategory(4);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v44) = 138412290;
      *(_QWORD *)((char *)&v44 + 4) = v7;
      _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "Received location update after CL is stopped, ignoring: %@", (uint8_t *)&v44, 0xCu);
    }
    goto LABEL_38;
  }
  -[WeatherLocationManager cancelAccuracyFallbackTimer](self, "cancelAccuracyFallbackTimer");
  if (objc_msgSend(v7, "count"))
  {
    v48[0] = CFSTR("MANAGER");
    v48[1] = CFSTR("LOCATIONS");
    v49[0] = v6;
    v49[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timestamp");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeIntervalSince1970");
    v12 = v11;

    WALogForCategory(4);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v44) = 138412290;
      *(_QWORD *)((char *)&v44 + 4) = v9;
      _os_log_impl(&dword_21AAEC000, v13, OS_LOG_TYPE_DEFAULT, "Received location update: %@", (uint8_t *)&v44, 0xCu);
    }

    -[WeatherLocationManager locationManager](self, "locationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "_limitsPrecision");

    if ((v15 & 1) != 0)
    {
      v16 = 1;
    }
    else
    {
      objc_msgSend(v9, "horizontalAccuracy");
      v16 = v17 <= 1500.0;
    }
    -[WeatherLocationManager oldestAllowedUpdateTime](self, "oldestAllowedUpdateTime");
    v19 = v18;
    objc_msgSend(v9, "horizontalAccuracy");
    v21 = v20 < 10000.0;
    v22 = 10.0;
    if (!v21)
      v22 = 20.0;
    v23 = v22;
    -[WeatherLocationManager oldestAllowedUpdateTime](self, "oldestAllowedUpdateTime");
    v25 = v12 - v24;
    v26 = v23;
    WALogForCategory(4);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_QWORD *)&v44 = __PAIR64__(v16, 67109888);
      WORD4(v44) = 1024;
      *(_DWORD *)((char *)&v44 + 10) = v19 > 0.0;
      HIWORD(v44) = 1024;
      v45 = v25 > v26;
      v46 = 2048;
      v47 = v23;
      _os_log_debug_impl(&dword_21AAEC000, v27, OS_LOG_TYPE_DEBUG, "accurate: %d, requested: %d, overdue: %d (timeout: %f)", (uint8_t *)&v44, 0x1Eu);
    }

    v28 = v19 > 0.0 && v16;
    if (v28 || v25 > v26)
    {
      WALogForCategory(4);
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v44) = 138412290;
        *(_QWORD *)((char *)&v44 + 4) = v9;
        _os_log_impl(&dword_21AAEC000, v32, OS_LOG_TYPE_DEFAULT, "New location meet our criteria: %@, use it", (uint8_t *)&v44, 0xCu);
      }

      -[WeatherLocationManager updateLocation:](self, "updateLocation:", v8);
    }
    else
    {
      v29 = v19 <= 0.0 || v16;
      WALogForCategory(4);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
      if ((v29 & 1) != 0)
      {
        if (v31)
        {
          LODWORD(v44) = 67109376;
          DWORD1(v44) = v16;
          WORD4(v44) = 1024;
          *(_DWORD *)((char *)&v44 + 10) = v19 > 0.0;
          _os_log_impl(&dword_21AAEC000, v30, OS_LOG_TYPE_DEFAULT, "Dropping location update - accurate: %d, requested: %d", (uint8_t *)&v44, 0xEu);
        }
      }
      else
      {
        if (v31)
        {
          LODWORD(v44) = 134217984;
          *(double *)((char *)&v44 + 4) = v23;
          _os_log_impl(&dword_21AAEC000, v30, OS_LOG_TYPE_DEFAULT, "Location update not accurate enough - waiting %fs for better update", (uint8_t *)&v44, 0xCu);
        }

        objc_msgSend(v9, "coordinate");
        v34 = v33;
        -[WeatherLocationManager lastLocationCoord](self, "lastLocationCoord");
        if (v34 == v35)
        {
          objc_msgSend(v9, "coordinate");
          v37 = v36;
          -[WeatherLocationManager lastLocationCoord](self, "lastLocationCoord");
          if (v37 == v38)
          {
            WALogForCategory(4);
            v39 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v44) = 0;
              _os_log_impl(&dword_21AAEC000, v39, OS_LOG_TYPE_DEFAULT, "Temporarily boosting location accuracy", (uint8_t *)&v44, 2u);
            }

            v40 = *MEMORY[0x24BDBFB40];
            -[WeatherLocationManager locationManager](self, "locationManager");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "setDesiredAccuracy:", v40);

          }
        }
        objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_accuracyFallbackTimerDidFire_, v8, 0, v23, v44);
        v30 = objc_claimAutoreleasedReturnValue();
        -[WeatherLocationManager setAccuracyFallbackTimer:](self, "setAccuracyFallbackTimer:", v30);
      }

    }
    objc_msgSend(v9, "coordinate", (_QWORD)v44);
    -[WeatherLocationManager setLastLocationCoord:](self, "setLastLocationCoord:");
    objc_msgSend(v9, "timestamp");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherLocationManager setLastLocationTimeStamp:](self, "setLastLocationTimeStamp:", v42);

    objc_msgSend(v9, "horizontalAccuracy");
    *(float *)&v43 = v43;
    -[WeatherLocationManager setLastLocationAccuracy:](self, "setLastLocationAccuracy:", v43);

LABEL_38:
  }

}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v4;
  id v6;
  NSObject *v7;
  void *v8;
  char v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v4 = *(_QWORD *)&a4;
  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  WALogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v4;
    _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Location authorization status is now %d", (uint8_t *)v11, 8u);
  }

  -[WeatherLocationManager setAuthorizationStatus:](self, "setAuthorizationStatus:", v4);
  -[WeatherLocationManager delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[WeatherLocationManager delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locationManager:didChangeAuthorizationStatus:", v6, v4);

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v4;
  NSObject *v5;

  v4 = a4;
  WALogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[WeatherLocationManager locationManager:didFailWithError:].cold.1((uint64_t)v4, v5);

}

- (void)setLocationUpdatesEnabled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  if (-[WeatherLocationManager locationUpdatesEnabled](self, "locationUpdatesEnabled") != a3)
  {
    WALogForCategory(4);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = "Disabling";
      if (v3)
        v6 = "Enabling";
      v10 = 136315138;
      v11 = v6;
      _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "%s location updates", (uint8_t *)&v10, 0xCu);
    }

    WALogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v8)
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Start updating location", (uint8_t *)&v10, 2u);
      }

      -[WeatherLocationManager locationManager](self, "locationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "startUpdatingLocation");
    }
    else
    {
      if (v8)
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Stop updating location", (uint8_t *)&v10, 2u);
      }

      -[WeatherLocationManager locationManager](self, "locationManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stopUpdatingLocation");
    }

    self->_locationUpdatesEnabled = v3;
  }
}

- (void)cancelAccuracyFallbackTimer
{
  void *v3;

  -[WeatherLocationManager accuracyFallbackTimer](self, "accuracyFallbackTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WeatherLocationManager setAccuracyFallbackTimer:](self, "setAccuracyFallbackTimer:", 0);
}

- (id)location
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  void *v15;
  float v16;
  double v17;
  NSObject *v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  if (-[WeatherLocationManager isInternalBuild](self, "isInternalBuild")
    && (+[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences"), v3 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v3, "objectForKey:", CFSTR("LocationSimulation")), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "BOOLValue"), v4, v3, v5))
  {
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("LocationSimulationHAccuracy"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("LocationSimulationLatitude"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "floatValue");
    v13 = v12;
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", CFSTR("LocationSimulationLongitude"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    WALogForCategory(4);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134218496;
      v28 = v13;
      v29 = 2048;
      v30 = v17;
      v31 = 2048;
      v32 = v9;
      _os_log_impl(&dword_21AAEC000, v18, OS_LOG_TYPE_DEFAULT, "Overriding location position and accuracy via user defaults - (%f, %f) %fm", (uint8_t *)&v27, 0x20u);
    }

    v19 = objc_alloc(MEMORY[0x24BDBFA80]);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v20, v13, v17, 0.0, v9, 1.0);
  }
  else
  {
    WALogForCategory(4);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[WeatherLocationManager locationManager](self, "locationManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "location");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = *(double *)&v24;
      _os_log_impl(&dword_21AAEC000, v22, OS_LOG_TYPE_DEFAULT, "Requested location from location manager, the location saved is:%@", (uint8_t *)&v27, 0xCu);

    }
    -[WeatherLocationManager locationManager](self, "locationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "location");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v21;

  return v25;
}

- (NSString)effectiveBundleIdentifier
{
  return self->_effectiveBundleIdentifier;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (CLLocationManagerDelegate)delegate
{
  return (CLLocationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)locationTrackingIsReady
{
  return self->_locationTrackingIsReady;
}

- (void)setLocationTrackingIsReady:(BOOL)a3
{
  self->_locationTrackingIsReady = a3;
}

- (BOOL)locationUpdatesEnabled
{
  return self->_locationUpdatesEnabled;
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (unint64_t)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(unint64_t)a3
{
  self->_updateInterval = a3;
}

- (double)oldestAllowedUpdateTime
{
  return self->_oldestAllowedUpdateTime;
}

- (void)setOldestAllowedUpdateTime:(double)a3
{
  self->_oldestAllowedUpdateTime = a3;
}

- (NSTimer)delayedUpdateTimer
{
  return self->_delayedUpdateTimer;
}

- (void)setDelayedUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_delayedUpdateTimer, a3);
}

- (NSTimer)accuracyFallbackTimer
{
  return self->_accuracyFallbackTimer;
}

- (void)setAccuracyFallbackTimer:(id)a3
{
  objc_storeStrong((id *)&self->_accuracyFallbackTimer, a3);
}

- (WeatherPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (CLLocationCoordinate2D)lastLocationCoord
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_lastLocationCoord.latitude;
  longitude = self->_lastLocationCoord.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (void)setLastLocationCoord:(CLLocationCoordinate2D)a3
{
  self->_lastLocationCoord = a3;
}

- (NSDate)lastLocationTimeStamp
{
  return self->_lastLocationTimeStamp;
}

- (void)setLastLocationTimeStamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (float)lastLocationAccuracy
{
  return self->_lastLocationAccuracy;
}

- (void)setLastLocationAccuracy:(float)a3
{
  self->_lastLocationAccuracy = a3;
}

- (double)lastLocationUpdateTime
{
  return self->_lastLocationUpdateTime;
}

- (void)setLastLocationUpdateTime:(double)a3
{
  self->_lastLocationUpdateTime = a3;
}

- (double)nextPlannedUpdate
{
  return self->_nextPlannedUpdate;
}

- (void)setNextPlannedUpdate:(double)a3
{
  self->_nextPlannedUpdate = a3;
}

- (BOOL)isInternalBuild
{
  return self->_isInternalBuild;
}

- (void)setIsInternalBuild:(BOOL)a3
{
  self->_isInternalBuild = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastLocationTimeStamp, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_accuracyFallbackTimer, 0);
  objc_storeStrong((id *)&self->_delayedUpdateTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_effectiveBundleIdentifier, 0);
}

- (void)locationManager:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21AAEC000, a2, OS_LOG_TYPE_ERROR, "Location manager encountered an error: %@", (uint8_t *)&v2, 0xCu);
}

@end
