@implementation WFWeatherChannelRequestFormatterV3

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)objc_msgSend(a1, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, a4, 0, a5, a6, 0, 0);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  id v49;
  void *v50;
  NSObject *v51;
  void *v52;
  __CFString *v53;
  void *v54;
  void *v55;
  void *v56;
  id v58;
  id v60;
  id v61;
  uint8_t buf[4];
  id v63;
  __int16 v64;
  unint64_t v65;
  __int16 v66;
  id v67;
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v14 = a6;
  v61 = a7;
  v15 = a8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0x24BDD1000uLL;
  v19 = a3;
  if (WFForecastTypeIsRequestedInTypes(1, a3))
  {
    if (+[WFRequestFormattingRules aqiEnabledByRules:forLocation:](WFRequestFormattingRules, "aqiEnabledByRules:forLocation:", v15, v13))
    {
      v19 = a3 & 0xFFFFFFFFFFFFFFFELL;
      objc_msgSend(v16, "addObject:", CFSTR("v3-wx-globalAirQuality"));
      objc_msgSend(v14, "countryCode");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      AqiScaleForCountryCode(v20);
      v21 = a3;
      v22 = v13;
      v23 = v14;
      v24 = v15;
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = (void *)MEMORY[0x24BDD1838];
      objc_msgSend(v25, "name");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "queryItemWithName:value:", CFSTR("scale"), v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v28);

      v15 = v24;
      v14 = v23;
      v13 = v22;
      a3 = v21;
      v18 = 0x24BDD1000;
    }
    else
    {
      v19 = a3;
      if ((WFForecastTypeIsSingleType(a3) & 1) != 0)
      {
        v29 = 0;
        v30 = v61;
        goto LABEL_37;
      }
    }
  }
  if (WFForecastTypeIsRequestedInTypes(2, v19))
  {
    v19 &= ~2uLL;
    objc_msgSend(v16, "addObject:", CFSTR("v3-wx-observations-current"));
    objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v31);

  }
  if (WFForecastTypeIsRequestedInTypes(4, v19))
  {
    v19 &= ~4uLL;
    objc_msgSend(v16, "addObject:", CFSTR("v3-wx-forecast-hourly-1day"));
    objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v32);

  }
  if (WFForecastTypeIsRequestedInTypes(8, v19))
  {
    v19 &= ~8uLL;
    objc_msgSend(v16, "addObject:", CFSTR("v3-wx-forecast-daily-10day"));
    objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v33);

  }
  if (WFForecastTypeIsRequestedInTypes(256, v19))
  {
    v19 &= ~0x100uLL;
    objc_msgSend(v16, "addObject:", CFSTR("v3-links"));
    objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("par"), CFSTR("apple_TWC"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v34);

  }
  if (WFForecastTypeIsRequestedInTypes(16, v19))
  {
    v19 &= ~0x10uLL;
    objc_msgSend(v16, "addObject:", CFSTR("v2idxPollenDaypart10"));
  }
  v60 = v15;
  if (WFForecastTypeIsRequestedInTypes(32, v19))
  {
    v19 &= ~0x20uLL;
    objc_msgSend(v16, "addObject:", CFSTR("v3-wx-conditions-historical-hourly-1day"));
    objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v35);

  }
  objc_msgSend(v17, "allObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v36, "mutableCopy");

  v38 = *(void **)(v18 + 2104);
  objc_msgSend(v13, "wf_weatherChannelGeocodeValue");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "queryItemWithName:value:", CFSTR("geocode"), v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v40);

  objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("format"), CFSTR("json"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v41);

  v42 = *(void **)(v18 + 2104);
  objc_msgSend(v14, "languageCode");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v43;
  if (v43)
    v45 = (const __CFString *)v43;
  else
    v45 = CFSTR("en");
  objc_msgSend(v42, "queryItemWithName:value:", CFSTR("language"), v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v46);

  objc_msgSend(*(id *)(v18 + 2104), "queryItemWithName:value:", CFSTR("apiKey"), CFSTR("daab481aeef8450eab481aeef8950e4d"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v47);

  if (v19)
  {
    WFLogForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      +[WFWeatherChannelRequestFormatterV3 forecastRequest:forLocation:withUnits:locale:date:rules:options:].cold.1(a3, v48);

  }
  if (objc_msgSend(v16, "count"))
  {
    v49 = objc_alloc(MEMORY[0x24BDD1808]);
    objc_msgSend(a1, "hostURLForService");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "initWithURL:resolvingAgainstBaseURL:", v50, 0);

    if (objc_msgSend(v16, "count") == 1)
    {
      objc_msgSend(v16, "firstObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(CFSTR("v2idxPollenDaypart10"), "isEqualToString:", v52))
      {
        v53 = CFSTR("v2/indices/pollen/daypart/10day");
      }
      else
      {
        objc_msgSend(v52, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("/"));
        v53 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v55 = v53;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v55);
    }
    else
    {
      v54 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR(";"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "stringWithFormat:", CFSTR("/v3/aggcommon/%@"), v55);
    }
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setPath:](v51, "setPath:", v56);

    v30 = v61;
    +[WFWeatherChannelRequestFormatterV3 forecastRequestForComponents:location:locale:date:queryItems:](WFWeatherChannelRequestFormatterV3, "forecastRequestForComponents:location:locale:date:queryItems:", v51, v13, v14, v61, v37);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLogForCategory(0);
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v63 = (id)objc_opt_class();
      v64 = 2048;
      v65 = a3;
      v66 = 2112;
      v67 = v13;
      v58 = v63;
      _os_log_error_impl(&dword_21189A000, v51, OS_LOG_TYPE_ERROR, "%{public}@ is unable to build %lu forecast request for %@.", buf, 0x20u);

    }
    v29 = 0;
    v30 = v61;
  }

  v15 = v60;
LABEL_37:

  return v29;
}

+ (id)hostURLForService
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.weather.com"));
}

+ (id)forecastRequest:(id)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6 queryItems:(id)a7 rules:(id)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v13 = (objc_class *)MEMORY[0x24BDD1808];
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [v13 alloc];
  objc_msgSend(a1, "hostURLForService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithURL:resolvingAgainstBaseURL:", v20, 0);

  v22 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v18, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("/"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "stringWithFormat:", CFSTR("/%@"), v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPath:", v24);

  +[WFWeatherChannelRequestFormatterV3 forecastRequestForComponents:location:locale:date:queryItems:](WFWeatherChannelRequestFormatterV3, "forecastRequestForComponents:location:locale:date:queryItems:", v21, v17, v16, v15, v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)forecastRequestForComponents:(id)a3 location:(id)a4 locale:(id)a5 date:(id)a6 queryItems:(id)a7
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a3;
  objc_msgSend(v8, "setQueryItems:", a7);
  v9 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v8, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "requestWithURL:cachePolicy:timeoutInterval:", v10, 4, 30.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPShouldHandleCookies:", 0);
  return v11;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

+ (void)forecastRequest:(uint64_t)a1 forLocation:(NSObject *)a2 withUnits:locale:date:rules:options:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Unhandled forecast request type: %lu", (uint8_t *)&v2, 0xCu);
}

@end
