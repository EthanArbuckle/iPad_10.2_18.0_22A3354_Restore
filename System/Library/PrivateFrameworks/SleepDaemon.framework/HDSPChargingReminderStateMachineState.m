@implementation HDSPChargingReminderStateMachineState

- (void)updateState
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDSPChargingReminderStateMachineState isChargingReminderDisabled](self, "isChargingReminderDisabled"))
  {
    objc_msgSend(v3, "disabledState");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (-[HDSPChargingReminderStateMachineState inMonitoringWindow](self, "inMonitoringWindow"))
  {
    HKSPLogForCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v8 = 138543362;
      *(_QWORD *)&v8[4] = objc_opt_class();
      v6 = *(id *)&v8[4];
      _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] in monitoring window", v8, 0xCu);

    }
    objc_msgSend(v3, "monitoringState");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "waitingState");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v4;
  objc_msgSend(v3, "enterState:", v4, *(_OWORD *)v8);

}

- (BOOL)isChargingReminderDisabled
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  NSObject *v8;
  id v9;
  const char *v10;
  BOOL v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepScheduleModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "chargingRemindersEnabledWithLogObject:", self))
  {
    objc_msgSend(v5, "sleepSchedule");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windDownTime");
    if (v7 >= 3600.0)
    {
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = (id)objc_opt_class();
        v9 = v14;
        v10 = "[%{public}@] wind down time is greater than monitor window";
        goto LABEL_9;
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isCharging"))
      {
        v11 = 0;
        goto LABEL_12;
      }
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543362;
        v14 = (id)objc_opt_class();
        v9 = v14;
        v10 = "[%{public}@] currently charging";
LABEL_9:
        _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);

      }
    }

    v11 = 1;
LABEL_12:

    goto LABEL_13;
  }
  v11 = 1;
LABEL_13:

  return v11;
}

- (BOOL)inMonitoringWindow
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "monitoringWindowAfterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "hksp_containsDate:", v6);

  return v7;
}

@end
