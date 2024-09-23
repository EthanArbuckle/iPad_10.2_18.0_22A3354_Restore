@implementation WAForecastOperation

- (WAForecastOperation)initWithCity:(id)a3 onConnection:(id)a4
{
  return -[WAForecastOperation initWithCity:withUnits:onConnection:](self, "initWithCity:withUnits:onConnection:", a3, 0, a4);
}

- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 onConnection:(id)a5
{
  return -[WAForecastOperation initWithCity:withUnits:canGeocode:onConnection:](self, "initWithCity:withUnits:canGeocode:onConnection:", a3, *(_QWORD *)&a4, 1, a5);
}

- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 canGeocode:(BOOL)a5 onConnection:(id)a6
{
  return -[WAForecastOperation initWithCity:withUnits:requestOptions:canGeocode:onConnection:](self, "initWithCity:withUnits:requestOptions:canGeocode:onConnection:", a3, *(_QWORD *)&a4, 0, a5, a6);
}

- (WAForecastOperation)initWithCity:(id)a3 withUnits:(int)a4 requestOptions:(id)a5 canGeocode:(BOOL)a6 onConnection:(id)a7
{
  id v13;
  id v14;
  id v15;
  WAForecastOperation *v16;
  uint64_t v17;
  WFLocation *location;
  WAForecastOperation *v19;

  v13 = a3;
  v14 = a5;
  v15 = a7;
  if (v13)
  {
    v16 = -[WAForecastOperation init](self, "init");
    if (v16)
    {
      objc_msgSend(v13, "wfLocation");
      v17 = objc_claimAutoreleasedReturnValue();
      location = v16->_location;
      v16->_location = (WFLocation *)v17;

      objc_storeStrong((id *)&v16->_city, a3);
      v16->_units = a4;
      objc_storeStrong((id *)&v16->_requestOptions, a5);
      objc_storeStrong((id *)&v16->_connection, a7);
      v16->_isLocationInGeocodeSample = a6;
    }
    self = v16;
    v19 = self;
  }
  else
  {
    NSLog(CFSTR("No City; Bailing"));
    v19 = 0;
  }

  return v19;
}

- (WAForecastOperation)initWithLocation:(id)a3 onConnection:(id)a4
{
  id v6;
  id v7;
  WAForecastOperation *v8;
  WAForecastOperation *v9;
  WAForecastOperation *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)WAForecastOperation;
    v8 = -[WAForecastOperation init](&v12, sel_init);
    v9 = v8;
    if (v8)
    {
      -[WAForecastOperation setLocation:](v8, "setLocation:", v6);
      objc_storeStrong((id *)&v9->_connection, a4);
      v9->_isLocationInGeocodeSample = 1;
    }
    self = v9;
    v10 = self;
  }
  else
  {
    NSLog(CFSTR("No Location; Bailing"));
    v10 = 0;
  }

  return v10;
}

- (BOOL)_needsGeolocation
{
  void *v3;
  void *v4;
  int v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;

  -[WAForecastOperation city](self, "city");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[WeatherInternalPreferences sharedInternalPreferences](WeatherInternalPreferences, "sharedInternalPreferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("EnableTimeZoneNeverFresh"));

  v6 = objc_msgSend(v3, "timeZoneIsFresh");
  if (v3 && v6 ^ 1 | v5 && -[WAForecastOperation isLocationInGeocodeSample](self, "isLocationInGeocodeSample"))
  {
    WALogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WAForecastOperation _needsGeolocation].cold.1((uint64_t)v3, v7, v8);
  }
  else
  {
    -[WAForecastOperation location](self, "location");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[WAForecastOperation location](self, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "needsGeocoding");

      if (!v12)
      {
        v13 = 0;
        goto LABEL_12;
      }
    }
    WALogForCategory(4);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WAForecastOperation _needsGeolocation].cold.2(self, v7);
  }

  v13 = 1;
LABEL_12:

  return v13;
}

- (void)main
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Location data missing for location %@ / city %@", buf, 0x16u);

}

void __27__WAForecastOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a2;
  v6 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
  if (v8 && !v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "setLocation:", v8);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

void __27__WAForecastOperation_main__block_invoke_22(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[5];
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
    goto LABEL_2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(v7, "currentObservations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "city");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x24BDD0FC8];
  v53[0] = CFSTR("A successful todayRequestHandler callback should always have valid location and conditions set");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, &v52, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WAErrorWithCode(0, 0, v12, v13);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
LABEL_2:
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "_failWithError:", v9);
  }
  else
  {
LABEL_6:
    objc_msgSend(v7, "currentObservations");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v15, "setCurrentWeatherConditions:", v14);

    objc_msgSend(v7, "dailyForecastedConditions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v17, "setDailyForecastConditions:", v16);

    objc_msgSend(v7, "hourlyForecastedConditions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v19, "setHourlyForecastConditions:", v18);

    objc_msgSend(v7, "airQualityObservations");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v21, "setAirQualityConditions:", v20);

    objc_msgSend(v7, "severeWeatherEvents");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v23, "setSevereWeatherEvents:", v22);

    objc_msgSend(v7, "changeForecasts");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v25, "setChangeForecasts:", v24);

    objc_msgSend(v7, "nextHourPrecipitation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v27, "setNextHourPrecipitation:", v26);

    v28 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v7, "currentObservations");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[WACurrentForecast currentForecastForLocation:conditions:](WACurrentForecast, "currentForecastForLocation:conditions:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v31, "setCurrentConditions:", v30);

    objc_msgSend(v7, "dailyForecastedConditions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __27__WAForecastOperation_main__block_invoke_2;
    v51[3] = &unk_24DD9D820;
    v51[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v32, "na_map:", v51);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v33 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v33, "setDailyForecasts:", v9);

    v34 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v34, "currentWeatherConditions");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "valueForComponent:", *MEMORY[0x24BEC22C0]);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v37, "currentWeatherConditions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "valueForComponent:", *MEMORY[0x24BEC22C8]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "hourlyForecastedConditions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __27__WAForecastOperation_main__block_invoke_3;
    v47[3] = &unk_24DD9D848;
    v41 = *(_QWORD *)(a1 + 48);
    v49 = v39;
    v50 = v41;
    v48 = v36;
    v42 = v39;
    WeakRetained = v36;
    objc_msgSend(v40, "na_map:", v47);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(v44, "setHourlyForecasts:", v43);

    v45 = objc_loadWeakRetained((id *)(a1 + 56));
    LODWORD(v40) = objc_msgSend(v45, "shouldAttachRawAPIData");

    if ((_DWORD)v40)
    {
      v46 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v46, "setRawAPIData:", v8);

    }
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

id __27__WAForecastOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[WADayForecast dayForecastForLocation:conditions:](WADayForecast, "dayForecastForLocation:conditions:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

id __27__WAForecastOperation_main__block_invoke_3(_QWORD *a1, uint64_t a2)
{
  return +[WAHourlyForecast hourlyForecastForLocation:conditions:sunriseDateComponents:sunsetDateComponents:](WAHourlyForecast, "hourlyForecastForLocation:conditions:sunriseDateComponents:sunsetDateComponents:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a2, a1[4], a1[5]);
}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WAForecastOperation;
  -[WAForecastOperation cancel](&v6, sel_cancel);
  -[WAForecastOperation aggregateRequest](self, "aggregateRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[WAForecastOperation city](self, "city");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WAErrorWithCode(3072, 0, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WAForecastOperation _failWithError:](self, "_failWithError:", v5);

}

- (BOOL)shouldRequestChangeInConditions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.weather.widget")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "component:fromDate:", 32, v4);

    if (v6 > 18)
      v7 = 1;
  }

  return v7;
}

- (void)_failWithError:(id)a3
{
  WAForecastOperation *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[WAForecastOperation error](v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[WAForecastOperation setError:](v4, "setError:", v6);
  objc_sync_exit(v4);

}

- (void)_determineSunriseAndSunset
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
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
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL8 v33;
  uint64_t v34;
  WAForecastOperation *v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x24BEC2270];
  objc_msgSend(v3, "valueForComponent:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "date");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = self;
  -[WAForecastOperation dailyForecastConditions](self, "dailyForecastConditions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v39;
    v10 = *MEMORY[0x24BEC22C0];
    v11 = *MEMORY[0x24BEC22C8];
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v39 != v9)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v12);
      objc_msgSend(v13, "valueForComponent:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8 && v15)
      {
        objc_msgSend(v15, "laterDate:", v37);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16 == v15)
          v8 = v15;
        else
          v8 = 0;
      }
      objc_msgSend(v13, "valueForComponent:", v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7 && v18)
      {
        objc_msgSend(v18, "laterDate:", v37);
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19 == v18)
          v7 = v18;
        else
          v7 = 0;
      }

      if (v7)
      {
        if (v8)
          break;
      }
      if (v6 == ++v12)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }

  -[WAForecastOperation setSunset:](v35, "setSunset:", v7);
  -[WAForecastOperation setSunrise:](v35, "setSunrise:", v8);
  -[WAForecastOperation currentWeatherConditions](v35, "currentWeatherConditions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForComponent:", v34);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "timeIntervalSince1970");
  v24 = v23;

  -[WAForecastOperation sunset](v35, "sunset");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "timeIntervalSince1970");
  v27 = v26;

  -[WAForecastOperation sunrise](v35, "sunrise");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "timeIntervalSince1970");
  v30 = v29;

  v31 = v24 <= v27;
  if (v24 >= v30)
    v31 = 1;
  v32 = v24 > v30;
  if (v24 >= v27)
    v32 = 0;
  if (v27 > v30)
    v33 = v32;
  else
    v33 = v31;
  -[WAForecastOperation setIsDay:](v35, "setIsDay:", v33);

}

- (void)_mapReferralLinks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = (id)objc_opt_new();
  -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForComponent:", *MEMORY[0x24BEC2288]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForComponent:", *MEMORY[0x24BEC2298]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForComponent:", *MEMORY[0x24BEC22E8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v4, CFSTR("ios"));
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("web"));
  v9 = v10;
  if (v6)
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, CFSTR("mobile"));
    v9 = v10;
  }
  -[WAForecastOperation setLinks:](self, "setLinks:", v9);

}

- (WAForecastModel)forecastModel
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

  -[WAForecastOperation error](self, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v4 = (void *)objc_opt_new();
    -[WAForecastOperation city](self, "city");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCity:", v5);

    -[WAForecastOperation location](self, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLocation:", v6);

    -[WAForecastOperation currentConditions](self, "currentConditions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setCurrentConditions:", v7);

    -[WAForecastOperation hourlyForecasts](self, "hourlyForecasts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHourlyForecasts:", v8);

    -[WAForecastOperation dailyForecasts](self, "dailyForecasts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDailyForecasts:", v9);

    -[WAForecastOperation airQualityConditions](self, "airQualityConditions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAirQualityConditions:", v10);

    -[WAForecastOperation sunrise](self, "sunrise");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSunrise:", v11);

    -[WAForecastOperation sunset](self, "sunset");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSunset:", v12);

    -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForComponent:", *MEMORY[0x24BEC2288]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDeepLink:", v14);

    -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "valueForComponent:", *MEMORY[0x24BEC2298]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLink:", v16);

    -[WAForecastOperation currentWeatherConditions](self, "currentWeatherConditions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnderlyingCurrentConditions:", v17);

    -[WAForecastOperation hourlyForecastConditions](self, "hourlyForecastConditions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnderlyingHourlyConditions:", v18);

    -[WAForecastOperation dailyForecastConditions](self, "dailyForecastConditions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUnderlyingDailyConditions:", v19);

    -[WAForecastOperation changeForecasts](self, "changeForecasts");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setChangeForecasts:", v20);

    -[WAForecastOperation severeWeatherEvents](self, "severeWeatherEvents");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSevereWeatherEvents:", v21);

    -[WAForecastOperation nextHourPrecipitation](self, "nextHourPrecipitation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNextHourPrecipitation:", v22);

  }
  return (WAForecastModel *)v4;
}

- (City)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
  objc_storeStrong((id *)&self->_city, a3);
}

- (WFLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (WACurrentForecast)currentConditions
{
  return self->_currentConditions;
}

- (void)setCurrentConditions:(id)a3
{
  objc_storeStrong((id *)&self->_currentConditions, a3);
}

- (WFAirQualityConditions)airQualityConditions
{
  return self->_airQualityConditions;
}

- (void)setAirQualityConditions:(id)a3
{
  objc_storeStrong((id *)&self->_airQualityConditions, a3);
}

- (NSArray)hourlyForecasts
{
  return self->_hourlyForecasts;
}

- (void)setHourlyForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyForecasts, a3);
}

- (NSArray)dailyForecasts
{
  return self->_dailyForecasts;
}

- (void)setDailyForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_dailyForecasts, a3);
}

- (NSDate)sunrise
{
  return self->_sunrise;
}

- (void)setSunrise:(id)a3
{
  objc_storeStrong((id *)&self->_sunrise, a3);
}

- (NSDate)sunset
{
  return self->_sunset;
}

- (void)setSunset:(id)a3
{
  objc_storeStrong((id *)&self->_sunset, a3);
}

- (NSDictionary)links
{
  return self->_links;
}

- (void)setLinks:(id)a3
{
  objc_storeStrong((id *)&self->_links, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (WFWeatherConditions)currentWeatherConditions
{
  return self->_currentWeatherConditions;
}

- (void)setCurrentWeatherConditions:(id)a3
{
  objc_storeStrong((id *)&self->_currentWeatherConditions, a3);
}

- (NSArray)dailyForecastConditions
{
  return self->_dailyForecastConditions;
}

- (void)setDailyForecastConditions:(id)a3
{
  objc_storeStrong((id *)&self->_dailyForecastConditions, a3);
}

- (NSArray)hourlyForecastConditions
{
  return self->_hourlyForecastConditions;
}

- (void)setHourlyForecastConditions:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyForecastConditions, a3);
}

- (NSArray)severeWeatherEvents
{
  return self->_severeWeatherEvents;
}

- (void)setSevereWeatherEvents:(id)a3
{
  objc_storeStrong((id *)&self->_severeWeatherEvents, a3);
}

- (NSArray)changeForecasts
{
  return self->_changeForecasts;
}

- (void)setChangeForecasts:(id)a3
{
  objc_storeStrong((id *)&self->_changeForecasts, a3);
}

- (WFNextHourPrecipitation)nextHourPrecipitation
{
  return self->_nextHourPrecipitation;
}

- (void)setNextHourPrecipitation:(id)a3
{
  objc_storeStrong((id *)&self->_nextHourPrecipitation, a3);
}

- (WFAggregateCommonRequest)aggregateRequest
{
  return self->_aggregateRequest;
}

- (void)setAggregateRequest:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateRequest, a3);
}

- (BOOL)isDay
{
  return self->_isDay;
}

- (void)setIsDay:(BOOL)a3
{
  self->_isDay = a3;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 400, 1);
}

- (void)setLocale:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (NSString)trackingParameter
{
  return (NSString *)objc_getProperty(self, a2, 408, 1);
}

- (void)setTrackingParameter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 408);
}

- (BOOL)shouldAttachRawAPIData
{
  return self->_shouldAttachRawAPIData;
}

- (void)setShouldAttachRawAPIData:(BOOL)a3
{
  self->_shouldAttachRawAPIData = a3;
}

- (NSData)rawAPIData
{
  return self->_rawAPIData;
}

- (void)setRawAPIData:(id)a3
{
  objc_storeStrong((id *)&self->_rawAPIData, a3);
}

- (int)units
{
  return self->_units;
}

- (void)setUnits:(int)a3
{
  self->_units = a3;
}

- (WFRequestOptions)requestOptions
{
  return self->_requestOptions;
}

- (void)setRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_requestOptions, a3);
}

- (WFServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BOOL)canGeocode
{
  return self->_canGeocode;
}

- (void)setCanGeocode:(BOOL)a3
{
  self->_canGeocode = a3;
}

- (BOOL)isLocationInGeocodeSample
{
  return self->_isLocationInGeocodeSample;
}

- (void)setIsLocationInGeocodeSample:(BOOL)a3
{
  self->_isLocationInGeocodeSample = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_rawAPIData, 0);
  objc_storeStrong((id *)&self->_trackingParameter, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_aggregateRequest, 0);
  objc_storeStrong((id *)&self->_nextHourPrecipitation, 0);
  objc_storeStrong((id *)&self->_changeForecasts, 0);
  objc_storeStrong((id *)&self->_severeWeatherEvents, 0);
  objc_storeStrong((id *)&self->_hourlyForecastConditions, 0);
  objc_storeStrong((id *)&self->_dailyForecastConditions, 0);
  objc_storeStrong((id *)&self->_currentWeatherConditions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_links, 0);
  objc_storeStrong((id *)&self->_sunset, 0);
  objc_storeStrong((id *)&self->_sunrise, 0);
  objc_storeStrong((id *)&self->_dailyForecasts, 0);
  objc_storeStrong((id *)&self->_hourlyForecasts, 0);
  objc_storeStrong((id *)&self->_airQualityConditions, 0);
  objc_storeStrong((id *)&self->_currentConditions, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_city, 0);
}

- (void)_needsGeolocation
{
  uint64_t v3;
  void *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CFSTR("Unpopulated properties within WFLocation");
  if (!v4)
    v5 = CFSTR("No WFLocation");
  v6 = 138412290;
  v7 = v5;
  OUTLINED_FUNCTION_0_2(&dword_21AAEC000, a2, v3, "Executing Geocode for reason: %@", (uint8_t *)&v6);

}

@end
