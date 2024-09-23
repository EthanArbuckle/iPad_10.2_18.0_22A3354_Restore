@implementation HKSPPersistentStateMachineState

+ (id)infiniteInterval
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithStartDate:endDate:", v3, v4);

  return v5;
}

- (HKSPPersistentStateMachineState)initWithStateMachine:(id)a3
{
  HKSPPersistentStateMachineState *v3;
  uint64_t v4;
  NSDateInterval *lifetimeInterval;
  HKSPPersistentStateMachineState *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKSPPersistentStateMachineState;
  v3 = -[HKSPStateMachineState initWithStateMachine:](&v8, sel_initWithStateMachine_, a3);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "infiniteInterval");
    v4 = objc_claimAutoreleasedReturnValue();
    lifetimeInterval = v3->_lifetimeInterval;
    v3->_lifetimeInterval = (NSDateInterval *)v4;

    v6 = v3;
  }

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("EntryDate"));

  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("ExpirationDate"));

}

- (HKSPPersistentStateMachineState)initWithCoder:(id)a3
{
  id v4;
  HKSPPersistentStateMachineState *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDateInterval *lifetimeInterval;
  HKSPPersistentStateMachineState *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKSPPersistentStateMachineState;
  v5 = -[HKSPStateMachineState initWithStateMachine:](&v15, sel_initWithStateMachine_, 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntryDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExpirationDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    v9 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10 = v7;
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);
    lifetimeInterval = v5->_lifetimeInterval;
    v5->_lifetimeInterval = (NSDateInterval *)v11;

    if (v7)
    {
      if (v6)
      {
LABEL_8:
        v13 = v5;

        goto LABEL_9;
      }
    }
    else
    {

      if (v6)
        goto LABEL_8;
    }

    goto LABEL_8;
  }
LABEL_9:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HKSPPersistentStateMachineState;
  v4 = -[HKSPStateMachineState copyWithZone:](&v9, sel_copyWithZone_, a3);
  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "copy");
  v7 = (void *)v4[2];
  v4[2] = v6;

  return v4;
}

- (id)equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKSPPersistentStateMachineState;
  -[HKSPStateMachineState equalsBuilderWithObject:](&v12, sel_equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__HKSPPersistentStateMachineState_equalsBuilderWithObject___block_invoke;
  v10[3] = &unk_1E4E3B818;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

  return v5;
}

uint64_t __59__HKSPPersistentStateMachineState_equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "lifetimeInterval");
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HKSPPersistentStateMachineState;
  -[HKSPStateMachineState succinctDescriptionBuilder](&v21, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v7 & 1) == 0)
  {
    -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hkspDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("entryDate"));

  }
  -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isEqualToDate:", v14);

  if ((v15 & 1) == 0)
  {
    -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "hkspDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)objc_msgSend(v3, "appendObject:withName:", v18, CFSTR("expirationDate"));

  }
  return v3;
}

- (void)_updateState
{
  NSObject *v3;
  id v4;
  objc_super v5;
  uint8_t buf[4];
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[HKSPPersistentStateMachineState _isExpired](self, "_isExpired"))
  {
    HKSPLogForCategory(7uLL);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v7 = (id)objc_opt_class();
      v4 = v7;
      _os_log_impl(&dword_1A4F0E000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] already expired", buf, 0xCu);

    }
    -[HKSPPersistentStateMachineState stateDidExpire](self, "stateDidExpire");
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)HKSPPersistentStateMachineState;
    -[HKSPStateMachineState _updateState](&v5, sel__updateState);
    -[HKSPPersistentStateMachineState _expireOrRescheduleExpirationIfNecessary](self, "_expireOrRescheduleExpirationIfNecessary");
  }
}

- (void)_expireOrRescheduleExpirationIfNecessary
{
  _BOOL4 v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[HKSPStateMachineState isCurrentState](self, "isCurrentState"))
  {
    v3 = -[HKSPPersistentStateMachineState _updateExpirationDate](self, "_updateExpirationDate");
    if (-[HKSPPersistentStateMachineState _isExpired](self, "_isExpired"))
    {
      HKSPLogForCategory(7uLL);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = (id)objc_opt_class();
        v5 = v10;
        _os_log_impl(&dword_1A4F0E000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] now expired", (uint8_t *)&v9, 0xCu);

      }
      -[HKSPPersistentStateMachineState stateDidExpire](self, "stateDidExpire");
    }
    else if (v3 && -[HKSPPersistentStateMachineState schedulesExpiration](self, "schedulesExpiration"))
    {
      HKSPLogForCategory(7uLL);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 138543362;
        v10 = (id)objc_opt_class();
        v7 = v10;
        _os_log_impl(&dword_1A4F0E000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] rescheduling expiration", (uint8_t *)&v9, 0xCu);

      }
      -[HKSPStateMachineState stateMachine](self, "stateMachine");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scheduleStateExpiration");

    }
  }
}

+ (BOOL)_hasExpirationDate:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend(a3, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hksp_isBeforeDate:", v4);

  return v5;
}

- (BOOL)_isExpired
{
  void *v3;
  NSDateInterval *lifetimeInterval;
  void *v5;
  void (**v6)(void);
  void *v7;

  v3 = (void *)objc_opt_class();
  lifetimeInterval = self->_lifetimeInterval;
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDateProvider");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "_isExpired:currentDate:", lifetimeInterval, v7);

  return (char)v3;
}

+ (BOOL)_isExpired:(id)a3 currentDate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  const char *v14;
  void *v15;
  int v16;
  void *v17;
  BOOL v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!objc_msgSend(a1, "_hasExpirationDate:", v6))
    goto LABEL_10;
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hksp_isBeforeDate:", v8);

  if (v9)
  {
    HKSPLogForCategory(7uLL);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_opt_class();
      v12 = v11;
      objc_msgSend(v6, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v11;
      v22 = 2114;
      v23 = v13;
      v14 = "[%{public}@] it's before the entry date (%{public}@)";
LABEL_8:
      _os_log_impl(&dword_1A4F0E000, v10, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v20, 0x16u);

      goto LABEL_9;
    }
    goto LABEL_9;
  }
  objc_msgSend(v6, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v7, "hksp_isAfterOrSameAsDate:", v15);

  if (!v16)
  {
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  HKSPLogForCategory(7uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    v12 = v17;
    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v17;
    v22 = 2114;
    v23 = v13;
    v14 = "[%{public}@] it's after expiration date (%{public}@)";
    goto LABEL_8;
  }
LABEL_9:

  v18 = 1;
LABEL_11:

  return v18;
}

- (NSDate)expirationDate
{
  return 0;
}

- (double)expirationDuration
{
  return 0.0;
}

- (BOOL)schedulesExpiration
{
  return 0;
}

- (HKSPPersistentStateMachineState)stateWithIdentifierDidExpire:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  id v10;
  HKSPPersistentStateMachineState *result;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSPStateMachineState stateIdentifier](self, "stateIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  HKSPLogForCategory(7uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      v12 = 138543362;
      v13 = (id)objc_opt_class();
      v9 = v13;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] expiring", (uint8_t *)&v12, 0xCu);

    }
    -[HKSPPersistentStateMachineState stateDidExpire](self, "stateDidExpire");
  }
  else
  {
    if (v8)
    {
      v12 = 138543618;
      v13 = (id)objc_opt_class();
      v14 = 2114;
      v15 = v4;
      v10 = v13;
      _os_log_impl(&dword_1A4F0E000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] ignoring expired identifier %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }

  return result;
}

- (BOOL)_willEnter
{
  void *v3;
  void (**v4)(void);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  BOOL v16;
  objc_super v18;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDateProvider");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  objc_msgSend(v3, "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[HKSPPersistentStateMachineState lifetimeInterval](self, "lifetimeInterval");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v10 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  objc_msgSend(v8, "lifetimeInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "startDate");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!self)
    goto LABEL_8;
  v11 = v6;
  if (objc_msgSend(v8, "isMemberOfClass:", objc_opt_class()))
  {
LABEL_6:
    if (objc_msgSend(v10, "hksp_isBeforeDate:", v6))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "isEqualToDate:", v13);

      if ((v14 & 1) == 0)
      {
        v10 = v10;

        v11 = v10;
        goto LABEL_9;
      }
    }
LABEL_8:
    v11 = v6;
  }
LABEL_9:
  -[HKSPPersistentStateMachineState _updatedLifetimeIntervalWithStartDate:](self, "_updatedLifetimeIntervalWithStartDate:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "_isExpired:currentDate:", v15, v6))
  {
    -[HKSPPersistentStateMachineState stateDidExpire](self, "stateDidExpire");
LABEL_13:
    v16 = 0;
    goto LABEL_14;
  }
  v18.receiver = self;
  v18.super_class = (Class)HKSPPersistentStateMachineState;
  if (!-[HKSPStateMachineState _willEnter](&v18, sel__willEnter))
    goto LABEL_13;
  objc_storeStrong((id *)&self->_lifetimeInterval, v15);
  v16 = 1;
LABEL_14:

  return v16;
}

- (void)_willExit
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKSPPersistentStateMachineState;
  -[HKSPStateMachineState _willExit](&v6, sel__willExit);
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self || !v5 || (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class()) & 1) == 0)
    -[HKSPPersistentStateMachineState _resetLifetimeInterval](self, "_resetLifetimeInterval");

}

- (void)_didEnter
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previousState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPPersistentStateMachineState schedulesExpiration](self, "schedulesExpiration")
    && (NAEqualObjects() & 1) == 0)
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scheduleStateExpiration");

  }
  v7.receiver = self;
  v7.super_class = (Class)HKSPPersistentStateMachineState;
  -[HKSPStateMachineState _didEnter](&v7, sel__didEnter);

}

- (void)_didExit
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nextState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HKSPPersistentStateMachineState schedulesExpiration](self, "schedulesExpiration")
    && (NAEqualObjects() & 1) == 0
    && (objc_msgSend(v5, "schedulesExpiration") & 1) == 0)
  {
    -[HKSPStateMachineState stateMachine](self, "stateMachine");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "unscheduleStateExpiration");

  }
  v7.receiver = self;
  v7.super_class = (Class)HKSPPersistentStateMachineState;
  -[HKSPStateMachineState _didExit](&v7, sel__didExit);

}

- (BOOL)_updateExpirationDate
{
  void *v3;
  void *v4;
  NSDateInterval *v5;
  NSDateInterval *lifetimeInterval;
  void *v7;
  void *v8;
  void *v9;
  int v10;

  -[NSDateInterval endDate](self->_lifetimeInterval, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateInterval startDate](self->_lifetimeInterval, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPPersistentStateMachineState _updatedLifetimeIntervalWithStartDate:](self, "_updatedLifetimeIntervalWithStartDate:", v4);
  v5 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  lifetimeInterval = self->_lifetimeInterval;
  self->_lifetimeInterval = v5;

  -[NSDateInterval endDate](self->_lifetimeInterval, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v7)
  {
    LOBYTE(v10) = 0;
  }
  else
  {
    -[NSDateInterval endDate](self->_lifetimeInterval, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[NSDateInterval endDate](self->_lifetimeInterval, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqual:", v9) ^ 1;

    }
    else
    {
      LOBYTE(v10) = 1;
    }

  }
  return v10;
}

- (id)_updatedLifetimeIntervalWithStartDate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  NSDateInterval *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void (**v20)(void);
  void *v21;
  NSDateInterval *v22;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSDateInterval startDate](self->_lifetimeInterval, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = NAEqualObjects();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSPPersistentStateMachineState expirationDuration](self, "expirationDuration");
  if (v8 <= 0.0)
  {
    -[HKSPPersistentStateMachineState expirationDate](self, "expirationDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v9 = v10;

      v7 = v9;
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "dateByAddingTimeInterval:");
    v9 = v7;
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NSDateInterval endDate](self->_lifetimeInterval, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = NAEqualObjects();

  if ((v6 & v12 & 1) != 0)
  {
    v13 = self->_lifetimeInterval;
LABEL_13:
    v22 = v13;
    goto LABEL_14;
  }
  if (!objc_msgSend(v7, "hksp_isBeforeDate:", v4))
  {
    v13 = (NSDateInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v7);
    goto LABEL_13;
  }
  HKSPLogForCategory(7uLL);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_opt_class();
    v16 = v15;
    objc_msgSend(v7, "hkspDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "hkspDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v15;
    v26 = 2114;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    _os_log_impl(&dword_1A4F0E000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@] expiration: %{public}@ is before entry: %{public}@, treated as expired now", (uint8_t *)&v24, 0x20u);

  }
  -[HKSPStateMachineState stateMachine](self, "stateMachine");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentDateProvider");
  v20 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v20[2]();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (NSDateInterval *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v21, v21);
LABEL_14:

  return v22;
}

- (void)_resetLifetimeInterval
{
  NSDateInterval *v3;
  NSDateInterval *lifetimeInterval;

  objc_msgSend((id)objc_opt_class(), "infiniteInterval");
  v3 = (NSDateInterval *)objc_claimAutoreleasedReturnValue();
  lifetimeInterval = self->_lifetimeInterval;
  self->_lifetimeInterval = v3;

}

- (NSDateInterval)lifetimeInterval
{
  return self->_lifetimeInterval;
}

- (void)setLifetimeInterval:(id)a3
{
  objc_storeStrong((id *)&self->_lifetimeInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lifetimeInterval, 0);
}

@end
