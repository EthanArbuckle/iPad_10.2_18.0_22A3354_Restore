@implementation PLBLDService

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLBLDService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventPointDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("BLD");
  +[PLBLDService entryEventPointBLD](PLBLDService, "entryEventPointBLD");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventPointBLD
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
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  _QWORD v16[4];
  uint64_t v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v19[0] = *MEMORY[0x1E0D80298];
  v17 = *MEMORY[0x1E0D80318];
  v18 = &unk_1EA1DAF88;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v2;
  v19[1] = *MEMORY[0x1E0D802F0];
  v15[0] = CFSTR("BUIOutput");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "commonTypeDict_StringFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v4;
  v15[1] = CFSTR("JSON");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "commonTypeDict_BoolFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v6;
  v15[2] = CFSTR("LastUpDateTime");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "commonTypeDict_DateFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v8;
  v15[3] = CFSTR("BLDRetail");
  v13 = *MEMORY[0x1E0D80358];
  v14 = &unk_1EA1C20C0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PLBLDService)init
{
  PLBLDService *v3;
  objc_super v5;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLBLDService;
    self = -[PLOperator init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  id v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x1E0D80098]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PLBLDService_initOperatorDependancies__block_invoke;
  v6[3] = &unk_1EA16D1A8;
  v6[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1EA1DA448, v6);
  -[PLBLDService setBatteryBreakdownResponder:](self, "setBatteryBreakdownResponder:", v4);

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback_0, CFSTR("com.apple.powerlogd.BLD.batteryBreakdown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

id __40__PLBLDService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t block;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(*(id *)(a1 + 32), "batteryBreakdownWithPayload:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __40__PLBLDService_initOperatorDependancies__block_invoke_2;
    v20 = &__block_descriptor_40_e5_v8__0lu32l8;
    v21 = v8;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: result=%@, payload=%@"), "-[PLBLDService initOperatorDependancies]_block_invoke", 101, v7, v6, block, v18, v19, v20, v21);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService initOperatorDependancies]_block_invoke");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 101);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
  v22 = CFSTR("result");
  v23[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __40__PLBLDService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1 = result;
  return result;
}

- (id)batteryBreakdownWithPayload:(id)a3
{
  void *v4;
  uint64_t v5;
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
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  NSObject *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  NSObject *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  PLBLDService *v98;
  void *v99;
  void *v100;
  void *v101;
  _QWORD v102[5];
  _QWORD v103[5];
  _QWORD block[5];
  _QWORD v105[5];
  _QWORD v106[5];
  _QWORD v107[5];
  uint8_t buf[4];
  void *v109;
  uint64_t v110;

  v110 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v98 = self;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = 3221225472;
    v107[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke;
    v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v107[4] = v6;
    if (batteryBreakdownWithPayload__defaultOnce != -1)
      dispatch_once(&batteryBreakdownWithPayload__defaultOnce, v107);
    if (batteryBreakdownWithPayload__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryType=%i"), v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 119);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      self = v98;
    }
  }
  if ((_DWORD)v5 != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v97 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateByAddingTimeInterval:", -86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(v15, "timeIntervalSince1970");
  v18 = v17;
  objc_msgSend(v16, "timeIntervalSince1970");
  v20 = v19;

  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v18, v20 - v18, 0.0, 0.0, 3600.0);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v94, CFSTR("PLBatteryUIQueryRangeDayKey"));
  -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v22 = (void *)v97;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v23 = objc_opt_class();
      v106[0] = MEMORY[0x1E0C809B0];
      v106[1] = 3221225472;
      v106[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_52;
      v106[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v106[4] = v23;
      if (batteryBreakdownWithPayload__defaultOnce_50 != -1)
        dispatch_once(&batteryBreakdownWithPayload__defaultOnce_50, v106);
      if (batteryBreakdownWithPayload__classDebugEnabled_51)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: past day results generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 140);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastPathComponent");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 140);

        PLLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v22 = (void *)v97;
        self = v98;
      }
    }
    objc_msgSend(v21, "serialized");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v30);

  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v21);
    v22 = (void *)v97;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "dateByAddingTimeInterval:", -604800.0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v16;
  objc_msgSend(v33, "timeIntervalSince1970");
  v36 = v35;
  objc_msgSend(v34, "timeIntervalSince1970");
  v38 = v37;

  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v36, v38 - v36, 0.0, 0.0, 3600.0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setObject:forKeyedSubscript:", v39, CFSTR("PLBatteryUIQueryRangeWeekKey"));

  -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v32);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v93 = v21;
  v95 = v40;
  v96 = v34;
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v41 = objc_opt_class();
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_59;
      v105[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v105[4] = v41;
      if (batteryBreakdownWithPayload__defaultOnce_57 != -1)
        dispatch_once(&batteryBreakdownWithPayload__defaultOnce_57, v105);
      if (batteryBreakdownWithPayload__classDebugEnabled_58)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: past week results generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 156);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "lastPathComponent");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "logMessage:fromFile:fromFunction:fromLineNumber:", v42, v45, v46, 156);

        PLLogCommon();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v34 = v96;
        v22 = (void *)v97;
        v40 = v95;
      }
    }
    objc_msgSend(v40, "serialized");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v48);

  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v40);
  }
  objc_msgSend(v34, "convertFromMonotonicToSystem");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 6;
  do
  {
    v51 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v49, "dateByAddingTimeInterval:", -600.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "nearestMidnightBeforeDate:", v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    v54 = CFSTR("PLBatteryUIQueryRangeTodayKey");
    if ((_DWORD)v50 != 6)
    {
      v55 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v50);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "stringWithFormat:", CFSTR("PLBatteryUIQueryRangeDay_%@_Key"), v56);
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v53, "convertFromSystemToMonotonic");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "convertFromSystemToMonotonic");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "timeIntervalSince1970");
    v61 = v60;
    objc_msgSend(v59, "timeIntervalSince1970");
    v63 = v62 - v61;

    -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v61, v63, 0.0, 0.0, 3600.0);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setObject:forKeyedSubscript:", v64, v54);

    -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v57);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
    {
      v99 = v53;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v66 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_69;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v66;
        if (batteryBreakdownWithPayload__defaultOnce_67 != -1)
          dispatch_once(&batteryBreakdownWithPayload__defaultOnce_67, block);
        if (batteryBreakdownWithPayload__classDebugEnabled_68)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: past N days results generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 177);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          v68 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "lastPathComponent");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "logMessage:fromFile:fromFunction:fromLineNumber:", v67, v70, v71, 177);

          PLLogCommon();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v109 = v67;
            _os_log_debug_impl(&dword_1DA9D6000, v72, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v22 = (void *)v97;
          self = v98;
        }
      }
      objc_msgSend(v65, "serialized");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addObject:", v73);

      v53 = v99;
    }
    else
    {
      -[PLOperator logEntry:](self, "logEntry:", v65);
    }

    v50 = (v50 - 1);
    v32 = v57;
    v49 = v53;
  }
  while ((_DWORD)v50 != -1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService suggestionsWithEnergyEntries:](self, "suggestionsWithEnergyEntries:", v75);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "setObject:forKeyedSubscript:", v76, CFSTR("PLBatteryUISuggestionArrayKey"));

  -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v74);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v100 = v53;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v78 = objc_opt_class();
      v103[0] = MEMORY[0x1E0C809B0];
      v103[1] = 3221225472;
      v103[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_78;
      v103[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v103[4] = v78;
      if (batteryBreakdownWithPayload__defaultOnce_76 != -1)
        dispatch_once(&batteryBreakdownWithPayload__defaultOnce_76, v103);
      if (batteryBreakdownWithPayload__classDebugEnabled_77)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: suggestion array generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 199);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "lastPathComponent");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "logMessage:fromFile:fromFunction:fromLineNumber:", v79, v82, v83, 199);

        PLLogCommon();
        v84 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        v22 = (void *)v97;
      }
    }
    objc_msgSend(v77, "serialized");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v85);

    v53 = v100;
  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v77);
  }
  -[PLBatteryBreakdownService clearState](self, "clearState");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v86 = objc_opt_class();
    v102[0] = MEMORY[0x1E0C809B0];
    v102[1] = 3221225472;
    v102[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_83;
    v102[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v102[4] = v86;
    if (batteryBreakdownWithPayload__defaultOnce_81 != -1)
      dispatch_once(&batteryBreakdownWithPayload__defaultOnce_81, v102);
    if (batteryBreakdownWithPayload__classDebugEnabled_82)
    {
      v101 = v53;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: allEntries=%@"), "-[PLBLDService batteryBreakdownWithPayload:]", 210, v22);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "lastPathComponent");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "logMessage:fromFile:fromFunction:fromLineNumber:", v87, v90, v91, 210);

      PLLogCommon();
      v92 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v92, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v22 = (void *)v97;
      v53 = v101;
    }
  }

  return v22;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload__classDebugEnabled = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload__classDebugEnabled_51 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload__classDebugEnabled_58 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_69(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload__classDebugEnabled_68 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_78(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload__classDebugEnabled_77 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_83(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  batteryBreakdownWithPayload__classDebugEnabled_82 = result;
  return result;
}

- (id)bldEntryWithBatteryBreakdown:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];

  v4 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__PLBLDService_bldEntryWithBatteryBreakdown___block_invoke;
  block[3] = &unk_1EA16D040;
  block[4] = self;
  if (bldEntryWithBatteryBreakdown__onceToken != -1)
    dispatch_once(&bldEntryWithBatteryBreakdown__onceToken, block);
  v5 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  v6 = (void *)objc_msgSend(v5, "initWithEntryKey:", bldEntryWithBatteryBreakdown__entryKey);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("BLDRetail"));
  objc_msgSend(v6, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("LastUpDateTime"));

  +[PLUtilities JSONSanitizeDictionary:](PLUtilities, "JSONSanitizeDictionary:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("JSON"));
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v9, 4);
  }
  else
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("JSON"));
    objc_msgSend(v8, "description");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("BUIOutput"));

  return v6;
}

void __45__PLBLDService_bldEntryWithBatteryBreakdown___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend((id)objc_opt_class(), "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("BLD"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)bldEntryWithBatteryBreakdown__entryKey;
  bldEntryWithBatteryBreakdown__entryKey = v0;

}

- (PLXPCResponderOperatorComposition)batteryBreakdownResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBatteryBreakdownResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLXPCResponderOperatorComposition)logBUIResultsResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setLogBUIResultsResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logBUIResultsResponder, 0);
  objc_storeStrong((id *)&self->_batteryBreakdownResponder, 0);
}

@end
