@implementation HDSPSleepModeStateMachine

- (HDSPSleepModeStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPSleepModeStateMachine *v20;
  HDSPSleepModeOffState *v21;
  HDSPSleepModeOffState *offState;
  HDSPSleepModeWindDownState *v23;
  HDSPSleepModeWindDownState *windDownState;
  HDSPSleepModeManualOffState *v25;
  HDSPSleepModeManualOffState *manualOffState;
  HDSPSleepModeBedtimeState *v27;
  HDSPSleepModeBedtimeState *bedtimeState;
  HDSPSleepModeManualOnState *v29;
  HDSPSleepModeManualOnState *manualOnState;
  HDSPSleepModeAutomatedOnState *v31;
  HDSPSleepModeAutomatedOnState *automatedOnState;
  HDSPSleepModeAutomatedOffState *v33;
  HDSPSleepModeAutomatedOffState *automatedOffState;
  HDSPSleepModeOffState *v35;
  HDSPSleepModeOffState *v36;
  HDSPSleepModeStateMachine *v37;
  objc_super v39;
  _QWORD v40[8];

  v40[7] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  v40[2] = objc_opt_class();
  v40[3] = objc_opt_class();
  v40[4] = objc_opt_class();
  v40[5] = objc_opt_class();
  v40[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v39.receiver = self;
  v39.super_class = (Class)HDSPSleepModeStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v39, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeOffState alloc], "initWithStateMachine:", v20);
    offState = v20->_offState;
    v20->_offState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeWindDownState alloc], "initWithStateMachine:", v20);
    windDownState = v20->_windDownState;
    v20->_windDownState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeManualOffState alloc], "initWithStateMachine:", v20);
    manualOffState = v20->_manualOffState;
    v20->_manualOffState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeBedtimeState alloc], "initWithStateMachine:", v20);
    bedtimeState = v20->_bedtimeState;
    v20->_bedtimeState = v27;

    v29 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeManualOnState alloc], "initWithStateMachine:", v20);
    manualOnState = v20->_manualOnState;
    v20->_manualOnState = v29;

    v31 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeAutomatedOnState alloc], "initWithStateMachine:", v20);
    automatedOnState = v20->_automatedOnState;
    v20->_automatedOnState = v31;

    v33 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPSleepModeAutomatedOffState alloc], "initWithStateMachine:", v20);
    automatedOffState = v20->_automatedOffState;
    v20->_automatedOffState = v33;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v35 = (HDSPSleepModeOffState *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (!v35)
      v36 = v20->_offState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v36);

    v37 = v20;
  }

  return v20;
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)sleepScheduleStateChangedToWindDown:(unint64_t)a3 fromState:(unint64_t)a4
{
  id v6;

  -[HKSPStateMachine currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleStateChangedToWindDown:fromState:", a3, a4);

}

- (void)sleepScheduleStateChangedToBedtime:(unint64_t)a3 fromState:(unint64_t)a4
{
  id v6;

  -[HKSPStateMachine currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleStateChangedToBedtime:fromState:", a3, a4);

}

- (void)sleepScheduleStateChangedToWakeUp:(unint64_t)a3 fromState:(unint64_t)a4
{
  id v6;

  -[HKSPStateMachine currentState](self, "currentState");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sleepScheduleStateChangedToWakeUp:fromState:", a3, a4);

}

- (void)sleepScheduleStateChangedToDisabled
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepScheduleStateChangedToDisabled");

}

- (void)userTurnedOffSleepModeWithReason:(unint64_t)a3
{
  id v4;

  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userTurnedOffSleepModeWithReason:", a3);

}

- (void)userTurnedOnSleepModeWithReason:(unint64_t)a3
{
  id v4;

  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userTurnedOnSleepModeWithReason:", a3);

}

- (void)automationTurnedOnSleepModeWithReason:(unint64_t)a3
{
  id v4;

  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automationTurnedOnSleepModeWithReason:", a3);

}

- (void)automationTurnedOffSleepModeWithReason:(unint64_t)a3
{
  id v4;

  -[HKSPStateMachine currentState](self, "currentState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "automationTurnedOffSleepModeWithReason:", a3);

}

- (void)sleepModeTurnedOnForUnknownReason
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepModeTurnedOnForUnknownReason");

}

- (void)sleepModeTurnedOffForUnknownReason
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepModeTurnedOffForUnknownReason");

}

- (void)sleepModeDidChange:(int64_t)a3 previousMode:(int64_t)a4 reason:(unint64_t)a5
{
  _QWORD v5[7];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__HDSPSleepModeStateMachine_sleepModeDidChange_previousMode_reason___block_invoke;
  v5[3] = &__block_descriptor_56_e45_v16__0___HDSPSleepModeStateMachineDelegate__8l;
  v5[4] = a3;
  v5[5] = a4;
  v5[6] = a5;
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", v5);
}

uint64_t __68__HDSPSleepModeStateMachine_sleepModeDidChange_previousMode_reason___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "sleepModeDidChange:previousMode:reason:", a1[4], a1[5], a1[6]);
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

- (BOOL)shouldGoIntoSleepModeDuringState:(unint64_t)a3
{
  void *v4;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "shouldGoIntoSleepModeDuringState:", a3);

  return a3;
}

- (BOOL)hasSleepFocusMode
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasSleepFocusMode");

  return v3;
}

- (HDSPSleepModeOffState)offState
{
  return self->_offState;
}

- (HDSPSleepModeWindDownState)windDownState
{
  return self->_windDownState;
}

- (HDSPSleepModeManualOffState)manualOffState
{
  return self->_manualOffState;
}

- (HDSPSleepModeBedtimeState)bedtimeState
{
  return self->_bedtimeState;
}

- (HDSPSleepModeManualOnState)manualOnState
{
  return self->_manualOnState;
}

- (HDSPSleepModeAutomatedOnState)automatedOnState
{
  return self->_automatedOnState;
}

- (HDSPSleepModeAutomatedOffState)automatedOffState
{
  return self->_automatedOffState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_automatedOffState, 0);
  objc_storeStrong((id *)&self->_automatedOnState, 0);
  objc_storeStrong((id *)&self->_manualOnState, 0);
  objc_storeStrong((id *)&self->_bedtimeState, 0);
  objc_storeStrong((id *)&self->_manualOffState, 0);
  objc_storeStrong((id *)&self->_windDownState, 0);
  objc_storeStrong((id *)&self->_offState, 0);
}

@end
