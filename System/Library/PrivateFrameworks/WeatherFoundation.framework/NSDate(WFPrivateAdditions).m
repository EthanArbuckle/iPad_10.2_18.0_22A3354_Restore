@implementation NSDate(WFPrivateAdditions)

+ (uint64_t)wf_isDate:()WFPrivateAdditions inSameDayWithDate:inCalendar:
{
  return objc_msgSend(a5, "isDate:inSameDayAsDate:");
}

+ (uint64_t)wf_minutesBetweenDate:()WFPrivateAdditions andDate:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  if (!a3 || !a4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = a4;
  v6 = a3;
  +[WFWeatherConditions calendar](WFWeatherConditions, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "components:fromDate:toDate:options:", 64, v6, v5, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "minute");
  return v9;
}

+ (id)wf_weatherConditionsClosestToDate:()WFPrivateAdditions inArray:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    v10 = -1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("WFWeatherForecastDateComponent"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(MEMORY[0x24BDBCE60], "wf_minutesBetweenDate:andDate:", v5, v13);
        if (v14 >= 0)
          v15 = v14;
        else
          v15 = -v14;
        if (v15 < v10)
        {
          v16 = v12;

          v8 = v16;
          v10 = v15;
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)wf_weatherConditionsOnDate:()WFPrivateAdditions inCalendar:inArray:
{
  id v7;
  void *v8;
  void *v9;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDBCE60], "wf_allWeatherConditionsOnDate:inCalendar:inArray:", v7, a4, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v8, "count") < 2)
    objc_msgSend(v8, "lastObject");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "wf_weatherConditionsClosestToDate:inArray:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)wf_allWeatherConditionsOnDate:()WFPrivateAdditions inCalendar:inArray:
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("WFWeatherForecastDateComponent"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x24BDBCE60], "wf_isDate:inSameDayWithDate:inCalendar:", v7, v16, v8))
          objc_msgSend(v18, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v18;
}

- (uint64_t)wf_isInSameDayWithDate:()WFPrivateAdditions inCalendar:
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "wf_isDate:inSameDayWithDate:inCalendar:", a1, a3, a4);
}

- (uint64_t)wf_minutesDifferenceFromDate:()WFPrivateAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "wf_minutesBetweenDate:andDate:", a1, a3);
}

- (uint64_t)wf_weatherConditionsClosestToDate:()WFPrivateAdditions
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "wf_weatherConditionsClosestToDate:inArray:", a1, a3);
}

- (uint64_t)wf_weatherConditionsOnDate:()WFPrivateAdditions inCalendar:
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "wf_weatherConditionsOnDate:inCalendar:inArray:", a1, a4, a3);
}

- (uint64_t)wf_allWeatherConditionsOnDate:()WFPrivateAdditions inCalendar:
{
  return objc_msgSend(MEMORY[0x24BDBCE60], "wf_allWeatherConditionsOnDate:inCalendar:inArray:", a1, a4, a3);
}

@end
