@implementation PGProgressCallChecker

- (PGProgressCallChecker)initWithTaskName:(id)a3 loggingConnection:(id)a4
{
  id v6;
  id v7;
  PGProgressCallChecker *v8;
  uint64_t v9;
  NSString *taskName;
  CFAbsoluteTime Current;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGProgressCallChecker;
  v8 = -[PGProgressCallChecker init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    taskName = v8->_taskName;
    v8->_taskName = (NSString *)v9;

    objc_storeStrong((id *)&v8->_loggingConnection, a4);
    Current = CFAbsoluteTimeGetCurrent();
    v8->_timestampOfLastCallToProgress = Current;
    v8->_timestampOfLastRecordedCallToProgress = Current;
  }

  return v8;
}

- (PGProgressCallChecker)initWithTaskName:(id)a3
{
  return -[PGProgressCallChecker initWithTaskName:loggingConnection:](self, "initWithTaskName:loggingConnection:", a3, MEMORY[0x1E0C81028]);
}

- (id)memoryUsage
{
  void *v2;
  void *v3;
  void *v4;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;

  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v8 = 0u;
  task_info_outCnt = 93;
  task_info(*MEMORY[0x1E0C83DA0], 0x16u, task_info_out, &task_info_outCnt);
  objc_msgSend(MEMORY[0x1E0D42A38], "humanReadableMemorySizeWithSize:", (_QWORD)v16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D42A38], "humanReadableMemorySizeWithSize:", *((_QWORD *)&v17 + 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@)"), v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)checkCallsWithProgress:(double)a3 stop:(BOOL)a4
{
  _BOOL4 v4;
  BOOL wasStopped;
  NSObject *loggingConnection;
  __CFString *v9;
  __CFString *v10;
  double lastProgress;
  NSObject *v12;
  NSString *v13;
  CFAbsoluteTime Current;
  double timestampOfLastCallToProgress;
  double v16;
  unint64_t numberOfCallsToProgressSinceLastRecordedCall;
  unint64_t v18;
  double v19;
  NSObject *v21;
  NSString *v22;
  NSObject *v23;
  NSObject *v24;
  NSString *v25;
  NSObject *v26;
  NSString *v27;
  double v28;
  NSObject *v29;
  NSObject *v30;
  NSString *v31;
  NSObject *v32;
  NSString *v33;
  NSObject *v34;
  NSString *v35;
  NSString *taskName;
  const __CFString *v37;
  NSString *v38;
  int v39;
  NSString *v40;
  __int16 v41;
  double v42;
  __int16 v43;
  double v44;
  __int16 v45;
  double v46;
  __int16 v47;
  __CFString *v48;
  uint64_t v49;

  v4 = a4;
  v49 = *MEMORY[0x1E0C80C00];
  wasStopped = self->_wasStopped;
  if (wasStopped)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
    {
      taskName = self->_taskName;
      *(double *)&v37 = COERCE_DOUBLE(CFSTR(" Also *stop* seems to have been reset!!!"));
      if (v4)
        *(double *)&v37 = COERCE_DOUBLE(&stru_1E8436F28);
      v39 = 138412546;
      v40 = taskName;
      v41 = 2112;
      v42 = *(double *)&v37;
      _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, "%@: Progress called again although task was stopped!!!%@", (uint8_t *)&v39, 0x16u);
      wasStopped = self->_wasStopped;
    }
  }
  self->_wasStopped = wasStopped || v4;
  v9 = CFSTR(", stopped");
  if (!v4)
    v9 = &stru_1E8436F28;
  v10 = v9;
  lastProgress = self->_lastProgress;
  if (lastProgress + -2.22044605e-16 > a3)
  {
    v12 = self->_loggingConnection;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_taskName;
      v39 = 138412802;
      v40 = v13;
      v41 = 2048;
      v42 = lastProgress;
      v43 = 2048;
      v44 = a3;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "%@: Progress going backwards from %1.4f to %1.4f", (uint8_t *)&v39, 0x20u);
    }
  }
  self->_lastProgress = a3;
  Current = CFAbsoluteTimeGetCurrent();
  timestampOfLastCallToProgress = self->_timestampOfLastCallToProgress;
  v16 = Current - timestampOfLastCallToProgress;
  numberOfCallsToProgressSinceLastRecordedCall = self->_numberOfCallsToProgressSinceLastRecordedCall;
  if (Current - timestampOfLastCallToProgress >= 1.0)
  {
    if (*(double *)&numberOfCallsToProgressSinceLastRecordedCall != 0.0)
    {
      v26 = self->_loggingConnection;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v27 = self->_taskName;
        v28 = timestampOfLastCallToProgress - self->_timestampOfLastRecordedCallToProgress;
        v39 = 138413058;
        v40 = v27;
        v41 = 2048;
        v42 = *(double *)&numberOfCallsToProgressSinceLastRecordedCall;
        v43 = 2048;
        v44 = v28;
        v45 = 2112;
        v46 = *(double *)&v10;
        _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_DEFAULT, "%@: Progress --------, called %lu time(s) in %.2f sec%@", (uint8_t *)&v39, 0x2Au);
      }
      if (self->_reportMemoryUsage)
      {
        v29 = self->_loggingConnection;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          -[PGProgressCallChecker memoryUsage](self, "memoryUsage");
          v31 = (NSString *)objc_claimAutoreleasedReturnValue();
          v39 = 138412290;
          v40 = v31;
          _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_DEFAULT, "Mem: %@", (uint8_t *)&v39, 0xCu);

        }
      }
      self->_numberOfCallsToProgressSinceLastRecordedCall = 0;
    }
    if (v16 >= 30.0)
    {
      v34 = self->_loggingConnection;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
      {
        v35 = self->_taskName;
        v39 = 138413058;
        v40 = v35;
        v41 = 2048;
        v42 = a3;
        v43 = 2048;
        v44 = Current - timestampOfLastCallToProgress;
        v45 = 2112;
        v46 = *(double *)&v10;
        _os_log_fault_impl(&dword_1CA237000, v34, OS_LOG_TYPE_FAULT, "%@: Progress %1.4f, not called for %.2f sec%@", (uint8_t *)&v39, 0x2Au);
      }
    }
    else
    {
      v32 = self->_loggingConnection;
      if (v16 >= 5.0)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          v38 = self->_taskName;
          v39 = 138413058;
          v40 = v38;
          v41 = 2048;
          v42 = a3;
          v43 = 2048;
          v44 = Current - timestampOfLastCallToProgress;
          v45 = 2112;
          v46 = *(double *)&v10;
          _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "%@: Progress %1.4f, not called for %.2f sec%@", (uint8_t *)&v39, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = self->_taskName;
        v39 = 138413058;
        v40 = v33;
        v41 = 2048;
        v42 = a3;
        v43 = 2048;
        v44 = Current - timestampOfLastCallToProgress;
        v45 = 2112;
        v46 = *(double *)&v10;
        _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "%@: Progress %1.4f, not called for %.2f sec%@", (uint8_t *)&v39, 0x2Au);
      }
    }
    self->_timestampOfLastRecordedCallToProgress = Current;
  }
  else
  {
    v18 = numberOfCallsToProgressSinceLastRecordedCall + 1;
    self->_numberOfCallsToProgressSinceLastRecordedCall = v18;
    v19 = Current - self->_timestampOfLastRecordedCallToProgress;
    if (v19 >= 1.0 || v4)
    {
      v21 = self->_loggingConnection;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v22 = self->_taskName;
        v39 = 138413314;
        v40 = v22;
        v41 = 2048;
        v42 = a3;
        v43 = 2048;
        v44 = *(double *)&v18;
        v45 = 2048;
        v46 = v19;
        v47 = 2112;
        v48 = v10;
        _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_DEFAULT, "%@: Progress %1.4f, called %lu times in %.2f sec%@", (uint8_t *)&v39, 0x34u);
      }
      if (self->_reportMemoryUsage)
      {
        v23 = self->_loggingConnection;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v24 = v23;
          -[PGProgressCallChecker memoryUsage](self, "memoryUsage");
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
          v39 = 138412290;
          v40 = v25;
          _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_DEFAULT, "Mem: %@", (uint8_t *)&v39, 0xCu);

        }
      }
      self->_timestampOfLastRecordedCallToProgress = Current;
      self->_numberOfCallsToProgressSinceLastRecordedCall = 0;
    }
  }
  self->_timestampOfLastCallToProgress = Current;

}

- (NSString)taskName
{
  return self->_taskName;
}

- (void)setTaskName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)reportMemoryUsage
{
  return self->_reportMemoryUsage;
}

- (void)setReportMemoryUsage:(BOOL)a3
{
  self->_reportMemoryUsage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskName, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
