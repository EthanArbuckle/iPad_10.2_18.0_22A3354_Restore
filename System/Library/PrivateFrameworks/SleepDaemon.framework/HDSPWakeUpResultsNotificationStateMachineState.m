@implementation HDSPWakeUpResultsNotificationStateMachineState

- (void)updateState
{
  void *v3;
  void *v4;
  id v5;

  if (!-[HDSPWakeUpResultsNotificationStateMachineState isNotificationEnabled](self, "isNotificationEnabled"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "disabledState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v4);

  }
}

- (HDSPWakeUpResultsNotificationStateMachineInfoProvider)infoProvider
{
  void *v2;
  void *v3;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HDSPWakeUpResultsNotificationStateMachineInfoProvider *)v3;
}

- (BOOL)isNotificationEnabled
{
  void *v2;
  void *v3;
  char v4;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWakeUpResultsNotificationEnabled");

  return v4;
}

- (void)stateDidExpire
{
  void *v3;
  void *v4;
  id v5;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitingForWakeUpState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

@end
