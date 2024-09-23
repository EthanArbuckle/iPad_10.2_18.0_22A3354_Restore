@implementation PLActivityCriterionTime

- (PLMonotonicTimer)timer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 40, 1);
}

- (double)interval
{
  return self->_interval;
}

- (void)didCompleteActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD block[5];

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__PLActivityCriterionTime_didCompleteActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didCompleteActivity__defaultOnce_0 != -1)
      dispatch_once(&didCompleteActivity__defaultOnce_0, block);
    if (didCompleteActivity__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionTime::didCompleteActivity:%@ for criterion=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionTime didCompleteActivity:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 68);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PLActivityCriterionTime;
  -[PLActivityCriterion didCompleteActivity:](&v14, sel_didCompleteActivity_, v4);
  -[PLActivityCriterion setSatisfied:](self, "setSatisfied:", 0);
  v11 = (void *)MEMORY[0x1E0C99D68];
  -[PLActivityCriterionTime interval](self, "interval");
  objc_msgSend(v11, "monotonicDateWithTimeIntervalSinceNow:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLActivityCriterionTime timer](self, "timer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMonotonicFireDate:", v12);

}

- (PLActivityCriterionTime)initWithInterval:(double)a3
{
  PLActivityCriterionTime *v4;
  double v5;
  PLActivityCriterionTime *v6;
  objc_super v8;

  if (a3 <= 0.0)
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PLActivityCriterionTime;
    v4 = -[PLActivityCriterion init](&v8, sel_init);
    if (v4)
    {
      objc_msgSend((id)objc_opt_class(), "minTimeInterval");
      if (v5 <= a3)
        v5 = a3;
      v4->_interval = v5;
    }
    self = v4;
    v6 = self;
  }

  return v6;
}

+ (id)timeCriterionWithInterval:(double)a3
{
  return -[PLActivityCriterionTime initWithInterval:]([PLActivityCriterionTime alloc], "initWithInterval:", a3);
}

+ (double)minTimeInterval
{
  double v2;
  _QWORD v4[4];
  __CFString *v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__PLActivityCriterionTime_minTimeInterval__block_invoke;
  v4[3] = &unk_1E6A527D8;
  v5 = CFSTR("PLActivityCriterionTime_minTimeInterval");
  v6 = 0x404E000000000000;
  if (minTimeInterval_defaultOnce != -1)
    dispatch_once(&minTimeInterval_defaultOnce, v4);
  v2 = *(double *)&minTimeInterval_objectForKey;

  return v2;
}

uint64_t __42__PLActivityCriterionTime_minTimeInterval__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  result = +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));
  minTimeInterval_objectForKey = v2;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[PLMonotonicTimer cancel](self->_timer, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)PLActivityCriterionTime;
  -[PLActivityCriterionTime dealloc](&v3, sel_dealloc);
}

- (void)didEnableActivity:(id)a3
{
  id v4;
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  objc_super v26;
  _QWORD block[6];

  v4 = a3;
  v5 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v6 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__PLActivityCriterionTime_didEnableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (didEnableActivity__defaultOnce_1 != -1)
      dispatch_once(&didEnableActivity__defaultOnce_1, block);
    if (didEnableActivity__classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionTime::didEnableActivity:%@ for criterion=%@"), v4, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionTime didEnableActivity:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 49);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  v26.receiver = self;
  v26.super_class = (Class)PLActivityCriterionTime;
  -[PLActivityCriterion didEnableActivity:](&v26, sel_didEnableActivity_, v4);
  -[PLActivityCriterion delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "lastCompletedDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[PLActivityCriterion delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "lastCompletedDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[PLActivityCriterionTime interval](self, "interval");
  objc_msgSend(v15, "dateByAddingTimeInterval:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __45__PLActivityCriterionTime_didEnableActivity___block_invoke_21;
    v25[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v25[4] = objc_opt_class();
    if (didEnableActivity__defaultOnce_19 != -1)
      dispatch_once(&didEnableActivity__defaultOnce_19, v25);
    if (didEnableActivity__classDebugEnabled_20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionTime::didEnableActivity:%@ for criterion=%@, lastCompletedDate=%@, fireDate=%@"), v4, self, v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionTime didEnableActivity:]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v17, v19, v20, 55);

      PLLogCommon();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      v6 = MEMORY[0x1E0C809B0];
    }
  }
  dispatch_get_global_queue(2, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v6;
  v24[1] = 3221225472;
  v24[2] = __45__PLActivityCriterionTime_didEnableActivity___block_invoke_25;
  v24[3] = &unk_1E6A552E0;
  v24[4] = self;
  +[PLMonotonicTimer scheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:](PLMonotonicTimer, "scheduledTimerWithMonotonicFireDate:withInterval:withQueue:withBlock:", v16, v22, v24, 0.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLActivityCriterionTime setTimer:](self, "setTimer:", v23);

}

BOOL __45__PLActivityCriterionTime_didEnableActivity___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didEnableActivity__classDebugEnabled_1 = result;
  return result;
}

BOOL __45__PLActivityCriterionTime_didEnableActivity___block_invoke_21(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didEnableActivity__classDebugEnabled_20 = result;
  return result;
}

uint64_t __45__PLActivityCriterionTime_didEnableActivity___block_invoke_25(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t block;
  uint64_t v10;
  BOOL (*v11)(uint64_t);
  void *v12;
  uint64_t v13;

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __45__PLActivityCriterionTime_didEnableActivity___block_invoke_2;
    v12 = &__block_descriptor_40_e5_v8__0lu32l8;
    v13 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_5 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_5, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionTime::timer block fired for criterion=%@"), *(_QWORD *)(a1 + 32), block, v10, v11, v12, v13);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "lastPathComponent");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionTime didEnableActivity:]_block_invoke");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v5, v6, 62);

      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "setSatisfied:", 1);
}

BOOL __45__PLActivityCriterionTime_didEnableActivity___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_5 = result;
  return result;
}

BOOL __47__PLActivityCriterionTime_didCompleteActivity___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didCompleteActivity__classDebugEnabled_0 = result;
  return result;
}

- (void)didInterruptActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD block[5];

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__PLActivityCriterionTime_didInterruptActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didInterruptActivity__defaultOnce_0 != -1)
      dispatch_once(&didInterruptActivity__defaultOnce_0, block);
    if (didInterruptActivity__classDebugEnabled_0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionTime::didInterruptActivity:%@ for criterion=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionTime didInterruptActivity:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 79);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v14.receiver = self;
  v14.super_class = (Class)PLActivityCriterionTime;
  -[PLActivityCriterion didInterruptActivity:](&v14, sel_didInterruptActivity_, v4);
  -[PLActivityCriterion setSatisfied:](self, "setSatisfied:", 0);
  v11 = (void *)MEMORY[0x1E0C99D68];
  -[PLActivityCriterionTime rescheduleDelay](self, "rescheduleDelay");
  objc_msgSend(v11, "monotonicDateWithTimeIntervalSinceNow:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLActivityCriterionTime timer](self, "timer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMonotonicFireDate:", v12);

}

BOOL __48__PLActivityCriterionTime_didInterruptActivity___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didInterruptActivity__classDebugEnabled_0 = result;
  return result;
}

- (void)didDisableActivity:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  objc_super v12;
  _QWORD block[5];

  v4 = a3;
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v5 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__PLActivityCriterionTime_didDisableActivity___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v5;
    if (didDisableActivity__defaultOnce_1 != -1)
      dispatch_once(&didDisableActivity__defaultOnce_1, block);
    if (didDisableActivity__classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLActivityCriterionTime::didDisableActivity:%@ for criterion=%@"), v4, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/Activity/PLActivityCriterionTime.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLActivityCriterionTime didDisableActivity:]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 90);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  v12.receiver = self;
  v12.super_class = (Class)PLActivityCriterionTime;
  -[PLActivityCriterion didDisableActivity:](&v12, sel_didDisableActivity_, v4);
  -[PLActivityCriterionTime timer](self, "timer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cancel");

  -[PLActivityCriterionTime setTimer:](self, "setTimer:", 0);
}

BOOL __46__PLActivityCriterionTime_didDisableActivity___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  didDisableActivity__classDebugEnabled_1 = result;
  return result;
}

- (double)rescheduleDelay
{
  double v2;
  double v3;
  double result;

  -[PLActivityCriterionTime interval](self, "interval");
  v3 = v2 / 10.0;
  objc_msgSend((id)objc_opt_class(), "minTimeInterval");
  if (v3 >= result)
    return v3;
  return result;
}

- (id)description
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PLActivityCriterionTime interval](self, "interval");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("(interval=%f)"), v3);
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)setRescheduleDelay:(double)a3
{
  self->_rescheduleDelay = a3;
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
