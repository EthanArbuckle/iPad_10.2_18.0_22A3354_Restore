@implementation PLTimeManager

- (int)bucketTimeStampForDate:(id)a3 withTimeReference:(int64_t)a4 withBucketInterval:(int)a5
{
  uint64_t v5;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  int v13;
  double v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  double v35;
  double v36;
  _BOOL4 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];
  _QWORD block[6];

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  -[PLTimeManager hourBucketBaseSnapOffsetWithMonotonicTime:](self, "hourBucketBaseSnapOffsetWithMonotonicTime:", a4);
  v10 = v9;
  -[PLTimeManager bucketNSDate:withBucketInterval:](self, "bucketNSDate:withBucketInterval:", v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = (int)v12;

  v14 = (double)v13;
  v15 = (int)((double)v13 - v10);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v16 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce != -1)
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce, block);
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled)
    {
      v17 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("MonotonicDate %@, timeReference: %@, bucketInterval %d"), v8, v18, v5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastPathComponent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v19, v21, v22, 279);

      PLLogCommon();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v24 = v15 + v5;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v25 = objc_opt_class();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_48;
    v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v55[4] = v25;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_46 != -1)
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_46, v55);
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_47)
    {
      v26 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v14);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v24);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", CFSTR("BucketTickInSameClock %@ LowerTick %@, UpperTick %@"), v27, v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "lastPathComponent");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v30, v32, v33, 281);

      PLLogCommon();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(v8, "timeIntervalSince1970");
  v36 = v35;
  v37 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v36 < (double)v24)
  {
    if (!v37)
      goto LABEL_30;
    v38 = objc_opt_class();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_53;
    v54[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v54[4] = v38;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_51 != -1)
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_51, v54);
    if (!bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_52)
      goto LABEL_30;
    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v15);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Returning lowerTick %@"), v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "lastPathComponent");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v43, v44, 284);

    PLLogCommon();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_29:

LABEL_30:
    v24 = v15;
    goto LABEL_31;
  }
  if (v37)
  {
    v46 = objc_opt_class();
    v53[0] = MEMORY[0x1E0C809B0];
    v53[1] = 3221225472;
    v53[2] = __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_58;
    v53[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v53[4] = v46;
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_56 != -1)
      dispatch_once(&bucketTimeStampForDate_withTimeReference_withBucketInterval__defaultOnce_56, v53);
    if (bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_57)
    {
      v47 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v24);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "stringWithFormat:", CFSTR("Returning upperTick %@"), v48);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "lastPathComponent");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeManager bucketTimeStampForDate:withTimeReference:withBucketInterval:]");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v41, v50, v51, 287);

      PLLogCommon();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
      v15 = v24;
      goto LABEL_29;
    }
  }
LABEL_31:

  return v24;
}

- (id)bucketNSDate:(id)a3 withBucketInterval:(int)a4
{
  void *v5;
  double v6;

  v5 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(a3, "timeIntervalSince1970");
  return (id)objc_msgSend(v5, "dateWithTimeIntervalSince1970:", (double)((int)v6 / a4 * a4));
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__PLTimeManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_instance;
}

- (double)hourBucketBaseSnapOffsetWithMonotonicTime:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[PLTimeManager timeReferences](self, "timeReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getHourBucketOffset");
  v8 = v7;

  return v8;
}

- (id)currentTimeFromTimeReference:(int64_t)a3 toTimeReference:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[PLTimeManager timeReferences](self, "timeReferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeManager convertTime:fromTimeReference:toTimeReference:](self, "convertTime:fromTimeReference:toTimeReference:", v10, a3, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)convertTime:(id)a3 fromTimeReference:(int64_t)a4 toTimeReference:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a3;
  -[PLTimeManager timeReferences](self, "timeReferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeManager timeReferences](self, "timeReferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "removeTimeOffsetFromReferenceTime:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addTimeOffsetToMonotonicTime:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSDictionary)timeReferences
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

void __31__PLTimeManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_instance;
  sharedInstance_instance = (uint64_t)v0;

}

- (id)storageQueue
{
  void *v2;
  void *v3;

  +[PLCoreStorage storageQueueNameForClass:](PLCoreStorage, "storageQueueNameForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (PLTimeManager)init
{
  PLTimeManager *v2;
  void *v3;
  PLTimeReference *v4;
  PLTimeReferenceKernel *v5;
  PLTimeReferenceSystem *v6;
  PLTimeReferenceBaseband *v7;
  uint64_t v8;
  NSDictionary *timeReferences;
  void *v10;
  uint64_t v11;
  PLTimeManager *v12;
  void *v13;
  PLTimeManager *v14;
  _QWORD v16[4];
  PLTimeManager *v17;
  _QWORD v18[4];
  PLTimeManager *v19;
  objc_super v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)PLTimeManager;
  v2 = -[PLTimeManager init](&v20, sel_init);
  if (v2)
  {
    +[PLSQLiteConnection sharedSQLiteConnection](PLSQLiteConnection, "sharedSQLiteConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_connection, v3);

    v4 = -[PLTimeReference initWithTimeManager:entryDefinitionKey:timeReferenceType:]([PLTimeReference alloc], "initWithTimeManager:entryDefinitionKey:timeReferenceType:", v2, CFSTR("monotonic"), 0);
    v5 = -[PLTimeReference initWithTimeManager:entryDefinitionKey:timeReferenceType:]([PLTimeReferenceKernel alloc], "initWithTimeManager:entryDefinitionKey:timeReferenceType:", v2, CFSTR("kernel"), 2);
    v6 = -[PLTimeReferenceDynamic initWithTimeManager:entryDefinitionKey:timeReferenceType:]([PLTimeReferenceSystem alloc], "initWithTimeManager:entryDefinitionKey:timeReferenceType:", v2, CFSTR("system"), 1);
    v7 = -[PLTimeReferenceBaseband initWithTimeManager:entryDefinitionKey:timeReferenceType:]([PLTimeReferenceBaseband alloc], "initWithTimeManager:entryDefinitionKey:timeReferenceType:", v2, CFSTR("baseband"), 3);
    v21[0] = &unk_1E6ABAA78;
    v21[1] = &unk_1E6ABAA90;
    v22[0] = v4;
    v22[1] = v5;
    v21[2] = &unk_1E6ABAAA8;
    v21[3] = &unk_1E6ABAAC0;
    v22[2] = v6;
    v22[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
    v8 = objc_claimAutoreleasedReturnValue();
    timeReferences = v2->_timeReferences;
    v2->_timeReferences = (NSDictionary *)v8;

    objc_msgSend((id)objc_opt_class(), "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __21__PLTimeManager_init__block_invoke;
    v18[3] = &unk_1E6A52C20;
    v12 = v2;
    v19 = v12;
    -[PLTimeReferenceDynamic registerForTimeChangedCallbackWithIdentifier:usingBlock:](v6, "registerForTimeChangedCallbackWithIdentifier:usingBlock:", v10, v18);

    objc_msgSend((id)objc_opt_class(), "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v11;
    v16[1] = 3221225472;
    v16[2] = __21__PLTimeManager_init__block_invoke_20;
    v16[3] = &unk_1E6A52C20;
    v14 = v12;
    v17 = v14;
    -[PLTimeReferenceDynamic registerForTimeChangedCallbackWithIdentifier:usingBlock:](v7, "registerForTimeChangedCallbackWithIdentifier:usingBlock:", v13, v16);

    -[PLTimeManager getBootSessionUUID](v14, "getBootSessionUUID");
  }
  return v2;
}

uint64_t __21__PLTimeManager_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  PLLogTimeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __21__PLTimeManager_init__block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "logTimeEntry");
}

uint64_t __21__PLTimeManager_init__block_invoke_20(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  PLLogTimeManager();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __21__PLTimeManager_init__block_invoke_20_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  return objc_msgSend(*(id *)(a1 + 32), "logTimeEntry");
}

- (void)getBootSessionUUID
{
  void *v2;
  id v3;

  -[PLTimeManager timeReferences](self, "timeReferences");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", &unk_1E6ABAA90);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRebootOccurred:", +[PLUtilities deviceRebooted](PLUtilities, "deviceRebooted"));

}

- (void)initializeTimeOffsets
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B6AB6000, log, OS_LOG_TYPE_DEBUG, "PLTimeManager::initializeTimeOffsets", v1, 2u);
}

- (id)initialMonotonicTime
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__PLTimeManager_initialMonotonicTime__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  if (initialMonotonicTime_onceToken != -1)
    dispatch_once(&initialMonotonicTime_onceToken, block);
  return (id)initialMonotonicTime_initialMonotonicTime;
}

void __37__PLTimeManager_initialMonotonicTime__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t block;
  uint64_t v9;
  BOOL (*v10)(uint64_t);
  void *v11;
  uint64_t v12;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)initialMonotonicTime_initialMonotonicTime;
  initialMonotonicTime_initialMonotonicTime = v0;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __37__PLTimeManager_initialMonotonicTime__block_invoke_2;
    v11 = &__block_descriptor_40_e5_v8__0lu32l8;
    v12 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_0, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLTimeManager::initialMonotonicTime=%@"), initialMonotonicTime_initialMonotonicTime, block, v9, v10, v11, v12);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeManager initialMonotonicTime]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 160);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __37__PLTimeManager_initialMonotonicTime__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_0 = result;
  return result;
}

- (double)timeOffsetForTimeReference:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[PLTimeManager timeReferences](self, "timeReferences");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "offset");
  v8 = v7;

  return v8;
}

- (void)registerForTimeChangedCallbackWithIdentifier:(id)a3 forTimeReference:(int64_t)a4 usingBlock:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a5;
  -[PLTimeManager timeReferences](self, "timeReferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_respondsToSelector();

  if ((v12 & 1) != 0)
  {
    -[PLTimeManager timeReferences](self, "timeReferences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerForTimeChangedCallbackWithIdentifier:usingBlock:", v16, v8);

  }
}

- (void)unregisterForTimeChangedCallbackWithIdentifier:(id)a3 forTimeReference:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[PLTimeManager timeReferences](self, "timeReferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PLTimeManager timeReferences](self, "timeReferences");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unregisterForTimeChangedCallbackWithIdentifier:", v13);

  }
}

- (double)hourBucketBaseSnapOffsetWithMonotonicTimeNow:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  if (!a3)
    return 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeManager convertTime:fromTimeReference:toTimeReference:](self, "convertTime:fromTimeReference:toTimeReference:", v5, 0, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeManager bucketNSDate:withBucketInterval:](self, "bucketNSDate:withBucketInterval:", v6, 3600);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeManager bucketNSDate:withBucketInterval:](self, "bucketNSDate:withBucketInterval:", v5, 3600);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeManager convertTime:fromTimeReference:toTimeReference:](self, "convertTime:fromTimeReference:toTimeReference:", v8, 0, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v7);
  if (v10 >= 0.0)
    v11 = v10;
  else
    v11 = v10 + 3600.0;
  if (a3 == 1)
  {
    -[PLTimeManager timeZoneHourBucketShift:](self, "timeZoneHourBucketShift:", v11);
    v11 = v12;
  }

  return v11;
}

- (double)timeZoneHourBucketShift:(double)a3
{
  void *v4;
  uint64_t v5;
  unint64_t v6;
  double v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  double v14;
  double v15;
  _QWORD block[5];

  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "secondsFromGMT");
  HIDWORD(v6) = -2023406815 * v5 + 9544368;
  LODWORD(v6) = HIDWORD(v6);
  if ((v6 >> 4) >= 0x123457)
    v7 = 1800.0;
  else
    v7 = 0.0;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v8 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__PLTimeManager_timeZoneHourBucketShift___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v8;
    if (timeZoneHourBucketShift__defaultOnce != -1)
      dispatch_once(&timeZoneHourBucketShift__defaultOnce, block);
    if (timeZoneHourBucketShift__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("OffsetComputation: secondsFromGMT: %ld timeZoneDelta: %f"), v5, *(_QWORD *)&v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Storage/PLTimeManager.m");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "lastPathComponent");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimeManager timeZoneHourBucketShift:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v11, v12, 246);

      PLLogCommon();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v14 = -v7;
  if (v7 >= a3)
    v14 = v7;
  v15 = v14 + a3;

  return v15;
}

BOOL __41__PLTimeManager_timeZoneHourBucketShift___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timeZoneHourBucketShift__classDebugEnabled = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_48(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_47 = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_53(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_52 = result;
  return result;
}

BOOL __77__PLTimeManager_bucketTimeStampForDate_withTimeReference_withBucketInterval___block_invoke_58(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  bucketTimeStampForDate_withTimeReference_withBucketInterval__classDebugEnabled_57 = result;
  return result;
}

- (void)logTimeEntry
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[8];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
    || +[PLUtilities shouldLogPreUnlockTelemetry](PLUtilities, "shouldLogPreUnlockTelemetry"))
  {
    PLLogTimeManager();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "Do not log to time offset table in pre unlock or in helperd case", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[PLTimeManager timeReferences](self, "timeReferences", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v10, "timeReferenceType"))
          {
            v11 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v10, "offset");
            objc_msgSend(v11, "numberWithDouble:");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "entryDefinitionKey");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v12, v13);

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      }
      while (v7);
    }

    -[PLTimeManager storageOperator](self, "storageOperator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logEventForwardTimeOffset:", v3);

  }
}

- (PLStorageOperator)storageOperator
{
  return (PLStorageOperator *)objc_loadWeakRetained((id *)&self->_storageOperator);
}

- (void)setStorageOperator:(id)a3
{
  objc_storeWeak((id *)&self->_storageOperator, a3);
}

- (PLSQLiteConnection)connection
{
  return (PLSQLiteConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void)setTimeReferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)notificationsToTimeReferences
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNotificationsToTimeReferences:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationsToTimeReferences, 0);
  objc_storeStrong((id *)&self->_timeReferences, 0);
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_storageOperator);
}

void __21__PLTimeManager_init__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a1, a3, "PLTimeManager::system time changed: delta=%f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __21__PLTimeManager_init__block_invoke_20_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a1, a3, "PLTimeManager::baseband time changed: delta=%f", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
