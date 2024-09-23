@implementation HDSPWakeUpResultsNotificationDisabledState

- (id)stateName
{
  return CFSTR("Disabled");
}

- (void)updateState
{
  void *v3;
  void *v4;
  id v5;

  if (-[HDSPWakeUpResultsNotificationStateMachineState isNotificationEnabled](self, "isNotificationEnabled"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "waitingForWakeUpState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v4);

  }
}

@end
