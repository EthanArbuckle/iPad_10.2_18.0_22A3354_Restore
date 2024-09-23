@implementation HDSPSleepLockScreenStateMachine

- (HDSPSleepLockScreenStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPSleepLockScreenStateMachine *v20;
  HDSPSleepLockScreenOffState *v21;
  HDSPSleepLockScreenOffState *offState;
  HDSPSleepLockScreenWindDownState *v23;
  HDSPSleepLockScreenWindDownState *windDownState;
  HDSPSleepLockScreenBedtimeState *v25;
  HDSPSleepLockScreenBedtimeState *bedtimeState;
  HDSPSleepLockScreenGreetingState *v27;
  HDSPSleepLockScreenGreetingState *greetingState;
  HDSPSleepLockScreenOffState *v29;
  HDSPSleepLockScreenOffState *v30;
  HDSPSleepLockScreenStateMachine *v31;
  objc_super v33;
  _QWORD v34[5];

  v34[4] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v34[0] = objc_opt_class();
  v34[1] = objc_opt_class();
  v34[2] = objc_opt_class();
  v34[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v33.receiver = self;
  v33.super_class = (Class)HDSPSleepLockScreenStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v33, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepLockScreenOffState alloc], "initWithStateMachine:", v20);
    offState = v20->_offState;
    v20->_offState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepLockScreenWindDownState alloc], "initWithStateMachine:", v20);
    windDownState = v20->_windDownState;
    v20->_windDownState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepLockScreenBedtimeState alloc], "initWithStateMachine:", v20);
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepLockScreenGreetingState alloc], "initWithStateMachine:", v20);
    greetingState = v20->_greetingState;
    v20->_greetingState = v27;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v29 = (HDSPSleepLockScreenOffState *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
      v30 = v20->_offState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v30);

    v31 = v20;
  }

  return v20;
}

- (id)allStates
{
  HDSPSleepLockScreenWindDownState *windDownState;
  HDSPSleepLockScreenGreetingState *greetingState;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  windDownState = self->_windDownState;
  v5[0] = self->_offState;
  v5[1] = windDownState;
  greetingState = self->_greetingState;
  v5[2] = self->_bedtimeState;
  v5[3] = greetingState;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)presentAlertForGoodMorning
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentAlertForGoodMorning");

}

- (void)dismissAlertForGoodMorning
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissAlertForGoodMorning");

}

- (void)sleepModeDidChange:(int64_t)a3 reason:(unint64_t)a4
{
  id v6;

  -[HKSPStateMachine currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepModeDidChange:reason:", a3, a4);

}

- (void)sleepLockScreenStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __79__HDSPSleepLockScreenStateMachine_sleepLockScreenStateDidChange_previousState___block_invoke;
  v4[3] = &__block_descriptor_48_e51_v16__0___HDSPSleepLockScreenStateMachineDelegate__8l;
  v4[4] = a3;
  v4[5] = a4;
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", v4);
}

uint64_t __79__HDSPSleepLockScreenStateMachine_sleepLockScreenStateDidChange_previousState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepLockScreenStateDidChange:previousState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSDate)currentDate
{
  void *v2;
  void *v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (HKSPSleepScheduleModel)sleepScheduleModel
{
  void *v2;
  void *v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleModel *)v3;
}

- (int64_t)sleepMode
{
  void *v2;
  int64_t v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepMode");

  return v3;
}

- (BOOL)inUnscheduledSleepMode
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "inUnscheduledSleepMode");

  return v3;
}

- (BOOL)isLockScreenActive
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLockScreenActive");

  return v3;
}

- (HDSPSleepLockScreenOffState)offState
{
  return self->_offState;
}

- (HDSPSleepLockScreenWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepLockScreenBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepLockScreenGreetingState)greetingState
{
  return self->_greetingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_greetingState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);
  objc_storeStrong((id *)&self->_offState, 0);
}

@end
