@implementation WFWeatherAlmanacParserV3

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:](self, "parseForecastData:types:location:locale:date:error:rules:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  WFParsedForecastData *v18;
  void *v19;
  WFParsedForecastData *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a7;
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v26;
  v18 = objc_alloc_init(WFParsedForecastData);
  if (a4 == 128)
  {
    if (v16)
    {
      -[WFWeatherAlmanacParserV3 parseAlmanacForecastDataFromJson:location:date:](self, "parseAlmanacForecastDataFromJson:location:date:", v16, v14, v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParsedForecastData setCurrentConditions:](v18, "setCurrentConditions:", v19);

      v20 = v18;
    }
    else
    {
      WFLogForCategory(7uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.1((uint64_t)v17, v22);

      if (v17)
      {
        v23 = (void *)MEMORY[0x24BDD1540];
        v27 = *MEMORY[0x24BDD0FC8];
        v28[0] = CFSTR("Failed to parse JSON forecast data");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v17, v24);
        *a8 = (id)objc_claimAutoreleasedReturnValue();

      }
      v20 = 0;
    }
  }
  else
  {
    WFLogForCategory(7uLL);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.2(v21);

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 6, MEMORY[0x24BDBD1B8]);
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)parseAlmanacForecastDataFromJson:(id)a3 location:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFWeatherConditions *v10;
  void *v11;
  void *v12;
  void *v13;
  WFTemperature *v14;
  void *v15;
  WFTemperature *v16;
  void *v17;
  WFTemperature *v18;
  void *v19;
  WFTemperature *v20;

  v7 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(WFWeatherConditions);
  -[WFWeatherConditions setLocation:](v10, "setLocation:", v9);

  -[WFWeatherConditions setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v8, CFSTR("WFWeatherForecastDateComponent"));
  objc_msgSend(v7, "arrayForKey:", CFSTR("precipitationAverage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v12, CFSTR("WFWeatherPrecipitationAmountComponent"));

  }
  objc_msgSend(v7, "arrayForKey:", CFSTR("temperatureAverageMax"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    v14 = [WFTemperature alloc];
    objc_msgSend(v13, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v16 = -[WFTemperature initWithTemperatureUnit:value:](v14, "initWithTemperatureUnit:value:", 2);
    -[WFWeatherConditions setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v16, CFSTR("WFWeatherHighTemperatureComponent"));

  }
  objc_msgSend(v7, "arrayForKey:", CFSTR("temperatureAverageMin"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = [WFTemperature alloc];
    objc_msgSend(v17, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v20 = -[WFTemperature initWithTemperatureUnit:value:](v18, "initWithTemperatureUnit:value:", 2);
    -[WFWeatherConditions setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", v20, CFSTR("WFWeatherLowTemperatureComponent"));

  }
  return v10;
}

- (void)parseForecastData:(uint64_t)a1 types:(NSObject *)a2 location:locale:date:error:rules:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Failed to parse JSON data with error \"%@\", (uint8_t *)&v2, 0xCu);
}

- (void)parseForecastData:(os_log_t)log types:location:locale:date:error:rules:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21189A000, log, OS_LOG_TYPE_ERROR, "Invalid type for parsing Almanac data", v1, 2u);
}

@end
