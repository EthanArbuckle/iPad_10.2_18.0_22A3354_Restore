@implementation PLTimeReference

- (id)removeTimeOffsetFromReferenceTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;

  v4 = a3;
  -[PLTimeReference offset](self, "offset");
  if (v5 == 3.40282347e38)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  }
  else
  {
    -[PLTimeReference offset](self, "offset");
    objc_msgSend(v4, "dateByAddingTimeInterval:", -v6);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)addTimeOffsetToMonotonicTime:(id)a3
{
  id v4;
  double v5;
  void *v6;

  v4 = a3;
  -[PLTimeReference offset](self, "offset");
  if (v5 == 3.40282347e38)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  }
  else
  {
    -[PLTimeReference offset](self, "offset");
    objc_msgSend(v4, "dateByAddingTimeInterval:");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)offset
{
  return self->_offset;
}

- (double)getHourBucketOffset
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  double hourBucketOffset;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  double v22;
  double v23;
  _QWORD v25[5];
  _QWORD block[5];

  objc_sync_enter(CFSTR("__hourBucketOffsetSync__"));
  if (self->_hourBucketOffset == 3.40282347e38)
  {
    v10 = (void *)objc_opt_class();
    -[PLTimeReference entryDefinitionKey](self, "entryDefinitionKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hourBucketOffsetKeyFromEntryDefinitionKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v14 = objc_opt_class();
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __38__PLTimeReference_getHourBucketOffset__block_invoke_18;
        v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v25[4] = v14;
        if (getHourBucketOffset_defaultOnce_16 != -1)
          dispatch_once(&getHourBucketOffset_defaultOnce_16, v25);
        if (getHourBucketOffset_classDebugEnabled_17)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v13, "doubleValue");
          objc_msgSend(v15, "stringWithFormat:", CFSTR("HourBucketOffset: Offset value from defaults :%f"), v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReference.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReference getHourBucketOffset]");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 86);

          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      objc_msgSend(v13, "doubleValue");
      hourBucketOffset = v22;
      self->_hourBucketOffset = v22;
    }
    else
    {
      -[PLTimeReference computeHourBucketOffset](self, "computeHourBucketOffset");
      hourBucketOffset = v23;
    }

  }
  else
  {
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v3 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __38__PLTimeReference_getHourBucketOffset__block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v3;
      if (getHourBucketOffset_defaultOnce != -1)
        dispatch_once(&getHourBucketOffset_defaultOnce, block);
      if (getHourBucketOffset_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HourBucketOffset: Precomputed offset value: %f"), *(_QWORD *)&self->_hourBucketOffset);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReference.m");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "lastPathComponent");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReference getHourBucketOffset]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 79);

        PLLogCommon();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    hourBucketOffset = self->_hourBucketOffset;
  }
  objc_sync_exit(CFSTR("__hourBucketOffsetSync__"));
  return hourBucketOffset;
}

- (PLTimeReference)initWithTimeManager:(id)a3 entryDefinitionKey:(id)a4 timeReferenceType:(int64_t)a5
{
  id v9;
  id v10;
  PLTimeReference *v11;
  PLTimeReference *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLTimeReference;
  v11 = -[PLTimeReference init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_timeManager, a3);
    v12->_timeReferenceType = a5;
    objc_storeStrong((id *)&v12->_entryDefinitionKey, a4);
    v12->_offset = 3.40282347e38;
    v12->_hourBucketOffset = 3.40282347e38;
  }

  return v12;
}

- (void)initializeOffsetWithEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  id v15;

  v4 = a3;
  v15 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v15, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLTimeReference entryDefinitionKey](self, "entryDefinitionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    self->_offset = v8;
LABEL_8:

    goto LABEL_9;
  }
  v9 = (void *)objc_opt_class();
  -[PLTimeReference entryDefinitionKey](self, "entryDefinitionKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "defaultsKeyFromEntryDefinitionKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    -[PLTimeReference currentTime](self, "currentTime");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLTimeReference timeManager](self, "timeManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "initialMonotonicTime");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v13);
    self->_offset = v14;

    goto LABEL_8;
  }
  objc_msgSend(v5, "doubleValue");
  self->_offset = v12;
LABEL_9:

  -[PLTimeReference writeOffsetToDefaults](self, "writeOffsetToDefaults");
}

- (void)setOffset:(double)a3
{
  if (self->_offset != a3)
  {
    self->_offset = a3;
    -[PLTimeReference writeOffsetToDefaults](self, "writeOffsetToDefaults");
  }
}

- (double)computeHourBucketOffset
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double hourBucketOffset;
  uint64_t block;
  uint64_t v19;
  BOOL (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __42__PLTimeReference_computeHourBucketOffset__block_invoke;
    v21 = &__block_descriptor_40_e5_v8__0lu32l8;
    v22 = v3;
    if (computeHourBucketOffset_defaultOnce != -1)
      dispatch_once(&computeHourBucketOffset_defaultOnce, &block);
    if (computeHourBucketOffset_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("HourBucketOffset: Computing new offset for timeReference:%ld"), self->_timeReferenceType, block, v19, v20, v21, v22);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReference.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReference computeHourBucketOffset]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 65);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_sync_enter(CFSTR("__hourBucketOffsetSync__"));
  -[PLTimeReference timeManager](self, "timeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hourBucketBaseSnapOffsetWithMonotonicTimeNow:", self->_timeReferenceType);
  self->_hourBucketOffset = v10;

  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[PLTimeReference hourBucketOffset](self, "hourBucketOffset");
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  -[PLTimeReference entryDefinitionKey](self, "entryDefinitionKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hourBucketOffsetKeyFromEntryDefinitionKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v12, v15, 1);

  hourBucketOffset = self->_hourBucketOffset;
  objc_sync_exit(CFSTR("__hourBucketOffsetSync__"));
  return hourBucketOffset;
}

BOOL __42__PLTimeReference_computeHourBucketOffset__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  computeHourBucketOffset_classDebugEnabled = result;
  return result;
}

BOOL __38__PLTimeReference_getHourBucketOffset__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getHourBucketOffset_classDebugEnabled = result;
  return result;
}

BOOL __38__PLTimeReference_getHourBucketOffset__block_invoke_18(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  getHourBucketOffset_classDebugEnabled_17 = result;
  return result;
}

- (id)currentTime
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PLTimeReference_currentTime__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (currentTime_defaultOnce_0 != -1)
      dispatch_once(&currentTime_defaultOnce_0, block);
    if (currentTime_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReference::currentTime WARNING: inherited class must implement"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReference.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReference currentTime]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 98);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  return 0;
}

BOOL __30__PLTimeReference_currentTime__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  currentTime_classDebugEnabled_0 = result;
  return result;
}

- (void)writeOffsetToDefaults
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
  id v12;

  if (!+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    -[PLTimeReference offset](self, "offset");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_opt_class();
    -[PLTimeReference entryDefinitionKey](self, "entryDefinitionKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "defaultsKeyFromEntryDefinitionKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v4, v7, 1);

    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[PLTimeReference timeManager](self, "timeManager");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "currentTimeFromTimeReference:toTimeReference:", 2, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "defaultsKeyFromEntryDefinitionKey:", CFSTR("monotonic"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v10, v11, 1);

  }
}

+ (id)defaultsKeyFromEntryDefinitionKey:(id)a3
{
  return (id)objc_msgSend(CFSTR("TimeOffset-"), "stringByAppendingString:", a3);
}

+ (id)hourBucketOffsetKeyFromEntryDefinitionKey:(id)a3
{
  return (id)objc_msgSend(CFSTR("HourBucketOffset-"), "stringByAppendingString:", a3);
}

- (void)registerForDayChangedNotification
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__PLTimeReference_registerForDayChangedNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (registerForDayChangedNotification_defaultOnce != -1)
      dispatch_once(&registerForDayChangedNotification_defaultOnce, block);
    if (registerForDayChangedNotification_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReference::registerForDayChangedNotification WARNING: inherited class must implement"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReference.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReference registerForDayChangedNotification]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 135);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __52__PLTimeReference_registerForDayChangedNotification__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerForDayChangedNotification_classDebugEnabled = result;
  return result;
}

- (void)registerForTimeZoneChangedNotification
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__PLTimeReference_registerForTimeZoneChangedNotification__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v2;
    if (registerForTimeZoneChangedNotification_defaultOnce != -1)
      dispatch_once(&registerForTimeZoneChangedNotification_defaultOnce, block);
    if (registerForTimeZoneChangedNotification_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeReference::registerForDayChangedNotification WARNING: inherited class must implement"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeReference.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeReference registerForTimeZoneChangedNotification]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 138);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __57__PLTimeReference_registerForTimeZoneChangedNotification__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  registerForTimeZoneChangedNotification_classDebugEnabled = result;
  return result;
}

- (PLTimeReferenceManager)timeManager
{
  return (PLTimeReferenceManager *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTimeManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int64_t)timeReferenceType
{
  return self->_timeReferenceType;
}

- (void)setTimeReferenceType:(int64_t)a3
{
  self->_timeReferenceType = a3;
}

- (NSString)entryDefinitionKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setEntryDefinitionKey:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (double)hourBucketOffset
{
  return self->_hourBucketOffset;
}

- (void)setHourBucketOffset:(double)a3
{
  self->_hourBucketOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryDefinitionKey, 0);
  objc_storeStrong((id *)&self->_timeManager, 0);
}

@end
