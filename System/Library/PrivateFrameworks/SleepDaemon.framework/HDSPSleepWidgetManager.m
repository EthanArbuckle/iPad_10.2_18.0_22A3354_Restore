@implementation HDSPSleepWidgetManager

- (HDSPSleepWidgetManager)initWithEnvironment:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  HDSPSleepWidgetManager *v9;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  if ((objc_msgSend(v4, "isUnitTestEnvironment") & 1) != 0)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BEA9958]);
    v8 = objc_alloc(MEMORY[0x24BEA9968]);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__HDSPSleepWidgetManager_initWithEnvironment___block_invoke;
    v11[3] = &unk_24D4E3498;
    v5 = v7;
    v12 = v5;
    v6 = (void *)objc_msgSend(v8, "initWithInterval:executeBlock:", v11, 1.0);

  }
  v9 = -[HDSPSleepWidgetManager initWithEnvironment:widgetManager:reloadThrottler:](self, "initWithEnvironment:widgetManager:reloadThrottler:", v4, v5, v6);

  return v9;
}

uint64_t __46__HDSPSleepWidgetManager_initWithEnvironment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadWidgetsWithReason:", 4);
}

- (HDSPSleepWidgetManager)initWithEnvironment:(id)a3 widgetManager:(id)a4 reloadThrottler:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSPSleepWidgetManager *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void (**v15)(void);
  uint64_t v16;
  HKSPMutexProvider *mutexProvider;
  HDSPSleepWidgetStateMachine *v18;
  objc_class *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  HDSPSleepWidgetStateMachine *stateMachine;
  HDSPSleepWidgetManager *v27;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  HDSPSleepWidgetManager *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v29.receiver = self;
  v29.super_class = (Class)HDSPSleepWidgetManager;
  v11 = -[HDSPSleepWidgetManager init](&v29, sel_init);
  if (v11)
  {
    HKSPLogForCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v31 = v13;
      v32 = 2048;
      v33 = v11;
      v14 = v13;
      _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v11->_widgetManager, a4);
    -[HKSPSleepWidgetManager setDelegate:](v11->_widgetManager, "setDelegate:", v11);
    objc_storeStrong((id *)&v11->_reloadThrottler, a5);
    objc_msgSend(v8, "mutexGenerator");
    v15 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v15[2]();
    v16 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v11->_mutexProvider;
    v11->_mutexProvider = (HKSPMutexProvider *)v16;

    v18 = [HDSPSleepWidgetStateMachine alloc];
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v8, "userDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithUserDefaults:", v22);
    objc_msgSend(v8, "currentDateProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[HDSPSleepWidgetStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v18, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v20, v23, v11, v11, v24);
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (HDSPSleepWidgetStateMachine *)v25;

    v27 = v11;
  }

  return v11;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
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
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = (id)objc_opt_class();
    v6 = v15;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v14, 0xCu);

  }
  objc_msgSend(v4, "sleepModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduleModelManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_msgSend(v4, "sleepCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addEventHandler:", self);

  objc_msgSend(v4, "sleepScheduler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEventProvider:", self);

  objc_msgSend(v4, "timeChangeListener");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addProvider:", self);
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
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPSleepWidgetManager updateState](self, "updateState");
}

- (void)updateState
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __37__HDSPSleepWidgetManager_updateState__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v2);
}

uint64_t __37__HDSPSleepWidgetManager_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "updateState");
}

- (int64_t)currentSleepWidgetState
{
  int64_t v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepWidgetManager_currentSleepWidgetState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __49__HDSPSleepWidgetManager_currentSleepWidgetState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lock_currentSleepWidgetState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_lock_currentSleepWidgetState
{
  NSObject *v3;
  id v4;
  void *v6;
  int64_t v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (self->_isOverridingWidgetState)
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v4 = v9;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] overriding widget state", (uint8_t *)&v8, 0xCu);

    }
    return self->_overrideState;
  }
  else
  {
    -[HKSPStateMachine currentState](self->_stateMachine, "currentState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "widgetState");

    return v7;
  }
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v7 = v12;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule model did change", buf, 0xCu);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __80__HDSPSleepWidgetManager_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke;
  v9[3] = &unk_24D4E3680;
  v9[4] = self;
  v10 = v5;
  v8 = v5;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v9);

}

uint64_t __80__HDSPSleepWidgetManager_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sleepScheduleModelDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v7;
  id v8;
  _QWORD v9[6];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v11 = (id)objc_opt_class();
    v8 = v11;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule state did change", buf, 0xCu);

  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__HDSPSleepWidgetManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
  v9[3] = &unk_24D4E3DB0;
  v9[4] = self;
  v9[5] = a3;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v9);
}

uint64_t __75__HDSPSleepWidgetManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sleepScheduleStateDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  NSObject *v8;
  id v9;
  _QWORD v10[7];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v9 = v12;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode did change", buf, 0xCu);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__HDSPSleepWidgetManager_sleepModeDidChange_previousMode_reason___block_invoke;
  v10[3] = &unk_24D4E3CC0;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a5;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v10);
}

uint64_t __65__HDSPSleepWidgetManager_sleepModeDidChange_previousMode_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "sleepModeDidChange:isUserRequested:", *(_QWORD *)(a1 + 40), HKSPSleepModeChangeReasonTreatedAsUserRequested());
}

- (void)significantTimeChangeDetected:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] significantTimeChangeDetected", buf, 0xCu);

  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__HDSPSleepWidgetManager_significantTimeChangeDetected___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v6);
}

uint64_t __56__HDSPSleepWidgetManager_significantTimeChangeDetected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "significantTimeChangeOccurred");
}

- (void)timeZoneChangeDetected:(id)a3
{
  NSObject *v4;
  id v5;
  _QWORD v6[5];
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v8 = (id)objc_opt_class();
    v5 = v8;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] timeZoneChangeDetected", buf, 0xCu);

  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __49__HDSPSleepWidgetManager_timeZoneChangeDetected___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v6);
}

uint64_t __49__HDSPSleepWidgetManager_timeZoneChangeDetected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "significantTimeChangeOccurred");
}

- (void)sleepWidgetStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a3 != a4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_opt_class();
      v7 = v6;
      NSStringFromHKSPSleepWidgetState();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPSleepWidgetManager environment](self, "environment");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "currentContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "source");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543874;
      v13 = v6;
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v11;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepWidgetStateDidChange: %{public}@ (%{public}@)", (uint8_t *)&v12, 0x20u);

    }
    -[HKSPThrottler execute](self->_reloadThrottler, "execute");
    -[HKSPSleepWidgetManager invalidateRelevances](self->_widgetManager, "invalidateRelevances");
  }
}

- (void)sleepWidgetShouldReload
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    -[HDSPSleepWidgetManager environment](self, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "source");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v4;
    v11 = 2114;
    v12 = v8;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepWidgetShouldReload (%{public}@)", (uint8_t *)&v9, 0x16u);

  }
  -[HKSPThrottler execute](self->_reloadThrottler, "execute");
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
  -[HDSPSleepWidgetManager sleepEventDelegate](self, "sleepEventDelegate");
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
  -[HDSPSleepWidgetManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderCancelledEvents:", self);

}

- (NAScheduler)callbackScheduler
{
  void *v2;
  void *v3;

  -[HDSPSleepWidgetManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultCallbackScheduler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NAScheduler *)v3;
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

- (BOOL)inUnscheduledSleepMode
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "inUnscheduledSleepMode");

  return v4;
}

- (BOOL)isOnboarded
{
  void *v2;
  void *v3;
  char v4;

  -[HDSPSleepWidgetManager sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepEventRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnySleepCoachingOnboardingCompleted");

  return v4;
}

- (BOOL)shouldReloadWidgetOfKind:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BEA9748]);
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
  v10[2] = __42__HDSPSleepWidgetManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_24D4E3680;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v10);

}

void __42__HDSPSleepWidgetManager_sleepEventIsDue___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stateWithIdentifierDidExpire:", v2);

}

- (id)eventIdentifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8EB8 != -1)
    dispatch_once(&qword_253DE8EB8, block);
  return (id)_MergedGlobals_11;
}

void __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke(uint64_t a1)
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
  v8 = __Block_byref_object_copy__3;
  v9 = __Block_byref_object_dispose__3;
  v10 = (id)MEMORY[0x24BDBD1A8];
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke_187;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = v1;
  v4[5] = &v5;
  objc_msgSend(v1, "_withLock:", v4);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_11;
  _MergedGlobals_11 = v2;

  _Block_object_dispose(&v5, 8);
}

void __42__HDSPSleepWidgetManager_eventIdentifiers__block_invoke_187(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "scheduledExpirationStateIdentifiers");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

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
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = (id)MEMORY[0x24BDBD1A8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__HDSPSleepWidgetManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_24D4E3D38;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v12);
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

void __53__HDSPSleepWidgetManager_upcomingEventsDueAfterDate___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 16), "currentStateExpirationDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hksp_isAfterDate:", a1[5]))
  {
    v3 = (void *)MEMORY[0x24BEA98F8];
    objc_msgSend(*(id *)(a1[4] + 16), "currentStateIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sleepEventWithIdentifier:dueDate:", v4, v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

- (void)overrideWidgetState:(int64_t)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepWidgetManager_overrideWidgetState___block_invoke;
  v4[3] = &unk_24D4E3DB0;
  v4[4] = self;
  v4[5] = a3;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v4);
  -[HKSPThrottler execute](self->_reloadThrottler, "execute");
}

uint64_t __46__HDSPSleepWidgetManager_overrideWidgetState___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 48) = *(_QWORD *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 1;
  return result;
}

- (void)clearWidgetOverrideState
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__HDSPSleepWidgetManager_clearWidgetOverrideState__block_invoke;
  v3[3] = &unk_24D4E3498;
  v3[4] = self;
  -[HDSPSleepWidgetManager _withLock:](self, "_withLock:", v3);
  -[HKSPThrottler execute](self->_reloadThrottler, "execute");
}

uint64_t __50__HDSPSleepWidgetManager_clearWidgetOverrideState__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 40) = 0;
  return result;
}

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepWidgetManager currentSleepWidgetState](self, "currentSleepWidgetState");
  NSStringFromHKSPSleepWidgetState();
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

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_reloadThrottler, 0);
  objc_storeStrong((id *)&self->_widgetManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
}

@end
