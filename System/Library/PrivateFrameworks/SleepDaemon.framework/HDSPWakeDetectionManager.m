@implementation HDSPWakeDetectionManager

- (HDSPWakeDetectionManager)initWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HDSPWakeDetectionManager *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "behavior");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platformSpecificProviders:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSPWakeDetectionManager initWithEnvironment:wakeDetectorProviders:](self, "initWithEnvironment:wakeDetectorProviders:", v4, v7);

  return v8;
}

+ (id)platformSpecificProviders:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCEB8];
  v11[0] = &__block_literal_global_12;
  v11[1] = &__block_literal_global_185;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v6) = objc_msgSend(v5, "isAppleWatch");
  if ((_DWORD)v6)
  {
    v10[0] = &__block_literal_global_188_0;
    v10[1] = &__block_literal_global_190_1;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

  }
  return v7;
}

HDSPSleepModeExitDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepModeExitDetector *v3;

  v2 = a2;
  v3 = -[HDSPSleepModeExitDetector initWithEnvironment:]([HDSPSleepModeExitDetector alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPSleepScreenUnlockDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HDSPSleepScreenUnlockDetector *v3;

  v2 = a2;
  v3 = -[HDSPSleepScreenUnlockDetector initWithEnvironment:]([HDSPSleepScreenUnlockDetector alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPWatchOnWristWakeDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  HDSPWatchOnWristWakeDetector *v3;

  v2 = a2;
  v3 = -[HDSPWatchOnWristWakeDetector initWithEnvironment:]([HDSPWatchOnWristWakeDetector alloc], "initWithEnvironment:", v2);

  return v3;
}

HDSPActivityWakeDetector *__54__HDSPWakeDetectionManager_platformSpecificProviders___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  HDSPActivityWakeDetector *v5;

  v2 = a2;
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hksp_supportsAlwaysOnTracking");

  if (v4)
    v5 = -[HDSPActivityWakeDetector initWithEnvironment:]([HDSPActivityWakeDetector alloc], "initWithEnvironment:", v2);
  else
    v5 = 0;

  return v5;
}

- (HDSPWakeDetectionManager)initWithEnvironment:(id)a3 wakeDetectorProviders:(id)a4
{
  id v6;
  id v7;
  HDSPWakeDetectionManager *v8;
  HDSPWakeDetectionManager *v9;
  id v10;
  HDSPWakeDetectionManager *v11;
  uint64_t v12;
  NSArray *wakeDetectors;
  NSObject *v14;
  void *v15;
  NSArray *v16;
  id v17;
  void (**v18)(void);
  uint64_t v19;
  HKSPMutexProvider *mutexProvider;
  HDSPWakeDetectionStateMachine *v21;
  objc_class *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  HDSPWakeDetectionStateMachine *stateMachine;
  HDSPWakeDetectionManager *v30;
  uint64_t v32;
  uint64_t v33;
  id (*v34)(uint64_t, uint64_t);
  void *v35;
  id v36;
  HDSPWakeDetectionManager *v37;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSArray *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)HDSPWakeDetectionManager;
  v8 = -[HDSPWakeDetectionManager init](&v38, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    v32 = MEMORY[0x24BDAC760];
    v33 = 3221225472;
    v34 = __70__HDSPWakeDetectionManager_initWithEnvironment_wakeDetectorProviders___block_invoke;
    v35 = &unk_24D4E50C0;
    v10 = v6;
    v36 = v10;
    v11 = v9;
    v37 = v11;
    objc_msgSend(v7, "na_map:", &v32);
    v12 = objc_claimAutoreleasedReturnValue();
    wakeDetectors = v11->_wakeDetectors;
    v11->_wakeDetectors = (NSArray *)v12;

    HKSPLogForCategory();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)objc_opt_class();
      v16 = v11->_wakeDetectors;
      *(_DWORD *)buf = 138543618;
      v40 = v15;
      v41 = 2114;
      v42 = v16;
      v17 = v15;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] has wakeDetectors: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v10, "mutexGenerator", v32, v33, v34, v35);
    v18 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v18[2]();
    v19 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v11->_mutexProvider;
    v11->_mutexProvider = (HKSPMutexProvider *)v19;

    v21 = [HDSPWakeDetectionStateMachine alloc];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v10, "userDefaults");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithUserDefaults:", v25);
    objc_msgSend(v10, "currentDateProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[HDSPWakeDetectionStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v21, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v23, v26, v11, v11, v27);
    stateMachine = v11->_stateMachine;
    v11->_stateMachine = (HDSPWakeDetectionStateMachine *)v28;

    v30 = v11;
  }

  return v9;
}

id __70__HDSPWakeDetectionManager_initWithEnvironment_wakeDetectorProviders___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;

  (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWakeDetectorDelegate:", *(_QWORD *)(a1 + 40));
  return v3;
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
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = (id)objc_opt_class();
    v6 = v14;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v13, 0xCu);

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

  objc_msgSend(v4, "sleepCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "addProvider:", self);
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
  v6[2] = __54__HDSPWakeDetectionManager_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v6);
}

uint64_t __54__HDSPWakeDetectionManager_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateState");
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
  v5[2] = __39__HDSPWakeDetectionManager_updateState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v5);
}

uint64_t __39__HDSPWakeDetectionManager_updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "updateState");
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
  -[HDSPWakeDetectionManager updateState](self, "updateState");

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
  -[HDSPWakeDetectionManager updateState](self, "updateState");
}

- (void)wakeDetector:(id)a3 didDetectWakeUpEventOnDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    v9 = v16;
    _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up event was detected by %{public}@ at %{public}@", buf, 0x20u);

  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __68__HDSPWakeDetectionManager_wakeDetector_didDetectWakeUpEventOnDate___block_invoke;
  v12[3] = &unk_24D4E4918;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v12);

}

uint64_t __68__HDSPWakeDetectionManager_wakeDetector_didDetectWakeUpEventOnDate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "wakeupEventDetected:date:", objc_msgSend(*(id *)(a1 + 40), "type"), *(_QWORD *)(a1 + 48));
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
  -[HDSPWakeDetectionManager sleepEventDelegate](self, "sleepEventDelegate");
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
  -[HDSPWakeDetectionManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderCancelledEvents:", self);

}

- (void)_startWakeDetection
{
  -[HDSPWakeDetectionManager startWakeDetection:](self, "startWakeDetection:", 3);
}

- (void)startWakeDetection:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  _QWORD v11[6];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    NSStringFromHDSPWakeDetectorTypes(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v13 = v6;
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] startWakeDetection: %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "defaultCallbackScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke;
  v11[3] = &unk_24D4E3DB0;
  v11[4] = self;
  v11[5] = a3;
  objc_msgSend(v10, "performBlock:", v11);

}

void __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke_2;
  v4[3] = &__block_descriptor_40_e28_B16__0___HDSPWakeDetector__8l;
  v4[4] = v1;
  objc_msgSend(v2, "na_filter:", v4);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_each:", &__block_literal_global_198);

}

BOOL __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;

  v3 = a2;
  if ((objc_msgSend(v3, "isDetecting") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = (objc_msgSend(v3, "type") & v5) != 0;
  }

  return v4;
}

uint64_t __47__HDSPWakeDetectionManager_startWakeDetection___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startDetecting");
}

- (void)stopWakeDetection
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] stopWakeDetection", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "defaultCallbackScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__HDSPWakeDetectionManager_stopWakeDetection__block_invoke;
  v7[3] = &unk_24D4E3498;
  v7[4] = self;
  objc_msgSend(v6, "performBlock:", v7);

}

uint64_t __45__HDSPWakeDetectionManager_stopWakeDetection__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "na_each:", &__block_literal_global_199_0);
}

uint64_t __45__HDSPWakeDetectionManager_stopWakeDetection__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopDetecting");
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
  -[HDSPWakeDetectionManager updateState](self, "updateState");
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
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = (id)MEMORY[0x24BDBD1A8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __55__HDSPWakeDetectionManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_24D4E3D38;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v12);
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

void __55__HDSPWakeDetectionManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
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
    -[HDSPWakeDetectionManager updateState](self, "updateState");
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
    v13[2] = __44__HDSPWakeDetectionManager_sleepEventIsDue___block_invoke;
    v13[3] = &unk_24D4E3680;
    v13[4] = self;
    v14 = v4;
    -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v13);

  }
}

void __44__HDSPWakeDetectionManager_sleepEventIsDue___block_invoke(uint64_t a1)
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
  block[2] = __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8EF8 != -1)
    dispatch_once(&qword_253DE8EF8, block);
  return (id)_MergedGlobals_15;
}

void __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke(uint64_t a1)
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
  v10 = __Block_byref_object_copy__12;
  v11 = __Block_byref_object_dispose__12;
  v12 = (id)MEMORY[0x24BDBD1A8];
  v1 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke_2;
  v6[3] = &unk_24D4E3CE8;
  v6[4] = v1;
  v6[5] = &v7;
  objc_msgSend(v1, "_withLock:", v6);
  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend((id)v8[5], "arrayByAddingObject:", *MEMORY[0x24BEA95A0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_15;
  _MergedGlobals_15 = v4;

  _Block_object_dispose(&v7, 8);
}

void __44__HDSPWakeDetectionManager_eventIdentifiers__block_invoke_2(uint64_t a1)
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

- (void)postWakeDetectionNotification:(unint64_t)a3
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  id v17;
  _BOOL8 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];
  uint8_t buf[4];
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepModeManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "sleepMode");

  -[HDSPWakeDetectionManager relevantOccurrence](self, "relevantOccurrence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "alarmConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnabled");

  if (v7 == 2)
    v11 = 1;
  else
    v11 = v10;
  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138544130;
    v35 = (id)objc_opt_class();
    v36 = 1024;
    v37 = v11 ^ 1;
    v38 = 1024;
    v39 = v7 == 2;
    v40 = 1024;
    v41 = v10;
    v13 = v35;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_INFO, "[%{public}@] canAutoConfirmAwake: %d (isSleepModeOn: %d, isAlarmEnabled: %d)", buf, 0x1Eu);

  }
  HKSPLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v15)
    {
      v16 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v35 = v16;
      v17 = v16;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] posting wake detection notification", buf, 0xCu);

    }
    v18 = v7 == 2;

    v19 = (void *)MEMORY[0x24BEA98F8];
    v20 = *MEMORY[0x24BEA95C0];
    -[HDSPWakeDetectionManager currentDate](self, "currentDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = *MEMORY[0x24BEA9780];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    v32[1] = *MEMORY[0x24BEA9778];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sleepEventWithIdentifier:dueDate:context:", v20, v21, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v26, "sleepScheduler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v25;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v31, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "notifyForOverdueEvents:", v28);

  }
  else
  {
    if (v15)
    {
      v29 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v35 = v29;
      v30 = v29;
      _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] auto-confirming awake since sleep focus and alarm are both off", buf, 0xCu);

    }
    v25 = objc_loadWeakRetained((id *)p_environment);
    objc_msgSend(v25, "actionManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "confirmWakeUp:", 0);
  }

}

- (void)earlyWakeUpWasNotifiedRemotely
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection notification posted on other device", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__HDSPWakeDetectionManager_earlyWakeUpWasNotifiedRemotely__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v5);
}

uint64_t __58__HDSPWakeDetectionManager_earlyWakeUpWasNotifiedRemotely__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "earlyWakeUpWasNotifiedRemotely");
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

- (BOOL)sleepFeaturesEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "watchSleepFeaturesEnabled");

  return v4;
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

- (HKSPSleepScheduleOccurrence)relevantOccurrence
{
  void *v3;
  void *v4;
  void *v5;

  -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeDetectionManager currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nextOccurrenceAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleOccurrence *)v5;
}

- (BOOL)sleepModeIsOff
{
  id WeakRetained;
  void *v3;
  BOOL v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepModeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sleepMode") == 0;

  return v4;
}

- (BOOL)isWatch
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

- (unint64_t)activeTypes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;

  -[HDSPWakeDetectionManager currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95C8], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95A0], v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 2;
    -[HDSPWakeDetectionManager _detectionWindowForType:wakeUpDate:bedtimeDate:](self, "_detectionWindowForType:wakeUpDate:bedtimeDate:", 2, v5, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v3, "hksp_isAfterOrSameAsDate:", v10))
      v8 = 0;
    -[HDSPWakeDetectionManager _detectionWindowForType:wakeUpDate:bedtimeDate:](self, "_detectionWindowForType:wakeUpDate:bedtimeDate:", 1, v5, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v8 | objc_msgSend(v3, "hksp_isAfterOrSameAsDate:", v12);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSDate)upcomingStartDetection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  -[HDSPWakeDetectionManager currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95C8], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95A0], v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPWakeDetectionManager _detectionWindowForType:wakeUpDate:bedtimeDate:](self, "_detectionWindowForType:wakeUpDate:bedtimeDate:", 2, v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "hksp_isBeforeDate:", v9))
    {
      v10 = v9;
    }
    else
    {
      -[HDSPWakeDetectionManager _detectionWindowForType:wakeUpDate:bedtimeDate:](self, "_detectionWindowForType:wakeUpDate:bedtimeDate:", 1, v5, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v3, "hksp_isBeforeDate:", v12))
        v10 = v12;
      else
        v10 = 0;

    }
  }
  else
  {
    v10 = 0;
  }

  return (NSDate *)v10;
}

- (id)detectionWindowForType:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HDSPWakeDetectionManager currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95C8], v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95A0], v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPWakeDetectionManager _detectionWindowForType:wakeUpDate:bedtimeDate:](self, "_detectionWindowForType:wakeUpDate:bedtimeDate:", a3, v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_detectionWindowForType:(unint64_t)a3 wakeUpDate:(id)a4 bedtimeDate:(id)a5
{
  char v6;
  id v7;
  id v8;
  char v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "hksp_isAfterDate:", v7);
  v10 = 10800.0;
  if ((v6 & 2) == 0)
    v10 = 0.0;
  if ((v6 & 1) != 0)
    v10 = 1800.0;
  objc_msgSend(v7, "dateByAddingTimeInterval:", -v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v11, "laterDate:", v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v12, v7);

  return v14;
}

- (NSDate)nextWakeUp
{
  void *v3;
  void *v4;
  void *v5;

  -[HDSPWakeDetectionManager currentDate](self, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeDetectionManager sleepScheduleModel](self, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95C8], v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (BOOL)isDetecting
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
  v4[2] = __39__HDSPWakeDetectionManager_isDetecting__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __39__HDSPWakeDetectionManager_isDetecting__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isDetectingState");

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
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __41__HDSPWakeDetectionManager__currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWakeDetectionManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __41__HDSPWakeDetectionManager__currentState__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "currentState");
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
  -[HDSPWakeDetectionManager _currentState](self, "_currentState");
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

- (NSArray)wakeDetectors
{
  return self->_wakeDetectors;
}

- (HKSPMutexProvider)mutexProvider
{
  return self->_mutexProvider;
}

- (HDSPWakeDetectionStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_storeStrong((id *)&self->_wakeDetectors, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
}

- (void)_simulateActivityDetectionOnDate:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[HDSPWakeDetectionManager wakeDetectors](self, "wakeDetectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[HDSPWakeDetectionManager wakeDetectors](self, "wakeDetectors");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDSPWakeDetectionManager wakeDetector:didDetectWakeUpEventOnDate:](self, "wakeDetector:didDetectWakeUpEventOnDate:", v7, v8);

  }
}

@end
