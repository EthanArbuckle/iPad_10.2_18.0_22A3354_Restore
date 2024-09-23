@implementation WFWeatherUndergroundParser

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherUndergroundParser parseForecastData:types:location:locale:date:error:rules:](self, "parseForecastData:types:location:locale:date:error:rules:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x24BDAC8D0];
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v24, a6, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v24;
  if (v11)
  {
    -[WFWeatherUndergroundParser parseHistoricalForecast:error:](self, "parseHistoricalForecast:error:", v11, a8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLogForCategory(7uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WFWeatherUndergroundParser parseForecastData:types:location:locale:date:error:rules:].cold.1((uint64_t)v12, v14, v15, v16, v17, v18, v19, v20);

    if (v12)
    {
      v21 = (void *)MEMORY[0x24BDD1540];
      v25 = *MEMORY[0x24BDD0FC8];
      v26[0] = CFSTR("Failed to parse JSON forecast data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v12, v22);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v13 = 0;
  }

  return v13;
}

+ (unint64_t)expectedHourlyForecastCount
{
  return 24;
}

+ (unint64_t)expectedDailyForecastCount
{
  return 0;
}

+ (NSSet)componentsForCurrentForecast
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("WFWeatherForecastDateComponent");
  v6[1] = CFSTR("WFWeatherTemperatureComponent");
  v6[2] = CFSTR("WFWeatherHighTemperatureComponent");
  v6[3] = CFSTR("WFWeatherLowTemperatureComponent");
  v6[4] = CFSTR("WFWeatherWindSpeedComponent");
  v6[5] = CFSTR("WFWeatherWindDirectionComponent");
  v6[6] = CFSTR("WFWeatherPrecipitationAmountComponent");
  v6[7] = CFSTR("WFWeatherDewpointComponent");
  v6[8] = CFSTR("WFWeatherVisibilityComponent");
  v6[9] = CFSTR("WFWeatherPressureComponent");
  v6[10] = CFSTR("WFWeatherSunsetDateComponent");
  v6[11] = CFSTR("WFWeatherSunriseDateComponent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
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
  _QWORD v6[13];

  v6[12] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF20];
  v6[0] = CFSTR("WFWeatherForecastDateComponent");
  v6[1] = CFSTR("WFWeatherConditionComponent");
  v6[2] = CFSTR("WFWeatherTemperatureComponent");
  v6[3] = CFSTR("WFWeatherWindSpeedComponent");
  v6[4] = CFSTR("WFWeatherWindDirectionComponent");
  v6[5] = CFSTR("WFWeatherPrecipitationAmountComponent");
  v6[6] = CFSTR("WFWeatherHumidityComponent");
  v6[7] = CFSTR("WFWeatherDewpointComponent");
  v6[8] = CFSTR("WFWeatherVisibilityComponent");
  v6[9] = CFSTR("WFWeatherPressureComponent");
  v6[10] = CFSTR("WFWeatherSunsetDateComponent");
  v6[11] = CFSTR("WFWeatherSunriseDateComponent");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

+ (NSSet)componentsForDailyForecasts
{
  return 0;
}

- (id)parseHistoricalForecast:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  WFParsedForecastData *v17;
  WFParsedForecastData *v18;
  void *v19;
  void *v20;
  WFWeatherConditions *v21;
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
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  WFWeatherConditions *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v53;
  WFParsedForecastData *v54;
  id v55;
  void *v56;
  id obj;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  uint64_t v64;
  _QWORD v65[3];

  v65[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "wf_stringForKeyPath:", &unk_24CCC0FE0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v6, "wf_dictionaryForKeyPath:", &unk_24CCC0FF8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v18 = objc_alloc_init(WFParsedForecastData);
      objc_msgSend(v16, "wf_arrayForKeyPath:", &unk_24CCC1028);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v21 = objc_alloc_init(WFWeatherConditions);
        objc_msgSend(v16, "wf_dictionaryForKeyPath:", &unk_24CCC1040);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherUndergroundParser dateFromUTCDict:toUnitGranularity:](self, "dateFromUTCDict:toUnitGranularity:", v22, 16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v23);

        -[WFWeatherUndergroundParser sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:](self, "sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:", &unk_24CCC1058, &unk_24CCC1070, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v24);

        -[WFWeatherUndergroundParser sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:](self, "sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:", &unk_24CCC1088, &unk_24CCC10A0, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v25, CFSTR("WFWeatherHighTemperatureComponent"));

        -[WFWeatherUndergroundParser sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:](self, "sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:", &unk_24CCC10B8, &unk_24CCC10D0, v20);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v26, CFSTR("WFWeatherLowTemperatureComponent"));

        -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC10E8, v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v27);

        -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1100, v20);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v28);

        -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1118, v20);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v29);

        -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1130, v20);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v30);

        -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1148, v20);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v31);

        v56 = v20;
        -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1160, v20);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherConditions setValue:forComponent:](v21, "setValue:forComponent:", v32);

        -[WFParsedForecastData setCurrentConditions:](v18, "setCurrentConditions:", v21);
        objc_msgSend(v16, "wf_arrayForKeyPath:", &unk_24CCC1190);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v33, "count"))
        {
          v54 = v18;
          v55 = v6;
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v33, "count"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v53 = v33;
          obj = v33;
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
          if (v34)
          {
            v35 = v34;
            v36 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v60 != v36)
                  objc_enumerationMutation(obj);
                v38 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                v39 = objc_alloc_init(WFWeatherConditions);
                objc_msgSend(v38, "wf_dictionaryForKeyPath:", &unk_24CCC11A8);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherUndergroundParser dateFromUTCDict:toUnitGranularity:](self, "dateFromUTCDict:toUnitGranularity:", v40, 32);
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v41, CFSTR("WFWeatherForecastDateComponent"));

                -[WFWeatherUndergroundParser sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:](self, "sanitizedTemperatureForCelsiusKeyPath:fahrenheitKeyPath:dict:", &unk_24CCC11C0, &unk_24CCC11D8, v38);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v42, CFSTR("WFWeatherTemperatureComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC11F0, v38);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v43, CFSTR("WFWeatherWindSpeedComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1208, v38);
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v44, CFSTR("WFWeatherWindDirectionComponent"));

                v45 = +[WFWeatherUndergroundParser conditionFromWeatherUndergroundPhrase:](WFWeatherUndergroundParser, "conditionFromWeatherUndergroundPhrase:", CFSTR("conds"));
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v45);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v46, CFSTR("WFWeatherConditionComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1220, v38);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v47, CFSTR("WFWeatherVisibilityComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1238, v38);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v48, CFSTR("WFWeatherPressureComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1250, v38);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v49, CFSTR("WFWeatherDewpointComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1268, v38);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v50, CFSTR("WFWeatherHumidityComponent"));

                -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", &unk_24CCC1280, v38);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                -[WFWeatherConditions setValue:forComponent:](v39, "setValue:forComponent:", v51, CFSTR("WFWeatherPrecipitationAmountComponent"));

                objc_msgSend(v58, "addObject:", v39);
              }
              v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
            }
            while (v35);
          }

          v18 = v54;
          -[WFParsedForecastData setHourlyForecasts:](v54, "setHourlyForecasts:", v58);

          v17 = v54;
          v6 = v55;
          v33 = v53;
        }
        else
        {
          -[WFWeatherUndergroundParser logParsingErrorAtKeyPath:error:](self, "logParsingErrorAtKeyPath:error:", &unk_24CCC1298, a4);
          v17 = 0;
        }

        v20 = v56;
      }
      else
      {
        -[WFWeatherUndergroundParser logParsingErrorAtKeyPath:error:](self, "logParsingErrorAtKeyPath:error:", &unk_24CCC1178, a4);
        v17 = 0;
      }

    }
    else
    {
      -[WFWeatherUndergroundParser logParsingErrorAtKeyPath:error:](self, "logParsingErrorAtKeyPath:error:", &unk_24CCC1010, a4);
      v17 = 0;
    }
    goto LABEL_23;
  }
  WFLogForCategory(7uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[WFWeatherUndergroundParser parseHistoricalForecast:error:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  if (a4)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v64 = *MEMORY[0x24BDD0FC8];
    v65[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v65, &v64, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wf_errorWithCode:userInfo:", 1, v16);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_23:

    goto LABEL_24;
  }
  v17 = 0;
LABEL_24:

  return v17;
}

- (void)logParsingErrorAtKeyPath:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD17C8];
  +[WFForecastDataParserUtils stringFromKeyPath:](WFForecastDataParserUtils, "stringFromKeyPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("Missing object at key path %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  WFLogForCategory(7uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[WFWeatherUndergroundParser logParsingErrorAtKeyPath:error:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

  if (a4)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BDD0FC8];
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "wf_errorWithCode:userInfo:", 1, v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
}

- (id)sanitizedNumberForKeyPath:(id)a3 dict:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "wf_integerForKeyPath:", v5);
  v8 = 0;
  if (v7 != -9999 && v7 != -999)
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "wf_floatForKeyPath:", v5);
    objc_msgSend(v9, "numberWithFloat:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)sanitizedTemperatureForCelsiusKeyPath:(id)a3 fahrenheitKeyPath:(id)a4 dict:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  float v13;
  float v14;

  v8 = a5;
  v9 = a3;
  -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", a4, v8);
  v10 = objc_claimAutoreleasedReturnValue();
  -[WFWeatherUndergroundParser sanitizedNumberForKeyPath:dict:](self, "sanitizedNumberForKeyPath:dict:", v9, v8);
  v11 = objc_claimAutoreleasedReturnValue();

  if (v10 | v11)
  {
    v12 = (void *)objc_opt_new();
    if (v11)
    {
      objc_msgSend((id)v11, "floatValue");
      objc_msgSend(v12, "setCelsius:", v13);
    }
    if (v10)
    {
      objc_msgSend((id)v10, "floatValue");
      objc_msgSend(v12, "setFahrenheit:", v14);
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (unint64_t)conditionFromWeatherUndergroundPhrase:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(Light|Heavy)\\s"), 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v3;
  if (v5)
  {
    v8 = objc_msgSend(v5, "rangeAtIndex:", 1);
    objc_msgSend(v3, "substringWithRange:", v8, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "range");
    v11 = v10;
    v12 = objc_msgSend(v3, "length");
    objc_msgSend(v6, "range");
    objc_msgSend(v3, "substringWithRange:", v11, v12 - v13);

  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Drizzle")) & 1) != 0)
    goto LABEL_4;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Rain")) & 1) != 0)
  {
    v14 = 13;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Snow")) & 1) != 0)
  {
    v14 = 17;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Snow Grains")) & 1) != 0)
  {
    v14 = 14;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Ice Crystals")) & 1) != 0)
  {
    v14 = 19;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Ice Pellets")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Hail")) & 1) != 0)
  {
LABEL_15:
    v14 = 18;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Mist")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Fog")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Fog Patches")) & 1) != 0)
  {
LABEL_19:
    v14 = 21;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Smoke")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Volcanic Ash")) & 1) != 0)
  {
    v14 = 23;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Widespread Dust")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Sand")) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Haze")) & 1) != 0)
  {
    v14 = 22;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Spray")) & 1) != 0)
    goto LABEL_19;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Dust Whirls")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Sandstorm")) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Low Drifting Snow")) & 1) != 0)
    goto LABEL_33;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Low Drifting Widespread Dust")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Low Drifting Sand")) & 1) != 0)
  {
    goto LABEL_26;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Blowing Snow")) & 1) != 0)
    goto LABEL_33;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Blowing Widespread Dust")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Blowing Sand")) & 1) != 0)
  {
LABEL_26:
    v14 = 20;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Rain Mist")) & 1) != 0)
  {
LABEL_4:
    v14 = 10;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Rain Showers")) & 1) != 0)
  {
    v14 = 12;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Snow Showers")) & 1) != 0)
  {
    v14 = 15;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Snow Blowing Snow Mist")) & 1) != 0)
  {
LABEL_33:
    v14 = 16;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Ice Pellet Showers")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Hail Showers")) & 1) != 0)
  {
    v14 = 36;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Small Hail Showers")) & 1) != 0)
    goto LABEL_15;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Thunderstorm")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Thunderstorms and Rain")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Thunderstorms and Snow")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Thunderstorms and Ice Pellets")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Thunderstorms with Hail")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Thunderstorms with Small Hail")) & 1) != 0)
  {
    v14 = 5;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Freezing Drizzle")) & 1) != 0)
  {
    v14 = 9;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Freezing Rain")) & 1) != 0)
  {
    v14 = 11;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Freezing Fog")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Patches of Fog")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Shallow Fog")) & 1) != 0
    || (objc_msgSend(v7, "isEqual:", CFSTR("Partial Fog")) & 1) != 0)
  {
    goto LABEL_19;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Overcast")) & 1) != 0)
  {
    v14 = 27;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Clear")) & 1) != 0)
  {
    v14 = 33;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Partly Cloudy")) & 1) != 0)
    goto LABEL_72;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Mostly Cloudy")) & 1) != 0)
    goto LABEL_70;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Scattered Clouds")) & 1) != 0)
  {
LABEL_72:
    v14 = 31;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Small Hail")) & 1) != 0)
    goto LABEL_15;
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Squalls")) & 1) != 0)
  {
LABEL_70:
    v14 = 29;
    goto LABEL_20;
  }
  if ((objc_msgSend(v7, "isEqual:", CFSTR("Funnel Cloud")) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    if ((objc_msgSend(v7, "isEqual:", CFSTR("Unknown Precipitation")) & 1) == 0)
      objc_msgSend(v7, "isEqual:", CFSTR("Unknown"));
    v14 = 0;
  }
LABEL_20:

  return v14;
}

- (id)dateFromUTCDict:(id)a3 toUnitGranularity:(unint64_t)a4
{
  id v5;
  id v6;
  __int128 v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    *((_QWORD *)&v7 + 1) = a4;
    *(_QWORD *)&v7 = a4 - 4;
    switch((unint64_t)(v7 >> 2))
    {
      case 0uLL:
        goto LABEL_7;
      case 1uLL:
        goto LABEL_6;
      case 3uLL:
        goto LABEL_5;
      case 7uLL:
        goto LABEL_4;
      default:
        objc_msgSend(v6, "setMinute:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_24CCC12B0));
LABEL_4:
        objc_msgSend(v6, "setHour:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_24CCC12C8));
LABEL_5:
        objc_msgSend(v6, "setDay:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_24CCC12E0));
LABEL_6:
        objc_msgSend(v6, "setMonth:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_24CCC12F8));
LABEL_7:
        objc_msgSend(v6, "setYear:", objc_msgSend(v5, "wf_integerForKeyPath:", &unk_24CCC1310));
        +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dateFromComponents:", v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a2, a3, "Failed to parse JSON data with error \"%@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseHistoricalForecast:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a2, a3, "Received error response \"%@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)logParsingErrorAtKeyPath:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a2, a3, "%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
