@implementation HDSPChargingReminderStateMachine

- (HDSPChargingReminderStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPChargingReminderStateMachine *v20;
  HDSPChargingReminderMonitoringState *v21;
  HDSPChargingReminderMonitoringState *monitoringState;
  HDSPChargingReminderWaitingState *v23;
  HDSPChargingReminderWaitingState *waitingState;
  HDSPChargingReminderDisabledState *v25;
  HDSPChargingReminderDisabledState *disabledState;
  HDSPChargingReminderNotifiedState *v27;
  HDSPChargingReminderNotifiedState *notifiedState;
  HDSPChargingReminderDisabledState *v29;
  HDSPChargingReminderDisabledState *v30;
  HDSPChargingReminderStateMachine *v31;
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
  v33.super_class = (Class)HDSPChargingReminderStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v33, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPChargingReminderMonitoringState alloc], "initWithStateMachine:", v20);
    monitoringState = v20->_monitoringState;
    v20->_monitoringState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPChargingReminderWaitingState alloc], "initWithStateMachine:", v20);
    waitingState = v20->_waitingState;
    v20->_waitingState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPChargingReminderDisabledState alloc], "initWithStateMachine:", v20);
    disabledState = v20->_disabledState;
    v20->_disabledState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPChargingReminderNotifiedState alloc], "initWithStateMachine:", v20);
    notifiedState = v20->_notifiedState;
    v20->_notifiedState = v27;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v29 = (HDSPChargingReminderDisabledState *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (!v29)
      v30 = v20->_disabledState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v30);

    v31 = v20;
  }

  return v20;
}

- (id)allStates
{
  HDSPChargingReminderWaitingState *waitingState;
  HDSPChargingReminderNotifiedState *notifiedState;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  waitingState = self->_waitingState;
  v5[0] = self->_monitoringState;
  v5[1] = waitingState;
  notifiedState = self->_notifiedState;
  v5[2] = self->_disabledState;
  v5[3] = notifiedState;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)loggingCategory
{
  return 7;
}

- (void)batteryLevelChanged:(float)a3
{
  double v4;
  id v5;

  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "batteryLevelChanged:", v4);

}

- (void)postChargingReminderNotification
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_1);
}

uint64_t __68__HDSPChargingReminderStateMachine_postChargingReminderNotification__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "postChargingReminderNotification");
}

- (void)startBatteryMonitoring
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_189);
}

uint64_t __58__HDSPChargingReminderStateMachine_startBatteryMonitoring__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startBatteryMonitoring");
}

- (void)stopBatteryMonitoring
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_190_0);
}

uint64_t __57__HDSPChargingReminderStateMachine_stopBatteryMonitoring__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopBatteryMonitoring");
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

- (BOOL)sleepFeaturesEnabled
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sleepFeaturesEnabled");

  return v3;
}

- (id)monitoringWindowAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "monitoringWindowAfterDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (BOOL)isCharging
{
  void *v2;
  char v3;

  -[HKSPStateMachine infoProvider](self, "infoProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCharging");

  return v3;
}

- (HDSPChargingReminderDisabledState)disabledState
{
  return self->_disabledState;
}

- (HDSPChargingReminderWaitingState)waitingState
{
  return self->_waitingState;
}

- (HDSPChargingReminderMonitoringState)monitoringState
{
  return self->_monitoringState;
}

- (HDSPChargingReminderNotifiedState)notifiedState
{
  return self->_notifiedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notifiedState, 0);
  objc_storeStrong((id *)&self->_monitoringState, 0);
  objc_storeStrong((id *)&self->_waitingState, 0);
  objc_storeStrong((id *)&self->_disabledState, 0);
}

@end
