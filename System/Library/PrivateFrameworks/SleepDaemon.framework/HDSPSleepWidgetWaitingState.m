@implementation HDSPSleepWidgetWaitingState

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id *v6;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "sleepScheduleModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepSchedule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windDownTime");
  v6 = (id *)MEMORY[0x24BEA95D8];
  if (v7 <= 0.0)
    v6 = (id *)MEMORY[0x24BEA95A0];
  v8 = *v6;

  objc_msgSend(v3, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextEventWithIdentifier:dueAfterDate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "dateByAddingTimeInterval:", -7200.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)stateName
{
  return CFSTR("Waiting");
}

- (int64_t)widgetState
{
  return 1;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)stateDidExpire
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
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received waiting expired event due", (uint8_t *)&v7, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upcomingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v6);

}

@end
