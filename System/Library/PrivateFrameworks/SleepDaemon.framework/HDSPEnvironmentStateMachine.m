@implementation HDSPEnvironmentStateMachine

- (HDSPEnvironmentStateMachine)initWithDelegate:(id)a3 infoProvider:(id)a4
{
  HDSPEnvironmentStateMachine *v4;
  HDSPEnvironmentNotReadyState *v5;
  HDSPEnvironmentNotReadyState *notReadyState;
  HDSPEnvironmentMigrationState *v7;
  HDSPEnvironmentMigrationState *migrationState;
  HDSPEnvironmentReadyState *v9;
  HDSPEnvironmentReadyState *readyState;
  HDSPEnvironmentDemoState *v11;
  HDSPEnvironmentDemoState *demoState;
  HDSPEnvironmentStateMachine *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HDSPEnvironmentStateMachine;
  v4 = -[HKSPStateMachine initWithDelegate:infoProvider:](&v15, sel_initWithDelegate_infoProvider_, a3, a4);
  if (v4)
  {
    v5 = -[HKSPStateMachineState initWithStateMachine:]([HDSPEnvironmentNotReadyState alloc], "initWithStateMachine:", v4);
    notReadyState = v4->_notReadyState;
    v4->_notReadyState = v5;

    v7 = -[HKSPStateMachineState initWithStateMachine:]([HDSPEnvironmentMigrationState alloc], "initWithStateMachine:", v4);
    migrationState = v4->_migrationState;
    v4->_migrationState = v7;

    v9 = -[HKSPStateMachineState initWithStateMachine:]([HDSPEnvironmentReadyState alloc], "initWithStateMachine:", v4);
    readyState = v4->_readyState;
    v4->_readyState = v9;

    v11 = -[HKSPStateMachineState initWithStateMachine:]([HDSPEnvironmentDemoState alloc], "initWithStateMachine:", v4);
    demoState = v4->_demoState;
    v4->_demoState = v11;

    -[HKSPStateMachine setInitialState:](v4, "setInitialState:", v4->_notReadyState);
    v13 = v4;
  }

  return v4;
}

- (unint64_t)loggingCategory
{
  return 3;
}

- (void)systemDidBecomeReady
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemDidBecomeReady");

}

- (void)dataMigrationDidComplete
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataMigrationDidComplete");

}

- (void)environmentShouldMigrateData
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_9);
}

uint64_t __59__HDSPEnvironmentStateMachine_environmentShouldMigrateData__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environmentShouldMigrateData");
}

- (void)environmentDidBecomeReady
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_187);
}

uint64_t __56__HDSPEnvironmentStateMachine_environmentDidBecomeReady__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "environmentDidBecomeReady");
}

- (BOOL)isSystemReady
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemReady");

  return v3;
}

- (BOOL)needsDataMigration
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsDataMigration");

  return v3;
}

- (HDSPEnvironmentNotReadyState)notReadyState
{
  return self->_notReadyState;
}

- (HDSPEnvironmentMigrationState)migrationState
{
  return self->_migrationState;
}

- (HDSPEnvironmentReadyState)readyState
{
  return self->_readyState;
}

- (HDSPEnvironmentDemoState)demoState
{
  return self->_demoState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_demoState, 0);
  objc_storeStrong((id *)&self->_readyState, 0);
  objc_storeStrong((id *)&self->_migrationState, 0);
  objc_storeStrong((id *)&self->_notReadyState, 0);
}

@end
