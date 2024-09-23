@implementation HDSPWakeUpResultsNotificationNotifiedState

- (id)stateName
{
  return CFSTR("Notified");
}

- (id)expirationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDSPWakeUpResultsNotificationStateMachineState infoProvider](self, "infoProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDSPWakeUpResultsNotificationStateMachineState infoProvider](self, "infoProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notificationAttemptWindowForWakeUpBeforeDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
    objc_msgSend(v8, "postResultsNotification");

  }
}

- (void)didPostResultsNotification
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
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = (id)objc_opt_class();
    v4 = v9;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received posting notification completion event", (uint8_t *)&v8, 0xCu);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "waitingForWakeUpState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v7);

}

@end
