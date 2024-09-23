@implementation HDSPSleepScheduleStateCoordinatorStateMachine

- (HDSPSleepScheduleStateCoordinatorStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPSleepScheduleStateCoordinatorStateMachine *v20;
  HDSPSleepScheduleStateCoordinatorDisabledState *v21;
  HDSPSleepScheduleStateCoordinatorDisabledState *disabledState;
  HDSPSleepScheduleStateCoordinatorWakeUpState *v23;
  HDSPSleepScheduleStateCoordinatorWakeUpState *wakeUpState;
  HDSPSleepScheduleStateCoordinatorBedtimeState *v25;
  HDSPSleepScheduleStateCoordinatorBedtimeState *bedtimeState;
  HDSPSleepScheduleStateCoordinatorWindDownState *v27;
  HDSPSleepScheduleStateCoordinatorWindDownState *windDownState;
  HDSPSleepScheduleStateCoordinatorDelayedWakeUpState *v29;
  HDSPSleepScheduleStateCoordinatorDelayedWakeUpState *delayedWakeUpState;
  HDSPSleepScheduleStateCoordinatorInitialState *v31;
  HDSPSleepScheduleStateCoordinatorInitialState *initialState;
  HDSPSleepScheduleStateCoordinatorInitialState *v33;
  HDSPSleepScheduleStateCoordinatorInitialState *v34;
  HDSPSleepScheduleStateCoordinatorStateMachine *v35;
  objc_super v37;
  _QWORD v38[7];

  v38[6] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  v38[2] = objc_opt_class();
  v38[3] = objc_opt_class();
  v38[4] = objc_opt_class();
  v38[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v37.receiver = self;
  v37.super_class = (Class)HDSPSleepScheduleStateCoordinatorStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v37, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepScheduleStateCoordinatorDisabledState alloc], "initWithStateMachine:", v20);
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepScheduleStateCoordinatorWakeUpState alloc], "initWithStateMachine:", v20);
    wakeUpState = v20->_wakeUpState;
    v20->_wakeUpState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepScheduleStateCoordinatorBedtimeState alloc], "initWithStateMachine:", v20);
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepScheduleStateCoordinatorWindDownState alloc], "initWithStateMachine:", v20);
    windDownState = v20->_windDownState;
    v20->_windDownState = v27;

    v29 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepScheduleStateCoordinatorDelayedWakeUpState alloc], "initWithStateMachine:", v20);
    delayedWakeUpState = v20->_delayedWakeUpState;
    v20->_delayedWakeUpState = v29;

    v31 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepScheduleStateCoordinatorInitialState alloc], "initWithStateMachine:", v20);
    initialState = v20->_initialState;
    v20->_initialState = v31;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v33 = (HDSPSleepScheduleStateCoordinatorInitialState *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (!v33)
      v34 = v20->_initialState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v34);

    v35 = v20;
  }

  return v20;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)windDownReached
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windDownReached");

}

- (void)bedtimeReached
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bedtimeReached");

}

- (void)wakeTimeReached
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wakeTimeReached");

}

- (void)wakeUpConfirmed:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wakeUpConfirmed:", v3);

}

- (void)alarmDismissed
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alarmDismissed");

}

- (void)significantTimeChange
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "significantTimeChange");

}

- (void)timeZoneChange
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeZoneChange");

}

- (void)scheduleModelChanged:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheduleModelChanged:", v4);

}

- (void)sleepScheduleStateDidChange:(unint64_t)a3 previousState:(unint64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  unint64_t v12;
  unint64_t v13;

  v8 = a5;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __99__HDSPSleepScheduleStateCoordinatorStateMachine_sleepScheduleStateDidChange_previousState_context___block_invoke;
  v10[3] = &unk_24D4E5DD0;
  v12 = a3;
  v13 = a4;
  v11 = v8;
  v9 = v8;
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", v10);

}

uint64_t __99__HDSPSleepScheduleStateCoordinatorStateMachine_sleepScheduleStateDidChange_previousState_context___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sleepScheduleStateDidChange:previousState:context:", a1[5], a1[6], a1[4]);
}

- (void)snoozeFireDateShouldBeReset
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_27);
}

uint64_t __76__HDSPSleepScheduleStateCoordinatorStateMachine_snoozeFireDateShouldBeReset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "snoozeFireDateShouldBeReset");
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

- (BOOL)sleepFeaturesEnabled
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepFeaturesEnabled");

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

- (HKSPSleepScheduleOccurrence)previousOccurrence
{
  void *v2;
  void *v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previousOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleOccurrence *)v3;
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

- (HDSPSleepScheduleStateCoordinatorDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPSleepScheduleStateCoordinatorWakeUpState)wakeUpState
{
  return self->_wakeUpState;
}

- (HDSPSleepScheduleStateCoordinatorBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepScheduleStateCoordinatorWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepScheduleStateCoordinatorDelayedWakeUpState)delayedWakeUpState
{
  return self->_delayedWakeUpState;
}

- (HDSPSleepScheduleStateCoordinatorInitialState)initialState
{
  return self->_initialState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialState, 0);
  objc_storeStrong((id *)&self->_delayedWakeUpState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_wakeUpState, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end
