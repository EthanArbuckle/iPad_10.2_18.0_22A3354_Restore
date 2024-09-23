@implementation WFWeatherChannelRequestFormatterV2

+ (id)hostURLForService
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.weather.com"));
}

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
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;

  v13 = a4;
  v14 = a6;
  v15 = a8;
  objc_msgSend(v13, "geoLocation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    WFLogForCategory(2uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:].cold.1((uint64_t)v13, v18);

LABEL_8:
    v17 = 0;
    goto LABEL_10;
  }
  if (a3 != 1)
  {
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("products"), CFSTR("conditionsshort,fcstdaily10short,fcsthourly24short,nowlinks"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v20);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("apiKey"), CFSTR("e45ff1b7c7bda231216c7ab7c33509b8"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v21);

    objc_msgSend((id)objc_opt_class(), "forecastRequestForRequest:queryItems:forLocation:rules:", CFSTR("aggregate.json"), v19, v13, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (!+[WFRequestFormattingRules aqiEnabledByRules:forLocation:](WFRequestFormattingRules, "aqiEnabledByRules:forLocation:", v15, v13))goto LABEL_8;
  objc_msgSend(a1, "airQualityRequestForLocation:locale:", v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v17;
}

+ (id)airQualityRequestForLocation:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;

  v5 = a3;
  v6 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("https://api.weather.com/v2/globalairquality"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v7);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDBCAE8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@-%@"), v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v5, "geoLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "coordinate");
  v16 = v15;
  objc_msgSend(v5, "geoLocation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "coordinate");
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%f,%f"), v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "queryItems");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  v22 = v21;
  if (v21)
    v23 = v21;
  else
    v23 = (id)objc_opt_new();
  v24 = v23;

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("geocode"), v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v25);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("language"), v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v26);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("format"), CFSTR("json"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v27);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("apiKey"), CFSTR("e45ff1b7c7bda231216c7ab7c33509b8"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v28);

  objc_msgSend((id)objc_opt_class(), "forecastRequestForURL:queryItems:", v8, v24);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

+ (id)forecastRequestForRequest:(id)a3 queryItems:(id)a4 forLocation:(id)a5 rules:(id)a6
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "geoLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinate");
  v14 = v13;
  objc_msgSend(v9, "geoLocation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "coordinate");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("https://api.weather.com/v1/geocode/%f/%f/%@"), v14, v16, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v17);
  objc_msgSend((id)objc_opt_class(), "forecastRequestForURL:queryItems:", v18, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)forecastRequestForURL:(id)a3 queryItems:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(v5, "setQueryItems:", a4);
  v6 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend(v5, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "requestWithURL:cachePolicy:timeoutInterval:", v7, 4, 30.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setHTTPMethod:", CFSTR("GET"));
  objc_msgSend(v8, "setHTTPShouldHandleCookies:", 0);
  return v8;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

@end
