@implementation WFWeatherDataServiceRequestFormatterV1

+ (id)hostURLForEnvironment:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  int v10;

  WeatherFoundationInternalUserDefaults();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringForKey:", CFSTR("WDSEndpointOverride"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && (objc_msgSend(v4, "isEqualToString:", CFSTR("default")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WeatherFoundationInternalUserDefaults();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringForKey:", CFSTR("WDSEnvironment"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isEqualToString:", CFSTR("wdsv1_prod_origin")))
    {
      v7 = (void *)MEMORY[0x24BDBCF48];
      v8 = CFSTR("https://weather-data-origin.apple.com");
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("wdsv1_dev")))
    {
      v7 = (void *)MEMORY[0x24BDBCF48];
      v8 = CFSTR("https://devel.weather-data.newsapps.apple.com");
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("wdsv1_test")))
    {
      v7 = (void *)MEMORY[0x24BDBCF48];
      v8 = CFSTR("https://test.weather-data.newsapps.apple.com");
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("wdsv1_qa")))
    {
      v7 = (void *)MEMORY[0x24BDBCF48];
      v8 = CFSTR("https://qa.weather-data.newsapps.apple.com");
    }
    else
    {
      v10 = objc_msgSend(v6, "isEqualToString:", CFSTR("wdsv1_staging"));
      v7 = (void *)MEMORY[0x24BDBCF48];
      if (v10)
        v8 = CFSTR("https://staging-weather-data.apple.com");
      else
        v8 = CFSTR("https://weather-data.apple.com");
    }
    objc_msgSend(v7, "URLWithString:", v8);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

+ (id)hostURLForService
{
  return (id)objc_msgSend((id)objc_opt_class(), "hostURLForEnvironment:", 0);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)objc_msgSend(a1, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, a4, 0, a5, a6, 0, 0);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  id v66;
  void *v67;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  _QWORD v74[4];
  id v75;
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  unint64_t v79;
  __int16 v80;
  void *v81;
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v14;
  v19 = a9;
  objc_msgSend(v14, "geoLocation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v71 = v19;
    +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "copy");

    objc_msgSend(v18, "timeZone");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = a1;
    if (v23)
    {
      -[NSObject setTimeZone:](v22, "setTimeZone:", v23);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTimeZone:](v22, "setTimeZone:", v27);

    }
    v64 = v22;
    v65 = v16;
    -[NSObject components:fromDate:](v22, "components:fromDate:", 28, v16);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v28, "year"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringValue");
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v28, "day"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringValue");
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v28, "month"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringValue");
    v72 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 12);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v34 = a3;
    v63 = v28;
    if (WFForecastTypeIsRequestedInTypes(1, a3))
    {
      if (v17 && !objc_msgSend(v18, "shouldQueryForAirQualityData"))
      {
        if ((WFForecastTypeIsSingleType(a3) & 1) != 0)
        {
          v24 = v17;
          v26 = 0;
          v16 = v65;
          v19 = v71;
LABEL_54:

          v25 = v64;
          goto LABEL_55;
        }
        WFLogForCategory(2uLL);
        v59 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v77 = v18;
          _os_log_impl(&dword_21189A000, v59, OS_LOG_TYPE_DEFAULT, "AQI is not enabled for the location. AQI will not be requested. location=%{public}@", buf, 0xCu);
        }

        v34 = a3;
      }
      else
      {
        v34 = a3 & 0xFFFFFFFFFFFFFFFELL;
        objc_msgSend(v32, "addObject:", CFSTR("air_quality"));
      }
    }
    if (WFForecastTypeIsRequestedInTypes(2, v34))
    {
      v34 &= ~2uLL;
      objc_msgSend(v32, "addObject:", CFSTR("current_observations"));
    }
    if (WFForecastTypeIsRequestedInTypes(4, v34))
    {
      v34 &= ~4uLL;
      objc_msgSend(v32, "addObject:", CFSTR("hourly_forecast"));
    }
    if (WFForecastTypeIsRequestedInTypes(8, v34))
    {
      v34 &= ~8uLL;
      objc_msgSend(v32, "addObject:", CFSTR("daily_forecast"));
    }
    if (WFForecastTypeIsRequestedInTypes(256, v34))
    {
      v34 &= ~0x100uLL;
      objc_msgSend(v32, "addObject:", CFSTR("now_links"));
    }
    if (WFForecastTypeIsRequestedInTypes(16, v34))
    {
      v34 &= ~0x10uLL;
      objc_msgSend(v32, "addObject:", CFSTR("primaryPollutant"));
    }
    if (WFForecastTypeIsRequestedInTypes(64, v34))
    {
      v34 &= ~0x40uLL;
      objc_msgSend(v32, "addObject:", CFSTR("daily_history"));
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("dayOfMonth"), v73);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v35);

      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("month"), v72);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v36);

      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("year"), v70);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v37);

    }
    if (WFForecastTypeIsRequestedInTypes(128, v34))
    {
      v34 &= ~0x80uLL;
      objc_msgSend(v32, "addObject:", CFSTR("daily_almanac"));
      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("dayOfMonth"), v73);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v38);

      objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("month"), v72);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addObject:", v39);

    }
    if (WFForecastTypeIsRequestedInTypes(512, v34))
    {
      v34 &= ~0x200uLL;
      objc_msgSend(v32, "addObject:", CFSTR("weather_change"));
    }
    if (WFForecastTypeIsRequestedInTypes(1024, v34))
    {
      v34 &= ~0x400uLL;
      objc_msgSend(v32, "addObject:", CFSTR("severe_weather"));
    }
    if (WFForecastTypeIsRequestedInTypes(2048, v34))
    {
      v34 &= ~0x800uLL;
      objc_msgSend(v32, "addObject:", CFSTR("next_hour_forecast"));
    }
    if (v34)
    {
      WFLogForCategory(0);
      v40 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        +[WFWeatherDataServiceRequestFormatterV1 forecastRequest:forLocation:withUnits:locale:date:rules:options:].cold.3();

    }
    if (!objc_msgSend(v32, "count"))
    {
      v24 = v17;
      WFLogForCategory(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        v60 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        v77 = v60;
        v78 = 2048;
        v79 = a3;
        v80 = 2112;
        v81 = v18;
        v61 = v60;
        _os_log_error_impl(&dword_21189A000, v41, OS_LOG_TYPE_ERROR, "%{public}@ is unable to build %lu forecast request for %@.", buf, 0x20u);

      }
      v26 = 0;
      goto LABEL_53;
    }
    objc_msgSend(v66, "hostURLForService");
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "componentsJoinedByString:", CFSTR(","));
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v41, 0);
    v62 = (void *)v42;
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("include"), v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v44);

    if ((a5 - 2) < 2)
    {
      v46 = CFSTR("m");
    }
    else if (a5 == 1)
    {
      v46 = CFSTR("e");
    }
    else
    {
      if (!a5)
      {
        v45 = (void *)MEMORY[0x24BDD1838];
        v46 = CFSTR("m");
LABEL_50:
        objc_msgSend(v45, "queryItemWithName:value:", CFSTR("units"), v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "addObject:", v47);

        objc_msgSend(v33, "allObjects");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setQueryItems:", v48);

        v69 = v15;
        objc_msgSend(v66, "languagePathForLocale:", v15);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v18;
        v24 = v17;
        objc_msgSend((id)objc_opt_class(), "geocodePathForLocation:rules:", v18, v17);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/v1/weather/%@/%@"), v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setPath:", v51);

        v52 = (void *)MEMORY[0x24BDD16B0];
        objc_msgSend(v43, "URL");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "requestWithURL:cachePolicy:timeoutInterval:", v53, 4, 30.0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v55 = (void *)objc_opt_new();
        +[WFWeatherDataServiceRequestSigner signRequest:withDate:](WFWeatherDataServiceRequestSigner, "signRequest:withDate:", v54, v55);

        objc_msgSend(v54, "setHTTPMethod:", CFSTR("GET"));
        objc_msgSend(v54, "setHTTPShouldHandleCookies:", 0);
        objc_msgSend(v71, "httpHeaderDictionary");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v74[0] = MEMORY[0x24BDAC760];
        v74[1] = 3221225472;
        v74[2] = __106__WFWeatherDataServiceRequestFormatterV1_forecastRequest_forLocation_withUnits_locale_date_rules_options___block_invoke;
        v74[3] = &unk_24CCA1A60;
        v26 = v54;
        v75 = v26;
        objc_msgSend(v56, "enumerateKeysAndObjectsUsingBlock:", v74);
        WFLogForCategory(2uLL);
        v57 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
          +[WFWeatherDataServiceRequestFormatterV1 forecastRequest:forLocation:withUnits:locale:date:rules:options:].cold.2(v26, v57);

        v18 = v67;
        v15 = v69;
LABEL_53:
        v19 = v71;

        v16 = v65;
        goto LABEL_54;
      }
      v46 = 0;
    }
    v45 = (void *)MEMORY[0x24BDD1838];
    goto LABEL_50;
  }
  v24 = v17;
  WFLogForCategory(2uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    +[WFWeatherDataServiceRequestFormatterV1 forecastRequest:forLocation:withUnits:locale:date:rules:options:].cold.1();
  v26 = 0;
LABEL_55:

  return v26;
}

uint64_t __106__WFWeatherDataServiceRequestFormatterV1_forecastRequest_forLocation_withUnits_locale_date_rules_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "addValue:forHTTPHeaderField:", a3, a2);
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
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
  NSObject *v19;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[NSObject countryCode](v8, "countryCode");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "hostURLForService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v12, 0);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@/%@"), CFSTR("/v1/airQualityScale"), v11, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPath:", v14);

    v15 = (void *)MEMORY[0x24BDD16B0];
    objc_msgSend(v13, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "requestWithURL:cachePolicy:timeoutInterval:", v16, 4, 30.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)objc_opt_new();
    +[WFWeatherDataServiceRequestSigner signRequest:withDate:](WFWeatherDataServiceRequestSigner, "signRequest:withDate:", v17, v18);

    objc_msgSend(v17, "setHTTPMethod:", CFSTR("GET"));
    objc_msgSend(v17, "setHTTPShouldHandleCookies:", 0);
    WFLogForCategory(2uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      +[WFWeatherDataServiceRequestFormatterV1 aqiRequestForScaleNamed:language:].cold.2(v17, v19);

  }
  else
  {
    WFLogForCategory(2uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[WFWeatherDataServiceRequestFormatterV1 aqiRequestForScaleNamed:language:].cold.1(v8);
    v17 = 0;
  }

  return v17;
}

+ (id)geocodePathForLocation:(id)a3 rules:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "locationNumDecimalsOfPrecision");
    if (v8 < 0)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v5, "geoLocation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "coordinate");
      v12 = v11;
      objc_msgSend(v5, "geoLocation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "coordinate");
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%f/%f"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      WFLogForCategory(2uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        +[WFWeatherDataServiceRequestFormatterV1 geocodePathForLocation:rules:].cold.2();
      goto LABEL_9;
    }
  }
  else
  {
    v8 = 3;
  }
  v17 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "geoLocation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "coordinate");
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%.*f"), v8, v19);
  v16 = objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "geoLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "coordinate");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("%.*f"), v8, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v16, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(2uLL);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    +[WFWeatherDataServiceRequestFormatterV1 geocodePathForLocation:rules:].cold.1((uint64_t)v15, v8, v24);

LABEL_9:
  return v15;
}

+ (id)languagePathForLocale:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "countryCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@_%@"), v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)forecastRequest:forLocation:withUnits:locale:date:rules:options:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_21189A000, v0, OS_LOG_TYPE_ERROR, "Cannot format a forecast request without a geolocation: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

+ (void)forecastRequest:(void *)a1 forLocation:(NSObject *)a2 withUnits:locale:date:rules:options:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "formatted WDS forecast request: %@", v5);

  OUTLINED_FUNCTION_3_2();
}

+ (void)forecastRequest:forLocation:withUnits:locale:date:rules:options:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2048;
  v4 = v0;
  _os_log_error_impl(&dword_21189A000, v1, OS_LOG_TYPE_ERROR, "Unhandled forecast request type. initialRequest=%lu, unhandled=%lu", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)aqiRequestForScaleNamed:(os_log_t)log language:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21189A000, log, OS_LOG_TYPE_ERROR, "Cannot format an AQI scale request with a nil AQI scale name", v1, 2u);
}

+ (void)aqiRequestForScaleNamed:(void *)a1 language:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, a2, v4, "formatted WDS AQI scale request: %@", v5);

  OUTLINED_FUNCTION_3_2();
}

+ (void)geocodePathForLocation:(os_log_t)log rules:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218242;
  v4 = a2;
  v5 = 2112;
  v6 = a1;
  _os_log_debug_impl(&dword_21189A000, log, OS_LOG_TYPE_DEBUG, "Using %ld digits of precision: %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)geocodePathForLocation:rules:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21189A000, v0, v1, "Using the maximum digits of precision: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
