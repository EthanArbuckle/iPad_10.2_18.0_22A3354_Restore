@implementation _HDSPSleepModeOnState

- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[HKSPStateMachineState stateName](self, "stateName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] user turn on sleep mode, ignoring because we're already in %{public}@ mode", (uint8_t *)&v8, 0x16u);

  }
}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[HKSPStateMachineState stateName](self, "stateName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on via automation, ignoring because we're already in %{public}@ mode", (uint8_t *)&v8, 0x16u);

  }
}

- (void)sleepModeTurnedOnForUnknownReason
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_opt_class();
    v5 = v4;
    -[HKSPStateMachineState stateName](self, "stateName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = v4;
    v9 = 2114;
    v10 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] sleep mode turned on for unknown reason, ignoring because we're already in %{public}@ mode", (uint8_t *)&v7, 0x16u);

  }
}

@end
