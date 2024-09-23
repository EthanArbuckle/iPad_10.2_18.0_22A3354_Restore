@implementation HDSPGoodMorningAlertStateMachineState

- (void)updateState
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "goodMorningAlertEnabled") & 1) != 0)
  {
    objc_msgSend(v2, "waitingState");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v8 = 138543362;
      *(_QWORD *)&v8[4] = objc_opt_class();
      v6 = *(id *)&v8[4];
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] good morning alerts disabled", v8, 0xCu);

    }
    objc_msgSend(v2, "disabledState");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;
  objc_msgSend(v2, "enterState:", v4, *(_OWORD *)v8);

}

@end
