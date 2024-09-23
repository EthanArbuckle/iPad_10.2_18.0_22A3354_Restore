@implementation HDSPSleepWidgetStateMachine

- (HDSPSleepWidgetStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPSleepWidgetStateMachine *v20;
  HDSPSleepWidgetDisabledState *v21;
  HDSPSleepWidgetDisabledState *disabledState;
  HDSPSleepWidgetWaitingState *v23;
  HDSPSleepWidgetWaitingState *waitingState;
  HDSPSleepWidgetUpcomingState *v25;
  HDSPSleepWidgetUpcomingState *upcomingState;
  HDSPSleepWidgetWindDownState *v27;
  HDSPSleepWidgetWindDownState *windDownState;
  HDSPSleepWidgetBedtimeState *v29;
  HDSPSleepWidgetBedtimeState *bedtimeState;
  HDSPSleepWidgetBedtimeInProgressState *v31;
  HDSPSleepWidgetBedtimeInProgressState *bedtimeInProgressState;
  HDSPSleepWidgetGreetingState *v33;
  HDSPSleepWidgetGreetingState *greetingState;
  HDSPSleepWidgetNotOnboardedState *v35;
  HDSPSleepWidgetNotOnboardedState *notOnboardedState;
  HDSPSleepWidgetDisabledState *v37;
  HDSPSleepWidgetDisabledState *v38;
  HDSPSleepWidgetStateMachine *v39;
  objc_super v41;
  _QWORD v42[9];

  v42[8] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  v42[2] = objc_opt_class();
  v42[3] = objc_opt_class();
  v42[4] = objc_opt_class();
  v42[5] = objc_opt_class();
  v42[6] = objc_opt_class();
  v42[7] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v42, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v41.receiver = self;
  v41.super_class = (Class)HDSPSleepWidgetStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v41, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetDisabledState alloc], "initWithStateMachine:", v20);
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetWaitingState alloc], "initWithStateMachine:", v20);
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetUpcomingState alloc], "initWithStateMachine:", v20);
    upcomingState = v20->_upcomingState;
    v20->_upcomingState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetWindDownState alloc], "initWithStateMachine:", v20);
    windDownState = v20->_windDownState;
    v20->_windDownState = v27;

    v29 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetBedtimeState alloc], "initWithStateMachine:", v20);
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v29;

    v31 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetBedtimeInProgressState alloc], "initWithStateMachine:", v20);
    bedtimeInProgressState = v20->_bedtimeInProgressState;
    v20->_bedtimeInProgressState = v31;

    v33 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetGreetingState alloc], "initWithStateMachine:", v20);
    greetingState = v20->_greetingState;
    v20->_greetingState = v33;

    v35 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepWidgetNotOnboardedState alloc], "initWithStateMachine:", v20);
    notOnboardedState = v20->_notOnboardedState;
    v20->_notOnboardedState = v35;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v37 = (HDSPSleepWidgetDisabledState *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    if (!v37)
      v38 = v20->_disabledState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v38);

    v39 = v20;
  }

  return v20;
}

- (id)allStates
{
  HDSPSleepWidgetWaitingState *waitingState;
  HDSPSleepWidgetWindDownState *windDownState;
  HDSPSleepWidgetBedtimeInProgressState *bedtimeInProgressState;
  HDSPSleepWidgetNotOnboardedState *notOnboardedState;
  _QWORD v7[9];

  v7[8] = *MEMORY[0x24BDAC8D0];
  waitingState = self->_waitingState;
  v7[0] = self->_disabledState;
  v7[1] = waitingState;
  windDownState = self->_windDownState;
  v7[2] = self->_upcomingState;
  v7[3] = windDownState;
  bedtimeInProgressState = self->_bedtimeInProgressState;
  v7[4] = self->_bedtimeState;
  v7[5] = bedtimeInProgressState;
  notOnboardedState = self->_notOnboardedState;
  v7[6] = self->_greetingState;
  v7[7] = notOnboardedState;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)loggingCategory
{
  return 18;
}

- (void)sleepModeDidChange:(int64_t)a3 isUserRequested:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[HKSPStateMachine currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepModeDidChange:isUserRequested:", a3, v4);

}

- (void)sleepScheduleStateDidChange:(unint64_t)a3
{
  id v4;

  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepScheduleStateDidChange:", a3);

}

- (void)sleepScheduleModelDidChange:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sleepScheduleModelDidChange:", v4);

}

- (void)significantTimeChangeOccurred
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "significantTimeChangeOccurred");

}

- (void)sleepWidgetStateDidChange:(int64_t)a3 previousState:(int64_t)a4
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__HDSPSleepWidgetStateMachine_sleepWidgetStateDidChange_previousState___block_invoke;
  v4[3] = &__block_descriptor_48_e47_v16__0___HDSPSleepWidgetStateMachineDelegate__8l;
  v4[4] = a3;
  v4[5] = a4;
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", v4);
}

uint64_t __71__HDSPSleepWidgetStateMachine_sleepWidgetStateDidChange_previousState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepWidgetStateDidChange:previousState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)sleepWidgetShouldReload
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_32);
}

uint64_t __54__HDSPSleepWidgetStateMachine_sleepWidgetShouldReload__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sleepWidgetShouldReload");
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

- (unint64_t)sleepScheduleState
{
  void *v2;
  unint64_t v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepScheduleState");

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

- (BOOL)isOnboarded
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOnboarded");

  return v3;
}

- (HDSPSleepWidgetDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPSleepWidgetWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPSleepWidgetUpcomingState)upcomingState
{
  return self->_upcomingState;
}

- (HDSPSleepWidgetWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepWidgetBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepWidgetBedtimeInProgressState)bedtimeInProgressState
{
  return self->_bedtimeInProgressState;
}

- (HDSPSleepWidgetGreetingState)greetingState
{
  return self->_greetingState;
}

- (HDSPSleepWidgetNotOnboardedState)notOnboardedState
{
  return self->_notOnboardedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notOnboardedState, 0);
  objc_storeStrong((id *)&self->_greetingState, 0);
  objc_storeStrong((id *)&self->_bedtimeInProgressState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);
  objc_storeStrong((id *)&self->_upcomingState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end
