@implementation WATodayAutoupdatingLocationModel

- (WATodayAutoupdatingLocationModel)initWithPreferences:(id)a3 effectiveBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  WATodayAutoupdatingLocationModel *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  NSDate *lastLocationUpdateDate;
  NSObject *v20;
  double minTimeBetweenUpdates;
  double minDistanceChangeInMeters;
  void *v23;
  __CFNotificationCenter *DarwinNotifyCenter;
  uint64_t v26;
  uint64_t v27;
  WeatherLocationManager *(*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  objc_super v32;
  uint8_t buf[4];
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v32.receiver = self;
  v32.super_class = (Class)WATodayAutoupdatingLocationModel;
  v8 = -[WATodayModel init](&v32, sel_init);
  if (v8)
  {
    v26 = MEMORY[0x24BDAC760];
    v27 = 3221225472;
    v28 = __82__WATodayAutoupdatingLocationModel_initWithPreferences_effectiveBundleIdentifier___block_invoke;
    v29 = &unk_24DD9CF70;
    v9 = v6;
    v30 = v9;
    v31 = v7;
    -[WATodayAutoupdatingLocationModel setWeatherLocationManagerGenerator:](v8, "setWeatherLocationManagerGenerator:", &v26);
    -[WATodayAutoupdatingLocationModel setStopUpdateIfNeeded:](v8, "setStopUpdateIfNeeded:", 0, v26, v27, v28, v29);
    -[WATodayAutoupdatingLocationModel setPreferences:](v8, "setPreferences:", v9);
    -[WATodayModel lastUpdateDate](v8, "lastUpdateDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v9, "readDefaultValueForKey:", CFSTR("LastWidgetForecastUpdateDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WATodayModel setLastUpdateDate:](v8, "setLastUpdateDate:", v13);

    }
    objc_msgSend(MEMORY[0x24BEC2210], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "settings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "locationUpdateMinTimeInterval");
    v8->_minTimeBetweenUpdates = v16;
    objc_msgSend(v15, "locationUpdateMinDistance");
    v8->_minDistanceChangeInMeters = v17;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v18 = objc_claimAutoreleasedReturnValue();
    lastLocationUpdateDate = v8->_lastLocationUpdateDate;
    v8->_lastLocationUpdateDate = (NSDate *)v18;

    WALogForCategory(4);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      minTimeBetweenUpdates = v8->_minTimeBetweenUpdates;
      minDistanceChangeInMeters = v8->_minDistanceChangeInMeters;
      *(_DWORD *)buf = 134218240;
      v34 = minTimeBetweenUpdates;
      v35 = 2048;
      v36 = minDistanceChangeInMeters;
      _os_log_impl(&dword_21AAEC000, v20, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] initialize with minTimeBetweenUpdates: %f, minDistanceChangeInMeters: %f", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:suspensionBehavior:", v8, sel_weatherPreferencesWereSynchronized, CFSTR("WeatherPrefAppToPrefsDidUpdateNotification"), 0, 2);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v8, (CFNotificationCallback)WeatherCityListChanged, CFSTR("com.apple.weather.WeatherCityListPrefsChangedNotification"), 0, (CFNotificationSuspensionBehavior)1024);

  }
  return v8;
}

WeatherLocationManager *__82__WATodayAutoupdatingLocationModel_initWithPreferences_effectiveBundleIdentifier___block_invoke(uint64_t a1)
{
  return -[WeatherLocationManager initWithPreferences:effectiveBundleIdentifier:]([WeatherLocationManager alloc], "initWithPreferences:effectiveBundleIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (WATodayAutoupdatingLocationModel)init
{
  void *v3;
  WATodayAutoupdatingLocationModel *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[WATodayAutoupdatingLocationModel initWithPreferences:effectiveBundleIdentifier:](self, "initWithPreferences:effectiveBundleIdentifier:", v3, 0);

  return v4;
}

- (double)minTimeBetweenUpdates
{
  double result;

  result = self->_minTimeBetweenUpdates;
  if (result <= 0.0)
  {
    self->_minTimeBetweenUpdates = 1800.0;
    return 1800.0;
  }
  return result;
}

- (double)minDistanceChangeInMeters
{
  double result;

  result = self->_minDistanceChangeInMeters;
  if (result <= 0.0)
  {
    self->_minDistanceChangeInMeters = 1500.0;
    return 1500.0;
  }
  return result;
}

- (void)configureWithLocationServicesActive:(BOOL)a3
{
  -[WATodayAutoupdatingLocationModel configureWithInitialCitySource:locationServicesActive:](self, "configureWithInitialCitySource:locationServicesActive:", 2, a3);
}

- (void)configureWithInitialCitySource:(unint64_t)a3 locationServicesActive:(BOOL)a4
{
  _BOOL8 v4;

  v4 = a4;
  -[WATodayAutoupdatingLocationModel setFallbackCitySource:](self, "setFallbackCitySource:", a3);
  -[WATodayAutoupdatingLocationModel setCitySource:fireNotification:](self, "setCitySource:fireNotification:", -[WATodayAutoupdatingLocationModel fallbackCitySource](self, "fallbackCitySource"), 0);
  -[WATodayAutoupdatingLocationModel setLocationServicesActive:](self, "setLocationServicesActive:", v4);
}

- (void)dealloc
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.weather.WeatherCityListPrefsChangedNotification"), 0);
  -[WATodayAutoupdatingLocationModel _teardownLocationManager](self, "_teardownLocationManager");
  v5.receiver = self;
  v5.super_class = (Class)WATodayAutoupdatingLocationModel;
  -[WATodayModel dealloc](&v5, sel_dealloc);
}

- (void)clearLocationUpdateState
{
  id v2;

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopLocationUpdate");

}

- (void)setPreferences:(id)a3
{
  WeatherPreferences *v5;
  WeatherPreferences *preferences;
  WeatherPreferences *v7;

  v5 = (WeatherPreferences *)a3;
  preferences = self->_preferences;
  if (preferences != v5)
  {
    v7 = v5;
    -[WeatherPreferences setSyncDelegate:](preferences, "setSyncDelegate:", 0);
    objc_storeStrong((id *)&self->_preferences, a3);
    -[WeatherPreferences setSyncDelegate:](self->_preferences, "setSyncDelegate:", self);
    v5 = v7;
  }

}

- (void)setIsLocationTrackingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  if (self->_isLocationTrackingEnabled != a3)
  {
    v3 = a3;
    -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocationTrackingReady:activelyTracking:watchKitExtension:", 1, v3, 0);

    self->_isLocationTrackingEnabled = v3;
    if (v3)
    {
      WALogForCategory(4);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21AAEC000, v6, OS_LOG_TYPE_DEFAULT, "Clear weather update state", v8, 2u);
      }

      -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearLocalWeatherUpdateState");

    }
    else
    {
      -[WATodayModel _fireTodayModelWantsUpdate](self, "_fireTodayModelWantsUpdate");
    }
  }
}

- (id)forecastModel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WATodayAutoupdatingLocationModel;
  -[WATodayModel forecastModel](&v9, sel_forecastModel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    if (!-[WATodayAutoupdatingLocationModel _reloadForecastData:](self, "_reloadForecastData:", 0))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v8.receiver = self;
    v8.super_class = (Class)WATodayAutoupdatingLocationModel;
    -[WATodayModel forecastModel](&v8, sel_forecastModel);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (void)setCitySource:(unint64_t)a3 fireNotification:(BOOL)a4
{
  _BOOL4 v4;

  if (self->_citySource != a3)
  {
    v4 = a4;
    self->_citySource = a3;
    -[WATodayAutoupdatingLocationModel _reloadForecastData:](self, "_reloadForecastData:", 0);
    if (v4)
      -[WATodayModel _fireTodayModelWantsUpdate](self, "_fireTodayModelWantsUpdate");
  }
}

- (void)setCitySource:(unint64_t)a3
{
  -[WATodayAutoupdatingLocationModel setCitySource:fireNotification:](self, "setCitySource:fireNotification:", a3, 1);
}

- (void)setLocationServicesActive:(BOOL)a3
{
  if (self->_locationServicesActive != a3)
  {
    self->_locationServicesActive = a3;
    if (a3)
      -[WATodayAutoupdatingLocationModel _kickstartLocationManager](self, "_kickstartLocationManager");
    else
      -[WATodayAutoupdatingLocationModel _teardownLocationManager](self, "_teardownLocationManager");
  }
}

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[WATodayAutoupdatingLocationModel preferences](self, "preferences", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "locationTrackingIsReady"))
  {
    if (a4 >= 3)
    {
      objc_msgSend(v9, "setLocalWeatherEnabled:", 1);
      -[WATodayAutoupdatingLocationModel setIsLocationTrackingEnabled:](self, "setIsLocationTrackingEnabled:", 1);
      objc_msgSend(v6, "setLocationTrackingActive:", 1);
      -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clearLocalWeatherUpdateState");

      -[WATodayAutoupdatingLocationModel setCitySource:](self, "setCitySource:", 1);
      goto LABEL_8;
    }
    objc_msgSend(v9, "setLocalWeatherEnabled:", 0);
    objc_msgSend(v6, "setLocationTrackingActive:", 0);
    -[WATodayAutoupdatingLocationModel setIsLocationTrackingEnabled:](self, "setIsLocationTrackingEnabled:", 0);
    -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "clearLocalWeatherUpdateState");

  }
  else if (a4 > 2)
  {
    goto LABEL_8;
  }
  -[WATodayAutoupdatingLocationModel setCitySource:](self, "setCitySource:", -[WATodayAutoupdatingLocationModel fallbackCitySource](self, "fallbackCitySource"));
  if (!a4)
    objc_msgSend(v6, "askForLocationManagerAuthorization");
LABEL_8:
  -[WATodayModel _fireTodayModelWantsUpdate](self, "_fireTodayModelWantsUpdate");

}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  __CFString *v5;
  _BOOL4 isLocationTrackingEnabled;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (__CFString *)a4;
  isLocationTrackingEnabled = self->_isLocationTrackingEnabled;
  WALogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (isLocationTrackingEnabled)
  {
    if (v8)
    {
      v9 = -[__CFString count](v5, "count");
      if (v9)
      {
        -[__CFString lastObject](v5, "lastObject");
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = CFSTR("No new location");
      }
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] Received location update: %@", (uint8_t *)&v11, 0xCu);
      if (v9)

    }
    -[WATodayModel _fireTodayModelWantsUpdate](self, "_fireTodayModelWantsUpdate");
  }
  else
  {
    if (v8)
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Received location update after CL is stopped, ignoring: %@", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)_kickstartLocationManager
{
  void (**v3)(void);
  void *v4;
  void *v5;
  double v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  unint64_t v14;
  void *v15;
  id v16;

  -[WATodayAutoupdatingLocationModel WeatherLocationManagerGenerator](self, "WeatherLocationManagerGenerator");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WATodayAutoupdatingLocationModel setLocationManager:](self, "setLocationManager:", v4);
  }
  else
  {
    v5 = (void *)objc_opt_new();
    -[WATodayAutoupdatingLocationModel setLocationManager:](self, "setLocationManager:", v5);

  }
  -[WATodayAutoupdatingLocationModel minTimeBetweenUpdates](self, "minTimeBetweenUpdates");
  v7 = (unint64_t)v6;
  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUpdateInterval:", v7);

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  v10 = objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled");
  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "localWeatherAuthorized");

  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLocalWeatherEnabled:", v10 & v12);

  if ((_DWORD)v10 && (v12 & 1) != 0)
    v14 = 1;
  else
    v14 = -[WATodayAutoupdatingLocationModel fallbackCitySource](self, "fallbackCitySource");
  -[WATodayAutoupdatingLocationModel setCitySource:fireNotification:](self, "setCitySource:fireNotification:", v14, 0);
  if ((v12 & 1) == 0)
  {
    -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "askForLocationManagerAuthorization");

  }
  -[WATodayAutoupdatingLocationModel setIsLocationTrackingEnabled:](self, "setIsLocationTrackingEnabled:", v10);
  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocationTrackingActive:", 1);

}

- (void)checkIfNeedsToUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t v13[16];
  uint8_t buf[16];

  if (!-[WATodayAutoupdatingLocationModel updateLocationTrackingStatus](self, "updateLocationTrackingStatus"))
  {
    WALogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_DEFAULT, "Check if needs to update", buf, 2u);
    }

    -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isLocalStaleOrOutOfDate") & 1) == 0)
    {
      -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v5, "isCacheOutOfDate"))
      {
        v9 = -[WATodayModel hasCrossedHourlyBoundary](self, "hasCrossedHourlyBoundary");

        if (!v9)
        {
          WALogForCategory(0);
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v12 = 0;
            _os_log_impl(&dword_21AAEC000, v10, OS_LOG_TYPE_DEFAULT, "Check current location to see if movement is within distance filter", v12, 2u);
          }

          -[WATodayAutoupdatingLocationModel setStopUpdateIfNeeded:](self, "setStopUpdateIfNeeded:", 1);
          -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "updateLocationWithNoConditionCheck");
          goto LABEL_11;
        }
LABEL_8:
        WALogForCategory(0);
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v13 = 0;
          _os_log_impl(&dword_21AAEC000, v6, OS_LOG_TYPE_DEFAULT, "Forced location update", v13, 2u);
        }

        -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "forceLocationUpdate");
LABEL_11:

        goto LABEL_12;
      }

    }
    goto LABEL_8;
  }
LABEL_12:
  WALogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "Update location tracking status", v11, 2u);
  }

}

- (void)_teardownLocationManager
{
  void *v3;
  void *v4;

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLocationTrackingReady:activelyTracking:watchKitExtension:", 0, 0, 0);

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  -[WATodayAutoupdatingLocationModel setLocationManager:](self, "setLocationManager:", 0);
  -[WATodayAutoupdatingLocationModel setCitySource:fireNotification:](self, "setCitySource:fireNotification:", -[WATodayAutoupdatingLocationModel fallbackCitySource](self, "fallbackCitySource"), 0);
}

- (void)syncLastUpdateTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[WATodayModel lastUpdateDate](self, "lastUpdateDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeDefaultValue:forKey:", v6, CFSTR("LastWidgetForecastUpdateDate"));

  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronizeStateToDisk");

}

- (BOOL)updateLocationTrackingStatus
{
  void *v3;
  int v4;

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled");
    LODWORD(v3) = v4 & !-[WATodayAutoupdatingLocationModel isLocationTrackingEnabled](self, "isLocationTrackingEnabled");
    -[WATodayAutoupdatingLocationModel setIsLocationTrackingEnabled:](self, "setIsLocationTrackingEnabled:", objc_msgSend(MEMORY[0x24BDBFA88], "locationServicesEnabled"));
  }
  return (char)v3;
}

- (void)weatherPreferencesWereSynchronized
{
  id v3;

  if (-[WATodayAutoupdatingLocationModel _reloadForecastData:](self, "_reloadForecastData:", 1))
  {
    -[WATodayAutoupdatingLocationModel forecastModel](self, "forecastModel");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[WATodayModel _fireTodayModelForecastWasUpdated:](self, "_fireTodayModelForecastWasUpdated:", v3);

  }
}

- (void)_executeLocationUpdateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  unint64_t v5;
  NSObject *v6;
  void *v7;

  v4 = (void (**)(id, _QWORD, void *))a3;
  v5 = -[WATodayAutoupdatingLocationModel citySource](self, "citySource");
  if (v5 == 2)
  {
    -[WATodayAutoupdatingLocationModel _executeLocationUpdateForFirstWeatherCityWithCompletion:](self, "_executeLocationUpdateForFirstWeatherCityWithCompletion:", v4);
  }
  else if (v5 == 1)
  {
    -[WATodayAutoupdatingLocationModel _executeLocationUpdateForLocalWeatherCityWithCompletion:](self, "_executeLocationUpdateForLocalWeatherCityWithCompletion:", v4);
  }
  else
  {
    WALogForCategory(4);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WATodayAutoupdatingLocationModel _executeLocationUpdateWithCompletion:].cold.1(v6);

    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), -1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v7);

    }
  }

}

- (void)_willDeliverForecastModel:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v5 = -[WATodayAutoupdatingLocationModel citySource](self, "citySource");
  WACityFromForecastModel(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCity:", v6);

  objc_msgSend(v4, "city");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsLocalWeatherCity:", v5 == 1);

  v8.receiver = self;
  v8.super_class = (Class)WATodayAutoupdatingLocationModel;
  -[WATodayModel _willDeliverForecastModel:](&v8, sel__willDeliverForecastModel_, v4);

}

- (BOOL)shouldNotUseUpdatedLocation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  int v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WATodayLoadSavedLastForecastModelFromPreferences(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayAutoupdatingLocationModel forecastModel](self, "forecastModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geoLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  WALogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = v7;
    _os_log_impl(&dword_21AAEC000, v11, OS_LOG_TYPE_DEFAULT, "savedModelLocation is %@", (uint8_t *)&v23, 0xCu);
  }

  v12 = 0;
  if (v7 && v6)
  {
    objc_msgSend(v7, "geoLocation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "distanceFromLocation:", v6);
    v15 = v14;
    -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "distanceFilter");
    v12 = v15 < v17;

  }
  if (v10)
  {
    objc_msgSend(v10, "distanceFromLocation:", v6);
    v19 = v18;
    -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "distanceFilter");
    if (v19 >= v21)
      v12 = 0;

  }
  return v12;
}

- (BOOL)shouldUseNewLocation:(id)a3 oldLocation:(id)a4
{
  double v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  double v17;
  double v18;
  uint64_t v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  int v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = COERCE_DOUBLE(a3);
  v7 = a4;
  if (v7)
  {
    if (v6 == 0.0)
    {
      WALogForCategory(4);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v20 = "[WATodayAutoupdatingLocationModel] invalid new location, bailing";
        v21 = v16;
        v22 = 2;
        goto LABEL_15;
      }
LABEL_16:
      v27 = 0;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WATodayAutoupdatingLocationModel lastLocationUpdateDate](self, "lastLocationUpdateDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v9);
    v11 = v10;

    objc_msgSend(*(id *)&v6, "distanceFromLocation:", v7);
    v13 = v12;
    -[WATodayAutoupdatingLocationModel minTimeBetweenUpdates](self, "minTimeBetweenUpdates");
    if (v11 < v14)
    {
      -[WATodayAutoupdatingLocationModel minDistanceChangeInMeters](self, "minDistanceChangeInMeters");
      if (v13 < v15)
      {
        WALogForCategory(4);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          -[WATodayAutoupdatingLocationModel minTimeBetweenUpdates](self, "minTimeBetweenUpdates");
          v18 = v17;
          -[WATodayAutoupdatingLocationModel minDistanceChangeInMeters](self, "minDistanceChangeInMeters");
          v29 = 134218752;
          v30 = v11;
          v31 = 2048;
          v32 = v13;
          v33 = 2048;
          v34 = v18;
          v35 = 2048;
          v36 = v19;
          v20 = "[WATodayAutoupdatingLocationModel] Dropping location received %f seconds since the last update, and %f m"
                "eters from the previous location. Min time in seconds: %f, min change in meters: %f";
          v21 = v16;
          v22 = 42;
LABEL_15:
          _os_log_impl(&dword_21AAEC000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v29, v22);
          goto LABEL_16;
        }
        goto LABEL_16;
      }
    }
    WALogForCategory(4);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[WATodayAutoupdatingLocationModel minTimeBetweenUpdates](self, "minTimeBetweenUpdates");
      v25 = v24;
      -[WATodayAutoupdatingLocationModel minDistanceChangeInMeters](self, "minDistanceChangeInMeters");
      v29 = 138413314;
      v30 = v6;
      v31 = 2048;
      v32 = v11;
      v33 = 2048;
      v34 = v13;
      v35 = 2048;
      v36 = v25;
      v37 = 2048;
      v38 = v26;
      _os_log_impl(&dword_21AAEC000, v23, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] Use new location: %@, %f seconds since the last update, and %f meters from the previous location. Min time in seconds: %f, min change in meters: %f", (uint8_t *)&v29, 0x34u);
    }

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v16 = objc_claimAutoreleasedReturnValue();
    -[WATodayAutoupdatingLocationModel setLastLocationUpdateDate:](self, "setLastLocationUpdateDate:", v16);
  }
  else
  {
    WALogForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_21AAEC000, v16, OS_LOG_TYPE_DEFAULT, "[WATodayAutoupdatingLocationModel] we do not have an old location, we shall use the new one", (uint8_t *)&v29, 2u);
    }
  }
  v27 = 1;
LABEL_17:

  return v27;
}

- (void)_executeLocationUpdateForLocalWeatherCityWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  BOOL v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v27[4];
  void (**v28)(id, void *, id);
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, id))a3;
  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WATodayLoadSavedLastForecastModelFromPreferences(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WATodayAutoupdatingLocationModel locationManager](self, "locationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WALogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    _os_log_impl(&dword_21AAEC000, v10, OS_LOG_TYPE_DEFAULT, "start updating location: %@, lastKnownLocation is %@", buf, 0x16u);
  }

  if (v9
    && (objc_msgSend(v6, "location"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "geoLocation"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[WATodayAutoupdatingLocationModel shouldUseNewLocation:oldLocation:](self, "shouldUseNewLocation:oldLocation:", v8, v12), v12, v11, !v13))
  {
    if (-[WATodayAutoupdatingLocationModel stopUpdateIfNeeded](self, "stopUpdateIfNeeded"))
    {
      WALogForCategory(4);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AAEC000, v25, OS_LOG_TYPE_DEFAULT, "Latest location is within 500m range of last one, do not need to update", buf, 2u);
      }

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 8, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[WATodayAutoupdatingLocationModel setStopUpdateIfNeeded:](self, "setStopUpdateIfNeeded:", 0);
    }
    else
    {
      v14 = 0;
    }
    WALogForCategory(4);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v26, OS_LOG_TYPE_DEFAULT, "last location is still good, use that", buf, 2u);
    }

    v4[2](v4, v9, v14);
  }
  else
  {
    v14 = v8;
    if (v14)
    {
      -[WATodayAutoupdatingLocationModel geocodeRequest](self, "geocodeRequest");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[WATodayAutoupdatingLocationModel geocodeRequest](self, "geocodeRequest");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "cancel");

      }
      if (WAIsPadAndChinaSKU())
        WAPresentFirstUsageDialogIfNeeded();
      v17 = objc_alloc(MEMORY[0x24BEC21D8]);
      objc_msgSend(v14, "coordinate");
      v19 = v18;
      v21 = v20;
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke;
      v27[3] = &unk_24DD9CFC0;
      v28 = v4;
      v22 = (void *)objc_msgSend(v17, "initWithCoordinate:resultHandler:", v27, v19, v21);
      -[WATodayAutoupdatingLocationModel setGeocodeRequest:](self, "setGeocodeRequest:", v22);

      -[WATodayAutoupdatingLocationModel geocodeRequest](self, "geocodeRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "start");

      v24 = v28;
      goto LABEL_17;
    }
    if (v4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 4, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v24);
LABEL_17:

    }
  }

}

void __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke_2;
  block[3] = &unk_24DD9CF98;
  v10 = v5;
  v11 = v6;
  v12 = *(id *)(a1 + 32);
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __92__WATodayAutoupdatingLocationModel__executeLocationUpdateForLocalWeatherCityWithCompletion___block_invoke_2(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(4);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21AAEC000, v2, OS_LOG_TYPE_DEFAULT, "geocodeRequest ended with newLocation: %@, error: %@", (uint8_t *)&v6, 0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

- (void)_executeLocationUpdateForFirstWeatherCityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *, _QWORD);

  v7 = (void (**)(id, void *, _QWORD))a3;
  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WATodayLoadSavedFirstCityFromPreferences(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WATodayModel setForecastModel:](self, "setForecastModel:", v5);
  if (v7)
  {
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v6, 0);

  }
}

- (void)ubiquitousDefaultsDidChange:(id)a3
{
  id v4;

  if (-[WATodayAutoupdatingLocationModel _reloadForecastData:](self, "_reloadForecastData:", 0))
  {
    -[WATodayAutoupdatingLocationModel forecastModel](self, "forecastModel");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[WATodayModel _fireTodayModelForecastWasUpdated:](self, "_fireTodayModelForecastWasUpdated:", v4);

  }
}

- (BOOL)_reloadForecastData:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v3 = a3;
  v5 = -[WATodayAutoupdatingLocationModel citySource](self, "citySource");
  v12.receiver = self;
  v12.super_class = (Class)WATodayAutoupdatingLocationModel;
  -[WATodayModel forecastModel](&v12, sel_forecastModel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5 == 1)
    WATodayLoadSavedLastForecastModelFromPreferences(v7);
  else
    WATodayLoadSavedFirstCityFromPreferences(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v6)
  {
    if ((objc_msgSend(v9, "isEqual:", v6) & 1) != 0)
    {
LABEL_7:
      v10 = 0;
      goto LABEL_12;
    }
  }
  else if (!v9)
  {
    goto LABEL_7;
  }
  -[WATodayModel setForecastModel:](self, "setForecastModel:", v9);
  if (v3)
    -[WATodayModel _fireTodayModelForecastWasUpdated:](self, "_fireTodayModelForecastWasUpdated:", v9);
  v10 = 1;
LABEL_12:

  return v10;
}

- (void)_persistStateWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  v4 = a3;
  if (objc_msgSend(v4, "isPopulated"))
  {
    objc_msgSend(v4, "city");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "updateCityForModel:", v4);
    }
    else
    {
      WACityFromForecastModel(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
        goto LABEL_13;
    }
    v7 = -[WATodayAutoupdatingLocationModel citySource](self, "citySource");
    -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 1)
    {
      objc_msgSend(v8, "saveToDiskWithLocalWeatherCity:", v6);

    }
    else
    {
      objc_msgSend(v8, "loadSavedCities");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "na_filter:", &__block_literal_global_0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v11, "mutableCopy");

      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(v12, "setObject:atIndexedSubscript:", v6, 0);
        -[WATodayAutoupdatingLocationModel preferences](self, "preferences");
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject saveToDiskWithCities:](v13, "saveToDiskWithCities:", v12);
      }
      else
      {
        WALogForCategory(1);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v14 = 0;
          _os_log_impl(&dword_21AAEC000, v13, OS_LOG_TYPE_DEFAULT, "unable to persist first weather city; preferences doesn't currently have any cities",
            v14,
            2u);
        }
      }

    }
  }
LABEL_13:

}

uint64_t __59__WATodayAutoupdatingLocationModel__persistStateWithModel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isLocalWeatherCity") ^ 1;
}

- (WeatherLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (BOOL)isLocationTrackingEnabled
{
  return self->_isLocationTrackingEnabled;
}

- (BOOL)locationServicesActive
{
  return self->_locationServicesActive;
}

- (WFGeocodeRequest)geocodeRequest
{
  return self->_geocodeRequest;
}

- (void)setGeocodeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_geocodeRequest, a3);
}

- (unint64_t)citySource
{
  return self->_citySource;
}

- (unint64_t)fallbackCitySource
{
  return self->_fallbackCitySource;
}

- (void)setFallbackCitySource:(unint64_t)a3
{
  self->_fallbackCitySource = a3;
}

- (BOOL)stopUpdateIfNeeded
{
  return self->_stopUpdateIfNeeded;
}

- (void)setStopUpdateIfNeeded:(BOOL)a3
{
  self->_stopUpdateIfNeeded = a3;
}

- (NSDate)lastLocationUpdateDate
{
  return self->_lastLocationUpdateDate;
}

- (void)setLastLocationUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationUpdateDate, a3);
}

- (WeatherPreferences)preferences
{
  return self->_preferences;
}

- (id)WeatherLocationManagerGenerator
{
  return self->_WeatherLocationManagerGenerator;
}

- (void)setWeatherLocationManagerGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_WeatherLocationManagerGenerator, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_lastLocationUpdateDate, 0);
  objc_storeStrong((id *)&self->_geocodeRequest, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
}

- (void)_executeLocationUpdateWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Unknown city source; failing location update", v1, 2u);
}

@end
