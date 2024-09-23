@implementation WFWeatherDataServiceParserV1

void __60__WFWeatherDataServiceParserV1_ParseNextHour__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)dateFormatter_dateFormatter;
  dateFormatter_dateFormatter = (uint64_t)v0;

}

- (id)parseNextHourPrecipitationFromData:(id)a3 withUnit:(int)a4
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  WFNextHourPrecipitationMinute *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  WFNextHourPrecipitationMinute *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t j;
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
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  WFNextHourPrecipitationDescription *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t m;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  WFNextHourPrecipitationCondition *v62;
  double v63;
  double v64;
  double v65;
  WFNextHourPrecipitationCondition *v66;
  WFNextHourPrecipitation *v67;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id obj;
  uint64_t v79;
  void *v80;
  id v81;
  uint64_t v82;
  id v83;
  id v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  void *v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v81 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v76 = v4;
  objc_msgSend(v4, "objectForKey:", CFSTR("minutes"));
  v105 = 0u;
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
  if (v5)
  {
    v6 = v5;
    v90 = *(_QWORD *)v106;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v106 != v90)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", CFSTR("precipChance"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("precipIntensity"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("perceivedIntensity"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKey:", CFSTR("startAt"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v14 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v12, "doubleValue");
          objc_msgSend(v14, "dateWithTimeIntervalSince1970:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v15 = 0;
        }
        v16 = [WFNextHourPrecipitationMinute alloc];
        objc_msgSend(v10, "doubleValue");
        v18 = v17;
        objc_msgSend(v9, "doubleValue");
        v20 = v19;
        objc_msgSend(v11, "doubleValue");
        v22 = -[WFNextHourPrecipitationMinute initWithIntensity:chance:perceivedIntensity:date:](v16, "initWithIntensity:chance:perceivedIntensity:date:", v15, v18, v20, v21);
        objc_msgSend(v81, "addObject:", v22);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v105, v112, 16);
    }
    while (v6);
  }
  objc_msgSend(v76, "objectForKey:", CFSTR("metadata"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("expire_time"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v24;
  if (v24)
  {
    v25 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v24, "doubleValue");
    objc_msgSend(v25, "dateWithTimeIntervalSince1970:");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v73 = 0;
  }
  objc_msgSend(v76, "objectForKey:", CFSTR("startTime"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v26;
  if (v26)
  {
    v27 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v26, "doubleValue");
    objc_msgSend(v27, "dateWithTimeIntervalSince1970:");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v71 = 0;
  }
  objc_msgSend(v23, "objectForKey:", CFSTR("read_time"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v28;
  if (v28)
  {
    v29 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v28, "doubleValue");
    objc_msgSend(v29, "dateWithTimeIntervalSince1970:");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v69 = 0;
  }
  v75 = v23;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectForKey:", CFSTR("condition"));
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v77 = (id)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (v82)
  {
    v79 = *(_QWORD *)v102;
    do
    {
      for (j = 0; j != v82; ++j)
      {
        if (*(_QWORD *)v102 != v79)
          objc_enumerationMutation(v77);
        v31 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * j);
        objc_msgSend(v31, "objectForKey:", CFSTR("token"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", CFSTR("shortTemplate"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", CFSTR("longTemplate"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKey:", CFSTR("validUntil"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v35)
        {
          v37 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v35, "doubleValue");
          objc_msgSend(v37, "dateWithTimeIntervalSince1970:");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v38 = 0;
        }
        objc_msgSend(v31, "objectForKey:", CFSTR("parameters"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "count"))
        {
          v85 = v38;
          v86 = v36;
          v87 = v34;
          v88 = v33;
          v91 = v32;
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = 0u;
          v98 = 0u;
          v99 = 0u;
          v100 = 0u;
          v83 = v39;
          v41 = v39;
          v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
          if (v42)
          {
            v43 = v42;
            v44 = *(_QWORD *)v98;
            do
            {
              for (k = 0; k != v43; ++k)
              {
                if (*(_QWORD *)v98 != v44)
                  objc_enumerationMutation(v41);
                v46 = *(_QWORD *)(*((_QWORD *)&v97 + 1) + 8 * k);
                objc_msgSend(v41, "objectForKey:", v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = (void *)MEMORY[0x24BDBCE60];
                objc_msgSend(v47, "doubleValue");
                objc_msgSend(v48, "dateWithTimeIntervalSince1970:");
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "setValue:forKey:", v49, v46);

              }
              v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v97, v110, 16);
            }
            while (v43);
          }

          v33 = v88;
          v32 = v91;
          v36 = v86;
          v34 = v87;
          v39 = v83;
          v38 = v85;
        }
        else
        {
          v40 = 0;
        }
        v50 = -[WFNextHourPrecipitationDescription initWithToken:shortTemplate:longTemplate:parameters:validUntil:]([WFNextHourPrecipitationDescription alloc], "initWithToken:shortTemplate:longTemplate:parameters:validUntil:", v32, v33, v34, v40, v38);
        objc_msgSend(v80, "addObject:", v50);

      }
      v82 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
    }
    while (v82);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "objectForKey:", CFSTR("summary"));
  v93 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v84 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
  if (v51)
  {
    v52 = v51;
    v89 = *(_QWORD *)v94;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v94 != v89)
          objc_enumerationMutation(v84);
        v54 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * m);
        objc_msgSend(v54, "objectForKey:", CFSTR("condition"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKey:", CFSTR("probability"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKey:", CFSTR("intensity"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "objectForKey:", CFSTR("validUntil"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = v58;
        if (v58)
        {
          v60 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(v58, "doubleValue");
          objc_msgSend(v60, "dateWithTimeIntervalSince1970:");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v61 = 0;
        }
        v62 = [WFNextHourPrecipitationCondition alloc];
        objc_msgSend(v57, "doubleValue");
        v64 = v63;
        objc_msgSend(v56, "doubleValue");
        v66 = -[WFNextHourPrecipitationCondition initWithType:intensity:probability:validUntil:](v62, "initWithType:intensity:probability:validUntil:", v55, v61, v64, v65);
        objc_msgSend(v92, "addObject:", v66);

      }
      v52 = objc_msgSend(v84, "countByEnumeratingWithState:objects:count:", &v93, v109, 16);
    }
    while (v52);
  }
  v67 = -[WFNextHourPrecipitation initWithReadDate:startDate:expirationDate:minutes:conditions:descriptions:]([WFNextHourPrecipitation alloc], "initWithReadDate:startDate:expirationDate:minutes:conditions:descriptions:", v69, v71, v73, v81, v92, v80);

  return v67;
}

- (id)nextHourPrecipitationEventDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(2048, a4))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("next_hour"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseAlmanacFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFTemperature *v9;
  WFTemperature *v10;
  void *v11;
  WFTemperature *v12;
  WFTemperature *v13;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v5, "numberForKey:", CFSTR("precipitationAverage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("WFWeatherPrecipitationAmountComponent"));
  objc_msgSend(v5, "numberForKey:", CFSTR("temperatureAverageMax"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = [WFTemperature alloc];
    objc_msgSend(v8, "doubleValue");
    v10 = -[WFTemperature initWithTemperatureUnit:value:](v9, "initWithTemperatureUnit:value:", v4);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("WFWeatherHighTemperatureComponent"));

  }
  objc_msgSend(v5, "numberForKey:", CFSTR("temperatureAverageMin"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = [WFTemperature alloc];
    objc_msgSend(v11, "doubleValue");
    v13 = -[WFTemperature initWithTemperatureUnit:value:](v12, "initWithTemperatureUnit:value:", v4);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("WFWeatherLowTemperatureComponent"));

  }
  return v6;
}

- (id)dailyAlmanacDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(128, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("daily_almanac"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parsePollenFromData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "allKeys");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6);
  v33 = v6;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = 0;
    v32 = CFSTR("treePollenIndex");
    do
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v35, "count", v32));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v9 = v35;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v37 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i);
            objc_msgSend(v3, "arrayForKey:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", v7);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v14);

          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v11);
      }

      v17 = (void *)objc_opt_new();
      objc_msgSend(v8, "numberForKey:", CFSTR("validTimeUtc"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        v20 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v18, "doubleValue");
        objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setDate:", v21);

      }
      objc_msgSend(v8, "stringForKey:", CFSTR("dayOrNight"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v22;
      if (v22)
        objc_msgSend(v17, "setTimeOfDay:", WFTimeOfDayForString(v22));
      objc_msgSend(v8, "numberForKey:", CFSTR("grassPollenIndex"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v24)
        objc_msgSend(v17, "setGrassIndex:", objc_msgSend(v24, "unsignedIntegerValue"));
      objc_msgSend(v8, "numberForKey:", CFSTR("ragweedPollenIndex"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
        objc_msgSend(v17, "setRagweedIndex:", objc_msgSend(v26, "unsignedIntegerValue"));
      objc_msgSend(v8, "numberForKey:", v32);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        objc_msgSend(v17, "setTreeIndex:", objc_msgSend(v28, "unsignedIntegerValue"));
      objc_msgSend(v34, "addObject:", v17);

      ++v7;
    }
    while (v7 != v33);
  }
  v30 = (void *)objc_msgSend(v34, "copy");

  return v30;
}

- (id)pollenDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(16, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("pollen"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseHourlyForecastFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[WFWeatherDataServiceParserV1 parseMetaDataFromData:](self, "parseMetaDataFromData:", v8);

  }
  objc_msgSend(v6, "arrayForKey:", CFSTR("hours"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[WFWeatherDataServiceParserV1 parseWeatherComponentsFromData:withUnit:](self, "parseWeatherComponentsFromData:withUnit:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
  }
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (id)hourlyForecastDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(4, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("hourly_forecast"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)dateFormatter
{
  if (dateFormatter_onceToken_0 != -1)
    dispatch_once(&dateFormatter_onceToken_0, &__block_literal_global_6);
  return (id)dateFormatter_dateFormatter_0;
}

void __65__WFWeatherDataServiceParserV1_ParseSevereWeather__dateFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  v1 = (void *)dateFormatter_dateFormatter_0;
  dateFormatter_dateFormatter_0 = (uint64_t)v0;

}

- (id)parseSevereWeatherEventsFromData:(id)a3 withUnit:(int)a4
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  WFSevereWeatherEvent *v17;
  id obj;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v22)
  {
    v20 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", CFSTR("areaName"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("description"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("expireTime"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("id"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("source"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKey:", CFSTR("learnMoreURL"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "numberForKey:", CFSTR("isImportant"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          v13 = objc_msgSend(v11, "BOOLValue");
          if (v8)
            goto LABEL_8;
        }
        else
        {
          v13 = 0;
          if (v8)
          {
LABEL_8:
            objc_msgSend((id)objc_opt_class(), "dateFormatter");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "dateFromString:", v8);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_11;
          }
        }
        v15 = 0;
LABEL_11:
        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v16 = 0;
        }
        v17 = -[WFSevereWeatherEvent initWithIdentifier:areaName:eventDescription:source:expirationDate:URL:importance:]([WFSevereWeatherEvent alloc], "initWithIdentifier:areaName:eventDescription:source:expirationDate:URL:importance:", v23, v24, v7, v9, v15, v16, v13);
        objc_msgSend(v21, "addObject:", v17);

      }
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v22);
  }

  return v21;
}

- (id)severeWeatherEventDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(1024, a4))
  {
    objc_msgSend(v5, "arrayForKey:", CFSTR("severe_weather_events"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseChangeForecastFromData:(id)a3 withUnit:(int)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WFChangeForecast *v9;
  void *v10;
  WFChangeForecast *v11;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("messageSameTimezone"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringForKey:", CFSTR("messageDifferentTimezone"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [WFChangeForecast alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[WFChangeForecast initWithDate:descriptionSameTimeZone:descriptionDifferentTimeZone:](v9, "initWithDate:descriptionSameTimeZone:descriptionDifferentTimeZone:", v10, v7, v8);

  objc_msgSend(v6, "addObject:", v11);
  return v6;
}

- (id)changeForecastDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(512, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("change_forecast"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseHourlyHistoryFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[WFWeatherDataServiceParserV1 parseMetaDataFromData:](self, "parseMetaDataFromData:", v8);

  }
  objc_msgSend(v6, "arrayForKey:", CFSTR("hours"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[WFWeatherDataServiceParserV1 parseWeatherComponentsFromData:withUnit:](self, "parseWeatherComponentsFromData:withUnit:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
  }
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (id)hourlyHistoryDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(32, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("hourly_history"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  v19 = a10;
  if (v15)
  {
    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v15, 0, &v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;
    if (v21)
    {
LABEL_8:
      v23 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v29[0] = CFSTR("Failed to parse JSON forecast data");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "wf_errorWithCode:encapsulatedError:userInfo:", 1, v21, v24);
      *a9 = (id)objc_claimAutoreleasedReturnValue();

      v22 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    v20 = 0;
  }
  if (!objc_msgSend(v20, "count"))
  {
    v21 = 0;
    goto LABEL_8;
  }
  -[WFWeatherDataServiceParserV1 parseForecastDataFromDict:types:location:units:locale:date:error:rules:](self, "parseForecastDataFromDict:types:location:units:locale:date:error:rules:", v20, a4, v16, a6, v17, v18, a9, v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v22;
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8
{
  return -[WFWeatherDataServiceParserV1 parseForecastData:types:location:units:locale:date:error:rules:](self, "parseForecastData:types:location:units:locale:date:error:rules:", a3, a4, a5, 2, a6, a7, a8, 0);
}

- (id)parseForecastData:(id)a3 types:(unint64_t)a4 location:(id)a5 locale:(id)a6 date:(id)a7 error:(id *)a8 rules:(id)a9
{
  return -[WFWeatherDataServiceParserV1 parseForecastData:types:location:units:locale:date:error:rules:](self, "parseForecastData:types:location:units:locale:date:error:rules:", a3, a4, a5, 2, a6, a7, a8, a9);
}

- (id)parseForecastDataFromDict:(id)a3 types:(unint64_t)a4 location:(id)a5 units:(int)a6 locale:(id)a7 date:(id)a8 error:(id *)a9 rules:(id)a10
{
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  WFParsedForecastData *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  unsigned int v62;

  v16 = a3;
  v61 = a5;
  v17 = a7;
  v18 = a8;
  if (a6)
    v19 = a6;
  else
    v19 = 2;
  v20 = objc_alloc_init(WFParsedForecastData);
  -[WFWeatherDataServiceParserV1 currentObservationsDictFromData:types:](self, "currentObservationsDictFromData:types:", v16, a4);
  v21 = objc_claimAutoreleasedReturnValue();
  v62 = v19;
  if (v21)
  {
    v22 = (void *)v21;
    -[WFWeatherDataServiceParserV1 parseCurrentObservationsFromData:withUnit:](self, "parseCurrentObservationsFromData:withUnit:", v21, v19);
    v23 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v25 = (void *)v23;
    -[WFParsedForecastData setCurrentConditions:](v20, "setCurrentConditions:", v23);
    goto LABEL_9;
  }
  -[WFWeatherDataServiceParserV1 dailyAlmanacDictFromData:types:](self, "dailyAlmanacDictFromData:types:", v16, a4);
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v22 = (void *)v24;
    -[WFWeatherDataServiceParserV1 parseAlmanacFromData:withUnit:](self, "parseAlmanacFromData:withUnit:", v24, v19);
    v23 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  -[WFWeatherDataServiceParserV1 dailyHistoryDictFromData:types:](self, "dailyHistoryDictFromData:types:", v16, a4);
  v54 = objc_claimAutoreleasedReturnValue();
  if (!v54)
    goto LABEL_10;
  v22 = (void *)v54;
  -[WFWeatherDataServiceParserV1 parseDailyHistoryFromData:withUnit:](self, "parseDailyHistoryFromData:withUnit:", v54, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFParsedForecastData setCurrentConditions:](v20, "setCurrentConditions:", v55);

LABEL_9:
LABEL_10:
  -[WFParsedForecastData currentConditions](v20, "currentConditions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    -[WFParsedForecastData currentConditions](v20, "currentConditions");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setLocation:", v61);

    -[WFParsedForecastData currentConditions](v20, "currentConditions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("WFWeatherForecastDateComponent"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      -[WFParsedForecastData currentConditions](v20, "currentConditions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setObject:forKeyedSubscript:", v18, CFSTR("WFWeatherForecastDateComponent"));

    }
  }
  -[WFWeatherDataServiceParserV1 hourlyHistoryDictFromData:types:](self, "hourlyHistoryDictFromData:types:", v16, a4);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = v62;
  if (v32)
  {
    -[WFWeatherDataServiceParserV1 parseHourlyHistoryFromData:withUnit:](self, "parseHourlyHistoryFromData:withUnit:", v32, v62);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setLastTwentyFourHoursOfObservations:](v20, "setLastTwentyFourHoursOfObservations:", v34);

  }
  -[WFWeatherDataServiceParserV1 dailyForecastDictFromData:types:](self, "dailyForecastDictFromData:types:", v16, a4);
  v35 = objc_claimAutoreleasedReturnValue();
  if (v35)
  {
    -[WFWeatherDataServiceParserV1 parseDailyForecastFromData:withUnit:](self, "parseDailyForecastFromData:withUnit:", v35, v62);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setDailyForecasts:](v20, "setDailyForecasts:", v36);

  }
  v57 = (void *)v35;
  v58 = (void *)v32;
  -[WFWeatherDataServiceParserV1 hourlyForecastDictFromData:types:](self, "hourlyForecastDictFromData:types:", v16, a4);
  v37 = objc_claimAutoreleasedReturnValue();
  if (v37)
  {
    -[WFWeatherDataServiceParserV1 parseHourlyForecastFromData:withUnit:](self, "parseHourlyForecastFromData:withUnit:", v37, v62);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setHourlyForecasts:](v20, "setHourlyForecasts:", v38);

  }
  v56 = (void *)v37;
  -[WFWeatherDataServiceParserV1 airQualityDictFromData:types:](self, "airQualityDictFromData:types:", v16, a4);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
  {
    -[WFWeatherDataServiceParserV1 parseAirQualityFromData:locale:](self, "parseAirQualityFromData:locale:", v39, v17);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setAirQualityObservations:](v20, "setAirQualityObservations:", v40);

  }
  v59 = v18;
  v60 = v17;
  -[WFWeatherDataServiceParserV1 pollenDictFromData:types:](self, "pollenDictFromData:types:", v16, a4);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    -[WFWeatherDataServiceParserV1 parsePollenFromData:](self, "parsePollenFromData:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setPollenForecasts:](v20, "setPollenForecasts:", v42);

  }
  -[WFParsedForecastData currentConditions](v20, "currentConditions");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[WFWeatherDataServiceParserV1 nowLinksDictFromData:types:](self, "nowLinksDictFromData:types:", v16, a4);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      -[WFParsedForecastData currentConditions](v20, "currentConditions");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherDataServiceParserV1 parseNowLinksFromData:intoConditions:](self, "parseNowLinksFromData:intoConditions:", v45, v46);

    }
  }
  -[WFWeatherDataServiceParserV1 changeForecastDictFromData:types:](self, "changeForecastDictFromData:types:", v16, a4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    -[WFWeatherDataServiceParserV1 parseChangeForecastFromData:withUnit:](self, "parseChangeForecastFromData:withUnit:", v47, v62);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setChangeForecasts:](v20, "setChangeForecasts:", v48);

  }
  -[WFWeatherDataServiceParserV1 severeWeatherEventDictFromData:types:](self, "severeWeatherEventDictFromData:types:", v16, a4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (v49)
  {
    -[WFWeatherDataServiceParserV1 parseSevereWeatherEventsFromData:withUnit:](self, "parseSevereWeatherEventsFromData:withUnit:", v49, v62);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setSevereWeatherEvents:](v20, "setSevereWeatherEvents:", v50);

    v33 = v62;
  }
  -[WFWeatherDataServiceParserV1 nextHourPrecipitationEventDictFromData:types:](self, "nextHourPrecipitationEventDictFromData:types:", v16, a4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (v51)
  {
    -[WFWeatherDataServiceParserV1 parseNextHourPrecipitationFromData:withUnit:](self, "parseNextHourPrecipitationFromData:withUnit:", v51, v33);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFParsedForecastData setNextHourPrecipitation:](v20, "setNextHourPrecipitation:", v52);

  }
  return v20;
}

- (id)parseAQIScaleNamed:(id)a3 data:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  WFAQIScale *v13;
  NSObject *v14;
  void *v15;
  WFAQIScale *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  uint64_t v42;
  void *v43;
  WFAQIScaleGradient *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  const __CFString **v48;
  uint64_t *v49;
  NSObject *v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  uint64_t v67;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id obj;
  id obja;
  void *v81;
  void *v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  id v92;
  uint64_t v93;
  const __CFString *v94;
  _BYTE v95[128];
  uint64_t v96;
  const __CFString *v97;
  uint64_t v98;
  const __CFString *v99;
  _BYTE v100[128];
  uint64_t v101;
  const __CFString *v102;
  uint64_t v103;
  const __CFString *v104;
  uint64_t v105;
  const __CFString *v106;
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  const __CFString *v110;
  uint64_t v111;
  const __CFString *v112;
  uint64_t v113;
  const __CFString *v114;
  uint64_t v115;
  const __CFString *v116;
  uint64_t v117;
  const __CFString *v118;
  uint64_t v119;
  _QWORD v120[3];

  v120[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    v92 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v9, 0, &v92);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v92;
    if (!v11 && objc_msgSend(v10, "count"))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("aqi"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "count"))
      {
        if (v8)
        {
          v16 = objc_alloc_init(WFAQIScale);
          -[WFAQIScale setIdentifier:](v16, "setIdentifier:", v8);
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("numerical"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v17)
          {
            -[WFAQIScale setNumerical:](v16, "setNumerical:", objc_msgSend(v17, "BOOLValue"));
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("ascending"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19;
            if (v19)
            {
              -[WFAQIScale setAscending:](v16, "setAscending:", objc_msgSend(v19, "BOOLValue"));
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayName"));
              v21 = objc_claimAutoreleasedReturnValue();
              v81 = (void *)v21;
              v82 = v18;
              if (v21)
              {
                -[WFAQIScale setDisplayName:](v16, "setDisplayName:", v21);
                objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("displayLabel"));
                v22 = objc_claimAutoreleasedReturnValue();
                v78 = (void *)v22;
                if (v22)
                {
                  -[WFAQIScale setDisplayLabel:](v16, "setDisplayLabel:", v22);
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("range"));
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v23, "count") == 2)
                  {
                    v73 = v20;
                    objc_msgSend(v23, "objectAtIndexedSubscript:", 0);
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    v74 = v24;
                    v26 = objc_msgSend(v24, "unsignedIntegerValue");
                    v76 = v25;
                    -[WFAQIScale setRange:](v16, "setRange:", v26, objc_msgSend(v25, "unsignedIntegerValue") - v26);
                    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("categories"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v27, "count");
                    v77 = v23;
                    v75 = v27;
                    if (v28)
                    {
                      v71 = v15;
                      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v28);
                      v83 = (void *)objc_claimAutoreleasedReturnValue();
                      v88 = 0u;
                      v89 = 0u;
                      v90 = 0u;
                      v91 = 0u;
                      obj = v27;
                      v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
                      if (v29)
                      {
                        v30 = v29;
                        v31 = *(_QWORD *)v89;
                        while (2)
                        {
                          for (i = 0; i != v30; ++i)
                          {
                            if (*(_QWORD *)v89 != v31)
                              objc_enumerationMutation(obj);
                            -[WFWeatherDataServiceParserV1 parsedCategoryFromDictionary:](self, "parsedCategoryFromDictionary:", *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i));
                            v33 = objc_claimAutoreleasedReturnValue();
                            if (!v33)
                            {

                              WFLogForCategory(7uLL);
                              v60 = objc_claimAutoreleasedReturnValue();
                              if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
                                -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.12();

                              v98 = *MEMORY[0x24BDD0FC8];
                              v99 = CFSTR("Encountered a nil category property while parsing the categories");
                              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
                              v35 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:encapsulatedError:userInfo:", 3, 0, v35);
                              v13 = 0;
                              *a5 = (id)objc_claimAutoreleasedReturnValue();
                              v15 = v71;
                              v20 = v73;
                              v53 = v81;
                              goto LABEL_72;
                            }
                            v34 = (void *)v33;
                            objc_msgSend(v83, "addObject:", v33);

                          }
                          v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v100, 16);
                          if (v30)
                            continue;
                          break;
                        }
                      }

                      -[WFAQIScale setCategories:](v16, "setCategories:", v83);
                      v15 = v71;
                      objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("gradient"));
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("stops"));
                      v36 = (void *)objc_claimAutoreleasedReturnValue();
                      v37 = objc_msgSend(v36, "count");
                      v70 = v36;
                      if (v37)
                      {
                        v69 = v35;
                        objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v37);
                        obja = (id)objc_claimAutoreleasedReturnValue();
                        v84 = 0u;
                        v85 = 0u;
                        v86 = 0u;
                        v87 = 0u;
                        v72 = v36;
                        v38 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
                        if (v38)
                        {
                          v39 = v38;
                          v40 = *(_QWORD *)v85;
                          while (2)
                          {
                            for (j = 0; j != v39; ++j)
                            {
                              if (*(_QWORD *)v85 != v40)
                                objc_enumerationMutation(v72);
                              -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:](self, "parsedGradientStopFromDictionary:", *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j));
                              v42 = objc_claimAutoreleasedReturnValue();
                              if (!v42)
                              {

                                WFLogForCategory(7uLL);
                                v63 = objc_claimAutoreleasedReturnValue();
                                if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
                                  -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.11();

                                v93 = *MEMORY[0x24BDD0FC8];
                                v94 = CFSTR("Encountered a nil gradient property while parsing the gradient");
                                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v94, &v93, 1);
                                v64 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v64);
                                *a5 = (id)objc_claimAutoreleasedReturnValue();

                                v13 = 0;
                                goto LABEL_67;
                              }
                              v43 = (void *)v42;
                              objc_msgSend(obja, "addObject:", v42);

                            }
                            v39 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v84, v95, 16);
                            if (v39)
                              continue;
                            break;
                          }
                        }

                        v44 = -[WFAQIScaleGradient initWithStops:]([WFAQIScaleGradient alloc], "initWithStops:", obja);
                        -[WFAQIScale setGradient:](v16, "setGradient:", v44);

                        WFLogForCategory(7uLL);
                        v45 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
                          -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.10((uint64_t)v16, v45);

                        v13 = v16;
LABEL_67:
                        v15 = v71;
                        v20 = v73;
                        v65 = obja;
                        v53 = v81;
                        v35 = v69;
                      }
                      else
                      {
                        WFLogForCategory(7uLL);
                        v66 = objc_claimAutoreleasedReturnValue();
                        v20 = v73;
                        if (os_log_type_enabled(v66, OS_LOG_TYPE_FAULT))
                          -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.9();

                        v96 = *MEMORY[0x24BDD0FC8];
                        v97 = CFSTR("No gradient stops found");
                        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
                        v67 = objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v67);
                        v13 = 0;
                        *a5 = (id)objc_claimAutoreleasedReturnValue();
                        v65 = (void *)v67;
                        v53 = v81;
                      }

LABEL_72:
                      v59 = v74;

                      v62 = v83;
                    }
                    else
                    {
                      WFLogForCategory(7uLL);
                      v61 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
                        -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.8();

                      v101 = *MEMORY[0x24BDD0FC8];
                      v102 = CFSTR("Encountered a nil categories property in AQI scale data");
                      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v102, &v101, 1);
                      v62 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v62);
                      v13 = 0;
                      *a5 = (id)objc_claimAutoreleasedReturnValue();
                      v20 = v73;
                      v59 = v74;
                      v53 = v81;
                    }

                    v23 = v77;
                  }
                  else
                  {
                    WFLogForCategory(7uLL);
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                      -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.13();

                    v103 = *MEMORY[0x24BDD0FC8];
                    v104 = CFSTR("Encountered a nil range property in AQI scale data");
                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v104, &v103, 1);
                    v58 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v58);
                    v13 = 0;
                    *a5 = (id)objc_claimAutoreleasedReturnValue();
                    v59 = (void *)v58;
                    v53 = v81;
                  }

                }
                else
                {
                  WFLogForCategory(7uLL);
                  v56 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                    -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.7();

                  v105 = *MEMORY[0x24BDD0FC8];
                  v106 = CFSTR("Encountered a nil displayLabel property in AQI scale data");
                  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v23);
                  v13 = 0;
                  *a5 = (id)objc_claimAutoreleasedReturnValue();
                  v53 = v81;
                }

                v55 = v78;
              }
              else
              {
                WFLogForCategory(7uLL);
                v54 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.6();

                v107 = *MEMORY[0x24BDD0FC8];
                v108 = CFSTR("Encountered a nil displayName property in AQI scale data");
                objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v55);
                v13 = 0;
                *a5 = (id)objc_claimAutoreleasedReturnValue();
                v53 = 0;
              }

              v18 = v82;
            }
            else
            {
              WFLogForCategory(7uLL);
              v52 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.5();

              v109 = *MEMORY[0x24BDD0FC8];
              v110 = CFSTR("Encountered a nil ascending property in AQI scale data");
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v53);
              v13 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }

          }
          else
          {
            WFLogForCategory(7uLL);
            v51 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
              -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.4();

            v111 = *MEMORY[0x24BDD0FC8];
            v112 = CFSTR("Encountered a nil nnumerical property in AQI scale data");
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v112, &v111, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v20);
            v13 = 0;
            *a5 = (id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_79;
        }
        WFLogForCategory(7uLL);
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
          -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.3();

        v113 = *MEMORY[0x24BDD0FC8];
        v114 = CFSTR("Encountered a nil name property in AQI scale data");
        v47 = (void *)MEMORY[0x24BDBCE70];
        v48 = &v114;
        v49 = &v113;
      }
      else
      {
        WFLogForCategory(7uLL);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.2();

        v115 = *MEMORY[0x24BDD0FC8];
        v116 = CFSTR("Encountered an empty scale");
        v47 = (void *)MEMORY[0x24BDBCE70];
        v48 = &v116;
        v49 = &v115;
      }
      objc_msgSend(v47, "dictionaryWithObjects:forKeys:count:", v48, v49, 1);
      v16 = (WFAQIScale *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v16);
      v13 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_79:

      goto LABEL_80;
    }
    v117 = *MEMORY[0x24BDD0FC8];
    v118 = CFSTR("Failed to parse JSON for remote AQI scale data");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:encapsulatedError:userInfo:", 1, v11, v12);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    v13 = 0;
    v10 = v11;
  }
  else
  {
    WFLogForCategory(7uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WFWeatherDataServiceParserV1 parseAQIScaleNamed:data:error:].cold.1();

    v119 = *MEMORY[0x24BDD0FC8];
    v120[0] = CFSTR("The passed in data is nil");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v120, &v119, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "wf_errorWithCode:userInfo:", 3, v10);
    v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_80:

  return v13;
}

- (id)parsedCategoryFromDictionary:(id)a3
{
  id v3;
  WFAQIScaleCategory *v4;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v21;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4 = objc_alloc_init(WFAQIScaleCategory);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("categoryName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScaleCategory setCategoryName:](v4, "setCategoryName:", v5);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("categoryNumber"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScaleCategory setCategoryNumber:](v4, "setCategoryNumber:", objc_msgSend(v6, "unsignedIntegerValue"));
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("color"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScaleCategory setColor:](v4, "setColor:", v7);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("glyph"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScaleCategory setGlyph:](v4, "setGlyph:", v8);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("recommendation"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAQIScaleCategory setRecommendation:](v4, "setRecommendation:", v9);
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("range"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count") == 2)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v8;
      v13 = v7;
      v14 = v6;
      v15 = v5;
      v16 = objc_msgSend(v21, "unsignedIntegerValue");
      v17 = objc_msgSend(v11, "unsignedIntegerValue") - v16;
      v18 = v16;
      v5 = v15;
      v6 = v14;
      v7 = v13;
      v8 = v12;
      -[WFAQIScaleCategory setRange:](v4, "setRange:", v18, v17);

    }
  }
  else
  {
    WFLogForCategory(7uLL);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      -[WFWeatherDataServiceParserV1 parsedCategoryFromDictionary:].cold.1();

    v4 = 0;
  }

  return v4;
}

- (id)parsedGradientStopFromDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  int v7;
  NSObject *v8;
  WFAQIScaleGradientStop *v9;
  double v10;
  WFAQIScaleGradientStop *v11;
  NSObject *v12;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("location"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      -[NSObject floatValue](v4, "floatValue");
      v7 = v6;
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("color"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = [WFAQIScaleGradientStop alloc];
        LODWORD(v10) = v7;
        v11 = -[WFAQIScaleGradientStop initWithLocation:color:](v9, "initWithLocation:color:", v8, v10);
LABEL_14:

        goto LABEL_15;
      }
      WFLogForCategory(7uLL);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:].cold.3();

    }
    else
    {
      WFLogForCategory(7uLL);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:].cold.2();
    }
    v11 = 0;
    goto LABEL_14;
  }
  WFLogForCategory(7uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    -[WFWeatherDataServiceParserV1 parsedGradientStopFromDictionary:].cold.1();
  v11 = 0;
LABEL_15:

  return v11;
}

- (id)currentObservationsDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(2, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("current_observations"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseMetaDataFromData:(id)a3
{
  id v3;
  WFWeatherDataServiceParserMetadataV1 *v4;
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;

  v3 = a3;
  v4 = objc_alloc_init(WFWeatherDataServiceParserMetadataV1);
  objc_msgSend(v3, "numberForKey:", CFSTR("reported_time"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherDataServiceParserMetadataV1 setReadDate:](v4, "setReadDate:", v8);

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("expirationTimeUtc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherDataServiceParserMetadataV1 setExpireDate:](v4, "setExpireDate:", v12);

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("version"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    -[WFWeatherDataServiceParserMetadataV1 setVersion:](v4, "setVersion:", objc_msgSend(v13, "unsignedIntegerValue"));
  objc_msgSend(v3, "stringForKey:", CFSTR("provider_name"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherDataServiceParserMetadataV1 setProviderName:](v4, "setProviderName:", v15);

  objc_msgSend(v3, "stringForKey:", CFSTR("provider_logo"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFWeatherDataServiceParserMetadataV1 setProviderLogoURL:](v4, "setProviderLogoURL:", v17);

  }
  objc_msgSend(v3, "numberForKey:", CFSTR("data_source"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v20 = objc_msgSend(v18, "unsignedIntegerValue");
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (v20 == 1)
      v21 = 1;
    if (v20)
      v22 = v21;
    else
      v22 = 0;
    -[WFWeatherDataServiceParserMetadataV1 setDataOrigination:](v4, "setDataOrigination:", v22);
  }
  objc_msgSend(v3, "numberForKey:", CFSTR("latitude"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v3, "numberForKey:", CFSTR("longitude"));
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v25 = (void *)v24;
      v35 = v6;
      v26 = (void *)objc_opt_new();
      v27 = objc_alloc(MEMORY[0x24BDBFA80]);
      objc_msgSend(v23, "doubleValue");
      v29 = v28;
      objc_msgSend(v25, "doubleValue");
      v31 = (void *)objc_msgSend(v27, "initWithLatitude:longitude:", v29, v30);
      objc_msgSend(v26, "setGeoLocation:", v31);

      -[WFWeatherDataServiceParserMetadataV1 setLocation:](v4, "setLocation:", v26);
      if (-[WFWeatherDataServiceParserMetadataV1 dataOrigination](v4, "dataOrigination") == 0x7FFFFFFFFFFFFFFFLL)
        -[WFWeatherDataServiceParserMetadataV1 setDataOrigination:](v4, "setDataOrigination:", 0);

      v6 = v35;
    }
  }
  objc_msgSend(v3, "numberForKey:", CFSTR("temporarily_unavailable"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32;
  if (v32)
    -[WFWeatherDataServiceParserMetadataV1 setTemporarilyUnavailable:](v4, "setTemporarilyUnavailable:", objc_msgSend(v32, "BOOLValue"));

  return v4;
}

- (id)parseWeatherComponentsFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4;
  id v6;
  WFWeatherConditions *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = objc_alloc_init(WFWeatherConditions);
  -[WFWeatherDataServiceParserV1 parseWeatherComponentsFromData:intoConditions:withUnit:](self, "parseWeatherComponentsFromData:intoConditions:withUnit:", v6, v7, v4);

  return v7;
}

- (void)parseWeatherComponentsFromData:(id)a3 intoConditions:(id)a4 withUnit:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  WFTemperature *v25;
  WFTemperature *v26;
  void *v27;
  WFTemperature *v28;
  WFTemperature *v29;
  void *v30;
  WFTemperature *v31;
  WFTemperature *v32;
  void *v33;
  WFTemperature *v34;
  WFTemperature *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;

  v5 = *(_QWORD *)&a5;
  v45 = a3;
  v8 = a4;
  objc_msgSend(v45, "numberForKey:", CFSTR("validTimeUtc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v9, "unsignedIntegerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("WFWeatherForecastDateComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("expirationTimeUtc"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v12, "unsignedIntegerValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("WFWeatherForecastExpirationDateComponent"));

  }
  objc_msgSend(v45, "dictionaryForKey:", CFSTR("metadata"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[WFWeatherDataServiceParserV1 parseMetaDataFromData:](self, "parseMetaDataFromData:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "providerName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("WFWeatherDataProviderName"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("iconCode"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || (objc_msgSend(v45, "numberForKey:", CFSTR("iconCodeDay")),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(v45, "numberForKey:", CFSTR("iconCodeNight")),
        (v17 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherLegacyConditionComponent"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", WFConditionCodeFromLegacyWeatherConditionCode(objc_msgSend(v17, "unsignedIntegerValue")));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v18, CFSTR("WFWeatherConditionComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("relativeHumidity"));
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("WFWeatherHumidityComponent"));
  v43 = (void *)v14;
  objc_msgSend(v45, "numberForKey:", CFSTR("precip1Hour"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20
    || (objc_msgSend(v45, "numberForKey:", CFSTR("precip24Hour")),
        (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("WFWeatherPrecipitationAmountComponent"));

  }
  v44 = v12;
  objc_msgSend(v45, "numberForKey:", CFSTR("precipChance"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v21, CFSTR("WFWeatherPrecipitationChanceComponent"));
  objc_msgSend(v45, "stringForKey:", CFSTR("precipType"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("WFWeatherPrecipitationTypeComponent"));
  objc_msgSend(v45, "stringForKey:", CFSTR("dayOrNight"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
    objc_msgSend(v8, "setNightForecast:", objc_msgSend(CFSTR("N"), "isEqualToString:", v23));
  objc_msgSend(v45, "numberForKey:", CFSTR("temperature"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = [WFTemperature alloc];
    objc_msgSend(v24, "doubleValue");
    v26 = -[WFTemperature initWithTemperatureUnit:value:](v25, "initWithTemperatureUnit:value:", v5);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("WFWeatherTemperatureComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("temperatureMax24Hour"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27
    || (objc_msgSend(v45, "numberForKey:", CFSTR("temperatureMax")),
        (v27 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v28 = [WFTemperature alloc];
    objc_msgSend(v27, "doubleValue");
    v29 = -[WFTemperature initWithTemperatureUnit:value:](v28, "initWithTemperatureUnit:value:", v5);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v29, CFSTR("WFWeatherHighTemperatureComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("temperatureMin24Hour"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30
    || (objc_msgSend(v45, "numberForKey:", CFSTR("temperatureMin")),
        (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v31 = [WFTemperature alloc];
    objc_msgSend(v30, "doubleValue");
    v32 = -[WFTemperature initWithTemperatureUnit:value:](v31, "initWithTemperatureUnit:value:", v5);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("WFWeatherLowTemperatureComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("temperatureFeelsLike"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    v34 = [WFTemperature alloc];
    objc_msgSend(v33, "doubleValue");
    v35 = -[WFTemperature initWithTemperatureUnit:value:](v34, "initWithTemperatureUnit:value:", v5);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v35, CFSTR("WFWeatherFeelsLikeTemperatureComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("uvIndex"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (v36)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, CFSTR("WFWeatherUVIndexComponent"));
  objc_msgSend(v45, "numberForKey:", CFSTR("visibility"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v37, CFSTR("WFWeatherVisibilityComponent"));
  objc_msgSend(v45, "numberForKey:", CFSTR("windDirection"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v38, CFSTR("WFWeatherWindDirectionComponent"));
  objc_msgSend(v45, "numberForKey:", CFSTR("windSpeed"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  if (v39)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("WFWeatherWindSpeedComponent"));
  objc_msgSend(v45, "numberForKey:", CFSTR("pressureAltimeter"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40
    || (objc_msgSend(v45, "numberForKey:", CFSTR("pressureMeanSeaLevel")),
        (v40 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("WFWeatherPressureComponent"));

  }
  objc_msgSend(v45, "numberForKey:", CFSTR("pressureTendencyCode"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  if (v41)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("WFWeatherPressureTrendComponent"));

}

- (id)parseAirQualityFromData:(id)a3 locale:(id)a4
{
  id v6;
  id v7;
  WFAirQualityConditions *v8;
  void *v9;
  void *v10;
  void *v11;
  WFAirQualityProviderStation *v12;
  WFAirQualityProviderStation *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  WFAirQualityProviderAttribution *v20;
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
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  NSObject *v47;
  void *v49;
  void *v50;
  void *v51;
  NSObject *log;
  void *v53;
  void *v54;
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(WFAirQualityConditions);
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("metadata"));
  v53 = v7;
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
  {
    -[WFWeatherDataServiceParserV1 parseMetaDataFromData:](self, "parseMetaDataFromData:", v54);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "expireDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAirQualityConditions setExpirationDate:](v8, "setExpirationDate:", v10);

    objc_msgSend(v9, "readDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAirQualityConditions setDate:](v8, "setDate:", v11);

    if (objc_msgSend(v9, "dataOrigination"))
    {
      v12 = 0;
    }
    else
    {
      v13 = [WFAirQualityProviderStation alloc];
      objc_msgSend(v9, "location");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "geoLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "readDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[WFAirQualityProviderStation initWithLocation:lastReadDate:](v13, "initWithLocation:lastReadDate:", v15, v16);

    }
    +[WFAirQualityProviderAttributionManager sharedManager](WFAirQualityProviderAttributionManager, "sharedManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "providerName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cachedAttributionForProvider:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (!-[WFWeatherDataServiceParserV1 isProviderAttribution:stillValidWithMetadata:](self, "isProviderAttribution:stillValidWithMetadata:", v19, v9))
    {
      v20 = [WFAirQualityProviderAttribution alloc];
      objc_msgSend(v9, "providerName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "providerLogoURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[WFAirQualityProviderAttribution initWithName:logoURL:dataOrigination:station:](v20, "initWithName:logoURL:dataOrigination:station:", v21, v22, objc_msgSend(v9, "dataOrigination"), v12);

      v7 = v53;
      objc_msgSend(v17, "registerProviderAttribution:", v23);
      v19 = (void *)v23;
    }
    -[WFAirQualityConditions setProviderAttribution:](v8, "setProviderAttribution:", v19);
    -[WFAirQualityConditions setTemporarilyUnavailable:](v8, "setTemporarilyUnavailable:", objc_msgSend(v9, "temporarilyUnavailable"));

  }
  -[WFAirQualityConditions setLocale:](v8, "setLocale:", v7);
  objc_msgSend(v6, "stringForKey:", CFSTR("source"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions setProvider:](v8, "setProvider:", v24);

  objc_msgSend(v6, "stringForKey:", CFSTR("disclaimer"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions setLocalizedDisclaimer:](v8, "setLocalizedDisclaimer:", v25);

  objc_msgSend(v6, "numberForKey:", CFSTR("airQualityIndex"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v26)
  {
    -[WFAirQualityConditions setLocalizedAirQualityIndex:](v8, "setLocalizedAirQualityIndex:", objc_msgSend(v26, "unsignedIntegerValue"));
    -[WFAirQualityConditions setAirQualityIndex:](v8, "setAirQualityIndex:", objc_msgSend(v27, "unsignedIntegerValue"));
  }
  objc_msgSend(v6, "numberForKey:", CFSTR("airQualityCategoryIndex"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v28)
  {
    -[WFAirQualityConditions setCategory:](v8, "setCategory:", objc_msgSend(v28, "integerValue"));
    -[WFAirQualityConditions setCurrentCategoryIndex:](v8, "setCurrentCategoryIndex:", objc_msgSend(v29, "integerValue"));
  }
  objc_msgSend(v6, "stringForKey:", CFSTR("airQualityCategory"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions setLocalizedAirQualityCategory:](v8, "setLocalizedAirQualityCategory:", v30);

  objc_msgSend(v6, "stringForKey:", CFSTR("airQualityScale"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions setAirQualityScale:](v8, "setAirQualityScale:", v31);

  objc_msgSend(v6, "stringForKey:", CFSTR("airQualityScale"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions setScaleIdentifier:](v8, "setScaleIdentifier:", v32);

  -[WFAirQualityConditions setSignificance:](v8, "setSignificance:", 0);
  objc_msgSend(v6, "numberForKey:", CFSTR("isSignificant"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    if (objc_msgSend(v33, "BOOLValue"))
      v35 = 1;
    else
      v35 = 2;
    -[WFAirQualityConditions setSignificance:](v8, "setSignificance:", v35);
  }
  objc_msgSend(v6, "stringForKey:", CFSTR("learnMoreURL"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v36;
  if (v36)
  {
    objc_msgSend(v36, "stringByReplacingOccurrencesOfString:withString:", CFSTR("{products}"), CFSTR("AppleWeatherService"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAirQualityConditions setLearnMoreURL:](v8, "setLearnMoreURL:", v39);

  }
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("pollutants"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFWeatherDataServiceParserV1 parsePollutants:](self, "parsePollutants:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "allValues");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFAirQualityConditions setPollutants:](v8, "setPollutants:", v42);

  objc_msgSend(v6, "stringForKey:", CFSTR("primaryPollutant"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v41, "objectForKeyedSubscript:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[WFAirQualityConditions setPrimaryPollutant:](v8, "setPrimaryPollutant:", v44);
    }
    else
    {
      WFLogForCategory(7uLL);
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        -[WFAirQualityConditions pollutants](v8, "pollutants");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        log = v45;
        NSStringFromSelector(sel_localizedName);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "valueForKeyPath:", v50);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "componentsJoinedByString:", CFSTR(", "));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v56 = v43;
        v57 = 2114;
        v58 = v49;
        _os_log_impl(&dword_21189A000, log, OS_LOG_TYPE_DEFAULT, "Did not find primary pollutant %{public}@ in list of pollutants: %{public}@", buf, 0x16u);

        v45 = log;
      }

    }
  }
  WFLogForCategory(7uLL);
  v47 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
    -[WFWeatherDataServiceParserV1(ParseAirQuality) parseAirQualityFromData:locale:].cold.1((uint64_t)v8, v47);

  return v8;
}

- (id)parsePollutants:(id)a3
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
  v9[2] = __65__WFWeatherDataServiceParserV1_ParseAirQuality__parsePollutants___block_invoke;
  v9[3] = &unk_24CCA2378;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __65__WFWeatherDataServiceParserV1_ParseAirQuality__parsePollutants___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)airQualityDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(1, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("air_quality"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isProviderAttribution:(id)a3 stillValidWithMetadata:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (!v11)
      goto LABEL_6;
    objc_msgSend(v5, "logoURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "absoluteString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "providerLogoURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "isEqualToString:", v15);

    if (v16)
    {
      v17 = objc_msgSend(v5, "dataOrigination");
      v8 = v17 == objc_msgSend(v7, "dataOrigination");
    }
    else
    {
LABEL_6:
      v8 = 0;
    }
  }

  return v8;
}

- (id)parseDailyHistoryFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("metadata"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[WFWeatherDataServiceParserV1 parseMetaDataFromData:](self, "parseMetaDataFromData:", v8);

  }
  objc_msgSend(v6, "arrayForKey:", CFSTR("days"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          -[WFWeatherDataServiceParserV1 parseWeatherComponentsFromData:withUnit:](self, "parseWeatherComponentsFromData:withUnit:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14), v4);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }
  }
  v16 = (void *)objc_msgSend(v7, "copy");

  return v16;
}

- (id)dailyHistoryDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(64, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("daily_history"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)parseDailyForecastFromData:(id)a3 withUnit:(int)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  unint64_t v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  int v28;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "arrayForKey:", CFSTR("days"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v6;
  objc_msgSend(v6, "arrayForKey:", CFSTR("dayParts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    v10 = 0;
    v11 = 0;
    v28 = 0;
    v27 = v8;
    v26 = v7;
    do
    {
      v12 = (void *)objc_opt_new();
      v13 = v28 + v10;
      if (objc_msgSend(v9, "count") > (unint64_t)(v28 + v10))
      {
        v14 = v13;
        if (!v13)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "valueForKey:", CFSTR("dayOrNight"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = objc_msgSend(CFSTR("N"), "isEqualToString:", v16);
          v18 = v28;
          if (v17)
            v18 = -1;
          v28 = v18;

        }
        objc_msgSend(v9, "objectAtIndexedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFWeatherDataServiceParserV1 parseWeatherComponentsFromData:intoConditions:withUnit:](self, "parseWeatherComponentsFromData:intoConditions:withUnit:", v19, v12, v4);
        objc_msgSend(v19, "valueForKey:", CFSTR("dayOrNight"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setNightForecast:", objc_msgSend(CFSTR("N"), "isEqualToString:", v20));

        v7 = v26;
        v8 = v27;
      }
      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFWeatherDataServiceParserV1 parseWeatherComponentsFromData:intoConditions:withUnit:](self, "parseWeatherComponentsFromData:intoConditions:withUnit:", v21, v12, v4);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", ++v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("__THIS_WILL_BE_DEPRECATED__WFWeatherSeriesIndexComponent"));

      objc_msgSend(v7, "addObject:", v12);
      v10 += 2;
    }
    while (objc_msgSend(v8, "count") > v11);
  }
  v23 = (void *)objc_msgSend(v7, "copy");

  return v23;
}

- (id)dailyForecastDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(8, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("daily_forecast"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)parseNowLinksFromData:(id)a3 intoConditions:(id)a4
{
  void *v5;
  id v6;
  id v7;
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
  id v30;

  v5 = (void *)MEMORY[0x24BDBCF48];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "stringForKey:", CFSTR("iosNow"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("WFWeatherIOSLinkComponent"));

  v10 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("web"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLWithString:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("WFWeatherMobileLinkComponent"));

  v13 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("web"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "URLWithString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, CFSTR("WFWeatherWebLinkComponent"));

  v16 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("webForecastHourly"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "URLWithString:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("WFWeatherWebForecastHourlyLinkComponent"));

  v19 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("webForecastDaily10"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "URLWithString:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("WFWeatherWebForecastDailyLinkComponent"));

  v22 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("webForecastMonthly"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "URLWithString:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v24, CFSTR("WFWeatherWebForecastMonthlyLinkComponent"));

  v25 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("webRadar"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "URLWithString:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("WFWeatherWebRadarLinkComponent"));

  v28 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(v7, "stringForKey:", CFSTR("webAllergy"));
  v30 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "URLWithString:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v29, CFSTR("WFWeatherWebAllergyLinkComponent"));

}

- (id)nowLinksDictFromData:(id)a3 types:(unint64_t)a4
{
  id v5;
  void *v6;

  v5 = a3;
  if (WFForecastTypeIsRequestedInTypes(256, a4))
  {
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("now_links"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)parseAQIScaleNamed:data:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "The passed in data is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered an empty scale", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil name property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil numerical property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil ascending property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil displayName property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil displayLabel property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil categories property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "No gradient stops found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:(uint64_t)a1 data:(NSObject *)a2 error:.cold.10(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_21189A000, a2, OS_LOG_TYPE_DEBUG, "Successfully parsed aqi scale: %@", (uint8_t *)&v2, 0xCu);
}

- (void)parseAQIScaleNamed:data:error:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil gradient property while parsing the gradient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil category property while parsing the categories", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parseAQIScaleNamed:data:error:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_1(&dword_21189A000, v0, v1, "Encountered a nil range property in AQI scale data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parsedCategoryFromDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "encountered an empty scale category", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parsedGradientStopFromDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "encountered an empty gradient stop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parsedGradientStopFromDictionary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "encountered an gradient stop with a nil or malformed location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)parsedGradientStopFromDictionary:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3_1(&dword_21189A000, v0, v1, "encountered an gradient stop with a nil color", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
