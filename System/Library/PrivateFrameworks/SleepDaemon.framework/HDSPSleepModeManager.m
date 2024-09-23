@implementation HDSPSleepModeManager

- (HDSPSleepModeManager)initWithEnvironment:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  HDSPAppPredictionClient *v7;
  HDSPSleepModeManager *v8;

  v4 = (void *)MEMORY[0x24BEA9868];
  v5 = a3;
  objc_msgSend(v4, "sleepFocusConfigurationServiceWithOptions:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPAppPredictionClient initWithSleepFocusModeBridge:]([HDSPAppPredictionClient alloc], "initWithSleepFocusModeBridge:", v6);
  v8 = -[HDSPSleepModeManager initWithEnvironment:sleepFocusModeBridge:sleepProactiveBridge:](self, "initWithEnvironment:sleepFocusModeBridge:sleepProactiveBridge:", v5, v6, v7);

  return v8;
}

- (HDSPSleepModeManager)initWithEnvironment:(id)a3 sleepFocusModeBridge:(id)a4 sleepProactiveBridge:(id)a5
{
  id v8;
  id v9;
  id v10;
  HDSPSleepModeManager *v11;
  HDSPSleepModeManager *v12;
  id v13;
  void *v14;
  uint64_t v15;
  HKSPObserverSet *sleepModeObservers;
  void (**v17)(void);
  uint64_t v18;
  HKSPMutexProvider *mutexProvider;
  HDSPSleepModeStateMachine *v20;
  objc_class *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HDSPSleepModeStateMachine *stateMachine;
  id WeakRetained;
  void *v30;
  void *v31;
  HDSPSleepModeManager *v32;
  id v33;
  HDSPSleepModeManager *v34;
  _QWORD v36[4];
  HDSPSleepModeManager *v37;
  id v38;
  id to;
  objc_super v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v40.receiver = self;
  v40.super_class = (Class)HDSPSleepModeManager;
  v11 = -[HDSPSleepModeManager init](&v40, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_environment, v8);
    objc_storeStrong((id *)&v12->_sleepFocusModeBridge, a4);
    objc_storeStrong((id *)&v12->_sleepProactiveBridge, a5);
    v13 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v8, "defaultCallbackScheduler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithCallbackScheduler:", v14);
    sleepModeObservers = v12->_sleepModeObservers;
    v12->_sleepModeObservers = (HKSPObserverSet *)v15;

    objc_msgSend(v8, "mutexGenerator");
    v17 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v17[2]();
    v18 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v12->_mutexProvider;
    v12->_mutexProvider = (HKSPMutexProvider *)v18;

    v20 = [HDSPSleepModeStateMachine alloc];
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v8, "userDefaults");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithUserDefaults:", v24);
    objc_msgSend(v8, "currentDateProvider");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[HDSPSleepModeStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v20, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v22, v25, v12, v12, v26);
    stateMachine = v12->_stateMachine;
    v12->_stateMachine = (HDSPSleepModeStateMachine *)v27;

    objc_copyWeak(&to, (id *)&v12->_environment);
    WeakRetained = objc_loadWeakRetained((id *)&v12->_environment);
    objc_msgSend(WeakRetained, "biomeManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSPBiomeManager sleepModePublisher](HDSPBiomeManager, "sleepModePublisher");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke;
    v36[3] = &unk_24D4E6530;
    v32 = v12;
    v37 = v32;
    objc_copyWeak(&v38, &to);
    v33 = (id)objc_msgSend(v30, "subscribe:callback:", v31, v36);

    v34 = v32;
    objc_destroyWeak(&v38);

    objc_destroyWeak(&to);
  }

  return v12;
}

void __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = (id)objc_opt_class();
    v13 = 2114;
    v14 = v3;
    v5 = v12;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] received biome event: %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke_192;
  v8[3] = &unk_24D4E3680;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  objc_msgSend(WeakRetained, "performWhenEnvironmentIsReady:", v8);

}

uint64_t __86__HDSPSleepModeManager_initWithEnvironment_sleepFocusModeBridge_sleepProactiveBridge___block_invoke_192(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFocusModeEvent:", *(_QWORD *)(a1 + 40));
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
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543362;
    v12 = (id)objc_opt_class();
    v6 = v12;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v11, 0xCu);

  }
  objc_msgSend(v4, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addProvider:", self);
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
  v6[2] = __50__HDSPSleepModeManager_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v6);
  -[HDSPSleepFocusModeBridge setDelegate:](self->_sleepFocusModeBridge, "setDelegate:", self);
}

uint64_t __50__HDSPSleepModeManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateState");
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
  v5[2] = __35__HDSPSleepModeManager_updateState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v5);
}

uint64_t __35__HDSPSleepModeManager_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateState");
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_sleepModeObservers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_sleepModeObservers, "removeObserver:", a3);
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
  v8 = __Block_byref_object_copy__23;
  v9 = __Block_byref_object_dispose__23;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __36__HDSPSleepModeManager_currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __36__HDSPSleepModeManager_currentState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "currentState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (int64_t)sleepMode
{
  void *v2;
  int64_t v3;

  -[HDSPSleepModeManager currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepMode");

  return v3;
}

- (BOOL)inUnscheduledSleepMode
{
  void *v2;
  char isKindOfClass;

  -[HDSPSleepModeManager currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)setSleepMode:(int64_t)a3
{
  -[HDSPSleepModeManager setSleepMode:reason:](self, "setSleepMode:reason:", a3, 1);
}

- (void)setSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  NSObject *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
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
    v14 = 138543874;
    v15 = v9;
    v16 = 2114;
    v17 = v11;
    v18 = 2114;
    v19 = v12;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] setSleepMode: %{public}@ (%{public}@)", (uint8_t *)&v14, 0x20u);

  }
  -[HDSPSleepModeManager _ensureFocusModeCreatedForSleepMode:reason:](self, "_ensureFocusModeCreatedForSleepMode:reason:", a3, a4);
  switch(a3)
  {
    case 2:
      if (HKSPSleepModeChangeReasonTreatedAsAutomation())
      {
        -[HDSPSleepModeManager _automationTurnedOnSleepModeWithReason:](self, "_automationTurnedOnSleepModeWithReason:", a4);
      }
      else if (HKSPSleepModeChangeReasonTreatedAsUserRequested())
      {
        -[HDSPSleepModeManager _userTurnedOnSleepModeWithReason:](self, "_userTurnedOnSleepModeWithReason:", a4);
      }
      else
      {
        -[HDSPSleepModeManager _sleepModeTurnedOnForUnknownReason](self, "_sleepModeTurnedOnForUnknownReason");
      }
      break;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPSleepModeManager.m"), 174, CFSTR("Unable to set wind down via this method"));

      break;
    case 0:
      if (HKSPSleepModeChangeReasonTreatedAsAutomation())
      {
        -[HDSPSleepModeManager _automationTurnedOffSleepModeWithReason:](self, "_automationTurnedOffSleepModeWithReason:", a4);
      }
      else if (HKSPSleepModeChangeReasonTreatedAsUserRequested())
      {
        -[HDSPSleepModeManager _userTurnedOffSleepModeWithReason:](self, "_userTurnedOffSleepModeWithReason:", a4);
      }
      else
      {
        -[HDSPSleepModeManager _sleepModeTurnedOffForUnknownReason](self, "_sleepModeTurnedOffForUnknownReason");
      }
      break;
  }
}

- (void)_userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__HDSPSleepModeManager__userTurnedOnSleepModeWithReason___block_invoke;
  v3[3] = &unk_24D4E3DB0;
  v3[4] = self;
  v3[5] = a3;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v3);
}

uint64_t __57__HDSPSleepModeManager__userTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "userTurnedOnSleepModeWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_userTurnedOffSleepModeWithReason:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __58__HDSPSleepModeManager__userTurnedOffSleepModeWithReason___block_invoke;
  v3[3] = &unk_24D4E3DB0;
  v3[4] = self;
  v3[5] = a3;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v3);
}

uint64_t __58__HDSPSleepModeManager__userTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "userTurnedOffSleepModeWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__HDSPSleepModeManager__automationTurnedOnSleepModeWithReason___block_invoke;
  v3[3] = &unk_24D4E3DB0;
  v3[4] = self;
  v3[5] = a3;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v3);
}

uint64_t __63__HDSPSleepModeManager__automationTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "automationTurnedOnSleepModeWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_automationTurnedOffSleepModeWithReason:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __64__HDSPSleepModeManager__automationTurnedOffSleepModeWithReason___block_invoke;
  v3[3] = &unk_24D4E3DB0;
  v3[4] = self;
  v3[5] = a3;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v3);
}

uint64_t __64__HDSPSleepModeManager__automationTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "automationTurnedOffSleepModeWithReason:", *(_QWORD *)(a1 + 40));
}

- (void)_sleepModeTurnedOnForUnknownReason
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __58__HDSPSleepModeManager__sleepModeTurnedOnForUnknownReason__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v2);
}

uint64_t __58__HDSPSleepModeManager__sleepModeTurnedOnForUnknownReason__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sleepModeTurnedOnForUnknownReason");
}

- (void)_sleepModeTurnedOffForUnknownReason
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __59__HDSPSleepModeManager__sleepModeTurnedOffForUnknownReason__block_invoke;
  v2[3] = &unk_24D4E3498;
  v2[4] = self;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v2);
}

uint64_t __59__HDSPSleepModeManager__sleepModeTurnedOffForUnknownReason__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sleepModeTurnedOffForUnknownReason");
}

- (void)_handleFocusModeEvent:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (-[HDSPSleepModeManager _shouldHandleBiomeEvent:](self, "_shouldHandleBiomeEvent:"))
  {
    v4 = objc_msgSend((id)objc_opt_class(), "_sleepModeChangeReasonForBiomeReason:source:", objc_msgSend(v6, "updateReason"), objc_msgSend(v6, "updateSource"));
    if (objc_msgSend(v6, "starting"))
      v5 = 2;
    else
      v5 = 0;
    -[HDSPSleepModeManager setSleepMode:reason:](self, "setSleepMode:reason:", v5, v4);
  }

}

- (BOOL)_shouldHandleBiomeEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPSleepModeManager environment](self, "environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "behavior");
  v6 = objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend((id)v6, "isAppleWatch") & 1) != 0)
  {
    -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sleepSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "watchSleepFeaturesEnabled");

    if ((v9 & 1) == 0)
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = (id)objc_opt_class();
        v11 = v17;
        v12 = "[%{public}@] ignoring biome event because sleep features are disabled for this watch";
LABEL_13:
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, 0xCu);

      }
LABEL_14:
      LOBYTE(v6) = 0;
      goto LABEL_19;
    }
  }
  else
  {

  }
  switch(objc_msgSend(v4, "updateReason"))
  {
    case 0u:
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v13 = v17;
      v14 = "[%{public}@] handling biome event for unknown";
      break;
    case 1u:
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v13 = v17;
      v14 = "[%{public}@] handling biome event for user action";
      break;
    case 2u:
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_14;
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v11 = v17;
      v12 = "[%{public}@] ignoring biome event for scheduled";
      goto LABEL_13;
    case 3u:
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        goto LABEL_18;
      v16 = 138543362;
      v17 = (id)objc_opt_class();
      v13 = v17;
      v14 = "[%{public}@] handling biome event for automation";
      break;
    default:
      goto LABEL_20;
  }
  _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0xCu);

LABEL_18:
  LOBYTE(v6) = 1;
LABEL_19:

LABEL_20:
  return v6 & 1;
}

+ (unint64_t)_sleepModeChangeReasonForBiomeReason:(int)a3 source:(int)a4
{
  _QWORD *v4;

  if (a3 == 3)
  {
    if (a4 <= 3)
    {
      v4 = &unk_216185FD8;
      return v4[a4];
    }
  }
  else if (a3 == 1 && a4 < 4)
  {
    v4 = &unk_216185FB8;
    return v4[a4];
  }
  return 10;
}

- (void)_ensureFocusModeCreatedForSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  NSObject *v5;
  BOOL v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  HDSPSleepModeManager *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a3 == 2 && a4 == 5)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode engaged from Hunter watch, making sure focus mode is created", buf, 0xCu);
    }

    v9 = 0;
    v6 = -[HDSPSleepModeManager createFocusModeInState:error:](self, "createFocusModeInState:error:", objc_msgSend(MEMORY[0x24BEA9910], "defaultConfigurationState"), &v9);
    v7 = v9;
    if (!v6)
    {
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v11 = self;
        v12 = 2114;
        v13 = v7;
        _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create focus mode: %{public}@", buf, 0x16u);
      }

    }
  }
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
  -[HDSPSleepModeManager _createFocusModeIfNeeded](self, "_createFocusModeIfNeeded");
  -[HDSPSleepModeManager updateState](self, "updateState");
  -[HDSPSleepModeManager _powerLogSleepMode:sleepScreenEnabled:](self, "_powerLogSleepMode:sleepScreenEnabled:", -[HDSPSleepModeManager sleepMode](self, "sleepMode"), -[HDSPSleepModeManager sleepScreenEnabled](self, "sleepScreenEnabled"));

}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  HDSPSleepModeManager *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(_QWORD *);
  void *v23;
  HDSPSleepModeManager *v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(_QWORD *);
  void *v30;
  HDSPSleepModeManager *v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(_QWORD *);
  void *v37;
  HDSPSleepModeManager *v38;
  unint64_t v39;
  unint64_t v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKSPSleepScheduleState();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleStateChangeReason();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v10;
    v43 = 2114;
    v44 = v12;
    v45 = 2114;
    v46 = v13;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged: %{public}@ reason: %{public}@", buf, 0x20u);

  }
  switch(a3)
  {
    case 0uLL:
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_4;
      v18 = &unk_24D4E3498;
      v19 = self;
      v14 = &v15;
      goto LABEL_8;
    case 1uLL:
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2;
      v30 = &unk_24D4E3CC0;
      v31 = self;
      v32 = a5;
      v33 = a4;
      v14 = &v27;
      goto LABEL_8;
    case 2uLL:
      v34 = MEMORY[0x24BDAC760];
      v35 = 3221225472;
      v36 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
      v37 = &unk_24D4E3CC0;
      v38 = self;
      v39 = a5;
      v40 = a4;
      v14 = &v34;
      goto LABEL_8;
    case 3uLL:
      v20 = MEMORY[0x24BDAC760];
      v21 = 3221225472;
      v22 = __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_3;
      v23 = &unk_24D4E3CC0;
      v24 = self;
      v25 = a5;
      v26 = a4;
      v14 = &v20;
LABEL_8:
      -[HDSPSleepModeManager _withLock:](self, "_withLock:", v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26, v27, v28, v29, v30,
        v31,
        v32,
        v33,
        v34,
        v35,
        v36,
        v37,
        v38,
        v39,
        v40);
      break;
    case 6uLL:
      -[HDSPSleepModeManager updateState](self, "updateState");
      break;
    default:
      return;
  }
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "sleepScheduleStateChangedToBedtime:fromState:", a1[5], a1[6]);
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_2(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "sleepScheduleStateChangedToWakeUp:fromState:", a1[5], a1[6]);
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_3(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 24), "sleepScheduleStateChangedToWindDown:fromState:", a1[5], a1[6]);
}

uint64_t __73__HDSPSleepModeManager_sleepScheduleStateDidChange_previousState_reason___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "sleepScheduleStateChangedToDisabled");
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
  -[HDSPSleepModeManager updateState](self, "updateState");
}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v11 = v10;
    NSStringFromHKSPSleepMode();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepMode();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepModeChangeReason();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 2114;
    v18 = v12;
    v19 = 2114;
    v20 = v13;
    v21 = 2114;
    v22 = v14;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepModeDidChange: %{public}@ previousMode: %{public}@ reason: %{public}@, notifying observers", (uint8_t *)&v15, 0x2Au);

  }
  -[HDSPSleepModeManager notifyObserversForSleepModeChange:previousMode:reason:](self, "notifyObserversForSleepModeChange:previousMode:reason:", a3, a4, a5);
  -[HDSPSleepModeManager _powerLogSleepMode:sleepScreenEnabled:](self, "_powerLogSleepMode:sleepScreenEnabled:", a3, -[HDSPSleepModeManager sleepScreenEnabled](self, "sleepScreenEnabled"));
}

- (void)notifyObserversForSleepModeChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  void *v9;
  void *v10;
  HKSPObserverSet *sleepModeObservers;
  id v12;
  _QWORD v13[5];
  id v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;

  -[HDSPSleepModeManager environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  sleepModeObservers = self->_sleepModeObservers;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke;
  v13[3] = &unk_24D4E6580;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v13[4] = self;
  v14 = v10;
  v12 = v10;
  -[HKSPObserverSet enumerateObserversWithBlock:](sleepModeObservers, "enumerateObserversWithBlock:", v13);

}

void __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke_2;
  v7[3] = &unk_24D4E6558;
  v8 = v3;
  v9 = *(_OWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v4, "perform:withContext:", v7, v5);

}

uint64_t __78__HDSPSleepModeManager_notifyObserversForSleepModeChange_previousMode_reason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepModeDidChange:previousMode:reason:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_powerLogSleepMode:(int64_t)a3 sleepScreenEnabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[3];
  _QWORD v11[3];
  uint64_t v12;
  _QWORD v13[2];

  v4 = a4;
  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = &unk_24D4FEFB0;
  v12 = *MEMORY[0x24BEA9698];
  if (!a3)
    v5 = &unk_24D4FEFC8;
  v11[0] = v5;
  v10[0] = CFSTR("state");
  v10[1] = CFSTR("specificState");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  v10[2] = CFSTR("sleepScreenEnabled");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPPowerLog();
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

- (BOOL)isAppleWatch
{
  void *v2;
  void *v3;
  char v4;

  -[HDSPSleepModeManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppleWatch");

  return v4;
}

- (BOOL)sleepFeaturesEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "watchSleepFeaturesEnabled");

  return v4;
}

- (BOOL)sleepScreenEnabled
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = ((unint64_t)objc_msgSend(v3, "sleepModeOptions") >> 14) & 1;

  return v4;
}

- (BOOL)hasSleepFocusMode
{
  HDSPSleepFocusModeBridge *sleepFocusModeBridge;
  char v3;
  id v4;
  NSObject *v5;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  sleepFocusModeBridge = self->_sleepFocusModeBridge;
  v9 = 0;
  v3 = -[HDSPSleepFocusModeBridge hasSleepFocusMode:](sleepFocusModeBridge, "hasSleepFocusMode:", &v9);
  v4 = v9;
  if (v4)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v4;
      v8 = v7;
      _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] failed to fetch sleep focus mode: %{public}@)", buf, 0x16u);

    }
  }

  return v3;
}

- (id)computeUserVisibleEndDate
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  id v11;
  void *v12;
  double v13;
  NSObject *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  void *v19;
  int v20;
  _BOOL4 v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepEventRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSPSleepModeManager sleepScheduleState](self, "sleepScheduleState");
  -[HDSPSleepModeManager currentDate](self, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != 6)
  {
    objc_msgSend(v3, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95C8], v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "timeIntervalSinceDate:", v6);
    if (v13 > *MEMORY[0x24BEA9760])
    {
      HKSPLogForCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v27 = 138543618;
        v28 = (id)objc_opt_class();
        v29 = 2114;
        v30 = v12;
        v15 = v28;
        v16 = "[%{public}@] next wake up date is beyond maximum interval (%{public}@)";
        v17 = v14;
        v18 = 22;
LABEL_12:
        _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v27, v18);

      }
LABEL_13:

      v11 = 0;
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    v11 = v12;
    goto LABEL_18;
  }
  objc_msgSend(v4, "wakeUpAlarmSnoozedUntilDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_isAfterDate:", v6);

  if (!v8)
  {
    objc_msgSend(v3, "previousEventWithIdentifier:dueBeforeDate:", *MEMORY[0x24BEA95C8], v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wakeUpAlarmDismissedDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v12, "isEqualToDate:", v19);

    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      if (v21)
      {
        v27 = 138543362;
        v28 = (id)objc_opt_class();
        v15 = v28;
        v16 = "[%{public}@] wake up alarm already dismissed";
        v17 = v14;
        v18 = 12;
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    if (v21)
    {
      v27 = 138543362;
      v28 = (id)objc_opt_class();
      v22 = v28;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up alarm is firing", (uint8_t *)&v27, 0xCu);

    }
    goto LABEL_17;
  }
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138543362;
    v28 = (id)objc_opt_class();
    v10 = v28;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up alarm was snoozed", (uint8_t *)&v27, 0xCu);

  }
  objc_msgSend(v3, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95C8], v6);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:
  HKSPLogForCategory();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = (void *)objc_opt_class();
    v27 = 138543618;
    v28 = v24;
    v29 = 2114;
    v30 = v11;
    v25 = v24;
    _os_log_impl(&dword_21610C000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] user visible end date is %{public}@", (uint8_t *)&v27, 0x16u);

  }
  return v11;
}

- (BOOL)shouldGoIntoSleepModeDuringState:(unint64_t)a3
{
  NSObject *v4;
  id v5;
  const char *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPSleepModeManager hasSleepFocusMode](self, "hasSleepFocusMode"))
  {
    if (!-[HDSPSleepModeManager _isScheduledSleepModeEnabled](self, "_isScheduledSleepModeEnabled"))
    {
      HKSPLogForCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = (id)objc_opt_class();
        v5 = v9;
        v6 = "[%{public}@] scheduled sleep mode not enabled";
        goto LABEL_11;
      }
      goto LABEL_12;
    }
    if (HKSPSleepScheduleStateIsForWindDown())
    {
      if (!-[HDSPSleepModeManager _isSleepModeDuringWindDownEnabled](self, "_isSleepModeDuringWindDownEnabled"))
      {
        HKSPLogForCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v8 = 138543362;
          v9 = (id)objc_opt_class();
          v5 = v9;
          v6 = "[%{public}@] sleep mode during wind down not enabled";
LABEL_11:
          _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);

          goto LABEL_12;
        }
        goto LABEL_12;
      }
    }
    else if ((HKSPSleepScheduleStateIsForBedtime() & 1) == 0)
    {
      return 0;
    }
    return 1;
  }
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v5 = v9;
    v6 = "[%{public}@] no sleep focus mode exists";
    goto LABEL_11;
  }
LABEL_12:

  return 0;
}

- (BOOL)_isScheduledSleepModeEnabled
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  const char *v9;
  id v10;
  const char *v11;
  BOOL v12;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSchedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_msgSend(v4, "isEnabledAndHasOccurrences") & 1) != 0)
    {
      -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "sleepSettings");
      v6 = objc_claimAutoreleasedReturnValue();

      if ((-[NSObject scheduledSleepMode](v6, "scheduledSleepMode") & 1) != 0)
      {
        if (!-[HDSPSleepModeManager isInDemoMode](self, "isInDemoMode"))
        {
          v12 = 1;
          goto LABEL_17;
        }
        HKSPLogForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          goto LABEL_15;
        v14 = 138543362;
        v15 = (id)objc_opt_class();
        v8 = v15;
        v9 = "[%{public}@] device is in demo mode";
      }
      else
      {
        HKSPLogForCategory();
        v7 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:

          goto LABEL_16;
        }
        v14 = 138543362;
        v15 = (id)objc_opt_class();
        v8 = v15;
        v9 = "[%{public}@] scheduledSleepMode disabled";
      }
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v14, 0xCu);

      goto LABEL_15;
    }
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      v11 = "[%{public}@] sleep schedule not enabled";
      goto LABEL_11;
    }
  }
  else
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (id)objc_opt_class();
      v10 = v15;
      v11 = "[%{public}@] no sleep schedule";
LABEL_11:
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, 0xCu);

    }
  }
LABEL_16:
  v12 = 0;
LABEL_17:

  return v12;
}

- (BOOL)_isSleepModeDuringWindDownEnabled
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  id v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepEventRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "isAnySleepCoachingOnboardingCompleted");
  if ((v4 & 1) == 0)
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v6 = v9;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] user hasn't onboarded wind down yet", (uint8_t *)&v8, 0xCu);

    }
  }

  return v4;
}

- (BOOL)isInDemoMode
{
  void *v2;
  char v3;

  -[HDSPSleepModeManager environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDemoEnvironment");

  return v3;
}

- (void)sleepFocusModeBridge:(id)a3 didUpdateSleepFocusConfiguration:(id)a4
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
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepFocusModeDidChange", buf, 0xCu);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__HDSPSleepModeManager_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke;
  v7[3] = &unk_24D4E3498;
  v7[4] = self;
  -[HDSPSleepModeManager _withLock:](self, "_withLock:", v7);
}

uint64_t __78__HDSPSleepModeManager_sleepFocusModeBridge_didUpdateSleepFocusConfiguration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateState");
}

- (void)_createFocusModeIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HDSPSleepModeManager environment](self, "environment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "changeEvaluation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topLevelChangeKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", *MEMORY[0x24BEA9538]);

  if (v7)
  {
    -[HDSPSleepModeManager sleepScheduleModel](self, "sleepScheduleModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sleepSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "scheduledSleepMode"))
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = (id)objc_opt_class();
        v11 = v14;
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] user just enabled scheduledSleepMode", buf, 0xCu);

      }
      v12 = 0;
      -[HDSPSleepModeManager createFocusModeInState:error:](self, "createFocusModeInState:error:", objc_msgSend(MEMORY[0x24BEA9910], "defaultConfigurationState"), &v12);
    }
    else
    {

    }
  }

}

- (BOOL)createFocusModeInState:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHKSPSleepFocusConfigurationState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating sleep focus mode (state: %{public}@)", (uint8_t *)&v19, 0x16u);

  }
  v11 = -[HDSPSleepFocusModeBridge createSleepFocusModeInState:error:](self->_sleepFocusModeBridge, "createSleepFocusModeInState:error:", a3, a4);
  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v17 = (void *)objc_opt_class();
    v18 = *a4;
    v19 = 138543618;
    v20 = v17;
    v21 = 2114;
    v22 = v18;
    v15 = v17;
    _os_log_error_impl(&dword_21610C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to create sleep focus mode: %{public}@", (uint8_t *)&v19, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    v19 = 138543362;
    v20 = v14;
    v15 = v14;
    _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully created sleep focus mode", (uint8_t *)&v19, 0xCu);
LABEL_6:

  }
LABEL_8:

  return v11;
}

- (BOOL)deleteFocusModeWithError:(id *)a3
{
  NSObject *v5;
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543362;
    v16 = (id)objc_opt_class();
    v6 = v16;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] deleting sleep focus mode", (uint8_t *)&v15, 0xCu);

  }
  v7 = -[HDSPSleepFocusModeBridge removeSleepFocusMode:](self->_sleepFocusModeBridge, "removeSleepFocusMode:", a3);
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v7 & 1) == 0)
  {
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v13 = (void *)objc_opt_class();
    v14 = *a3;
    v15 = 138543618;
    v16 = v13;
    v17 = 2114;
    v18 = v14;
    v11 = v13;
    _os_log_error_impl(&dword_21610C000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] failed to delete sleep focus mode: %{public}@", (uint8_t *)&v15, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    v15 = 138543362;
    v16 = v10;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully deleted sleep focus mode", (uint8_t *)&v15, 0xCu);
LABEL_6:

  }
LABEL_8:

  return v7;
}

- (BOOL)configureFocusModeWithState:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v17;
  id v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    v9 = v8;
    NSStringFromHKSPSleepFocusConfigurationState();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138543618;
    v20 = v8;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] configuring sleep focus mode (state: %{public}@)", (uint8_t *)&v19, 0x16u);

  }
  v11 = -[HDSPSleepFocusModeBridge configureSleepFocusModeWithState:error:](self->_sleepFocusModeBridge, "configureSleepFocusModeWithState:error:", a3, a4);
  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    v17 = (void *)objc_opt_class();
    v18 = *a4;
    v19 = 138543618;
    v20 = v17;
    v21 = 2114;
    v22 = v18;
    v15 = v17;
    _os_log_error_impl(&dword_21610C000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] failed to configure sleep focus mode: %{public}@", (uint8_t *)&v19, 0x16u);
    goto LABEL_6;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_opt_class();
    v19 = 138543362;
    v20 = v14;
    v15 = v14;
    _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] successfully configure sleep focus mode", (uint8_t *)&v19, 0xCu);
LABEL_6:

  }
LABEL_8:

  return v11;
}

- (void)createHomeScreenPageWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] creating home screen page", (uint8_t *)&v7, 0xCu);

  }
  -[HDSPSleepProactiveBridge createSuggestedHomeScreenPageWithCompletion:](self->_sleepProactiveBridge, "createSuggestedHomeScreenPageWithCompletion:", v4);

}

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepModeManager currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Current State: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)diagnosticInfo
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v6 = CFSTR("Current State");
  -[HDSPSleepModeManager currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stateName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDSPEnvironment)environment
{
  return (HDSPEnvironment *)objc_loadWeakRetained((id *)&self->_environment);
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPSleepModeStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPObserverSet)sleepModeObservers
{
  return self->_sleepModeObservers;
}

- (HDSPSleepFocusModeBridge)sleepFocusModeBridge
{
  return self->_sleepFocusModeBridge;
}

- (HDSPSleepProactiveBridge)sleepProactiveBridge
{
  return self->_sleepProactiveBridge;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepProactiveBridge, 0);
  objc_storeStrong((id *)&self->_sleepFocusModeBridge, 0);
  objc_storeStrong((id *)&self->_sleepModeObservers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
