@implementation PLBatteryUIResponseTypeBatteryBreakdownAggregation

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
      location = a4.location;
    else
      location = result.location;
    if (v5 >= v8)
      v9 = v5;
    else
      v9 = v8;
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

- (void)populateEnergyBucketKeysWithEntries:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  __int16 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  NSObject *v27;
  unsigned int v28;
  void *v29;
  id obj;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v29 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
  if (v33)
  {
    v31 = *(_QWORD *)v38;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v38 != v31)
          objc_enumerationMutation(obj);
        v34 = v4;
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v4);
        v6 = 1;
        do
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v6);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("%@"), v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("fg"), v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("bg"), v9);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKeyedSubscript:", v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "intValue");

          objc_msgSend(v5, "objectForKeyedSubscript:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "intValue");

          if (-[PLBatteryUIResponseTypeBatteryBreakdownAggregation isForegroundOnlyBucket:](self, "isForegroundOnlyBucket:", v6))
          {
            v15 = v13;
            if ((int)v13 >= 1)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, v10);

              v15 = v13;
            }
          }
          v17 = (v13 - v15);
          if ((int)v17 >= 1)
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "doubleValue");
            v20 = v19;

            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v23 = v22;

            v24 = v20 + v23;
            if (v20 + v23 <= 0.0
              || ((v24 = v20 / v24 * (double)(int)v13, (int)v17 >= (int)v24)
                ? (v17 = (int)v24)
                : (v17 = v17),
                  (int)v17 >= 1))
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17, v24);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v25, v11);

              v15 = v13 - v17;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v13 - v17));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setObject:forKeyedSubscript:", v26, v10);

            }
          }
          PLLogCommon();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v42 = v35;
            v43 = 2112;
            v44 = v9;
            v45 = 1024;
            v46 = v13;
            v47 = 1024;
            v48 = v15;
            v49 = 1024;
            v50 = v17;
            _os_log_debug_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_DEBUG, "%@: %@ total:%d fg:%d bg:%d", buf, 0x28u);

          }
          v28 = (unsigned __int16)v6++;
        }
        while (v28 < 0x11);
        objc_msgSend(v32, "addObject:", v5);
        v4 = v34 + 1;
      }
      while (v34 + 1 != v33);
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
    }
    while (v33);
  }

  objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, CFSTR("PLBatteryUIAppArrayKey"));
}

- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4
{
  return 0;
}

- (void)addRNEForMetrics:(id)a3 rootNodeEnergy:(id)a4 energyEntry:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a5;
  v9 = -[PLBatteryUIResponseTypeBatteryBreakdown getEnergyMetricBucketForRootNodeID:](self, "getEnergyMetricBucketForRootNodeID:", a3);
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = objc_msgSend(v18, "intValue");
    if (v13 >= 1)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue") + v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v12);

    }
  }

}

- (void)addFgEnergyForMetrics:(id)a3 qualificationID:(id)a4 rootNodeQualificationEnergy:(id)a5 energyEntry:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v22 = a3;
  v10 = a5;
  v11 = a6;
  if (objc_msgSend(a4, "intValue") == 2)
  {
    v12 = -[PLBatteryUIResponseTypeBatteryBreakdown getEnergyMetricBucketForRootNodeID:](self, "getEnergyMetricBucketForRootNodeID:", v22);
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("fg"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v10, "intValue");
      if (v17 >= 1)
      {
        v18 = v17;
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v11, "objectForKeyedSubscript:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "intValue") + v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v21, v16);

      }
    }

  }
}

- (void)initBackgroundLocationAudioTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation setBackgroundLocationBreakdown:](self, "setBackgroundLocationBreakdown:", v3);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation setBackgroundLocationPluggedInBreakdown:](self, "setBackgroundLocationPluggedInBreakdown:", v4);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation setBackgroundAudioBreakdown:](self, "setBackgroundAudioBreakdown:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation setBackgroundAudioPluggedInBreakdown:](self, "setBackgroundAudioPluggedInBreakdown:", v6);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation setBackgroundLocationAudioBreakdown:](self, "setBackgroundLocationAudioBreakdown:", v7);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation setBackgroundLocationAudioPluggedInBreakdown:](self, "setBackgroundLocationAudioPluggedInBreakdown:", v8);

}

- (void)populateBackgroundLocationAudioTime:(id)a3 bundleID:(id)a4
{
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
  id v19;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BackgroundLocationTime"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationBreakdown](self, "backgroundLocationBreakdown");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BackgroundLocationPluggedInTime"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationPluggedInBreakdown](self, "backgroundLocationPluggedInBreakdown");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BackgroundAudioPlayingTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundAudioBreakdown](self, "backgroundAudioBreakdown");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BackgroundAudioPlayingTimePluggedIn"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundAudioPluggedInBreakdown](self, "backgroundAudioPluggedInBreakdown");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BackgroundLocationAudioTime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationAudioBreakdown](self, "backgroundLocationAudioBreakdown");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v6);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BackgroundLocationAudioPluggedInTime"));
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationAudioPluggedInBreakdown](self, "backgroundLocationAudioPluggedInBreakdown");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, v6);

}

- (void)bgLocationAudioTimeRuntimes:(id)a3 bundleID:(id)a4
{
  void *v6;
  id v7;
  id v8;
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
  id v31;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  v8 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationBreakdown](self, "backgroundLocationBreakdown");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  objc_msgSend(v6, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("PLBatteryUIAppBackgroundLocationRuntimeKey"));

  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationPluggedInBreakdown](self, "backgroundLocationPluggedInBreakdown");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  objc_msgSend(v12, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"));

  v16 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundAudioBreakdown](self, "backgroundAudioBreakdown");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  objc_msgSend(v16, "numberWithDouble:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("PLBatteryUIAppBackgroundAudioRuntimeKey"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundAudioPluggedInBreakdown](self, "backgroundAudioPluggedInBreakdown");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "doubleValue");
  objc_msgSend(v20, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"));

  v24 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationAudioBreakdown](self, "backgroundLocationAudioBreakdown");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "doubleValue");
  objc_msgSend(v24, "numberWithDouble:");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, CFSTR("PLBatteryUIAppBackgroundLocationAudioRuntimeKey"));

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationAudioPluggedInBreakdown](self, "backgroundLocationAudioPluggedInBreakdown");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "doubleValue");
  objc_msgSend(v28, "numberWithDouble:");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"));

}

- (void)bgLocationAudioTimeApps:(id)a3
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
  id v29;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationBreakdown](self, "backgroundLocationBreakdown");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v29);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v5, "numberWithDouble:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("PLBatteryUIAppBackgroundLocationRuntimeKey"));

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationPluggedInBreakdown](self, "backgroundLocationPluggedInBreakdown");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  objc_msgSend(v9, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("PLBatteryUIAppBackgroundLocationPluggedInRuntimeKey"));

  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundAudioBreakdown](self, "backgroundAudioBreakdown");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v29);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  objc_msgSend(v13, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("PLBatteryUIAppBackgroundAudioRuntimeKey"));

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundAudioPluggedInBreakdown](self, "backgroundAudioPluggedInBreakdown");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  objc_msgSend(v17, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, CFSTR("PLBatteryUIAppBackgroundAudioPluggedInRuntimeKey"));

  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationAudioBreakdown](self, "backgroundLocationAudioBreakdown");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", v29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "doubleValue");
  objc_msgSend(v21, "numberWithDouble:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("PLBatteryUIAppBackgroundLocationAudioRuntimeKey"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdownAggregation backgroundLocationAudioPluggedInBreakdown](self, "backgroundLocationAudioPluggedInBreakdown");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "doubleValue");
  objc_msgSend(v25, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v28, CFSTR("PLBatteryUIAppBackgroundLocationAudioPluggedInRuntimeKey"));

}

- (BOOL)isForegroundOnlyBucket:(signed __int16)a3
{
  return (a3 < 9) & (0x10Au >> a3);
}

- (void)filterEnergyEntries:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        if ((v12 & 0xFFFFFFFB) == 0)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PLBatteryUIAppArrayKey"));
}

- (BOOL)shouldShowBreakdown:(id)a3
{
  return 1;
}

- (NSMutableDictionary)backgroundLocationBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 208, 1);
}

- (void)setBackgroundLocationBreakdown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSMutableDictionary)backgroundLocationPluggedInBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 216, 1);
}

- (void)setBackgroundLocationPluggedInBreakdown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSMutableDictionary)backgroundAudioBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 224, 1);
}

- (void)setBackgroundAudioBreakdown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSMutableDictionary)backgroundAudioPluggedInBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 232, 1);
}

- (void)setBackgroundAudioPluggedInBreakdown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSMutableDictionary)backgroundLocationAudioBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 240, 1);
}

- (void)setBackgroundLocationAudioBreakdown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSMutableDictionary)backgroundLocationAudioPluggedInBreakdown
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 248, 1);
}

- (void)setBackgroundLocationAudioPluggedInBreakdown:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundLocationAudioPluggedInBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundLocationAudioBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundAudioPluggedInBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundAudioBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundLocationPluggedInBreakdown, 0);
  objc_storeStrong((id *)&self->_backgroundLocationBreakdown, 0);
}

@end
