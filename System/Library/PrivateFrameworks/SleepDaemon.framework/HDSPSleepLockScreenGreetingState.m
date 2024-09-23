@implementation HDSPSleepLockScreenGreetingState

- (void)updateState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "goodMorningScreenEnabledWithLogObject:", self) & 1) == 0)
  {
    objc_msgSend(v6, "offState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enterState:", v5);

  }
}

- (void)dismissAlertForGoodMorning
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = (id)objc_opt_class();
    v4 = v8;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] dismissing good morning alert", (uint8_t *)&v7, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "offState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v6);

}

- (id)stateName
{
  return CFSTR("Greeting");
}

- (int64_t)sleepLockScreenState
{
  return 3;
}

@end
