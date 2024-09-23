@implementation STYGeneralSignpostMonitorHelper

- (id)name
{
  return CFSTR("General Signpost");
}

- (STYGeneralSignpostMonitorHelper)init
{
  STYGeneralSignpostMonitorHelper *v2;
  SignpostSupportSubsystemCategoryAllowlist *v3;
  SignpostSupportSubsystemCategoryAllowlist *allowList;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v9[16];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STYGeneralSignpostMonitorHelper;
  v2 = -[STYSignpostsMonitorHelper init](&v10, sel_init);
  if (v2)
  {
    v3 = (SignpostSupportSubsystemCategoryAllowlist *)objc_alloc_init(MEMORY[0x1E0D97680]);
    allowList = v2->_allowList;
    v2->_allowList = v3;

    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.SpringBoard"), CFSTR("TailspinSignposts"));
    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.camera.signposts"), CFSTR("TelemetrySignposts"));
    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.SpringBoard"), CFSTR("TelemetrySignposts"));
    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.UIKit"), CFSTR("ShareSheet"));
    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.signpost_emitter"), CFSTR("emitter_category"));
    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.mobileactivationd"), CFSTR("analytics"));
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sentry.Framework"));
    if ((objc_msgSend(v5, "BOOLForKey:", CFSTR("shouldDisableEPLAppLaunchMonitoring")) & 1) != 0)
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logHandle");
      v7 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1CB87B000, v7, OS_LOG_TYPE_DEFAULT, "App launch monitoring and watchdog termination monitoring via EPL is disabled", v9, 2u);
      }

    }
    else
    {
      -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.app_launch_measurement"), CFSTR("ApplicationLaunch"));
      -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.FrontBoard"), CFSTR("Watchdog"));
    }

  }
  return v2;
}

- (BOOL)wantsAnimationFrameRate
{
  return 1;
}

- (id)allowList
{
  return self->_allowList;
}

- (void)perfProblemDetectedOnMac:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandle");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[STYGeneralSignpostMonitorHelper perfProblemDetectedOnMac:].cold.3(v3);

  objc_msgSend(v3, "issueCategory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scenario");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "kpi");

  if (v8 == -1000)
  {
    v26[0] = CFSTR("observedLatency_in_ms");
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "observedLatencyInMs");
    objc_msgSend(v9, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v10;
    v26[1] = CFSTR("threshold_in_ms");
    v11 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "targetLatencyInMs");
    objc_msgSend(v11, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v12;
    v26[2] = CFSTR("scenarioID");
    objc_msgSend(v3, "scenario");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scenarioID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v27[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24[0] = CFSTR("observedFramerate_fps");
    v16 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "observedFps");
    objc_msgSend(v16, "numberWithFloat:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v10;
    v24[1] = CFSTR("threshold_fps");
    v17 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v3, "targetFps");
    objc_msgSend(v17, "numberWithFloat:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v12;
    v24[2] = CFSTR("scenarioID");
    objc_msgSend(v3, "scenario");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "scenarioID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v23 = 0;
  v18 = DRTailspinRequest();
  v19 = v23;
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper", &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "logHandle");
  v21 = objc_claimAutoreleasedReturnValue();

  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG);
  if (v18)
  {
    if (v22)
      -[STYGeneralSignpostMonitorHelper perfProblemDetectedOnMac:].cold.1(v3);
  }
  else if (v22)
  {
    -[STYGeneralSignpostMonitorHelper perfProblemDetectedOnMac:].cold.2();
  }

}

- (void)perfProblemDetected:(id)a3 tailspinFilenamePrefix:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  const __CFDictionary *v17;
  __CFNotificationCenter *LocalCenter;
  dispatch_time_t v19;
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD block[4];
  id v26;
  id v27;
  _QWORD v28[7];
  _QWORD v29[7];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v5, "hash"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v9, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v10 = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "scenarioStartTime"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "scenarioEndTime"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logHandle");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[STYGeneralSignpostMonitorHelper perfProblemDetected:tailspinFilenamePrefix:].cold.1(v5);

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logHandle");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v5, "scenario");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scenarioID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v31 = v23;
    v32 = 2112;
    v33 = v10;
    v34 = 2048;
    v35 = objc_msgSend(v11, "unsignedLongLongValue");
    v36 = 2048;
    v37 = objc_msgSend(v12, "unsignedLongLongValue");
    v38 = 1024;
    v39 = objc_msgSend(v7, "intValue");
    v40 = 2112;
    v41 = kSTYEplReportType;
    _os_log_debug_impl(&dword_1CB87B000, v16, OS_LOG_TYPE_DEBUG, "[Signpost: %@] Request details area as follows:\n\t Filename prefix : %@\n\t interval begin timestamp : %llu\n\t interval end timestamp : %llu\n\t Request identifier %d\n\t Report Type : %@", buf, 0x3Au);

  }
  v28[0] = kSTYScenarioReportRefKey;
  v28[1] = kSTYTailspinFilenameKey;
  v29[0] = v7;
  v29[1] = v10;
  v28[2] = kSTYScenarioStartTimeKey;
  v28[3] = kSTYScenarioEndTimeKey;
  v29[2] = v11;
  v29[3] = v12;
  v28[4] = kSTYScenarioReportKey;
  v28[5] = kSTYReportTypeKey;
  v29[4] = v5;
  v29[5] = kSTYEplReportType;
  v28[6] = kSTYReasonKey;
  v29[6] = CFSTR("EPL Request");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 7);
  v17 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)outstandingTailspinSaveRequests, "setObject:forKey:", v5, v7);
  objc_msgSend((id)perfIssueDetectionTimeLogs, "setObject:forKey:", v8, v7);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kSTYPerfProblemDetectedNotification, 0, v17, 1u);
  v19 = dispatch_time(0, 900000000000);
  v20 = htInteractionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke;
  block[3] = &unk_1E86A08D0;
  v26 = v7;
  v27 = v5;
  v21 = v5;
  v22 = v7;
  dispatch_after(v19, v20, block);

}

void __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  void *v2;
  void *v3;
  NSObject *v4;

  v1 = (_QWORD *)(a1 + 32);
  objc_msgSend((id)outstandingTailspinSaveRequests, "objectForKey:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logHandle");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke_cold_1();

    objc_msgSend((id)outstandingTailspinSaveRequests, "removeObjectForKey:", *v1);
  }
}

- (void)handleInterval:(id)a3
{
  id v4;
  void *v5;
  float v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  signed int v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[6];
  char v27;
  id v28;
  _QWORD v29[5];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "endEvent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = eventEndToNow(v5);

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logHandle");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[STYGeneralSignpostMonitorHelper handleInterval:].cold.6();

  if (v6 <= 5000.0)
  {
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__0;
    v29[4] = __Block_byref_object_dispose__0;
    v11 = v4;
    v30 = v11;
    v28 = 0;
    +[STYScenarioReport reportFromSignpostInterval:error:](STYScenarioReport, "reportFromSignpostInterval:error:", v11, &v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v28;
    v14 = v13;
    if (v12)
    {
      objc_msgSend(v11, "subsystem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.app_launch_measurement"));

      if (v16
        && (-[STYGeneralSignpostMonitorHelper seedUserMode](self, "seedUserMode")
         || +[STYDeviceInfo isAppleInternal](STYDeviceInfo, "isAppleInternal")))
      {
        v17 = arc4random_uniform(0x64u);
        LODWORD(v18) = 2139095039;
        if (v17 < 10)
          *(float *)&v18 = 0.0;
        objc_msgSend(v12, "setTargetLatencyInMs:", v18);
      }
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke;
      v26[3] = &unk_1E86A0E20;
      v27 = v16;
      v26[4] = self;
      v26[5] = v29;
      v19 = (void *)MEMORY[0x1D17A02DC](v26);
      +[STYPerformanceChecker sharedPerfChecker](STYPerformanceChecker, "sharedPerfChecker");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "checkPerformanceOfScenarioReport:completionHandler:", v12, v19);

    }
    else
    {
      if (v13)
      {
        if (objc_msgSend(v13, "code") == -2007 || objc_msgSend(v14, "code") == -2002)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v14, "description");
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.3();
          }
        }
        else if (objc_msgSend(v14, "code") == -2000)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "scenarioIdForSignpostInterval:", v11);
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.4();
          }
        }
        else
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v14, "description");
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.5();
          }
        }
      }
      else
      {
        +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logHandle");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[STYGeneralSignpostMonitorHelper handleInterval:].cold.2();
      }

    }
    _Block_object_dispose(v29, 8);

  }
  else
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logHandle");
    v10 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[STYGeneralSignpostMonitorHelper handleInterval:].cold.1();

  }
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  float v14;
  double v15;
  float v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  float v26;
  double v27;
  float v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  float v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  char v57;
  _QWORD block[5];
  id v59;
  uint64_t v60;
  char v61;
  uint8_t buf[4];
  void *v63;
  __int16 v64;
  double v65;
  __int16 v66;
  double v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a2)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logHandle");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "scenario");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "scenarioID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "observedLatencyInMs");
      v15 = v14;
      objc_msgSend(v9, "targetLatencyInMs");
      *(_DWORD *)buf = 138412802;
      v63 = v13;
      v64 = 2048;
      v65 = v15;
      v66 = 2048;
      v67 = v16;
      _os_log_impl(&dword_1CB87B000, v11, OS_LOG_TYPE_DEFAULT, "[Signpost: %@] Observed latency of %.0f ms was below threshold of %.0f ms", buf, 0x20u);

    }
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logHandle");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "localizedDescription");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v63 = v18;
      _os_log_impl(&dword_1CB87B000, v11, OS_LOG_TYPE_DEFAULT, "Perf check failed. Description: %@ ", buf, 0xCu);

    }
    goto LABEL_7;
  }
  objc_msgSend(v8, "scenario");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "kpi");

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logHandle");
  v22 = objc_claimAutoreleasedReturnValue();

  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20 == -1000)
  {
    if (!v23)
      goto LABEL_15;
    objc_msgSend(v9, "scenario");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scenarioID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "observedLatencyInMs");
    v27 = v26;
    objc_msgSend(v9, "targetLatencyInMs");
    *(_DWORD *)buf = 138412802;
    v63 = v25;
    v64 = 2048;
    v65 = v27;
    v66 = 2048;
    v67 = v28;
    v29 = "[Signpost: %@]  observed latency of %.0f ms was above threshold of %.0f ms";
    v30 = v22;
    v31 = 32;
  }
  else
  {
    if (!v23)
      goto LABEL_15;
    objc_msgSend(v9, "scenario");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "scenarioID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "observedFps");
    *(_DWORD *)buf = 138412546;
    v63 = v25;
    v64 = 2048;
    v65 = v32;
    v29 = " %@'s observed framerate of %.0f was below threshold. Initiating diagnostic collection";
    v30 = v22;
    v31 = 22;
  }
  _os_log_impl(&dword_1CB87B000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);

LABEL_15:
  v33 = dateOfLastTailspinRequest;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  v36 = (void *)dateOfLastTailspinRequest;
  if (!v33)
  {
    dateOfLastTailspinRequest = (uint64_t)v34;

    v44 = htInteractionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_258;
    block[3] = &unk_1E86A0DF8;
    v61 = *(_BYTE *)(a1 + 48);
    v45 = *(_QWORD *)(a1 + 32);
    v60 = *(_QWORD *)(a1 + 40);
    block[4] = v45;
    v59 = v9;
    dispatch_async(v44, block);
    v43 = v59;
    goto LABEL_19;
  }
  objc_msgSend(v34, "timeIntervalSinceDate:", dateOfLastTailspinRequest);
  v38 = v37;

  if (v38 > 60.0)
  {
    v39 = htInteractionQueue;
    v50 = MEMORY[0x1E0C809B0];
    v51 = 3221225472;
    v52 = __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_259;
    v53 = &unk_1E86A0DF8;
    v57 = *(_BYTE *)(a1 + 48);
    v40 = *(_QWORD *)(a1 + 32);
    v56 = *(_QWORD *)(a1 + 40);
    v54 = v40;
    v55 = v9;
    dispatch_async(v39, &v50);
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v50, v51, v52, v53, v54);
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = (void *)dateOfLastTailspinRequest;
    dateOfLastTailspinRequest = v41;

    v43 = v55;
LABEL_19:

    goto LABEL_8;
  }
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "logHandle");
  v47 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_cold_1(a1);

  v48 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v49 = *(void **)(v48 + 40);
  *(_QWORD *)(v48 + 40) = 0;

LABEL_8:
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_258(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  TailspinFilenamePrefixForInterval(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  if (*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "avoidGeneratingTailspinsForAppLaunches"))
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "scenario");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scenarioID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, "[Signpost: %@] Deferring app launch tailspin to special app launch monitoring ", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "perfProblemDetected:tailspinFilenamePrefix:", *(_QWORD *)(a1 + 40), v2);
  }

}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_259(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  TailspinFilenamePrefixForInterval(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  if (*(_BYTE *)(a1 + 56) && objc_msgSend(*(id *)(a1 + 32), "avoidGeneratingTailspinsForAppLaunches"))
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandle");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "scenario");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "scenarioID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1CB87B000, v6, OS_LOG_TYPE_DEFAULT, "[Signpost: %@] Deferring app launch tailspin to special app launch monitoring ", (uint8_t *)&v9, 0xCu);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "perfProblemDetected:tailspinFilenamePrefix:", *(_QWORD *)(a1 + 40), v2);
  }

}

- (void)handleEmit:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t v18[8];
  id v19;

  v19 = 0;
  +[STYScenarioReport reportFromSignpostEvent:error:](STYScenarioReport, "reportFromSignpostEvent:error:", a3, &v19);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v19;
  if (v4)
  {
    if (dateOfLastTailspinRequest
      && (objc_msgSend(MEMORY[0x1E0C99D68], "date"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "timeIntervalSinceDate:", dateOfLastTailspinRequest),
          v8 = v7,
          v6,
          v8 <= 60.0))
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandle");
      v15 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[STYGeneralSignpostMonitorHelper handleEmit:].cold.1(v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)dateOfLastTailspinRequest;
      dateOfLastTailspinRequest = v9;

      objc_msgSend(v4, "scenario");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        objc_msgSend(v4, "scenario");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "appName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(CFSTR("Sentry_LaunchWatchdog_"), "stringByAppendingString:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v15 = CFSTR("Sentry_LaunchWatchdog_");
      }
      -[STYGeneralSignpostMonitorHelper perfProblemDetected:tailspinFilenamePrefix:](self, "perfProblemDetected:tailspinFilenamePrefix:", v4, v15);
    }
  }
  else
  {
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandle");
    v15 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1CB87B000, v15, OS_LOG_TYPE_DEFAULT, "Signpost Event is not whitelisted", v18, 2u);
    }
  }

}

- (BOOL)seedUserMode
{
  return self->_seedUserMode;
}

- (void)setSeedUserMode:(BOOL)a3
{
  self->_seedUserMode = a3;
}

- (BOOL)avoidGeneratingTailspinsForAppLaunches
{
  return self->_avoidGeneratingTailspinsForAppLaunches;
}

- (void)setAvoidGeneratingTailspinsForAppLaunches:(BOOL)a3
{
  self->_avoidGeneratingTailspinsForAppLaunches = a3;
}

- (STYAbcHelper)abcHelper
{
  return (STYAbcHelper *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAbcHelper:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_abcHelper, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
}

- (void)perfProblemDetectedOnMac:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "scenario");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scenarioID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v3, v4, "[Signpost: %@] Diagnostics request was succesfull", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

- (void)perfProblemDetectedOnMac:.cold.2()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_23();
  objc_msgSend(v0, "scenario");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scenarioID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_9(&dword_1CB87B000, v3, v4, "[Signpost: %@] Diagnostics request failed with the error : %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

- (void)perfProblemDetectedOnMac:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "scenario");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scenarioID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v3, v4, "[Signpost: %@] Issue detected on mac", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

- (void)perfProblemDetected:(void *)a1 tailspinFilenamePrefix:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "scenario");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scenarioID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v3, v4, "[Signpost: %@] Requesting tailspin save via Hangtracer", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

void __78__STYGeneralSignpostMonitorHelper_perfProblemDetected_tailspinFilenamePrefix___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_23();
  objc_msgSend(*(id *)(v1 + 40), "scenario");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scenarioID");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_26();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_10(&dword_1CB87B000, v3, v4, "[Signpost: %@] The response from hangtracerd for report with Request identifier : %d timed out", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

- (void)handleInterval:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_24();
  objc_msgSend(v1, "scenarioIdForSignpostInterval:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CB87B000, v3, v4, "[Signpost: %@] Signpost notification recieved more than 5 seconds after it was emitted. This interval will not be processed further.", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

- (void)handleInterval:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0(&dword_1CB87B000, v0, v1, "Silent failure while processing interval", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)handleInterval:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_12(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_5(&dword_1CB87B000, v3, (uint64_t)v3, "%@", v4);

  OUTLINED_FUNCTION_11();
}

- (void)handleInterval:.cold.4()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12(v2, v3, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_1CB87B000, v4, (uint64_t)v4, "[Signpost: %@] Signpost interval is not whitelisted", v5);

  OUTLINED_FUNCTION_11();
}

- (void)handleInterval:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_12(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_0(&dword_1CB87B000, v3, (uint64_t)v3, "%@", v4);

  OUTLINED_FUNCTION_11();
}

- (void)handleInterval:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_24();
  objc_msgSend(v1, "scenarioIdForSignpostInterval:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_9(&dword_1CB87B000, v3, v4, "[Signpost: %@] Signpost Interval notification detected %.2f ms after interval ended", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_17();
}

void __50__STYGeneralSignpostMonitorHelper_handleInterval___block_invoke_cold_1(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scenarioIdForSignpostInterval:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CB87B000, v4, v5, "[Signpost: %@] Last request for a tailspin was less than a minute ago. Not requesting tailspin", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_0_2();
}

- (void)handleEmit:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "scenario");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scenarioID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CB87B000, v3, v4, "[Signpost: %@] Last request for a tailspin was less than a minute ago. Not requesting tailspin", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_2();
}

@end
