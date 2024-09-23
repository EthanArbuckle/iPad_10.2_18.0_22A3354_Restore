@implementation HDSPSleepModeAutomatedOffState

- (unint64_t)defaultChangeReason
{
  return 7;
}

- (id)stateName
{
  return CFSTR("Automated Off");
}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
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
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on via automation after having been turned off due to automation", (uint8_t *)&v7, 0xCu);

  }
  -[HDSPSleepModeAutomatedOffState _automationTurnedOnSleepModeWithReason:](self, "_automationTurnedOnSleepModeWithReason:", a3);
}

- (void)sleepModeTurnedOnForUnknownReason
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on for unknown reason after having been turned off due to automation, treating like automation on", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPSleepModeAutomatedOffState _automationTurnedOnSleepModeWithReason:](self, "_automationTurnedOnSleepModeWithReason:", 7);
}

- (void)_automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "infoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "sleepScheduleState");
  objc_msgSend(v4, "automatedOnState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldGoIntoSleepModeDuringState:", v6))
  {
    if (HKSPSleepScheduleStateIsForBedtime())
    {
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = (id)objc_opt_class();
        v9 = v21;
        _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's bedtime, going into bedtime mode", buf, 0xCu);

      }
      objc_msgSend(v4, "bedtimeState");
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v13 = (void *)v10;

      v7 = v13;
      goto LABEL_11;
    }
    if (HKSPSleepScheduleStateIsForWindDown())
    {
      HKSPLogForCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v21 = (id)objc_opt_class();
        v12 = v21;
        _os_log_impl(&dword_21610C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] it's wind down, going into wind down", buf, 0xCu);

      }
      objc_msgSend(v4, "windDownState");
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
LABEL_11:
  v17 = MEMORY[0x24BDAC760];
  v18 = v4;
  v19 = v7;
  v14 = v7;
  v15 = v4;
  +[HDSPSleepModeStateMachineContext contextWithReason:](HDSPSleepModeStateMachineContext, "contextWithReason:", a3, v17, 3221225472, __73__HDSPSleepModeAutomatedOffState__automationTurnedOnSleepModeWithReason___block_invoke, &unk_24D4E3680);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "perform:withContext:", &v17, v16);

}

uint64_t __73__HDSPSleepModeAutomatedOffState__automationTurnedOnSleepModeWithReason___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enterState:", *(_QWORD *)(a1 + 40));
}

@end
