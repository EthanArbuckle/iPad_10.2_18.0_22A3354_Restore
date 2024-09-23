@implementation WFWeatherHistorical30DaysRequestFormatterV3

+ (id)hostURLForService
{
  return +[WFWeatherChannelRequestFormatterV3 hostURLForService](WFWeatherChannelRequestFormatterV3, "hostURLForService");
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)objc_msgSend(a1, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, a4, 0, a5, a6, 0, 0);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v12 = a8;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  v18 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v14, "languageCode");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v19)
    v21 = (const __CFString *)v19;
  else
    v21 = CFSTR("en");
  objc_msgSend(v18, "queryItemWithName:value:", CFSTR("language"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v22);

  v23 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v15, "wf_weatherChannelGeocodeValue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "queryItemWithName:value:", CFSTR("geocode"), v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v25);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("format"), CFSTR("json"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v26);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("apiKey"), CFSTR("2f816d1e1526478c816d1e1526578cc7"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v27);

  +[WFWeatherChannelRequestFormatterV3 forecastRequest:forLocation:locale:date:queryItems:rules:](WFWeatherChannelRequestFormatterV3, "forecastRequest:forLocation:locale:date:queryItems:rules:", CFSTR("v3-wx-conditions-historical-dailysummary-30day"), v15, v14, v13, v16, v12);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

@end
