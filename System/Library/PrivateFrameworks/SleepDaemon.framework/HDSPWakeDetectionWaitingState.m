@implementation HDSPWakeDetectionWaitingState

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "upcomingStartDetection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stateName
{
  return CFSTR("Waiting");
}

- (BOOL)schedulesExpiration
{
  return 1;
}

@end
