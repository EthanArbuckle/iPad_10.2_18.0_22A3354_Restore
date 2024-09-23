@implementation HDSPSleepLockScreenStateMachineState

- (void)didEnter
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasStateTransitionOrInitializing"))
  {
    objc_msgSend(v6, "previousState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sleepLockScreenStateDidChange:previousState:", -[HDSPSleepLockScreenStateMachineState sleepLockScreenState](self, "sleepLockScreenState"), objc_msgSend(v4, "sleepLockScreenState"));

  }
}

- (void)presentAlertForGoodMorning
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  _BOOL4 v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint8_t v11[24];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLockScreenActive");

  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = objc_opt_class();
      v7 = *(id *)&v11[4];
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] presenting good morning alert", v11, 0xCu);

    }
    objc_msgSend(v2, "greetingState");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)v11 = 138543362;
      *(_QWORD *)&v11[4] = objc_opt_class();
      v9 = *(id *)&v11[4];
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping good morning alert, lock screen isn't active", v11, 0xCu);

    }
    objc_msgSend(v2, "offState");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;
  objc_msgSend(v2, "enterState:", v8, *(_OWORD *)v11);

}

- (void)updateState
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoProvider");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v6, "sleepMode");
  if (objc_msgSend(v6, "inUnscheduledSleepMode"))
    v5 = 1;
  else
    v5 = 10;
  -[HDSPSleepLockScreenStateMachineState _updateStateForSleepMode:reason:](self, "_updateStateForSleepMode:reason:", v4, v5);

}

- (void)_updateStateForSleepMode:(int64_t)a3 reason:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDSPSleepLockScreenStateMachineState _isSleepLockScreenDisabled](self, "_isSleepLockScreenDisabled"))
  {
    objc_msgSend(v6, "offState");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v8 = (void *)v7;
    objc_msgSend(v6, "enterState:", v7);
LABEL_13:

    goto LABEL_14;
  }
  switch(a3)
  {
    case 0:
      objc_msgSend(v6, "infoProvider");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sleepScheduleModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "goodMorningScreenEnabledWithLogObject:", self) & 1) != 0)
      {
        v10 = HKSPSleepModeChangeReasonTreatedAsExpected();
        HKSPLogForCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            v17 = 138543362;
            v18 = (id)objc_opt_class();
            v13 = v18;
            _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode is off, waiting to be told to present greeting", (uint8_t *)&v17, 0xCu);

          }
          goto LABEL_19;
        }
        if (v12)
        {
          v14 = (void *)objc_opt_class();
          v15 = v14;
          NSStringFromHKSPSleepModeChangeReason();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543618;
          v18 = v14;
          v19 = 2114;
          v20 = v16;
          _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode is off, not presenting greeting (%{public}@)", (uint8_t *)&v17, 0x16u);

        }
      }
      objc_msgSend(v6, "offState");
      v11 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "enterState:", v11);
LABEL_19:

      goto LABEL_13;
    case 2:
      objc_msgSend(v6, "bedtimeState");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 1:
      objc_msgSend(v6, "windDownState");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
  }
LABEL_14:

}

- (int64_t)sleepLockScreenState
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

- (BOOL)_isSleepLockScreenDisabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __int16 v6;
  NSObject *v7;
  id v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepModeOptions");
  if ((v6 & 0x4000) == 0)
  {
    HKSPLogForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = (id)objc_opt_class();
      v8 = v11;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep screen disabled", (uint8_t *)&v10, 0xCu);

    }
  }

  return (v6 & 0x4000) == 0;
}

@end
