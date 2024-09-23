@implementation PLBatteryUIService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBatteryUIService;
  objc_msgSendSuper2(&v2, sel_load);
}

- (PLBatteryUIService)init
{
  PLBatteryUIService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLBatteryUIService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  __CFNotificationCenter *DarwinNotifyCenter;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback, CFSTR("com.apple.powerlogd.PLBatteryUIService.batteryBreakdown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v4 = objc_alloc(MEMORY[0x1E0D80098]);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PLBatteryUIService_initOperatorDependancies__block_invoke;
    v9[3] = &unk_1EA16D1A8;
    v9[4] = self;
    v6 = (void *)objc_msgSend(v4, "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D72C0, v9);
    -[PLBatteryUIService setBatteryBreakdownResponder:](self, "setBatteryBreakdownResponder:", v6);

    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __46__PLBatteryUIService_initOperatorDependancies__block_invoke_33;
    v8[3] = &unk_1EA16D1A8;
    v8[4] = self;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1D72E8, v8);
    -[PLBatteryUIService setModelsResponder:](self, "setModelsResponder:", v7);

  }
}

id __46__PLBatteryUIService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v7;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("batteryBreakdownResponder: payload=%@"), v6, block, v17, v18, v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 100);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "batteryBreakdownAndGraphWithPayload:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

id __46__PLBatteryUIService_initOperatorDependancies__block_invoke_33(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t block;
  uint64_t v17;
  uint64_t (*v18)(uint64_t);
  void *v19;
  uint64_t v20;

  v6 = a5;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2_34;
    v19 = &__block_descriptor_40_e5_v8__0lu32l8;
    v20 = v7;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("modelsResponder: payload=%@"), v6, block, v17, v18, v19, v20);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService initOperatorDependancies]_block_invoke");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 106);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "modelsWithPayload:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __46__PLBatteryUIService_initOperatorDependancies__block_invoke_2_34(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

- (_PLTimeIntervalRange)getlastDayRangeWithNow:(id)a3 withNowSystem:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  NSObject *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  unint64_t v35;
  uint64_t v36;
  _PLTimeIntervalRange result;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 60, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "valueForComponent:", 32);
  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "dateFromComponents:", v6);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v31 = v4;
    v32 = 2112;
    v33 = v29;
    v34 = 2048;
    v35 = v7;
    _os_log_debug_impl(&dword_1DA9D6000, v8, OS_LOG_TYPE_DEBUG, "Date: %@ -> %@ -> %lu", buf, 0x20u);

  }
  PLLogCommon();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:].cold.2();

  v10 = (unint64_t)((double)v7 - fmod((double)v7, 3.0) + 3.0);
  PLLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:].cold.2();

  objc_msgSend(v6, "setValue:forComponent:", v10, 32);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:].cold.1();

  objc_msgSend(v12, "convertFromSystemToMonotonic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingTimeInterval:", -86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14;
  objc_msgSend(v15, "timeIntervalSince1970");
  v18 = v17;
  objc_msgSend(v16, "timeIntervalSince1970");
  v20 = v19;

  v21 = v20 - v18;
  PLLogCommon();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v18 + v21);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Start: %@, End %@"), v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138412290;
    v31 = v26;
    _os_log_impl(&dword_1DA9D6000, v22, OS_LOG_TYPE_INFO, "lastDayRange: %@", buf, 0xCu);

  }
  v27 = v18;
  v28 = v21;
  result.length = v28;
  result.location = v27;
  return result;
}

- (_PLTimeIntervalRange)getlastXDayRangeWithNow:(id)a3 withNowSystem:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;
  _PLTimeIntervalRange result;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertFromSystemToMonotonic");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -864000.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(v7, "timeIntervalSince1970");
  v10 = v9;
  objc_msgSend(v8, "timeIntervalSince1970");
  v12 = v11;

  PLLogCommon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v23 = v4;
    v24 = 2112;
    v25 = v5;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_1DA9D6000, v13, OS_LOG_TYPE_DEBUG, "Next system midnight %@ -> %@ = monotonic %@", buf, 0x20u);
  }
  v14 = v12 - v10;

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v10 + v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("Start: %@, End %@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138412290;
    v23 = v19;
    _os_log_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_INFO, "lastXDayRange: %@", buf, 0xCu);

  }
  v20 = v10;
  v21 = v14;
  result.length = v21;
  result.location = v20;
  return result;
}

- (_PLTimeIntervalRange)getDataRangeWithNow:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;
  _PLTimeIntervalRange result;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D80368];
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UsageTime"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D7FF48], "entryKeyForType:andName:", v5, *MEMORY[0x1E0D80190]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstEntryForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "entryDate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService getDataRangeWithNow:].cold.4();

  }
  else
  {
    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService getDataRangeWithNow:].cold.3();

    v9 = v4;
  }
  -[PLOperator storage](self, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "firstEntryForKey:", v35);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "entryDate");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService getDataRangeWithNow:].cold.2();

  }
  else
  {
    PLLogCommon();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService getDataRangeWithNow:].cold.1();

    v14 = v4;
  }
  objc_msgSend(v14, "laterDate:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(v17, "timeIntervalSince1970");
  v20 = v19;
  objc_msgSend(v18, "timeIntervalSince1970");
  v22 = v21;

  v23 = v22 - v20;
  PLLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    v25 = (void *)MEMORY[0x1E0CB3940];
    v34 = v8;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v20);
    v26 = v13;
    v27 = v9;
    v28 = v6;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v20 + v23);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Start: %@, End %@"), v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v34;
    v6 = v28;
    v9 = v27;
    v13 = v26;
    *(_DWORD *)buf = 138412290;
    v37 = v31;
    _os_log_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_INFO, "dataRange: %@", buf, 0xCu);

  }
  v32 = v20;
  v33 = v23;
  result.length = v33;
  result.location = v32;
  return result;
}

- (id)batteryBreakdownAndGraphWithPayload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
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
  NSObject *v52;
  int v53;
  id v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  _BOOL4 v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  uint64_t v64;
  void *v65;
  void *v66;
  id v67;
  uint8_t buf[4];
  void *v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PLBatteryUIService demoMode](self, "demoMode"))
  {
    -[PLBatteryUIService demoModePath](self, "demoModePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v5;
      _os_log_impl(&dword_1DA9D6000, v6, OS_LOG_TYPE_INFO, "BUI Demo mode enabled, using plist at %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v9 = objc_msgSend(v7, "mutableCopy");
    else
      v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertFromMonotonicToSystem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v69 = v8;
      _os_log_impl(&dword_1DA9D6000, v10, OS_LOG_TYPE_INFO, "Received xpc request at system time: %@", buf, 0xCu);
    }

    PLLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.6();

    -[PLBatteryUIService getlastDayRangeWithNow:withNowSystem:](self, "getlastDayRangeWithNow:withNowSystem:", v5, v8);
    v13 = v12;
    v15 = v14;
    -[PLBatteryUIService getlastXDayRangeWithNow:withNowSystem:](self, "getlastXDayRangeWithNow:withNowSystem:", v5, v8);
    v17 = v16;
    v19 = v18;
    -[PLBatteryUIService getDataRangeWithNow:](self, "getDataRangeWithNow:", v5);
    v21 = v20;
    v23 = v22;
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13 + v15);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "convertFromMonotonicToSystem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "timeIntervalSince1970");
    v27 = v26;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", &unk_1EA1DA5B8, CFSTR("PLBatteryUIXPCVersionKey"));
    -[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:](self, "batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:", v4, v13, v15, v17, v19, v21, v23);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v28, CFSTR("Breakdown"));

    v66 = v4;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTypeKey"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "intValue");
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("Breakdown"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIService modelsForGraphWithDayRange:withXDayRange:withDataRange:withQueryType:andBatteryBreakdown:](self, "modelsForGraphWithDayRange:withXDayRange:withDataRange:withQueryType:andBatteryBreakdown:", v30, v31, v13, v15, v17, v19, v21, v23);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v32, CFSTR("Graph"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v33, CFSTR("endOfDay"));

    objc_msgSend(v8, "timeIntervalSince1970");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v34, CFSTR("PLBatteryUIQueryTime"));

    -[PLBatteryUIService getLastChargeData](self, "getLastChargeData");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
      -[NSObject setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v35, CFSTR("PLBatteryUILastChargeKey"));
    v65 = (void *)v35;
    PLLogCommon();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v13 + v15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "stringWithFormat:", CFSTR("Start: %@, End %@"), v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 138412290;
      v69 = v40;
      _os_log_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_INFO, "Computed batteryBreakdown response, day range: %@", buf, 0xCu);

    }
    PLLogCommon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v41, OS_LOG_TYPE_INFO, "Writing response to file", buf, 2u);
    }

    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", v43);

    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("requestingService"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("plistCopyDestination"));
    v64 = objc_claimAutoreleasedReturnValue();
    +[PLUtilities containerPath](PLUtilities, "containerPath");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BatteryUI%@"), v44);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v46, 1);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "URLByAppendingPathComponent:", v47);
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v49, "URLByAppendingPathExtension:", CFSTR("plist"));
    }
    else
    {
      v50 = (void *)MEMORY[0x1E0C99E98];
      +[PLUtilities containerPath](PLUtilities, "containerPath");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/BatteryUI.plist"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "fileURLWithPath:", v49);
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogCommon();
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.5();

    v67 = 0;
    v53 = -[NSObject writeToURL:error:](v9, "writeToURL:error:", v51, &v67);
    v54 = v67;
    if (v53)
    {
      v55 = v46;
      objc_msgSend(v51, "path");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLUtilities setMobileOwnerForFile:](PLUtilities, "setMobileOwnerForFile:", v56);

      PLLogCommon();
      v57 = objc_claimAutoreleasedReturnValue();
      v46 = v55;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.3();
      v58 = (void *)v64;
    }
    else
    {
      PLLogCommon();
      v57 = objc_claimAutoreleasedReturnValue();
      v58 = (void *)v64;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
        -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.4();
    }

    if (v44 && objc_msgSend(v44, "containsString:", CFSTR("Upgrade")))
      -[PLBatteryUIService removeExcessUpgradePlistFiles](self, "removeExcessUpgradePlistFiles");
    if (v58)
    {
      v59 = +[PLUtilities PLCopyItemsFromPath:toPath:](PLUtilities, "PLCopyItemsFromPath:toPath:", v46, v58);
      PLLogCommon();
      v60 = objc_claimAutoreleasedReturnValue();
      v61 = v60;
      if (v59)
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.1();
      }
      else
      {
        if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:].cold.2();

        v61 = v9;
        v9 = 0;
      }
      v62 = v65;

    }
    else
    {
      v62 = v65;
    }

    v4 = v66;
  }

  return v9;
}

- (id)batteryBreakdownWithPayload:(id)a3 withDayRange:(_PLTimeIntervalRange)a4 withXDayRange:(_PLTimeIntervalRange)a5 withDataRange:(_PLTimeIntervalRange)a6
{
  double length;
  double location;
  double v8;
  double v9;
  double v10;
  double v11;
  id v13;
  double v14;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  NSObject *v62;
  void *v63;
  double v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  NSObject *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  NSObject *v94;
  double v96;
  double v97;
  double v98;
  double v99;
  _QWORD v100[5];
  _QWORD block[5];
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  void *v105;
  uint64_t v106;

  length = a6.length;
  location = a6.location;
  v8 = a5.length;
  v9 = a5.location;
  v10 = a4.length;
  v11 = a4.location;
  v106 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  -[PLBatteryUIService incrementAggdKey](self, "incrementAggdKey");
  v14 = v11 + v10;
  if (v11 < location && v14 > location)
  {
    v19 = location + length;
LABEL_14:
    if (v11 >= location)
      v17 = v11;
    else
      v17 = location;
    if (v14 < v19)
      v19 = v11 + v10;
    v18 = v19 - v17;
    goto LABEL_20;
  }
  v19 = location + length;
  if (location < v11 && v19 > v11)
    goto LABEL_14;
  v17 = 0.0;
  if (v11 != location || v10 <= 0.0)
  {
    v18 = 0.0;
    goto LABEL_20;
  }
  v18 = 0.0;
  if (length > 0.0)
    goto LABEL_14;
LABEL_20:
  v20 = v9 + v8;
  v97 = v8;
  v98 = v11 + v10;
  v96 = v10;
  if (v9 >= location || v20 <= location)
  {
    v21 = location + length;
    if (location >= v9 || v21 <= v9)
    {
      v22 = 0.0;
      if (v9 != location || v8 <= 0.0)
      {
        v23 = 0.0;
        goto LABEL_34;
      }
      v23 = 0.0;
      if (length <= 0.0)
        goto LABEL_34;
    }
  }
  else
  {
    v21 = location + length;
  }
  if (v9 >= location)
    v24 = v9;
  else
    v24 = location;
  if (v20 < v21)
    v21 = v20;
  v22 = v24;
  v23 = v21 - v24;
LABEL_34:
  v99 = v20;
  PLLogCommon();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v11);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v98);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("Start: %@, End %@"), v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = (void *)MEMORY[0x1E0C99D68];
    v32 = v29;
    objc_msgSend(v31, "dateWithTimeIntervalSince1970:", v17);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v17 + v18);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("Start: %@, End %@"), v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138412546;
    v103 = v29;
    v104 = 2112;
    v105 = v35;
    _os_log_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_INFO, "Day: %@ -> %@", buf, 0x16u);

  }
  PLLogCommon();
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v9);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v99);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("Start: %@, End %@"), v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = (void *)MEMORY[0x1E0CB3940];
    v42 = (void *)MEMORY[0x1E0C99D68];
    v43 = v40;
    objc_msgSend(v42, "dateWithTimeIntervalSince1970:", v22);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22 + v23);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringWithFormat:", CFSTR("Start: %@, End %@"), v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)buf = 138412546;
    v103 = v40;
    v104 = 2112;
    v105 = v46;
    _os_log_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_INFO, "xDay: %@ -> %@", buf, 0x16u);

  }
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTypeKey"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_msgSend(v47, "intValue");
  v49 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v50 = MEMORY[0x1E0C809B0];
  if (v49)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce != -1)
      dispatch_once(&batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce, block);
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryType=%i"), v48);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "lastPathComponent");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:]");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "logMessage:fromFile:fromFunction:fromLineNumber:", v51, v54, v55, 296);

      PLLogCommon();
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v58, OS_LOG_TYPE_INFO, "Computing last day breakdown", buf, 2u);
  }

  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", v48, v11, v96, location, length, 3600.0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v59, CFSTR("PLBatteryUIQueryRangeDayKey"));
  PLLogCommon();
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v60, OS_LOG_TYPE_INFO, "Computing week breakdown", buf, 2u);
  }

  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", v48, v9, v97, location, length, 3600.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v61, CFSTR("PLBatteryUIQueryRangeWeekKey"));

  PLLogCommon();
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v62, OS_LOG_TYPE_INFO, "Computing day breakdown for taps", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v98);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService totalSumEnergyRatioCutOff](self, "totalSumEnergyRatioCutOff");
  -[PLBatteryUIService generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:](self, "generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:", 3600, 24, v63, v48, v64 / 24.0, location, length);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v65, CFSTR("PLBatteryUIQueryRangeDayTapKey"));

  PLLogCommon();
  v66 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v66, OS_LOG_TYPE_INFO, "Computing week breakdown for taps", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v99);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService totalSumEnergyRatioCutOff](self, "totalSumEnergyRatioCutOff");
  -[PLBatteryUIService generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:](self, "generateTapBucketsForBucketSize:withNumberOfBuckets:withNowTime:withDrainThreshold:withQueryType:withDataRange:", 86400, 10, v67, v48);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v68, CFSTR("PLBatteryUIQueryRangeWeekTapKey"));

  PLLogCommon();
  v69 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v69, OS_LOG_TYPE_INFO, "Computing suggestions", buf, 2u);
  }

  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService suggestionsWithEnergyEntries:](self, "suggestionsWithEnergyEntries:", v70);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v71, CFSTR("PLBatteryUISuggestionArrayKey"));

  v72 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "convertFromMonotonicToSystem");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "nearestMidnightBeforeDate:", v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22 + v23);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "convertFromMonotonicToSystem");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "nearestMidnightAfterDate:", v78);
  v79 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v79, "timeIntervalSinceDate:", v75);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setObject:forKeyedSubscript:", v80, CFSTR("PLBatteryUIDataDurationKey"));

  PLLogCommon();
  v81 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:].cold.2(v81, v82, v83, v84, v85, v86, v87, v88);

  -[PLBatteryBreakdownService clearState](self, "clearState");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v100[0] = v50;
    v100[1] = 3221225472;
    v100[2] = __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke_91;
    v100[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v100[4] = objc_opt_class();
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce_89 != -1)
      dispatch_once(&batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__defaultOnce_89, v100);
    if (batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled_90)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("batteryBreakdown=%@"), v57);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "lastPathComponent");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService batteryBreakdownWithPayload:withDayRange:withXDayRange:withDataRange:]");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "logMessage:fromFile:fromFunction:fromLineNumber:", v89, v92, v93, 343);

      PLLogCommon();
      v94 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

  return v57;
}

uint64_t __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled = result;
  return result;
}

uint64_t __91__PLBatteryUIService_batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange___block_invoke_91(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload_withDayRange_withXDayRange_withDataRange__classDebugEnabled_90 = result;
  return result;
}

- (id)generateTapBucketsForBucketSize:(int)a3 withNumberOfBuckets:(int)a4 withNowTime:(id)a5 withDrainThreshold:(double)a6 withQueryType:(int)a7 withDataRange:(_PLTimeIntervalRange)a8
{
  double length;
  double location;
  id v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
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
  void *v29;
  void *v30;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  length = a8.length;
  location = a8.location;
  v45 = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = (void *)objc_opt_new();
  if (a4 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v32 = v14;
    do
    {
      objc_msgSend(v14, "dateByAddingTimeInterval:", (double)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingTimeInterval:", (double)-a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v18;
      objc_msgSend(v19, "timeIntervalSince1970");
      v22 = v21;
      objc_msgSend(v20, "timeIntervalSince1970");
      v24 = v23;

      v25 = v24 - v22;
      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v34 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v22 + v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Start: %@, End %@"), v33, v28);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v32;
        *(_DWORD *)buf = 67109890;
        v38 = v17;
        v39 = 1024;
        v40 = a4 - 1;
        v41 = 1024;
        v42 = a3;
        v43 = 2112;
        v44 = v35;
        _os_log_debug_impl(&dword_1DA9D6000, v26, OS_LOG_TYPE_DEBUG, "Generating tap bucket %d (of %d) of size %d with lastTapRange %@", buf, 0x1Eu);

      }
      -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:withTotalSumEnergyRatioCutOff:", a7, v22, v25, location, length, 3600.0, a6);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addObject:", v27);

      ++v17;
      v16 -= a3;
    }
    while (a4 != v17);
  }
  objc_msgSend(v15, "reverseObjectEnumerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "allObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (id)modelsWithPayload:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
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
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  _QWORD v33[5];
  _QWORD block[5];
  void *v35;
  _QWORD v36[3];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[5];

  v39[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v4, -604800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  objc_msgSend(v5, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(v6, "timeIntervalSince1970");
  v10 = v9;

  -[PLBatteryUIService dateAndBatteryLevelPointsInRange:](self, "dateAndBatteryLevelPointsInRange:", v8, v10 - v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = CFSTR("ModelGraphName");
  v38[1] = CFSTR("ModelGraphType");
  v39[0] = CFSTR("Battery");
  v39[1] = &unk_1EA1BFA98;
  v38[2] = CFSTR("ModelGraphArray");
  v39[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11 || !objc_msgSend(v11, "count"))
  {
    if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      goto LABEL_17;
    v26 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBatteryUIService_modelsWithPayload___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v26;
    if (modelsWithPayload__defaultOnce != -1)
      dispatch_once(&modelsWithPayload__defaultOnce, block);
    if (!modelsWithPayload__classDebugEnabled)
    {
LABEL_17:
      v18 = 0;
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dateAndBatteryLevelPoints is nil or empty!"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "lastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService modelsWithPayload:]");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v29, v30, 383);

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
    v18 = 0;
    goto LABEL_16;
  }
  v35 = v12;
  v36[0] = CFSTR("ModelData");
  v32 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v13;
  v36[1] = CFSTR("ModelMinDate");
  objc_msgSend(v11, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v15;
  v36[2] = CFSTR("ModelMaxDate");
  objc_msgSend(v11, "lastObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectAtIndexedSubscript:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v12 = v32;
    goto LABEL_19;
  }
  v19 = objc_opt_class();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __40__PLBatteryUIService_modelsWithPayload___block_invoke_116;
  v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v33[4] = v19;
  if (modelsWithPayload__defaultOnce_114 != -1)
    dispatch_once(&modelsWithPayload__defaultOnce_114, v33);
  v12 = v32;
  if (modelsWithPayload__classDebugEnabled_115)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("models=%@"), v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0D7FF98];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "lastPathComponent");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService modelsWithPayload:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 392);

    PLLogCommon();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();
LABEL_16:

  }
LABEL_19:

  return v18;
}

uint64_t __40__PLBatteryUIService_modelsWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelsWithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __40__PLBatteryUIService_modelsWithPayload___block_invoke_116(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  modelsWithPayload__classDebugEnabled_115 = result;
  return result;
}

- (id)dateAndBatteryLevelPointsInRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id obj;
  _QWORD v33[5];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD block[5];
  _QWORD v39[2];
  _BYTE v40[128];
  uint64_t v41;

  length = a3.length;
  location = a3.location;
  v41 = *MEMORY[0x1E0C80C00];
  if (dateAndBatteryLevelPointsInRange__onceToken != -1)
    dispatch_once(&dateAndBatteryLevelPointsInRange__onceToken, &__block_literal_global_2);
  -[PLOperator storage](self, "storage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entriesForKey:inTimeRange:withFilters:", dateAndBatteryLevelPointsInRange__batteryUIEntryKey, 0, location, length);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (dateAndBatteryLevelPointsInRange__defaultOnce != -1)
      dispatch_once(&dateAndBatteryLevelPointsInRange__defaultOnce, block);
    if (dateAndBatteryLevelPointsInRange__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("batteryEntries=%@"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService dateAndBatteryLevelPointsInRange:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 408);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v7;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v35 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v19, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "convertFromMonotonicToSystem");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v39[0] = v21;
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Level"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39[1] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "addObject:", v23);
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v16);
  }

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v24 = objc_opt_class();
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_126;
    v33[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v33[4] = v24;
    if (dateAndBatteryLevelPointsInRange__defaultOnce_124 != -1)
      dispatch_once(&dateAndBatteryLevelPointsInRange__defaultOnce_124, v33);
    if (dateAndBatteryLevelPointsInRange__classDebugEnabled_125)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dateAndBatteryLevelPoints=%@"), v14);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "lastPathComponent");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService dateAndBatteryLevelPointsInRange:]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "logMessage:fromFile:fromFunction:fromLineNumber:", v25, v28, v29, 418);

      PLLogCommon();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

  return v14;
}

void __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BatteryUI"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dateAndBatteryLevelPointsInRange__batteryUIEntryKey;
  dateAndBatteryLevelPointsInRange__batteryUIEntryKey = v0;

}

uint64_t __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dateAndBatteryLevelPointsInRange__classDebugEnabled = result;
  return result;
}

uint64_t __55__PLBatteryUIService_dateAndBatteryLevelPointsInRange___block_invoke_126(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dateAndBatteryLevelPointsInRange__classDebugEnabled_125 = result;
  return result;
}

- (void)incrementAggdKey
{
  JUMPOUT(0x1DF0A3E7CLL);
}

- (void)testUIQuery
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t block;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  uint64_t v16;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1EA1BFAB0, CFSTR("PLBatteryUIQueryTypeKey"));
  -[PLBatteryUIService batteryBreakdownAndGraphWithPayload:](self, "batteryBreakdownAndGraphWithPayload:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v5 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __33__PLBatteryUIService_testUIQuery__block_invoke;
    v15 = &__block_descriptor_40_e5_v8__0lu32l8;
    v16 = v5;
    if (testUIQuery_defaultOnce != -1)
      dispatch_once(&testUIQuery_defaultOnce, &block);
    if (testUIQuery_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Response %@"), v4, block, v13, v14, v15, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBatteryUIService.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryUIService testUIQuery]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 482);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

uint64_t __33__PLBatteryUIService_testUIQuery__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  testUIQuery_classDebugEnabled = result;
  return result;
}

- (BOOL)demoMode
{
  BOOL result;

  if (demoMode_onceToken != -1)
    dispatch_once(&demoMode_onceToken, &__block_literal_global_134);
  result = demoMode_val;
  if (demoMode_val)
    return objc_msgSend((id)demoMode_val, "BOOLValue");
  return result;
}

void __30__PLBatteryUIService_demoMode__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = _CFPreferencesCopyValueWithContainer();
  v1 = (void *)demoMode_val;
  demoMode_val = v0;

}

- (id)demoModePath
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;

  if (demoModePath_onceToken != -1)
    dispatch_once(&demoModePath_onceToken, &__block_literal_global_139);
  if (demoModePath_val)
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService demoModePath].cold.1(v2, v3, v4, v5, v6, v7, v8, v9);

    v10 = (__CFString *)(id)demoModePath_val;
  }
  else
  {
    v10 = CFSTR("/var/mobile/bui_demo.plist");
  }
  return v10;
}

void __34__PLBatteryUIService_demoModePath__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = _CFPreferencesCopyValueWithContainer();
  v1 = (void *)demoModePath_val;
  demoModePath_val = v0;

}

- (BOOL)writeOutputDemo
{
  BOOL result;

  if (writeOutputDemo_onceToken != -1)
    dispatch_once(&writeOutputDemo_onceToken, &__block_literal_global_144);
  result = writeOutputDemo_val;
  if (writeOutputDemo_val)
    return objc_msgSend((id)writeOutputDemo_val, "BOOLValue");
  return result;
}

void __37__PLBatteryUIService_writeOutputDemo__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v0 = _CFPreferencesCopyValueWithContainer();
  v1 = (void *)writeOutputDemo_val;
  writeOutputDemo_val = v0;

}

- (id)getLastChargeData
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v2 = (void *)_CFPreferencesCopyValueWithContainer();
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v3 = (void *)_CFPreferencesCopyValueWithContainer();
  v4 = v3;
  if (v2)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5)
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[PLBatteryUIService getLastChargeData].cold.1();
    v6 = 0;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v7, "dateWithTimeIntervalSince1970:");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v2, "intValue");
    if (v9 >= 100)
      v10 = 100;
    else
      v10 = v9;
    if (v10 <= 1)
      v11 = 1;
    else
      v11 = v10;
    v17[0] = CFSTR("PLBatteryUITimestampKey");
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[NSObject convertFromMonotonicToSystem](v8, "convertFromMonotonicToSystem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = CFSTR("PLBatteryUILevelKey");
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)getLPMIntervalsSpanningRange:(_PLTimeIntervalRange)a3
{
  double length;
  double location;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  id v40;
  void *v41;
  void *v42;
  NSObject *v43;
  NSObject *v44;
  id v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint8_t v51;
  _BYTE v52[15];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t buf[4];
  _QWORD v58[2];
  _BYTE v59[128];
  _QWORD v60[3];

  length = a3.length;
  location = a3.location;
  v60[1] = *MEMORY[0x1E0C80C00];
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.5();

  v50 = (id)objc_opt_new();
  v7 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", location);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v8, 5);

  -[PLOperator storage](self, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)v9;
  v60[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLDuetService_EventForward_BatterySaverMode"), v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_8;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("Value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLValue");

  PLLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.4(v14, v15, v16, v17, v18, v19, v20, v21);

  if ((_DWORD)v14)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = 1;
  }
  else
  {
LABEL_8:
    v22 = 0;
    v23 = 0;
  }
  v48 = v12;
  -[PLOperator storage](self, "storage");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "entriesForKey:inTimeRange:withFilters:", CFSTR("PLDuetService_EventForward_BatterySaverMode"), 0, location, length);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v47 = v25;
  objc_msgSend(v25, "reverseObjectEnumerator");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v54 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("Value"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "BOOLValue");

        PLLogCommon();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109378;
          LODWORD(v58[0]) = v33;
          WORD2(v58[0]) = 2112;
          *(_QWORD *)((char *)v58 + 6) = v31;
          _os_log_debug_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEBUG, "LPM Entry: %d %@", buf, 0x12u);
        }

        if ((v23 & 1) == v33)
        {
          PLLogCommon();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.3(&v51, v52, v35);
        }
        else if (v33)
        {
          objc_msgSend(v31, "entryDate");
          v35 = v22;
          v23 = 1;
          v22 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v36 = objc_alloc(MEMORY[0x1E0CB3588]);
          objc_msgSend(v31, "entryDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v36, "initWithStartDate:endDate:", v22, v37);

          objc_msgSend(v50, "addObject:", v35);
          PLLogCommon();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v58[0] = v35;
            _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "Created LPM interval %@", buf, 0xCu);
          }

          v22 = 0;
          v23 = 0;
        }

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    }
    while (v28);
  }

  if ((v23 & 1) != 0)
  {
    PLLogCommon();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.2();

    v40 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location + length);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithStartDate:endDate:", v22, v41);

    objc_msgSend(v50, "addObject:", v42);
    PLLogCommon();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService getLPMIntervalsSpanningRange:].cold.1();

  }
  PLLogCommon();
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v58[0] = v50;
    _os_log_impl(&dword_1DA9D6000, v44, OS_LOG_TYPE_INFO, "LPM intervals: %@", buf, 0xCu);
  }

  v45 = v50;
  return v45;
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

- (id)batteryLevelsAndChargingIntervalsInRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4
{
  double length;
  double location;
  double v6;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t i;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  int v46;
  NSObject *v47;
  double v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  id v77;
  double v78;
  double v79;
  NSObject *v80;
  void *v81;
  NSObject *v82;
  id v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t j;
  void *v89;
  void *v90;
  int v91;
  void *v92;
  _BOOL4 v93;
  void *v94;
  int v95;
  void *v96;
  void *v97;
  void *v98;
  BOOL v99;
  uint64_t v100;
  uint64_t v101;
  BOOL v102;
  uint64_t v103;
  void *v104;
  NSObject *v105;
  unint64_t v106;
  unint64_t v107;
  void *v108;
  void *v109;
  double v110;
  double v111;
  double v112;
  double v113;
  void *v114;
  void *v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  double v119;
  uint64_t v120;
  void *v121;
  void *v122;
  void *v123;
  int v124;
  int v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  int v143;
  int v144;
  void *v145;
  int v146;
  void *v147;
  int v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  _QWORD v162[2];
  _QWORD v163[2];
  _QWORD v164[2];
  uint8_t buf[4];
  _BYTE v166[24];
  _BYTE v167[128];
  char v168[16];
  _QWORD v169[2];
  _QWORD v170[2];
  char v171[24];
  _BYTE v172[128];
  _QWORD v173[5];

  length = a3.length;
  location = a3.location;
  v173[2] = *MEMORY[0x1E0C80C00];
  v6 = a3.location + a3.length;
  if (location < a4.location && v6 > a4.location)
  {
    v11 = a4.location + a4.length;
LABEL_14:
    if (location >= a4.location)
      v9 = location;
    else
      v9 = a4.location;
    if (v6 >= v11)
      v6 = v11;
    v10 = v6 - v9;
    goto LABEL_20;
  }
  v11 = a4.location + a4.length;
  if (a4.location < location && v11 > location)
    goto LABEL_14;
  v9 = 0.0;
  if (location == a4.location && length > 0.0)
  {
    v10 = 0.0;
    if (a4.length > 0.0)
      goto LABEL_14;
  }
  else
  {
    v10 = 0.0;
  }
LABEL_20:
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", location, v11);
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v12, OS_LOG_TYPE_INFO, "Creating battery points and charging intervals", buf, 2u);
  }

  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80370], CFSTR("BatteryUI"));
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_new();
  v145 = (void *)objc_opt_new();
  v15 = objc_alloc(MEMORY[0x1E0D80080]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", location);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "initWithKey:withValue:withComparisonOperation:", CFSTR("timestamp"), v16, 5);

  v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80080]), "initWithKey:withValue:withComparisonOperation:", CFSTR("Level"), &unk_1EA1BFAB0, 3);
  -[PLOperator storage](self, "storage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = (void *)v18;
  v138 = (void *)v17;
  v173[0] = v17;
  v173[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v173, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = (void *)v13;
  objc_msgSend(v19, "lastEntryForKey:withComparisons:isSingleton:", v13, v20, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v136 = v21;
  if (v21)
  {
    objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("IsCharging"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "BOOLValue");

    PLLogCommon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.6(v23, v24, v25, v26, v27, v28, v29, v30);

  }
  else
  {
    v23 = 0;
  }
  -[PLBatteryUIService getLPMIntervalsSpanningRange:](self, "getLPMIntervalsSpanningRange:", location, length);
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "entriesForKey:inTimeRange:withFilters:", v13, 0, v9, v10);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.5(v32, v23, v33);

  if ((unint64_t)objc_msgSend(v32, "count") >= 0x121)
  {
    PLLogCommon();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v166 = 0x4072C00000000000;
      _os_log_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_INFO, "More battery point entries than expected, has PLBatteryAgent_RateLimiterBatteryUI been set to less than default %.f s?", buf, 0xCu);
    }

    if ((unint64_t)objc_msgSend(v32, "count") >= 0x10E1)
    {
      PLLogCommon();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_INFO, "More battery point entries than possible given 20s battery tick rate limit, double check query ranges", buf, 2u);
      }

    }
  }
  v147 = (void *)v14;
  v160 = 0u;
  v161 = 0u;
  v158 = 0u;
  v159 = 0u;
  v140 = v32;
  objc_msgSend(v32, "reverseObjectEnumerator");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v158, v172, 16);
  if (!v37)
  {
    v40 = 0.0;
    goto LABEL_55;
  }
  v38 = v37;
  v39 = *(_QWORD *)v159;
  v40 = 0.0;
  do
  {
    for (i = 0; i != v38; ++i)
    {
      if (*(_QWORD *)v159 != v39)
        objc_enumerationMutation(v36);
      v42 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * i);
      objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("Level"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "intValue");

      if (v44 < 0)
      {
        PLLogCommon();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.4((uint64_t)v171, (uint64_t)v42);
      }
      else
      {
        objc_msgSend(v42, "objectForKeyedSubscript:", CFSTR("IsCharging"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "BOOLValue");

        if ((v23 & 1) == v46)
          continue;
        if (v46)
        {
          objc_msgSend(v42, "entryDate");
          v47 = objc_claimAutoreleasedReturnValue();
          -[NSObject timeIntervalSinceDate:](v47, "timeIntervalSinceDate:", v149);
          v40 = v48;
          LOBYTE(v23) = 1;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v40);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v170[0] = v49;
          v50 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v42, "entryDate");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "timeIntervalSinceDate:", v149);
          objc_msgSend(v50, "numberWithInt:", (int)v52);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v170[1] = v53;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v170, 2);
          v47 = objc_claimAutoreleasedReturnValue();

          PLLogCommon();
          v54 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            -[NSObject objectAtIndexedSubscript:](v47, "objectAtIndexedSubscript:", 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject objectAtIndexedSubscript:](v47, "objectAtIndexedSubscript:", 1);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v166 = v55;
            *(_WORD *)&v166[8] = 2112;
            *(_QWORD *)&v166[10] = v56;
            _os_log_debug_impl(&dword_1DA9D6000, v54, OS_LOG_TYPE_DEBUG, "Created charging interval: [%@ %@]", buf, 0x16u);

          }
          objc_msgSend(v145, "addObject:", v47);
          LOBYTE(v23) = 0;
        }
      }

    }
    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v158, v172, 16);
  }
  while (v38);
LABEL_55:

  v57 = v140;
  if ((v23 & 1) != 0)
  {
    objc_msgSend(v140, "firstObject");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v58;
    if (v58)
    {
      objc_msgSend(v58, "entryDate");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "timeIntervalSinceDate:", v149);
      v62 = v61;

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v40);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v169[0] = v63;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)v62);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v169[1] = v64;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v169, 2);
      v65 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogCommon();
      v66 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.3(v65, v66);

      objc_msgSend(v145, "addObject:", v65);
    }

  }
  v67 = v149;
  PLLogCommon();
  v68 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.2(v68, v69, v70, v71, v72, v73, v74, v75);

  if (objc_msgSend(MEMORY[0x1E0D80020], "isiPad"))
    v76 = 10;
  else
    v76 = 20;
  v148 = v76;
  v143 = -1;
  v144 = 0;
  v146 = -1;
  v135 = v67;
  do
  {
    v77 = v67;
    objc_msgSend(v67, "timeIntervalSince1970");
    v79 = v78;
    PLLogCommon();
    v80 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
    {
      v129 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v79);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v79 + 900.0);
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "stringWithFormat:", CFSTR("Start: %@, End %@"), v130, v131, v135, v136);
      v132 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v166 = v144;
      *(_WORD *)&v166[4] = 2112;
      *(_QWORD *)&v166[6] = v132;
      _os_log_debug_impl(&dword_1DA9D6000, v80, OS_LOG_TYPE_DEBUG, "Calculating battery entries for bucket %d in range %@", buf, 0x12u);

    }
    -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v57, v79, 900.0);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v82 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
      -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:].cold.1((uint64_t)v168, (uint64_t)v81);

    v141 = v81;
    v142 = v77;
    if (objc_msgSend(v81, "count"))
    {
      v150 = (void *)objc_opt_new();
      v154 = 0u;
      v155 = 0u;
      v156 = 0u;
      v157 = 0u;
      v83 = v81;
      v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v154, v167, 16);
      if (v84)
      {
        v85 = v84;
        v86 = 0;
        v87 = *(_QWORD *)v155;
        do
        {
          for (j = 0; j != v85; ++j)
          {
            if (*(_QWORD *)v155 != v87)
              objc_enumerationMutation(v83);
            v89 = *(void **)(*((_QWORD *)&v154 + 1) + 8 * j);
            objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("Level"));
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v91 = objc_msgSend(v90, "intValue");

            if ((v91 & 0x80000000) == 0)
            {
              objc_msgSend(v89, "entryDate");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = -[PLBatteryUIService dateIntervals:containDate:](self, "dateIntervals:containDate:", v152, v92);

              objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("IsCharging"));
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              v95 = objc_msgSend(v94, "BOOLValue");

              objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("Level"));
              v96 = (void *)objc_claimAutoreleasedReturnValue();

              if (v96)
              {
                objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("Level"));
                v97 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v150, "addObject:", v97);

                objc_msgSend(v89, "objectForKeyedSubscript:", CFSTR("Level"));
                v98 = (void *)objc_claimAutoreleasedReturnValue();
                v99 = (int)objc_msgSend(v98, "intValue") <= v148;

                v100 = v86 | 8;
                if (!v95)
                  v100 = v86;
                if (v93)
                  v100 |= 4uLL;
                v101 = v100 | 2;
                v102 = !v99;
              }
              else
              {
                v103 = 9;
                if (!v95)
                  v103 = 1;
                v100 = v103 | v86;
                v101 = v100 | 4;
                v102 = !v93;
              }
              if (v102)
                v86 = v100;
              else
                v86 = v101;
            }
          }
          v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v154, v167, 16);
        }
        while (v85);
      }
      else
      {
        v86 = 0;
      }

      if (objc_msgSend(v150, "count"))
      {
        objc_msgSend(v150, "valueForKeyPath:", CFSTR("@avg.self"));
        v104 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v104 = &unk_1EA1BFAC8;
      }
      if ((int)objc_msgSend(v104, "intValue") >= 101)
      {

        v104 = &unk_1EA1BFAE0;
      }
      if ((objc_msgSend(v104, "intValue") & 0x80000000) != 0)
      {

        v104 = &unk_1EA1BFAB0;
      }

    }
    else
    {
      v86 = 1;
      v104 = &unk_1EA1BFAC8;
    }
    PLLogCommon();
    v105 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v166 = v144;
      *(_WORD *)&v166[4] = 2112;
      *(_QWORD *)&v166[6] = v104;
      *(_WORD *)&v166[14] = 2048;
      *(_QWORD *)&v166[16] = v86;
      _os_log_debug_impl(&dword_1DA9D6000, v105, OS_LOG_TYPE_DEBUG, "i:%d, %@, %lu", buf, 0x1Cu);
    }
    v151 = v104;

    v106 = 0x1E0CB3000;
    v107 = 0x1E0C99000;
    if ((v86 & 1) == 0 && v146 != -1 && (v144 - v146 - 2) <= 3)
    {
      objc_msgSend(v147, "objectAtIndexedSubscript:", v146);
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v108, "objectAtIndexedSubscript:", 0);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "doubleValue");
      v111 = v110;

      objc_msgSend(v151, "doubleValue");
      v113 = v112;
      v107 = 0x1E0C99000uLL;
      objc_msgSend(v147, "objectAtIndexedSubscript:", v146);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "objectAtIndexedSubscript:", 1);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v115, "intValue");

      v106 = 0x1E0CB3000uLL;
      if (v146 + 1 < v144)
      {
        v117 = 0;
        v118 = v86 & v116;
        v119 = (v113 - v111) / (double)(v144 - v146);
        do
        {
          v120 = v146 + 1 + v117++;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(v111 + v119 * (double)(int)v117));
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          v164[0] = v121;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v118);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v164[1] = v122;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v164, 2);
          v123 = (void *)objc_claimAutoreleasedReturnValue();

          v106 = 0x1E0CB3000uLL;
          objc_msgSend(v147, "setObject:atIndexedSubscript:", v123, v120);

          v107 = 0x1E0C99000uLL;
        }
        while (v143 - v146 != (_DWORD)v117);
      }
    }
    v124 = v144;
    if ((v86 & 1) != 0)
      v125 = v146;
    else
      v125 = v144;
    v146 = v125;
    objc_msgSend(*(id *)(v106 + 2024), "numberWithInt:", objc_msgSend(v151, "intValue"));
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v163[0] = v126;
    objc_msgSend(*(id *)(v106 + 2024), "numberWithUnsignedInteger:", v86);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    v163[1] = v127;
    objc_msgSend(*(id *)(v107 + 3360), "arrayWithObjects:count:", v163, 2);
    v128 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v147, "addObject:", v128);
    objc_msgSend(v142, "dateByAddingTimeInterval:", 900.0);
    v67 = (id)objc_claimAutoreleasedReturnValue();

    ++v143;
    ++v144;
    v57 = v140;
  }
  while (v124 != 95);
  v162[0] = v147;
  v162[1] = v145;
  objc_msgSend(*(id *)(v107 + 3360), "arrayWithObjects:count:", v162, 2);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  return v133;
}

- (id)screenTimeInRange:(_PLTimeIntervalRange)a3 withBucketSize:(double)a4 withNumBuckets:(int)a5 withDataRange:(_PLTimeIntervalRange)a6 withQueryType:(int)a7 andBatteryBreakdown:(id)a8
{
  double length;
  double location;
  double v12;
  double v13;
  double v15;
  double v16;
  double v19;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  _BOOL4 v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t i;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  NSObject *v53;
  double v54;
  NSObject *v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  uint64_t v61;
  double v62;
  uint64_t v63;
  void *v64;
  void *v65;
  NSObject *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  double v79;
  uint64_t v80;
  double v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v93;
  PLBatteryUIService *v94;
  id v96;
  uint64_t v97;
  void *v98;
  void *v99;
  void *v100;
  id v101;
  int v102;
  int v103;
  int v104;
  void *v105;
  uint64_t v106;
  id v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _QWORD v112[2];
  _QWORD v113[2];
  _QWORD v114[2];
  _QWORD v115[2];
  _QWORD v116[2];
  uint8_t v117[128];
  uint8_t buf[4];
  int v119;
  __int16 v120;
  _BYTE v121[10];
  uint64_t v122;
  uint64_t v123;

  length = a6.length;
  location = a6.location;
  v12 = a3.length;
  v13 = a3.location;
  v123 = *MEMORY[0x1E0C80C00];
  v96 = a8;
  v15 = v13 + -1800.0;
  v16 = location + length;
  if (location >= v13 + -1800.0 || v16 <= v15)
  {
    v21 = v12 + v15;
    if (v15 >= location || v21 <= location)
    {
      v19 = 0.0;
      if (location != v15 || length <= 0.0)
      {
        v20 = 0.0;
        goto LABEL_20;
      }
      v20 = 0.0;
      if (v12 <= 0.0)
        goto LABEL_20;
    }
  }
  else
  {
    v21 = v12 + v15;
  }
  if (location >= v15)
    v19 = location;
  else
    v19 = v15;
  if (v16 >= v21)
    v16 = v21;
  v20 = v16 - v19;
LABEL_20:
  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UsageTime"), v16, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = (void *)v22;
  objc_msgSend(v23, "entriesForKey:inTimeRange:withFilters:", v22, 0, v19, v20);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_INFO, "Creating screen times", buf, 2u);
  }

  v100 = (void *)objc_opt_new();
  v98 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v12 + v15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 < 1)
  {
    v27 = 0;
    LODWORD(v26) = 0;
    v104 = 0;
  }
  else
  {
    v106 = 0;
    v104 = 0;
    v26 = 0;
    v27 = 0;
    v97 = a5;
    v94 = self;
    do
    {
      objc_msgSend(v25, "dateByAddingTimeInterval:", -a4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v25;
      objc_msgSend(v28, "timeIntervalSince1970");
      v31 = v30;
      objc_msgSend(v29, "timeIntervalSince1970");
      v33 = v32;

      v34 = v33 - v31;
      -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v99, v31, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v36 = objc_claimAutoreleasedReturnValue();
      v105 = v35;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        v67 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v31);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v31 + v34);
        v69 = v26;
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "stringWithFormat:", CFSTR("Start: %@, End %@"), v68, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v69;
        v35 = v105;

        v72 = objc_msgSend(v105, "count");
        *(_DWORD *)buf = 67109634;
        v119 = v106;
        v120 = 2112;
        *(_QWORD *)v121 = v71;
        *(_WORD *)&v121[8] = 2048;
        v122 = v72;
        _os_log_debug_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEBUG, "Bucket %d range: %@ with %lu entries in range", buf, 0x1Cu);

      }
      v37 = objc_msgSend(v35, "count");
      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG);
      if (v37)
      {
        if (v39)
        {
          *(_DWORD *)buf = 67109632;
          v119 = v106;
          v120 = 1024;
          *(_DWORD *)v121 = 0;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = 0;
          _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "Start of bucket %d On:%d Off:%d", buf, 0x14u);
        }
        v101 = v29;
        v102 = v27;
        v103 = v26;

        v110 = 0u;
        v111 = 0u;
        v108 = 0u;
        v109 = 0u;
        v40 = v35;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
        if (v41)
        {
          v42 = v41;
          v43 = 0;
          v44 = 0;
          v45 = *(_QWORD *)v109;
          do
          {
            for (i = 0; i != v42; ++i)
            {
              if (*(_QWORD *)v109 != v45)
                objc_enumerationMutation(v40);
              v47 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ScreenOn"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (v48)
              {
                objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ScreenOn"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                v44 += objc_msgSend(v49, "intValue");

              }
              objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ScreenOff"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              if (v50)
              {
                objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("ScreenOff"));
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v43 += objc_msgSend(v51, "intValue");

              }
              v52 = v43 + v44;
              PLLogCommon();
              v53 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 67109888;
                v119 = v106;
                v120 = 1024;
                *(_DWORD *)v121 = v44;
                *(_WORD *)&v121[4] = 1024;
                *(_DWORD *)&v121[6] = v43;
                LOWORD(v122) = 1024;
                *(_DWORD *)((char *)&v122 + 2) = v43 + v44;
                _os_log_debug_impl(&dword_1DA9D6000, v53, OS_LOG_TYPE_DEBUG, "Bucket %d On:%d Off:%d Total:%d", buf, 0x1Au);
              }

            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v108, v117, 16);
          }
          while (v42);
        }
        else
        {
          v43 = 0;
          v52 = 0;
          v44 = 0;
        }

        v54 = (double)v52;
        if ((double)v52 <= a4)
        {
          self = v94;
          v56 = v103;
        }
        else
        {
          v44 = (int)((double)v44 * a4 / v54);
          v43 = (int)((double)v43 * a4 / v54);
          PLLogCommon();
          v55 = objc_claimAutoreleasedReturnValue();
          self = v94;
          v56 = v103;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109376;
            v119 = v44;
            v120 = 1024;
            *(_DWORD *)v121 = v43;
            _os_log_debug_impl(&dword_1DA9D6000, v55, OS_LOG_TYPE_DEBUG, "Normalized On:%d Off:%d", buf, 0xEu);
          }

        }
        v104 += v44;
        v26 = (v43 + v56);
        objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryRangeDayTapKey"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndexedSubscript:", 23 - v106);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        -[PLBatteryUIService adjustScreenOnTimeSecsWithGraphValue:queryType:andBreakdownEntries:](self, "adjustScreenOnTimeSecsWithGraphValue:queryType:andBreakdownEntries:", a7, v59, (double)v44);
        v61 = (int)v60;
        -[PLBatteryUIService adjustScreenOffTimeSecsWithGraphValue:withGraphScreenOnSecs:queryType:andBreakdownEntries:](self, "adjustScreenOffTimeSecsWithGraphValue:withGraphScreenOnSecs:queryType:andBreakdownEntries:", a7, v59, (double)v43, (double)(int)v61);
        v63 = (int)v62;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v61);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "addObject:", v64);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v63);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "addObject:", v65);

        PLLogCommon();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109632;
          v119 = v106;
          v120 = 1024;
          *(_DWORD *)v121 = v104;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = v26;
          _os_log_debug_impl(&dword_1DA9D6000, v66, OS_LOG_TYPE_DEBUG, "Bucket %d Totals so far on:%d off:%d", buf, 0x14u);
        }
        v27 = (v102 + 1);

        v29 = v101;
      }
      else
      {
        if (v39)
        {
          *(_DWORD *)buf = 67109632;
          v119 = v106;
          v120 = 1024;
          *(_DWORD *)v121 = v104;
          *(_WORD *)&v121[4] = 1024;
          *(_DWORD *)&v121[6] = v26;
          _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "Not enough info in bucket %d, total on:%d off:%d", buf, 0x14u);
        }

        objc_msgSend(v100, "addObject:", &unk_1EA1BFAC8);
        objc_msgSend(v98, "addObject:", &unk_1EA1BFAC8);
      }
      objc_msgSend(v29, "dateByAddingTimeInterval:", -a4);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      ++v106;
    }
    while (v106 != v97);
  }
  ADClientSetValueForScalarKey();
  v73 = (void *)objc_opt_new();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", CFSTR("24hr"), CFSTR("duration"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v73, "setObject:forKeyedSubscript:", v74, CFSTR("numBuckets"));

  v107 = v73;
  AnalyticsSendEventLazy();
  PLLogCommon();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v119 = v27;
    _os_log_impl(&dword_1DA9D6000, v75, OS_LOG_TYPE_INFO, "Total screen buckets with info: %d", buf, 8u);
  }

  PLLogCommon();
  v76 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:].cold.1();

  objc_msgSend(v96, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryRangeDayKey"));
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLBatteryUIService adjustScreenOnTimeSecsWithGraphValue:queryType:andBreakdownEntries:](self, "adjustScreenOnTimeSecsWithGraphValue:queryType:andBreakdownEntries:", a7, v78, (double)v104);
  v80 = (int)v79;
  -[PLBatteryUIService adjustScreenOffTimeSecsWithGraphValue:withGraphScreenOnSecs:queryType:andBreakdownEntries:](self, "adjustScreenOffTimeSecsWithGraphValue:withGraphScreenOnSecs:queryType:andBreakdownEntries:", a7, v78, (double)(int)v26, (double)(int)v80);
  v82 = (int)v81;
  v115[0] = CFSTR("PLBatteryUIGraphHourly");
  objc_msgSend(v100, "reverseObjectEnumerator");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v83, "allObjects");
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  v115[1] = CFSTR("PLBatteryUIGraphTotal");
  v116[0] = v84;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v80);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v116[1] = v85;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v116, v115, 2);
  v86 = (void *)objc_claimAutoreleasedReturnValue();

  v113[0] = CFSTR("PLBatteryUIGraphHourly");
  objc_msgSend(v98, "reverseObjectEnumerator");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "allObjects");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v113[1] = CFSTR("PLBatteryUIGraphTotal");
  v114[0] = v88;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v82);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v114[1] = v89;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v114, v113, 2);
  v90 = (void *)objc_claimAutoreleasedReturnValue();

  v112[0] = v86;
  v112[1] = v90;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 2);
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  return v91;
}

id __118__PLBatteryUIService_screenTimeInRange_withBucketSize_withNumBuckets_withDataRange_withQueryType_andBatteryBreakdown___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
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

- (id)lastXDaysWithRange:(_PLTimeIntervalRange)a3 withDataRange:(_PLTimeIntervalRange)a4 withQueryType:(int)a5 andBatteryBreakdown:(id)a6
{
  double length;
  double location;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  id v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  int v43;
  uint64_t v44;
  uint64_t i;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  NSObject *v62;
  int v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  double v71;
  uint64_t v72;
  double v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v90;
  void *v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v100;
  void *v101;
  int v102;
  uint8_t v103;
  _BYTE v104[15];
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  const __CFString *v113;
  void *v114;
  const __CFString *v115;
  void *v116;
  _BYTE v117[128];
  uint8_t v118[128];
  uint8_t buf[4];
  _BYTE v120[18];
  uint64_t v121;

  length = a4.length;
  location = a4.location;
  v8 = a3.length;
  v9 = a3.location;
  v121 = *MEMORY[0x1E0C80C00];
  v93 = a6;
  v10 = v9 + -1800.0;
  v11 = v8 + v9 + -1800.0;
  v12 = v10 >= location || v11 <= location;
  if (!v12)
  {
    v16 = location + length;
LABEL_16:
    if (v10 >= location)
      v14 = v10;
    else
      v14 = location;
    if (v11 >= v16)
      v17 = v16;
    else
      v17 = v11;
    v15 = v17 - v14;
    goto LABEL_23;
  }
  v16 = location + length;
  if (location < v10 && v16 > v10)
    goto LABEL_16;
  v14 = 0.0;
  if (v10 != location || v8 <= 0.0)
  {
    v15 = 0.0;
    goto LABEL_23;
  }
  v12 = length <= 0.0;
  v15 = 0.0;
  if (!v12)
    goto LABEL_16;
LABEL_23:
  v18 = *MEMORY[0x1E0D80368];
  +[PLOperator entryKeyForType:andName:](PLBatteryAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80368], CFSTR("UILevel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "entriesForKey:inTimeRange:withFilters:", v19, 0, v14, v15);
  v95 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLOperator entryKeyForType:andName:](PLAppTimeService, "entryKeyForType:andName:", v18, CFSTR("UsageTime"));
  v21 = objc_claimAutoreleasedReturnValue();
  -[PLOperator storage](self, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = (void *)v21;
  objc_msgSend(v22, "entriesForKey:inTimeRange:withFilters:", v21, 0, v14, v15);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v23, OS_LOG_TYPE_INFO, "Computing lastX days data", buf, 2u);
  }

  PLLogCommon();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:].cold.3(v94, v95, v24);

  v92 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v11);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  PLLogCommon();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:].cold.2();

  v100 = 0;
  v27 = 0;
  do
  {
    objc_msgSend(v25, "dateByAddingTimeInterval:", -86400.0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v25;
    objc_msgSend(v28, "timeIntervalSince1970");
    v31 = v30;
    objc_msgSend(v29, "timeIntervalSince1970");
    v33 = v32;
    v98 = v29;

    v34 = v33 - v31;
    PLLogCommon();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
    {
      v81 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v31);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v31 + v34);
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "stringWithFormat:", CFSTR("Start: %@, End %@"), v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();

      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v120 = v100;
      *(_WORD *)&v120[4] = 2112;
      *(_QWORD *)&v120[6] = v84;
      _os_log_debug_impl(&dword_1DA9D6000, v35, OS_LOG_TYPE_DEBUG, "Calculating day %d range: %@", buf, 0x12u);

    }
    -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v95, v31, v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLBatteryUIService entriesInRange:fromEntries:](self, "entriesInRange:fromEntries:", v94, v31, v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    PLLogCommon();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      v85 = objc_msgSend(v36, "count");
      v86 = objc_msgSend(v37, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v120 = v85;
      *(_WORD *)&v120[8] = 2048;
      *(_QWORD *)&v120[10] = v86;
      _os_log_debug_impl(&dword_1DA9D6000, v38, OS_LOG_TYPE_DEBUG, "Entries in range UI: %lu Usage: %lu", buf, 0x16u);
    }

    v101 = v36;
    v97 = v37;
    if (objc_msgSend(v36, "count") && objc_msgSend(v37, "count"))
    {
      v102 = v27;
      v111 = 0u;
      v112 = 0u;
      v110 = 0u;
      v109 = 0u;
      v39 = v37;
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
      if (v40)
      {
        v41 = v40;
        v42 = 0;
        v43 = 0;
        v44 = *(_QWORD *)v110;
        do
        {
          for (i = 0; i != v41; ++i)
          {
            if (*(_QWORD *)v110 != v44)
              objc_enumerationMutation(v39);
            v46 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * i);
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ScreenOn"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            if (v47)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ScreenOn"));
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              v42 += objc_msgSend(v48, "intValue");

            }
            objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ScreenOff"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            if (v49)
            {
              objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("ScreenOff"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v43 += objc_msgSend(v50, "intValue");

            }
          }
          v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v109, v118, 16);
        }
        while (v41);
      }
      else
      {
        v42 = 0;
        v43 = 0;
      }

      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v53 = v101;
      v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
      if (v54)
      {
        v55 = v54;
        v52 = 0;
        v56 = *(_QWORD *)v106;
        do
        {
          for (j = 0; j != v55; ++j)
          {
            if (*(_QWORD *)v106 != v56)
              objc_enumerationMutation(v53);
            v58 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * j);
            objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Level"));
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            if (v59)
            {
              objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("Level"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = objc_msgSend(v60, "intValue") + v52;

            }
          }
          v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v105, v117, 16);
        }
        while (v55);
      }
      else
      {
        v52 = 0;
      }

      v61 = v43 + v42;
      if (v43 + v42 < 86401)
      {
        v63 = v102;
      }
      else
      {
        v42 = (int)((double)v42 * 86400.0 / (double)v61);
        v43 = (int)((double)v43 * 86400.0 / (double)v61);
        PLLogCommon();
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = v102;
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v120 = v42;
          *(_WORD *)&v120[4] = 1024;
          *(_DWORD *)&v120[6] = v43;
          _os_log_debug_impl(&dword_1DA9D6000, v62, OS_LOG_TYPE_DEBUG, "Normalized On:%d Off:%d", buf, 0xEu);
        }

      }
      PLLogCommon();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)v120 = v42;
        *(_WORD *)&v120[4] = 1024;
        *(_DWORD *)&v120[6] = v43;
        *(_WORD *)&v120[10] = 1024;
        *(_DWORD *)&v120[12] = v52;
        _os_log_debug_impl(&dword_1DA9D6000, v64, OS_LOG_TYPE_DEBUG, "On:%ds Off:%ds UI:%d%%", buf, 0x14u);
      }

      v27 = (v63 + 1);
    }
    else
    {
      PLLogCommon();
      v51 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:].cold.1(&v103, v104, v51);

      v42 = -1;
      v43 = -1;
      v52 = 0xFFFFFFFFLL;
    }
    ADClientSetValueForScalarKey();
    v65 = (void *)objc_opt_new();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", CFSTR("xDay"), CFSTR("duration"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v27);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setObject:forKeyedSubscript:", v66, CFSTR("numBuckets"));

    v96 = v65;
    AnalyticsSendEventLazy();
    PLLogCommon();
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v120 = v27;
      _os_log_impl(&dword_1DA9D6000, v67, OS_LOG_TYPE_INFO, "Total screen buckets with info: %d", buf, 8u);
    }

    objc_msgSend(v93, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryRangeWeekTapKey"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "objectAtIndexedSubscript:", 9 - v100);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLBatteryUIService adjustScreenOnTimeSecsWithGraphValue:queryType:andBreakdownEntries:](self, "adjustScreenOnTimeSecsWithGraphValue:queryType:andBreakdownEntries:", a5, v70, (double)v42);
    v72 = (int)v71;
    -[PLBatteryUIService adjustScreenOffTimeSecsWithGraphValue:withGraphScreenOnSecs:queryType:andBreakdownEntries:](self, "adjustScreenOffTimeSecsWithGraphValue:withGraphScreenOnSecs:queryType:andBreakdownEntries:", a5, v70, (double)v43, (double)(int)v72);
    v74 = (int)v73;
    v75 = (void *)objc_opt_new();
    v115 = CFSTR("PLBatteryUIGraphTotal");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v72);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v116 = v76;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setObject:forKeyedSubscript:", v77, CFSTR("PLBatteryUIScreenOnTimeKey"));

    v113 = CFSTR("PLBatteryUIGraphTotal");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v74);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = v78;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setObject:forKeyedSubscript:", v79, CFSTR("PLBatteryUIScreenOffTimeKey"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v52);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "setObject:forKeyedSubscript:", v80, CFSTR("PLBatteryUIEnergyKey"));

    objc_msgSend(v92, "addObject:", v75);
    objc_msgSend(v98, "dateByAddingTimeInterval:", -86400.0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    ++v100;
  }
  while (v100 != 10);
  objc_msgSend(v92, "reverseObjectEnumerator");
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "allObjects");
  v88 = (void *)objc_claimAutoreleasedReturnValue();

  return v88;
}

id __89__PLBatteryUIService_lastXDaysWithRange_withDataRange_withQueryType_andBatteryBreakdown___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)modelsForGraphWithDayRange:(_PLTimeIntervalRange)a3 withXDayRange:(_PLTimeIntervalRange)a4 withDataRange:(_PLTimeIntervalRange)a5 withQueryType:(int)a6 andBatteryBreakdown:(id)a7
{
  uint64_t v7;
  double length;
  double location;
  double v10;
  double v11;
  double v12;
  double v13;
  id v15;
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
  _QWORD v27[3];
  _QWORD v28[4];

  v7 = *(_QWORD *)&a6;
  length = a5.length;
  location = a5.location;
  v10 = a4.length;
  v11 = a4.location;
  v12 = a3.length;
  v13 = a3.location;
  v28[3] = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = (void *)objc_opt_new();
  -[PLBatteryUIService screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:](self, "screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:", 24, v7, v15, v13, v12, 3600.0, location, length);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("PLBatteryUIScreenOnTimeKey"));

  objc_msgSend(v17, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("PLBatteryUIScreenOffTimeKey"));

  -[PLBatteryUIService batteryLevelsAndChargingIntervalsInRange:withDataRange:](self, "batteryLevelsAndChargingIntervalsInRange:withDataRange:", v13, v12, location, length);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectAtIndexedSubscript:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, CFSTR("PLBatteryUIBatteryLevelsKey"));

  objc_msgSend(v20, "objectAtIndexedSubscript:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("PLBatteryUIChargingIntervalsKey"));

  -[PLBatteryUIService lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:](self, "lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:", v7, v15, v11, v10, location, length);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = CFSTR("PLBatteryUIErrorCodeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v24;
  v28[1] = v16;
  v27[1] = CFSTR("PLBatteryUIGraph24hrs");
  v27[2] = CFSTR("PLBatteryUIGraphDays");
  v28[2] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (double)adjustScreenOnTimeSecsWithGraphValue:(double)a3 queryType:(int)a4 andBreakdownEntries:(id)a5
{
  id v8;
  void *v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = v8;
  v10 = 0.0;
  if (v8)
  {
    if (objc_msgSend(v8, "count"))
    {
      v10 = a3;
      if (!a4)
      {
        v23 = 0u;
        v24 = 0u;
        v21 = 0u;
        v22 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          v10 = 0.0;
          do
          {
            for (i = 0; i != v13; ++i)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
              if (-[PLBatteryUIService isAppEntryValidForAdjustment:withQueryType:](self, "isAppEntryValidForAdjustment:withQueryType:", v16, 0, (_QWORD)v21))
              {
                objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "doubleValue");
                -[PLBatteryUIService floorSeconds:](self, "floorSeconds:");
                v19 = v18;

                v10 = v10 + v19;
              }
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
          }
          while (v13);
        }
        else
        {
          v10 = 0.0;
        }

      }
    }
  }

  return v10;
}

- (double)adjustScreenOffTimeSecsWithGraphValue:(double)a3 withGraphScreenOnSecs:(double)a4 queryType:(int)a5 andBreakdownEntries:(id)a6
{
  id v10;
  void *v11;
  double v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  uint64_t i;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = v10;
  v12 = 0.0;
  if (v10 && objc_msgSend(v10, "count"))
  {
    if (a5)
    {
      v12 = a3;
    }
    else
    {
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v28;
        v17 = 0.0;
        v18 = 0.0;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v28 != v16)
              objc_enumerationMutation(v13);
            v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
            if (-[PLBatteryUIService isAppEntryValidForAdjustment:withQueryType:](self, "isAppEntryValidForAdjustment:withQueryType:", v20, 0, (_QWORD)v27))
            {
              objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "doubleValue");
              v23 = v22;

              -[PLBatteryUIService floorSeconds:](self, "floorSeconds:", v23);
              v18 = v18 + v24;
              if (v23 > v17)
                v17 = v23;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v15);
      }
      else
      {
        v17 = 0.0;
        v18 = 0.0;
      }

      if (v18 >= a3)
        v25 = a3;
      else
        v25 = v18;
      if (v25 >= v17 - a4)
        v12 = v25;
      else
        v12 = v17 - a4;
    }
  }

  return v12;
}

- (BOOL)isAppEntryValidForAdjustment:(id)a3 withQueryType:(int)a4
{
  id v5;
  void *v6;
  void *v7;
  float v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;

  v5 = a3;
  v6 = v5;
  if (a4 != 3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppEnergyValueKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    if ((int)(v8 + 0.5) < 1)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppForegroundRuntimeKey"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppBackgroundRuntimeKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v14 = v11 + v13;

      if (v14 < 60.0)
        goto LABEL_8;
    }
    else
    {

    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "intValue") == 5)
  {

  }
  else
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppTypeKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intValue");

    if (v17 != 2)
    {
      v18 = 1;
      goto LABEL_10;
    }
  }
LABEL_8:
  v18 = 0;
LABEL_10:

  return v18;
}

- (double)floorSeconds:(double)a3
{
  return floor(a3 / 60.0) * 60.0;
}

- (void)removeExcessUpgradePlistFiles
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  +[PLUtilities containerPath](PLUtilities, "containerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Debug/"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a1;
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "Failed to get contents of directory %@ with error: %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_8();
}

void __51__PLBatteryUIService_removeExcessUpgradePlistFiles__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("Upgrade"));

  if (v4)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

- (PLXPCResponderOperatorComposition)batteryBreakdownResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBatteryBreakdownResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLXPCResponderOperatorComposition)modelsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setModelsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelsResponder, 0);
  objc_storeStrong((id *)&self->_batteryBreakdownResponder, 0);
}

- (void)getlastDayRangeWithNow:withNowSystem:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, (uint64_t)v0, "System hour bucket: %@ -> %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)getlastDayRangeWithNow:withNowSystem:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "hourNum: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDataRangeWithNow:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "No first RNE entry!", v2);
  OUTLINED_FUNCTION_6();
}

- (void)getDataRangeWithNow:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, (uint64_t)v0, "First RNE entry at %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)getDataRangeWithNow:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "No first usage time entry!", v2);
  OUTLINED_FUNCTION_6();
}

- (void)getDataRangeWithNow:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, v0, (uint64_t)v0, "First usage time entry at %@: %@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Result copied to folder %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_1DA9D6000, v0, OS_LOG_TYPE_ERROR, "Failed to copy to folder %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Result written to folder %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10(&dword_1DA9D6000, v0, v1, "Failed to write response to folder %@ with error %@");
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Attempting to create file %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownAndGraphWithPayload:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "and monotonic time %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)batteryBreakdownWithPayload:(uint64_t)a3 withDayRange:(uint64_t)a4 withXDayRange:(uint64_t)a5 withDataRange:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "Duration key: %.f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)demoModePath
{
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, a1, a3, "Demo Mode: Using non-default plist at path: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)getLastChargeData
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_10(&dword_1DA9D6000, v0, v1, "Missing last charge info: %@ - %@%%");
  OUTLINED_FUNCTION_1();
}

- (void)getLPMIntervalsSpanningRange:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Created LPM interval %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getLPMIntervalsSpanningRange:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "Closing open LPM interval", v2);
  OUTLINED_FUNCTION_6();
}

- (void)getLPMIntervalsSpanningRange:(NSObject *)a3 .cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a3, (uint64_t)a3, "LPM logged with no change?", a1);
}

- (void)getLPMIntervalsSpanningRange:(uint64_t)a3 .cold.4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1DA9D6000, a2, a3, "Last Entry LpmEnabled: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)getLPMIntervalsSpanningRange:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "Creating LPM intervals", v2);
  OUTLINED_FUNCTION_6();
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a1 withDataRange:(uint64_t)a2 .cold.1(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  _DWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend((id)OUTLINED_FUNCTION_12(a1, a2), "count");
  *v3 = 134217984;
  *v2 = v4;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v5, v6, "Found %lu entries in range!");
  OUTLINED_FUNCTION_14();
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a3 withDataRange:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1DA9D6000, a1, a3, "Calculating %d battery level buckets", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)batteryLevelsAndChargingIntervalsInRange:(void *)a1 withDataRange:(NSObject *)a2 .cold.3(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a2, v6, "Capped open charging interval: [%@ %@]", (uint8_t *)&v7);

  OUTLINED_FUNCTION_8();
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a1 withDataRange:(uint64_t)a2 .cold.4(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_12(a1, a2), "entryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_9(&dword_1DA9D6000, v5, v6, "Found invalid battery entry at %@");

  OUTLINED_FUNCTION_14();
}

- (void)batteryLevelsAndChargingIntervalsInRange:(NSObject *)a3 withDataRange:.cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint8_t v5[12];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  v6 = 1024;
  v7 = v4;
  _os_log_debug_impl(&dword_1DA9D6000, a3, OS_LOG_TYPE_DEBUG, "Iterating through %lu entries, interval open: %d", v5, 0x12u);
}

- (void)batteryLevelsAndChargingIntervalsInRange:(uint64_t)a3 withDataRange:(uint64_t)a4 .cold.6(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1DA9D6000, a2, a3, "Last Entry isCharging: %d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)screenTimeInRange:withBucketSize:withNumBuckets:withDataRange:withQueryType:andBatteryBreakdown:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, v0, v1, "Reversing buckets!", v2);
  OUTLINED_FUNCTION_6();
}

- (void)lastXDaysWithRange:(NSObject *)a3 withDataRange:withQueryType:andBatteryBreakdown:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_3(&dword_1DA9D6000, a3, (uint64_t)a3, "Not enough info in range!", a1);
}

- (void)lastXDaysWithRange:withDataRange:withQueryType:andBatteryBreakdown:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Start of current day: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)lastXDaysWithRange:(NSObject *)a3 withDataRange:withQueryType:andBatteryBreakdown:.cold.3(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 134218240;
  v7 = objc_msgSend(a1, "count");
  v8 = 2048;
  v9 = objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_7(&dword_1DA9D6000, a3, v5, "Calculating lastX days with %lu screen %lu ui entries", (uint8_t *)&v6);
  OUTLINED_FUNCTION_8();
}

@end
