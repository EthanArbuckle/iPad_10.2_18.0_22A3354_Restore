@implementation WFWeatherAlmanacRequestFormatterV3

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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v34;
  id v35;

  v12 = a4;
  v35 = a8;
  v13 = a7;
  v34 = a6;
  +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "copy");

  objc_msgSend(v12, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v15, "setTimeZone:", v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "systemTimeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTimeZone:", v17);

  }
  objc_msgSend(v15, "components:fromDate:", 24, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "month"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringValue");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v18, "day"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringValue");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("month"), v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v24);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("day"), v22);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v25);

  v26 = (void *)MEMORY[0x24BDD1838];
  objc_msgSend(v12, "wf_weatherChannelGeocodeValue");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "queryItemWithName:value:", CFSTR("geocode"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v28);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("format"), CFSTR("json"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v29);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v30);

  objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("apiKey"), CFSTR("2f816d1e1526478c816d1e1526578cc7"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addObject:", v31);

  +[WFWeatherChannelRequestFormatterV3 forecastRequest:forLocation:locale:date:queryItems:rules:](WFWeatherChannelRequestFormatterV3, "forecastRequest:forLocation:locale:date:queryItems:rules:", CFSTR("v3-wx-almanac-daily-1day"), v12, v34, v13, v23, v35);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)aqiRequestForScaleNamed:(id)a3 language:(id)a4
{
  return 0;
}

@end
