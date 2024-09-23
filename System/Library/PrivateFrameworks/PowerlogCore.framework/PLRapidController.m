@implementation PLRapidController

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__PLRapidController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)sharedInstance_instance_1;
}

void __35__PLRapidController_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_instance_1;
  sharedInstance_instance_1 = (uint64_t)v0;

}

- (PLRapidController)init
{
  PLRapidController *v3;
  PLRapidController *v4;
  PLRapidController *v5;
  objc_super v7;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd"))
  {
    v3 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PLRapidController;
    v4 = -[PLRapidController init](&v7, sel_init);
    v5 = v4;
    if (v4)
      -[PLRapidController setupDRTasking](v4, "setupDRTasking");
    self = v5;
    v3 = self;
  }

  return v3;
}

- (void)initializeSamplingPercentage
{
  BOOL v3;
  double v4;
  _BOOL4 v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  NSObject *v11;
  double v12;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = +[PLPlatform internalBuild](PLPlatform, "internalBuild");
  v4 = 25.0;
  if (!v3)
  {
    v5 = +[PLPlatform seedBuild](PLPlatform, "seedBuild", 25.0);
    v4 = 0.2;
    if (v5)
      v4 = 20.0;
  }
  -[PLRapidController setSamplingPercentage:](self, "setSamplingPercentage:", v4);
  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidSamplingPercentage"), -1.0);
  v7 = v6;
  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidTaskedSamplingPercentage"), -1.0);
  if (v7 >= 0.0)
  {
    RapidLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v7;
      _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Overriding sampling percentage with manual override = %f", (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    v9 = v8;
    if (v8 < 0.0)
      goto LABEL_12;
    RapidLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v9;
      _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "Overriding sampling percentage with tasking override = %f", (uint8_t *)&v13, 0xCu);
    }
    v7 = v9;
  }

  -[PLRapidController setSamplingPercentage:](self, "setSamplingPercentage:", v7);
LABEL_12:
  RapidLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[PLRapidController samplingPercentage](self, "samplingPercentage");
    v13 = 134217984;
    v14 = v12;
    _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "RAPID sampling percentage: %f", (uint8_t *)&v13, 0xCu);
  }

}

- (void)initializeTaskingParams
{
  void *v3;
  id v4;

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", CFSTR("RapidTaskingConfigUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController setConfigUUID:](self, "setConfigUUID:", v3);

  +[PLDefaults objectForKey:](PLDefaults, "objectForKey:", CFSTR("RapidTaskingRequest"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PLRapidController setTaskingRequestReason:](self, "setTaskingRequestReason:", v4);

}

- (void)persistActivityState
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLRapidController stage](self, "stage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v3, CFSTR("RapidStage"), 1);

  -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v4, CFSTR("RapidStartDate"), 1);

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidDeferralCount"), 0.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 + 1.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v6, CFSTR("RapidDeferralCount"), 1);

  -[PLRapidController logCreationResumeDate](self, "logCreationResumeDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceNow");
  v9 = v8;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidProcessingTime"), 0.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 - v9);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v11, CFSTR("RapidProcessingTime"), 1);

}

- (void)resetActivity
{
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("RapidStage"), 1);
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("RapidStartDate"), 1);
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("RapidDeferralCount"), 1);
  +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", 0, CFSTR("RapidProcessingTime"), 1);
}

- (void)registerDataCollectionActivity
{
  NSObject *v3;
  void *v4;
  _QWORD handler[5];
  uint8_t buf[16];

  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Register XPC activity", buf, 2u);
  }

  v4 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__PLRapidController_registerDataCollectionActivity__block_invoke;
  handler[3] = &unk_1E6A53CB0;
  handler[4] = self;
  xpc_activity_register("com.apple.RAPID.DataCollectionActivity", v4, handler);
}

void __51__PLRapidController_registerDataCollectionActivity__block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  xpc_activity_state_t state;
  NSObject *v6;
  xpc_object_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a2;
  RapidLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "XPC activity handler invoked", buf, 2u);
  }

  state = xpc_activity_get_state(v3);
  if (state == 2)
  {
    RapidLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_DEFAULT, "XPC activity stats -> run", v11, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "handleXPCActivityCallback:", v3);
  }
  else if (!state)
  {
    RapidLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity state -> check-in", v12, 2u);
    }

    v7 = xpc_activity_copy_criteria(v3);
    v8 = v7;
    if (!v7 || !xpc_dictionary_get_count(v7))
    {
      +[PLRapidController dataCollectionCriterion](PLRapidController, "dataCollectionCriterion");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      xpc_activity_set_criteria(v3, v9);

    }
  }

}

- (void)handleXPCActivityCallback:(id)a3
{
  id v4;
  double v5;
  NSObject *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidStage"), -1.0);
  -[PLRapidController setStage:](self, "setStage:", (int)v5);
  -[PLRapidController initializeSamplingPercentage](self, "initializeSamplingPercentage");
  -[PLRapidController initializeTaskingParams](self, "initializeTaskingParams");
  if (-[PLRapidController stage](self, "stage") != -1)
    goto LABEL_4;
  -[PLRapidController logToCADataUploadState:](self, "logToCADataUploadState:", CFSTR("CheckShouldUpload"));
  if (-[PLRapidController shouldDoRapidCollection](self, "shouldDoRapidCollection"))
  {
    -[PLRapidController setStage:](self, "setStage:", -[PLRapidController stage](self, "stage") + 1);
    -[PLRapidController logToCADataUploadState:](self, "logToCADataUploadState:", CFSTR("LogGenerationStart"));
LABEL_4:
    -[PLRapidController setLogCreationStartDate](self, "setLogCreationStartDate");
    RapidLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v7;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "Log generation started at %@", buf, 0xCu);

    }
    v18 = 0;
    v8 = -[PLRapidController preparePerfPowerlog:shouldDefer:](self, "preparePerfPowerlog:shouldDefer:", v4, &v18);
    if (v18)
    {
      -[PLRapidController persistActivityState](self, "persistActivityState");
      +[PLRapidController deferActivity:](PLRapidController, "deferActivity:", v4);
    }
    else
    {
      v9 = v8;
      -[PLRapidController prepareMSSLog](self, "prepareMSSLog");
      -[PLRapidController setStage:](self, "setStage:", 6);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLRapidController setLogCreationEndDate:](self, "setLogCreationEndDate:", v10);

      RapidLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[PLRapidController logCreationEndDate](self, "logCreationEndDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v20 = v12;
        v21 = 1024;
        v22 = v9;
        _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "Log generation ended at %@ success: %d", buf, 0x12u);

      }
      if (v9)
      {
        -[PLRapidController packageAllLogs](self, "packageAllLogs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[PLRapidController logToCADataUploadState:](self, "logToCADataUploadState:", CFSTR("LogGenerationComplete"));
      }
      else
      {
        v13 = 0;
      }
      -[PLRapidController logToCADataUploadState:](self, "logToCADataUploadState:", CFSTR("LogSubmitToDPAttempt"));
      -[PLRapidController uploadLog:](self, "uploadLog:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLRapidController resetActivity](self, "resetActivity");
      if (v15)
      {
        RapidLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[PLRapidController handleXPCActivityCallback:].cold.1();

        v17 = 3;
      }
      else
      {
        -[PLRapidController logToCADataUploadState:](self, "logToCADataUploadState:", CFSTR("LogSubmitToDPSuccess"));
        if (v13)
          v17 = 0;
        else
          v17 = 3;
      }
      +[PLRapidController finishActivity:withStatus:](PLRapidController, "finishActivity:withStatus:", v4, v17);

    }
    goto LABEL_25;
  }
  RapidLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "Device should not upload today!", buf, 2u);
  }

  +[PLRapidController finishActivity:withStatus:](PLRapidController, "finishActivity:withStatus:", v4, 2);
LABEL_25:

}

+ (id)dataCollectionCriterion
{
  NSObject *v2;
  xpc_object_t v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  int64_t v7;
  void *v8;
  const char *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  RapidLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_1B6AB6000, v2, OS_LOG_TYPE_DEFAULT, "Preparing data collection criterion", (uint8_t *)&v11, 2u);
  }

  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C808D8], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80770], 1);
  xpc_dictionary_set_BOOL(v3, (const char *)*MEMORY[0x1E0C80808], 1);
  +[PLDefaults objectForKey:ifNotSet:](PLDefaults, "objectForKey:ifNotSet:", CFSTR("RapidActivityInterval"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    RapidLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Overriding RAPID activity interval to %@ secs", (uint8_t *)&v11, 0xCu);
    }

    v6 = (const char *)*MEMORY[0x1E0C807A8];
    v7 = objc_msgSend(v4, "unsignedIntValue");
    v8 = v3;
    v9 = v6;
  }
  else
  {
    xpc_dictionary_set_int64(v3, (const char *)*MEMORY[0x1E0C807A8], *MEMORY[0x1E0C807B8]);
    v9 = (const char *)*MEMORY[0x1E0C80790];
    v7 = *MEMORY[0x1E0C807D8];
    v8 = v3;
  }
  xpc_dictionary_set_int64(v8, v9, v7);
  xpc_dictionary_set_string(v3, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);

  return v3;
}

+ (BOOL)finishActivity:(id)a3 withStatus:(int64_t)a4
{
  int v5;
  NSObject *v6;
  int v8;
  int64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = xpc_activity_set_completion_status();
    RapidLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 134218240;
      v9 = a4;
      v10 = 1024;
      v11 = v5;
      _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_DEFAULT, "XPC activity set state to DONE, status: %ld success: %d", (uint8_t *)&v8, 0x12u);
    }

    +[PLRapidController cleanup](PLRapidController, "cleanup");
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

+ (BOOL)deferActivity:(id)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = xpc_activity_set_state((xpc_activity_t)a3, 3);
    RapidLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "XPC activity set state to DEFER, success: %d", (uint8_t *)v6, 8u);
    }

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (BOOL)shouldDoRapidCollection
{
  NSObject *v3;
  _BOOL4 v4;
  uint8_t v6[16];

  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Device upload check", v6, 2u);
  }

  v4 = +[PLRapidController diagnosticLogSubmissionEnabled](PLRapidController, "diagnosticLogSubmissionEnabled");
  if (v4)
  {
    -[PLRapidController samplingPercentage](self, "samplingPercentage");
    LOBYTE(v4) = +[PLRapidController randomBoolWithYesPercentage:](PLRapidController, "randomBoolWithYesPercentage:");
  }
  return v4;
}

+ (BOOL)diagnosticLogSubmissionEnabled
{
  int v2;
  NSObject *v3;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = DiagnosticLogSubmissionEnabled();
  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "DNU upload: %d", (uint8_t *)v5, 8u);
  }

  return v2;
}

+ (BOOL)randomBoolWithYesPercentage:(double)a3
{
  double v4;
  NSObject *v5;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = (double)arc4random() * 100.0 * 2.32830644e-10;
  RapidLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4 < a3;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Coin toss upload: %d", (uint8_t *)v7, 8u);
  }

  return v4 < a3;
}

- (BOOL)preparePerfPowerlog:(id)a3 shouldDefer:(BOOL *)a4
{
  _xpc_activity_s *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = (_xpc_activity_s *)a3;
  if (-[PLRapidController stage](self, "stage") <= 4)
  {
    RapidLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Preparing perfpowerlog", (uint8_t *)&v15, 2u);
    }

    -[PLRapidController setMDLogFilePath](self, "setMDLogFilePath");
    -[PLRapidController setMDLogCompressedFilePath](self, "setMDLogCompressedFilePath");
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", CFSTR("/tmp/rapid/"));
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", CFSTR("/tmp/rapid/rapid_archive"));
    getRapidAllowblocklist();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[PLRapidController stage](self, "stage") > 4)
    {
      v10 = 0;
    }
    else
    {
      v10 = 0;
      while (!*a4)
      {
        if (!v10)
        {
          if (-[PLRapidController stage](self, "stage") < 1)
          {
            v10 = 0;
          }
          else
          {
            -[PLRapidController setupConnection](self, "setupConnection");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v10)
            {
LABEL_31:
              v7 = 0;
              goto LABEL_29;
            }
          }
        }
        switch(-[PLRapidController stage](self, "stage"))
        {
          case 0:
            if (!-[PLRapidController copyDB](self, "copyDB"))
              goto LABEL_31;
            break;
          case 1:
            -[PLRapidController pruneDB:withConfig:](self, "pruneDB:withConfig:", v10, v9);
            break;
          case 2:
            -[PLRapidController logSignpostDataToDB:](self, "logSignpostDataToDB:", v10);
            break;
          case 3:
            -[PLRapidController trimAndFilterDB:withConfig:](self, "trimAndFilterDB:withConfig:", v10, v9);
            break;
          case 4:
            if (!-[PLRapidController packageDB:](self, "packageDB:", v10))
              goto LABEL_31;
            break;
          default:
            break;
        }
        -[PLRapidController setStage:](self, "setStage:", -[PLRapidController stage](self, "stage") + 1);
        *a4 = xpc_activity_should_defer(v6);
        if (-[PLRapidController stage](self, "stage") >= 5)
          break;
      }
    }
    if (-[PLRapidController stage](self, "stage") == 5)
    {
      -[PLRapidController mdLogCompressedFilePath](self, "mdLogCompressedFilePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v11);

      if (v12 > (uint64_t)((double)+[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("RapidTaskedUploadSizeLimit"), 2048000)* 0.7))
      {
        RapidLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 134217984;
          v16 = v12;
          _os_log_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_DEFAULT, "MDLog size = %lld, skipping MSS upload", (uint8_t *)&v15, 0xCu);
        }

        *a4 = 0;
        -[PLRapidController setStage:](self, "setStage:", 6);
      }
    }
    v7 = 1;
LABEL_29:

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)setupConnection
{
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  NSObject *v7;
  PLSQLiteConnection *v9;
  void *v10;
  PLSQLiteConnection *v11;
  uint8_t v12[15];
  char v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController mdLogFilePath](self, "mdLogFilePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v13);

  if (v5)
    v6 = v13 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v9 = [PLSQLiteConnection alloc];
    -[PLRapidController mdLogFilePath](self, "mdLogFilePath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PLSQLiteConnection initWithFilePath:](v9, "initWithFilePath:", v10);

    return v11;
  }
  else
  {
    RapidLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Expected file, but not found. Resetting stage, try next time!", v12, 2u);
    }

    -[PLRapidController setFailureReason:](self, "setFailureReason:", CFSTR("SetupConnectionFileMissing"));
    return 0;
  }
}

- (BOOL)copyDB
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint8_t v10[16];

  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Copy DB", v10, 2u);
  }

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLRapidController mdLogFilePath](self, "mdLogFilePath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "copyDatabaseToPath:", v7);

  if ((v8 & 1) == 0)
    -[PLRapidController setFailureReason:](self, "setFailureReason:", CFSTR("CopyDB"));

  return v8;
}

- (void)pruneDB:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  v7 = a3;
  RapidLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Prune DB", v9, 2u);
  }

  objc_msgSend(v7, "beginTransaction");
  +[PLRapidController dropTablesFromDB:withConfig:](PLRapidController, "dropTablesFromDB:withConfig:", v7, v6);
  +[PLRapidController dropDataFromDB:withConfig:](PLRapidController, "dropDataFromDB:withConfig:", v7, v6);

  -[PLRapidController dropAppVersions:](self, "dropAppVersions:", v7);
  objc_msgSend(v7, "endTransaction");

}

- (void)trimAndFilterDB:(id)a3 withConfig:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t v18[16];
  uint8_t v19[16];
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  RapidLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Trim DB", buf, 2u);
  }

  objc_msgSend(v6, "beginTransaction");
  -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "convertFromSystemToMonotonic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dateByAddingTimeInterval:", -86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLRapidController trimConditionsForTables:trimDate:](PLRapidController, "trimConditionsForTables:trimDate:", v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trimAllTablesFromDate:toDate:withTableFilters:", v11, v10, v15);
  RapidLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v19 = 0;
    _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_DEFAULT, "Time Offsetting", v19, 2u);
  }

  objc_msgSend(v11, "timeIntervalSince1970");
  +[PLRapidController offsetTimestampsInDB:withConfig:withBaseTimestamp:](PLRapidController, "offsetTimestampsInDB:withConfig:withBaseTimestamp:", v6, v7);
  RapidLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1B6AB6000, v17, OS_LOG_TYPE_DEFAULT, "Rounding", v18, 2u);
  }

  +[PLRapidController roundDataInDB:withConfig:](PLRapidController, "roundDataInDB:withConfig:", v6, v7);
  -[PLRapidController dropDuplicateRows:](self, "dropDuplicateRows:", v6);
  objc_msgSend(v6, "endTransaction");

}

- (BOOL)packageDB:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  RapidLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Attribute", buf, 2u);
  }

  v6 = (id)objc_msgSend(v4, "performQuery:", CFSTR("CREATE TABLE attributes(name TEXT PRIMARY KEY, value) WITHOUT ROWID"));
  v7 = (id)objc_msgSend(v4, "performQuery:", CFSTR("INSERT INTO attributes (name, value) VALUES (\"LogType\", \"RAPID\");"));
  RapidLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Vacuum", v15, 2u);
  }

  objc_msgSend(v4, "fullVacuum");
  objc_msgSend(v4, "closeConnection");
  RapidLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "Compress DB", v14, 2u);
  }

  -[PLRapidController mdLogFilePath](self, "mdLogFilePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController mdLogCompressedFilePath](self, "mdLogCompressedFilePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v10, v11, 6);

  if (!v12)
    -[PLRapidController setFailureReason:](self, "setFailureReason:", CFSTR("CompressDB"));

  return v12;
}

+ (void)dropTablesFromDB:(id)a3 withConfig:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  +[PLRapidController allTablesInDB:](PLRapidController, "allTablesInDB:", v5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __49__PLRapidController_dropTablesFromDB_withConfig___block_invoke;
  v14[3] = &unk_1E6A554B0;
  v15 = v9;
  v16 = v6;
  v17 = v5;
  v10 = v5;
  v11 = v6;
  v12 = v9;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);

}

void __49__PLRapidController_dropTablesFromDB_withConfig___block_invoke(id *a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("name"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1[4], "containsObject:", v9);
  objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isIHA"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "BOOLValue"))
    v6 = !+[PLUtilities isHealthDataSubmissionAllowed](PLUtilities, "isHealthDataSubmissionAllowed");
  else
    v6 = 0;

  if (!v3 || v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = (id)objc_msgSend(a1[6], "performQuery:", v7);

  }
}

+ (void)dropDataFromDB:(id)a3 withConfig:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__PLRapidController_dropDataFromDB_withConfig___block_invoke;
  v7[3] = &unk_1E6A55500;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __47__PLRapidController_dropDataFromDB_withConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  __CFString *v11;
  char v12;

  v7 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("drop"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = objc_msgSend(v7, "containsString:", CFSTR("_Aggregate_"));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__PLRapidController_dropDataFromDB_withConfig___block_invoke_2;
    v8[3] = &unk_1E6A554D8;
    v12 = v6;
    v9 = v7;
    v10 = *(id *)(a1 + 32);
    v11 = CFSTR("ALTER TABLE %@ DROP COLUMN \"%@\");
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);

  }
}

void __47__PLRapidController_dropDataFromDB_withConfig___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  v8 = v3;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP INDEX IF EXISTS Index_%@_%@"), *(_QWORD *)(a1 + 32), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(*(id *)(a1 + 40), "performQuery:", v4);

    v3 = v8;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(*(id *)(a1 + 40), "performQuery:", v6);

}

- (void)dropAppVersions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v8 = a3;
  -[PLRapidController topAppsRunTime](self, "topAppsRunTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("delete from PLApplicationAgent_EventNone_AllApps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLRapidController appsToKeep:](PLRapidController, "appsToKeep:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v6);

  v7 = (id)objc_msgSend(v8, "performQuery:", v5);
}

+ (id)appsToKeep:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint32_t v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CF9DE0], "defaultService");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "autoUpdateEnabled") & 1) != 0)
    {

    }
    else
    {
      v6 = objc_msgSend(v3, "count");

      if (v6 >= 3)
      {
        v11 = objc_msgSend(v3, "count");
        objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(v11));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectAtIndexedSubscript:", arc4random_uniform(v11));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        RapidLog();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v16 = v9;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_1B6AB6000, v13, OS_LOG_TYPE_DEFAULT, "Report app version data for: %@, %@", buf, 0x16u);
        }

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" where AppBundleId not in ('%@','%@')"), v9, v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
    }
    RapidLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1B6AB6000, v7, OS_LOG_TYPE_DEFAULT, "Report app version data for all top 3rd party apps: %@", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR("','"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR(" where AppBundleId not in ('%@')"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

    v5 = v10;
    goto LABEL_13;
  }
  v5 = &stru_1E6A56538;
LABEL_13:

  return v5;
}

- (id)topAppsRunTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "convertFromSystemToMonotonic");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "dateByAddingTimeInterval:", -86400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v9, "timeIntervalSince1970");
  v12 = v11;
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v10, "stringWithFormat:", CFSTR("select distinct AppBundleId as app from PLApplicationAgent_EventNone_AllApps                              where AppIs3rdParty = 1 OR AppBundleId NOT like '%%com.apple.%%' AND AppBundleId in                              (select BundleID from PLAppTimeService_Aggregate_AppRunTime where timestamp >= %f AND timestamp < %f                               group by BundleID having SUM(ScreenOnTime) > %d                             );"),
    v12,
    v13,
    60);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v6;
  objc_msgSend(v6, "performQuery:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v24;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v24 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v19), "objectForKeyedSubscript:", CFSTR("app"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v17);
  }

  return v3;
}

- (void)dropDuplicateRows:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  uint8_t v6[16];

  v3 = a3;
  RapidLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "Drop Duplicate Rows", v6, 2u);
  }

  v5 = (id)objc_msgSend(v3, "performQuery:", CFSTR("DELETE from PLBBAgent_EventPoint_TelephonyActivity where ID in (SELECT ID FROM PLBBAgent_EventPoint_TelephonyActivity t1 WHERE EXISTS (SELECT * FROM PLBBAgent_EventPoint_TelephonyActivity t2 WHERE t2.airplaneMode IS t1.airplaneMode and t2.callStatus IS t1.callStatus and t2.campedRat IS t1.campedRat and t2.signalBars IS t1.signalBars and t2.subsId IS t1.subsId AND t2.ID = (SELECT MAX(ID) FROM PLBBAgent_EventPoint_TelephonyActivity t3 WHERE t3.ID < t1.ID)));"));
}

+ (void)offsetTimestampsInDB:(id)a3 withConfig:(id)a4 withBaseTimestamp:(double)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  __CFString *v10;
  id v11;
  double v12;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke;
  v9[3] = &unk_1E6A55550;
  v12 = a5;
  v10 = CFSTR("UPDATE %@ SET timestamp = timestamp - %f, ");
  v11 = v7;
  v8 = v7;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v9);

}

void __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("timeOffset"));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", a1[4], v5, a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke_2;
  v12[3] = &unk_1E6A55528;
  v13 = v6;
  v14 = a1[6];
  v7 = v6;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);
  v8 = (void *)a1[5];
  objc_msgSend(v7, "substringToIndex:", objc_msgSend(v7, "length") - 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "performQuery:", v9);

}

uint64_t __71__PLRapidController_offsetTimestampsInDB_withConfig_withBaseTimestamp___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\"%@\" = \"%@\" - %f, "), a2, a2, *(_QWORD *)(a1 + 40));
}

+ (void)roundDataInDB:(id)a3 withConfig:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__PLRapidController_roundDataInDB_withConfig___block_invoke;
  v7[3] = &unk_1E6A55500;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  __CFString *v17;
  id v18;
  _QWORD v19[4];
  __CFString *v20;
  id v21;

  v15 = a2;
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roundNearest"));
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("roundNearestThresholded"));
  v7 = objc_claimAutoreleasedReturnValue();

  if (v6 | v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("UPDATE %@ SET "), v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__PLRapidController_roundDataInDB_withConfig___block_invoke_2;
    v19[3] = &unk_1E6A55578;
    v20 = CFSTR("((cast(\"%@\" as int) + %d) / %d) * %d");
    v10 = v8;
    v21 = v10;
    objc_msgSend((id)v6, "enumerateKeysAndObjectsUsingBlock:", v19);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3;
    v16[3] = &unk_1E6A555A0;
    v17 = CFSTR("((cast(\"%@\" as int) + %d) / %d) * %d");
    v18 = v10;
    v11 = v10;
    objc_msgSend((id)v7, "enumerateKeysAndObjectsUsingBlock:", v16);
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v11, "substringToIndex:", objc_msgSend(v11, "length") - 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v12, "performQuery:", v13);

  }
}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  int v7;
  id v8;

  v5 = a2;
  v6 = objc_msgSend(a3, "intValue");
  if ((int)v6 >= 0)
    v7 = v6;
  else
    v7 = v6 + 1;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", *(_QWORD *)(a1 + 32), v5, (v7 >> 1), v6, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\"%@\" =  %@, "), v5, v8);

}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  NSObject *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "intValue");

    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "intValue");

    if ((int)v11 >= 0)
      v12 = v11;
    else
      v12 = v11 + 1;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", *(_QWORD *)(a1 + 32), v5, (v12 >> 1), v11, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("\"%@\" =  (\"%@\" > %d) * %@ + (\"%@\" <= %d) * (\"%@\"), "), v5, v5, v9, v13, v5, v9, v5);

  }
  else
  {
    RapidLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3_cold_1();

  }
}

+ (id)trimConditionsForTables:(id)a3 trimDate:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  __CFString *v14;
  __CFString *v15;
  id v16;
  uint64_t v17;

  v5 = a3;
  objc_msgSend(a4, "timeIntervalSince1970");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__PLRapidController_trimConditionsForTables_trimDate___block_invoke;
  v13[3] = &unk_1E6A555C8;
  v17 = v7;
  v14 = CFSTR("timestamp is NULL OR timestamp < (SELECT max(timestamp) FROM '%@' WHERE timestamp < %f)");
  v15 = CFSTR("(timestampEnd < %f) OR ((timestamp is NULL OR timestamp < %f) AND (timestampEnd is NULL OR timestampEnd < %f))");
  v9 = v8;
  v16 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v13);

  v10 = v16;
  v11 = v9;

  return v11;
}

void __54__PLRapidController_trimConditionsForTables_trimDate___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v3 = objc_msgSend(v17, "containsString:", CFSTR("_Array_"));
  v4 = v17;
  if ((v3 & 1) == 0)
  {
    +[PLEntryKey PLEntryKeyForEntryKey:](PLEntryKey, "PLEntryKeyForEntryKey:", v17);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("EventForward")))
    {

    }
    else
    {
      objc_msgSend(v5, "entryKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("PLConfigAgent_EventNone_Config"));

      if (!v8)
      {
        objc_msgSend(v5, "entryType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("EventInterval"));

        if (!v11)
          goto LABEL_7;
        v12 = (void *)MEMORY[0x1E0CB3940];
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 56);
        +[PLUtilities deviceBootTime](PLUtilities, "deviceBootTime");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "timeIntervalSince1970");
        objc_msgSend(v12, "stringWithFormat:", v13, v14, v16, *(_QWORD *)(a1 + 56));
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_7;
        goto LABEL_6;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", *(_QWORD *)(a1 + 32), v17, *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
LABEL_7:

      v4 = v17;
      goto LABEL_8;
    }
LABEL_6:
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v9, v17);

    goto LABEL_7;
  }
LABEL_8:

}

+ (id)allTablesInDB:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = a3;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("SELECT name FROM sqlite_master WHERE type=\"table\";"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performQuery:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "removeObject:", &unk_1E6AF7598);

  return v7;
}

- (void)setLogCreationStartDate
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "stage");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, a2, v3, "Expected logCreationStartDate for stage %ld but not found!", v4);
  OUTLINED_FUNCTION_2_1();
}

- (void)setMDLogFilePath
{
  id v3;

  objc_msgSend(CFSTR("/tmp/rapid/"), "stringByAppendingPathComponent:", CFSTR("rapid-perfpowerlog.PLSQL"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLRapidController setMdLogFilePath:](self, "setMdLogFilePath:", v3);

}

- (void)setMDLogCompressedFilePath
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "Uncompressed file path not set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

+ (void)cleanup
{
  _BOOL4 v2;
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  id *v6;
  void *v7;
  _QWORD v8[5];
  id obj;
  uint8_t buf[8];
  uint8_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v2 = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("RapidNoCleanup"), 0);
  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Skipping cleanup!", buf, 2u);
    }

  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Cleanup", buf, 2u);
    }

    *(_QWORD *)buf = 0;
    v11 = buf;
    v12 = 0x3032000000;
    v13 = __Block_byref_object_copy__14;
    v14 = __Block_byref_object_dispose__14;
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id *)(v11 + 40);
    obj = (id)*((_QWORD *)v11 + 5);
    objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", CFSTR("/tmp/rapid/"), &obj);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v6, obj);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __28__PLRapidController_cleanup__block_invoke;
    v8[3] = &unk_1E6A555F0;
    v8[4] = buf;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

    _Block_object_dispose(buf, 8);
  }
}

void __28__PLRapidController_cleanup__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id obj;

  objc_msgSend(CFSTR("/tmp/rapid/"), "stringByAppendingPathComponent:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("/tmp/rapid/rapid_archive.tar.gz")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v5 = a1 + 32;
    v7 = *(_QWORD *)(v6 + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);

    if ((v8 & 1) == 0)
    {
      RapidLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __28__PLRapidController_cleanup__block_invoke_cold_1(v5, v9, v10, v11, v12, v13, v14, v15);

    }
  }

}

- (void)logSignpostDataToDB:(id)a3
{
  id v4;
  NSObject *v5;
  SignpostReaderHelper *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  RapidLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Signpost Logging", (uint8_t *)&v14, 2u);
  }

  v6 = objc_alloc_init(SignpostReaderHelper);
  -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingTimeInterval:", -86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SignpostReaderHelper generateRapidSignpostSummaryWithStartDate:endDate:](v6, "generateRapidSignpostSummaryWithStartDate:endDate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  RapidLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "allKeys");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_DEFAULT, "Signpost result %@", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("hangDurations"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController logHangSignposts:toDB:](self, "logHangSignposts:toDB:", v13, v4);

}

- (void)logHangSignposts:(id)a3 toDB:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  __CFString *v10;
  id v11;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RapidLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "Hangs count %lu", (uint8_t *)&buf, 0xCu);
  }

  if (v6 && objc_msgSend(v6, "count"))
  {
    -[PLRapidController createHangTableInDB:](self, "createHangTableInDB:", v7);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v14 = 0x2020000000;
    v15 = 1;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__PLRapidController_logHangSignposts_toDB___block_invoke;
    v9[3] = &unk_1E6A55618;
    v10 = CFSTR("INSERT INTO %@ (ID, timestamp, BundleID, HangDuration, HangType) VALUES (%@, %f, '%@', %@, '%@')");
    p_buf = &buf;
    v11 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

    _Block_object_dispose(&buf, 8);
  }

}

void __43__PLRapidController_logHangSignposts_toDB___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v18 = a2;
  v3 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("startDate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertFromSystemToMonotonic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSince1970");
  v7 = v6;

  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithInt:", +[PLRapidController hangTypeFromStr:](PLRapidController, "hangTypeFromStr:", v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB3940];
  v12 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("bundleID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("duration"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v12, CFSTR("Signposts_HangDurations"), v13, v7, v14, v15, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (id)objc_msgSend(*(id *)(a1 + 40), "performQuery:", v16);
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  objc_autoreleasePoolPop(v3);
}

+ (int)hangTypeFromStr:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  _QWORD v12[3];
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13[0] = CFSTR("Completed Runloop Hang");
  v13[1] = CFSTR("Timed Out Runloop Hang");
  v13[2] = CFSTR("Debugger Attached Runloop Hang");
  v13[3] = CFSTR("Extended Launch Runloop Hang");
  v13[4] = CFSTR("App Exit Runloop Hang");
  v13[5] = CFSTR("Non-Responsive Task Runloop Hang");
  v13[6] = CFSTR("User Switched Away Runloop Hang");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);

  v7 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12[0] = CFSTR("Runloop and Slow Fence Hang");
  v12[1] = CFSTR("Blown Fence Hang");
  v12[2] = CFSTR("Blown CA Fence Hang");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:", v8);

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UIKit-runloop")) & 1) != 0
    || (objc_msgSend(v6, "containsObject:", v3) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    v10 = 2;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Fence-hang")) & 1) == 0)
    {
      if (objc_msgSend(v9, "containsObject:", v3))
        v10 = 2;
      else
        v10 = 0;
    }
  }

  return v10;
}

- (void)createHangTableInDB:(id)a3
{
  objc_msgSend(a3, "createTableName:withColumns:", CFSTR("Signposts_HangDurations"), &unk_1E6AF5FC0);
}

- (BOOL)prepareMSSLog
{
  int64_t v3;
  SignpostReaderHelper *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  int v28;
  int64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = -[PLRapidController stage](self, "stage");
  RapidLog();
  v4 = (SignpostReaderHelper *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(&v4->super, OS_LOG_TYPE_DEFAULT);
  if (v3 == 5)
  {
    if (v5)
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1B6AB6000, &v4->super, OS_LOG_TYPE_DEFAULT, "Preparing MSS", (uint8_t *)&v28, 2u);
    }

    -[PLRapidController setMSSFilePath](self, "setMSSFilePath");
    -[PLRapidController setMSSCompressedFilePath](self, "setMSSCompressedFilePath");
    +[PLUtilities createAndChownDirectoryIfDirectoryDoesNotExist:](PLUtilities, "createAndChownDirectoryIfDirectoryDoesNotExist:", CFSTR("/tmp/rapid/rapid_archive/mss"));
    v4 = objc_alloc_init(SignpostReaderHelper);
    -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateByAddingTimeInterval:", -86400.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLRapidController mssFilePath](self, "mssFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostReaderHelper generateRapidMSSWithStartDate:endDate:atPath:](v4, "generateRapidMSSWithStartDate:endDate:atPath:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    RapidLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v28 = 138412290;
      v29 = (int64_t)v10;
      _os_log_impl(&dword_1B6AB6000, v11, OS_LOG_TYPE_INFO, "generateMSS result: %@", (uint8_t *)&v28, 0xCu);
    }

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("success"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[PLRapidController mssFilePath](self, "mssFilePath");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLRapidController mssCompressedFilePath](self, "mssCompressedFilePath");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = +[PLUtilities compressWithSource:withDestination:withLevel:](PLUtilities, "compressWithSource:withDestination:withLevel:", v13, v14, 6);

      if (v15)
      {
        v16 = 1;
LABEL_19:

        goto LABEL_20;
      }
      RapidLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[PLRapidController prepareMSSLog].cold.2(self, v26);

      -[PLRapidController setFailureReason:](self, "setFailureReason:", CFSTR("CompressMSS"));
    }
    else
    {
      RapidLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[PLRapidController prepareMSSLog].cold.1(v17, v18, v19, v20, v21, v22, v23, v24);

      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("error"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLRapidController setFailureReason:](self, "setFailureReason:", v25);

    }
    v16 = 0;
    goto LABEL_19;
  }
  if (v5)
  {
    v28 = 134217984;
    v29 = -[PLRapidController stage](self, "stage");
    _os_log_impl(&dword_1B6AB6000, &v4->super, OS_LOG_TYPE_DEFAULT, "Skipping MSS preparation, stage = %ld", (uint8_t *)&v28, 0xCu);
  }
  v16 = 0;
LABEL_20:

  return v16;
}

- (void)setMSSFilePath
{
  id v3;

  objc_msgSend(CFSTR("/tmp/rapid/"), "stringByAppendingPathComponent:", CFSTR("rapid-microstackshot.txt"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLRapidController setMssFilePath:](self, "setMssFilePath:", v3);

}

- (void)setMSSCompressedFilePath
{
  OUTLINED_FUNCTION_5_1(&dword_1B6AB6000, a1, a3, "Uncompressed MSS file path not set", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (id)packageAllLogs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D1D1F8];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/tmp/rapid/rapid_archive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "archiveDirectoryAt:deleteOriginal:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities setMobileOwnerForFile:](PLUtilities, "setMobileOwnerForFile:", v6);

  }
  else
  {
    -[PLRapidController setFailureReason:](self, "setFailureReason:", CFSTR("DEArchiverFailure"));
  }
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)generateContextDictionary:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  int v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  -[PLRapidController logGenerationStats](self, "logGenerationStats");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController logToCALogGenerationStats:](self, "logToCALogGenerationStats:", v5);
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  +[PLUtilities supplementalBuildVersion](PLUtilities, "supplementalBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("SupplementalBuild"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("SupplementalBuild"));

  }
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0C997B0]);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("unknown");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("CurrentCountry"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("4"), CFSTR("Version"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("2"), CFSTR("MetadataVersion"));
  +[PLUtilities automatedDeviceGroup](PLUtilities, "automatedDeviceGroup");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    v14 = MEMORY[0x1E0C9AAB0];
  else
    v14 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("AutomatedDeviceGroup"));

  v15 = (void *)MEMORY[0x1E0CB37E8];
  -[PLRapidController samplingPercentage](self, "samplingPercentage");
  objc_msgSend(v15, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("SamplingPercentage"));

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AutomatedDeviceGroup"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "BOOLValue");

  if (v18)
  {
    +[PLUtilities automatedDeviceGroup](PLUtilities, "automatedDeviceGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, CFSTR("AutomatedDeviceGroupRawValue"));

  }
  -[PLRapidController configUUID](self, "configUUID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[PLRapidController configUUID](self, "configUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("TaskingConfigUUID"));

  }
  -[PLRapidController taskingRequestReason](self, "taskingRequestReason");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[PLRapidController taskingRequestReason](self, "taskingRequestReason");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("TaskingRequest"));

  }
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], CFSTR("IsValidPayload"));
  if (a3)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AllowedUpload"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    RapidLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if ((v25 & 1) != 0)
    {
      if (v27)
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1B6AB6000, v26, OS_LOG_TYPE_DEFAULT, "Upload file size within acceptable threshold", (uint8_t *)&v34, 2u);
      }

      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsValidPayload"));
      v28 = (void *)objc_opt_new();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("Files"));

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Files"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLRapidController addMDLogContext:](self, "addMDLogContext:", v29);

      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Files"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLRapidController addMSSContext:](self, "addMSSContext:", v30);

    }
    else
    {
      if (v27)
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1B6AB6000, v26, OS_LOG_TYPE_DEFAULT, "Upload file size exceeded", (uint8_t *)&v34, 2u);
      }

      objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("PayloadTooLarge"), CFSTR("FailureReason"));
    }
  }
  else
  {
    RapidLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1B6AB6000, v31, OS_LOG_TYPE_DEFAULT, "Missing uploadFilePath", (uint8_t *)&v34, 2u);
    }

  }
  RapidLog();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 138412290;
    v35 = v6;
    _os_log_impl(&dword_1B6AB6000, v32, OS_LOG_TYPE_DEFAULT, "Context Dictionary: %@", (uint8_t *)&v34, 0xCu);
  }

  return v6;
}

- (BOOL)isUploadSizeWithinLimit:(id)a3
{
  int64_t v3;

  v3 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", a3);
  return v3 <= +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("RapidTaskedUploadSizeLimit"), 2048000);
}

- (void)addMDLogContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController mdLogCompressedFilePath](self, "mdLogCompressedFilePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  if (v7)
  {
    v13 = CFSTR("paths");
    v8 = (void *)MEMORY[0x1E0C99D20];
    -[PLRapidController mdLogCompressedFilePath](self, "mdLogCompressedFilePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObjects:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("perfpowerlog"));

  }
}

- (void)addMSSContext:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  const __CFString *v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", CFSTR("/tmp/rapid/rapid_archive/mss"));

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", CFSTR("/tmp/rapid/rapid_archive/mss"), &v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v22;

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(CFSTR("/tmp/rapid/rapid_archive/mss"), "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_opt_new();
      v18 = 0u;
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v11 = v7;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(v9, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v15), (_QWORD)v18);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "addObject:", v16);

            ++v15;
          }
          while (v13 != v15);
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v25, 16);
        }
        while (v13);
      }

      v23 = CFSTR("paths");
      v24 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("mss"));

    }
  }

}

- (id)uploadLog:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  id v13;
  uint8_t buf[16];

  v4 = a3;
  RapidLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Submit log to DP", buf, 2u);
  }

  v6 = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("RapidTagUploadAsTest"), 0);
  v7 = CFSTR("RAPIDArchive");
  if (v6)
    v7 = CFSTR("TestRAPIDArchive");
  v8 = v7;
  -[PLRapidController generateContextDictionary:](self, "generateContextDictionary:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("IsValidPayload"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) == 0)
  {
    -[PLRapidController generateDummyPayload](self, "generateDummyPayload");
    v12 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v12;
  }
  DRSubmitRapidLog();
  v13 = 0;

  return v13;
}

- (id)generateDummyPayload
{
  void *v2;
  int v3;
  void *v4;
  char v5;
  id v6;
  const __CFString *v7;
  NSObject *v8;
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/tmp/rapid/rapid_archive.tar.gz"));

  if (!v3)
    goto LABEL_4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", CFSTR("/tmp/rapid/rapid_archive.tar.gz"), &v10);
  v6 = v10;

  if ((v5 & 1) != 0)
  {

LABEL_4:
    objc_msgSend(CFSTR("0"), "dataUsingEncoding:", 4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("/tmp/rapid/rapid_archive.tar.gz");
    objc_msgSend(v6, "writeToFile:atomically:", CFSTR("/tmp/rapid/rapid_archive.tar.gz"), 1);
    +[PLUtilities setMobileOwnerForFile:](PLUtilities, "setMobileOwnerForFile:", CFSTR("/tmp/rapid/rapid_archive.tar.gz"));
    goto LABEL_8;
  }
  RapidLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[PLRapidController generateDummyPayload].cold.1();

  v7 = 0;
LABEL_8:

  return (id)v7;
}

- (void)logToCADataUploadState:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  RapidLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.rapid.dataUploadStats");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "CA Event: %@ Payload: %@", buf, 0x16u);
  }

  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();

}

id __44__PLRapidController_logToCADataUploadState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("state");
  v4[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)logGenerationStats
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  int64_t v10;
  void *v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidDeferralCount"), 0.0);
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("DeferralCount"));

  -[PLRapidController failureReason](self, "failureReason");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (const __CFString *)v6;
  else
    v8 = CFSTR("None");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("FailureReason"));

  -[PLRapidController mdLogCompressedFilePath](self, "mdLogCompressedFilePath");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v9);

  -[PLRapidController mssCompressedFilePath](self, "mssCompressedFilePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", v11);

  v13 = +[PLFileStats fileSizeAtPath:](PLFileStats, "fileSizeAtPath:", CFSTR("/tmp/rapid/rapid_archive.tar.gz"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PLRapidController isUploadSizeWithinLimit:](self, "isUploadSizeWithinLimit:", CFSTR("/tmp/rapid/rapid_archive.tar.gz")));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("AllowedUpload"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("PerfPowerLogSizeCompressed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("MSSSizeCompressed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("LogSizeCompressed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", +[PLDefaults longForKey:ifNotSet:](PLDefaults, "longForKey:ifNotSet:", CFSTR("RapidTaskedUploadSizeLimit"), 2048000));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("UploadSizeLimit"));

  -[PLRapidController logCreationEndDate](self, "logCreationEndDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController logCreationResumeDate](self, "logCreationResumeDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v20);
  v22 = v21;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("RapidProcessingTime"), 0.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 + v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("ProcessingTime"));

  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[PLRapidController logCreationEndDate](self, "logCreationEndDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLRapidController logCreationStartDate](self, "logCreationStartDate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "timeIntervalSinceDate:", v27);
  objc_msgSend(v25, "numberWithDouble:");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("StartToEndTime"));
  return v3;
}

- (void)logToCALogGenerationStats:(id)a3
{
  id v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[4];
  const __CFString *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  RapidLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = CFSTR("com.apple.rapid.logGenerationStats");
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_1B6AB6000, v4, OS_LOG_TYPE_DEFAULT, "CA Event: %@ Payload: %@", buf, 0x16u);
  }

  v6 = v3;
  v5 = v3;
  AnalyticsSendEventLazy();

}

id __47__PLRapidController_logToCALogGenerationStats___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setupDRTasking
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[16];

  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Setup DR Tasking Monitor", buf, 2u);
  }

  v4 = objc_alloc(MEMORY[0x1E0D1D260]);
  +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("PLCoreStorage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __35__PLRapidController_setupDRTasking__block_invoke;
  v8[3] = &unk_1E6A53A98;
  v8[4] = self;
  v6 = (void *)objc_msgSend(v4, "initWithTeamID:targetQueue:configProcessingBlock:", CFSTR("perfpowerservices.rapid.config"), v5, v8);
  -[PLRapidController setTaskingMonitor:](self, "setTaskingMonitor:", v6);

  -[PLRapidController taskingMonitor](self, "taskingMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startMonitoring");

}

uint64_t __35__PLRapidController_setupDRTasking__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDRConfigUpdate:error:", a2, a3);
}

- (id)configFromMonitor:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  id v9;

  v3 = a3;
  v9 = 0;
  objc_msgSend(v3, "currentConfigSnapshotWithErrorOut:", &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v5)
  {
    RapidLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[PLRapidController configFromMonitor:].cold.1(v3, (uint64_t)v5, v6);

    v7 = 0;
  }
  else
  {
    v7 = v4;
  }

  return v7;
}

- (void)handleDRConfigUpdate:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  _UNKNOWN **v15;
  void *v16;
  void *v17;
  __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  __CFString *v27;
  NSObject *v28;
  void *v29;
  __CFString *v30;
  NSObject *v31;
  NSObject *v32;
  int v33;
  const __CFString *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  RapidLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6 && !v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "teamID");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "receivedDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 138412802;
      v34 = v10;
      v35 = 2112;
      v36 = v11;
      v37 = 2112;
      v38 = v12;
      _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", (uint8_t *)&v33, 0x20u);

    }
    objc_msgSend(v6, "payloadDictionaryRepresentation");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("RAPIDTaskingRequest"));
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    RapidLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412290;
      v34 = v13;
      _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_DEFAULT, "DRConfig TaskingRequestReason: %@", (uint8_t *)&v33, 0xCu);
    }

    if (!v13)
    {
      -[PLRapidController rejectTaskingConfig:](self, "rejectTaskingConfig:", v6);
LABEL_32:

      goto LABEL_33;
    }
    v15 = &off_1E6A51000;
    objc_msgSend(v6, "configUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v17, CFSTR("RapidTaskingConfigUUID"), 1);

    +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v13, CFSTR("RapidTaskingRequest"), 1);
    -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("RAPIDSamplingPercentage"));
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    RapidLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412290;
      v34 = v18;
      _os_log_impl(&dword_1B6AB6000, v19, OS_LOG_TYPE_DEFAULT, "DRConfig SamplingPercentage: %@", (uint8_t *)&v33, 0xCu);
    }

    if (v18)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v20 = v18;
LABEL_22:
        +[PLDefaults setObject:forKey:saveToDisk:](PLDefaults, "setObject:forKey:saveToDisk:", v20, CFSTR("RapidTaskedSamplingPercentage"), 1);
LABEL_23:
        -[NSObject objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", CFSTR("RAPIDUploadSizeLimit"));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        RapidLog();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 138412290;
          v34 = v27;
          _os_log_impl(&dword_1B6AB6000, v28, OS_LOG_TYPE_DEFAULT, "DRConfig UploadSizeLimit: %@", (uint8_t *)&v33, 0xCu);
        }

        if (v27 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v29 = v15[28];
          v30 = v27;
        }
        else
        {
          RapidLog();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v33 = 138412290;
            v34 = CFSTR("RapidTaskedUploadSizeLimit");
            _os_log_impl(&dword_1B6AB6000, v31, OS_LOG_TYPE_DEFAULT, "Deleting %@", (uint8_t *)&v33, 0xCu);
          }

          v29 = v15[28];
          v30 = 0;
        }
        objc_msgSend(v29, "setObject:forKey:saveToDisk:", v30, CFSTR("RapidTaskedUploadSizeLimit"), 1);
        -[PLRapidController completeTaskingConfig:](self, "completeTaskingConfig:", v6);

        goto LABEL_32;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        +[PLUtilities hardwareModel](PLUtilities, "hardwareModel");
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        -[__CFString objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)MEMORY[0x1E0CB37E8];
          -[__CFString objectForKeyedSubscript:](v18, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "doubleValue");
          objc_msgSend(v23, "numberWithDouble:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v15 = &off_1E6A51000;
        }
        else
        {
          v25 = &unk_1E6ABB168;
        }

        RapidLog();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = 138412546;
          v34 = v21;
          v35 = 2112;
          v36 = v25;
          _os_log_impl(&dword_1B6AB6000, v32, OS_LOG_TYPE_DEFAULT, "Selecting sampling percentage for HW model '%@': %@", (uint8_t *)&v33, 0x16u);
        }

        objc_msgSend(v15[28], "setObject:forKey:saveToDisk:", v25, CFSTR("RapidTaskedSamplingPercentage"), 1);
        goto LABEL_23;
      }
    }
    RapidLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v33 = 138412290;
      v34 = CFSTR("RapidTaskedSamplingPercentage");
      _os_log_impl(&dword_1B6AB6000, v26, OS_LOG_TYPE_DEFAULT, "Deleting %@", (uint8_t *)&v33, 0xCu);
    }

    v20 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[PLRapidController handleDRConfigUpdate:error:].cold.1();
LABEL_33:

}

- (void)completeTaskingConfig:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  RapidLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "configUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to mark DRConfig %@ as completed", buf, 0xCu);

  }
  -[PLRapidController taskingMonitor](self, "taskingMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "markCompletedConfigUUID:errorOut:", v8, &v11);
  v9 = v11;

  if (v9)
  {
    RapidLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PLRapidController completeTaskingConfig:].cold.1();

  }
}

- (void)rejectTaskingConfig:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  RapidLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "configUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Rejecting DRConfig %@", buf, 0xCu);

  }
  -[PLRapidController taskingMonitor](self, "taskingMonitor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "configUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v7, "rejectConfigUUID:errorOut:", v8, &v11);
  v9 = v11;

  if (v9)
  {
    RapidLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PLRapidController rejectTaskingConfig:].cold.1();

  }
}

- (void)stopDRTasking
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  RapidLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_DEFAULT, "Stop monitoring DRConfig", v5, 2u);
  }

  -[PLRapidController taskingMonitor](self, "taskingMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopMonitoring");

}

- (int64_t)stage
{
  return self->_stage;
}

- (void)setStage:(int64_t)a3
{
  self->_stage = a3;
}

- (double)samplingPercentage
{
  return self->_samplingPercentage;
}

- (void)setSamplingPercentage:(double)a3
{
  self->_samplingPercentage = a3;
}

- (NSString)taskingRequestReason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTaskingRequestReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)logCreationStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogCreationStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)logCreationEndDate
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setLogCreationEndDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)logCreationResumeDate
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (void)setLogCreationResumeDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSString)mdLogFilePath
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMdLogFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSString)mdLogCompressedFilePath
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setMdLogCompressedFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSString)mssFilePath
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void)setMssFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSString)mssCompressedFilePath
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMssCompressedFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSString)failureReason
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setFailureReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (DRConfigMonitor)taskingMonitor
{
  return (DRConfigMonitor *)objc_getProperty(self, a2, 96, 1);
}

- (void)setTaskingMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)configUUID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConfigUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configUUID, 0);
  objc_storeStrong((id *)&self->_taskingMonitor, 0);
  objc_storeStrong((id *)&self->_failureReason, 0);
  objc_storeStrong((id *)&self->_mssCompressedFilePath, 0);
  objc_storeStrong((id *)&self->_mssFilePath, 0);
  objc_storeStrong((id *)&self->_mdLogCompressedFilePath, 0);
  objc_storeStrong((id *)&self->_mdLogFilePath, 0);
  objc_storeStrong((id *)&self->_logCreationResumeDate, 0);
  objc_storeStrong((id *)&self->_logCreationEndDate, 0);
  objc_storeStrong((id *)&self->_logCreationStartDate, 0);
  objc_storeStrong((id *)&self->_taskingRequestReason, 0);
}

- (void)handleXPCActivityCallback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Log submit to DP failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __46__PLRapidController_roundDataInDB_withConfig___block_invoke_3_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_3();
  v3 = v0;
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, v1, (uint64_t)v1, "Malformed rule %@ for col %@!", v2);
  OUTLINED_FUNCTION_1_0();
}

void __28__PLRapidController_cleanup__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, a2, a3, "Failure in cleanup: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)prepareMSSLog
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "mssFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, a2, v4, "Failed to compress MSS report at path: %@", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)generateDummyPayload
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Failed to removed file: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)configFromMonitor:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[14];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "teamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  v8 = a2;
  OUTLINED_FUNCTION_4_4(&dword_1B6AB6000, a3, v6, "Error getting current config from DRConfigMonitor <%@> : %@", v7);

}

- (void)handleDRConfigUpdate:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "DRConfig error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)completeTaskingConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Error trying to mark DRConfig as completed: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)rejectTaskingConfig:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_1B6AB6000, v0, v1, "Error trying to reject DRConfig: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
