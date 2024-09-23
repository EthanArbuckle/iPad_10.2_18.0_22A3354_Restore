@implementation HDSPGoodMorningAlertPresentingState

- (double)expirationDuration
{
  return *MEMORY[0x24BEA93E0];
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)didEnter
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStateTransitionAndNotInitializing");

  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Presenting alert", (uint8_t *)&v9, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentAlertForGoodMorning");

  }
}

- (void)didExit
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStateTransitionOrInitializing");

  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Dismissing alert", (uint8_t *)&v9, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissAlertForGoodMorning");

  }
}

- (void)updateState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "goodMorningAlertEnabled") & 1) != 0)
  {
    objc_msgSend(v3, "sleepScheduleModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sleepEventRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "goodMorningDismissedDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = *MEMORY[0x24BEA95C8];
    objc_msgSend(v3, "currentDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "previousEventWithIdentifier:dueBeforeDate:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && objc_msgSend(v6, "hksp_isAfterOrSameAsDate:", v9))
    {
      HKSPLogForCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 138543618;
        v16 = (id)objc_opt_class();
        v17 = 2114;
        v18 = v6;
        v11 = v16;
        _os_log_impl(&dword_21610C000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] good morning alert dismissed %{public}@", (uint8_t *)&v15, 0x16u);

      }
      objc_msgSend(v2, "waitingState");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "enterState:", v12);

    }
  }
  else
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = (id)objc_opt_class();
      v14 = v16;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] good morning alerts disabled", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(v2, "disabledState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "enterState:", v4);
  }

}

- (void)stateDidExpire
{
  void *v2;
  id v3;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enterState:", v2);

}

- (id)stateName
{
  return CFSTR("Presenting");
}

- (void)sleepScheduleStateChangedToBedtime
{
  void *v2;
  id v3;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitingState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enterState:", v2);

}

@end
