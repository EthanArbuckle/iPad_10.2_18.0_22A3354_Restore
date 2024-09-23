@implementation PLUsageTrackingAgent

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLUsageTrackingAgent;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)defaults
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventPointDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventForwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventBackwardDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryEventIntervalDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("UsageTime");
  +[PLUsageTrackingAgent entryEventIntervalDefinitionUsageTime](PLUsageTrackingAgent, "entryEventIntervalDefinitionUsageTime");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventIntervalDefinitionUsageTime
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80330];
  v15[0] = *MEMORY[0x1E0D80318];
  v15[1] = v2;
  v16[0] = &unk_1E8652E20;
  v16[1] = MEMORY[0x1E0C9AAB0];
  v15[2] = *MEMORY[0x1E0D80250];
  v16[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x1E0D802F0];
  v13[0] = CFSTR("timestampEnd");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_DateFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commonTypeDict_StringFormat_withBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v7;
  v13[2] = CFSTR("screenTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "commonTypeDict_IntegerFormat");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)entryEventNoneDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (PLUsageTrackingAgent)init
{
  PLUsageTrackingAgent *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLUsageTrackingAgent;
    self = -[PLAgent init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)logEventIntervalUsageTime
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
  {
    v3 = (void *)objc_opt_new();
    -[PLUsageTrackingAgent setUsageReporter:](self, "setUsageReporter:", v3);

    -[PLUsageTrackingAgent usageReporter](self, "usageReporter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v5 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
      v6 = MEMORY[0x1E0C809B0];
      if (v5)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = objc_opt_class();
        if (qword_1ED886930 != -1)
          dispatch_once(&qword_1ED886930, block);
        if (_MergedGlobals_91)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logging UsageTracking reports"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLUsageTrackingAgent logEventIntervalUsageTime]");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 128);

          PLLogCommon();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v30 = v7;
            _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      v13 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "components:fromDate:", 60, v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setValue:forComponent:", objc_msgSend(v15, "valueForComponent:", 32) + 1, 32);
      objc_msgSend(v14, "dateFromComponents:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v16, "dateByAddingTimeInterval:", -86400.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:", v18, v16);

      -[PLUsageTrackingAgent usageReporter](self, "usageReporter");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v6;
      v27[1] = 3221225472;
      v27[2] = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_30;
      v27[3] = &unk_1E857B770;
      v27[4] = self;
      objc_msgSend(v20, "fetchReportsDuringInterval:partitionInterval:completionHandler:", v19, v27, 3600.0);

      objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v16);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v21, "dateByAddingTimeInterval:", -864000.0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v22, "initWithStartDate:endDate:", v23, v21);

      -[PLUsageTrackingAgent usageReporter](self, "usageReporter");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_34;
      v26[3] = &unk_1E857B770;
      v26[4] = self;
      objc_msgSend(v25, "fetchReportsDuringInterval:partitionInterval:completionHandler:", v24, v26, 86400.0);

    }
  }
}

uint64_t __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_91 = result;
  return result;
}

void __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_30(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v13;
      if (qword_1ED886938 != -1)
        dispatch_once(&qword_1ED886938, &block);
      if (byte_1ED886929)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12, block, v21, v22, v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLUsageTrackingAgent logEventIntervalUsageTime]_block_invoke");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 144);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logEntriesFromUsageReports:", v9);
  }

}

uint64_t __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED886929 = result;
  return result;
}

void __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_34(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t block;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  uint64_t v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v13 = objc_opt_class();
      block = MEMORY[0x1E0C809B0];
      v21 = 3221225472;
      v22 = __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2_35;
      v23 = &__block_descriptor_40_e5_v8__0lu32l8;
      v24 = v13;
      if (qword_1ED886940 != -1)
        dispatch_once(&qword_1ED886940, &block);
      if (byte_1ED88692A)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v12, block, v21, v22, v23, v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLUsageTrackingAgent logEventIntervalUsageTime]_block_invoke");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 156);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v14;
          _os_log_debug_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "logEntriesFromUsageReports:", v9);
  }

}

uint64_t __49__PLUsageTrackingAgent_logEventIntervalUsageTime__block_invoke_2_35(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88692A = result;
  return result;
}

- (void)logEntriesFromUsageReports:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD block[5];
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
    v7 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = objc_opt_class();
      if (qword_1ED886948 != -1)
        dispatch_once(&qword_1ED886948, block);
      if (byte_1ED88692B)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Creating entries from UT"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastPathComponent");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLUsageTrackingAgent logEntriesFromUsageReports:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 167);

        PLLogCommon();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v8;
          _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    v14 = (void *)objc_opt_new();
    +[PLOperator entryKeyForType:andName:](PLUsageTrackingAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80380], CFSTR("UsageTime"));
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_39;
    v25[3] = &unk_1E857B7E8;
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v26 = v15;
    v16 = v14;
    v27 = v16;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v25);
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v24[0] = v7;
      v24[1] = 3221225472;
      v24[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_4;
      v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v24[4] = objc_opt_class();
      if (qword_1ED886950 != -1)
        dispatch_once(&qword_1ED886950, v24);
      if (byte_1ED88692C)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Logging %lu UT reports"), objc_msgSend(v16, "count"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLUsageTrackingAgent.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLUsageTrackingAgent logEntriesFromUsageReports:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v20, v21, 198);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v32 = v17;
          _os_log_debug_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    if (objc_msgSend(v16, "count"))
    {
      v29 = v15;
      v30 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLOperator logEntries:withGroupID:](self, "logEntries:withGroupID:", v23, v15);

    }
  }

}

uint64_t __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88692B = result;
  return result;
}

void __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_39(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = a2;
  objc_msgSend(v13, "categoryUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    objc_msgSend(v13, "interval");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertFromSystemToMonotonic");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "interval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertFromSystemToMonotonic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_2;
    v14[3] = &unk_1E857B7C0;
    v15 = *(id *)(a1 + 32);
    v16 = v7;
    v17 = v10;
    v18 = *(id *)(a1 + 40);
    v11 = v10;
    v12 = v7;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v14);

  }
}

void __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_2(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a2, "applicationUsage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "count");
    v4 = v6;
    if (v5)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_3;
      v7[3] = &unk_1E857B798;
      v8 = a1[4];
      v9 = a1[5];
      v10 = a1[6];
      v11 = a1[7];
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

      v4 = v6;
    }
  }

}

void __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "applicationUsageByBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKeyPath:", CFSTR("@sum.self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  if (v6 != 0.0)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v7, "setEntryDate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("timestampEnd"));
    objc_msgSend(v9, "canonicalBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("bundleID"));

    objc_msgSend(v7, "setObject:forKeyedSubscript:", v5, CFSTR("screenTime"));
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v7);

  }
}

uint64_t __51__PLUsageTrackingAgent_logEntriesFromUsageReports___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED88692C = result;
  return result;
}

- (USUsageReporter)usageReporter
{
  return (USUsageReporter *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUsageReporter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageReporter, 0);
}

@end
