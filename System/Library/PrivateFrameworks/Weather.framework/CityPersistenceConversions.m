@implementation CityPersistenceConversions

+ (id)cityFromDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  City *v7;
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
  uint64_t v47;
  void *v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  float v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t i;
  void *v80;
  void *v82;
  void *v83;
  void *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  _BYTE v91[128];
  _QWORD v92[5];

  v92[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v92[0] = CFSTR("Name");
  v92[1] = CFSTR("Lat");
  v92[2] = CFSTR("Lon");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v92, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = MEMORY[0x24BDAC760];
  v89[1] = 3221225472;
  v89[2] = __49__CityPersistenceConversions_cityFromDictionary___block_invoke;
  v89[3] = &unk_24DD9DBB0;
  v6 = v4;
  v90 = v6;
  if (!objc_msgSend(v5, "na_all:", v89))
  {
    v7 = 0;
    goto LABEL_28;
  }
  v84 = v5;
  v7 = objc_alloc_init(City);
  objc_msgSend(v6, "objectForKey:", CFSTR("Name"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setName:](v7, "setName:", v8);

  objc_msgSend(v6, "objectForKey:", CFSTR("Lat"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  -[City setLatitude:](v7, "setLatitude:");

  objc_msgSend(v6, "objectForKey:", CFSTR("Lon"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  -[City setLongitude:](v7, "setLongitude:");

  objc_msgSend(v6, "objectForKey:", CFSTR("Country"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setISO3166CountryAbbreviation:](v7, "setISO3166CountryAbbreviation:", v11);

  v12 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "objectForKey:", CFSTR("Link"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setLink:](v7, "setLink:", v14);

  v15 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v6, "objectForKey:", CFSTR("Deeplink"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setDeeplink:](v7, "setDeeplink:", v17);

  objc_msgSend(v6, "objectForKey:", CFSTR("UpdateStatus"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setLastUpdateStatus:](v7, "setLastUpdateStatus:", (int)objc_msgSend(v18, "intValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("UpateTime"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setUpdateTime:](v7, "setUpdateTime:", v19);

  objc_msgSend(v6, "objectForKey:", CFSTR("WindChill"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  -[City setWindChill:](v7, "setWindChill:");

  objc_msgSend(v6, "objectForKey:", CFSTR("HeatIndex"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "floatValue");
  -[City setHeatIndex:](v7, "setHeatIndex:");

  v22 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("FeelsLike"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "temperatureFromDictionaryRepresentation:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setFeelsLike:](v7, "setFeelsLike:", v24);

  objc_msgSend(v6, "objectForKey:", CFSTR("DewPoint"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "floatValue");
  -[City setDewPoint:](v7, "setDewPoint:");

  objc_msgSend(v6, "objectForKey:", CFSTR("WindSpeed"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  -[City setWindSpeed:](v7, "setWindSpeed:");

  objc_msgSend(v6, "objectForKey:", CFSTR("WindDirection"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "floatValue");
  -[City setWindDirection:](v7, "setWindDirection:");

  objc_msgSend(v6, "objectForKey:", CFSTR("Humidity"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "floatValue");
  -[City setHumidity:](v7, "setHumidity:");

  objc_msgSend(v6, "objectForKey:", CFSTR("Visibility"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  -[City setVisibility:](v7, "setVisibility:");

  objc_msgSend(v6, "objectForKey:", CFSTR("Pressure"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  -[City setPressure:](v7, "setPressure:");

  objc_msgSend(v6, "objectForKey:", CFSTR("PressureRising"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setPressureRising:](v7, "setPressureRising:", objc_msgSend(v31, "integerValue"));

  v32 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKey:", CFSTR("Temperature"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "temperatureFromDictionaryRepresentation:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setTemperature:](v7, "setTemperature:", v34);

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("BigIcon"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setConditionCode:](v7, "setConditionCode:", objc_msgSend(v35, "unsignedIntValue"));

  }
  else
  {
    -[City setConditionCode:](v7, "setConditionCode:", 3200);
  }
  objc_msgSend(v6, "objectForKey:", CFSTR("ObservationTime"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setObservationTime:](v7, "setObservationTime:", objc_msgSend(v36, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("SunsetTime"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setSunsetTime:](v7, "setSunsetTime:", objc_msgSend(v37, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("SunriseTime"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setSunriseTime:](v7, "setSunriseTime:", objc_msgSend(v38, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("MoonPhase"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setMoonPhase:](v7, "setMoonPhase:", objc_msgSend(v39, "unsignedIntValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("AirQualityIdxKey"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setAirQualityIdx:](v7, "setAirQualityIdx:", v40);

  objc_msgSend(v6, "objectForKey:", CFSTR("AirQualityCategoryKey"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setAirQualityCategory:](v7, "setAirQualityCategory:", v41);

  objc_msgSend(v6, "objectForKey:", CFSTR("AirQualitySignificance"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setAirQualitySignificance:](v7, "setAirQualitySignificance:", objc_msgSend(v42, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKey:", CFSTR("CityWeatherDisplayName"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setWeatherDisplayName:](v7, "setWeatherDisplayName:", v43);

  objc_msgSend(v6, "objectForKey:", CFSTR("CityWeatherLocationName"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setWeatherLocationName:](v7, "setWeatherLocationName:", v44);

  objc_msgSend(v6, "objectForKey:", CFSTR("CitySearchTitle"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setSearchTitle:](v7, "setSearchTitle:", v45);

  objc_msgSend(v6, "objectForKey:", CFSTR("CitySearchSubtitle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setSearchSubtitle:](v7, "setSearchSubtitle:", v46);

  objc_msgSend(v6, "objectForKey:", CFSTR("TimeZone"));
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneWithName:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setTimeZone:](v7, "setTimeZone:", v48);

  }
  -[City location](v7, "location");
  v49 = objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    v50 = (void *)v49;
    -[City name](v7, "name");
    v51 = objc_claimAutoreleasedReturnValue();
    if (!v51)
    {
LABEL_14:

      goto LABEL_15;
    }
    v52 = (void *)v51;
    -[City timeZone](v7, "timeZone");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      v50 = (void *)objc_opt_new();
      -[City name](v7, "name");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setDisplayName:", v54);

      -[City location](v7, "location");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setGeoLocation:", v55);

      -[City weatherDisplayName](v7, "weatherDisplayName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setWeatherDisplayName:", v56);

      -[City weatherLocationName](v7, "weatherLocationName");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setWeatherLocationName:", v57);

      -[City ISO3166CountryAbbreviation](v7, "ISO3166CountryAbbreviation");
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v58)
      {
        -[City ISO3166CountryAbbreviation](v7, "ISO3166CountryAbbreviation");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setCountryAbbreviation:", v59);

      }
      -[City timeZone](v7, "timeZone");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setTimeZone:", v60);

      -[City setWfLocation:](v7, "setWfLocation:", v50);
      goto LABEL_14;
    }
  }
LABEL_15:
  objc_msgSend(v6, "objectForKey:", CFSTR("CityTimeZoneUpdateDateKey"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = objc_msgSend(v61, "unsignedIntegerValue");

  v83 = (void *)v47;
  if (v62)
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)v62);
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setTimeZoneUpdateDate:](v7, "setTimeZoneUpdateDate:", v82);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Past24HoursPrecipitation"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "floatValue");
  -[City setPrecipitationPast24Hours:](v7, "setPrecipitationPast24Hours:", v64);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("UVIndex"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setUVIndex:](v7, "setUVIndex:", objc_msgSend(v65, "unsignedIntegerValue"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DayForecasts"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "populateCity:withDayForecastDictionaries:", v7, v66);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("HourlyForecasts"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "populateCity:withHourlyForecastDictionaries:", v7, v67);

  v68 = (void *)objc_opt_class();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AQIScaleCategory"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "scaleCategoryFromDictionaryRepresentation:", v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[City setAirQualityScaleCategory:](v7, "setAirQualityScaleCategory:", v70);

  objc_msgSend(v6, "objectForKey:", CFSTR("NextHourPrecipitation"));
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (v71)
  {
    v72 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC21E8]), "initWithDictionary:", v71);
    -[City setNextHourPrecipitation:](v7, "setNextHourPrecipitation:", v72);

  }
  objc_msgSend(v6, "objectForKey:", CFSTR("SevereWeatherEvents"));
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v75 = v73;
  v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
  if (v76)
  {
    v77 = v76;
    v78 = *(_QWORD *)v86;
    do
    {
      for (i = 0; i != v77; ++i)
      {
        if (*(_QWORD *)v86 != v78)
          objc_enumerationMutation(v75);
        v80 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2218]), "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i));
        objc_msgSend(v74, "addObject:", v80);

      }
      v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
    }
    while (v77);
  }

  -[City updateCityForSevereWeatherEvents:](v7, "updateCityForSevereWeatherEvents:", v74);
  v5 = v84;
LABEL_28:

  return v7;
}

uint64_t __49__CityPersistenceConversions_cityFromDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (void)populateCity:(id)a3 withDayForecastDictionaries:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  WADayForecast *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  id v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v28;
    do
    {
      v11 = 0;
      v12 = v9;
      do
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v11);
        v14 = objc_alloc_init(WADayForecast);
        objc_msgSend(v13, "objectForKey:", CFSTR("ForecastDayOfWeek"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WADayForecast setDayOfWeek:](v14, "setDayOfWeek:", objc_msgSend(v15, "unsignedIntValue"));

        -[WADayForecast setDayNumber:](v14, "setDayNumber:", v12 + v11);
        v16 = (void *)objc_opt_class();
        objc_msgSend(v13, "objectForKey:", CFSTR("High"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "temperatureFromDictionaryRepresentation:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[WADayForecast setHigh:](v14, "setHigh:", v18);

        v19 = (void *)objc_opt_class();
        objc_msgSend(v13, "objectForKey:", CFSTR("Low"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "temperatureFromDictionaryRepresentation:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[WADayForecast setLow:](v14, "setLow:", v21);

        objc_msgSend(v13, "objectForKey:", CFSTR("Precipitation"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "floatValue");
        -[WADayForecast setPercentPrecipitation:](v14, "setPercentPrecipitation:", v23);

        objc_msgSend(v13, "objectForKey:", CFSTR("Icon"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[WADayForecast setIcon:](v14, "setIcon:", objc_msgSend(v24, "unsignedIntValue"));

        objc_msgSend(v6, "na_safeAddObject:", v14);
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v9 = v12 + v11;
    }
    while (v8);
  }

  objc_msgSend(v25, "setDayForecasts:", v6);
}

+ (void)populateCity:(id)a3 withHourlyForecastDictionaries:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  WAHourlyForecast *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  float v19;
  id v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v20 = a3;
  v5 = a4;
  v6 = (void *)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v23;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        v12 = objc_alloc_init(WAHourlyForecast);
        v13 = (void *)objc_opt_class();
        objc_msgSend(v11, "objectForKey:", CFSTR("Temperature"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "temperatureFromDictionaryRepresentation:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[WAHourlyForecast setTemperature:](v12, "setTemperature:", v15);

        objc_msgSend(v11, "objectForKey:", CFSTR("Time24"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[WAHourlyForecast setTime:](v12, "setTime:", v16);

        objc_msgSend(v11, "objectForKey:", CFSTR("Condition"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WAHourlyForecast setConditionCode:](v12, "setConditionCode:", objc_msgSend(v17, "integerValue"));

        objc_msgSend(v11, "objectForKey:", CFSTR("Precipitation"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "floatValue");
        -[WAHourlyForecast setPercentPrecipitation:](v12, "setPercentPrecipitation:", v19);

        objc_msgSend(v6, "na_safeAddObject:", v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v8);
  }

  objc_msgSend(v20, "setHourlyForecasts:", v6);
}

+ (BOOL)isCityValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  CLLocationCoordinate2D v8;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "coordinate"), CLLocationCoordinate2DIsValid(v8)))
  {
    objc_msgSend(v4, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)dictionaryRepresentationOfScaleCategory:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_7;
  objc_msgSend(v3, "localizedCategoryDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || !objc_msgSend(v4, "categoryIndex"))
  {

    goto LABEL_7;
  }
  objc_msgSend(v4, "scaleClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v12[0] = CFSTR("AQICategoryDescription");
  objc_msgSend(v4, "localizedCategoryDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = CFSTR("AQICategoryIndex");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "categoryIndex"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  v12[2] = CFSTR("AQIScaleClass");
  objc_msgSend(v4, "scaleClassName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v10;
}

+ (id)scaleCategoryFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  NSString *v10;
  objc_class *v11;
  id v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AQICategoryIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AQICategoryDescription"));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = &stru_24DD9EDF8;
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AQIScaleClass"));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  v11 = NSClassFromString(v10);
  v12 = objc_alloc_init(v11);
  objc_msgSend(v12, "scaleCategoryForCategoryIndex:localizedCategoryDescription:", v5, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)dictionaryRepresentationOfTemperature:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v3 = a3;
    NSStringFromWFTemperatureUnit();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v4;
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "fahrenheit");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v6;
    NSStringFromWFTemperatureUnit();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v7;
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "celsius");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v9;
    NSStringFromWFTemperatureUnit();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v10;
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "kelvin");
    v13 = v12;

    objc_msgSend(v11, "numberWithDouble:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

+ (id)temperatureFromDictionaryRepresentation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  double v12;

  v3 = a3;
  if (!v3)
    goto LABEL_9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    WALogForCategory(1);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[CityPersistenceConversions temperatureFromDictionaryRepresentation:].cold.1(v11);

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC2220]), "initWithTemperatureUnit:value:", 2, v12);
      goto LABEL_10;
    }
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  if (!objc_msgSend(v3, "count"))
    goto LABEL_9;
  v4 = (void *)objc_opt_new();
  NSStringFromWFTemperatureUnit();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v4, "setCelsius:");

  NSStringFromWFTemperatureUnit();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  objc_msgSend(v4, "setKelvin:");

  NSStringFromWFTemperatureUnit();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v4, "setFahrenheit:");

LABEL_10:
  return v4;
}

+ (id)dictionaryRepresentationOfCity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(a1, "isCityValid:", v4))
  {
    objc_msgSend(a1, "weatherDetailsDictionaryFromCity:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "dayForecastDictionariesFromCity:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v6, CFSTR("DayForecasts"));

    objc_msgSend(a1, "hourlyForecastDictionariesFromCity:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v7, CFSTR("HourlyForecasts"));

    objc_msgSend(v4, "nextHourPrecipitation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "nextHourPrecipitation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("NextHourPrecipitation"));

    }
    v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v4, "severeWeatherEvents", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "dictionaryRepresentation");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    if (objc_msgSend(v11, "count"))
      objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("SevereWeatherEvents"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)cityDictionaryHasValidCoordinates:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  BOOL v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("Lat"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Lon"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5 && ((objc_msgSend(v4, "doubleValue"), v7 != 0.0) || (objc_msgSend(v6, "doubleValue"), v8 != 0.0)))
  {
    v10 = 1;
  }
  else
  {
    WALogForCategory(5);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v3;
      _os_log_impl(&dword_21AAEC000, v9, OS_LOG_TYPE_DEFAULT, "Not loading city due to invalid coordinates: %@", (uint8_t *)&v12, 0xCu);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)dayForecastDictionariesFromCity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  if (objc_msgSend(a1, "isCityValid:", v4))
  {
    objc_msgSend(v4, "dayForecasts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __62__CityPersistenceConversions_dayForecastDictionariesFromCity___block_invoke;
    v8[3] = &__block_descriptor_40_e23__16__0__WADayForecast_8l;
    v8[4] = a1;
    objc_msgSend(v5, "na_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __62__CityPersistenceConversions_dayForecastDictionariesFromCity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v2 = (void *)MEMORY[0x24BDBCED8];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "high");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentationOfTemperature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("High"));

  v8 = (void *)objc_opt_class();
  objc_msgSend(v3, "low");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentationOfTemperature:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v10, CFSTR("Low"));

  v11 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "percentPrecipitation");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v12, CFSTR("Precipitation"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "icon"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v13, CFSTR("Icon"));

  v14 = (void *)MEMORY[0x24BDD16E0];
  v15 = objc_msgSend(v3, "dayOfWeek");

  objc_msgSend(v14, "numberWithUnsignedInteger:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v16, CFSTR("ForecastDayOfWeek"));

  return v4;
}

+ (id)hourlyForecastDictionariesFromCity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  if (objc_msgSend(a1, "isCityValid:", v4))
  {
    objc_msgSend(v4, "hourlyForecasts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __65__CityPersistenceConversions_hourlyForecastDictionariesFromCity___block_invoke;
    v8[3] = &__block_descriptor_40_e40___NSDictionary_16__0__WAHourlyForecast_8l;
    v8[4] = a1;
    objc_msgSend(v5, "na_map:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __65__CityPersistenceConversions_hourlyForecastDictionariesFromCity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;

  v2 = (void *)MEMORY[0x24BDBCED8];
  v3 = a2;
  objc_msgSend(v2, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_class();
  objc_msgSend(v3, "temperature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentationOfTemperature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v7, CFSTR("Temperature"));

  objc_msgSend(v3, "time");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v8, CFSTR("Time24"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v3, "conditionCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v9, CFSTR("Condition"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "percentPrecipitation");
  v12 = v11;

  objc_msgSend(v10, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "na_safeSetObject:forKey:", v13, CFSTR("Precipitation"));

  return v4;
}

+ (id)weatherDetailsDictionaryFromCity:(id)a3
{
  id v4;
  void *v5;
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
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  char v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;

  v4 = a3;
  if (objc_msgSend(a1, "isCityValid:", v4))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v6, CFSTR("Name"));

    objc_msgSend(v4, "ISO3166CountryAbbreviation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v7, CFSTR("Country"));

    objc_msgSend(v4, "link");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "absoluteString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v9, CFSTR("Link"));

    objc_msgSend(v4, "deeplink");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "absoluteString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v11, CFSTR("Deeplink"));

    v12 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "windChill");
    objc_msgSend(v12, "numberWithFloat:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v13, CFSTR("WindChill"));

    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "heatIndex");
    objc_msgSend(v14, "numberWithFloat:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v15, CFSTR("HeatIndex"));

    v16 = (void *)objc_opt_class();
    objc_msgSend(v4, "feelsLike");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentationOfTemperature:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v18, CFSTR("FeelsLike"));

    v19 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "dewPoint");
    objc_msgSend(v19, "numberWithFloat:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v20, CFSTR("DewPoint"));

    v21 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "windSpeed");
    objc_msgSend(v21, "numberWithFloat:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v22, CFSTR("WindSpeed"));

    v23 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "windDirection");
    objc_msgSend(v23, "numberWithFloat:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v24, CFSTR("WindDirection"));

    v25 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "humidity");
    objc_msgSend(v25, "numberWithFloat:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v26, CFSTR("Humidity"));

    v27 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "visibility");
    objc_msgSend(v27, "numberWithFloat:");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v28, CFSTR("Visibility"));

    v29 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "pressure");
    objc_msgSend(v29, "numberWithFloat:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v30, CFSTR("Pressure"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "pressureRising"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v31, CFSTR("PressureRising"));

    v32 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "latitude");
    objc_msgSend(v32, "numberWithDouble:");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v33, CFSTR("Lat"));

    v34 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "longitude");
    objc_msgSend(v34, "numberWithDouble:");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v35, CFSTR("Lon"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "lastUpdateStatus"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v36, CFSTR("UpdateStatus"));

    objc_msgSend(v4, "updateTime");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v5, "na_safeSetObject:forKey:", v37, CFSTR("UpateTime"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", 0.0);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "na_safeSetObject:forKey:", v38, CFSTR("UpateTime"));

    }
    v39 = (void *)objc_opt_class();
    objc_msgSend(v4, "temperature");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "dictionaryRepresentationOfTemperature:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v41, CFSTR("Temperature"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v4, "conditionCode"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v42, CFSTR("BigIcon"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "observationTime"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v43, CFSTR("ObservationTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "sunsetTime"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v44, CFSTR("SunsetTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "sunriseTime"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v45, CFSTR("SunriseTime"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "moonPhase"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v46, CFSTR("MoonPhase"));

    objc_msgSend(v4, "airQualityIdx");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v47, CFSTR("AirQualityIdxKey"));

    objc_msgSend(v4, "airQualityCategory");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v48, CFSTR("AirQualityCategoryKey"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "airQualitySignificance"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v49, CFSTR("AirQualitySignificance"));

    objc_msgSend(v4, "weatherDisplayName");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v50, CFSTR("CityWeatherDisplayName"));

    objc_msgSend(v4, "weatherLocationName");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v51, CFSTR("CityWeatherLocationName"));

    objc_msgSend(v4, "searchTitle");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v52, CFSTR("CitySearchTitle"));

    objc_msgSend(v4, "searchSubtitle");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v53, CFSTR("CitySearchSubtitle"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "uvIndex"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v54, CFSTR("UVIndex"));

    v55 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "precipitationPast24Hours");
    objc_msgSend(v55, "numberWithDouble:");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v56, CFSTR("Past24HoursPrecipitation"));

    objc_msgSend(v4, "timeZone");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
    {
      objc_msgSend(v4, "timeZone");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "name");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "na_safeSetObject:forKey:", v59, CFSTR("TimeZone"));

    }
    objc_msgSend(v4, "timeZoneUpdateDate");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v4, "timeZoneUpdateDate");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v61, "isEqualToDate:", v62);

      if ((v63 & 1) != 0)
      {
        v60 = 0;
      }
      else
      {
        v64 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v4, "timeZoneUpdateDate");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "timeIntervalSince1970");
        objc_msgSend(v64, "numberWithDouble:");
        v60 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(v5, "na_safeSetObject:forKey:", v60, CFSTR("CityTimeZoneUpdateDateKey"));
    v66 = (void *)objc_opt_class();
    objc_msgSend(v4, "airQualityScaleCategory");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "dictionaryRepresentationOfScaleCategory:", v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "na_safeSetObject:forKey:", v68, CFSTR("AQIScaleCategory"));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)cityFromCloudDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  City *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BEC2158];
  v5 = *MEMORY[0x24BEC2148];
  v18[0] = *MEMORY[0x24BEC2158];
  v18[1] = v5;
  v6 = *MEMORY[0x24BEC2150];
  v18[2] = *MEMORY[0x24BEC2150];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __54__CityPersistenceConversions_cityFromCloudDictionary___block_invoke;
  v16[3] = &unk_24DD9DBB0;
  v8 = v3;
  v17 = v8;
  if (objc_msgSend(v7, "na_all:", v16))
  {
    v9 = objc_alloc_init(City);
    objc_msgSend(v8, "objectForKeyedSubscript:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setName:](v9, "setName:", v10);

    objc_msgSend(v8, "objectForKeyedSubscript:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    -[City setLatitude:](v9, "setLatitude:");

    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    -[City setLongitude:](v9, "setLongitude:");

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BEC2168]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setSearchTitle:](v9, "setSearchTitle:", v13);

    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BEC2160]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setSearchSubtitle:](v9, "setSearchSubtitle:", v14);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __54__CityPersistenceConversions_cityFromCloudDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v3);

  return v5;
}

+ (id)cloudDictionaryRepresentationOfCity:(id)a3
{
  id v3;
  double v4;
  double v5;
  void *v6;
  void *v8;
  uint64_t v9;
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
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isLocalWeatherCity") & 1) != 0
    || (objc_msgSend(v3, "latitude"), v4 == 0.0)
    || (objc_msgSend(v3, "longitude"), v5 == 0.0)
    || (objc_msgSend(v3, "name"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "length"),
        v8,
        !v9))
  {
    v6 = 0;
  }
  else
  {
    v20[0] = *MEMORY[0x24BEC2158];
    objc_msgSend(v3, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v20[1] = *MEMORY[0x24BEC2148];
    v11 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "latitude");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v12;
    v20[2] = *MEMORY[0x24BEC2150];
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v3, "longitude");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[2] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v3, "searchTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v3, "searchTitle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BEC2168]);

    }
    objc_msgSend(v3, "searchSubtitle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v3, "searchSubtitle");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BEC2160]);

    }
  }

  return v6;
}

+ (id)cityFromALCity:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  float v6;
  float v7;
  City *v8;
  void *v10;
  float v11;
  float v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5 || (objc_msgSend(v3, "latitude"), v6 == 0.0) || (objc_msgSend(v3, "longitude"), v7 == 0.0))
  {
    v8 = 0;
  }
  else
  {
    v8 = objc_alloc_init(City);
    objc_msgSend(v3, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setName:](v8, "setName:", v10);

    objc_msgSend(v3, "latitude");
    -[City setLatitude:](v8, "setLatitude:", v11);
    objc_msgSend(v3, "longitude");
    -[City setLongitude:](v8, "setLongitude:", v12);
    objc_msgSend(v3, "localeCode");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[City setISO3166CountryAbbreviation:](v8, "setISO3166CountryAbbreviation:", v13);

  }
  return v8;
}

+ (id)cloudDictionaryRepresentationOfALCity:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  double v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v14[0] = *MEMORY[0x24BEC2158];
  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v4;
  v14[1] = *MEMORY[0x24BEC2148];
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "latitude");
  objc_msgSend(v5, "numberWithFloat:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  v14[2] = *MEMORY[0x24BEC2150];
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v3, "longitude");
  v9 = v8;

  LODWORD(v10) = v9;
  objc_msgSend(v7, "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (void)temperatureFromDictionaryRepresentation:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21AAEC000, log, OS_LOG_TYPE_ERROR, "WEATHER DATA MIGRATOR SHOULD HAVE RUN.  THIS SHOULDNT BE POSSIBLE.", v1, 2u);
}

@end
