@implementation TWCLocationUpdater

+ (id)sharedLocationUpdater
{
  if (sharedLocationUpdater_onceToken != -1)
    dispatch_once(&sharedLocationUpdater_onceToken, &__block_literal_global_22);
  return (id)sharedLocationUpdater___sharedLocationUpdater;
}

uint64_t __43__TWCLocationUpdater_sharedLocationUpdater__block_invoke()
{
  TWCLocationUpdater *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t result;

  v0 = objc_alloc_init(TWCLocationUpdater);
  v1 = (void *)sharedLocationUpdater___sharedLocationUpdater;
  sharedLocationUpdater___sharedLocationUpdater = (uint64_t)v0;

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __internalInstall = objc_msgSend(v2, "isInternalInstall");

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ForceLocalFallback"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BOOLValue");

  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("kMaxLatLonAccuracy"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __maxLatLonAccuracy = objc_msgSend(v6, "intValue");

  result = objc_msgSend((id)*MEMORY[0x24BDF74F8], "launchedToTest");
  __launchedToTest = result;
  if (__maxLatLonAccuracy <= 0)
    __maxLatLonAccuracy = 5;
  return result;
}

- (TWCLocationUpdater)init
{
  TWCLocationUpdater *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TWCLocationUpdater;
  v2 = -[TWCCityUpdater init](&v4, sel_init);
  if (v2)
    v2->_greenTeaLogger = (ct_green_tea_logger_s *)ct_green_tea_logger_create();
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[TWCLocationUpdater greenTeaLogger](self, "greenTeaLogger");
  ct_green_tea_logger_destroy();
  v3.receiver = self;
  v3.super_class = (Class)TWCLocationUpdater;
  -[TWCLocationUpdater dealloc](&v3, sel_dealloc);
}

- (void)parsedResultCity:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  __CFNotificationCenter *DarwinNotifyCenter;
  BOOL v20;
  void *v21;

  v3 = a3;
  objc_msgSend(v3, "locationID");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v3, "isRequestedByFrameworkClient");

    if ((v6 & 1) == 0)
    {
      objc_msgSend(v3, "wfLocation");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(v3, "setName:", v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("LOCAL_WEATHER"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setName:", v10);

      }
      objc_msgSend(v7, "geoLocation");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLocation:", v11);

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setUpdateTime:", v12);

      +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (__internalInstall)
      {
        +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("RandomizeWeather"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "BOOLValue");

        if (v16)
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2220]), "initWithTemperatureUnit:value:", 2, (double)(rand() % 50 - 50));
          objc_msgSend(v3, "setTemperature:", v17);
          objc_msgSend(v3, "setConditionCode:", rand() % 37);
          WALogForCategory(0);
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            -[TWCLocationUpdater parsedResultCity:].cold.1(v18);

        }
      }
      objc_msgSend(v13, "saveToDiskWithLocalWeatherCity:", v3);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.weather.localCityChanged"), 0, 0, 1u);

    }
  }
  if (__launchedToTest)
    v20 = 1;
  else
    v20 = __internalInstall == 0;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "postNotificationName:object:", CFSTR("RestStateNotification"), 0);

  }
}

- (void)enableProgressIndicator:(BOOL)a3
{
  _BOOL8 v3;
  id *v4;
  id v5;

  v3 = a3;
  v4 = (id *)MEMORY[0x24BDF74F8];
  if (objc_msgSend((id)*MEMORY[0x24BDF74F8], "conformsToProtocol:", &unk_255131D80))
  {
    if (objc_msgSend(*v4, "showProgressIndicator"))
    {
      +[ProgressController sharedProgressController](ProgressController, "sharedProgressController");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setLoadingData:", v3);

    }
  }
}

- (void)updateWeatherForCity:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WALogForCategory(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "isLocalWeatherCity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v4;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_21AAEC000, v5, OS_LOG_TYPE_DEFAULT, "Update weather for city : %@, isLocalWeatherCity=%@", (uint8_t *)&v11, 0x16u);

  }
  if (objc_msgSend(v4, "isLocalWeatherCity"))
  {
    +[WeatherLocationManager sharedWeatherLocationManager](WeatherLocationManager, "sharedWeatherLocationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WALogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        v11 = 138412290;
        v12 = v8;
        _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "Has location: %@", (uint8_t *)&v11, 0xCu);
      }

      -[TWCLocationUpdater updateWeatherForLocation:city:](self, "updateWeatherForLocation:city:", v8, v4);
    }
    else
    {
      if (v10)
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "Does not have location from location manager, force location update", (uint8_t *)&v11, 2u);
      }

      objc_msgSend(v7, "forceLocationUpdate");
    }

  }
}

- (void)updateWeatherForLocation:(id)a3 city:(id)a4 isFromFrameworkClient:(BOOL)a5 withCompletionHandler:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  objc_msgSend(v11, "setIsRequestedByFrameworkClient:", v6);
  objc_msgSend(v11, "setIsLocalWeatherCity:", 1);
  -[TWCLocationUpdater _updateWeatherForLocation:city:completionHandler:](self, "_updateWeatherForLocation:city:completionHandler:", v12, v11, v10);

}

- (void)updateWeatherForLocation:(id)a3 city:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setIsRequestedByFrameworkClient:", 0);
  -[TWCLocationUpdater _updateWeatherForLocation:city:completionHandler:](self, "_updateWeatherForLocation:city:completionHandler:", v7, v6, 0);

}

- (void)_updateWeatherForLocation:(id)a3 city:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  WALogForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "-[TWCLocationUpdater _updateWeatherForLocation:city:completionHandler:]";
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v9;
    _os_log_impl(&dword_21AAEC000, v11, OS_LOG_TYPE_DEFAULT, "%s currentLocation=%@, localCity=%@", (uint8_t *)&v13, 0x20u);
  }

  if (v9)
  {
    -[TWCLocationUpdater setCurrentCity:](self, "setCurrentCity:", v9);
    -[TWCLocationUpdater _geocodeLocation:currentCity:completionHandler:](self, "_geocodeLocation:currentCity:completionHandler:", v8, v9, v10);
  }
  else if (v10)
  {
    WAErrorWithCode(4, 0, 0, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v12);

  }
}

- (void)_geocodeLocation:(id)a3 currentCity:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  WALogForCategory(4);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "-[TWCLocationUpdater _geocodeLocation:currentCity:completionHandler:]";
    v23 = 2112;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    _os_log_impl(&dword_21AAEC000, v11, OS_LOG_TYPE_DEFAULT, "%s location=%@, currentCity=%@", buf, 0x20u);
  }

  if (objc_msgSend(v9, "isLocalWeatherCity"))
  {
    -[TWCLocationUpdater greenTeaLogger](self, "greenTeaLogger");
    getCTGreenTeaOsLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21AAEC000, v13, OS_LOG_TYPE_INFO, "Transmitting current location to CoreLocation for reverse geocode request.", buf, 2u);
    }

  }
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke;
  v17[3] = &unk_24DD9E770;
  v17[4] = self;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

}

void __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reverseGeocoder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isGeocoding");

  if (v3)
  {
    WALogForCategory(4);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "reverseGeocoder");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v22 = v5;
      v23 = 2112;
      v24 = v6;
      v25 = 2112;
      v26 = v7;
      _os_log_impl(&dword_21AAEC000, v4, OS_LOG_TYPE_DEFAULT, "cancelGeocode reverseGeocoder=%@ for location=%@, currentCity=%@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 32), "reverseGeocoder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancelGeocode");

  }
  v9 = objc_alloc_init(MEMORY[0x24BDBFA68]);
  objc_msgSend(*(id *)(a1 + 32), "setReverseGeocoder:", v9);
  WALogForCategory(4);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    _os_log_impl(&dword_21AAEC000, v10, OS_LOG_TYPE_DEFAULT, "Will start reverseGeocodeLocation: location=%@, currentCity=%@", buf, 0x16u);
  }

  v13 = *(void **)(a1 + 40);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke_27;
  v16[3] = &unk_24DD9E748;
  v17 = v13;
  v14 = *(id *)(a1 + 48);
  v15 = *(_QWORD *)(a1 + 32);
  v18 = v14;
  v19 = v15;
  v20 = *(id *)(a1 + 56);
  objc_msgSend(v9, "reverseGeocodeLocation:completionHandler:", v17, v16);

}

void __69__TWCLocationUpdater__geocodeLocation_currentCity_completionHandler___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  WALogForCategory(4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v17 = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Reverse-geocoded Weather Location finished: placemark=%@, location=%@, error=%@", (uint8_t *)&v17, 0x20u);

  }
  if (v6)
  {
    v10 = 0;
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x24BDDB0F0]);
    v12 = objc_alloc(MEMORY[0x24BDDB160]);
    objc_msgSend(v5, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithPlacemark:", v13);
    v15 = (void *)objc_msgSend(v11, "initWithPlacemark:", v14);

    WALogForCategory(4);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v15;
      _os_log_impl(&dword_21AAEC000, v16, OS_LOG_TYPE_DEFAULT, "ReversGeocoded mapitem is: %@", (uint8_t *)&v17, 0xCu);
    }

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC21E0]), "initWithMapItem:isCurrentLocation:", v15, objc_msgSend(*(id *)(a1 + 40), "isLocalWeatherCity"));
  }
  objc_msgSend(*(id *)(a1 + 48), "_completeReverseGeocodeForLocation:currentCity:geocodeError:completionHandler:", v10, *(_QWORD *)(a1 + 40), v6, *(_QWORD *)(a1 + 56));

}

- (void)_completeReverseGeocodeForLocation:(id)a3 currentCity:(id)a4 geocodeError:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, id, void *);
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[5];
  id v33;
  void (**v34)(id, id, void *);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, id, void *))a6;
  WALogForCategory(4);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v37 = "-[TWCLocationUpdater _completeReverseGeocodeForLocation:currentCity:geocodeError:completionHandler:]";
    v38 = 2112;
    v39 = v10;
    v40 = 2112;
    v41 = v11;
    v42 = 2112;
    v43 = v12;
    _os_log_impl(&dword_21AAEC000, v14, OS_LOG_TYPE_DEFAULT, "%s resultLocation=%@, currentCity=%@, geocodeError=%@", buf, 0x2Au);
  }

  +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    objc_msgSend(v15, "saveToDiskWithLocalWeatherCity:", v11);
    WALogForCategory(4);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[TWCLocationUpdater _completeReverseGeocodeForLocation:currentCity:geocodeError:completionHandler:].cold.1((uint64_t)v12, (uint64_t)v11, v17);

    objc_msgSend(v12, "domain");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", *MEMORY[0x24BDBFB10]))
    {
      v19 = objc_msgSend(v12, "code");

      if (v19 == 10)
      {
        v20 = v12;
LABEL_15:
        v25 = v20;
        objc_msgSend(v11, "cityDidFinishUpdatingWithError:", v20);
        if (v13)
          v13[2](v13, v11, v25);

        goto LABEL_24;
      }
    }
    else
    {

    }
    WAErrorWithCode(2, v12, v11, 0);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v21 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSince1970");
  objc_msgSend(v21, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "writeDefaultValue:forKey:", v23, CFSTR("LastLocationParseTime"));

  WALogForCategory(4);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v11;
    v38 = 2112;
    v39 = v10;
    _os_log_impl(&dword_21AAEC000, v24, OS_LOG_TYPE_DEFAULT, "Updating City '%@' with geocode location '%@'", buf, 0x16u);
  }

  objc_msgSend(v11, "setWfLocation:", v10);
  objc_msgSend(v11, "clearForecasts");
  objc_msgSend(v10, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v11, "setName:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("LOCAL_WEATHER"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v27);

  }
  +[WeatherPreferences sharedPreferences](WeatherPreferences, "sharedPreferences");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "saveToDiskWithLocalWeatherCity:", v11);

  WALogForCategory(4);
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = (const char *)v10;
    v38 = 2112;
    v39 = v11;
    _os_log_impl(&dword_21AAEC000, v29, OS_LOG_TYPE_DEFAULT, "Received reverse geocode for %@, currentCity=%@", buf, 0x16u);
  }

  WALogForCategory(4);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = (const char *)v11;
    _os_log_impl(&dword_21AAEC000, v30, OS_LOG_TYPE_DEFAULT, "Updating weather for currentCity: %@", buf, 0xCu);
  }

  v35 = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v35, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke;
  v32[3] = &unk_24DD9E798;
  v32[4] = self;
  v33 = v11;
  v34 = v13;
  -[TWCLocationUpdater updateWeatherForCities:withCompletionHandler:](self, "updateWeatherForCities:withCompletionHandler:", v31, v32);

LABEL_24:
}

void __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "parsedResultCity:", *(_QWORD *)(a1 + 40));
  WALogForCategory(0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke_cold_1((_QWORD *)(a1 + 40), (uint64_t)v4, v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *v5;
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_21AAEC000, v7, OS_LOG_TYPE_DEFAULT, "Finished forecast retrieval for: %@", (uint8_t *)&v10, 0xCu);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, *v5, v4);

}

- (void)updateWeatherForCities:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  TWCLocationUpdater *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  WALogForCategory(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v11 = "-[TWCLocationUpdater updateWeatherForCities:withCompletionHandler:]";
    v12 = 2112;
    v13 = self;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_21AAEC000, v8, OS_LOG_TYPE_DEFAULT, "%s self=%@, updating weather for cities: %@ in locationUpdater", buf, 0x20u);
  }

  -[TWCCityUpdater cancel](self, "cancel");
  v9.receiver = self;
  v9.super_class = (Class)TWCLocationUpdater;
  -[TWCCityUpdater updateWeatherForCities:withCompletionHandler:](&v9, sel_updateWeatherForCities_withCompletionHandler_, v6, v7);

}

- (City)currentCity
{
  return self->_currentCity;
}

- (void)setCurrentCity:(id)a3
{
  objc_storeStrong((id *)&self->_currentCity, a3);
}

- (CLGeocoder)reverseGeocoder
{
  return self->_reverseGeocoder;
}

- (void)setReverseGeocoder:(id)a3
{
  objc_storeStrong((id *)&self->_reverseGeocoder, a3);
}

- (ct_green_tea_logger_s)greenTeaLogger
{
  return self->_greenTeaLogger;
}

- (void)setGreenTeaLogger:(ct_green_tea_logger_s *)a3
{
  self->_greenTeaLogger = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reverseGeocoder, 0);
  objc_storeStrong((id *)&self->_currentCity, 0);
}

- (void)parsedResultCity:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21AAEC000, log, OS_LOG_TYPE_DEBUG, "Internal Weather update debug mode enabled.", v1, 2u);
}

- (void)_completeReverseGeocodeForLocation:(NSObject *)a3 currentCity:geocodeError:completionHandler:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_21AAEC000, a2, a3, "ReverseGeocode completed with error: %@, save the failed city: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

void __100__TWCLocationUpdater__completeReverseGeocodeForLocation_currentCity_geocodeError_completionHandler___block_invoke_cold_1(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_3(&dword_21AAEC000, a2, a3, "Forecast retrieval failed retrieval for %@ with error %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x24BDAC8D0]);
}

@end
