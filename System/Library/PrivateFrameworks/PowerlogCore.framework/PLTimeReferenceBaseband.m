@implementation PLTimeReferenceBaseband

- (void)setFollowupCurrentTimeRunning:(BOOL)a3
{
  self->_followupCurrentTimeRunning = a3;
}

- (BOOL)followupCurrentTimeRunning
{
  return self->_followupCurrentTimeRunning;
}

- (id)currentTime
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  objc_super v23;
  _QWORD v24[5];
  _QWORD block[5];
  _QWORD v26[5];

  if (+[PLPlatform hasBaseband](PLPlatform, "hasBaseband"))
  {
    +[PLABMClient sharedABMClient](PLABMClient, "sharedABMClient");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getBasebandTimeAndLatency");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v5 = objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    if (-[PLTimeReferenceBaseband followupCurrentTimeRunning](self, "followupCurrentTimeRunning"))
    {
      objc_sync_exit(v5);
    }
    else
    {
      -[PLTimeReferenceBaseband setFollowupCurrentTimeRunning:](self, "setFollowupCurrentTimeRunning:", 1);
      objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLTimeReferenceDynamic setLastQueryTime:](self, "setLastQueryTime:", v13);

      objc_sync_exit(v5);
      +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
      v5 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke_25;
      block[3] = &unk_1E6A52050;
      block[4] = self;
      dispatch_async(v5, block);
    }

    if (v4)
    {
      objc_msgSend(v4, "time");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "latency");
      objc_msgSend(v14, "dateByAddingTimeInterval:", -v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v16 = objc_opt_class();
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke_32;
        v24[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v24[4] = v16;
        if (currentTime_defaultOnce_30 != -1)
          dispatch_once(&currentTime_defaultOnce_30, v24);
        if (currentTime_classDebugEnabled_31)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceBaseband::currentTime=%@"), v12);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceBaseband currentTime]");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 141);

          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      v23.receiver = self;
      v23.super_class = (Class)PLTimeReferenceBaseband;
      -[PLTimeReferenceDynamic checkForTimeChangeWithCurrentTime:](&v23, sel_checkForTimeChangeWithCurrentTime_, v12);
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v6 = objc_opt_class();
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = v6;
      if (currentTime_defaultOnce != -1)
        dispatch_once(&currentTime_defaultOnce, v26);
      if (currentTime_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceBaseband::currentTime: This device doesn't have a baseband. Getting system time instead"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceBaseband currentTime]");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 96);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    -[PLTimeReference timeManager](self, "timeManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "currentTimeFromTimeReference:toTimeReference:", 1, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (PLTimeReferenceBaseband)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5
{
  PLTimeReferenceBaseband *v5;
  PLTimeReferenceBaseband *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PLTimeReferenceBaseband;
  v5 = -[PLTimeReferenceDynamic initWithTimeManager:entryDefinitionKey:timeReferenceType:](&v10, sel_initWithTimeManager_entryDefinitionKey_timeReferenceType_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    v5->_followupCurrentTimeRunning = 0;
    v9.receiver = v5;
    v9.super_class = (Class)PLTimeReferenceBaseband;
    -[PLTimeReferenceDynamic setTooFarInFutureDistance:](&v9, sel_setTooFarInFutureDistance_, 60.0);
    v8.receiver = v6;
    v8.super_class = (Class)PLTimeReferenceBaseband;
    -[PLTimeReferenceDynamic setTooFarInPastDistance:](&v8, sel_setTooFarInPastDistance_, 3600.0);
  }
  return v6;
}

- (void)registerForTimeChangedNotification
{
  PLNSNotificationOperatorComposition *v3;
  void *v4;
  PLNSNotificationOperatorComposition *v5;
  PLNSNotificationOperatorComposition *basebandTimeNotification;
  _QWORD v7[5];

  v3 = [PLNSNotificationOperatorComposition alloc];
  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PLTimeReferenceBaseband_registerForTimeChangedNotification__block_invoke;
  v7[3] = &unk_1E6A52118;
  v7[4] = self;
  v5 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotification:withBlock:](v3, "initWithWorkQueue:forNotification:withBlock:", v4, CFSTR("BasebandTimeChangeNotification"), v7);
  basebandTimeNotification = self->_basebandTimeNotification;
  self->_basebandTimeNotification = v5;

}

uint64_t __61__PLTimeReferenceBaseband_registerForTimeChangedNotification__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "timeChangedNotificationReceived:", a2);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PLTimeReferenceBaseband;
  -[PLTimeReferenceBaseband dealloc](&v2, sel_dealloc);
}

BOOL __38__PLTimeReferenceBaseband_currentTime__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  currentTime_classDebugEnabled = result;
  return result;
}

void __38__PLTimeReferenceBaseband_currentTime__block_invoke_25(uint64_t a1)
{
  void *v2;
  int v3;
  double v4;
  int v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_super v18;
  _QWORD block[5];

  v2 = 0;
  v3 = 0;
  v4 = 0.0;
  v5 = 5;
  do
  {
    +[PLABMClient sharedABMClient](PLABMClient, "sharedABMClient");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBasebandTimeAndLatency");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "latency");
      v4 = v4 + v8;
      ++v3;
      v9 = v7;

      v2 = v9;
    }

    --v5;
  }
  while (v5);
  if (v3 > 0)
  {
    objc_msgSend(v2, "time");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateByAddingTimeInterval:", -v4 / (double)v3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v12 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLTimeReferenceBaseband_currentTime__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v12;
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce != -1)
        dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce, block);
      if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceBaseband::currentTime - followupCurrentTime=%@"), v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "lastPathComponent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceBaseband currentTime]_block_invoke");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v13, v15, v16, 131);

        PLLogCommon();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    v18.receiver = *(id *)(a1 + 32);
    v18.super_class = (Class)PLTimeReferenceBaseband;
    objc_msgSendSuper2(&v18, sel_checkForTimeChangeWithCurrentTime_, v11);

  }
  objc_msgSend(*(id *)(a1 + 32), "setFollowupCurrentTimeRunning:", 0);

}

BOOL __38__PLTimeReferenceBaseband_currentTime__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled = result;
  return result;
}

BOOL __38__PLTimeReferenceBaseband_currentTime__block_invoke_32(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  currentTime_classDebugEnabled_31 = result;
  return result;
}

- (void)timeChangedNotificationReceived:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_super v23;
  _QWORD block[5];

  v4 = (objc_class *)MEMORY[0x1E0C99D78];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("year"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setYear:", objc_msgSend(v7, "integerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("month"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMonth:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("day"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDay:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("hour"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHour:", objc_msgSend(v10, "integerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("minute"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinute:", objc_msgSend(v11, "integerValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("second"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setSecond:", objc_msgSend(v12, "integerValue"));
  v13 = objc_alloc(MEMORY[0x1E0C99D48]);
  v14 = (void *)objc_msgSend(v13, "initWithCalendarIdentifier:", *MEMORY[0x1E0C99760]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v15);

  objc_msgSend(v14, "dateFromComponents:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v17 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PLTimeReferenceBaseband_timeChangedNotificationReceived___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v17;
    if (timeChangedNotificationReceived__defaultOnce != -1)
      dispatch_once(&timeChangedNotificationReceived__defaultOnce, block);
    if (timeChangedNotificationReceived__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceBaseband::timeChangedNotificationReceived currentTime=%@"), v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceBaseband.m");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceBaseband timeChangedNotificationReceived:]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 164);

      PLLogCommon();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v23.receiver = self;
  v23.super_class = (Class)PLTimeReferenceBaseband;
  -[PLTimeReferenceDynamic checkForTimeChangeWithCurrentTime:](&v23, sel_checkForTimeChangeWithCurrentTime_, v16);

}

BOOL __59__PLTimeReferenceBaseband_timeChangedNotificationReceived___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timeChangedNotificationReceived__classDebugEnabled = result;
  return result;
}

- (PLNSNotificationOperatorComposition)basebandTimeNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 112, 1);
}

- (void)setBasebandTimeNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_basebandTimeNotification, 0);
}

@end
