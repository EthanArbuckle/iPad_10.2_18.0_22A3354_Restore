@implementation HDSPSleepScheduleStateCoordinator

- (HDSPSleepScheduleStateCoordinator)initWithEnvironment:(id)a3
{
  id v4;
  HDSPSleepScheduleStateCoordinator *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  HKSPObserverSet *observers;
  void (**v13)(void);
  uint64_t v14;
  HKSPMutexProvider *mutexProvider;
  HDSPSleepScheduleStateCoordinatorStateMachine *v16;
  objc_class *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  HDSPSleepScheduleStateCoordinatorStateMachine *stateMachine;
  HDSPSleepScheduleStateCoordinator *v25;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  HDSPSleepScheduleStateCoordinator *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDSPSleepScheduleStateCoordinator;
  v5 = -[HDSPSleepScheduleStateCoordinator init](&v27, sel_init);
  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v29 = v7;
      v30 = 2048;
      v31 = v5;
      v8 = v7;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@.%p] initializing...", buf, 0x16u);

    }
    objc_storeWeak((id *)&v5->_environment, v4);
    v9 = objc_alloc(MEMORY[0x24BEA98C8]);
    objc_msgSend(v4, "defaultCallbackScheduler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "initWithCallbackScheduler:", v10);
    observers = v5->_observers;
    v5->_observers = (HKSPObserverSet *)v11;

    objc_msgSend(v4, "mutexGenerator");
    v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v13[2]();
    v14 = objc_claimAutoreleasedReturnValue();
    mutexProvider = v5->_mutexProvider;
    v5->_mutexProvider = (HKSPMutexProvider *)v14;

    v16 = [HDSPSleepScheduleStateCoordinatorStateMachine alloc];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x24BEA9980]);
    objc_msgSend(v4, "userDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithUserDefaults:", v20);
    objc_msgSend(v4, "currentDateProvider");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HDSPSleepScheduleStateCoordinatorStateMachine initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:](v16, "initWithIdentifier:persistence:delegate:infoProvider:currentDateProvider:", v18, v21, v5, v5, v22);
    stateMachine = v5->_stateMachine;
    v5->_stateMachine = (HDSPSleepScheduleStateCoordinatorStateMachine *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)_withLock:(id)a3
{
  -[HKSPMutexProvider performBlock:](self->_mutexProvider, "performBlock:", a3);
}

- (void)addObserver:(id)a3
{
  -[HKSPObserverSet addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[HKSPObserverSet removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)_updateSleepScheduleState
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] _updateSleepScheduleState", buf, 0xCu);

  }
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __62__HDSPSleepScheduleStateCoordinator__updateSleepScheduleState__block_invoke;
  v5[3] = &unk_24D4E3498;
  v5[4] = self;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v5);
}

uint64_t __62__HDSPSleepScheduleStateCoordinator__updateSleepScheduleState__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateState");
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
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] environmentWillBecomeReady", (uint8_t *)&v12, 0xCu);

  }
  objc_msgSend(v4, "sleepScheduleModelManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:", self);

  objc_msgSend(v4, "sleepScheduler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEventHandler:", self);

  objc_msgSend(v4, "actionManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:", self);

  objc_msgSend(v4, "timeChangeListener");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:", self);

  objc_msgSend(v4, "diagnostics");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addProvider:", self);
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
  v6[2] = __63__HDSPSleepScheduleStateCoordinator_environmentDidBecomeReady___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v6);
}

uint64_t __63__HDSPSleepScheduleStateCoordinator_environmentDidBecomeReady___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "updateState");
}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_opt_class();
    v19 = v12;
    NSStringFromHKSPSleepScheduleState();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKSPSleepScheduleState();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reason");
    NSStringFromHKSPSleepScheduleStateChangeReason();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v26 = v12;
    v27 = 2114;
    v28 = v13;
    v29 = 2114;
    v30 = v14;
    v31 = 2114;
    v32 = v15;
    _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] notifying observers for sleepScheduleStateDidChange from %{public}@ to %{public}@ with reason %{public}@", buf, 0x2Au);

  }
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke;
  v20[3] = &unk_24D4E57E0;
  v23 = a3;
  v24 = a4;
  v20[4] = self;
  v21 = v8;
  v22 = v10;
  v16 = v10;
  v17 = v8;
  v18 = (void *)MEMORY[0x2199F586C](v20);
  -[HDSPSleepScheduleStateCoordinator _updateEventRecordForSleepScheduleState:context:notifyBlock:](self, "_updateEventRecordForSleepScheduleState:context:notifyBlock:", a3, v17, v18);

}

id __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  id v8;
  id v9;
  __int128 v10;

  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_2;
  v7[3] = &unk_24D4E57B8;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = *(void **)(v2 + 32);
  v7[1] = 3221225472;
  v7[4] = v2;
  v10 = *(_OWORD *)(a1 + 56);
  v8 = v3;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObserversWithFutureBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  id v14;
  __int128 v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_3;
  v12 = &unk_24D4E5790;
  v13 = v3;
  v15 = *(_OWORD *)(a1 + 56);
  v14 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = v3;
  objc_msgSend(v4, "perform:withContext:", &v9, v5);

  objc_msgSend(MEMORY[0x24BE6B608], "futureWithNoResult", v9, v10, v11, v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __87__HDSPSleepScheduleStateCoordinator_sleepScheduleStateDidChange_previousState_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sleepScheduleStateDidChange:previousState:reason:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "reason"));
}

- (void)_updateEventRecordForSleepScheduleState:(unint64_t)a3 context:(id)a4 notifyBlock:(id)a5
{
  uint64_t (**v8)(_QWORD);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  HDSPSleepScheduleStateCoordinator *v21;
  uint64_t (**v22)(_QWORD);

  v8 = (uint64_t (**)(_QWORD))a5;
  v9 = a4;
  -[HDSPSleepScheduleStateCoordinator sleepScheduleModel](self, "sleepScheduleModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sleepEventRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  LODWORD(a3) = -[HDSPSleepScheduleStateCoordinator _updateEventRecordHelper:sleepScheduleState:context:](self, "_updateEventRecordHelper:sleepScheduleState:context:", v12, a3, v9);
  if ((_DWORD)a3)
  {
    -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "sleepScheduleModelManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __97__HDSPSleepScheduleStateCoordinator__updateEventRecordForSleepScheduleState_context_notifyBlock___block_invoke;
    v18[3] = &unk_24D4E5808;
    v19 = v14;
    v20 = v12;
    v21 = self;
    v22 = v8;
    v16 = v14;
    objc_msgSend(v15, "perform:withSource:", v18, self);

  }
  else
  {
    v17 = (id)v8[2](v8);
  }

}

void __97__HDSPSleepScheduleStateCoordinator__updateEventRecordForSleepScheduleState_context_notifyBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v9 = 0;
  v4 = objc_msgSend(v2, "saveSleepEventRecord:error:preNotifyBlock:", v3, &v9, a1[7]);
  v5 = v9;
  if ((v4 & 1) == 0)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v5;
      v8 = v7;
      _os_log_error_impl(&dword_21610C000, v6, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

- (BOOL)_updateEventRecordHelper:(id)a3 sleepScheduleState:(unint64_t)a4 context:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  BOOL v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (a4 == 1 && objc_msgSend(a5, "isForAlarmTurnedOffWhileFiring"))
  {
    -[HDSPSleepScheduleStateCoordinator currentDate](self, "currentDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543618;
      v15 = (id)objc_opt_class();
      v16 = 2114;
      v17 = v9;
      v11 = v15;
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] setting wakeUpAlarmDismissedDate to %{public}@", (uint8_t *)&v14, 0x16u);

    }
    objc_msgSend(v8, "setWakeUpAlarmDismissedDate:", v9);

    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)snoozeFireDateShouldBeReset
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  HDSPSleepScheduleStateCoordinator *v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v19 = (id)objc_opt_class();
    v4 = v19;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] snoozeFireDateShouldBeReset", buf, 0xCu);

  }
  -[HDSPSleepScheduleStateCoordinator sleepScheduleModel](self, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepEventRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "setWakeUpAlarmSnoozedUntilDate:", 0);
  -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __64__HDSPSleepScheduleStateCoordinator_snoozeFireDateShouldBeReset__block_invoke;
  v15 = &unk_24D4E3680;
  v16 = self;
  v17 = v7;
  v9 = v7;
  objc_msgSend(v8, "perform:withSource:", &v12, self);

  -[HDSPSleepScheduleStateCoordinator environment](self, "environment", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sleepAlarmManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resetSleepAlarmSnoozeState");

}

void __64__HDSPSleepScheduleStateCoordinator_snoozeFireDateShouldBeReset__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  v5 = objc_msgSend(v3, "saveSleepEventRecord:error:", v4, &v10);
  v6 = v10;

  if ((v5 & 1) == 0)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2114;
      v14 = v6;
      v9 = v8;
      _os_log_error_impl(&dword_21610C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] failed to save event record with error %{public}@", buf, 0x16u);

    }
  }

}

- (unint64_t)currentSleepScheduleState
{
  void *v2;
  unint64_t v3;

  -[HDSPSleepScheduleStateCoordinator currentState](self, "currentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduleState");

  return v3;
}

- (BOOL)isAppleWatch
{
  void *v2;
  void *v3;
  char v4;

  -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
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

  -[HDSPSleepScheduleStateCoordinator sleepScheduleModel](self, "sleepScheduleModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "watchSleepFeaturesEnabled");

  return v4;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  void *v2;
  void *v3;
  void *v4;

  -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleModelManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleModel *)v4;
}

- (NSDate)currentDate
{
  void *v2;
  void (**v3)(void);
  void *v4;

  -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDateProvider");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v3[2]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (HKSPSleepScheduleOccurrence)previousOccurrence
{
  void *v3;
  void *v4;
  void *v5;

  -[HDSPSleepScheduleStateCoordinator sleepScheduleModel](self, "sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPSleepScheduleStateCoordinator currentDate](self, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousOccurrenceBeforeDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleOccurrence *)v5;
}

- (void)sleepScheduleModelManager:(id)a3 didUpdateSleepScheduleModel:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = (id)objc_opt_class();
    v15 = 2114;
    v16 = v5;
    v7 = v14;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] didUpdateSleepScheduleModel: %{public}@", buf, 0x16u);

  }
  -[HDSPSleepScheduleStateCoordinator environment](self, "environment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __91__HDSPSleepScheduleStateCoordinator_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke;
  v11[3] = &unk_24D4E3680;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v11);

}

void __91__HDSPSleepScheduleStateCoordinator_sleepScheduleModelManager_didUpdateSleepScheduleModel___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "changeEvaluation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleModelChanged:", v2);

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
  v6[2] = __67__HDSPSleepScheduleStateCoordinator_significantTimeChangeDetected___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v6);
}

uint64_t __67__HDSPSleepScheduleStateCoordinator_significantTimeChangeDetected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "significantTimeChange");
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
  v6[2] = __60__HDSPSleepScheduleStateCoordinator_timeZoneChangeDetected___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v6);
}

uint64_t __60__HDSPSleepScheduleStateCoordinator_timeZoneChangeDetected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "timeZoneChange");
}

- (void)sleepEventIsDue:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t (*v12)(uint64_t);
  uint64_t *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v28 = (id)objc_opt_class();
    v29 = 2114;
    v30 = v4;
    v6 = v28;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleepEventIsDue: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEA95C8]);

  if (v8)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v10;
      v11 = v10;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeTimeReached", buf, 0xCu);

    }
    v26 = MEMORY[0x24BDAC760];
    v12 = __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke;
    v13 = &v26;
LABEL_15:
    v13[1] = 3221225472;
    v13[2] = (uint64_t)v12;
    v13[3] = (uint64_t)&unk_24D4E3498;
    v13[4] = (uint64_t)self;
    -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:");
    goto LABEL_16;
  }
  objc_msgSend(v4, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BEA95A0]);

  if (v15)
  {
    HKSPLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      v18 = v17;
      _os_log_impl(&dword_21610C000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] bedtimeReached", buf, 0xCu);

    }
    v25 = MEMORY[0x24BDAC760];
    v12 = __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_189;
    v13 = &v25;
    goto LABEL_15;
  }
  objc_msgSend(v4, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x24BEA95D8]);

  if (v20)
  {
    HKSPLogForCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138543362;
      v28 = v22;
      v23 = v22;
      _os_log_impl(&dword_21610C000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] windDownReached", buf, 0xCu);

    }
    v24 = MEMORY[0x24BDAC760];
    v12 = __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_190;
    v13 = &v24;
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "wakeTimeReached");
}

uint64_t __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_189(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "bedtimeReached");
}

uint64_t __53__HDSPSleepScheduleStateCoordinator_sleepEventIsDue___block_invoke_190(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "windDownReached");
}

- (id)eventIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x24BEA98F8], "standardEventIdentifiers");
}

- (void)wakeUpWasConfirmed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v10 = (id)objc_opt_class();
    v11 = 1024;
    v12 = v3;
    v6 = v10;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeUpWasConfirmed (wasExplicitConfirmation: %d)", buf, 0x12u);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__HDSPSleepScheduleStateCoordinator_wakeUpWasConfirmed___block_invoke;
  v7[3] = &unk_24D4E5830;
  v7[4] = self;
  v8 = v3;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v7);
}

uint64_t __56__HDSPSleepScheduleStateCoordinator_wakeUpWasConfirmed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "wakeUpConfirmed:", *(unsigned __int8 *)(a1 + 40));
}

- (void)wakeUpAlarmWasDismissedFromSource:(unint64_t)a3
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
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeUpAlarmWasDismissed", buf, 0xCu);

  }
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __71__HDSPSleepScheduleStateCoordinator_wakeUpAlarmWasDismissedFromSource___block_invoke;
  v6[3] = &unk_24D4E3498;
  v6[4] = self;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v6);
}

uint64_t __71__HDSPSleepScheduleStateCoordinator_wakeUpAlarmWasDismissedFromSource___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "alarmDismissed");
}

- (NSString)sourceIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
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
  v8 = __Block_byref_object_copy__17;
  v9 = __Block_byref_object_dispose__17;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__HDSPSleepScheduleStateCoordinator_currentState__block_invoke;
  v4[3] = &unk_24D4E3CE8;
  v4[4] = self;
  v4[5] = &v5;
  -[HDSPSleepScheduleStateCoordinator _withLock:](self, "_withLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __49__HDSPSleepScheduleStateCoordinator_currentState__block_invoke(uint64_t a1)
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

- (id)diagnosticDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HDSPSleepScheduleStateCoordinator currentState](self, "currentState");
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
  -[HDSPSleepScheduleStateCoordinator currentState](self, "currentState");
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

- (HDSPSleepScheduleStateCoordinatorStateMachine)stateMachine
{
  return self->_stateMachine;
}

- (HKSPObserverSet)observers
{
  return self->_observers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
  objc_storeStrong((id *)&self->_mutexProvider, 0);
  objc_destroyWeak((id *)&self->_environment);
}

@end
