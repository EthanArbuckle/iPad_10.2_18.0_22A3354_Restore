@implementation HDSPChargingReminderWaitingState

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitoringWindowAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (id)stateName
{
  return CFSTR("Waiting");
}

@end
