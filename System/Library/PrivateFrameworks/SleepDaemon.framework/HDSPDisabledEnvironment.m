@implementation HDSPDisabledEnvironment

- (HDSPDisabledEnvironment)init
{
  void *v3;
  void *v4;
  void *v5;
  HDSPDisabledEnvironment *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPCurrentDateProvider();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPUnfairLockGenerator();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HDSPDisabledEnvironment;
  v6 = -[HDSPEnvironment initWithBehavior:sleepStorageProvider:sleepScheduleModelManagerProvider:sleepSchedulerProvider:sleepServerProvider:sleepCoordinatorProvider:sleepModeManagerProvider:sleepTrackingManagerProvider:goodMorningAlertManagerProvider:chargingReminderManagerProvider:wakeDetectionManagerProvider:wakeUpResultsNotificationManagerProvider:actionManagerProvider:sleepAlarmManagerProvider:healthStoreProvider:contextStoreManagerProvider:biomeManagerProvider:migrationManagerProvider:notificationManagerProvider:notificationListenerProvider:sleepLockScreenManagerProvider:sleepWidgetManagerProvider:idsServiceManagerProvider:diagnosticsProvider:systemMonitorProvider:assertionManager:timeChangeListenerProvider:sensitiveUIMonitorProvider:analyticsManagerProvider:userDefaults:fileManager:currentDateProvider:defaultCallbackScheduler:mutexGenerator:](&v8, sel_initWithBehavior_sleepStorageProvider_sleepScheduleModelManagerProvider_sleepSchedulerProvider_sleepServerProvider_sleepCoordinatorProvider_sleepModeManagerProvider_sleepTrackingManagerProvider_goodMorningAlertManagerProvider_chargingReminderManagerProvider_wakeDetectionManagerProvider_wakeUpResultsNotificationManagerProvider_actionManagerProvider_sleepAlarmManagerProvider_healthStoreProvider_contextStoreManagerProvider_biomeManagerProvider_migrationManagerProvider_notificationManagerProvider_notificationListenerProvider_sleepLockScreenManagerProvider_sleepWidgetManagerProvider_idsServiceManagerProvider_diagnosticsProvider_systemMonitorProvider_assertionManager_timeChangeListenerProvider_sensitiveUIMonitorProvider_analyticsManagerProvider_userDefaults_fileManager_currentDateProvider_defaultCallbackScheduler_mutexGenerator_, v3, 0, 0, 0, &__block_literal_global_19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, &__block_literal_global_188_1,
         0,
         0,
         &__block_literal_global_191_0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         v4,
         0,
         v5);

  return v6;
}

HDSPSleepStoreServer *__31__HDSPDisabledEnvironment_init__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepStoreServer *v3;

  v2 = a2;
  v3 = -[HDSPSleepStoreServer initWithEnvironment:]([HDSPSleepStoreServer alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPBiomeManager *__31__HDSPDisabledEnvironment_init__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HDSPBiomeManager *v3;

  v2 = a2;
  v3 = -[HDSPBiomeManager initWithEnvironment:]([HDSPBiomeManager alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPNotificationListener *__31__HDSPDisabledEnvironment_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HDSPNotificationListener *v3;

  v2 = a2;
  v3 = -[HDSPNotificationListener initWithEnvironment:]([HDSPNotificationListener alloc], "initWithEnvironment:", v2);

  return v3;
}

- (void)prepare
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  -[HDSPEnvironment biomeManager](self, "biomeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSPBiomeManager sleepModePublisher](HDSPBiomeManager, "sleepModePublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__HDSPDisabledEnvironment_prepare__block_invoke;
  v6[3] = &unk_24D4E58B8;
  v6[4] = self;
  v5 = (id)objc_msgSend(v3, "subscribe:callback:", v4, v6);

  -[HDSPEnvironment environmentDidBecomeReady](self, "environmentDidBecomeReady");
}

void __34__HDSPDisabledEnvironment_prepare__block_invoke()
{
  NSObject *v0;
  id v1;
  int v2;
  id v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v2 = 138543362;
    v3 = (id)objc_opt_class();
    v1 = v3;
    _os_log_impl(&dword_21610C000, v0, OS_LOG_TYPE_DEFAULT, "[%{public}@] dropping Biome callback", (uint8_t *)&v2, 0xCu);

  }
}

- (BOOL)isDisabled
{
  return 1;
}

@end
