@implementation HDSPGoodMorningAlertWaitingState

- (id)stateName
{
  return CFSTR("Waiting");
}

- (void)sleepScheduleStateChangedToWakeUp
{
  void *v2;
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAppleWatch") && objc_msgSend(v3, "isOnCharger"))
  {
    HKSPLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543362;
      v8 = (id)objc_opt_class();
      v5 = v8;
      _os_log_impl(&dword_21610C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] skipping good morning alert, watch is charging", (uint8_t *)&v7, 0xCu);

    }
  }
  else
  {
    objc_msgSend(v2, "presentingState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enterState:", v6);

  }
}

@end
