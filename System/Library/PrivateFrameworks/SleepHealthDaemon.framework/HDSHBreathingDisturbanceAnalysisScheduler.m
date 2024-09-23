@implementation HDSHBreathingDisturbanceAnalysisScheduler

- (HDSHBreathingDisturbanceAnalysisScheduler)initWithProfile:(id)a3 featureStatusProvider:(id)a4 featureAvailabilityProviding:(id)a5 currentDateProvider:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HDSHBreathingDisturbanceAnalysisScheduler *v16;

  v10 = (objc_class *)MEMORY[0x24BE40B80];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v10 alloc], "initWithProfile:debugIdentifier:delegate:", v14, CFSTR("BreathingDisturbanceAnalysisProtectedDataOperation"), self);
  v16 = -[HDSHBreathingDisturbanceAnalysisScheduler initWithProfile:featureStatusProvider:featureAvailabilityProviding:currentDateProvider:protectedDataOperation:profileDidBecomeReadyBlock:](self, "initWithProfile:featureStatusProvider:featureAvailabilityProviding:currentDateProvider:protectedDataOperation:profileDidBecomeReadyBlock:", v14, v13, v12, v11, v15, 0);

  return v16;
}

- (HDSHBreathingDisturbanceAnalysisScheduler)initWithProfile:(id)a3 featureStatusProvider:(id)a4 featureAvailabilityProviding:(id)a5 currentDateProvider:(id)a6 protectedDataOperation:(id)a7 profileDidBecomeReadyBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  HDSHBreathingDisturbanceAnalysisScheduler *v19;
  HDSHBreathingDisturbanceAnalysisScheduler *v20;
  id v21;
  uint64_t v22;
  HDKeyValueDomain *keyValueDomain;
  uint64_t v24;
  id currentDateProvider;
  uint64_t v26;
  OS_dispatch_queue *queue;
  uint64_t v28;
  NSCalendar *cachedCalendar;
  id WeakRetained;
  uint64_t v31;
  id unitTesting_profileDidBecomeReadyBlock;
  HDProtectedDataOperation *protectedDataOperation;
  id v34;
  void *v35;
  NSObject *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  objc_super v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v40 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v42.receiver = self;
  v42.super_class = (Class)HDSHBreathingDisturbanceAnalysisScheduler;
  v19 = -[HDSHBreathingDisturbanceAnalysisScheduler init](&v42, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_profile, v14);
    objc_storeStrong((id *)&v20->_featureStatusProvider, a4);
    v21 = objc_alloc(MEMORY[0x24BE40AD0]);
    v22 = objc_msgSend(v21, "initWithCategory:domainName:profile:", 102, *MEMORY[0x24BEA99A8], v14, v40);
    keyValueDomain = v20->_keyValueDomain;
    v20->_keyValueDomain = (HDKeyValueDomain *)v22;

    v24 = objc_msgSend(v16, "copy");
    currentDateProvider = v20->_currentDateProvider;
    v20->_currentDateProvider = (id)v24;

    v20->_analysisTimeInterval = (double)(uint64_t)*MEMORY[0x24BDAC600];
    HKCreateSerialUtilityDispatchQueue();
    v26 = objc_claimAutoreleasedReturnValue();
    queue = v20->_queue;
    v20->_queue = (OS_dispatch_queue *)v26;

    objc_storeStrong((id *)&v20->_featureAvailabilityProviding, a5);
    -[HKFeatureAvailabilityProviding registerObserver:queue:](v20->_featureAvailabilityProviding, "registerObserver:queue:", v20, v20->_queue);
    v20->_useTimeIntervalOverride = 0;
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v28 = objc_claimAutoreleasedReturnValue();
    cachedCalendar = v20->_cachedCalendar;
    v20->_cachedCalendar = (NSCalendar *)v28;

    WeakRetained = objc_loadWeakRetained((id *)&v20->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v20, 0);

    v20->_completionLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_protectedDataOperation, a7);
    v31 = objc_msgSend(v18, "copy");
    unitTesting_profileDidBecomeReadyBlock = v20->_unitTesting_profileDidBecomeReadyBlock;
    v20->_unitTesting_profileDidBecomeReadyBlock = (id)v31;

    protectedDataOperation = v20->_protectedDataOperation;
    v41 = 0;
    LOBYTE(WeakRetained) = -[HDProtectedDataOperation requestWorkWithPriority:error:](protectedDataOperation, "requestWorkWithPriority:error:", 2, &v41);
    v34 = v41;
    if ((WeakRetained & 1) == 0)
    {
      _HKInitializeLogging();
      v35 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_ERROR))
      {
        v37 = v35;
        v38 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v44 = v38;
        v45 = 2112;
        v46 = v34;
        v39 = v38;
        _os_log_error_impl(&dword_21AB9E000, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Request was not processed with error: %@", buf, 0x16u);

      }
    }

  }
  return v20;
}

- (void)performWorkForOperation:(id)a3 profile:(id)a4 databaseAccessibilityAssertion:(id)a5 completion:(id)a6
{
  void (**v8)(_QWORD);
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = (void (**)(_QWORD))a6;
  objc_msgSend(a3, "debugIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("BreathingDisturbanceAnalysisProtectedDataOperation"));

  if ((v10 & 1) != 0)
  {
    -[HDSHBreathingDisturbanceAnalysisScheduler _requestBreathingDisturbanceAnalysisIfNeeded](self, "_requestBreathingDisturbanceAnalysisIfNeeded");
    v8[2](v8);
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v13 = v15;
      _os_log_impl(&dword_21AB9E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected operation received; not performing operation.",
        (uint8_t *)&v14,
        0xCu);

    }
  }

}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;
  id WeakRetained;
  HDPeriodicActivity *v6;
  HDPeriodicActivity *activity;
  void (**unitTesting_profileDidBecomeReadyBlock)(void);

  v4 = objc_alloc(MEMORY[0x24BE40B70]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v6 = (HDPeriodicActivity *)objc_msgSend(v4, "initWithProfile:name:interval:delegate:loggingCategory:", WeakRetained, CFSTR("com.apple.healthd.sleep.breathingdisturbanceanalysisactivity"), self, *MEMORY[0x24BDD3060], self->_analysisTimeInterval);
  activity = self->_activity;
  self->_activity = v6;

  unitTesting_profileDidBecomeReadyBlock = (void (**)(void))self->_unitTesting_profileDidBecomeReadyBlock;
  if (unitTesting_profileDidBecomeReadyBlock)
    unitTesting_profileDidBecomeReadyBlock[2]();
}

- (void)featureAvailabilityProvidingDidUpdateOnboardingCompletion:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543362;
    *(_QWORD *)&v7[4] = objc_opt_class();
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Onboarding record has updated. Recalculating activity criteria.", v7, 0xCu);

  }
  -[HDSHBreathingDisturbanceAnalysisScheduler _updateActivityCriteriaAndResetActivity](self, "_updateActivityCriteriaAndResetActivity", *(_OWORD *)v7);
}

- (void)performPeriodicActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  HDProtectedDataOperation *protectedDataOperation;
  char v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  id completion;
  os_log_t v22;
  os_log_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x24BDD3060];
  v9 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 138543362;
    v32 = (id)objc_opt_class();
    v11 = v32;
    _os_log_impl(&dword_21AB9E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Periodic activity interval has been met.", buf, 0xCu);

  }
  objc_msgSend(v7, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("com.apple.healthd.sleep.breathingdisturbanceanalysisactivity")) & 1) != 0)
  {
    protectedDataOperation = self->_protectedDataOperation;
    v30 = 0;
    v14 = -[HDProtectedDataOperation requestWorkWithPriority:error:](protectedDataOperation, "requestWorkWithPriority:error:", 2, &v30);
    v15 = v30;
    if ((v14 & 1) != 0)
    {
      os_unfair_lock_lock(&self->_completionLock);
      if (self->_completion)
      {
        _HKInitializeLogging();
        v16 = *v8;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          v17 = v16;
          v18 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543362;
          v32 = v18;
          v19 = v18;
          _os_log_impl(&dword_21AB9E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Request was processed, but completion exists before capture.", buf, 0xCu);

        }
        (*((void (**)(double))self->_completion + 2))((double)(uint64_t)*MEMORY[0x24BDAC600]);
      }
      v20 = (void *)objc_msgSend(v6, "copy");
      completion = self->_completion;
      self->_completion = v20;

      os_unfair_lock_unlock(&self->_completionLock);
    }
    else
    {
      _HKInitializeLogging();
      v23 = *v8;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      {
        v27 = v23;
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v32 = v28;
        v33 = 2112;
        v34 = v15;
        v29 = v28;
        _os_log_error_impl(&dword_21AB9E000, v27, OS_LOG_TYPE_ERROR, "[%{public}@] Request was not processed with error: %@\nWill try analysis again in a day.", buf, 0x16u);

      }
      (*((void (**)(id, uint64_t, _QWORD, double))v6 + 2))(v6, 2, 0, (double)(uint64_t)*MEMORY[0x24BDAC600]);
    }

  }
  else
  {
    _HKInitializeLogging();
    v22 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
    {
      v24 = v22;
      v25 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v32 = v25;
      v26 = v25;
      _os_log_error_impl(&dword_21AB9E000, v24, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected activity received; not performing activity.",
        buf,
        0xCu);

    }
    (*((void (**)(id, uint64_t, _QWORD, double))v6 + 2))(v6, 1, 0, 0.0);
  }

}

- (void)periodicActivity:(id)a3 configureXPCActivityCriteria:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  double analysisTimeInterval;
  id v12;
  const char *v13;
  int64_t v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.healthd.sleep.breathingdisturbanceanalysisactivity")) & 1) != 0)
  {
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x24BDAC598], 1);
    xpc_dictionary_set_BOOL(v6, (const char *)*MEMORY[0x24BDAC6B8], 1);
    if (self->_useTimeIntervalOverride)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      {
        v9 = v8;
        v10 = (void *)objc_opt_class();
        analysisTimeInterval = self->_analysisTimeInterval;
        v18 = 138543618;
        v19 = v10;
        v20 = 2048;
        v21 = analysisTimeInterval;
        v12 = v10;
        _os_log_impl(&dword_21AB9E000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Using time interval override of %f.", (uint8_t *)&v18, 0x16u);

      }
      v13 = (const char *)*MEMORY[0x24BDAC5F0];
      v14 = (uint64_t)self->_analysisTimeInterval;
    }
    else
    {
      v13 = (const char *)*MEMORY[0x24BDAC5F0];
      v14 = *MEMORY[0x24BDAC600];
    }
    xpc_dictionary_set_int64(v6, v13, v14);
  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v18 = 138543362;
      v19 = (id)objc_opt_class();
      v17 = v19;
      _os_log_impl(&dword_21AB9E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unexpected activity received; not setting activity criteria.",
        (uint8_t *)&v18,
        0xCu);

    }
  }

}

- (BOOL)periodicActivityRequiresProtectedData:(id)a3
{
  return 1;
}

- (void)overrideAnalysisTimeIntervalAndResetActivityWithTimeInterval:(double)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  double analysisTimeInterval;
  id v9;
  _BYTE v10[24];
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    analysisTimeInterval = self->_analysisTimeInterval;
    *(_DWORD *)v10 = 138543874;
    *(_QWORD *)&v10[4] = v7;
    *(_WORD *)&v10[12] = 2048;
    *(double *)&v10[14] = analysisTimeInterval;
    *(_WORD *)&v10[22] = 2048;
    v11 = a3;
    v9 = v7;
    _os_log_impl(&dword_21AB9E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Overriding old time interval of %f with new time interval of %f.", v10, 0x20u);

  }
  self->_analysisTimeInterval = a3;
  self->_useTimeIntervalOverride = 1;
  -[HDSHBreathingDisturbanceAnalysisScheduler _updateActivityCriteriaAndResetActivity](self, "_updateActivityCriteriaAndResetActivity", *(_OWORD *)v10, *(_QWORD *)&v10[16], *(_QWORD *)&v11);
}

- (void)_runCompletionIfExistsWithResult:(int64_t)a3 retryInterval:(double)a4
{
  os_unfair_lock_s *p_completionLock;
  void (**completion)(id, int64_t, _QWORD, double);
  id v9;

  p_completionLock = &self->_completionLock;
  os_unfair_lock_lock(&self->_completionLock);
  completion = (void (**)(id, int64_t, _QWORD, double))self->_completion;
  if (completion)
  {
    completion[2](completion, a3, 0, a4);
    v9 = self->_completion;
    self->_completion = 0;

  }
  os_unfair_lock_unlock(p_completionLock);
  -[HDSHBreathingDisturbanceAnalysisScheduler _updateActivityCriteriaAndResetActivity](self, "_updateActivityCriteriaAndResetActivity");
}

- (BOOL)_writeDateOfMostRecentSuccessfulAnalysisAttempt
{
  void *v3;
  HDKeyValueDomain *keyValueDomain;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  (*((void (**)(void))self->_currentDateProvider + 2))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  keyValueDomain = self->_keyValueDomain;
  v5 = *MEMORY[0x24BEA9990];
  v15 = 0;
  v6 = -[HDKeyValueDomain setDate:forKey:error:](keyValueDomain, "setDate:forKey:error:", v3, v5, &v15);
  v7 = v15;
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x24BDD3060];
  v9 = *MEMORY[0x24BDD3060];
  if ((v6 & 1) == 0)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      goto LABEL_6;
    v10 = v8;
    v14 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v17 = v14;
    v18 = 2112;
    v19 = v7;
    v12 = v14;
    _os_log_fault_impl(&dword_21AB9E000, v10, OS_LOG_TYPE_FAULT, "[%{public}@] Could not write date of last analysis attempt with error %@", buf, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v8;
    v11 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v17 = v11;
    v18 = 2112;
    v19 = v3;
    v12 = v11;
    _os_log_impl(&dword_21AB9E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Wrote date of last analysis attempt: %@", buf, 0x16u);
LABEL_4:

  }
LABEL_6:

  return v6;
}

- (BOOL)_areNotificationsEnabled
{
  HKFeatureStatusProviding *featureStatusProvider;
  void *v3;
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  featureStatusProvider = self->_featureStatusProvider;
  v13 = 0;
  -[HKFeatureStatusProviding featureStatusWithError:](featureStatusProvider, "featureStatusWithError:", &v13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v13;
  if (v4)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x24BDD3060];
    v6 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v5;
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v15 = v8;
      v16 = 2112;
      v17 = v4;
      v9 = v8;
      _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error getting feature status: %@", buf, 0x16u);

      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v3, "requirementsEvaluationByContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD2CA8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v11, "areAllRequirementsSatisfied");

  }
  return v6;
}

- (BOOL)_isFeatureOnboardedWithFeatureOnboardingRecord:(id)a3
{
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  void *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3060];
    v5 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v7 = v6;
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v8 = v13;
    v9 = "[%{public}@] Received nil onboarding record. Will assume feature is not onboarded.";
LABEL_8:
    _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v12, 0xCu);

    v5 = 0;
    goto LABEL_9;
  }
  if (objc_msgSend(v3, "onboardingState") != 2)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x24BDD3060];
    v5 = 0;
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v7 = v10;
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v8 = v13;
    v9 = "[%{public}@] User is not onboarded in a supported region.";
    goto LABEL_8;
  }
  v5 = 1;
LABEL_9:

  return v5;
}

- (id)_getEarliestOnboardingDate
{
  HKFeatureAvailabilityProviding *featureAvailabilityProviding;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  featureAvailabilityProviding = self->_featureAvailabilityProviding;
  v12 = 0;
  -[HKFeatureAvailabilityProviding featureOnboardingRecordWithError:](featureAvailabilityProviding, "featureOnboardingRecordWithError:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v14 = v8;
      v15 = 2112;
      v16 = v5;
      v9 = v8;
      _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error fetching onboarding record: %@\nReturning nil onboarding date.", buf, 0x16u);

    }
    goto LABEL_6;
  }
  if (!-[HDSHBreathingDisturbanceAnalysisScheduler _isFeatureOnboardedWithFeatureOnboardingRecord:](self, "_isFeatureOnboardedWithFeatureOnboardingRecord:", v4))
  {
LABEL_6:
    v10 = 0;
    goto LABEL_7;
  }
  objc_msgSend(v4, "earliestDateOfAnyOnboardingCompletion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v10;
}

- (void)_requestBreathingDisturbanceAnalysisIfNeeded
{
  void *v3;
  HDKeyValueDomain *keyValueDomain;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  os_log_t *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  os_log_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  _BOOL4 v29;
  os_log_t v30;
  _BOOL4 v31;
  NSObject *v32;
  void *v33;
  id v34;
  HDSHBreathingDisturbanceAnalyzer *v35;
  id WeakRetained;
  HDSHBreathingDisturbanceAnalyzer *v37;
  _BOOL4 v38;
  os_log_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  id v43;
  HDKeyValueDomain *v44;
  void *v45;
  char v46;
  id v47;
  os_log_t v48;
  NSObject *v49;
  void *v50;
  id v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  id v55;
  os_log_t v56;
  NSObject *v57;
  void *v58;
  id v59;
  NSObject *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  int64_t v65;
  id v66;
  id v67;
  uint8_t buf[4];
  id v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  if (-[HDSHBreathingDisturbanceAnalysisScheduler _areNotificationsEnabled](self, "_areNotificationsEnabled"))
  {
    -[HDSHBreathingDisturbanceAnalysisScheduler _getEarliestOnboardingDate](self, "_getEarliestOnboardingDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      keyValueDomain = self->_keyValueDomain;
      v5 = *MEMORY[0x24BEA9998];
      v67 = 0;
      -[HDKeyValueDomain numberForKey:error:](keyValueDomain, "numberForKey:error:", v5, &v67);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v67;
      v8 = objc_msgSend(v6, "integerValue");

      _HKInitializeLogging();
      v9 = (os_log_t *)MEMORY[0x24BDD3060];
      v10 = (void *)*MEMORY[0x24BDD3060];
      v11 = os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT);
      if (v7)
      {
        if (v11)
        {
          v12 = v10;
          v13 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v69 = v13;
          v70 = 2112;
          v71 = (uint64_t)v7;
          v14 = v13;
          _os_log_impl(&dword_21AB9E000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error fetching number of analysis attempts: %@.", buf, 0x16u);

        }
        -[HDSHBreathingDisturbanceAnalysisScheduler _runCompletionIfExistsWithResult:retryInterval:](self, "_runCompletionIfExistsWithResult:retryInterval:", 2, (double)(uint64_t)*MEMORY[0x24BDAC600]);
      }
      else
      {
        if (v11)
        {
          v21 = v10;
          v22 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v69 = v22;
          v70 = 2048;
          v71 = v8;
          v23 = v22;
          _os_log_impl(&dword_21AB9E000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of analysis attempts: %ld.", buf, 0x16u);

        }
        +[HDSHBreathingDisturbanceAnalyzer endDateFromMostRecentlyAnalyzedDateIntervalWithDate:numberOfAnalysisAttempts:calendar:](HDSHBreathingDisturbanceAnalyzer, "endDateFromMostRecentlyAnalyzedDateIntervalWithDate:numberOfAnalysisAttempts:calendar:", v3, v8, self->_cachedCalendar);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(void))self->_currentDateProvider + 2))();
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = +[HDSHBreathingDisturbanceAnalyzer numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:referenceDate:calendar:](HDSHBreathingDisturbanceAnalyzer, "numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:referenceDate:calendar:", v3);
        _HKInitializeLogging();
        v25 = *v9;
        if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
        {
          v26 = v25;
          v27 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v69 = v27;
          v70 = 2048;
          v71 = v8;
          v28 = v27;
          _os_log_impl(&dword_21AB9E000, v26, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of expected analysis attempts: %ld", buf, 0x16u);

        }
        v29 = +[HDSHBreathingDisturbanceAnalyzer isAnalysisNeededWithAnchorDate:referenceDate:calendar:](HDSHBreathingDisturbanceAnalyzer, "isAnalysisNeededWithAnchorDate:referenceDate:calendar:", v24, v64, self->_cachedCalendar);
        _HKInitializeLogging();
        v30 = *v9;
        v31 = os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT);
        if (v29)
        {
          v63 = v24;
          if (v31)
          {
            v32 = v30;
            v33 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v69 = v33;
            v34 = v33;
            _os_log_impl(&dword_21AB9E000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis is needed. Analyzing over date intervals that have not been analyzed.", buf, 0xCu);

          }
          v35 = [HDSHBreathingDisturbanceAnalyzer alloc];
          WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
          v37 = -[HDSHBreathingDisturbanceAnalyzer initWithProfile:](v35, "initWithProfile:", WeakRetained);

          if (v8 >= v65)
          {
LABEL_29:
            v52 = 0;
LABEL_39:
            v24 = v63;
          }
          else
          {
            while (1)
            {
              v38 = -[HDSHBreathingDisturbanceAnalyzer performBreathingDisturbanceAnalysisWithIsForced:date:numberOfAnalysisAttempts:](v37, "performBreathingDisturbanceAnalysisWithIsForced:date:numberOfAnalysisAttempts:", 0, v3, v8);
              _HKInitializeLogging();
              v39 = *v9;
              v40 = *v9;
              if (!v38)
                break;
              if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
              {
                v41 = v39;
                v42 = (void *)objc_opt_class();
                *(_DWORD *)buf = 138543362;
                v69 = v42;
                v43 = v42;
                _os_log_impl(&dword_21AB9E000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully performed analysis! Attempting to update count.", buf, 0xCu);

              }
              ++v8;
              v44 = self->_keyValueDomain;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v8);
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v66 = 0;
              v46 = -[HDKeyValueDomain setNumber:forKey:error:](v44, "setNumber:forKey:error:", v45, v5, &v66);
              v47 = v66;

              if ((v46 & 1) == 0)
              {
                _HKInitializeLogging();
                v56 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_ERROR))
                {
                  v60 = v56;
                  v61 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138543618;
                  v69 = v61;
                  v70 = 2112;
                  v71 = (uint64_t)v47;
                  v62 = v61;
                  _os_log_error_impl(&dword_21AB9E000, v60, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to write updated count of analysis attempts with error: %@\nWill retry this window in one day.", buf, 0x16u);

                }
                v52 = 2;
                goto LABEL_39;
              }
              if (!-[HDSHBreathingDisturbanceAnalysisScheduler _writeDateOfMostRecentSuccessfulAnalysisAttempt](self, "_writeDateOfMostRecentSuccessfulAnalysisAttempt"))
              {
                _HKInitializeLogging();
                v48 = *v9;
                if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
                {
                  v49 = v48;
                  v50 = (void *)objc_opt_class();
                  *(_DWORD *)buf = 138543362;
                  v69 = v50;
                  v51 = v50;
                  _os_log_impl(&dword_21AB9E000, v49, OS_LOG_TYPE_DEFAULT, "[%{public}@] Date write failed while performing analysis.", buf, 0xCu);

                }
              }

              if (v65 == v8)
                goto LABEL_29;
            }
            v24 = v63;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
            {
              v57 = v39;
              v58 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543362;
              v69 = v58;
              v59 = v58;
              _os_log_error_impl(&dword_21AB9E000, v57, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to perform successful analysis.\nWill retry in one day.", buf, 0xCu);

            }
            v52 = 2;
          }
          -[HDSHBreathingDisturbanceAnalysisScheduler _runCompletionIfExistsWithResult:retryInterval:](self, "_runCompletionIfExistsWithResult:retryInterval:", v52, (double)(uint64_t)*MEMORY[0x24BDAC600]);

        }
        else
        {
          if (v31)
          {
            v53 = v30;
            v54 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v69 = v54;
            v55 = v54;
            _os_log_impl(&dword_21AB9E000, v53, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis is not needed.", buf, 0xCu);

          }
          -[HDSHBreathingDisturbanceAnalysisScheduler _runCompletionIfExistsWithResult:retryInterval:](self, "_runCompletionIfExistsWithResult:retryInterval:", 0, (double)(uint64_t)*MEMORY[0x24BDAC600]);
        }

      }
    }
    else
    {
      _HKInitializeLogging();
      v18 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      {
        v19 = v18;
        *(_DWORD *)buf = 138543362;
        v69 = (id)objc_opt_class();
        v20 = v69;
        _os_log_impl(&dword_21AB9E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Got nil onboarding date, not checking if analysis is overdue.", buf, 0xCu);

      }
      -[HDSHBreathingDisturbanceAnalysisScheduler _runCompletionIfExistsWithResult:retryInterval:](self, "_runCompletionIfExistsWithResult:retryInterval:", 2, (double)(uint64_t)*MEMORY[0x24BDAC600]);
    }

  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      *(_DWORD *)buf = 138543362;
      v69 = (id)objc_opt_class();
      v17 = v69;
      _os_log_impl(&dword_21AB9E000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Feature is disabled; not going to check if analysis is overdue.",
        buf,
        0xCu);

    }
    -[HDSHBreathingDisturbanceAnalysisScheduler _runCompletionIfExistsWithResult:retryInterval:](self, "_runCompletionIfExistsWithResult:retryInterval:", 0, (double)(uint64_t)*MEMORY[0x24BDAC600]);
  }
}

- (void)_updateActivityCriteriaAndResetActivity
{
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)v6 = 138543362;
    *(_QWORD *)&v6[4] = objc_opt_class();
    v5 = *(id *)&v6[4];
    _os_log_impl(&dword_21AB9E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Activity criteria will be updated and reset.", v6, 0xCu);

  }
  -[HDPeriodicActivity updateCriteria](self->_activity, "updateCriteria", *(_OWORD *)v6);
  -[HDPeriodicActivity resetInterval](self->_activity, "resetInterval");
}

- (HDPeriodicActivity)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong(&self->_unitTesting_profileDidBecomeReadyBlock, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_cachedCalendar, 0);
  objc_storeStrong((id *)&self->_protectedDataOperation, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProviding, 0);
  objc_storeStrong((id *)&self->_featureStatusProvider, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
