@implementation WFWeatherHistorical1DayParserV2

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherHistorical1DayParserV2 parseForecastData:types:location:locale:date:error:rules:](self, "parseForecastData:types:location:locale:date:error:rules:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v13 = a5;
  v14 = a7;
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (v15)
  {
    -[WFWeatherHistorical1DayParserV2 parseHistoricalForecast:location:date:error:](self, "parseHistoricalForecast:location:date:error:", v15, v13, v14, a8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    WFLogForCategory(7uLL);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[WFWeatherHistorical1DayParserV2 parseForecastData:types:location:locale:date:error:rules:].cold.1((uint64_t)v16, v18);

    if (v16)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v23 = *MEMORY[0x24BDD0FC8];
      v24[0] = CFSTR("Failed to parse JSON historical 1 day forecast data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v16, v20);
      *a8 = (id)objc_claimAutoreleasedReturnValue();

    }
    v17 = 0;
  }

  return v17;
}

- (id)parseHistoricalForecast:(id)a3 location:(id)a4 date:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v9 = a4;
  v10 = a5;
  objc_msgSend(a3, "arrayForKey:", CFSTR("observations"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[WFWeatherHistorical1DayParserV2 parseHistoricalForecastConditionsFromObservations:forDate:](self, "parseHistoricalForecastConditionsFromObservations:forDate:", v11, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentConditions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLocation:", v9);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)parseHistoricalForecastConditionsFromObservations:(id)a3 forDate:(id)a4
{
  id v6;
  id v7;
  WFParsedForecastData *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
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
  WFTemperature *v27;
  WFTemperature *v28;
  void *v29;
  WFTemperature *v30;
  _QWORD v32[4];
  id v33;
  WFWeatherHistorical1DayParserV2 *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD v49[4];
  _QWORD v50[4];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(WFParsedForecastData);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v11 = v10;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x2020000000;
  v50[3] = 0x7FFFFFFFFFFFFFFFLL;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  v45 = 0;
  v46 = (double *)&v45;
  v47 = 0x2020000000;
  v48 = 0xC061800000000000;
  v41 = 0;
  v42 = (double *)&v41;
  v43 = 0x2020000000;
  v44 = 0x4061800000000000;
  v32[0] = MEMORY[0x24BDAC760];
  v32[1] = 3221225472;
  v32[2] = __93__WFWeatherHistorical1DayParserV2_parseHistoricalForecastConditionsFromObservations_forDate___block_invoke;
  v32[3] = &unk_24CCA22F8;
  v12 = v9;
  v33 = v12;
  v34 = self;
  v40 = v11;
  v35 = v50;
  v36 = &v51;
  v37 = &v45;
  v38 = &v41;
  v39 = v49;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v32);
  -[WFParsedForecastData setHourlyForecasts:](v8, "setHourlyForecasts:", v12);
  objc_msgSend(v12, "objectAtIndexedSubscript:", v52[3]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParsedForecastData setCurrentConditions:](v8, "setCurrentConditions:", v13);

  -[WFParsedForecastData currentConditions](v8, "currentConditions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("WFWeatherForecastDateComponent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[WFParsedForecastData currentConditions](v8, "currentConditions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, CFSTR("WFWeatherForecastDateComponent"));

  }
  objc_msgSend(v6, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("max_temp"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("min_temp"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v27 = [WFTemperature alloc];
      objc_msgSend(v18, "doubleValue");
      v28 = -[WFTemperature initWithTemperatureUnit:value:](v27, "initWithTemperatureUnit:value:", 2);
      -[WFParsedForecastData currentConditions](v8, "currentConditions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setObject:forKeyedSubscript:", v28, CFSTR("WFWeatherHighTemperatureComponent"));

      v30 = [WFTemperature alloc];
      objc_msgSend(v20, "doubleValue");
      v25 = -[WFTemperature initWithTemperatureUnit:value:](v30, "initWithTemperatureUnit:value:", 2);
      -[WFParsedForecastData currentConditions](v8, "currentConditions");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("WFWeatherLowTemperatureComponent"));
      goto LABEL_8;
    }
  }
  if (v46[3] >= v42[3])
  {
    v21 = [WFTemperature alloc];
    v22 = -[WFTemperature initWithTemperatureUnit:value:](v21, "initWithTemperatureUnit:value:", 2, v46[3]);
    -[WFParsedForecastData currentConditions](v8, "currentConditions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("WFWeatherHighTemperatureComponent"));

    v24 = [WFTemperature alloc];
    v25 = -[WFTemperature initWithTemperatureUnit:value:](v24, "initWithTemperatureUnit:value:", 2, v42[3]);
    -[WFParsedForecastData currentConditions](v8, "currentConditions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, CFSTR("WFWeatherLowTemperatureComponent"));
LABEL_8:

  }
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v50, 8);
  _Block_object_dispose(&v51, 8);

  return v8;
}

void __93__WFWeatherHistorical1DayParserV2_parseHistoricalForecastConditionsFromObservations_forDate___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "parseForecastConditionsFromObservations:", v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

  objc_msgSend(v20, "numberForKey:", CFSTR("valid_time_gmt"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = (uint64_t)vabdd_f64(*(double *)(a1 + 88), (double)objc_msgSend(v7, "integerValue"));
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(_QWORD *)(v10 + 24) > v9)
    {
      *(_QWORD *)(v10 + 24) = v9;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    }
  }
  objc_msgSend(v20, "numberForKey:", CFSTR("temp"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    objc_msgSend(v11, "doubleValue");
    if (v13 >= v14)
      v14 = v13;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v14;
    v15 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    objc_msgSend(v12, "doubleValue");
    if (v15 < v16)
      v16 = v15;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v16;
  }
  objc_msgSend(v20, "numberForKey:", CFSTR("precip_hrly"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    objc_msgSend(v17, "doubleValue");
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v19
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                            + 24);
  }

}

- (id)parseForecastConditionsFromObservations:(id)a3
{
  id v3;
  WFWeatherConditions *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  WFTemperature *v14;
  WFTemperature *v15;
  void *v16;
  void *v17;
  WFTemperature *v18;
  WFTemperature *v19;
  void *v20;
  WFTemperature *v21;
  WFTemperature *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = a3;
  v4 = objc_alloc_init(WFWeatherConditions);
  objc_msgSend(v3, "numberForKey:", CFSTR("valid_time_gmt"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v5, "unsignedIntegerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v7, CFSTR("WFWeatherForecastDateComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("expire_time_gmt"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v8, "unsignedIntegerValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v9, CFSTR("WFWeatherForecastExpirationDateComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("wx_icon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v10, "unsignedIntegerValue")));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, CFSTR("WFWeatherConditionComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("rh"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v12, CFSTR("WFWeatherHumidityComponent"));

  objc_msgSend(v3, "numberForKey:", CFSTR("dewPt"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, CFSTR("WFWeatherDewpointComponent"));
    v14 = [WFTemperature alloc];
    objc_msgSend(v13, "doubleValue");
    v15 = -[WFTemperature initWithTemperatureUnit:value:](v14, "initWithTemperatureUnit:value:", 2);
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, CFSTR("WFWeatherDewpointTemperatureComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("precip_hrly"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16
    || (objc_msgSend(v3, "numberForKey:", CFSTR("precip_total")),
        (v16 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v16, CFSTR("WFWeatherPrecipitationAmountComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("temp"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = [WFTemperature alloc];
    objc_msgSend(v17, "doubleValue");
    v19 = -[WFTemperature initWithTemperatureUnit:value:](v18, "initWithTemperatureUnit:value:", 2);
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v19, CFSTR("WFWeatherTemperatureComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("feels_like"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = [WFTemperature alloc];
    objc_msgSend(v20, "doubleValue");
    v22 = -[WFTemperature initWithTemperatureUnit:value:](v21, "initWithTemperatureUnit:value:", 2);
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v22, CFSTR("WFWeatherFeelsLikeTemperatureComponent"));

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("uv_index"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v23, CFSTR("WFWeatherUVIndexComponent"));

  objc_msgSend(v3, "numberForKey:", CFSTR("vis"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v24, CFSTR("WFWeatherVisibilityComponent"));
  objc_msgSend(v3, "numberForKey:", CFSTR("wdir"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v25, CFSTR("WFWeatherWindDirectionComponent"));

  objc_msgSend(v3, "numberForKey:", CFSTR("wspd"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v26, CFSTR("WFWeatherWindSpeedComponent"));
  objc_msgSend(v3, "numberForKey:", CFSTR("pressure"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v27, CFSTR("WFWeatherPressureComponent"));
  objc_msgSend(v3, "numberForKey:", CFSTR("pressure_tend"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (v28)
    -[WFWeatherConditions setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v28, CFSTR("WFWeatherPressureTrendComponent"));

  return v4;
}

- (void)parseForecastData:(uint64_t)a1 types:(NSObject *)a2 location:locale:date:error:rules:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21189A000, a2, OS_LOG_TYPE_ERROR, "Failed to parse JSON historical 1 day forecast data with error \"%@\", (uint8_t *)&v2, 0xCu);
}

@end
