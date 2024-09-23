@implementation HDSHBreathingDisturbanceAnalyzer

- (HDSHBreathingDisturbanceAnalyzer)initWithProfile:(id)a3
{
  id v4;
  HDSHBreathingDisturbanceAnalyzer *v5;
  HDSHBreathingDisturbanceAnalyzer *v6;
  id v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDSHBreathingDisturbanceAnalyzer;
  v5 = -[HDSHBreathingDisturbanceAnalyzer init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x24BDD3918]);
    v8 = *MEMORY[0x24BDD3060];
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v10 = objc_msgSend(v7, "initWithLoggingCategory:healthDataSource:", v8, WeakRetained);
    analyticsEventSubmissionManager = v6->_analyticsEventSubmissionManager;
    v6->_analyticsEventSubmissionManager = (HKAnalyticsEventSubmissionManager *)v10;

  }
  return v6;
}

- (BOOL)performBreathingDisturbanceAnalysisWithIsForced:(BOOL)a3 date:(id)a4 numberOfAnalysisAttempts:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  id v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  void *v20;
  id v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v6 = a3;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v11 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v11, "setDay:", ~*MEMORY[0x24BEA99A0]);
    objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v11;
  }
  else
  {
    +[HDSHBreathingDisturbanceAnalyzer endDateFromMostRecentlyAnalyzedDateIntervalWithDate:numberOfAnalysisAttempts:calendar:](HDSHBreathingDisturbanceAnalyzer, "endDateFromMostRecentlyAnalyzedDateIntervalWithDate:numberOfAnalysisAttempts:calendar:", v8, a5, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  +[HDSHBreathingDisturbanceAnalyzer constructAnalysisDateIntervalFromDate:withCalendar:](HDSHBreathingDisturbanceAnalyzer, "constructAnalysisDateIntervalFromDate:withCalendar:", v12, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v23 = 0;
  -[HDSHBreathingDisturbanceAnalyzer fetchSamplesWithAnalysisInterval:profile:error:](self, "fetchSamplesWithAnalysisInterval:profile:error:", v13, WeakRetained, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v23;

  if (v16)
  {
    _HKInitializeLogging();
    v17 = (void *)*MEMORY[0x24BDD3060];
    v18 = 0;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v19 = v17;
      v20 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v25 = v20;
      v26 = 2112;
      v27 = v16;
      v21 = v20;
      _os_log_impl(&dword_21AB9E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Could not get breathing disturbance samples with error: %@", buf, 0x16u);

      v18 = 0;
    }
  }
  else
  {
    v18 = -[HDSHBreathingDisturbanceAnalyzer _requestBreathingDisturbanceAnalysisWithSamples:analysisInterval:](self, "_requestBreathingDisturbanceAnalysisWithSamples:analysisInterval:", v15, v13);
  }

  return v18;
}

- (id)fetchSamplesWithAnalysisInterval:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__0;
  v27 = __Block_byref_object_dispose__0;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HDSHBreathingDisturbanceAnalyzer _createEnumeratorWithAnalysisInterval:profile:](self, "_createEnumeratorWithAnalysisInterval:profile:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __83__HDSHBreathingDisturbanceAnalyzer_fetchSamplesWithAnalysisInterval_profile_error___block_invoke;
  v21[3] = &unk_24DDB8C68;
  v21[4] = &v23;
  v11 = objc_msgSend(v10, "enumerateWithError:handler:", &v22, v21);
  v12 = v22;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    v19 = v12;
    v15 = v19;
    if (v19)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v19);
        v14 = 0;
        *a5 = v15;
        goto LABEL_9;
      }
      _HKLogDroppedError();
    }
    v14 = 0;
    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "samplesFilteredBySleepDay:", v24[5]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v15 = (id)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = (id)objc_opt_class();
    v17 = objc_msgSend((id)v24[5], "count");
    v18 = objc_msgSend(v14, "count");
    *(_DWORD *)buf = 138543874;
    v30 = v16;
    v31 = 2048;
    v32 = v17;
    v33 = 2048;
    v34 = v18;
    _os_log_impl(&dword_21AB9E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched %lu samples, filtered to %lu samples.", buf, 0x20u);

  }
LABEL_9:

  _Block_object_dispose(&v23, 8);
  return v14;
}

uint64_t __83__HDSHBreathingDisturbanceAnalyzer_fetchSamplesWithAnalysisInterval_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
  return 1;
}

- (id)_createEnumeratorWithAnalysisInterval:(id)a3 profile:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD3DC0];
  v7 = *MEMORY[0x24BDD3358];
  v8 = a4;
  objc_msgSend(v6, "quantityTypeForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDateInterval();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE40B90], "entityEnumeratorWithType:profile:", v9, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v10);
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSortDescriptors:", v13);

  _HKInitializeLogging();
  v14 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v15 = v14;
    v16 = (void *)objc_opt_class();
    v22 = v16;
    objc_msgSend(v5, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "description");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "description");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v24 = v16;
    v25 = 2112;
    v26 = v18;
    v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_21AB9E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Constructed query for breathing disturbance samples with analysis window for start date: %@, end date: %@", buf, 0x20u);

  }
  return v11;
}

- (BOOL)_requestBreathingDisturbanceAnalysisWithSamples:(id)a3 analysisInterval:(id)a4
{
  id v6;
  id v7;
  id *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  id v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  id v21;
  BOOL v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v28;
  uint8_t v29[4];
  id v30;
  __int16 v31;
  NSObject *v32;
  uint8_t buf[24];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (id *)MEMORY[0x24BDD3060];
  v9 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_opt_class();
    v12 = v11;
    v13 = objc_msgSend(v6, "count");
    objc_msgSend(v7, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v11;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v13;
    *(_WORD *)&buf[22] = 2112;
    v34 = v14;
    _os_log_impl(&dword_21AB9E000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting analysis with %lu samples and analysis interval of %@", buf, 0x20u);

  }
  memset(buf, 0, sizeof(buf));
  objc_msgSend(MEMORY[0x24BE0FCC0], "analyzeSamples:dateInterval:", v6, v7);
  if (buf[16])
  {
    _HKInitializeLogging();
    v15 = *v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 138543362;
      v30 = (id)objc_opt_class();
      v16 = v30;
      _os_log_impl(&dword_21AB9E000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Possible sleep apnea detected from breathing disturbance samples.", v29, 0xCu);

    }
    v28 = 0;
    v17 = -[HDSHBreathingDisturbanceAnalyzer _writePossibleSleepApneaNotificationSampleWithAnalysisInterval:algorithmVersion:error:](self, "_writePossibleSleepApneaNotificationSampleWithAnalysisInterval:algorithmVersion:error:", v7, *(_QWORD *)buf, &v28);
    v18 = v28;
    if (!v17)
    {
      _HKInitializeLogging();
      v19 = *v8;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        *(_DWORD *)v29 = 138543618;
        v30 = v20;
        v31 = 2112;
        v32 = v18;
        v21 = v20;
        _os_log_impl(&dword_21AB9E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to write sleep apnea event sample with error: %@. Not sending notification and will attempt to retry in one day.", v29, 0x16u);

      }
      v22 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    _HKInitializeLogging();
    v18 = *v8;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v29 = 138543362;
      v30 = (id)objc_opt_class();
      v23 = v30;
      _os_log_impl(&dword_21AB9E000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Possible sleep apnea NOT detected from breathing disturbance samples.", v29, 0xCu);

    }
  }

  _HKInitializeLogging();
  v24 = *v8;
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_opt_class();
    *(_DWORD *)v29 = 138543362;
    v30 = v25;
    v26 = v25;
    _os_log_impl(&dword_21AB9E000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Analysis successfully performed!", v29, 0xCu);

  }
  -[HDSHBreathingDisturbanceAnalyzer _sendAnalyticsWithPayload:](self, "_sendAnalyticsWithPayload:", *(_QWORD *)&buf[8]);
  v22 = 1;
LABEL_15:

  return v22;
}

- (BOOL)_writePossibleSleepApneaNotificationSampleWithAnalysisInterval:(id)a3 algorithmVersion:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDProfile **p_profile;
  id WeakRetained;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  HDSHBreathingDisturbanceAnalyzer *v36;
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  void *v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v43 = *MEMORY[0x24BDD3128];
  v44[0] = v8;
  v9 = (void *)MEMORY[0x24BDBCE70];
  v10 = a3;
  objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD3988];
  objc_msgSend(MEMORY[0x24BDD3990], "_typeWithIdentifier:", *MEMORY[0x24BDD2A30]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "categorySampleWithType:value:startDate:endDate:metadata:", v13, 0, v14, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sourceManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localDeviceSourceWithError:", a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v21, "deviceManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "currentDeviceEntityWithError:", a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v23) = 0;
  if (v20 && v22)
  {
    v36 = self;
    v37 = v8;
    v23 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v23, "dataProvenanceManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localDataProvenanceForSourceEntity:version:deviceEntity:", v20, 0, v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v26, "dataManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v23) = objc_msgSend(v27, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:error:", v28, v25, 0, a5, CFAbsoluteTimeGetCurrent());

    if ((_DWORD)v23)
    {
      _HKInitializeLogging();
      v29 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
      {
        v30 = v29;
        *(_DWORD *)buf = 138543618;
        v39 = (id)objc_opt_class();
        v40 = 2112;
        v41 = v20;
        v31 = v39;
        _os_log_impl(&dword_21AB9E000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully wrote possible sleep apnea event sample with source %@", buf, 0x16u);

      }
      objc_msgSend(v16, "UUID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "UUIDString");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      HKSHCreatePossibleSleepApneaDetectedNotificationRequest();
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDSHBreathingDisturbanceAnalyzer _sendPossibleSleepApneaNotificationWithRequest:](v36, "_sendPossibleSleepApneaNotificationWithRequest:", v34);
    }

    v8 = v37;
  }

  return (char)v23;
}

- (void)_sendAnalyticsWithPayload:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKAnalyticsEventSubmissionManager *analyticsEventSubmissionManager;
  HDSHBreathingDisturbanceAnalysisAnalyticsEvent *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v7 = v12;
    _os_log_impl(&dword_21AB9E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting to send analytics.", buf, 0xCu);

  }
  analyticsEventSubmissionManager = self->_analyticsEventSubmissionManager;
  v9 = -[HDSHBreathingDisturbanceAnalysisAnalyticsEvent initWithDefaultAnalyticsPayload:]([HDSHBreathingDisturbanceAnalysisAnalyticsEvent alloc], "initWithDefaultAnalyticsPayload:", v4);

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__HDSHBreathingDisturbanceAnalyzer__sendAnalyticsWithPayload___block_invoke;
  v10[3] = &unk_24DDB8B38;
  v10[4] = self;
  -[HKAnalyticsEventSubmissionManager submitEvent:completion:](analyticsEventSubmissionManager, "submitEvent:completion:", v9, v10);

}

void __62__HDSHBreathingDisturbanceAnalyzer__sendAnalyticsWithPayload___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x24BDD3060];
  v6 = *MEMORY[0x24BDD3060];
  if ((a2 & 1) == 0)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v7 = v5;
    v9 = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2112;
    v12 = v4;
    v8 = v10;
    _os_log_error_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Error attempting to send analytics payload: %@", (uint8_t *)&v9, 0x16u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v8 = v10;
    _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully sent analytics payload!", (uint8_t *)&v9, 0xCu);
LABEL_4:

  }
LABEL_6:

}

- (void)_sendPossibleSleepApneaNotificationWithRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke;
  v6[3] = &unk_24DDB8B60;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    *(_DWORD *)buf = 138543362;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_21AB9E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] About to post possible sleep apnea detected notification.", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "notificationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke_201;
  v8[3] = &unk_24DDB8B38;
  v7 = *(_QWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "postNotificationWithRequest:completion:", v7, v8);

}

void __83__HDSHBreathingDisturbanceAnalyzer__sendPossibleSleepApneaNotificationWithRequest___block_invoke_201(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      v7 = 138543618;
      v8 = (id)objc_opt_class();
      v9 = 2112;
      v10 = v3;
      v6 = v8;
      _os_log_impl(&dword_21AB9E000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error posting notification: %@", (uint8_t *)&v7, 0x16u);

    }
  }

}

+ (id)constructAnalysisDateIntervalFromDate:(id)a3 withCalendar:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDBCE68];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "hk_sleepDayStartWithCalendar:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hk_isBeforeDate:", v7);

  if (v10)
  {
    objc_msgSend(v8, "setDay:", 1);
    objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v8, v9, 0);
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  objc_msgSend(v8, "setDay:", *MEMORY[0x24BEA99A0]);
  objc_msgSend(v5, "dateByAddingComponents:toDate:options:", v8, v9, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v12);

  return v13;
}

+ (id)endDateFromMostRecentlyAnalyzedDateIntervalWithDate:(id)a3 numberOfAnalysisAttempts:(int64_t)a4 calendar:(id)a5
{
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  int64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = v7;
  if (a4)
  {
    v9 = (objc_class *)MEMORY[0x24BDBCE68];
    v10 = a5;
    v11 = objc_alloc_init(v9);
    objc_msgSend(v11, "setDay:", *MEMORY[0x24BEA99A0] * a4);
    objc_msgSend(v10, "dateByAddingComponents:toDate:options:", v11, v8, 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v13 = (void *)*MEMORY[0x24BDD3060];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      v17 = 138544130;
      v18 = (id)objc_opt_class();
      v19 = 2112;
      v20 = v8;
      v21 = 2048;
      v22 = a4;
      v23 = 2112;
      v24 = v12;
      v15 = v18;
      _os_log_impl(&dword_21AB9E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] With date %@ and number of analysis attempts %ld, end date of most recently analyzed date interval is %@.", (uint8_t *)&v17, 0x2Au);

    }
  }
  else
  {
    v12 = v7;
  }

  return v12;
}

+ (BOOL)isAnalysisNeededWithAnchorDate:(id)a3 referenceDate:(id)a4 calendar:(id)a5
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  uint64_t v10;
  BOOL v11;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a5, "components:fromDate:toDate:options:", 16, a3, a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v8 = (void *)objc_opt_class();
    v9 = v8;
    v13 = 138543618;
    v14 = v8;
    v15 = 2048;
    v16 = objc_msgSend(v5, "day");
    _os_log_impl(&dword_21AB9E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of days since last analysis: %ld", (uint8_t *)&v13, 0x16u);

  }
  v10 = objc_msgSend(v5, "day");
  v11 = v10 >= *MEMORY[0x24BEA99A0];

  return v11;
}

+ (int64_t)numberOfExpectedAnalysisAttemptsStartingFromAnchorDate:(id)a3 referenceDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  objc_msgSend(a5, "components:fromDate:toDate:options:", 16, v7, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "day");
  v11 = v10 / *MEMORY[0x24BEA99A0];
  _HKInitializeLogging();
  v12 = (void *)*MEMORY[0x24BDD3060];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v16 = 138544130;
    v17 = (id)objc_opt_class();
    v18 = 2112;
    v19 = v7;
    v20 = 2112;
    v21 = v8;
    v22 = 2048;
    v23 = v11;
    v14 = v17;
    _os_log_impl(&dword_21AB9E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of expected analysis attempts between %@ and %@ is: %ld", (uint8_t *)&v16, 0x2Au);

  }
  return v11;
}

+ (id)samplesFilteredBySleepDay:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v15;
  id v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v7 = 0;
      do
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend((id)objc_opt_class(), "_areSamplesInSameSleepDayWithFirstSample:secondSample:calendar:", v4, v8, v6))
        {
          objc_msgSend((id)objc_opt_class(), "_sampleWithHighestDurationWithFirstSample:secondSample:", v4, v8);
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v5, "addObject:", v4);
          v9 = v8;
        }
        v10 = v9;

        ++v7;
        v4 = v10;
      }
      while (v7 < objc_msgSend(v3, "count"));
    }
    else
    {
      v10 = v4;
    }
    objc_msgSend(v5, "addObject:", v10);
    if ((unint64_t)objc_msgSend(v5, "count") <= 0x1E)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      _HKInitializeLogging();
      v12 = (void *)*MEMORY[0x24BDD3060];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3060], OS_LOG_TYPE_FAULT))
      {
        v15 = v12;
        *(_DWORD *)v17 = 138543618;
        *(_QWORD *)&v17[4] = objc_opt_class();
        *(_WORD *)&v17[12] = 1024;
        *(_DWORD *)&v17[14] = 30;
        v16 = *(id *)&v17[4];
        _os_log_fault_impl(&dword_21AB9E000, v15, OS_LOG_TYPE_FAULT, "[%{public}@] Unexpectedly filtered to more than %d samples, will only return that amount starting from the first sample.", v17, 0x12u);

      }
      objc_msgSend(v5, "subarrayWithRange:", 0, 30, *(_OWORD *)v17, *(_QWORD *)&v17[16], v18);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v13;

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v11;
}

+ (BOOL)_areSamplesInSameSleepDayWithFirstSample:(id)a3 secondSample:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hk_morningIndexWithCalendar:", v7);

  objc_msgSend(v8, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v7);
  return v10 == v12;
}

+ (id)_sampleWithHighestDurationWithFirstSample:(id)a3 secondSample:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  id v21;
  void *v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  objc_msgSend(v6, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceDate:", v12);
  v14 = v13;

  if (v10 == v14)
  {
    objc_msgSend(v5, "quantity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_value");
    v17 = v16;
    objc_msgSend(v6, "quantity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_value");
    if (v17 <= v19)
      v20 = v5;
    else
      v20 = v6;
    v21 = v20;

  }
  else
  {
    if (v10 <= v14)
      v22 = v6;
    else
      v22 = v5;
    v21 = v22;
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsEventSubmissionManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
