@implementation HDSPWakeDetectionNotifiedState

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
  void *v11;
  int v12;
  NSObject *v13;
  id v14;
  id v15;
  void *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sleepScheduleModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nextEventDueAfterDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10
    && (objc_msgSend(v8, "dueDate"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "hksp_isAfterDate:", v10),
        v11,
        v12))
  {
    HKSPLogForCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138543362;
      v19 = (id)objc_opt_class();
      v14 = v19;
      _os_log_impl(&dword_21610C000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] wakeup has changed to be later, treating state as expired", (uint8_t *)&v18, 0xCu);

    }
    v15 = v5;
  }
  else
  {
    objc_msgSend(v8, "dueDate");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  return v16;
}

- (void)didEnter
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "hasStateTransitionOrInitializing"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (v5 = objc_msgSend(v4, "type")) != 0)
    {
      v6 = v5;
      -[HKSPStateMachineState stateMachine](self, "stateMachine");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postWakeDetectionNotification:", v6);

    }
    else
    {
      HKSPLogForCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543362;
        v11 = (id)objc_opt_class();
        v9 = v11;
        _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] not posting wake detection notification", (uint8_t *)&v10, 0xCu);

      }
    }
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
  if (-[HDSPWakeDetectionStateMachineState isWakeDetectionDisabled](self, "isWakeDetectionDisabled"))
  {
    HKSPLogForCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543362;
      v9 = (id)objc_opt_class();
      v4 = v9;
      _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] wake detection disabled after notifying", (uint8_t *)&v8, 0xCu);

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
  v2.super_class = (Class)HDSPWakeDetectionNotifiedState;
  -[HDSPWakeDetectionStateMachineState updateState](&v2, sel_updateState);
}

- (id)stateName
{
  return CFSTR("Notified");
}

@end
