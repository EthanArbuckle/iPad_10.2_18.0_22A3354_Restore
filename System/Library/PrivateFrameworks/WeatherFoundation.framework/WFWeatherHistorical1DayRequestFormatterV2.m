@implementation WFWeatherHistorical1DayRequestFormatterV2

+ (id)dateFormatter
{
  if (dateFormatter_onceToken_1 != -1)
    dispatch_once(&dateFormatter_onceToken_1, &__block_literal_global_18);
  return (id)dateFormatter_dateFormatter_1;
}

void __58__WFWeatherHistorical1DayRequestFormatterV2_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)dateFormatter_dateFormatter_1;
  dateFormatter_dateFormatter_1 = (uint64_t)v0;

}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)objc_msgSend(a1, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, a4, 0, a5, a6, 0, 0);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v11;
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
  NSObject *v22;

  v11 = a4;
  v12 = a7;
  v13 = a8;
  objc_msgSend(v11, "geoLocation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend((id)objc_opt_class(), "dateFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDateFormat:", CFSTR("yyyyMMdd"));
    objc_msgSend(v15, "stringFromDate:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("units"), CFSTR("m"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v18);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("startDate"), v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v19);

    objc_msgSend(MEMORY[0x24BDD1838], "queryItemWithName:value:", CFSTR("apiKey"), CFSTR("2f816d1e1526478c816d1e1526578cc7"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    +[WFWeatherChannelRequestFormatterV2 forecastRequestForRequest:queryItems:forLocation:rules:](WFWeatherChannelRequestFormatterV2, "forecastRequestForRequest:queryItems:forLocation:rules:", CFSTR("observations/historical.json"), v17, v11, v13);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLogForCategory(2uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[WFWeatherStoreServiceConfiguration forecastRequestForTypes:location:units:date:apiVersion:error:requestOptions:].cold.1((uint64_t)v11, v22);

    v21 = 0;
  }

  return v21;
}

+ (id)hostURLForService
{
  return +[WFWeatherChannelRequestFormatterV2 hostURLForService](WFWeatherChannelRequestFormatterV2, "hostURLForService");
}

@end
