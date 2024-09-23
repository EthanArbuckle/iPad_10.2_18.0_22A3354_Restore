@implementation HDSPSleepWidgetNotOnboardedState

- (id)stateName
{
  return CFSTR("NotOnboarded");
}

- (int64_t)widgetState
{
  return 7;
}

- (BOOL)reloadsWidgetOnModelChange
{
  return 0;
}

- (BOOL)reloadsWidgetOnTimeChange
{
  return 0;
}

- (BOOL)widgetStateHasTimeComponent
{
  return 0;
}

- (void)sleepScheduleModelDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isOnboarded"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateState");

  }
}

@end
