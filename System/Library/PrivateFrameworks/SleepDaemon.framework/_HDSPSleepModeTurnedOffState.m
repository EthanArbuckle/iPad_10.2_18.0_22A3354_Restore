@implementation _HDSPSleepModeTurnedOffState

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)*MEMORY[0x24BEA95A0];
  objc_msgSend(v4, "sleepSchedule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windDownTime");
  v8 = v7;

  if (v8 > 0.0)
  {
    v9 = (id)*MEMORY[0x24BEA95D8];

    v5 = v9;
  }
  objc_msgSend(v3, "currentDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  HKSPLogForCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543874;
    v16 = (id)objc_opt_class();
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v11;
    v13 = v16;
    _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] keeping off until next %{public}@ at %{public}@", (uint8_t *)&v15, 0x20u);

  }
  return v11;
}

- (void)updateState
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!-[HDSPSleepModeStateMachineState updateStateCommon](self, "updateStateCommon"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "shouldGoIntoSleepModeDuringState:", objc_msgSend(v4, "sleepScheduleState")) & 1) == 0)
    {
      HKSPLogForCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138543362;
        v9 = (id)objc_opt_class();
        v6 = v9;
        _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] going to regular off state", (uint8_t *)&v8, 0xCu);

      }
      objc_msgSend(v3, "offState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "enterState:", v7);

    }
  }
}

- (BOOL)_shouldUpdateSleepModeStateForState:(unint64_t)a3 changeReason:(unint64_t)a4 previousState:(unint64_t)a5
{
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  id v16;
  const char *v17;
  void *v18;
  BOOL v19;
  void *v20;
  id v21;
  const char *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
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
    v25 = 138544130;
    v26 = v8;
    v27 = 2114;
    v28 = v10;
    v29 = 2114;
    v30 = v11;
    v31 = 2114;
    v32 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] %{public}@ entered from %{public}@ (%{public}@)", (uint8_t *)&v25, 0x2Au);

  }
  if (a5 - 4 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    if (a4 == 5)
    {
      HKSPLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (a5)
      {
        if (v14)
        {
          v15 = (void *)objc_opt_class();
          v25 = 138543362;
          v26 = v15;
          v16 = v15;
          v17 = "[%{public}@] ignoring initial state change";
LABEL_10:
          _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v25, 0xCu);

          goto LABEL_11;
        }
        goto LABEL_11;
      }
      if (v14)
      {
        v23 = (void *)objc_opt_class();
        v25 = 138543362;
        v26 = v23;
        v21 = v23;
        v22 = "[%{public}@] updating for initial change because schedule was previously disabled";
        goto LABEL_16;
      }
    }
    else
    {
      HKSPLogForCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (void *)objc_opt_class();
        v25 = 138543362;
        v26 = v20;
        v21 = v20;
        v22 = "[%{public}@] updating";
LABEL_16:
        _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v25, 0xCu);

      }
    }
    v19 = 1;
    goto LABEL_18;
  }
  HKSPLogForCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_opt_class();
    v25 = 138543362;
    v26 = v18;
    v16 = v18;
    v17 = "[%{public}@] ignoring";
    goto LABEL_10;
  }
LABEL_11:
  v19 = 0;
LABEL_18:

  return v19;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  objc_super v7;

  if (-[_HDSPSleepModeTurnedOffState _shouldUpdateSleepModeStateForState:changeReason:previousState:](self, "_shouldUpdateSleepModeStateForState:changeReason:previousState:", 3, a3, a4))
  {
    v7.receiver = self;
    v7.super_class = (Class)_HDSPSleepModeTurnedOffState;
    -[HDSPSleepModeStateMachineState sleepScheduleStateChangedToWindDown:fromState:](&v7, sel_sleepScheduleStateChangedToWindDown_fromState_, a3, a4);
  }
}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  objc_super v7;

  if (-[_HDSPSleepModeTurnedOffState _shouldUpdateSleepModeStateForState:changeReason:previousState:](self, "_shouldUpdateSleepModeStateForState:changeReason:previousState:", 2, a3, a4))
  {
    v7.receiver = self;
    v7.super_class = (Class)_HDSPSleepModeTurnedOffState;
    -[HDSPSleepModeStateMachineState sleepScheduleStateChangedToBedtime:fromState:](&v7, sel_sleepScheduleStateChangedToBedtime_fromState_, a3, a4);
  }
}

@end
