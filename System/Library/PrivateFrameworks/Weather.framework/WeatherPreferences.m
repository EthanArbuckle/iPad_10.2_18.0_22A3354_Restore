@implementation WeatherPreferences

+ (id)sharedPreferences
{
  int v2;
  id v3;

  if (MKBDeviceUnlockedSinceBoot() || (v2 = MKBGetDeviceLockState(), v3 = 0, v2 == 3))
  {
    if (sharedPreferences_onceToken != -1)
      dispatch_once(&sharedPreferences_onceToken, &__block_literal_global_16);
    v3 = (id)sharedPreferences___sharedPreferences;
  }
  return v3;
}

void __39__WeatherPreferences_sharedPreferences__block_invoke()
{
  WeatherPreferences *v0;
  void *v1;

  if (!sharedPreferences___sharedPreferences)
  {
    v0 = objc_alloc_init(WeatherPreferences);
    v1 = (void *)sharedPreferences___sharedPreferences;
    sharedPreferences___sharedPreferences = (uint64_t)v0;

    objc_msgSend((id)sharedPreferences___sharedPreferences, "setupUbiquitousStoreIfNeeded");
  }
}

+ (id)userDefaultsPersistence
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  WeatherUserDefaults *v9;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.weather"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "_initWithSuiteName:container:", CFSTR("group.com.apple.weather"), v3);
  WALogForCategory(5);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v4, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueForKey:", CFSTR("Cities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKeyPath:", CFSTR("Name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "+[WeatherPreferences userDefaultsPersistence]";
    v13 = 2112;
    v14 = v3;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_INFO, "%s tempGroupUrl? %@, Cities: %@", (uint8_t *)&v11, 0x20u);

  }
  v9 = -[WeatherUserDefaults initWithUserDefaults:]([WeatherUserDefaults alloc], "initWithUserDefaults:", v4);

  return v9;
}

+ (WeatherPreferences)preferencesWithPersistence:(id)a3
{
  id v3;
  WeatherPreferences *v4;

  v3 = a3;
  v4 = -[WeatherPreferences initWithPersistence:]([WeatherPreferences alloc], "initWithPersistence:", v3);

  return v4;
}

- (WeatherPreferences)init
{
  void *v3;
  WeatherPreferences *v4;

  objc_msgSend((id)objc_opt_class(), "userDefaultsPersistence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WeatherPreferences initWithPersistence:](self, "initWithPersistence:", v3);

  return v4;
}

- (WeatherPreferences)initWithPersistence:(id)a3
{
  id v5;
  WeatherPreferences *v6;
  WeatherPreferences *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WeatherPreferences;
  v6 = -[WeatherPreferences init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistence, a3);
    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("ServiceDebugging"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_serviceDebugging = objc_msgSend(v9, "BOOLValue");

    +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", CFSTR("LogLocaleAndUnits"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_logUnitsAndLocale = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v7);

  }
  return v7;
}

- (void)setSyncDelegate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[WeatherPreferences cloudPreferences](self, "cloudPreferences");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSyncDelegate:", v4);

}

- (void)setupUbiquitousStoreIfNeeded
{
  void *v3;
  WeatherCloudPreferences *v4;

  -[WeatherPreferences cloudPreferences](self, "cloudPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = -[WeatherCloudPreferences initWithLocalPreferences:]([WeatherCloudPreferences alloc], "initWithLocalPreferences:", self);
    -[WeatherPreferences setCloudPreferences:](self, "setCloudPreferences:", v4);

  }
}

- (BOOL)ensureValidSelectedCityID
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;

  -[WeatherPreferences loadSavedCities](self, "loadSavedCities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("DefaultSelectedCity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "intValue");
    if (objc_msgSend(v3, "count") > (unint64_t)v6)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", (int)objc_msgSend(v5, "intValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isLocalWeatherCity"))
      {
        v8 = CFSTR("_localCity_");
      }
      else
      {
        objc_msgSend(v7, "locationID");
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;
      -[WeatherPreferences setDefaultSelectedCityID:](self, "setDefaultSelectedCityID:", v8);

    }
    -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", 0, CFSTR("DefaultSelectedCity"));
    -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 0);
  }

  return v5 != 0;
}

- (void)adjustPrefsForLocalWeatherEnabled:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[WeatherPreferences isLocalWeatherEnabled](self, "isLocalWeatherEnabled") != a3)
  {
    -[WeatherPreferences setLocalWeatherEnabled:](self, "setLocalWeatherEnabled:", v3);
    -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 1);
  }
}

- (void)registerTemperatureUnits
{
  NSLog(CFSTR("-[WeatherPreferences registerTemperatureUnits] is deprecated and has no replacement."), a2);
}

- (BOOL)readTemperatureUnits
{
  NSLog(CFSTR("-[WeatherPreferences readTemperatureUnits] is deprecated and has no replacement."), a2);
  return 1;
}

- (void)setCelsius:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  if (self->_logUnitsAndLocale)
  {
    WALogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[WeatherPreferences userTemperatureUnit](self, "userTemperatureUnit");
      NSStringFromWFTemperatureUnit();
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = CFSTR("FAHRENHEIT");
      if (v3)
        v8 = CFSTR("CELSIUS");
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Changing temperature units from %@ to %@", (uint8_t *)&v12, 0x16u);

    }
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2230]), "initWithResultHandler:", 0);
  v10 = v9;
  if (v3)
    v11 = 2;
  else
    v11 = 1;
  objc_msgSend(v9, "setTemperatureUnit:", v11);
  objc_msgSend(v10, "start");

}

- (BOOL)isCelsius
{
  return -[WeatherPreferences userTemperatureUnit](self, "userTemperatureUnit") == 2;
}

- (int)userTemperatureUnit
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BEC2238], "sharedObserver");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "temperatureUnit");

  return v3;
}

- (BOOL)_defaultsAreValid
{
  void *v2;
  uint64_t v3;
  char v4;

  -[WeatherPreferencesPersistence stringForKey:](self->_persistence, "stringForKey:", CFSTR("PrefsVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  do
  {
    v4 = objc_msgSend(v2, "isEqualToString:", SupportedPrefsVersions[v3]);
    if ((v4 & 1) != 0)
      break;
  }
  while (v3++ != 7);

  return v4;
}

- (BOOL)_defaultsCurrent
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WeatherPreferencesPersistence stringForKey:](self->_persistence, "stringForKey:", CFSTR("PrefsVersion"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = !v2 || objc_msgSend(v2, "isEqualToString:", CFSTR("2.1"));

  return v4;
}

- (id)preferencesDictionaryForCity:(id)a3
{
  return +[CityPersistenceConversions dictionaryRepresentationOfCity:](CityPersistenceConversions, "dictionaryRepresentationOfCity:", a3);
}

- (id)cityFromPreferencesDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!-[WeatherPreferences _defaultsCurrent](self, "_defaultsCurrent"))
  {
    v12[0] = 0x24DDA3D18;
    v12[1] = 0x24DDA3D38;
    v12[2] = 0x24DDA3D58;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __52__WeatherPreferences_cityFromPreferencesDictionary___block_invoke;
    v10[3] = &unk_24DD9DDD8;
    v11 = v5;
    v6 = v5;
    objc_msgSend(v4, "na_filter:", v10);
    v7 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v7;
  }
  +[CityPersistenceConversions cityFromDictionary:](CityPersistenceConversions, "cityFromDictionary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __52__WeatherPreferences_cityFromPreferencesDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (City)localWeatherCity
{
  void *v3;
  void *v4;

  -[WeatherPreferencesPersistence dictionaryForKey:](self->_persistence, "dictionaryForKey:", CFSTR("LocalWeather"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[WeatherPreferences cityFromPreferencesDictionary:](self, "cityFromPreferencesDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setIsLocalWeatherCity:", 1);
  }
  else
  {
    v4 = 0;
  }

  return (City *)v4;
}

- (void)saveToDiskWithLocalWeatherCity:(id)a3
{
  WeatherPreferencesPersistence *persistence;
  void *v5;

  persistence = self->_persistence;
  -[WeatherPreferences preferencesDictionaryForCity:](self, "preferencesDictionaryForCity:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherPreferencesPersistence setObject:forKey:](persistence, "setObject:forKey:", v5, CFSTR("LocalWeather"));

  -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 1);
}

- (void)saveToDiskWithCity:(id)a3 forActiveIndex:(unint64_t)a4
{
  WeatherPreferencesPersistence *persistence;
  id v7;
  void *v8;
  void *v9;
  WeatherPreferencesPersistence *v10;
  void *v11;
  id v12;

  persistence = self->_persistence;
  v7 = a3;
  -[WeatherPreferencesPersistence arrayForKey:](persistence, "arrayForKey:", CFSTR("Cities"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v8, "mutableCopy");

  -[WeatherPreferences preferencesDictionaryForCity:](self, "preferencesDictionaryForCity:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v12, "count") > a4)
    objc_msgSend(v12, "replaceObjectAtIndex:withObject:", a4, v9);
  -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", v12, CFSTR("Cities"));
  v10 = self->_persistence;
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherPreferencesPersistence setObject:forKey:](v10, "setObject:forKey:", v11, CFSTR("LastUpdated"));

  -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 1);
}

- (void)saveToDiskWithCities:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  WeatherPreferencesPersistence *persistence;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("AlwaysUseLocallyAvailableSavedCities"));

  WALogForCategory(5);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "[WeatherPreferences] AlwaysUseLocallyAvailableSavedCities = 1, do not save new cities to disk.", (uint8_t *)&v16, 2u);
    }
  }
  else
  {
    if (v8)
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Saving cities to disk: %@", (uint8_t *)&v16, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "count");
    if (v9)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        objc_msgSend(v4, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "isLocalWeatherCity") & 1) == 0 && (objc_msgSend(v12, "isTransient") & 1) == 0)
        {
          -[WeatherPreferences preferencesDictionaryForCity:](self, "preferencesDictionaryForCity:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject na_safeAddObject:](v7, "na_safeAddObject:", v13);

        }
      }
    }
    -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", v7, CFSTR("Cities"));
    persistence = self->_persistence;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherPreferencesPersistence setObject:forKey:](persistence, "setObject:forKey:", v15, CFSTR("LastUpdated"));

    -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", CFSTR("The Weather Channel"), CFSTR("ServiceProvider"));
    -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", CFSTR("2.1"), CFSTR("PrefsVersion"));
    -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 1);
  }

}

- (void)saveToDiskWithCities:(id)a3 activeCity:(unint64_t)a4
{
  WeatherPreferencesPersistence *persistence;
  void *v7;

  -[WeatherPreferences saveToDiskWithCities:](self, "saveToDiskWithCities:", a3);
  persistence = self->_persistence;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WeatherPreferencesPersistence setObject:forKey:](persistence, "setObject:forKey:", v7, CFSTR("ActiveCity"));

  -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 1);
}

- (id)_defaultCities
{
  void *v2;

  v2 = (void *)__defaultCities;
  if (!__defaultCities)
  {
    if (_defaultCities_onceToken != -1)
      dispatch_once(&_defaultCities_onceToken, &__block_literal_global_75);
    dispatch_sync((dispatch_queue_t)_defaultCities_ALCityManagerDispatchQueue, &__block_literal_global_77);
    v2 = (void *)__defaultCities;
  }
  return v2;
}

void __36__WeatherPreferences__defaultCities__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.weather.ALCityManagerDispatchQueue", 0);
  v1 = (void *)_defaultCities_ALCityManagerDispatchQueue;
  _defaultCities_ALCityManagerDispatchQueue = (uint64_t)v0;

}

void __36__WeatherPreferences__defaultCities__block_invoke_2()
{
  id v0;
  const __CFLocale *v1;
  CFTypeRef Value;
  CFTypeRef v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v1 = CFLocaleCopyCurrent();
  Value = CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x24BDBD3D8]);
  v3 = CFLocaleGetValue(v1, (CFLocaleKey)*MEMORY[0x24BDBD410]);
  objc_msgSend(MEMORY[0x24BE04750], "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "defaultCitiesForLocaleCode:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5
    || (objc_msgSend(MEMORY[0x24BE04750], "sharedManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "defaultCitiesForLocaleCode:", Value),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v5))
  {
    if (objc_msgSend(v5, "count"))
    {
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v5 = v5;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v14;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v14 != v9)
              objc_enumerationMutation(v5);
            +[CityPersistenceConversions cityFromALCity:](CityPersistenceConversions, "cityFromALCity:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v0, "na_safeAddObject:", v11);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v8);
      }

    }
  }
  CFRelease(v1);
  v12 = (void *)__defaultCities;
  __defaultCities = (uint64_t)v0;

}

- (void)setDefaultCities:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  WALogForCategory(5);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "valueForKeyPath:", CFSTR("name"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v23 = "-[WeatherPreferences setDefaultCities:]";
    v24 = 2112;
    v25 = v5;
    _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_INFO, "%s cities: %@", buf, 0x16u);

  }
  if (v3)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = v3;
    v7 = v3;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            +[CityPersistenceConversions cityFromALCity:](CityPersistenceConversions, "cityFromALCity:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "na_safeAddObject:", v14);

          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v6, "na_safeAddObject:", v12);
          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

    v15 = (void *)__defaultCities;
    __defaultCities = (uint64_t)v6;

    v3 = v16;
  }

}

- (id)loadSavedCities
{
  NSObject *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  NSObject *v13;
  char *v14;
  void *v15;
  char *v16;
  char *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  WeatherPreferences *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  int v35;
  NSObject *v36;
  id v37;
  void *v38;
  City *v39;
  NSObject *v40;
  id v41;
  __CFString *v43;
  void *v44;
  void *v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  const char *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v53 = "-[WeatherPreferences loadSavedCities]";
    _os_log_impl(&dword_21AAEC000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("Cities");
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLForKey:", CFSTR("AlwaysUseLocallyAvailableSavedCities"));

  if (v8)
  {
    WALogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "[WeatherPreferences] AlwaysUseLocallyAvailableSavedCities = 1, load cities using perf cities key.", buf, 2u);
    }

    v6 = CFSTR("PerfCities");
  }
  -[WeatherPreferencesPersistence arrayForKey:](self->_persistence, "arrayForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_filter:", &__block_literal_global_86);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v11);

  v12 = -[WeatherPreferences isLocalWeatherEnabled](self, "isLocalWeatherEnabled");
  WALogForCategory(0);
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
    v14 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v53 = v14;
    _os_log_impl(&dword_21AAEC000, v13, OS_LOG_TYPE_DEFAULT, "in loadSavedCities, localWeatherEnabled=%@", buf, 0xCu);

  }
  if (v12)
  {
    -[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("LocalWeather"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[WeatherPreferences cityFromPreferencesDictionary:](self, "cityFromPreferencesDictionary:", v15);
      v16 = (char *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (char *)objc_opt_new();
    }
    v17 = v16;
    objc_msgSend(v16, "setIsLocalWeatherCity:", 1);
    WALogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v17;
      _os_log_impl(&dword_21AAEC000, v18, OS_LOG_TYPE_DEFAULT, "in loadSavedCities, local weather city = %@", buf, 0xCu);
    }

    objc_msgSend(v4, "na_safeAddObject:", v17);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && -[WeatherPreferences _defaultsAreValid](self, "_defaultsAreValid"))
  {
    v43 = v6;
    v45 = v4;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v44 = v5;
    obj = v5;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 20 - v12;
      v24 = *(_QWORD *)v48;
LABEL_20:
      v25 = 0;
      while (1)
      {
        if (*(_QWORD *)v48 != v24)
          objc_enumerationMutation(obj);
        v26 = self;
        -[WeatherPreferences cityFromPreferencesDictionary:](self, "cityFromPreferencesDictionary:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v25));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "na_safeAddObject:", v27);
        objc_msgSend(v27, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v29, "addObject:", v27);
        objc_msgSend(v27, "name");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKey:", v29, v30);

        v31 = objc_msgSend(v19, "count");
        self = v26;
        if (v31 == v23)
          break;
        if (v22 == ++v25)
        {
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
          if (v22)
            goto LABEL_20;
          break;
        }
      }
    }

    WALogForCategory(5);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)obj;
      _os_log_impl(&dword_21AAEC000, v32, OS_LOG_TYPE_DEFAULT, "Retrieved stored cities: %@", buf, 0xCu);
    }

    WALogForCategory(5);
    v33 = objc_claimAutoreleasedReturnValue();
    v4 = v45;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v19;
      _os_log_impl(&dword_21AAEC000, v33, OS_LOG_TYPE_DEFAULT, "Safely add stored cities: %@", buf, 0xCu);
    }

    -[WeatherPreferences citiesByConsolidatingDuplicates:originalOrder:](self, "citiesByConsolidatingDuplicates:originalOrder:", v20, v19);
    v34 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v45, "addObjectsFromArray:", v34);
    v35 = -[WeatherPreferences loadActiveCity](self, "loadActiveCity");
    if (objc_msgSend(v45, "count") <= (unint64_t)v35)
      -[WeatherPreferences setActiveCity:](self, "setActiveCity:", objc_msgSend(v45, "count") - 1);
    WALogForCategory(5);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v34;
      _os_log_impl(&dword_21AAEC000, v36, OS_LOG_TYPE_DEFAULT, "Return loaded cities: %@", buf, 0xCu);
    }

    v37 = v45;
    v19 = (void *)v34;
    v6 = v43;
    v5 = v44;
  }
  else
  {
    -[WeatherPreferences _defaultCities](self, "_defaultCities");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v38);

    if (!objc_msgSend(v4, "count") && !objc_msgSend(v19, "count"))
    {
      v39 = objc_alloc_init(City);
      -[City setLatitude:](v39, "setLatitude:", 37.3175);
      -[City setLongitude:](v39, "setLongitude:", -122.041944);
      -[City setName:](v39, "setName:", CFSTR("Cupertino"));
      objc_msgSend(v4, "addObject:", v39);

    }
    objc_msgSend(v4, "addObjectsFromArray:", v19);
    WALogForCategory(5);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v53 = (const char *)v4;
      _os_log_impl(&dword_21AAEC000, v40, OS_LOG_TYPE_DEFAULT, "No saved cities, and defaults are not valid. Laod new default cities: %@", buf, 0xCu);
    }

    v41 = v4;
  }

  return v4;
}

BOOL __37__WeatherPreferences_loadSavedCities__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cityDictionaryHasValidCoordinates:](CityPersistenceConversions, "cityDictionaryHasValidCoordinates:", a2);
}

- (id)citiesByConsolidatingDuplicates:(id)a3 originalOrder:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  WeatherPreferences *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v7 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke;
  v24[3] = &unk_24DD9DE60;
  v8 = v6;
  v25 = v8;
  v26 = self;
  v27 = &v28;
  objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v24);
  if (*((_BYTE *)v29 + 24))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v10 = v17;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(v10);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          v19[0] = v7;
          v19[1] = 3221225472;
          v19[2] = __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke_2;
          v19[3] = &unk_24DD9D740;
          v19[4] = v14;
          objc_msgSend(v8, "na_firstObjectPassingTest:", v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(v9, "addObject:", v15);
            objc_msgSend(v8, "removeObject:", v15);
          }

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v32, 16);
      }
      while (v11);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v28, 8);
  return v9;
}

void __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count") == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v7, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "citiesByConsolidatingDuplicatesInBucket:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v5);
    v6 = objc_msgSend(v5, "count");
    if (v6 != objc_msgSend(v7, "count"))
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

uint64_t __68__WeatherPreferences_citiesByConsolidatingDuplicates_originalOrder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isDuplicateOfCity:", a2);
}

- (id)citiesByConsolidatingDuplicatesInBucket:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[5];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = MEMORY[0x24BDAC760];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        v14[0] = v10;
        v14[1] = 3221225472;
        v14[2] = __62__WeatherPreferences_citiesByConsolidatingDuplicatesInBucket___block_invoke;
        v14[3] = &unk_24DD9D740;
        v14[4] = v12;
        if ((objc_msgSend(v4, "na_all:", v14) & 1) == 0)
          objc_msgSend(v4, "addObject:", v12);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

uint64_t __62__WeatherPreferences_citiesByConsolidatingDuplicatesInBucket___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isDuplicateOfCity:", *(_QWORD *)(a1 + 32));
}

- (int)loadActiveCity
{
  void *v3;
  void *v4;
  int v5;

  if ((objc_msgSend(MEMORY[0x24BDF6800], "shouldMakeUIForDefaultPNG") & 1) != 0)
    return 0;
  -[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("ActiveCity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = v3;
  v5 = objc_msgSend(v3, "intValue");

  return v5;
}

- (void)setActiveCity:(unint64_t)a3
{
  WeatherPreferencesPersistence *persistence;
  id v4;

  persistence = self->_persistence;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WeatherPreferencesPersistence setObject:forKey:](persistence, "setObject:forKey:", v4, CFSTR("ActiveCity"));

}

- (int)loadDefaultSelectedCity
{
  void *v2;
  void *v3;
  int v4;

  -[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("DefaultSelectedCity"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (id)loadDefaultSelectedCityID
{
  return (id)-[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("userSelectedCityID"));
}

- (void)setDefaultSelectedCity:(unint64_t)a3
{
  WeatherPreferencesPersistence *persistence;
  id v4;

  persistence = self->_persistence;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WeatherPreferencesPersistence setObject:forKey:](persistence, "setObject:forKey:", v4, CFSTR("DefaultSelectedCity"));

}

- (void)setDefaultSelectedCityID:(id)a3
{
  -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", a3, CFSTR("userSelectedCityID"));
}

- (void)synchronizeStateToDiskDoNotify:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  -[WeatherPreferencesPersistence synchronize](self->_persistence, "synchronize");
  -[WeatherPreferences saveToUbiquitousStore](self, "saveToUbiquitousStore");
  if (v3)
  {
    WALogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[WeatherPreferences synchronizeStateToDiskDoNotify:].cold.1(v5);

    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("WeatherGroupPrefsDidUpdateNotification"), v8, 0, 1);

  }
}

- (void)synchronizeStateToDisk
{
  -[WeatherPreferences synchronizeStateToDiskDoNotify:](self, "synchronizeStateToDiskDoNotify:", 0);
}

- (void)forceSyncCloudPreferences
{
  id v2;

  -[WeatherPreferences cloudPreferences](self, "cloudPreferences");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceSync");

}

- (id)UUID
{
  NSString *UUID;
  id *p_UUID;
  NSString *v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFUUID *v10;
  __CFString *v11;
  WeatherPreferencesPersistence *persistence;
  void *v13;
  uint64_t v15;
  id v16;

  p_UUID = (id *)&self->_UUID;
  UUID = self->_UUID;
  if (!UUID)
  {
    -[WeatherPreferencesPersistence stringForKey:](self->_persistence, "stringForKey:", CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("UUIDTimestamp"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -1209600.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "laterDate:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == v7)
        {
          v15 = objc_msgSend(v6, "copy");
          v16 = *p_UUID;
          *p_UUID = (id)v15;

          v4 = (NSString *)*p_UUID;
          goto LABEL_8;
        }
      }

    }
    v10 = CFUUIDCreate(0);
    v11 = (__CFString *)CFUUIDCreateString(0, v10);

    CFRelease(v10);
    objc_storeStrong(p_UUID, v11);
    -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", self->_UUID, CFSTR("UUID"));
    persistence = self->_persistence;
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WeatherPreferencesPersistence setObject:forKey:](persistence, "setObject:forKey:", v13, CFSTR("UUIDTimestamp"));

    v4 = self->_UUID;
    v6 = v11;
LABEL_8:

    return v4;
  }
  v4 = UUID;
  return v4;
}

- (id)twcLogoURL
{
  return TWCAttributionURLForTrafficParameter(CFSTR("TWC"));
}

- (id)twcLogoURL:(id)a3
{
  return TWCAttributionURLForTrafficParameter(a3);
}

- (id)_cacheDirectoryPath
{
  NSString *cacheDirectoryPath;
  void *v4;
  void *v5;
  NSString *v6;
  NSString *v7;

  cacheDirectoryPath = self->_cacheDirectoryPath;
  if (!cacheDirectoryPath)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userLibraryDirectory");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Caches/Weather"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cacheDirectoryPath;
    self->_cacheDirectoryPath = v6;

    cacheDirectoryPath = self->_cacheDirectoryPath;
  }
  return cacheDirectoryPath;
}

- (void)writeDefaultValue:(id)a3 forKey:(id)a4
{
  -[WeatherPreferencesPersistence setObject:forKey:](self->_persistence, "setObject:forKey:", a3, a4);
}

- (id)readDefaultValueForKey:(id)a3
{
  return (id)-[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", a3);
}

+ (id)readInternalDefaultValueForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)readInternalDefaultValueForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setLocalWeatherEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  WALogForCategory(4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v6;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "setLocalWeatherEnabled=%@", (uint8_t *)&v7, 0xCu);

  }
  -[WeatherPreferencesPersistence setBool:forKey:](self->_persistence, "setBool:forKey:", v3, CFSTR("LocalWeatherEnabledKey"));
}

- (BOOL)isLocalWeatherEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("LocalWeatherEnabledKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)serviceDebugging
{
  return self->_serviceDebugging;
}

+ (id)serviceDebuggingPath
{
  if (serviceDebuggingPath_onceToken != -1)
    dispatch_once(&serviceDebuggingPath_onceToken, &__block_literal_global_99_0);
  return (id)serviceDebuggingPath_debuggingPath;
}

void __42__WeatherPreferences_serviceDebuggingPath__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "userLibraryDirectory");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Weather"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", v6, 0);

  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ServiceDebugging"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByResolvingSymlinksInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)serviceDebuggingPath_debuggingPath;
  serviceDebuggingPath_debuggingPath = v4;

}

- (void)resetLocale
{
  void *v2;

  v2 = (void *)__defaultCities;
  __defaultCities = 0;

}

- (void)_clearCachedObjects
{
  NSString *cacheDirectoryPath;

  cacheDirectoryPath = self->_cacheDirectoryPath;
  self->_cacheDirectoryPath = 0;

  -[WeatherPreferences resetLocale](self, "resetLocale");
}

- (void)saveToUbiquitousStore
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint8_t buf[16];

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("AlwaysUseLocallyAvailableSavedCities"));

  if (v4)
  {
    WALogForCategory(5);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "[WeatherPreferences] AlwaysUseLocallyAvailableSavedCities = 1, do not save new cities to ubiquitous store.", buf, 2u);
    }

  }
  else
  {
    -[WeatherPreferences cloudPreferences](self, "cloudPreferences");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[WeatherPreferences loadSavedCities](self, "loadSavedCities");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "saveCitiesToCloud:", v6);

  }
}

- (BOOL)areCitiesDefault:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  int v22;
  BOOL v23;
  id v25;
  id obj;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WeatherPreferences _defaultCities](self, "_defaultCities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  v27 = v5;
  if (v6 == objc_msgSend(v5, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v25 = v4;
      v9 = 0;
      v10 = *(_QWORD *)v29;
      v11 = *MEMORY[0x24BEC2148];
      v12 = *MEMORY[0x24BEC2150];
      while (2)
      {
        v13 = 0;
        v14 = v9;
        do
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
          objc_msgSend(v27, "objectAtIndex:", v14 + v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "floatValue");
          v19 = v18;
          objc_msgSend(v15, "objectForKeyedSubscript:", v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "floatValue");
          v22 = objc_msgSend(v16, "containsLatitude:longitude:", v19, v21);

          if (!v22)
          {
            v23 = 0;
            goto LABEL_13;
          }
          ++v13;
        }
        while (v8 != v13);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v9 = v14 + v13;
        if (v8)
          continue;
        break;
      }
      v23 = 1;
LABEL_13:
      v4 = v25;
    }
    else
    {
      v23 = 1;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)temperatureUnitObserver:(id)a3 didChangeTemperatureUnitTo:(int)a4
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("kWeatherPrefsUpdateNotificationKey");
  NSStringFromWFTemperatureUnit();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("kWeatherPrefsDidUpdateUserTemperatureUnit"), self, v7);

}

+ (BOOL)performUpgradeOfPersistence:(id)a3 fileManager:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t *v19;
  uint64_t *v20;
  uint8_t buf[16];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint8_t v26[8];
  uint8_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (!v8)
      v9 = (id)objc_opt_new();
    if (performUpgradeOfPersistence_fileManager_error__onceToken != -1)
      dispatch_once(&performUpgradeOfPersistence_fileManager_error__onceToken, &__block_literal_global_106);
    *(_QWORD *)v26 = 0;
    v27 = v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__3;
    v30 = __Block_byref_object_dispose__3;
    v31 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x2020000000;
    v25 = 0;
    WALogForCategory(14);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v10, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Performing Weather migration from the WeatherPreferences...if needed", buf, 2u);
    }

    v11 = performUpgradeOfPersistence_fileManager_error__migrationQueue;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_108;
    v16[3] = &unk_24DD9DF58;
    v9 = v9;
    v17 = v9;
    v19 = v26;
    v20 = &v22;
    v18 = v7;
    dispatch_sync(v11, v16);
    if (a5)
    {
      v12 = (void *)*((_QWORD *)v27 + 5);
      if (v12)
        *a5 = objc_retainAutorelease(v12);
    }
    LOBYTE(a5) = *((_BYTE *)v23 + 24) != 0;

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(v26, 8);

  }
  else
  {
    WALogForCategory(14);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_21AAEC000, v13, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - failed to update persistence.", v26, 2u);
    }

    if (a5)
    {
      v32 = *MEMORY[0x24BDD0FC8];
      v33[0] = CFSTR("persistence was nil; can't upgrade it");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 3, v14);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
    }
  }

  return (char)a5;
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.WeatherApp.migrationQueue", 0);
  v1 = (void *)performUpgradeOfPersistence_fileManager_error__migrationQueue;
  performUpgradeOfPersistence_fileManager_error__migrationQueue = (uint64_t)v0;

}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_108(uint64_t a1)
{
  void *v2;
  __CFString *v3;
  NSObject *v4;
  _BOOL4 v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  int v43;
  id *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  NSObject *v53;
  _BOOL4 v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  const __CFString *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD v72[4];
  id v73;
  id v74;
  uint64_t v75;
  id v76;
  id v77;
  uint8_t buf[4];
  const __CFString *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  NSObject *v83;
  uint64_t v84;
  const __CFString *v85;
  uint64_t v86;
  _QWORD v87[3];

  v87[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.weather"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  WALogForCategory(14);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      v79 = v3;
      _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - groupContainers: %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", CFSTR("/var/mobile/Library/Preferences/com.apple.weather.plist"));
    v4 = objc_claimAutoreleasedReturnValue();
    -[__CFString URLByAppendingPathComponent:](v3, "URLByAppendingPathComponent:", CFSTR("Library/Preferences/"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[__CFString URLByAppendingPathComponent:](v3, "URLByAppendingPathComponent:", CFSTR("Library/Preferences/group.com.apple.weather.plist"));
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    WALogForCategory(14);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = (const __CFString *)v4;
      _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - source: %@", buf, 0xCu);
    }

    WALogForCategory(14);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = v7;
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - destination: %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 32);
    -[NSObject path](v4, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = objc_msgSend(v10, "fileExistsAtPath:", v11);

    if ((_DWORD)v10)
    {
      v12 = *(void **)(a1 + 32);
      -[__CFString path](v7, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v12) = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if ((v12 & 1) != 0)
      {
        WALogForCategory(14);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AAEC000, v14, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - destination file is already present, don't overwrite", buf, 2u);
        }

        v15 = 0;
      }
      else
      {
        v16 = *(void **)(a1 + 32);
        v77 = 0;
        v17 = objc_msgSend(v16, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v77);
        v18 = v77;
        WALogForCategory(14);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v17)
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v79 = v6;
            _os_log_impl(&dword_21AAEC000, v20, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - succeeded to create destination folder %@", buf, 0xCu);
          }

          v21 = *(void **)(a1 + 32);
          v76 = v18;
          v22 = objc_msgSend(v21, "copyItemAtURL:toURL:error:", v4, v7, &v76);
          v15 = v76;

          WALogForCategory(14);
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = v23;
          if ((v22 & 1) != 0)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_21AAEC000, v24, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - succeeded to copyItemAtURL", buf, 2u);
            }

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_108_cold_1((uint64_t)v15, v24, v32);

            v86 = *MEMORY[0x24BDD0FC8];
            v87[0] = CFSTR("failed copyItemAtURL");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v87, &v86, 1);
            v33 = (id)objc_claimAutoreleasedReturnValue();
            v15 = v15;
            v34 = v33;
            if (v15)
            {
              if (v33)
                v35 = v33;
              else
                v35 = (void *)MEMORY[0x24BDBD1B8];
              v34 = (void *)objc_msgSend(v35, "mutableCopy");
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1398]);

            }
            objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 2, v34);
            v36 = objc_claimAutoreleasedReturnValue();

            v37 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v38 = *(void **)(v37 + 40);
            *(_QWORD *)(v37 + 40) = v36;

          }
        }
        else
        {
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_108_cold_2((uint64_t)v18, v20, v25);

          v84 = *MEMORY[0x24BDD0FC8];
          v85 = CFSTR("failed to create destination folder");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v85, &v84, 1);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          v15 = v18;
          v27 = v26;
          if (v15)
          {
            if (v26)
              v28 = v26;
            else
              v28 = (void *)MEMORY[0x24BDBD1B8];
            v27 = (void *)objc_msgSend(v28, "mutableCopy");
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BDD1398]);

          }
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 2, v27);
          v29 = objc_claimAutoreleasedReturnValue();

          v30 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v31 = *(void **)(v30 + 40);
          *(_QWORD *)(v30 + 40) = v29;

        }
      }
      WALogForCategory(14);
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AAEC000, v39, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - removing source file", buf, 2u);
      }

      objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", v4, 0);
    }
    else
    {
      WALogForCategory(14);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21AAEC000, v15, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - source file does not exist, nothing to do", buf, 2u);
      }
    }

  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - no groupContainers", buf, 2u);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    WALogForCategory(14);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v79 = CFSTR("Celsius");
      _os_log_impl(&dword_21AAEC000, v40, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Moving Prefs key '%@' (representing BOOL of whether user temperature unit is celsius or fahrenheit) to new NSLocale API", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("Celsius"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (v41)
    {
      v43 = objc_msgSend(v41, "BOOLValue");
      v44 = (id *)MEMORY[0x24BDBCB50];
      if (!v43)
        v44 = (id *)MEMORY[0x24BDBCB58];
      v45 = *v44;
      objc_msgSend(MEMORY[0x24BDBCEA0], "_setPreferredTemperatureUnit:", v45);
      CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD568]);
      objc_msgSend(*(id *)(a1 + 40), "removeObjectForKey:", CFSTR("Celsius"));
      WALogForCategory(14);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v79 = CFSTR("Celsius");
        v80 = 2112;
        v81 = v42;
        v82 = 2112;
        v83 = v45;
        _os_log_impl(&dword_21AAEC000, v46, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Migrated key '%@' (%@) NSLocale API value (%@).", buf, 0x20u);
      }

    }
    else
    {
      WALogForCategory(14);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v79 = CFSTR("Celsius");
        _os_log_impl(&dword_21AAEC000, v45, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Skipping key '%@' migration to NSLocale API -- must have already been migrated or doesn't exist.", buf, 0xCu);
      }
    }

    objc_msgSend(*(id *)(a1 + 40), "stringForKey:", CFSTR("PrefsVersion"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      objc_msgSend(v47, "doubleValue");
      v50 = v49;
      objc_msgSend(CFSTR("2.1"), "doubleValue");
      v52 = v51;
      WALogForCategory(14);
      v53 = objc_claimAutoreleasedReturnValue();
      v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT);
      if (v50 < v52)
      {
        if (v54)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21AAEC000, v53, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - Updating to 2.1..", buf, 2u);
        }

        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v53 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "arrayForKey:", CFSTR("Cities"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "na_filter:", &__block_literal_global_122);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObjectsFromArray:](v53, "addObjectsFromArray:", v56);

        v57 = -[NSObject mutableCopy](v53, "mutableCopy");
        objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("LocalWeather"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v58
          && +[CityPersistenceConversions cityDictionaryHasValidCoordinates:](CityPersistenceConversions, "cityDictionaryHasValidCoordinates:", v58))
        {
          objc_msgSend(v57, "addObject:", v58);
        }
        v59 = (void *)objc_msgSend(v57, "copy");
        v72[0] = MEMORY[0x24BDAC760];
        v72[1] = 3221225472;
        v72[2] = __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3;
        v72[3] = &unk_24DD9DF30;
        v60 = *(_QWORD *)(a1 + 48);
        v74 = &__block_literal_global_124;
        v75 = v60;
        v61 = v57;
        v73 = v61;
        objc_msgSend(v59, "enumerateObjectsUsingBlock:", v72);

        if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          v62 = v61;
          v63 = v62;
          if (v58 && objc_msgSend(v62, "count"))
          {
            objc_msgSend(v63, "lastObject");
            v71 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v63, "subarrayWithRange:", 0, objc_msgSend(v63, "count") - 1);
            v70 = objc_claimAutoreleasedReturnValue();

            v58 = (void *)v71;
            objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v71, CFSTR("LocalWeather"));
            v63 = (void *)v70;
          }
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v63, CFSTR("Cities"));
          v64 = *(void **)(a1 + 40);
          objc_msgSend(MEMORY[0x24BDBCE60], "date");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "setObject:forKey:", v65, CFSTR("LastUpdated"));

          objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", CFSTR("2.1"), CFSTR("PrefsVersion"));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

        }
        WALogForCategory(14);
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 40), "stringForKey:", CFSTR("PrefsVersion"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "doubleValue");
          *(_DWORD *)buf = 134217984;
          v79 = v68;
          _os_log_impl(&dword_21AAEC000, v66, OS_LOG_TYPE_DEFAULT, "WeatherPreferences _performMigration - finished persistence upgrade from version: %f", buf, 0xCu);

        }
        goto LABEL_75;
      }
      if (v54)
      {
        *(_WORD *)buf = 0;
        v69 = "WeatherPreferences _performMigration - Prefs are more up to date than this migrator knows how to handle.  Bailing.";
        goto LABEL_74;
      }
    }
    else
    {
      WALogForCategory(14);
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v69 = "WeatherPreferences _performMigration - First boot scenario; bailing from migration.";
LABEL_74:
        _os_log_impl(&dword_21AAEC000, v53, OS_LOG_TYPE_DEFAULT, v69, buf, 2u);
      }
    }
LABEL_75:

  }
}

BOOL __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_121(uint64_t a1, uint64_t a2)
{
  return +[CityPersistenceConversions cityDictionaryHasValidCoordinates:](CityPersistenceConversions, "cityDictionaryHasValidCoordinates:", a2);
}

uint64_t __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_2(uint64_t a1, void *a2, void *a3, _QWORD *a4)
{
  id v6;
  id v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_msgSend(v6, "objectForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v8, "doubleValue");
          v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2220]), "initWithTemperatureUnit:value:", 2, v9);
          +[CityPersistenceConversions dictionaryRepresentationOfTemperature:](CityPersistenceConversions, "dictionaryRepresentationOfTemperature:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, v7);

          v12 = 1;
LABEL_12:

          goto LABEL_13;
        }
        if (a4)
        {
          v16[0] = CFSTR("key");
          v16[1] = CFSTR("value");
          v17[0] = v7;
          v17[1] = v8;
          v16[2] = CFSTR("container");
          v13 = (void *)objc_msgSend(v6, "copy");
          v17[2] = v13;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 4, v14);
          *a4 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
    }
    v12 = 0;
    goto LABEL_12;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 4, 0);
    v12 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_13:

  return v12;
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  objc_class *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  _QWORD v41[4];
  id v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t *v46;
  _BYTE *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  id obj;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  const __CFString *v62;
  _BYTE v63[16];
  _BYTE v64[128];
  _QWORD v65[2];
  _BYTE v66[128];
  _QWORD v67[6];

  v37 = a3;
  v67[4] = *MEMORY[0x24BDAC8D0];
  v38 = a2;
  v5 = (void *)objc_msgSend(v38, "mutableCopy");
  v6 = (void *)MEMORY[0x24BDBCF20];
  v67[0] = 0x24DDA4358;
  v67[1] = 0x24DDA3ED8;
  v67[2] = 0x24DDA44B8;
  v67[3] = 0x24DDA44D8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v67, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v9 = v8;
  v10 = 0;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v58;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v58 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(a1 + 40);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        obj = *(id *)(v15 + 40);
        v16 = (*(uint64_t (**)(void))(v14 + 16))();
        objc_storeStrong((id *)(v15 + 40), obj);
        if ((v16 & 1) != 0)
        {
          v10 = 1;
        }
        else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
          *a4 = 1;

          goto LABEL_32;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
      if (v11)
        continue;
      break;
    }
  }

  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v17 = (void *)MEMORY[0x24BDBCF20];
  v65[0] = 0x24DDA4558;
  v65[1] = 0x24DDA4498;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v39 = v19;
  v20 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v49;
    while (2)
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v49 != v21)
          objc_enumerationMutation(v39);
        v23 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * j);
        objc_msgSend(v5, "objectForKeyedSubscript:", v23, v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v24, "mutableCopy");

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          WALogForCategory(14);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3_cold_1(v32, (uint64_t)v63, v30);
          }

          v61 = *MEMORY[0x24BDD0FD8];
          v62 = CFSTR("Container class was of incorrect class type");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v62, &v61, 1);
          v33 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.weather.errorDomain"), 3, v33);
          v34 = objc_claimAutoreleasedReturnValue();

          v35 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v36 = *(void **)(v35 + 40);
          *(_QWORD *)(v35 + 40) = v34;

          *a4 = 1;
          goto LABEL_31;
        }
        v26 = (void *)objc_msgSend(v25, "copy");
        v41[0] = MEMORY[0x24BDAC760];
        v41[1] = 3221225472;
        v41[2] = __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_137;
        v41[3] = &unk_24DD9DF08;
        v42 = v9;
        v27 = *(id *)(a1 + 40);
        v28 = *(_QWORD *)(a1 + 48);
        v44 = v27;
        v45 = v28;
        v29 = v25;
        v43 = v29;
        v46 = &v52;
        v47 = a4;
        objc_msgSend(v26, "enumerateObjectsUsingBlock:", v41);

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {

          goto LABEL_28;
        }
        if (*((_BYTE *)v53 + 24))
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, v23);

      }
      v20 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v48, v64, 16);
      if (v20)
        continue;
      break;
    }
  }
LABEL_28:

  if ((v10 & 1) != 0 || *((_BYTE *)v53 + 24))
    objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", v5, v37, v37);
LABEL_31:

  _Block_object_dispose(&v52, 8);
LABEL_32:

}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_137(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  int v13;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a2, "mutableCopy");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = *(id *)(a1 + 32);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        obj = *(id *)(v12 + 40);
        v13 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
        objc_storeStrong((id *)(v12 + 40), obj);
        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v6, a3);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
          **(_BYTE **)(a1 + 72) = 1;
          *a4 = 1;
          goto LABEL_13;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_13:

}

- (NSDate)lastUpdated
{
  return (NSDate *)-[WeatherPreferencesPersistence objectForKey:](self->_persistence, "objectForKey:", CFSTR("LastUpdated"));
}

- (SynchronizedDefaultsDelegate)syncDelegate
{
  return (SynchronizedDefaultsDelegate *)objc_loadWeakRetained((id *)&self->_syncDelegate);
}

- (BOOL)userGroupPrefsLockedWhenInit
{
  return self->_userGroupPrefsLockedWhenInit;
}

- (void)setUserGroupPrefsLockedWhenInit:(BOOL)a3
{
  self->_userGroupPrefsLockedWhenInit = a3;
}

- (WeatherCloudPreferences)cloudPreferences
{
  return (WeatherCloudPreferences *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCloudPreferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudPreferences, 0);
  objc_destroyWeak((id *)&self->_syncDelegate);
  objc_storeStrong((id *)&self->_cacheDirectoryPath, 0);
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_lastUbiquitousWrittenDefaults, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)synchronizeStateToDiskDoNotify:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21AAEC000, log, OS_LOG_TYPE_DEBUG, "WeatherPreferences: posting kWeatherPrefGroupPrefsDidUpdate", v1, 2u);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_108_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_21AAEC000, a2, a3, "WeatherPreferences _performMigration - failed copyItemAtURL %@", (uint8_t *)&v3);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_108_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_2(&dword_21AAEC000, a2, a3, "WeatherPreferences _performMigration - failed to create destination folder %@", (uint8_t *)&v3);
}

void __68__WeatherPreferences_performUpgradeOfPersistence_fileManager_error___block_invoke_3_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_21AAEC000, a3, (uint64_t)a3, "WeatherPreferences migration observed an unexpected class while upgrading temperature; should've received an NSArray"
    ", instead encountered a %@",
    (uint8_t *)a2);

}

@end
