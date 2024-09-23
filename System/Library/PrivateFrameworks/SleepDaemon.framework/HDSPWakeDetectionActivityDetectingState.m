@implementation HDSPWakeDetectionActivityDetectingState

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "nextWakeUp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)activeTypes
{
  return 3;
}

- (id)stateName
{
  return CFSTR("ActivityDetecting");
}

- (BOOL)schedulesExpiration
{
  return 0;
}

@end
