@implementation PPSSafeguardController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_16);
  return (id)sharedInstance_result;
}

void __40__PPSSafeguardController_sharedInstance__block_invoke()
{
  PPSSafeguardController *v0;
  void *v1;

  v0 = objc_alloc_init(PPSSafeguardController);
  v1 = (void *)sharedInstance_result;
  sharedInstance_result = (uint64_t)v0;

}

- (void)registerDataCollectionActivity
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Safeguard collection disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (PPSSafeguardController)init
{
  PPSSafeguardController *v3;
  PPSSafeguardController *v4;
  PPSSafeguardController *v5;
  objc_super v7;

  if (+[PLUtilities isPowerlogHelperd](PLUtilities, "isPowerlogHelperd")
    || !+[PLPlatform internalBuild](PLPlatform, "internalBuild"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PPSSafeguardController;
    v3 = -[PPSSafeguardController init](&v7, sel_init);
    v4 = v3;
    if (v3)
      -[PPSSafeguardController setupDRTasking](v3, "setupDRTasking");
    self = v4;
    v5 = self;
  }

  return v5;
}

- (void)registerDayChangedNotification
{
  PLNSNotificationOperatorComposition *v3;
  void *v4;
  uint64_t v5;
  PLNSNotificationOperatorComposition *v6;
  _QWORD v7[5];

  v3 = [PLNSNotificationOperatorComposition alloc];
  -[PPSSafeguardController workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C99690];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PPSSafeguardController_registerDayChangedNotification__block_invoke;
  v7[3] = &unk_1E6A52118;
  v7[4] = self;
  v6 = -[PLNSNotificationOperatorComposition initWithWorkQueue:forNotification:withBlock:](v3, "initWithWorkQueue:forNotification:withBlock:", v4, v5, v7);
  -[PPSSafeguardController setDayChangedNotification:](self, "setDayChangedNotification:", v6);

}

uint64_t __56__PPSSafeguardController_registerDayChangedNotification__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "registerPLTimer");
}

- (BOOL)registerPLTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  PLTimer *v9;
  double v10;
  void *v11;
  PLTimer *v12;
  PLTimer *registerTimer;
  NSObject *v14;
  _QWORD v16[5];

  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PPSSafeguardController registerPLTimer].cold.2();

  -[PPSSafeguardController startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSafeguardController stopDate](self, "stopDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSafeguardController currentDate](self, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "compare:", v5);

  if (v7 == 1)
  {
    PLLogSubmission();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[PPSSafeguardController registerPLTimer].cold.1();

  }
  else
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __41__PPSSafeguardController_registerPLTimer__block_invoke;
    v16[3] = &unk_1E6A535C0;
    v16[4] = self;
    v8 = (void *)MEMORY[0x1BCC9EB70](v16);
    v9 = [PLTimer alloc];
    v10 = (double)-[PPSSafeguardController dataDuration](self, "dataDuration");
    -[PPSSafeguardController workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLTimer initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:](v9, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v4, 1, 0, v11, v8, v10, 0.0);
    registerTimer = self->_registerTimer;
    self->_registerTimer = v12;

  }
  return v7 != 1;
}

uint64_t __41__PPSSafeguardController_registerPLTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startBGSTask");
}

- (void)configureBGSTask:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setInterval:", 1800.0);
  objc_msgSend(v3, "setMinDurationBetweenInstances:", 900.0);
  objc_msgSend(v3, "setNetworkUploadSize:", 20971520);
  objc_msgSend(v3, "setPriority:", 1);
  objc_msgSend(v3, "setRequiresExternalPower:", 0);
  objc_msgSend(v3, "setRequiresInexpensiveNetworkConnectivity:", 1);
  objc_msgSend(v3, "setRequiresNetworkConnectivity:", 1);

}

- (void)startBGSTask
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Starting safeguard task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __38__PPSSafeguardController_startBGSTask__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleSubmissionWithBGSTask:", v3);

}

- (void)stopBGSTask
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Deregistering safeguard task", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (BOOL)performUploadWithTask:(id)a3
{
  id v4;
  NSObject *v5;
  PLSubmissionConfig *v6;
  int v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  unint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint8_t v24[8];
  uint64_t v25;
  uint8_t buf[16];

  v4 = a3;
  PLLogSubmission();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_DEFAULT, "Performing safeguard submission...", buf, 2u);
  }

  v6 = -[PLSubmissionConfig initWithReasonType:DRConfig:]([PLSubmissionConfig alloc], "initWithReasonType:DRConfig:", 2, 0);
  v7 = -[PPSSafeguardController dataDuration](self, "dataDuration");
  if (v7 != 86400)
  {
    v8 = v7;
    -[PLSubmissionConfig endDate](v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLSubmissionConfig setStartDate:](v6, "setStartDate:", v10);

    PLLogSubmission();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[PPSSafeguardController performUploadWithTask:].cold.4(v8, v11);

  }
  v12 = -[PPSSafeguardController fileTypes](self, "fileTypes");
  if (v12 != 3)
  {
    -[PLSubmissionConfig setSubmitReasonType:](v6, "setSubmitReasonType:", (__int16)v12);
    PLLogSubmission();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[PPSSafeguardController performUploadWithTask:].cold.3(v6, v13);

  }
  +[PLSubmissions sharedInstance](PLSubmissions, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performSubmission:", v6);

  PLLogSubmission();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[PPSSafeguardController performUploadWithTask:].cold.2();

  v25 = 0;
  v16 = _DRCTriggerCloudKitWork();
  v17 = 0;
  v18 = v17;
  if (!v16 || v17)
  {
    PLLogSubmission();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PPSSafeguardController performUploadWithTask:].cold.1(v18, v21);
  }
  else
  {
    if (v4)
      objc_msgSend(v4, "setTaskCompleted");
    PLLogSubmission();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1B6AB6000, v19, OS_LOG_TYPE_INFO, "Successfully triggered DiagnosticPipeline upload session", v24, 2u);
    }

    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[PPSSafeguardController currentDate](self, "currentDate");
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSince1970](v21, "timeIntervalSince1970");
    objc_msgSend(v20, "numberWithDouble:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v22, CFSTR("PPSSafeguardDefaultLastSubmissionTime"));

  }
  return v16;
}

- (unint64_t)isEligible
{
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BOOL4 v22;
  void *v23;
  int v25;
  double v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  if (-[PPSSafeguardController isEnabled](self, "isEnabled"))
  {
    if (-[PPSSafeguardController debug_forceEligibility](self, "debug_forceEligibility"))
    {
      PLLogSubmission();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "Forcing eligibility...", (uint8_t *)&v25, 2u);
      }
      v4 = 0;
    }
    else if (-[PPSSafeguardController excludeTestDevices](self, "excludeTestDevices")
           && -[PPSSafeguardController isTestDeviceForSafeguard](self, "isTestDeviceForSafeguard"))
    {
      PLLogSubmission();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v25) = 0;
        _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "Excluding test device", (uint8_t *)&v25, 2u);
      }
      v4 = 5;
    }
    else
    {
      -[PPSSafeguardController installDate](self, "installDate");
      v3 = objc_claimAutoreleasedReturnValue();
      PLLogSubmission();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v25 = 138412290;
        v26 = *(double *)&v3;
        _os_log_impl(&dword_1B6AB6000, v5, OS_LOG_TYPE_INFO, "Date/time of last OS install: %@", (uint8_t *)&v25, 0xCu);
      }

      -[PPSSafeguardController todayRange](self, "todayRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSSafeguardController lastSubmissionDate](self, "lastSubmissionDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "containsDate:", v7);

      PLLogSubmission();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
      if (v8)
      {
        if (v10)
        {
          -[PPSSafeguardController lastSubmissionDate](self, "lastSubmissionDate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 138412290;
          v26 = *(double *)&v11;
          _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_INFO, "Safeguard submission already performed on '%@'", (uint8_t *)&v25, 0xCu);

        }
        v4 = 2;
      }
      else
      {
        if (v10)
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_INFO, "Device has not yet performed upload", (uint8_t *)&v25, 2u);
        }

        -[PPSSafeguardController eligibilityRange](self, "eligibilityRange");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[PPSSafeguardController currentDate](self, "currentDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "containsDate:", v13);

        PLLogSubmission();
        v9 = objc_claimAutoreleasedReturnValue();
        v15 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
        if ((v14 & 1) != 0)
        {
          if (v15)
          {
            -[PPSSafeguardController eligibilityRange](self, "eligibilityRange");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412290;
            v26 = *(double *)&v16;
            _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_INFO, "Device is within eligibility range '%@'", (uint8_t *)&v25, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceDate:", v3);
          v19 = v18;

          -[PPSSafeguardController minimumLiveOnTime](self, "minimumLiveOnTime");
          v21 = v20;
          PLLogSubmission();
          v9 = objc_claimAutoreleasedReturnValue();
          v22 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
          if (v21 <= 0.0 || v19 >= v21)
          {
            if (v22)
            {
              v25 = 134218240;
              v26 = v21;
              v27 = 2048;
              v28 = v19;
              _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_INFO, "Device meets minimum LiveOn time of '%f', current LiveOn time = '%f'", (uint8_t *)&v25, 0x16u);
            }
            v4 = 0;
          }
          else
          {
            if (v22)
            {
              v25 = 134218240;
              v26 = v19;
              v27 = 2048;
              v28 = v21;
              _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_INFO, "Current LiveOn time '%f' does not yet meet minimum time required '%f'", (uint8_t *)&v25, 0x16u);
            }
            v4 = 4;
          }
        }
        else
        {
          if (v15)
          {
            -[PPSSafeguardController eligibilityRange](self, "eligibilityRange");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412290;
            v26 = *(double *)&v23;
            _os_log_impl(&dword_1B6AB6000, v9, OS_LOG_TYPE_INFO, "No install within eligibility range '%@'", (uint8_t *)&v25, 0xCu);

          }
          v4 = 3;
        }
      }

    }
  }
  else
  {
    PLLogSubmission();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = 1;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v25) = 0;
      v4 = 1;
      _os_log_impl(&dword_1B6AB6000, v3, OS_LOG_TYPE_INFO, "Disabled for eligiblity", (uint8_t *)&v25, 2u);
    }
  }

  return v4;
}

- (BOOL)isTestDeviceForSafeguard
{
  void *v3;
  uint64_t v4;
  double v5;

  if (-[PPSSafeguardController debug_treatAsTestDevice](self, "debug_treatAsTestDevice"))
    return 1;
  +[PLUtilities automatedDeviceGroup](PLUtilities, "automatedDeviceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  +[PLFileStats totalLogDuration](PLFileStats, "totalLogDuration");
  return v5 < 86400.0 && v4 != 0;
}

- (BOOL)performSubmission
{
  return -[PPSSafeguardController handleSubmissionWithBGSTask:](self, "handleSubmissionWithBGSTask:", 0);
}

- (BOOL)handleSubmissionWithBGSTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  char v11;
  const __CFString *v12;
  __CFString *v13;
  const __CFString *v14;
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint8_t buf[4];
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__PPSSafeguardController_handleSubmissionWithBGSTask___block_invoke;
  v17[3] = &unk_1E6A53A70;
  v17[4] = &v18;
  objc_msgSend(v4, "setExpirationHandler:", v17);
  -[PPSSafeguardController currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSafeguardController uploadRange](self, "uploadRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsDate:", v5) & 1) != 0)
  {
    v7 = -[PPSSafeguardController isEligible](self, "isEligible");
    v8 = v7;
    if (v7)
    {
      if (v7 == 2)
      {
        -[PPSSafeguardController stopBGSTask](self, "stopBGSTask");
      }
      else
      {
        PLLogSubmission();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v23 = v8;
          _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_INFO, "Skipping safeguard submission with status '%lud'", buf, 0xCu);
        }

      }
      v9 = 0;
    }
    else
    {
      v9 = -[PPSSafeguardController performUploadWithTask:](self, "performUploadWithTask:", v4);
    }
    -[PPSSafeguardController reportEventToCA:didUpload:](self, "reportEventToCA:didUpload:", v8, v9);
    if (*((_BYTE *)v19 + 24))
    {
      v16 = 0;
      v11 = objc_msgSend(v4, "setTaskExpiredWithRetryAfter:error:", &v16, 300.0);
      v12 = (const __CFString *)v16;
      v13 = (__CFString *)v12;
      if ((v11 & 1) == 0)
      {
        v14 = CFSTR("Unknown");
        if (v12)
          v14 = v12;
        NSLog(CFSTR("Failed to expire task with error: %@"), v14);
        objc_msgSend(v4, "setTaskCompleted");
      }

    }
  }
  else
  {
    PLLogSubmission();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG))
      -[PPSSafeguardController handleSubmissionWithBGSTask:].cold.1();

    -[PPSSafeguardController stopBGSTask](self, "stopBGSTask");
    LOBYTE(v9) = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v9;
}

uint64_t __54__PPSSafeguardController_handleSubmissionWithBGSTask___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

- (void)reportEventToCA:(unint64_t)a3 didUpload:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("PPSSafeguardCAKeyDidUpload"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("PPSSafeguardCAKeyStatus"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3 == 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("PPSSafeguardCAKeyIsEligible"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PPSSafeguardController isTestDeviceForSafeguard](self, "isTestDeviceForSafeguard"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("PPSSafeguardCAKeyIsTestDevice"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PPSSafeguardController debug_forceEligibility](self, "debug_forceEligibility"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("PPSSafeguardDebugParameterForceEligibility"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PPSSafeguardController dataDuration](self, "dataDuration"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("PPSSafeguardParameterDataDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PPSSafeguardController eligibilityDuration](self, "eligibilityDuration"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("PPSSafeguardParameterEligibilityDuration"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PPSSafeguardController excludeTestDevices](self, "excludeTestDevices"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, CFSTR("PPSSafeguardParameterExcludeTestDevices"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[PPSSafeguardController fileTypes](self, "fileTypes"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("PPSSafeguardParameterFileTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PPSSafeguardController startHour](self, "startHour"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("PPSSafeguardParameterStartHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[PPSSafeguardController stopHour](self, "stopHour"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("PPSSafeguardParameterStopHour"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PPSSafeguardController isEnabled](self, "isEnabled"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("PPSSafeguardParameterIsEnabled"));

  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[PPSSafeguardController minimumLiveOnTime](self, "minimumLiveOnTime");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));

  PLLogSubmission();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v24 = 138412546;
    v25 = CFSTR("com.apple.perfpowerservices.submission.safeguard");
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_1B6AB6000, v22, OS_LOG_TYPE_INFO, "Emitting '%@': %@", (uint8_t *)&v24, 0x16u);
  }

  v23 = (void *)objc_msgSend(v7, "copy");
  AnalyticsSendEvent();

}

- (id)workQueue
{
  return +[PLUtilities workQueueForKey:](PLUtilities, "workQueueForKey:", CFSTR("PLCoreStorage"));
}

- (void)setupDRTasking
{
  id v3;
  void *v4;
  DRConfigMonitor *v5;
  DRConfigMonitor *drConfigMonitor;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0D1D260]);
  -[PPSSafeguardController workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PPSSafeguardController_setupDRTasking__block_invoke;
  v7[3] = &unk_1E6A53A98;
  v7[4] = self;
  v5 = (DRConfigMonitor *)objc_msgSend(v3, "initWithTeamID:targetQueue:configProcessingBlock:", CFSTR("perfpowerservices.safeguard.config"), v4, v7);
  drConfigMonitor = self->_drConfigMonitor;
  self->_drConfigMonitor = v5;

}

void __40__PPSSafeguardController_setupDRTasking__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_2();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "teamID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "configUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "receivedDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      v22 = 2112;
      v23 = v11;
      _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", buf, 0x20u);

    }
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "payloadDictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "configureWithDictionary:", v13);

    objc_msgSend(*(id *)(a1 + 32), "drConfigMonitor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v14, "markCompletedConfigUUID:errorOut:", v15, &v17);
    v8 = v17;

    if (v8)
    {
      PLLogSubmission();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_1();

    }
  }

}

- (void)configureWithDefaultValues
{
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardDebugParameterForceEligibility"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardDebugParameterInstallDate"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardDebugParameterTreatAsTestDevice"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterDataDuration"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterExcludeTestDevices"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterFileTypes"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterStartHour"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterStopHour"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterIsEnabled"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterEligibilityDuration"));
  +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", 0, CFSTR("PPSSafeguardDefaultLastSubmissionTime"));
}

- (void)configureWithDictionary:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[4];
  const __CFString *v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    PLLogSubmission();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[PPSSafeguardController configureWithDictionary:].cold.1();

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterIsEnabled"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v5, CFSTR("PPSSafeguardParameterIsEnabled"));
      PLLogSubmission();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterIsEnabled");
        v24 = 2112;
        v25 = v5;
        _os_log_impl(&dword_1B6AB6000, v6, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    v21 = (void *)v5;
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterDataDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v7, CFSTR("PPSSafeguardParameterDataDuration"));
      PLLogSubmission();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterDataDuration");
        v24 = 2112;
        v25 = (uint64_t)v7;
        _os_log_impl(&dword_1B6AB6000, v8, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v9, CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));
      PLLogSubmission();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterMinimumLiveOnTime");
        v24 = 2112;
        v25 = (uint64_t)v9;
        _os_log_impl(&dword_1B6AB6000, v10, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterStartHour"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v11, CFSTR("PPSSafeguardParameterStartHour"));
      PLLogSubmission();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterStartHour");
        v24 = 2112;
        v25 = (uint64_t)v11;
        _os_log_impl(&dword_1B6AB6000, v12, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterStopHour"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v13, CFSTR("PPSSafeguardParameterStopHour"));
      PLLogSubmission();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterStopHour");
        v24 = 2112;
        v25 = (uint64_t)v13;
        _os_log_impl(&dword_1B6AB6000, v14, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterEligibilityDuration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v15, CFSTR("PPSSafeguardParameterEligibilityDuration"));
      PLLogSubmission();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterEligibilityDuration");
        v24 = 2112;
        v25 = (uint64_t)v15;
        _os_log_impl(&dword_1B6AB6000, v16, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterExcludeTestDevices"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v17, CFSTR("PPSSafeguardParameterExcludeTestDevices"));
      PLLogSubmission();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterExcludeTestDevices");
        v24 = 2112;
        v25 = (uint64_t)v17;
        _os_log_impl(&dword_1B6AB6000, v18, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterFileTypes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      +[PLDefaults setObject:forKey:](PLDefaults, "setObject:forKey:", v19, CFSTR("PPSSafeguardParameterFileTypes"));
      PLLogSubmission();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterFileTypes");
        v24 = 2112;
        v25 = (uint64_t)v19;
        _os_log_impl(&dword_1B6AB6000, v20, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
  }

}

- (id)currentDate
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "now");
}

- (id)installDate
{
  _BOOL4 v2;
  void *v3;
  const __CFString *v4;

  v2 = -[PPSSafeguardController debug_installDate](self, "debug_installDate");
  v3 = (void *)MEMORY[0x1E0C99D68];
  if (v2)
    v4 = CFSTR("PPSSafeguardDebugParameterInstallDate");
  else
    v4 = CFSTR("LastUpgradeSystemTimestamp");
  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", v4, -1.0);
  objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lastSubmissionDate
{
  void *v2;
  void *v3;

  if (+[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", CFSTR("PPSSafeguardDefaultLastSubmissionTime")))
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    +[PLDefaults doubleForKey:](PLDefaults, "doubleForKey:", CFSTR("PPSSafeguardDefaultLastSubmissionTime"));
    objc_msgSend(v2, "dateWithTimeIntervalSince1970:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)startDate
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = -[PPSSafeguardController startHour](self, "startHour");
  -[PPSSafeguardController currentDate](self, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", v5, 0, 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogSubmission();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PPSSafeguardController startDate].cold.1();

  return v7;
}

- (id)stopDate
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;

  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v5 = -[PPSSafeguardController stopHour](self, "stopHour");
  -[PPSSafeguardController currentDate](self, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", v5, 0, 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogSubmission();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[PPSSafeguardController stopDate].cold.1();

  return v7;
}

- (id)eligibilityRange
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[PPSSafeguardController eligibilityDuration](self, "eligibilityDuration");
  -[PPSSafeguardController installDate](self, "installDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", (double)v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v6);

  return v7;
}

- (id)todayRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[PPSSafeguardController currentDate](self, "currentDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightBeforeDate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "nearestMidnightAfterDate:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v3, v4);

  return v5;
}

- (id)uploadRange
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[PPSSafeguardController startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSafeguardController stopDate](self, "stopDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[PPSSafeguardController uploadRange].cold.1();

  return v6;
}

- (unint64_t)fileTypes
{
  double v2;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterFileTypes"), 3.0);
  return (int)v2;
}

- (int)dataDuration
{
  double v2;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterDataDuration"), 86400.0);
  return (int)v2;
}

- (int)eligibilityDuration
{
  double v2;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterEligibilityDuration"), 172800.0);
  return (int)v2;
}

- (BOOL)excludeTestDevices
{
  return +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("PPSSafeguardParameterExcludeTestDevices"), 1);
}

- (BOOL)isEnabled
{
  BOOL v2;

  v2 = +[PLPlatform internalBuild](PLPlatform, "internalBuild");
  return v2 & +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("PPSSafeguardParameterIsEnabled"), 1);
}

- (double)minimumLiveOnTime
{
  double result;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterMinimumLiveOnTime"), 3600.0);
  return result;
}

- (int)startHour
{
  double v2;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterStartHour"), 12.0);
  return (int)v2;
}

- (int)stopHour
{
  double v2;

  +[PLDefaults doubleForKey:ifNotSet:](PLDefaults, "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterStopHour"), 14.0);
  return (int)v2;
}

- (BOOL)debug_forceEligibility
{
  _BOOL4 v2;

  v2 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v2)
    LOBYTE(v2) = +[PLDefaults BOOLForKey:ifNotSet:](PLDefaults, "BOOLForKey:ifNotSet:", CFSTR("PPSSafeguardDebugParameterForceEligibility"), 0);
  return v2;
}

- (BOOL)debug_installDate
{
  _BOOL4 v2;

  v2 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v2)
    LOBYTE(v2) = +[PLDefaults objectExistsForKey:](PLDefaults, "objectExistsForKey:", CFSTR("PPSSafeguardDebugParameterInstallDate"));
  return v2;
}

- (BOOL)debug_treatAsTestDevice
{
  _BOOL4 v2;

  v2 = +[PLDefaults debugEnabled](PLDefaults, "debugEnabled");
  if (v2)
    LOBYTE(v2) = +[PLDefaults BOOLForKey:](PLDefaults, "BOOLForKey:", CFSTR("PPSSafeguardDebugParameterTreatAsTestDevice"));
  return v2;
}

- (DRConfigMonitor)drConfigMonitor
{
  return (DRConfigMonitor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setDrConfigMonitor:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PLTimer)registerTimer
{
  return (PLTimer *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegisterTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLNSNotificationOperatorComposition)dayChangedNotification
{
  return (PLNSNotificationOperatorComposition *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDayChangedNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dayChangedNotification, 0);
  objc_storeStrong((id *)&self->_registerTimer, 0);
  objc_storeStrong((id *)&self->_drConfigMonitor, 0);
}

- (void)registerPLTimer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Registering safeguard timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)performUploadWithTask:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, a2, v4, "Failed to trigger DiagnosticPipeline upload session with error '%@'", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)performUploadWithTask:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "Attempting to trigger DiagnosticPipeline upload session...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)performUploadWithTask:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "submissionMaskToString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "Applied modified files mask: %@", v4, 0xCu);

  OUTLINED_FUNCTION_2_1();
}

- (void)performUploadWithTask:(int)a1 .cold.4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "Applied modified data duration of %d seconds", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_4();
}

- (void)handleSubmissionWithBGSTask:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_1B6AB6000, v1, OS_LOG_TYPE_DEBUG, "Cannot perform submission outside of upload range '%@', current date = '%@'", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, v0, v1, "Error trying to mark DRConfig as completed: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __40__PPSSafeguardController_setupDRTasking__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_4_3(&dword_1B6AB6000, v0, v1, "DRConfig error: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)configureWithDictionary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Configuring safeguard submission with dictionary %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startDate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Computed safeguard start date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)stopDate
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Computed safeguard stop date: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)uploadRange
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, v0, v1, "Computed upload range: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
