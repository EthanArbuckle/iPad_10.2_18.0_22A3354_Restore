@implementation HDSPSleepNotificationManager

- (HDSPSleepNotificationManager)initWithEnvironment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  int v7;
  HDSPUserNotificationCenter *v8;
  void *v9;
  int v10;
  HDSPCFUserNotificationCenter *v11;
  void *v12;
  int v13;
  HDSPDarwinNotificationCenter *v14;
  HDSPSleepNotificationManager *v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hksp_supportsUserNotificationCenter");

  if (v7)
  {
    v8 = -[HDSPUserNotificationCenter initWithEnvironment:]([HDSPUserNotificationCenter alloc], "initWithEnvironment:", v4);
    objc_msgSend(v5, "addObject:", v8);

  }
  objc_msgSend(v4, "behavior");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hksp_supportsCFUserNotifications");

  if (v10)
  {
    v11 = -[HDSPCFUserNotificationCenter initWithEnvironment:]([HDSPCFUserNotificationCenter alloc], "initWithEnvironment:", v4);
    objc_msgSend(v5, "addObject:", v11);

  }
  objc_msgSend(v4, "behavior");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAppleWatch");

  if (v13)
  {
    v14 = -[HDSPDarwinNotificationCenter initWithEnvironment:]([HDSPDarwinNotificationCenter alloc], "initWithEnvironment:", v4);
    objc_msgSend(v5, "addObject:", v14);

  }
  v15 = -[HDSPSleepNotificationManager initWithEnvironment:notificationPublishers:](self, "initWithEnvironment:notificationPublishers:", v4, v5);

  return v15;
}

- (HDSPSleepNotificationManager)initWithEnvironment:(id)a3 notificationPublishers:(id)a4
{
  id v6;
  id v7;
  HDSPSleepNotificationManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  HDSPSleepNotificationManager *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  HDSPSleepNotificationManager *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HDSPSleepNotificationManager;
  v8 = -[HDSPSleepNotificationManager init](&v14, sel_init);
  if (v8)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2048;
      v18 = v8;
      v11 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v8->_notificationPublishers, a4);
    v12 = v8;
  }

  return v8;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSArray *notificationPublishers;
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = (id)objc_opt_class();
    v6 = v21;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", buf, 0xCu);

  }
  objc_msgSend(v4, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEventHandler:", self);

  objc_msgSend(v4, "sleepScheduler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEventProvider:", self);

  objc_msgSend(v4, "actionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  objc_msgSend(v4, "sleepCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", self);

  objc_msgSend(v4, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isAppleWatch");

  if (v14)
  {
    objc_msgSend(v4, "goodMorningAlertManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", self);

  }
  notificationPublishers = self->_notificationPublishers;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __59__HDSPSleepNotificationManager_environmentWillBecomeReady___block_invoke;
  v18[3] = &unk_24D4E59A8;
  v19 = v4;
  v17 = v4;
  -[NSArray na_each:](notificationPublishers, "na_each:", v18);

}

void __59__HDSPSleepNotificationManager_environmentWillBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "environmentWillBecomeReady:", *(_QWORD *)(a1 + 32));

}

- (void)environmentDidBecomeReady:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSArray *notificationPublishers;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", buf, 0xCu);

  }
  notificationPublishers = self->_notificationPublishers;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__HDSPSleepNotificationManager_environmentDidBecomeReady___block_invoke;
  v9[3] = &unk_24D4E4968;
  v10 = v4;
  v8 = v4;
  -[NSArray na_each:](notificationPublishers, "na_each:", v9);
  -[HDSPSleepNotificationManager _rescheduleEvents](self, "_rescheduleEvents");

}

void __58__HDSPSleepNotificationManager_environmentDidBecomeReady___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "environmentDidBecomeReady:", *(_QWORD *)(a1 + 32));

}

- (void)publishNotificationForEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSArray *notificationPublishers;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v4;
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] publishNotificationForEvent: %{public}@", buf, 0x16u);

  }
  notificationPublishers = self->_notificationPublishers;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__HDSPSleepNotificationManager_publishNotificationForEvent___block_invoke;
  v9[3] = &unk_24D4E59D0;
  v10 = v4;
  v8 = v4;
  -[NSArray na_each:](notificationPublishers, "na_each:", v9);

}

uint64_t __60__HDSPSleepNotificationManager_publishNotificationForEvent___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "publishNotificationForEvent:", *(_QWORD *)(a1 + 32));
}

- (void)tearDownNotificationForEventIdentifier:(id)a3
{
  id v4;
  NSArray *notificationPublishers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  notificationPublishers = self->_notificationPublishers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__HDSPSleepNotificationManager_tearDownNotificationForEventIdentifier___block_invoke;
  v7[3] = &unk_24D4E59D0;
  v8 = v4;
  v6 = v4;
  -[NSArray na_each:](notificationPublishers, "na_each:", v7);

}

uint64_t __71__HDSPSleepNotificationManager_tearDownNotificationForEventIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tearDownNotificationForEventIdentifier:", *(_QWORD *)(a1 + 32));
}

- (void)tearDownNotifications
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearDownNotifications", (uint8_t *)&v5, 0xCu);

  }
  -[NSArray na_each:](self->_notificationPublishers, "na_each:", &__block_literal_global_22);
}

uint64_t __53__HDSPSleepNotificationManager_tearDownNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tearDownNotifications");
}

- (NSString)providerIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  -[HDSPSleepNotificationManager _windDownNotificationEventAfterDate:](self, "_windDownNotificationEventAfterDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "na_safeAddObject:", v7);

  -[HDSPSleepNotificationManager _bedtimeNotificationEventAfterDate:](self, "_bedtimeNotificationEventAfterDate:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "na_safeAddObject:", v8);
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

- (void)sleepEventIsDue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _BYTE v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v17 = 138543618;
    *(_QWORD *)&v17[4] = objc_opt_class();
    *(_WORD *)&v17[12] = 2114;
    *(_QWORD *)&v17[14] = v4;
    v6 = *(id *)&v17[4];
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepEventIsDue: %{public}@", v17, 0x16u);

  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEA95A8]))
  {

    goto LABEL_6;
  }
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BEA95E0]);

  if (!v9)
  {
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BEA95C8]);

    if (v11)
    {
      -[HDSPSleepNotificationManager _tearDownWakeDetectionNotification](self, "_tearDownWakeDetectionNotification");
      goto LABEL_17;
    }
    objc_msgSend(v4, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BEA95B0]) & 1) == 0)
    {
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BEA95C0]) & 1) == 0)
      {
        objc_msgSend(v4, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEA95D0]))
        {
          objc_msgSend(v4, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x24BEA95B8]);

          if ((v16 & 1) == 0)
            goto LABEL_17;
          goto LABEL_16;
        }

      }
    }

LABEL_16:
    -[HDSPSleepNotificationManager publishNotificationForEvent:](self, "publishNotificationForEvent:", v4, *(_QWORD *)v17, *(_OWORD *)&v17[8], v18);
    goto LABEL_17;
  }
LABEL_6:
  if (-[HDSPSleepNotificationManager _bedtimeOrWindDownNotificationsEnabled](self, "_bedtimeOrWindDownNotificationsEnabled", *(_OWORD *)v17, *(_QWORD *)&v17[16], v18))
  {
    -[HDSPSleepNotificationManager _bedtimeOrWindDownNotificationEventIsDue:](self, "_bedtimeOrWindDownNotificationEventIsDue:", v4);
  }
LABEL_17:

}

- (id)eventIdentifiers
{
  if (qword_253DE8F48 != -1)
    dispatch_once(&qword_253DE8F48, &__block_literal_global_194_1);
  return (id)_MergedGlobals_20;
}

uint64_t __48__HDSPSleepNotificationManager_eventIdentifiers__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95A8]);
  objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95E0]);
  objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95C8]);
  objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95B0]);
  objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95C0]);
  objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95D0]);
  return objc_msgSend((id)_MergedGlobals_20, "addObject:", *MEMORY[0x24BEA95B8]);
}

- (void)presentAlertForGoodMorning
{
  NSObject *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v4 = v13;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting good morning notification", (uint8_t *)&v12, 0xCu);

  }
  v5 = (void *)MEMORY[0x24BEA98F8];
  v6 = *MEMORY[0x24BEA95B8];
  -[HDSPSleepNotificationManager environment](self, "environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentDateProvider");
  v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepEventWithIdentifier:dueDate:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDSPSleepNotificationManager publishNotificationForEvent:](self, "publishNotificationForEvent:", v11);
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSchedule:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _BYTE v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v8 = 138543618;
    *(_QWORD *)&v8[4] = objc_opt_class();
    *(_WORD *)&v8[12] = 2114;
    *(_QWORD *)&v8[14] = v5;
    v7 = *(id *)&v8[4];
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepSchedule: %{public}@", v8, 0x16u);

  }
  if (!v5 || (objc_msgSend(v5, "isEnabledAndHasOccurrences") & 1) == 0)
    -[HDSPSleepNotificationManager tearDownNotifications](self, "tearDownNotifications", *(_OWORD *)v8, *(_QWORD *)&v8[16], v9);
  -[HDSPSleepNotificationManager _rescheduleEvents](self, "_rescheduleEvents", *(_QWORD *)v8, *(_OWORD *)&v8[8]);

}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHKSPSleepScheduleState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleState();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleStateChangeReason();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138544130;
    v20 = v8;
    v21 = 2114;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    v25 = 2114;
    v26 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged from %{public}@ to %{public}@ for %{public}@", (uint8_t *)&v19, 0x2Au);

  }
  if (a3 == 1)
  {
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      v19 = 138543362;
      v20 = v17;
      v18 = v17;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down notifications at wake up", (uint8_t *)&v19, 0xCu);

    }
    -[HDSPSleepNotificationManager _tearDownWindDownReminder](self, "_tearDownWindDownReminder");
    -[HDSPSleepNotificationManager _tearDownBedtimeReminder](self, "_tearDownBedtimeReminder");
    -[HDSPSleepNotificationManager _tearDownWakeDetectionNotification](self, "_tearDownWakeDetectionNotification");
  }
  else if (a3 == 2)
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_opt_class();
      v19 = 138543362;
      v20 = v14;
      v15 = v14;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down notifications at bedtime", (uint8_t *)&v19, 0xCu);

    }
    -[HDSPSleepNotificationManager _tearDownChargingReminder](self, "_tearDownChargingReminder");
  }
  -[HDSPSleepNotificationManager _rescheduleEvents](self, "_rescheduleEvents");
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
  -[HDSPSleepNotificationManager _rescheduleEvents](self, "_rescheduleEvents");
}

- (void)_tearDownChargingReminder
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down charging reminder", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepNotificationManager tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95B0]);
}

- (void)_tearDownBedtimeReminder
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down bedtime reminder", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepNotificationManager tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95A8]);
}

- (void)_tearDownWindDownReminder
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down wind down reminder", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepNotificationManager tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95E0]);
}

- (void)_tearDownWakeDetectionNotification
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down wake detection notification", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepNotificationManager tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95C0]);
}

- (void)_tearDownMorningNotification
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] tearing down good morning notification", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepNotificationManager tearDownNotificationForEventIdentifier:](self, "tearDownNotificationForEventIdentifier:", *MEMORY[0x24BEA95B8]);
}

- (id)_sleepScheduleModel
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_rescheduleEvents
{
  _BOOL4 v3;
  NSObject *v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = -[HDSPSleepNotificationManager _bedtimeOrWindDownNotificationsEnabled](self, "_bedtimeOrWindDownNotificationsEnabled");
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v6 = v10;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Telling scheduler we have events to schedule", (uint8_t *)&v9, 0xCu);

    }
    -[HDSPSleepNotificationManager sleepEventDelegate](self, "sleepEventDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventProviderHasUpcomingEvents:", self);
  }
  else
  {
    if (v5)
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v8 = v10;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bedtime and wind down notifications disabled", (uint8_t *)&v9, 0xCu);

    }
    -[HDSPSleepNotificationManager sleepEventDelegate](self, "sleepEventDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventProviderCancelledEvents:", self);
  }

}

- (id)_bedtimeNotificationEventAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[HDSPSleepNotificationManager _bedtimeOrWindDownNotificationsEnabled](self, "_bedtimeOrWindDownNotificationsEnabled"))
  {
    -[HDSPSleepNotificationManager _sleepScheduleModel](self, "_sleepScheduleModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95A0], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "dateByAddingTimeInterval:", -*MEMORY[0x24BEA97E8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEA98F8], "sleepEventWithIdentifier:dueDate:expirationDate:isUserVisible:", *MEMORY[0x24BEA95A8], v7, v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_windDownNotificationEventAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[HDSPSleepNotificationManager _bedtimeOrWindDownNotificationsEnabled](self, "_bedtimeOrWindDownNotificationsEnabled"))
  {
    -[HDSPSleepNotificationManager _sleepScheduleModel](self, "_sleepScheduleModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95D8], v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "dateByAddingTimeInterval:", -*MEMORY[0x24BEA97E8]);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BEA98F8], "sleepEventWithIdentifier:dueDate:expirationDate:isUserVisible:", *MEMORY[0x24BEA95E0], v7, v6, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_bedtimeOrWindDownNotificationsEnabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  id v9;
  char v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepNotificationManager _sleepScheduleModel](self, "_sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepNotificationManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isAppleWatch"))
  {

    goto LABEL_7;
  }
  v7 = objc_msgSend(v4, "watchSleepFeaturesEnabled");

  if ((v7 & 1) != 0)
  {
LABEL_7:
    v10 = objc_msgSend(v4, "bedtimeReminders");
    goto LABEL_8;
  }
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v9 = v13;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bedtime and wind down notifications disabled since sleep features are disabled on Watch.", (uint8_t *)&v12, 0xCu);

  }
  v10 = 0;
LABEL_8:

  return v10;
}

- (void)_bedtimeOrWindDownNotificationEventIsDue:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepEventIsDue:", v4);

  v7 = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v7, "sleepCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "currentSleepScheduleState");

  if (v9 <= 6)
  {
    if (((1 << v9) & 0x4D) != 0)
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)objc_opt_class();
        v12 = v11;
        NSStringFromHKSPSleepScheduleState();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138543874;
        v15 = v11;
        v16 = 2114;
        v17 = v4;
        v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ignoring event %{public}@ due to being in current state %{public}@", (uint8_t *)&v14, 0x20u);

      }
    }
    else if (v9 == 1)
    {
      -[HDSPSleepNotificationManager publishNotificationForEvent:](self, "publishNotificationForEvent:", v4);
    }
  }

}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HDSPSleepEventDelegate)sleepEventDelegate
{
  return (HDSPSleepEventDelegate *)objc_loadWeakRetained((id *)&self->_sleepEventDelegate);
}

- (void)setSleepEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sleepEventDelegate, a3);
}

- (NSArray)notificationPublishers
{
  return self->_notificationPublishers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationPublishers, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
