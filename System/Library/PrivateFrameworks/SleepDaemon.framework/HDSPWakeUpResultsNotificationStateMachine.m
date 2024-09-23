@implementation HDSPWakeUpResultsNotificationStateMachine

- (HDSPWakeUpResultsNotificationStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HDSPWakeUpResultsNotificationStateMachine *v20;
  HDSPWakeUpResultsNotificationWaitingForWakeUpState *v21;
  HDSPWakeUpResultsNotificationWaitingForWakeUpState *waitingForWakeUpState;
  HDSPWakeUpResultsNotificationDelayingForTrackingState *v23;
  HDSPWakeUpResultsNotificationDelayingForTrackingState *delayingForTrackingState;
  HDSPWakeUpResultsNotificationWaitingForRetryState *v25;
  HDSPWakeUpResultsNotificationWaitingForRetryState *waitingForRetryState;
  HDSPWakeUpResultsNotificationQueryingState *v27;
  HDSPWakeUpResultsNotificationQueryingState *queryingState;
  HDSPWakeUpResultsNotificationNeedsProtectedDataState *v29;
  HDSPWakeUpResultsNotificationNeedsProtectedDataState *needsProtectedDataState;
  HDSPWakeUpResultsNotificationNotifiedState *v31;
  HDSPWakeUpResultsNotificationNotifiedState *notifiedState;
  HDSPWakeUpResultsNotificationDisabledState *v33;
  HDSPWakeUpResultsNotificationDisabledState *disabledState;
  HDSPWakeUpResultsNotificationDisabledState *v35;
  HDSPWakeUpResultsNotificationDisabledState *v36;
  HDSPWakeUpResultsNotificationStateMachine *v37;
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
  v39.super_class = (Class)HDSPWakeUpResultsNotificationStateMachine;
  v20 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](&v39, sel_initWithIdentifier_allowedStates_persistence_delegate_infoProvider_currentDateProvider_, v17, v19, v16, v15, v14, v13);

  if (v20)
  {
    v21 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationWaitingForWakeUpState alloc], "initWithStateMachine:", v20);
    waitingForWakeUpState = v20->_waitingForWakeUpState;
    v20->_waitingForWakeUpState = v21;

    v23 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationDelayingForTrackingState alloc], "initWithStateMachine:", v20);
    delayingForTrackingState = v20->_delayingForTrackingState;
    v20->_delayingForTrackingState = v23;

    v25 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationWaitingForRetryState alloc], "initWithStateMachine:", v20);
    waitingForRetryState = v20->_waitingForRetryState;
    v20->_waitingForRetryState = v25;

    v27 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationQueryingState alloc], "initWithStateMachine:", v20);
    queryingState = v20->_queryingState;
    v20->_queryingState = v27;

    v29 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationNeedsProtectedDataState alloc], "initWithStateMachine:", v20);
    needsProtectedDataState = v20->_needsProtectedDataState;
    v20->_needsProtectedDataState = v29;

    v31 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationNotifiedState alloc], "initWithStateMachine:", v20);
    notifiedState = v20->_notifiedState;
    v20->_notifiedState = v31;

    v33 = -[HKSPPersistentStateMachineState initWithStateMachine:]([HDSPWakeUpResultsNotificationDisabledState alloc], "initWithStateMachine:", v20);
    disabledState = v20->_disabledState;
    v20->_disabledState = v33;

    -[HKSPPersistentStateMachine persistedState](v20, "persistedState");
    v35 = (HDSPWakeUpResultsNotificationDisabledState *)objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if (!v35)
      v36 = v20->_disabledState;
    -[HKSPStateMachine setInitialState:](v20, "setInitialState:", v36);

    v37 = v20;
  }

  return v20;
}

- (id)allStates
{
  HDSPWakeUpResultsNotificationDelayingForTrackingState *delayingForTrackingState;
  HDSPWakeUpResultsNotificationQueryingState *queryingState;
  HDSPWakeUpResultsNotificationNotifiedState *notifiedState;
  _QWORD v6[8];

  v6[7] = *MEMORY[0x24BDAC8D0];
  delayingForTrackingState = self->_delayingForTrackingState;
  v6[0] = self->_waitingForWakeUpState;
  v6[1] = delayingForTrackingState;
  queryingState = self->_queryingState;
  v6[2] = self->_waitingForRetryState;
  v6[3] = queryingState;
  notifiedState = self->_notifiedState;
  v6[4] = self->_needsProtectedDataState;
  v6[5] = notifiedState;
  v6[6] = self->_disabledState;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isWaitingForWakeUp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKSPStateMachine currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HDSPWakeUpResultsNotificationStateMachine waitingForWakeUpState](self, "waitingForWakeUpState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HKSPStateMachine currentState](self, "currentState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPWakeUpResultsNotificationStateMachine waitingForWakeUpState](self, "waitingForWakeUpState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isDelayingForTracking
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[HKSPStateMachine currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HDSPWakeUpResultsNotificationStateMachine delayingForTrackingState](self, "delayingForTrackingState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[HKSPStateMachine currentState](self, "currentState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDSPWakeUpResultsNotificationStateMachine delayingForTrackingState](self, "delayingForTrackingState");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)loggingCategory
{
  return 8;
}

- (void)protectedHealthDataDidBecomeAvailable
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "protectedHealthDataDidBecomeAvailable");

}

- (void)queryDidFailWithError:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryDidFailWithError:", v4);

}

- (void)queryDidComplete
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "queryDidComplete");

}

- (void)wakeUpDidOccur
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "wakeUpDidOccur");

}

- (void)didPostResultsNotification
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didPostResultsNotification");

}

- (void)retryAttemptEventDue
{
  id v2;

  -[HKSPStateMachine currentState](self, "currentState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "retryAttemptEventDue");

}

- (void)executeQuery
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_11);
}

uint64_t __57__HDSPWakeUpResultsNotificationStateMachine_executeQuery__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executeQuery");
}

- (void)postResultsNotification
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_192);
}

uint64_t __68__HDSPWakeUpResultsNotificationStateMachine_postResultsNotification__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "postResultsNotification");
}

- (void)scheduleRetryAttempt
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_193_0);
}

uint64_t __65__HDSPWakeUpResultsNotificationStateMachine_scheduleRetryAttempt__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleRetryAttempt");
}

- (void)unscheduleRetryAttempt
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_194_0);
}

uint64_t __67__HDSPWakeUpResultsNotificationStateMachine_unscheduleRetryAttempt__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unscheduleRetryAttempt");
}

- (void)startObservingProtectedHealthDataAvailability
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_195);
}

uint64_t __90__HDSPWakeUpResultsNotificationStateMachine_startObservingProtectedHealthDataAvailability__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "startObservingProtectedHealthDataAvailability");
}

- (void)stopObservingProtectedHealthDataAvailability
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_196_0);
}

uint64_t __89__HDSPWakeUpResultsNotificationStateMachine_stopObservingProtectedHealthDataAvailability__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stopObservingProtectedHealthDataAvailability");
}

- (HDSPWakeUpResultsNotificationWaitingForWakeUpState)waitingForWakeUpState
{
  return self->_waitingForWakeUpState;
}

- (HDSPWakeUpResultsNotificationDelayingForTrackingState)delayingForTrackingState
{
  return self->_delayingForTrackingState;
}

- (HDSPWakeUpResultsNotificationWaitingForRetryState)waitingForRetryState
{
  return self->_waitingForRetryState;
}

- (HDSPWakeUpResultsNotificationQueryingState)queryingState
{
  return self->_queryingState;
}

- (HDSPWakeUpResultsNotificationNeedsProtectedDataState)needsProtectedDataState
{
  return self->_needsProtectedDataState;
}

- (HDSPWakeUpResultsNotificationNotifiedState)notifiedState
{
  return self->_notifiedState;
}

- (HDSPWakeUpResultsNotificationDisabledState)disabledState
{
  return self->_disabledState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledState, 0);
  objc_storeStrong((id *)&self->_notifiedState, 0);
  objc_storeStrong((id *)&self->_needsProtectedDataState, 0);
  objc_storeStrong((id *)&self->_queryingState, 0);
  objc_storeStrong((id *)&self->_waitingForRetryState, 0);
  objc_storeStrong((id *)&self->_delayingForTrackingState, 0);
  objc_storeStrong((id *)&self->_waitingForWakeUpState, 0);
}

@end
