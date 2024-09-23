@implementation PLTimer

- (BOOL)timerActive
{
  void *v2;
  BOOL v3;

  -[PLTimer timer](self, "timer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (OS_dispatch_source)timer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 40, 1);
}

void __26__PLTimer_setTimerActive___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "handleTimerFire");
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 8))
  {
    v3 = *(NSObject **)(v2 + 40);
    if (v3)
      dispatch_source_cancel(v3);
  }
  objc_sync_exit(obj);

}

- (void)handleTimerFire
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  uint64_t block;
  uint64_t v19;
  BOOL (*v20)(uint64_t);
  void *v21;
  uint64_t v22;

  -[PLTimer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[PLTimer block](self, "block");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)MEMORY[0x1BCC9E9B4]();
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v7 = objc_opt_class();
        block = MEMORY[0x1E0C809B0];
        v19 = 3221225472;
        v20 = __26__PLTimer_handleTimerFire__block_invoke;
        v21 = &__block_descriptor_40_e5_v8__0lu32l8;
        v22 = v7;
        if (handleTimerFire_defaultOnce != -1)
          dispatch_once(&handleTimerFire_defaultOnce, &block);
        if (handleTimerFire_classDebugEnabled)
        {
          v8 = (void *)MEMORY[0x1E0CB3940];
          -[PLTimer queue](self, "queue");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "stringWithFormat:", CFSTR("PLTimer::%@::TimerFire"), v9, block, v19, v20, v21, v22);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "lastPathComponent");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimer handleTimerFire]");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 146);

          PLLogCommon();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }
      -[PLTimer block](self, "block");
      v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[PLTimer fireDate](self, "fireDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLTimer userInfo](self, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *, void *))v15)[2](v15, v16, v17);

      objc_autoreleasePoolPop(v6);
    }
  }
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (id)userInfo
{
  return objc_getProperty(self, a2, 64, 1);
}

- (NSDate)fireDate
{
  PLTimer *v2;
  NSDate *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_fireDate;
  objc_sync_exit(v2);

  return v3;
}

void __26__PLTimer_setTimerActive___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  dispatch_source_t v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  uint64_t v11;
  unint64_t v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t block;
  uint64_t v29;
  BOOL (*v30)(uint64_t);
  void *v31;
  uint64_t v32;
  _QWORD handler[5];

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_source_create(MEMORY[0x1E0C80DD0], 1uLL, 0, v3);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "timeIntervalSinceNow");
  v8 = v7 * 1000000000.0;
  v9 = v7 < 0.0;
  v10 = 0.0;
  if (!v9)
    v10 = v8;
  if (v10 > 9.22337204e18)
    v10 = 9.22337204e18;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = (unint64_t)(*(double *)(v11 + 48) * 1000000000.0);
  v13 = *(NSObject **)(v11 + 40);
  v14 = dispatch_time(0, (uint64_t)v10);
  v15 = *(_QWORD *)(a1 + 32);
  if (v12)
  {
    if (*(_BYTE *)(v15 + 8))
      v16 = v12;
    else
      v16 = -1;
  }
  else
  {
    v16 = -1;
  }
  dispatch_source_set_timer(v13, v14, v16, (unint64_t)(*(double *)(v15 + 56) * 1000000000.0));
  v17 = *(_QWORD *)(a1 + 32);
  v18 = MEMORY[0x1E0C809B0];
  v19 = *(NSObject **)(v17 + 40);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __26__PLTimer_setTimerActive___block_invoke_2;
  handler[3] = &unk_1E6A52050;
  handler[4] = v17;
  dispatch_source_set_event_handler(v19, handler);
  dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 40));
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    block = v18;
    v29 = 3221225472;
    v30 = __26__PLTimer_setTimerActive___block_invoke_3;
    v31 = &__block_descriptor_40_e5_v8__0lu32l8;
    v32 = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_2 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_2, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_2)
    {
      v20 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fireDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "stringWithFormat:", CFSTR("PLTimer::%@::setTimerActive: created timer with fireDate=%@"), v21, v22, block, v29, v30, v31, v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimer setTimerActive:]_block_invoke");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v25, v26, 116);

      PLLogCommon();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_sync_exit(v2);

}

- (void)invalidate
{
  PLTimer *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *timer;
  OS_dispatch_source *v12;
  uint64_t block;
  uint64_t v14;
  BOOL (*v15)(uint64_t);
  void *v16;
  uint64_t v17;

  v2 = self;
  objc_sync_enter(v2);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __21__PLTimer_invalidate__block_invoke;
    v16 = &__block_descriptor_40_e5_v8__0lu32l8;
    v17 = v3;
    if (invalidate_defaultOnce != -1)
      dispatch_once(&invalidate_defaultOnce, &block);
    if (invalidate_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PLTimer queue](v2, "queue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("PLTimer::%@:: invalidate"), v5, block, v14, v15, v16, v17);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimer invalidate]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 70);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  timer = v2->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v12 = v2->_timer;
    v2->_timer = 0;

  }
  objc_sync_exit(v2);

}

- (void)setTimerActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a3;
  -[PLTimer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = MEMORY[0x1E0C809B0];
    v6 = __26__PLTimer_setTimerActive___block_invoke;
    v7 = &v9;
  }
  else
  {
    v8 = MEMORY[0x1E0C809B0];
    v6 = __26__PLTimer_setTimerActive___block_invoke_18;
    v7 = &v8;
  }
  v7[1] = 3221225472;
  v7[2] = (uint64_t)v6;
  v7[3] = (uint64_t)&unk_1E6A52050;
  v7[4] = (uint64_t)self;
  +[PLUtilities dispatchSyncIfNotCallerQueue:withBlock:](PLUtilities, "dispatchSyncIfNotCallerQueue:withBlock:", v5, v8);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFireDate:(id)a3
{
  NSDate *v4;
  PLTimer *v5;
  NSDate *fireDate;

  v4 = (NSDate *)a3;
  v5 = self;
  objc_sync_enter(v5);
  fireDate = v5->_fireDate;
  v5->_fireDate = v4;

  objc_sync_exit(v5);
  -[PLTimer setTimerActive:](v5, "setTimerActive:", 1);
}

- (PLTimer)initWithFireDate:(id)a3 withInterval:(double)a4 withTolerance:(double)a5 repeats:(BOOL)a6 withUserInfo:(id)a7 withQueue:(id)a8 withBlock:(id)a9
{
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  PLTimer *v22;
  PLTimer *v23;
  PLTimer *v24;
  uint64_t v25;
  id block;
  objc_super v28;

  v17 = a3;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = v20;
  v22 = 0;
  if (v19 && v20)
  {
    v28.receiver = self;
    v28.super_class = (Class)PLTimer;
    v23 = -[PLTimer init](&v28, sel_init);
    v24 = v23;
    if (v23)
    {
      objc_storeStrong((id *)&v23->_queue, a8);
      objc_storeStrong((id *)&v24->_fireDate, a3);
      v24->_interval = a4;
      v24->_tolerance = a5;
      v24->_repeats = a6;
      objc_storeStrong(&v24->_userInfo, a7);
      v25 = MEMORY[0x1BCC9EB70](v21);
      block = v24->_block;
      v24->_block = (id)v25;

      -[PLTimer setTimerActive:](v24, "setTimerActive:", v17 != 0);
    }
    self = v24;
    v22 = self;
  }

  return v22;
}

- (void)dealloc
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_super v11;
  _QWORD block[5];

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v3 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __18__PLTimer_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v3;
    if (dealloc_defaultOnce != -1)
      dispatch_once(&dealloc_defaultOnce, block);
    if (dealloc_classDebugEnabled)
    {
      v4 = (void *)MEMORY[0x1E0CB3940];
      -[PLTimer queue](self, "queue");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stringWithFormat:", CFSTR("PLTimer::%@::dealloc: self=%@"), v5, self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimer dealloc]");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 57);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLTimer setTimerActive:](self, "setTimerActive:", 0);
  v11.receiver = self;
  v11.super_class = (Class)PLTimer;
  -[PLTimer dealloc](&v11, sel_dealloc);
}

BOOL __18__PLTimer_dealloc__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  dealloc_classDebugEnabled = result;
  return result;
}

- (void)fire
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __15__PLTimer_fire__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __15__PLTimer_fire__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleTimerFire");
}

BOOL __21__PLTimer_invalidate__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  invalidate_classDebugEnabled = result;
  return result;
}

- (void)arm
{
  if (!self->_fireDate)
    -[PLTimer setTimerActive:](self, "setTimerActive:", 1);
}

BOOL __26__PLTimer_setTimerActive___block_invoke_3(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_2 = result;
  return result;
}

void __26__PLTimer_setTimerActive___block_invoke_18(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t block;
  uint64_t v11;
  BOOL (*v12)(uint64_t);
  void *v13;
  uint64_t v14;

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __26__PLTimer_setTimerActive___block_invoke_2_19;
    v13 = &__block_descriptor_40_e5_v8__0lu32l8;
    v14 = v2;
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_2_defaultOnce, &block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("PLTimer::%@::setTimerActive: invalidate"), v4, block, v11, v12, v13, v14);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Operators/Compositions/PLTimer.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLTimer setTimerActive:]_block_invoke");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 122);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __26__PLTimer_setTimerActive___block_invoke_2_19(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_2_classDebugEnabled = result;
  return result;
}

BOOL __26__PLTimer_handleTimerFire__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  handleTimerFire_classDebugEnabled = result;
  return result;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (double)interval
{
  return self->_interval;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (double)tolerance
{
  return self->_tolerance;
}

- (void)setTolerance:(double)a3
{
  self->_tolerance = a3;
}

- (BOOL)repeats
{
  return self->_repeats;
}

- (void)setRepeats:(BOOL)a3
{
  self->_repeats = a3;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PLEntryNotificationOperatorComposition)sleepEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSleepEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 80, 1);
}

- (void)setWakeEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDate)lastSleepTime
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastSleepTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSleepTime, 0);
  objc_storeStrong((id *)&self->_wakeEntryNotification, 0);
  objc_storeStrong((id *)&self->_sleepEntryNotification, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fireDate, 0);
}

@end
