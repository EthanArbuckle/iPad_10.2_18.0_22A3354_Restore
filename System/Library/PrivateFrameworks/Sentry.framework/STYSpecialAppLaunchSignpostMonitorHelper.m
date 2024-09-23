@implementation STYSpecialAppLaunchSignpostMonitorHelper

- (id)name
{
  return CFSTR("Special App Launch Signpost");
}

- (STYSpecialAppLaunchSignpostMonitorHelper)init
{
  STYSpecialAppLaunchSignpostMonitorHelper *v2;
  SignpostSupportSubsystemCategoryAllowlist *v3;
  SignpostSupportSubsystemCategoryAllowlist *allowList;
  uint64_t v5;
  NSUserDefaults *defaults;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STYSpecialAppLaunchSignpostMonitorHelper;
  v2 = -[STYSignpostsMonitorHelper init](&v8, sel_init);
  if (v2)
  {
    v3 = (SignpostSupportSubsystemCategoryAllowlist *)objc_alloc_init(MEMORY[0x1E0D97680]);
    allowList = v2->_allowList;
    v2->_allowList = v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.Sentry.Framework"));
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v5;

    -[SignpostSupportSubsystemCategoryAllowlist addSubsystem:category:](v2->_allowList, "addSubsystem:category:", CFSTR("com.apple.app_launch_measurement"), CFSTR("ApplicationLaunch"));
  }
  return v2;
}

- (id)allowList
{
  return self->_allowList;
}

- (void)handleInterval:(id)a3
{
  void *v3;
  id v5;
  const __CFString *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  float v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  double v29;
  _BOOL4 v30;
  void *v31;
  uint32_t v32;
  void *v33;
  NSObject *v34;
  double v35;
  void *v36;
  NSObject *v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  BOOL v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  __CFString **v47;
  __CFString *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  _QWORD block[5];
  id v58;
  NSObject *v59;
  id v60;
  NSObject *v61;
  uint64_t *v62;
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _BYTE v70[16];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (+[STYDeviceInfo isAppleInternal](STYDeviceInfo, "isAppleInternal"))
    v6 = CFSTR("ApplicationLaunchExtendedResponsive");
  else
    v6 = CFSTR("ApplicationFirstFramePresentation");
  objc_msgSend(v5, "number1Name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("IsForeground"));
  if (v8)
  {
    objc_msgSend(v5, "number1Value");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "isEqual:", MEMORY[0x1E0C9AAB0]) & 1) == 0)
    {

      goto LABEL_57;
    }
  }
  objc_msgSend(v5, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if (v8)
  {

    if ((v10 & 1) == 0)
      goto LABEL_57;
  }
  else
  {

    if (!v10)
      goto LABEL_57;
  }
  objc_msgSend(v5, "endEvent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = eventEndToNow(v11);

  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "logHandle");
  v14 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.14();

  if (v12 <= 5000.0)
  {
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__0;
    v68 = __Block_byref_object_dispose__0;
    v17 = v5;
    v69 = v17;
    v63 = 0;
    +[STYScenarioReport reportFromSignpostInterval:error:](STYScenarioReport, "reportFromSignpostInterval:error:", v17, &v63);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v63;
    v20 = v19;
    if (!v18)
    {
      if (v19)
      {
        if (objc_msgSend(v19, "code") == -2007 || objc_msgSend(v20, "code") == -2002)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v20, "description");
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.3();
          }
        }
        else if (objc_msgSend(v20, "code") == -2000)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "scenarioIdForSignpostInterval:", v17);
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.4();
          }
        }
        else
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "logHandle");
          v22 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v20, "description");
            objc_claimAutoreleasedReturnValue();
            -[STYGeneralSignpostMonitorHelper handleInterval:].cold.5();
          }
        }
      }
      else
      {
        +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "logHandle");
        v22 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          -[STYGeneralSignpostMonitorHelper handleInterval:].cold.2();
      }
      goto LABEL_56;
    }
    v21 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v17, "durationMs");
    objc_msgSend(v21, "numberWithDouble:");
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v17, "endEvent");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithUnsignedInt:", objc_msgSend(v24, "processID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "logHandle");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.13(-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", kSTYDefaultsEnforceAppLaunchThreshold, v56), (uint64_t)v70, v26);

    if (+[STYDeviceInfo isAppleInternal](STYDeviceInfo, "isAppleInternal")
      && !-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", kSTYDefaultsEnforceAppLaunchThreshold))
    {
      v30 = 0;
    }
    else
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper", v56);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "logHandle");
      v28 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.12();

      objc_msgSend(v17, "durationMs");
      v30 = v29 > 1000.0;
    }
    v32 = arc4random_uniform(0x7FFFFFFFu);
    if (!+[STYDeviceInfo isAppleInternal](STYDeviceInfo, "isAppleInternal"))
      goto LABEL_38;
    +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "logHandle");
    v34 = objc_claimAutoreleasedReturnValue();

    v35 = (double)v32 * 100.0 / 2147483650.0;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.11(v35 < 10.0, v34, v35);

    if (v35 < 10.0)
    {
      +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "logHandle");
      v37 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.7();
      v38 = 1;
    }
    else
    {
LABEL_38:
      if (v30)
      {
        +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logHandle");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.8();
      }
      else
      {
        if (!-[STYSpecialAppLaunchSignpostMonitorHelper forceAppLaunchDiagnostics](self, "forceAppLaunchDiagnostics"))
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "logHandle");
          v46 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.10();
          goto LABEL_55;
        }
        +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logHandle");
        v37 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.9();
      }
      v38 = 0;
    }

    if (dateOfLastTailspinRequest)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "timeIntervalSinceDate:", dateOfLastTailspinRequest);
      if (v42 >= 60.0)
      {

      }
      else
      {
        v43 = -[STYSpecialAppLaunchSignpostMonitorHelper forceAppLaunchDiagnostics](self, "forceAppLaunchDiagnostics");

        if (!v43)
        {
          +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "logHandle");
          v45 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            +[STYUserScenarioCache sharedCache](STYUserScenarioCache, "sharedCache");
            objc_msgSend((id)objc_claimAutoreleasedReturnValue(), "scenarioIdForSignpostInterval:", v65[5]);
            objc_claimAutoreleasedReturnValue();
            -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.6();
          }

          v46 = v65[5];
          v65[5] = 0;
LABEL_55:

LABEL_56:
          _Block_object_dispose(&v64, 8);

          goto LABEL_57;
        }
      }
    }
    v47 = &kSTYAppLaunchReasonRandom;
    if (!v38)
      v47 = &kSTYAppLaunchReasonSlow;
    v48 = *v47;
    v49 = mkHangtracerInteractionQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__STYSpecialAppLaunchSignpostMonitorHelper_handleInterval___block_invoke;
    block[3] = &unk_1E86A0E48;
    v62 = &v64;
    block[4] = self;
    v58 = v18;
    v59 = v22;
    v60 = v56;
    v46 = v48;
    v61 = v46;
    dispatch_async(v49, block);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v50 = objc_claimAutoreleasedReturnValue();
    v51 = (void *)dateOfLastTailspinRequest;
    dateOfLastTailspinRequest = v50;

    goto LABEL_55;
  }
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "logHandle");
  v16 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    -[STYSpecialAppLaunchSignpostMonitorHelper handleInterval:].cold.1();

LABEL_57:
}

void __59__STYSpecialAppLaunchSignpostMonitorHelper_handleInterval___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  TailspinFilenamePrefixForInterval(*(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  objc_msgSend(*(id *)(a1 + 32), "processAppLaunch:tailspinFilenamePrefix:duration:andPID:reason:", *(_QWORD *)(a1 + 40), v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)processAppLaunch:(id)a3 tailspinFilenamePrefix:(id)a4 duration:(id)a5 andPID:(id)a6 reason:(id)a7
{
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  __CFNotificationCenter *LocalCenter;
  dispatch_time_t v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD block[4];
  id v35;
  id v36;
  _QWORD v37[10];
  _QWORD v38[12];

  v38[10] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v33 = a5;
  v32 = a6;
  v31 = a7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "hash"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v14, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v15 = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "scenarioStartTime"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v11, "scenarioEndTime"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 1000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "logHandle");
  v20 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[STYGeneralSignpostMonitorHelper perfProblemDetected:tailspinFilenamePrefix:].cold.1(v11);

  v37[0] = kSTYScenarioReportRefKey;
  v37[1] = kSTYTailspinFilenameKey;
  v38[0] = v13;
  v38[1] = v15;
  v37[2] = kSTYScenarioStartTimeKey;
  v37[3] = kSTYScenarioEndTimeKey;
  v38[2] = v16;
  v38[3] = v17;
  v37[4] = kSTYScenarioReportKey;
  v37[5] = kSTYReportTypeKey;
  v38[4] = v11;
  v38[5] = kSTYAppLaunchReportType;
  v37[6] = kSTYDurationKey;
  v37[7] = kSTYThresholdKey;
  v38[6] = v33;
  v38[7] = v18;
  v37[8] = kSTYPIDKey;
  v37[9] = kSTYReasonKey;
  v38[8] = v32;
  v38[9] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[STYFrameworkHelper sharedHelper](STYFrameworkHelper, "sharedHelper");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "logHandle");
  v23 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    -[STYSpecialAppLaunchSignpostMonitorHelper processAppLaunch:tailspinFilenamePrefix:duration:andPID:reason:].cold.1(v21);

  objc_msgSend((id)outstandingTailspinSaveRequests, "setObject:forKey:", v11, v13);
  v24 = (void *)perfIssueDetectionTimeLogs;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v25, v13);

  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kSTYPerfProblemDetectedNotification, 0, (CFDictionaryRef)v21, 1u);
  v27 = dispatch_time(0, 900000000000);
  v28 = htInteractionQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__STYSpecialAppLaunchSignpostMonitorHelper_processAppLaunch_tailspinFilenamePrefix_duration_andPID_reason___block_invoke;
  block[3] = &unk_1E86A08D0;
  v35 = v13;
  v36 = v11;
  v29 = v11;
  v30 = v13;
  dispatch_after(v27, v28, block);

}

void __107__STYSpecialAppLaunchSignpostMonitorHelper_processAppLaunch_tailspinFilenamePrefix_duration_andPID_reason___block_invoke(uint64_t a1)
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

- (BOOL)forceAppLaunchDiagnostics
{
  return self->_forceAppLaunchDiagnostics;
}

- (void)setForceAppLaunchDiagnostics:(BOOL)a3
{
  self->_forceAppLaunchDiagnostics = a3;
}

- (BOOL)enforceAppLaunchThreshold
{
  return self->_enforceAppLaunchThreshold;
}

- (void)setEnforceAppLaunchThreshold:(BOOL)a3
{
  self->_enforceAppLaunchThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_allowList, 0);
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

- (void)handleInterval:.cold.6()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  os_log_t v5;
  uint8_t *v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_12(v2, v3, 5.778e-34);
  *(_WORD *)(v4 + 12) = 1024;
  *(_DWORD *)(v4 + 14) = 60;
  _os_log_error_impl(&dword_1CB87B000, v5, OS_LOG_TYPE_ERROR, "[Signpost: %@] Last request for a tailspin was less than %i seconds ago. Not requesting tailspin", v6, 0x12u);

  OUTLINED_FUNCTION_11();
}

- (void)handleInterval:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1CB87B000, v0, v1, "Accepting launch as a random sample", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)handleInterval:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1CB87B000, v0, v1, "Accepting launch as an exception for a slow launch", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)handleInterval:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1CB87B000, v0, v1, "Force accepting app launch as requested.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)handleInterval:.cold.10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1CB87B000, v0, v1, "Ignoring launch because it is neither a random sample nor a long launch.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)handleInterval:(double)a3 .cold.11(char a1, NSObject *a2, double a3)
{
  int v3;
  double v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 134218496;
  v4 = a3;
  v5 = 1024;
  v6 = 10;
  v7 = 1024;
  v8 = a1 & 1;
  _os_log_debug_impl(&dword_1CB87B000, a2, OS_LOG_TYPE_DEBUG, "Should randomly capture launch (%f < %u): %u", (uint8_t *)&v3, 0x18u);
  OUTLINED_FUNCTION_25();
}

- (void)handleInterval:.cold.12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_1CB87B000, v0, v1, "App launch threshold enforced", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)handleInterval:(NSObject *)a3 .cold.13(char a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 67109120;
  *(_DWORD *)(a2 + 4) = a1 & 1;
  OUTLINED_FUNCTION_14(&dword_1CB87B000, a3, (uint64_t)a3, "The value of enforceAppLaunchThreshold default is %d", (uint8_t *)a2);
}

- (void)handleInterval:.cold.14()
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

- (void)processAppLaunch:(void *)a1 tailspinFilenamePrefix:duration:andPID:reason:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "description");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_1CB87B000, v2, v3, "[Signpost: %@] Request details area as follows ", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
