@implementation PLMonotonicTimer

- (void)schedule
{
  void *v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  dispatch_time_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _QWORD v29[5];
  _QWORD block[4];
  id v31;
  id v32;
  id location;
  _QWORD v34[5];
  _QWORD v35[6];

  -[PLMonotonicTimer monotonicFireDate](self, "monotonicFireDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
    v5 = MEMORY[0x1E0C809B0];
    if (v4)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __28__PLMonotonicTimer_schedule__block_invoke;
      v35[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v35[4] = objc_opt_class();
      if (schedule_defaultOnce != -1)
        dispatch_once(&schedule_defaultOnce, v35);
      if (schedule_classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin for self=%@"), self);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer schedule]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v8, v9, 152);

        PLLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMonotonicTimer monotonicFireDate](self, "monotonicFireDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");

    objc_msgSend(v13, "timeIntervalSinceDate:", v11);
    if (v14 >= 0.0)
      v15 = v14;
    else
      v15 = 0.0;
    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v34[0] = v5;
      v34[1] = 3221225472;
      v34[2] = __28__PLMonotonicTimer_schedule__block_invoke_25;
      v34[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v34[4] = objc_opt_class();
      if (schedule_defaultOnce_23 != -1)
        dispatch_once(&schedule_defaultOnce_23, v34);
      if (schedule_classDebugEnabled_24)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("self=%@, now=%@, timeInterval=%f"), self, v11, *(_QWORD *)&v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer schedule]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 161);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    objc_initWeak(&location, self);
    v21 = dispatch_walltime(0, (uint64_t)(v15 * 1000000000.0));
    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v22 = objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __28__PLMonotonicTimer_schedule__block_invoke_28;
    block[3] = &unk_1E6A53A00;
    objc_copyWeak(&v32, &location);
    v23 = v13;
    v31 = v23;
    dispatch_after(v21, v22, block);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v29[0] = v5;
      v29[1] = 3221225472;
      v29[2] = __28__PLMonotonicTimer_schedule__block_invoke_2;
      v29[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v29[4] = objc_opt_class();
      if (schedule_defaultOnce_29 != -1)
        dispatch_once(&schedule_defaultOnce_29, v29);
      if (schedule_classDebugEnabled_30)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end for self=%@"), self);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer schedule]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v26, v27, 168);

        PLLogCommon();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);

  }
}

- (NSDate)monotonicFireDate
{
  return self->_monotonicFireDate;
}

- (void)timerFiredForMonotonicFireDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSDate *monotonicFireDate;
  NSObject *v29;
  uint64_t v30;
  double v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  _QWORD block[5];
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[6];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v6 = objc_opt_class();
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke;
    v51[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v51[4] = v6;
    if (timerFiredForMonotonicFireDate__defaultOnce != -1)
      dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce, v51);
    if (timerFiredForMonotonicFireDate__classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("self=%@, now=%@, monotonicFireDate=%@"), self, v5, v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v9, v10, 187);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v4);

  if (v13)
  {
    -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v4);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v15 = objc_opt_class();
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_45;
      v50[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v50[4] = v15;
      if (timerFiredForMonotonicFireDate__defaultOnce_43 != -1)
        dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_43, v50);
      if (timerFiredForMonotonicFireDate__classDebugEnabled_44)
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", CFSTR("canceled for self=%@ with canceledFireDates=%@"), self, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v20, v21, 192);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
LABEL_22:

      }
    }
  }
  else
  {
    objc_msgSend(v5, "timeIntervalSinceDate:", v4);
    if (v23 >= 0.0)
    {
      monotonicFireDate = self->_monotonicFireDate;
      self->_monotonicFireDate = 0;

      -[PLMonotonicTimer queue](self, "queue");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_53;
      block[3] = &unk_1E6A521A0;
      block[4] = self;
      v48 = v5;
      dispatch_async(v29, block);

      -[PLMonotonicTimer interval](self, "interval");
      if (v31 > 0.0)
      {
        if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
        {
          v46[0] = v30;
          v46[1] = 3221225472;
          v46[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_64;
          v46[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v46[4] = objc_opt_class();
          if (timerFiredForMonotonicFireDate__defaultOnce_62 != -1)
            dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_62, v46);
          if (timerFiredForMonotonicFireDate__classDebugEnabled_63)
          {
            v32 = (void *)MEMORY[0x1E0CB3940];
            -[PLMonotonicTimer interval](self, "interval");
            objc_msgSend(v32, "stringWithFormat:", CFSTR("rescheduling periodic timer with interval=%f"), v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "lastPathComponent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v34, v36, v37, 213);

            PLLogCommon();
            v38 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

          }
        }
        -[PLMonotonicTimer interval](self, "interval");
        objc_msgSend(v4, "dateByAddingTimeInterval:");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLMonotonicTimer _setMonotonicFireDate:](self, "_setMonotonicFireDate:", v39);

      }
      if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
      {
        v45[0] = v30;
        v45[1] = 3221225472;
        v45[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_69;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = objc_opt_class();
        if (timerFiredForMonotonicFireDate__defaultOnce_67 != -1)
          dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_67, v45);
        if (timerFiredForMonotonicFireDate__classDebugEnabled_68)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "lastPathComponent");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v40, v42, v43, 216);

          PLLogCommon();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
            -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

        }
      }

    }
    else if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v24 = objc_opt_class();
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_50;
      v49[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v49[4] = v24;
      if (timerFiredForMonotonicFireDate__defaultOnce_48 != -1)
        dispatch_once(&timerFiredForMonotonicFireDate__defaultOnce_48, v49);
      if (timerFiredForMonotonicFireDate__classDebugEnabled_49)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("time mismatch for self=%@"), self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "lastPathComponent");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v26, v27, 198);

        PLLogCommon();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();
        goto LABEL_22;
      }
    }
  }

}

- (double)interval
{
  return self->_interval;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_64(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timerFiredForMonotonicFireDate__classDebugEnabled_63 = result;
  return result;
}

uint64_t __41__PLMonotonicTimer_setMonotonicFireDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setMonotonicFireDate:", *(_QWORD *)(a1 + 40));
}

- (void)setMonotonicFireDate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__PLMonotonicTimer_setMonotonicFireDate___block_invoke;
  block[3] = &unk_1E6A521A0;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableSet)canceledFireDates
{
  return (NSMutableSet *)objc_getProperty(self, a2, 40, 1);
}

- (id)block
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)_setMonotonicFireDate:(id)a3
{
  unint64_t v5;
  NSDate *monotonicFireDate;
  BOOL v7;
  unint64_t v8;

  v5 = (unint64_t)a3;
  monotonicFireDate = self->_monotonicFireDate;
  if (v5 | (unint64_t)monotonicFireDate)
  {
    v8 = v5;
    if (!v5
      || !monotonicFireDate
      || (v7 = -[NSDate isEqualToDate:](monotonicFireDate, "isEqualToDate:", v5), v5 = v8, !v7))
    {
      -[PLMonotonicTimer _cancel](self, "_cancel");
      objc_storeStrong((id *)&self->_monotonicFireDate, a3);
      -[PLMonotonicTimer schedule](self, "schedule");
      v5 = v8;
    }
  }

}

- (void)_cancel
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSDate *monotonicFireDate;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[5];

  v3 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__PLMonotonicTimer__cancel__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (_cancel_defaultOnce != -1)
      dispatch_once(&_cancel_defaultOnce, block);
    if (_cancel_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin for self=%@"), self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer _cancel]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 173);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLMonotonicTimer monotonicFireDate](self, "monotonicFireDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLMonotonicTimer monotonicFireDate](self, "monotonicFireDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v27[0] = v4;
      v27[1] = 3221225472;
      v27[2] = __27__PLMonotonicTimer__cancel__block_invoke_35;
      v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v27[4] = objc_opt_class();
      if (_cancel_defaultOnce_33 != -1)
        dispatch_once(&_cancel_defaultOnce_33, v27);
      if (_cancel_classDebugEnabled_34)
      {
        v13 = (void *)MEMORY[0x1E0CB3940];
        -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "stringWithFormat:", CFSTR("self=%@, canceledFireDates=%@"), self, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "lastPathComponent");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer _cancel]");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v17, v18, 178);

        PLLogCommon();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
    monotonicFireDate = self->_monotonicFireDate;
    self->_monotonicFireDate = 0;

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v26[0] = v4;
      v26[1] = 3221225472;
      v26[2] = __27__PLMonotonicTimer__cancel__block_invoke_40;
      v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v26[4] = objc_opt_class();
      if (_cancel_defaultOnce_38 != -1)
        dispatch_once(&_cancel_defaultOnce_38, v26);
      if (_cancel_classDebugEnabled_39)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end for self=%@"), self);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastPathComponent");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer _cancel]");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v23, v24, 181);

        PLLogCommon();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }
}

- (PLMonotonicTimer)initWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  PLMonotonicTimer *v17;
  PLMonotonicTimer *v18;
  PLMonotonicTimer *v19;
  uint64_t v20;
  id block;
  uint64_t v22;
  NSMutableSet *canceledFireDates;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (a4 < 0.0 || v12 == 0 || v13 == 0)
  {
    v17 = 0;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)PLMonotonicTimer;
    v18 = -[PLMonotonicTimer init](&v30, sel_init);
    v19 = v18;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_monotonicFireDate, a3);
      v19->_interval = a4;
      objc_storeStrong((id *)&v19->_queue, a5);
      v20 = objc_msgSend(v14, "copy");
      block = v19->_block;
      v19->_block = (id)v20;

      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v22 = objc_claimAutoreleasedReturnValue();
      canceledFireDates = v19->_canceledFireDates;
      v19->_canceledFireDates = (NSMutableSet *)v22;

      objc_initWeak(&location, v19);
      +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLMonotonicTimer_%p"), v19);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke;
      v27[3] = &unk_1E6A539D8;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v24, "registerForTimeChangedCallbackWithIdentifier:forTimeReference:usingBlock:", v25, 1, v27);

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);
    }
    self = v19;
    v17 = self;
  }

  return v17;
}

void __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke_2;
  block[3] = &unk_1E6A539B0;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_sync(v2, block);

  objc_destroyWeak(&v4);
}

void __79__PLMonotonicTimer_initWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reschedule");

}

+ (id)scheduledTimerWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  PLMonotonicTimer *v13;
  PLMonotonicTimer *v14;
  NSObject *v15;
  _QWORD block[4];
  PLMonotonicTimer *v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if ((objc_msgSend(a1, "debugInstance") & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = -[PLMonotonicTimer initWithMonotonicFireDate:withInterval:withQueue:withBlock:]([PLMonotonicTimer alloc], "initWithMonotonicFireDate:withInterval:withQueue:withBlock:", v10, v11, v12, a4);
    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __89__PLMonotonicTimer_scheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke;
    block[3] = &unk_1E6A52050;
    v13 = v14;
    v18 = v13;
    dispatch_sync(v15, block);

  }
  return v13;
}

uint64_t __89__PLMonotonicTimer_scheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "schedule");
}

+ (id)debugScheduledTimerWithMonotonicFireDate:(id)a3 withInterval:(double)a4 withQueue:(id)a5 withBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  PLMonotonicTimer *v13;
  NSObject *v14;
  PLMonotonicTimer *v15;
  _QWORD block[4];
  PLMonotonicTimer *v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(a1, "debugInstance"))
  {
    v13 = -[PLMonotonicTimer initWithMonotonicFireDate:withInterval:withQueue:withBlock:]([PLMonotonicTimer alloc], "initWithMonotonicFireDate:withInterval:withQueue:withBlock:", v10, v11, v12, a4);
    +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
    v14 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__PLMonotonicTimer_debugScheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke;
    block[3] = &unk_1E6A52050;
    v15 = v13;
    v18 = v15;
    dispatch_sync(v14, block);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __94__PLMonotonicTimer_debugScheduledTimerWithMonotonicFireDate_withInterval_withQueue_withBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "schedule");
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  +[PLTimeManager sharedInstance](PLTimeManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PLMonotonicTimer_%p"), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterForTimeChangedCallbackWithIdentifier:forTimeReference:", v4, 1);

  v5.receiver = self;
  v5.super_class = (Class)PLMonotonicTimer;
  -[PLMonotonicTimer dealloc](&v5, sel_dealloc);
}

- (void)fire
{
  NSObject *v3;
  _QWORD block[5];

  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__PLMonotonicTimer_fire__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  dispatch_sync(v3, block);

}

void __24__PLMonotonicTimer_fire__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_setMonotonicFireDate:", 0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timerFiredForMonotonicFireDate:", v3);

}

- (void)cancel
{
  NSObject *v3;
  _QWORD block[5];

  +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PLMonotonicTimer_cancel__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __26__PLMonotonicTimer_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

- (id)description
{
  void *v2;
  void *v3;

  -[PLMonotonicTimer monotonicFireDate](self, "monotonicFireDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)debugInstance
{
  char v2;
  _QWORD v4[4];
  __CFString *v5;
  char v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[2] = __33__PLMonotonicTimer_debugInstance__block_invoke;
  v4[3] = &unk_1E6A534F0;
  v4[1] = 3221225472;
  v5 = CFSTR("PLMonotonicTimerDebugInstance_Enabled");
  v6 = 0;
  if (debugInstance_defaultOnce != -1)
    dispatch_once(&debugInstance_defaultOnce, v4);
  v2 = debugInstance_objectForKey;

  return v2;
}

BOOL __33__PLMonotonicTimer_debugInstance__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  debugInstance_objectForKey = result;
  return result;
}

BOOL __28__PLMonotonicTimer_schedule__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  schedule_classDebugEnabled = result;
  return result;
}

BOOL __28__PLMonotonicTimer_schedule__block_invoke_25(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  schedule_classDebugEnabled_24 = result;
  return result;
}

void __28__PLMonotonicTimer_schedule__block_invoke_28(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "timerFiredForMonotonicFireDate:", *(_QWORD *)(a1 + 32));

}

BOOL __28__PLMonotonicTimer_schedule__block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  schedule_classDebugEnabled_30 = result;
  return result;
}

BOOL __27__PLMonotonicTimer__cancel__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _cancel_classDebugEnabled = result;
  return result;
}

BOOL __27__PLMonotonicTimer__cancel__block_invoke_35(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _cancel_classDebugEnabled_34 = result;
  return result;
}

BOOL __27__PLMonotonicTimer__cancel__block_invoke_40(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _cancel_classDebugEnabled_39 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timerFiredForMonotonicFireDate__classDebugEnabled = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_45(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timerFiredForMonotonicFireDate__classDebugEnabled_44 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_50(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timerFiredForMonotonicFireDate__classDebugEnabled_49 = result;
  return result;
}

void __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_53(uint64_t a1)
{
  _BOOL4 v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL (*v17)(uint64_t);
  void *v18;
  uint64_t v19;
  _QWORD block[5];

  v2 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_1, block);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("run block begin"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastPathComponent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]_block_invoke");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v4, v6, v7, 206);

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "block");
  v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v9[2](v9, *(_QWORD *)(a1 + 40));

  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v15 = v3;
    v16 = 3221225472;
    v17 = __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_58;
    v18 = &__block_descriptor_40_e5_v8__0lu32l8;
    v19 = objc_opt_class();
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_56 != -1)
      dispatch_once(&PLSubmissionAnalyticsStateSuccess_block_invoke_defaultOnce_56, &v15);
    if (PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_57)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("run block end"), v15, v16, v17, v18, v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "lastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer timerFiredForMonotonicFireDate:]_block_invoke_2");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v12, v13, 208);

      PLLogCommon();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_2(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_1 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_58(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  PLSubmissionAnalyticsStateSuccess_block_invoke_classDebugEnabled_57 = result;
  return result;
}

BOOL __51__PLMonotonicTimer_timerFiredForMonotonicFireDate___block_invoke_69(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  timerFiredForMonotonicFireDate__classDebugEnabled_68 = result;
  return result;
}

- (void)reschedule
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[5];

  v3 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __30__PLMonotonicTimer_reschedule__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (reschedule_defaultOnce != -1)
      dispatch_once(&reschedule_defaultOnce, block);
    if (reschedule_classDebugEnabled)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("begin for self=%@"), self);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "lastPathComponent");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer reschedule]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v7, v8, 222);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }
  -[PLMonotonicTimer monotonicFireDate](self, "monotonicFireDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLMonotonicTimer _setMonotonicFireDate:](self, "_setMonotonicFireDate:", 0);
  -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsObject:", v10);

  if (v12)
  {
    -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObject:", v10);

    if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
    {
      v27[0] = v4;
      v27[1] = 3221225472;
      v27[2] = __30__PLMonotonicTimer_reschedule__block_invoke_74;
      v27[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v27[4] = objc_opt_class();
      if (reschedule_defaultOnce_72 != -1)
        dispatch_once(&reschedule_defaultOnce_72, v27);
      if (reschedule_classDebugEnabled_73)
      {
        v14 = (void *)MEMORY[0x1E0CB3940];
        -[PLMonotonicTimer canceledFireDates](self, "canceledFireDates");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("self=%@, self.canceledFireDates=%@"), self, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "lastPathComponent");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer reschedule]");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v18, v19, 231);

        PLLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

      }
    }
  }
  -[PLMonotonicTimer _setMonotonicFireDate:](self, "_setMonotonicFireDate:", v10);
  if (+[PLDefaults debugEnabled](PLDefaults, "debugEnabled"))
  {
    v26[0] = v4;
    v26[1] = 3221225472;
    v26[2] = __30__PLMonotonicTimer_reschedule__block_invoke_79;
    v26[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v26[4] = objc_opt_class();
    if (reschedule_defaultOnce_77 != -1)
      dispatch_once(&reschedule_defaultOnce_77, v26);
    if (reschedule_classDebugEnabled_78)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("end for self=%@"), self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices/Utilities/PLMonotonicTimer.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLMonotonicTimer reschedule]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[PLCoreStorage logMessage:fromFile:fromFunction:fromLineNumber:](PLCoreStorage, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v23, v24, 235);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[PLSubmissionFile logSubmissionResultToCAWithErrorType:withFileType:withOverrideKeys:].cold.1();

    }
  }

}

BOOL __30__PLMonotonicTimer_reschedule__block_invoke(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reschedule_classDebugEnabled = result;
  return result;
}

BOOL __30__PLMonotonicTimer_reschedule__block_invoke_74(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reschedule_classDebugEnabled_73 = result;
  return result;
}

BOOL __30__PLMonotonicTimer_reschedule__block_invoke_79(uint64_t a1)
{
  _BOOL8 result;

  result = +[PLDefaults isClassDebugEnabled:](PLDefaults, "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  reschedule_classDebugEnabled_78 = result;
  return result;
}

- (void)setInterval:(double)a3
{
  self->_interval = a3;
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setCanceledFireDates:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PLEntryNotificationOperatorComposition)wakeEntryNotification
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 48, 1);
}

- (void)setWakeEntryNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wakeEntryNotification, 0);
  objc_storeStrong((id *)&self->_canceledFireDates, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_monotonicFireDate, 0);
}

@end
