@implementation HDSPSleepLockScreenManager

- (HDSPSleepLockScreenManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepLockScreenAssertionManager *v5;
  HDSPSleepLockScreenManager *v6;

  v4 = a3;
  v5 = -[HDSPSleepLockScreenAssertionManager initWithEnvironment:]([HDSPSleepLockScreenAssertionManager alloc], "initWithEnvironment:", v4);
  v6 = -[HDSPSleepLockScreenManager initWithEnvironment:assertionManager:](self, "initWithEnvironment:assertionManager:", v4, v5);

  return v6;
}

- (HDSPSleepLockScreenManager)initWithEnvironment:(id)a3 assertionManager:(id)a4
{
  id v6;
  id v7;
  HDSPSleepLockScreenManager *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void (**v12)(void);
  uint64_t v13;
  HKSPMutexProvider *mutexProvider;
  HDSPSleepLockScreenStateMachine *v15;
  objc_class *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  HDSPSleepLockScreenStateMachine *stateMachine;
  HDSPSleepLockScreenManager *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  HDSPSleepLockScreenManager *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v26.receiver = self;
  v26.super_class = (Class)HDSPSleepLockScreenManager;
  v8 = -[HDSPSleepLockScreenManager init](&v26, sel_init);
  if (v8)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v28 = v10;
      v29 = 2048;
      v30 = v8;
      v11 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v8->_assertionManager, a4);
    -[HDSPSleepLockScreenAssertionManager setDelegate:](v8->_assertionManager, "setDelegate:", v8);
    objc_msgSend(v6, "mutexGenerator");
    v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v12[2]();
    v13 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v8->_mutexProvider;
    v8->_mutexProvider = (HKSPMutexProvider *)v13;

    v15 = [HDSPSleepLockScreenStateMachine alloc];
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v6, "userDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v18, "initWithUserDefaults:", v19);
    objc_msgSend(v6, "currentDateProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[HDSPSleepLockScreenStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v15, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v17, v20, v8, v8, v21);
    stateMachine = v8->_stateMachine;
    v8->_stateMachine = (HDSPSleepLockScreenStateMachine *)v22;

    v24 = v8;
  }

  return v8;
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
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = (id)objc_opt_class();
    v6 = v16;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v4, "sleepModeManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduleModelManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_msgSend(v4, "goodMorningAlertManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addProvider:", self);

  objc_msgSend(v4, "timeChangeListener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addEventHandler:", self);

  objc_msgSend(v4, "sleepScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addEventProvider:", self);

  objc_msgSend(v4, "sensitiveUIMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "addObserver:", self);
}

- (void)environmentDidBecomeReady:(id)a3
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
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentDidBecomeReady", buf, 0xCu);

  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__HDSPSleepLockScreenManager_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v6);
}

uint64_t __56__HDSPSleepLockScreenManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "updateState");
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[7];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    NSStringFromHKSPSleepMode();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode did change: %{public}@ (%{public}@)", buf, 0x20u);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__HDSPSleepLockScreenManager_sleepModeDidChange_previousMode_reason___block_invoke;
  v13[3] = &unk_24D4E3CC0;
  v13[4] = self;
  v13[5] = a3;
  v13[6] = a5;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v13);
}

void __69__HDSPSleepLockScreenManager_sleepModeDidChange_previousMode_reason___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepModeDidChange:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepSettings:(id)a4
{
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v9 = (id)objc_opt_class();
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep settings did change", buf, 0xCu);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__HDSPSleepLockScreenManager_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke;
  v7[3] = &unk_24D4E3498;
  v7[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v7);
}

void __79__HDSPSleepLockScreenManager_sleepScheduleModelManager_didUpdateSleepSettings___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateState");

}

- (void)presentAlertForGoodMorning
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] present the good morning alert", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__HDSPSleepLockScreenManager_presentAlertForGoodMorning__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v5);
}

void __56__HDSPSleepLockScreenManager_presentAlertForGoodMorning__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentAlertForGoodMorning");

}

- (void)dismissAlertForGoodMorning
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] dismiss the good morning alert", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __56__HDSPSleepLockScreenManager_dismissAlertForGoodMorning__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v5);
}

void __56__HDSPSleepLockScreenManager_dismissAlertForGoodMorning__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dismissAlertForGoodMorning");

}

- (void)sleepLockScreenStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  NSObject *v7;
  id v8;
  int v9;
  id v10;
  __int16 v11;
  int64_t v12;
  __int16 v13;
  int64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543874;
    v10 = (id)objc_opt_class();
    v11 = 2048;
    v12 = a3;
    v13 = 2048;
    v14 = a4;
    v8 = v10;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepLockScreenStateDidChange: %ld previousState: %ld", (uint8_t *)&v9, 0x20u);

  }
  self->_state = a3;
  -[HDSPSleepLockScreenManager _lock_updateLockScreenAssertion](self, "_lock_updateLockScreenAssertion");
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
  -[HDSPSleepLockScreenManager sleepEventDelegate](self, "sleepEventDelegate");
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
  -[HDSPSleepLockScreenManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderCancelledEvents:", self);

}

- (BOOL)_lock_shouldShowLockScreenForState:(int64_t)a3
{
  return (unint64_t)(a3 - 1) < 3;
}

- (void)_lock_updateLockScreenAssertion
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  NSDictionary *overrideUserInfo;
  NSDictionary *v19;
  _BOOL4 v20;
  HDSPSleepLockScreenAssertionManager *assertionManager;
  void (**didUpdateAlertAssertion)(id, int64_t);
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sleepModeOptions");

  v8 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v8, "sleepModeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "sleepMode");

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v13 = (void *)MEMORY[0x24BDD16E0];
    v14 = v12;
    objc_msgSend(v13, "numberWithBool:", (v7 >> 14) & 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10 != 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v12;
    v25 = 2112;
    v26 = v15;
    v27 = 2112;
    v28 = v16;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] updating assertion, sleep screen enabled: %@, sleep mode on: %@", (uint8_t *)&v23, 0x20u);

  }
  v17 = -[HDSPSleepLockScreenManager _lock_resolvedLockScreenState](self, "_lock_resolvedLockScreenState");
  if (-[HDSPSleepLockScreenManager _lock_overridingLockScreenState](self, "_lock_overridingLockScreenState"))
    overrideUserInfo = self->_overrideUserInfo;
  else
    overrideUserInfo = 0;
  v19 = overrideUserInfo;
  v20 = -[HDSPSleepLockScreenManager _lock_shouldShowLockScreenForState:](self, "_lock_shouldShowLockScreenForState:", v17);
  assertionManager = self->_assertionManager;
  if (v20)
  {
    -[HDSPSleepLockScreenAssertionManager takeAssertionIfNeeded](assertionManager, "takeAssertionIfNeeded");
    -[HDSPSleepLockScreenAssertionManager sendLockScreenState:userInfo:](self->_assertionManager, "sendLockScreenState:userInfo:", v17, v19);
  }
  else
  {
    -[HDSPSleepLockScreenAssertionManager invalidateAssertion](assertionManager, "invalidateAssertion");
  }
  didUpdateAlertAssertion = (void (**)(id, int64_t))self->_didUpdateAlertAssertion;
  if (didUpdateAlertAssertion)
    didUpdateAlertAssertion[2](didUpdateAlertAssertion, v17);

}

- (BOOL)_lock_overridingLockScreenState
{
  return self->_overrideState != 0;
}

- (int64_t)_lock_resolvedLockScreenState
{
  _BOOL4 v3;
  uint64_t v4;

  v3 = -[HDSPSleepLockScreenManager _lock_overridingLockScreenState](self, "_lock_overridingLockScreenState");
  v4 = 8;
  if (v3)
    v4 = 16;
  return *(int64_t *)((char *)&self->super.isa + v4);
}

- (void)sensitiveUIStateChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__HDSPSleepLockScreenManager_sensitiveUIStateChanged__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v2);
}

uint64_t __53__HDSPSleepLockScreenManager_sensitiveUIStateChanged__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateLockScreenAssertion");
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
  v6[2] = __60__HDSPSleepLockScreenManager_significantTimeChangeDetected___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v6);
}

void __60__HDSPSleepLockScreenManager_significantTimeChangeDetected___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateState");

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
  v6[2] = __53__HDSPSleepLockScreenManager_timeZoneChangeDetected___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v6);
}

void __53__HDSPSleepLockScreenManager_timeZoneChangeDetected___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "updateState");

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

- (int64_t)sleepMode
{
  id WeakRetained;
  void *v3;
  int64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sleepMode");

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

- (BOOL)isLockScreenActive
{
  return -[HDSPSleepLockScreenAssertionManager hasLockScreenConnection](self->_assertionManager, "hasLockScreenConnection");
}

- (int64_t)currentLockScreenState
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
  v4[2] = __52__HDSPSleepLockScreenManager_currentLockScreenState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __52__HDSPSleepLockScreenManager_currentLockScreenState__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_lock_resolvedLockScreenState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)overrideLockScreenState:(int64_t)a3 userInfo:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  int64_t v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHKSPSleepLockScreenState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v16 = v8;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] overriding lock screen state: %@ (userInfo: %@)", buf, 0x20u);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __63__HDSPSleepLockScreenManager_overrideLockScreenState_userInfo___block_invoke;
  v12[3] = &unk_24D4E3D10;
  v13 = v6;
  v14 = a3;
  v12[4] = self;
  v11 = v6;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v12);

}

uint64_t __63__HDSPSleepLockScreenManager_overrideLockScreenState_userInfo___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = *(_QWORD *)(a1 + 48);
  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateLockScreenAssertion");
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
  v10[2] = __46__HDSPSleepLockScreenManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_24D4E3680;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v10);

}

void __46__HDSPSleepLockScreenManager_sleepEventIsDue___block_invoke(uint64_t a1)
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
  block[2] = __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8EA8 != -1)
    dispatch_once(&qword_253DE8EA8, block);
  return (id)_MergedGlobals_10;
}

void __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke(uint64_t a1)
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
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = (id)MEMORY[0x24BDBD1A8];
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke_187;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = v1;
  v4[5] = &v5;
  objc_msgSend(v1, "_withLock:", v4);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = v2;

  _Block_object_dispose(&v5, 8);
}

void __46__HDSPSleepLockScreenManager_eventIdentifiers__block_invoke_187(uint64_t a1)
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
  v18 = __Block_byref_object_copy__1;
  v19 = __Block_byref_object_dispose__1;
  v20 = (id)MEMORY[0x24BDBD1A8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__HDSPSleepLockScreenManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_24D4E3D38;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v12);
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

void __57__HDSPSleepLockScreenManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
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

- (void)lockScreenDidConnect
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __50__HDSPSleepLockScreenManager_lockScreenDidConnect__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v2);
}

uint64_t __50__HDSPSleepLockScreenManager_lockScreenDidConnect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_updateLockScreenAssertion");
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
  v8 = __Block_byref_object_copy__1;
  v9 = __Block_byref_object_dispose__1;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __43__HDSPSleepLockScreenManager__currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepLockScreenManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __43__HDSPSleepLockScreenManager__currentState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "currentState");
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
  -[HDSPSleepLockScreenManager _currentState](self, "_currentState");
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

- (HDSPSleepLockScreenStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HDSPSleepLockScreenAssertionManager)assertionManager
{
  return self->_assertionManager;
}

- (void)setCurrentLockScreenState:(int64_t)a3
{
  self->_currentLockScreenState = a3;
}

- (id)didUpdateAlertAssertion
{
  return self->_didUpdateAlertAssertion;
}

- (void)setDidUpdateAlertAssertion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateAlertAssertion, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_overrideUserInfo, 0);
}

@end
