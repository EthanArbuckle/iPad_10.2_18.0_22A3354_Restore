@implementation HDSPSleepModeStateMachineState

- (void)didEnter
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int64_t v8;
  uint64_t v9;
  id v10;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v10, "hasStateTransitionOrInitializing"))
    goto LABEL_15;
  objc_msgSend(v10, "previousState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v10, "reason");
LABEL_10:
    v6 = v5;
    goto LABEL_11;
  }
  if (-[HDSPSleepModeStateMachineState defaultChangeReason](self, "defaultChangeReason") != 10)
  {
    v5 = -[HDSPSleepModeStateMachineState defaultChangeReason](self, "defaultChangeReason");
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "reason");
    if (HKSPSleepScheduleStateChangeReasonIsExpected())
      v6 = 2;
    else
      v6 = 10;
  }
  else
  {
    v6 = 10;
  }
LABEL_11:
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HDSPSleepModeStateMachineState sleepMode](self, "sleepMode");
  if (v4)
    v9 = objc_msgSend(v4, "sleepMode");
  else
    v9 = 0;
  objc_msgSend(v7, "sleepModeDidChange:previousMode:reason:", v8, v9, v6);

LABEL_15:
}

- (void)updateStateFromTimeline
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint8_t v13[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!-[HDSPSleepModeStateMachineState updateStateCommon](self, "updateStateCommon"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "shouldGoIntoSleepModeDuringState:", objc_msgSend(v4, "sleepScheduleState")))
    {
      if (HKSPSleepScheduleStateIsForBedtime())
      {
        HKSPLogForCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v13 = 138543362;
          *(_QWORD *)&v13[4] = objc_opt_class();
          v6 = *(id *)&v13[4];
          _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, turning on bedtime mode if it's not on", v13, 0xCu);

        }
        objc_msgSend(v3, "bedtimeState");
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v12 = (void *)v7;
        objc_msgSend(v3, "enterState:", v7, *(_OWORD *)v13);

        return;
      }
      if (HKSPSleepScheduleStateIsForWindDown())
      {
        HKSPLogForCategory();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v13 = 138543362;
          *(_QWORD *)&v13[4] = objc_opt_class();
          v9 = *(id *)&v13[4];
          _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, turning on wind down mode if it's not on", v13, 0xCu);

        }
        objc_msgSend(v3, "windDownState");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
    }
    HKSPLogForCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v13 = 138543362;
      *(_QWORD *)&v13[4] = objc_opt_class();
      v11 = *(id *)&v13[4];
      _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] turning off sleep mode if it's on", v13, 0xCu);

    }
    objc_msgSend(v3, "offState");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
}

- (BOOL)updateStateCommon
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  id *v8;
  id v9;
  void *v10;
  uint64_t *v11;
  void *v12;
  char v13;
  BOOL v14;
  NSObject *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAppleWatch") & 1) != 0)
  {
    objc_msgSend(v2, "infoProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "sleepFeaturesEnabled");

    if ((v5 & 1) == 0)
    {
      HKSPLogForCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v23 = (id)objc_opt_class();
        v7 = v23;
        _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep features disabled", buf, 0xCu);

      }
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke;
      v20[3] = &unk_24D4E3498;
      v8 = &v21;
      v9 = v2;
      v21 = v9;
      +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", 10);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;
LABEL_12:
      objc_msgSend(v9, "perform:withContext:", v11, v10);

      v14 = 1;
      goto LABEL_13;
    }
  }
  else
  {

  }
  objc_msgSend(v2, "infoProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasSleepFocusMode");

  if ((v13 & 1) == 0)
  {
    HKSPLogForCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = (id)objc_opt_class();
      v16 = v23;
      _os_log_impl(&dword_21610C000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] no sleep focus mode exists", buf, 0xCu);

    }
    v18 = MEMORY[0x24BDAC760];
    v8 = (id *)&v19;
    v9 = v2;
    +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", 9, v18, 3221225472, __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke_185, &unk_24D4E3498, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = &v18;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_13:

  return v14;
}

void __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "offState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

void __51__HDSPSleepModeStateMachineState_updateStateCommon__block_invoke_185(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "offState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (int64_t)sleepMode
{
  return 0;
}

- (unint64_t)defaultChangeReason
{
  return 10;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldGoIntoSleepModeDuringState:", 3);

  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v10 = v17;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, turning on sleep mode mode", buf, 0xCu);

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __80__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWindDown_fromState___block_invoke;
    v14[3] = &unk_24D4E3498;
    v15 = v5;
    +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "perform:withContext:", v14, v11);

    v12 = v15;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v13 = v17;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down but sleep mode is disabled, turning off sleep mode", buf, 0xCu);

    }
    objc_msgSend(v5, "offState");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v12);
  }

}

void __80__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWindDown_fromState___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "windDownState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldGoIntoSleepModeDuringState:", 2);

  HKSPLogForCategory();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v10 = v17;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, turning on sleep mode mode", buf, 0xCu);

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __79__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToBedtime_fromState___block_invoke;
    v14[3] = &unk_24D4E3498;
    v15 = v5;
    +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "perform:withContext:", v14, v11);

    v12 = v15;
  }
  else
  {
    if (v9)
    {
      *(_DWORD *)buf = 138543362;
      v17 = (id)objc_opt_class();
      v13 = v17;
      _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime but sleep mode is disabled, turning off sleep mode", buf, 0xCu);

    }
    objc_msgSend(v5, "offState");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v12);
  }

}

void __79__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToBedtime_fromState___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "bedtimeState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4
{
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v7 = v13;
    _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wake up, turning off sleep mode", buf, 0xCu);

  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __78__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWakeUp_fromState___block_invoke;
  v10[3] = &unk_24D4E3498;
  v11 = v5;
  v8 = v5;
  +[HDSPSleepScheduleStateCoordinatorStateMachineContext contextWithReason:](HDSPSleepScheduleStateCoordinatorStateMachineContext, "contextWithReason:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "perform:withContext:", v10, v9);

}

void __78__HDSPSleepModeStateMachineState_sleepScheduleStateChangedToWakeUp_fromState___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "offState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)sleepScheduleStateChangedToDisabled
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep schedule state was disabled", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepModeStateMachineState updateStateFromTimeline](self, "updateStateFromTimeline");
}

- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    NSStringFromHKSPSleepModeChangeReason();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v14 = v6;
    v15 = 2114;
    v16 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on (%{public}@)", buf, 0x16u);

  }
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__HDSPSleepModeStateMachineState_userTurnedOnSleepModeWithReason___block_invoke;
  v11[3] = &unk_24D4E3498;
  v12 = v4;
  v9 = v4;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "perform:withContext:", v11, v10);

}

void __66__HDSPSleepModeStateMachineState_userTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "manualOnState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)userTurnedOffSleepModeWithReason:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    NSStringFromHKSPSleepModeChangeReason();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned off by user (%{public}@)", buf, 0x16u);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__HDSPSleepModeStateMachineState_userTurnedOffSleepModeWithReason___block_invoke;
  v12[3] = &unk_24D4E3498;
  v13 = v9;
  v10 = v9;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "perform:withContext:", v12, v11);

}

void __67__HDSPSleepModeStateMachineState_userTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "manualOffState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on via automation", buf, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__HDSPSleepModeStateMachineState_automationTurnedOnSleepModeWithReason___block_invoke;
  v10[3] = &unk_24D4E3498;
  v11 = v7;
  v8 = v7;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "perform:withContext:", v10, v9);

}

void __72__HDSPSleepModeStateMachineState_automationTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "automatedOnState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)automationTurnedOffSleepModeWithReason:(unint64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v6 = v13;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned off via automation", buf, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __73__HDSPSleepModeStateMachineState_automationTurnedOffSleepModeWithReason___block_invoke;
  v10[3] = &unk_24D4E3498;
  v11 = v7;
  v8 = v7;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "perform:withContext:", v10, v9);

}

void __73__HDSPSleepModeStateMachineState_automationTurnedOffSleepModeWithReason___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "automatedOffState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)sleepModeTurnedOnForUnknownReason
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on for an unknown reason, treating as user requested", buf, 0xCu);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__HDSPSleepModeStateMachineState_sleepModeTurnedOnForUnknownReason__block_invoke;
  v7[3] = &unk_24D4E3498;
  v8 = v2;
  v5 = v2;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "perform:withContext:", v7, v6);

}

void __67__HDSPSleepModeStateMachineState_sleepModeTurnedOnForUnknownReason__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "manualOnState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

- (void)sleepModeTurnedOffForUnknownReason
{
  void *v2;
  NSObject *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = (id)objc_opt_class();
    v4 = v10;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned off for an unknown reason, treating as user requested", buf, 0xCu);

  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__HDSPSleepModeStateMachineState_sleepModeTurnedOffForUnknownReason__block_invoke;
  v7[3] = &unk_24D4E3498;
  v8 = v2;
  v5 = v2;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "perform:withContext:", v7, v6);

}

void __68__HDSPSleepModeStateMachineState_sleepModeTurnedOffForUnknownReason__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "manualOffState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterState:", v2);

}

@end
