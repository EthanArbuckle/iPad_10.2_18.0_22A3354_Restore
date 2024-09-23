@implementation PLBatteryUIResponseTypeBatteryBreakdown

- (id)getRootNodeIDToRootNodeEnergyKeys
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[17];
  _QWORD v22[19];

  v22[17] = *MEMORY[0x1E0C80C00];
  objc_msgSend(&unk_1EA1DB1A0, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v20;
  v22[0] = CFSTR("PLBatteryUIAppCPUEnergyKey");
  objc_msgSend(&unk_1EA1DB1B8, "objectAtIndexedSubscript:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v19;
  v22[1] = CFSTR("PLBatteryUIAppVENCEnergyKey");
  objc_msgSend(&unk_1EA1DB1D0, "objectAtIndexedSubscript:", 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v18;
  v22[2] = CFSTR("PLBatteryUIAppVDECEnergyKey");
  objc_msgSend(&unk_1EA1DB1E8, "objectAtIndexedSubscript:", 6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v17;
  v22[3] = CFSTR("PLBatteryUIAppISPEnergyKey");
  objc_msgSend(&unk_1EA1DB200, "objectAtIndexedSubscript:", 7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v16;
  v22[4] = CFSTR("PLBatteryUIAppRestOfSOCEnergyKey");
  objc_msgSend(&unk_1EA1DB218, "objectAtIndexedSubscript:", 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v15;
  v22[5] = CFSTR("PLBatteryUIAppGPUEnergyKey");
  objc_msgSend(&unk_1EA1DB230, "objectAtIndexedSubscript:", 9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v14;
  v22[6] = CFSTR("PLBatteryUIAppDRAMEnergyKey");
  objc_msgSend(&unk_1EA1DB248, "objectAtIndexedSubscript:", 10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v13;
  v22[7] = CFSTR("PLBatteryUIAppDisplayEnergyKey");
  objc_msgSend(&unk_1EA1DB260, "objectAtIndexedSubscript:", 11);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v2;
  v22[8] = CFSTR("PLBatteryUIAppWIFIEnergyKey");
  objc_msgSend(&unk_1EA1DB278, "objectAtIndexedSubscript:", 15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v3;
  v22[9] = CFSTR("PLBatteryUIAppAUDIOEnergyKey");
  objc_msgSend(&unk_1EA1DB290, "objectAtIndexedSubscript:", 37);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v4;
  v22[10] = CFSTR("PLBatteryUIAppBBEnergyKey");
  objc_msgSend(&unk_1EA1DB2A8, "objectAtIndexedSubscript:", 48);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v5;
  v22[11] = CFSTR("BLMEnergyGPS");
  objc_msgSend(&unk_1EA1DB2C0, "objectAtIndexedSubscript:", 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v6;
  v22[12] = CFSTR("PLBatteryUIAppWifiLocationEnergyKey");
  objc_msgSend(&unk_1EA1DB2D8, "objectAtIndexedSubscript:", 13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v7;
  v22[13] = CFSTR("PLBatteryUIAppWifiPipelineEnergyKey");
  objc_msgSend(&unk_1EA1DB2F0, "objectAtIndexedSubscript:", 50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[14] = v8;
  v22[14] = CFSTR("PLBatteryUIAppBluetoothEnergyKey");
  objc_msgSend(&unk_1EA1DB308, "objectAtIndexedSubscript:", 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[15] = v9;
  v22[15] = CFSTR("PLBatteryUIAppAccessoryEnergyKey");
  objc_msgSend(&unk_1EA1DB320, "objectAtIndexedSubscript:", 16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[16] = v10;
  v22[16] = CFSTR("PLBatteryUIAppNfcEnergyKey");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)getIntermediateRootNodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA1DB338);
}

- (signed)getEnergyMetricBucketForRootNodeID:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "intValue") - 2;
  if (v3 > 0x3C)
    return 0;
  else
    return word_1DABA1C48[v3];
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  NSObject *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  uint8_t buf[4];
  void *v53;
  uint64_t v54;
  _PLTimeIntervalRange result;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D80368];
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UsageTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v5, *MEMORY[0x1E0D80190]);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
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
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:].cold.3(v12, v13, v14, v15, v16, v17, v18, v19);

    v10 = v4;
  }
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "storage");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "firstEntryForKey:", v51);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v22, "entryDate");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:].cold.2();

  }
  else
  {
    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getDataRange:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

    v23 = v4;
  }
  objc_msgSend(v23, "laterDate:", v10);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v4;
  objc_msgSend(v33, "timeIntervalSince1970");
  v36 = v35;
  objc_msgSend(v34, "timeIntervalSince1970");
  v38 = v37;

  v39 = v38 - v36;
  PLLogCommon();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    v41 = (void *)MEMORY[0x1E0CB3940];
    v50 = v22;
    v42 = v9;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v36);
    v43 = v10;
    v44 = v6;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v36 + v39);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("Start: %@, End %@"), v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v42;
    v22 = v50;

    v6 = v44;
    v10 = v43;
    *(_DWORD *)buf = 138412290;
    v53 = v47;
    _os_log_impl(&dword_1DA9D6000, v40, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);

  }
  v48 = v36;
  v49 = v39;
  result.length = v49;
  result.location = v48;
  return result;
}

- (double)getDataDurationFromRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;

  length = a3.length;
  location = a3.location;
  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertFromMonotonicToSystem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nearestMidnightBeforeDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location + length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "convertFromMonotonicToSystem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nearestMidnightAfterDate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "timeIntervalSinceDate:", v8);
  v14 = v13;

  return v14;
}

- (id)getNodeEntriesForEntryKey:(id)a3 withRange:(_PLTimeIntervalRange)a4 andTimeInterval:(double)a5
{
  double length;
  double location;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')"), *MEMORY[0x1E0D801E8], *MEMORY[0x1E0D801E8], CFSTR("null"), *MEMORY[0x1E0D801E8], CFSTR("unknown"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = *MEMORY[0x1E0D80178];
  objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ IN (SELECT ID FROM '%@' WHERE %@)"), v12, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ > %d"), *MEMORY[0x1E0D80198], 100);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT * FROM '%@' WHERE (timestamp>%f AND timestamp<%f AND timeInterval=%f AND (%@) AND (%@));"),
    v9,
    *(_QWORD *)&location,
    location + length,
    *(_QWORD *)&a5,
    v14,
    v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getNodeEntriesForEntryKey:withRange:andTimeInterval:].cold.1();

  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "entriesForKey:withQuery:", v9, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
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
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("AppRunTime"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", v7, 3600.0, location, length);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getNonAppRuntimesInRange:(_PLTimeIntervalRange)a3 withNow:(id)a4
{
  double length;
  double location;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  length = a3.length;
  location = a3.location;
  v16[3] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getNonAppRuntimesWith:identificationKey:andRange:withNow:](self, "getNonAppRuntimesWith:identificationKey:andRange:withNow:", CFSTR("PLCameraAgent_EventForward_Torch"), CFSTR("Level"), v7, location, length);
    v10 = v9;
  }
  else
  {
    v10 = 0.0;
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 > 0.0)
  {
    v15[0] = CFSTR("BundleID");
    v15[1] = CFSTR("ScreenOnTime");
    v16[0] = CFSTR("Flashlight");
    v16[1] = &unk_1EA1BFC18;
    v15[2] = CFSTR("BackgroundTime");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addObject:", v13);
  }

  return v11;
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

  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
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
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
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

- (id)getDeletedAppBundleIDs
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_DEFAULT, "Searching for deleted app names", buf, 2u);
  }

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1EA1BFC18, 1);
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v4;
  objc_msgSend(v7, "entriesForKey:withComparisons:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v18, "intValue");
          *(_DWORD *)buf = 138412546;
          v31 = v17;
          v32 = 1024;
          v33 = v20;
          _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
        }

        if (v17 && (objc_msgSend(v18, "BOOLValue") & 1) == 0)
          objc_msgSend(v25, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v13);
  }

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v25;
    _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
  }

  v22 = (void *)objc_msgSend(v25, "copy");
  return v22;
}

- (id)getDeletedAppClipBundleIDs
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  _QWORD v35[3];

  v35[1] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_DEFAULT, "Searching for deleted app clip names", buf, 2u);
  }

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1EA1BFC18, 1);
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v4;
  objc_msgSend(v7, "entriesForKey:withComparisons:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v9;
    _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_DEFAULT, "DeletedAppEntries = %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("AppIsClip"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v20 = objc_msgSend(v18, "intValue");
          *(_DWORD *)buf = 138412546;
          v31 = v17;
          v32 = 1024;
          v33 = v20;
          _os_log_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_DEFAULT, "bundleID=%@, appIsClip=%d", buf, 0x12u);
        }

        if (v17 && objc_msgSend(v18, "BOOLValue"))
          objc_msgSend(v25, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v13);
  }

  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v25;
    _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEFAULT, "DeletedAppNames = %@", buf, 0xCu);
  }

  v22 = (void *)objc_msgSend(v25, "copy");
  return v22;
}

- (id)getWebAppBundleIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLXPCAgent"), *MEMORY[0x1E0D80378], CFSTR("WebApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entriesForKey:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("identifier"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("identifier"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_msgSend(v4, "copy");
  return v15;
}

- (id)getBundleIDToDisplayNameMap
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  int v43;
  NSObject *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD block[5];
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int v72;
  uint64_t v73;
  _BYTE v74[128];
  int v75;
  uint64_t v76;
  uint8_t buf[4];
  void *v78;
  _BYTE v79[128];
  _QWORD v80[4];

  v80[1] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllApps"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("AppDeletedDate"), &unk_1EA1BFC18, 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (void *)v4;
  v80[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v3;
  objc_msgSend(v6, "entriesForKey:withComparisons:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap].cold.3();

  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
  v12 = 0x1E0D7F000uLL;
  v58 = v10;
  if (v11)
  {
    v13 = v11;
    v14 = CFSTR("AppType");
    v15 = *(_QWORD *)v69;
    do
    {
      v16 = 0;
      v59 = v13;
      do
      {
        if (*(_QWORD *)v69 != v15)
          objc_enumerationMutation(v10);
        v17 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v16);
        objc_msgSend(v17, "objectForKeyedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");

        if (v19 == 101
          || (objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AppBundleId")),
              v20 = (void *)objc_claimAutoreleasedReturnValue(),
              v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")),
              v20,
              v21))
        {
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AppBundleId"));
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("AppName"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(*(id *)(v12 + 4000), "debugEnabled"))
          {
            v24 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v24;
            if (getBundleIDToDisplayNameMap_defaultOnce != -1)
              dispatch_once(&getBundleIDToDisplayNameMap_defaultOnce, block);
            if (getBundleIDToDisplayNameMap_classDebugEnabled)
            {
              v25 = v15;
              v26 = v14;
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@, displayName=%@"), v22, v23);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "lastPathComponent");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap]");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "logMessage:fromFile:fromFunction:fromLineNumber:", v27, v30, v31, 338);

              PLLogCommon();
              v32 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v27;
                _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v12 = 0x1E0D7F000;
              v14 = v26;
              v15 = v25;
              v10 = v58;
              v13 = v59;
            }
          }
          objc_msgSend(v61, "setObject:forKeyedSubscript:", v23, v22);

        }
        else
        {
          PLLogCommon();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap].cold.2(&v75, v17, &v76);
        }

        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v68, v79, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
  v35 = 0x1EA16B000uLL;
  if (v34)
  {
    v36 = v34;
    v37 = *(_QWORD *)v64;
    v60 = v33;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v64 != v37)
          objc_enumerationMutation(v33);
        v39 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v38);
        if ((objc_msgSend(v39, "mayBeBUIVisible") & 1) == 0)
        {
          objc_msgSend(v39, "bundleIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp"));

          if (!v41)
          {
            PLLogCommon();
            v44 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              -[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap].cold.1(&v72, v39, &v73);
            goto LABEL_42;
          }
        }
        if ((objc_msgSend(*(id *)(v35 + 2320), "hasScreenPresence:", v39) & 1) != 0
          || (objc_msgSend(v39, "bundleIdentifier"),
              v42 = (void *)objc_claimAutoreleasedReturnValue(),
              v43 = objc_msgSend(v42, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")),
              v42,
              v43))
        {
          objc_msgSend(v39, "bundleIdentifier");
          v44 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v45)
          {
            objc_msgSend(v39, "localizedName");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v47 = objc_opt_class();
              v62[0] = MEMORY[0x1E0C809B0];
              v62[1] = 3221225472;
              v62[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke_275;
              v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v62[4] = v47;
              if (getBundleIDToDisplayNameMap_defaultOnce_273 != -1)
                dispatch_once(&getBundleIDToDisplayNameMap_defaultOnce_273, v62);
              if (getBundleIDToDisplayNameMap_classDebugEnabled_274)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bundleID=%@, displayName=%@"), v44, v46);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "lastPathComponent");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getBundleIDToDisplayNameMap]");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "logMessage:fromFile:fromFunction:fromLineNumber:", v48, v51, v52, 356);

                PLLogCommon();
                v53 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v48;
                  _os_log_debug_impl(&dword_1DA9D6000, v53, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v35 = 0x1EA16B000;
                v33 = v60;
              }
            }
            objc_msgSend(v61, "setObject:forKeyedSubscript:", v46, v44);

          }
LABEL_42:

        }
        ++v38;
      }
      while (v36 != v38);
      v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    }
    while (v36);
  }
  objc_msgSend(v61, "setObject:forKeyedSubscript:", CFSTR("Apple Watch"), CFSTR("com.apple.Bridge"));
  v54 = (void *)objc_msgSend(v61, "copy");

  return v54;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getBundleIDToDisplayNameMap_classDebugEnabled = result;
  return result;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getBundleIDToDisplayNameMap__block_invoke_275(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getBundleIDToDisplayNameMap_classDebugEnabled_274 = result;
  return result;
}

- (id)getNodeIDToNodeNameMap
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  const __CFString *v30;
  _QWORD v31[3];

  v31[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ NOT NULL) AND (%@ NOT LIKE '%%%@%%') AND (%@ NOT LIKE '%%%@%%')"), *MEMORY[0x1E0D801E8], *MEMORY[0x1E0D801E8], CFSTR("null"), *MEMORY[0x1E0D801E8], CFSTR("unknown"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *MEMORY[0x1E0D80178];
  objc_msgSend(MEMORY[0x1E0D7FEE0], "entryKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)v3;
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ IN (SELECT ID FROM '%@' WHERE %@)"), v5, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", *MEMORY[0x1E0D80388], *MEMORY[0x1E0D801E0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = CFSTR("WHERE");
  v31[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entriesForKey:withProperties:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v26 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v19, "name");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v19, "entryID"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v16);
  }

  v22 = (void *)objc_msgSend(v13, "copy");
  return v22;
}

- (id)getPluginBundleIDToEntryMap
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id obj;
  PLBatteryUIResponseTypeBatteryBreakdown *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[5];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD block[5];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[5];
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  _BYTE v75[128];
  _QWORD v76[4];

  v76[1] = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("AllPlugins"));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("PluginDeletedDate"), &unk_1EA1BFC18, 0);
  v58 = self;
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)v4;
  v76[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)v3;
  objc_msgSend(v6, "entriesForKey:withComparisons:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = 0x1E0D7F000uLL;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v10 = objc_opt_class();
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke;
    v71[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v71[4] = v10;
    if (getPluginBundleIDToEntryMap_defaultOnce != -1)
      dispatch_once(&getPluginBundleIDToEntryMap_defaultOnce, v71);
    if (getPluginBundleIDToEntryMap_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("installedPluginEntries=%@"), v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getPluginBundleIDToEntryMap]");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "logMessage:fromFile:fromFunction:fromLineNumber:", v11, v14, v15, 396);

      PLLogCommon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v8;
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  v56 = v17;
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v68;
    v21 = CFSTR("PluginId");
    do
    {
      v22 = 0;
      v59 = v19;
      do
      {
        if (*(_QWORD *)v68 != v20)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v22);
        objc_msgSend(v23, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v25 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_290;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v25;
          if (getPluginBundleIDToEntryMap_defaultOnce_288 != -1)
            dispatch_once(&getPluginBundleIDToEntryMap_defaultOnce_288, block);
          if (getPluginBundleIDToEntryMap_classDebugEnabled_289)
          {
            v26 = v20;
            v27 = v21;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("pluginBundleID=%@"), v24);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getPluginBundleIDToEntryMap]");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 401);

            PLLogCommon();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v28;
              _os_log_debug_impl(&dword_1DA9D6000, v33, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

            v9 = 0x1E0D7F000uLL;
            v17 = v56;
            v21 = v27;
            v20 = v26;
            v19 = v59;
          }
        }
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, v24);

        ++v22;
      }
      while (v19 != v22);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
    }
    while (v19);
  }

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  -[PLBatteryUIResponseTypeBatteryBreakdown getInstalledPluginEntries](v58, "getInstalledPluginEntries");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v60)
  {
    v35 = *(_QWORD *)v63;
    v54 = *(_QWORD *)v63;
    v55 = v34;
    do
    {
      v36 = 0;
      do
      {
        if (*(_QWORD *)v63 != v35)
          objc_enumerationMutation(v34);
        v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v36);
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PluginId"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectForKeyedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v40)
        {
          if (objc_msgSend(*(id *)(v9 + 4000), "debugEnabled"))
          {
            v41 = objc_opt_class();
            v61[0] = MEMORY[0x1E0C809B0];
            v61[1] = 3221225472;
            v61[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_297;
            v61[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            v61[4] = v41;
            if (getPluginBundleIDToEntryMap_defaultOnce_295 != -1)
              dispatch_once(&getPluginBundleIDToEntryMap_defaultOnce_295, v61);
            if (getPluginBundleIDToEntryMap_classDebugEnabled_296)
            {
              v42 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PluginExecutableName"));
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("PluginType"));
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "stringWithFormat:", CFSTR("pluginExecutableName=%@, pluginBundleID=%@, pluginParentApp=%@, pluginType=%@"), v43, v38, v39, v44);
              v45 = (void *)objc_claimAutoreleasedReturnValue();

              v46 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m");
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v47, "lastPathComponent");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) getPluginBundleIDToEntryMap]");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 412);

              PLLogCommon();
              v50 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v74 = v45;
                _os_log_debug_impl(&dword_1DA9D6000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v9 = 0x1E0D7F000;
              v17 = v56;
              v35 = v54;
              v34 = v55;
            }
          }
          objc_msgSend(v17, "setObject:forKeyedSubscript:", v37, v38);
        }

        ++v36;
      }
      while (v60 != v36);
      v60 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v60);
  }

  return v17;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getPluginBundleIDToEntryMap_classDebugEnabled = result;
  return result;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_290(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getPluginBundleIDToEntryMap_classDebugEnabled_289 = result;
  return result;
}

uint64_t __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getPluginBundleIDToEntryMap__block_invoke_297(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getPluginBundleIDToEntryMap_classDebugEnabled_296 = result;
  return result;
}

- (id)getNotificationEntriesInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  double v14;
  double v15;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aggregateEntriesForKey:withBucketLength:inTimeIntervalRange:", CFSTR("PLSpringBoardAgent_Aggregate_SBNotifications_Aggregate"), 3600.0, location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getNotificationEntriesInRange___block_invoke;
  v12[3] = &unk_1EA16D678;
  v14 = location;
  v15 = length;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:withPrimaryKeys:", v9, &unk_1EA1DB350);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __84__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getNotificationEntriesInRange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "entryDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 48);
  v6 = v3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "timeIntervalSince1970");
    v9 = v8;
    v10 = v4 + v5;

    if (v4 <= v9 && v9 < v10)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
  }

}

- (id)getInstalledPluginEntries
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (id)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(MEMORY[0x1E0CA5848], "enumeratorWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v35;
    v30 = *MEMORY[0x1E0D80388];
    do
    {
      v6 = 0;
      v31 = v4;
      do
      {
        if (*(_QWORD *)v35 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v6);
        objc_msgSend(v7, "bundleIdentifier");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!v8)
          goto LABEL_20;
        v9 = (void *)v8;
        objc_msgSend(v7, "executableURL");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_19;
        v11 = (void *)v10;
        objc_msgSend(v7, "containingBundleRecord");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12)
          goto LABEL_12;
        objc_msgSend(v7, "containingBundleRecord");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "bundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v32 = 0;
LABEL_12:
          v15 = v5;
          v16 = v2;
          objc_msgSend(v7, "extensionPointRecord");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v18, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

          if (!v12)
          {

            v2 = v16;
            v5 = v15;
            v4 = v31;
            if (!v14)
              goto LABEL_20;
LABEL_17:
            v19 = objc_alloc(MEMORY[0x1E0D7FFB0]);
            +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", v30, CFSTR("AllPlugins"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = (void *)objc_msgSend(v19, "initWithEntryKey:", v20);

            objc_msgSend(v7, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, CFSTR("PluginId"));

            objc_msgSend(v7, "containingBundleRecord");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "bundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("PluginParentApp"));

            objc_msgSend(v7, "extensionPointRecord");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("PluginType"));

            objc_msgSend(v7, "executableURL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "path");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("PluginExecutableName"));

            objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1BFC18, CFSTR("PluginDeletedDate"));
            if (!v9)
              goto LABEL_20;
            objc_msgSend(v29, "addObject:", v9);
LABEL_19:

            goto LABEL_20;
          }
          v2 = v16;
          v5 = v15;
          v4 = v31;
          v13 = v32;
          goto LABEL_14;
        }
        LOBYTE(v14) = 1;
LABEL_14:
        v32 = v13;

        if ((v14 & 1) != 0)
          goto LABEL_17;
LABEL_20:
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v4);
  }

  return v29;
}

- (id)getLastBatteryEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLBatteryAgent"), *MEMORY[0x1E0D80370], CFSTR("Battery"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastEntryForKey:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DesignCapacity"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Voltage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11 / 1000.0;

  }
  else
  {
    v12 = 0.0;
    v9 = 0.0;
  }
  v17[0] = CFSTR("DesignCapacity");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = CFSTR("Voltage");
  v18[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)gizmoConnectedInRange:(_PLTimeIntervalRange)a3
{
  double location;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  BOOL v18;
  _QWORD block[5];

  location = a3.location;
  v5 = a3.location + a3.length;
  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLIdentityServicesAgent"), *MEMORY[0x1E0D80378], CFSTR("LocalLinkType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("select * from %@ where linkType=1 and timestamp>=%f and timestamp<=%f limit 1"), v6, *(_QWORD *)&location, *(_QWORD *)&v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entriesForKey:withQuery:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v11 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__gizmoConnectedInRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v11;
    if (gizmoConnectedInRange__defaultOnce != -1)
      dispatch_once(&gizmoConnectedInRange__defaultOnce, block);
    if (gizmoConnectedInRange__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Query Result %@"), v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown+Utilities.m");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown(Utilities) gizmoConnectedInRange:]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "logMessage:fromFile:fromFunction:fromLineNumber:", v12, v15, v16, 493);

      PLLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v18 = v10 && objc_msgSend(v10, "count");

  return v18;
}

uint64_t __76__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__gizmoConnectedInRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  gizmoConnectedInRange__classDebugEnabled = result;
  return result;
}

- (BOOL)hasHomeKitEvents
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D7FFC0], "entryKeyForOperatorName:withType:withName:", CFSTR("PLHomeKitAgent"), *MEMORY[0x1E0D80390], CFSTR("HomeKitEvents"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfEntriesForKey:", v3) > 0;

  return v6;
}

- (id)getRootNodeBundleIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA1DB368);
}

- (id)getNonAppBundleIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA1DB380);
}

- (id)getExchangeBundleIDs
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA1DB398);
}

- (id)getBundleIDToReplacementBundleIDMap
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[47];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  const __CFString *v49;
  const __CFString *v50;
  const __CFString *v51;
  const __CFString *v52;
  const __CFString *v53;
  const __CFString *v54;
  const __CFString *v55;
  const __CFString *v56;
  const __CFString *v57;
  const __CFString *v58;
  const __CFString *v59;
  const __CFString *v60;
  const __CFString *v61;
  const __CFString *v62;
  const __CFString *v63;
  const __CFString *v64;
  const __CFString *v65;
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  const __CFString *v70;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  const __CFString *v76;
  const __CFString *v77;
  const __CFString *v78;
  const __CFString *v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  const __CFString *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  const __CFString *v89;
  const __CFString *v90;
  const __CFString *v91;
  const __CFString *v92;
  const __CFString *v93;
  const __CFString *v94;
  const __CFString *v95;
  const __CFString *v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  const __CFString *v101;
  const __CFString *v102;
  const __CFString *v103;
  const __CFString *v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  const __CFString *v108;
  const __CFString *v109;
  const __CFString *v110;
  const __CFString *v111;
  const __CFString *v112;
  const __CFString *v113;
  const __CFString *v114;
  const __CFString *v115;
  const __CFString *v116;
  const __CFString *v117;
  const __CFString *v118;
  const __CFString *v119;
  const __CFString *v120;
  const __CFString *v121;
  const __CFString *v122;
  const __CFString *v123;
  const __CFString *v124;
  const __CFString *v125;
  const __CFString *v126;
  const __CFString *v127;
  const __CFString *v128;
  const __CFString *v129;
  const __CFString *v130;
  const __CFString *v131;
  const __CFString *v132;
  const __CFString *v133;
  const __CFString *v134;
  const __CFString *v135;
  _QWORD v136[174];

  v136[172] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("IMRemoteURLConn");
  v10[1] = CFSTR("IMRemoteURLConne");
  v136[0] = CFSTR("com.apple.MobileSMS");
  v136[1] = CFSTR("com.apple.MobileSMS");
  v10[2] = CFSTR("com.apple.mobilesms.notification");
  v10[3] = CFSTR("GenerativePlaygroundApp.MessagesExtension");
  v136[2] = CFSTR("com.apple.MobileSMS");
  v136[3] = CFSTR("com.apple.MobileSMS");
  v10[4] = CFSTR("com.apple.GenerativePlaygroundApp.MessagesExtension");
  v10[5] = CFSTR("mstreamd");
  v136[4] = CFSTR("com.apple.MobileSMS");
  v136[5] = CFSTR("com.apple.mobileslideshow");
  v10[6] = CFSTR("mediastream.mstreamd");
  v10[7] = CFSTR("assetsd");
  v136[6] = CFSTR("com.apple.mobileslideshow");
  v136[7] = CFSTR("com.apple.mobileslideshow");
  v10[8] = CFSTR("cloudphotod");
  v10[9] = CFSTR("com.apple.mobileslideshow.Discretionary");
  v136[8] = CFSTR("com.apple.mobileslideshow");
  v136[9] = CFSTR("com.apple.mobileslideshow");
  v10[10] = CFSTR("com.apple.icloud-container.com.apple.photos.cloud");
  v10[11] = CFSTR("com.apple.photoanalysisd");
  v136[10] = CFSTR("com.apple.mobileslideshow");
  v136[11] = CFSTR("com.apple.mobileslideshow");
  v10[12] = CFSTR("com.apple.photoanalysisd.backgroundanalysis");
  v10[13] = CFSTR("com.apple.photos.cloud");
  v136[12] = CFSTR("com.apple.mobileslideshow");
  v136[13] = CFSTR("com.apple.mobileslideshow");
  v10[14] = CFSTR("WirelessRadioManager");
  v10[15] = CFSTR("WirelessRadioManagerd");
  v136[14] = CFSTR("com.apple.mobilephone");
  v136[15] = CFSTR("com.apple.mobilephone");
  v10[16] = CFSTR("WirelessRadioMa");
  v10[17] = CFSTR("vmd");
  v136[16] = CFSTR("com.apple.mobilephone");
  v136[17] = CFSTR("com.apple.mobilephone");
  v10[18] = CFSTR("ipTelephony");
  v10[19] = CFSTR("ContactsUI.MonogramPosterExtension");
  v136[18] = CFSTR("com.apple.mobilephone");
  v136[19] = CFSTR("com.apple.mobilephone");
  v10[20] = CFSTR("com.apple.ContactsUI.MonogramPosterExtension");
  v10[21] = CFSTR("com.apple.MailCompositionService");
  v136[20] = CFSTR("com.apple.mobilephone");
  v136[21] = CFSTR("com.apple.mobilemail");
  v10[22] = CFSTR("MailCompositionService");
  v10[23] = CFSTR("suggestd");
  v136[22] = CFSTR("com.apple.mobilemail");
  v136[23] = CFSTR("com.apple.mobilemail");
  v10[24] = CFSTR("email.maild");
  v10[25] = CFSTR("com.apple.email.maild");
  v136[24] = CFSTR("com.apple.mobilemail");
  v136[25] = CFSTR("com.apple.mobilemail");
  v10[26] = CFSTR("maild");
  v10[27] = CFSTR("com.apple.springboard.lockscreen.navigation");
  v136[26] = CFSTR("com.apple.mobilemail");
  v136[27] = CFSTR("com.apple.Maps");
  v2 = *MEMORY[0x1E0D22C88];
  v10[28] = CFSTR("com.apple.Siri");
  v10[29] = v2;
  v136[28] = CFSTR("Siri");
  v136[29] = CFSTR("Siri");
  v10[30] = CFSTR("assistantd");
  v10[31] = CFSTR("com.apple.WebKit.Networking");
  v136[30] = CFSTR("Siri");
  v136[31] = CFSTR("com.apple.mobilesafari");
  v10[32] = CFSTR("com.apple.WebKit.WebContent");
  v10[33] = CFSTR("com.apple.WebKit");
  v136[32] = CFSTR("com.apple.mobilesafari");
  v136[33] = CFSTR("com.apple.mobilesafari");
  v10[34] = CFSTR("com.apple.WebKi");
  v10[35] = CFSTR("com.apple.SafariViewService");
  v136[34] = CFSTR("com.apple.mobilesafari");
  v136[35] = CFSTR("com.apple.mobilesafari");
  v10[36] = CFSTR("safarifetcherd");
  v10[37] = CFSTR("com.apple.WebKit.WebContent.CaptivePortal");
  v136[36] = CFSTR("com.apple.mobilesafari");
  v136[37] = CFSTR("com.apple.mobilesafari");
  v10[38] = CFSTR("com.apple.WebKit.WebContent.Development");
  v10[39] = CFSTR("com.apple.WebKit.GPU");
  v136[38] = CFSTR("com.apple.mobilesafari");
  v136[39] = CFSTR("com.apple.mobilesafari");
  v10[40] = CFSTR("com.apple.WebKit.GPU.Development");
  v10[41] = CFSTR("com.apple.PassKitCore");
  v136[40] = CFSTR("com.apple.mobilesafari");
  v136[41] = CFSTR("com.apple.Passbook");
  v10[42] = CFSTR("passd");
  v10[43] = CFSTR("PassbookUIService");
  v136[42] = CFSTR("com.apple.Passbook");
  v136[43] = CFSTR("com.apple.Passbook");
  v10[44] = CFSTR("com.apple.PassbookUIService");
  v10[45] = CFSTR("com.apple.calendar");
  v136[44] = CFSTR("com.apple.Passbook");
  v136[45] = CFSTR("com.apple.mobilecal");
  v3 = *MEMORY[0x1E0DAB668];
  v10[46] = CFSTR("calaccessd");
  v11 = v3;
  v136[46] = CFSTR("com.apple.mobilecal");
  v136[47] = CFSTR("HLS");
  v4 = *MEMORY[0x1E0DAB658];
  v12 = *MEMORY[0x1E0DAB690];
  v13 = v4;
  v136[48] = CFSTR("HLS");
  v136[49] = CFSTR("HLS");
  v5 = *MEMORY[0x1E0DAB6A8];
  v14 = *MEMORY[0x1E0DAB6A0];
  v15 = v5;
  v136[50] = CFSTR("HLS");
  v136[51] = CFSTR("HLS");
  v16 = *MEMORY[0x1E0D22C78];
  v136[52] = CFSTR("HLS");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v16, CFSTR("aod"), CFSTR("IMRemoteURLConn"), CFSTR("IMRemoteURLConne"), CFSTR("com.apple.mobilesms.notification"), CFSTR("GenerativePlaygroundApp.MessagesExtension"), CFSTR("com.apple.GenerativePlaygroundApp.MessagesExtension"), CFSTR("mstreamd"), CFSTR("mediastream.mstreamd"), CFSTR("assetsd"), CFSTR("cloudphotod"), CFSTR("com.apple.mobileslideshow.Discretionary"), CFSTR("com.apple.icloud-container.com.apple.photos.cloud"), CFSTR("com.apple.photoanalysisd"), CFSTR("com.apple.photoanalysisd.backgroundanalysis"), CFSTR("com.apple.photos.cloud"),
    CFSTR("WirelessRadioManager"),
    CFSTR("WirelessRadioManagerd"),
    CFSTR("WirelessRadioMa"),
    CFSTR("vmd"),
    CFSTR("ipTelephony"),
    CFSTR("ContactsUI.MonogramPosterExtension"),
    CFSTR("com.apple.ContactsUI.MonogramPosterExtension"),
    CFSTR("com.apple.MailCompositionService"),
    CFSTR("MailCompositionService"),
    CFSTR("suggestd"),
    CFSTR("email.maild"),
    CFSTR("com.apple.email.maild"),
    CFSTR("maild"),
    CFSTR("com.apple.springboard.lockscreen.navigation"),
    CFSTR("com.apple.Siri"),
    v2,
    CFSTR("assistantd"),
    CFSTR("com.apple.WebKit.Networking"),
    CFSTR("com.apple.WebKit.WebContent"),
    CFSTR("com.apple.WebKit"),
    CFSTR("com.apple.WebKi"),
    CFSTR("com.apple.SafariViewService"),
    CFSTR("safarifetcherd"),
    CFSTR("com.apple.WebKit.WebContent.CaptivePortal"),
    CFSTR("com.apple.WebKit.WebContent.Development"),
    CFSTR("com.apple.WebKit.GPU"),
    CFSTR("com.apple.WebKit.GPU.Development"),
    CFSTR("com.apple.PassKitCore"),
    CFSTR("passd"),
    CFSTR("PassbookUIService"),
    CFSTR("com.apple.PassbookUIService"),
    CFSTR("com.apple.calendar"),
    CFSTR("calaccessd"),
    v11,
    v12,
    v13,
    v14,
    v5,
    v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D22C70];
  v17 = v6;
  v18 = v7;
  v136[53] = CFSTR("HLS");
  v136[54] = CFSTR("HLS");
  v19 = *MEMORY[0x1E0D22C80];
  v20 = CFSTR("LockScreen");
  v136[55] = CFSTR("HLS");
  v136[56] = CFSTR("HLS");
  v21 = CFSTR("com.apple.PosterBoard");
  v22 = CFSTR("PosterBoard");
  v136[57] = CFSTR("HLS");
  v136[58] = CFSTR("HLS");
  v23 = CFSTR("com.apple.MobileBackup.framework");
  v24 = CFSTR("backupd");
  v136[59] = CFSTR("Backup");
  v136[60] = CFSTR("Backup");
  v25 = CFSTR("com.apple.backupd");
  v26 = CFSTR("softwareupdateservicesd");
  v136[61] = CFSTR("Backup");
  v136[62] = CFSTR("Backup");
  v27 = CFSTR("mobile.softwareupdated");
  v28 = CFSTR("com.apple.Restore");
  v136[63] = CFSTR("Backup");
  v136[64] = CFSTR("com.apple.AppStore");
  v29 = CFSTR("com.apple.atc");
  v136[65] = CFSTR("com.apple.AppStore");
  v30 = CFSTR("installd");
  v136[66] = CFSTR("com.apple.AppStore");
  v31 = CFSTR("com.apple.StreamingUnzipService");
  v136[67] = CFSTR("com.apple.AppStore");
  v32 = CFSTR("containermanagerd");
  v136[68] = CFSTR("com.apple.AppStore");
  v33 = CFSTR("appstored");
  v136[69] = CFSTR("com.apple.AppStore");
  v34 = CFSTR("OOS");
  v136[70] = CFSTR("PoorCellCondition");
  v35 = CFSTR("healthd");
  v136[71] = CFSTR("com.apple.Health");
  v36 = CFSTR("com.apple.healthappd");
  v136[72] = CFSTR("com.apple.Health");
  v37 = CFSTR("misd");
  v136[73] = CFSTR("Hotspot");
  v38 = CFSTR("RadarComposeUIService");
  v136[74] = CFSTR("com.apple.ist.radar");
  v39 = CFSTR("remindd");
  v136[75] = CFSTR("com.apple.reminders");
  v40 = CFSTR("homed");
  v136[76] = CFSTR("HomeKit");
  v41 = CFSTR("com.apple.private.alloy.willow");
  v136[77] = CFSTR("HomeKit");
  v42 = CFSTR("atc");
  v136[78] = CFSTR("com.apple.Music");
  v43 = CFSTR("siriactionsd");
  v136[79] = CFSTR("com.apple.shortcuts");
  v44 = CFSTR("com.apple.WorkflowKit.BackgroundShortcutRunner");
  v136[80] = CFSTR("com.apple.shortcuts");
  v45 = CFSTR("weatherd");
  v136[81] = CFSTR("com.apple.weather");
  v46 = CFSTR("synapse.contentlinkingd");
  v136[82] = CFSTR("com.apple.mobilenotes");
  v47 = CFSTR("com.apple.sportsd");
  v136[83] = CFSTR("com.apple.tv");
  v48 = CFSTR("sportsd");
  v136[84] = CFSTR("com.apple.tv");
  v49 = CFSTR("com.apple.continuitycaptured");
  v136[85] = CFSTR("com.apple.sidecar.extension.capture");
  v50 = CFSTR("com.apple.ContinuityCaptureShieldUI");
  v136[86] = CFSTR("com.apple.sidecar.extension.capture");
  v51 = CFSTR("com.apple.ScreenContinuityShell");
  v136[87] = CFSTR("ScreenContinuityShell");
  v52 = CFSTR("GenerativePlaygroundApp");
  v136[88] = CFSTR("com.apple.GenerativePlaygroundApp");
  v53 = CFSTR("eventkitsyncd");
  v136[89] = CFSTR("com.apple.mobilecal");
  v54 = CFSTR("companioncamerad");
  v136[90] = CFSTR("com.apple.camera");
  v55 = CFSTR("nanomailbootstrapd");
  v136[91] = CFSTR("com.apple.mobilemail");
  v56 = CFSTR("nanomapscd");
  v136[92] = CFSTR("com.apple.Maps");
  v57 = CFSTR("companionmessagesd");
  v136[93] = CFSTR("com.apple.MobileSMS");
  v58 = CFSTR("NPKCompanionAgent");
  v136[94] = CFSTR("com.apple.Passbook");
  v59 = CFSTR("tursd");
  v136[95] = CFSTR("com.apple.mobilephone");
  v60 = CFSTR("nptocompaniond");
  v136[96] = CFSTR("com.apple.mobileslideshow");
  v61 = CFSTR("remotemediaservicesd");
  v136[97] = CFSTR("com.apple.RemoteMediaServices");
  v62 = CFSTR("companionfindlocallyd");
  v136[98] = CFSTR("com.apple.companionfindlocallyd");
  v63 = CFSTR("pairedunlockd");
  v136[99] = CFSTR("com.apple.pairedunlockd");
  v64 = CFSTR("nanoweatherprefsd");
  v136[100] = CFSTR("com.apple.weather");
  v65 = CFSTR("com.apple.ess");
  v136[101] = CFSTR("com.apple.mobilephone");
  v66 = CFSTR("com.apple.madrid");
  v136[102] = CFSTR("com.apple.MobileSMS");
  v67 = CFSTR("com.apple.private.alloy.accountssync");
  v136[103] = CFSTR("accountsd");
  v68 = CFSTR("com.apple.private.alloy.addressbooksync");
  v136[104] = CFSTR("addressbooksyncd");
  v69 = CFSTR("com.apple.private.alloy.appregistrysync");
  v136[105] = CFSTR("nanoappregistryd");
  v70 = CFSTR("com.apple.private.alloy.audiocontrol.bridge");
  v136[106] = CFSTR("com.apple.Bridge");
  v71 = CFSTR("com.apple.private.alloy.audiocontrol.music");
  v136[107] = CFSTR("com.apple.Music");
  v72 = CFSTR("com.apple.private.alloy.bluetoothregistry");
  v136[108] = CFSTR("nanoregistryd");
  v73 = CFSTR("com.apple.private.alloy.bulletindistributor.settings");
  v136[109] = CFSTR("bulletindistributord");
  v74 = CFSTR("com.apple.private.alloy.bulletindistributor");
  v136[110] = CFSTR("bulletindistributord");
  v75 = CFSTR("com.apple.private.alloy.callhistorysync");
  v136[111] = CFSTR("CallHistorySyncHelper");
  v76 = CFSTR("com.apple.private.alloy.camera.proxy");
  v136[112] = CFSTR("com.apple.camera");
  v77 = CFSTR("com.apple.private.alloy.continuity.activity");
  v136[113] = CFSTR("sharingd");
  v78 = CFSTR("com.apple.private.alloy.continuity.auth");
  v136[114] = CFSTR("sharingd");
  v79 = CFSTR("com.apple.private.alloy.continuity.encryption");
  v136[115] = CFSTR("sharingd");
  v80 = CFSTR("com.apple.private.alloy.continuity.tethering");
  v136[116] = CFSTR("sharingd");
  v81 = CFSTR("com.apple.private.alloy.coreduet");
  v136[117] = CFSTR("coreduetd");
  v82 = CFSTR("com.apple.private.alloy.eventkitsync");
  v136[118] = CFSTR("com.apple.mobilecal");
  v83 = CFSTR("com.apple.private.alloy.fignero");
  v136[119] = CFSTR("mediaserverd");
  v84 = CFSTR("com.apple.private.alloy.findmylocaldevice");
  v136[120] = CFSTR("com.apple.companionfindlocallyd");
  v85 = CFSTR("com.apple.private.alloy.fmf");
  v136[121] = CFSTR("fmfd");
  v86 = CFSTR("com.apple.private.alloy.health.general");
  v136[122] = CFSTR("com.apple.Health");
  v87 = CFSTR("com.apple.private.alloy.health.sync");
  v136[123] = CFSTR("com.apple.Health");
  v88 = CFSTR("com.apple.private.alloy.icloudpairing");
  v136[124] = CFSTR("bluetoothd");
  v89 = CFSTR("com.apple.private.alloy.idscredentials");
  v136[125] = CFSTR("IDSCredentialsAgent");
  v90 = CFSTR("com.apple.private.alloy.idsremoteurlconnection");
  v136[126] = CFSTR("IDSRemoteURLConnectionAgent");
  v91 = CFSTR("com.apple.private.alloy.idstransfers");
  v136[127] = CFSTR("IMTransferAgent");
  v92 = CFSTR("com.apple.private.alloy.iosdiagnostics");
  v136[128] = CFSTR("Diagnostics");
  v93 = CFSTR("com.apple.private.alloy.location.auth");
  v136[129] = CFSTR("locationd");
  v94 = CFSTR("com.apple.private.alloy.location.motion");
  v136[130] = CFSTR("locationd");
  v95 = CFSTR("com.apple.private.alloy.location.usage");
  v136[131] = CFSTR("locationd");
  v96 = CFSTR("com.apple.private.alloy.location.wifitilesync");
  v136[132] = CFSTR("locationd");
  v97 = CFSTR("com.apple.private.alloy.mail.fetches");
  v136[133] = CFSTR("com.apple.mobilemail");
  v98 = CFSTR("com.apple.private.alloy.mail.sync.accounts");
  v136[134] = CFSTR("com.apple.mobilemail");
  v99 = CFSTR("com.apple.private.alloy.mail.sync.content");
  v136[135] = CFSTR("com.apple.mobilemail");
  v100 = CFSTR("com.apple.private.alloy.mail.sync.messages");
  v136[136] = CFSTR("com.apple.mobilemail");
  v101 = CFSTR("com.apple.private.alloy.maps.proxy");
  v136[137] = CFSTR("com.apple.Maps");
  v102 = CFSTR("com.apple.private.alloy.maps.sync");
  v136[138] = CFSTR("com.apple.Maps");
  v103 = CFSTR("com.apple.private.alloy.maps");
  v136[139] = CFSTR("com.apple.Maps");
  v104 = CFSTR("com.apple.private.alloy.messages");
  v136[140] = CFSTR("com.apple.MobileSMS");
  v105 = CFSTR("com.apple.private.alloy.nsurlsessionproxy");
  v136[141] = CFSTR("sharingd");
  v106 = CFSTR("com.apple.private.alloy.otaupdate");
  v136[142] = CFSTR("Restore");
  v107 = CFSTR("com.apple.private.alloy.pairedunlock");
  v136[143] = CFSTR("com.apple.pairedunlockd");
  v108 = CFSTR("com.apple.private.alloy.passbook.general");
  v136[144] = CFSTR("com.apple.Passbook");
  v109 = CFSTR("com.apple.private.alloy.passbook.maintenance");
  v136[145] = CFSTR("com.apple.Passbook");
  v110 = CFSTR("com.apple.private.alloy.passbook.provisioning");
  v136[146] = CFSTR("com.apple.Passbook");
  v111 = CFSTR("com.apple.private.alloy.passbook.relevancy");
  v136[147] = CFSTR("com.apple.Passbook");
  v112 = CFSTR("com.apple.private.alloy.passbook.remoteadmin");
  v136[148] = CFSTR("com.apple.Passbook");
  v113 = CFSTR("com.apple.private.alloy.pbbridge");
  v136[149] = CFSTR("com.apple.Bridge");
  v114 = CFSTR("com.apple.private.alloy.phonecontinuity");
  v136[150] = CFSTR("com.apple.mobilephone");
  v115 = CFSTR("com.apple.private.alloy.photos.proxy");
  v136[151] = CFSTR("com.apple.mobileslideshow");
  v116 = CFSTR("com.apple.private.alloy.photostream");
  v136[152] = CFSTR("com.apple.mobileslideshow");
  v117 = CFSTR("com.apple.private.alloy.preferencessync");
  v136[153] = CFSTR("nanoprefsyncd");
  v118 = CFSTR("com.apple.private.alloy.proxiedcrashcopier");
  v136[154] = CFSTR("ProxiedCrashCopier");
  v119 = CFSTR("com.apple.private.alloy.pushproxy");
  v136[155] = CFSTR("apsd");
  v120 = CFSTR("com.apple.private.alloy.remotemediaservices");
  v136[156] = CFSTR("com.apple.RemoteMediaServices");
  v121 = CFSTR("com.apple.private.alloy.resourcegrabber");
  v136[157] = CFSTR("resourcegrabberd");
  v122 = CFSTR("com.apple.private.alloy.screenshotter");
  v136[158] = CFSTR("screenshotsyncd");
  v123 = CFSTR("com.apple.private.alloy.siri.device");
  v136[159] = CFSTR("Siri");
  v124 = CFSTR("com.apple.private.alloy.siri.location");
  v136[160] = CFSTR("Siri");
  v125 = CFSTR("com.apple.private.alloy.siri.proxy");
  v136[161] = CFSTR("Siri");
  v126 = CFSTR("com.apple.private.alloy.sms");
  v136[162] = CFSTR("com.apple.MobileSMS");
  v127 = CFSTR("com.apple.private.alloy.sockpuppet");
  v136[163] = CFSTR("companionappd");
  v128 = CFSTR("com.apple.private.alloy.systemsettings");
  v136[164] = CFSTR("nanosystemsettingsd");
  v129 = CFSTR("com.apple.private.alloy.telephonyutilitiestemporary");
  v136[165] = CFSTR("com.apple.mobilephone");
  v130 = CFSTR("com.apple.private.alloy.timesync");
  v136[166] = CFSTR("timed");
  v131 = CFSTR("com.apple.private.alloy.timezonesync");
  v136[167] = CFSTR("tzd");
  v132 = CFSTR("com.apple.private.alloy.utilitybelt");
  v136[168] = CFSTR("com.apple.Bridge");
  v133 = CFSTR("com.apple.private.alloy.voicemailsync");
  v136[169] = CFSTR("com.apple.mobilephone");
  v134 = CFSTR("com.apple.private.alloy.wifi.networksync");
  v136[170] = CFSTR("wifid");
  v135 = CFSTR("com.apple.private.alloy.continuity.notifications");
  v136[171] = CFSTR("ScreenContinuityShell");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v136, v10, 172);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)getBundleIDToForegroundTimeMap
{
  return &unk_1EA1D7360;
}

- (id)getBundleIDToBackgroundTimeMap
{
  return &unk_1EA1D7388;
}

- (id)getEnergyEntry:(id)a3 forBundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__5;
  v17 = __Block_byref_object_dispose__5;
  v18 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getEnergyEntry_forBundleID___block_invoke;
  v10[3] = &unk_1EA16D588;
  v7 = v6;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __81__PLBatteryUIResponseTypeBatteryBreakdown_Utilities__getEnergyEntry_forBundleID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)getBundleIDsToEnergyKeyForSlopAdjustmentMap
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(&unk_1EA1DB3B0, "objectAtIndexedSubscript:", 58);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("EN"));

  objc_msgSend(&unk_1EA1DB3C8, "objectAtIndexedSubscript:", 59);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("com.apple.findmy"));

  if (objc_msgSend(MEMORY[0x1E0D80020], "hasAOD"))
    objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("AlwaysOnEnergy"), CFSTR("HLS"));
  return v2;
}

- (id)dependencies
{
  return 0;
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
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;

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
  -[PLBatteryUIResponseTypeBatteryBreakdown setStart:](self, "setStart:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown setEnd:](self, "setEnd:", v15);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "doubleValue");
  -[PLBatteryUIResponseTypeBatteryBreakdown setBucketSize:](self, "setBucketSize:");

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown setMonotonicNow:](self, "setMonotonicNow:", v17);

  -[PLBatteryUIResponseTypeBatteryBreakdown getNodeIDToNodeNameMap](self, "getNodeIDToNodeNameMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown setNodeIDsToNodeNames:](self, "setNodeIDsToNodeNames:", v18);

  -[PLBatteryUIResponseTypeBatteryBreakdown setHasHomeKit:](self, "setHasHomeKit:", -[PLBatteryUIResponseTypeBatteryBreakdown hasHomeKitEvents](self, "hasHomeKitEvents"));
  -[PLBatteryUIResponseTypeBatteryBreakdown setIsSlopAdjustmentEnabled:](self, "setIsSlopAdjustmentEnabled:", 1);
  -[PLBatteryUIResponseTypeBatteryBreakdown getLastBatteryEntry](self, "getLastBatteryEntry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown setLastBatteryEntry:](self, "setLastBatteryEntry:", v19);

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("LastUpgradeTimestamp"), CFSTR("com.apple.powerlogd"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "doubleValue");
  -[PLBatteryUIResponseTypeBatteryBreakdown setLastUpgradeTimestamp:](self, "setLastUpgradeTimestamp:");

  -[PLBatteryUIResponseTypeBatteryBreakdown buildUtilityCache](self, "buildUtilityCache");
  -[PLBatteryUIResponseTypeBatteryBreakdown start](self, "start");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown end](self, "end");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "timeIntervalSince1970");
  v24 = v23;
  objc_msgSend(v22, "timeIntervalSince1970");
  v26 = v25 - v24;

  -[PLBatteryUIResponseTypeBatteryBreakdown monotonicNow](self, "monotonicNow");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown getDataRange:](self, "getDataRange:", v27);
  v29 = v28;
  v31 = v30;

  -[PLBatteryUIResponseTypeBatteryBreakdown generateRange:withDataRange:](self, "generateRange:withDataRange:", v24 + -1800.0, v26 + 1800.0, v29, v31);
  v33 = v32;
  v35 = v34;
  -[PLBatteryUIResponseTypeBatteryBreakdown setGizmoConnected:](self, "setGizmoConnected:", -[PLBatteryUIResponseTypeBatteryBreakdown gizmoConnectedInRange:](self, "gizmoConnectedInRange:"));
  -[PLBatteryUIResponseTypeBatteryBreakdown getDataDurationFromRange:](self, "getDataDurationFromRange:", v33, v35);
  -[PLBatteryUIResponseTypeBatteryBreakdown setDataDuration:](self, "setDataDuration:");
  -[PLBatteryUIResponseTypeBatteryBreakdown buildBucketsForRange:](self, "buildBucketsForRange:", v33, v35);
}

- (void)coalesce
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeBatteryBreakdown buckets](self, "buckets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getStaticData](self, "getStaticData");
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[PLBatteryUIResponseTypeBatteryBreakdown buckets](self, "buckets", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          -[PLBatteryUIResponseTypeBatteryBreakdown populateEnergyBucketKeysWithEntries:](self, "populateEnergyBucketKeysWithEntries:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown populateInternalRootNodeEnergyKeys:](self, "populateInternalRootNodeEnergyKeys:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown populateBLDKeysWithEnergyEntries:](self, "populateBLDKeysWithEnergyEntries:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:](self, "applyStaticNameTransformation:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown adjustExtensionBackgroundTimeWithEnergyEntries:](self, "adjustExtensionBackgroundTimeWithEnergyEntries:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown applyDynamicNameTransformation:](self, "applyDynamicNameTransformation:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown adjustRuntimes:](self, "adjustRuntimes:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown applyDisplayNameTransformation:](self, "applyDisplayNameTransformation:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:](self, "addEntryTypes:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown filterEnergyEntries:](self, "filterEnergyEntries:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown filterEnergyEntriesWithRuntimes:](self, "filterEnergyEntriesWithRuntimes:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown addTotalEnergy:](self, "addTotalEnergy:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown addTotals:](self, "addTotals:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown adjustEnergyValues:](self, "adjustEnergyValues:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown addQualifiers:](self, "addQualifiers:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown addErrorCode:](self, "addErrorCode:", v10);
          -[PLBatteryUIResponseTypeBatteryBreakdown cleanEntries:](self, "cleanEntries:", v10);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

- (id)result
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToDisplayNames:](self, "setBundleIDsToDisplayNames:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setDeletedAppBundleIDs:](self, "setDeletedAppBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setDeletedAppClipBundleIDs:](self, "setDeletedAppClipBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setPluginBundleIDsToEntries:](self, "setPluginBundleIDsToEntries:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setWebAppBundleIDs:](self, "setWebAppBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setRootNodeBundleIDs:](self, "setRootNodeBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setNonAppBundleIDs:](self, "setNonAppBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setExchangeBundleIDs:](self, "setExchangeBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToReplacementBundleIDs:](self, "setBundleIDsToReplacementBundleIDs:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToForegroundTimes:](self, "setBundleIDsToForegroundTimes:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToBackgroundTimes:](self, "setBundleIDsToBackgroundTimes:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setRootNodeIDToRootNodeEnergyKeys:](self, "setRootNodeIDToRootNodeEnergyKeys:", 0);
  -[PLBatteryUIResponseTypeBatteryBreakdown setIntermediateRootNodes:](self, "setIntermediateRootNodes:", 0);
  v10[0] = CFSTR("PLBatteryUIBreakdownKey");
  -[PLBatteryUIResponseTypeBatteryBreakdown buckets](self, "buckets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = CFSTR("PLBatteryUIDataDurationKey");
  v11[0] = v5;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeBatteryBreakdown dataDuration](self, "dataDuration");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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

- (void)addTotalEnergy:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "doubleValue");
        v8 = v8 + v11;

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
    v12 = v8 * 100.0;
  }
  else
  {
    v12 = 0.0;
  }

  +[PLUtilities defaultBatteryEnergyCapacity](PLUtilities, "defaultBatteryEnergyCapacity");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.00f%% of Battery"), v12 / v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIBatteryCyclesKey"));

}

- (BOOL)filterFgBg:(id)a3 filterArray:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "doubleValue");
  v13 = v12;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "doubleValue");
  v16 = v15;

  v17 = 0;
  if (v16 <= 0.0 && v10 == 0.0 && v13 < 60.0)
  {
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.findmy")))
    {
      objc_msgSend(&unk_1EA1DCA18, "objectAtIndexedSubscript:", 59);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;

      if (v21 > 0.0)
      {
        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypeBatteryBreakdown filterFgBg:filterArray:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

        objc_msgSend(v6, "addObject:", v5);
      }
    }
    v17 = 1;
  }

  return v17;
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
  -[PLBatteryUIResponseTypeBatteryBreakdown getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);
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
  -[PLBatteryUIResponseTypeBatteryBreakdown getNodeEntriesForEntryKey:withRange:andTimeInterval:](self, "getNodeEntriesForEntryKey:withRange:andTimeInterval:", v8, location, length, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)getStaticData
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  -[PLBatteryUIResponseTypeBatteryBreakdown rootNodeBundleIDs](self, "rootNodeBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getRootNodeBundleIDs](self, "getRootNodeBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setRootNodeBundleIDs:](self, "setRootNodeBundleIDs:", v4);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown nonAppBundleIDs](self, "nonAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getNonAppBundleIDs](self, "getNonAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setNonAppBundleIDs:](self, "setNonAppBundleIDs:", v6);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown exchangeBundleIDs](self, "exchangeBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getExchangeBundleIDs](self, "getExchangeBundleIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setExchangeBundleIDs:](self, "setExchangeBundleIDs:", v8);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getBundleIDToReplacementBundleIDMap](self, "getBundleIDToReplacementBundleIDMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToReplacementBundleIDs:](self, "setBundleIDsToReplacementBundleIDs:", v10);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToForegroundTimes](self, "bundleIDsToForegroundTimes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getBundleIDToForegroundTimeMap](self, "getBundleIDToForegroundTimeMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToForegroundTimes:](self, "setBundleIDsToForegroundTimes:", v12);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToBackgroundTimes](self, "bundleIDsToBackgroundTimes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getBundleIDToBackgroundTimeMap](self, "getBundleIDToBackgroundTimeMap");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToBackgroundTimes:](self, "setBundleIDsToBackgroundTimes:", v14);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToEnergyKeyForSlopAdjustment](self, "bundleIDsToEnergyKeyForSlopAdjustment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getBundleIDsToEnergyKeyForSlopAdjustmentMap](self, "getBundleIDsToEnergyKeyForSlopAdjustmentMap");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setBundleIDsToEnergyKeyForSlopAdjustment:](self, "setBundleIDsToEnergyKeyForSlopAdjustment:", v16);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown rootNodeIDToRootNodeEnergyKeys](self, "rootNodeIDToRootNodeEnergyKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getRootNodeIDToRootNodeEnergyKeys](self, "getRootNodeIDToRootNodeEnergyKeys");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setRootNodeIDToRootNodeEnergyKeys:](self, "setRootNodeIDToRootNodeEnergyKeys:", v18);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown intermediateRootNodes](self, "intermediateRootNodes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown getIntermediateRootNodes](self, "getIntermediateRootNodes");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown setIntermediateRootNodes:](self, "setIntermediateRootNodes:", v20);

  }
}

- (void)addEntryTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *obj;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown rootNodeBundleIDs](self, "rootNodeBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown nonAppBundleIDs](self, "nonAppBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PLBatteryUIResponseTypeBatteryBreakdown webAppBundleIDs](self, "webAppBundleIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUITotalAccountedEnergyKey"));
          v36 = 0u;
          v37 = 0u;
          v34 = 0u;
          v35 = 0u;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
          obj = objc_claimAutoreleasedReturnValue();
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v9)
          {
            v10 = v9;
            v33 = *(_QWORD *)v35;
            do
            {
              for (i = 0; i != v10; ++i)
              {
                if (*(_QWORD *)v35 != v33)
                  objc_enumerationMutation(obj);
                v12 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
                v13 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalAccountedEnergyKey"));
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "doubleValue");
                v16 = v15;
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v17 = objc_claimAutoreleasedReturnValue();
                objc_msgSend((id)v17, "doubleValue");
                objc_msgSend(v13, "numberWithDouble:", v16 + v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, CFSTR("PLBatteryUITotalAccountedEnergyKey"));

                -[PLBatteryUIResponseTypeBatteryBreakdown rootNodeBundleIDs](self, "rootNodeBundleIDs");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v17) = objc_msgSend(v20, "containsObject:", v21);

                v22 = &unk_1EA1C1280;
                if ((v17 & 1) == 0)
                {
                  -[PLBatteryUIResponseTypeBatteryBreakdown nonAppBundleIDs](self, "nonAppBundleIDs", &unk_1EA1C1280);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  v25 = objc_msgSend(v23, "containsObject:", v24);

                  v22 = &unk_1EA1C1298;
                  if ((v25 & 1) == 0)
                  {
                    -[PLBatteryUIResponseTypeBatteryBreakdown webAppBundleIDs](self, "webAppBundleIDs", &unk_1EA1C1298);
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    v28 = objc_msgSend(v26, "containsObject:", v27);

                    v22 = &unk_1EA1C12B0;
                    if ((v28 & 1) == 0)
                    {
                      -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames", &unk_1EA1C12B0);
                      v29 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v29, "objectForKeyedSubscript:", v30);
                      v31 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v31)
                        v22 = &unk_1EA1C1268;
                      else
                        v22 = &unk_1EA1C12C8;
                    }
                  }
                }
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("PLBatteryUIAppTypeKey"));
              }
              v10 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
            }
            while (v10);
          }
        }
        else
        {
          PLLogCommon();
          obj = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
            -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.4();
        }
      }
      else
      {
        PLLogCommon();
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.3();
      }
    }
    else
    {
      PLLogCommon();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.2();
    }
  }
  else
  {
    PLLogCommon();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.1();
  }

}

- (void)addQualifiers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  NSObject *v35;
  double v36;
  double v37;
  double v38;
  _BOOL4 v39;
  double v40;
  double v41;
  NSObject *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  double v56;
  uint64_t v57;
  _QWORD *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  uint64_t v68;
  _QWORD *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  NSObject *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  double v94;
  double v95;
  void *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  uint64_t v103;
  void *v104;
  void *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  void *v110;
  uint64_t v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  void *v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  void *v129;
  double v130;
  double v131;
  NSObject *v132;
  double v133;
  void *v134;
  void *v135;
  double v136;
  double v137;
  NSObject *v138;
  double v139;
  void *v140;
  int v141;
  void *v142;
  void *v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  void *v148;
  double v149;
  NSObject *v150;
  double v151;
  double v152;
  NSObject *v153;
  double v154;
  void *v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  void *v160;
  void *v161;
  double v162;
  double v163;
  double v164;
  void *v165;
  void *v166;
  double v167;
  double v168;
  void *v169;
  void *v170;
  double v171;
  double v172;
  void *v173;
  void *v174;
  double v175;
  double v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  void *v181;
  double v182;
  double v183;
  double v184;
  NSObject *v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  void *v190;
  void *v191;
  double v192;
  double v193;
  double v194;
  void *v195;
  int v196;
  double v197;
  void *v198;
  double v199;
  double v200;
  void *v201;
  int v202;
  uint64_t v203;
  void *v204;
  unint64_t v205;
  void *v206;
  int v207;
  void *v208;
  id v209;
  PLBatteryUIResponseTypeBatteryBreakdown *v210;
  uint64_t v211;
  uint64_t v212;
  id obj;
  void *v214;
  void *v215;
  uint64_t v216;
  void *v217;
  void *v218;
  double v219;
  void *v220;
  void *v221;
  _QWORD v222[5];
  _QWORD v223[5];
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  uint8_t buf[4];
  double v229;
  __int16 v230;
  double v231;
  __int16 v232;
  double v233;
  __int16 v234;
  void *v235;
  _BYTE v236[128];
  uint64_t v237;

  v237 = *MEMORY[0x1E0C80C00];
  v224 = 0u;
  v225 = 0u;
  v226 = 0u;
  v227 = 0u;
  v209 = a3;
  objc_msgSend(v209, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, v236, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0x1E0C99000uLL;
    v7 = *(_QWORD *)v225;
    v8 = 0.33;
    v210 = self;
    v211 = *(_QWORD *)v225;
    do
    {
      v9 = 0;
      v212 = v5;
      do
      {
        if (*(_QWORD *)v225 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * v9);
        objc_msgSend(*(id *)(v6 + 3560), "array");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyUsedKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        v14 = v13;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v17 = v16;

        if (v17 >= 1.0
          || objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")))
        {
          v18 = v8;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "doubleValue");
          v21 = v20;

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "doubleValue");
          v24 = v23;

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "doubleValue");
          v30 = v29;

          -[PLBatteryUIResponseTypeBatteryBreakdown bgLocationAudioTimeRuntimes:bundleID:](self, "bgLocationAudioTimeRuntimes:bundleID:", v10, v11);
          v219 = v24;
          v31 = v21 + v24;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeOriginalKey"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "doubleValue");
          v34 = v33;

          PLLogCommon();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218240;
            v229 = v34;
            v230 = 2048;
            v231 = v31;
            _os_log_debug_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEBUG, "adding AlwaysOnTimeInSecs=%f to totalRuntime=%f for AppQualifierPluggedIn calculation", buf, 0x16u);
          }

          -[PLBatteryUIResponseTypeBatteryBreakdown bucketSize](self, "bucketSize");
          v37 = v36;
          objc_msgSend(MEMORY[0x1E0D7FFF8], "defaultBatteryEnergyCapacity");
          v39 = v38 <= 0.0 || v14 / v38 <= dbl_1DABA1D40[v37 > 3600.0];
          v40 = v31 + v34;
          if (v40 > 0.0)
          {
            v41 = v27 + v30;
            if (v41 / v40 >= 0.8 && v39)
            {
              PLLogCommon();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 134218240;
                v229 = v41;
                v230 = 2048;
                v231 = v40;
                _os_log_debug_impl(&dword_1DA9D6000, v43, OS_LOG_TYPE_DEBUG, "adding AppQualifierPluggedIn pluggedInSecs=%f, totalRuntime=%f", buf, 0x16u);
              }

              objc_msgSend(v221, "addObject:", &unk_1EA1C12E0);
            }
          }
          if (v14 == 0.0)
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v221, CFSTR("PLBatteryUIAppQualifiersKey"));
            v8 = v18;
          }
          else
          {
            objc_msgSend(&unk_1EA1DCA30, "objectAtIndexedSubscript:", 1);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v44);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "doubleValue");
            v47 = v46;

            v48 = v47 / v14;
            v8 = v18;
            if (v47 / v14 > v18
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](self, "canSetQualifier:forBundleID:", 1, v11, v48))
            {
              objc_msgSend(v221, "addObject:", &unk_1EA1C12F8);
            }
            objc_msgSend(&unk_1EA1DCA48, "objectAtIndexedSubscript:", 2, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "doubleValue");
            v52 = v51;

            v53 = v14 - v52;
            v54 = v53 / v14;
            if (v53 / v14 > 0.5
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](self, "canSetQualifier:forBundleID:", 2, v11))
            {
              v55 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
              if (v21 < 300.0 || (v56 = v21 / v219, v21 / v219 < v18))
              {
                if (v55)
                {
                  v68 = objc_opt_class();
                  v222[0] = MEMORY[0x1E0C809B0];
                  v222[1] = 3221225472;
                  v222[2] = __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke_243;
                  v222[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v222[4] = v68;
                  v69 = v222;
                  if (addQualifiers__defaultOnce_241 != -1)
                    dispatch_once(&addQualifiers__defaultOnce_241, v69);

                  if (addQualifiers__classDebugEnabled_242)
                  {
                    v70 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
                    v71 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v219);
                    v72 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v70, "stringWithFormat:", CFSTR("BGQualifier: Removing qualifier based on BGTime %@, FGTime %@"), v71, v72);
                    v73 = (void *)objc_claimAutoreleasedReturnValue();

                    v74 = (void *)MEMORY[0x1E0D7FF98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "lastPathComponent");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown addQualifiers:]");
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v74, "logMessage:fromFile:fromFunction:fromLineNumber:", v73, v76, v77, 435);

                    PLLogCommon();
                    v78 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v229 = *(double *)&v73;
                      _os_log_debug_impl(&dword_1DA9D6000, v78, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
              }
              else
              {
                if (v55)
                {
                  v57 = objc_opt_class();
                  v223[0] = MEMORY[0x1E0C809B0];
                  v223[1] = 3221225472;
                  v223[2] = __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke;
                  v223[3] = &__block_descriptor_40_e5_v8__0lu32l8;
                  v223[4] = v57;
                  v58 = v223;
                  if (addQualifiers__defaultOnce != -1)
                    dispatch_once(&addQualifiers__defaultOnce, v58);

                  if (addQualifiers__classDebugEnabled)
                  {
                    v59 = (void *)MEMORY[0x1E0CB3940];
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
                    v60 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v219);
                    v61 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v59, "stringWithFormat:", CFSTR("BGQualifier: Adding qualifier based on BGTime %@, FGTime %@"), v60, v61);
                    v62 = (void *)objc_claimAutoreleasedReturnValue();

                    v63 = (void *)MEMORY[0x1E0D7FF98];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
                    v64 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v64, "lastPathComponent");
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown addQualifiers:]");
                    v66 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "logMessage:fromFile:fromFunction:fromLineNumber:", v62, v65, v66, 432);

                    PLLogCommon();
                    v67 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412290;
                      v229 = *(double *)&v62;
                      _os_log_debug_impl(&dword_1DA9D6000, v67, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                    }

                  }
                }
                objc_msgSend(v221, "addObject:", &unk_1EA1C1310, v56);
              }
            }
            if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.findmy")))
            {
              objc_msgSend(&unk_1EA1DCA60, "objectAtIndexedSubscript:", 59);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v80, "doubleValue");
              v82 = v81;

              if (v82 / v14 > v18 && (objc_msgSend(v221, "containsObject:", &unk_1EA1C1310, v82 / v14) & 1) == 0)
                objc_msgSend(v221, "addObject:", &unk_1EA1C1310);
              PLLogCommon();
              v83 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v229 = *(double *)&v221;
                _os_log_debug_impl(&dword_1DA9D6000, v83, OS_LOG_TYPE_DEBUG, "IT Qualifier: %@", buf, 0xCu);
              }

            }
            v216 = v9;
            objc_msgSend(&unk_1EA1DCA78, "objectAtIndexedSubscript:", 48);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v85, "doubleValue");
            v87 = v86;

            objc_msgSend(&unk_1EA1DCA90, "objectAtIndexedSubscript:", 12);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "doubleValue");
            v91 = v87 + v90;

            objc_msgSend(&unk_1EA1DCAA8, "objectAtIndexedSubscript:", 13);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v92);
            v93 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "doubleValue");
            v95 = v91 + v94;

            v96 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(&unk_1EA1DCAC0, "objectAtIndexedSubscript:", 15);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1EA1DCAD8, "objectAtIndexedSubscript:", 2);
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v96, "stringWithFormat:", CFSTR("%@-%@"), v97, v98);
            v218 = v11;
            v99 = objc_claimAutoreleasedReturnValue();

            v100 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(&unk_1EA1DCAF0, "objectAtIndexedSubscript:", 15);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1EA1DCB08, "objectAtIndexedSubscript:", 7);
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "stringWithFormat:", CFSTR("%@-%@"), v101, v102);
            v103 = objc_claimAutoreleasedReturnValue();

            v104 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(&unk_1EA1DCB20, "objectAtIndexedSubscript:", 15);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1EA1DCB38, "objectAtIndexedSubscript:", 9);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "stringWithFormat:", CFSTR("%@-%@"), v105, v106);
            v107 = objc_claimAutoreleasedReturnValue();

            v108 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(&unk_1EA1DCB50, "objectAtIndexedSubscript:", 15);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1EA1DCB68, "objectAtIndexedSubscript:", 52);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v108, "stringWithFormat:", CFSTR("%@-%@"), v109, v110);
            v111 = objc_claimAutoreleasedReturnValue();

            v112 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(&unk_1EA1DCB80, "objectAtIndexedSubscript:", 15);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(&unk_1EA1DCB98, "objectAtIndexedSubscript:", 54);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "stringWithFormat:", CFSTR("%@-%@"), v113, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();

            v220 = (void *)v99;
            v116 = v99;
            v11 = v218;
            objc_msgSend(v10, "objectForKeyedSubscript:", v116);
            v117 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "doubleValue");
            v119 = v95 + v118;

            v217 = (void *)v103;
            objc_msgSend(v10, "objectForKeyedSubscript:", v103);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v120, "doubleValue");
            v122 = v119 + v121;

            v215 = (void *)v107;
            objc_msgSend(v10, "objectForKeyedSubscript:", v107);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v123, "doubleValue");
            v125 = v122 + v124;

            v214 = (void *)v111;
            objc_msgSend(v10, "objectForKeyedSubscript:", v111);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v126, "doubleValue");
            v128 = v125 + v127;

            objc_msgSend(v10, "objectForKeyedSubscript:", v115);
            v129 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v129, "doubleValue");
            v131 = v128 + v130;

            PLLogCommon();
            v132 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v229 = *(double *)&v218;
              v230 = 2048;
              v231 = v131;
              _os_log_debug_impl(&dword_1DA9D6000, v132, OS_LOG_TYPE_DEBUG, "%@ locEnergy: %.3f", buf, 0x16u);
            }

            v133 = v131 / v14;
            v9 = v216;
            if (v131 / v14 > v18
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 3, v218, v133))
            {
              objc_msgSend(&unk_1EA1DCBB0, "objectAtIndexedSubscript:", 15);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "objectForKeyedSubscript:", v134);
              v135 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "doubleValue");
              v137 = v136;

              PLLogCommon();
              v138 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v138, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v229 = *(double *)&v218;
                v230 = 2048;
                v231 = v137;
                _os_log_debug_impl(&dword_1DA9D6000, v138, OS_LOG_TYPE_DEBUG, "%@ bgLocEnergy: %.3f", buf, 0x16u);
              }

              v139 = v137 / v53;
              v140 = &unk_1EA1C1340;
              if (v137 / v53 > v18)
              {
                v141 = objc_msgSend(v221, "containsObject:", &unk_1EA1C1310, v139);
                v140 = &unk_1EA1C1340;
                if (v141)
                {
                  objc_msgSend(v221, "removeObject:", &unk_1EA1C1310);
                  v140 = &unk_1EA1C1328;
                }
              }
              objc_msgSend(v221, "addObject:", v140, v139);
            }
            objc_msgSend(&unk_1EA1DCBC8, "objectAtIndexedSubscript:", 17, v133);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v142);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v143, "doubleValue");
            v145 = v144;

            v146 = v145 + 0.0;
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
            v147 = (void *)objc_claimAutoreleasedReturnValue();

            if (v147)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "notificationEnergy");
              v146 = v146 + v149;

            }
            PLLogCommon();
            v150 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v150, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v229 = v146;
              _os_log_debug_impl(&dword_1DA9D6000, v150, OS_LOG_TYPE_DEBUG, "Notification energy: %.3f", buf, 0xCu);
            }

            if (v146 > 0.0
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 9, v218))
            {
              +[PLUtilities defaultBatteryEnergyCapacity](PLUtilities, "defaultBatteryEnergyCapacity");
              v152 = v146 * 100.0 / v151;
              PLLogCommon();
              v153 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v153, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                v229 = *(double *)&v218;
                v230 = 2048;
                v231 = v146;
                v232 = 2048;
                v233 = v152;
                _os_log_debug_impl(&dword_1DA9D6000, v153, OS_LOG_TYPE_DEBUG, "%@, energy: %.3f, batteryPercent %.3f", buf, 0x20u);
              }

              v154 = v146 / v14;
              if (v146 / v14 > v8 || (v154 = 1.0, v152 > 1.0))
                objc_msgSend(v221, "addObject:", &unk_1EA1C1358, v154);
            }
            objc_msgSend(&unk_1EA1DCBE0, "objectAtIndexedSubscript:", 3);
            v155 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v155);
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "doubleValue");
            v158 = v157;

            v159 = v158 / v14;
            if (v158 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 4, v218, v159))
            {
              objc_msgSend(v221, "addObject:", &unk_1EA1C1370);
            }
            objc_msgSend(&unk_1EA1DCBF8, "objectAtIndexedSubscript:", 4, v159);
            v160 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v160);
            v161 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v161, "doubleValue");
            v163 = v162;

            v164 = v163 / v14;
            if (v163 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 5, v218, v164))
            {
              objc_msgSend(v221, "addObject:", &unk_1EA1C1388);
            }
            objc_msgSend(&unk_1EA1DCC10, "objectAtIndexedSubscript:", 14, v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v165);
            v166 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v166, "doubleValue");
            v168 = v167;

            objc_msgSend(&unk_1EA1DCC28, "objectAtIndexedSubscript:", 15);
            v169 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v169);
            v170 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v170, "doubleValue");
            v172 = v171;

            objc_msgSend(&unk_1EA1DCC40, "objectAtIndexedSubscript:", 55);
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v173);
            v174 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v174, "doubleValue");
            v176 = v175;

            if ((v168 + v172 + v176) / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 7, v218))
            {
              objc_msgSend(v221, "addObject:", &unk_1EA1C13A0);
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("WatchEnergy"));
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v177, "doubleValue");
            v179 = v178;

            if (-[PLBatteryUIResponseTypeBatteryBreakdown gizmoConnected](v210, "gizmoConnected"))
            {
              v180 = v179 / v14;
              if (v179 / v14 > v8)
              {
                if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 10, v218, v180))
                {
                  objc_msgSend(v221, "addObject:", &unk_1EA1C13B8);
                }
              }
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PosterEnergy"), v180);
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v181, "doubleValue");
            v183 = v182;

            v184 = v183 / v14;
            if (v183 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 14, v218, v184)|| objc_msgSend(v218, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp"), v184))
            {
              PLLogCommon();
              v185 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v185, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138413058;
                v229 = *(double *)&v10;
                v230 = 2048;
                v231 = v183;
                v232 = 2048;
                v233 = v14;
                v234 = 2112;
                v235 = v218;
                _os_log_debug_impl(&dword_1DA9D6000, v185, OS_LOG_TYPE_DEBUG, "Adding Poster Qualifer: energyEntry=%@, posterEnergy=%f, energy=%f, bundleID=%@", buf, 0x2Au);
              }

              objc_msgSend(v221, "addObject:", &unk_1EA1C13D0);
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("ChronoWidgetEnergy"));
            v186 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v186, "doubleValue");
            v188 = v187;

            v189 = v188 / v14;
            if (v188 / v14 > v8)
            {
              if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 12, v218, v189))
              {
                objc_msgSend(v221, "addObject:", &unk_1EA1C13E8);
                if (-[PLBatteryUIResponseTypeBatteryBreakdown getWidgetTypeForEnergyEntry:](v210, "getWidgetTypeForEnergyEntry:", v10) == 2)
                {
                  if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 16, v218))
                  {
                    objc_msgSend(v221, "removeObject:", &unk_1EA1C13E8);
                    objc_msgSend(v221, "addObject:", &unk_1EA1C1400);
                  }
                }
              }
            }
            objc_msgSend(&unk_1EA1DCC58, "objectAtIndexedSubscript:", 10, v189);
            v190 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKeyedSubscript:", v190);
            v191 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v191, "doubleValue");
            v193 = v192;

            v194 = v193 / v14;
            if (v193 / v14 > v8
              && -[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 9, v218, v194))
            {
              objc_msgSend(v221, "addObject:", &unk_1EA1C1358);
            }
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"), v194);
            v195 = (void *)objc_claimAutoreleasedReturnValue();
            v196 = objc_msgSend(v195, "isEqualToString:", CFSTR("com.apple.Home"));

            if (v196)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("HomeKitEnergy"));
              v198 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v198, "doubleValue");
              v200 = v199;

              v197 = v200 / v14;
              if (v200 / v14 > v8)
              {
                if (-[PLBatteryUIResponseTypeBatteryBreakdown canSetQualifier:forBundleID:](v210, "canSetQualifier:forBundleID:", 13, v218, v197))
                {
                  objc_msgSend(v221, "addObject:", &unk_1EA1C1418);
                }
              }
            }
            -[PLBatteryUIResponseTypeBatteryBreakdown combineQualifiers:](v210, "combineQualifiers:", v221, v197);
            v201 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v221, "containsObject:", &unk_1EA1C13A0))
            {
              v202 = objc_msgSend(v221, "containsObject:", &unk_1EA1C1310);
              if (v54 > 0.5 && v202 && (objc_msgSend(v201, "containsObject:", &unk_1EA1C12E0) & 1) == 0)
              {
                objc_msgSend(v201, "arrayByAddingObject:", &unk_1EA1C1310);
                v203 = objc_claimAutoreleasedReturnValue();

                v201 = (void *)v203;
              }
            }
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v204 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v201, "containsObject:", &unk_1EA1C12E0))
              objc_msgSend(v204, "addObject:", &unk_1EA1C12E0);
            if (objc_msgSend(v201, "count"))
            {
              v205 = 0;
              do
              {
                objc_msgSend(v201, "objectAtIndexedSubscript:", v205);
                v206 = (void *)objc_claimAutoreleasedReturnValue();
                v207 = objc_msgSend(v206, "intValue");

                if (v207 != 11)
                {
                  objc_msgSend(v201, "objectAtIndexedSubscript:", v205);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v204, "addObject:", v208);

                }
                if (objc_msgSend(v204, "count") == 2)
                  break;
                ++v205;
              }
              while (objc_msgSend(v201, "count") > v205);
            }
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v204, CFSTR("PLBatteryUIAppQualifiersKey"));

            self = v210;
            v6 = 0x1E0C99000;
            v7 = v211;
            v5 = v212;
          }
        }

        ++v9;
      }
      while (v9 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v224, v236, 16);
    }
    while (v5);
  }

}

uint64_t __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualifiers__classDebugEnabled = result;
  return result;
}

uint64_t __57__PLBatteryUIResponseTypeBatteryBreakdown_addQualifiers___block_invoke_243(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  addQualifiers__classDebugEnabled_242 = result;
  return result;
}

- (void)applyStaticNameTransformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  NSObject *v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  NSObject *v45;
  double v46;
  NSObject *v47;
  void *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  void *v65;
  uint64_t v66;
  id obj;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  double v74;
  __int16 v75;
  double v76;
  __int16 v77;
  uint64_t v78;
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PLLogCommon();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:].cold.1();
    goto LABEL_50;
  }
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    PLLogCommon();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.4();
LABEL_50:

    goto LABEL_51;
  }
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v64 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  if (!v7)
    goto LABEL_45;
  v8 = v7;
  v9 = *(_QWORD *)v70;
  v66 = *MEMORY[0x1E0D22C78];
  v10 = 0x1E0CB3000uLL;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v70 != v9)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v13;
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.springboard.lockscreen.navigation")))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(void **)(v10 + 2024);
        objc_msgSend(v14, "doubleValue");
        objc_msgSend(v15, "numberWithDouble:", -v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

LABEL_10:
        goto LABEL_34;
      }
      if (objc_msgSend(v13, "isEqualToString:", CFSTR("com.apple.PassbookUIService")))
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1EA1DABE8, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
      }
      else if (_os_feature_enabled_impl())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v66, CFSTR("aod"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v13, "isEqualToString:", v18);

        if (v19)
        {
          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v74 = *(double *)&v13;
            v75 = 2112;
            v76 = *(double *)&v12;
            _os_log_debug_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_DEBUG, "processing aod entry with bundleID=%@, energyEntry=%@", buf, 0x16u);
          }

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));

          v22 = *(void **)(v10 + 2024);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "doubleValue");
          objc_msgSend(v22, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v24, CFSTR("PLBatteryUIAppAlwaysOnRuntimeOriginalKey"));

          v25 = *(void **)(v10 + 2024);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "doubleValue");
          objc_msgSend(v25, "numberWithDouble:");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v27, CFSTR("AlwaysOnEnergyBeforeClamp"));

          objc_msgSend(v12, "setObject:forKeyedSubscript:", &unk_1EA1DABE8, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
            v59 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v74 = *(double *)&v65;
            v75 = 2112;
            v76 = *(double *)&v59;
            v60 = (void *)v59;
            v77 = 2112;
            v78 = (uint64_t)v13;
            _os_log_debug_impl(&dword_1DA9D6000, v28, OS_LOG_TYPE_DEBUG, "Subtracting foregroundPluggedInTime=%@ from alwaysOnRuntime=%@ for bundleID=%@", buf, 0x20u);

          }
          v29 = *(void **)(v10 + 2024);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "doubleValue");
          v32 = v31;
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "doubleValue");
          v35 = v32 - v34;

          if (v35 >= 0.0)
            v36 = v35;
          else
            v36 = 0.0;
          objc_msgSend(v29, "numberWithDouble:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v37, CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));

          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeOriginalKey"));
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v74 = *(double *)&v61;
            v75 = 2112;
            v76 = *(double *)&v62;
            _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "After subtracting plugged in time, alwaysOnRuntime=%@, alwaysOnRuntimeOriginal=%@", buf, 0x16u);

          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "doubleValue");
          v41 = v40;

          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "doubleValue");
          v44 = v43 / 3600.0;

          PLLogCommon();
          v45 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218496;
            v74 = v41;
            v75 = 2048;
            v76 = v44;
            v77 = 2048;
            v78 = 0x4075E00000000000;
            _os_log_debug_impl(&dword_1DA9D6000, v45, OS_LOG_TYPE_DEBUG, "AODEnergy=%f, AODUnpluggedTime=%f, kAODModeledPowerUpperBound=%f", buf, 0x20u);
          }

          v13 = v68;
          if (v44 > 0.0)
          {
            v46 = v41 / v44;
            if (v41 / v44 > 350.0)
            {
              PLLogCommon();
              v47 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
                -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:].cold.4();

              objc_msgSend(*(id *)(v10 + 2024), "numberWithDouble:", v44 * 350.0);
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setObject:forKeyedSubscript:", v48, CFSTR("PLBatteryUIAppEnergyValueKey"));

              PLLogCommon();
              v49 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
                -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:].cold.3();

            }
          }
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"), v46);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("AlwaysOnEnergy"));
          goto LABEL_10;
        }
      }
LABEL_34:
      -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKeyedSubscript:", v13);
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        PLLogCommon();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v74 = *(double *)&v58;
          v75 = 2112;
          v76 = *(double *)&v51;
          _os_log_debug_impl(&dword_1DA9D6000, v52, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

        }
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v51, CFSTR("PLBatteryUIAppBundleIDKey"));
      }
      if (-[PLBatteryUIResponseTypeBatteryBreakdown hasHomeKit](self, "hasHomeKit"))
      {
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("HomeKit"));

        if (v54)
        {
          -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("com.apple.Home"));
          v56 = (void *)objc_claimAutoreleasedReturnValue();

          if (v56)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", CFSTR("com.apple.Home"), CFSTR("PLBatteryUIAppBundleIDKey"));
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v57, CFSTR("HomeKitEnergy"));

          v10 = 0x1E0CB3000;
        }
      }

    }
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
  }
  while (v8);
LABEL_45:

  v4 = v64;
  -[PLBatteryUIResponseTypeBatteryBreakdown collapseEnergyEntries:](self, "collapseEnergyEntries:", v64);
LABEL_51:

}

- (void)applyDynamicNameTransformation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:](self, "transformDeletedApps:", v4);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:](self, "transformPlugins:withBucket:", v5, v10);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown transformGizmoDaemons:](self, "transformGizmoDaemons:", v6);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown reaccountExchangeEntries:](self, "reaccountExchangeEntries:", v7);

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown reaccountBackupRestore:](self, "reaccountBackupRestore:", v8);

  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:](self, "ongoingUpdateRestoreTransformations:", v9);

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown collapseEnergyEntries:](self, "collapseEnergyEntries:", v10);

}

- (void)applyDisplayNameTransformation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
    obj = objc_claimAutoreleasedReturnValue();
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v16 = v4;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"), v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToDisplayNames](self, "bundleIDsToDisplayNames");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v11);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("PLBatteryUIAppNameKey"));

          }
          else
          {
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("PLBatteryUIAppNameKey"));
          }

        }
        v7 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
      v4 = v16;
    }
  }
  else
  {
    PLLogCommon();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown addEntryTypes:].cold.4();
  }

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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");

        if (v12 != 2 && v12 != 5)
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PLBatteryUIAppArrayKey"));
}

- (void)filterEnergyEntriesWithRuntimes:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  double v14;
  double v15;
  const __CFString *v16;
  void *v17;
  double v18;
  double v19;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  BOOL v28;
  void *v29;
  double v30;
  double v31;
  BOOL v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v40 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v44;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v8);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "intValue") == 1)
        {

LABEL_9:
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("HLS")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("Siri")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("DeletedApp")) & 1) != 0
            || (objc_msgSend(v10, "isEqualToString:", CFSTR("DeletedAppClip")) & 1) != 0
            || objc_msgSend(v10, "isEqualToString:", CFSTR("DeletedAppAndAppClip")))
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "doubleValue");
            v15 = v14;

            if (v15 < 60.0)
            {
              v16 = CFSTR("PLBatteryUIAppForegroundRuntimeKey");
              if (v15 > 0.0)
                goto LABEL_16;
            }
          }
          else
          {
            if (objc_msgSend(v10, "isEqualToString:", CFSTR("Flashlight")))
            {
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "doubleValue");
              v31 = v30;

              if (v31 >= 60.0)
                goto LABEL_17;
              v32 = v31 <= 0.0;
            }
            else
            {
              if (!objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp")))
                goto LABEL_17;
              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "doubleValue");
              v35 = v34;

              objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "doubleValue");
              v38 = v37;

              if (v35 >= 60.0)
                goto LABEL_17;
              v32 = v38 <= 2.0;
            }
            v16 = CFSTR("PLBatteryUIAppBackgroundRuntimeKey");
            if (!v32)
              goto LABEL_16;
          }
LABEL_17:
          objc_msgSend(v4, "addObject:", v9, v16);
          goto LABEL_18;
        }
        v12 = objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.NanoUniverse.AegirProxyApp"));

        if ((v12 & 1) != 0)
          goto LABEL_9;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        if (!-[PLBatteryUIResponseTypeBatteryBreakdown filterFgBg:filterArray:](self, "filterFgBg:filterArray:", v9, v4))
        {
          if (v19 > 0.0 && v19 < 60.0)
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "doubleValue");
            v23 = v22;

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 60.0 / v19 * v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

            objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1C1430, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "doubleValue");
          v27 = v26;

          v28 = v27 > 0.0 && v27 < 60.0;
          v16 = CFSTR("PLBatteryUIAppAlwaysOnRuntimeKey");
          if (!v28)
            goto LABEL_17;
LABEL_16:
          objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_1EA1C1430);
          goto LABEL_17;
        }
LABEL_18:

        ++v8;
      }
      while (v6 != v8);
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v6 = v39;
    }
    while (v39);
  }

  objc_msgSend(v40, "setObject:forKeyedSubscript:", v4, CFSTR("PLBatteryUIAppArrayKey"));
}

- (void)adjustEnergyValues:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  double v38;
  void *v39;
  NSObject *obj;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLBatteryUIResponseTypeBatteryBreakdown isSlopAdjustmentEnabled](self, "isSlopAdjustmentEnabled"))
    -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:](self, "applySlopAdjustment:", v4);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v5)
  {
    v7 = 0;
LABEL_28:

    goto LABEL_29;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v41 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v6; ++i)
    {
      if (*(_QWORD *)v43 != v41)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyToRemoveForPercentageAdjustmentKey"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v13 - v15;

      v17 = 0.0;
      if (v16 >= 0.0)
        v18 = v16;
      else
        v18 = 0.0;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v21 = v20;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyToRemoveForPercentageAdjustmentKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "doubleValue");
      v24 = v23;

      if (v13 > 2.0)
      {
        v25 = v21 - v24;
        if (v21 - v24 < 0.0)
          v25 = 0.0;
        v17 = round(v18 * 100.0 / v25);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("PLBatteryUIAppEnergyUsedKey"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v17);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("PLBatteryUIAppEnergyValueKey"));

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyUsedKey"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "doubleValue");
      v30 = v29;
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyToRemoveForPercentageAdjustmentKey"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "doubleValue");
      v33 = v32;

      if (!v7)
        goto LABEL_19;
      v34 = v30 - v33;
      if (v30 - v33 < 0.0)
        v34 = 0.0;
      if (v34 < v18)
      {
LABEL_19:
        v35 = v10;

        v7 = v35;
      }
      v8 += (int)v17;
    }
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v6);

  if (v8 >= 1 && v8 != 100)
  {
    v36 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "doubleValue");
    objc_msgSend(v36, "numberWithDouble:", v38 + (double)(100 - v8));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v39, CFSTR("PLBatteryUIAppEnergyValueKey"));

    if (v8 >= 0x65)
    {
      PLLogCommon();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
        -[PLBatteryUIResponseTypeBatteryBreakdown adjustEnergyValues:].cold.1(v8, obj);
      goto LABEL_28;
    }
  }
LABEL_29:

}

- (void)applySlopAdjustment:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  NSObject *v11;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  id obj;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  double v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v40 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalAccountedEnergyKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:].cold.3();

  if (v10 > 0.0 && v7 <= v10)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7 / v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIExternalDrainRatio"));

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v42;
      v19 = 0.0;
      *(_QWORD *)&v16 = 138412802;
      v38 = v16;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"), v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToEnergyKeyForSlopAdjustment](self, "bundleIDsToEnergyKeyForSlopAdjustment");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKey:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToEnergyKeyForSlopAdjustment](self, "bundleIDsToEnergyKeyForSlopAdjustment");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", v22);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            -[PLBatteryUIResponseTypeBatteryBreakdown getEnergyToRemoveForSlopAdjustment:withEnergyKey:forBucket:](self, "getEnergyToRemoveForSlopAdjustment:withEnergyKey:forBucket:", v21, v27, v40);
            v29 = v28;
            PLLogCommon();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v38;
              v46 = v22;
              v47 = 2112;
              v48 = v27;
              v49 = 2048;
              v50 = v29;
              _os_log_debug_impl(&dword_1DA9D6000, v30, OS_LOG_TYPE_DEBUG, "bundleIDKey=%@, energyKey=%@, energyToRemove=%f", buf, 0x20u);
            }
            v19 = v19 + v29;

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v17);
    }

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:].cold.2(v13, v31, v32, v33, v34, v35, v36, v37);
  }
  else
  {
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PLBatteryUIResponseTypeBatteryBreakdown applySlopAdjustment:].cold.1();
  }

}

- (double)getEnergyToRemoveForSlopAdjustment:(id)a3 withEnergyKey:(id)a4 forBucket:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  double v29;
  void *v30;
  int v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  double v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToEnergyKeyForSlopAdjustment](self, "bundleIDsToEnergyKeyForSlopAdjustment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

    if (v17 > 0.0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIExternalDrainRatio"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "doubleValue");
      v23 = v22;

      if (v20 - v20 * v23 >= 0.0)
        v24 = v20 - v20 * v23;
      else
        v24 = 0.0;
      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        v32 = 134218752;
        v33 = v20;
        v34 = 2048;
        v35 = v23;
        v36 = 2048;
        v37 = v20 * v23;
        v38 = 2048;
        v39 = v24;
        _os_log_debug_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_DEBUG, "energyToAdjust=%f, adjustmentFactor=%f, adjustedEnergy=%f, energyToRemove=%f", (uint8_t *)&v32, 0x2Au);
      }

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, CFSTR("PLBatteryUIAppEnergyToRemoveForPercentageAdjustmentKey"));

      v27 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyToRemoveForPercentageAdjustmentKey"));
      v28 = objc_claimAutoreleasedReturnValue();
      -[NSObject doubleValue](v28, "doubleValue");
      objc_msgSend(v27, "numberWithDouble:", v24 + v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("PLBatteryUITotalEnergyToRemoveForPercentageAdjustmentKey"));

      goto LABEL_12;
    }
  }
  else
  {

  }
  PLLogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  v24 = 0.0;
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown getEnergyToRemoveForSlopAdjustment:withEnergyKey:forBucket:].cold.1(v8, (uint64_t)v9, v28);
LABEL_12:

  return v24;
}

- (void)adjustRuntimes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
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
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToForegroundTimes](self, "bundleIDsToForegroundTimes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToBackgroundTimes](self, "bundleIDsToBackgroundTimes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v8)
      {
        v9 = v8;
        v22 = v4;
        v10 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToForegroundTimes](self, "bundleIDsToForegroundTimes");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "objectForKeyedSubscript:", v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              if (v15)
              {
                -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToForegroundTimes](self, "bundleIDsToForegroundTimes");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "objectForKeyedSubscript:", v13);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

              }
              -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToBackgroundTimes](self, "bundleIDsToBackgroundTimes");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "objectForKeyedSubscript:", v13);
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19)
              {
                -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToBackgroundTimes](self, "bundleIDsToBackgroundTimes");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "objectForKeyedSubscript:", v13);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

              }
            }

          }
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v9);
        v4 = v22;
      }
    }
    else
    {
      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeBatteryBreakdown adjustRuntimes:].cold.2();
    }
  }
  else
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown adjustRuntimes:].cold.1();
  }

}

- (void)adjustExtensionBackgroundTimeWithEnergyEntries:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9
          && ((objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.store.Jolly.spotlightindex")) & 1) != 0
           || objc_msgSend(v10, "isEqualToString:", CFSTR("com.apple.mobilemail.DiagnosticExtension"))))
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
          objc_msgSend(v8, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)addTotals:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  id obj;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIForegroundTimeKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIBackgroundTimeKey"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUITotalEnergyKey"));
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v30 = *(_QWORD *)v32;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v32 != v30)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v11 = v10;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "doubleValue");
        objc_msgSend(v8, "numberWithDouble:", v11 + v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIForegroundTimeKey"));

        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBackgroundTimeKey"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "doubleValue");
        v18 = v17;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "doubleValue");
        objc_msgSend(v15, "numberWithDouble:", v18 + v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIBackgroundTimeKey"));

        v22 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v25 = v24;
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "doubleValue");
        objc_msgSend(v22, "numberWithDouble:", v25 + v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("PLBatteryUITotalEnergyKey"));

        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }

}

- (void)addErrorCode:(id)a3
{
  BOOL v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = -[PLBatteryUIResponseTypeBatteryBreakdown shouldShowBreakdown:](self, "shouldShowBreakdown:", v14);
  v5 = v14;
  if (v4)
    goto LABEL_6;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBatteryUIForegroundTimeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  if (v7 >= 60.0)
  {

    v5 = v14;
    goto LABEL_6;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBackgroundTimeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  v5 = v14;
  if (v10 >= 60.0)
  {
LABEL_6:
    v11 = &unk_1EA1C1268;
    v12 = CFSTR("PLBatteryUIErrorCodeKey");
    v13 = v5;
    goto LABEL_7;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", &unk_1EA1C1298, CFSTR("PLBatteryUIErrorCodeKey"));
  v11 = (void *)MEMORY[0x1E0C9AA60];
  v12 = CFSTR("PLBatteryUIAppArrayKey");
  v13 = v14;
LABEL_7:
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v12);

}

- (BOOL)shouldShowBreakdown:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown lastBatteryEntry](self, "lastBatteryEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DesignCapacity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  -[PLBatteryUIResponseTypeBatteryBreakdown lastBatteryEntry](self, "lastBatteryEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Voltage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "doubleValue");
  v12 = v11 / 1000.0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUITotalEnergyKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  LOBYTE(v4) = v14 > v8 * v12 * 0.001;

  return (char)v4;
}

- (void)cleanEntries:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__PLBatteryUIResponseTypeBatteryBreakdown_cleanEntries___block_invoke;
  v5[3] = &unk_1EA16D750;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __56__PLBatteryUIResponseTypeBatteryBreakdown_cleanEntries___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "removeObjectForKey:", CFSTR("NotificationInfo"));
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("WidgetUpdateTypeToCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "stringifyKeysForDict:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("WidgetUpdateTypeToCount"));

  }
}

- (void)collapseEnergyEntries:(id)a3
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v15 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(v4, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            v16[0] = MEMORY[0x1E0C809B0];
            v16[1] = 3221225472;
            v16[2] = __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke;
            v16[3] = &unk_1EA16D560;
            v17 = v4;
            v18 = v11;
            objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);

          }
          else
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIAppArrayKey"));

}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("NotificationInfo")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("NotificationInfo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v6;
    if (!v9 || v8)
    {
      objc_msgSend(v8, "combineWith:", v9);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("NotificationInfo"));

    }
LABEL_19:

    goto LABEL_20;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("WidgetUpdateTypeToCount")))
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("WidgetUpdateTypeToCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v6;
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_2();

    if (objc_msgSend(v8, "count") || !objc_msgSend(v9, "count"))
    {
      v13 = (void *)objc_msgSend(v8, "mutableCopy");
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_373;
      v25[3] = &unk_1EA170768;
      v14 = v13;
      v26 = v14;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v25);
      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_1();

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, CFSTR("WidgetUpdateTypeToCount"));

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, CFSTR("WidgetUpdateTypeToCount"));
    }

    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v5, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v6, "doubleValue");
    v19 = v18;
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    objc_msgSend(v17, "numberWithDouble:", v19 + v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v5);

  }
LABEL_20:

}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_373(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB37E8];
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "numberWithInt:", objc_msgSend(v11, "intValue") + objc_msgSend(v9, "intValue"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v6);

    v6 = (id)v10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "intValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v6);
  }

}

- (id)combineQualifiers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C13A0))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C12E0))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1328)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C12E0))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1328);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C12F8))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C13A0)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C1370))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C13A0);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C1388))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1388)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C1370))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1388);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C13B8))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C1418))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    if (objc_msgSend(v5, "containsObject:", &unk_1EA1C1310)
      && objc_msgSend(v5, "containsObject:", &unk_1EA1C1358))
    {
      objc_msgSend(v5, "removeObject:", &unk_1EA1C1310);
    }
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v6;
}

- (void)reaccountExchangeEntries:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  PLBatteryUIResponseTypeBatteryBreakdown *v42;
  _QWORD v43[4];
  id v44;
  double v45;
  double v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown exchangeBundleIDs](self, "exchangeBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v42 = self;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v58 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v56;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v56 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v6, "setObject:forKeyedSubscript:", v12, v14);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
      }
      while (v9);
    }

    -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", CFSTR("com.apple.activesync"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      v19 = v18;

      if (v19 != 0.0)
      {
        v40 = v16;
        v53 = 0u;
        v54 = 0u;
        v52 = 0u;
        v51 = 0u;
        -[PLBatteryUIResponseTypeBatteryBreakdown exchangeBundleIDs](v42, "exchangeBundleIDs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        v41 = v4;
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v52;
          v24 = 0.0;
          do
          {
            for (j = 0; j != v22; ++j)
            {
              if (*(_QWORD *)v52 != v23)
                objc_enumerationMutation(v20);
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26)
              {
                objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "doubleValue");
                v30 = v29;

                if (v30 >= 0.0)
                  v31 = v30;
                else
                  v31 = 0.0;
                v24 = v24 + v31;
              }

            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
          }
          while (v22);
        }
        else
        {
          v24 = 0.0;
        }

        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        -[PLBatteryUIResponseTypeBatteryBreakdown exchangeBundleIDs](v42, "exchangeBundleIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v48;
          v36 = MEMORY[0x1E0C809B0];
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v48 != v35)
                objc_enumerationMutation(v32);
              -[NSObject objectForKeyedSubscript:](v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * k));
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38;
              if (v38)
              {
                v43[0] = v36;
                v43[1] = 3221225472;
                v43[2] = __68__PLBatteryUIResponseTypeBatteryBreakdown_reaccountExchangeEntries___block_invoke;
                v43[3] = &unk_1EA16D510;
                v44 = v38;
                v45 = v19;
                v46 = v24;
                objc_msgSend(v44, "enumerateKeysAndObjectsUsingBlock:", v43);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          }
          while (v34);
        }

        v16 = v40;
        objc_msgSend(v7, "removeObject:", v40);
        v4 = v41;
      }
    }

  }
  else
  {
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:].cold.1();
  }

}

void __68__PLBatteryUIResponseTypeBatteryBreakdown_reaccountExchangeEntries___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v9, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v9, "rangeOfString:", CFSTR("time")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:", v7 * (*(double *)(a1 + 40) / *(double *)(a1 + 48) + 1.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (id)ongoingUpdateRestoreEntryInitializer
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("DeviceSetup"), CFSTR("PLBatteryUIAppBundleIDKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1C1298, CFSTR("PLBatteryUIAppTypeKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppEnergyValueKey"));
  return v2;
}

- (void)ongoingUpdateRestoreTransformations:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  double v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  PLBatteryUIResponseTypeBatteryBreakdown *v43;
  id v44;
  uint8_t v45;
  _BYTE v46[15];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  double v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_36;
  }
  v6 = v5;
  v43 = self;
  v7 = 0;
  v8 = *(_QWORD *)v48;
  v9 = 0.0;
  v44 = v4;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v48 != v8)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v10);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "rangeOfString:", CFSTR("Backup")) != 0x7FFFFFFFFFFFFFFFLL
        || objc_msgSend(v12, "rangeOfString:", CFSTR("Restore")) != 0x7FFFFFFFFFFFFFFFLL)
      {
        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:].cold.4(&v45, v46, v22);

        objc_msgSend(v11, "setObject:forKeyedSubscript:", CFSTR("DeviceSetup"), CFSTR("PLBatteryUIAppBundleIDKey"));
        v23 = v11;

        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v21 = objc_claimAutoreleasedReturnValue();
        -[NSObject doubleValue](v21, "doubleValue");
        v9 = v24;
        v7 = v23;
        goto LABEL_18;
      }
      objc_msgSend(&unk_1EA1DCC70, "objectAtIndexedSubscript:", 16);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;

      if (v16 > 0.0)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v19 = v18;

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v52 = v16;
          v53 = 2048;
          v54 = v19;
          v55 = 2112;
          v56 = *(double *)&v27;
          _os_log_debug_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_DEBUG, "Ongoing Restore: energyEntryOngoingRestoreEnergy is %f and energy is %f for Bundle ID is %@", buf, 0x20u);

        }
        if (v16 <= v19)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 - v16);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("PLBatteryUIAppEnergyValueKey"));

          PLLogCommon();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
            -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:].cold.3();

          v9 = v9 + v16;
          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          v4 = v44;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134217984;
            v52 = v9;
            _os_log_debug_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_DEBUG, "Ongoing Restore: Total ongoing restore energy is %f", buf, 0xCu);
          }
        }
        else
        {
          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v52 = *(double *)&v28;
            v53 = 2048;
            v54 = v16;
            v55 = 2048;
            v56 = v19;
            _os_log_error_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_ERROR, "Ongoing Restore: qualified ongoing restore energy for Bundle ID %@ is %f but total energy is %f", buf, 0x20u);

          }
          v4 = v44;
        }
LABEL_18:

        goto LABEL_19;
      }
      v4 = v44;
LABEL_19:

      ++v10;
    }
    while (v6 != v10);
    v29 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    v6 = v29;
  }
  while (v29);
  if (v9 != 0.0)
  {
    if (!v7)
    {
      -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreEntryInitializer](v43, "ongoingUpdateRestoreEntryInitializer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);
      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:].cold.2();

    }
    v31 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "doubleValue");
    objc_msgSend(v31, "numberWithDouble:", v9 + v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("PLBatteryUIAppEnergyValueKey"));

    PLLogCommon();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown ongoingUpdateRestoreTransformations:].cold.1(v35, v36, v37, v38, v39, v40, v41, v42);

    v4 = v44;
  }
LABEL_36:

}

- (void)reaccountBackupRestore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  _QWORD v33[5];
  _QWORD v34[4];
  id v35;
  id v36;
  _QWORD block[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v39;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v39 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
          {
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Backup"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Restore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v16 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v16;
      if (reaccountBackupRestore__defaultOnce != -1)
        dispatch_once(&reaccountBackupRestore__defaultOnce, block);
      if (reaccountBackupRestore__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("backupEnergyEntry=%@, restoreEnergyEntry=%@"), v14, v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown reaccountBackupRestore:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 1210);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }
    if (v14 && v15)
    {
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Backup & Restore"), CFSTR("PLBatteryUIAppBundleIDKey"));
      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("Backup & Restore"), CFSTR("PLBatteryUIAppNameKey"));
      v23 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_396;
      v34[3] = &unk_1EA16D538;
      v24 = v14;
      v35 = v24;
      v25 = v15;
      v36 = v25;
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v34);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v33[0] = v23;
        v33[1] = 3221225472;
        v33[2] = __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_2;
        v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v33[4] = objc_opt_class();
        if (reaccountBackupRestore__defaultOnce_397 != -1)
          dispatch_once(&reaccountBackupRestore__defaultOnce_397, v33);
        if (reaccountBackupRestore__classDebugEnabled_398)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("combined backupEnergyEntry=%@"), v24);
          v26 = objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown reaccountBackupRestore:]");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v28, v29, 1224);

          v30 = (void *)v26;
          PLLogCommon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend(v6, "removeObject:", v25);

    }
  }

}

uint64_t __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reaccountBackupRestore__classDebugEnabled = result;
  return result;
}

void __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_396(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v12, "rangeOfString:", CFSTR("AppTypeKey")) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v12, "rangeOfString:", CFSTR("time")) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v6, "numberWithDouble:", v8 + v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, v12);

  }
}

uint64_t __66__PLBatteryUIResponseTypeBatteryBreakdown_reaccountBackupRestore___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reaccountBackupRestore__classDebugEnabled_398 = result;
  return result;
}

- (void)transformDeletedApps:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  int v35;
  NSObject *v36;
  id v37;
  NSObject *obj;
  const __CFString *v39;
  uint64_t v40;
  uint8_t v41;
  _BYTE v42[7];
  _QWORD block[5];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppBundleIDs](self, "deletedAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {

  }
  else
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppClipBundleIDs](self, "deletedAppClipBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (!v7)
    {
      PLLogCommon();
      obj = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:].cold.1();
      goto LABEL_39;
    }
  }
  -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppClipBundleIDs](self, "deletedAppClipBundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppBundleIDs](self, "deletedAppBundleIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = CFSTR("DeletedAppAndAppClip");
      goto LABEL_12;
    }
  }
  else
  {

  }
  -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppBundleIDs](self, "deletedAppBundleIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
  {
    v11 = CFSTR("DeletedApp");
  }
  else
  {
    -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppClipBundleIDs](self, "deletedAppClipBundleIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v11 = CFSTR("DeletedAppClip");
    if (!v15)
      v11 = 0;
  }
LABEL_12:
  v39 = v11;
  PLLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:].cold.3();

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v17)
  {
    v18 = v17;
    v37 = v4;
    v40 = *(_QWORD *)v45;
    while (1)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v45 != v40)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v19);
        if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v21 = objc_opt_class();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __64__PLBatteryUIResponseTypeBatteryBreakdown_transformDeletedApps___block_invoke;
          block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          block[4] = v21;
          if (transformDeletedApps__defaultOnce != -1)
            dispatch_once(&transformDeletedApps__defaultOnce, block);
          if (transformDeletedApps__classDebugEnabled)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "lastPathComponent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:]");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "logMessage:fromFile:fromFunction:fromLineNumber:", v22, v25, v26, 1250);

            PLLogCommon();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v22;
              _os_log_debug_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
        -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppBundleIDs](self, "deletedAppBundleIDs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "containsObject:", v29))
        {

        }
        else
        {
          -[PLBatteryUIResponseTypeBatteryBreakdown deletedAppClipBundleIDs](self, "deletedAppClipBundleIDs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v30, "containsObject:", v31);

          if (!v32)
            goto LABEL_32;
        }
        PLLogCommon();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypeBatteryBreakdown transformDeletedApps:].cold.2(&v41, v42, v33);

        objc_msgSend(v20, "setObject:forKeyedSubscript:", v39, CFSTR("PLBatteryUIAppBundleIDKey"));
LABEL_32:
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "containsString:", CFSTR("Unspecified"));

        if (v35)
        {
          PLLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEFAULT, "AppDeletion : Found an unspecified entry so refactoring", buf, 2u);
          }

          objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("DeletedApp"), CFSTR("PLBatteryUIAppBundleIDKey"));
        }
        ++v19;
      }
      while (v18 != v19);
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
      if (!v18)
      {
        v4 = v37;
        break;
      }
    }
  }
LABEL_39:

}

uint64_t __64__PLBatteryUIResponseTypeBatteryBreakdown_transformDeletedApps___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  transformDeletedApps__classDebugEnabled = result;
  return result;
}

- (void)transformPlugins:(id)a3 withBucket:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  char v31;
  __CFString *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  int v40;
  void *v41;
  NSObject *v42;
  void *v43;
  double v44;
  double v45;
  __CFString *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  double v59;
  double v60;
  NSObject *v61;
  void *v62;
  int v63;
  void *v64;
  NSObject *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  int v69;
  NSObject *v70;
  NSObject *v71;
  __CFString *v72;
  __CFString *v73;
  __CFString *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  __CFString *v80;
  __CFString *v81;
  __CFString *v82;
  const __CFString *v83;
  __CFString *v84;
  __CFString *v85;
  __CFString *v86;
  void *v87;
  __CFString *v88;
  uint64_t v89;
  id v90;
  void *v91;
  void *v92;
  uint64_t v93;
  id v94;
  NSObject *v95;
  uint64_t v96;
  __CFString *v97;
  uint64_t v98;
  _QWORD v99[5];
  _QWORD block[5];
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t buf[4];
  __CFString *v106;
  __int16 v107;
  const __CFString *v108;
  __int16 v109;
  __CFString *v110;
  __int16 v111;
  uint64_t v112;
  __int16 v113;
  uint64_t v114;
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v94 = a4;
  -[PLBatteryUIResponseTypeBatteryBreakdown pluginBundleIDsToEntries](self, "pluginBundleIDsToEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v8 = v6;
    v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
    if (v9)
    {
      v10 = v9;
      v90 = v6;
      v98 = *(_QWORD *)v102;
      v93 = *MEMORY[0x1E0D22C78];
      v95 = v8;
      while (1)
      {
        v11 = 0;
        v96 = v10;
        do
        {
          if (*(_QWORD *)v102 != v98)
            objc_enumerationMutation(v8);
          v12 = *(__CFString **)(*((_QWORD *)&v101 + 1) + 8 * v11);
          if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          {
            v13 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v13;
            if (transformPlugins_withBucket__defaultOnce != -1)
              dispatch_once(&transformPlugins_withBucket__defaultOnce, block);
            if (transformPlugins_withBucket__classDebugEnabled)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyEntry=%@"), v12);
              v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v15 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "lastPathComponent");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:]");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1273);

              PLLogCommon();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v106 = v14;
                _os_log_debug_impl(&dword_1DA9D6000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

            }
          }
          -[PLBatteryUIResponseTypeBatteryBreakdown pluginBundleIDsToEntries](self, "pluginBundleIDsToEntries");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
            {
              v23 = objc_opt_class();
              v99[0] = MEMORY[0x1E0C809B0];
              v99[1] = 3221225472;
              v99[2] = __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke_407;
              v99[3] = &__block_descriptor_40_e5_v8__0lu32l8;
              v99[4] = v23;
              if (transformPlugins_withBucket__defaultOnce_405 != -1)
                dispatch_once(&transformPlugins_withBucket__defaultOnce_405, v99);
              if (transformPlugins_withBucket__classDebugEnabled_406)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("this is a plugin"));
                v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
                v25 = (void *)MEMORY[0x1E0D7FF98];
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/BatteryUIResponseTypes/PLBatteryUIResponseTypeBatteryBreakdown.m");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "lastPathComponent");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:]");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1278);

                PLLogCommon();
                v29 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v106 = v24;
                  _os_log_debug_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
                }

                v10 = v96;
              }
            }
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PluginId"));
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("com.apple.AppStore.ProductPageExtension"));

            if ((v31 & 1) == 0)
            {
              -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v32 = (__CFString *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PluginParentApp"));
              v33 = objc_claimAutoreleasedReturnValue();
              if (-[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("com.apple.sidecar.extension.capture")))
              {
                -[PLBatteryUIResponseTypeBatteryBreakdown getEnergyEntry:forBundleID:](self, "getEnergyEntry:forBundleID:", v8, v33);
                v34 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v34 = 0;
              }
              PLLogCommon();
              v35 = objc_claimAutoreleasedReturnValue();
              v97 = (__CFString *)v33;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
              {
                -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                v80 = (__CFString *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v106 = v80;
                v107 = 2112;
                v108 = v97;
                _os_log_debug_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                v33 = (uint64_t)v97;
              }

              -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v33, CFSTR("PLBatteryUIAppBundleIDKey"));
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PluginType"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("com.apple.watchkit"));

              if (v37)
              {
                -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v38 = objc_claimAutoreleasedReturnValue();
                -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v38, CFSTR("WatchEnergy"));
                goto LABEL_37;
              }
              objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PluginType"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("com.apple.widgetkit-extension"));

              if (v40)
              {
                -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v41, CFSTR("ChronoWidgetEnergy"));

                PLLogCommon();
                v42 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
                {
                  -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                  v82 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v92, "doubleValue");
                  *(_DWORD *)buf = 138412546;
                  v106 = v82;
                  v107 = 2048;
                  v108 = v83;
                  _os_log_debug_impl(&dword_1DA9D6000, v42, OS_LOG_TYPE_DEBUG, "Widget Energy for %@ : %f", buf, 0x16u);

                }
                -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("ChronoWidgetEnergy"));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "doubleValue");
                v45 = v44;

                v46 = (__CFString *)v34;
                if (v45 > 0.0)
                {
                  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBucketStartKey"));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v47, "doubleValue");
                  v49 = v48;
                  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBucketEndKey"));
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "doubleValue");
                  v52 = v51;
                  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("PLBatteryUIBucketStartKey"));
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v53, "doubleValue");
                  v55 = v52 - v54;

                  -[PLBatteryUIResponseTypeBatteryBreakdown getWidgetUpdateTypeToCount:inRange:](self, "getWidgetUpdateTypeToCount:inRange:", v32, v49, v55);
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (-[NSObject count](v38, "count"))
                    -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v38, CFSTR("WidgetUpdateTypeToCount"));
                  v8 = v95;
LABEL_37:
                  v46 = (__CFString *)v34;
LABEL_38:

                }
              }
              else
              {
                objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("PluginType"));
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v62, "isEqualToString:", CFSTR("com.apple.posterkit.provider"));

                v8 = v95;
                v46 = (__CFString *)v34;
                if (v63)
                {
                  -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                  v64 = (void *)objc_claimAutoreleasedReturnValue();
                  -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v64, CFSTR("PosterEnergy"));

                  PLLogCommon();
                  v65 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
                  {
                    -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PosterEnergy"));
                    v84 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412802;
                    v106 = v32;
                    v107 = 2112;
                    v108 = v84;
                    v109 = 2112;
                    v110 = v97;
                    _os_log_debug_impl(&dword_1DA9D6000, v65, OS_LOG_TYPE_DEBUG, "bundleID=%@, posterEnergy=%@, parentApp=%@", buf, 0x20u);

                  }
                  v8 = v95;
                  if (!v97)
                  {
                    PLLogCommon();
                    v66 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
                    {
                      -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                      v86 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v87, "objectForKeyedSubscript:", v93);
                      v88 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v106 = v86;
                      v107 = 2112;
                      v108 = v88;
                      _os_log_debug_impl(&dword_1DA9D6000, v66, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                    }
                    -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v67, "objectForKeyedSubscript:", v93);
                    v68 = (void *)objc_claimAutoreleasedReturnValue();
                    -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v68, CFSTR("PLBatteryUIAppBundleIDKey"));

                    v8 = v95;
                  }
                  if ((-[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosPosterProvider")) & 1) != 0)v69 = 1;
                  else
                    v69 = -[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("com.apple.PhotosUIPrivate.PhotosAmbientPosterProvider"));
                  PLLogCommon();
                  v70 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 67109120;
                    LODWORD(v106) = v69;
                    _os_log_debug_impl(&dword_1DA9D6000, v70, OS_LOG_TYPE_DEBUG, "isPhotosPoster=%d", buf, 8u);
                  }

                  if (v69)
                  {
                    PLLogCommon();
                    v71 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEBUG))
                    {
                      -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                      v85 = (__CFString *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      v106 = v85;
                      v107 = 2112;
                      v108 = CFSTR("com.apple.mobileslideshow");
                      _os_log_debug_impl(&dword_1DA9D6000, v71, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                      v8 = v95;
                    }

                    -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", CFSTR("com.apple.mobileslideshow"), CFSTR("PLBatteryUIAppBundleIDKey"));
                  }
                  PLLogCommon();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
                  {
                    -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                    v72 = (__CFString *)objc_claimAutoreleasedReturnValue();
                    -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                    v91 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v91, "doubleValue");
                    v74 = v73;
                    -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
                    v75 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v75, "doubleValue");
                    v77 = v76;
                    -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "doubleValue");
                    *(_DWORD *)buf = 138413314;
                    v106 = v32;
                    v107 = 2112;
                    v108 = v72;
                    v109 = 2048;
                    v110 = v74;
                    v111 = 2048;
                    v112 = v77;
                    v113 = 2048;
                    v114 = v79;
                    _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "Mapping Poster %@ to %@ – energy:%f, foregroundRunTime:%f, bgRunTime:%f", buf, 0x34u);

                    v8 = v95;
                  }
                  goto LABEL_38;
                }
              }
              if (-[__CFString isEqualToString:](v32, "isEqualToString:", CFSTR("com.apple.sidecar.extension.capture")))
              {
                PLLogCommon();
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
                {
                  -[__CFString objectForKeyedSubscript:](v12, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
                  v81 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v106 = v81;
                  v107 = 2112;
                  v108 = CFSTR("ContinuityCamera");
                  _os_log_debug_impl(&dword_1DA9D6000, v56, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

                  v8 = v95;
                }

                -[__CFString setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", CFSTR("ContinuityCamera"), CFSTR("PLBatteryUIAppBundleIDKey"));
                PLLogCommon();
                v57 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  v106 = v46;
                  v107 = 2112;
                  v108 = v12;
                  _os_log_debug_impl(&dword_1DA9D6000, v57, OS_LOG_TYPE_DEBUG, "continuityParentAppEnergyEntry=%@, energyEntry=%@", buf, 0x16u);
                }

                if (v46)
                {
                  -[__CFString objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "doubleValue");
                  v60 = v59;

                  v8 = v95;
                  if (v60 > 0.0)
                  {
                    -[__CFString setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", CFSTR("ContinuityCamera"), CFSTR("PLBatteryUIAppBundleIDKey"));
                    -[__CFString setObject:forKeyedSubscript:](v46, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
                  }
                }
                PLLogCommon();
                v61 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  v106 = v12;
                  _os_log_debug_impl(&dword_1DA9D6000, v61, OS_LOG_TYPE_DEBUG, "After adjusting Continuity Camera extension energyEntry=%@", buf, 0xCu);
                }

              }
              v10 = v96;
            }
          }

          ++v11;
        }
        while (v10 != v11);
        v89 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
        v10 = v89;
        if (!v89)
        {
          v6 = v90;
          break;
        }
      }
    }
  }
  else
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown transformPlugins:withBucket:].cold.1();
  }

}

uint64_t __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  transformPlugins_withBucket__classDebugEnabled = result;
  return result;
}

uint64_t __71__PLBatteryUIResponseTypeBatteryBreakdown_transformPlugins_withBucket___block_invoke_407(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  transformPlugins_withBucket__classDebugEnabled_406 = result;
  return result;
}

- (void)transformGizmoDaemons:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint8_t v72[128];
  uint8_t buf[4];
  void *v74;
  __int16 v75;
  void *v76;
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v67 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
          -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            PLLogCommon();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v17;
              v75 = 2112;
              v76 = v14;
              _os_log_debug_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

            }
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIAppBundleIDKey"));
            objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, CFSTR("WatchEnergy"));

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
      }
      while (v8);
    }

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v18 = v6;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v63;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v63 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v24, "hasSuffix:", CFSTR("/watch")))
          {
            PLLogCommon();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "substringWithRange:", 0, objc_msgSend(v24, "length") - 6);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v52;
              v75 = 2112;
              v76 = v50;
              _os_log_debug_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

            }
            objc_msgSend(v24, "substringWithRange:", 0, objc_msgSend(v24, "length") - 6);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("PLBatteryUIAppBundleIDKey"));

            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("WatchEnergy"));

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
      }
      while (v20);
    }

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v28 = v18;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v59;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v59 != v31)
            objc_enumerationMutation(v28);
          v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
          objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "hasSuffix:", CFSTR(".watchkitextension")))
          {
            PLLogCommon();
            v35 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "substringWithRange:", 0, objc_msgSend(v34, "length") - 18);
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v53;
              v75 = 2112;
              v76 = v51;
              _os_log_debug_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

            }
            objc_msgSend(v34, "substringWithRange:", 0, objc_msgSend(v34, "length") - 18);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v36, CFSTR("PLBatteryUIAppBundleIDKey"));

            objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v37, CFSTR("WatchEnergy"));

          }
        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
      }
      while (v30);
    }

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v38 = v28;
    v39 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v55;
      do
      {
        for (m = 0; m != v40; ++m)
        {
          if (*(_QWORD *)v55 != v41)
            objc_enumerationMutation(v38);
          v43 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * m);
          -[PLBatteryUIResponseTypeBatteryBreakdown bundleIDsToReplacementBundleIDs](self, "bundleIDsToReplacementBundleIDs");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "objectForKeyedSubscript:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          if (v46)
          {
            PLLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v74 = v49;
              v75 = 2112;
              v76 = v46;
              _os_log_debug_impl(&dword_1DA9D6000, v47, OS_LOG_TYPE_DEBUG, "Static mapping: Changed %@ to %@", buf, 0x16u);

            }
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v46, CFSTR("PLBatteryUIAppBundleIDKey"));
            objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v48, CFSTR("WatchEnergy"));

          }
        }
        v40 = -[NSObject countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
      }
      while (v40);
    }
  }
  else
  {
    PLLogCommon();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeBatteryBreakdown applyStaticNameTransformation:].cold.1();
  }

}

- (void)transformCloudDocs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  id v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    v7 = CFSTR("com.apple.clouddocs.");
    v8 = CFSTR(".");
    do
    {
      v9 = 0;
      v20 = v5;
      do
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v9);
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasPrefix:", v7))
        {
          objc_msgSend(v11, "substringFromIndex:", -[__CFString length](v7, "length"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "rangeOfString:", v8);
          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v15 = v6;
            v16 = v7;
            v17 = v3;
            v18 = v8;
            objc_msgSend(v12, "substringFromIndex:", v13 + v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("PLBatteryUIAppBundleIDKey"));

            v8 = v18;
            v3 = v17;
            v7 = v16;
            v6 = v15;
            v5 = v20;
          }

        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }

}

- (BOOL)canSetQualifier:(int64_t)a3 forBundleID:(id)a4
{
  id v5;
  char v6;
  char v7;
  char v8;
  char v9;
  unsigned int v10;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;

  v5 = a4;
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilephone"));
  if (a3 == 2 && (v6 & 1) != 0)
    goto LABEL_9;
  v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.facetime"));
  if (a3 == 2 && (v7 & 1) != 0)
    goto LABEL_9;
  v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("HLS"));
  if (a3 == 2 && (v8 & 1) != 0)
    goto LABEL_9;
  v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("Flashlight"));
  if (a3 == 2 && (v9 & 1) != 0)
    goto LABEL_9;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Backup & Restore")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("Backup")) & 1) == 0
    && (objc_msgSend(v5, "isEqualToString:", CFSTR("Restore")) & 1) == 0
    && !objc_msgSend(v5, "isEqualToString:", CFSTR("SoundRecognition")))
  {
    v13 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilesafari"));
    if (a3 != 2 || (v13 & 1) == 0)
    {
      v14 = objc_msgSend(v5, "isEqualToString:", CFSTR("Hotspot"));
      if (a3 != 2 || (v14 & 1) == 0)
      {
        v15 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Maps"));
        if (a3 != 2 || (v15 & 1) == 0)
        {
          v16 = objc_msgSend(v5, "isEqualToString:", CFSTR("Siri"));
          if ((a3 != 2 || (v16 & 1) == 0)
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("Flashlight")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("PowerOutAccessories")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeletedApp")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeletedAppClip")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("DeletedAppAndAppClip")) & 1) == 0
            && (objc_msgSend(v5, "isEqualToString:", CFSTR("EN")) & 1) == 0)
          {
            if (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Bridge")))
            {
              if ((unint64_t)a3 < 0xB)
              {
                v10 = (0x2FBu >> a3) & 1;
                goto LABEL_10;
              }
LABEL_42:
              LOBYTE(v10) = 1;
              goto LABEL_10;
            }
            v17 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.camera"));
            if ((a3 != 10 || (v17 & 1) == 0)
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("PoorCellCondition")) & 1) == 0
              && (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Preferences")) & 1) == 0)
            {
              goto LABEL_42;
            }
          }
        }
      }
    }
LABEL_9:
    LOBYTE(v10) = 0;
    goto LABEL_10;
  }
  LOBYTE(v10) = a3 != 7 && a3 != 2;
LABEL_10:

  return v10;
}

- (int)computeNumberOfBuckets
{
  PLBatteryUIResponseTypeBatteryBreakdown *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  v2 = self;
  -[PLBatteryUIResponseTypeBatteryBreakdown end](self, "end");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown start](v2, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;
  -[PLBatteryUIResponseTypeBatteryBreakdown bucketSize](v2, "bucketSize");
  LODWORD(v2) = llround(v6 / v7);

  return (int)v2;
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
  v4 = -[PLBatteryUIResponseTypeBatteryBreakdown computeNumberOfBuckets](self, "computeNumberOfBuckets");
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0.0;
    do
    {
      -[PLBatteryUIResponseTypeBatteryBreakdown end](self, "end");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryUIResponseTypeBatteryBreakdown bucketSize](self, "bucketSize");
      objc_msgSend(v8, "dateByAddingTimeInterval:", -(v9 * v7));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[PLBatteryUIResponseTypeBatteryBreakdown bucketSize](self, "bucketSize");
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

- (void)buildUtilityCache
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Responder Service: Battery Breakdown is storing data in temp...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)buildBucketsForRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  int v6;
  NSObject *v7;
  void *v8;

  length = a3.length;
  location = a3.location;
  v6 = -[PLBatteryUIResponseTypeBatteryBreakdown computeNumberOfBuckets](self, "computeNumberOfBuckets");
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown buildBucketsForRange:].cold.1(v6, v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown setBuckets:](self, "setBuckets:", v8);

  -[PLBatteryUIResponseTypeBatteryBreakdown initializeBucketsWithRange:](self, "initializeBucketsWithRange:", location, length);
  -[PLBatteryUIResponseTypeBatteryBreakdown prepareBucketsWithRange:](self, "prepareBucketsWithRange:", location, length);
}

- (void)identifyBucket:(id)a3 withRange:(_PLTimeIntervalRange)a4
{
  double length;
  double location;
  double v7;
  void *v9;
  void *v10;
  id v11;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  -[PLBatteryUIResponseTypeBatteryBreakdown lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
  if (location <= v7 && location + length >= v7)
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryUIResponseTypeBatteryBreakdown lastUpgradeTimestamp](self, "lastUpgradeTimestamp");
    objc_msgSend(v9, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, CFSTR("PLBatteryUIHasUpgradeKey"));

  }
}

- (void)initializeBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBatteryBreakdown getRootNodeEntriesInRange:withTimeInterval:](self, "getRootNodeEntriesInRange:withTimeInterval:", a3.location, a3.length, 3600.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown getQualificationNodeEntriesInRange:withTimeInterval:](self, "getQualificationNodeEntriesInRange:withTimeInterval:", location, length, 3600.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown initializeBucketsWithRange:].cold.2(v6, v8);

  PLLogCommon();
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown initializeBucketsWithRange:].cold.1(v7, v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke;
  v12[3] = &unk_1EA16F688;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PLBatteryUIResponseTypeBatteryBreakdown enumerateBucketsUsingBlock:](self, "enumerateBucketsUsingBlock:", v12);

}

void __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke(uint64_t a1, int a2, double a3, double a4)
{
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v7 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "buildEnergyEntriesWithRootNodes:andQualificationNodes:andRange:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v7, "buildBucketWithEnergyEntries:andRange:", v8, a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v7, "buckets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:atIndexedSubscript:", v9, a2);

  v11 = *v7;
  objc_msgSend(*v7, "buckets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collapseEnergyEntries:", v13);

  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke_cold_1(v7);

}

- (void)prepareBucketsWithRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  length = a3.length;
  location = a3.location;
  -[PLBatteryUIResponseTypeBatteryBreakdown getAppRuntimesInRange:](self, "getAppRuntimesInRange:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown getNotificationEntriesInRange:](self, "getNotificationEntriesInRange:", location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown prepareBucketsWithRange:].cold.2(v6, v8);

  PLLogCommon();
  v9 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown prepareBucketsWithRange:].cold.1(v7, v9);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke;
  v12[3] = &unk_1EA16F688;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[PLBatteryUIResponseTypeBatteryBreakdown enumerateBucketsUsingBlock:](self, "enumerateBucketsUsingBlock:", v12);

}

void __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke(uint64_t a1, int a2, void *a3, void *a4, double a5, double a6)
{
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v11 = a1 + 32;
  v12 = *(void **)(a1 + 32);
  v13 = a4;
  v14 = a3;
  objc_msgSend(v12, "buckets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = a2;
  objc_msgSend(v15, "objectAtIndexedSubscript:", a2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)v11, "processAppTimeEntries:inRange:withAppArray:", *(_QWORD *)(v11 + 8), v18, a5, a6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_2((id *)v11);

  objc_msgSend(*(id *)(a1 + 32), "processNotificationEntries:inRange:withAppArray:", *(_QWORD *)(a1 + 48), v19, a5, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_1((id *)v11);

  v23 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v14, "timeIntervalSince1970");
  v25 = v24;

  objc_msgSend(v23, "numberWithDouble:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v11, "buckets");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectAtIndexedSubscript:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("PLBatteryUIBucketStartKey"));

  v29 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v13, "timeIntervalSince1970");
  v31 = v30;

  objc_msgSend(v29, "numberWithDouble:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)v11, "buckets");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectAtIndexedSubscript:", v16);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, CFSTR("PLBatteryUIBucketEndKey"));

  objc_msgSend(*(id *)v11, "buckets");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectAtIndexedSubscript:", v16);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIAppArrayKey"));

}

- (id)buildBucketWithEnergyEntries:(id)a3 andRange:(_PLTimeIntervalRange)a4
{
  double length;
  double location;
  void *v7;

  length = a4.length;
  location = a4.location;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObject:forKey:", a3, CFSTR("PLBatteryUIAppArrayKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown identifyBucket:withRange:](self, "identifyBucket:withRange:", v7, location, length);
  return v7;
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
  -[PLBatteryUIResponseTypeBatteryBreakdown processRootNodes:inRange:](self, "processRootNodes:inRange:", a3, location, length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown processQualificationNodes:inRange:](self, "processQualificationNodes:inRange:", v9, location, length);
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
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
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
  void *v31;
  NSObject *v32;
  void *v33;
  double v34;
  void *v35;
  NSObject *v36;
  int v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  double v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  NSObject *v57;
  double v58;
  int v59;
  uint64_t v60;
  int v61;
  uint64_t v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  PLBatteryUIResponseTypeBatteryBreakdown *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  NSObject *log;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  _BYTE v85[18];
  _BYTE v86[128];
  uint64_t v87;

  length = a4.length;
  location = a4.location;
  v87 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v81;
    v13 = location + length;
    v78 = *MEMORY[0x1E0D801A0];
    v75 = *MEMORY[0x1E0D801A8];
    v70 = *MEMORY[0x1E0D80198];
    v69 = *MEMORY[0x1E0D22C78];
    v71 = v8;
    v76 = *(_QWORD *)v81;
    v77 = v9;
    v68 = self;
    do
    {
      v14 = 0;
      v72 = v11;
      do
      {
        if (*(_QWORD *)v81 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v14);
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

            if (v13 < v20)
              goto LABEL_36;
            objc_msgSend(v15, "objectForKeyedSubscript:", v78);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v8, "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
                goto LABEL_13;
              -[PLBatteryUIResponseTypeBatteryBreakdown nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v24 = (void *)MEMORY[0x1E0C99E08];
                -[PLBatteryUIResponseTypeBatteryBreakdown nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v18);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "dictionaryWithObject:forKey:", v26, CFSTR("PLBatteryUIAppBundleIDKey"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v27, v18);

LABEL_13:
                objc_msgSend(v8, "objectForKeyedSubscript:", v18);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", v75);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v29, "intValue");
                if (objc_msgSend(&unk_1EA1DCC88, "count") <= (unint64_t)v30)
                {
                  PLLogCommon();
                  log = objc_claimAutoreleasedReturnValue();
                  v9 = v77;
                  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                  {
                    v37 = objc_msgSend(v29, "intValue");
                    v38 = objc_msgSend(&unk_1EA1DCCA0, "count");
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v85 = v37;
                    *(_WORD *)&v85[4] = 2048;
                    *(_QWORD *)&v85[6] = v38;
                    _os_log_error_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                  }
                }
                else
                {
                  objc_msgSend(&unk_1EA1DCCB8, "objectAtIndexedSubscript:", (int)objc_msgSend(v29, "intValue"));
                  log = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v70);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v29, "intValue") == 58)
                  {
                    PLLogCommon();
                    v32 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                    {
                      v59 = objc_msgSend(v29, "intValue");
                      objc_msgSend(v31, "doubleValue");
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v85 = v59;
                      *(_WORD *)&v85[4] = 2048;
                      *(_QWORD *)&v85[6] = v60;
                      _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                    }

                    v33 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v31, "doubleValue");
                    objc_msgSend(v33, "numberWithDouble:", fmin(v34, 9000.0));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    PLLogCommon();
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                      goto LABEL_42;
                    goto LABEL_25;
                  }
                  if (objc_msgSend(v29, "intValue") == 59)
                  {
                    PLLogCommon();
                    v39 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                    {
                      v61 = objc_msgSend(v29, "intValue");
                      objc_msgSend(v31, "doubleValue");
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v85 = v61;
                      *(_WORD *)&v85[4] = 2048;
                      *(_QWORD *)&v85[6] = v62;
                      _os_log_debug_impl(&dword_1DA9D6000, v39, OS_LOG_TYPE_DEBUG, "before clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                    }

                    v40 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v31, "doubleValue");
                    objc_msgSend(v40, "numberWithDouble:", fmin(v41, 5500.0));
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    PLLogCommon();
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
                    {
LABEL_42:
                      v63 = objc_msgSend(v29, "intValue");
                      objc_msgSend(v35, "doubleValue");
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v85 = v63;
                      *(_WORD *)&v85[4] = 2048;
                      *(_QWORD *)&v85[6] = v64;
                      _os_log_debug_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEBUG, "after clamping for rootNodeID=%d, rootNodeEnergy=%f", buf, 0x12u);
                    }
LABEL_25:

                    v31 = v35;
                  }
                  -[PLBatteryUIResponseTypeBatteryBreakdown nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "objectForKeyedSubscript:", v18);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v69, CFSTR("aod"));
                  v73 = (void *)objc_claimAutoreleasedReturnValue();
                  v74 = v43;
                  if (!objc_msgSend(v43, "isEqualToString:"))
                    goto LABEL_31;
                  PLLogCommon();
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(_QWORD *)v85 = log;
                    _os_log_impl(&dword_1DA9D6000, v44, OS_LOG_TYPE_DEFAULT, "found AOD in root node %@", buf, 0xCu);
                  }

                  if (objc_msgSend(v29, "intValue") == 56
                    || objc_msgSend(v29, "intValue") == 57)
                  {
LABEL_31:
                    v45 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v28, "objectForKeyedSubscript:", log);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v46, "doubleValue");
                    v48 = v47;
                    objc_msgSend(v31, "doubleValue");
                    objc_msgSend(v45, "numberWithDouble:", v48 + v49 / 1000.0);
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v28, "setObject:forKeyedSubscript:", v50, log);

                    v51 = (void *)MEMORY[0x1E0CB37E8];
                    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "doubleValue");
                    v54 = v53;
                    objc_msgSend(v31, "doubleValue");
                    objc_msgSend(v51, "numberWithDouble:", v54 + v55 / 1000.0);
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    v11 = v72;
                    objc_msgSend(v28, "setObject:forKeyedSubscript:", v56, CFSTR("PLBatteryUIAppEnergyValueKey"));

                    self = v68;
                    -[PLBatteryUIResponseTypeBatteryBreakdown addRNEForMetrics:rootNodeEnergy:energyEntry:](v68, "addRNEForMetrics:rootNodeEnergy:energyEntry:", v29, v31, v28);
                  }
                  else
                  {
                    PLLogCommon();
                    v57 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
                    {
                      objc_msgSend(v31, "doubleValue");
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)v85 = log;
                      *(_WORD *)&v85[8] = 2048;
                      *(double *)&v85[10] = v58 / 1000.0;
                      _os_log_impl(&dword_1DA9D6000, v57, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node energy of %f mWh", buf, 0x16u);
                    }

                  }
                  v8 = v71;
                  v9 = v77;

                }
              }
              else
              {
                v9 = v77;
              }
              v12 = v76;
            }
          }
        }

LABEL_36:
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v11 != v14);
      v65 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v80, v86, 16);
      v11 = v65;
    }
    while (v65);
  }

  objc_msgSend(v8, "allValues");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

- (id)processQualificationNodes:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length;
  double location;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
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
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  double v53;
  int v54;
  uint64_t v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  PLBatteryUIResponseTypeBatteryBreakdown *v69;
  uint64_t v70;
  id v71;
  void *v72;
  void *v73;
  uint64_t v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint8_t buf[4];
  _BYTE v81[18];
  _BYTE v82[128];
  uint64_t v83;

  length = a4.length;
  location = a4.location;
  v83 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v77;
    v13 = location + length;
    v74 = *MEMORY[0x1E0D801A0];
    v70 = *MEMORY[0x1E0D80188];
    v66 = *MEMORY[0x1E0D80180];
    v61 = *MEMORY[0x1E0D22C78];
    v62 = *MEMORY[0x1E0D80170];
    v73 = v8;
    v69 = self;
    v71 = v9;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v77 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v14);
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

            if (v13 < v20)
              goto LABEL_32;
            objc_msgSend(v15, "objectForKeyedSubscript:", v74);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            if (v18)
            {
              objc_msgSend(v8, "objectForKeyedSubscript:", v18);
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
                goto LABEL_13;
              -[PLBatteryUIResponseTypeBatteryBreakdown nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "objectForKeyedSubscript:", v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              if (v23)
              {
                v24 = (void *)MEMORY[0x1E0C99E08];
                -[PLBatteryUIResponseTypeBatteryBreakdown nodeIDsToNodeNames](self, "nodeIDsToNodeNames");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "objectForKeyedSubscript:", v18);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "dictionaryWithObject:forKey:", v26, CFSTR("PLBatteryUIAppBundleIDKey"));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "setObject:forKeyedSubscript:", v27, v18);

                v8 = v73;
LABEL_13:
                objc_msgSend(v8, "objectForKeyedSubscript:", v18);
                v75 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "objectForKeyedSubscript:", v70);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "intValue");
                if (objc_msgSend(&unk_1EA1DCCD0, "count") <= (unint64_t)v29)
                {
                  PLLogCommon();
                  v30 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                  {
                    v54 = objc_msgSend(v28, "intValue");
                    v55 = objc_msgSend(&unk_1EA1DCCE8, "count");
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)v81 = v54;
                    *(_WORD *)&v81[4] = 2048;
                    *(_QWORD *)&v81[6] = v55;
                    _os_log_error_impl(&dword_1DA9D6000, v30, OS_LOG_TYPE_ERROR, "rootNodeID=%d out of bounds=%lu", buf, 0x12u);
                  }
                  v51 = v75;
                }
                else
                {
                  objc_msgSend(&unk_1EA1DCD00, "objectAtIndexedSubscript:", (int)objc_msgSend(v28, "intValue"));
                  v30 = objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "objectForKeyedSubscript:", v66);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "intValue");
                  v72 = v31;
                  if (objc_msgSend(&unk_1EA1DCD18, "count") <= (unint64_t)v32)
                  {
                    PLLogCommon();
                    v33 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                    {
                      v56 = objc_msgSend(v31, "intValue");
                      v57 = objc_msgSend(&unk_1EA1DCD30, "count");
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v81 = v56;
                      *(_WORD *)&v81[4] = 2048;
                      *(_QWORD *)&v81[6] = v57;
                      _os_log_error_impl(&dword_1DA9D6000, v33, OS_LOG_TYPE_ERROR, "qualificationID=%d out of bounds=%lu", buf, 0x12u);
                    }
                    v51 = v75;
                  }
                  else
                  {
                    objc_msgSend(&unk_1EA1DCD48, "objectAtIndexedSubscript:", (int)objc_msgSend(v31, "intValue"));
                    v33 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v33, v30);
                    v65 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v15, "objectForKeyedSubscript:", v62);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PLBatteryUIResponseTypeBatteryBreakdown nodeIDsToNodeNames](v69, "nodeIDsToNodeNames");
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v34, "objectForKeyedSubscript:", v18);
                    v35 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), v61, CFSTR("aod"));
                    v63 = (void *)objc_claimAutoreleasedReturnValue();
                    v64 = v35;
                    v68 = v28;
                    if (!objc_msgSend(v35, "isEqualToString:"))
                      goto LABEL_20;
                    PLLogCommon();
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(_QWORD *)v81 = v30;
                      _os_log_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEFAULT, "found AOD in qual for root node %@", buf, 0xCu);
                    }

                    if (objc_msgSend(v28, "intValue") == 56
                      || objc_msgSend(v28, "intValue") == 57)
                    {
LABEL_20:
                      v37 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v75, "objectForKeyedSubscript:", v65);
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v38, "doubleValue");
                      v40 = v39;
                      v41 = v67;
                      objc_msgSend(v67, "doubleValue");
                      objc_msgSend(v37, "numberWithDouble:", v40 + v42 / 1000.0);
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "setObject:forKeyedSubscript:", v43, v65);

                      v44 = (void *)MEMORY[0x1E0CB37E8];
                      objc_msgSend(v75, "objectForKeyedSubscript:", v33);
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "doubleValue");
                      v47 = v46;
                      objc_msgSend(v67, "doubleValue");
                      objc_msgSend(v44, "numberWithDouble:", v47 + v48 / 1000.0);
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v75, "setObject:forKeyedSubscript:", v49, v33);

                      v50 = (void *)v65;
                      v51 = v75;
                      -[PLBatteryUIResponseTypeBatteryBreakdown addFgEnergyForMetrics:qualificationID:rootNodeQualificationEnergy:energyEntry:](v69, "addFgEnergyForMetrics:qualificationID:rootNodeQualificationEnergy:energyEntry:", v68, v72, v67, v75);
                    }
                    else
                    {
                      PLLogCommon();
                      v52 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v67, "doubleValue");
                        *(_DWORD *)buf = 138412546;
                        *(_QWORD *)v81 = v30;
                        *(_WORD *)&v81[8] = 2048;
                        *(double *)&v81[10] = v53 / 1000.0;
                        _os_log_impl(&dword_1DA9D6000, v52, OS_LOG_TYPE_DEFAULT, "Adjusting %@ root node qual energy of %f mWh", buf, 0x16u);
                      }

                      v51 = v75;
                      v50 = (void *)v65;
                      v41 = v67;
                    }

                    v28 = v68;
                  }

                  self = v69;
                }

                v8 = v73;
              }
              v9 = v71;
            }
          }
        }

LABEL_32:
        objc_autoreleasePoolPop(v16);
        ++v14;
      }
      while (v11 != v14);
      v58 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
      v11 = v58;
    }
    while (v58);
  }

  objc_msgSend(v8, "allValues");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  return v59;
}

- (id)processAppTimeEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
{
  double length;
  double location;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
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
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t m;
  void *v48;
  void *v49;
  int v50;
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
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t n;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v77;
  void *v78;
  void *v79;
  id obj;
  uint64_t v81;
  void *v82;
  PLBatteryUIResponseTypeBatteryBreakdown *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  void *v88;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  uint64_t v115;

  length = a4.length;
  location = a4.location;
  v115 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v77 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v83 = self;
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown initBackgroundLocationAudioTime](self, "initBackgroundLocationAudioTime");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v106 = 0u;
  v107 = 0u;
  v108 = 0u;
  v109 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v107;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v107 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * i);
        objc_msgSend(v16, "entryDate");
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          v18 = v17;
          objc_msgSend(v17, "timeIntervalSince1970");
          v20 = v19;

          if (location <= v20 && v20 < location + length)
            objc_msgSend(v10, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v106, v114, 16);
    }
    while (v13);
  }
  v79 = v11;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v86 = (id)objc_claimAutoreleasedReturnValue();
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v78 = v10;
  objc_msgSend(MEMORY[0x1E0D7FFB0], "summarizeAggregateEntries:", v10);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
  if (v22)
  {
    v23 = v22;
    v81 = *(_QWORD *)v103;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v103 != v81)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "addObject:", v26);
        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setObject:forKeyedSubscript:", v27, v26);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v28, v26);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("ScreenOnPluggedInTime"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "setObject:forKeyedSubscript:", v29, v26);

        objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("BackgroundPluggedInTime"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "setObject:forKeyedSubscript:", v30, v26);

        -[PLBatteryUIResponseTypeBatteryBreakdown populateBackgroundLocationAudioTime:bundleID:](v83, "populateBackgroundLocationAudioTime:bundleID:", v25, v26);
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v102, v113, 16);
    }
    while (v23);
  }

  v100 = 0u;
  v101 = 0u;
  v98 = 0u;
  v99 = 0u;
  -[PLBatteryUIResponseTypeBatteryBreakdown monotonicNow](v83, "monotonicNow");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown getNonAppRuntimesInRange:withNow:](v83, "getNonAppRuntimesInRange:withNow:", v31, location, length);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v99;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v99 != v35)
          objc_enumerationMutation(v32);
        v37 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "addObject:", v38);

        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("ScreenOnTime"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "setObject:forKeyedSubscript:", v39, v40);

        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("BackgroundTime"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("BundleID"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "setObject:forKeyedSubscript:", v41, v42);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v98, v112, 16);
    }
    while (v34);
  }

  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v43 = v77;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v95;
    do
    {
      for (m = 0; m != v45; ++m)
      {
        if (*(_QWORD *)v95 != v46)
          objc_enumerationMutation(v43);
        v48 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * m);
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v86, "containsObject:", v49);

        if (v50)
        {
          objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "removeObject:", v51);

        }
        objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v89, "objectForKeyedSubscript:", v52);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "doubleValue");
        objc_msgSend(v53, "numberWithDouble:");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v55, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

        v56 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v88, "objectForKeyedSubscript:", v52);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "doubleValue");
        objc_msgSend(v56, "numberWithDouble:");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v58, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        v59 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v85, "objectForKeyedSubscript:", v52);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "doubleValue");
        objc_msgSend(v59, "numberWithDouble:");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v61, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

        v62 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v84, "objectForKeyedSubscript:", v52);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "doubleValue");
        objc_msgSend(v62, "numberWithDouble:");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "setObject:forKeyedSubscript:", v64, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));

      }
      v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v94, v111, 16);
    }
    while (v45);
  }

  v82 = v43;
  v65 = (void *)objc_msgSend(v43, "mutableCopy");
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  v87 = v86;
  v66 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
  if (v66)
  {
    v67 = v66;
    v68 = *(_QWORD *)v91;
    do
    {
      for (n = 0; n != v67; ++n)
      {
        if (*(_QWORD *)v91 != v68)
          objc_enumerationMutation(v87);
        v70 = *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * n);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v70, CFSTR("PLBatteryUIAppBundleIDKey"));
        objc_msgSend(v71, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppTypeKey"));
        objc_msgSend(v89, "objectForKeyedSubscript:", v70);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v72, CFSTR("PLBatteryUIAppForegroundRuntimeKey"));

        objc_msgSend(v88, "objectForKeyedSubscript:", v70);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v73, CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));

        objc_msgSend(v85, "objectForKeyedSubscript:", v70);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v74, CFSTR("PLBatteryUIAppForegroundPluggedInRuntimeKey"));

        objc_msgSend(v84, "objectForKeyedSubscript:", v70);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "setObject:forKeyedSubscript:", v75, CFSTR("PLBatteryUIAppBackgroundPluggedInRuntimeKey"));

        -[PLBatteryUIResponseTypeBatteryBreakdown bgLocationAudioTimeApps:](v83, "bgLocationAudioTimeApps:", v71);
        objc_msgSend(v71, "setObject:forKeyedSubscript:", &unk_1EA1C1268, CFSTR("PLBatteryUIAppEnergyValueKey"));
        objc_msgSend(v65, "addObject:", v71);

      }
      v67 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v90, v110, 16);
    }
    while (v67);
  }

  return v65;
}

- (id)processNotificationEntries:(id)a3 inRange:(_PLTimeIntervalRange)a4 withAppArray:(id)a5
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
  uint64_t v15;
  PLBatteryBreakdownNotificationInfo *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  PLBatteryBreakdownNotificationInfo *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  BOOL v30;
  NSObject *v31;
  NSObject *v32;
  const char *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;
  __int16 v57;
  PLBatteryBreakdownNotificationInfo *v58;
  _BYTE v59[128];
  uint64_t v60;

  length = a4.length;
  location = a4.location;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v44 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  v45 = v9;
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v51;
    v14 = location + length;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(v10);
        v16 = *(PLBatteryBreakdownNotificationInfo **)(*((_QWORD *)&v50 + 1) + 8 * v15);
        -[PLBatteryBreakdownNotificationInfo entryDate](v16, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17;
        if (!v17)
          goto LABEL_8;
        objc_msgSend(v17, "timeIntervalSince1970");
        if (location > v19)
          goto LABEL_8;
        v20 = v19;

        if (v14 >= v20)
        {
          -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("NotificationType"));
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("NotificationType"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (!objc_msgSend(v23, "intValue"))
              goto LABEL_16;
            -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("NotificationType"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v24, "intValue") == 3)
            {

LABEL_16:
LABEL_17:
              -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("NotificationBundleID"));
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
              {
                v25 = -[PLBatteryBreakdownNotificationInfo initWithEntry:]([PLBatteryBreakdownNotificationInfo alloc], "initWithEntry:", v16);
                if (v25)
                {
                  objc_msgSend(v9, "objectForKeyedSubscript:", v18);
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v26)
                  {
                    objc_msgSend(v9, "objectForKeyedSubscript:", v18);
                    v27 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v27, "combineWith:", v25);

                  }
                  else
                  {
                    objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, v18);
                  }
                  PLLogCommon();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                  {
LABEL_28:

                    goto LABEL_8;
                  }
                  *(_DWORD *)buf = 138412546;
                  v56 = v18;
                  v57 = 2112;
                  v58 = v25;
                  v32 = v31;
                  v33 = "notification: %@ -> %@";
                }
                else
                {
                  PLLogCommon();
                  v31 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
                    goto LABEL_28;
                  *(_DWORD *)buf = 138412546;
                  v56 = v18;
                  v57 = 2112;
                  v58 = v16;
                  v32 = v31;
                  v33 = "failed to init notification info for %@ %@";
                }
                _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, v33, buf, 0x16u);
                goto LABEL_28;
              }
LABEL_8:

              goto LABEL_9;
            }
            -[PLBatteryBreakdownNotificationInfo objectForKeyedSubscript:](v16, "objectForKeyedSubscript:", CFSTR("NotificationType"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "intValue");

            v30 = v29 == -1;
            v9 = v45;
            if (v30)
              goto LABEL_17;
          }
        }
LABEL_9:
        ++v15;
      }
      while (v12 != v15);
      v34 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      v12 = v34;
    }
    while (v34);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v35 = v44;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v47;
LABEL_34:
    v39 = 0;
    while (1)
    {
      if (*(_QWORD *)v47 != v38)
        objc_enumerationMutation(v35);
      v40 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v39);
      v9 = v45;
      if (!objc_msgSend(v45, "count"))
        break;
      objc_msgSend(v40, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectForKeyedSubscript:", v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("NotificationInfo"));
        objc_msgSend(v45, "removeObjectForKey:", v41);
      }

      if (v37 == ++v39)
      {
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        v9 = v45;
        if (v37)
          goto LABEL_34;
        break;
      }
    }
  }

  return v35;
}

- (id)getWidgetUpdateTypeToCount:(id)a3 inRange:(_PLTimeIntervalRange)a4
{
  double length;
  double location;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[3];

  length = a4.length;
  location = a4.location;
  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("WidgetUpdates"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@='%@'"), CFSTR("bundleID"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@=%f"), CFSTR("timeInterval"), 0x40AC200000000000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeBatteryBreakdown responderService](self, "responderService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v9;
  v25[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entriesForKey:inTimeRange:withFilters:", v8, v13, location, length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__13;
  v23 = __Block_byref_object_dispose__13;
  v24 = (id)objc_opt_new();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __78__PLBatteryUIResponseTypeBatteryBreakdown_getWidgetUpdateTypeToCount_inRange___block_invoke;
  v18[3] = &unk_1EA170790;
  v18[4] = self;
  v18[5] = &v19;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v18);
  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown getWidgetUpdateTypeToCount:inRange:].cold.1();

  v16 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v16;
}

void __78__PLBatteryUIResponseTypeBatteryBreakdown_getWidgetUpdateTypeToCount_inRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
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
  id v18;

  v3 = a2;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("host"));
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "getWidgetTypeForHostName:");
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "intValue");
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB37E8];
  if (v9)
  {
    v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInt:", objc_msgSend(v13, "intValue") + v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, v13);
  }

}

- (signed)getWidgetTypeForEnergyEntry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  signed __int16 v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WidgetUpdateTypeToCount"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", CFSTR("@max.self"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeysForObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeBatteryBreakdown getWidgetTypeForEnergyEntry:].cold.1(v3, (uint64_t)v4, v9);

  if (objc_msgSend(v7, "containsObject:", &unk_1EA1C1448))
  {

    v8 = &unk_1EA1C1448;
  }
  if ((int)objc_msgSend(v6, "intValue") < 1)
    v10 = 0;
  else
    v10 = objc_msgSend(v8, "intValue");

  return v10;
}

- (signed)getWidgetTypeForHostName:(id)a3
{
  id v3;
  signed __int16 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Local")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Remote-NotificationCenter")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)stringifyKeysForDict:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PLBatteryUIResponseTypeBatteryBreakdown_stringifyKeysForDict___block_invoke;
  v7[3] = &unk_1EA170768;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __64__PLBatteryUIResponseTypeBatteryBreakdown_stringifyKeysForDict___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  objc_msgSend(a2, "stringValue");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 16, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableArray)buckets
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setBuckets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)monotonicNow
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setMonotonicNow:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSSet)rootNodeBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRootNodeBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSSet)nonAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setNonAppBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSSet)webAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWebAppBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)deletedAppBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDeletedAppBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSSet)deletedAppClipBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDeletedAppClipBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSSet)exchangeBundleIDs
{
  return (NSSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setExchangeBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDictionary)nodeIDsToNodeNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNodeIDsToNodeNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)bundleIDsToDisplayNames
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setBundleIDsToDisplayNames:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSDictionary)bundleIDsToReplacementBundleIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setBundleIDsToReplacementBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDictionary)bundleIDsToForegroundTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setBundleIDsToForegroundTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (NSDictionary)bundleIDsToBackgroundTimes
{
  return (NSDictionary *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBundleIDsToBackgroundTimes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (NSDictionary)bundleIDsToEnergyKeyForSlopAdjustment
{
  return (NSDictionary *)objc_getProperty(self, a2, 152, 1);
}

- (void)setBundleIDsToEnergyKeyForSlopAdjustment:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (NSDictionary)pluginBundleIDsToEntries
{
  return (NSDictionary *)objc_getProperty(self, a2, 160, 1);
}

- (void)setPluginBundleIDsToEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (NSDictionary)lastBatteryEntry
{
  return (NSDictionary *)objc_getProperty(self, a2, 168, 1);
}

- (void)setLastBatteryEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (NSSet)intermediateRootNodes
{
  return (NSSet *)objc_getProperty(self, a2, 176, 1);
}

- (void)setIntermediateRootNodes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSDictionary)rootNodeIDToRootNodeEnergyKeys
{
  return (NSDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRootNodeIDToRootNodeEnergyKeys:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (BOOL)hasHomeKit
{
  return self->_hasHomeKit;
}

- (void)setHasHomeKit:(BOOL)a3
{
  self->_hasHomeKit = a3;
}

- (BOOL)gizmoConnected
{
  return self->_gizmoConnected;
}

- (void)setGizmoConnected:(BOOL)a3
{
  self->_gizmoConnected = a3;
}

- (BOOL)isSlopAdjustmentEnabled
{
  return self->_isSlopAdjustmentEnabled;
}

- (void)setIsSlopAdjustmentEnabled:(BOOL)a3
{
  self->_isSlopAdjustmentEnabled = a3;
}

- (double)lastUpgradeTimestamp
{
  return self->_lastUpgradeTimestamp;
}

- (void)setLastUpgradeTimestamp:(double)a3
{
  self->_lastUpgradeTimestamp = a3;
}

- (double)dataDuration
{
  return self->_dataDuration;
}

- (void)setDataDuration:(double)a3
{
  self->_dataDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNodeIDToRootNodeEnergyKeys, 0);
  objc_storeStrong((id *)&self->_intermediateRootNodes, 0);
  objc_storeStrong((id *)&self->_lastBatteryEntry, 0);
  objc_storeStrong((id *)&self->_pluginBundleIDsToEntries, 0);
  objc_storeStrong((id *)&self->_bundleIDsToEnergyKeyForSlopAdjustment, 0);
  objc_storeStrong((id *)&self->_bundleIDsToBackgroundTimes, 0);
  objc_storeStrong((id *)&self->_bundleIDsToForegroundTimes, 0);
  objc_storeStrong((id *)&self->_bundleIDsToReplacementBundleIDs, 0);
  objc_storeStrong((id *)&self->_bundleIDsToDisplayNames, 0);
  objc_storeStrong((id *)&self->_nodeIDsToNodeNames, 0);
  objc_storeStrong((id *)&self->_exchangeBundleIDs, 0);
  objc_storeStrong((id *)&self->_deletedAppClipBundleIDs, 0);
  objc_storeStrong((id *)&self->_deletedAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_webAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_nonAppBundleIDs, 0);
  objc_storeStrong((id *)&self->_rootNodeBundleIDs, 0);
  objc_storeStrong((id *)&self->_monotonicNow, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_buckets, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)filterFgBg:(uint64_t)a3 filterArray:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "skipping runtime filter for %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addEntryTypes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: rootNodeBundleIDs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)addEntryTypes:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: nonAppBundleIDs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)addEntryTypes:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: webAppBundleIDs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)addEntryTypes:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: bundleIDsToDisplayNames is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)applyStaticNameTransformation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: bundleIDsToReplacementBundleIDs is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)applyStaticNameTransformation:.cold.3()
{
  NSObject *v0;
  _QWORD *v1;
  uint8_t *v2;
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_2(v5, v6);
  *(_DWORD *)v2 = 134217984;
  *v1 = v7;
  OUTLINED_FUNCTION_5_0(&dword_1DA9D6000, v0, OS_LOG_TYPE_DEBUG, "After clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f", v2);

  OUTLINED_FUNCTION_14();
}

- (void)applyStaticNameTransformation:.cold.4()
{
  NSObject *v0;
  _QWORD *v1;
  uint8_t *v2;
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_2(v5, v6);
  *(_DWORD *)v2 = 134217984;
  *v1 = v7;
  OUTLINED_FUNCTION_5_0(&dword_1DA9D6000, v0, OS_LOG_TYPE_DEBUG, "Before clamping: energyEntry[PLBatteryUIAppEnergyValueKey]=%f", v2);

  OUTLINED_FUNCTION_14();
}

- (void)adjustEnergyValues:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "totalEnergyPercent=%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)applySlopAdjustment:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "Bailing: totalAccountedEnergySum=%f, externalEnergySum=%f", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)applySlopAdjustment:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "totalEnergyToRemove for slop adjustment = %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)applySlopAdjustment:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, v1, "totalEnergySum=%f, externalEnergySum=%f", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getEnergyToRemoveForSlopAdjustment:(void *)a1 withEnergyKey:(uint64_t)a2 forBucket:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = a2;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "not a relevant entry for slopAdjustment, bundleID=%@, energyEntry value for energyKey=%@ is %f", (uint8_t *)&v9, 0x20u);

}

- (void)adjustRuntimes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: bundleIDsToForegroundTimes is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)adjustRuntimes:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: bundleIDsToBackgroundTimes is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "combinedWidgetUpdateTypeToCount=%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__PLBatteryUIResponseTypeBatteryBreakdown_collapseEnergyEntries___block_invoke_cold_2()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_15_3();
  v3 = v0;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v1, (uint64_t)v1, "storedDict=%@, otherDict=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)ongoingUpdateRestoreTransformations:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "Ongoing Restore: ongoingRestore total energy stored in final entry is %f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)ongoingUpdateRestoreTransformations:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Ongoing Restore: Created a new ongoing restore energy entry and added it to current list of energy entries", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)ongoingUpdateRestoreTransformations:.cold.3()
{
  NSObject *v0;
  _QWORD *v1;
  uint8_t *v2;
  void *v3;
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_1();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16_2(v5, v6);
  *(_DWORD *)v2 = 134217984;
  *v1 = v7;
  OUTLINED_FUNCTION_5_0(&dword_1DA9D6000, v0, OS_LOG_TYPE_DEBUG, "Ongoing Restore: After adjustments, energy in entry is %f", v2);

  OUTLINED_FUNCTION_14();
}

- (void)ongoingUpdateRestoreTransformations:(NSObject *)a3 .cold.4(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a3, (uint64_t)a3, "Ongoing Restore: Currently have a Backup, Restore, or Backup & Restore entity", a1);
}

- (void)transformDeletedApps:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: deletedAppBundleIDs and deletedAppClipBundleIDs are empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)transformDeletedApps:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a3, (uint64_t)a3, "This is a deleted entity", a1);
}

- (void)transformDeletedApps:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Display Name for Deleted entry: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)transformPlugins:withBucket:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "Battery Usage Breakdown: pluginBundleIDsToEntries is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

- (void)buildBucketsForRange:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_DEBUG, "Battery Breakdown: bucket count = %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_6();
}

- (void)initializeBucketsWithRange:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_5(a1, a2);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v2, v3, "Battery Breakdown: gathered %d qualification nodes...", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)initializeBucketsWithRange:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_5(a1, a2);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v2, v3, "Battery Breakdown: gathered %d root nodes...", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

void __70__PLBatteryUIResponseTypeBatteryBreakdown_initializeBucketsWithRange___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "buckets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0(v2, v3);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v4, v5, "Battery Breakdown: prepared %d buckets", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_5(a1, a2);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v2, v3, "Battery Breakdown: gathered %d notification entries...", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

- (void)prepareBucketsWithRange:(void *)a1 .cold.2(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_12_5(a1, a2);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v2, v3, "Battery Breakdown: gathered %d app runtime entries...", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_1();
}

void __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "buckets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0(v2, v3);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v4, v5, "Battery Breakdown: applied notification runtimes to %d buckets", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

void __67__PLBatteryUIResponseTypeBatteryBreakdown_prepareBucketsWithRange___block_invoke_cold_2(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "buckets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_17_0(v2, v3);
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_3_1(&dword_1DA9D6000, v4, v5, "Battery Breakdown: applied app runtimes to %d buckets", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1();
}

- (void)getWidgetUpdateTypeToCount:inRange:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v1, (uint64_t)v1, "in getWidgetUpdate identifier=%@, widgetTypeToCount=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)getWidgetTypeForEnergyEntry:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBundleIDKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_15_3();
  v8 = a2;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, v6, "identifier=%@, widgetTypeToCount=%@", v7);

}

@end
