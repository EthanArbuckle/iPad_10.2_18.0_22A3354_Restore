@implementation HDSPSleepWidgetGreetingState

- (double)expirationDuration
{
  return 7200.0;
}

- (id)stateName
{
  return CFSTR("Greeting");
}

- (int64_t)widgetState
{
  return 6;
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 0;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 0;
}

- (void)stateDidExpire
{
  NSObject *v3;
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v10 = 138543362;
    *(_QWORD *)&v10[4] = objc_opt_class();
    v4 = *(id *)&v10[4];
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received greeting expired event due", v10, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDSPSleepWidgetStateMachineState shouldGoIntoUpcomingState](self, "shouldGoIntoUpcomingState");
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
    objc_msgSend(v7, "upcomingState");
  else
    objc_msgSend(v7, "waitingState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v9, *(_OWORD *)v10);

}

@end
