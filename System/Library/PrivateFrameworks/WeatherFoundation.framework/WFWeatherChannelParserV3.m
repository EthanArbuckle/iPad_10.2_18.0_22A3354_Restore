@implementation WFWeatherChannelParserV3

- (WFWeatherChannelParserV3)init
{
  WFWeatherChannelParserV3 *v2;
  id v3;
  NSCalendar *v4;
  void *v5;
  NSCalendar *calendar;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFWeatherChannelParserV3;
  v2 = -[WFWeatherChannelParserV3 init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDBCE48]);
    v4 = (NSCalendar *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA28]);
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", CFSTR("GMT"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCalendar setTimeZone:](v4, "setTimeZone:", v5);

    calendar = v2->_calendar;
    v2->_calendar = v4;

  }
  return v2;
}

- (void)_parseCommonComponents:(id)a3 intoConditions:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  WFTemperature *v21;
  WFTemperature *v22;
  void *v23;
  WFTemperature *v24;
  WFTemperature *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v32 = a3;
  v5 = a4;
  objc_msgSend(v32, "numberForKey:", CFSTR("validTimeUtc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v6, "unsignedIntegerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("WFWeatherForecastDateComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("expirationTimeUtc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("WFWeatherForecastExpirationDateComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("iconCode"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v11, "unsignedIntegerValue")));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("WFWeatherConditionComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("relativeHumidity"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("WFWeatherHumidityComponent"));

  objc_msgSend(v32, "numberForKey:", CFSTR("qpf"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    || (objc_msgSend(v32, "numberForKey:", CFSTR("precip24Hour")),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("WFWeatherPrecipitationAmountComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("precipChance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("WFWeatherPrecipitationChanceComponent"));

  objc_msgSend(v32, "numberForKey:", CFSTR("sunriseTimeUtc"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v16, "unsignedIntegerValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("WFWeatherSunriseDateComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("sunsetTimeUtc"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v18, "unsignedIntegerValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, CFSTR("WFWeatherSunsetDateComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("temperature"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = [WFTemperature alloc];
    objc_msgSend(v20, "doubleValue");
    v22 = -[WFTemperature initWithTemperatureUnit:value:](v21, "initWithTemperatureUnit:value:", 2);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("WFWeatherTemperatureComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("temperatureFeelsLike"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = [WFTemperature alloc];
    objc_msgSend(v23, "doubleValue");
    v25 = -[WFTemperature initWithTemperatureUnit:value:](v24, "initWithTemperatureUnit:value:", 2);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, CFSTR("WFWeatherFeelsLikeTemperatureComponent"));

  }
  objc_msgSend(v32, "numberForKey:", CFSTR("uvIndex"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, CFSTR("WFWeatherUVIndexComponent"));

  objc_msgSend(v32, "numberForKey:", CFSTR("visibility"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v27, CFSTR("WFWeatherVisibilityComponent"));
  objc_msgSend(v32, "numberForKey:", CFSTR("windDirection"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v28, CFSTR("WFWeatherWindDirectionComponent"));

  objc_msgSend(v32, "numberForKey:", CFSTR("windSpeed"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v29, CFSTR("WFWeatherWindSpeedComponent"));
  objc_msgSend(v32, "numberForKey:", CFSTR("pressureAltimeter"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v30, CFSTR("WFWeatherPressureComponent"));
  objc_msgSend(v32, "numberForKey:", CFSTR("pressureTendencyCode"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v31, CFSTR("WFWeatherPressureTrendComponent"));

}

- (id)_parseCurrentConditions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  WFTemperature *v7;
  WFTemperature *v8;
  void *v9;
  WFTemperature *v10;
  WFTemperature *v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[WFWeatherChannelParserV3 _parseCommonComponents:intoConditions:](self, "_parseCommonComponents:intoConditions:", v4, v5);
    objc_msgSend(v4, "numberForKey:", CFSTR("temperatureDewPoint"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("WFWeatherDewpointComponent"));
      v7 = [WFTemperature alloc];
      objc_msgSend(v6, "doubleValue");
      v8 = -[WFTemperature initWithTemperatureUnit:value:](v7, "initWithTemperatureUnit:value:", 2);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("WFWeatherDewpointTemperatureComponent"));

    }
    objc_msgSend(v4, "numberForKey:", CFSTR("temperatureMaxSince7Am"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = [WFTemperature alloc];
      objc_msgSend(v9, "doubleValue");
      v11 = -[WFTemperature initWithTemperatureUnit:value:](v10, "initWithTemperatureUnit:value:", 2);
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, CFSTR("WFWeatherHighTemperatureComponent"));

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_parseForecastedConditions:(id)a3 individualForecastProcessingBlock:(id)a4 uniqueParsingBlock:(id)a5
{
  id v7;
  uint64_t (**v8)(id, void *, id, uint64_t, uint64_t);
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  void *v27;
  void *v28;
  void (**v29)(id, void *, void *);
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (uint64_t (**)(id, void *, id, uint64_t, uint64_t))a4;
  v29 = (void (**)(id, void *, void *))a5;
  objc_msgSend(v7, "allKeys");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v11);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v11;
  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      obj = v28;
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(obj);
            v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((v8[2](v8, v13, v7, v18, v12) & 1) == 0)
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v18);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "objectAtIndexedSubscript:", v12);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v18);

            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        }
        while (v15);
      }

      v21 = (void *)objc_opt_new();
      -[WFWeatherChannelParserV3 _parseCommonComponents:intoConditions:](self, "_parseCommonComponents:intoConditions:", v13, v21);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", ++v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"));

      v29[2](v29, v21, v13);
      objc_msgSend(v27, "addObject:", v21);

    }
    while (v12 != v25);
  }
  v23 = (void *)objc_msgSend(v27, "copy");

  return v23;
}

- (id)_parseDailyForecastedConditions:(id)a3
{
  if (!a3)
    return 0;
  -[WFWeatherChannelParserV3 _parseForecastedConditions:individualForecastProcessingBlock:uniqueParsingBlock:](self, "_parseForecastedConditions:individualForecastProcessingBlock:uniqueParsingBlock:", a3, &__block_literal_global_22, &__block_literal_global_11);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __60__WFWeatherChannelParserV3__parseDailyForecastedConditions___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char isKindOfClass;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v28;
  unsigned int v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend(CFSTR("daypart"), "isEqualToString:", v10);
  if ((_DWORD)v11)
  {
    v30 = v9;
    objc_msgSend(v9, "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v11;
    v28 = v10;
    if (a5)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("dayOrNight"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v14 = isKindOfClass & 1;
    }
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    objc_msgSend(v13, "allKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v32;
      v22 = v14 | (2 * a5);
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v32 != v21)
            objc_enumerationMutation(v18);
          v24 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(v13, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectAtIndexedSubscript:", v22);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, v24);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v20);
    }

    v9 = v30;
    v11 = v29;
    v10 = v28;
  }

  return v11;
}

void __60__WFWeatherChannelParserV3__parseDailyForecastedConditions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  WFTemperature *v7;
  WFTemperature *v8;
  void *v9;
  WFTemperature *v10;
  WFTemperature *v11;
  id v12;

  v12 = a2;
  v4 = a3;
  objc_msgSend(v4, "stringForKey:", CFSTR("dayOrNight"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v12, "setNightForecast:", objc_msgSend(CFSTR("N"), "isEqualToString:", v5));
  objc_msgSend(v4, "numberForKey:", CFSTR("temperatureMax"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [WFTemperature alloc];
    objc_msgSend(v6, "doubleValue");
    v8 = -[WFTemperature initWithTemperatureUnit:value:](v7, "initWithTemperatureUnit:value:", 2);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v8, CFSTR("WFWeatherHighTemperatureComponent"));

  }
  objc_msgSend(v4, "numberForKey:", CFSTR("temperatureMin"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = [WFTemperature alloc];
    objc_msgSend(v9, "doubleValue");
    v11 = -[WFTemperature initWithTemperatureUnit:value:](v10, "initWithTemperatureUnit:value:", 2);
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("WFWeatherLowTemperatureComponent"));

  }
}

- (id)_parseDailyPollenForecastedConditions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allKeys");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v7);
    v34 = v7;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = 0;
      v33 = CFSTR("treePollenIndex");
      do
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v36, "count", v33));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v10 = v36;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v38;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v38 != v13)
                objc_enumerationMutation(v10);
              v15 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
              objc_msgSend(v4, "arrayForKey:", v15);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectAtIndexedSubscript:", v8);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          }
          while (v12);
        }

        v18 = (void *)objc_opt_new();
        objc_msgSend(v9, "numberForKey:", CFSTR("fcstValid"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v19, "doubleValue");
          objc_msgSend(v21, "dateWithTimeIntervalSince1970:");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setDate:", v22);

        }
        objc_msgSend(v9, "stringForKey:", CFSTR("dayInd"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          objc_msgSend(v18, "setTimeOfDay:", WFTimeOfDayForString(v23));
        objc_msgSend(v9, "numberForKey:", CFSTR("grassPollenIndex"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v25)
          objc_msgSend(v18, "setGrassIndex:", objc_msgSend(v25, "unsignedIntegerValue"));
        objc_msgSend(v9, "numberForKey:", CFSTR("ragweedPollenIndex"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          objc_msgSend(v18, "setRagweedIndex:", objc_msgSend(v27, "unsignedIntegerValue"));
        objc_msgSend(v9, "numberForKey:", v33);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
          objc_msgSend(v18, "setTreeIndex:", objc_msgSend(v29, "unsignedIntegerValue"));
        objc_msgSend(v35, "addObject:", v18);

        ++v8;
      }
      while (v8 != v34);
    }
    v31 = (void *)objc_msgSend(v35, "copy");

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_parseHourlyForecastedConditions:(id)a3
{
  if (!a3)
    return 0;
  -[WFWeatherChannelParserV3 _parseForecastedConditions:individualForecastProcessingBlock:uniqueParsingBlock:](self, "_parseForecastedConditions:individualForecastProcessingBlock:uniqueParsingBlock:", a3, &__block_literal_global_15_0, &__block_literal_global_16);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __61__WFWeatherChannelParserV3__parseHourlyForecastedConditions___block_invoke()
{
  return 0;
}

void __61__WFWeatherChannelParserV3__parseHourlyForecastedConditions___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  WFTemperature *v6;
  WFTemperature *v7;
  void *v8;
  id v9;

  v9 = a2;
  v4 = a3;
  objc_msgSend(v4, "numberForKey:", CFSTR("temperatureDewPoint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v5, CFSTR("WFWeatherDewpointComponent"));
    v6 = [WFTemperature alloc];
    objc_msgSend(v5, "doubleValue");
    v7 = -[WFTemperature initWithTemperatureUnit:value:](v6, "initWithTemperatureUnit:value:", 2);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("WFWeatherDewpointTemperatureComponent"));

  }
  objc_msgSend(v4, "numberForKey:", CFSTR("wxSeverity"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, CFSTR("WFWeatherSeverityComponent"));

}

- (id)_parseLastTwentyFourHoursOfObservations:(id)a3
{
  if (!a3)
    return 0;
  -[WFWeatherChannelParserV3 _parseForecastedConditions:individualForecastProcessingBlock:uniqueParsingBlock:](self, "_parseForecastedConditions:individualForecastProcessingBlock:uniqueParsingBlock:", a3, &__block_literal_global_17, &__block_literal_global_18);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __68__WFWeatherChannelParserV3__parseLastTwentyFourHoursOfObservations___block_invoke()
{
  return 0;
}

void __68__WFWeatherChannelParserV3__parseLastTwentyFourHoursOfObservations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  WFTemperature *v5;
  WFTemperature *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "numberForKey:", CFSTR("temperatureDewPoint"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v4, CFSTR("WFWeatherDewpointComponent"));
    v5 = [WFTemperature alloc];
    objc_msgSend(v4, "doubleValue");
    v6 = -[WFTemperature initWithTemperatureUnit:value:](v5, "initWithTemperatureUnit:value:", 2);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("WFWeatherDewpointTemperatureComponent"));

  }
}

- (id)_parsePollutants:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x24BDBCED8];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__WFWeatherChannelParserV3__parsePollutants___block_invoke;
  v9[3] = &unk_24CCA2378;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __45__WFWeatherChannelParserV3__parsePollutants___block_invoke(uint64_t a1, void *a2, void *a3)
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
  id v14;

  v5 = a3;
  v6 = a2;
  v14 = (id)objc_opt_new();
  objc_msgSend(v5, "stringForKey:", CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedName:", v7);

  objc_msgSend(v5, "stringForKey:", CFSTR("phrase"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedDescription:", v8);

  objc_msgSend(v5, "numberForKey:", CFSTR("amount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v14, "setAmount:");

  objc_msgSend(v5, "stringForKey:", CFSTR("unit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUnit:", v10);

  objc_msgSend(v5, "stringForKey:", CFSTR("category"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setLocalizedCategoryDescription:", v11);

  objc_msgSend(v5, "numberForKey:", CFSTR("categoryIndex"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCategoryIndex:", objc_msgSend(v12, "unsignedIntegerValue"));

  objc_msgSend(v5, "numberForKey:", CFSTR("index"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIndex:", objc_msgSend(v13, "unsignedIntegerValue"));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v6);

}

- (void)_parseWebLinks:(id)a3 intoWeatherConditions:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a3)
  {
    v5 = (void *)MEMORY[0x24BDBCF48];
    v6 = a4;
    v7 = a3;
    objc_msgSend(v7, "stringForKey:", CFSTR("web"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("WFWeatherWebLinkComponent"));

    v10 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v7, "stringForKey:", CFSTR("web"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLWithString:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("WFWeatherMobileLinkComponent"));

  }
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:](self, "parseForecastData:types:location:locale:date:error:rules:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  _BOOL4 IsRequestedInTypes;
  id v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  _BOOL4 v61;
  id v62;
  void *v63;
  void *v64;
  id v65;
  NSObject *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  _BOOL4 v76;
  id v77;
  void *v78;
  void *v79;
  id v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  _BOOL4 v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  NSObject *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t i;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  id v124;
  id v125;
  id v126;
  id v127;
  id v128;
  void *v129;
  void *v130;
  id obja;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  uint8_t buf[8];
  id v139;
  _BYTE v140[128];
  uint64_t v141;
  const __CFString *v142;
  uint64_t v143;
  const __CFString *v144;
  uint64_t v145;
  const __CFString *v146;
  uint64_t v147;
  const __CFString *v148;
  uint64_t v149;
  const __CFString *v150;
  uint64_t v151;
  void *v152;
  uint64_t v153;
  _QWORD v154[3];

  v154[1] = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  if (v14)
  {
    v139 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v14, 0, &v139);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v139;
  }
  else
  {
    v19 = 0;
    v20 = 0;
  }
  objc_msgSend(v19, "arrayForKey:", CFSTR("errors"));
  v21 = objc_claimAutoreleasedReturnValue();
  v133 = (void *)v21;
  if (v20 || (v26 = (void *)v21, !objc_msgSend(v19, "count")))
  {
    v22 = (void *)MEMORY[0x24BDD1540];
    v153 = *MEMORY[0x24BDD0FC8];
    v154[0] = CFSTR("Failed to parse JSON forecast data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v154, &v153, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v20, v23);
    v24 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v130 = v19;
  if (objc_msgSend(v26, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Server error %@"), v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x24BDD1540];
    v151 = *MEMORY[0x24BDD0BA0];
    v152 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "wf_errorWithCode:userInfo:", 17, v28);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v19 = v130;
    v24 = 0;
    goto LABEL_6;
  }
  v129 = (void *)objc_opt_new();
  IsRequestedInTypes = WFForecastTypeIsRequestedInTypes(2, a4);
  v128 = v17;
  if (a4 == 2)
  {
    v30 = v19;
  }
  else
  {
    if (!IsRequestedInTypes)
    {
      v31 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v19, "dictionaryForKey:", CFSTR("v3-wx-observations-current"));
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v30;
  if (!v30)
  {
LABEL_21:
    v33 = 0;
    goto LABEL_22;
  }
  -[WFWeatherChannelParserV3 _parseCurrentConditions:](self, "_parseCurrentConditions:", v30);
  v32 = objc_claimAutoreleasedReturnValue();
  if (!v32)
  {
    WFLogForCategory(7uLL);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.5(v34, v35, v36, v37, v38, v39, v40, v41);

    v42 = (void *)MEMORY[0x24BDD1540];
    v149 = *MEMORY[0x24BDD0BA0];
    v150 = CFSTR("Failed to parse current observations from response.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "wf_errorWithCode:userInfo:", 1, v43);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_21;
  }
  v33 = (void *)v32;
LABEL_22:
  if (WFForecastTypeIsRequestedInTypes(256, a4))
  {
    objc_msgSend(v130, "dictionaryForKey:", CFSTR("v3-links"));
    v44 = objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      v45 = (void *)v44;
      -[WFWeatherChannelParserV3 _parseWebLinks:intoWeatherConditions:](self, "_parseWebLinks:intoWeatherConditions:", v44, v33);

    }
  }

  objc_msgSend(v129, "setCurrentConditions:", v33);
  v46 = WFForecastTypeIsRequestedInTypes(32, a4);
  v127 = v18;
  if (a4 == 32)
  {
    v47 = v130;
  }
  else
  {
    if (!v46)
    {
      v48 = 0;
      v49 = 0;
      v17 = v128;
      goto LABEL_36;
    }
    objc_msgSend(v130, "dictionaryForKey:", CFSTR("v3-wx-conditions-historical-hourly-1day"));
    v47 = (id)objc_claimAutoreleasedReturnValue();
  }
  v48 = v47;
  v17 = v128;
  if (v47)
  {
    -[WFWeatherChannelParserV3 _parseLastTwentyFourHoursOfObservations:](self, "_parseLastTwentyFourHoursOfObservations:", v47);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v49, "count"))
    {
      v50 = v16;
      WFLogForCategory(7uLL);
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.4(v51, v52, v53, v54, v55, v56, v57, v58);

      v59 = (void *)MEMORY[0x24BDD1540];
      v147 = *MEMORY[0x24BDD0BA0];
      v148 = CFSTR("Failed to parse last twenty-four hours of observations from response.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "wf_errorWithCode:userInfo:", 1, v60);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v16 = v50;
      v18 = v127;
      v17 = v128;
    }
  }
  else
  {
    v49 = 0;
  }
LABEL_36:

  objc_msgSend(v129, "setLastTwentyFourHoursOfObservations:", v49);
  v61 = WFForecastTypeIsRequestedInTypes(4, a4);
  if (a4 == 4)
  {
    v62 = v130;
  }
  else
  {
    if (!v61)
    {
      v63 = 0;
      goto LABEL_46;
    }
    objc_msgSend(v130, "dictionaryForKey:", CFSTR("v3-wx-forecast-hourly-1day"));
    v62 = (id)objc_claimAutoreleasedReturnValue();
  }
  v63 = v62;
  if (!v62)
  {
LABEL_46:
    v64 = 0;
    goto LABEL_47;
  }
  -[WFWeatherChannelParserV3 _parseHourlyForecastedConditions:](self, "_parseHourlyForecastedConditions:", v62);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v64, "count"))
  {
    v65 = v16;
    WFLogForCategory(7uLL);
    v66 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.2(v66, v67, v68, v69, v70, v71, v72, v73);

    v74 = (void *)MEMORY[0x24BDD1540];
    v145 = *MEMORY[0x24BDD0BA0];
    v146 = CFSTR("Failed to parse daily forecasted conditions from response.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v146, &v145, 1);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "wf_errorWithCode:userInfo:", 1, v75);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v65;
    v18 = v127;
    v17 = v128;
  }
LABEL_47:

  objc_msgSend(v129, "setHourlyForecasts:", v64);
  v76 = WFForecastTypeIsRequestedInTypes(8, a4);
  if (a4 == 8)
  {
    v77 = v130;
  }
  else
  {
    if (!v76)
    {
      v78 = 0;
      goto LABEL_57;
    }
    objc_msgSend(v130, "dictionaryForKey:", CFSTR("v3-wx-forecast-daily-10day"));
    v77 = (id)objc_claimAutoreleasedReturnValue();
  }
  v78 = v77;
  if (!v77)
  {
LABEL_57:
    v79 = 0;
    goto LABEL_58;
  }
  -[WFWeatherChannelParserV3 _parseDailyForecastedConditions:](self, "_parseDailyForecastedConditions:", v77);
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v79, "count"))
  {
    v80 = v16;
    WFLogForCategory(7uLL);
    v81 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_ERROR))
      -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.2(v81, v82, v83, v84, v85, v86, v87, v88);

    v89 = (void *)MEMORY[0x24BDD1540];
    v143 = *MEMORY[0x24BDD0BA0];
    v144 = CFSTR("Failed to parse daily forecasted conditions from response.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v144, &v143, 1);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "wf_errorWithCode:userInfo:", 1, v90);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    v16 = v80;
    v18 = v127;
    v17 = v128;
  }
LABEL_58:

  objc_msgSend(v129, "setDailyForecasts:", v79);
  if (WFForecastTypeIsRequestedInTypes(1, a4))
  {
    v91 = v130;
    if (+[WFResponseParsingRules aqiEnabledByRules:forLocation:](WFResponseParsingRules, "aqiEnabledByRules:forLocation:", v18, v15))
    {
      -[WFWeatherChannelParserV3 parseAirQualityData:location:locale:error:](self, "parseAirQualityData:location:locale:error:", v130, v15, v16, a8);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v92 = 0;
    }
  }
  else
  {
    v92 = 0;
    v91 = v130;
  }
  objc_msgSend(v129, "setAirQualityObservations:", v92);

  v93 = WFForecastTypeIsRequestedInTypes(16, a4);
  if (a4 == 16)
  {
    v94 = v91;
LABEL_67:
    v95 = v94;
    goto LABEL_69;
  }
  if (v93)
  {
    objc_msgSend(v91, "dictionaryForKey:", CFSTR("v2idxPollenDaypart10"));
    v94 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_67;
  }
  v95 = 0;
LABEL_69:
  objc_msgSend(v95, "dictionaryForKey:", CFSTR("pollenForecast12hour"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  if (v96)
  {
    -[WFWeatherChannelParserV3 _parseDailyPollenForecastedConditions:](self, "_parseDailyPollenForecastedConditions:", v96);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v97, "count"))
    {
      WFLogForCategory(7uLL);
      v98 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
        -[WFWeatherChannelParserV3 parseForecastData:types:location:locale:date:error:rules:].cold.1(v98, v99, v100, v101, v102, v103, v104, v105);

      v106 = (void *)MEMORY[0x24BDD1540];
      v141 = *MEMORY[0x24BDD0BA0];
      v142 = CFSTR("Failed to parse daily pollen forecasted conditions from response.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "wf_errorWithCode:userInfo:", 1, v107);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v128;
    }
  }
  else
  {
    v97 = 0;
  }

  v24 = v129;
  objc_msgSend(v129, "setPollenForecasts:", v97);

  objc_msgSend(v129, "currentConditions");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v129, "dailyForecasts");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "count");

    if (v109)
    {
      v124 = v16;
      v126 = v14;
      WFLogForCategory(7uLL);
      v110 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21189A000, v110, OS_LOG_TYPE_INFO, "Found current conditions in response; let's try to update the high/low for our current conditions with the mat"
          "ching daily forecasted conditions.",
          buf,
          2u);
      }

      objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
      v111 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = v15;
      objc_msgSend(v15, "timeZone");
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v111, "setTimeZone:", v112);

      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("WFWeatherForecastDateComponent"));
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = 0u;
      v135 = 0u;
      v136 = 0u;
      v137 = 0u;
      objc_msgSend(v129, "dailyForecasts");
      obja = (id)objc_claimAutoreleasedReturnValue();
      v114 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
      if (v114)
      {
        v115 = v114;
        v116 = *(_QWORD *)v135;
        while (2)
        {
          for (i = 0; i != v115; ++i)
          {
            if (*(_QWORD *)v135 != v116)
              objc_enumerationMutation(obja);
            v118 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * i);
            objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("WFWeatherForecastDateComponent"));
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v111, "isDate:inSameDayAsDate:", v119, v113))
            {
              objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("WFWeatherHighTemperatureComponent"));
              v120 = (void *)objc_claimAutoreleasedReturnValue();
              if (v120)
              {
                objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("WFWeatherHighTemperatureComponent"));
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v122 = v23;
              }
              else
              {
                objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("WFWeatherHighTemperatureComponent"));
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                v122 = v118;
              }
              objc_msgSend(v122, "setObject:forKeyedSubscript:", v121, CFSTR("WFWeatherHighTemperatureComponent"));

              objc_msgSend(v118, "objectForKeyedSubscript:", CFSTR("WFWeatherLowTemperatureComponent"));
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v123, CFSTR("WFWeatherLowTemperatureComponent"));

              goto LABEL_93;
            }

          }
          v115 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v134, v140, 16);
          if (v115)
            continue;
          break;
        }
      }
LABEL_93:

      v15 = v125;
      v14 = v126;
      v16 = v124;
      v18 = v127;
      v17 = v128;
    }
    v24 = v129;
    v19 = v130;
  }
  else
  {
    v19 = v130;
  }
LABEL_6:

  return v24;
}

- (id)parseAirQualityData:(id)a3 location:(id)a4 locale:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
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
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *log;
  void *v41;
  id v42;
  uint64_t v43;
  const __CFString *v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v9;
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("v3-wx-globalAirQuality"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("v3-wx-globalAirQuality"));
      v13 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v13;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("globalairquality"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v14, "count"))
  {
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setLocale:", v10);
    v16 = (void *)objc_opt_new();
    objc_msgSend(v15, "setDate:", v16);

    objc_msgSend(v14, "numberForKey:", CFSTR("expireTimeGmt"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
    {
      v19 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v19, "dateWithTimeIntervalSince1970:");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setExpirationDate:", v20);

    }
    objc_msgSend(v14, "stringForKey:", CFSTR("source"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setProvider:", v21);

    objc_msgSend(v14, "stringForKey:", CFSTR("disclaimer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setLocalizedDisclaimer:", v22);

    v42 = v10;
    objc_msgSend(v10, "countryCode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AqiScaleForCountryCode(v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "numberForKey:", CFSTR("airQualityIndex"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v24;
    if (v25)
    {
      objc_msgSend(v14, "stringForKey:", CFSTR("airQualityCategory"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        objc_msgSend(v14, "numberForKey:", CFSTR("airQualityCategoryIndex"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v27)
        {
          objc_msgSend(v15, "setLocalizedAirQualityIndex:", objc_msgSend(v25, "unsignedIntegerValue"));
          objc_msgSend(v24, "scaleCategoryForCategoryIndex:localizedCategoryDescription:", objc_msgSend(v27, "unsignedIntegerValue"), v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setLocalizedAirQualityScaleCategory:", v28);

          objc_msgSend(v15, "setCategory:", objc_msgSend(v27, "integerValue"));
        }
      }
      else
      {
        v27 = 0;
      }
    }
    else
    {
      v27 = 0;
      v26 = 0;
    }
    objc_msgSend(v14, "dictionaryForKey:", CFSTR("pollutants"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherChannelParserV3 _parsePollutants:](self, "_parsePollutants:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v31, "allValues");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setPollutants:", v32);

    objc_msgSend(v14, "stringForKey:", CFSTR("primaryPollutant"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (v33)
    {
      objc_msgSend(v31, "objectForKeyedSubscript:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        objc_msgSend(v15, "setPrimaryPollutant:", v34);
      }
      else
      {
        WFLogForCategory(7uLL);
        log = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "pollutants");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_localizedName);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "valueForKeyPath:", v38);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "componentsJoinedByString:", CFSTR(", "));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v46 = v33;
          v47 = 2114;
          v48 = v36;
          _os_log_impl(&dword_21189A000, log, OS_LOG_TYPE_DEFAULT, "Did not find primary pollutant %{public}@ in list of pollutants: %{public}@", buf, 0x16u);

        }
      }

    }
    v10 = v42;
  }
  else
  {
    v29 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0FC8];
    v44 = CFSTR("Failed to parse JSON air quality data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "wf_errorWithCode:userInfo:", 1, v18);
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)parseForecastData:(uint64_t)a3 types:(uint64_t)a4 location:(uint64_t)a5 locale:(uint64_t)a6 date:(uint64_t)a7 error:(uint64_t)a8 rules:.cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_21189A000, a1, a3, "%{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
