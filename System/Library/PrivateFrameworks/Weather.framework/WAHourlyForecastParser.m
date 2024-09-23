@implementation WAHourlyForecastParser

+ (void)addSunEventIntoForecasts:(id)a3 eventType:(unint64_t)a4 forecastDetail:(id)a5 eventTime:(unint64_t)a6 currentTime:(unint64_t)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  WAHourlyForecast *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  _QWORD v23[5];

  v22 = a3;
  v11 = a5;
  if (objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%04lu"), a6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertString:atIndex:", CFSTR(":"), 2);
    objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "time");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = TimeStringToIntValue(v14);

    if (a6 > a7)
    {
      v16 = 0;
      if (v15 > a6)
        goto LABEL_4;
    }
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __98__WAHourlyForecastParser_addSunEventIntoForecasts_eventType_forecastDetail_eventTime_currentTime___block_invoke;
    v23[3] = &__block_descriptor_40_e33_B32__0__WAHourlyForecast_8Q16_B24l;
    v23[4] = a6;
    v18 = objc_msgSend(v22, "indexOfObjectPassingTest:", v23);
    if (v18 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = v18;
      if (a4 != 1)
      {
        objc_msgSend(v22, "objectAtIndexedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "time");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v12);

        if ((v21 & 1) != 0)
          goto LABEL_4;
      }
      if (++v16 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_4:
        v17 = objc_alloc_init(WAHourlyForecast);
        -[WAHourlyForecast setEventType:](v17, "setEventType:", a4);
        -[WAHourlyForecast setTime:](v17, "setTime:", v12);
        -[WAHourlyForecast setForecastDetail:](v17, "setForecastDetail:", v11);
        objc_msgSend(v22, "insertObject:atIndex:", v17, v16);

      }
    }

  }
}

BOOL __98__WAHourlyForecastParser_addSunEventIntoForecasts_eventType_forecastDetail_eventTime_currentTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  unint64_t v5;

  objc_msgSend(a2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = TimeStringToIntValue(v3);

  v5 = *(_QWORD *)(a1 + 32);
  return v5 >= v4 && v5 < v4 + 100;
}

+ (id)parseForecasts:(id)a3 temperature:(id)a4 hour:(int64_t)a5 condition:(int64_t)a6 sunrise:(unint64_t)a7 sunset:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "parseForecasts:temperature:currentTime:condition:sunrise:sunset:", a3, a4, 100 * a5, a6, a7, a8);
}

+ (id)parseForecasts:(id)a3 temperature:(id)a4 currentTime:(unint64_t)a5 condition:(int64_t)a6 sunrise:(unint64_t)a7 sunset:(unint64_t)a8
{
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  WAHourlyForecast *v24;
  void *v25;
  void *v26;
  unint64_t v28;
  unint64_t v29;
  int64_t v30;
  _QWORD v31[5];

  v13 = a3;
  v14 = a4;
  if (objc_msgSend(v13, "count"))
  {
    v28 = a7;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __90__WAHourlyForecastParser_parseForecasts_temperature_currentTime_condition_sunrise_sunset___block_invoke;
    v31[3] = &__block_descriptor_40_e33_B32__0__WAHourlyForecast_8Q16_B24l;
    v31[4] = a5;
    v15 = objc_msgSend(v13, "indexOfObjectPassingTest:", v31);
    v30 = a6;
    v29 = a8;
    if (v15 == 0x7FFFFFFFFFFFFFFFLL)
    {
      WALogForCategory(0);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[WAHourlyForecastParser parseForecasts:temperature:currentTime:condition:sunrise:sunset:].cold.1((uint64_t)v13, a5, v16);

      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v13);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)MEMORY[0x24BDBCEB8];
      objc_msgSend(v13, "subarrayWithRange:", v15, objc_msgSend(v13, "count") - v15);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "arrayWithArray:", v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SUNRISE_COMPACT"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[WAHourlyForecastParser addSunEventIntoForecasts:eventType:forecastDetail:eventTime:currentTime:](WAHourlyForecastParser, "addSunEventIntoForecasts:eventType:forecastDetail:eventTime:currentTime:", v17, 1, v21, v28, a5);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SUNSET_COMPACT"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[WAHourlyForecastParser addSunEventIntoForecasts:eventType:forecastDetail:eventTime:currentTime:](WAHourlyForecastParser, "addSunEventIntoForecasts:eventType:forecastDetail:eventTime:currentTime:", v17, 2, v23, v29, a5);

    v24 = objc_alloc_init(WAHourlyForecast);
    -[WAHourlyForecast setEventType:](v24, "setEventType:", 3);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("NOW"), &stru_24DD9EDF8, CFSTR("WeatherFrameworkLocalizableStrings"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[WAHourlyForecast setTime:](v24, "setTime:", v26);

    -[WAHourlyForecast setTemperature:](v24, "setTemperature:", v14);
    -[WAHourlyForecast setPercentPrecipitation:](v24, "setPercentPrecipitation:", -1.0);
    -[WAHourlyForecast setConditionCode:](v24, "setConditionCode:", v30);
    objc_msgSend(v17, "insertObject:atIndex:", v24, 0);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

BOOL __90__WAHourlyForecastParser_parseForecasts_temperature_currentTime_condition_sunrise_sunset___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32) < (unint64_t)(int)TimeStringToIntValue(v3);

  return v4;
}

+ (void)parseForecasts:(os_log_t)log temperature:currentTime:condition:sunrise:sunset:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "Unable to locate current hour (%ld) within new hourly forecasts: %@", (uint8_t *)&v3, 0x16u);
}

@end
