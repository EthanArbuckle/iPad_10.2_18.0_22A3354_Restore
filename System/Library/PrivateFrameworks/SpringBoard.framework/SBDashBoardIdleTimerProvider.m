@implementation SBDashBoardIdleTimerProvider

- (SBDashBoardIdleTimerProvider)initWithDelegate:(id)a3
{
  id v4;
  SBDashBoardIdleTimerProvider *v5;
  SBDashBoardIdleTimerProvider *v6;
  SBIdleTimer *idleTimer;
  NSMutableSet *v8;
  NSMutableSet *disabledIdleTimerAssertions;
  id v10;
  uint64_t v11;
  BSInvalidatable *stateCaptureAssertion;
  id v14;
  id location;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDashBoardIdleTimerProvider;
  v5 = -[SBDashBoardIdleTimerProvider init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    idleTimer = v6->_idleTimer;
    v6->_idleTimer = 0;

    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    disabledIdleTimerAssertions = v6->_disabledIdleTimerAssertions;
    v6->_disabledIdleTimerAssertions = v8;

    objc_initWeak(&location, v6);
    v10 = MEMORY[0x1E0C80D38];
    objc_copyWeak(&v14, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v11 = objc_claimAutoreleasedReturnValue();
    stateCaptureAssertion = v6->_stateCaptureAssertion;
    v6->_stateCaptureAssertion = (BSInvalidatable *)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v6;
}

id __49__SBDashBoardIdleTimerProvider_initWithDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "descriptionBuilderWithMultilinePrefix:", &stru_1E8EC7EC0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_stateCaptureAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardIdleTimerProvider;
  -[SBDashBoardIdleTimerProvider dealloc](&v3, sel_dealloc);
}

- (void)setIdleTimer:(id)a3
{
  SBIdleTimer *v4;
  SBIdleTimer *idleTimer;
  SBIdleTimer *v6;

  v4 = (SBIdleTimer *)a3;
  -[SBIdleTimer removeIdleTimerObserver:](self->_idleTimer, "removeIdleTimerObserver:", self);
  idleTimer = self->_idleTimer;
  self->_idleTimer = v4;
  v6 = v4;

  -[SBIdleTimer addIdleTimerObserver:](v6, "addIdleTimerObserver:", self);
}

- (void)resetIdleTimer
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "idleTimerWillRefresh:", self);

  -[SBIdleTimer reset](self->_idleTimer, "reset");
}

- (void)updateIdleTimerWithIdleDimProvider:(id)a3 reason:(id)a4
{
  id v7;
  id v8;
  SBFIdleTimerBehaviorProviding **p_idleTimerProvider;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  p_idleTimerProvider = &self->_idleTimerProvider;
  v10 = -[SBFIdleTimerBehaviorProviding idleTimerDuration](self->_idleTimerProvider, "idleTimerDuration");
  if (v10 != objc_msgSend(v7, "idleTimerDuration")
    || (v11 = -[SBFIdleTimerBehaviorProviding idleWarnMode](*p_idleTimerProvider, "idleWarnMode"),
        v11 != objc_msgSend(v7, "idleWarnMode"))
    || (v12 = -[SBFIdleTimerBehaviorProviding idleTimerMode](*p_idleTimerProvider, "idleTimerMode"),
        v12 != objc_msgSend(v7, "idleTimerMode")))
  {
    objc_storeStrong((id *)&self->_idleTimerProvider, a3);
    v13 = -[SBDashBoardIdleTimerProvider isIdleTimerEnabled](self, "isIdleTimerEnabled");
    SBLogIdleTimer();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v13)
    {
      if (v15)
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 138543618;
        v21 = v17;
        v22 = 2114;
        v23 = v8;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating idle timer for reason: %{public}@", (uint8_t *)&v20, 0x16u);

      }
      v14 = -[SBDashBoardIdleTimerProvider _copyIdleTimerBehaviorForBehaviorProvider:](self, "_copyIdleTimerBehaviorForBehaviorProvider:", v7);
      -[SBDashBoardIdleTimerProvider _proposeIdleTimerBehavior:forReason:](self, "_proposeIdleTimerBehavior:forReason:", v14, v8);
    }
    else if (v15)
    {
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v19;
      v22 = 2114;
      v23 = v8;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ - Updating idle timer for reason: %{public}@ (but not active)", (uint8_t *)&v20, 0x16u);

    }
  }

}

- (id)effectiveIdleTimerBehavior
{
  id v3;

  if (-[SBDashBoardIdleTimerProvider isIdleTimerEnabled](self, "isIdleTimerEnabled") && self->_idleTimerProvider)
  {
    v3 = -[SBDashBoardIdleTimerProvider _copyIdleTimerBehaviorForBehaviorProvider:](self, "_copyIdleTimerBehaviorForBehaviorProvider:");
  }
  else
  {
    +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)addDisabledIdleTimerAssertionReason:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet count](self->_disabledIdleTimerAssertions, "count");
  -[NSMutableSet addObject:](self->_disabledIdleTimerAssertions, "addObject:", v4);
  SBLogIdleTimer();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Added idle timer disabled reason: %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else
  {
    if (v7)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v11;
      v14 = 2114;
      v15 = v4;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ - Disabling idle timer for reason: %{public}@", (uint8_t *)&v12, 0x16u);

    }
    -[SBDashBoardIdleTimerProvider _proposeEffectiveIdleTimerBehaviorForReason:](self, "_proposeEffectiveIdleTimerBehaviorForReason:", v4);
  }

}

- (void)removeDisabledIdleTimerAssertionReason:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[NSMutableSet count](self->_disabledIdleTimerAssertions, "count");
  -[NSMutableSet removeObject:](self->_disabledIdleTimerAssertions, "removeObject:", v4);
  v6 = -[NSMutableSet count](self->_disabledIdleTimerAssertions, "count");
  SBLogIdleTimer();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v5)
    v9 = v6 == 0;
  else
    v9 = 0;
  if (v9)
  {
    if (v8)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Reenabling idle timer as last reason removed: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    -[SBDashBoardIdleTimerProvider _proposeEffectiveIdleTimerBehaviorForReason:](self, "_proposeEffectiveIdleTimerBehaviorForReason:", v4);
  }
  else
  {
    if (v8)
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v11;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ - Removed idle timer disabled reason: %{public}@", (uint8_t *)&v14, 0x16u);

    }
  }

}

- (BOOL)isDisabledAssertionActiveForReason:(id)a3
{
  return -[NSMutableSet containsObject:](self->_disabledIdleTimerAssertions, "containsObject:", a3);
}

- (BOOL)isIdleTimerEnabled
{
  return -[NSMutableSet count](self->_disabledIdleTimerAssertions, "count") == 0;
}

- (void)idleTimerDidRefresh:(id)a3
{
  SBIdleTimer *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  SBIdleTimer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (SBIdleTimer *)a3;
  if (-[SBDashBoardIdleTimerProvider isIdleTimerEnabled](self, "isIdleTimerEnabled") && self->_idleTimer == v4)
  {
    SBLogIdleTimer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Idle timer refreshed %{public}@", (uint8_t *)&v9, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "idleTimerDidRefresh:", self);

  }
}

- (void)idleTimerDidExpire:(id)a3
{
  SBIdleTimer *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  SBIdleTimer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (SBIdleTimer *)a3;
  if (-[SBDashBoardIdleTimerProvider isIdleTimerEnabled](self, "isIdleTimerEnabled") && self->_idleTimer == v4)
  {
    SBLogIdleTimer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Idle timer expired %{public}@", (uint8_t *)&v9, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "idleTimerDidExpire:", self);

  }
}

- (void)idleTimerDidWarn:(id)a3
{
  SBIdleTimer *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  SBIdleTimer *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = (SBIdleTimer *)a3;
  if (-[SBDashBoardIdleTimerProvider isIdleTimerEnabled](self, "isIdleTimerEnabled") && self->_idleTimer == v4)
  {
    SBLogIdleTimer();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ - Idle timer warned %{public}@", (uint8_t *)&v9, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "idleTimerDidWarn:", self);

  }
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBDashBoardIdleTimerProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBDashBoardIdleTimerProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[SBDashBoardIdleTimerProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SBDashBoardIdleTimerProvider_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E9E820;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __70__SBDashBoardIdleTimerProvider_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allObjects");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "appendArraySection:withName:skipIfEmpty:", v3, CFSTR("DisabledAssertions"), 0);
  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), CFSTR("IdleTimer"));

}

- (id)_copyIdleTimerBehaviorForBehaviorProvider:(id)a3
{
  +[SBIdleTimerBehavior behaviorForBehaviorProvider:](SBIdleTimerBehavior, "behaviorForBehaviorProvider:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_proposeEffectiveIdleTimerBehaviorForReason:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBDashBoardIdleTimerProvider effectiveIdleTimerBehavior](self, "effectiveIdleTimerBehavior");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardIdleTimerProvider _proposeIdleTimerBehavior:forReason:](self, "_proposeIdleTimerBehavior:forReason:", v5, v4);

}

- (void)_proposeIdleTimerBehavior:(id)a3 forReason:(id)a4
{
  SBDashBoardIdleTimerProviderDelegate **p_delegate;
  id v7;
  id v8;
  id WeakRetained;
  id v10;

  p_delegate = &self->_delegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "dashBoardIdleTimerProvider:didProposeBehavior:reason:", self, v8, v7);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SBDashBoardIdleTimerProvider setIdleTimer:](self, "setIdleTimer:", v10);
}

- (SBDashBoardIdleTimerProviderDelegate)delegate
{
  return (SBDashBoardIdleTimerProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBIdleTimer)idleTimer
{
  return self->_idleTimer;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_disabledIdleTimerAssertions, 0);
  objc_storeStrong((id *)&self->_stateCaptureAssertion, 0);
  objc_storeStrong((id *)&self->_idleTimerProvider, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
}

@end
