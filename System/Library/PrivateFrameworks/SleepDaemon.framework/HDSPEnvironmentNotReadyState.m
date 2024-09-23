@implementation HDSPEnvironmentNotReadyState

- (id)stateName
{
  return CFSTR("NotReady");
}

- (void)updateState
{
  void *v3;
  void *v4;
  id v5;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isSystemReady"))
  {
    -[HDSPEnvironmentNotReadyState _nextSystemReadyState](self, "_nextSystemReadyState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v4);

  }
}

- (id)_nextSystemReadyState
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "needsDataMigration"))
    objc_msgSend(v2, "migrationState");
  else
    objc_msgSend(v2, "readyState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)systemDidBecomeReady
{
  void *v3;
  id v4;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HDSPEnvironmentNotReadyState _nextSystemReadyState](self, "_nextSystemReadyState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enterState:", v3);

}

@end
