@implementation HDSPWakeUpResultsNotificationManager

- (HDSPWakeUpResultsNotificationManager)initWithEnvironment:(id)a3
{
  id v4;
  HDSPXPCActivityScheduler *v5;
  void *v6;
  HDSPXPCActivityScheduler *v7;
  HDSPWakeUpResultsNotificationManager *v8;

  v4 = a3;
  v5 = [HDSPXPCActivityScheduler alloc];
  objc_msgSend(v4, "defaultCallbackScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDSPXPCActivityScheduler initWithCallbackScheduler:](v5, "initWithCallbackScheduler:", v6);
  v8 = -[HDSPWakeUpResultsNotificationManager initWithEnvironment:retryAttemptScheduler:](self, "initWithEnvironment:retryAttemptScheduler:", v4, v7);

  return v8;
}

- (HDSPWakeUpResultsNotificationManager)initWithEnvironment:(id)a3 retryAttemptScheduler:(id)a4
{
  id v6;
  id v7;
  HDSPWakeUpResultsNotificationManager *v8;
  HDSPWakeUpResultsNotificationManager *v9;
  void (**v10)(void);
  uint64_t v11;
  HKSPMutexProvider *mutexProvider;
  HDSPWakeUpResultsNotificationStateMachine *v13;
  objc_class *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HDSPWakeUpResultsNotificationStateMachine *stateMachine;
  HDSPWakeUpResultsNotificationManager *v22;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDSPWakeUpResultsNotificationManager;
  v8 = -[HDSPWakeUpResultsNotificationManager init](&v24, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v9->_retryAttemptScheduler, a4);
    objc_msgSend(v6, "mutexGenerator");
    v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v10[2]();
    v11 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v9->_mutexProvider;
    v9->_mutexProvider = (HKSPMutexProvider *)v11;

    v13 = [HDSPWakeUpResultsNotificationStateMachine alloc];
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v6, "userDefaults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithUserDefaults:", v17);
    objc_msgSend(v6, "currentDateProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HDSPWakeUpResultsNotificationStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v13, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v15, v18, v9, v9, v19);
    stateMachine = v9->_stateMachine;
    v9->_stateMachine = (HDSPWakeUpResultsNotificationStateMachine *)v20;

    v22 = v9;
  }

  return v9;
}

- (id)performImmediateQueryForNotification
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
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __76__HDSPWakeUpResultsNotificationManager_performImmediateQueryForNotification__block_invoke;
  v4[3] = &unk_24D4E34C0;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __76__HDSPWakeUpResultsNotificationManager_performImmediateQueryForNotification__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "executeQuery");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
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

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)_updateState
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Update state", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __52__HDSPWakeUpResultsNotificationManager__updateState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v5);
}

uint64_t __52__HDSPWakeUpResultsNotificationManager__updateState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "updateState");
}

- (void)environmentWillBecomeReady:(id)a3
{
  HDSPEnvironment **p_environment;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  p_environment = &self->_environment;
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEventHandler:", self);

  v7 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v7, "sleepScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEventProvider:", self);

  v9 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v9, "notificationListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  v11 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v11, "sleepCoordinator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:", self);

  v13 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v13, "sleepScheduleModelManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:", self);

  v15 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v15, "timeChangeListener");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:", self);

  v18 = objc_loadWeakRetained((id *)p_environment);
  objc_msgSend(v18, "diagnostics");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addProvider:", self);

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
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Environment did become ready.", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationManager _updateState](self, "_updateState");
}

- (id)notificationListener:(id)a3 didReceiveNotificationWithName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *MEMORY[0x24BDD3328]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__13;
    v19 = __Block_byref_object_dispose__13;
    v20 = 0;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __92__HDSPWakeUpResultsNotificationManager_notificationListener_didReceiveNotificationWithName___block_invoke;
    v14[3] = &unk_24D4E34C0;
    v14[4] = self;
    v14[5] = &v15;
    -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v14);
    v10 = (void *)v16[5];
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    _Block_object_dispose(&v15, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

void __92__HDSPWakeUpResultsNotificationManager_notificationListener_didReceiveNotificationWithName___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "protectedHealthDataDidBecomeAvailable");
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 40));
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
  -[HDSPWakeUpResultsNotificationManager _updateState](self, "_updateState");
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sleep model changed", (uint8_t *)&v7, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationManager _updateState](self, "_updateState");
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 reason:(unint64_t)a5
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
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
    v15 = v8;
    v16 = 2114;
    v17 = v10;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepScheduleStateChanged from %{public}@ to %{public}@ for %{public}@", buf, 0x2Au);

  }
  if (a3 == 1 && HKSPSleepScheduleStateChangeReasonIsExpected())
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __89__HDSPWakeUpResultsNotificationManager_sleepScheduleStateDidChange_previousState_reason___block_invoke;
    v13[3] = &unk_24D4E3498;
    v13[4] = self;
    -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v13);
  }
  else
  {
    -[HDSPWakeUpResultsNotificationManager _updateState](self, "_updateState");
  }
}

uint64_t __89__HDSPWakeUpResultsNotificationManager_sleepScheduleStateDidChange_previousState_reason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "wakeUpDidOccur");
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
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = (id)MEMORY[0x24BDBD1A8];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPWakeUpResultsNotificationManager_upcomingEventsDueAfterDate___block_invoke;
  v12[3] = &unk_24D4E3D38;
  v12[4] = self;
  v5 = v4;
  v13 = v5;
  v14 = &v15;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v12);
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

void __67__HDSPWakeUpResultsNotificationManager_upcomingEventsDueAfterDate___block_invoke(uint64_t a1)
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
  v10[2] = __56__HDSPWakeUpResultsNotificationManager_sleepEventIsDue___block_invoke;
  v10[3] = &unk_24D4E3680;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v10);

}

void __56__HDSPWakeUpResultsNotificationManager_sleepEventIsDue___block_invoke(uint64_t a1)
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
  block[2] = __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke;
  block[3] = &unk_24D4E3498;
  block[4] = self;
  if (qword_253DE8F08 != -1)
    dispatch_once(&qword_253DE8F08, block);
  return (id)_MergedGlobals_16;
}

void __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke(uint64_t a1)
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
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  v10 = (id)MEMORY[0x24BDBD1A8];
  v1 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke_2;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = v1;
  v4[5] = &v5;
  objc_msgSend(v1, "_withLock:", v4);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v2;

  _Block_object_dispose(&v5, 8);
}

void __56__HDSPWakeUpResultsNotificationManager_eventIdentifiers__block_invoke_2(uint64_t a1)
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

- (BOOL)isWakeUpResultsNotificationEnabled
{
  id WeakRetained;
  void *v3;
  void *v4;
  char v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "wakeUpResults");

  return v5;
}

- (id)notificationAttemptWindowForWakeUpBeforeDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HDSPWakeUpResultsNotificationManager currentDate](self, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "laterDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543874;
    v15 = (id)objc_opt_class();
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v4;
    v8 = v15;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resolved attempt window beforeDate: %@ (passed: %@)", (uint8_t *)&v14, 0x20u);

  }
  -[HDSPWakeUpResultsNotificationManager _sleepScheduleModel](self, "_sleepScheduleModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "previousEventWithIdentifier:dueBeforeDate:", *MEMORY[0x24BEA95C8], v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HDSPWakeUpResultsNotificationManager _trackingDelayDuration](self, "_trackingDelayDuration");
    objc_msgSend(v10, "dateByAddingTimeInterval:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:duration:", v11, 14400.0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (double)_trackingDelayDuration
{
  void *v2;
  void *v3;
  double v4;
  id v5;
  NSObject *v6;
  double v7;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("WakeUpResultsNotificationDelayOverride"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 900.0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v3;
      HKSPLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543618;
        v11 = (id)objc_opt_class();
        v12 = 2114;
        v13 = v5;
        v9 = v11;
        _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Overriding default notification delay to %{public}@s", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(v5, "doubleValue");
      v4 = v7;

    }
  }

  return v4;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting to schedule tracking delay", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationManager sleepEventDelegate](self, "sleepEventDelegate");
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting to cancel tracking delay", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationManager sleepEventDelegate](self, "sleepEventDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "eventProviderCancelledEvents:", self);

}

- (void)scheduleRetryAttempt
{
  NSObject *v3;
  id v4;
  void *v5;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Scheduling retry attempt", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  -[HDSPWakeUpResultsNotificationManager retryAttemptScheduler](self, "retryAttemptScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "retryActivity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke;
  v7[3] = &unk_24D4E36A8;
  objc_copyWeak(&v8, (id *)buf);
  objc_msgSend(v5, "scheduleActivity:activityHandler:", v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  id v3;
  _QWORD v4[5];
  uint8_t buf[4];
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v6 = (id)objc_opt_class();
    v3 = v6;
    _os_log_impl(&dword_21610C000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Attempting retry", buf, 0xCu);

  }
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke_198;
  v4[3] = &unk_24D4E3498;
  v4[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_withLock:", v4);

}

uint64_t __60__HDSPWakeUpResultsNotificationManager_scheduleRetryAttempt__block_invoke_198(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "retryAttemptEventDue");
}

- (void)unscheduleRetryAttempt
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unscheduling retry attempt", (uint8_t *)&v6, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationManager retryAttemptScheduler](self, "retryAttemptScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unscheduleActivities");

}

+ (id)retryCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x24BDAC5F0], *MEMORY[0x24BDAC5F8]);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x24BDAC698], (const char *)*MEMORY[0x24BDAC6A8]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6B8], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6C8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC6F8], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x24BDAC598], 1);
  return v2;
}

+ (id)retryActivity
{
  HDSPXPCActivity *v3;
  void *v4;
  HDSPXPCActivity *v5;

  v3 = [HDSPXPCActivity alloc];
  objc_msgSend(a1, "retryCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDSPXPCActivity initWithEventName:options:criteria:](v3, "initWithEventName:options:criteria:", CFSTR("com.apple.sleep.WakeUpResultsNotificationRetry.activity"), 0, v4);

  return v5;
}

- (void)startObservingProtectedHealthDataAvailability
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v4 = v11;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Start observing protected data availability", (uint8_t *)&v10, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "notificationListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDD3328];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerForLaunchNotificationWithName:key:", v7, v9);

}

- (void)stopObservingProtectedHealthDataAvailability
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = (id)objc_opt_class();
    v4 = v11;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stop observing protected data availability", (uint8_t *)&v10, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "notificationListener");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BDD3328];
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterForLaunchNotificationWithName:key:", v7, v9);

}

- (void)executeQuery
{
  NAFuture *queryResultFuture;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  queryResultFuture = self->_queryResultFuture;
  if (queryResultFuture && !-[NAFuture isFinished](queryResultFuture, "isFinished"))
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v7 = v9;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpected call to start query while already in progress", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v5 = v9;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting new query", (uint8_t *)&v8, 0xCu);

    }
    -[HDSPWakeUpResultsNotificationManager _lock_startQuery](self, "_lock_startQuery");
  }
}

- (void)postResultsNotification
{
  NSObject *v4;
  id v5;
  NAFuture *queryResultFuture;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = (id)objc_opt_class();
    v5 = v12;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Preparing daily results notification", buf, 0xCu);

  }
  if ((-[NAFuture isFinished](self->_queryResultFuture, "isFinished") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDSPWakeUpResultsNotificationManager.m"), 358, CFSTR("_queryResultFuture must be finished before we can post notification"));

  }
  objc_initWeak((id *)buf, self);
  queryResultFuture = self->_queryResultFuture;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __63__HDSPWakeUpResultsNotificationManager_postResultsNotification__block_invoke;
  v9[3] = &unk_24D4E5180;
  objc_copyWeak(&v10, (id *)buf);
  v7 = (id)-[NAFuture addSuccessBlock:](queryResultFuture, "addSuccessBlock:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __63__HDSPWakeUpResultsNotificationManager_postResultsNotification__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v2);
  objc_msgSend(v3, "buildNotification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BEA98F8];
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "currentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sleepEventWithIdentifier:dueDate:context:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_loadWeakRetained(WeakRetained + 1);
    objc_msgSend(v11, "sleepScheduler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "notifyForOverdueEvents:", v13);

  }
  objc_msgSend(WeakRetained[4], "didPostResultsNotification");

}

- (void)_lock_startQuery
{
  NSObject *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  NAFuture *v26;
  NAFuture *queryResultFuture;
  NAFuture *v28;
  id v29;
  NAFuture *v30;
  id v31;
  NSObject *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40[3];
  id location;
  _QWORD v42[2];
  uint8_t buf[4];
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v44 = (id)objc_opt_class();
    v4 = v44;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Begin _lock_startQuery...", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(WeakRetained, "healthStoreProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "healthStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "calendarWithIdentifier:", *MEMORY[0x24BDBCA18]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeUpResultsNotificationManager currentDate](self, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hk_dayIndexWithCalendar:", v8);

  v11 = (void *)HDSPWakeUpResultsNotificationDaySummaryCount;
  v12 = objc_loadWeakRetained((id *)&self->_environment);
  objc_msgSend(v12, "defaultCallbackScheduler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v44 = v15;
    v16 = v15;
    _os_log_impl(&dword_21610C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] Creating future dependencies...", buf, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationManager _fetchUserFirstNameWithHealthStore:](self, "_fetchUserFirstNameWithHealthStore:", v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)(v10 - (_QWORD)v11 + 1);
  v42[0] = v17;
  -[HDSPWakeUpResultsNotificationManager _fetchSleepDaySummariesForMorningIndexRange:healthStore:](self, "_fetchSleepDaySummariesForMorningIndexRange:healthStore:", v18, v11, v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v44 = v22;
    v23 = v22;
    _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Combining dependency futures...", buf, 0xCu);

  }
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x24BE6B608], "combineAllFutures:ignoringErrors:scheduler:", v20, 1, v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  v39[0] = MEMORY[0x24BDAC760];
  v39[1] = 3221225472;
  v39[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke;
  v39[3] = &unk_24D4E51A8;
  objc_copyWeak(v40, &location);
  v40[1] = v18;
  v40[2] = v11;
  objc_msgSend(v24, "flatMap:", v39);
  v26 = (NAFuture *)objc_claimAutoreleasedReturnValue();
  queryResultFuture = self->_queryResultFuture;
  self->_queryResultFuture = v26;

  v28 = self->_queryResultFuture;
  v37[0] = v25;
  v37[1] = 3221225472;
  v37[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_211;
  v37[3] = &unk_24D4E51D0;
  objc_copyWeak(&v38, &location);
  v29 = (id)-[NAFuture addFailureBlock:](v28, "addFailureBlock:", v37);
  v30 = self->_queryResultFuture;
  v35[0] = v25;
  v35[1] = 3221225472;
  v35[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_2;
  v35[3] = &unk_24D4E5180;
  objc_copyWeak(&v36, &location);
  v31 = (id)-[NAFuture addSuccessBlock:](v30, "addSuccessBlock:", v35);
  HKSPLogForCategory();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v44 = v33;
    v34 = v33;
    _os_log_impl(&dword_21610C000, v32, OS_LOG_TYPE_DEFAULT, "[%{public}@] End _lock_startQuery...", buf, 0xCu);

  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v38);
  objc_destroyWeak(v40);
  objc_destroyWeak(&location);

}

id __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  HDSPWakeUpResultsNotificationBuilder *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = (id)objc_opt_class();
    v21 = 2114;
    v22 = v3;
    v6 = v20;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Query dependencies completed with results: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_userFirstNameFromResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(WeakRetained, "_sleepDaySummariesFromResult:error:", v9, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v18;

  if (v10)
  {
    v12 = -[HDSPWakeUpResultsNotificationBuilder initWithDaySummaries:morningIndexRange:userFirstName:]([HDSPWakeUpResultsNotificationBuilder alloc], "initWithDaySummaries:morningIndexRange:userFirstName:", v10, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v8);
    v13 = -[HDSPWakeUpResultsNotificationBuilder hasSufficientSleepData](v12, "hasSufficientSleepData");
    v14 = (void *)MEMORY[0x24BE6B608];
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BE6B608], "futureWithResult:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hdsp_insufficientSleepDataError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "futureWithError:", v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE6B608], "futureWithError:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

void __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_211(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2114;
    v13 = v3;
    v7 = v11;
    _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Query failed with error: %{public}@", buf, 0x16u);

  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_212;
  v8[3] = &unk_24D4E3680;
  v8[4] = WeakRetained;
  v9 = v3;
  v6 = v3;
  objc_msgSend(WeakRetained, "_withLock:", v8);

}

uint64_t __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_212(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "queryDidFailWithError:", *(_QWORD *)(a1 + 40));
}

void __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v9 = (id)objc_opt_class();
    v10 = 2114;
    v11 = v3;
    v6 = v9;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Query succeeded with result: %{public}@", buf, 0x16u);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_214;
  v7[3] = &unk_24D4E3498;
  v7[4] = WeakRetained;
  objc_msgSend(WeakRetained, "_withLock:", v7);

}

uint64_t __56__HDSPWakeUpResultsNotificationManager__lock_startQuery__block_invoke_214(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "queryDidComplete");
}

- (id)_fetchUserFirstNameWithHealthStore:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke;
  v20[3] = &unk_24D4E51D0;
  objc_copyWeak(&v21, &location);
  v7 = (id)objc_msgSend(v5, "addFailureBlock:", v20);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_215;
  v18[3] = &unk_24D4E51F8;
  objc_copyWeak(&v19, &location);
  v8 = (id)objc_msgSend(v5, "addSuccessBlock:", v18);
  HKSPLogForCategory();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v24 = v10;
    v11 = v10;
    _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching user first name...", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDD3C98], "healthAppDefaultsDomainWithHealthStore:", v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x24BDD4700];
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_218;
  v16[3] = &unk_24D4E5220;
  v14 = v5;
  v17 = v14;
  objc_msgSend(v12, "propertyListValueForKey:completion:", v13, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

  return v14;
}

void __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch user's first name with error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_215(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543619;
    v8 = (id)objc_opt_class();
    v9 = 2113;
    v10 = v3;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully fetched user's first name with result: %{private}@", (uint8_t *)&v7, 0x16u);

  }
}

void __75__HDSPWakeUpResultsNotificationManager__fetchUserFirstNameWithHealthStore___block_invoke_218(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:");
  }
  else
  {
    objc_msgSend(a2, "valueForKey:", *MEMORY[0x24BDD46F0]);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
      v6 = (__CFString *)v4;
    else
      v6 = &stru_24D4E68A0;
    v10 = v6;

    if (-[__CFString length](v10, "length"))
    {
      if ((arc4random_uniform(0x64u) & 1) != 0)
        v7 = &stru_24D4E68A0;
      else
        v7 = v10;
      v8 = v7;

      v9 = v8;
    }
    else
    {
      v9 = v10;
    }
    v11 = v9;
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v9);

  }
}

- (id)_fetchSleepDaySummariesForMorningIndexRange:(id)a3 healthStore:(id)a4
{
  int64_t var1;
  int64_t var0;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  var1 = a3.var1;
  var0 = a3.var0;
  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x24BE6B608]);
  objc_initWeak(&location, self);
  v9 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke;
  v28[3] = &unk_24D4E51D0;
  objc_copyWeak(&v29, &location);
  v10 = (id)objc_msgSend(v8, "addFailureBlock:", v28);
  v26[0] = v9;
  v26[1] = 3221225472;
  v26[2] = __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_222;
  v26[3] = &unk_24D4E5248;
  objc_copyWeak(&v27, &location);
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v26);
  v12 = objc_alloc(MEMORY[0x24BDD3F98]);
  v21 = v9;
  v22 = 3221225472;
  v23 = __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_225;
  v24 = &unk_24D4E5270;
  v13 = v8;
  v25 = v13;
  v14 = (void *)objc_msgSend(v12, "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", var0, var1, 1, 0, 1, &v21);
  objc_msgSend(v14, "setDebugIdentifier:", CFSTR("WakeUpResults"), v21, v22, v23, v24);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD3F90]), "initWithIdentifier:mode:", CFSTR("WakeUpResults"), 0);
  objc_msgSend(v14, "setCacheSettings:", v15);

  HKSPLogForCategory();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v32 = v17;
    v18 = v17;
    _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetching sleep day summaries...", buf, 0xCu);

  }
  objc_msgSend(v7, "executeQuery:", v14);
  v19 = v13;

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

  return v19;
}

void __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_error_impl(&dword_21610C000, v5, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to fetch sleep day summaries with error: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

void __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_222(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v3;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully fetched sleep day summaries with result: %{public}@", (uint8_t *)&v7, 0x16u);

  }
}

uint64_t __96__HDSPWakeUpResultsNotificationManager__fetchSleepDaySummariesForMorningIndexRange_healthStore___block_invoke_225(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;

  v4 = *(void **)(a1 + 32);
  if (a3)
    return objc_msgSend(v4, "finishWithResult:");
  else
    return objc_msgSend(v4, "finishWithError:", a4);
}

- (id)_userFirstNameFromResult:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_sleepDaySummariesFromResult:(id)a3 error:(id *)a4
{
  id v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = v5;
  v8 = v7;
  v9 = v7;
  if ((isKindOfClass & 1) == 0)
  {
    if (v7)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v7);
      else
        _HKLogDroppedError();
    }

    v9 = 0;
  }

  return v9;
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
  v8 = __Block_byref_object_copy__13;
  v9 = __Block_byref_object_dispose__13;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __53__HDSPWakeUpResultsNotificationManager__currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__HDSPWakeUpResultsNotificationManager__currentState__block_invoke(uint64_t a1)
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

- (BOOL)_isDelayingForTracking
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
  v4[2] = __62__HDSPWakeUpResultsNotificationManager__isDelayingForTracking__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __62__HDSPWakeUpResultsNotificationManager__isDelayingForTracking__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isDelayingForTracking");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isWaitingForWakeUp
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
  v4[2] = __59__HDSPWakeUpResultsNotificationManager__isWaitingForWakeUp__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPWakeUpResultsNotificationManager _withLock:](self, "_withLock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __59__HDSPWakeUpResultsNotificationManager__isWaitingForWakeUp__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "isWaitingForWakeUp");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPWakeUpResultsNotificationManager _currentState](self, "_currentState");
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

- (HDSPWakeUpResultsNotificationStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (NAFuture)queryResultFuture
{
  return self->_queryResultFuture;
}

- (HKSHSleepMetricsEngine)sleepMetricsEngine
{
  return self->_sleepMetricsEngine;
}

- (HDSPActivityScheduler)retryAttemptScheduler
{
  return self->_retryAttemptScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAttemptScheduler, 0);
  objc_storeStrong((id *)&self->_sleepMetricsEngine, 0);
  objc_storeStrong((id *)&self->_queryResultFuture, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_sleepEventDelegate);
  objc_destroyWeak((id *)&self->_environment);
}

@end
