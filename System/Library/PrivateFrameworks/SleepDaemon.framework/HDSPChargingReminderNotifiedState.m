@implementation HDSPChargingReminderNotifiedState

- (id)expirationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  id v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepScheduleModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextEventWithIdentifier:dueAfterDate:", *MEMORY[0x24BEA95A0], v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v7;
  if (v9)
  {
    v11 = objc_msgSend(v7, "hksp_isAfterDate:", v9);
    v10 = v7;
    if (v11)
    {
      HKSPLogForCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v16 = 138543362;
        v17 = (id)objc_opt_class();
        v13 = v17;
        _os_log_impl(&dword_21610C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] bedtime has changed to be later, treating state as expired", (uint8_t *)&v16, 0xCu);

      }
      v10 = v5;
    }
  }
  v14 = v10;

  return v14;
}

- (void)didEnter
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hasStateTransitionAndNotInitializing");

  if (v5)
  {
    HKSPLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_21610C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Sending notification", (uint8_t *)&v9, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postChargingReminderNotification");

  }
}

- (void)updateState
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[HDSPChargingReminderStateMachineState isChargingReminderDisabled](self, "isChargingReminderDisabled"))
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v4 = v9;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] charging reminders disabled after notifying", (uint8_t *)&v8, 0xCu);

    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "disabledState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v7);

  }
}

- (void)stateDidExpire
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)HDSPChargingReminderNotifiedState;
  -[HDSPChargingReminderStateMachineState updateState](&v2, sel_updateState);
}

- (id)stateName
{
  return CFSTR("Notified");
}

@end
