@implementation _SBContinuitySessionStateMachineStateActivating

- (_SBContinuitySessionStateMachineStateActivating)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7;
  id v8;
  _SBContinuitySessionStateMachineStateActivating *v9;
  _SBContinuitySessionStateMachineStateActivating *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStateActivating;
  v9 = -[_SBContinuitySessionStateMachineStateActivating init](&v12, sel_init);
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

- (void)noteUIIsReady
{
  self->_uiReady = 1;
  -[_SBContinuitySessionStateMachineStateActivating _reevaluateStateForReason:](self, "_reevaluateStateForReason:", CFSTR("ui ready"));
}

- (void)noteSystemApertureUIIsReady
{
  self->_systemApertureReady = 1;
  -[_SBContinuitySessionStateMachineStateActivating _reevaluateStateForReason:](self, "_reevaluateStateForReason:", CFSTR("system aperture ready"));
}

- (void)noteSystemApertureCurtainUIIsReady
{
  self->_systemApertureCurtainReady = 1;
  -[_SBContinuitySessionStateMachineStateActivating _reevaluateStateForReason:](self, "_reevaluateStateForReason:", CFSTR("system aperture curtain ready"));
}

- (void)enteredStateFrom:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_isCurrentState = 1;
  -[_SBContinuitySessionStateMachineStateActivating _evaluateClientExternallyBlockedReasons](self, "_evaluateClientExternallyBlockedReasons");
  -[_SBContinuitySessionStateMachineStateActivating _evaluateLockState](self, "_evaluateLockState");
  -[_SBContinuitySessionStateMachineStateActivating _evaluateSystemEvents](self, "_evaluateSystemEvents");
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSBContinuitySessionState(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("entered state from: %@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionStateMachineStateActivating _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v6);

}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
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
  _SBContinuitySessionStateMachineStateActivating *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __77___SBContinuitySessionStateMachineStateActivating_appendDescriptionToStream___block_invoke;
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStateActivating.m"), 122, CFSTR("Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"));

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
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    (*((void (**)(void))self->_invalidStateHandler + 2))();
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
  __CFString *v12;
  NSObject *v13;
  __CFString *v14;
  NSObject *v15;
  __CFString *v16;
  NSObject *v17;
  __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  __CFString *v24;
  NSObject *v25;
  __CFString *v26;
  void (**invalidStateHandler)(id, void *);
  void *v28;
  void *v29;
  _BOOL4 v31;
  uint8_t buf[16];

  if (!self->_isCurrentState)
    return;
  v3 = -[SBContinuitySessionSystemEventMonitor isUIBlocked](self->_systemEventMonitor, "isUIBlocked");
  v4 = -[SBContinuitySessionSystemEventMonitor isUILocked](self->_systemEventMonitor, "isUILocked");
  v5 = -[SBContinuitySessionSystemEventMonitor isInCall](self->_systemEventMonitor, "isInCall");
  v6 = -[SBContinuitySessionSystemEventMonitor isSOSActive](self->_systemEventMonitor, "isSOSActive");
  v7 = -[SBContinuitySessionSystemEventMonitor isLockScreenSearchPresented](self->_systemEventMonitor, "isLockScreenSearchPresented");
  v8 = -[SBContinuitySessionSystemEventMonitor isUsingSecureApp](self->_systemEventMonitor, "isUsingSecureApp");
  v9 = -[SBContinuitySessionSystemEventMonitor isAirplayMirroring](self->_systemEventMonitor, "isAirplayMirroring");
  v10 = -[SBContinuitySessionSystemEventMonitor isUserInitiatedRemoteTransientOverlayPresented](self->_systemEventMonitor, "isUserInitiatedRemoteTransientOverlayPresented");
  v31 = v3;
  if (!v3)
  {
    v12 = 0;
    if (v4)
      goto LABEL_11;
    goto LABEL_8;
  }
  SBLogContinuitySession();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because UI blocked", buf, 2u);
  }

  v12 = CFSTR("block.embedded-display.uiBlocked");
  if (!v4)
  {
LABEL_8:
    SBLogContinuitySession();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because UI unlocked", buf, 2u);
    }

    v14 = CFSTR("block.embedded-display.uiUnlocked");
    v12 = v14;
  }
LABEL_11:
  if (v5)
  {
    SBLogContinuitySession();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because in call", buf, 2u);
    }

    v16 = CFSTR("block.inCall");
    v12 = v16;
    if (!v6)
    {
LABEL_13:
      if (!v7)
        goto LABEL_14;
      goto LABEL_24;
    }
  }
  else if (!v6)
  {
    goto LABEL_13;
  }
  SBLogContinuitySession();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because SOS active", buf, 2u);
  }

  v18 = CFSTR("block.sos.active");
  v12 = v18;
  if (!v7)
  {
LABEL_14:
    if (!v8)
      goto LABEL_15;
    goto LABEL_27;
  }
LABEL_24:
  SBLogContinuitySession();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because lock screen search presented", buf, 2u);
  }

  v20 = CFSTR("block.lockScreen.searchPresented");
  v12 = v20;
  if (!v8)
  {
LABEL_15:
    if (!v9)
      goto LABEL_16;
LABEL_30:
    SBLogContinuitySession();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because airplay mirroring", buf, 2u);
    }

    v24 = CFSTR("block.airplayMirroring");
    v12 = v24;
    if (!v10)
      goto LABEL_36;
    goto LABEL_33;
  }
LABEL_27:
  SBLogContinuitySession();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because using secure app", buf, 2u);
  }

  v22 = CFSTR("block.embedded-display.secureAppUsage");
  v12 = v22;
  if (v9)
    goto LABEL_30;
LABEL_16:
  if (v10)
  {
LABEL_33:
    SBLogContinuitySession();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid because user-initiated remote transient overlay is presented", buf, 2u);
    }

    v26 = CFSTR("block.userInitiatedRemoteTransientOverlayPresented");
    v12 = v26;
  }
LABEL_36:
  if (v31 || v5 || !v4 || v6 || v7 || v8 || v9 || v10)
  {
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStateActivating.m"), 192, CFSTR("Must have invalid reason"));

    }
    invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    invalidStateHandler[2](invalidStateHandler, v28);

  }
}

- (void)_evaluateLockState
{
  unint64_t v3;
  NSObject *v4;
  void (**invalidStateHandler)(id, void *);
  void *v6;
  __CFString **v7;
  NSObject *v8;
  void *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (self->_isCurrentState)
  {
    v3 = -[SBContinuityDisplayAuthenticationCoordinator lockState](self->_authenticationCoordinator, "lockState");
    if (v3 == 2)
    {
      if (!self->_isCurrentState)
        return;
      SBLogContinuitySession();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid keybag has been unexpectedly unlocked", v10, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = SBContinuityBlockKeybagUnlocked;
      goto LABEL_12;
    }
    if (!v3 && self->_isCurrentState)
    {
      SBLogContinuitySession();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .invalid keybag has been unexpectedly  locked", buf, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v6 = (void *)MEMORY[0x1E0C99E60];
      v7 = SBContinuityBlockKeybagLocked;
LABEL_12:
      objc_msgSend(v6, "setWithObject:", *v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      invalidStateHandler[2](invalidStateHandler, v9);

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
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void (*v13)(void);
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_isCurrentState)
    goto LABEL_24;
  SBLogContinuitySession();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543362;
    v15 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[State.Activating] Re-evaluating state for reason: %{public}@", (uint8_t *)&v14, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!self->_uiReady)
    objc_msgSend(v6, "addObject:", CFSTR("checkpoint.waiting-for-ui-ready"));
  v8 = SBFEffectiveArtworkSubtype();
  if (v8 > 2795)
  {
    if (v8 != 2868 && v8 != 2796)
      goto LABEL_16;
LABEL_12:
    if (!self->_systemApertureReady)
      objc_msgSend(v7, "addObject:", CFSTR("checkpoint.waiting-for-system-aperture-ui-ready"));
    if (!self->_systemApertureCurtainReady)
      objc_msgSend(v7, "addObject:", CFSTR("checkpoint.waiting-for-system-aperture-curtain-ui-ready"));
    goto LABEL_16;
  }
  if (v8 == 2556 || v8 == 2622)
    goto LABEL_12;
LABEL_16:
  v9 = objc_msgSend(v7, "count");
  SBLogContinuitySession();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      objc_msgSend(v7, "bs_array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[State.Activating] still blocked by %{public}@", (uint8_t *)&v14, 0xCu);

    }
    v13 = (void (*)(void))*((_QWORD *)self->_stateUpdateHandler + 2);
  }
  else
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[State.Activating] --> moving to .updatingActiveDisplay", (uint8_t *)&v14, 2u);
    }

    v13 = (void (*)(void))*((_QWORD *)self->_stateTransitionHandler + 2);
  }
  v13();

LABEL_24:
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
