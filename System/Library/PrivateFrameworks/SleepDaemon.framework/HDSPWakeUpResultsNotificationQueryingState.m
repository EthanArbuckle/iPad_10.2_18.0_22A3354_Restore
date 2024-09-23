@implementation HDSPWakeUpResultsNotificationQueryingState

- (HDSPWakeUpResultsNotificationQueryingState)initWithCoder:(id)a3
{
  HDSPWakeUpResultsNotificationQueryingState *v3;
  HDSPWakeUpResultsNotificationQueryingState *v4;
  HDSPWakeUpResultsNotificationQueryingState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDSPWakeUpResultsNotificationQueryingState;
  v3 = -[HKSPPersistentStateMachineState initWithCoder:](&v7, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_shouldRetryImmediatelyOnFailure = 0;
    v5 = v3;
  }

  return v4;
}

- (id)stateName
{
  return CFSTR("Querying");
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

- (BOOL)schedulesExpiration
{
  return 1;
}

- (void)didEnter
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "hasStateTransitionOrInitializing"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "previousState");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "needsProtectedDataState");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v14, "previousState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "needsProtectedDataState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());

        if ((v11 & 1) != 0)
          goto LABEL_8;
      }
      else
      {

      }
    }
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "startObservingProtectedHealthDataAvailability");

LABEL_8:
    -[HDSPWakeUpResultsNotificationQueryingState _executeQuery](self, "_executeQuery");

  }
}

- (void)didExit
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "hasStateTransitionOrInitializing"))
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "nextState");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(v4, "needsProtectedDataState");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v12, "nextState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "needsProtectedDataState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isMemberOfClass:", objc_opt_class());

        if ((v11 & 1) != 0)
          goto LABEL_8;
      }
      else
      {

      }
    }
    objc_msgSend(v4, "stopObservingProtectedHealthDataAvailability");
LABEL_8:

  }
}

- (void)queryDidFailWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  HKSPLogForCategory();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2114;
    v10 = v4;
    v6 = v8;
    _os_log_impl(&dword_21610C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received query failed with error %{public}@", (uint8_t *)&v7, 0x16u);

  }
  if (objc_msgSend(v4, "hksp_isHealthDatabaseInaccessibleError"))
  {
    -[HDSPWakeUpResultsNotificationQueryingState _retryQueryIfNeededOrTransitionToNeedsProtectedDataState](self, "_retryQueryIfNeededOrTransitionToNeedsProtectedDataState");
  }
  else if (objc_msgSend(v4, "hdsp_isInsufficientSleepDataError"))
  {
    -[HDSPWakeUpResultsNotificationQueryingState _transitionToRetryState](self, "_transitionToRetryState");
  }
  else
  {
    -[HDSPWakeUpResultsNotificationQueryingState _transitionToWaitingForWakeUpState](self, "_transitionToWaitingForWakeUpState");
  }

}

- (void)queryDidComplete
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received query completion event", (uint8_t *)&v5, 0xCu);

  }
  -[HDSPWakeUpResultsNotificationQueryingState _transitionToNotifiedState](self, "_transitionToNotifiedState");
}

- (void)protectedHealthDataDidBecomeAvailable
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = (id)objc_opt_class();
    v4 = v6;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received protected heath data available event", (uint8_t *)&v5, 0xCu);

  }
  self->_shouldRetryImmediatelyOnFailure = 1;
}

- (void)_executeQuery
{
  NSObject *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  HKSPLogForCategory();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = (id)objc_opt_class();
    v4 = v7;
    _os_log_impl(&dword_21610C000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Executing query", (uint8_t *)&v6, 0xCu);

  }
  self->_shouldRetryImmediatelyOnFailure = 0;
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery");

}

- (void)_retryQueryIfNeededOrTransitionToNeedsProtectedDataState
{
  void *v3;
  void *v4;
  id v5;

  if (self->_shouldRetryImmediatelyOnFailure)
  {
    -[HDSPWakeUpResultsNotificationQueryingState _executeQuery](self, "_executeQuery");
  }
  else
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "needsProtectedDataState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enterState:", v4);

  }
}

- (void)_transitionToWaitingForWakeUpState
{
  void *v3;
  void *v4;
  id v5;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitingForWakeUpState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

- (void)_transitionToNotifiedState
{
  void *v3;
  void *v4;
  id v5;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifiedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

- (void)_transitionToRetryState
{
  void *v3;
  void *v4;
  id v5;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "waitingForRetryState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enterState:", v4);

}

@end
