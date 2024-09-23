@implementation PLBatteryUIResponseTypeUISOCLevel

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
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
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
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
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
  -[PLBatteryUIResponseTypeUISOCLevel setStart:](self, "setStart:", v11);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel setEnd:](self, "setEnd:", v12);

  -[PLBatteryUIResponseTypeUISOCLevel start](self, "start");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel end](self, "end");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSince1970");
  v16 = v15;
  objc_msgSend(v14, "timeIntervalSince1970");
  v18 = v17 - v16;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bucket"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "doubleValue");
  -[PLBatteryUIResponseTypeUISOCLevel setBucketSize:](self, "setBucketSize:");

  v20 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v21, 5);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Level"), &unk_1EA1C0410, 3);
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BatteryUI"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel responderService](self, "responderService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "storage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v22;
  v40[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lastEntryForKey:withComparisons:isSingleton:", v24, v27, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel setLastBattEntry:](self, "setLastBattEntry:", v28);

  -[PLBatteryUIResponseTypeUISOCLevel responderService](self, "responderService");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "storage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "entriesForKey:inTimeRange:withFilters:", v24, 0, v16, v18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel setBattEntries:](self, "setBattEntries:", v31);

  -[PLBatteryUIResponseTypeUISOCLevel responderService](self, "responderService");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "storage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLDuetService_EventForward_BatterySaverMode"), v34, 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel setLastLPMEntry:](self, "setLastLPMEntry:", v35);

  -[PLBatteryUIResponseTypeUISOCLevel responderService](self, "responderService");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "storage");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "entriesForKey:inTimeRange:withFilters:", CFSTR("PLDuetService_EventForward_BatterySaverMode"), 0, v16, v18);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeUISOCLevel setLpmEntries:](self, "setLpmEntries:", v38);

}

- (void)run
{
  OUTLINED_FUNCTION_5(&dword_1DA9D6000, a2, a3, "Calculating %d battery level buckets", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (id)result
{
  -[PLBatteryUIResponseTypeUISOCLevel setBattEntries:](self, "setBattEntries:", 0);
  -[PLBatteryUIResponseTypeUISOCLevel setLpmEntries:](self, "setLpmEntries:", 0);
  -[PLBatteryUIResponseTypeUISOCLevel setLastLPMEntry:](self, "setLastLPMEntry:", 0);
  -[PLBatteryUIResponseTypeUISOCLevel setLastBattEntry:](self, "setLastBattEntry:", 0);
  return -[PLBatteryUIResponseTypeUISOCLevel resultArray](self, "resultArray");
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

- (BOOL)dateIntervals:(id)a3 containDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  LOBYTE(v8) = 0;
  if (v5 && v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v9 = v5;
    v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v10 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "containsDate:", v7, (_QWORD)v13) & 1) != 0)
          {
            LOBYTE(v8) = 1;
            goto LABEL_13;
          }
        }
        v8 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_13:

  }
  return v8;
}

- (id)getLPMIntervalsSpanningRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  void *v43;
  NSObject *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v71;
  PLBatteryUIResponseTypeUISOCLevel *v72;
  void *v73;
  void *v74;
  id v75;
  uint8_t v76;
  _BYTE v77[15];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t buf[4];
  _BYTE v83[18];
  __int16 v84;
  double v85;
  __int16 v86;
  double v87;
  __int16 v88;
  void *v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  uint64_t v93;
  _BYTE v94[128];
  uint64_t v95;

  length = a3.length;
  location = a3.location;
  v95 = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:].cold.6(v6, v7, v8);

  v75 = (id)objc_opt_new();
  -[PLBatteryUIResponseTypeUISOCLevel lastLPMEntry](self, "lastLPMEntry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_8;
  -[PLBatteryUIResponseTypeUISOCLevel lastLPMEntry](self, "lastLPMEntry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Value"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.4(v12, v13, v14, v15, v16, v17, v18, v19);

  if ((_DWORD)v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = 1;
  }
  else
  {
LABEL_8:
    v20 = 0;
    v21 = 0;
  }
  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    -[PLBatteryUIResponseTypeUISOCLevel lastLPMEntry](self, "lastLPMEntry");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)v83 = v23;
    *(_WORD *)&v83[8] = 2112;
    *(_QWORD *)&v83[10] = v20;
    v84 = 2048;
    v85 = location;
    v86 = 2048;
    v87 = length;
    _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "lastLPMEntry=%@, startOfInterval=%@, range.location=%f, range.length=%f", buf, 0x2Au);

  }
  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v72 = self;
  -[PLBatteryUIResponseTypeUISOCLevel lpmEntries](self, "lpmEntries");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "reverseObjectEnumerator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = v25;
  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
  if (v27)
  {
    v29 = v27;
    v30 = *(_QWORD *)v79;
    *(_QWORD *)&v28 = 138412290;
    v71 = v28;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v79 != v30)
          objc_enumerationMutation(v26);
        v32 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("Value"), v71);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "BOOLValue");

        PLLogCommon();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v83 = v34;
          *(_WORD *)&v83[4] = 2112;
          *(_QWORD *)&v83[6] = v32;
          _os_log_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_INFO, "LPM Entry: %d %@", buf, 0x12u);
        }

        if ((v21 & 1) == v34)
        {
          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
            -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.3(&v76, v77, v38);
        }
        else
        {
          objc_msgSend(v32, "entryDate");
          v36 = objc_claimAutoreleasedReturnValue();
          v37 = (void *)v36;
          if ((v34 & 1) != 0)
          {
            v21 = 1;
            v38 = v20;
            v20 = v36;
          }
          else
          {
            v39 = -[NSObject compare:](v20, "compare:", v36);

            if (v39 == 1)
            {
              PLLogCommon();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
              {
                objc_msgSend(v32, "entryDate");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryUIResponseTypeUISOCLevel lastLPMEntry](v72, "lastLPMEntry");
                v73 = (void *)objc_claimAutoreleasedReturnValue();
                -[PLBatteryUIResponseTypeUISOCLevel lpmEntries](v72, "lpmEntries");
                v40 = objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413826;
                *(_QWORD *)v83 = v20;
                *(_WORD *)&v83[8] = 2112;
                *(_QWORD *)&v83[10] = v74;
                v84 = 2048;
                v85 = location;
                v86 = 2048;
                v87 = length;
                v88 = 2112;
                v89 = v73;
                v90 = 2112;
                v91 = v32;
                v92 = 2112;
                v41 = (void *)v40;
                v93 = v40;
                _os_log_fault_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_FAULT, "LOOP CASE: startOfInterval=%@ greater than lpmEntry.entryDate=%@, range.location=%f, range.length=%f, lastLPMEntry=%@, lpmEntry=%@, lpmEntries=%@", buf, 0x48u);

              }
            }
            else
            {
              v42 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v32, "entryDate");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v42, "initWithStartDate:endDate:", v20, v43);

              objc_msgSend(v75, "addObject:", v38);
              PLLogCommon();
              v44 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = v71;
                *(_QWORD *)v83 = v38;
                _os_log_debug_impl(&dword_1DA9D6000, v44, OS_LOG_TYPE_DEBUG, "Created LPM interval %@", buf, 0xCu);
              }

              v20 = 0;
              v21 = 0;
            }
          }
        }

      }
      v29 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    }
    while (v29);
  }

  if ((v21 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location + length);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[NSObject compare:](v20, "compare:", v45);

    PLLogCommon();
    v47 = objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v46 == 1)
    {
      if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location + length);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryUIResponseTypeUISOCLevel lastLPMEntry](v72, "lastLPMEntry");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLBatteryUIResponseTypeUISOCLevel lpmEntries](v72, "lpmEntries");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413570;
        *(_QWORD *)v83 = v20;
        *(_WORD *)&v83[8] = 2112;
        *(_QWORD *)&v83[10] = v49;
        v84 = 2048;
        v85 = location;
        v86 = 2048;
        v87 = length;
        v88 = 2112;
        v89 = v50;
        v90 = 2112;
        v91 = v51;
        _os_log_fault_impl(&dword_1DA9D6000, v48, OS_LOG_TYPE_FAULT, "TAIL CASE: startOfInterval=%@ greater than endDate=%@, range.location=%f, range.length=%f, lastLPMEntry=%@, lpmEntries=%@", buf, 0x3Eu);

      }
      goto LABEL_42;
    }
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:].cold.3(v48, v52, v53);

    v54 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location + length);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = (void *)objc_msgSend(v54, "initWithStartDate:endDate:", v20, v55);

    objc_msgSend(v75, "addObject:", v56);
    PLLogCommon();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:].cold.2((uint64_t)v56, v57, v58, v59, v60, v61, v62, v63);

  }
  PLLogCommon();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIResponseTypeUISOCLevel getLPMIntervalsSpanningRange:].cold.1((uint64_t)v75, v48, v64, v65, v66, v67, v68, v69);
LABEL_42:

  return v75;
}

- (int)criticalLevel
{
  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    return 10;
  else
    return 20;
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

- (double)bucketSize
{
  return self->_bucketSize;
}

- (void)setBucketSize:(double)a3
{
  self->_bucketSize = a3;
}

- (NSArray)battEntries
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBattEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntry)lastBattEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLastBattEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSArray)lpmEntries
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setLpmEntries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (PLEntry)lastLPMEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastLPMEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSArray)resultArray
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setResultArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultArray, 0);
  objc_storeStrong((id *)&self->_lastLPMEntry, 0);
  objc_storeStrong((id *)&self->_lpmEntries, 0);
  objc_storeStrong((id *)&self->_lastBattEntry, 0);
  objc_storeStrong((id *)&self->_battEntries, 0);
  objc_storeStrong((id *)&self->_end, 0);
  objc_storeStrong((id *)&self->_start, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "LPM intervals: %@", a5, a6, a7, a8, 2u);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a2, a3, "Created LPM interval %@", a5, a6, a7, a8, 2u);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a1, a3, "Closing open LPM interval", v3);
  OUTLINED_FUNCTION_6();
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a1, a3, "Creating LPM intervals", v3);
  OUTLINED_FUNCTION_6();
}

@end
