@implementation PLFileStats

+ (int64_t)fileSizeAtPath:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  v3 = (void *)MEMORY[0x1E0CB3620];
  v4 = a3;
  objc_msgSend(v3, "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesOfItemAtPath:error:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    && (v7 = *MEMORY[0x1E0CB2AF0],
        objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AF0]),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "longLongValue");

  }
  else
  {
    v10 = -1;
  }

  return v10;
}

+ (id)statsForFile:(id)a3
{
  void *v3;
  id v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend((id)objc_opt_class(), "fileSizeAtPath:", v4);

  objc_msgSend(v6, "numberWithLongLong:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("FileSize"));
  objc_msgSend((id)objc_opt_class(), "tableCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("TableCounts"));
  objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("CRKey"), CFSTR("PLConfigAgent_EventNone_Config"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("CRKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("CRKey"));
  objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("Build"), CFSTR("PLConfigAgent_EventNone_Config"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("Build"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, CFSTR("Build"));
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "totalLogDuration");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, CFSTR("TotalLogDuration"));
  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend((id)objc_opt_class(), "logEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSince1970");
  objc_msgSend(v18, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, CFSTR("LastBatteryTimestamp"));
  objc_msgSend((id)objc_opt_class(), "cpuTimeForProcess:", CFSTR("PerfPowerServicesExtended"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, CFSTR("TotalPowerlogCPUTime"));

  return v5;
}

+ (id)logStartDate
{
  const __CFString *v2;

  if (+[PLUtilities hasBattery](PLUtilities, "hasBattery"))
    v2 = CFSTR("PLBatteryAgent_EventBackward_Battery");
  else
    v2 = CFSTR("PLNetworkAgent_EventBackward_CumulativeNetworkUsage");
  return (id)objc_msgSend((id)objc_opt_class(), "logStartDateFromTable:", v2);
}

+ (id)logEndDate
{
  const __CFString *v2;

  if (+[PLUtilities hasBattery](PLUtilities, "hasBattery"))
    v2 = CFSTR("PLBatteryAgent_EventBackward_Battery");
  else
    v2 = CFSTR("PLNetworkAgent_EventBackward_CumulativeNetworkUsage");
  return (id)objc_msgSend((id)objc_opt_class(), "logEndDateFromTable:", v2);
}

+ (double)totalLogDuration
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  objc_msgSend((id)objc_opt_class(), "logStartDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "logEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  v5 = 0.0;
  if (v2 && v3)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v2);
    if (v6 >= 0.0)
      v5 = v6;
    else
      v5 = 0.0;
  }

  return v5;
}

+ (id)logStartDateFromTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("min(timestamp)"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("min(timestamp)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)logEndDateFromTable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("max(timestamp)"), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("max(timestamp)"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v6, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (double)totalLogDurationFromTable:(id)a3 where:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("max(timestamp)-min(timestamp)"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("max(timestamp)-min(timestamp)"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "doubleValue");
    if (v11 >= 0.0)
      v10 = v11;
    else
      v10 = 0.0;
  }

  return v10;
}

+ (id)cpuTimeForProcess:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT sum(cpu_seconds) FROM(SELECT case when diff_raw < -10 then value else diff_raw end as cpu_seconds FROM(SELECT *, value - prevVal as diff_raw FROM(SELECT ID, ProcessName, value,(SELECT t2.value FROM PLProcessMonitorAgent_EventBackward_ProcessMonitor_Dynamic t2 where t2.ID < t1.ID and ProcessName == \"%@\" order by t2.ID desc limit 1) as prevVal FROM PLProcessMonitorAgent_EventBackward_ProcessMonitor_Dynamic t1 WHERE ProcessName == \"%@\")) WHERE cpu_seconds IS NOT NULL)"), a3, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performQuery:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sum(cpu_seconds)"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)tableCounts
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("name"), CFSTR("sqlite_master"), CFSTR("type='table'"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6), "objectForKeyedSubscript:", CFSTR("name"), v12);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "rangeOfString:", CFSTR("PL")))
        {
          objc_msgSend((id)objc_opt_class(), "select:from:where:", CFSTR("Count(*)"), v7, 0);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "firstObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Count(*)"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v7);

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  return v12;
}

+ (id)select:(id)a3 from:(id)a4 where:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" WHERE %@"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = &stru_1E6A56538;
  }

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT %@ FROM '%@'%@;"), v7, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "performQuery:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
