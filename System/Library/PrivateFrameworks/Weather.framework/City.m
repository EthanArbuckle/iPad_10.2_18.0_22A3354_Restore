@implementation City

+ (id)_ISO8601Calendar
{
  if (_ISO8601Calendar_onceToken != -1)
    dispatch_once(&_ISO8601Calendar_onceToken, &__block_literal_global_29);
  return (id)_ISO8601Calendar_ISO6801Calendar;
}

void __24__City__ISO8601Calendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
  v2 = (void *)_ISO8601Calendar_ISO6801Calendar;
  _ISO8601Calendar_ISO6801Calendar = v1;

}

- (City)init
{
  City *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)City;
  v2 = -[City init](&v8, sel_init);
  if (v2)
  {
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("ShouldWeatherUpdateRapidly"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");
    v6 = 300;
    if (v5)
      v6 = 5;
    v2->_updateInterval = v6;

    v2->_conditionCode = 3200;
    v2->_humidity = 1.1755e-38;
    v2->_heatIndex = 1.1755e-38;
    v2->_windChill = 1.1755e-38;
  }
  return v2;
}

- (City)initWithDictionaryRepresentation:(id)a3
{
  City *v4;

  +[CityPersistenceConversions cityFromDictionary:](CityPersistenceConversions, "cityFromDictionary:", a3);
  v4 = (City *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[City _clearAutoUpdateTimer](self, "_clearAutoUpdateTimer");
  v3.receiver = self;
  v3.super_class = (Class)City;
  -[City dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  -[City locationID](self, "locationID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[City locationID](self, "locationID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationID");
  }
  else
  {
    -[City name](self, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v8, "isEqual:", v9);
  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[City locationID](self, "locationID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)dictionaryRepresentation
{
  return +[CityPersistenceConversions dictionaryRepresentationOfCity:](CityPersistenceConversions, "dictionaryRepresentationOfCity:", self);
}

- (int64_t)conditionCode
{
  void *v3;
  int v4;
  int v5;
  BOOL v6;

  if (conditionCode_onceToken != -1)
    dispatch_once(&conditionCode_onceToken, &__block_literal_global_37);
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalInstall");
  v5 = conditionCode_forceUnsetConditionCode;

  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (v6)
    return self->_conditionCode;
  else
    return 3200;
}

void __21__City_conditionCode__block_invoke()
{
  void *v0;
  id v1;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", CFSTR("Force3200Code"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  conditionCode_forceUnsetConditionCode = objc_msgSend(v0, "BOOLValue");

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v9.receiver = self;
  v9.super_class = (Class)City;
  -[City description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[City name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[City locationID](self, "locationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ -- Name: %@, LocationID: %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)detailedDescription
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  float v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  float v17;
  int v18;
  int v19;
  int v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  float v28;
  void *v29;
  float v30;
  double v31;
  float v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;

  v3 = WAUserTemperatureUnit();
  -[City description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  +[WeatherVisibilityFormatter convenienceFormatter](WeatherVisibilityFormatter, "convenienceFormatter");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  +[WeatherWindSpeedFormatter convenienceFormatter](WeatherWindSpeedFormatter, "convenienceFormatter");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[WeatherPressureFormatter convenienceFormatter](WeatherPressureFormatter, "convenienceFormatter");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[City isLocalWeatherCity](self, "isLocalWeatherCity"))
    objc_msgSend(v5, "appendFormat:", CFSTR("\nLocal Weather City"));
  NSStringFromWeatherConditionCode(-[City conditionCode](self, "conditionCode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCondition Code: %@"), v6);

  v7 = objc_alloc(MEMORY[0x24BEC2220]);
  -[City heatIndex](self, "heatIndex");
  v42 = (void *)objc_msgSend(v7, "initWithTemperatureUnit:value:", 2, v8);
  v9 = (void *)MEMORY[0x24BDD16E0];
  -[City feelsLike](self, "feelsLike");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temperatureForUnit:", v3);
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v42, "temperatureForUnit:", v3);
  objc_msgSend(v13, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringValue");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nFeels Like: %@, Heat Index: %@"), v12, v15);

  v16 = objc_alloc(MEMORY[0x24BEC2220]);
  -[City windChill](self, "windChill");
  v41 = (void *)objc_msgSend(v16, "initWithTemperatureUnit:value:", 2, v17);
  -[City windSpeed](self, "windSpeed");
  v19 = v18;
  -[City windDirection](self, "windDirection");
  LODWORD(v21) = v20;
  LODWORD(v22) = v19;
  objc_msgSend(v45, "formattedStringForSpeed:direction:", v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v41, "temperatureForUnit:", v3);
  objc_msgSend(v24, "numberWithDouble:");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringValue");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nWind Chill: %@, Wind: %@"), v26, v23);

  v27 = objc_alloc(MEMORY[0x24BEC2220]);
  -[City dewPoint](self, "dewPoint");
  v29 = (void *)objc_msgSend(v27, "initWithTemperatureUnit:value:", 2, v28);
  -[City humidity](self, "humidity");
  v31 = v30;
  -[City visibility](self, "visibility");
  objc_msgSend(v44, "stringFromKilometers:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[City pressure](self, "pressure");
  objc_msgSend(v43, "stringFromMillibars:");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v29, "temperatureForUnit:", v3);
  objc_msgSend(v35, "numberWithDouble:");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringValue");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nHumidity %f%%, Visibility: %@, Pressure: %@, Dewpoint: %@, UV Index: %lu"), *(_QWORD *)&v31, v33, v34, v37, -[City uvIndex](self, "uvIndex"));

  objc_msgSend(v5, "appendFormat:", CFSTR("\nObservation Time: %lu Sunrise: %lu, Sunset: %lu, Moonphase: %lu"), -[City observationTime](self, "observationTime"), -[City sunriseTime](self, "sunriseTime"), -[City sunsetTime](self, "sunsetTime"), -[City moonPhase](self, "moonPhase"));
  -[City dayForecasts](self, "dayForecasts");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nForecasts: %@"), v38);

  -[City hourlyForecasts](self, "hourlyForecasts");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nHourly Forecasts: %@>"), v39);

  return v5;
}

- (void)addUpdateObserver:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[City cityUpdateObservers](self, "cityUpdateObservers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v9);

  if (v5)
    NSLog(CFSTR("cityUpdateObservers already contains observer."));
  -[City cityUpdateObservers](self, "cityUpdateObservers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setCityUpdateObservers:](self, "setCityUpdateObservers:", v7);

  }
  -[City cityUpdateObservers](self, "cityUpdateObservers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v9);

}

- (void)removeUpdateObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[City cityUpdateObservers](self, "cityUpdateObservers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v4);

}

- (void)_clearAutoUpdateTimer
{
  NSTimer *autoUpdateTimer;

  -[NSTimer invalidate](self->_autoUpdateTimer, "invalidate");
  autoUpdateTimer = self->_autoUpdateTimer;
  self->_autoUpdateTimer = 0;

}

- (void)setAutoUpdate:(BOOL)a3
{
  id v4;

  if (self->_autoUpdate != a3)
  {
    self->_autoUpdate = a3;
    -[City _clearAutoUpdateTimer](self, "_clearAutoUpdateTimer");
    if (self->_autoUpdate && !-[City isLocalWeatherCity](self, "isLocalWeatherCity"))
    {
      -[City update](self, "update");
      objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_update, 0, 1, (double)300);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      -[City setAutoUpdateTimer:](self, "setAutoUpdateTimer:", v4);

    }
  }
}

- (id)displayName
{
  void *v3;

  -[City name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[City name](self, "name");
  else
    -[City locationID](self, "locationID");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTemperature:(id)a3
{
  WFTemperature **p_temperature;
  WFTemperature *temperature;
  id v7;

  v7 = a3;
  if (!-[City lockedForDemoMode](self, "lockedForDemoMode"))
  {
    temperature = self->_temperature;
    p_temperature = &self->_temperature;
    if ((objc_msgSend(v7, "isEqual:", temperature) & 1) == 0)
      objc_storeStrong((id *)p_temperature, a3);
  }

}

- (void)setDayForecasts:(id)a3
{
  NSArray *v4;
  NSArray *dayForecasts;
  id v6;

  v6 = a3;
  if (!-[City lockedForDemoMode](self, "lockedForDemoMode"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    dayForecasts = self->_dayForecasts;
    self->_dayForecasts = v4;

  }
}

- (NSArray)dayForecasts
{
  if (self->_dayForecasts)
    return self->_dayForecasts;
  else
    return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (void)setHourlyForecasts:(id)a3
{
  NSArray *v4;
  NSArray *hourlyForecasts;
  id v6;

  v6 = a3;
  if (!-[City lockedForDemoMode](self, "lockedForDemoMode"))
  {
    v4 = (NSArray *)objc_msgSend(v6, "copy");
    hourlyForecasts = self->_hourlyForecasts;
    self->_hourlyForecasts = v4;

  }
}

- (NSArray)hourlyForecasts
{
  if (self->_hourlyForecasts)
    return self->_hourlyForecasts;
  else
    return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (int64_t)timeDigit
{
  void *v2;
  int64_t v3;

  -[City timeZone](self, "timeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CityTimeDigitForTimeZone(v2);

  return v3;
}

- (void)setIsDay:(BOOL)a3
{
  if (!-[City lockedForDemoMode](self, "lockedForDemoMode"))
    self->_isDay = a3;
}

- (BOOL)isDay
{
  int64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (-[City lockedForDemoMode](self, "lockedForDemoMode"))
    return self->_isDay;
  if (-[City weatherDataAge](self, "weatherDataAge") == 2
    || !-[City observationTime](self, "observationTime")
    && !-[City sunriseTime](self, "sunriseTime")
    && !-[City sunsetTime](self, "sunsetTime"))
  {
    return 1;
  }
  v4 = -[City timeDigit](self, "timeDigit");
  if (v4 - -[City observationTime](self, "observationTime") > 5)
    -[City setObservationTime:](self, "setObservationTime:", v4);
  v5 = -[City sunsetTime](self, "sunsetTime");
  v6 = -[City sunriseTime](self, "sunriseTime");
  v7 = -[City observationTime](self, "observationTime");
  if (v5 <= v6)
  {
    if (v7 > -[City sunsetTime](self, "sunsetTime"))
    {
      v9 = -[City observationTime](self, "observationTime");
      return v9 >= -[City sunriseTime](self, "sunriseTime");
    }
    return 1;
  }
  if (v7 <= -[City sunriseTime](self, "sunriseTime"))
    return 0;
  v8 = -[City observationTime](self, "observationTime");
  return v8 < -[City sunsetTime](self, "sunsetTime");
}

- (unint64_t)weatherDataAge
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  void *v11;
  int IsTodayInTimezone;

  -[City updateTime](self, "updateTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 2;
  -[City updateTime](self, "updateTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  v7 = -v6;
  if (v6 >= 0.0)
    v7 = v6;
  if (v7 >= 0.0)
    v8 = v7;
  else
    v8 = -v7;
  if (v8 < (double)-[City updateInterval](self, "updateInterval"))
    return 0;
  -[City updateTime](self, "updateTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[City timeZone](self, "timeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  IsTodayInTimezone = DateIsTodayInTimezone(v10, v11);

  if (IsTodayInTimezone)
    return 1;
  else
    return 2;
}

- (void)localWeatherDidBeginUpdate
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[City cityUpdateObservers](self, "cityUpdateObservers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "cityDidStartWeatherUpdate:", self, (_QWORD)v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)update
{
  NSObject *v3;
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  BOOL v8;
  NSObject *v10;

  WALogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[City update].cold.4(self);

  if (-[City _dataIsValid](self, "_dataIsValid") && !-[City weatherDataAge](self, "weatherDataAge"))
  {
    WALogForCategory(0);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[City update].cold.1(self);

    -[City _updateTimeZone](self, "_updateTimeZone");
    return 0;
  }
  else
  {
    if (-[City isLocalWeatherCity](self, "isLocalWeatherCity"))
      +[TWCLocationUpdater sharedLocationUpdater](TWCLocationUpdater, "sharedLocationUpdater");
    else
      +[TWCCityUpdater sharedCityUpdater](TWCCityUpdater, "sharedCityUpdater");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUpdatingCity:", self);
    WALogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
    if ((v5 & 1) != 0)
    {
      if (v7)
        -[City update].cold.2(self);

    }
    else
    {
      if (v7)
        -[City update].cold.3(self);

      -[City setIsUpdating:](self, "setIsUpdating:", 1);
      -[City _notifyDidStartWeatherUpdate](self, "_notifyDidStartWeatherUpdate");
      objc_msgSend(v4, "updateWeatherForCity:", self);
    }
    -[City _updateTimeZone](self, "_updateTimeZone");
    v8 = -[City isUpdating](self, "isUpdating");

  }
  return v8;
}

- (void)_notifyDidStartWeatherUpdate
{
  id *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)MEMORY[0x24BDF74F8];
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "conformsToProtocol:", &unk_255131D80)
    && objc_msgSend(*v3, "showProgressIndicator"))
  {
    +[ProgressController sharedProgressController](ProgressController, "sharedProgressController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLoadingData:", 1);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[City cityUpdateObservers](self, "cityUpdateObservers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "cityDidStartWeatherUpdate:", self);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)timeZoneIsFresh
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  -[City timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[City timeZoneUpdateDate](self, "timeZoneUpdateDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceNow");
    v6 = v5 >= -86400.0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_updateTimeZone
{
  if (!-[City timeZoneIsFresh](self, "timeZoneIsFresh"))
    -[City updateTimeZoneWithCompletionBlock:](self, "updateTimeZoneWithCompletionBlock:", 0);
}

- (void)updateTimeZoneWithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t, City *);
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(id *, void *, void *);
  void *v16;
  City *v17;
  void (**v18)(id, uint64_t, City *);
  id v19;
  id location;
  CLLocationCoordinate2D v21;

  v4 = (void (**)(id, uint64_t, City *))a3;
  if (-[City isLocalWeatherCity](self, "isLocalWeatherCity")
    || (-[City coordinate](self, "coordinate"), !CLLocationCoordinate2DIsValid(v21)))
  {
    if (v4)
      v4[2](v4, 1, self);
  }
  else
  {
    -[City activeGeocodeRequest](self, "activeGeocodeRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (v4)
        v4[2](v4, 2, self);
    }
    else
    {
      objc_initWeak(&location, self);
      v6 = objc_alloc(MEMORY[0x24BEC21D8]);
      -[City coordinate](self, "coordinate");
      v8 = v7;
      v10 = v9;
      v13 = MEMORY[0x24BDAC760];
      v14 = 3221225472;
      v15 = __42__City_updateTimeZoneWithCompletionBlock___block_invoke;
      v16 = &unk_24DD9D5E0;
      objc_copyWeak(&v19, &location);
      v17 = self;
      v18 = v4;
      v11 = (void *)objc_msgSend(v6, "initWithCoordinate:resultHandler:", &v13, v8, v10);
      -[City setActiveGeocodeRequest:](self, "setActiveGeocodeRequest:", v11, v13, v14, v15, v16);

      -[City activeGeocodeRequest](self, "activeGeocodeRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "start");

      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

}

void __42__City_updateTimeZoneWithCompletionBlock___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2;
  block[3] = &unk_24DD9D5B8;
  v7 = v6;
  v11 = v7;
  objc_copyWeak(&v15, a1 + 6);
  v8 = v5;
  v12 = v8;
  v9 = a1[5];
  v13 = a1[4];
  v14 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(a1[4], "setActiveGeocodeRequest:", 0);

  objc_destroyWeak(&v15);
}

void __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id to;

  v2 = (uint64_t *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    WALogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2_cold_1(v2, v3);

    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v4 + 16))(v4, 1, *(_QWORD *)(a1 + 48));
  }
  else
  {
    objc_copyWeak(&to, (id *)(a1 + 64));
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_loadWeakRetained(&to);
    objc_msgSend(v6, "setWfLocation:", v5);

    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, 0, *(_QWORD *)(a1 + 48));
    objc_destroyWeak(&to);
  }
}

- (void)clearForecasts
{
  -[City setDayForecasts:](self, "setDayForecasts:", 0);
  -[City setHourlyForecasts:](self, "setHourlyForecasts:", 0);
  -[City setAirQualityIdx:](self, "setAirQualityIdx:", 0);
  -[City setAirQualityScaleCategory:](self, "setAirQualityScaleCategory:", 0);
  -[City setAirQualityCategory:](self, "setAirQualityCategory:", 0);
}

- (void)setUpdateTime:(id)a3
{
  id v5;
  NSString *updateTimeString;
  __CFDateFormatter *v7;
  __CFString *StringWithDate;
  NSString *v9;
  NSObject *v10;

  v5 = a3;
  objc_storeStrong((id *)&self->_updateTime, a3);
  updateTimeString = self->_updateTimeString;
  self->_updateTimeString = 0;

  if (self->_updateTime)
  {
    if (setUpdateTime__locale)
    {
      v7 = (__CFDateFormatter *)setUpdateTime__timeDateFormatter;
      if (setUpdateTime__timeDateFormatter)
      {
LABEL_4:
        StringWithDate = (__CFString *)CFDateFormatterCreateStringWithDate(0, v7, (CFDateRef)self->_updateTime);
        v9 = self->_updateTimeString;
        self->_updateTimeString = &StringWithDate->isa;

        goto LABEL_9;
      }
    }
    else
    {
      setUpdateTime__locale = (uint64_t)CFLocaleCopyCurrent();
      v7 = CFDateFormatterCreate(0, (CFLocaleRef)setUpdateTime__locale, kCFDateFormatterShortStyle, kCFDateFormatterShortStyle);
      setUpdateTime__timeDateFormatter = (uint64_t)v7;
      if (v7)
        goto LABEL_4;
    }
    WALogForCategory(1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[City setUpdateTime:].cold.1(v10);

  }
LABEL_9:

}

- (void)cityDidFinishUpdatingWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[City cityDidFinishUpdatingWithError:].cold.1();

  if (-[City isUpdating](self, "isUpdating"))
  {
    -[City setIsUpdating:](self, "setIsUpdating:", 0);
    v6 = (id *)MEMORY[0x24BDF74F8];
    if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "conformsToProtocol:", &unk_255131D80))
    {
      if (objc_msgSend(*v6, "showProgressIndicator"))
      {
        +[ProgressController sharedProgressController](ProgressController, "sharedProgressController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setLoadingData:", 0);

      }
    }
  }
  if (objc_msgSend(v4, "code") == 3072)
  {
    -[City setLastUpdateStatus:](self, "setLastUpdateStatus:", 2);
    -[City setLastUpdateError:](self, "setLastUpdateError:", v4);
LABEL_10:
    -[City discardDataIfNeeded](self, "discardDataIfNeeded");
    goto LABEL_11;
  }
  -[City setLastUpdateStatus:](self, "setLastUpdateStatus:", v4 != 0);
  -[City setLastUpdateError:](self, "setLastUpdateError:", v4);
  if (v4)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setUpdateTime:](self, "setUpdateTime:", v15);

  -[City dayForecasts](self, "dayForecasts");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compareDayNumberToDayForecast_);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setDayForecasts:](self, "setDayForecasts:", v17);

LABEL_11:
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[City cityUpdateObservers](self, "cityUpdateObservers", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "cityDidFinishWeatherUpdate:", self);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:", CFSTR("CityDidUpdate"), self);

}

- (BOOL)_isUpdating
{
  void *v3;

  +[TWCCityUpdater sharedCityUpdater](TWCCityUpdater, "sharedCityUpdater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "isUpdatingCity:", self);

  return (char)self;
}

- (BOOL)isUpdatingOrNoData
{
  return !self->_updateTime || -[City _isUpdating](self, "_isUpdating");
}

- (id)cityAndState
{
  void *v3;
  void *v4;
  void *v5;

  if (self->_state)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    -[City name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, self->_state);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[City name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (NSString)weatherLocationCitationName
{
  void *v3;
  void *v4;
  void *v5;

  if (-[City isLocalWeatherCity](self, "isLocalWeatherCity")
    && (-[City weatherLocationName](self, "weatherLocationName"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[City weatherLocationName](self, "weatherLocationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[City isLocalWeatherCity](self, "isLocalWeatherCity")
         || (-[City searchTitle](self, "searchTitle"),
             v5 = (void *)objc_claimAutoreleasedReturnValue(),
             v5,
             !v5))
  {
    -[City name](self, "name");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[City searchTitle](self, "searchTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSString *)v4;
}

- (void)setName:(id)a3
{
  City *v4;
  uint64_t v5;
  NSString *name;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!-[City lockedForDemoMode](v4, "lockedForDemoMode"))
  {
    v5 = objc_msgSend(v7, "copy");
    name = v4->_name;
    v4->_name = (NSString *)v5;

  }
  objc_sync_exit(v4);

}

- (id)getName
{
  City *v2;
  NSString *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_name;
  objc_sync_exit(v2);

  return v3;
}

- (void)setConditionCode:(int64_t)a3
{
  if (!-[City lockedForDemoMode](self, "lockedForDemoMode"))
    self->_conditionCode = a3;
}

- (void)setWfLocation:(id)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  WFLocation **p_wfLocation;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  WFLocation *wfLocation;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  id v30;

  v30 = a3;
  v5 = -[City lockedForDemoMode](self, "lockedForDemoMode");
  v6 = v30;
  if (!v5)
  {
    if (!v30
      || (objc_msgSend(v30, "geoLocation"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7))
    {
      wfLocation = self->_wfLocation;
      self->_wfLocation = 0;

      -[City setTimeZone:](self, "setTimeZone:", 0);
      -[City setTimeZoneUpdateDate:](self, "setTimeZoneUpdateDate:", 0);
      -[City setISO3166CountryAbbreviation:](self, "setISO3166CountryAbbreviation:", 0);
LABEL_16:
      v6 = v30;
      goto LABEL_17;
    }
    p_wfLocation = &self->_wfLocation;
    v9 = objc_msgSend(v30, "isEqual:", self->_wfLocation);
    v6 = v30;
    if (!v9)
      goto LABEL_14;
    objc_msgSend(v30, "geoLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFLocation geoLocation](*p_wfLocation, "geoLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "distanceFromLocation:", v11);
    v13 = v12;
    v14 = *(double *)&CityMinimumContainmentDistance;

    v6 = v30;
    if (v13 >= v14)
      goto LABEL_14;
    objc_msgSend(v30, "countryAbbreviation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[City ISO3166CountryAbbreviation](self, "ISO3166CountryAbbreviation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", v16))
    {
      objc_msgSend(v30, "timeZone");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[City timeZone](self, "timeZone");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToTimeZone:", v18))
      {
        objc_msgSend(v30, "weatherLocationName");
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
        {

          goto LABEL_15;
        }
        v20 = (void *)v19;
        objc_msgSend(v30, "weatherLocationName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFLocation weatherLocationName](*p_wfLocation, "weatherLocationName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v21, "isEqualToString:", v22);

        v6 = v30;
        if ((v29 & 1) != 0)
          goto LABEL_17;
LABEL_14:
        objc_msgSend(v6, "timeZone");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_storeStrong((id *)&self->_wfLocation, a3);
        objc_msgSend(v30, "geoLocation");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[City setLocation:](self, "setLocation:", v24);

        -[City setTimeZone:](self, "setTimeZone:", v15);
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[City setTimeZoneUpdateDate:](self, "setTimeZoneUpdateDate:", v25);

        objc_msgSend(v30, "countryAbbreviation");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[City setISO3166CountryAbbreviation:](self, "setISO3166CountryAbbreviation:", v26);

        objc_msgSend(v30, "weatherDisplayName");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[City setWeatherDisplayName:](self, "setWeatherDisplayName:", v27);

        objc_msgSend(v30, "weatherLocationName");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[City setWeatherLocationName:](self, "setWeatherLocationName:", v28);

LABEL_15:
        goto LABEL_16;
      }

    }
    v6 = v30;
    goto LABEL_14;
  }
LABEL_17:

}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v6;

  longitude = a3.longitude;
  latitude = a3.latitude;
  if (!-[City lockedForDemoMode](self, "lockedForDemoMode"))
  {
    v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", latitude, longitude);
    -[City setLocation:](self, "setLocation:", v6);

  }
}

- (CLLocationCoordinate2D)coordinate
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CLLocationCoordinate2D result;

  -[City location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[City location](self, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;

  }
  else
  {
    v6 = *MEMORY[0x24BDBFB70];
    v8 = *(double *)(MEMORY[0x24BDBFB70] + 8);
  }
  v9 = v6;
  v10 = v8;
  result.longitude = v10;
  result.latitude = v9;
  return result;
}

- (double)latitude
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[City location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return *MEMORY[0x24BDBFB70];
  -[City location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;

  return v6;
}

- (void)setLatitude:(double)a3
{
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;

  -[City longitude](self, "longitude");
  v6 = CLLocationCoordinate2DMake(a3, v5);
  -[City setCoordinate:](self, "setCoordinate:", v6.latitude, v6.longitude);
}

- (double)longitude
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[City location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return *(double *)(MEMORY[0x24BDBFB70] + 8);
  -[City location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coordinate");
  v6 = v5;

  return v6;
}

- (void)setLongitude:(double)a3
{
  CLLocationDegrees v5;
  CLLocationCoordinate2D v6;

  -[City latitude](self, "latitude");
  v6 = CLLocationCoordinate2DMake(v5, a3);
  -[City setCoordinate:](self, "setCoordinate:", v6.latitude, v6.longitude);
}

- (NSString)locationID
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[City location](self, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[City location](self, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "coordinate");
    v7 = v6;
    -[City location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "coordinate");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%f,%f"), v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return (NSString *)v10;
}

- (BOOL)populateWithDataFromCity:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  if (-[City lockedForDemoMode](self, "lockedForDemoMode"))
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setName:](self, "setName:", v6);

    objc_msgSend(v4, "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setState:](self, "setState:", v7);

    objc_msgSend(v4, "deeplink");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setDeeplink:](self, "setDeeplink:", v8);

    objc_msgSend(v4, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setTimeZone:](self, "setTimeZone:", v9);

    objc_msgSend(v4, "temperature");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setTemperature:](self, "setTemperature:", v10);

    objc_msgSend(v4, "heatIndex");
    -[City setHeatIndex:](self, "setHeatIndex:");
    objc_msgSend(v4, "visibility");
    -[City setVisibility:](self, "setVisibility:");
    objc_msgSend(v4, "windChill");
    -[City setWindChill:](self, "setWindChill:");
    objc_msgSend(v4, "windDirection");
    -[City setWindDirection:](self, "setWindDirection:");
    objc_msgSend(v4, "windSpeed");
    -[City setWindSpeed:](self, "setWindSpeed:");
    objc_msgSend(v4, "heatIndex");
    -[City setHeatIndex:](self, "setHeatIndex:");
    -[City setConditionCode:](self, "setConditionCode:", objc_msgSend(v4, "conditionCode"));
    objc_msgSend(v4, "dayForecasts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setDayForecasts:](self, "setDayForecasts:", v11);

    objc_msgSend(v4, "hourlyForecasts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setHourlyForecasts:](self, "setHourlyForecasts:", v12);

    -[City setObservationTime:](self, "setObservationTime:", objc_msgSend(v4, "observationTime"));
    -[City setSunsetTime:](self, "setSunsetTime:", objc_msgSend(v4, "sunsetTime"));
    -[City setSunriseTime:](self, "setSunriseTime:", objc_msgSend(v4, "sunriseTime"));
    -[City setMoonPhase:](self, "setMoonPhase:", objc_msgSend(v4, "moonPhase"));
    -[City updateTime](self, "updateTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTime");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToDate:", v14);

    objc_msgSend(v4, "updateTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setUpdateTime:](self, "setUpdateTime:", v16);

    -[City setLastUpdateStatus:](self, "setLastUpdateStatus:", objc_msgSend(v4, "lastUpdateStatus"));
    -[City locationID](self, "locationID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "locationID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v15 & objc_msgSend(v17, "isEqualToString:", v18) ^ 1;

    objc_msgSend(v4, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setLocation:](self, "setLocation:", v19);

  }
  return v5;
}

- (void)discardDataIfNeeded
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "displayName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_21AAEC000, v2, v3, "Weather data is outdated for %@; dumping data...",
    v4,
    v5,
    v6,
    v7,
    v8);

  OUTLINED_FUNCTION_1_0();
}

- (id)windDirectionAsString:(double)a3
{
  float v3;
  unsigned int v4;

  v3 = a3 + 22.5;
  v4 = vcvtms_s32_f32(v3 / 45.0);
  if (v4 > 8)
    return &stru_24DD9EDF8;
  else
    return off_24DD9D600[v4];
}

- (BOOL)containsLatitude:(double)a3 longitude:(double)a4
{
  double v4;

  -[City distanceToLatitude:longitude:](self, "distanceToLatitude:longitude:", a3, a4);
  return v4 < *(double *)&CityMinimumContainmentDistance;
}

- (double)distanceToLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  -[City location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[City location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "distanceFromLocation:", v4);
    v8 = v7;

  }
  else
  {
    v8 = 1.79769313e308;
  }

  return v8;
}

- (double)distanceToLatitude:(double)a3 longitude:(double)a4
{
  void *v5;
  double v6;
  double v7;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", a3, a4);
  -[City distanceToLocation:](self, "distanceToLocation:", v5);
  v7 = v6;

  return v7;
}

+ (id)cityContainingLocation:(id)a3 expectedName:(id)a4 fromCities:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  void *v19;
  int v20;
  double *v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v25;
    v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "distanceToLocation:", v7);
        v18 = v17;
        objc_msgSend(v16, "name");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", v8);

        if (v18 <= v14)
        {
          v21 = (double *)&CityMinimumContainmentDistanceMatchingNames;
          if (!v20)
            v21 = (double *)&CityMinimumContainmentDistance;
          if (v18 <= *v21)
          {
            v22 = v16;

            v12 = v22;
            v14 = v18;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isDuplicateOfCity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[City isLocalWeatherCity](self, "isLocalWeatherCity")
    || (objc_msgSend(v4, "isLocalWeatherCity") & 1) != 0
    || (-[City name](self, "name"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "name"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        !v7))
  {
    v13 = 0;
  }
  else
  {
    v8 = (void *)objc_opt_class();
    -[City location](self, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[City name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cityContainingLocation:expectedName:fromCities:", v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

  }
  return v13;
}

- (int64_t)primaryConditionForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSArray **p_hourlyForecasts;
  NSObject *v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  int64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _OWORD v24[24];
  uint64_t v25;
  uint64_t v26;
  NSRange v27;

  length = a3.length;
  location = a3.location;
  v26 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  memset(v24, 0, sizeof(v24));
  p_hourlyForecasts = &self->_hourlyForecasts;
  if (a3.location < -[NSArray count](self->_hourlyForecasts, "count")
    && location + length <= -[NSArray count](*p_hourlyForecasts, "count"))
  {
    -[NSArray subarrayWithRange:](*p_hourlyForecasts, "subarrayWithRange:", location, length);
    v7 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WALogForCategory(1);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v27.location = location;
      v27.length = length;
      -[City primaryConditionForRange:].cold.1(v27, (id *)p_hourlyForecasts, v6);
    }

    v7 = *p_hourlyForecasts;
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v7;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v13, "conditionCode", (_QWORD)v19) <= 47)
        {
          v14 = objc_msgSend(v13, "conditionCode");
          ++*((_QWORD *)v24 + v14);
        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v10);
  }

  v15 = 0;
  v16 = 0;
  v17 = 3200;
  do
  {
    if (*((_QWORD *)v24 + v15) > v16)
    {
      v17 = v15;
      v16 = *((_QWORD *)v24 + v15);
    }
    ++v15;
  }
  while (v15 != 48);

  return v17;
}

- (int64_t)locationOfTime:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_hourlyForecasts;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      v9 = 0;
      v10 = v7 + v6;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "time", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[WAHourlyForecast TimeValueFromString:](WAHourlyForecast, "TimeValueFromString:", v11);

        if (v12 == a3)
        {
          v13 = v7 + v9;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v7 = v10;
      if (v6)
        continue;
      break;
    }
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v13;
}

- (id)naturalLanguageDescription
{
  return -[City naturalLanguageDescriptionWithDescribedCondition:](self, "naturalLanguageDescriptionWithDescribedCondition:", 0);
}

- (id)naturalLanguageDescriptionWithDescribedCondition:(int64_t *)a3
{
  int v5;
  uint64_t v6;
  int64_t conditionCode;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  __CFString *v14;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  _BOOL4 v23;
  _BOOL4 v24;
  float windSpeed;
  float visibility;
  _BOOL4 v27;
  const __CFString *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  int v32;
  void *v33;
  void **v34;
  void *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t observationTime;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  int64_t v54;
  int64_t v55;
  uint64_t v56;
  int64_t v57;
  int64_t v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  NSObject *v64;
  _BOOL4 v65;
  int64_t v66;
  int64_t v67;
  uint64_t v68;
  int64_t v69;
  int64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  _QWORD *v74;
  int64_t v75;
  int64_t v76;
  int64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  NSUInteger v100;
  uint64_t v101;
  void *v102;
  __CFString *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  _QWORD v109[5];
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[3];
  _QWORD v113[2];
  _QWORD v114[5];
  _QWORD v115[5];
  _QWORD v116[4];
  _QWORD v117[5];
  _QWORD v118[4];
  _QWORD v119[2];
  void *v120;
  _QWORD v121[4];

  v121[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[City isDay](self, "isDay");
  v6 = WAUserTemperatureUnit();
  conditionCode = self->_conditionCode;
  if (conditionCode != 3200)
  {
    v8 = v6;
    -[City locationID](self, "locationID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      LocalizedWeatherDescription(self->_conditionCode, v5, 1);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSArray count](self->_dayForecasts, "count");
      v12 = -[NSArray count](self->_hourlyForecasts, "count");
      if (v11)
      {
        -[NSArray firstObject](self->_dayForecasts, "firstObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = 0;
      }
      if (self->_conditionCode <= 2)
      {
        v16 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("MAJOR_EVENT_FORMAT"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v18, v108);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_96;
      }
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v106 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16A8], "string");
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFTemperature temperatureForUnit:](self->_feelsLike, "temperatureForUnit:", 2);
      v20 = v19;
      -[WFTemperature temperatureForUnit:](self->_temperature, "temperatureForUnit:", 2);
      v100 = v12;
      if (self->_feelsLike)
      {
        v22 = v20 - v21;
        v23 = v22 > 10.0 || v20 <= *(double *)&CityMaxWindChillTemperature;
        v24 = v22 > 10.0 || v20 >= *(double *)&CityMinHeatIndexTemperature;
      }
      else
      {
        v23 = 0;
        v24 = 0;
      }
      windSpeed = self->_windSpeed;
      visibility = self->_visibility;
      v27 = visibility <= 1.6 && visibility != 1.1755e-38;
      v28 = CFSTR("FAHRENHEIT");
      if ((_DWORD)v8 == 2)
        v28 = CFSTR("CELSIUS");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TEMP_UNIT_%@"), v28);
      v29 = objc_claimAutoreleasedReturnValue();
      v102 = (void *)v29;
      if (WAIsChinaSKUAndSimplifiedChinese())
      {
        v30 = &stru_24DD9EDF8;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "localizedStringForKey:value:table:", v29, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v30 = (const __CFString *)objc_claimAutoreleasedReturnValue();

      }
      v32 = v23 || v24;
      if (windSpeed >= 25.0)
        v32 = 1;
      v103 = (__CFString *)v30;
      v104 = v13;
      if ((v32 | v27) != 1)
      {
LABEL_39:
        observationTime = self->_observationTime;
        if (observationTime - 400 <= 0x258)
        {
          WALogForCategory(0);
          v43 = objc_claimAutoreleasedReturnValue();
          v44 = v107;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            -[City naturalLanguageDescriptionWithDescribedCondition:].cold.2();

          objc_msgSend(v105, "appendFormat:", CFSTR("Forecast Type %d to %d"), 400, 1000);
          v45 = -[City primaryConditionForRange:](self, "primaryConditionForRange:", 0, v100);
          if (!objc_msgSend(v107, "length") && v45 != 3200)
          {
            objc_msgSend(v107, "appendString:", CFSTR("TODAY_CONDITION_"));
            LocalizedWeatherDescription(v45, 1, 1);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "addObject:", v46);

            objc_msgSend(v107, "appendString:", CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE"));
            WATemperatureStringForOutputUnit(self->_temperature, v8);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v118[0] = v47;
            v118[1] = v30;
            objc_msgSend(v104, "high");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = v8;
            v50 = v106;
            WATemperatureStringForOutputUnit(v48, v49);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v118[2] = v51;
            v118[3] = v30;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v118, 4);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "addObjectsFromArray:", v52);

            conditionCode = v45;
LABEL_91:
            v62 = 0x24BDD1000uLL;
            goto LABEL_92;
          }
          v62 = 0x24BDD1000;
          if (objc_msgSend(v107, "length"))
            goto LABEL_57;
          objc_msgSend(v107, "appendString:", CFSTR("CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WILL_BE"));
          v117[0] = v108;
          WATemperatureStringForOutputUnit(self->_temperature, v8);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v117[1] = v47;
          v117[2] = v30;
          objc_msgSend(v104, "high");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          WATemperatureStringForOutputUnit(v48, v8);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v117[3] = v51;
          v117[4] = v30;
          v81 = (void *)MEMORY[0x24BDBCE30];
          v82 = v117;
          goto LABEL_79;
        }
        v44 = v107;
        if (observationTime - 1001 > 0x31F)
        {
          v63 = observationTime - 1801;
          WALogForCategory(0);
          v64 = objc_claimAutoreleasedReturnValue();
          v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
          if (v63 > 0x22E)
          {
            if (v65)
              -[City naturalLanguageDescriptionWithDescribedCondition:].cold.5();

            objc_msgSend(v105, "appendFormat:", CFSTR("Forecast Type %d to %d"), 2359, 400);
            v75 = -[City locationOfTime:](self, "locationOfTime:", 400);
            v76 = -[City locationOfTime:](self, "locationOfTime:", 2400);
            if (v75 != 0x7FFFFFFFFFFFFFFFLL && v76 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v77 = v100;
              if (v75 < v76)
                v77 = v76;
              conditionCode = -[City primaryConditionForRange:](self, "primaryConditionForRange:", v75, v77 - v75);
              objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("CONDITION_LIKELY_TOMORROW_WITH_HIGH_AND_LOW"));
              v101 = objc_claimAutoreleasedReturnValue();

              LocalizedWeatherDescription(conditionCode, 1, 1);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v110[0] = v47;
              objc_msgSend(v104, "high");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v48, v8);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v110[1] = v51;
              v110[2] = v30;
              objc_msgSend(v104, "low");
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v78, (_DWORD)v8 == 2);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v110[3] = v79;
              v110[4] = v103;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v110, 5);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v106;
              objc_msgSend(v106, "addObjectsFromArray:", v80);

              v107 = (void *)v101;
              goto LABEL_91;
            }
            v62 = 0x24BDD1000;
            if (objc_msgSend(v107, "length"))
            {
LABEL_57:
              v13 = v104;
              v50 = v106;
LABEL_93:
              objc_msgSend(v105, "appendFormat:", CFSTR(" - wc %f hi %f w %f v %f / hours %d / "), self->_windChill, self->_heatIndex, self->_windSpeed, self->_visibility, -[NSArray count](self->_hourlyForecasts, "count"));
              v93 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(*(id *)(v62 + 1160), "bundleForClass:", objc_opt_class());
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "localizedStringForKey:value:table:", v44, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
              v95 = v44;
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "stringWithFormat:andArguments:", v96, v50);
              v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v105, "appendString:", v14);
              WALogForCategory(1);
              v97 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                -[City naturalLanguageDescriptionWithDescribedCondition:].cold.1();

LABEL_96:
              if (!a3)
                return v14;
              goto LABEL_6;
            }
            objc_msgSend(v107, "appendString:", CFSTR("CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WILL_BE"));
            v109[0] = v108;
            WATemperatureStringForOutputUnit(self->_temperature, v8);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v109[1] = v47;
            v109[2] = v30;
            objc_msgSend(v104, "high");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            WATemperatureStringForOutputUnit(v48, v8);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v109[3] = v51;
            v109[4] = v30;
            v81 = (void *)MEMORY[0x24BDBCE30];
            v82 = v109;
LABEL_79:
            objc_msgSend(v81, "arrayWithObjects:count:", v82, 5);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v106;
            objc_msgSend(v106, "addObjectsFromArray:", v83);

LABEL_92:
            v13 = v104;
            v44 = v107;
            goto LABEL_93;
          }
          if (v65)
            -[City naturalLanguageDescriptionWithDescribedCondition:].cold.4();

          objc_msgSend(v105, "appendFormat:", CFSTR("Forecast Type %d to %d"), 1800, 2359);
          v66 = -[City locationOfTime:](self, "locationOfTime:", 2359);
          v67 = -[City locationOfTime:](self, "locationOfTime:", 0);
          v68 = objc_msgSend(v107, "length");
          if (v66 != 0x7FFFFFFFFFFFFFFFLL && v67 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v68)
            {
              objc_msgSend(v107, "appendFormat:", CFSTR("CURRENTLY_COMMA_"));
              objc_msgSend(v106, "addObject:", v108);
            }
            v69 = v100;
            if (v66 < v67)
              v69 = v67;
            v70 = -[City primaryConditionForRange:](self, "primaryConditionForRange:", v66, v69 - v66);
            if (self->_conditionCode == v70)
            {
              objc_msgSend(v107, "appendFormat:", CFSTR("AFTERNOON_SAME"));
              objc_msgSend(v13, "low");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v47, v8);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v113[0] = v48;
              v113[1] = v30;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v113, 2);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v106;
              objc_msgSend(v106, "addObjectsFromArray:", v51);
              goto LABEL_91;
            }
            v87 = v70;
            objc_msgSend(v107, "appendFormat:", CFSTR("AFTERNOON_DIFFERENT"));
            LocalizedWeatherDescription(v87, 0, 0);
            v88 = objc_claimAutoreleasedReturnValue();
            v89 = v13;
            v47 = (void *)v88;
            v112[0] = v88;
            objc_msgSend(v89, "low");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            WATemperatureStringForOutputUnit(v48, v8);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v112[1] = v51;
            v112[2] = v30;
            v73 = (void *)MEMORY[0x24BDBCE30];
            v74 = v112;
            v90 = 3;
            goto LABEL_89;
          }
          if (!v68)
          {
            objc_msgSend(v107, "appendString:", CFSTR("CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WAS"));
            v111[0] = v108;
            WATemperatureStringForOutputUnit(self->_temperature, v8);
            v91 = objc_claimAutoreleasedReturnValue();
            v92 = v13;
            v47 = (void *)v91;
            v111[1] = v91;
            v111[2] = v30;
            objc_msgSend(v92, "high");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            WATemperatureStringForOutputUnit(v48, v8);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v111[3] = v51;
            v111[4] = v30;
            v73 = (void *)MEMORY[0x24BDBCE30];
            v74 = v111;
            goto LABEL_88;
          }
        }
        else
        {
          WALogForCategory(0);
          v53 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            -[City naturalLanguageDescriptionWithDescribedCondition:].cold.3();

          objc_msgSend(v105, "appendFormat:", CFSTR("Forecast Type %d to %d"), 1000, 1800);
          v54 = -[City locationOfTime:](self, "locationOfTime:", 1800);
          v55 = -[City locationOfTime:](self, "locationOfTime:", 0);
          v56 = objc_msgSend(v107, "length");
          if (v54 != 0x7FFFFFFFFFFFFFFFLL && v55 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v56)
            {
              objc_msgSend(v107, "appendString:", CFSTR("CURRENTLY_NOW_"));
              objc_msgSend(v106, "addObject:", v108);
            }
            v57 = v100;
            if (v54 < v55)
              v57 = v55;
            v58 = -[City primaryConditionForRange:](self, "primaryConditionForRange:", v54, v57 - v54);
            if (self->_conditionCode == v58)
            {
              objc_msgSend(v107, "appendString:", CFSTR("MIDDAY_SAME"));
              objc_msgSend(v13, "high");
              v59 = v13;
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v47, v8);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v116[0] = v48;
              v116[1] = v30;
              objc_msgSend(v59, "low");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v51, v8);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v116[2] = v60;
              v116[3] = v30;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v116, 4);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v106;
              objc_msgSend(v106, "addObjectsFromArray:", v61);
            }
            else
            {
              v84 = v58;
              objc_msgSend(v107, "appendString:", CFSTR("MIDDAY_DIFFERENT"));
              objc_msgSend(v13, "high");
              v85 = v13;
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v47, v8);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v115[0] = v48;
              v115[1] = v30;
              LocalizedWeatherDescription(v84, 0, 1);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              v115[2] = v51;
              objc_msgSend(v85, "low");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              WATemperatureStringForOutputUnit(v60, v8);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v115[3] = v61;
              v115[4] = v30;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v115, 5);
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              v50 = v106;
              objc_msgSend(v106, "addObjectsFromArray:", v86);

            }
            goto LABEL_90;
          }
          if (!v56)
          {
            objc_msgSend(v107, "appendString:", CFSTR("CURRENTLY_NOW_IT_IS_CURRENTLY_HIGH_WILL_BE"));
            v114[0] = v108;
            WATemperatureStringForOutputUnit(self->_temperature, v8);
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = v13;
            v47 = (void *)v71;
            v114[1] = v71;
            v114[2] = v30;
            objc_msgSend(v72, "high");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            WATemperatureStringForOutputUnit(v48, v8);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v114[3] = v51;
            v114[4] = v30;
            v73 = (void *)MEMORY[0x24BDBCE30];
            v74 = v114;
LABEL_88:
            v90 = 5;
LABEL_89:
            objc_msgSend(v73, "arrayWithObjects:count:", v74, v90);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v106;
            objc_msgSend(v106, "addObjectsFromArray:", v60);
LABEL_90:

            goto LABEL_91;
          }
        }
        v50 = v106;
        v62 = 0x24BDD1000;
        goto LABEL_93;
      }
      objc_msgSend(v107, "appendString:", CFSTR("CONDITION_NOW_"));
      objc_msgSend(v106, "addObject:", v108);
      if (v23)
      {
        objc_msgSend(v107, "appendString:", CFSTR("WINDCHILL_"));
        WATemperatureStringForOutputUnit(self->_feelsLike, v8);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v121[0] = v33;
        v34 = (void **)v121;
      }
      else
      {
        if (!v24)
        {
LABEL_35:
          if (windSpeed >= 25.0)
          {
            objc_msgSend(v107, "appendString:", CFSTR("WIND_"));
            +[WeatherWindSpeedFormatter convenienceFormatter](WeatherWindSpeedFormatter, "convenienceFormatter");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v37 = self->_windSpeed;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v37);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "stringForObjectValue:", v99);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            v119[0] = v98;
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[City windDirectionAsString:](self, "windDirectionAsString:", self->_windDirection);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "localizedStringForKey:value:table:", v39, &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v119[1] = v40;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v119, 2);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "addObjectsFromArray:", v41);

            v30 = v103;
            v13 = v104;

          }
          if (v27)
            objc_msgSend(v107, "appendString:", CFSTR("VISIBILITY_"));
          goto LABEL_39;
        }
        objc_msgSend(v107, "appendString:", CFSTR("HEAT_INDEX_"));
        WATemperatureStringForOutputUnit(self->_feelsLike, v8);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v33;
        v34 = &v120;
      }
      v34[1] = (void *)v30;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "addObjectsFromArray:", v35);

      goto LABEL_35;
    }
  }
  v14 = &stru_24DD9EDF8;
  if (a3)
LABEL_6:
    *a3 = conditionCode;
  return v14;
}

- (unint64_t)precipitationForecast
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v2 = self->_hourlyForecasts;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v3)
  {

    return 2;
  }
  v4 = v3;
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v2);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      v13 = objc_msgSend(v12, "conditionCode", (_QWORD)v21);
      if (((0x1017FFF80001uLL >> v13) & 1) == 0)
      {
        v14 = PrecipitationTypeMap_0[v13];
        if (!v8)
          v8 = PrecipitationTypeMap_0[v13];
        if (v14 == 4)
          v15 = v9 + 1;
        else
          v15 = v9;
        if (v14 == 3)
          v16 = v6 + 1;
        else
          v16 = v6;
        if (v14 == 3)
          v15 = v9;
        if (v14 == 2)
          ++v5;
        else
          v6 = v16;
        if (v14 != 2)
          v9 = v15;
      }
      objc_msgSend(v12, "temperature");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "temperatureForUnit:", 2);
      v19 = v18;

      if (v19 < 0.0)
        ++v7;
    }
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v4);

  if (v5 >= 1 && v5 > v6)
    return 2;
  if (v6 < 1 || v6 <= v5)
  {
    if (v9 >= 1 && v9 > v5 && v9 > v6)
      return 4;
    if (v8)
      return v8;
    if (!v7)
      return 2;
  }
  return 3;
}

- (void)_generateLocalizableStrings
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  uint64_t v88;
  __int16 v89;
  uint64_t v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  void *v94;
  __int16 v95;
  void *v96;
  __int16 v97;
  void *v98;
  __int16 v99;
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  __CFString *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  _BYTE v108[128];
  _BYTE v109[128];
  _QWORD v110[6];
  _QWORD v111[6];
  _QWORD v112[6];
  _QWORD v113[6];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[4];
  _QWORD v117[4];
  const __CFString *v118;
  const __CFString *v119;
  _QWORD v120[4];
  _QWORD v121[4];
  _QWORD v122[2];
  _QWORD v123[2];
  _QWORD v124[4];
  _QWORD v125[4];
  const __CFString *v126;
  const __CFString *v127;
  _QWORD v128[4];
  _QWORD v129[7];

  v129[4] = *MEMORY[0x24BDAC8D0];
  v126 = CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE");
  v127 = CFSTR("It's currently %8$@%9$@; the high will be %10$@%11$@. ");
  v128[0] = CFSTR("TODAY_CONDITION");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v127, &v126, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v129[0] = v2;
  v128[1] = CFSTR("CURRENTLY_NOW");
  v124[0] = CFSTR("MIDDAY_SAME");
  v124[1] = CFSTR("MIDDAY_DIFFERENT");
  v125[0] = CFSTR("The high will be %2$@%3$@. The low tonight will be %4$@%5$@. ");
  v125[1] = CFSTR("The high will be %2$@%3$@. %4$@ tonight with a low of %5$@%6$@. ");
  v124[2] = CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE");
  v124[3] = CFSTR("IT_IS_CURRENTLY_HIGH_WAS");
  v125[2] = CFSTR("It's %8$@%9$@; the high will be %10$@%11$@. ");
  v125[3] = CFSTR("It's %8$@%9$@; the high today was forecast as %10$@%11$@. ");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v125, v124, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v129[1] = v3;
  v128[2] = CFSTR("CURRENTLY_COMMA");
  v122[0] = CFSTR("AFTERNOON_SAME");
  objc_msgSend(CFSTR("The low tonight will be %8$@%9$@. "), "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v123[0] = v4;
  v122[1] = CFSTR("AFTERNOON_DIFFERENT");
  objc_msgSend(CFSTR("%8$@ tonight with a low of %9$@%10$@. "), "lowercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v123, v122, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v128[3] = CFSTR("CONDITION_LIKELY_TOMORROW");
  v129[2] = v6;
  v129[3] = &unk_24DDB17B8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v129, v128, 4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v120[0] = CFSTR("TODAY_CONDITION");
  v118 = CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE");
  v119 = CFSTR("8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v119, &v118, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v121[0] = v7;
  v120[1] = CFSTR("CURRENTLY_NOW");
  v116[0] = CFSTR("MIDDAY_SAME");
  v116[1] = CFSTR("MIDDAY_DIFFERENT");
  v117[0] = CFSTR("2 = High Temperature for day, 3 = Temperature Unit , 4 = Low Temperature for day, 5 = Temperature Unit ");
  v117[1] = CFSTR("2 = High Temperature for day, 3 = Temperature Unit, 4 = Condition (Cloudy, Rainy, etc.), 5 = Low Temperature for day, 6 = Temperature Unit ");
  v116[2] = CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE");
  v116[3] = CFSTR("IT_IS_CURRENTLY_HIGH_WAS");
  v117[2] = CFSTR("8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ");
  v117[3] = CFSTR("8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v117, v116, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v121[1] = v8;
  v120[2] = CFSTR("CURRENTLY_COMMA");
  v114[0] = CFSTR("AFTERNOON_SAME");
  v114[1] = CFSTR("AFTERNOON_DIFFERENT");
  v115[0] = CFSTR("8 = Low Temperature for tonight, 9 = Temperature Unit");
  v115[1] = CFSTR("8 = Condition for tonight, 9 = Low Temperature for tonight, 10 = Temperature Unit ");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v115, v114, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = CFSTR("CONDITION_LIKELY_TOMORROW");
  v121[2] = v9;
  v121[3] = &unk_24DDB17E0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v121, v120, 4);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v112[0] = &stru_24DD9EDF8;
  v112[1] = CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE");
  v113[0] = &stru_24DD9EDF8;
  v113[1] = CFSTR("It's currently %8$@%9$@; the high will be %10$@%11$@. ");
  v112[2] = CFSTR("MIDDAY_SAME");
  v112[3] = CFSTR("MIDDAY_DIFFERENT");
  v113[2] = CFSTR("The high will be %8$@%9$@. The low tonight will be %10$@%11$@. ");
  v113[3] = CFSTR("The high will be %8$@%9$@. %10$@ tonight with a low of %11$@%12$@. ");
  v112[4] = CFSTR("AFTERNOON_SAME");
  v112[5] = CFSTR("AFTERNOON_DIFFERENT");
  v113[4] = CFSTR("The low tonight will be %8$@%9$@. ");
  v113[5] = CFSTR("%8$@ tonight with a low of %9$@%10$@. ");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v113, v112, 6);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = CFSTR("_");
  v110[1] = CFSTR("IT_IS_CURRENTLY_HIGH_WILL_BE");
  v111[0] = &stru_24DD9EDF8;
  v111[1] = CFSTR("8 = Current Temperature, 9 = Temperature Unit, 10 = High Temperature for day, 11 = Temperature Unit ");
  v110[2] = CFSTR("MIDDAY_SAME");
  v110[3] = CFSTR("MIDDAY_DIFFERENT");
  v111[2] = CFSTR("8 = High Temperature for day, 9 = Temperature Unit, 10 = Low Temperature for day, 11 = Temperature Unit");
  v111[3] = CFSTR("8 = High Temperature for day, 9 = Temperature Unit, 10 = Condition (Cloudy, Rainy, etc.), 11 = Low Temperature for day, 12 = Temperature Unit,");
  v110[4] = CFSTR("AFTERNOON_SAME");
  v110[5] = CFSTR("AFTERNOON_DIFFERENT");
  v111[4] = CFSTR("8 = Low Temperature for tonight, 9 = Temperature Unit");
  v111[5] = CFSTR("8 = Condition for tonight, 9 = Low Temperature for tonight, 10 = Temperature Unit ");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, v110, 6);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v55 = objc_msgSend(&unk_24DDB1768, "countByEnumeratingWithState:objects:count:", &v83, v109, 16);
  if (v55)
  {
    v54 = *(_QWORD *)v84;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v84 != v54)
          objc_enumerationMutation(&unk_24DDB1768);
        v57 = v10;
        v11 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v10);
        objc_msgSend(v47, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = v11;
        objc_msgSend(v46, "objectForKey:", v11);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        v13 = v12;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v108, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v80;
          v60 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v80 != v16)
                objc_enumerationMutation(v13);
              v18 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
              WALogForCategory(0);
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(&unk_24DDB1768, "objectForKey:", v62);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "objectForKey:", v18);
                v21 = v13;
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(&unk_24DDB1790, "objectForKey:", v62);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "objectForKey:", v18);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413570;
                v88 = v62;
                v89 = 2112;
                v90 = v18;
                v91 = 2112;
                v92 = v20;
                v93 = 2112;
                v94 = v22;
                v95 = 2112;
                v96 = v23;
                v97 = 2112;
                v98 = v24;
                _os_log_impl(&dword_21AAEC000, v19, OS_LOG_TYPE_DEFAULT, "########### \"%@_%@\" = \"%@%@\"; /* %@%@ */",
                  buf,
                  0x3Eu);

                v13 = v21;
                v16 = v60;
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v79, v108, 16);
          }
          while (v15);
        }

        WALogForCategory(0);
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AAEC000, v25, OS_LOG_TYPE_DEFAULT, "###########", buf, 2u);
        }

        v10 = v57 + 1;
      }
      while (v57 + 1 != v55);
      v55 = objc_msgSend(&unk_24DDB1768, "countByEnumeratingWithState:objects:count:", &v83, v109, 16);
    }
    while (v55);
  }
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v48 = objc_msgSend(&unk_24DDB1808, "countByEnumeratingWithState:objects:count:", &v75, v107, 16);
  if (v48)
  {
    v45 = *(_QWORD *)v76;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v76 != v45)
          objc_enumerationMutation(&unk_24DDB1808);
        v49 = v26;
        v56 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v26);
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v52 = objc_msgSend(&unk_24DDB1858, "countByEnumeratingWithState:objects:count:", &v71, v106, 16);
        if (v52)
        {
          v51 = *(_QWORD *)v72;
          do
          {
            v27 = 0;
            do
            {
              if (*(_QWORD *)v72 != v51)
                objc_enumerationMutation(&unk_24DDB1858);
              v53 = v27;
              v61 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * v27);
              v67 = 0u;
              v68 = 0u;
              v69 = 0u;
              v70 = 0u;
              v28 = v50;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v105, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v68;
                v58 = *(_QWORD *)v68;
                v59 = v28;
                do
                {
                  v32 = 0;
                  v63 = v30;
                  do
                  {
                    if (*(_QWORD *)v68 != v31)
                      objc_enumerationMutation(v28);
                    v33 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v32);
                    objc_msgSend(v66, "objectForKey:", v33);
                    v34 = objc_claimAutoreleasedReturnValue();
                    v35 = (void *)v34;
                    v36 = &stru_24DD9EDF8;
                    if (v34)
                      v36 = (__CFString *)v34;
                    v37 = v36;

                    WALogForCategory(0);
                    v38 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(&unk_24DDB1808, "objectForKey:", v56);
                      v65 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(&unk_24DDB1858, "objectForKey:", v61);
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v28, "objectForKey:", v33);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(&unk_24DDB1830, "objectForKey:", v56);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(&unk_24DDB1880, "objectForKey:", v61);
                      v42 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138414338;
                      v88 = v56;
                      v89 = 2112;
                      v90 = v61;
                      v91 = 2112;
                      v92 = v33;
                      v93 = 2112;
                      v30 = v63;
                      v94 = v65;
                      v95 = 2112;
                      v96 = v39;
                      v97 = 2112;
                      v98 = v40;
                      v99 = 2112;
                      v100 = v41;
                      v101 = 2112;
                      v102 = v42;
                      v103 = 2112;
                      v104 = v37;
                      _os_log_impl(&dword_21AAEC000, v38, OS_LOG_TYPE_DEFAULT, "########### \"%@_%@_%@\" = \"%@%@%@\"; /* %@%@%@ */",
                        buf,
                        0x5Cu);

                      v28 = v59;
                      v31 = v58;

                    }
                    ++v32;
                  }
                  while (v30 != v32);
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v67, v105, 16);
                }
                while (v30);
              }

              WALogForCategory(0);
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_21AAEC000, v43, OS_LOG_TYPE_DEFAULT, "###########", buf, 2u);
              }

              v27 = v53 + 1;
            }
            while (v53 + 1 != v52);
            v52 = objc_msgSend(&unk_24DDB1858, "countByEnumeratingWithState:objects:count:", &v71, v106, 16);
          }
          while (v52);
        }
        WALogForCategory(0);
        v44 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AAEC000, v44, OS_LOG_TYPE_DEFAULT, "###########", buf, 2u);
        }

        v26 = v49 + 1;
      }
      while (v49 + 1 != v48);
      v48 = objc_msgSend(&unk_24DDB1808, "countByEnumeratingWithState:objects:count:", &v75, v107, 16);
    }
    while (v48);
  }

}

- (void)updateCityForModel:(id)a3
{
  City *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
  City *v15;
  void *v16;
  NSObject *v17;
  __CFString *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  WeatherAQIAttribution *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  NSObject *v34;
  City *v35;
  void *v36;
  NSObject *v37;
  City *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  City *v47;
  void *v48;
  NSObject *v49;
  City *v50;
  void *v51;
  void *v52;
  int v53;
  City *v54;
  __int16 v55;
  City *v56;
  __int16 v57;
  City *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = (City *)a3;
  if (!v4)
    goto LABEL_34;
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v53 = 136315650;
    v54 = (City *)"-[City updateCityForModel:]";
    v55 = 2112;
    v56 = v4;
    v57 = 2112;
    v58 = self;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "%s, forecastModel:%@, city:%@, airQualityCondition", (uint8_t *)&v53, 0x20u);
  }

  -[City clearForecasts](self, "clearForecasts");
  -[City location](v4, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[City location](v4, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setWfLocation:](self, "setWfLocation:", v7);

  }
  -[City link](v4, "link");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setLink:](self, "setLink:", v8);

  -[City deepLink](v4, "deepLink");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setDeeplink:](self, "setDeeplink:", v9);

  -[City currentConditions](v4, "currentConditions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "temperature");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setTemperature:](self, "setTemperature:", v12);

    objc_msgSend(v11, "feelsLike");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setFeelsLike:](self, "setFeelsLike:", v13);

    objc_msgSend(v11, "windDirection");
    -[City setWindDirection:](self, "setWindDirection:");
    objc_msgSend(v11, "windSpeed");
    -[City setWindSpeed:](self, "setWindSpeed:");
    objc_msgSend(v11, "humidity");
    -[City setHumidity:](self, "setHumidity:");
    objc_msgSend(v11, "dewPoint");
    -[City setDewPoint:](self, "setDewPoint:");
    objc_msgSend(v11, "visibility");
    -[City setVisibility:](self, "setVisibility:");
    objc_msgSend(v11, "pressure");
    -[City setPressure:](self, "setPressure:");
    -[City setPressureRising:](self, "setPressureRising:", objc_msgSend(v11, "pressureRising"));
    -[City setUVIndex:](self, "setUVIndex:", objc_msgSend(v11, "UVIndex"));
    objc_msgSend(v11, "precipitationPast24Hours");
    -[City setPrecipitationPast24Hours:](self, "setPrecipitationPast24Hours:", v14);
    -[City setConditionCode:](self, "setConditionCode:", objc_msgSend(v11, "conditionCode"));
    -[City setObservationTime:](self, "setObservationTime:", objc_msgSend(v11, "observationTime"));
  }
  -[City airQualityConditions](v4, "airQualityConditions");
  v15 = (City *)objc_claimAutoreleasedReturnValue();
  -[City localizedAirQualityScaleCategory](v15, "localizedAirQualityScaleCategory");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    WALogForCategory(0);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v53 = 138412546;
      v54 = v15;
      v55 = 2112;
      v56 = self;
      _os_log_impl(&dword_21AAEC000, v17, OS_LOG_TYPE_DEFAULT, "airCondition=%@, city: %@", (uint8_t *)&v53, 0x16u);
    }

    -[City scaleIdentifier](v15, "scaleIdentifier");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      WALogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v53 = 138412290;
        v54 = self;
        _os_log_impl(&dword_21AAEC000, v19, OS_LOG_TYPE_DEFAULT, "error airCondition.scaleIdentifier was NULL for city: %@, using default", (uint8_t *)&v53, 0xCu);
      }

      v18 = CFSTR("AQI");
    }
    -[City setAirQualityScaleIdentifier:](self, "setAirQualityScaleIdentifier:", v18);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[City airQualityIndex](v15, "airQualityIndex"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setAirQualityIdx:](self, "setAirQualityIdx:", v20);

    -[City setAirQualityScaleCategory:](self, "setAirQualityScaleCategory:", v16);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WAAirQualityCategoryFromConditions(v15));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setAirQualityCategory:](self, "setAirQualityCategory:", v21);

    -[City setAirQualitySignificance:](self, "setAirQualitySignificance:", -[City significance](v15, "significance"));
    -[City setAirQualityTemporarilyUnavailable:](self, "setAirQualityTemporarilyUnavailable:", -[City temporarilyUnavailable](v15, "temporarilyUnavailable"));
    -[City scale](v15, "scale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setAirQualityScale:](self, "setAirQualityScale:", v22);

    -[City currentScaleCategory](v15, "currentScaleCategory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setAirQualityCurrentScaleCategory:](self, "setAirQualityCurrentScaleCategory:", v23);

    -[City currentScaleCategory](v15, "currentScaleCategory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "recommendation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setAirQualityRecommendation:](self, "setAirQualityRecommendation:", v25);

    -[City providerAttribution](v15, "providerAttribution");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");

    if (v28)
    {
      v29 = -[WeatherAQIAttribution initWithFoundationAttribution:]([WeatherAQIAttribution alloc], "initWithFoundationAttribution:", v26);
      -[City setAirQualityAttribution:](self, "setAirQualityAttribution:", v29);
      -[City learnMoreURL](v15, "learnMoreURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[City airQualityCanUseDefaultAttribution](self, "airQualityCanUseDefaultAttribution"))
      {
LABEL_20:

        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BEC21D0], "sharedManager");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "defaultProviderAttribution");
      v32 = objc_claimAutoreleasedReturnValue();

      v29 = -[WeatherAQIAttribution initWithFoundationAttribution:]([WeatherAQIAttribution alloc], "initWithFoundationAttribution:", v32);
      -[City setAirQualityAttribution:](self, "setAirQualityAttribution:", v29);
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("http://www.weather.com/wx/today/"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)v32;
    }
    -[City setAirQualityLearnMoreURL:](self, "setAirQualityLearnMoreURL:", v30);

    goto LABEL_20;
  }
LABEL_21:
  if (-[City conditionCode](self, "conditionCode") == 3200)
  {
    WALogForCategory(0);
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[City updateCityForModel:].cold.1(self);

  }
  WALogForCategory(0);
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    -[City hourlyForecasts](v4, "hourlyForecasts");
    v35 = (City *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = self;
    v55 = 2114;
    v56 = v35;
    _os_log_impl(&dword_21AAEC000, v34, OS_LOG_TYPE_DEFAULT, "Updating city with hourly forecast, city: %{public}@, hourlyForecast=%{public}@", (uint8_t *)&v53, 0x16u);

  }
  -[City hourlyForecasts](v4, "hourlyForecasts");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setHourlyForecasts:](self, "setHourlyForecasts:", v36);

  WALogForCategory(0);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    -[City dailyForecasts](v4, "dailyForecasts");
    v38 = (City *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = self;
    v55 = 2114;
    v56 = v38;
    _os_log_impl(&dword_21AAEC000, v37, OS_LOG_TYPE_DEFAULT, "Updating city with daily forecast, city: %{public}@, dailyForecast=%{public}@", (uint8_t *)&v53, 0x16u);

  }
  -[City dailyForecasts](v4, "dailyForecasts");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setDayForecasts:](self, "setDayForecasts:", v39);

  objc_msgSend((id)objc_opt_class(), "_ISO8601Calendar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[City timeZone](self, "timeZone");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setTimeZone:", v41);

  -[City sunrise](v4, "sunrise");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "components:fromDate:", 96, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  -[City setSunriseTime:](self, "setSunriseTime:", objc_msgSend(v43, "minute") + 100 * objc_msgSend(v43, "hour"));
  -[City sunset](v4, "sunset");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "components:fromDate:", 96, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  -[City setSunsetTime:](self, "setSunsetTime:", objc_msgSend(v45, "minute") + 100 * objc_msgSend(v45, "hour"));
  WALogForCategory(0);
  v46 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    -[City severeWeatherEvents](v4, "severeWeatherEvents");
    v47 = (City *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = self;
    v55 = 2114;
    v56 = v47;
    _os_log_impl(&dword_21AAEC000, v46, OS_LOG_TYPE_DEFAULT, "Updating city with severe weather events, city: %{public}@, severeWeatherEvents=%{public}@", (uint8_t *)&v53, 0x16u);

  }
  -[City severeWeatherEvents](v4, "severeWeatherEvents");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[City updateCityForSevereWeatherEvents:](self, "updateCityForSevereWeatherEvents:", v48);

  WALogForCategory(0);
  v49 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    -[City nextHourPrecipitation](v4, "nextHourPrecipitation");
    v50 = (City *)objc_claimAutoreleasedReturnValue();
    v53 = 138543618;
    v54 = self;
    v55 = 2114;
    v56 = v50;
    _os_log_impl(&dword_21AAEC000, v49, OS_LOG_TYPE_DEFAULT, "Updating city with next hour precipitation model, city: %{public}@, nextHourPrecipitation=%{public}@", (uint8_t *)&v53, 0x16u);

  }
  -[City nextHourPrecipitation](v4, "nextHourPrecipitation");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setNextHourPrecipitation:](self, "setNextHourPrecipitation:", v51);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setUpdateTime:](self, "setUpdateTime:", v52);

LABEL_34:
}

- (void)updateCityForSevereWeatherEvents:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v4;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "expirationDate", v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "compare:", v12);

        if (v13 == 1)
          objc_msgSend(v15, "addObject:", v10);
        if (-[City _isValidLearnMoreURLForSevereEvent:](self, "_isValidLearnMoreURLForSevereEvent:", v10))
        {
          objc_msgSend(v10, "URL");
          v14 = objc_claimAutoreleasedReturnValue();

          v7 = (void *)v14;
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  -[City setSevereWeatherEvents:](self, "setSevereWeatherEvents:", v15);
  -[City setSevereWeatherEventLearnMoreURL:](self, "setSevereWeatherEventLearnMoreURL:", v7);

}

- (BOOL)_isValidLearnMoreURLForSevereEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;

  objc_msgSend(a3, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scheme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HTTPS")) & 1) != 0
      || (objc_msgSend(v6, "isEqualToString:", CFSTR("HTTP")) & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      WALogForCategory(0);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[City _isValidLearnMoreURLForSevereEvent:].cold.1(v4);

      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_dataIsValid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[City timeZone](self, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[City hourlyForecasts](self, "hourlyForecasts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[City dayForecasts](self, "dayForecasts");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "count"))
      {
        -[City temperature](self, "temperature");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6 != 0;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)identifier
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[City coordinate](self, "coordinate");
  v5 = v4;
  -[City coordinate](self, "coordinate");
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("%f-%f"), v5, v6);
}

- (NSString)countryCode
{
  void *v2;
  void *v3;

  -[City wfLocation](self, "wfLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "countryAbbreviation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)aqiDataAvailabilityStatus
{
  void *v3;
  int v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled")))
  {
    if (-[City aqiDataAvailabilityStatusOverride](self, "aqiDataAvailabilityStatusOverride"))
    {
      v5 = -[City aqiDataAvailabilityStatusOverride](self, "aqiDataAvailabilityStatusOverride");
LABEL_9:
      v8 = v5;
      goto LABEL_12;
    }
LABEL_8:
    v5 = -[City aqiDataAvailabilityStatusFromAppConfig](self, "aqiDataAvailabilityStatusFromAppConfig");
    goto LABEL_9;
  }
  if (!v4)
    goto LABEL_8;
  objc_msgSend(v3, "objectForKey:", CFSTR("feature.enhancedAQIView.airQualityAvailabilityForCountryOverride"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = -[City aqiDataAvailabilityStatusFromAppConfig](self, "aqiDataAvailabilityStatusFromAppConfig");
  v8 = v7;

LABEL_12:
  return v8;
}

- (unint64_t)aqiDataAvailabilityStatusFromAppConfig
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _BOOL4 v11;

  objc_msgSend(MEMORY[0x24BEC2210], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aqiEnabledCountryCodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[City countryCode](self, "countryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "containsObject:", v6);

  if (!(_DWORD)v4)
    goto LABEL_6;
  if (!-[City airQualityTemporarilyUnavailable](self, "airQualityTemporarilyUnavailable"))
  {
    -[City airQualityIdx](self, "airQualityIdx");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[City airQualityCategory](self, "airQualityCategory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10 != 0;

      v7 = 2 * v11;
      goto LABEL_7;
    }
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
LABEL_7:

  return v7;
}

- (NSNumber)airQualityCategory
{
  NSNumber *v3;
  void *v4;
  int v5;
  void *v6;
  NSNumber *v7;

  v3 = self->_airQualityCategory;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled")))
  {
    -[City airQualityCategoryOverride](self, "airQualityCategoryOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[City airQualityCategoryOverride](self, "airQualityCategoryOverride");
      v7 = v3;
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
LABEL_8:

      goto LABEL_9;
    }
  }
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("feature.enhancedAQIView.airQualityCategoryOverride"));
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v7;

        v3 = v7;
      }
    }
    goto LABEL_8;
  }
LABEL_9:

  return v3;
}

- (NSNumber)airQualityIdx
{
  NSNumber *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = self->_airQualityIdx;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled")))
  {
    -[City airQualityIdxOverride](self, "airQualityIdxOverride");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[City airQualityIdxOverride](self, "airQualityIdxOverride");
      v7 = v3;
      v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
LABEL_7:

      goto LABEL_8;
    }
  }
  if (v5)
  {
    objc_msgSend(v4, "stringForKey:", CFSTR("feature.enhancedAQIView.airQualityIndexOverride"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      WANumberFormatterForDisplayingAQI();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberFromString:", v7);
      v9 = objc_claimAutoreleasedReturnValue();

      v3 = (NSNumber *)v9;
    }
    goto LABEL_7;
  }
LABEL_8:

  return v3;
}

- (unint64_t)airQualitySignificance
{
  uint64_t airQualitySignificance;
  void *v4;
  int v5;
  void *v6;

  airQualitySignificance = self->_airQualitySignificance;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"))
    && -[City airQualitySignificanceOverride](self, "airQualitySignificanceOverride"))
  {
    airQualitySignificance = -[City airQualitySignificanceOverride](self, "airQualitySignificanceOverride");
  }
  else if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("feature.enhancedAQIView.airQualitySignificanceOverride"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        airQualitySignificance = objc_msgSend(v6, "integerValue");
    }

  }
  return airQualitySignificance;
}

- (BOOL)airQualityForceHideRecommendation
{
  void *v2;
  int v3;
  char v4;
  BOOL v5;
  void *v6;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"));
  v5 = 0;
  if (v3 && (v4 & 1) == 0)
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("feature.enhancedAQIView.airQualityRecommendationEnabled"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v6, "integerValue") == 1;

  }
  return v5;
}

- (BOOL)airQualityCanUseDefaultAttribution
{
  void *v2;
  int v3;
  char v4;
  char v5;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feature.enhancedAQIView.overridesEnabled"));
  v4 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"));
  v5 = 0;
  if (v3 && (v4 & 1) == 0)
    v5 = objc_msgSend(v2, "BOOLForKey:", CFSTR("feature.enhancedAQIView.useDefaultAttribution"));

  return v5;
}

- (BOOL)airQualityScaleIsAscending
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  uint64_t v10;

  -[City airQualityScale](self, "airQualityScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[City airQualityScale](self, "airQualityScale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAscending");

  }
  else
  {
    v5 = 1;
  }
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("feature.enhancedAQIView.scaleOverridesEnabled"));
  v8 = objc_msgSend(v6, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"));
  if (v7 && (v8 & 1) == 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("feature.enhancedAQIView.scale.ascendingOverride"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "integerValue");
        if (v10 == 1)
        {
          v5 = 0;
        }
        else if (!v10)
        {
          v5 = 1;
        }
      }
    }

  }
  return v5;
}

- (BOOL)airQualityScaleIsNumerical
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  uint64_t v10;

  -[City airQualityScale](self, "airQualityScale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[City airQualityScale](self, "airQualityScale");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isNumerical");

  }
  else
  {
    v5 = 1;
  }
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("feature.enhancedAQIView.scaleOverridesEnabled"));
  v8 = objc_msgSend(v6, "BOOLForKey:", CFSTR("feature.enhancedAQIView.demoModeEnabled"));
  if (v7 && (v8 & 1) == 0)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("feature.enhancedAQIView.scale.numericalOverride"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v10 = objc_msgSend(v9, "integerValue");
        if (v10 == 1)
        {
          v5 = 0;
        }
        else if (!v10)
        {
          v5 = 1;
        }
      }
    }

  }
  return v5;
}

- (WFAQIScale)airQualityScale
{
  WFAQIScale *v2;
  void *v3;
  void *v4;

  v2 = self->_airQualityScale;
  if (!v2)
  {
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "BOOLForKey:", CFSTR("feature.enhancedAQIView.allowUseDefaultScaleIfCacheEmpty")))
    {
      objc_msgSend(MEMORY[0x24BEC2188], "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "defaultScale");
      v2 = (WFAQIScale *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

- (NSString)updateTimeString
{
  return self->_updateTimeString;
}

- (void)setUpdateTimeString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isLocalWeatherCity
{
  return self->_isLocalWeatherCity;
}

- (void)setIsLocalWeatherCity:(BOOL)a3
{
  self->_isLocalWeatherCity = a3;
}

- (BOOL)isTransient
{
  return self->_transient;
}

- (void)setTransient:(BOOL)a3
{
  self->_transient = a3;
}

- (NSString)woeid
{
  return self->_woeid;
}

- (void)setWoeid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)ISO3166CountryAbbreviation
{
  return self->_ISO3166CountryAbbreviation;
}

- (void)setISO3166CountryAbbreviation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (WFTemperature)temperature
{
  return self->_temperature;
}

- (WFTemperature)feelsLike
{
  return self->_feelsLike;
}

- (void)setFeelsLike:(id)a3
{
  objc_storeStrong((id *)&self->_feelsLike, a3);
}

- (unint64_t)observationTime
{
  return self->_observationTime;
}

- (void)setObservationTime:(unint64_t)a3
{
  self->_observationTime = a3;
}

- (unint64_t)sunsetTime
{
  return self->_sunsetTime;
}

- (void)setSunsetTime:(unint64_t)a3
{
  self->_sunsetTime = a3;
}

- (unint64_t)sunriseTime
{
  return self->_sunriseTime;
}

- (void)setSunriseTime:(unint64_t)a3
{
  self->_sunriseTime = a3;
}

- (unint64_t)moonPhase
{
  return self->_moonPhase;
}

- (void)setMoonPhase:(unint64_t)a3
{
  self->_moonPhase = a3;
}

- (unint64_t)uvIndex
{
  return self->_uvIndex;
}

- (void)setUVIndex:(unint64_t)a3
{
  self->_uvIndex = a3;
}

- (double)precipitationPast24Hours
{
  return self->_precipitationPast24Hours;
}

- (void)setPrecipitationPast24Hours:(double)a3
{
  self->_precipitationPast24Hours = a3;
}

- (NSURL)link
{
  return self->_link;
}

- (void)setLink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (NSURL)deeplink
{
  return self->_deeplink;
}

- (void)setDeeplink:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 192, 1);
}

- (void)setLocation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 192);
}

- (NSString)searchTitle
{
  return self->_searchTitle;
}

- (void)setSearchTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)searchSubtitle
{
  return self->_searchSubtitle;
}

- (void)setSearchSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_timeZone, a3);
}

- (NSDate)timeZoneUpdateDate
{
  return self->_timeZoneUpdateDate;
}

- (void)setTimeZoneUpdateDate:(id)a3
{
  objc_storeStrong((id *)&self->_timeZoneUpdateDate, a3);
}

- (NSError)lastUpdateError
{
  return self->_lastUpdateError;
}

- (void)setLastUpdateError:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdateError, a3);
}

- (NSDate)updateTime
{
  return self->_updateTime;
}

- (float)windChill
{
  return self->_windChill;
}

- (void)setWindChill:(float)a3
{
  self->_windChill = a3;
}

- (float)windDirection
{
  return self->_windDirection;
}

- (void)setWindDirection:(float)a3
{
  self->_windDirection = a3;
}

- (float)windSpeed
{
  return self->_windSpeed;
}

- (void)setWindSpeed:(float)a3
{
  self->_windSpeed = a3;
}

- (float)humidity
{
  return self->_humidity;
}

- (void)setHumidity:(float)a3
{
  self->_humidity = a3;
}

- (float)visibility
{
  return self->_visibility;
}

- (void)setVisibility:(float)a3
{
  self->_visibility = a3;
}

- (float)pressure
{
  return self->_pressure;
}

- (void)setPressure:(float)a3
{
  self->_pressure = a3;
}

- (unint64_t)pressureRising
{
  return self->_pressureRising;
}

- (void)setPressureRising:(unint64_t)a3
{
  self->_pressureRising = a3;
}

- (float)dewPoint
{
  return self->_dewPoint;
}

- (void)setDewPoint:(float)a3
{
  self->_dewPoint = a3;
}

- (float)heatIndex
{
  return self->_heatIndex;
}

- (void)setHeatIndex:(float)a3
{
  self->_heatIndex = a3;
}

- (BOOL)autoUpdate
{
  return self->_autoUpdate;
}

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (WFNextHourPrecipitation)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSURL)severeWeatherEventLearnMoreURL
{
  return self->_severeWeatherEventLearnMoreURL;
}

- (void)setSevereWeatherEventLearnMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (void)setAirQualityIdx:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityIdx, a3);
}

- (void)setAirQualityCategory:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityCategory, a3);
}

- (NSString)airQualityScaleIdentifier
{
  return self->_airQualityScaleIdentifier;
}

- (void)setAirQualityScaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (WFAQIScaleCategory)airQualityScaleCategory
{
  return self->_airQualityScaleCategory;
}

- (void)setAirQualityScaleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityScaleCategory, a3);
}

- (void)setAirQualitySignificance:(unint64_t)a3
{
  self->_airQualitySignificance = a3;
}

- (NSString)airQualityRecommendation
{
  return self->_airQualityRecommendation;
}

- (void)setAirQualityRecommendation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (BOOL)airQualityTemporarilyUnavailable
{
  return self->_airQualityTemporarilyUnavailable;
}

- (void)setAirQualityTemporarilyUnavailable:(BOOL)a3
{
  self->_airQualityTemporarilyUnavailable = a3;
}

- (WeatherAQIAttribution)airQualityAttribution
{
  return self->_airQualityAttribution;
}

- (void)setAirQualityAttribution:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityAttribution, a3);
}

- (NSURL)airQualityLearnMoreURL
{
  return self->_airQualityLearnMoreURL;
}

- (void)setAirQualityLearnMoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (void)setAirQualityScale:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityScale, a3);
}

- (WFAQIScaleCategory)airQualityCurrentScaleCategory
{
  return self->_airQualityCurrentScaleCategory;
}

- (void)setAirQualityCurrentScaleCategory:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityCurrentScaleCategory, a3);
}

- (WFLocation)wfLocation
{
  return self->_wfLocation;
}

- (unint64_t)lastUpdateStatus
{
  return self->_lastUpdateStatus;
}

- (void)setLastUpdateStatus:(unint64_t)a3
{
  self->_lastUpdateStatus = a3;
}

- (BOOL)isUpdating
{
  return self->_isUpdating;
}

- (void)setIsUpdating:(BOOL)a3
{
  self->_isUpdating = a3;
}

- (BOOL)isRequestedByFrameworkClient
{
  return self->_isRequestedByFrameworkClient;
}

- (void)setIsRequestedByFrameworkClient:(BOOL)a3
{
  self->_isRequestedByFrameworkClient = a3;
}

- (BOOL)lockedForDemoMode
{
  return self->_lockedForDemoMode;
}

- (void)setLockedForDemoMode:(BOOL)a3
{
  self->_lockedForDemoMode = a3;
}

- (int64_t)updateInterval
{
  return self->_updateInterval;
}

- (void)setUpdateInterval:(int64_t)a3
{
  self->_updateInterval = a3;
}

- (NSTimer)autoUpdateTimer
{
  return self->_autoUpdateTimer;
}

- (void)setAutoUpdateTimer:(id)a3
{
  objc_storeStrong((id *)&self->_autoUpdateTimer, a3);
}

- (WFGeocodeRequest)activeGeocodeRequest
{
  return self->_activeGeocodeRequest;
}

- (void)setActiveGeocodeRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activeGeocodeRequest, a3);
}

- (NSHashTable)cityUpdateObservers
{
  return self->_cityUpdateObservers;
}

- (void)setCityUpdateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_cityUpdateObservers, a3);
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setFullName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (unint64_t)aqiDataAvailabilityStatusOverride
{
  return self->_aqiDataAvailabilityStatusOverride;
}

- (void)setAqiDataAvailabilityStatusOverride:(unint64_t)a3
{
  self->_aqiDataAvailabilityStatusOverride = a3;
}

- (NSNumber)airQualityIdxOverride
{
  return self->_airQualityIdxOverride;
}

- (void)setAirQualityIdxOverride:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityIdxOverride, a3);
}

- (NSNumber)airQualityCategoryOverride
{
  return self->_airQualityCategoryOverride;
}

- (void)setAirQualityCategoryOverride:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityCategoryOverride, a3);
}

- (unint64_t)airQualitySignificanceOverride
{
  return self->_airQualitySignificanceOverride;
}

- (void)setAirQualitySignificanceOverride:(unint64_t)a3
{
  self->_airQualitySignificanceOverride = a3;
}

- (NSString)weatherDisplayName
{
  return self->_weatherDisplayName;
}

- (void)setWeatherDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)weatherLocationName
{
  return self->_weatherLocationName;
}

- (void)setWeatherLocationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weatherLocationName, 0);
  objc_storeStrong((id *)&self->_weatherDisplayName, 0);
  objc_storeStrong((id *)&self->_airQualityCategoryOverride, 0);
  objc_storeStrong((id *)&self->_airQualityIdxOverride, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_cityUpdateObservers, 0);
  objc_storeStrong((id *)&self->_activeGeocodeRequest, 0);
  objc_storeStrong((id *)&self->_autoUpdateTimer, 0);
  objc_storeStrong((id *)&self->_wfLocation, 0);
  objc_storeStrong((id *)&self->_airQualityCurrentScaleCategory, 0);
  objc_storeStrong((id *)&self->_airQualityScale, 0);
  objc_storeStrong((id *)&self->_airQualityLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_airQualityAttribution, 0);
  objc_storeStrong((id *)&self->_airQualityRecommendation, 0);
  objc_storeStrong((id *)&self->_airQualityScaleCategory, 0);
  objc_storeStrong((id *)&self->_airQualityScaleIdentifier, 0);
  objc_storeStrong((id *)&self->_airQualityCategory, 0);
  objc_storeStrong((id *)&self->_airQualityIdx, 0);
  objc_storeStrong((id *)&self->_severeWeatherEventLearnMoreURL, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_updateTime, 0);
  objc_storeStrong((id *)&self->_lastUpdateError, 0);
  objc_storeStrong((id *)&self->_timeZoneUpdateDate, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_searchSubtitle, 0);
  objc_storeStrong((id *)&self->_searchTitle, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_deeplink, 0);
  objc_storeStrong((id *)&self->_link, 0);
  objc_storeStrong((id *)&self->_feelsLike, 0);
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_ISO3166CountryAbbreviation, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_woeid, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_updateTimeString, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_dayForecasts, 0);
}

- (NSDictionary)urlComponents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD16E0];
  -[City latitude](self, "latitude");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v5, CFSTR("lat"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[City longitude](self, "longitude");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v7, CFSTR("long"));

  -[City name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_safeSetObject:forKey:", v8, CFSTR("city"));

  if (-[City isLocalWeatherCity](self, "isLocalWeatherCity"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("isLocal"));
  return (NSDictionary *)v3;
}

- (void)update
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "displayName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_1(&dword_21AAEC000, v2, v3, "performing update of %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

void __42__City_updateTimeZoneWithCompletionBlock___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_21AAEC000, a2, OS_LOG_TYPE_ERROR, "Geocode failure while updating wfLocation for timezone etc. Error: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)setUpdateTime:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "(-[City setUpdateTime] Got a null timeDateFormatter returning null _updateTimeString!!!", v1, 2u);
}

- (void)cityDidFinishUpdatingWithError:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_21AAEC000, v1, (uint64_t)v1, "City: %@, updating failed with error:%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)primaryConditionForRange:(NSObject *)a3 .cold.1(NSRange a1, id *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  NSStringFromRange(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*a2, "count");
  v8 = 138412546;
  v9 = v5;
  v10 = 2048;
  v11 = v6;
  OUTLINED_FUNCTION_7(&dword_21AAEC000, a3, v7, "-primaryConditionForRange: given invalid range: %@, # of hourly forecasts: %ld", (uint8_t *)&v8);

}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_21AAEC000, v0, OS_LOG_TYPE_DEBUG, "debugString: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21AAEC000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21AAEC000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21AAEC000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (void)naturalLanguageDescriptionWithDescribedCondition:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_21AAEC000, v0, v1, "Forecast Type %d to %d", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_1();
}

- (void)updateCityForModel:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "displayName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21AAEC000, v2, v3, "Weather Update Warning: %@ has an unknown weather condition.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (void)_isValidLearnMoreURLForSevereEvent:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "absoluteString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6(&dword_21AAEC000, v2, v3, "Invalid scheme for severe weather learn more URL: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

@end
