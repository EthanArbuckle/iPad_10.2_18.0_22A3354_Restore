@implementation _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock

- (_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7;
  id v8;
  _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *v9;
  _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock;
  v9 = -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemEventMonitor, a3);
    objc_msgSend(v7, "addObserver:", v10);
    objc_storeStrong((id *)&v10->_authenticationCoordinator, a4);
    -[SBContinuityDisplayAuthenticationCoordinator addObserver:](v10->_authenticationCoordinator, "addObserver:", v10);
  }

  return v10;
}

- (void)setAutomaticBiometricsDisabled:(BOOL)a3
{
  const __CFString *v4;
  id v5;

  if (self->_automaticBiometricsDisabled != a3)
  {
    self->_automaticBiometricsDisabled = a3;
    v4 = CFSTR("enabled");
    if (a3)
      v4 = CFSTR("disabled");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("automatic biometrics %@"), v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v5);

  }
}

- (void)enteredStateFrom:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_isCurrentState = 1;
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _evaluateClientExternallyBlockedReasons](self, "_evaluateClientExternallyBlockedReasons");
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _evaluateLockState](self, "_evaluateLockState");
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _evaluateSystemEvents](self, "_evaluateSystemEvents");
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSBContinuitySessionState(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("entered state from: %@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v6);

}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
}

- (void)continuityDisplayAuthenticationCoordinatorDidUpdateLockState:(id)a3
{
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _evaluateLockState](self, "_evaluateLockState", a3);
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock _reevaluateStateForReason:](self, "_reevaluateStateForReason:", CFSTR("lock state change"));
}

- (void)invalidate
{
  id stateTransitionHandler;
  id stateUpdateHandler;
  id invalidStateHandler;

  stateTransitionHandler = self->_stateTransitionHandler;
  self->_stateTransitionHandler = 0;

  stateUpdateHandler = self->_stateUpdateHandler;
  self->_stateUpdateHandler = 0;

  invalidStateHandler = self->_invalidStateHandler;
  self->_invalidStateHandler = 0;

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91___SBContinuitySessionStateMachineStatePreparingForRemoteUnlock_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v5 = v4;
  objc_msgSend(v5, "overlayStyle:block:", v6, v7);

}

- (void)_evaluateClientExternallyBlockedReasons
{
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock.m"), 116, CFSTR("Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"));

  }
  objc_msgSend(WeakRetained, "clientExternallyBlockedReasons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_isCurrentState && objc_msgSend(v5, "count"))
  {
    SBLogContinuitySession();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "bs_array");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    (*((void (**)(void))self->_stateTransitionHandler + 2))();
  }

}

- (void)_evaluateSystemEvents
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[16];

  if (self->_isCurrentState)
  {
    v3 = -[SBContinuitySessionSystemEventMonitor isUIBlocked](self->_systemEventMonitor, "isUIBlocked");
    v4 = -[SBContinuitySessionSystemEventMonitor isUILocked](self->_systemEventMonitor, "isUILocked");
    v5 = -[SBContinuitySessionSystemEventMonitor isInCall](self->_systemEventMonitor, "isInCall");
    v6 = -[SBContinuitySessionSystemEventMonitor isSOSActive](self->_systemEventMonitor, "isSOSActive");
    v7 = -[SBContinuitySessionSystemEventMonitor isLockScreenSearchPresented](self->_systemEventMonitor, "isLockScreenSearchPresented");
    v8 = -[SBContinuitySessionSystemEventMonitor isUsingSecureApp](self->_systemEventMonitor, "isUsingSecureApp");
    v9 = -[SBContinuitySessionSystemEventMonitor isAirplayMirroring](self->_systemEventMonitor, "isAirplayMirroring");
    v10 = -[SBContinuitySessionSystemEventMonitor isUserInitiatedRemoteTransientOverlayPresented](self->_systemEventMonitor, "isUserInitiatedRemoteTransientOverlayPresented");
    if (v3)
    {
      SBLogContinuitySession();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because UI blocked", v19, 2u);
      }

      if (v4)
      {
LABEL_4:
        if (!v5)
          goto LABEL_5;
        goto LABEL_17;
      }
    }
    else if (v4)
    {
      goto LABEL_4;
    }
    SBLogContinuitySession();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because UI unlocked", v19, 2u);
    }

    if (!v5)
    {
LABEL_5:
      if (!v6)
        goto LABEL_6;
      goto LABEL_20;
    }
LABEL_17:
    SBLogContinuitySession();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because in call", v19, 2u);
    }

    if (!v6)
    {
LABEL_6:
      if (!v7)
        goto LABEL_7;
      goto LABEL_23;
    }
LABEL_20:
    SBLogContinuitySession();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because sos active", v19, 2u);
    }

    if (!v7)
    {
LABEL_7:
      if (!v8)
        goto LABEL_8;
      goto LABEL_26;
    }
LABEL_23:
    SBLogContinuitySession();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because lock screen search presented", v19, 2u);
    }

    if (!v8)
    {
LABEL_8:
      if (!v9)
        goto LABEL_9;
      goto LABEL_29;
    }
LABEL_26:
    SBLogContinuitySession();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because using secure app", v19, 2u);
    }

    if (!v9)
    {
LABEL_9:
      if (!v10)
      {
LABEL_35:
        if (v3 || v5 || !v4 || v6 || v7 || v8 || v9 || v10)
          (*((void (**)(void))self->_stateTransitionHandler + 2))();
        return;
      }
LABEL_32:
      SBLogContinuitySession();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because user-initiated remote alert is presented", v19, 2u);
      }

      goto LABEL_35;
    }
LABEL_29:
    SBLogContinuitySession();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .blocked because AirPlay mirroring", v19, 2u);
    }

    if (!v10)
      goto LABEL_35;
    goto LABEL_32;
  }
}

- (void)_evaluateLockState
{
  unint64_t v3;
  NSObject *v4;
  void (**invalidStateHandler)(id, void *);
  void *v6;
  uint8_t v7[16];

  if (self->_isCurrentState)
  {
    v3 = -[SBContinuityDisplayAuthenticationCoordinator lockState](self->_authenticationCoordinator, "lockState");
    switch(v3)
    {
      case 2uLL:
        self->_keybagLocked = 0;
        break;
      case 1uLL:
        SBLogContinuitySession();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .invalid keybag has been unexpectedly remote unlocked", v7, 2u);
        }

        invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR(".preparing + remote unlocked"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        invalidStateHandler[2](invalidStateHandler, v6);

        break;
      case 0uLL:
        self->_keybagLocked = 1;
        break;
    }
  }
}

- (void)_reevaluateStateForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void (*v12)(void);
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_isCurrentState)
  {
    SBLogContinuitySession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138543362;
      v14 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] Re-evaluating state for reason: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!self->_keybagLocked)
      objc_msgSend(v6, "addObject:", CFSTR("checkpoint.waiting-for-keybag-locked"));
    if (!self->_automaticBiometricsDisabled)
      objc_msgSend(v7, "addObject:", CFSTR("checkpoint.waiting-for-automatic-biometrics-to-be-disabled"));
    v8 = objc_msgSend(v7, "count");
    SBLogContinuitySession();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        objc_msgSend(v7, "bs_array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543362;
        v14 = v11;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] still blocked by %{public}@", (uint8_t *)&v13, 0xCu);

      }
      v12 = (void (*)(void))*((_QWORD *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[State.PreparingForRemoteUnlock] --> moving to .ready", (uint8_t *)&v13, 2u);
      }

      v12 = (void (*)(void))*((_QWORD *)self->_stateTransitionHandler + 2);
    }
    v12();

  }
}

- (id)stateUpdateHandler
{
  return self->_stateUpdateHandler;
}

- (void)setStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (id)stateTransitionHandler
{
  return self->_stateTransitionHandler;
}

- (void)setStateTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)invalidStateHandler
{
  return self->_invalidStateHandler;
}

- (void)setInvalidStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider
{
  return (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider *)objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
}

- (void)setClientExternallyBlockedReasonsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_clientExternallyBlockedReasonsProvider, a3);
}

- (BOOL)isAutomaticBiomtericsDisabled
{
  return self->_automaticBiometricsDisabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clientExternallyBlockedReasonsProvider);
  objc_storeStrong(&self->_invalidStateHandler, 0);
  objc_storeStrong(&self->_stateTransitionHandler, 0);
  objc_storeStrong(&self->_stateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end
