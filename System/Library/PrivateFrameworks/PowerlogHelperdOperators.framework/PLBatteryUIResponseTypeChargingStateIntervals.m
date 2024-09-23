@implementation PLBatteryUIResponseTypeChargingStateIntervals

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
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int16 v35;
  _BOOL4 v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  uint64_t v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  unint64_t v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  unsigned int v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  v64 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals setStart:](self, "setStart:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals setEnd:](self, "setEnd:", v12);

  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeChargingStateIntervals end](self, "end");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v14;
    v73 = 2112;
    v74 = v15;
    _os_log_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_INFO, "start=%@, end=%@", buf, 0x16u);

  }
  -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals end](self, "end");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSince1970");
  v19 = v18;
  objc_msgSend(v17, "timeIntervalSince1970");
  -[PLBatteryUIResponseTypeChargingStateIntervals setRange:](self, "setRange:", v19, v20 - v19);

  -[PLBatteryUIResponseTypeChargingStateIntervals setUseBattUIforEC:](self, "setUseBattUIforEC:", 1);
  PLLogCommon();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeChargingStateIntervals end](self, "end");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v72 = v22;
    v73 = 2112;
    v74 = v23;
    _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_INFO, "after system to monotonic conversion: start=%@, end=%@", buf, 0x16u);

  }
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BatteryUI"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0x1E0CB3000uLL;
  if (-[PLBatteryUIResponseTypeChargingStateIntervals useBattUIforEC](self, "useBattUIforEC"))
  {
    v25 = objc_alloc(MEMORY[0x1E0D80080]);
    v26 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
    objc_msgSend(v26, "numberWithDouble:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v25, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v27, 5);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Level"), &unk_1EA1BF978, 3);
    -[PLBatteryUIResponseTypeChargingStateIntervals responderService](self, "responderService");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "storage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v28;
    v70[1] = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastEntryForKey:withComparisons:isSingleton:", v66, v32, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeChargingStateIntervals setLastBattEntry:](self, "setLastBattEntry:", v33);

  }
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("Charging"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_opt_new();
  -[PLBatteryUIResponseTypeChargingStateIntervals setChargingStateIntervalsDict:](self, "setChargingStateIntervalsDict:", v34);

  v35 = 1;
  do
  {
    v36 = -[PLBatteryUIResponseTypeChargingStateIntervals useBattUIforEC](self, "useBattUIforEC");
    if (v35 == 1 && v36)
    {
      -[PLBatteryUIResponseTypeChargingStateIntervals getBattUIEntriesWithKey:](self, "getBattUIEntriesWithKey:", v66);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v37;
        _os_log_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_INFO, "getBattUIEntriesWithKey=%@", buf, 0xCu);
      }

      -[PLBatteryUIResponseTypeChargingStateIntervals chargingStateIntervalsDict](self, "chargingStateIntervalsDict");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v24 + 2024), "numberWithShort:", 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v37, v40);
LABEL_20:

      goto LABEL_22;
    }
    v41 = (void *)MEMORY[0x1E0CB3940];
    -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
    v43 = v42;
    -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
    v46 = v44 + v45;
    -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
    v48 = v47;
    -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
    v51 = v49 + v50;
    v52 = v24;
    objc_msgSend(*(id *)(v24 + 2024), "numberWithShort:", v35);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("((timestamp BETWEEN %f AND %f) OR (%@ BETWEEN %f AND %f)) AND %@=\"%@\"), v43, *(_QWORD *)&v46, CFSTR("timestampEnd"), v48, *(_QWORD *)&v51, CFSTR("intervalType"), v53);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v37;
      _os_log_impl(&dword_1DA9D6000, v54, OS_LOG_TYPE_INFO, "where=%@", buf, 0xCu);
    }

    -[PLBatteryUIResponseTypeChargingStateIntervals responderService](self, "responderService");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "storage");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v37;
    v68[0] = CFSTR("where");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68[1] = CFSTR("order by");
    v69[0] = v57;
    v69[1] = &unk_1EA1D71F8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "entriesForKey:withProperties:", v65, v58);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v59 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v72 = v39;
      _os_log_impl(&dword_1DA9D6000, v59, OS_LOG_TYPE_INFO, "chargingStateEntries: %@", buf, 0xCu);
    }

    if (v39)
    {
      v24 = v52;
      if (!objc_msgSend(v39, "count"))
        goto LABEL_22;
      -[PLBatteryUIResponseTypeChargingStateIntervals chargingStateIntervalsDict](self, "chargingStateIntervalsDict");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v52 + 2024), "numberWithShort:", v35);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v39, v60);

      goto LABEL_20;
    }
    v24 = v52;
LABEL_22:

    v61 = (unsigned __int16)v35++;
  }
  while (v61 < 9);
  PLLogCommon();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypeChargingStateIntervals chargingStateIntervalsDict](self, "chargingStateIntervalsDict");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v72 = v63;
    _os_log_impl(&dword_1DA9D6000, v62, OS_LOG_TYPE_INFO, "charging state intervals dict: %@", buf, 0xCu);

  }
}

- (id)getBattUIEntriesWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[3];
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PLBatteryUIResponseTypeChargingStateIntervals responderService](self, "responderService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
  objc_msgSend(v6, "entriesForKey:inTimeRange:withFilters:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_INFO, "earliestEntry=%@", buf, 0xCu);
  }

  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("IsCharging"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "BOOLValue");

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
      objc_msgSend(v12, "stringWithFormat:", CFSTR("timestamp < %f AND %@ = %d"), v13, CFSTR("IsCharging"), 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLBatteryUIResponseTypeChargingStateIntervals responderService](self, "responderService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "storage");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v14;
      v35[0] = CFSTR("where");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = v17;
      v36[1] = &unk_1EA1D7220;
      v35[1] = CFSTR("order by");
      v35[2] = CFSTR("limit");
      v36[2] = &unk_1EA1BF990;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "entriesForKey:withProperties:", v4, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v38 = v20;
        _os_log_impl(&dword_1DA9D6000, v21, OS_LOG_TYPE_INFO, "latestNonConnectedEntryBeforeRange=%@", buf, 0xCu);
      }

      if (v20)
      {
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("timestamp"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "doubleValue");
        v24 = v23;

        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryUIResponseTypeChargingStateIntervals end](self, "end");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "timeIntervalSince1970");
        v28 = v27;
        objc_msgSend(v26, "timeIntervalSince1970");
        -[PLBatteryUIResponseTypeChargingStateIntervals setRange:](self, "setRange:", v28, v29 - v28);

        -[PLBatteryUIResponseTypeChargingStateIntervals responderService](self, "responderService");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "storage");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryUIResponseTypeChargingStateIntervals range](self, "range");
        objc_msgSend(v31, "entriesForKey:inTimeRange:withFilters:", v4, 0);
        v32 = objc_claimAutoreleasedReturnValue();

        v7 = (void *)v32;
      }

    }
  }

  return v7;
}

- (void)run
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[PLBatteryUIResponseTypeChargingStateIntervals chargingStateIntervalsDict](self, "chargingStateIntervalsDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PLBatteryUIResponseTypeChargingStateIntervals_run__block_invoke;
  v7[3] = &unk_1EA16CD38;
  v7[4] = self;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v7);

  -[PLBatteryUIResponseTypeChargingStateIntervals chargingStateIntervalsDict](self, "chargingStateIntervalsDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals mapChargingStateIntervalsToGraphIntervals:](self, "mapChargingStateIntervalsToGraphIntervals:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v5;
    _os_log_impl(&dword_1DA9D6000, v6, OS_LOG_TYPE_INFO, "graph charging state intervals: %@", buf, 0xCu);
  }

  -[PLBatteryUIResponseTypeChargingStateIntervals setResultDict:](self, "setResultDict:", v5);
}

void __52__PLBatteryUIResponseTypeChargingStateIntervals_run__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "useBattUIforEC") && objc_msgSend(v5, "intValue") == 1)
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "lastBattEntry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "end");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constructIntervalTuplesFromBattEntries:lastBattEntry:startOfRange:endOfRange:", v6, v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chargingStateIntervalsDict");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v5);

  }
  else
  {
    v13 = objc_msgSend(v5, "intValue");
    v14 = *(void **)(a1 + 32);
    objc_msgSend(v14, "start");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "end");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == 9)
      objc_msgSend(v14, "constructIntervalTuplesFromEntries:startOfRange:endOfRange:allowOverflow:", v6, v8, v9, 1);
    else
      objc_msgSend(v14, "constructIntervalTuplesFromEntries:startOfRange:endOfRange:", v6, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "chargingStateIntervalsDict");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v5);
  }

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "chargingStateIntervalsDict");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v5;
    v20 = 2112;
    v21 = v17;
    _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_INFO, "after converting PLEntry to interval tuples for chargingIntervalType=%@, intervals=%@", (uint8_t *)&v18, 0x16u);

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

- (NSDate)start
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStart:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)end
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEnd:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (_PLTimeIntervalRange)range
{
  double v2;
  double v3;
  _QWORD v4[2];
  _PLTimeIntervalRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = *(double *)v4;
  v3 = *(double *)&v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_PLTimeIntervalRange)a3
{
  _PLTimeIntervalRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (PLEntry)lastBattEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLastBattEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableDictionary)chargingStateIntervalsDict
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setChargingStateIntervalsDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)resultDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setResultDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)useBattUIforEC
{
  return self->_useBattUIforEC;
}

- (void)setUseBattUIforEC:(BOOL)a3
{
  self->_useBattUIforEC = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDict, 0);
  objc_storeStrong((id *)&self->_chargingStateIntervalsDict, 0);
  objc_storeStrong((id *)&self->_lastBattEntry, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (id)sortIntervals:(id)a3
{
  return (id)objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_1);
}

uint64_t __82__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__sortIntervals___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)mergeIntervals:(id)a3 withTolerance:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  double v14;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[PLBatteryUIResponseTypeChargingStateIntervals sortIntervals:](self, "sortIntervals:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_opt_new();
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v9);

    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __97__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__mergeIntervals_withTolerance___block_invoke;
    v12[3] = &unk_1EA16D388;
    v10 = v8;
    v13 = v10;
    v14 = a4;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v12);

  }
  else
  {
    v10 = (id)MEMORY[0x1E0C9AA60];
  }

  return v10;
}

void __97__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__mergeIntervals_withTolerance___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;

  v5 = a2;
  if (a3)
  {
    v17 = v5;
    objc_msgSend(*(id *)(a1 + 32), "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (double)(int)objc_msgSend(v7, "intValue") - *(double *)(a1 + 40);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (double)(int)objc_msgSend(v9, "intValue");

    if (v8 <= v10)
    {
      objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      if (v12 > v14)
      {
        v15 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:atIndexedSubscript:", v16, 1);

        objc_msgSend(*(id *)(a1 + 32), "removeLastObject");
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);

      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v17);
    }

    v5 = v17;
  }

}

- (id)filterIntervals:(id)a3 withThreshold:(double)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  double v11;

  v5 = a3;
  v6 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __98__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__filterIntervals_withThreshold___block_invoke;
  v9[3] = &unk_1EA16D3B0;
  v11 = a4;
  v7 = v6;
  v10 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  return v7;
}

void __98__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__filterIntervals_withThreshold___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  double v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");
  objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(int)(v4 - objc_msgSend(v5, "intValue"));

  if (*(double *)(a1 + 40) <= v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

- (id)intersectionOfTwoSets:(id)a3 intervalSetB:(id)a4
{
  return -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSetsWithMergeThreshold:intervalSetA:intervalSetB:](self, "intersectionOfTwoSetsWithMergeThreshold:intervalSetA:intervalSetB:", 0, a3, a4);
}

- (id)intersectionOfTwoSetsWithMergeThreshold:(int)a3 intervalSetA:(id)a4 intervalSetB:(id)a5
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  unsigned int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  unsigned int v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  int v49;
  id v52;
  unsigned int v53;
  unint64_t v54;
  unint64_t v55;
  unsigned int v56;
  unsigned int v57;
  _QWORD v58[3];

  v58[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a5;
  v52 = (id)objc_opt_new();
  v54 = objc_msgSend(v6, "count");
  v55 = objc_msgSend(v7, "count");
  if (v54 && v55)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    do
    {
      v56 = v11;
      v57 = v10;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "intValue");

      if (v14 <= v17)
        v18 = v17;
      else
        v18 = v14;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectAtIndexedSubscript:", 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "intValue");

      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "intValue");

      if (v21 >= v24)
        v25 = v24;
      else
        v25 = v21;
      if (v18 < (int)v25)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "intValue");

        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "intValue");

        if (v28 >= v31)
          v32 = v31;
        else
          v32 = v28;
        if (v18 - a3 >= v32)
          v32 = v18;
        v53 = v32;
        objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectAtIndexedSubscript:", 1);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "intValue");

        objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "intValue");

        if (v35 <= v38)
          v39 = v38;
        else
          v39 = v35;
        if ((int)(v25 + a3) <= (int)v39)
          v40 = v25;
        else
          v40 = v39;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v53);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v41;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v58[1] = v42;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "addObject:", v43);

      }
      objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectAtIndexedSubscript:", 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "intValue");
      objc_msgSend(v7, "objectAtIndexedSubscript:", v8);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectAtIndexedSubscript:", 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = objc_msgSend(v48, "intValue");

      if (v46 < v49)
        v8 = v56;
      else
        v8 = v56 + 1;
      if (v46 >= v49)
        v9 = v57;
      else
        v9 = v57 + 1;
      if (v54 <= v9)
        break;
      v10 = v9;
      v11 = v8;
    }
    while (v55 > v8);
  }

  return v52;
}

- (id)differenceBetweenSetAndIntersectingSet:(id)a3 intervalSetB:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count") && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__1;
    v25 = __Block_byref_object_dispose__1;
    v13 = v9;
    v26 = v13;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __120__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__differenceBetweenSetAndIntersectingSet_intervalSetB___block_invoke;
    v18[3] = &unk_1EA16D3D8;
    v20 = &v21;
    v14 = v12;
    v19 = v14;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v18);
    if ((objc_msgSend((id)v22[5], "isEqualToNumber:", v11) & 1) == 0)
    {
      v27[0] = v22[5];
      v27[1] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v15);

    }
    -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v6, v14);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v16 = v6;
  }

  return v16;
}

void __120__PLBatteryUIResponseTypeChargingStateIntervals_IntervalOperation__differenceBetweenSetAndIntersectingSet_intervalSetB___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isEqualToNumber:", v5);

  if ((v4 & 1) == 0)
  {
    v6 = *(void **)(a1 + 32);
    v12[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (id)unionBetweenSetAndIntersectingSet:(id)a3 intervalSetB:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  unsigned int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v39;
  void *v40;
  unint64_t v41;
  int v42;
  int v43;
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v6, "count");
  v8 = v5;
  if (v7 && (v9 = objc_msgSend(v5, "count"), v8 = v6, v9))
  {
    v10 = (id)objc_opt_new();
    v11 = objc_msgSend(v5, "count");
    v41 = objc_msgSend(v6, "count");
    if (v11 | v41)
    {
      v12 = 0;
      v13 = 0;
      v42 = 0;
      v43 = 0;
      v39 = v11;
      v40 = v5;
      do
      {
        if (v11 == v13)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          ++v43;
        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v15;
          if (v41 == v12)
          {
            ++v42;
          }
          else
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "intValue");
            objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectAtIndexedSubscript:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "intValue");

            if (v17 >= v20)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              ++v43;
              v5 = v40;
            }
            else
            {
              v5 = v40;
              objc_msgSend(v40, "objectAtIndexedSubscript:", v13);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              ++v42;
            }
            v11 = v39;
          }
        }
        if (!objc_msgSend(v10, "count", v39))
          goto LABEL_15;
        objc_msgSend(v10, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectAtIndexedSubscript:", 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "intValue");
        objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "intValue");

        if (v23 >= v25)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "intValue");

          objc_msgSend(v10, "lastObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectAtIndexedSubscript:", 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "intValue");

          if ((int)v27 <= (int)v30)
            v31 = v30;
          else
            v31 = v27;
          objc_msgSend(v10, "lastObject");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectAtIndexedSubscript:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "intValue");

          objc_msgSend(v10, "removeLastObject");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v44[0] = v35;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v31);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v44[1] = v36;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v37);

        }
        else
        {
LABEL_15:
          objc_msgSend(v10, "addObject:", v14);
        }

        v13 = v42;
        v12 = v43;
      }
      while (v11 > v42 || v41 > v43);
    }
  }
  else
  {
    v10 = v8;
  }

  return v10;
}

- (id)constructIntervalTuplesFromEntries:(id)a3 startOfRange:(id)a4 endOfRange:(id)a5
{
  return -[PLBatteryUIResponseTypeChargingStateIntervals constructIntervalTuplesFromEntries:startOfRange:endOfRange:allowOverflow:](self, "constructIntervalTuplesFromEntries:startOfRange:endOfRange:allowOverflow:", a3, a4, a5, 0);
}

- (id)constructIntervalTuplesFromEntries:(id)a3 startOfRange:(id)a4 endOfRange:(id)a5 allowOverflow:(BOOL)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  BOOL v26;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke;
  v21[3] = &unk_1EA170D40;
  v22 = v9;
  v23 = v13;
  v26 = a6;
  v24 = v10;
  v14 = v12;
  v25 = v14;
  v15 = v10;
  v16 = v13;
  v17 = v9;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v21);

  v18 = v25;
  v19 = v14;

  return v19;
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  double v15;
  uint64_t v16;
  void *v17;
  int v18;
  int v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_2(v3, v8);

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v9, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (!*(_BYTE *)(a1 + 64))
  {
    v13 = (void *)MEMORY[0x1E0CB37E8];
    v14 = objc_msgSend(v6, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    if (v15 <= (double)v14)
      v15 = (double)v14;
    objc_msgSend(v13, "numberWithDouble:", v15);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v16;
  }
  v17 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend(v6, "intValue");
  v19 = objc_msgSend(v11, "intValue");
  if (v18 <= v19)
    v18 = v19;
  objc_msgSend(*(id *)(a1 + 48), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  if (v20 > (double)v18)
    v20 = (double)v18;
  objc_msgSend(v17, "numberWithDouble:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = v6;
  v24[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_1((uint64_t)v22, (uint64_t)v3, v23);

  objc_msgSend(*(id *)(a1 + 56), "addObject:", v22);
}

- (id)constructIntervalTuplesFromBattEntries:(id)a3 lastBattEntry:(id)a4 startOfRange:(id)a5 endOfRange:(id)a6
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  double v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  void *v46;
  void *v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[2];
  uint8_t buf[4];
  id v56;
  __int16 v57;
  void *v58;
  _QWORD v59[2];
  uint8_t v60[4];
  uint64_t v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v49 = a5;
  PLLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_INFO, "Creating charging intervals", buf, 2u);
  }

  v48 = (id)objc_opt_new();
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IsCharging"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "BOOLValue");

    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeChargingStateIntervals(Utilities) constructIntervalTuplesFromBattEntries:lastBattEntry:startOfRange:endOfRange:].cold.5(v12, v13);

  }
  else
  {
    v12 = 0;
  }
  PLLogCommon();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeChargingStateIntervals(Utilities) constructIntervalTuplesFromBattEntries:lastBattEntry:startOfRange:endOfRange:].cold.4(v8, v12, v14);
  v46 = v9;

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v47 = v8;
  objc_msgSend(v8, "reverseObjectEnumerator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  if (!v16)
  {
    v19 = 0.0;
    goto LABEL_29;
  }
  v17 = v16;
  v18 = *(_QWORD *)v51;
  v19 = 0.0;
  do
  {
    for (i = 0; i != v17; ++i)
    {
      if (*(_QWORD *)v51 != v18)
        objc_enumerationMutation(v15);
      v21 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("Level"), v46);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "intValue");

      if (v23 < 0)
      {
        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIResponseTypeChargingIntervals run].cold.3(v60, v21, &v61, v29);
      }
      else
      {
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("IsCharging"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "BOOLValue");

        if ((v12 & 1) == v25)
          continue;
        objc_msgSend(v21, "entryDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timeIntervalSinceDate:", v49);
        v28 = v27;

        if ((v25 & 1) != 0)
        {
          v12 = 1;
          v19 = v28;
          continue;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v59[0] = v30;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v59[1] = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 2);
        v29 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v48, "addObject:", v29);
        PLLogCommon();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          -[NSObject objectAtIndexedSubscript:](v29, "objectAtIndexedSubscript:", 0);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject objectAtIndexedSubscript:](v29, "objectAtIndexedSubscript:", 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v56 = v33;
          v57 = 2112;
          v58 = v34;
          _os_log_debug_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEBUG, "Created charging interval: [%@ %@]", buf, 0x16u);

        }
        v12 = 0;
      }

    }
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
  }
  while (v17);
LABEL_29:

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v47, "firstObject");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIResponseTypeChargingStateIntervals(Utilities) constructIntervalTuplesFromBattEntries:lastBattEntry:startOfRange:endOfRange:].cold.2(v36);

      objc_msgSend(v35, "entryDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "timeIntervalSinceDate:", v49);
      v39 = v38;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v19);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v54[0] = v40;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v54[1] = v41;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "addObject:", v42);
      PLLogCommon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.3(v42, v43);

    }
  }
  PLLogCommon();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v48;
    _os_log_impl(&dword_1DA9D6000, v44, OS_LOG_TYPE_INFO, "Charging intervals: %@", buf, 0xCu);
  }

  return v48;
}

- (id)getApplicableSlowChargingIntervalsGivenECIntervals:(id)a3 slowChargingIntervals:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  unsigned int v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  void *v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v5 = a3;
  v6 = a4;
  v36 = v6;
  if (objc_msgSend(v5, "count") && objc_msgSend(v6, "count"))
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__15;
    v42 = __Block_byref_object_dispose__15;
    v43 = (id)objc_opt_new();
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getApplicableSlowChargingIntervalsGivenECIntervals_slowChargingIntervals___block_invoke;
    v37[3] = &unk_1EA170D68;
    v37[4] = &v38;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v37);
    v7 = objc_msgSend(v5, "count");
    v35 = objc_msgSend(v6, "count");
    v34 = (void *)objc_opt_new();
    if (v7 && v35)
    {
      v8 = 0;
      v32 = 0;
      v33 = 0;
      LODWORD(v9) = 0;
      do
      {
        v9 = (int)v9;
        while (1)
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v8, v32);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "intValue");
          objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectAtIndexedSubscript:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v12 - objc_msgSend(v14, "intValue");

          v16 = v15 >= 0 ? v15 : -v15;
          if (v16 > 0x12B)
            break;
          v8 = ++v9;
          if (v7 <= v9)
            goto LABEL_20;
        }
        objc_msgSend((id)v39[5], "objectAtIndexedSubscript:", v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");
        objc_msgSend(v36, "objectAtIndexedSubscript:", v33);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "intValue");

        if (v19 >= v22)
        {
          v32 = (v32 + 1);
        }
        else
        {
          objc_msgSend((id)v39[5], "objectAtIndexedSubscript:", v8);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "intValue");
          objc_msgSend(v36, "objectAtIndexedSubscript:", v33);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "intValue");

          if (v25 > v28)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "addObject:", v29);

          }
          LODWORD(v9) = v9 + 1;
        }
        if (v7 <= (int)v9)
          break;
        v8 = (int)v9;
        v33 = (int)v32;
      }
      while (v35 > (int)v32);
    }
LABEL_20:
    _Block_object_dispose(&v38, 8);

    v30 = v34;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getApplicableSlowChargingIntervalsGivenECIntervals_slowChargingIntervals___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (double)(int)objc_msgSend(v6, "intValue") + 60.0;

  v8 = (double)v5;
  if (v7 <= (double)v5)
    v8 = v7;
  v9 = (int)v8;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "intValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (double)(int)objc_msgSend(v12, "intValue") + 300.0;
  v14 = (double)v11;
  if (v13 <= (double)v11)
    v14 = v13;
  v15 = (int)v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v18);
}

- (id)constructSlowChargingIntervals:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
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
  NSObject *v27;
  void *v29;
  _QWORD v30[2];
  void *v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v4;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "chargingStateIntervals=%@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1EA1C15B0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v6;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "externalConnectedIntervals=%@", buf, 0xCu);
  }

  -[PLBatteryUIResponseTypeChargingStateIntervals getChargingStateIntervals:forGraphIntervalType:](self, "getChargingStateIntervals:forGraphIntervalType:", v4, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v8;
    _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_INFO, "allSlowChargingIntervals=%@", buf, 0xCu);
  }

  -[PLBatteryUIResponseTypeChargingStateIntervals mergeIntervals:withTolerance:](self, "mergeIntervals:withTolerance:", v8, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v33 = v10;
    _os_log_impl(&dword_1DA9D6000, v11, OS_LOG_TYPE_INFO, "allSlowChargingIntervalsMerged=%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[PLBatteryUIResponseTypeChargingStateIntervals getApplicableSlowChargingIntervalsGivenECIntervals:slowChargingIntervals:](self, "getApplicableSlowChargingIntervalsGivenECIntervals:slowChargingIntervals:", v6, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v13;
      _os_log_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_INFO, "sortedAndFilteredSlowChargingIntervals=%@", buf, 0xCu);
    }

  }
  else
  {
    v13 = v12;
  }
  v15 = (void *)objc_opt_new();
  if (objc_msgSend(v13, "count"))
  {
    v29 = v6;
    v16 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceDate:", v18);
    objc_msgSend(v16, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[PLBatteryUIResponseTypeChargingStateIntervals end](self, "end");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v22);
    objc_msgSend(v20, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v30[0] = v19;
    v30[1] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v25, v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v33 = v26;
      _os_log_impl(&dword_1DA9D6000, v27, OS_LOG_TYPE_INFO, "Found slow charging intervals=%@", buf, 0xCu);
    }

    objc_msgSend(v15, "setObject:forKeyedSubscript:", v26, &unk_1EA1C15C8);
    v6 = v29;
  }
  else
  {
    v26 = v13;
  }

  return v15;
}

- (id)mergeAllChargingIntervals:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA1C15B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA1C15E0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v6;
      _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "adding paused charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("PLBatteryUIPausedChargingIntervalsKey"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA1C15C8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {
    PLLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_INFO, "adding slow charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("PLBatteryUIChargingSpeedIntervalsKey"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA1C15F8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1DA9D6000, v11, OS_LOG_TYPE_INFO, "adding paused slow charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("PLBatteryUIPausedSlowChargingIntervalsKey"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA1C1610);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v12;
      _os_log_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_INFO, "adding stopped charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("PLBatteryUIStoppedChargingIntervalsKey"));
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1EA1C1628);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
  {
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v14;
      _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_INFO, "adding stopped slow charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("PLBatteryUIStoppedSlowChargingIntervalsKey"));
  }
  if (objc_msgSend(v5, "count"))
  {
    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1DA9D6000, v16, OS_LOG_TYPE_INFO, "adding edited charging intervals =%@", (uint8_t *)&v19, 0xCu);
    }

    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("PLBatteryUIChargingIntervalsKey"));
  }
  PLLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v19 = 138412290;
    v20 = v4;
    _os_log_impl(&dword_1DA9D6000, v17, OS_LOG_TYPE_INFO, "charging intervals result =%@", (uint8_t *)&v19, 0xCu);
  }

  return v4;
}

- (id)enforceGraphIntervalPrecedence:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned int v43;
  void *v44;
  void *v45;
  uint8_t buf[4];
  _DWORD v48[7];

  *(_QWORD *)&v48[5] = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a3, "mutableCopy");
  v4 = 1;
  v5 = 0x1E0CB3000uLL;
  do
  {
    v6 = (v4 + 1);
    v43 = v4 + 1;
    do
    {
      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109376;
        v48[0] = v4;
        LOWORD(v48[1]) = 1024;
        *(_DWORD *)((char *)&v48[1] + 2) = v6;
        _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "precedence lower=%d higher=%d", buf, 0xEu);
      }

      objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v9;
        _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_INFO, "lowerPrecedenceIntervals from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v12;
        _os_log_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_INFO, "higherPrecedenceIntervals from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSetsWithMergeThreshold:intervalSetA:intervalSetB:](self, "intersectionOfTwoSetsWithMergeThreshold:intervalSetA:intervalSetB:", -[PLBatteryUIResponseTypeChargingStateIntervals filterThreshold:](self, "filterThreshold:", (__int16)v4), v9, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "count"))
      {
        v15 = v14;
        v16 = v14;
        v17 = v12;
        -[PLBatteryUIResponseTypeChargingStateIntervals unionBetweenSetAndIntersectingSet:intervalSetB:](self, "unionBetweenSetAndIntersectingSet:intervalSetB:", v16, v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v6);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, v19);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v48 = v22;
          _os_log_impl(&dword_1DA9D6000, v20, OS_LOG_TYPE_INFO, "higher precedence after merging=%@", buf, 0xCu);

        }
        v12 = v17;
        v14 = v15;
      }
      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v14;
        _os_log_impl(&dword_1DA9D6000, v23, OS_LOG_TYPE_INFO, "lowerIntersectsHigher from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      -[PLBatteryUIResponseTypeChargingStateIntervals differenceBetweenSetAndIntersectingSet:intervalSetB:](self, "differenceBetweenSetAndIntersectingSet:intervalSetB:", v9, v14);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v48 = v24;
        _os_log_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_INFO, "lowerWithoutHigher from constructGraphIntervalsWithPrecedence %@=", buf, 0xCu);
      }

      if (objc_msgSend(v24, "count"))
      {
        objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v4);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v26);
        v45 = v9;
        v27 = v5;
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v28, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(v27 + 2024), "numberWithInt:", v4);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKeyedSubscript:", v30);
        v44 = v24;
        v31 = v12;
        v32 = v6;
        v6 = (unint64_t)v3;
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v27;
        v9 = v45;
        objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v33 == 0;
        v3 = (void *)v6;
        LODWORD(v6) = v32;
        v12 = v31;
        v24 = v44;
        if (v35)
          v36 = v44;
        else
          v36 = v29;
        v37 = v3;
      }
      else
      {
        v29 = (void *)objc_opt_new();
        objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", v4);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = v3;
        v36 = v29;
      }
      objc_msgSend(v37, "setObject:forKeyedSubscript:", v36, v34);

      v6 = (v6 + 1);
    }
    while ((_DWORD)v6 != 7);
    v4 = v43;
  }
  while (v43 != 6);
  objc_msgSend(*(id *)(v5 + 2024), "numberWithInt:", 6);
  v38 = v5;
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v38 + 2024), "numberWithInt:", 6);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v40, v41);

  return v3;
}

- (id)mapChargingStateIntervalsToGraphIntervals:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
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
  _QWORD v51[2];
  void *v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v54 = (uint64_t)v4;
    _os_log_impl(&dword_1DA9D6000, v5, OS_LOG_TYPE_INFO, "chargingStateIntervals=%@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", &unk_1EA1C15B0);
  v6 = objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v6;
    _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_INFO, "externalConnectedIntervals=%@", buf, 0xCu);
  }

  v49 = (void *)v6;
  -[PLBatteryUIResponseTypeChargingStateIntervals mergeIntervals:withTolerance:](self, "mergeIntervals:withTolerance:", v6, 60.0);
  v8 = objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v54 = v8;
    _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_INFO, "allExternalConnectedIntervalsMerged=%@", buf, 0xCu);
  }

  v48 = (void *)v8;
  -[PLBatteryUIResponseTypeChargingStateIntervals filterIntervals:withThreshold:](self, "filterIntervals:withThreshold:", v8, 60.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, &unk_1EA1C15B0);
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(MEMORY[0x1E0D7FFF8], "supportsSlowCharging"))
  {
    -[PLBatteryUIResponseTypeChargingStateIntervals constructSlowChargingIntervals:](self, "constructSlowChargingIntervals:", v4);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSinceDate:", v15);
  objc_msgSend(v13, "numberWithDouble:");
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[PLBatteryUIResponseTypeChargingStateIntervals end](self, "end");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals start](self, "start");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v19);
  objc_msgSend(v17, "numberWithDouble:");
  v20 = objc_claimAutoreleasedReturnValue();

  v46 = (void *)v20;
  v47 = (void *)v16;
  v51[0] = v16;
  v51[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
  v22 = objc_claimAutoreleasedReturnValue();

  v45 = (void *)v22;
  -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v22, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v23, &unk_1EA1C15B0);
  PLLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v54 = (uint64_t)v11;
    _os_log_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_INFO, "chargingEntries after slow charging determination is %@=", buf, 0xCu);
  }

  v25 = v23;
  -[PLBatteryUIResponseTypeChargingStateIntervals getChargingStateIntervals:forGraphIntervalType:](self, "getChargingStateIntervals:forGraphIntervalType:", v4, 3);
  v26 = objc_claimAutoreleasedReturnValue();
  v50 = v4;
  -[PLBatteryUIResponseTypeChargingStateIntervals getChargingStateIntervals:forGraphIntervalType:](self, "getChargingStateIntervals:forGraphIntervalType:", v4, 4);
  v27 = objc_claimAutoreleasedReturnValue();
  v44 = (void *)v26;
  -[PLBatteryUIResponseTypeChargingStateIntervals filterIntervals:withThreshold:](self, "filterIntervals:withThreshold:", v26, 900.0);
  v28 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v27;
  -[PLBatteryUIResponseTypeChargingStateIntervals filterIntervals:withThreshold:](self, "filterIntervals:withThreshold:", v27, 900.0);
  v29 = objc_claimAutoreleasedReturnValue();
  v42 = (void *)v28;
  -[PLBatteryUIResponseTypeChargingStateIntervals mergeIntervals:withTolerance:](self, "mergeIntervals:withTolerance:", v28, 60.0);
  v30 = objc_claimAutoreleasedReturnValue();
  v41 = (void *)v29;
  -[PLBatteryUIResponseTypeChargingStateIntervals mergeIntervals:withTolerance:](self, "mergeIntervals:withTolerance:", v29, 60.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)v30;
  -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v25, v30);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, &unk_1EA1C15E0);
  objc_msgSend(v11, "objectForKeyedSubscript:", &unk_1EA1C15C8);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v33, v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "count"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v34, &unk_1EA1C15F8);
  -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v25, v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v35, &unk_1EA1C1610);
  -[PLBatteryUIResponseTypeChargingStateIntervals intersectionOfTwoSets:intervalSetB:](self, "intersectionOfTwoSets:intervalSetB:", v33, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v36, "count"))
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v36, &unk_1EA1C1628);
  -[PLBatteryUIResponseTypeChargingStateIntervals enforceGraphIntervalPrecedence:](self, "enforceGraphIntervalPrecedence:", v11);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIResponseTypeChargingStateIntervals mergeAllChargingIntervals:](self, "mergeAllChargingIntervals:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

- (id)getChargingStateIntervals:(id)a3 forGraphIntervalType:(signed __int16)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  signed __int16 v14;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke;
  v12[3] = &unk_1EA170D90;
  v14 = a4;
  v12[4] = self;
  v8 = v7;
  v13 = v8;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v12);

  v9 = v13;
  v10 = v8;

  return v10;
}

void __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __int16 *v7;
  NSObject *v8;

  v5 = a2;
  v6 = a3;
  v7 = (__int16 *)(a1 + 48);
  switch(*(_WORD *)(a1 + 48))
  {
    case 1:
      if (objc_msgSend(v5, "intValue") == 1)
        goto LABEL_11;
      break;
    case 2:
      if (objc_msgSend(MEMORY[0x1E0D7FFF8], "supportsSlowCharging")
        && objc_msgSend(*(id *)(a1 + 32), "isChargingSpeedIntervalType:", (__int16)objc_msgSend(v5, "intValue")))
      {
        goto LABEL_11;
      }
      break;
    case 3:
      if (objc_msgSend(*(id *)(a1 + 32), "isPausedChargingIntervalType:", (__int16)objc_msgSend(v5, "intValue")))goto LABEL_11;
      break;
    case 4:
      if (objc_msgSend(*(id *)(a1 + 32), "isStoppedChargingIntervalType:", (__int16)objc_msgSend(v5, "intValue")))LABEL_11:objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);
      break;
    default:
      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke_cold_1(v7, v8);

      break;
  }

}

- (int)filterThreshold:(signed __int16)a3
{
  if ((a3 - 3) >= 4)
    return 60;
  else
    return 900;
}

- (BOOL)isPausedChargingIntervalType:(signed __int16)a3
{
  return (a3 < 8) & (0xDCu >> a3);
}

- (BOOL)isStoppedChargingIntervalType:(signed __int16)a3
{
  return a3 == 5 || a3 == 8;
}

- (BOOL)isChargingSpeedIntervalType:(signed __int16)a3
{
  return a3 == 9;
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, (uint64_t)a3, "adding interval=%@ for entry=%@", (uint8_t *)&v3);
}

void __133__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__constructIntervalTuplesFromEntries_startOfRange_endOfRange_allowOverflow___block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("timestampEnd"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a2, v5, "entry=%@, entry[timestampEnd]=%@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_8();
}

void __107__PLBatteryUIResponseTypeChargingStateIntervals_Utilities__getChargingStateIntervals_forGraphIntervalType___block_invoke_cold_1(__int16 *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "Unrecognized graphIntervalType=%d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_6();
}

@end
