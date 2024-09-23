@implementation PLTimeReferenceSystem

- (void)registerForTimeChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)timeChangedNotificationReceived, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)registerForClockSetNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)clockSetNotificationReceived, CFSTR("com.apple.system.clock_set"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)registerForDayChangedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_dayChangedNotificationReceived_, *MEMORY[0x1E0C99690], 0);

}

- (void)registerForTimeZoneChangedNotification
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_timeZoneChangedNotificationReceived_, *MEMORY[0x1E0C998A0], 0);

}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("SignificantTimeChangeNotification"), 0);
  v4.receiver = self;
  v4.super_class = (Class)PLTimeReferenceSystem;
  -[PLTimeReferenceSystem dealloc](&v4, sel_dealloc);
}

- (id)currentTime
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeReferenceDynamic setLastQueryTime:](self, "setLastQueryTime:", v4);

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__PLTimeReferenceSystem_currentTime__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (currentTime_defaultOnce_1 != -1)
      dispatch_once(&currentTime_defaultOnce_1, block);
    if (currentTime_classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceSystem::currentTime=%@"), v3);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceSystem.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceSystem currentTime]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 46);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLIOKitOperatorComposition initWithOperator:forService:withBlock:].cold.1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PLTimeReferenceSystem;
  -[PLTimeReferenceDynamic checkForTimeChangeWithCurrentTime:](&v18, sel_checkForTimeChangeWithCurrentTime_, v3);
  return v3;
}

BOOL __36__PLTimeReferenceSystem_currentTime__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  currentTime_classDebugEnabled_1 = result;
  return result;
}

- (void)timeChangedToMidnightLocalTime
{
  void *v3;
  void *v4;
  void (**v5)(_QWORD, double);
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD block[5];
  objc_super v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)PLTimeReferenceSystem;
  -[PLTimeReferenceDynamic timeChangeBlocks](&v20, sel_timeChangeBlocks);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v3);
  v19.receiver = self;
  v19.super_class = (Class)PLTimeReferenceSystem;
  -[PLTimeReferenceDynamic timeChangeBlocks](&v19, sel_timeChangeBlocks);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PLCoreStorage"));
  v5 = (void (**)(_QWORD, double))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5[2](v5, 0.0);
  }
  else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLTimeReferenceSystem_timeChangedToMidnightLocalTime__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (timeChangedToMidnightLocalTime_defaultOnce != -1)
      dispatch_once(&timeChangedToMidnightLocalTime_defaultOnce, block);
    if (timeChangedToMidnightLocalTime_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReferenceSystem::timeChangedToMidnightLocalTime: No timeChangeBlock for PLCoreStorage"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReferenceClasses/PLTimeReferenceSystem.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReferenceSystem timeChangedToMidnightLocalTime]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 55);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLIOKitOperatorComposition initWithOperator:forService:withBlock:].cold.1((uint64_t)v7, v11, v12, v13, v14, v15, v16, v17);

    }
  }

  objc_sync_exit(v3);
}

BOOL __55__PLTimeReferenceSystem_timeChangedToMidnightLocalTime__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timeChangedToMidnightLocalTime_classDebugEnabled = result;
  return result;
}

@end
