@implementation HDSPWakeUpResultsNotificationNeedsProtectedDataState

- (id)stateName
{
  return CFSTR("NeedsProtectedData");
}

- (id)expirationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDSPWakeUpResultsNotificationStateMachineState infoProvider](self, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeUpResultsNotificationStateMachineState infoProvider](self, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationAttemptWindowForWakeUpBeforeDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didEnter
{
  void *v3;
  void *v4;
  int v5;
  id v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStateTransitionOrInitializing");

  if (v5)
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startObservingProtectedHealthDataAvailability");

  }
}

- (void)didExit
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasStateTransitionOrInitializing"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextState");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "queryingState");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v12, "nextState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "queryingState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());

        if ((v11 & 1) != 0)
          goto LABEL_8;
      }
      else
      {

      }
    }
    objc_msgSend(v4, "stopObservingProtectedHealthDataAvailability");
LABEL_8:

  }
}

- (void)protectedHealthDataDidBecomeAvailable
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received protected heath data available event", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationNeedsProtectedDataState _transitionToQueryingState](self, "_transitionToQueryingState");
}

- (void)_transitionToQueryingState
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Transitioning to querying state", (uint8_t *)&v7, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v6);

}

@end
