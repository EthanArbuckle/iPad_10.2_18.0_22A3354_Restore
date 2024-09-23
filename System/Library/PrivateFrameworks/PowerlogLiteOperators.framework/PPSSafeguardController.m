@implementation PPSSafeguardController

+ (id)sharedInstance
{
  if (qword_1ED886EC8 != -1)
    dispatch_once(&qword_1ED886EC8, &__block_literal_global_38);
  return (id)_MergedGlobals_103;
}

void __40__PPSSafeguardController_sharedInstance__block_invoke()
{
  PPSSafeguardController *v0;
  void *v1;

  v0 = objc_alloc_init(PPSSafeguardController);
  v1 = (void *)_MergedGlobals_103;
  _MergedGlobals_103 = (uint64_t)v0;

}

- (void)registerDataCollectionActivity
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _DWORD v15[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[PPSSafeguardController isEnabled](self, "isEnabled") && (_os_feature_enabled_impl() & 1) != 0)
  {
    -[PPSSafeguardController currentDate](self, "currentDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PPSSafeguardController installDate](self, "installDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    v6 = v5;
    v7 = (double)-[PPSSafeguardController eligibilityDuration](self, "eligibilityDuration");

    if (v6 >= v7)
    {
      PLLogSubmission();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15[0] = 67109120;
        v15[1] = (int)((double)-[PPSSafeguardController eligibilityDuration](self, "eligibilityDuration") / 86400.0);
        _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_INFO, "Device has been updated more than '%d' days ago, safeguard collection not needed", (uint8_t *)v15, 8u);
      }

    }
    else
    {
      -[PPSSafeguardController todayRange](self, "todayRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSSafeguardController lastSubmissionDate](self, "lastSubmissionDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "containsDate:", v9);

      if (v10)
      {
        -[PPSSafeguardController stopBGSTask](self, "stopBGSTask");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "taskRequestForIdentifier:", CFSTR("com.apple.perfpowerservices.safeguard"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          -[PPSSafeguardController startBGSTask](self, "startBGSTask");
        }
        else
        {
          -[PPSSafeguardController registerPLTimer](self, "registerPLTimer");
          -[PPSSafeguardController registerDayChangedNotification](self, "registerDayChangedNotification");
        }
      }
    }
  }
  else
  {
    PLLogSubmission();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15[0]) = 0;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Safeguard collection disabled", (uint8_t *)v15, 2u);
    }

  }
}

- (PPSSafeguardController)init
{
  PPSSafeguardController *v3;
  PPSSafeguardController *v4;
  PPSSafeguardController *v5;
  objc_super v7;

  if ((objc_msgSend(MEMORY[0x1E0D80078], "isPowerlogHelperd") & 1) != 0
    || !objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
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
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0D80010]);
  -[PPSSafeguardController workQueue](self, "workQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C99690];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__PPSSafeguardController_registerDayChangedNotification__block_invoke;
  v7[3] = &unk_1E8577F48;
  v7[4] = self;
  v6 = (void *)objc_msgSend(v3, "initWithWorkQueue:forNotification:withBlock:", v4, v5, v7);
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
  id v9;
  double v10;
  void *v11;
  PLTimer *v12;
  PLTimer *registerTimer;
  NSObject *v14;
  _QWORD aBlock[5];
  uint8_t buf[16];

  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Registering safeguard timer", buf, 2u);
  }

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
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "Past stop date, skipping safeguard submission...", buf, 2u);
    }

  }
  else
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __41__PPSSafeguardController_registerPLTimer__block_invoke;
    aBlock[3] = &unk_1E8578078;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v9 = objc_alloc(MEMORY[0x1E0D80070]);
    v10 = (double)-[PPSSafeguardController dataDuration](self, "dataDuration");
    -[PPSSafeguardController workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (PLTimer *)objc_msgSend(v9, "initWithFireDate:withInterval:withTolerance:repeats:withUserInfo:withQueue:withBlock:", v4, 1, 0, v11, v8, v10, 0.0);
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
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id *v10;
  char v11;
  char v12;
  NSObject *v13;
  char v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id location;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  PLLogSubmission();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEBUG, "Starting safeguard task", buf, 2u);
  }

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSafeguardController workQueue](self, "workQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__PPSSafeguardController_startBGSTask__block_invoke;
  v24[3] = &unk_1E857F988;
  objc_copyWeak(&v25, &location);
  objc_msgSend(v4, "registerForTaskWithIdentifier:usingQueue:launchHandler:", CFSTR("com.apple.perfpowerservices.safeguard"), v5, v24);

  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "taskRequestForIdentifier:", CFSTR("com.apple.perfpowerservices.safeguard"));
  v7 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v7;
  if (!v7)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D00E50]), "initWithIdentifier:", CFSTR("com.apple.perfpowerservices.safeguard"));
  -[PPSSafeguardController configureBGSTask:](self, "configureBGSTask:", v8);
  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v22 = 0;
    v10 = (id *)&v22;
    v11 = objc_msgSend(v9, "updateTaskRequest:error:", v8, &v22);
  }
  else
  {
    v23 = 0;
    v10 = (id *)&v23;
    v11 = objc_msgSend(v9, "submitTaskRequest:error:", v8, &v23);
  }
  v12 = v11;
  v13 = *v10;

  if (v13)
    v14 = 0;
  else
    v14 = v12;
  if ((v14 & 1) != 0)
  {
    PLLogSubmission();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "identifier");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = (void *)v15;
      v17 = "Updated";
      if (!v7)
        v17 = "Submitted";
      *(_DWORD *)buf = 136315394;
      v28 = v17;
      v29 = 2112;
      v30 = v15;
      _os_log_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEFAULT, "%s task with identifier, %@", buf, 0x16u);

    }
  }
  else
  {
    PLLogSubmission();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "identifier");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = "register";
      *(_DWORD *)buf = 136315650;
      if (!v7)
        v21 = "submit";
      v28 = v21;
      v29 = 2112;
      v30 = v19;
      v31 = 2112;
      v32 = v13;
      _os_log_error_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_ERROR, "Failed to %s task with identifier, %@, error: %@", buf, 0x20u);

    }
  }

  objc_destroyWeak(&v25);
  objc_destroyWeak(&location);
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
  NSObject *v2;
  void *v3;
  char v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLLogSubmission();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v6) = 0;
    _os_log_debug_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEBUG, "Deregistering safeguard task", (uint8_t *)&v6, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D00E68], "sharedScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "deregisterTaskWithIdentifier:", CFSTR("com.apple.perfpowerservices.safeguard"));

  if ((v4 & 1) == 0)
  {
    PLLogSubmission();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = CFSTR("com.apple.perfpowerservices.safeguard");
      _os_log_error_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_ERROR, "Failed to deregister task with id, %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (BOOL)performUploadWithTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
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
  void *v21;
  NSObject *v22;
  void *v23;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLLogSubmission();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "Performing safeguard submission...", buf, 2u);
  }

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80050]), "initWithReasonType:DRConfig:", 2, 0);
  v7 = -[PPSSafeguardController dataDuration](self, "dataDuration");
  if (v7 != 86400)
  {
    v8 = v7;
    objc_msgSend(v6, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", (double)-v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStartDate:", v10);

    PLLogSubmission();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = v8;
      _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "Applied modified data duration of %d seconds", buf, 8u);
    }

  }
  v12 = -[PPSSafeguardController fileTypes](self, "fileTypes");
  if (v12 != 3)
  {
    objc_msgSend(v6, "setSubmitReasonType:", (__int16)v12);
    PLLogSubmission();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "submissionMaskToString");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v25;
      _os_log_debug_impl(&dword_1CAF47000, v13, OS_LOG_TYPE_DEBUG, "Applied modified files mask: %@", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0D80058], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "performSubmission:", v6);

  PLLogSubmission();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CAF47000, v15, OS_LOG_TYPE_DEBUG, "Attempting to trigger DiagnosticPipeline upload session...", buf, 2u);
  }

  v16 = _DRCTriggerCloudKitWork();
  v17 = 0;
  v18 = v17;
  if (!v16 || v17)
  {
    PLLogSubmission();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v18, "localizedDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v26;
      _os_log_error_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_ERROR, "Failed to trigger DiagnosticPipeline upload session with error '%@'", buf, 0xCu);

    }
  }
  else
  {
    if (v4)
      objc_msgSend(v4, "setTaskCompleted");
    PLLogSubmission();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v19, OS_LOG_TYPE_INFO, "Successfully triggered DiagnosticPipeline upload session", buf, 2u);
    }

    v20 = (void *)MEMORY[0x1E0D7FFA0];
    v21 = (void *)MEMORY[0x1E0CB37E8];
    -[PPSSafeguardController currentDate](self, "currentDate");
    v22 = objc_claimAutoreleasedReturnValue();
    -[NSObject timeIntervalSince1970](v22, "timeIntervalSince1970");
    objc_msgSend(v21, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v23, CFSTR("PPSSafeguardDefaultLastSubmissionTime"));

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
        _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_INFO, "Forcing eligibility...", (uint8_t *)&v25, 2u);
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
        _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_INFO, "Excluding test device", (uint8_t *)&v25, 2u);
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
        _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_INFO, "Date/time of last OS install: %@", (uint8_t *)&v25, 0xCu);
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
          _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "Safeguard submission already performed on '%@'", (uint8_t *)&v25, 0xCu);

        }
        v4 = 2;
      }
      else
      {
        if (v10)
        {
          LOWORD(v25) = 0;
          _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "Device has not yet performed upload", (uint8_t *)&v25, 2u);
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
            _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "Device is within eligibility range '%@'", (uint8_t *)&v25, 0xCu);

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
              _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "Device meets minimum LiveOn time of '%f', current LiveOn time = '%f'", (uint8_t *)&v25, 0x16u);
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
              _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "Current LiveOn time '%f' does not yet meet minimum time required '%f'", (uint8_t *)&v25, 0x16u);
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
            _os_log_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_INFO, "No install within eligibility range '%@'", (uint8_t *)&v25, 0xCu);

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
      _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_INFO, "Disabled for eligiblity", (uint8_t *)&v25, 2u);
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
  objc_msgSend(MEMORY[0x1E0D80078], "automatedDeviceGroup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  objc_msgSend(MEMORY[0x1E0D7FFD0], "totalLogDuration");
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
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __54__PPSSafeguardController_handleSubmissionWithBGSTask___block_invoke;
  v17[3] = &unk_1E8578CE8;
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
          _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_INFO, "Skipping safeguard submission with status '%lud'", buf, 0xCu);
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
    {
      *(_DWORD *)buf = 138412546;
      v23 = (unint64_t)v6;
      v24 = 2112;
      v25 = v5;
      _os_log_debug_impl(&dword_1CAF47000, (os_log_t)v9, OS_LOG_TYPE_DEBUG, "Cannot perform submission outside of upload range '%@', current date = '%@'", buf, 0x16u);
    }

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
    _os_log_impl(&dword_1CAF47000, v22, OS_LOG_TYPE_INFO, "Emitting '%@': %@", (uint8_t *)&v24, 0x16u);
  }

  v23 = (void *)objc_msgSend(v7, "copy");
  AnalyticsSendEvent();

}

- (id)workQueue
{
  return (id)objc_msgSend(MEMORY[0x1E0D80078], "workQueueForKey:", CFSTR("PLCoreStorage"));
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
  v7[3] = &unk_1E857F9B0;
  v7[4] = self;
  v5 = (DRConfigMonitor *)objc_msgSend(v3, "initWithTeamID:targetQueue:configProcessingBlock:", CFSTR("perfpowerservices.safeguard.config"), v4, v7);
  drConfigMonitor = self->_drConfigMonitor;
  self->_drConfigMonitor = v5;

}

void __40__PPSSafeguardController_setupDRTasking__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  NSObject *v19;
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
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_error_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_ERROR, "DRConfig error: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "teamID");
      v9 = objc_claimAutoreleasedReturnValue();
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
      _os_log_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEFAULT, "DRConfig for teamID <%@> received: %@, receive time: %@", buf, 0x20u);

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
      {
        *(_DWORD *)buf = 138412290;
        v19 = v8;
        _os_log_error_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_ERROR, "Error trying to mark DRConfig as completed: %@", buf, 0xCu);
      }

    }
  }

}

- (void)configureWithDefaultValues
{
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardDebugParameterForceEligibility"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardDebugParameterInstallDate"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardDebugParameterTreatAsTestDevice"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterDataDuration"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterExcludeTestDevices"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterFileTypes"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterStartHour"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterStopHour"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterIsEnabled"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardParameterEligibilityDuration"));
  objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", 0, CFSTR("PPSSafeguardDefaultLastSubmissionTime"));
}

- (void)configureWithDictionary:(id)a3
{
  __CFString *v3;
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
  v3 = (__CFString *)a3;
  if (v3)
  {
    PLLogSubmission();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v3;
      _os_log_debug_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEBUG, "Configuring safeguard submission with dictionary %@", buf, 0xCu);
    }

    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterIsEnabled"));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v5, CFSTR("PPSSafeguardParameterIsEnabled"));
      PLLogSubmission();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterIsEnabled");
        v24 = 2112;
        v25 = v5;
        _os_log_impl(&dword_1CAF47000, v6, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    v21 = (void *)v5;
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterDataDuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v7, CFSTR("PPSSafeguardParameterDataDuration"));
      PLLogSubmission();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterDataDuration");
        v24 = 2112;
        v25 = (uint64_t)v7;
        _os_log_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v9, CFSTR("PPSSafeguardParameterMinimumLiveOnTime"));
      PLLogSubmission();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterMinimumLiveOnTime");
        v24 = 2112;
        v25 = (uint64_t)v9;
        _os_log_impl(&dword_1CAF47000, v10, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterStartHour"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v11, CFSTR("PPSSafeguardParameterStartHour"));
      PLLogSubmission();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterStartHour");
        v24 = 2112;
        v25 = (uint64_t)v11;
        _os_log_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterStopHour"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v13, CFSTR("PPSSafeguardParameterStopHour"));
      PLLogSubmission();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterStopHour");
        v24 = 2112;
        v25 = (uint64_t)v13;
        _os_log_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterEligibilityDuration"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v15, CFSTR("PPSSafeguardParameterEligibilityDuration"));
      PLLogSubmission();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterEligibilityDuration");
        v24 = 2112;
        v25 = (uint64_t)v15;
        _os_log_impl(&dword_1CAF47000, v16, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterExcludeTestDevices"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v17, CFSTR("PPSSafeguardParameterExcludeTestDevices"));
      PLLogSubmission();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterExcludeTestDevices");
        v24 = 2112;
        v25 = (uint64_t)v17;
        _os_log_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
      }

    }
    -[__CFString objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", CFSTR("PPSSafeguardParameterFileTypes"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(MEMORY[0x1E0D7FFA0], "setObject:forKey:", v19, CFSTR("PPSSafeguardParameterFileTypes"));
      PLLogSubmission();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v23 = CFSTR("PPSSafeguardParameterFileTypes");
        v24 = 2112;
        v25 = (uint64_t)v19;
        _os_log_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_INFO, "Set modified parameter '%@': %@", buf, 0x16u);
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
  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", v4, -1.0);
  objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)lastSubmissionDate
{
  void *v2;
  void *v3;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "objectExistsForKey:", CFSTR("PPSSafeguardDefaultLastSubmissionTime")))
  {
    v2 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:", CFSTR("PPSSafeguardDefaultLastSubmissionTime"));
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
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Computed safeguard start date: %@", (uint8_t *)&v10, 0xCu);
  }

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
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
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
  {
    v10 = 138412290;
    v11 = v7;
    _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "Computed safeguard stop date: %@", (uint8_t *)&v10, 0xCu);
  }

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
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  -[PPSSafeguardController startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSSafeguardController stopDate](self, "stopDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  PLLogSubmission();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Computed upload range: %@", (uint8_t *)&v9, 0xCu);
  }

  return v6;
}

- (unint64_t)fileTypes
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterFileTypes"), 3.0);
  return (int)v2;
}

- (int)dataDuration
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterDataDuration"), 86400.0);
  return (int)v2;
}

- (int)eligibilityDuration
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterEligibilityDuration"), 172800.0);
  return (int)v2;
}

- (BOOL)excludeTestDevices
{
  return objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PPSSafeguardParameterExcludeTestDevices"), 1);
}

- (BOOL)isEnabled
{
  char v2;

  v2 = objc_msgSend(MEMORY[0x1E0D80020], "internalBuild");
  return v2 & objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PPSSafeguardParameterIsEnabled"), 1);
}

- (double)minimumLiveOnTime
{
  double result;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterMinimumLiveOnTime"), 3600.0);
  return result;
}

- (int)startHour
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterStartHour"), 12.0);
  return (int)v2;
}

- (int)stopHour
{
  double v2;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "doubleForKey:ifNotSet:", CFSTR("PPSSafeguardParameterStopHour"), 14.0);
  return (int)v2;
}

- (BOOL)debug_forceEligibility
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("PPSSafeguardDebugParameterForceEligibility"), 0);
  return v2;
}

- (BOOL)debug_installDate
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D7FFA0], "objectExistsForKey:", CFSTR("PPSSafeguardDebugParameterInstallDate"));
  return v2;
}

- (BOOL)debug_treatAsTestDevice
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  if (v2)
    LOBYTE(v2) = objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:", CFSTR("PPSSafeguardDebugParameterTreatAsTestDevice"));
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

@end
