@implementation HDSPGoodMorningAlertManager

- (HDSPGoodMorningAlertManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPGoodMorningAlertManager *v5;
  HDSPGoodMorningAlertManager *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HKSPObserverSet *goodMorningAlertObservers;
  void (**v11)(void);
  uint64_t v12;
  HKSPMutexProvider *mutexProvider;
  HDSPGoodMorningAlertStateMachine *v14;
  objc_class *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  HDSPGoodMorningAlertStateMachine *stateMachine;
  HDSPGoodMorningAlertManager *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HDSPGoodMorningAlertManager;
  v5 = -[HDSPGoodMorningAlertManager init](&v25, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_environment, v4);
    v7 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v4, "defaultCallbackScheduler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithCallbackScheduler:", v8);
    goodMorningAlertObservers = v6->_goodMorningAlertObservers;
    v6->_goodMorningAlertObservers = (HKSPObserverSet *)v9;

    objc_msgSend(v4, "mutexGenerator");
    v11 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v11[2]();
    v12 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v6->_mutexProvider;
    v6->_mutexProvider = (HKSPMutexProvider *)v12;

    v14 = [HDSPGoodMorningAlertStateMachine alloc];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v4, "userDefaults");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithUserDefaults:", v18);
    objc_msgSend(v4, "currentDateProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[HDSPGoodMorningAlertStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v14, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v16, v19, v6, v6, v20);
    stateMachine = v6->_stateMachine;
    v6->_stateMachine = (HDSPGoodMorningAlertStateMachine *)v21;

    v23 = v6;
  }

  return v6;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
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

  objc_msgSend(v4, "sleepCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEventHandler:", self);

  objc_msgSend(v4, "sleepScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEventProvider:", self);

  objc_msgSend(v4, "actionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addProvider:", self);
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
  v5[2] = __42__HDSPGoodMorningAlertManager_updateState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPGoodMorningAlertManager _withLock:](self, "_withLock:", v5);
}

uint64_t __42__HDSPGoodMorningAlertManager_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState");
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_goodMorningAlertObservers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_goodMorningAlertObservers, "removeObserver:", a3);
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
  -[HDSPGoodMorningAlertManager updateState](self, "updateState");
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
  -[HDSPGoodMorningAlertManager updateState](self, "updateState");

}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(uint64_t);
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138544130;
    v18 = v8;
    v19 = 2114;
    v20 = v10;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged from %{public}@ to %{public}@ for %{public}@", buf, 0x2Au);

  }
  if (a3 == 2)
  {
    v15 = MEMORY[0x24BDAC760];
    v13 = __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2;
    v14 = &v15;
    goto LABEL_8;
  }
  if (a3 == 1 && HKSPSleepScheduleStateChangeReasonIsExpected())
  {
    v16 = MEMORY[0x24BDAC760];
    v13 = __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
    v14 = &v16;
LABEL_8:
    v14[1] = 3221225472;
    v14[2] = (uint64_t)v13;
    v14[3] = (uint64_t)&unk_24D4E3498;
    v14[4] = (uint64_t)self;
    -[HDSPGoodMorningAlertManager _withLock:](self, "_withLock:", v15);
  }
}

uint64_t __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sleepScheduleStateChangedToWakeUp");
}

uint64_t __80__HDSPGoodMorningAlertManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "sleepScheduleStateChangedToBedtime");
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
  v18 = __Block_byref_object_copy__18;
  v19 = __Block_byref_object_dispose__18;
  v20 = (id)MEMORY[0x24BDBD1A8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __58__HDSPGoodMorningAlertManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_24D4E3D38;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[HDSPGoodMorningAlertManager _withLock:](self, "_withLock:", v12);
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

void __58__HDSPGoodMorningAlertManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
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
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ expired", buf, 0x16u);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__HDSPGoodMorningAlertManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_24D4E3680;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HDSPGoodMorningAlertManager _withLock:](self, "_withLock:", v10);

}

void __47__HDSPGoodMorningAlertManager_sleepEventIsDue___block_invoke(uint64_t a1)
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
  block[2] = __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8F38 != -1)
    dispatch_once(&qword_253DE8F38, block);
  return (id)_MergedGlobals_19;
}

void __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
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
  v8 = __Block_byref_object_copy__18;
  v9 = __Block_byref_object_dispose__18;
  v10 = (id)MEMORY[0x24BDBD1A8];
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke_2;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = v1;
  v4[5] = &v5;
  objc_msgSend(v1, "_withLock:", v4);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_19;
  _MergedGlobals_19 = v2;

  _Block_object_dispose(&v5, 8);
}

void __47__HDSPGoodMorningAlertManager_eventIdentifiers__block_invoke_2(uint64_t a1)
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

- (void)goodMorningWasDismissed
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] goodMorningWasDismissed", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPGoodMorningAlertManager updateState](self, "updateState");
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

- (BOOL)goodMorningAlertEnabled
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  int v14;
  BOOL v15;

  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hksp_supportsGoodMorningAlerts");

  if (!v6)
    return 0;
  v7 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v7, "behavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isAppleWatch");

  if (!v9)
  {
    v12 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v12, "behavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "hksp_supportsSleepLockScreen");

    if (v14)
    {
      -[HDSPGoodMorningAlertManager sleepScheduleModel](self, "sleepScheduleModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "goodMorningScreenEnabledWithLogObject:", self);
      goto LABEL_6;
    }
    return 0;
  }
  -[HDSPGoodMorningAlertManager sleepScheduleModel](self, "sleepScheduleModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "goodMorningAlertNotificationsEnabledWithLogObject:", self);
LABEL_6:
  v15 = v11;

  return v15;
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

- (BOOL)isAppleWatch
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  return v4;
}

- (BOOL)isOnCharger
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "systemMonitor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "devicePowerMonitor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCharging");

  return v5;
}

- (void)presentAlertForGoodMorning
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling observers to present good morning alert", (uint8_t *)&v5, 0xCu);

  }
  -[HKSPObserverSet enumerateObserversWithBlock:](self->_goodMorningAlertObservers, "enumerateObserversWithBlock:", &__block_literal_global_21);
}

uint64_t __57__HDSPGoodMorningAlertManager_presentAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentAlertForGoodMorning");
}

- (void)dismissAlertForGoodMorning
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] telling observers to dismiss good morning alert", (uint8_t *)&v5, 0xCu);

  }
  -[HKSPObserverSet enumerateObserversWithBlock:](self->_goodMorningAlertObservers, "enumerateObserversWithBlock:", &__block_literal_global_190_2);
}

uint64_t __57__HDSPGoodMorningAlertManager_dismissAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dismissAlertForGoodMorning");
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
  -[HDSPGoodMorningAlertManager sleepEventDelegate](self, "sleepEventDelegate");
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
  -[HDSPGoodMorningAlertManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderCancelledEvents:", self);

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
  v8 = __Block_byref_object_copy__18;
  v9 = __Block_byref_object_dispose__18;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__HDSPGoodMorningAlertManager__currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPGoodMorningAlertManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __44__HDSPGoodMorningAlertManager__currentState__block_invoke(uint64_t a1)
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
  -[HDSPGoodMorningAlertManager _currentState](self, "_currentState");
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

- (HDSPGoodMorningAlertStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPObserverSet)goodMorningAlertObservers
{
  return self->_goodMorningAlertObservers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_goodMorningAlertObservers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
