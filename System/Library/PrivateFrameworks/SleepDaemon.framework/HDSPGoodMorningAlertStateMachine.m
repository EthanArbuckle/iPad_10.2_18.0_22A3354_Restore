@implementation HDSPGoodMorningAlertStateMachine

- (HDSPGoodMorningAlertStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPGoodMorningAlertStateMachine *v20;
  HDSPGoodMorningAlertDisabledState *v21;
  HDSPGoodMorningAlertDisabledState *disabledState;
  HDSPGoodMorningAlertWaitingState *v23;
  HDSPGoodMorningAlertWaitingState *waitingState;
  HDSPGoodMorningAlertPresentingState *v25;
  HDSPGoodMorningAlertPresentingState *presentingState;
  HDSPGoodMorningAlertDisabledState *v27;
  HDSPGoodMorningAlertDisabledState *v28;
  HDSPGoodMorningAlertStateMachine *v29;
  objc_super v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v32[0] = objc_opt_class();
  v32[1] = objc_opt_class();
  v32[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v31.receiver = self;
  v31.super_class = (Class)HDSPGoodMorningAlertStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v31, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPGoodMorningAlertDisabledState alloc], "initWithStateMachine:", v20);
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPGoodMorningAlertWaitingState alloc], "initWithStateMachine:", v20);
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPGoodMorningAlertPresentingState alloc], "initWithStateMachine:", v20);
    presentingState = v20->_presentingState;
    v20->_presentingState = v25;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v27 = (HDSPGoodMorningAlertDisabledState *)objc_claimAutoreleasedReturnValue();
    v28 = v27;
    if (!v27)
      v28 = v20->_disabledState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v28);

    v29 = v20;
  }

  return v20;
}

- (id)allStates
{
  HDSPGoodMorningAlertWaitingState *waitingState;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x24BDAC8D0];
  waitingState = self->_waitingState;
  v4[0] = self->_disabledState;
  v4[1] = waitingState;
  v4[2] = self->_presentingState;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)sleepScheduleStateChangedToBedtime
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleStateChangedToBedtime");

}

- (void)sleepScheduleStateChangedToWakeUp
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleStateChangedToWakeUp");

}

- (void)presentAlertForGoodMorning
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_6);
}

uint64_t __62__HDSPGoodMorningAlertStateMachine_presentAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "presentAlertForGoodMorning");
}

- (void)dismissAlertForGoodMorning
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_188);
}

uint64_t __62__HDSPGoodMorningAlertStateMachine_dismissAlertForGoodMorning__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dismissAlertForGoodMorning");
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

- (BOOL)goodMorningAlertEnabled
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "goodMorningAlertEnabled");

  return v3;
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

- (unint64_t)sleepScheduleState
{
  void *v2;
  unint64_t v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepScheduleState");

  return v3;
}

- (BOOL)isAppleWatch
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAppleWatch");

  return v3;
}

- (BOOL)isOnCharger
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnCharger");

  return v3;
}

- (HDSPGoodMorningAlertDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPGoodMorningAlertWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPGoodMorningAlertPresentingState)presentingState
{
  return self->_presentingState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentingState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end
