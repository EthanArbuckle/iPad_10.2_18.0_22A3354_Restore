@implementation HDSPSleepScheduleModelMigrationManager

- (HDSPSleepScheduleModelMigrationManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepScheduleModelMigrationManager *v5;
  HDSPSleepScheduleModelMigrationManager *v6;
  HDSPSleepScheduleModelMigrationManager *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSPSleepScheduleModelMigrationManager;
  v5 = -[HDSPSleepScheduleModelMigrationManager init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)needDataMigration
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "needsMigration");

  return v4;
}

- (id)performDataMigration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HDSPSleepScheduleModelMigrationManager _migrateToCloudKit](self, "_migrateToCloudKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[HDSPSleepScheduleModelMigrationManager _migrateSleepScheduleFromMobileTimer](self, "_migrateSleepScheduleFromMobileTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  -[HDSPSleepScheduleModelMigrationManager _migrateSleepFocus](self, "_migrateSleepFocus");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v6);

  -[HDSPSleepScheduleModelMigrationManager _migrateOnboardingSettings](self, "_migrateOnboardingSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HDSPSleepScheduleModelMigrationManager _migrateHomeScreenPage](self, "_migrateHomeScreenPage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v8);

  objc_msgSend(MEMORY[0x24BE6B608], "chainFutures:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__HDSPSleepScheduleModelMigrationManager_performDataMigration__block_invoke;
  v12[3] = &unk_24D4E4968;
  v12[4] = self;
  objc_msgSend(v9, "addSuccessBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __62__HDSPSleepScheduleModelMigrationManager_performDataMigration__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "environment");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepStorage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "saveDataVersion");

}

- (id)_migrateToCloudKit
{
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v3 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke;
  v8[3] = &unk_24D4E49B8;
  v8[4] = self;
  objc_msgSend(MEMORY[0x24BE6B608], "lazyFutureWithBlock:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_2;
  v7[3] = &unk_24D4E49E0;
  v7[4] = self;
  objc_msgSend(v4, "recover:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sleepCloudKitSync");

  if ((v7 & 1) == 0)
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = (id)objc_opt_class();
      v14 = v19;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping CloudKit migration because feature is disabled", buf, 0xCu);

    }
    goto LABEL_9;
  }
  objc_msgSend(WeakRetained, "sleepStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "cloudStorageDataVersion");

  if (v9)
  {
LABEL_9:
    NAEmptyResult();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v15);

    goto LABEL_10;
  }
  HKSPLogForCategory();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = (id)objc_opt_class();
    v11 = v19;
    _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] performing CloudKit migration", buf, 0xCu);

  }
  objc_msgSend(WeakRetained, "sleepStorage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_185;
  v16[3] = &unk_24D4E4990;
  v17 = v3;
  objc_msgSend(v12, "performInitialSyncWithCompletion:", v16);

LABEL_10:
}

void __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_185(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a3;
  NAEmptyResult();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:error:", v5, v4);

}

id __60__HDSPSleepScheduleModelMigrationManager__migrateToCloudKit__block_invoke_2()
{
  NSObject *v0;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    v3 = 138543362;
    v4 = (id)objc_opt_class();
    v2 = v4;
    _os_log_error_impl(&dword_21610C000, v0, OS_LOG_TYPE_ERROR, "[%{public}@] initial sync failed, continuing anyway", (uint8_t *)&v3, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_migrateSleepScheduleFromMobileTimer
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke;
  v3[3] = &unk_24D4E49B8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BE6B608], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataVersion");

  if (v6)
  {
LABEL_9:
    NAEmptyResult();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v19);

    goto LABEL_10;
  }
  objc_msgSend(WeakRetained, "behavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_supportsLegacySleepAlarms");

  if ((v8 & 1) == 0)
  {
    HKSPLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v25 = (id)objc_opt_class();
      v18 = v25;
      _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping MobileTimer migration because this device doesn't support legacy alarms", buf, 0xCu);

    }
    goto LABEL_9;
  }
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v25 = (id)objc_opt_class();
    v10 = v25;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating from MobileTimer", buf, 0xCu);

  }
  objc_msgSend(WeakRetained, "sleepAlarmManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sleepAlarmProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "sleepAlarmsFuture");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke_189;
  v20[3] = &unk_24D4E4A08;
  v14 = v3;
  v15 = *(_QWORD *)(a1 + 32);
  v21 = v14;
  v22 = v15;
  v23 = WeakRetained;
  v16 = (id)objc_msgSend(v13, "addCompletionBlock:", v20);

LABEL_10:
}

void __78__HDSPSleepScheduleModelMigrationManager__migrateSleepScheduleFromMobileTimer__block_invoke_189(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    HKSPNilify();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v5;
      v7 = v15;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating from sleep alarm %{public}@", buf, 0x16u);

    }
    +[HDSPMobileTimerBridge sleepScheduleModelFromSleepAlarm:](HDSPMobileTimerBridge, "sleepScheduleModelFromSleepAlarm:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "sleepStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v9, "saveSleepScheduleModel:error:", v8, &v13);
    v10 = v13;

    v11 = *(void **)(a1 + 32);
    NAEmptyResult();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "finishWithResult:error:", v12, v10);

  }
}

- (id)_migrateOnboardingSettings
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__HDSPSleepScheduleModelMigrationManager__migrateOnboardingSettings__block_invoke;
  v3[3] = &unk_24D4E49B8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BE6B608], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __68__HDSPSleepScheduleModelMigrationManager__migrateOnboardingSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataVersion");

  if (v6 < 8)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = (id)objc_opt_class();
      v9 = v30;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating settings based on onboarding", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "sleepStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    objc_msgSend(v10, "loadSleepEventRecord:", &v28);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v28;

    if (v11)
    {
      objc_msgSend(WeakRetained, "sleepStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v12;
      objc_msgSend(v13, "loadSleepSettings:", &v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v27;

      v16 = (void *)objc_msgSend(v14, "mutableCopy");
      if (v16)
      {
        if (objc_msgSend(v11, "isAnySleepCoachingOnboardingCompleted"))
        {
          HKSPLogForCategory();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v30 = v18;
            v19 = v18;
            _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep coaching completed, enabling dnd during wind down", buf, 0xCu);

          }
          objc_msgSend(v16, "setSleepModeOptions:", objc_msgSend(v16, "sleepModeOptions") | 0x840);
        }
        if (objc_msgSend(v11, "isAnySleepTrackingOnboardingCompleted"))
        {
          HKSPLogForCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v30 = v21;
            v22 = v21;
            _os_log_impl(&dword_21610C000, v20, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep tracking completed, enabling watch face", buf, 0xCu);

          }
          objc_msgSend(v16, "setSleepModeOptions:", objc_msgSend(v16, "sleepModeOptions") | 4);
        }
        objc_msgSend(WeakRetained, "sleepStorage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v15;
        objc_msgSend(v23, "saveSleepSettings:error:", v16, &v26);
        v24 = v26;

        NAEmptyResult();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "finishWithResult:error:", v25, v24);
        v15 = v24;
      }
      else
      {
        NAEmptyResult();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "finishWithResult:error:", v25, v15);
      }

      v12 = v15;
    }
    else
    {
      NAEmptyResult();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:error:", v16, v12);
    }

  }
  else
  {
    NAEmptyResult();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:", v7);

  }
}

- (id)_migrateSleepFocus
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__HDSPSleepScheduleModelMigrationManager__migrateSleepFocus__block_invoke;
  v3[3] = &unk_24D4E49B8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BE6B608], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __60__HDSPSleepScheduleModelMigrationManager__migrateSleepFocus__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  unint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "dataVersion");

  if (v6 < 6)
  {
    HKSPLogForCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v32 = (id)objc_opt_class();
      v9 = v32;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating sleep focus", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "sleepStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_msgSend(v10, "loadSleepEventRecord:", &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;

    if (!v11)
    {
      NAEmptyResult();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:error:", v14, v12);
      v15 = v12;
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(WeakRetained, "sleepStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v12;
    objc_msgSend(v13, "loadSleepSettings:", &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v29;

    if (!v14)
    {
      NAEmptyResult();
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:error:", v21, v15);
LABEL_21:

      goto LABEL_22;
    }
    if ((objc_msgSend(v11, "isAnySleepCoachingOnboardingCompleted") & 1) != 0
      || objc_msgSend(v14, "scheduledSleepMode"))
    {
      HKSPLogForCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v32 = v17;
        v18 = v17;
        _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating sleep focus because we've already onboarded or enabled scheduledSleepMode", buf, 0xCu);

      }
      objc_msgSend(WeakRetained, "sleepModeManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      v20 = objc_msgSend(v19, "createFocusModeInState:error:", objc_msgSend(MEMORY[0x24BEA9910], "defaultConfigurationState"), &v28);
      v21 = v28;

      if ((v20 & 1) != 0)
        goto LABEL_20;
      HKSPLogForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v32 = v23;
        v24 = v23;
        _os_log_error_impl(&dword_21610C000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] failed to migrate sleep focus", buf, 0xCu);

      }
    }
    else
    {
      HKSPLogForCategory();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543362;
        v32 = v25;
        v26 = v25;
        _os_log_impl(&dword_21610C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping focus creation", buf, 0xCu);

      }
      v21 = 0;
    }

LABEL_20:
    NAEmptyResult();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "finishWithResult:error:", v27, v21);

    goto LABEL_21;
  }
  NAEmptyResult();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "finishWithResult:", v7);

LABEL_23:
}

- (id)_migrateHomeScreenPage
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke;
  v3[3] = &unk_24D4E49B8;
  v3[4] = self;
  objc_msgSend(MEMORY[0x24BE6B608], "lazyFutureWithBlock:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "sleepStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "localDataVersion");

  if (v6)
  {
    objc_msgSend(v3, "finishWithNoResult");
  }
  else
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = (id)objc_opt_class();
      v8 = v33;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] migrating home screen", buf, 0xCu);

    }
    objc_msgSend(WeakRetained, "sleepStorage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v9, "loadSleepEventRecord:", &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;

    if (v10)
    {
      objc_msgSend(WeakRetained, "sleepStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v11;
      objc_msgSend(v12, "loadSleepSettings:", &v30);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v30;

      v15 = (id)objc_msgSend(v13, "mutableCopy");
      if (v15)
      {
        if (objc_msgSend(v10, "isAnySleepWindDownShortcutsOnboardingCompleted")
          && (objc_msgSend(MEMORY[0x24BDBCF50], "hksp_springBoardUserDefaults"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v16, "hksp_BOOLForKey:", *MEMORY[0x24BEA9358]),
              v16,
              v17))
        {
          HKSPLogForCategory();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
          {
            v19 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v33 = v19;
            v20 = v19;
            _os_log_impl(&dword_21610C000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating home screen page because we've already onboarded shortcuts", buf, 0xCu);

          }
          objc_msgSend(WeakRetained, "sleepModeManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke_194;
          v26[3] = &unk_24D4E4A30;
          v26[4] = *(_QWORD *)(a1 + 32);
          v27 = v3;
          v15 = v15;
          v28 = v15;
          v29 = WeakRetained;
          objc_msgSend(v21, "createHomeScreenPageWithCompletion:", v26);

        }
        else
        {
          HKSPLogForCategory();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v33 = v23;
            v24 = v23;
            _os_log_impl(&dword_21610C000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping home screen page creation because we haven't onboarded shortcuts", buf, 0xCu);

          }
          objc_msgSend(v3, "finishWithNoResult");
        }
      }
      else
      {
        NAEmptyResult();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "finishWithResult:error:", v25, v14);

      }
    }
    else
    {
      NAEmptyResult();
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithResult:error:", v15, v11);
      v14 = v11;
    }

  }
}

void __64__HDSPSleepScheduleModelMigrationManager__migrateHomeScreenPage__block_invoke_194(id *a1, int a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (v5)
  {
    v6 = v5;
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v6;
      v10 = v13;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to migrate home screen: %{public}@", buf, 0x16u);

    }
    objc_msgSend(a1[5], "finishWithError:", v6);
  }
  else
  {
    if (a2)
    {
      objc_msgSend(a1[6], "setSpringBoardSuggestedPageCreated:", 1);
      objc_msgSend(a1[7], "sleepStorage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = a1[6];
      v11 = 0;
      objc_msgSend(v8, "saveSleepSettings:error:", v9, &v11);
      v6 = v11;

    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(a1[5], "finishWithNoResult");
  }

}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_environment);
}

@end
