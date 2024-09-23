@implementation WFWeatherHistorical30DayParserV3

+ (id)daysOfWeek
{
  if (daysOfWeek_onceToken != -1)
    dispatch_once(&daysOfWeek_onceToken, &__block_literal_global_23);
  return (id)daysOfWeek__daysOfWeek;
}

void __46__WFWeatherHistorical30DayParserV3_daysOfWeek__block_invoke()
{
  void *v0;

  v0 = (void *)daysOfWeek__daysOfWeek;
  daysOfWeek__daysOfWeek = (uint64_t)&unk_24CCC1328;

}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken_2 != -1)
    dispatch_once(&dateFormatter_onceToken_2, &__block_literal_global_14);
  return (id)dateFormatter_dateFormatter_2;
}

void __49__WFWeatherHistorical30DayParserV3_dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)dateFormatter_dateFormatter_2;
  dateFormatter_dateFormatter_2 = (uint64_t)v0;

}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherHistorical30DayParserV3 parseForecastData:types:location:locale:date:error:rules:](self, "parseForecastData:types:location:locale:date:error:rules:", a3, a4, a5, a6, a7, a8, 0);
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x24BDAC8D0];
  v14 = a5;
  v15 = a7;
  if (a4 == 64)
  {
    v32 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v32);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v32;
    v18 = objc_alloc_init(WFParsedForecastData);
    if (v16)
    {
      -[WFWeatherHistorical30DayParserV3 parseHistorical30DayForecastDataFromJson:location:date:error:](self, "parseHistorical30DayForecastDataFromJson:location:date:error:", v16, v14, v15, a8);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFParsedForecastData setCurrentConditions:](v18, "setCurrentConditions:", v19);

      v20 = v18;
    }
    else
    {
      WFLogForCategory(7uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WFWeatherHistorical30DayParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.1((uint64_t)v17, v22, v23, v24, v25, v26, v27, v28);

      if (v17)
      {
        v29 = (void *)MEMORY[0x24BDD1540];
        v33 = *MEMORY[0x24BDD0FC8];
        v34[0] = CFSTR("Failed to parse historical 30 day JSON forecast data");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v17, v30);
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
      -[WFWeatherHistorical30DayParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.2(v21);

    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 6, MEMORY[0x24BDBD1B8]);
    v20 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

- (id)parseHistorical30DayForecastDataFromJson:(id)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  WFWeatherConditions *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  WFTemperature *v28;
  void *v29;
  WFTemperature *v30;
  void *v31;
  void *v32;
  void *v33;
  WFTemperature *v34;
  void *v35;
  WFTemperature *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v48;
  _QWORD v49[2];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "arrayForKey:", CFSTR("dayOfWeek"));
  v13 = objc_claimAutoreleasedReturnValue();
  if (!v13)
    goto LABEL_13;
  v14 = (void *)v13;
  objc_msgSend(v10, "arrayForKey:", CFSTR("dayOfWeek"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v10, "arrayForKey:", CFSTR("dayOfWeek"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[WFWeatherHistorical30DayParserV3 getDataIndexFromFirstDayOfWeek:andRequestedDate:](self, "getDataIndexFromFirstDayOfWeek:andRequestedDate:", v18, v12);

    v20 = objc_alloc_init(WFWeatherConditions);
    -[WFWeatherConditions setLocation:](v20, "setLocation:", v11);
    -[WFWeatherConditions setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v12, CFSTR("WFWeatherForecastDateComponent"));
    objc_msgSend(v10, "arrayForKey:", CFSTR("precip24Hour"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", v19);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v24, CFSTR("WFWeatherPrecipitationAmountComponent"));

      }
    }
    objc_msgSend(v10, "arrayForKey:", CFSTR("temperatureMax"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(v25, "objectAtIndexedSubscript:", v19);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
      {
        v28 = [WFTemperature alloc];
        objc_msgSend(v26, "objectAtIndexedSubscript:", v19);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v30 = -[WFTemperature initWithTemperatureUnit:value:](v28, "initWithTemperatureUnit:value:", 2);
        -[WFWeatherConditions setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v30, CFSTR("WFWeatherHighTemperatureComponent"));

      }
    }
    objc_msgSend(v10, "arrayForKey:", CFSTR("temperatureMin"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
    {
      objc_msgSend(v31, "objectAtIndexedSubscript:", v19);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = [WFTemperature alloc];
        objc_msgSend(v32, "objectAtIndexedSubscript:", v19);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v36 = -[WFTemperature initWithTemperatureUnit:value:](v34, "initWithTemperatureUnit:value:", 2);
        -[WFWeatherConditions setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v36, CFSTR("WFWeatherLowTemperatureComponent"));

      }
    }

  }
  else
  {
LABEL_13:
    WFLogForCategory(7uLL);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[WFWeatherHistorical30DayParserV3 parseHistorical30DayForecastDataFromJson:location:date:error:].cold.1(v37, v38, v39, v40, v41, v42, v43, v44);

    v45 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0BA0];
    v49[0] = CFSTR("Failed to parse last twenty-four hours of observations from response.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "wf_errorWithCode:userInfo:", 1, v46);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    v20 = 0;
  }

  return v20;
}

- (int64_t)getDataIndexFromFirstDayOfWeek:(id)a3 andRequestedDate:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;

  v5 = (objc_class *)MEMORY[0x24BDBCE60];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend((id)objc_opt_class(), "dateFormatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDateFormat:", CFSTR("EEEE"));
  objc_msgSend(v9, "stringFromDate:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "daysOfWeek");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "indexOfObject:", v10);

  objc_msgSend((id)objc_opt_class(), "daysOfWeek");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v7);

  v15 = v12 - v14;
  if (v12 - v14 < 0)
  {
    objc_msgSend((id)objc_opt_class(), "daysOfWeek");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v15 += objc_msgSend(v16, "count");

  }
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "components:fromDate:toDate:options:", 16, v6, v8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_msgSend(v18, "day") - v15;
  return v19;
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a2, a3, "Failed to parse historical 30 day JSON data with error \"%@\", a5, a6, a7, a8, 2u);
}

- (void)parseForecastData:(os_log_t)log types:location:locale:date:error:rules:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21189A000, log, OS_LOG_TYPE_ERROR, "Invalid type for parsing historical 30 day data", v1, 2u);
}

- (void)parseHistorical30DayForecastDataFromJson:(uint64_t)a3 location:(uint64_t)a4 date:(uint64_t)a5 error:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
}

@end
