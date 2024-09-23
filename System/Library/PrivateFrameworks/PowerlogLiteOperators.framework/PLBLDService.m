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
  v18 = &unk_1E8652920;
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
  v14 = &unk_1E8631F98;
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
  v6[3] = &unk_1E8577F70;
  v6[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithOperator:withRegistration:withBlock:", self, &unk_1E864B220, v6);
  -[PLBLDService setBatteryBreakdownResponder:](self, "setBatteryBreakdownResponder:", v4);

  if (-[PLOperator isDebugEnabled](self, "isDebugEnabled"))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)NotificationCallback, CFSTR("com.apple.powerlogd.BLD.batteryBreakdown"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
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
  _QWORD block[5];
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  objc_msgSend(*(id *)(a1 + 32), "batteryBreakdownWithPayload:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__PLBLDService_initOperatorDependancies__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (qword_1ED882500 != -1)
      dispatch_once(&qword_1ED882500, block);
    if (_MergedGlobals_1_7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: result=%@, payload=%@"), "-[PLBLDService initOperatorDependancies]_block_invoke", 101, v7, v6);
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
      {
        *(_DWORD *)buf = 138412290;
        v21 = v9;
        _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  v18 = CFSTR("result");
  v19 = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __40__PLBLDService_initOperatorDependancies__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_7 = result;
  return result;
}

- (id)batteryBreakdownWithPayload:(id)a3
{
  void *v4;
  uint64_t v5;
  __int16 *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  __int16 *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v34;
  void *v35;
  id v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int16 *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  void *v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  NSObject *v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  NSObject *v96;
  int v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  PLBLDService *v103;
  void *v104;
  void *v105;
  void *v106;
  _QWORD v107[5];
  _QWORD v108[5];
  _QWORD block[5];
  _QWORD v110[5];
  _QWORD v111[5];
  _QWORD v112[5];
  uint8_t buf[4];
  void *v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PLBatteryUIQueryTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  v6 = &word_1CB388000;
  v103 = self;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v7 = objc_opt_class();
    v112[0] = MEMORY[0x1E0C809B0];
    v112[1] = 3221225472;
    v112[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke;
    v112[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v112[4] = v7;
    if (qword_1ED882508 != -1)
      dispatch_once(&qword_1ED882508, v112);
    if (byte_1ED8824F9)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("queryType=%i"), v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 119);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v114 = v8;
        _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      self = v103;
    }
  }
  if ((_DWORD)v5 != 1)
    return 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingTimeInterval:", -86400.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v14;
  objc_msgSend(v16, "timeIntervalSince1970");
  v19 = v18;
  objc_msgSend(v17, "timeIntervalSince1970");
  v21 = v20;

  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v19, v21 - v19, 0.0, 0.0, 3600.0);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v99, CFSTR("PLBatteryUIQueryRangeDayKey"));
  -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = &word_1CB388000;
  v101 = v22;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    v24 = (void *)v102;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v25 = objc_opt_class();
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_52;
      v111[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v111[4] = v25;
      if (qword_1ED882510 != -1)
        dispatch_once(&qword_1ED882510, v111);
      if (byte_1ED8824FA)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: past day results generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 140);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "lastPathComponent");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logMessage:fromFile:fromFunction:fromLineNumber:", v26, v29, v30, 140);

        PLLogCommon();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v114 = v26;
          _os_log_debug_impl(&dword_1CAF47000, v31, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v24 = (void *)v102;
        self = v103;
        v22 = v101;
        v23 = &word_1CB388000;
      }
    }
    objc_msgSend(v22, "serialized");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v32);

  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v22);
    v24 = (void *)v102;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "dateByAddingTimeInterval:", -604800.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v17;
  objc_msgSend(v35, "timeIntervalSince1970");
  v38 = v37;
  objc_msgSend(v36, "timeIntervalSince1970");
  v40 = v39;

  -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v38, v40 - v38, 0.0, 0.0, 3600.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setObject:forKeyedSubscript:", v41, CFSTR("PLBatteryUIQueryRangeWeekKey"));

  -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v34);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v42;
  if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v43 = objc_opt_class();
      v110[0] = MEMORY[0x1E0C809B0];
      v110[1] = 3221225472;
      v110[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_59;
      v110[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v110[4] = v43;
      if (qword_1ED882518 != -1)
        dispatch_once(&qword_1ED882518, v110);
      if (byte_1ED8824FB)
      {
        v44 = v23;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: past week results generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 156);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "lastPathComponent");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logMessage:fromFile:fromFunction:fromLineNumber:", v45, v48, v49, 156);

        v23 = v44;
        PLLogCommon();
        v50 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = *((_QWORD *)v44 + 167);
          v114 = v45;
          _os_log_debug_impl(&dword_1CAF47000, v50, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v24 = (void *)v102;
        v42 = v100;
        v6 = &word_1CB388000;
      }
    }
    objc_msgSend(v42, "serialized");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v51);

  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v42);
  }
  v98 = v36;
  objc_msgSend(v36, "convertFromMonotonicToSystem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 6;
  v54 = *((_QWORD *)v6 + 166);
  v97 = *((_QWORD *)v23 + 167);
  do
  {
    v55 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v52, "dateByAddingTimeInterval:", -600.0);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "nearestMidnightBeforeDate:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = CFSTR("PLBatteryUIQueryRangeTodayKey");
    if ((_DWORD)v53 != 6)
    {
      v59 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v53);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "stringWithFormat:", CFSTR("PLBatteryUIQueryRangeDay_%@_Key"), v60);
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "convertFromSystemToMonotonic");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "convertFromSystemToMonotonic");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "timeIntervalSince1970");
    v65 = v64;
    objc_msgSend(v63, "timeIntervalSince1970");
    v67 = v66 - v65;

    -[PLBatteryBreakdownService batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:](self, "batteryBreakdownWithTimeRange:withDataRange:withEntryTimeInterval:withQueryType:", 1, v65, v67, 0.0, 0.0, 3600.0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setObject:forKeyedSubscript:", v68, v58);

    -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v61);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd"))
    {
      v104 = v57;
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v70 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = v54;
        block[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_69;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v70;
        if (qword_1ED882520 != -1)
          dispatch_once(&qword_1ED882520, block);
        if (byte_1ED8824FC)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: past N days results generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 177);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v73, "lastPathComponent");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "logMessage:fromFile:fromFunction:fromLineNumber:", v71, v74, v75, 177);

          PLLogCommon();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v97;
            v114 = v71;
            _os_log_debug_impl(&dword_1CAF47000, v76, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v24 = (void *)v102;
          self = v103;
        }
      }
      objc_msgSend(v69, "serialized");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addObject:", v77);

      v57 = v104;
    }
    else
    {
      -[PLOperator logEntry:](self, "logEntry:", v69);
    }

    v53 = (v53 - 1);
    v34 = v61;
    v52 = v57;
  }
  while ((_DWORD)v53 != -1);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v99, "objectForKeyedSubscript:", CFSTR("PLBatteryUIAppArrayKey"));
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryBreakdownService suggestionsWithEnergyEntries:](self, "suggestionsWithEnergyEntries:", v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v78, "setObject:forKeyedSubscript:", v80, CFSTR("PLBatteryUISuggestionArrayKey"));

  -[PLBLDService bldEntryWithBatteryBreakdown:](self, "bldEntryWithBatteryBreakdown:", v78);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0)
  {
    v105 = v57;
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v82 = objc_opt_class();
      v108[0] = MEMORY[0x1E0C809B0];
      v108[1] = v54;
      v108[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_78;
      v108[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v108[4] = v82;
      if (qword_1ED882528 != -1)
        dispatch_once(&qword_1ED882528, v108);
      if (byte_1ED8824FD)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: suggestion array generated"), "-[PLBLDService batteryBreakdownWithPayload:]", 199);
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "lastPathComponent");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "logMessage:fromFile:fromFunction:fromLineNumber:", v83, v86, v87, 199);

        PLLogCommon();
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v97;
          v114 = v83;
          _os_log_debug_impl(&dword_1CAF47000, v88, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v24 = (void *)v102;
      }
    }
    objc_msgSend(v81, "serialized");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v89);

    v57 = v105;
  }
  else
  {
    -[PLOperator logEntry:](self, "logEntry:", v81);
  }
  -[PLBatteryBreakdownService clearState](self, "clearState");
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v90 = objc_opt_class();
    v107[0] = MEMORY[0x1E0C809B0];
    v107[1] = v54;
    v107[2] = __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_83;
    v107[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v107[4] = v90;
    if (qword_1ED882530 != -1)
      dispatch_once(&qword_1ED882530, v107);
    if (byte_1ED8824FE)
    {
      v106 = v57;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s/%d: allEntries=%@"), "-[PLBLDService batteryBreakdownWithPayload:]", 210, v24);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v92 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLBLDService.m");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "lastPathComponent");
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBLDService batteryBreakdownWithPayload:]");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "logMessage:fromFile:fromFunction:fromLineNumber:", v91, v94, v95, 210);

      PLLogCommon();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = v97;
        v114 = v91;
        _os_log_debug_impl(&dword_1CAF47000, v96, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v24 = (void *)v102;
      v57 = v106;
    }
  }

  return v24;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8824F9 = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_52(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8824FA = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_59(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8824FB = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_69(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8824FC = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_78(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8824FD = result;
  return result;
}

uint64_t __44__PLBLDService_batteryBreakdownWithPayload___block_invoke_83(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED8824FE = result;
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
  block[3] = &unk_1E85780C8;
  block[4] = self;
  if (qword_1ED882538 != -1)
    dispatch_once(&qword_1ED882538, block);
  v5 = objc_alloc(MEMORY[0x1E0D7FFB0]);
  v6 = (void *)objc_msgSend(v5, "initWithEntryKey:", qword_1ED882540);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("BLDRetail"));
  objc_msgSend(v6, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("LastUpDateTime"));

  objc_msgSend(MEMORY[0x1E0D80078], "JSONSanitizeDictionary:", v4);
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
  v1 = (void *)qword_1ED882540;
  qword_1ED882540 = v0;

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
