@implementation HDSPEnvironmentMigrationState

- (id)stateName
{
  return CFSTR("Migration");
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
    objc_msgSend(v6, "environmentShouldMigrateData");

  }
}

- (void)dataMigrationDidComplete
{
  void *v2;
  id v3;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "readyState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enterState:", v2);

}

@end
