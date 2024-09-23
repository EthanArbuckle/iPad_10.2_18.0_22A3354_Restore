@implementation SCLSettingsSyncStateMachine

- (SCLSettingsSyncStateMachine)init
{
  return -[SCLSettingsSyncStateMachine initWithContext:](self, "initWithContext:", 0);
}

- (SCLSettingsSyncStateMachine)initWithContext:(id)a3
{
  SCLSettingsSyncContext *v4;
  SCLSettingsSyncStateMachine *v5;
  SCLSettingsSyncStateSynced *v6;
  SCLSettingsSyncState *syncedState;
  SCLSettingsSyncStatePendingSend *v8;
  SCLSettingsSyncState *pendingSendState;
  SCLSettingsSyncStateSending *v10;
  SCLSettingsSyncState *sendingState;
  SCLSettingsSyncStateSent *v12;
  SCLSettingsSyncState *sentState;
  SCLSettingsSyncStateFailed *v14;
  SCLSettingsSyncState *failedState;
  SCLSettingsSyncErrorHandler *v16;
  SCLSettingsSyncErrorHandler *errorHandler;
  objc_super v19;

  v4 = (SCLSettingsSyncContext *)a3;
  v19.receiver = self;
  v19.super_class = (Class)SCLSettingsSyncStateMachine;
  v5 = -[SCLSettingsSyncStateMachine init](&v19, sel_init);
  if (v5)
  {
    if (!v4)
    {
      v4 = objc_alloc_init(SCLSettingsSyncContext);
      -[SCLSettingsSyncContext setSyncStatus:](v4, "setSyncStatus:", 0);
    }
    objc_storeStrong((id *)&v5->_context, v4);
    v6 = -[SCLSettingsSyncState initWithStateMachine:]([SCLSettingsSyncStateSynced alloc], "initWithStateMachine:", v5);
    syncedState = v5->_syncedState;
    v5->_syncedState = &v6->super;

    v8 = -[SCLSettingsSyncState initWithStateMachine:]([SCLSettingsSyncStatePendingSend alloc], "initWithStateMachine:", v5);
    pendingSendState = v5->_pendingSendState;
    v5->_pendingSendState = &v8->super;

    v10 = -[SCLSettingsSyncState initWithStateMachine:]([SCLSettingsSyncStateSending alloc], "initWithStateMachine:", v5);
    sendingState = v5->_sendingState;
    v5->_sendingState = &v10->super;

    v12 = -[SCLSettingsSyncState initWithStateMachine:]([SCLSettingsSyncStateSent alloc], "initWithStateMachine:", v5);
    sentState = v5->_sentState;
    v5->_sentState = &v12->super;

    v14 = -[SCLSettingsSyncState initWithStateMachine:]([SCLSettingsSyncStateFailed alloc], "initWithStateMachine:", v5);
    failedState = v5->_failedState;
    v5->_failedState = &v14->super;

    v16 = objc_alloc_init(SCLSettingsSyncErrorHandler);
    errorHandler = v5->_errorHandler;
    v5->_errorHandler = v16;

  }
  return v5;
}

- (void)activate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  -[SCLSettingsSyncStateMachine context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "syncStatus");

  switch(v4)
  {
    case 0:
      -[SCLSettingsSyncStateMachine syncedState](self, "syncedState");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[SCLSettingsSyncStateMachine pendingSendState](self, "pendingSendState");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[SCLSettingsSyncStateMachine sendingState](self, "sendingState");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[SCLSettingsSyncStateMachine sentState](self, "sentState");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[SCLSettingsSyncStateMachine failedState](self, "failedState");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v6 = (void *)v5;
      break;
    default:
      v6 = 0;
      break;
  }
  v7 = v6;
  -[SCLSettingsSyncStateMachine transitionToState:](self, "transitionToState:", v6);

}

- (void)settingsDidChange
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  scl_transport_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settingsDidChange");

}

- (void)commitSettings
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  scl_transport_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commitSettings");

}

- (void)significantUserInteractionOccurred
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  scl_transport_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "significantUserInteractionOccurred");

}

- (void)xpcActivityStarted
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  scl_transport_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v7, 0xCu);

  }
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "xpcActivityStarted");

}

- (void)enqueueFailedWithError:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  scl_transport_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

  }
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enqueueFailedWithError:", v5);

}

- (void)didEnqueueMessage:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  scl_transport_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

  }
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didEnqueueMessage:", v5);

}

- (void)message:(id)a3 failedWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (-[SCLSettingsSyncStateMachine _isRelevantMessage:](self, "_isRelevantMessage:", v7))
  {
    scl_transport_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_21E4AD000, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);

    }
    -[SCLSettingsSyncStateMachine currentState](self, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "message:failedWithError:", v7, v8);

  }
}

- (void)messageDidSend:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[SCLSettingsSyncStateMachine _isRelevantMessage:](self, "_isRelevantMessage:", v5))
  {
    scl_transport_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

    }
    -[SCLSettingsSyncStateMachine currentState](self, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageDidSend:", v5);

  }
}

- (void)messageWasDelivered:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (-[SCLSettingsSyncStateMachine _isRelevantMessage:](self, "_isRelevantMessage:", v5))
  {
    scl_transport_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_21E4AD000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v9, 0xCu);

    }
    -[SCLSettingsSyncStateMachine currentState](self, "currentState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageWasDelivered:", v5);

  }
}

- (void)message:(id)a3 didFailToAcknowledgeWithError:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (-[SCLSettingsSyncStateMachine _isRelevantMessage:](self, "_isRelevantMessage:", v7))
  {
    scl_transport_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_21E4AD000, v9, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v12, 0xCu);

    }
    -[SCLSettingsSyncStateMachine currentState](self, "currentState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "message:didFailToAcknowledgeWithError:", v7, v8);

  }
}

- (BOOL)_isRelevantMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SCLSettingsSyncStateMachine context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "messageIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  return v7;
}

- (void)performSync
{
  id v3;

  -[SCLSettingsSyncStateMachine delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performSyncForStateMachine:", self);

}

- (void)scheduleRetryWithActivityCriteria:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SCLSettingsSyncStateMachine delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateMachine:scheduleRetryWithActivityCriteria:", self, v4);

}

- (void)cancelRetryActivity
{
  id v3;

  -[SCLSettingsSyncStateMachine delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRetryActivityForStateMachine:", self);

}

- (void)scheduleCommitTimerWithInterval:(double)a3
{
  id v5;

  -[SCLSettingsSyncStateMachine delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateMachine:scheduleCommitTimerWithInterval:", self, a3);

}

- (void)cancelCommitTimer
{
  id v3;

  -[SCLSettingsSyncStateMachine delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelCommitTimerForStateMachine:", self);

}

- (void)transitionToState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[SCLSettingsSyncStateMachine currentState](self, "currentState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "willExitWithNextState:", v5);
  objc_storeStrong((id *)&self->_currentState, a3);
  -[SCLSettingsSyncStateMachine context](self, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSyncStatus:", objc_msgSend(v5, "status"));

  objc_msgSend(v5, "didEnterWithPreviousState:", v6);
  scl_transport_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412546;
    v11 = v6;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_21E4AD000, v8, OS_LOG_TYPE_DEFAULT, "Transition from state %@ to state: %@", (uint8_t *)&v10, 0x16u);
  }

  -[SCLSettingsSyncStateMachine delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stateMachine:didTransitionFromState:toState:", self, v6, v5);

}

- (SCLSettingsSyncStateMachineDelegate)delegate
{
  return (SCLSettingsSyncStateMachineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SCLSettingsSyncContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (SCLSettingsSyncErrorHandler)errorHandler
{
  return self->_errorHandler;
}

- (SCLSettingsSyncState)currentState
{
  return self->_currentState;
}

- (SCLSettingsSyncState)syncedState
{
  return self->_syncedState;
}

- (SCLSettingsSyncState)pendingSendState
{
  return self->_pendingSendState;
}

- (SCLSettingsSyncState)sendingState
{
  return self->_sendingState;
}

- (SCLSettingsSyncState)sentState
{
  return self->_sentState;
}

- (SCLSettingsSyncState)failedState
{
  return self->_failedState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedState, 0);
  objc_storeStrong((id *)&self->_sentState, 0);
  objc_storeStrong((id *)&self->_sendingState, 0);
  objc_storeStrong((id *)&self->_pendingSendState, 0);
  objc_storeStrong((id *)&self->_syncedState, 0);
  objc_storeStrong((id *)&self->_currentState, 0);
  objc_storeStrong((id *)&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
