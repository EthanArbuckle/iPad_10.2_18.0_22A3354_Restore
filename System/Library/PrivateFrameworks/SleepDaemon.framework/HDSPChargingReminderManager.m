@implementation HDSPChargingReminderManager

- (HDSPChargingReminderManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPXPCActivityScheduler *v5;
  void *v6;
  HDSPXPCActivityScheduler *v7;
  HDSPChargingReminderManager *v8;

  v4 = a3;
  v5 = [HDSPXPCActivityScheduler alloc];
  objc_msgSend(v4, "defaultCallbackScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPXPCActivityScheduler initWithCallbackScheduler:](v5, "initWithCallbackScheduler:", v6);
  v8 = -[HDSPChargingReminderManager initWithEnvironment:monitoringScheduler:](self, "initWithEnvironment:monitoringScheduler:", v4, v7);

  return v8;
}

- (HDSPChargingReminderManager)initWithEnvironment:(id)a3 monitoringScheduler:(id)a4
{
  id v6;
  id v7;
  HDSPChargingReminderManager *v8;
  HDSPChargingReminderManager *v9;
  void (**v10)(void);
  uint64_t v11;
  HKSPMutexProvider *mutexProvider;
  HDSPChargingReminderStateMachine *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HDSPChargingReminderStateMachine *stateMachine;
  HDSPChargingReminderManager *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDSPChargingReminderManager;
  v8 = -[HDSPChargingReminderManager init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_monitoringScheduler, a4);
    objc_msgSend(v6, "mutexGenerator");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();
    v11 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v9->_mutexProvider;
    v9->_mutexProvider = (HKSPMutexProvider *)v11;

    v13 = [HDSPChargingReminderStateMachine alloc];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v6, "userDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithUserDefaults:", v17);
    objc_msgSend(v6, "currentDateProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDSPChargingReminderStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v13, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v15, v18, v9, v9, v19);
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = (HDSPChargingReminderStateMachine *)v20;

    v22 = v9;
  }

  return v9;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (id)devicePowerMonitor
{
  void *v2;
  void *v3;
  void *v4;

  -[HDSPChargingReminderManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devicePowerMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)environmentWillBecomeReady:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_msgSend(v4, "sleepScheduleModelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEventHandler:", self);

  objc_msgSend(v4, "sleepScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEventProvider:", self);

  objc_msgSend(v4, "sleepCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addProvider:", self);
  -[HDSPChargingReminderManager devicePowerMonitor](self, "devicePowerMonitor");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

}

- (void)environmentDidBecomeReady:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__HDSPChargingReminderManager_environmentDidBecomeReady___block_invoke;
  v3[3] = &unk_24D4E3498;
  v3[4] = self;
  -[HDSPChargingReminderManager _withLock:](self, "_withLock:", v3);
}

uint64_t __57__HDSPChargingReminderManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState");
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
  v5[2] = __42__HDSPChargingReminderManager_updateState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPChargingReminderManager _withLock:](self, "_withLock:", v5);
}

uint64_t __42__HDSPChargingReminderManager_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState");
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v5;
    v7 = v9;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  -[HDSPChargingReminderManager updateState](self, "updateState");

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
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPChargingReminderManager updateState](self, "updateState");
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v7 = v9;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateDidChange", (uint8_t *)&v8, 0xCu);

  }
  -[HDSPChargingReminderManager updateState](self, "updateState");
}

- (void)deviceChangedChargingState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 1024;
    v10 = v3;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] deviceChangedChargingState (isCharging: %d)", (uint8_t *)&v7, 0x12u);

  }
  -[HDSPChargingReminderManager updateState](self, "updateState");
}

- (NSDate)currentDate
{
  id WeakRetained;
  void (**v3)(void);
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "currentDateProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleModel *)v4;
}

- (unint64_t)sleepScheduleState
{
  id WeakRetained;
  void *v3;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentSleepScheduleState");

  return v4;
}

- (BOOL)sleepFeaturesEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "watchSleepFeaturesEnabled");

  return v4;
}

- (id)monitoringWindowAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  double v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  id v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x24BEA95A0];
  objc_msgSend(v5, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95A0], v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "dateByAddingTimeInterval:", -600.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateByAddingTimeInterval:", -3600.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sleepSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "bedtimeReminders"))
    {
      v40 = v9;
      v12 = v11;
      v13 = v8;
      -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sleepSchedule");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "windDownTime");
      v16 = (void *)*MEMORY[0x24BEA95D8];
      if (v17 <= 0.0)
        v16 = v6;
      v18 = v16;
      -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "nextEventWithIdentifier:dueAfterDate:", v18, v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
      {

        v23 = 0;
        v8 = v13;
        v11 = v12;
        v9 = v40;
LABEL_22:

        goto LABEL_23;
      }
      objc_msgSend(v20, "dateByAddingTimeInterval:", -*MEMORY[0x24BEA97E8]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "earlierDate:", v13);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v13;
      v11 = v12;
      v9 = v40;
    }
    else
    {
      v22 = v8;
    }
    if (objc_msgSend(v22, "hksp_isBeforeOrSameAsDate:", v9))
    {
      HKSPLogForCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v43 = (id)objc_opt_class();
        v44 = 2114;
        v45 = v22;
        v46 = 2114;
        v47 = v9;
        v25 = v43;
        _os_log_impl(&dword_21610C000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring monitor end date (%{public}@) before start date (%{public}@)", buf, 0x20u);

      }
      v23 = 0;
    }
    else
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v9, v22);
      HKSPLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_opt_class();
        v39 = v28;
        objc_msgSend(v26, "hkspDescription");
        v41 = v9;
        v29 = v11;
        v30 = v8;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v28;
        v44 = 2114;
        v45 = v31;
        _os_log_impl(&dword_21610C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] monitor window is: %{public}@", buf, 0x16u);

        v8 = v30;
        v11 = v29;
        v9 = v41;

      }
      objc_msgSend(v26, "endDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v4, "hksp_isAfterOrSameAsDate:", v32);

      if (v33)
      {
        HKSPLogForCategory();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543618;
          v43 = v35;
          v44 = 2114;
          v45 = v26;
          v36 = v35;
          _os_log_impl(&dword_21610C000, v34, OS_LOG_TYPE_DEFAULT, "[%{public}@] already passed current window %{public}@", buf, 0x16u);

        }
        -[HDSPChargingReminderManager monitoringWindowAfterDate:](self, "monitoringWindowAfterDate:", v7);
        v37 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v37 = v26;
      }
      v23 = v37;

    }
    goto LABEL_22;
  }
  v23 = 0;
LABEL_23:

  return v23;
}

- (BOOL)isCharging
{
  void *v2;
  char v3;

  -[HDSPChargingReminderManager devicePowerMonitor](self, "devicePowerMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCharging");

  return v3;
}

- (void)startBatteryMonitoring
{
  NSObject *v3;
  id v4;
  HDSPActivityScheduler *monitoringScheduler;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] startBatteryMonitoring", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  monitoringScheduler = self->_monitoringScheduler;
  objc_msgSend((id)objc_opt_class(), "monitorActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__HDSPChargingReminderManager_startBatteryMonitoring__block_invoke;
  v7[3] = &unk_24D4E36A8;
  objc_copyWeak(&v8, (id *)buf);
  -[HDSPActivityScheduler scheduleActivity:activityHandler:](monitoringScheduler, "scheduleActivity:activityHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __53__HDSPChargingReminderManager_startBatteryMonitoring__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkBatteryLevel");

}

+ (id)monitorCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC628]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC598], 1);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A0]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6F8], 0);
  return v2;
}

+ (id)monitorActivity
{
  HDSPXPCActivity *v3;
  void *v4;
  HDSPXPCActivity *v5;

  v3 = [HDSPXPCActivity alloc];
  objc_msgSend(a1, "monitorCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSPXPCActivity initWithEventName:options:criteria:](v3, "initWithEventName:options:criteria:", CFSTR("com.apple.sleep.BatteryMonitoring.activity"), 1, v4);

  return v5;
}

- (void)checkBatteryLevel
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  _QWORD v8[5];
  int v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v4 = v11;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] checkBatteryLevel", buf, 0xCu);

  }
  -[HDSPChargingReminderManager devicePowerMonitor](self, "devicePowerMonitor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "batteryLevel");
  v7 = v6;

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__HDSPChargingReminderManager_checkBatteryLevel__block_invoke;
  v8[3] = &unk_24D4E3EC8;
  v8[4] = self;
  v9 = v7;
  -[HDSPChargingReminderManager _withLock:](self, "_withLock:", v8);
}

uint64_t __48__HDSPChargingReminderManager_checkBatteryLevel__block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "batteryLevelChanged:", a2);
}

- (void)stopBatteryMonitoring
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopBatteryMonitoring", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPActivityScheduler unscheduleActivities](self->_monitoringScheduler, "unscheduleActivities");
}

- (void)scheduleStateExpiration
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we have events to schedule", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPChargingReminderManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderHasUpcomingEvents:", self);

}

- (void)unscheduleStateExpiration
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling scheduler we no longer have events to schedule", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPChargingReminderManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderCancelledEvents:", self);

}

- (NAScheduler)callbackScheduler
{
  void *v2;
  void *v3;

  -[HDSPChargingReminderManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCallbackScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAScheduler *)v3;
}

- (NSString)providerIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)upcomingEventsDueAfterDate:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__4;
  v19 = __Block_byref_object_dispose__4;
  v20 = (id)MEMORY[0x24BDBD1A8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HDSPChargingReminderManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_24D4E3D38;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[HDSPChargingReminderManager _withLock:](self, "_withLock:", v12);
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_opt_class();
    v8 = v16[5];
    *(_DWORD *)buf = 138543618;
    v22 = v7;
    v23 = 2114;
    v24 = v8;
    v9 = v7;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] scheduling expiration of %{public}@", buf, 0x16u);

  }
  v10 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v10;
}

void __58__HDSPChargingReminderManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentStateExpirationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "hksp_isAfterDate:", *(_QWORD *)(a1 + 40)))
  {
    v4 = (void *)MEMORY[0x24BEA98F8];
    objc_msgSend(*(id *)(a1 + 32), "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "currentStateIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleepEventWithIdentifier:dueDate:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v11[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
}

- (void)sleepEventIsDue:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BEA95A0]);

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      *(_DWORD *)buf = 138543362;
      v16 = (id)objc_opt_class();
      v9 = v16;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime", buf, 0xCu);

    }
    -[HDSPChargingReminderManager updateState](self, "updateState");
  }
  else
  {
    if (v8)
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      objc_msgSend(v4, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v10;
      v17 = 2114;
      v18 = v12;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ expired", buf, 0x16u);

    }
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__HDSPChargingReminderManager_sleepEventIsDue___block_invoke;
    v13[3] = &unk_24D4E3680;
    v13[4] = self;
    v14 = v4;
    -[HDSPChargingReminderManager _withLock:](self, "_withLock:", v13);

  }
}

void __47__HDSPChargingReminderManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stateWithIdentifierDidExpire:", v2);

}

- (id)eventIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8EC8 != -1)
    dispatch_once(&qword_253DE8EC8, block);
  return (id)_MergedGlobals_12;
}

void __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = (id)MEMORY[0x24BDBD1A8];
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke_2;
  v6[3] = &unk_24D4E3CE8;
  v6[4] = v1;
  v6[5] = &v7;
  objc_msgSend(v1, "_withLock:", v6);
  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)v8[5], "arrayByAddingObject:", *MEMORY[0x24BEA95A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_12;
  _MergedGlobals_12 = v4;

  _Block_object_dispose(&v7, 8);
}

void __47__HDSPChargingReminderManager_eventIdentifiers__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduledExpirationStateIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)postChargingReminderNotification
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v27 = (id)objc_opt_class();
    v4 = v27;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting battery reminder notification", buf, 0xCu);

  }
  -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sleepTracking");

  -[HDSPChargingReminderManager sleepScheduleModel](self, "sleepScheduleModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPChargingReminderManager currentDate](self, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "nextOccurrenceAfterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "alarmConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEnabled");

  v13 = (void *)MEMORY[0x24BEA98F8];
  v14 = *MEMORY[0x24BEA95B0];
  -[HDSPChargingReminderManager currentDate](self, "currentDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = *MEMORY[0x24BEA9368];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v24[1] = *MEMORY[0x24BEA9380];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sleepEventWithIdentifier:dueDate:context:", v14, v15, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "notifyForOverdueEvents:", v22);

}

- (id)_currentState
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
  v8 = __Block_byref_object_copy__4;
  v9 = __Block_byref_object_dispose__4;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__HDSPChargingReminderManager__currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPChargingReminderManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__HDSPChargingReminderManager__currentState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "currentState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPChargingReminderManager _currentState](self, "_currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Current State: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPChargingReminderStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HDSPActivityScheduler)monitoringScheduler
{
  return self->_monitoringScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringScheduler, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
