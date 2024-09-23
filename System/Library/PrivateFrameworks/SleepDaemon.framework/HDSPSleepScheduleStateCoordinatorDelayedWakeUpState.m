@implementation HDSPSleepScheduleStateCoordinatorDelayedWakeUpState

- (id)stateName
{
  return CFSTR("DelayedWakeUp");
}

- (unint64_t)scheduleState
{
  return 6;
}

- (void)didExit
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSPSleepScheduleStateCoordinatorDelayedWakeUpState;
  -[HKSPStateMachineState didExit](&v7, sel_didExit);
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStateTransitionOrInitializing");

  if (v5)
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "snoozeFireDateShouldBeReset");

  }
}

- (void)wakeUpConfirmed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = (id)objc_opt_class();
    v15 = 1024;
    v16 = v3;
    v6 = v14;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up was confirmed (wasExplicitConfirmation: %d)", buf, 0x12u);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v8 = 3;
  else
    v8 = 8;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __71__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_wakeUpConfirmed___block_invoke;
  v11[3] = &unk_24D4E3498;
  v12 = v7;
  v9 = v7;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "perform:withContext:", v11, v10);

}

void __71__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_wakeUpConfirmed___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "wakeUpState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)alarmDismissed
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake up alarm was dismissed", buf, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_alarmDismissed__block_invoke;
  v8[3] = &unk_24D4E3498;
  v9 = v5;
  v6 = v5;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "perform:withContext:", v8, v7);

}

void __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_alarmDismissed__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "wakeUpState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)significantScheduleChangeOccurred:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "snoozeFireDateShouldBeReset");

  v6.receiver = self;
  v6.super_class = (Class)HDSPSleepScheduleStateCoordinatorDelayedWakeUpState;
  -[HDSPSleepScheduleStateCoordinatorStateMachineState significantScheduleChangeOccurred:](&v6, sel_significantScheduleChangeOccurred_, a3);
}

- (void)updateStateForcibly:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_super v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v3 = a3;
  v14 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDSPSleepScheduleStateCoordinatorStateMachineState isAlarmEnabled](self, "isAlarmEnabled"))
  {
    v9.receiver = self;
    v9.super_class = (Class)HDSPSleepScheduleStateCoordinatorDelayedWakeUpState;
    -[HDSPSleepScheduleStateCoordinatorStateMachineState updateStateForcibly:](&v9, sel_updateStateForcibly_, v3);
  }
  else
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = (id)objc_opt_class();
      v7 = v13;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] treating disabled alarm as confirmed wake up", buf, 0xCu);

    }
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __75__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_updateStateForcibly___block_invoke;
    v10[3] = &unk_24D4E3498;
    v11 = v5;
    +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextForAlarmTurnedOffWhileFiring](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextForAlarmTurnedOffWhileFiring");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "perform:withContext:", v10, v8);

  }
}

void __75__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_updateStateForcibly___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "wakeUpState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  double v16;
  NSObject *v17;
  id v18;
  int v20;
  id v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepEventRecord");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wakeUpAlarmSnoozedUntilDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hksp_isAfterDate:", v6);

  if (v8)
  {
    HKSPLogForCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (void *)objc_opt_class();
      v11 = v10;
      objc_msgSend(v5, "wakeUpAlarmSnoozedUntilDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v10;
      v22 = 2114;
      v23 = v12;
      _os_log_impl(&dword_21610C000, v9, OS_LOG_TYPE_DEFAULT, "[%{public}@] still waiting for snoozed alarm %{public}@", (uint8_t *)&v20, 0x16u);

    }
    v13 = 0;
  }
  else
  {
    objc_msgSend(v4, "sleepSchedule");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windDownTime");
    v15 = (id *)MEMORY[0x24BEA95D8];
    if (v16 <= 0.0)
      v15 = (id *)MEMORY[0x24BEA95A0];
    v9 = *v15;

    objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", v9, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    HKSPLogForCategory();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138543618;
      v21 = (id)objc_opt_class();
      v22 = 2114;
      v23 = v13;
      v18 = v21;
      _os_log_impl(&dword_21610C000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] waiting until %{public}@", (uint8_t *)&v20, 0x16u);

    }
  }

  return v13;
}

- (void)windDownReached
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's time for wind down", buf, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_windDownReached__block_invoke;
  v8[3] = &unk_24D4E3498;
  v9 = v5;
  v6 = v5;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "perform:withContext:", v8, v7);

}

void __70__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_windDownReached__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "windDownState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)bedtimeReached
{
  NSObject *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's time for bed", buf, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_bedtimeReached__block_invoke;
  v8[3] = &unk_24D4E3498;
  v9 = v5;
  v6 = v5;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "perform:withContext:", v8, v7);

}

void __69__HDSPSleepScheduleStateCoordinatorDelayedWakeUpState_bedtimeReached__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bedtimeState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

@end
