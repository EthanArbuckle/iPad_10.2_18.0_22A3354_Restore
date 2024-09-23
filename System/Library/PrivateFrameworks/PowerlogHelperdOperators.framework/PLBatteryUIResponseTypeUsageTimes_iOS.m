@implementation PLBatteryUIResponseTypeUsageTimes_iOS

- (id)dependencies
{
  return &unk_1EA1DBC20;
}

- (void)configure:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  BOOL v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS setStart:](self, "setStart:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS setEnd:](self, "setEnd:", v12);

  -[PLBatteryUIResponseTypeUsageTimes_iOS end](self, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS start](self, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v14);
  -[PLBatteryUIResponseTypeUsageTimes_iOS setRange:](self, "setRange:");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "doubleValue");
  -[PLBatteryUIResponseTypeUsageTimes_iOS setBucketSize:](self, "setBucketSize:");

  -[PLBatteryUIResponseTypeUsageTimes_iOS start](self, "start");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS end](self, "end");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  v19 = v18;
  objc_msgSend(v17, "timeIntervalSince1970");
  v21 = v20 - v19;

  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertFromMonotonicToSystem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS getDataRange:](self, "getDataRange:", v23);
  v25 = v24;
  v27 = v26;

  v28 = v19 + -1800.0;
  v29 = v19 + -1800.0 + v21;
  if (v19 + -1800.0 < v25 && v29 > v25)
  {
    v30 = v25 + v27;
LABEL_9:
    if (v28 >= v25)
      v31 = v28;
    else
      v31 = v25;
    if (v29 >= v30)
      v29 = v30;
    v33 = v29 - v31;
    goto LABEL_15;
  }
  v30 = v25 + v27;
  if (v25 < v28 && v30 > v28)
    goto LABEL_9;
  v31 = 0.0;
  if (v28 != v25 || v21 <= 0.0)
  {
    v33 = 0.0;
    goto LABEL_15;
  }
  v32 = v27 <= 0.0;
  v33 = 0.0;
  if (!v32)
    goto LABEL_9;
LABEL_15:
  -[PLBatteryUIResponseTypeUsageTimes_iOS responderService](self, "responderService");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "storage");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UsageTime"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "entriesForKey:inTimeRange:withFilters:", v35, 0, v31, v33);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS setAggregateEntries:](self, "setAggregateEntries:", v36);

}

- (void)run
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "Usage Times: failed to gather dependencies. Times will not be adjusted.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  -[PLBatteryUIResponseTypeUsageTimes_iOS setAggregateEntries:](self, "setAggregateEntries:", 0);
  -[PLBatteryUIResponseTypeUsageTimes_iOS setBatteryBreakdown_lastDay:](self, "setBatteryBreakdown_lastDay:", 0);
  -[PLBatteryUIResponseTypeUsageTimes_iOS setBatteryBreakdown_buckets:](self, "setBatteryBreakdown_buckets:", 0);
  return -[PLBatteryUIResponseTypeUsageTimes_iOS resultDictionary](self, "resultDictionary");
}

- (BOOL)gatherDependencies
{
  void *v3;
  NSObject *v4;
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
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeUsageTimes_iOS batteryBreakdown_lastDay](self, "batteryBreakdown_lastDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    PLBatteryUsageUIKeyFromConfiguration();
    v4 = objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeUsageTimes_iOS responderService](self, "responderService");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "responseCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", &unk_1EA1BFF60);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("result"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PLBatteryUIResponseTypeUsageTimes_iOS gatherDependencies].cold.1();

      goto LABEL_16;
    }
    -[PLBatteryUIResponseTypeUsageTimes_iOS setBatteryBreakdown_lastDay:](self, "setBatteryBreakdown_lastDay:", v10);

  }
  -[PLBatteryUIResponseTypeUsageTimes_iOS batteryBreakdown_buckets](self, "batteryBreakdown_buckets");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v29[0] = CFSTR("end");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryUIResponseTypeUsageTimes_iOS end](self, "end");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeUsageTimes_iOS start](self, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSinceDate:", v14);
    objc_msgSend(v12, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = CFSTR("bucket");
    v30[0] = v15;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryUIResponseTypeUsageTimes_iOS bucketSize](self, "bucketSize");
    objc_msgSend(v16, "numberWithDouble:");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PLBatteryUsageUIKeyFromConfiguration();
    v4 = objc_claimAutoreleasedReturnValue();

    -[PLBatteryUIResponseTypeUsageTimes_iOS responderService](self, "responderService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "responseCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", &unk_1EA1BFF60);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "objectForKeyedSubscript:", v4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("result"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBreakdownKey"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[PLBatteryUIResponseTypeUsageTimes_iOS setBatteryBreakdown_buckets:](self, "setBatteryBreakdown_buckets:", v24);

      goto LABEL_7;
    }
    PLLogCommon();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[PLBatteryUIResponseTypeUsageTimes_iOS gatherDependencies].cold.2(self, v27);

LABEL_16:
    v25 = 0;
    goto LABEL_17;
  }
LABEL_7:
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeUsageTimes_iOS gatherDependencies].cold.3();
  v25 = 1;
LABEL_17:

  return v25;
}

- (int)adjustScreenOnTimeWithGraphValue:(double)a3 andEnergyEntries:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  double v14;
  double v15;
  int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (-[PLBatteryUIResponseTypeUsageTimes_iOS energyEntryValidForAdjustment:](self, "energyEntryValidForAdjustment:", v12, (_QWORD)v18))
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "doubleValue");
            v15 = v14;

            v10 = v10 + floor(v15 / 60.0) * 60.0;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v8);
    }
    else
    {
      v10 = 0.0;
    }

    v16 = (int)v10;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (int)adjustScreenOffTimeWithGraphValue:(double)a3 screenOnTime:(double)a4 andEnergyEntries:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  int v20;
  double v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      v13 = 0.0;
      v14 = 0.0;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if (-[PLBatteryUIResponseTypeUsageTimes_iOS energyEntryValidForAdjustment:](self, "energyEntryValidForAdjustment:", v16, (_QWORD)v23))
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "doubleValue");
            v19 = v18;

            v14 = v14 + floor(v19 / 60.0) * 60.0;
            if (v19 > v13)
              v13 = v19;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }
    else
    {
      v13 = 0.0;
      v14 = 0.0;
    }

    if (v14 >= a3)
      v21 = a3;
    else
      v21 = v14;
    if (v21 < v13 - a4)
      v21 = v13 - a4;
    v20 = (int)v21;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)energyEntryValidForAdjustment:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  BOOL v17;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (int)((double)(int)objc_msgSend(v6, "intValue") + 0.5);

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v10 + v13;
  if (v7 <= 0 && v15 < 60.0)
  {
LABEL_9:
    v17 = 0;
    goto LABEL_11;
  }
  v17 = 0;
  if (v5 != 5 && v5 != 2)
  {
    if (v5 != 1 || (objc_msgSend(v14, "isEqualToString:", CFSTR("PowerOutAccessories"), v15) & 1) == 0)
    {
      v17 = 1;
      goto LABEL_11;
    }
    goto LABEL_9;
  }
LABEL_11:

  return v17;
}

- (_PLTimeIntervalRange)getDataRange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;
  _PLTimeIntervalRange result;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D80368];
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UsageTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v5, *MEMORY[0x1E0D80190]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUsageTimes_iOS responderService](self, "responderService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "storage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstEntryForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "entryDate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:].cold.4();

  }
  else
  {
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeUsageTimes_iOS getDataRange:].cold.3();

    v10 = v4;
  }
  -[PLBatteryUIResponseTypeUsageTimes_iOS responderService](self, "responderService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "storage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstEntryForKey:", v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "entryDate");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:].cold.2();

  }
  else
  {
    PLLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeUsageTimes_iOS getDataRange:].cold.1();

    v16 = v4;
  }
  objc_msgSend(v16, "laterDate:", v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v4;
  objc_msgSend(v19, "timeIntervalSince1970");
  v22 = v21;
  objc_msgSend(v20, "timeIntervalSince1970");
  v24 = v23;

  v25 = v24 - v22;
  PLLogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (void *)MEMORY[0x1E0CB3940];
    v36 = v15;
    v28 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22);
    v29 = v10;
    v30 = v6;
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22 + v25);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Start: %@, End %@"), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v28;
    v15 = v36;

    v6 = v30;
    v10 = v29;
    *(_DWORD *)buf = 138412290;
    v39 = v33;
    _os_log_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);

  }
  v34 = v22;
  v35 = v25;
  result.length = v35;
  result.location = v34;
  return result;
}

- (id)entriesInRange:(_PLTimeIntervalRange)a3 fromEntries:(id)a4
{
  double length;
  double location;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  length = a3.length;
  location = a3.location;
  v26 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = location + length;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "entryDate", (_QWORD)v21);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = v15;
          objc_msgSend(v15, "timeIntervalSince1970");
          v18 = v17;

          if (location <= v18 && v18 < v12)
            objc_msgSend(v7, "addObject:", v14);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  return v7;
}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)range
{
  return self->_range;
}

- (void)setRange:(double)a3
{
  self->_range = a3;
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSArray)aggregateEntries
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAggregateEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)resultDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResultDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableArray)batteryBreakdown_buckets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setBatteryBreakdown_buckets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableArray)batteryBreakdown_lastDay
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBatteryBreakdown_lastDay:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryBreakdown_lastDay, 0);
  objc_storeStrong((id *)&self->_batteryBreakdown_buckets, 0);
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_aggregateEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)gatherDependencies
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Usage Times: Successfully retrieved Battery Breakdown from cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)getDataRange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "No first RNE entry!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)getDataRange:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "No first usage time entry!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

@end
