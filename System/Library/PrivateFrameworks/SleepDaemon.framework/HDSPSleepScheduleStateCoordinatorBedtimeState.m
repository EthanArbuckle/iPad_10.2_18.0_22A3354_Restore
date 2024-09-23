@implementation HDSPSleepScheduleStateCoordinatorBedtimeState

- (id)stateName
{
  return CFSTR("Bedtime");
}

- (unint64_t)scheduleState
{
  return 2;
}

- (void)wakeTimeReached
{
  void *v3;
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  uint64_t *v11;
  id v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  void *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HDSPSleepScheduleStateCoordinatorStateMachineState isAlarmEnabled](self, "isAlarmEnabled");
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v18 = (id)objc_opt_class();
      v7 = v18;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake time reached and alarm enabled", buf, 0xCu);

    }
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke;
    v15[3] = &unk_24D4E3498;
    v8 = &v16;
    v16 = v3;
    v9 = v3;
    +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v15;
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 138543362;
      v18 = (id)objc_opt_class();
      v12 = v18;
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake time reached and alarm disabled", buf, 0xCu);

    }
    v13 = MEMORY[0x24BDAC760];
    v8 = &v14;
    v14 = v3;
    v9 = v3;
    +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 1, v13, 3221225472, __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke_186, &unk_24D4E3498);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &v13;
  }
  objc_msgSend(v9, "perform:withContext:", v11, v10);

}

void __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "delayedWakeUpState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

void __64__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeTimeReached__block_invoke_186(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "wakeUpState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

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
  v11[2] = __65__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeUpConfirmed___block_invoke;
  v11[3] = &unk_24D4E3498;
  v12 = v7;
  v9 = v7;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "perform:withContext:", v11, v10);

}

void __65__HDSPSleepScheduleStateCoordinatorBedtimeState_wakeUpConfirmed___block_invoke(uint64_t a1)
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
  v8[2] = __63__HDSPSleepScheduleStateCoordinatorBedtimeState_alarmDismissed__block_invoke;
  v8[3] = &unk_24D4E3498;
  v9 = v5;
  v6 = v5;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "perform:withContext:", v8, v7);

}

void __63__HDSPSleepScheduleStateCoordinatorBedtimeState_alarmDismissed__block_invoke(uint64_t a1)
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
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BEA95C8];
  objc_msgSend(v3, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dateByAddingTimeInterval:", 900.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
