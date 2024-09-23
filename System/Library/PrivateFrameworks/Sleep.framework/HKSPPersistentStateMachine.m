@implementation HKSPPersistentStateMachine

- (HKSPPersistentStateMachine)initWithAllowedStates:(id)a3 delegate:(id)a4 infoProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  objc_class *v11;
  void *v12;
  void *v13;
  HKSPPersistentStateMachine *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKSPUserDefaultsStatePersistence();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:](self, "initWithIdentifier:allowedStates:persistence:delegate:infoProvider:", v12, v10, v13, v9, v8);

  return v14;
}

- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 allowedStates:(id)a4 persistence:(id)a5 delegate:(id)a6 infoProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  HKSPPersistentStateMachine *v18;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  HKSPCurrentDateProvider();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](self, "initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:", v16, v15, v14, v13, v12, v17);

  return v18;
}

- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 persistence:(id)a4 delegate:(id)a5 infoProvider:(id)a6 currentDateProvider:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  HKSPPersistentStateMachine *v19;

  v12 = (void *)MEMORY[0x1E0C99E60];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  objc_msgSend(v12, "set");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[HKSPPersistentStateMachine initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:](self, "initWithIdentifier:allowedStates:persistence:delegate:infoProvider:currentDateProvider:", v17, v18, v16, v15, v14, v13);

  return v19;
}

- (HKSPPersistentStateMachine)initWithIdentifier:(id)a3 allowedStates:(id)a4 persistence:(id)a5 delegate:(id)a6 infoProvider:(id)a7 currentDateProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HKSPPersistentStateMachine *v18;
  uint64_t v19;
  NSString *identifier;
  uint64_t v21;
  id currentDateProvider;
  HKSPPersistentStateMachine *v23;
  objc_super v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)HKSPPersistentStateMachine;
  v18 = -[HKSPStateMachine initWithDelegate:infoProvider:](&v25, sel_initWithDelegate_infoProvider_, a6, a7);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    identifier = v18->_identifier;
    v18->_identifier = (NSString *)v19;

    objc_storeStrong((id *)&v18->_allowedStates, a4);
    objc_storeStrong((id *)&v18->_persistence, a5);
    v21 = objc_msgSend(v17, "copy");
    currentDateProvider = v18->_currentDateProvider;
    v18->_currentDateProvider = (id)v21;

    v23 = v18;
  }

  return v18;
}

- (id)persistedState
{
  HKSPStatePersistence *persistence;
  NSString *identifier;
  NSSet *allowedStates;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  persistence = self->_persistence;
  identifier = self->_identifier;
  allowedStates = self->_allowedStates;
  v12 = 0;
  -[HKSPStatePersistence loadPersistentStateForIdentifier:allowedStates:error:](persistence, "loadPersistentStateForIdentifier:allowedStates:error:", identifier, allowedStates, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  objc_msgSend(v6, "setStateMachine:", self);
  if (v7)
  {
    HKSPLogForCategory(-[HKSPStateMachine loggingCategory](self, "loggingCategory"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      -[HKSPStateMachine stateMachineName](self, "stateMachineName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v14 = v11;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A4F0E000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to load state with error %{public}@", buf, 0x16u);

    }
    v9 = 0;
  }
  else
  {
    v9 = v6;
  }

  return v9;
}

- (NSArray)scheduledExpirationStateIdentifiers
{
  void *v2;
  void *v3;
  void *v4;

  -[HKSPStateMachine allStates](self, "allStates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_filter:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_185);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __65__HKSPPersistentStateMachine_scheduledExpirationStateIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "schedulesExpiration");
}

uint64_t __65__HKSPPersistentStateMachine_scheduledExpirationStateIdentifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stateIdentifier");
}

- (NSDate)currentStateExpirationDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;

  -[HKSPStateMachine currentState](self, "currentState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lifetimeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[HKSPStateMachine currentState](self, "currentState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lifetimeInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSDate *)v8;
}

- (void)enterState:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  HKSPStatePersistence *persistence;
  NSString *identifier;
  char v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17.receiver = self;
  v17.super_class = (Class)HKSPPersistentStateMachine;
  -[HKSPStateMachine enterState:](&v17, sel_enterState_, v4);
  if ((NAEqualObjects() & 1) == 0)
  {
    if ((HKSPIsUnitTesting() & 1) == 0)
    {
      HKSPLogForCategory(-[HKSPStateMachine loggingCategory](self, "loggingCategory"));
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        -[HKSPStateMachine stateMachineName](self, "stateMachineName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stateName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v7;
        v20 = 2114;
        v21 = v8;
        _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Persisting state %{public}@", buf, 0x16u);

      }
    }
    persistence = self->_persistence;
    identifier = self->_identifier;
    v16 = 0;
    v11 = -[HKSPStatePersistence savePersistentState:identifier:error:](persistence, "savePersistentState:identifier:error:", v4, identifier, &v16);
    v12 = v16;
    if ((v11 & 1) != 0)
    {
      if ((HKSPIsUnitTesting() & 1) != 0)
      {
LABEL_13:

        goto LABEL_14;
      }
      HKSPLogForCategory(-[HKSPStateMachine loggingCategory](self, "loggingCategory"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
LABEL_12:

        goto LABEL_13;
      }
      -[HKSPStateMachine stateMachineName](self, "stateMachineName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stateName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      _os_log_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Successfully persisted state %{public}@", buf, 0x16u);
    }
    else
    {
      HKSPLogForCategory(-[HKSPStateMachine loggingCategory](self, "loggingCategory"));
      v13 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      -[HKSPStateMachine stateMachineName](self, "stateMachineName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "stateName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      v20 = 2114;
      v21 = v15;
      v22 = 2114;
      v23 = v12;
      _os_log_error_impl(&dword_1A4F0E000, v13, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to persist state %{public}@ with error %{public}@", buf, 0x20u);
    }

    goto LABEL_12;
  }
LABEL_14:

}

- (void)stateWithIdentifierDidExpire:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HKSPStateMachine currentState](self, "currentState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stateWithIdentifierDidExpire:", v4);

}

- (void)scheduleStateExpiration
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_190);
}

uint64_t __53__HKSPPersistentStateMachine_scheduleStateExpiration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "scheduleStateExpiration");
}

- (void)unscheduleStateExpiration
{
  -[HKSPStateMachine notifyDelegateWithBlock:](self, "notifyDelegateWithBlock:", &__block_literal_global_191);
}

uint64_t __55__HKSPPersistentStateMachine_unscheduleStateExpiration__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "unscheduleStateExpiration");
}

- (id)currentDateProvider
{
  return self->_currentDateProvider;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)allowedStates
{
  return self->_allowedStates;
}

- (HKSPStatePersistence)persistence
{
  return self->_persistence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistence, 0);
  objc_storeStrong((id *)&self->_allowedStates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong(&self->_currentDateProvider, 0);
}

@end
