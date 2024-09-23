@implementation HDSPWakeDetectionStateMachine

- (HDSPWakeDetectionStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPWakeDetectionStateMachine *v20;
  HDSPWakeDetectionDisabledState *v21;
  HDSPWakeDetectionDisabledState *disabledState;
  HDSPWakeDetectionWaitingState *v23;
  HDSPWakeDetectionWaitingState *waitingState;
  HDSPWakeDetectionExplicitDetectingState *v25;
  HDSPWakeDetectionExplicitDetectingState *explicitDetectingState;
  HDSPWakeDetectionActivityDetectingState *v27;
  HDSPWakeDetectionActivityDetectingState *activityDetectingState;
  HDSPWakeDetectionNotifiedState *v29;
  HDSPWakeDetectionNotifiedState *notifiedState;
  HDSPWakeDetectionDisabledState *v31;
  HDSPWakeDetectionDisabledState *v32;
  HDSPWakeDetectionStateMachine *v33;
  objc_super v35;
  _QWORD v36[6];

  v36[5] = *MEMORY[0x24BDAC8D0];
  v12 = (void *)MEMORY[0x24BDBCF20];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v36[0] = objc_opt_class();
  v36[1] = objc_opt_class();
  v36[2] = objc_opt_class();
  v36[3] = objc_opt_class();
  v36[4] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v35.receiver = self;
  v35.super_class = (Class)HDSPWakeDetectionStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v35, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeDetectionDisabledState alloc], "initWithStateMachine:", v20);
    disabledState = v20->_disabledState;
    v20->_disabledState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeDetectionWaitingState alloc], "initWithStateMachine:", v20);
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeDetectionExplicitDetectingState alloc], "initWithStateMachine:", v20);
    explicitDetectingState = v20->_explicitDetectingState;
    v20->_explicitDetectingState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeDetectionActivityDetectingState alloc], "initWithStateMachine:", v20);
    activityDetectingState = v20->_activityDetectingState;
    v20->_activityDetectingState = v27;

    v29 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeDetectionNotifiedState alloc], "initWithStateMachine:", v20);
    notifiedState = v20->_notifiedState;
    v20->_notifiedState = v29;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v31 = (HDSPWakeDetectionDisabledState *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31)
      v32 = v20->_disabledState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v32);

    v33 = v20;
  }

  return v20;
}

- (id)allStates
{
  HDSPWakeDetectionWaitingState *waitingState;
  HDSPWakeDetectionActivityDetectingState *activityDetectingState;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x24BDAC8D0];
  waitingState = self->_waitingState;
  v5[0] = self->_disabledState;
  v5[1] = waitingState;
  activityDetectingState = self->_activityDetectingState;
  v5[2] = self->_explicitDetectingState;
  v5[3] = activityDetectingState;
  v5[4] = self->_notifiedState;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)wakeupEventDetected:(unint64_t)a3 date:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HKSPStateMachine currentState](self, "currentState");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wakeupEventDetected:date:", a3, v6);

}

- (void)earlyWakeUpWasNotifiedRemotely
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "earlyWakeUpWasNotifiedRemotely");

}

- (void)startWakeDetection:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__HDSPWakeDetectionStateMachine_startWakeDetection___block_invoke;
  v3[3] = &__block_descriptor_40_e49_v16__0___HDSPWakeDetectionStateMachineDelegate__8l;
  v3[4] = a3;
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", v3);
}

uint64_t __52__HDSPWakeDetectionStateMachine_startWakeDetection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startWakeDetection:", *(_QWORD *)(a1 + 32));
}

- (void)stopWakeDetection
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_24);
}

uint64_t __50__HDSPWakeDetectionStateMachine_stopWakeDetection__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopWakeDetection");
}

- (void)postWakeDetectionNotification:(unint64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__HDSPWakeDetectionStateMachine_postWakeDetectionNotification___block_invoke;
  v3[3] = &__block_descriptor_40_e49_v16__0___HDSPWakeDetectionStateMachineDelegate__8l;
  v3[4] = a3;
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", v3);
}

uint64_t __63__HDSPWakeDetectionStateMachine_postWakeDetectionNotification___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "postWakeDetectionNotification:", *(_QWORD *)(a1 + 32));
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

- (HKSPSleepScheduleOccurrence)relevantOccurrence
{
  void *v2;
  void *v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "relevantOccurrence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKSPSleepScheduleOccurrence *)v3;
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

- (BOOL)sleepModeIsOff
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepModeIsOff");

  return v3;
}

- (BOOL)isWatch
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isWatch");

  return v3;
}

- (unint64_t)activeTypes
{
  void *v2;
  unint64_t v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activeTypes");

  return v3;
}

- (NSDate)nextWakeUp
{
  void *v2;
  void *v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nextWakeUp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (NSDate)upcomingStartDetection
{
  void *v2;
  void *v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "upcomingStartDetection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

- (id)detectionWindowForType:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "detectionWindowForType:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HDSPWakeDetectionDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPWakeDetectionWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPWakeDetectionExplicitDetectingState)explicitDetectingState
{
  return self->_explicitDetectingState;
}

- (HDSPWakeDetectionActivityDetectingState)activityDetectingState
{
  return self->_activityDetectingState;
}

- (HDSPWakeDetectionNotifiedState)notifiedState
{
  return self->_notifiedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedState, 0);
  objc_storeStrong((id *)&self->_activityDetectingState, 0);
  objc_storeStrong((id *)&self->_explicitDetectingState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end
