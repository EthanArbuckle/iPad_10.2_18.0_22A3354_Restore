@implementation PLBatteryUIResponseTypeBackgroundAppUsageInsight

- (id)dependencies
{
  return &unk_1EA1DBE18;
}

- (void)configure:(id)a3
{
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight generateRangeFromConfiguration:](self, "generateRangeFromConfiguration:", a3);
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight buildBucketsForRange:](self, "buildBucketsForRange:");
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight buckets](self, "buckets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight buckets](self, "buckets");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight applyTransformationsForBuckets:](self, "applyTransformationsForBuckets:", v7);

  }
  else
  {
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight configure:].cold.1();

  }
}

- (void)run
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_9_0();
  _os_log_debug_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_DEBUG, "---------- App Background Usage Insight: Tracking %u days of activity -------------------", v1, 8u);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight appsForBackgroundActivityInsight](self, "appsForBackgroundActivityInsight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 >= 2)
  {
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight appsForBackgroundActivityInsight](self, "appsForBackgroundActivityInsight");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_17);

  }
  if (!-[PLBatteryUIResponseTypeBackgroundAppUsageInsight suggest](self, "suggest"))
    return MEMORY[0x1E0C9AA70];
  v9[0] = CFSTR("PLBatteryUISuggestionTypeKey");
  v9[1] = CFSTR("PLBatteryUIInsightBackgroundAppUsageAppKey");
  v10[0] = &unk_1EA1C07A0;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight appsForBackgroundActivityInsight](self, "appsForBackgroundActivityInsight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __58__PLBatteryUIResponseTypeBackgroundAppUsageInsight_result__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "valueForKey:", CFSTR("PLBatteryUIInsightAverageDrainKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  objc_msgSend(v4, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "valueForKey:", CFSTR("PLBatteryUIInsightAverageDrainKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -objc_msgSend(v7, "compare:", v10);
  return v11;
}

- (id)perAppUsageForBatteryBreakdown:(id)a3 withStart:(unint64_t)a4 withEnd:(unint64_t)a5 withThresholdAboveDailyBackgroundDrainPercentage:(unint64_t)a6
{
  __int128 v9;
  double v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  BOOL v60;
  void *v61;
  NSObject *v62;
  void *v63;
  __int128 v65;
  unint64_t v66;
  id v67;
  void *v68;
  unint64_t v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  id obj;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  void *v79;
  __int16 v80;
  double v81;
  __int16 v82;
  double v83;
  __int16 v84;
  double v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v67 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v66 = a5;
  if (a4 < a5)
  {
    v10 = (double)a6;
    *(_QWORD *)&v9 = 67109120;
    v65 = v9;
    while (1)
    {
      objc_msgSend(v67, "objectAtIndexedSubscript:", a4, v65);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v65;
        LODWORD(v79) = a4;
        _os_log_debug_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_DEBUG, "---------- App Background Usage Insight: Bucket %d -------------------", buf, 8u);
      }
      v69 = a4;

      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v68 = v11;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
      obj = (id)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
      v14 = v70;
      if (v13)
        break;
LABEL_25:

      a4 = v69 + 1;
      if (v69 + 1 == v66)
        goto LABEL_26;
    }
    v15 = v13;
    v16 = *(_QWORD *)v75;
    v71 = *(_QWORD *)v75;
LABEL_7:
    v17 = 0;
    v72 = v15;
    while (1)
    {
      if (*(_QWORD *)v75 != v16)
        objc_enumerationMutation(obj);
      v18 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v17);
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v21 > 0.0)
        goto LABEL_23;
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("PLBatteryUISuggestionEnergyKey"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "doubleValue");
      v27 = v26;

      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;

      v31 = v27 + v30;
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppNameKey"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v33, CFSTR("PLBatteryUIInsightAppNameKey"));

      objc_msgSend(v32, "setObject:forKeyedSubscript:", v22, CFSTR("PLBatteryUIInsightBundleIDKey"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v31);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v34, CFSTR("PLBatteryUISuggestionEnergyKey"));

      objc_msgSend(&unk_1EA1DBE30, "objectAtIndexedSubscript:", 48);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;

      objc_msgSend(&unk_1EA1DBE48, "objectAtIndexedSubscript:", 12);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "doubleValue");
      v42 = v38 + v41;

      objc_msgSend(&unk_1EA1DBE60, "objectAtIndexedSubscript:", 13);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "doubleValue");
      v46 = v42 + v45;

      v47 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("kLocationEnergy"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "doubleValue");
      objc_msgSend(v47, "numberWithDouble:", v46 + v49);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v50, CFSTR("kLocationEnergy"));

      +[PLUtilities defaultBatteryEnergyCapacity](PLUtilities, "defaultBatteryEnergyCapacity");
      v52 = v30 * 100.0 / v51;
      v53 = MEMORY[0x1E0C9AAA0];
      if (v52 <= v10)
        goto LABEL_14;
      objc_msgSend(v32, "objectForKey:", CFSTR("PLBatteryUIInsightDailyDrainBoolKey"));
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v54)
        break;
LABEL_15:
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("kHasUsageEvent"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v55, "BOOLValue"))
      {

        v56 = MEMORY[0x1E0C9AAB0];
      }
      else
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", v22);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectForKeyedSubscript:", CFSTR("kHasUsageEvent"));
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend(v58, "BOOLValue");

        v60 = v59 == 0;
        v14 = v70;
        if (v60)
          v56 = MEMORY[0x1E0C9AAA0];
        else
          v56 = MEMORY[0x1E0C9AAB0];
      }
      v16 = v71;
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v56, CFSTR("kHasUsageEvent"));
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v32, v61);

      PLLogCommon();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("kHasUsageEvent"));
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v79 = v22;
        v80 = 2048;
        v81 = v31;
        v82 = 2048;
        v83 = v52;
        v84 = 2048;
        v85 = v46;
        v86 = 2112;
        v87 = v63;
        _os_log_debug_impl(&dword_1DA9D6000, v62, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: %@ has %f energy used per bucket(%f%%) and %f mwh location energy, has usage event in bucket: %@", buf, 0x34u);

      }
      v15 = v72;
LABEL_23:
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
        if (!v15)
          goto LABEL_25;
        goto LABEL_7;
      }
    }
    v53 = MEMORY[0x1E0C9AAB0];
LABEL_14:
    objc_msgSend(v32, "setObject:forKeyedSubscript:", v53, CFSTR("PLBatteryUIInsightDailyDrainBoolKey"));
    goto LABEL_15;
  }
LABEL_26:

  return v70;
}

- (id)appsForBackgroundActivityInsightFromApps:(id)a3 withThresholdAboveAverageBackgroundDrainPercentage:(unint64_t)a4 locationEnergyThreshold:(double)a5 inNDays:(unint64_t)a6
{
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  int v40;
  NSObject *v41;
  int v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  uint64_t v55;
  __int16 v56;
  double v57;
  __int16 v58;
  int v59;
  __int16 v60;
  double v61;
  __int16 v62;
  int v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v51;
    v15 = (double)a4;
    *(_QWORD *)&v12 = 138412290;
    v48 = v12;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v51 != v14)
          objc_enumerationMutation(v10);
        v17 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", v17, v48);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKey:", CFSTR("PLBatteryUISuggestionEnergyKey"));
        v19 = objc_claimAutoreleasedReturnValue();
        if (!v19)
          goto LABEL_18;
        v20 = (void *)v19;
        objc_msgSend(v10, "objectForKey:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", CFSTR("kLocationEnergy"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLBatteryUISuggestionEnergyKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          v26 = v25;

          +[PLUtilities defaultBatteryEnergyCapacity](PLUtilities, "defaultBatteryEnergyCapacity");
          v28 = round(v26 * 100.0 / v27 / (double)a6);
          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("kLocationEnergy"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31 * 100.0;
          +[PLUtilities defaultBatteryEnergyCapacity](PLUtilities, "defaultBatteryEnergyCapacity");
          v34 = v32 / v33;

          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("PLBatteryUIInsightDailyDrainBoolKey"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqual:", MEMORY[0x1E0C9AAB0]);

          objc_msgSend(v10, "objectForKeyedSubscript:", v17);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("kHasUsageEvent"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "BOOLValue");

          PLLogCommon();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413314;
            v55 = v17;
            v56 = 2048;
            v57 = v26;
            v58 = 1024;
            v59 = (int)v28;
            v60 = 2048;
            v61 = v34;
            v62 = 1024;
            v63 = v40;
            _os_log_debug_impl(&dword_1DA9D6000, v41, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: %@ has %f mwh total average energy used (estimated %u%%) and %f%% location energy used, has usage events: %d", buf, 0x2Cu);
          }

          v42 = v37 ^ 1;
          if (v28 < v15)
            v42 = 1;
          if (v34 < a5)
            v42 = 1;
          if (((v42 | v40) & 1) == 0)
          {
            PLLogCommon();
            v43 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v48;
              v55 = v17;
              _os_log_debug_impl(&dword_1DA9D6000, v43, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: %@ has met the criteria!", buf, 0xCu);
            }

            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v17);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("PLBatteryUIInsightAppNameKey"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v45, CFSTR("PLBatteryUIInsightAppNameKey"));

            objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("PLBatteryUIInsightBundleIDKey"));
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setObject:forKeyedSubscript:", v46, CFSTR("PLBatteryUIInsightAverageDrainKey"));

            objc_msgSend(v49, "addObject:", v18);
LABEL_18:

            continue;
          }
        }
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v64, 16);
    }
    while (v13);
  }

  return v49;
}

- (int64_t)daysToTrackActivityForBatteryBreakdown:(int64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;

  if (a3 >= 14)
    v4 = 14;
  else
    v4 = a3;
  if (+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_BACKGROUND_ACTIVITY_DAYS"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && (int)objc_msgSend(v5, "intValue") >= 1 && (int)objc_msgSend(v6, "intValue") < a3)
      v4 = (int)objc_msgSend(v6, "intValue");

  }
  return v4;
}

- (double)dailyBackgroundDrainThreshold
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = 1.0;
  if (+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_BACKGROUND_ACTIVITY_DAILY_THRESHOLD"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "doubleValue");
      if (v5 > 0.0)
      {
        objc_msgSend(v4, "doubleValue");
        v2 = v6;
      }
    }

  }
  return v2;
}

- (id)mockAppForBackgroundActivityInsight
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Test App"), CFSTR("PLBatteryUIInsightAppNameKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("BackgroundAppUsageTestApp"), CFSTR("PLBatteryUIInsightBundleIDKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA1C07B8, CFSTR("PLBatteryUIInsightAverageDrainKey"));
  objc_msgSend(v2, "addObject:", v3);

  return v2;
}

- (double)averageBackgroundDrainThreshold
{
  double v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  v2 = 5.0;
  if (+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_BACKGROUND_ACTIVITY_AVERAGE_THRESHOLD"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "doubleValue");
      if (v5 > 0.0)
      {
        objc_msgSend(v4, "doubleValue");
        v2 = v6;
      }
    }

  }
  return v2;
}

- (double)locationEnergyDrainThreshold
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  if (!+[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode"))
    return 0.1;
  +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_BACKGROUND_LOCATION_ENERGY_THRESHOLD"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 0.1;
  if (v2)
  {
    objc_msgSend(v2, "doubleValue");
    if (v5 > 0.0)
    {
      objc_msgSend(v3, "doubleValue");
      v4 = v6;
    }
  }

  return v4;
}

- (BOOL)shouldShowInsightThroughOverrides
{
  _BOOL4 v2;
  void *v3;
  char v4;

  v2 = +[PLUtilities inBUIDemoMode](PLUtilities, "inBUIDemoMode");
  if (v2)
  {
    +[PLUtilities powerlogDefaultForKey:](PLUtilities, "powerlogDefaultForKey:", CFSTR("BUI_BACKGROUNDAPPUSAGE_SUGGESTION_SHOW"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (_PLTimeIntervalRange)generateRangeFromConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _PLTimeIntervalRange result;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timestamp"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setStart:](self, "setStart:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setEnd:](self, "setEnd:", v15);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setBucketSize:](self, "setBucketSize:");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setMonotonicNow:](self, "setMonotonicNow:", v17);

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight start](self, "start");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight end](self, "end");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  v21 = v20;
  objc_msgSend(v19, "timeIntervalSince1970");
  v23 = v22 - v21;

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight monotonicNow](self, "monotonicNow");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getDataRange:](self, "getDataRange:", v24);
  v26 = v25;
  v28 = v27;

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight generateRange:withDataRange:](self, "generateRange:withDataRange:", v21 + -1800.0, v23 + 1800.0, v26, v28);
  result.length = v30;
  result.location = v29;
  return result;
}

- (_PLTimeIntervalRange)generateRange:(_PLTimeIntervalRange)result withDataRange:(_PLTimeIntervalRange)a4
{
  double location;
  double v5;
  BOOL v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;

  if (a4.location == 0.0 && a4.length == 0.0)
  {
    location = result.location;
    goto LABEL_21;
  }
  v5 = result.location + result.length;
  if (result.location < a4.location)
  {
    v6 = v5 == a4.location;
    v7 = v5 < a4.location;
  }
  else
  {
    v6 = 1;
    v7 = 0;
  }
  if (!v7 && !v6)
  {
    v8 = a4.location + a4.length;
LABEL_14:
    if (result.location >= a4.location)
      location = result.location;
    else
      location = a4.location;
    if (v5 >= v8)
      v9 = v8;
    else
      v9 = v5;
    result.length = v9 - location;
    goto LABEL_21;
  }
  v8 = a4.location + a4.length;
  if (a4.location < result.location && v8 > result.location)
    goto LABEL_14;
  location = 0.0;
  if (result.location != a4.location || result.length <= 0.0)
  {
    result.length = 0.0;
    goto LABEL_21;
  }
  result.length = 0.0;
  if (a4.length > 0.0)
    goto LABEL_14;
LABEL_21:
  v10 = location;
  result.location = v10;
  return result;
}

- (void)buildBucketsForRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  int v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v6 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight computeNumberOfBuckets](self, "computeNumberOfBuckets");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setBuckets:](self, "setBuckets:", v7);

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight initializeBucketsWithRange:](self, "initializeBucketsWithRange:", location, length);
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight prepareBucketsWithRange:](self, "prepareBucketsWithRange:", location, length);
}

- (int)computeNumberOfBuckets
{
  PLBatteryUIResponseTypeBackgroundAppUsageInsight *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v2 = self;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight end](self, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight start](v2, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight bucketSize](v2, "bucketSize");
  LODWORD(v2) = llround(v6 / v7);

  return (int)v2;
}

- (void)initializeBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  double v13;
  double v14;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getRootNodeEntriesInRange:withTimeInterval:](self, "getRootNodeEntriesInRange:withTimeInterval:", a3.location, a3.length, 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getQualificationNodeEntriesInRange:withTimeInterval:](self, "getQualificationNodeEntriesInRange:withTimeInterval:", location, length, 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke;
  v10[3] = &unk_1EA16F660;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v13 = location;
  v14 = length;
  v8 = v7;
  v9 = v6;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight enumerateBucketsUsingBlock:](self, "enumerateBucketsUsingBlock:", v10);

}

void __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v3 = a1 + 32;
  objc_msgSend(*(id *)(a1 + 32), "buildEnergyEntriesWithRootNodes:andQualificationNodes:andRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v3, "buildBucketWithEnergyEntries:andRange:", v4, *(double *)(v3 + 24), *(double *)(v3 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v3, "buckets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:atIndexedSubscript:", v5, a2);

  objc_msgSend(*(id *)v3, "buckets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLBatteryUIResponseTypeUtilities collapseEnergyEntries:](PLBatteryUIResponseTypeUtilities, "collapseEnergyEntries:", v8);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke_cold_1((id *)v3);

}

- (id)getRootNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4
{
  double length;
  double location;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80190]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getQualificationNodeEntriesInRange:(_PLTimeIntervalRange)a3 withTimeInterval:(double)a4
{
  double length;
  double location;
  void *v8;
  void *v9;

  length = a3.length;
  location = a3.location;
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80368], *MEMORY[0x1E0D80168]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)getNodeEntriesForEntryKey:(id)a3 withRange:(_PLTimeIntervalRange)a4 andTimeInterval:(double)a5
{
  double length;
  double location;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  length = a4.length;
  location = a4.location;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = *MEMORY[0x1E0D801E8];
  v11 = a3;
  objc_msgSend(v9, "stringWithFormat:", CFSTR("(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')"), v10, v10, CFSTR("null"), v10, CFSTR("unknown"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = *MEMORY[0x1E0D80178];
  objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ IN (SELECT ID FROM '%@' WHERE %@)"), v14, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@));"),
    v11,
    *(_QWORD *)&location,
    location + length,
    *(_QWORD *)&a5,
    v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "entriesForKey:withQuery:", v11, v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)buildEnergyEntriesWithRootNodes:(id)a3 andQualificationNodes:(id)a4 andRange:(_PLTimeIntervalRange)a5
{
  double length;
  double location;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  length = a5.length;
  location = a5.location;
  v9 = a4;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight processRootNodes:inRange:](self, "processRootNodes:inRange:", a3, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight processQualificationNodes:inRange:](self, "processQualificationNodes:inRange:", v9, location, length);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  return v13;
}

- (id)processRootNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
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
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  double v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  int v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  void *v42;
  double v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  NSObject *v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  int v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v78;
  uint64_t v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[4];
  _BYTE v86[18];
  _BYTE v87[128];
  uint64_t v88;

  length = a4.length;
  location = a4.location;
  v88 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v82;
    v12 = location + length;
    v79 = *MEMORY[0x1E0D801A0];
    v76 = *MEMORY[0x1E0D801A8];
    v71 = *MEMORY[0x1E0D80198];
    v70 = *MEMORY[0x1E0D22C78];
    v72 = v8;
    v73 = v7;
    v69 = *(_QWORD *)v82;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v82 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1DF0A47AC]();
        objc_msgSend(v14, "entryDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (v16)
        {
          objc_msgSend(v16, "timeIntervalSince1970");
          if (location <= v18)
          {
            v19 = v18;

            if (v12 < v19)
              goto LABEL_35;
            objc_msgSend(v14, "objectForKeyedSubscript:", v79);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v17);
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v20)
              {
                -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "objectForKeyedSubscript:", v17);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v22)
                {
                  v7 = v73;
                  goto LABEL_34;
                }
                v23 = (void *)MEMORY[0x1E0C99E08];
                -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "objectForKeyedSubscript:", v17);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "dictionaryWithObject:forKey:", v25, CFSTR("PLBatteryUIAppBundleIDKey"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v7 = v73;
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v26, v17);

                v8 = v72;
              }
              objc_msgSend(v7, "objectForKeyedSubscript:", v17);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v76);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "intValue");
              if (objc_msgSend(&unk_1EA1DBE78, "count") <= (unint64_t)v28)
              {
                PLLogCommon();
                v37 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
                {
                  v38 = objc_msgSend(v27, "intValue");
                  v39 = objc_msgSend(&unk_1EA1DBE90, "count");
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v86 = v38;
                  *(_WORD *)&v86[4] = 2048;
                  *(_QWORD *)&v86[6] = v39;
                  _os_log_error_impl(&dword_1DA9D6000, v37, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                }
              }
              else
              {
                objc_msgSend(&unk_1EA1DBEA8, "objectAtIndexedSubscript:", (int)objc_msgSend(v27, "intValue"));
                v29 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "objectForKeyedSubscript:", v71);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v78 = v27;
                if (objc_msgSend(v27, "intValue") == 58)
                {
                  v31 = v29;
                  PLLogCommon();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                  {
                    v60 = objc_msgSend(v78, "intValue");
                    objc_msgSend(v30, "doubleValue");
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v86 = v60;
                    *(_WORD *)&v86[4] = 2048;
                    *(_QWORD *)&v86[6] = v61;
                    _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                  }

                  v33 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v30, "doubleValue");
                  objc_msgSend(v33, "numberWithDouble:", fmin(v34, 9000.0));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  PLLogCommon();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    goto LABEL_41;
                  goto LABEL_25;
                }
                v40 = v27;
                v31 = v29;
                if (objc_msgSend(v40, "intValue") == 59)
                {
                  PLLogCommon();
                  v41 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    v62 = objc_msgSend(v78, "intValue");
                    objc_msgSend(v30, "doubleValue");
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v86 = v62;
                    *(_WORD *)&v86[4] = 2048;
                    *(_QWORD *)&v86[6] = v63;
                    _os_log_debug_impl(&dword_1DA9D6000, v41, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                  }

                  v42 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v30, "doubleValue");
                  objc_msgSend(v42, "numberWithDouble:", fmin(v43, 5500.0));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  PLLogCommon();
                  v36 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                  {
LABEL_41:
                    v64 = objc_msgSend(v78, "intValue");
                    objc_msgSend(v35, "doubleValue");
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v86 = v64;
                    *(_WORD *)&v86[4] = 2048;
                    *(_QWORD *)&v86[6] = v65;
                    _os_log_debug_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEBUG, "after clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                  }
LABEL_25:

                  v30 = v35;
                }
                -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "objectForKeyedSubscript:", v17);
                v45 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v70, CFSTR("aod"));
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v75 = v45;
                if (!objc_msgSend(v45, "isEqualToString:"))
                  goto LABEL_31;
                PLLogCommon();
                v46 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v86 = v31;
                  _os_log_impl(&dword_1DA9D6000, v46, OS_LOG_TYPE_DEFAULT, "found AOD in root node %@", buf, 0xCu);
                }

                if (objc_msgSend(v78, "intValue") == 56
                  || objc_msgSend(v78, "intValue") == 57)
                {
LABEL_31:
                  v47 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v80, "objectForKeyedSubscript:", v31);
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v48, "doubleValue");
                  v50 = v49;
                  objc_msgSend(v30, "doubleValue");
                  objc_msgSend(v47, "numberWithDouble:", v50 + v51 / 1000.0);
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v80, "setObject:forKeyedSubscript:", v52, v31);

                  v53 = (void *)MEMORY[0x1E0CB37E8];
                  objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                  v54 = objc_claimAutoreleasedReturnValue();
                  -[NSObject doubleValue](v54, "doubleValue");
                  v56 = v55;
                  objc_msgSend(v30, "doubleValue");
                  objc_msgSend(v53, "numberWithDouble:", v56 + v57 / 1000.0);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v11 = v69;
                  v37 = v31;
                  objc_msgSend(v80, "setObject:forKeyedSubscript:", v58, CFSTR("PLBatteryUIAppEnergyValueKey"));

                  v8 = v72;
                }
                else
                {
                  PLLogCommon();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v30, "doubleValue");
                    *(_DWORD *)buf = 138412546;
                    v37 = v31;
                    *(_QWORD *)v86 = v31;
                    *(_WORD *)&v86[8] = 2048;
                    *(double *)&v86[10] = v59 / 1000.0;
                    _os_log_impl(&dword_1DA9D6000, v54, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node energy of %f mWh", buf, 0x16u);
                  }
                  else
                  {
                    v37 = v31;
                  }
                }

                v7 = v73;
                v27 = v78;
              }

            }
          }
        }
LABEL_34:

LABEL_35:
        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v10 != v13);
      v66 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
      v10 = v66;
    }
    while (v66);
  }

  objc_msgSend(v7, "allValues");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  return v67;
}

- (id)processQualificationNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
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
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  NSObject *v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  NSObject *v53;
  NSObject *v54;
  int v55;
  uint64_t v56;
  double v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  NSObject *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  _BYTE v84[18];
  _BYTE v85[128];
  uint64_t v86;

  length = a4.length;
  location = a4.location;
  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v80;
    v12 = location + length;
    v13 = *MEMORY[0x1E0D801A0];
    v75 = *MEMORY[0x1E0D80188];
    v71 = *MEMORY[0x1E0D80180];
    v63 = *MEMORY[0x1E0D22C78];
    v64 = *MEMORY[0x1E0D80170];
    v72 = v7;
    v76 = *(_QWORD *)v80;
    v77 = v8;
    v65 = *MEMORY[0x1E0D801A0];
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v80 != v11)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1DF0A47AC]();
        objc_msgSend(v15, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "timeIntervalSince1970");
          if (location <= v19)
          {
            v20 = v19;

            if (v12 < v20)
              goto LABEL_30;
            objc_msgSend(v15, "objectForKeyedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v7, "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
                goto LABEL_13;
              -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v24 = (void *)MEMORY[0x1E0C99E08];
                -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v18);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "dictionaryWithObject:forKey:", v26, CFSTR("PLBatteryUIAppBundleIDKey"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v18);

LABEL_13:
                objc_msgSend(v7, "objectForKeyedSubscript:", v18);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", v75);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "intValue");
                if (objc_msgSend(&unk_1EA1DBEC0, "count") <= (unint64_t)v30)
                {
                  PLLogCommon();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
                  {
                    v55 = objc_msgSend(v29, "intValue");
                    v56 = objc_msgSend(&unk_1EA1DBED8, "count");
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v84 = v55;
                    *(_WORD *)&v84[4] = 2048;
                    *(_QWORD *)&v84[6] = v56;
                    _os_log_error_impl(&dword_1DA9D6000, v54, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                  }
                }
                else
                {
                  v78 = v28;
                  v31 = v13;
                  objc_msgSend(&unk_1EA1DBEF0, "objectAtIndexedSubscript:", (int)objc_msgSend(v29, "intValue"));
                  v32 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v71);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "intValue");
                  v74 = v32;
                  if (objc_msgSend(&unk_1EA1DBF08, "count") <= (unint64_t)v34)
                  {
                    PLLogCommon();
                    v53 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
                    {
                      v58 = objc_msgSend(v33, "intValue");
                      v59 = objc_msgSend(&unk_1EA1DBF20, "count");
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v84 = v58;
                      *(_WORD *)&v84[4] = 2048;
                      *(_QWORD *)&v84[6] = v59;
                      _os_log_error_impl(&dword_1DA9D6000, v53, OS_LOG_TYPE_ERROR, "qualificationID=%d out of bounds=%lu", buf, 0x12u);
                    }
                  }
                  else
                  {
                    v70 = v33;
                    objc_msgSend(&unk_1EA1DBF38, "objectAtIndexedSubscript:", (int)objc_msgSend(v33, "intValue"));
                    v35 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v35, v32);
                    v69 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "objectForKeyedSubscript:", v64);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v36, "objectForKeyedSubscript:", v18);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v63, CFSTR("aod"));
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    v67 = v37;
                    if (!objc_msgSend(v37, "isEqualToString:"))
                      goto LABEL_20;
                    PLLogCommon();
                    v38 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v84 = v32;
                      _os_log_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEFAULT, "found AOD in qual for root node %@", buf, 0xCu);
                    }

                    if (objc_msgSend(v29, "intValue") == 56
                      || objc_msgSend(v29, "intValue") == 57)
                    {
LABEL_20:
                      v39 = (void *)MEMORY[0x1E0CB37E8];
                      v40 = (void *)v69;
                      objc_msgSend(v78, "objectForKeyedSubscript:", v69);
                      v41 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "doubleValue");
                      v43 = v42;
                      objc_msgSend(v68, "doubleValue");
                      objc_msgSend(v39, "numberWithDouble:", v43 + v44 / 1000.0);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "setObject:forKeyedSubscript:", v45, v69);

                      v46 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v78, "objectForKeyedSubscript:", v35);
                      v47 = objc_claimAutoreleasedReturnValue();
                      -[NSObject doubleValue](v47, "doubleValue");
                      v49 = v48;
                      objc_msgSend(v68, "doubleValue");
                      objc_msgSend(v46, "numberWithDouble:", v49 + v50 / 1000.0);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "setObject:forKeyedSubscript:", v51, v35);

                      v52 = v68;
                      v31 = v65;
                    }
                    else
                    {
                      PLLogCommon();
                      v47 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
                      {
                        v52 = v68;
                        objc_msgSend(v68, "doubleValue");
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)v84 = v32;
                        *(_WORD *)&v84[8] = 2048;
                        *(double *)&v84[10] = v57 / 1000.0;
                        _os_log_impl(&dword_1DA9D6000, v47, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node qual energy of %f mWh", buf, 0x16u);
                        v31 = v65;
                        v40 = (void *)v69;
                      }
                      else
                      {
                        v31 = v65;
                        v40 = (void *)v69;
                        v52 = v68;
                      }
                    }

                    v33 = v70;
                    v53 = v35;
                  }

                  v7 = v72;
                  v13 = v31;
                  v28 = v78;
                  v54 = v74;
                }

              }
              v11 = v76;
              v8 = v77;
            }
          }
        }

LABEL_30:
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v10 != v14);
      v60 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
      v10 = v60;
    }
    while (v60);
  }

  objc_msgSend(v7, "allValues");
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

- (id)buildBucketWithEnergyEntries:(id)a3 andRange:(_PLTimeIntervalRange)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", a3, CFSTR("PLBatteryUIAppArrayKey"), a4.location, a4.length);
}

- (void)prepareBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getAppRuntimesInRange:](self, "getAppRuntimesInRange:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getAppUsageEventsInRange:](self, "getAppUsageEventsInRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight prepareBucketsWithRange:].cold.2(v6);

  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight prepareBucketsWithRange:].cold.1(v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PLBatteryUIResponseTypeBackgroundAppUsageInsight_prepareBucketsWithRange___block_invoke;
  v12[3] = &unk_1EA16F688;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight enumerateBucketsUsingBlock:](self, "enumerateBucketsUsingBlock:", v12);

}

void __76__PLBatteryUIResponseTypeBackgroundAppUsageInsight_prepareBucketsWithRange___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  objc_msgSend(*(id *)(a1 + 32), "buckets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "processAppTimeEntries:inRange:withAppArray:", *(_QWORD *)(a1 + 40), v10, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "processAppUsageEventsEntries:inRange:withAppArray:", *(_QWORD *)(a1 + 48), v11, a3, a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "buckets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIAppArrayKey"));

}

- (id)getNodeIDToNodeNameMap
{
  void *v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  const __CFString *v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')"), *MEMORY[0x1E0D801E8], *MEMORY[0x1E0D801E8], CFSTR("null"), *MEMORY[0x1E0D801E8], CFSTR("unknown"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = *MEMORY[0x1E0D80178];
    objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)v5;
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ IN (SELECT ID FROM '%@' WHERE %@)"), v7, v8, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "storage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80388], *MEMORY[0x1E0D801E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = CFSTR("WHERE");
    v32[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "entriesForKey:withProperties:", v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v16 = v14;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v21, "name");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v21, "entryID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v23);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v18);
    }

    -[PLBatteryUIResponseTypeBackgroundAppUsageInsight setNodeIDsToNodeNames:](self, "setNodeIDsToNodeNames:", v15);
    v24 = (void *)objc_msgSend(v15, "copy");

    return v24;
  }
}

- (id)processAppTimeEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length;
  double location;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  int v38;
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
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t m;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  void *v66;
  void *v67;
  id obj;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  length = a4.length;
  location = a4.location;
  v96 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v65 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v89;
    v14 = location + length;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v89 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        objc_msgSend(v16, "entryDate");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;
          objc_msgSend(v17, "timeIntervalSince1970");
          v20 = v19;

          if (location <= v20 && v20 < v14)
            objc_msgSend(v9, "addObject:", v16);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
    }
    while (v12);
  }
  v67 = v10;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v70 = (id)objc_claimAutoreleasedReturnValue();
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  v87 = 0u;
  v66 = v9;
  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:", v9);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
  if (v22)
  {
    v23 = v22;
    v69 = *(_QWORD *)v85;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v85 != v69)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * j);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "addObject:", v26);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setObject:forKeyedSubscript:", v27, v26);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "setObject:forKeyedSubscript:", v28, v26);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ScreenOnPluggedInTime"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v73, "setObject:forKeyedSubscript:", v29, v26);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("BackgroundPluggedInTime"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "setObject:forKeyedSubscript:", v30, v26);

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
    }
    while (v23);
  }

  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v31 = v65;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v81;
    do
    {
      for (k = 0; k != v33; ++k)
      {
        if (*(_QWORD *)v81 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * k);
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v70, "containsObject:", v37);

        if (v38)
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "removeObject:", v39);

        }
        objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v75, "objectForKeyedSubscript:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "doubleValue");
        objc_msgSend(v41, "numberWithDouble:");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v43, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

        v44 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v74, "objectForKeyedSubscript:", v40);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "doubleValue");
        objc_msgSend(v44, "numberWithDouble:");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v46, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        v47 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v73, "objectForKeyedSubscript:", v40);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        objc_msgSend(v47, "numberWithDouble:");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v49, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

        v50 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v72, "objectForKeyedSubscript:", v40);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "doubleValue");
        objc_msgSend(v50, "numberWithDouble:");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v52, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
    }
    while (v33);
  }

  v53 = (void *)objc_msgSend(v31, "mutableCopy");
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v71 = v70;
  v54 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
  if (v54)
  {
    v55 = v54;
    v56 = *(_QWORD *)v77;
    do
    {
      for (m = 0; m != v55; ++m)
      {
        if (*(_QWORD *)v77 != v56)
          objc_enumerationMutation(v71);
        v58 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v58, CFSTR("PLBatteryUIAppBundleIDKey"));
        objc_msgSend(v59, "setObject:forKeyedSubscript:", &unk_1EA1C07B8, CFSTR("PLBatteryUIAppTypeKey"));
        objc_msgSend(v75, "objectForKeyedSubscript:", v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v60, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

        objc_msgSend(v74, "objectForKeyedSubscript:", v58);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v61, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        objc_msgSend(v73, "objectForKeyedSubscript:", v58);
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v62, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

        objc_msgSend(v72, "objectForKeyedSubscript:", v58);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "setObject:forKeyedSubscript:", v63, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));

        objc_msgSend(v59, "setObject:forKeyedSubscript:", &unk_1EA1C07B8, CFSTR("PLBatteryUIAppEnergyValueKey"));
        objc_msgSend(v53, "addObject:", v59);

      }
      v55 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v76, v92, 16);
    }
    while (v55);
  }

  return v53;
}

- (double)getNonAppRuntimesWith:(id)a3 identificationKey:(id)a4 andRange:(_PLTimeIntervalRange)a5 withNow:(id)a6
{
  double length;
  double location;
  id v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t i;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _QWORD v53[3];

  length = a5.length;
  location = a5.location;
  v53[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v46 = a6;
  v13 = location + 1800.0;
  v14 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v15, 5);

  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "storage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = (void *)v16;
  v53[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastEntryForKey:withComparisons:isSingleton:", v11, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "BOOLValue");

    if (v22)
      v23 = v13;
    else
      v23 = -1.0;
  }
  else
  {
    v23 = -1.0;
  }
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "storage");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v11;
  objc_msgSend(v25, "entriesForKey:inTimeRange:withFilters:", v11, 0, v13, length);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  objc_msgSend(v26, "reverseObjectEnumerator");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v49;
    v31 = 0.0;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v49 != v30)
          objc_enumerationMutation(v27);
        v33 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v33, "objectForKeyedSubscript:", v12);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "BOOLValue");

        if (v35)
        {
          if (v23 == -1.0)
          {
            objc_msgSend(v33, "entryDate");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "timeIntervalSince1970");
            v23 = v37;

          }
        }
        else
        {
          if (v23 != -1.0)
          {
            objc_msgSend(v33, "entryDate");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "timeIntervalSince1970");
            v40 = v39 - v23;

            v31 = v31 + v40;
          }
          v23 = -1.0;
        }
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v29);
  }
  else
  {
    v31 = 0.0;
  }

  if (v23 == -1.0)
  {
    v41 = v46;
    v43 = v47;
  }
  else
  {
    v41 = v46;
    objc_msgSend(v46, "timeIntervalSince1970");
    if (v42 >= length + v13)
      v42 = length + v13;
    v31 = v31 + v42 - v23;
    v43 = v47;
  }

  return v31;
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
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
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
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getDataRange:].cold.3();

    v10 = v4;
  }
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
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
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight getDataRange:].cold.1();

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

- (id)processAppUsageEventsEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length;
  double location;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  int v29;
  NSObject *v30;
  int v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v39;
  id v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  int v56;
  __int16 v57;
  int v58;
  __int16 v59;
  int v60;
  __int16 v61;
  int v62;
  _BYTE v63[128];
  uint64_t v64;

  length = a4.length;
  location = a4.location;
  v64 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
  v43 = v10;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v49;
    v14 = location + length;
    v42 = v9;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v49 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        objc_msgSend(v16, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (v17)
        {
          objc_msgSend(v17, "timeIntervalSince1970");
          if (location <= v19)
          {
            v20 = v19;

            if (v14 < v20)
              continue;
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("BundleID"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("NotificationCount"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "intValue");

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HasAudioUsage"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "BOOLValue");

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HasCarPlayUsage"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "BOOLValue");

            objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("HasWidgetActive"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "BOOLValue");

            if (v22 > 0)
              v29 = 1;
            else
              v29 = v24;
            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413314;
              v54 = v18;
              v55 = 1024;
              v56 = v24;
              v57 = 1024;
              v58 = v26;
              v59 = 1024;
              v60 = v28;
              v61 = 1024;
              v62 = v22;
              _os_log_debug_impl(&dword_1DA9D6000, v30, OS_LOG_TYPE_DEBUG, "App Background Usage Insight: App usage Events for %@: audio: %d, carplay:%d, widgets:%d, notifications:%d", buf, 0x24u);
            }

            if (v18)
              v31 = v29 | v26 | v28;
            else
              v31 = 0;
            v9 = v42;
            if (v31 == 1)
              objc_msgSend(v42, "addObject:", v18);
            v10 = v43;
          }
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v48, v63, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
  {
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v32 = v41;
    v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    if (v33)
    {
      v34 = v33;
      v35 = *(_QWORD *)v45;
      v36 = MEMORY[0x1E0C9AAB0];
      do
      {
        for (j = 0; j != v34; ++j)
        {
          if (*(_QWORD *)v45 != v35)
            objc_enumerationMutation(v32);
          v38 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
          objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39 && objc_msgSend(v9, "containsObject:", v39))
          {
            objc_msgSend(v38, "setObject:forKeyedSubscript:", v36, CFSTR("kHasUsageEvent"));
            objc_msgSend(v9, "removeObject:", v39);
          }

        }
        v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
      }
      while (v34);
    }

    v10 = v43;
  }

  return v41;
}

- (id)getAppRuntimesInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AppRunTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, 86400.0, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getAppUsageEventsInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AppUsageEvents"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, 86400.0, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)enumerateBucketsUsingBlock:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;
  double v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void (**v18)(id, _QWORD, void *, id, double, double);

  v18 = (void (**)(id, _QWORD, void *, id, double, double))a3;
  v4 = -[PLBatteryUIResponseTypeBackgroundAppUsageInsight computeNumberOfBuckets](self, "computeNumberOfBuckets");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0.0;
    do
    {
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight end](self, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight bucketSize](self, "bucketSize");
      objc_msgSend(v8, "dateByAddingTimeInterval:", -(v9 * v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLBatteryUIResponseTypeBackgroundAppUsageInsight bucketSize](self, "bucketSize");
      objc_msgSend(v10, "dateByAddingTimeInterval:", -v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v10;
      objc_msgSend(v12, "timeIntervalSince1970");
      v15 = v14;
      objc_msgSend(v13, "timeIntervalSince1970");
      v17 = v16;

      v18[2](v18, v6, v12, v13, v15 + -1800.0, v17 - v15);
      v7 = v7 + 1.0;
      v6 = (v6 + 1);
    }
    while (v5 != (_DWORD)v6);
  }

}

- (void)applyTransformationsForBuckets:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLBatteryUIResponseTypeUtilities applyStaticNameTransformation:withResponderService:](PLBatteryUIResponseTypeUtilities, "applyStaticNameTransformation:withResponderService:", v9, v10);

        -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLBatteryUIResponseTypeUtilities applyDynamicNameTransformation:withResponderService:](PLBatteryUIResponseTypeUtilities, "applyDynamicNameTransformation:withResponderService:", v9, v11);

        -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLBatteryUIResponseTypeUtilities replaceBundleIDsWithDisplayNamesForEnergyEntryInBucket:withResponderService:](PLBatteryUIResponseTypeUtilities, "replaceBundleIDsWithDisplayNamesForEnergyEntryInBucket:withResponderService:", v9, v12);

        -[PLBatteryUIResponseTypeBackgroundAppUsageInsight responderService](self, "responderService");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLBatteryUIResponseTypeUtilities addEntryTypesToEnergyEntriesInBucket:withResponderService:](PLBatteryUIResponseTypeUtilities, "addEntryTypesToEnergyEntriesInBucket:withResponderService:", v9, v13);

        +[PLBatteryUIResponseTypeUtilities filterEnergyEntriesByAppTypeFromBucket:](PLBatteryUIResponseTypeUtilities, "filterEnergyEntriesByAppTypeFromBucket:", v9);
        +[PLBatteryUIResponseTypeUtilities filterEnergyEntriesWithRuntimes:](PLBatteryUIResponseTypeUtilities, "filterEnergyEntriesWithRuntimes:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)suggest
{
  return self->_suggest;
}

- (void)setSuggest:(BOOL)a3
{
  self->_suggest = a3;
}

- (NSMutableArray)appsForBackgroundActivityInsight
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setAppsForBackgroundActivityInsight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)nodeIDsToNodeNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNodeIDsToNodeNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDate)monotonicNow
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMonotonicNow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSMutableArray)buckets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setBuckets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_monotonicNow, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_nodeIDsToNodeNames, 0);
  objc_storeStrong((id *)&self->_appsForBackgroundActivityInsight, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)configure:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "App Background Usage Insight: Couldn't prepare buckets", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __79__PLBatteryUIResponseTypeBackgroundAppUsageInsight_initializeBucketsWithRange___block_invoke_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "buckets");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "count");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v2, v3, "App Background Usage: prepared %d buckets", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "App Background Usage Insight: gathered %d appUsageEvents entries...", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v1, v2, "App Background Usage Insight gathered %d app runtime entries...", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
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
