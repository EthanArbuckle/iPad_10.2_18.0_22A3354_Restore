@implementation HDSPEnvironment

void __61__HDSPEnvironment_performWhenEnvironmentIsReady_withContext___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 40);
  v4 = WeakRetained;
  if (*(_QWORD *)(a1 + 32))
    objc_msgSend(WeakRetained, "perform:withContext:", v3);
  else
    (*(void (**)(uint64_t))(v3 + 16))(v3);

}

- (void)perform:(id)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void (**v13)(void);

  v13 = (void (**)(void))a3;
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "threadDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HDSPEnvironmentContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v11 = v10;

    objc_msgSend(v11, "addObject:", v5);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("HDSPEnvironmentContext"));

    v13[2]();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("HDSPEnvironmentContext"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeLastObject");

  }
  else
  {
    v13[2]();
  }

}

- (void)performWhenEnvironmentIsReady:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NAFuture *environmentIsReady;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    environmentIsReady = self->_environmentIsReady;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__HDSPEnvironment_performWhenEnvironmentIsReady_withContext___block_invoke;
    v10[3] = &unk_24D4E4490;
    objc_copyWeak(&v13, &location);
    v11 = v7;
    v12 = v6;
    v9 = (id)-[NAFuture addSuccessBlock:](environmentIsReady, "addSuccessBlock:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (BOOL)isDisabled
{
  return 0;
}

- (HDSPSleepScheduleModelManager)sleepScheduleModelManager
{
  return self->_sleepScheduleModelManager;
}

+ (id)standardEnvironment
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  HDSPAssertionManager *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HDSPEnvironment *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  HDSPEnvironment *v32;
  void *v33;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = [HDSPEnvironment alloc];
  objc_msgSend(a1, "_sleepTrackingManagerProviderForBehavior:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hksp_supportsGoodMorningAlerts");
  v6 = &__block_literal_global_206;
  if (!v5)
    v6 = 0;
  v31 = v6;
  v7 = objc_msgSend(v3, "hksp_supportsChargingReminders");
  v8 = &__block_literal_global_209_0;
  if (!v7)
    v8 = 0;
  v30 = v8;
  v9 = objc_msgSend(v3, "hksp_supportsWakeDetection");
  v10 = &__block_literal_global_212_0;
  if (!v9)
    v10 = 0;
  v29 = v10;
  v11 = objc_msgSend(v3, "hksp_supportsWakeUpResults");
  v12 = &__block_literal_global_215_0;
  if (!v11)
    v12 = 0;
  v27 = v12;
  v13 = objc_msgSend(v3, "hksp_supportsSleepAlarms");
  v14 = &__block_literal_global_221_0;
  if (!v13)
    v14 = 0;
  v26 = v14;
  v15 = objc_msgSend(v3, "hksp_supportsHealthData");
  v33 = (void *)v4;
  if (v15)
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEA9890]), "initWithLocalDeviceHealthStore");
  else
    v28 = 0;
  if (objc_msgSend(v3, "hksp_supportsSleepLockScreen"))
    v16 = &__block_literal_global_240_0;
  else
    v16 = 0;
  if (objc_msgSend(v3, "hksp_supportsSleepWidget"))
    v17 = &__block_literal_global_243;
  else
    v17 = 0;
  v18 = objc_alloc_init(HDSPAssertionManager);
  if (objc_msgSend(v3, "hksp_supportsDailyAnalytics"))
    v19 = &__block_literal_global_262;
  else
    v19 = 0;
  objc_msgSend(MEMORY[0x24BDBCF50], "hksp_sleepdUserDefaults");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPCurrentDateProvider();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPUnfairLockGenerator();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[HDSPEnvironment initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:](v32, "initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:", v3, &__block_literal_global_2, &__block_literal_global_191, &__block_literal_global_194, &__block_literal_global_197, &__block_literal_global_200, &__block_literal_global_203, v33, v31, v30,
          v29,
          v27,
          &__block_literal_global_218_0,
          v26,
          v28,
          &__block_literal_global_225,
          &__block_literal_global_228,
          &__block_literal_global_231,
          &__block_literal_global_234,
          &__block_literal_global_237_0,
          v16,
          v17,
          &__block_literal_global_246,
          &__block_literal_global_249,
          &__block_literal_global_252,
          v18,
          &__block_literal_global_256,
          &__block_literal_global_259,
          v19,
          v20,
          v21,
          v22,
          0,
          v23);

  if (v15)
  return v24;
}

HDSPSleepStorage *__38__HDSPEnvironment_standardEnvironment__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepStorage *v3;

  v2 = a2;
  v3 = -[HDSPSleepStorage initWithEnvironment:]([HDSPSleepStorage alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScheduleModelManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScheduleModelManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepScheduleModelManager initWithEnvironment:]([HDSPSleepScheduleModelManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepEventScheduler *__38__HDSPEnvironment_standardEnvironment__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepEventScheduler *v3;

  v2 = a2;
  v3 = -[HDSPSleepEventScheduler initWithEnvironment:]([HDSPSleepEventScheduler alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepStoreServer *__38__HDSPEnvironment_standardEnvironment__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepStoreServer *v3;

  v2 = a2;
  v3 = -[HDSPSleepStoreServer initWithEnvironment:]([HDSPSleepStoreServer alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScheduleStateCoordinator *__38__HDSPEnvironment_standardEnvironment__block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScheduleStateCoordinator *v3;

  v2 = a2;
  v3 = -[HDSPSleepScheduleStateCoordinator initWithEnvironment:]([HDSPSleepScheduleStateCoordinator alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepModeManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepModeManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepModeManager initWithEnvironment:]([HDSPSleepModeManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPGoodMorningAlertManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  HDSPGoodMorningAlertManager *v3;

  v2 = a2;
  v3 = -[HDSPGoodMorningAlertManager initWithEnvironment:]([HDSPGoodMorningAlertManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPChargingReminderManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  HDSPChargingReminderManager *v3;

  v2 = a2;
  v3 = -[HDSPChargingReminderManager initWithEnvironment:]([HDSPChargingReminderManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPWakeDetectionManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  HDSPWakeDetectionManager *v3;

  v2 = a2;
  v3 = -[HDSPWakeDetectionManager initWithEnvironment:]([HDSPWakeDetectionManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPWakeUpResultsNotificationManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  HDSPWakeUpResultsNotificationManager *v3;

  v2 = a2;
  v3 = -[HDSPWakeUpResultsNotificationManager initWithEnvironment:]([HDSPWakeUpResultsNotificationManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepActionManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepActionManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepActionManager initWithEnvironment:]([HDSPSleepActionManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepAlarmManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepAlarmManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepAlarmManager initWithEnvironment:]([HDSPSleepAlarmManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPContextStoreManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  HDSPContextStoreManager *v3;

  v2 = a2;
  v3 = -[HDSPContextStoreManager initWithEnvironment:]([HDSPContextStoreManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPBiomeManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  HDSPBiomeManager *v3;

  v2 = a2;
  v3 = -[HDSPBiomeManager initWithEnvironment:]([HDSPBiomeManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScheduleModelMigrationManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScheduleModelMigrationManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepScheduleModelMigrationManager initWithEnvironment:]([HDSPSleepScheduleModelMigrationManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepNotificationManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepNotificationManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepNotificationManager initWithEnvironment:]([HDSPSleepNotificationManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPNotificationListener *__38__HDSPEnvironment_standardEnvironment__block_invoke_17(uint64_t a1, void *a2)
{
  id v2;
  HDSPNotificationListener *v3;

  v2 = a2;
  v3 = -[HDSPNotificationListener initWithEnvironment:]([HDSPNotificationListener alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepLockScreenManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepLockScreenManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepLockScreenManager initWithEnvironment:]([HDSPSleepLockScreenManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepWidgetManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepWidgetManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepWidgetManager initWithEnvironment:]([HDSPSleepWidgetManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPIDSServiceManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  HDSPIDSServiceManager *v3;

  v2 = a2;
  v3 = -[HDSPIDSServiceManager initWithEnvironment:]([HDSPIDSServiceManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPDiagnostics *__38__HDSPEnvironment_standardEnvironment__block_invoke_21(uint64_t a1, void *a2)
{
  id v2;
  HDSPDiagnostics *v3;

  v2 = a2;
  v3 = -[HDSPDiagnostics initWithEnvironment:]([HDSPDiagnostics alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSystemMonitor *__38__HDSPEnvironment_standardEnvironment__block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  HDSPSystemMonitor *v3;

  v2 = a2;
  v3 = -[HDSPSystemMonitor initWithEnvironment:]([HDSPSystemMonitor alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPTimeChangeListener *__38__HDSPEnvironment_standardEnvironment__block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  HDSPTimeChangeListener *v3;

  v2 = a2;
  v3 = -[HDSPTimeChangeListener initWithEnvironment:]([HDSPTimeChangeListener alloc], "initWithEnvironment:", v2);

  return v3;
}

id __38__HDSPEnvironment_standardEnvironment__block_invoke_24(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEA98F0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithEnvironment:", v3);

  return v4;
}

HDSPAnalyticsManager *__38__HDSPEnvironment_standardEnvironment__block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  HDSPAnalyticsManager *v3;

  v2 = a2;
  v3 = -[HDSPAnalyticsManager initWithEnvironment:]([HDSPAnalyticsManager alloc], "initWithEnvironment:", v2);

  return v3;
}

+ (id)_sleepTrackingManagerProviderForBehavior:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (objc_msgSend(v3, "hksp_supportsSleepTracking"))
  {
    if (objc_msgSend(v3, "hksp_supportsAlwaysOnTracking"))
      v4 = 0;
    else
      v4 = &__block_literal_global_267;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

HDSPSleepTrackingManager *__60__HDSPEnvironment__sleepTrackingManagerProviderForBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepTrackingManager *v3;

  v2 = a2;
  v3 = -[HDSPSleepTrackingManager initWithEnvironment:]([HDSPSleepTrackingManager alloc], "initWithEnvironment:", v2);

  return v3;
}

- (HDSPEnvironment)initWithBehavior:(id)a3 sleepStorageProvider:(id)a4 sleepScheduleModelManagerProvider:(id)a5 sleepSchedulerProvider:(id)a6 sleepServerProvider:(id)a7 sleepCoordinatorProvider:(id)a8 sleepModeManagerProvider:(id)a9 sleepTrackingManagerProvider:(id)a10 goodMorningAlertManagerProvider:(id)a11 chargingReminderManagerProvider:(id)a12 wakeDetectionManagerProvider:(id)a13 wakeUpResultsNotificationManagerProvider:(id)a14 actionManagerProvider:(id)a15 sleepAlarmManagerProvider:(id)a16 healthStoreProvider:(id)a17 contextStoreManagerProvider:(id)a18 biomeManagerProvider:(id)a19 migrationManagerProvider:(id)a20 notificationManagerProvider:(id)a21 notificationListenerProvider:(id)a22 sleepLockScreenManagerProvider:(id)a23 sleepWidgetManagerProvider:(id)a24 idsServiceManagerProvider:(id)a25 diagnosticsProvider:(id)a26 systemMonitorProvider:(id)a27 assertionManager:(id)a28 timeChangeListenerProvider:(id)a29 sensitiveUIMonitorProvider:(id)a30 analyticsManagerProvider:(id)a31 userDefaults:(id)a32 fileManager:(id)a33 currentDateProvider:(id)a34 defaultCallbackScheduler:(id)a35 mutexGenerator:(id)a36
{
  id v41;
  void (**v42)(_QWORD, HDSPEnvironment *);
  void (**v43)(id, HDSPEnvironment *);
  void (**v44)(id, HDSPEnvironment *);
  void (**v45)(_QWORD, HDSPEnvironment *);
  void (**v46)(_QWORD, HDSPEnvironment *);
  void (**v47)(_QWORD, HDSPEnvironment *);
  HDSPEnvironment *v48;
  void (**v49)(_QWORD, HDSPEnvironment *);
  id v50;
  NSObject *v51;
  void *v52;
  id v53;
  HKSPScheduler *v54;
  void *defaultCallbackScheduler;
  uint64_t v56;
  HKSPScheduler *v57;
  uint64_t v58;
  id currentDateProvider;
  NAFuture *v60;
  NAFuture *environmentIsReady;
  uint64_t v62;
  id mutexGenerator;
  uint64_t v64;
  HKSPMutexProvider *mutexProvider;
  void (**v66)(_QWORD, HDSPEnvironment *);
  uint64_t v67;
  HDSPDiagnostics *diagnostics;
  HDSPAssertionManager *v69;
  HDSPAssertionManager *assertionManager;
  uint64_t v71;
  HDSPContextStoreManager *contextStoreManager;
  uint64_t v73;
  HDSPBiomeManager *biomeManager;
  uint64_t v75;
  HDSPSystemMonitor *systemMonitor;
  uint64_t v77;
  HDSPSleepStorage *sleepStorage;
  uint64_t v79;
  HDSPSleepScheduleModelMigrationManager *migrationManager;
  uint64_t v81;
  HDSPSleepScheduleModelManager *sleepScheduleModelManager;
  uint64_t v83;
  HDSPSleepEventScheduler *sleepScheduler;
  uint64_t v85;
  HDSPSleepScheduleStateCoordinator *sleepCoordinator;
  uint64_t v87;
  HDSPSleepModeManager *sleepModeManager;
  uint64_t v89;
  HDSPSleepTrackingManager *sleepTrackingManager;
  uint64_t v91;
  HDSPGoodMorningAlertManager *goodMorningAlertManager;
  uint64_t v93;
  HDSPChargingReminderManager *chargingReminderManager;
  uint64_t v95;
  HDSPWakeUpResultsNotificationManager *wakeUpResultsNotificationManager;
  uint64_t v97;
  HDSPWakeDetectionManager *wakeDetectionManager;
  uint64_t v99;
  HDSPSleepActionManager *actionManager;
  uint64_t v101;
  HDSPSleepAlarmManager *sleepAlarmManager;
  uint64_t v103;
  HDSPSleepNotificationManager *notificationManager;
  uint64_t v105;
  HDSPNotificationListener *notificationListener;
  uint64_t v107;
  HDSPSleepLockScreenManager *sleepLockScreenManager;
  uint64_t v109;
  HDSPSleepWidgetManager *sleepWidgetManager;
  uint64_t v111;
  HDSPIDSServiceManager *idsServiceManager;
  uint64_t v113;
  HDSPSleepStoreServer *sleepServer;
  id *p_sleepServer;
  uint64_t v116;
  HDSPTimeChangeListener *timeChangeListener;
  uint64_t v118;
  HKSPSensitiveUIMonitor *sensitiveUIMonitor;
  uint64_t v120;
  HDSPAnalyticsManager *analyticsManager;
  HDSPEnvironmentStateMachine *v122;
  HDSPEnvironmentStateMachine *stateMachine;
  HDSPEnvironment *v124;
  void (**v126)(_QWORD, HDSPEnvironment *);
  void (**v127)(_QWORD, HDSPEnvironment *);
  void (**v128)(_QWORD, HDSPEnvironment *);
  void *v130;
  void (**v132)(id, HDSPEnvironment *);
  id v133;
  id v134;
  id v135;
  id v136;
  void (**v137)(id, HDSPEnvironment *);
  id v138;
  id v139;
  id v140;
  void (**v141)(void);
  void (**v142)(void);
  void (**v143)(void);
  void (**v144)(void);
  void (**v145)(void);
  void (**v146)(void);
  void (**v147)(void);
  void (**v148)(void);
  void (**v149)(void);
  void (**v150)(void);
  void (**v151)(id, HDSPEnvironment *);
  void (**v152)(id, HDSPEnvironment *);
  void (**v153)(id, HDSPEnvironment *);
  void (**v154)(id, HDSPEnvironment *);
  void (**v155)(id, HDSPEnvironment *);
  void (**v156)(id, HDSPEnvironment *);
  void (**v157)(id, HDSPEnvironment *);
  void (**v158)(id, HDSPEnvironment *);
  objc_super v159;
  uint8_t buf[4];
  void *v161;
  __int16 v162;
  HDSPEnvironment *v163;
  uint64_t v164;

  v164 = *MEMORY[0x24BDAC8D0];
  v136 = a3;
  v158 = (void (**)(id, HDSPEnvironment *))a4;
  v157 = (void (**)(id, HDSPEnvironment *))a5;
  v156 = (void (**)(id, HDSPEnvironment *))a6;
  v155 = (void (**)(id, HDSPEnvironment *))a7;
  v41 = a8;
  v137 = (void (**)(id, HDSPEnvironment *))a9;
  v42 = (void (**)(_QWORD, HDSPEnvironment *))a10;
  v43 = (void (**)(id, HDSPEnvironment *))a11;
  v44 = (void (**)(id, HDSPEnvironment *))a12;
  v45 = (void (**)(_QWORD, HDSPEnvironment *))a13;
  v46 = (void (**)(_QWORD, HDSPEnvironment *))a14;
  v47 = (void (**)(_QWORD, HDSPEnvironment *))a15;
  v154 = (void (**)(id, HDSPEnvironment *))a16;
  v135 = a17;
  v153 = (void (**)(id, HDSPEnvironment *))a18;
  v152 = (void (**)(id, HDSPEnvironment *))a19;
  v151 = (void (**)(id, HDSPEnvironment *))a20;
  v150 = (void (**)(void))a21;
  v149 = (void (**)(void))a22;
  v148 = (void (**)(void))a23;
  v147 = (void (**)(void))a24;
  v146 = (void (**)(void))a25;
  v145 = (void (**)(void))a26;
  v144 = (void (**)(void))a27;
  v143 = (void (**)(void))a29;
  v142 = (void (**)(void))a30;
  v141 = (void (**)(void))a31;
  v134 = a32;
  v133 = a33;
  v140 = a34;
  v139 = a35;
  v138 = a36;
  v159.receiver = self;
  v159.super_class = (Class)HDSPEnvironment;
  v48 = -[HDSPEnvironment init](&v159, sel_init);
  if (v48)
  {
    v127 = v46;
    v128 = v47;
    v126 = v45;
    v132 = v43;
    v49 = v42;
    v50 = v41;
    HKSPLogForCategory();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      v52 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v161 = v52;
      v162 = 2048;
      v163 = v48;
      v53 = v52;
      _os_log_impl(&dword_21610C000, v51, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeStrong((id *)&v48->_behavior, a3);
    v130 = v50;
    if (v139)
    {
      v54 = (HKSPScheduler *)v139;
      defaultCallbackScheduler = v48->_defaultCallbackScheduler;
      v48->_defaultCallbackScheduler = v54;
    }
    else
    {
      HKSPDispatchQueueName();
      defaultCallbackScheduler = (void *)objc_claimAutoreleasedReturnValue();
      HKSPSerialQueueBackedScheduler();
      v56 = objc_claimAutoreleasedReturnValue();
      v57 = v48->_defaultCallbackScheduler;
      v48->_defaultCallbackScheduler = (HKSPScheduler *)v56;

    }
    v58 = objc_msgSend(v140, "copy");
    currentDateProvider = v48->_currentDateProvider;
    v48->_currentDateProvider = (id)v58;

    objc_storeStrong((id *)&v48->_userDefaults, a32);
    objc_storeStrong((id *)&v48->_fileManager, a33);
    v60 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    environmentIsReady = v48->_environmentIsReady;
    v48->_environmentIsReady = v60;

    v62 = objc_msgSend(v138, "copy");
    mutexGenerator = v48->_mutexGenerator;
    v48->_mutexGenerator = (id)v62;

    (*((void (**)(void))v48->_mutexGenerator + 2))();
    v64 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v48->_mutexProvider;
    v48->_mutexProvider = (HKSPMutexProvider *)v64;

    v66 = v49;
    if (v145)
    {
      v145[2]();
      v67 = objc_claimAutoreleasedReturnValue();
      diagnostics = v48->_diagnostics;
      v48->_diagnostics = (HDSPDiagnostics *)v67;
    }
    else
    {
      diagnostics = v48->_diagnostics;
      v48->_diagnostics = 0;
    }

    -[HDSPDiagnostics addProvider:](v48->_diagnostics, "addProvider:", v48);
    v69 = objc_alloc_init(HDSPAssertionManager);
    assertionManager = v48->_assertionManager;
    v48->_assertionManager = v69;

    -[HDSPDiagnostics addProvider:](v48->_diagnostics, "addProvider:", v48->_assertionManager);
    v45 = v126;
    if (v153)
    {
      v153[2](v153, v48);
      v71 = objc_claimAutoreleasedReturnValue();
      contextStoreManager = v48->_contextStoreManager;
      v48->_contextStoreManager = (HDSPContextStoreManager *)v71;
    }
    else
    {
      contextStoreManager = v48->_contextStoreManager;
      v48->_contextStoreManager = 0;
    }

    if (v152)
    {
      v152[2](v152, v48);
      v73 = objc_claimAutoreleasedReturnValue();
      biomeManager = v48->_biomeManager;
      v48->_biomeManager = (HDSPBiomeManager *)v73;
    }
    else
    {
      biomeManager = v48->_biomeManager;
      v48->_biomeManager = 0;
    }

    if (v144)
    {
      v144[2]();
      v75 = objc_claimAutoreleasedReturnValue();
      systemMonitor = v48->_systemMonitor;
      v48->_systemMonitor = (HDSPSystemMonitor *)v75;
    }
    else
    {
      systemMonitor = v48->_systemMonitor;
      v48->_systemMonitor = 0;
    }

    -[HDSPSystemMonitor setDelegate:](v48->_systemMonitor, "setDelegate:", v48);
    objc_storeStrong((id *)&v48->_healthStoreProvider, a17);
    if (v158)
    {
      v158[2](v158, v48);
      v77 = objc_claimAutoreleasedReturnValue();
      sleepStorage = v48->_sleepStorage;
      v48->_sleepStorage = (HDSPSleepStorage *)v77;
    }
    else
    {
      sleepStorage = v48->_sleepStorage;
      v48->_sleepStorage = 0;
    }

    if (v151)
    {
      v151[2](v151, v48);
      v79 = objc_claimAutoreleasedReturnValue();
      migrationManager = v48->_migrationManager;
      v48->_migrationManager = (HDSPSleepScheduleModelMigrationManager *)v79;
    }
    else
    {
      migrationManager = v48->_migrationManager;
      v48->_migrationManager = 0;
    }

    if (v157)
    {
      v157[2](v157, v48);
      v81 = objc_claimAutoreleasedReturnValue();
      sleepScheduleModelManager = v48->_sleepScheduleModelManager;
      v48->_sleepScheduleModelManager = (HDSPSleepScheduleModelManager *)v81;
    }
    else
    {
      sleepScheduleModelManager = v48->_sleepScheduleModelManager;
      v48->_sleepScheduleModelManager = 0;
    }

    if (v156)
    {
      v156[2](v156, v48);
      v83 = objc_claimAutoreleasedReturnValue();
      sleepScheduler = v48->_sleepScheduler;
      v48->_sleepScheduler = (HDSPSleepEventScheduler *)v83;
    }
    else
    {
      sleepScheduler = v48->_sleepScheduler;
      v48->_sleepScheduler = 0;
    }

    if (v50)
    {
      (*((void (**)(void))v50 + 2))();
      v85 = objc_claimAutoreleasedReturnValue();
      sleepCoordinator = v48->_sleepCoordinator;
      v48->_sleepCoordinator = (HDSPSleepScheduleStateCoordinator *)v85;
    }
    else
    {
      sleepCoordinator = v48->_sleepCoordinator;
      v48->_sleepCoordinator = 0;
    }

    if (v137)
    {
      v137[2](v137, v48);
      v87 = objc_claimAutoreleasedReturnValue();
      sleepModeManager = v48->_sleepModeManager;
      v48->_sleepModeManager = (HDSPSleepModeManager *)v87;
    }
    else
    {
      sleepModeManager = v48->_sleepModeManager;
      v48->_sleepModeManager = 0;
    }

    if (v66)
    {
      v66[2](v66, v48);
      v89 = objc_claimAutoreleasedReturnValue();
      sleepTrackingManager = v48->_sleepTrackingManager;
      v48->_sleepTrackingManager = (HDSPSleepTrackingManager *)v89;
    }
    else
    {
      sleepTrackingManager = v48->_sleepTrackingManager;
      v48->_sleepTrackingManager = 0;
    }

    if (v43)
    {
      v43[2](v43, v48);
      v91 = objc_claimAutoreleasedReturnValue();
      goodMorningAlertManager = v48->_goodMorningAlertManager;
      v48->_goodMorningAlertManager = (HDSPGoodMorningAlertManager *)v91;
    }
    else
    {
      goodMorningAlertManager = v48->_goodMorningAlertManager;
      v48->_goodMorningAlertManager = 0;
    }

    if (v44)
    {
      v44[2](v44, v48);
      v93 = objc_claimAutoreleasedReturnValue();
      chargingReminderManager = v48->_chargingReminderManager;
      v48->_chargingReminderManager = (HDSPChargingReminderManager *)v93;
    }
    else
    {
      chargingReminderManager = v48->_chargingReminderManager;
      v48->_chargingReminderManager = 0;
    }

    if (v127)
    {
      v127[2](v127, v48);
      v95 = objc_claimAutoreleasedReturnValue();
      wakeUpResultsNotificationManager = v48->_wakeUpResultsNotificationManager;
      v48->_wakeUpResultsNotificationManager = (HDSPWakeUpResultsNotificationManager *)v95;
    }
    else
    {
      wakeUpResultsNotificationManager = v48->_wakeUpResultsNotificationManager;
      v48->_wakeUpResultsNotificationManager = 0;
    }

    if (v126)
    {
      v126[2](v126, v48);
      v97 = objc_claimAutoreleasedReturnValue();
      wakeDetectionManager = v48->_wakeDetectionManager;
      v48->_wakeDetectionManager = (HDSPWakeDetectionManager *)v97;
    }
    else
    {
      wakeDetectionManager = v48->_wakeDetectionManager;
      v48->_wakeDetectionManager = 0;
    }

    if (v128)
    {
      v128[2](v128, v48);
      v99 = objc_claimAutoreleasedReturnValue();
      actionManager = v48->_actionManager;
      v48->_actionManager = (HDSPSleepActionManager *)v99;
    }
    else
    {
      actionManager = v48->_actionManager;
      v48->_actionManager = 0;
    }

    if (v154)
    {
      v154[2](v154, v48);
      v101 = objc_claimAutoreleasedReturnValue();
      sleepAlarmManager = v48->_sleepAlarmManager;
      v48->_sleepAlarmManager = (HDSPSleepAlarmManager *)v101;
    }
    else
    {
      sleepAlarmManager = v48->_sleepAlarmManager;
      v48->_sleepAlarmManager = 0;
    }

    if (v150)
    {
      v150[2]();
      v103 = objc_claimAutoreleasedReturnValue();
      notificationManager = v48->_notificationManager;
      v48->_notificationManager = (HDSPSleepNotificationManager *)v103;
    }
    else
    {
      notificationManager = v48->_notificationManager;
      v48->_notificationManager = 0;
    }

    if (v149)
    {
      v149[2]();
      v105 = objc_claimAutoreleasedReturnValue();
      notificationListener = v48->_notificationListener;
      v48->_notificationListener = (HDSPNotificationListener *)v105;
    }
    else
    {
      notificationListener = v48->_notificationListener;
      v48->_notificationListener = 0;
    }

    if (v148)
    {
      v148[2]();
      v107 = objc_claimAutoreleasedReturnValue();
      sleepLockScreenManager = v48->_sleepLockScreenManager;
      v48->_sleepLockScreenManager = (HDSPSleepLockScreenManager *)v107;
    }
    else
    {
      sleepLockScreenManager = v48->_sleepLockScreenManager;
      v48->_sleepLockScreenManager = 0;
    }

    if (v147)
    {
      v147[2]();
      v109 = objc_claimAutoreleasedReturnValue();
      sleepWidgetManager = v48->_sleepWidgetManager;
      v48->_sleepWidgetManager = (HDSPSleepWidgetManager *)v109;
    }
    else
    {
      sleepWidgetManager = v48->_sleepWidgetManager;
      v48->_sleepWidgetManager = 0;
    }

    if (v146)
    {
      v146[2]();
      v111 = objc_claimAutoreleasedReturnValue();
      idsServiceManager = v48->_idsServiceManager;
      v48->_idsServiceManager = (HDSPIDSServiceManager *)v111;
    }
    else
    {
      idsServiceManager = v48->_idsServiceManager;
      v48->_idsServiceManager = 0;
    }

    if (v155)
    {
      v155[2](v155, v48);
      v113 = objc_claimAutoreleasedReturnValue();
      p_sleepServer = (id *)&v48->_sleepServer;
      sleepServer = v48->_sleepServer;
      v48->_sleepServer = (HDSPSleepStoreServer *)v113;
    }
    else
    {
      p_sleepServer = (id *)&v48->_sleepServer;
      sleepServer = v48->_sleepServer;
      v48->_sleepServer = 0;
    }

    objc_msgSend(*p_sleepServer, "startListening");
    if (v143)
    {
      v143[2]();
      v116 = objc_claimAutoreleasedReturnValue();
      timeChangeListener = v48->_timeChangeListener;
      v48->_timeChangeListener = (HDSPTimeChangeListener *)v116;
    }
    else
    {
      timeChangeListener = v48->_timeChangeListener;
      v48->_timeChangeListener = 0;
    }
    v43 = v132;

    if (v142)
    {
      v142[2]();
      v118 = objc_claimAutoreleasedReturnValue();
      sensitiveUIMonitor = v48->_sensitiveUIMonitor;
      v48->_sensitiveUIMonitor = (HKSPSensitiveUIMonitor *)v118;
    }
    else
    {
      sensitiveUIMonitor = v48->_sensitiveUIMonitor;
      v48->_sensitiveUIMonitor = 0;
    }
    v42 = v66;

    v47 = v128;
    v46 = v127;
    if (v141)
    {
      v141[2]();
      v120 = objc_claimAutoreleasedReturnValue();
      analyticsManager = v48->_analyticsManager;
      v48->_analyticsManager = (HDSPAnalyticsManager *)v120;
    }
    else
    {
      analyticsManager = v48->_analyticsManager;
      v48->_analyticsManager = 0;
    }

    v122 = -[HDSPEnvironmentStateMachine initWithDelegate:infoProvider:]([HDSPEnvironmentStateMachine alloc], "initWithDelegate:infoProvider:", v48, v48);
    stateMachine = v48->_stateMachine;
    v48->_stateMachine = v122;

    v124 = v48;
    v41 = v130;
  }

  return v48;
}

+ (id)disabledEnvironment
{
  return objc_alloc_init(HDSPDisabledEnvironment);
}

+ (id)demoModeEnvironment
{
  return objc_alloc_init(HDSPDemoModeEnvironment);
}

- (void)dealloc
{
  objc_super v3;

  -[HDSPEnvironment shutdown](self, "shutdown");
  v3.receiver = self;
  v3.super_class = (Class)HDSPEnvironment;
  -[HDSPEnvironment dealloc](&v3, sel_dealloc);
}

- (void)shutdown
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] shutdown", buf, 0xCu);

  }
  -[HDSPEnvironment _environmentAwareComponents](self, "_environmentAwareComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__HDSPEnvironment_shutdown__block_invoke;
  v6[3] = &unk_24D4E4468;
  v6[4] = self;
  objc_msgSend(v5, "na_each:", v6);

}

void __27__HDSPEnvironment_shutdown__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "environmentWillInvalidate:", *(_QWORD *)(a1 + 32));

}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)performWhenEnvironmentIsReady:(id)a3
{
  -[HDSPEnvironment performWhenEnvironmentIsReady:withContext:](self, "performWhenEnvironmentIsReady:withContext:", a3, 0);
}

- (void)perform:(id)a3 withSource:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  +[HDSPEnvironmentContext contextWithSource:](HDSPEnvironmentContext, "contextWithSource:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDSPEnvironment perform:withContext:](self, "perform:withContext:", v6, v7);

}

- (id)currentContext
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("HDSPEnvironmentContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)currentSource
{
  void *v2;
  void *v3;

  -[HDSPEnvironment currentContext](self, "currentContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepare
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] prepare", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPEnvironment updateState](self, "updateState");
}

- (void)updateState
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] updateState", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__HDSPEnvironment_updateState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPEnvironment _withLock:](self, "_withLock:", v5);
}

uint64_t __30__HDSPEnvironment_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "updateState");
}

- (void)systemDidBecomeReady
{
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] systemDidBecomeReady", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__HDSPEnvironment_systemDidBecomeReady__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPEnvironment _withLock:](self, "_withLock:", v5);
}

uint64_t __39__HDSPEnvironment_systemDidBecomeReady__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "systemDidBecomeReady");
}

- (BOOL)isEnvironmentReady
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __37__HDSPEnvironment_isEnvironmentReady__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPEnvironment _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __37__HDSPEnvironment_isEnvironmentReady__block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "currentState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "readyState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3 == v2;

}

- (BOOL)isSystemReady
{
  return -[HDSPSystemMonitor isSystemReady](self->_systemMonitor, "isSystemReady");
}

- (BOOL)needsDataMigration
{
  return -[HDSPSleepScheduleModelMigrationManager needDataMigration](self->_migrationManager, "needDataMigration");
}

- (void)environmentShouldMigrateData
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] environment needs migration", buf, 0xCu);

  }
  -[HDSPSleepScheduleModelMigrationManager performDataMigration](self->_migrationManager, "performDataMigration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke;
  v7[3] = &unk_24D4E44B8;
  v7[4] = self;
  v6 = (id)objc_msgSend(v5, "addCompletionBlock:", v7);

}

void __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 2114;
    v12 = v4;
    v6 = v10;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] dataMigrationDidComplete (error: %{public}@))", buf, 0x16u);

  }
  v7 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke_285;
  v8[3] = &unk_24D4E3498;
  v8[4] = v7;
  objc_msgSend(v7, "_withLock:", v8);

}

uint64_t __47__HDSPEnvironment_environmentShouldMigrateData__block_invoke_285(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "dataMigrationDidComplete");
}

- (NAScheduler)callbackScheduler
{
  return self->_defaultCallbackScheduler;
}

- (id)_environmentAwareComponents
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepStorage);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepScheduleModelManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_migrationManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_actionManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepServer);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepAlarmManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepTrackingManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_chargingReminderManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_wakeUpResultsNotificationManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_goodMorningAlertManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_wakeDetectionManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepCoordinator);
  objc_msgSend(v3, "na_safeAddObject:", self->_contextStoreManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_biomeManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepModeManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepScheduler);
  objc_msgSend(v3, "na_safeAddObject:", self->_systemMonitor);
  objc_msgSend(v3, "na_safeAddObject:", self->_notificationManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_diagnostics);
  objc_msgSend(v3, "na_safeAddObject:", self->_timeChangeListener);
  objc_msgSend(v3, "na_safeAddObject:", self->_notificationListener);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepLockScreenManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_sleepWidgetManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_idsServiceManager);
  objc_msgSend(v3, "na_safeAddObject:", self->_analyticsManager);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (void)environmentDidBecomeReady
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HDSPEnvironment _environmentAwareComponents](self, "_environmentAwareComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke;
  v9[3] = &unk_24D4E4468;
  v9[4] = self;
  objc_msgSend(v3, "na_each:", v9);
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v11 = v6;
    v7 = v6;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environment is ready", buf, 0xCu);

  }
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke_289;
  v8[3] = &unk_24D4E4468;
  v8[4] = self;
  objc_msgSend(v3, "na_each:", v8);
  -[NAFuture finishWithNoResult](self->_environmentIsReady, "finishWithNoResult");

}

void __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "environmentWillBecomeReady:", *(_QWORD *)(a1 + 32));

}

void __44__HDSPEnvironment_environmentDidBecomeReady__block_invoke_289(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "environmentDidBecomeReady:", *(_QWORD *)(a1 + 32));

}

- (BOOL)isDemoEnvironment
{
  void *v2;
  char v3;

  -[HDSPEnvironment behavior](self, "behavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hksp_demoMode");

  return v3;
}

- (BOOL)isUnitTestEnvironment
{
  return 0;
}

- (id)currentState
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__5;
  v9 = __Block_byref_object_dispose__5;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __31__HDSPEnvironment_currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPEnvironment _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __31__HDSPEnvironment_currentState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "currentState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)diagnosticDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPEnvironment currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@) Current State: %@, System Ready: %d, Environment Ready: %d"), v5, v6, -[HDSPEnvironment isSystemReady](self, "isSystemReady"), -[HDSPEnvironment isEnvironmentReady](self, "isEnvironmentReady"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)diagnosticInfo
{
  objc_class *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("Environment");
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  v13[1] = CFSTR("Current State");
  -[HDSPEnvironment currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateName");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("none");
  if (v6)
    v8 = (const __CFString *)v6;
  v14[1] = v8;
  v13[2] = CFSTR("System Ready");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDSPEnvironment isSystemReady](self, "isSystemReady"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  v13[3] = CFSTR("Environment Ready");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDSPEnvironment isEnvironmentReady](self, "isEnvironmentReady"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (_HKBehavior)behavior
{
  return self->_behavior;
}

- (HDSPSleepStorage)sleepStorage
{
  return self->_sleepStorage;
}

- (HDSPSleepEventScheduler)sleepScheduler
{
  return self->_sleepScheduler;
}

- (HDSPSleepScheduleStateCoordinator)sleepCoordinator
{
  return self->_sleepCoordinator;
}

- (HDSPSleepModeManager)sleepModeManager
{
  return self->_sleepModeManager;
}

- (HDSPSleepTrackingManager)sleepTrackingManager
{
  return self->_sleepTrackingManager;
}

- (HDSPSleepActionManager)actionManager
{
  return self->_actionManager;
}

- (HDSPSleepNotificationManager)notificationManager
{
  return self->_notificationManager;
}

- (HDSPEnvironmentStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (NAFuture)environmentIsReady
{
  return self->_environmentIsReady;
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (HDSPSleepStoreServer)sleepServer
{
  return self->_sleepServer;
}

- (HDSPGoodMorningAlertManager)goodMorningAlertManager
{
  return self->_goodMorningAlertManager;
}

- (HDSPChargingReminderManager)chargingReminderManager
{
  return self->_chargingReminderManager;
}

- (HDSPWakeDetectionManager)wakeDetectionManager
{
  return self->_wakeDetectionManager;
}

- (HDSPWakeUpResultsNotificationManager)wakeUpResultsNotificationManager
{
  return self->_wakeUpResultsNotificationManager;
}

- (HDSPSleepAlarmManager)sleepAlarmManager
{
  return self->_sleepAlarmManager;
}

- (HKSPHealthStoreProvider)healthStoreProvider
{
  return self->_healthStoreProvider;
}

- (HDSPDiagnostics)diagnostics
{
  return self->_diagnostics;
}

- (HDSPNotificationListener)notificationListener
{
  return self->_notificationListener;
}

- (HDSPSleepLockScreenManager)sleepLockScreenManager
{
  return self->_sleepLockScreenManager;
}

- (HDSPSleepWidgetManager)sleepWidgetManager
{
  return self->_sleepWidgetManager;
}

- (HDSPSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (HDSPAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (HDSPTimeChangeListener)timeChangeListener
{
  return self->_timeChangeListener;
}

- (HKSPSensitiveUIMonitor)sensitiveUIMonitor
{
  return self->_sensitiveUIMonitor;
}

- (HDSPSleepScheduleModelMigrationManager)migrationManager
{
  return self->_migrationManager;
}

- (HDSPContextStoreManager)contextStoreManager
{
  return self->_contextStoreManager;
}

- (HDSPBiomeManager)biomeManager
{
  return self->_biomeManager;
}

- (HDSPIDSServiceManager)idsServiceManager
{
  return self->_idsServiceManager;
}

- (HKSPScheduler)defaultCallbackScheduler
{
  return self->_defaultCallbackScheduler;
}

- (HDSPAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (HKSPFileManager)fileManager
{
  return self->_fileManager;
}

- (id)mutexGenerator
{
  return self->_mutexGenerator;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_mutexGenerator, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_defaultCallbackScheduler, 0);
  objc_storeStrong((id *)&self->_idsServiceManager, 0);
  objc_storeStrong((id *)&self->_biomeManager, 0);
  objc_storeStrong((id *)&self->_contextStoreManager, 0);
  objc_storeStrong((id *)&self->_migrationManager, 0);
  objc_storeStrong((id *)&self->_sensitiveUIMonitor, 0);
  objc_storeStrong((id *)&self->_timeChangeListener, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_sleepWidgetManager, 0);
  objc_storeStrong((id *)&self->_sleepLockScreenManager, 0);
  objc_storeStrong((id *)&self->_notificationListener, 0);
  objc_storeStrong((id *)&self->_diagnostics, 0);
  objc_storeStrong((id *)&self->_healthStoreProvider, 0);
  objc_storeStrong((id *)&self->_sleepAlarmManager, 0);
  objc_storeStrong((id *)&self->_wakeUpResultsNotificationManager, 0);
  objc_storeStrong((id *)&self->_wakeDetectionManager, 0);
  objc_storeStrong((id *)&self->_chargingReminderManager, 0);
  objc_storeStrong((id *)&self->_goodMorningAlertManager, 0);
  objc_storeStrong((id *)&self->_sleepServer, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
  objc_storeStrong((id *)&self->_environmentIsReady, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_sleepTrackingManager, 0);
  objc_storeStrong((id *)&self->_sleepModeManager, 0);
  objc_storeStrong((id *)&self->_sleepCoordinator, 0);
  objc_storeStrong((id *)&self->_sleepScheduler, 0);
  objc_storeStrong((id *)&self->_sleepStorage, 0);
  objc_storeStrong((id *)&self->_sleepScheduleModelManager, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
