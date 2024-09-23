@implementation HDSPChargingReminderMonitoringState

- (id)expirationDate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitoringWindowAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    objc_msgSend(v6, "startBatteryMonitoring");

  }
}

- (void)didExit
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
    objc_msgSend(v6, "stopBatteryMonitoring");

  }
}

- (id)stateName
{
  return CFSTR("Monitoring");
}

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)batteryLevelChanged:(float)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543618;
    v14 = (id)objc_opt_class();
    v15 = 2048;
    v16 = a3;
    v6 = v14;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] batteryLevelChanged: %f", (uint8_t *)&v13, 0x16u);

  }
  HKSPLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a3 < 0.3)
  {
    if (v8)
    {
      v9 = (void *)objc_opt_class();
      v13 = 138543362;
      v14 = v9;
      v10 = v9;
      _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] we should charge", (uint8_t *)&v13, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject notifiedState](v7, "notifiedState");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    -[NSObject enterState:](v7, "enterState:", v11);
    goto LABEL_9;
  }
  if (v8)
  {
    v12 = (void *)objc_opt_class();
    v13 = 138543362;
    v14 = v12;
    v11 = v12;
    _os_log_impl(&dword_21610C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] we don't need to charge yet", (uint8_t *)&v13, 0xCu);
LABEL_9:

  }
}

@end
