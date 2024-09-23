@implementation PLTimeReferenceKernel

- (id)currentTime
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v19;
  size_t v20;
  _BYTE buf[12];
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (currentTime_onceToken != -1)
    dispatch_once(&currentTime_onceToken, &__block_literal_global_45);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLTimeReferenceKernel lastSystemTimeRecalibrated](self, "lastSystemTimeRecalibrated");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_8;
  v5 = (void *)v4;
  -[PLTimeReferenceKernel lastSystemTimeRecalibrated](self, "lastSystemTimeRecalibrated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v6);
  v8 = v7;

  if (v8 >= 0.0 && v8 < 30.0)
  {
    -[PLTimeReferenceKernel lastKernelTimeRecalibrated](self, "lastKernelTimeRecalibrated");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingTimeInterval:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogTimeManager();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      -[PLTimeReferenceKernel lastSystemTimeRecalibrated](self, "lastSystemTimeRecalibrated");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v3;
      v22 = 2112;
      v23 = v19;
      v24 = 2112;
      v25 = v13;
      _os_log_debug_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEBUG, "Linear approximation: systemNow=%@, lastSystemTimeRecalibrated=%@, currentTime=%@", buf, 0x20u);

    }
  }
  else
  {
LABEL_8:
    v20 = 8;
    *(_QWORD *)buf = 0;
    if (sysctl(currentTime_mib, currentTime_miblen, buf, &v20, 0, 0))
    {
      PLLogTimeManager();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PLTimeReferenceKernel currentTime].cold.2();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (double)*(unint64_t *)buf / 1000000.0;
      -[PLTimeReferenceKernel resolution](self, "resolution");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v15 + v16 * 0.5);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v11;
    -[PLTimeReferenceKernel setLastSystemTimeRecalibrated:](self, "setLastSystemTimeRecalibrated:", v3);
    -[PLTimeReferenceKernel setLastKernelTimeRecalibrated:](self, "setLastKernelTimeRecalibrated:", v13);
    PLLogTimeManager();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[PLTimeReferenceKernel currentTime].cold.1((uint64_t)v3, (uint64_t)v13, v17);

  }
  return v13;
}

- (NSDate)lastSystemTimeRecalibrated
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (NSDate)lastKernelTimeRecalibrated
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastSystemTimeRecalibrated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setLastKernelTimeRecalibrated:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)resolution
{
  if (resolution_onceToken != -1)
    dispatch_once(&resolution_onceToken, &__block_literal_global_11_0);
  return *(double *)&resolution_sInterval;
}

- (void)initializeOffsetWithEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  NSObject *v30;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  objc_super v34;
  objc_super v35;
  objc_super v36;

  v4 = a3;
  -[PLTimeReferenceKernel currentTime](self, "currentTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("system"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kernel"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "doubleValue");
    v12 = v11;

    objc_msgSend(v6, "entryDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)PLTimeReferenceKernel;
    objc_msgSend(-[PLTimeReferenceKernel class](&v36, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("system"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v9 = v16;

    v35.receiver = self;
    v35.super_class = (Class)PLTimeReferenceKernel;
    objc_msgSend(-[PLTimeReferenceKernel class](&v35, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("kernel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v12 = v19;

    v20 = (void *)MEMORY[0x1E0C99D68];
    v34.receiver = self;
    v34.super_class = (Class)PLTimeReferenceKernel;
    objc_msgSend(-[PLTimeReferenceKernel class](&v34, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("monotonic"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "doubleValue");
    objc_msgSend(v20, "dateWithTimeIntervalSince1970:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v9 == 0.0 || (v12 != 0.0 ? (v23 = v13 == 0) : (v23 = 1), v23))
  {
    -[PLTimeReference timeManager](self, "timeManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "initialMonotonicTime");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v27);
    -[PLTimeReference setOffset:](&v31, sel_setOffset_, self, PLTimeReferenceKernel);
  }
  else
  {
    objc_msgSend(v13, "dateByAddingTimeInterval:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v24);
    if (v25 >= 0.0)
    {
      v32.receiver = self;
      v32.super_class = (Class)PLTimeReferenceKernel;
      -[PLTimeReference setOffset:](&v32, sel_setOffset_, v12);
      goto LABEL_19;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "dateByAddingTimeInterval:", -v9);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "timeIntervalSinceDate:", v13);
    v29 = v28;
    PLLogTimeManager();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[PLTimeReferenceKernel initializeOffsetWithEntries:].cold.1(v29 < 0.0, v30);

    if (v29 < 0.0)
      -[PLTimeReferenceKernel quarantineWithExitReason:](self, "quarantineWithExitReason:", 1006);
    objc_msgSend(v5, "timeIntervalSinceDate:", v27);
    v33.receiver = self;
    v33.super_class = (Class)PLTimeReferenceKernel;
    -[PLTimeReference setOffset:](&v33, sel_setOffset_, v31.receiver, v31.super_class);
  }

LABEL_19:
}

- (void)quarantineWithExitReason:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_super v10;
  objc_super v11;
  objc_super v12;
  objc_super v13;

  v3 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLTimeReferenceKernel;
  objc_msgSend(-[PLTimeReferenceKernel class](&v13, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("monotonic"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, v5, 1);

  v12.receiver = self;
  v12.super_class = (Class)PLTimeReferenceKernel;
  objc_msgSend(-[PLTimeReferenceKernel class](&v12, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("kernel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, v6, 1);

  v11.receiver = self;
  v11.super_class = (Class)PLTimeReferenceKernel;
  objc_msgSend(-[PLTimeReferenceKernel class](&v11, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("system"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, v7, 1);

  v10.receiver = self;
  v10.super_class = (Class)PLTimeReferenceKernel;
  objc_msgSend(-[PLTimeReferenceKernel class](&v10, sel_class), "defaultsKeyFromEntryDefinitionKey:", CFSTR("baseband"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, v8, 1);

  v9 = dispatch_semaphore_create(0);
  +[PLUtilities exitWithReason:](PLUtilities, "exitWithReason:", v3);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);

}

void __36__PLTimeReferenceKernel_currentTime__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (sysctlnametomib("kern.monotonicclock_usecs", currentTime_mib, (size_t *)&currentTime_miblen))
  {
    PLLogTimeManager();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __36__PLTimeReferenceKernel_currentTime__block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);

  }
}

double __35__PLTimeReferenceKernel_resolution__block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  u_int v9[2];
  size_t v10;
  unint64_t v11;
  int v12[8];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  resolution_sInterval = 0x3FF0000000000000;
  v10 = 8;
  v11 = 0;
  *(_QWORD *)v9 = 8;
  if (sysctlnametomib("kern.monotonicclock_rate_usecs", v12, (size_t *)v9))
  {
    PLLogTimeManager();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __35__PLTimeReferenceKernel_resolution__block_invoke_cold_2(v0, v1, v2, v3, v4, v5, v6, v7);
LABEL_7:

    goto LABEL_8;
  }
  if (sysctl(v12, v9[0], &v11, &v10, 0, 0))
  {
    PLLogTimeManager();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
      __35__PLTimeReferenceKernel_resolution__block_invoke_cold_1();
    goto LABEL_7;
  }
LABEL_8:
  result = (double)v11 / 1000000.0;
  *(double *)&resolution_sInterval = result;
  return result;
}

- (void)setSystemReboot:(BOOL)a3
{
  self->_rebootOccurred = a3;
}

- (mach_timebase_info)getTimebaseInfo
{
  if (getTimebaseInfo_onceToken != -1)
    dispatch_once(&getTimebaseInfo_onceToken, &__block_literal_global_13_0);
  return (mach_timebase_info *)&getTimebaseInfo_machTimeInfo;
}

double __40__PLTimeReferenceKernel_getTimebaseInfo__block_invoke()
{
  double result;

  if (mach_timebase_info((mach_timebase_info_t)&getTimebaseInfo_machTimeInfo))
  {
    _os_assumes_log();
  }
  else if (dword_1EF14893C)
  {
    return result;
  }
  *(_QWORD *)&result = 0x100000001;
  getTimebaseInfo_machTimeInfo = 0x100000001;
  return result;
}

- (unint64_t)continuousTimeToAbsoluteNs:(unint64_t)a3
{
  mach_timebase_info *v4;

  v4 = -[PLTimeReferenceKernel getTimebaseInfo](self, "getTimebaseInfo");
  return v4->numer * a3 / v4->denom;
}

- (BOOL)rebootOccurred
{
  return self->_rebootOccurred;
}

- (void)setRebootOccurred:(BOOL)a3
{
  self->_rebootOccurred = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastKernelTimeRecalibrated, 0);
  objc_storeStrong((id *)&self->_lastSystemTimeRecalibrated, 0);
}

- (void)initializeOffsetWithEntries:(char)a1 .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "monotonicTimeWentBackwards=%d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)currentTime
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1B6AB6000, v1, v2, "PLTimeReferenceKernel::currentTime: error occurred %d %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __36__PLTimeReferenceKernel_currentTime__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "PLTimeReferenceKernel::currentTime: error occurred no mib to monotonic clock conversion", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

void __35__PLTimeReferenceKernel_resolution__block_invoke_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  __error();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_5(&dword_1B6AB6000, v1, v2, "PLTimeReferenceKernel::resolution: error occurred %d %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __35__PLTimeReferenceKernel_resolution__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "PLTimeReferenceKernel::resolution: error occurred, no mib to monotonicclock_rate_usecs conversion", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

@end
