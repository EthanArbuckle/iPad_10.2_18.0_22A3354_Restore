@implementation HDSPDemoModeEnvironment

- (HDSPDemoModeEnvironment)init
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  HDSPAssertionManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HDSPDemoModeEnvironment *v15;
  void *v17;
  int v18;
  void *v19;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_sleepModeManagerProvider");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hksp_supportsSleepAlarms");
  v6 = &__block_literal_global_205;
  if (!v5)
    v6 = 0;
  v17 = v6;
  v18 = objc_msgSend(v3, "hksp_supportsHealthData");
  v19 = (void *)v4;
  if (v18)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9890]), "initWithLocalDeviceHealthStore");
  else
    v7 = 0;
  if (objc_msgSend(v3, "hksp_supportsSleepLockScreen"))
    v8 = &__block_literal_global_221;
  else
    v8 = 0;
  if (objc_msgSend(v3, "hksp_supportsSleepWidget"))
    v9 = &__block_literal_global_224;
  else
    v9 = 0;
  v10 = objc_alloc_init(HDSPAssertionManager);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPCurrentDateProvider();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPUnfairLockGenerator();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_retain(-[HDSPEnvironment initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:](self, "initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:", v3, &__block_literal_global_0, &__block_literal_global_190, &__block_literal_global_193, &__block_literal_global_196, &__block_literal_global_199, v19, 0, 0,
            0,
            0,
            0,
            &__block_literal_global_202,
            v17,
            v7,
            &__block_literal_global_209,
            &__block_literal_global_212,
            &__block_literal_global_215,
            0,
            &__block_literal_global_218,
            v8,
            v9,
            &__block_literal_global_227,
            &__block_literal_global_230,
            &__block_literal_global_233,
            v10,
            &__block_literal_global_237,
            &__block_literal_global_240,
            0,
            v11,
            v12,
            v13,
            0,
            v14));

  if (v18)
  return v15;
}

HDSPSleepStorage *__31__HDSPDemoModeEnvironment_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepStorage *v3;

  v2 = a2;
  v3 = -[HDSPSleepStorage initWithEnvironment:]([HDSPSleepStorage alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScheduleModelManager *__31__HDSPDemoModeEnvironment_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScheduleModelManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepScheduleModelManager initWithEnvironment:]([HDSPSleepScheduleModelManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepEventScheduler *__31__HDSPDemoModeEnvironment_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepEventScheduler *v3;

  v2 = a2;
  v3 = -[HDSPSleepEventScheduler initWithEnvironment:]([HDSPSleepEventScheduler alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepStoreServer *__31__HDSPDemoModeEnvironment_init__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepStoreServer *v3;

  v2 = a2;
  v3 = -[HDSPSleepStoreServer initWithEnvironment:]([HDSPSleepStoreServer alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScheduleStateCoordinator *__31__HDSPDemoModeEnvironment_init__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScheduleStateCoordinator *v3;

  v2 = a2;
  v3 = -[HDSPSleepScheduleStateCoordinator initWithEnvironment:]([HDSPSleepScheduleStateCoordinator alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepActionManager *__31__HDSPDemoModeEnvironment_init__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepActionManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepActionManager initWithEnvironment:]([HDSPSleepActionManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepAlarmManager *__31__HDSPDemoModeEnvironment_init__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepAlarmManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepAlarmManager initWithEnvironment:]([HDSPSleepAlarmManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPContextStoreManager *__31__HDSPDemoModeEnvironment_init__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  HDSPContextStoreManager *v3;

  v2 = a2;
  v3 = -[HDSPContextStoreManager initWithEnvironment:]([HDSPContextStoreManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPBiomeManager *__31__HDSPDemoModeEnvironment_init__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  HDSPBiomeManager *v3;

  v2 = a2;
  v3 = -[HDSPBiomeManager initWithEnvironment:]([HDSPBiomeManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScheduleModelMigrationManager *__31__HDSPDemoModeEnvironment_init__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScheduleModelMigrationManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepScheduleModelMigrationManager initWithEnvironment:]([HDSPSleepScheduleModelMigrationManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPNotificationListener *__31__HDSPDemoModeEnvironment_init__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  HDSPNotificationListener *v3;

  v2 = a2;
  v3 = -[HDSPNotificationListener initWithEnvironment:]([HDSPNotificationListener alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepLockScreenManager *__31__HDSPDemoModeEnvironment_init__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepLockScreenManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepLockScreenManager initWithEnvironment:]([HDSPSleepLockScreenManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepWidgetManager *__31__HDSPDemoModeEnvironment_init__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepWidgetManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepWidgetManager initWithEnvironment:]([HDSPSleepWidgetManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPIDSServiceManager *__31__HDSPDemoModeEnvironment_init__block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  HDSPIDSServiceManager *v3;

  v2 = a2;
  v3 = -[HDSPIDSServiceManager initWithEnvironment:]([HDSPIDSServiceManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPDiagnostics *__31__HDSPDemoModeEnvironment_init__block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  HDSPDiagnostics *v3;

  v2 = a2;
  v3 = -[HDSPDiagnostics initWithEnvironment:]([HDSPDiagnostics alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSystemMonitor *__31__HDSPDemoModeEnvironment_init__block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  HDSPSystemMonitor *v3;

  v2 = a2;
  v3 = -[HDSPSystemMonitor initWithEnvironment:]([HDSPSystemMonitor alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPTimeChangeListener *__31__HDSPDemoModeEnvironment_init__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  HDSPTimeChangeListener *v3;

  v2 = a2;
  v3 = -[HDSPTimeChangeListener initWithEnvironment:]([HDSPTimeChangeListener alloc], "initWithEnvironment:", v2);

  return v3;
}

id __31__HDSPDemoModeEnvironment_init__block_invoke_18(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEA98F0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithEnvironment:", v3);

  return v4;
}

- (BOOL)isDemoEnvironment
{
  return 1;
}

+ (id)_sleepModeManagerProvider
{
  return &__block_literal_global_245;
}

id __52__HDSPDemoModeEnvironment__sleepModeManagerProvider__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  HDSPSleepModeManager *v4;
  uint64_t v5;
  void *v6;

  v2 = a2;
  v3 = objc_msgSend(v2, "isUnitTestEnvironment");
  v4 = [HDSPSleepModeManager alloc];
  if (v3)
    v5 = -[HDSPSleepModeManager initWithEnvironment:sleepFocusModeBridge:sleepProactiveBridge:](v4, "initWithEnvironment:sleepFocusModeBridge:sleepProactiveBridge:", v2, 0, 0);
  else
    v5 = -[HDSPSleepModeManager initWithEnvironment:](v4, "initWithEnvironment:", v2);
  v6 = (void *)v5;

  return v6;
}

- (void)environmentDidBecomeReady
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDSPDemoModeEnvironment;
  -[HDSPEnvironment environmentDidBecomeReady](&v3, sel_environmentDidBecomeReady);
  -[HDSPDemoModeEnvironment setInitialSchedule](self, "setInitialSchedule");
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  -[HDSPDemoModeEnvironment resetDemoMode](self, "resetDemoMode", a3, a4);
  return (id)objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
}

- (void)setInitialSchedule
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[HDSPEnvironment sleepScheduleModelManager](self, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v6 = v8;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting initial demo schedule", (uint8_t *)&v7, 0xCu);

    }
    -[HDSPDemoModeEnvironment resetDemoMode](self, "resetDemoMode");
  }
}

- (void)resetDemoMode
{
  NSObject *v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetDemoMode", buf, 0xCu);

  }
  -[HDSPEnvironment sleepModeManager](self, "sleepModeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSleepMode:", 0);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __40__HDSPDemoModeEnvironment_resetDemoMode__block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPEnvironment perform:withSource:](self, "perform:withSource:", v6, self);
}

void __40__HDSPDemoModeEnvironment_resetDemoMode__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v3 = objc_msgSend(v2, "saveSleepSchedule:error:", 0, &v15);
  v4 = v15;

  if ((v3 & 1) == 0)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v4;
      v11 = v10;
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to delete schedule with error %{public}@", buf, 0x16u);

    }
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "sleepScheduleModelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "demoScheduleModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  v7 = objc_msgSend(v5, "saveSleepScheduleModel:error:", v6, &v14);
  v8 = v14;

  if ((v7 & 1) == 0)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v17 = v12;
      v18 = 2114;
      v19 = v8;
      v13 = v12;
      _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save model with error %{public}@", buf, 0x16u);

    }
    v4 = v8;
LABEL_8:

    v8 = v4;
  }

}

- (id)demoScheduleModel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BEA9930];
  -[HDSPDemoModeEnvironment demoSleepSchedule](self, "demoSleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPDemoModeEnvironment demoSleepSettings](self, "demoSleepSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPDemoModeEnvironment demoEventRecord](self, "demoEventRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModelWithSleepSchedule:sleepSettings:sleepEventRecord:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)demoSleepSettings
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BEA98C0]);
  objc_msgSend(v2, "setScheduledSleepMode:", 1);
  objc_msgSend(v2, "setSleepTracking:", 1);
  objc_msgSend(v2, "setTimeInBedTracking:", 1);
  objc_msgSend(v2, "setBedtimeReminders:", 1);
  objc_msgSend(v2, "setChargingReminders:", 1);
  objc_msgSend(v2, "setWakeUpResults:", 1);
  objc_msgSend(v2, "setSleepModeOptions:", objc_msgSend(v2, "sleepModeOptions") | 0x4000);
  return v2;
}

- (id)demoSleepSchedule
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v2 = objc_alloc_init(MEMORY[0x24BEA98B8]);
  objc_msgSend(v2, "setWeekdays:", *MEMORY[0x24BEA97D0]);
  v3 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v3, "setHour:", 7);
  objc_msgSend(v3, "setMinute:", 0);
  v4 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v4, "setHour:", 23);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v2, "setWakeUpComponents:", v3);
  objc_msgSend(v2, "setBedtimeComponents:", v4);
  objc_msgSend(v2, "alarmConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setEnabled:", 0);
  objc_msgSend(v2, "setAlarmConfiguration:", v6);
  v7 = objc_alloc_init(MEMORY[0x24BEA98B8]);
  objc_msgSend(v7, "setWeekdays:", *MEMORY[0x24BEA97D8]);
  v8 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v8, "setHour:", 8);
  objc_msgSend(v8, "setMinute:", 0);
  v9 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v9, "setHour:", 0);
  objc_msgSend(v9, "setMinute:", 0);
  objc_msgSend(v7, "setWakeUpComponents:", v8);
  objc_msgSend(v7, "setBedtimeComponents:", v9);
  objc_msgSend(v7, "alarmConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v11, "setEnabled:", 0);
  objc_msgSend(v7, "setAlarmConfiguration:", v11);
  v12 = objc_alloc_init(MEMORY[0x24BEA98B0]);
  objc_msgSend(v12, "saveOccurrence:", v2);
  objc_msgSend(v12, "saveOccurrence:", v7);
  objc_msgSend(v12, "setSleepDurationGoal:", *MEMORY[0x24BEA9580] * 3600.0);
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

- (id)demoEventRecord
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void (**v10)(void);
  void *v11;
  void *v12;
  void (**v13)(void);
  void *v14;
  void *v15;
  void (**v16)(void);
  void *v17;

  -[HDSPEnvironment sleepScheduleModelManager](self, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepEventRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(MEMORY[0x24BEA98A8]);
  v8 = v7;

  objc_msgSend(v8, "setSleepCoachingOnboardingCompletedVersion:", 3);
  objc_msgSend(v8, "setSleepTrackingOnboardingCompletedVersion:", 3);
  objc_msgSend(v8, "setSleepWindDownShortcutsOnboardingCompletedVersion:", 2);
  objc_msgSend(v8, "sleepCoachingOnboardingFirstCompletedDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "setSleepCoachingOnboardingFirstCompletedDate:", v9);
  }
  else
  {
    -[HDSPEnvironment currentDateProvider](self, "currentDateProvider");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSleepCoachingOnboardingFirstCompletedDate:", v11);

  }
  objc_msgSend(v8, "sleepTrackingOnboardingFirstCompletedDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "setSleepTrackingOnboardingFirstCompletedDate:", v12);
  }
  else
  {
    -[HDSPEnvironment currentDateProvider](self, "currentDateProvider");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSleepTrackingOnboardingFirstCompletedDate:", v14);

  }
  objc_msgSend(v8, "sleepWindDownShortcutsOnboardingFirstCompletedDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v8, "setSleepWindDownShortcutsOnboardingFirstCompletedDate:", v15);
  }
  else
  {
    -[HDSPEnvironment currentDateProvider](self, "currentDateProvider");
    v16 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v16[2]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSleepWindDownShortcutsOnboardingFirstCompletedDate:", v17);

  }
  return v8;
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (BOOL)isUnitTestEnvironment
{
  return self->isUnitTestEnvironment;
}

- (void)setIsUnitTestEnvironment:(BOOL)a3
{
  self->isUnitTestEnvironment = a3;
}

@end
