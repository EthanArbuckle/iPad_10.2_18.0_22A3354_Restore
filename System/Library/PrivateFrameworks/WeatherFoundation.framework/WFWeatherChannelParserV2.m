@implementation WFWeatherChannelParserV2

- (WFWeatherChannelParserV2)init
{
  WFWeatherChannelParserV2 *v2;
  id v3;
  uint64_t v4;
  NSCalendar *calendar;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFWeatherChannelParserV2;
  v2 = -[WFWeatherChannelParserV2 init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE48]);
    v4 = objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v4;

    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherChannelParserV2 calendar](v2, "calendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTimeZone:", v6);

  }
  return v2;
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:](self, "parseForecastData:types:location:locale:date:error:rules:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  WFParsedForecastData *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  NSObject *v41;
  void *v42;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  WFWeatherChannelParserV2 *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  id v59;
  uint64_t v60;
  const __CFString *v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  if (v15)
  {
    v54 = self;
    v59 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v59);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v59;
    if (v20)
    {
      WFLogForCategory(7uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:].cold.3();

      v23 = objc_alloc_init(WFParsedForecastData);
      if (a4 != 1)
      {
        v51 = v21;
        v52 = v18;
        v46 = v19;
        v47 = v17;
        v48 = v16;
        v49 = v15;
        -[WFWeatherChannelParserV2 parseCurrentCondition:](v54, "parseCurrentCondition:", v20);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "valueForComponent:", CFSTR("WFWeatherForecastDateComponent"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v20;
        v30 = (void *)v28;
        v50 = v29;
        -[WFWeatherChannelParserV2 parseDailyForecasts:](v54, "parseDailyForecasts:");
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v31 = (id)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
        if (v32)
        {
          v33 = v32;
          v34 = *(_QWORD *)v56;
LABEL_16:
          v35 = 0;
          while (1)
          {
            if (*(_QWORD *)v56 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v35);
            objc_msgSend(v36, "valueForComponent:", CFSTR("WFWeatherForecastDateComponent"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v30, "isDate:inSameDayAsDate:", v37, v27) & 1) != 0)
              break;

            if (v33 == ++v35)
            {
              v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
              if (v33)
                goto LABEL_16;
              goto LABEL_22;
            }
          }
          objc_msgSend(v36, "valueForComponent:", CFSTR("WFWeatherHighTemperatureComponent"));
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "valueForComponent:", CFSTR("WFWeatherLowTemperatureComponent"));
          v38 = objc_claimAutoreleasedReturnValue();

          if (v39)
            v40 = v38 == 0;
          else
            v40 = 1;
          v45 = (void *)v39;
          if (!v40)
          {
            objc_msgSend(v53, "setValue:forComponent:", v39, CFSTR("WFWeatherHighTemperatureComponent"));
            v44 = (void *)v38;
            objc_msgSend(v53, "setValue:forComponent:", v38, CFSTR("WFWeatherLowTemperatureComponent"));
            v16 = v48;
            v15 = v49;
            v17 = v47;
            goto LABEL_31;
          }
        }
        else
        {
LABEL_22:

          v38 = 0;
          v45 = 0;
        }
        v16 = v48;
        v15 = v49;
        WFLogForCategory(7uLL);
        v41 = objc_claimAutoreleasedReturnValue();
        v17 = v47;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:].cold.2();
        v44 = (void *)v38;

LABEL_31:
        v19 = v46;
        -[WFParsedForecastData setDailyForecasts:](v23, "setDailyForecasts:", v31);
        -[WFWeatherChannelParserV2 parseHourlyForecasts:](v54, "parseHourlyForecasts:", v50);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFParsedForecastData setHourlyForecasts:](v23, "setHourlyForecasts:", v42);

        v24 = v53;
        -[WFParsedForecastData setCurrentConditions:](v23, "setCurrentConditions:", v53);
        -[WFParsedForecastData setRawData:](v23, "setRawData:", v15);

        v20 = v50;
        v21 = v51;
        v18 = v52;
        goto LABEL_32;
      }
      if (+[WFResponseParsingRules aqiEnabledByRules:forLocation:](WFResponseParsingRules, "aqiEnabledByRules:forLocation:", v19, v16))
      {
        -[WFWeatherChannelParserV2 parseAirQualityData:location:error:](v54, "parseAirQualityData:location:error:", v15, v16, a8);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFParsedForecastData setAirQualityObservations:](v23, "setAirQualityObservations:", v24);
LABEL_32:

      }
LABEL_33:

      goto LABEL_34;
    }
  }
  else
  {
    v21 = 0;
  }
  WFLogForCategory(7uLL);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[WFWeatherChannelParserV2 parseForecastData:types:location:locale:date:error:rules:].cold.1();

  if (v21)
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v60 = *MEMORY[0x24BDD0FC8];
    v61 = CFSTR("Failed to parse JSON forecast data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v21, v20);
    v23 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_33;
  }
  v23 = 0;
LABEL_34:

  return v23;
}

+ (unint64_t)expectedHourlyForecastCount
{
  return 24;
}

+ (unint64_t)expectedDailyForecastCount
{
  return 11;
}

+ (NSSet)componentsForCurrentForecast
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[23];

  v6[22] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("WFWeatherForecastDateComponent");
  v6[1] = CFSTR("WFWeatherForecastExpirationDateComponent");
  v6[2] = CFSTR("WFWeatherConditionComponent");
  v6[3] = CFSTR("WFWeatherFeelsLikeTemperatureComponent");
  v6[4] = CFSTR("WFWeatherTemperatureComponent");
  v6[5] = CFSTR("WFWeatherHighTemperatureComponent");
  v6[6] = CFSTR("WFWeatherLowTemperatureComponent");
  v6[7] = CFSTR("WFWeatherWindSpeedComponent");
  v6[8] = CFSTR("WFWeatherWindDirectionComponent");
  v6[9] = CFSTR("WFWeatherPrecipitationAmountComponent");
  v6[10] = CFSTR("WFWeatherHumidityComponent");
  v6[11] = CFSTR("WFWeatherDewpointComponent");
  v6[12] = CFSTR("WFWeatherPressureComponent");
  v6[13] = CFSTR("WFWeatherPressureTrendComponent");
  v6[14] = CFSTR("WFWeatherUVIndexComponent");
  v6[15] = CFSTR("WFWeatherVisibilityComponent");
  v6[16] = CFSTR("WFWeatherSunriseDateComponent");
  v6[17] = CFSTR("WFWeatherSunsetDateComponent");
  v6[18] = CFSTR("WFWeatherIOSLinkComponent");
  v6[19] = CFSTR("WFWeatherWebLinkComponent");
  v6[20] = CFSTR("WFWeatherMobileLinkComponent");
  v6[21] = CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)componentsForHourlyForecasts
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[16];

  v6[15] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("WFWeatherForecastDateComponent");
  v6[1] = CFSTR("WFWeatherForecastExpirationDateComponent");
  v6[2] = CFSTR("WFWeatherConditionComponent");
  v6[3] = CFSTR("WFWeatherTemperatureComponent");
  v6[4] = CFSTR("WFWeatherWindSpeedComponent");
  v6[5] = CFSTR("WFWeatherWindDirectionComponent");
  v6[6] = CFSTR("WFWeatherPrecipitationChanceComponent");
  v6[7] = CFSTR("WFWeatherHumidityComponent");
  v6[8] = CFSTR("WFWeatherDewpointComponent");
  v6[9] = CFSTR("WFWeatherUVIndexComponent");
  v6[10] = CFSTR("WFWeatherVisibilityComponent");
  v6[11] = CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent");
  v6[12] = CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent");
  v6[13] = CFSTR("WFWeatherSunsetDateComponent");
  v6[14] = CFSTR("WFWeatherSunriseDateComponent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)componentsForDailyForecasts
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[12];

  v6[11] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("WFWeatherForecastDateComponent");
  v6[1] = CFSTR("WFWeatherForecastExpirationDateComponent");
  v6[2] = CFSTR("WFWeatherConditionComponent");
  v6[3] = CFSTR("WFWeatherHighTemperatureComponent");
  v6[4] = CFSTR("WFWeatherLowTemperatureComponent");
  v6[5] = CFSTR("WFWeatherPrecipitationChanceComponent");
  v6[6] = CFSTR("WFWeatherSunriseDateComponent");
  v6[7] = CFSTR("WFWeatherSunsetDateComponent");
  v6[8] = CFSTR("WFWeatherUVIndexComponent");
  v6[9] = CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent");
  v6[10] = CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (unint64_t)_pressureTrendFromWeatherChannelCode:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue") - 1;
  if (v3 > 3)
    return 0;
  else
    return qword_2118E5B60[v3];
}

- (id)parseDailyForecasts:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WFWeatherConditions *v13;
  NSObject *v14;
  WFWeatherConditions *v15;
  WFWeatherConditions *v16;
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
  NSObject *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  WFWeatherConditions *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD1500]);
  objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
  objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  v40 = v3;
  objc_msgSend(v3, "wf_arrayForKeyPath:", &unk_24CCC09F8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v37 = v4;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v8 = objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v35 = v7;
    obj = v7;
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v44;
      v38 = *(_QWORD *)v44;
      v39 = v8;
      do
      {
        v12 = 0;
        v41 = v10;
        do
        {
          if (*(_QWORD *)v44 != v11)
            objc_enumerationMutation(obj);
          v13 = *(WFWeatherConditions **)(*((_QWORD *)&v43 + 1) + 8 * v12);
          WFLogForCategory(7uLL);
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v48 = v13;
            _os_log_debug_impl(&dword_21189A000, v14, OS_LOG_TYPE_DEBUG, "Parsing daily forecast: %@", buf, 0xCu);
          }

          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v15 = v13;
            v16 = objc_alloc_init(WFWeatherConditions);
            -[WFWeatherConditions wf_numberForKeyPath:](v15, "wf_numberForKeyPath:", &unk_24CCC0A28);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v17, "unsignedIntegerValue"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v18, CFSTR("WFWeatherForecastDateComponent"));
            objc_msgSend(v40, "wf_numberForKeyPath:", &unk_24CCC0A40);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v19, "unsignedIntegerValue"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v20, CFSTR("WFWeatherForecastExpirationDateComponent"));
            -[WFWeatherConditions wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:](v15, "wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:", &unk_24CCC0A58, &unk_24CCC0A70);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v21, CFSTR("WFWeatherHighTemperatureComponent"));

            -[WFWeatherConditions wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:](v15, "wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:", &unk_24CCC0A88, &unk_24CCC0AA0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v22, CFSTR("WFWeatherLowTemperatureComponent"));

            -[WFWeatherConditions wf_numberForKeyPath:](v15, "wf_numberForKeyPath:", &unk_24CCC0AB8);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v23, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"));

            -[WFWeatherConditions wf_dictionaryForKeyPath:](v15, "wf_dictionaryForKeyPath:", &unk_24CCC0AD0);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v24)
            {
              -[WFWeatherConditions wf_dictionaryForKeyPath:](v15, "wf_dictionaryForKeyPath:", &unk_24CCC0AE8);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[WFWeatherConditions setNightForecast:](v16, "setNightForecast:", 1);
            }
            objc_msgSend(v24, "wf_numberForKeyPath:", &unk_24CCC0B00, v35);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v25, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"));
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v25, "unsignedIntegerValue")));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v26, CFSTR("WFWeatherConditionComponent"));

            objc_msgSend(v24, "wf_numberForKeyPath:", &unk_24CCC0B18);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v27, CFSTR("WFWeatherPrecipitationChanceComponent"));

            objc_msgSend(v24, "wf_numberForKeyPath:", &unk_24CCC0B30);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v16, "setValue:forComponent:", v28, CFSTR("WFWeatherUVIndexComponent"));

            WFLogForCategory(7uLL);
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v48 = v16;
              _os_log_debug_impl(&dword_21189A000, v29, OS_LOG_TYPE_DEBUG, "Parsed daily forecast into: %@", buf, 0xCu);
            }

            v8 = v39;
            -[NSObject addObject:](v39, "addObject:", v16);

            v10 = v41;
            v11 = v38;
          }
          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      }
      while (v10);
    }

    v30 = -[NSObject count](v8, "count");
    v4 = v37;
    if (v30 != +[WFWeatherChannelParserV2 expectedDailyForecastCount](WFWeatherChannelParserV2, "expectedDailyForecastCount"))
    {
      WFLogForCategory(7uLL);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[WFWeatherChannelParserV2 parseDailyForecasts:].cold.2(v8);

    }
    +[WFForecastDataParserUtils ascendingTimeComparator](WFForecastDataParserUtils, "ascendingTimeComparator", v35);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sortedArrayUsingComparator:](v8, "sortedArrayUsingComparator:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v36;
  }
  else
  {
    WFLogForCategory(7uLL);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WFWeatherChannelParserV2 parseDailyForecasts:].cold.1(v8);
    v33 = 0;
  }

  return v33;
}

- (id)parseHourlyForecasts:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  WFWeatherConditions *v10;
  NSObject *v11;
  WFWeatherConditions *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v28;
  NSObject *v30;
  id v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  WFWeatherConditions *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v31 = a3;
  objc_msgSend(v31, "wf_arrayForKeyPath:", &unk_24CCC0B48);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v30 = objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v28 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v35;
      do
      {
        v8 = 0;
        v32 = v6;
        do
        {
          if (*(_QWORD *)v35 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            WFLogForCategory(7uLL);
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v10;
              _os_log_debug_impl(&dword_21189A000, v11, OS_LOG_TYPE_DEBUG, "Parsing hourly forecast: %@", buf, 0xCu);
            }

            v12 = objc_alloc_init(WFWeatherConditions);
            -[WFWeatherConditions wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0B78);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v13, "unsignedIntegerValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v12, "setValue:forComponent:", v14, CFSTR("WFWeatherForecastDateComponent"));
            objc_msgSend(v31, "wf_numberForKeyPath:", &unk_24CCC0B90);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v15, "unsignedIntegerValue"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v12, "setValue:forComponent:", v16, CFSTR("WFWeatherForecastExpirationDateComponent"));
            -[WFWeatherConditions wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0BA8);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v12, "setValue:forComponent:", v17, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"));

            -[WFWeatherConditions wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0BC0);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v18, "unsignedIntegerValue")));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v12, "setValue:forComponent:", v19, CFSTR("WFWeatherConditionComponent"));

            -[WFWeatherConditions setValue:forComponent:](v12, "setValue:forComponent:", v18, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"));
            -[WFWeatherConditions wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0BD8);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[WFWeatherConditions setValue:forComponent:](v12, "setValue:forComponent:", v20, CFSTR("WFWeatherPrecipitationChanceComponent"));

            -[WFWeatherChannelParserV2 parseCommonComponents:data:](self, "parseCommonComponents:data:", v12, v10);
            -[NSObject addObject:](v30, "addObject:", v12);
            WFLogForCategory(7uLL);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v39 = v12;
              _os_log_debug_impl(&dword_21189A000, v21, OS_LOG_TYPE_DEBUG, "Parsed hourly forecast into: %@", buf, 0xCu);
            }

            v6 = v32;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
      }
      while (v6);
    }

    v22 = v30;
    v23 = -[NSObject count](v30, "count");
    if (v23 != +[WFWeatherChannelParserV2 expectedHourlyForecastCount](WFWeatherChannelParserV2, "expectedHourlyForecastCount"))
    {
      WFLogForCategory(7uLL);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[WFWeatherChannelParserV2 parseHourlyForecasts:].cold.2(v30);

    }
    +[WFForecastDataParserUtils ascendingTimeComparator](WFForecastDataParserUtils, "ascendingTimeComparator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject sortedArrayUsingComparator:](v30, "sortedArrayUsingComparator:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v28;
  }
  else
  {
    WFLogForCategory(7uLL);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[WFWeatherChannelParserV2 parseHourlyForecasts:].cold.1(v22);
    v26 = 0;
  }

  return v26;
}

- (id)parseCurrentCondition:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  WFWeatherConditions *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  float v14;
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
  NSObject *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  WFWeatherChannelParserV2 *v33;
  id v34;

  v4 = a3;
  objc_msgSend(v4, "wf_dictionaryForKeyPath:", &unk_24CCC0BF0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFLogForCategory(7uLL);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[WFWeatherChannelParserV2 parseCurrentCondition:].cold.3();

    v8 = objc_alloc_init(WFWeatherConditions);
    objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0C20);
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)-[NSObject unsignedIntegerValue](v7, "unsignedIntegerValue"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:");
    objc_msgSend(v4, "wf_numberForKeyPath:", &unk_24CCC0C38);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v31, "unsignedIntegerValue"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:");
    objc_msgSend(v5, "wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:", &unk_24CCC0C50, &unk_24CCC0C68);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v9, CFSTR("WFWeatherFeelsLikeTemperatureComponent"));

    objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0C80);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v10, "unsignedIntegerValue")));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v11, CFSTR("WFWeatherConditionComponent"));

    v29 = v10;
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v10, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"));
    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0C98);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "floatValue");
    objc_msgSend(v12, "numberWithDouble:", v14 * 25.4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v15, CFSTR("WFWeatherPrecipitationAmountComponent"));
    objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0CB0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v16, CFSTR("WFWeatherPressureComponent"));

    objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0CC8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17 && (unint64_t)objc_msgSend(v17, "unsignedIntegerValue") <= 4)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[WFWeatherChannelParserV2 _pressureTrendFromWeatherChannelCode:](self, "_pressureTrendFromWeatherChannelCode:", v18));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v19, CFSTR("WFWeatherPressureTrendComponent"));

    }
    v33 = self;
    v34 = v4;
    objc_msgSend(v4, "wf_dictionaryForKeyPath:", &unk_24CCC0CE0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wf_stringForKeyPath:", &unk_24CCC0CF8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wf_stringForKeyPath:", &unk_24CCC0D10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "wf_stringForKeyPath:", &unk_24CCC0D28);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v24, CFSTR("WFWeatherWebLinkComponent"));

    }
    if (v22)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v25, CFSTR("WFWeatherIOSLinkComponent"));

    }
    if (v23)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherConditions setValue:forComponent:](v8, "setValue:forComponent:", v26, CFSTR("WFWeatherMobileLinkComponent"));

    }
    -[WFWeatherChannelParserV2 parseCommonComponents:data:](v33, "parseCommonComponents:data:", v8, v5);
    WFLogForCategory(7uLL);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      -[WFWeatherChannelParserV2 parseCurrentCondition:].cold.2();

    v4 = v34;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WFWeatherChannelParserV2 parseCurrentCondition:].cold.1(v7);
    v8 = 0;
  }

  return v8;
}

- (void)parseCommonComponents:(id)a3 data:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "wf_temperatureWithCelsiusKeyPath:fahrenheitKeyPath:", &unk_24CCC0D40, &unk_24CCC0D58);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forComponent:", v7, CFSTR("WFWeatherTemperatureComponent"));

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0D70);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forComponent:", v8, CFSTR("WFWeatherWindDirectionComponent"));

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0D88);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forComponent:", v9, CFSTR("WFWeatherWindSpeedComponent"));

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0DA0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forComponent:", v10, CFSTR("WFWeatherHumidityComponent"));

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0DB8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forComponent:", v11, CFSTR("WFWeatherDewpointComponent"));

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0DD0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forComponent:", v12, CFSTR("WFWeatherUVIndexComponent"));

  objc_msgSend(v5, "wf_numberForKeyPath:", &unk_24CCC0DE8);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setValue:forComponent:", v13, CFSTR("WFWeatherVisibilityComponent"));
}

- (id)parseAirQualityData:(id)a3 location:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t i;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  NSObject *v61;
  NSObject *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  id v72;
  id v73;
  id obj;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  _BYTE v80[128];
  const __CFString *v81;
  _QWORD v82[3];
  CLLocationCoordinate2D v83;

  v82[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    WFLogForCategory(7uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[WFWeatherChannelParserV2 parseAirQualityData:location:error:].cold.5(v9);

    v79 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v7, 4, &v79);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v79;
    v12 = v11;
    if (!v10 || v11)
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:encapsulatedError:userInfo:", 1, v11, 0);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      WFLogForCategory(7uLL);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[WFWeatherChannelParserV2 parseAirQualityData:location:error:].cold.2();
      goto LABEL_18;
    }
    -[NSObject wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0E00);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "integerValue");

    -[NSObject wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0E18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    -[NSObject wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0E30);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v17, v20);
    v22 = v21;
    if (v14 == 200)
    {
      -[NSObject coordinate](v21, "coordinate");
      if (!CLLocationCoordinate2DIsValid(v83))
      {
        v27 = (void *)MEMORY[0x24BDD1540];
        v81 = CFSTR("location");
        v82[0] = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v82, &v81, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "wf_errorWithCode:userInfo:", 4, v28);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12)
          goto LABEL_42;
      }
    }
    else
    {
      if (v14 == 204)
        v23 = 10;
      else
        v23 = 8;
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", v23);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
LABEL_42:
        if (a5)
        {
          WFLogForCategory(7uLL);
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
            -[WFWeatherChannelParserV2 parseAirQualityData:location:error:].cold.2();

          v12 = objc_retainAutorelease(v12);
          v26 = 0;
          *a5 = v12;
          goto LABEL_46;
        }
LABEL_18:
        v26 = 0;
LABEL_46:

        goto LABEL_47;
      }
    }

    v29 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v29, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZ"));
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithAbbreviation:", CFSTR("GMT"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setTimeZone:", v30);

    v31 = (void *)objc_opt_new();
    objc_msgSend(v31, "setLocation:", v8);
    -[NSObject wf_stringForKeyPath:](v10, "wf_stringForKeyPath:", &unk_24CCC0E48);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
    v33 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v33);
    v34 = objc_claimAutoreleasedReturnValue();
    -[NSObject wf_arrayForKeyPath:](v10, "wf_arrayForKeyPath:", &unk_24CCC0E60);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "firstObject");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36)
    {
      -[NSObject wf_dictionaryForKeyPath:](v10, "wf_dictionaryForKeyPath:", &unk_24CCC0E78);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v69 = v33;
    v72 = v8;
    v73 = v7;
    v71 = v10;
    -[NSObject wf_numberForKeyPath:](v10, "wf_numberForKeyPath:", &unk_24CCC0E90);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "wf_stringForKeyPath:", &unk_24CCC0EA8);
    v70 = v29;
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dateFromString:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setDate:", v38);

    v66 = v37;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v37, "unsignedIntegerValue"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setExpirationDate:", v39);

    objc_msgSend(v36, "wf_stringForKeyPath:", &unk_24CCC0EC0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setProvider:", v40);

    v68 = (void *)v34;
    objc_msgSend(v31, "setLocale:", v34);
    objc_msgSend(v36, "wf_numberForKeyPath:", &unk_24CCC0ED8);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLocalizedAirQualityIndex:", objc_msgSend(v41, "integerValue"));

    objc_msgSend(v36, "wf_stringForKeyPath:", &unk_24CCC0EF0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setAirQualityScale:", v42);

    objc_msgSend(v36, "wf_stringForKeyPath:", &unk_24CCC0F08);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setLocalizedAirQualityCategory:", v43);

    objc_msgSend(v36, "wf_numberForKeyPath:", &unk_24CCC0F20);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = v44;
    if (v44)
      objc_msgSend(v31, "setCategory:", objc_msgSend(v44, "integerValue"));
    v64 = v45;
    v46 = v31;
    v67 = v36;
    objc_msgSend(v36, "wf_arrayForKeyPath:", &unk_24CCC0F38);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_opt_new();
    v75 = 0u;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    obj = v47;
    v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v76;
      do
      {
        for (i = 0; i != v50; ++i)
        {
          if (*(_QWORD *)v76 != v51)
            objc_enumerationMutation(obj);
          v53 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
          v54 = (void *)objc_opt_new();
          objc_msgSend(v53, "wf_stringForKeyPath:", &unk_24CCC0F50);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setLocalizedName:", v55);

          objc_msgSend(v53, "wf_stringForKeyPath:", &unk_24CCC0F68);
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "setLocalizedDescription:", v56);

          objc_msgSend(v53, "wf_numberForKeyPath:", &unk_24CCC0F80);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "doubleValue");
          objc_msgSend(v54, "setAmount:");

          objc_msgSend(v53, "wf_stringForKeyPath:", &unk_24CCC0F98);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = objc_msgSend(v58, "BOOLValue");

          objc_msgSend(v46, "primaryPollutant");
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v60 && v59)
            objc_msgSend(v46, "setPrimaryPollutant:", v54);
          objc_msgSend(v48, "addObject:", v54);

        }
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
      }
      while (v50);
    }

    v26 = v46;
    if (objc_msgSend(v48, "count"))
      objc_msgSend(v46, "setPollutants:", v48);
    WFLogForCategory(7uLL);
    v61 = objc_claimAutoreleasedReturnValue();
    v8 = v72;
    v7 = v73;
    v22 = v69;
    v12 = v70;
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      -[WFWeatherChannelParserV2 parseAirQualityData:location:error:].cold.3();

    v10 = v71;
    goto LABEL_46;
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:", 1);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  WFLogForCategory(7uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[WFWeatherChannelParserV2 parseAirQualityData:location:error:].cold.1(v10, v24, v25);
  v26 = 0;
LABEL_47:

  return v26;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
  objc_storeStrong((id *)&self->_calendar, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)parseForecastData:types:location:locale:date:error:rules:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, v0, v1, "Failed to parse JSON data with error \"%@\", v2);
  OUTLINED_FUNCTION_1();
}

- (void)parseForecastData:types:location:locale:date:error:rules:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, v0, v1, "Did not find a forecasted high/low for %{public}@.", v2);
  OUTLINED_FUNCTION_1();
}

- (void)parseForecastData:types:location:locale:date:error:rules:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "NSJSONSerialization parsed the data into: '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseDailyForecasts:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[WFForecastDataParserUtils stringFromKeyPath:](WFForecastDataParserUtils, "stringFromKeyPath:", &unk_24CCC0A10);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, a1, v3, "Missing daily forecasts at key path %@", v4);

  OUTLINED_FUNCTION_3_2();
}

- (void)parseDailyForecasts:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  +[WFWeatherChannelParserV2 expectedDailyForecastCount](WFWeatherChannelParserV2, "expectedDailyForecastCount");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21189A000, v1, v2, "Actual number of parsed daily forecasts (%lu) doesn't match expected (%lu)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_2();
}

- (void)parseHourlyForecasts:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[WFForecastDataParserUtils stringFromKeyPath:](WFForecastDataParserUtils, "stringFromKeyPath:", &unk_24CCC0B60);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, a1, v3, "Missing hourly forecasts at key path %@", v4);

  OUTLINED_FUNCTION_3_2();
}

- (void)parseHourlyForecasts:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  +[WFWeatherChannelParserV2 expectedHourlyForecastCount](WFWeatherChannelParserV2, "expectedHourlyForecastCount");
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_0(&dword_21189A000, v1, v2, "Actual number of parsed hourly forecasts (%lu) doesn't match expected (%lu)", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_2();
}

- (void)parseCurrentCondition:(NSObject *)a1 .cold.1(NSObject *a1)
{
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[WFForecastDataParserUtils stringFromKeyPath:](WFForecastDataParserUtils, "stringFromKeyPath:", &unk_24CCC0C08);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, a1, v3, "Missing current conditions at key path %@", v4);

  OUTLINED_FUNCTION_3_2();
}

- (void)parseCurrentCondition:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Parsed current conditions into %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseCurrentCondition:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Parsing current conditions from data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseAirQualityData:(NSObject *)a1 location:(uint64_t)a2 error:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = 0;
  OUTLINED_FUNCTION_0_0(&dword_21189A000, a1, a3, "Unable to parse airquality conditions due to missing location (%@)", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)parseAirQualityData:location:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_21189A000, v0, v1, "Could not parse airquality data: %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)parseAirQualityData:location:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21189A000, v0, v1, "Parsing AirQuality conditions into %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)parseAirQualityData:(os_log_t)log location:error:.cold.5(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21189A000, log, OS_LOG_TYPE_DEBUG, "Attempting to parse data...", v1, 2u);
}

@end
