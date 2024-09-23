@implementation PHASearchEnrichmentTask

- (BOOL)currentPlatformIsSupported
{
  return 1;
}

- (int)priority
{
  return 1;
}

- (id)taskClassDependencies
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)period
{
  return 21600.0;
}

- (double)incrementalWindow
{
  return 604800.0;
}

- (BOOL)shouldRunIncrementallyWithGraphManager:(id)a3 incrementalChange:(id)a4 timeIntervalSinceNonIncrementalRun:(double)a5
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "timeIntervalSinceLastGraphFullRebuild");
  v8 = v7;
  if (v7 < a5)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "workingContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v14 = 138412546;
      v15 = v9;
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_1CAC16000, v12, OS_LOG_TYPE_INFO, "PHASearchEnrichmentTask should not run incrementally, graph was fully rebuilt recently: %@, last search non incremental run: %@", (uint8_t *)&v14, 0x16u);
    }

  }
  return v8 >= a5;
}

- (void)timeoutFatal:(BOOL)a3
{
  uint8_t v3[16];

  if (a3)
    __assert_rtn("-[PHASearchEnrichmentTask timeoutFatal:]", "PHASearchEnrichmentTask.m", 72, "NO");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_fault_impl(&dword_1CAC16000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "PHASearchEnrichmentTask is stuck", v3, 2u);
  }
}

- (id)enrichmentProcessor
{
  return objc_alloc_init(MEMORY[0x1E0D76010]);
}

@end
