@implementation HDSPAnalyticsManager

- (HDSPAnalyticsManager)initWithEnvironment:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  HDSPXPCActivityScheduler *v9;
  void *v10;
  HDSPXPCActivityScheduler *v11;
  HDSPAnalyticsManager *v12;

  v4 = (objc_class *)MEMORY[0x24BEA9848];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x24BDBCF50], "hksp_analyticsUserDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithUserDefaults:", v7);

  v9 = [HDSPXPCActivityScheduler alloc];
  objc_msgSend(v5, "defaultCallbackScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDSPXPCActivityScheduler initWithCallbackScheduler:](v9, "initWithCallbackScheduler:", v10);

  v12 = -[HDSPAnalyticsManager initWithEnvironment:analyticsManager:dataCollectionScheduler:](self, "initWithEnvironment:analyticsManager:dataCollectionScheduler:", v5, v8, v11);
  return v12;
}

- (HDSPAnalyticsManager)initWithEnvironment:(id)a3 analyticsManager:(id)a4 dataCollectionScheduler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSPAnalyticsManager *v11;
  HDSPAnalyticsManager *v12;
  void (**v13)(void);
  uint64_t v14;
  HKSPMutexProvider *mutexProvider;
  HDSPAnalyticsManager *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)HDSPAnalyticsManager;
  v11 = -[HDSPAnalyticsManager init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_analyticsManager, a4);
    objc_msgSend(v8, "mutexGenerator");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
    v14 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v12->_mutexProvider;
    v12->_mutexProvider = (HKSPMutexProvider *)v14;

    objc_storeStrong((id *)&v12->_dataCollectionScheduler, a5);
    v12->_isDataCollectionInProgress = 0;
    v16 = v12;
  }

  return v12;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = (id)objc_opt_class();
    v6 = v10;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment will become ready", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(v4, "timeChangeListener");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "notificationListener");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObserver:", self);
}

- (void)environmentDidBecomeReady:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment did become ready", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPAnalyticsManager updateScheduledActivity](self, "updateScheduledActivity");
}

- (void)significantTimeChangeDetected:(id)a3
{
  NSObject *v4;
  id v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v5 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Significant time change detected", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPAnalyticsManager updateScheduledActivity](self, "updateScheduledActivity");
}

- (void)updateScheduledActivity
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating schedule activity", (uint8_t *)&v5, 0xCu);

  }
  if (-[HDSPAnalyticsManager isDataCollectionEnabled](self, "isDataCollectionEnabled"))
    -[HDSPAnalyticsManager scheduleDailyCollectionActivity](self, "scheduleDailyCollectionActivity");
  else
    -[HDSPAnalyticsManager cancelDailyCollectionActivity](self, "cancelDailyCollectionActivity");
}

- (void)scheduleDailyCollectionActivity
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling daily collection activity", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[HDSPAnalyticsManager dataCollectionScheduler](self, "dataCollectionScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dailyCollectionActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke;
  v7[3] = &unk_24D4E36A8;
  objc_copyWeak(&v8, (id *)buf);
  objc_msgSend(v5, "scheduleActivity:activityHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v6 = v11;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Running daily collection activity", buf, 0xCu);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke_191;
  v8[3] = &unk_24D4E3680;
  v8[4] = WeakRetained;
  v9 = v3;
  v7 = v3;
  objc_msgSend(WeakRetained, "_withLock:", v8);

}

uint64_t __55__HDSPAnalyticsManager_scheduleDailyCollectionActivity__block_invoke_191(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_executeQuery:", *(_QWORD *)(a1 + 40));
}

- (void)cancelDailyCollectionActivity
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cancelling daily collection activity", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPAnalyticsManager dataCollectionScheduler](self, "dataCollectionScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleActivities");

}

+ (id)dailyCollectionCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC600]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6C0], 1);
  return v2;
}

+ (id)dailyCollectionActivity
{
  HDSPXPCActivity *v3;
  void *v4;
  HDSPXPCActivity *v5;

  v3 = [HDSPXPCActivity alloc];
  objc_msgSend(a1, "dailyCollectionCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSPXPCActivity initWithEventName:options:criteria:](v3, "initWithEventName:options:criteria:", CFSTR("com.apple.sleep.analytics-daily.activity"), 0, v4);

  return v5;
}

- (BOOL)isDataCollectionEnabled
{
  return -[HKSPAnalyticsManager isDiagnosticDataSubmissionAllowed](self->_analyticsManager, "isDiagnosticDataSubmissionAllowed");
}

- (id)currentDate
{
  id WeakRetained;
  void (**v3)(void);
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "currentDateProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)_lock_executeQuery:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD block[4];
  id v46;
  id v47;
  _QWORD *v48;
  _QWORD *v49;
  __int128 *p_buf;
  _QWORD *v51;
  id v52;
  id v53;
  _QWORD v54[5];
  NSObject *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD v58[5];
  NSObject *v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD v62[5];
  id v63;
  _QWORD v64[5];
  id v65;
  _QWORD v66[5];
  id v67;
  uint8_t v68[4];
  void *v69;
  __int16 v70;
  id v71;
  void *v72;
  void *v73;
  __int128 buf;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;

  v79 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = objc_opt_class();
    v6 = *(id *)((char *)&buf + 4);
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing query", (uint8_t *)&buf, 0xCu);

  }
  if (!-[HDSPAnalyticsManager isDataCollectionEnabled](self, "isDataCollectionEnabled"))
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_opt_class();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      v9 = v8;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Data collection disabled; not executing query",
        (uint8_t *)&buf,
        0xCu);

    }
    goto LABEL_7;
  }
  if (-[HDSPAnalyticsManager isDataCollectionInProgress](self, "isDataCollectionInProgress"))
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v40 = (void *)objc_opt_class();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v40;
      v41 = v40;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Data collection is already in progress; not executing query",
        (uint8_t *)&buf,
        0xCu);

    }
LABEL_7:

    goto LABEL_21;
  }
  self->_isDataCollectionInProgress = 1;
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v75 = 0x3010000000;
  v77 = 0;
  v78 = 0;
  v76 = "";
  -[HDSPAnalyticsManager currentDate](self, "currentDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = -[HDSPAnalyticsManager _queryMorningIndexRangeForDate:](self, "_queryMorningIndexRangeForDate:", v10);
  v78 = v11;

  v12 = dispatch_group_create();
  v66[0] = 0;
  v66[1] = v66;
  v66[2] = 0x3032000000;
  v66[3] = __Block_byref_object_copy__0;
  v66[4] = __Block_byref_object_dispose__0;
  v67 = 0;
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x3032000000;
  v64[3] = __Block_byref_object_copy__0;
  v64[4] = __Block_byref_object_dispose__0;
  v65 = 0;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = __Block_byref_object_copy__0;
  v62[4] = __Block_byref_object_dispose__0;
  v63 = 0;
  dispatch_group_enter(v12);
  v13 = *((_QWORD *)&buf + 1);
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke;
  v58[3] = &unk_24D4E36D0;
  v58[4] = self;
  v60 = v66;
  v61 = v64;
  v14 = v12;
  v59 = v14;
  -[HDSPAnalyticsManager _makeReportQueryWithMorningIndexRange:resultsHandler:](self, "_makeReportQueryWithMorningIndexRange:resultsHandler:", *(_QWORD *)(v13 + 32), *(_QWORD *)(v13 + 40), v58);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3F90]), "initWithIdentifier:mode:", CFSTR("Analytics"), 0);
  objc_msgSend(v15, "setCacheSettings:", v16);

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "healthStoreProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "healthStore");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "executeQuery:", v15);
  v20 = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v20, "behavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "features");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v22, "nebula");

  if ((_DWORD)v18)
  {
    HKSPLogForCategory();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = (void *)objc_opt_class();
      *(_DWORD *)v68 = 138543362;
      v69 = v24;
      v25 = v24;
      _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning bd queries", v68, 0xCu);

    }
    dispatch_group_enter(v14);
    v26 = objc_alloc(MEMORY[0x24BDD3E98]);
    objc_msgSend(MEMORY[0x24BDD3F08], "_typeWithIdentifier:", *MEMORY[0x24BDD3358]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1758], "hk_predicateForSamplesInDayIndexRange:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 32), *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = (void *)objc_msgSend(v26, "initWithSampleType:predicate:", v27, v28);
    v73 = v29;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v73, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = objc_alloc(MEMORY[0x24BDD3F00]);
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v72, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x24BDAC760];
    v54[1] = 3221225472;
    v54[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_205;
    v54[3] = &unk_24D4E36F8;
    v54[4] = self;
    v56 = v66;
    v57 = v62;
    v55 = v14;
    v33 = (void *)objc_msgSend(v30, "initWithQueryDescriptors:limit:sortDescriptors:resultsHandler:", v44, 0, v32, v54);

    objc_msgSend(v19, "executeQuery:", v33);
    v34 = objc_alloc(MEMORY[0x24BDD3BF8]);
    v35 = (void *)objc_msgSend(v34, "initWithFeatureIdentifier:healthStore:", *MEMORY[0x24BDD2E68], v19);
    v53 = 0;
    objc_msgSend(v35, "featureStatusWithError:", &v53);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v53;
    if (v37)
    {
      HKSPLogForCategory();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        v42 = (void *)objc_opt_class();
        *(_DWORD *)v68 = 138543618;
        v69 = v42;
        v70 = 2112;
        v71 = v37;
        v43 = v42;
        _os_log_error_impl(&dword_21610C000, v38, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying fetching apnea feature status: %@", v68, 0x16u);

      }
    }

  }
  else
  {
    v36 = 0;
  }
  objc_initWeak((id *)v68, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_208;
  block[3] = &unk_24D4E3720;
  objc_copyWeak(&v52, (id *)v68);
  v48 = v64;
  v49 = v62;
  v46 = v4;
  v47 = v36;
  p_buf = &buf;
  v51 = v66;
  v39 = v36;
  dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v52);
  objc_destroyWeak((id *)v68);

  _Block_object_dispose(v62, 8);
  _Block_object_dispose(v64, 8);

  _Block_object_dispose(v66, 8);
  _Block_object_dispose(&buf, 8);
LABEL_21:

}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2112;
      v16 = v7;
      v12 = v14;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying for sleep day summaries: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_205(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543618;
      v14 = (id)objc_opt_class();
      v15 = 2112;
      v16 = v7;
      v12 = v14;
      _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Error while querying for breathing disturbance samples: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a4);
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_208(uint64_t a1)
{
  id WeakRetained;
  uint64_t (*v3)(uint64_t);
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (objc_msgSend(*(id *)(a1 + 32), "deferIfNecessary"))
  {
    v6 = MEMORY[0x24BDAC760];
    v3 = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_2;
    v4 = &v6;
  }
  else
  {
    objc_msgSend(WeakRetained, "_processQueryResultsWithSummaries:breathingDisturbanceSamples:sleepApneaFeatureStatus:queryRange:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v5 = MEMORY[0x24BDAC760];
    v3 = __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_3;
    v4 = &v5;
  }
  v4[1] = 3221225472;
  v4[2] = (uint64_t)v3;
  v4[3] = (uint64_t)&unk_24D4E3498;
  v4[4] = (uint64_t)WeakRetained;
  objc_msgSend(WeakRetained, "_withLock:", v5);

}

uint64_t __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

uint64_t __43__HDSPAnalyticsManager__lock_executeQuery___block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 0;
  return result;
}

- (void)_processQueryResultsWithSummaries:(id)a3 breathingDisturbanceSamples:(id)a4 sleepApneaFeatureStatus:(id)a5 queryRange:(id)a6 error:(id)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  HDSPAnalyticsDailyReportBuilder *v21;
  id WeakRetained;
  int v23;
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  var1 = a6.var1;
  var0 = a6.var0;
  v27 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  HKSPLogForCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v16)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = 138543618;
      v24 = (id)objc_opt_class();
      v25 = 2114;
      v26 = v16;
      v19 = v24;
      _os_log_error_impl(&dword_21610C000, v18, OS_LOG_TYPE_ERROR, "[%{public}@] Queries failed with error: %{public}@", (uint8_t *)&v23, 0x16u);

    }
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = (id)objc_opt_class();
      v20 = v24;
      _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Queries succeeded", (uint8_t *)&v23, 0xCu);

    }
    v21 = [HDSPAnalyticsDailyReportBuilder alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
    v18 = -[HDSPAnalyticsDailyReportBuilder initWithEnvironment:daySummaries:breathingDisturbanceSamples:sleepApneaFeatureStatus:morningIndexRange:](v21, "initWithEnvironment:daySummaries:breathingDisturbanceSamples:sleepApneaFeatureStatus:morningIndexRange:", WeakRetained, v13, v14, v15, var0, var1);

    -[HDSPAnalyticsManager _submitAnalyticsReportsUsingBuilder:](self, "_submitAnalyticsReportsUsingBuilder:", v18);
    -[HDSPAnalyticsManager _pruneExpiredWindDownActionDataBeforeQueryRange:](self, "_pruneExpiredWindDownActionDataBeforeQueryRange:", var0, var1);
  }

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_queryMorningIndexRangeForDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hk_dayIndexWithCalendar:", v5);

  v7 = HDSPAnalyticsDailyReportSummaryDayCount;
  v8 = v6 - HDSPAnalyticsDailyReportSummaryDayCount + 1;

  v9 = v8;
  v10 = v7;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

- (id)_makeReportQueryWithMorningIndexRange:(id)a3 resultsHandler:(id)a4
{
  int64_t var1;
  int64_t var0;
  objc_class *v6;
  id v7;
  void *v8;

  var1 = a3.var1;
  var0 = a3.var0;
  v6 = (objc_class *)MEMORY[0x24BDD3F98];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", var0, var1, 1, 0, 5, v7);

  objc_msgSend(v8, "setDebugIdentifier:", CFSTR("SleepDailyAnalyticsReportQuery"));
  return v8;
}

- (void)_submitAnalyticsReportsUsingBuilder:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "buildReports");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v4;
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending daily reports: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[HDSPAnalyticsManager analyticsManager](self, "analyticsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trackEvents:", v4);

}

- (void)_pruneExpiredWindDownActionDataBeforeQueryRange:(id)a3
{
  int64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (a3.var1 <= 0)
    v4 = 0x7FFFFFFFFFFFFFFELL;
  else
    v4 = a3.var1 + a3.var0 - 2;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithInteger:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pruning wind down action data prior to %{public}@", (uint8_t *)&v12, 0x16u);

  }
  -[HDSPAnalyticsManager analyticsManager](self, "analyticsManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "analyticsStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeAllWindDownActionsBeforeMorningIndex:", v4);

}

- (void)_unit_testing_pruneExpiredWindDownActionData
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  -[HDSPAnalyticsManager currentDate](self, "currentDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[HDSPAnalyticsManager _queryMorningIndexRangeForDate:](self, "_queryMorningIndexRangeForDate:", v5);
  -[HDSPAnalyticsManager _pruneExpiredWindDownActionDataBeforeQueryRange:](self, "_pruneExpiredWindDownActionDataBeforeQueryRange:", v3, v4);

}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.sleepd.analytics")) & 1) != 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v12 = (id)objc_opt_class();
      v13 = 2114;
      v14 = v5;
      v7 = v12;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] received %{public}@", buf, 0x16u);

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __76__HDSPAnalyticsManager_notificationListener_didReceiveNotificationWithName___block_invoke;
    v10[3] = &unk_24D4E3498;
    v10[4] = self;
    -[HDSPAnalyticsManager _withLock:](self, "_withLock:", v10);
  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __76__HDSPAnalyticsManager_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "dailyCollectionActivity");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_lock_executeQuery:", v2);

}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPActivityScheduler)dataCollectionScheduler
{
  return self->_dataCollectionScheduler;
}

- (BOOL)isDataCollectionInProgress
{
  return self->_isDataCollectionInProgress;
}

- (HKSPAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_dataCollectionScheduler, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
