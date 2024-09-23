@implementation WFWeatherUndergroundRequestFormatter

+ (id)hostURLForService
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://api.wunderground.com"));
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 locale:(id)a5 date:(id)a6
{
  return (id)objc_msgSend(a1, "forecastRequest:forLocation:withUnits:locale:date:rules:options:", a3, a4, 0, a5, a6, 0, 0);
}

+ (id)forecastRequest:(unint64_t)a3 forLocation:(id)a4 withUnits:(int)a5 locale:(id)a6 date:(id)a7 rules:(id)a8 options:(id)a9
{
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v10 = a4;
  v11 = a7;
  objc_msgSend(v10, "geoLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v13, "setDateFormat:", CFSTR("yyyyMMdd"));
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v13, "stringFromDate:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "geoLocation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "coordinate");
    NSStringFromCLLocationCoordinate2D(v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("https://api.wunderground.com/api/%@/%@%@/q/%@.json"), CFSTR("e13f255ff1aeedb8"), CFSTR("history_"), v15, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x24BDD16B0];
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "requestWithURL:cachePolicy:timeoutInterval:", v22, 4, 30.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "setHTTPMethod:", CFSTR("GET"));
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", CFSTR("Client"), CFSTR("X-Client-Info"));
    objc_msgSend(v23, "setValue:forHTTPHeaderField:", CFSTR("1.1"), CFSTR("X-Device-Info"));

  }
  else
  {
    WFLogForCategory(2uLL);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      +[WFWeatherUndergroundRequestFormatter forecastRequest:forLocation:withUnits:locale:date:rules:options:].cold.1((uint64_t)v10, v24);

    v23 = 0;
  }

  return v23;
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
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Cannot format a request without a geolocation: %@", (uint8_t *)&v2, 0xCu);
}

@end
