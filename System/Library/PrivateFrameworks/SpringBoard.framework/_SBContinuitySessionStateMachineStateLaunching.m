@implementation _SBContinuitySessionStateMachineStateLaunching

- (_SBContinuitySessionStateMachineStateLaunching)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7;
  id v8;
  _SBContinuitySessionStateMachineStateLaunching *v9;
  _SBContinuitySessionStateMachineStateLaunching *v10;
  uint64_t v11;
  NSMutableArray *handlingLaunchEvents;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_SBContinuitySessionStateMachineStateLaunching;
  v9 = -[_SBContinuitySessionStateMachineStateLaunching init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemEventMonitor, a3);
    objc_msgSend(v7, "addObserver:", v10);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    handlingLaunchEvents = v10->_handlingLaunchEvents;
    v10->_handlingLaunchEvents = (NSMutableArray *)v11;

    objc_storeStrong((id *)&v10->_authenticationCoordinator, a4);
    -[SBContinuityDisplayAuthenticationCoordinator addObserver:](v10->_authenticationCoordinator, "addObserver:", v10);
  }

  return v10;
}

- (void)didReceiveLaunchEvent:(id)a3
{
  NSMutableArray *handlingLaunchEvents;
  id v5;
  id v6;

  handlingLaunchEvents = self->_handlingLaunchEvents;
  v5 = a3;
  -[NSMutableArray addObject:](handlingLaunchEvents, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("did receive launch event %@"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_SBContinuitySessionStateMachineStateLaunching _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v6);
}

- (void)didHandleLaunchEvent:(id)a3
{
  NSMutableArray *handlingLaunchEvents;
  id v5;
  id v6;

  handlingLaunchEvents = self->_handlingLaunchEvents;
  v5 = a3;
  -[NSMutableArray removeObject:](handlingLaunchEvents, "removeObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("did handle launch event %@"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_SBContinuitySessionStateMachineStateLaunching _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v6);
}

- (void)enteredStateFrom:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  id location;

  self->_isCurrentState = 1;
  self->_radar124642623 = -[NSMutableArray count](self->_handlingLaunchEvents, "count") == 0;
  -[_SBContinuitySessionStateMachineStateLaunching _evaluateClientExternallyBlockedReasons](self, "_evaluateClientExternallyBlockedReasons");
  -[_SBContinuitySessionStateMachineStateLaunching _evaluateLockState](self, "_evaluateLockState");
  -[_SBContinuitySessionStateMachineStateLaunching _evaluateSystemEvents](self, "_evaluateSystemEvents");
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSBContinuitySessionState(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("entered state from: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionStateMachineStateLaunching _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v7);

  if (self->_radar124642623)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67___SBContinuitySessionStateMachineStateLaunching_enteredStateFrom___block_invoke;
    block[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v9, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
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
  _SBContinuitySessionStateMachineStateLaunching *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76___SBContinuitySessionStateMachineStateLaunching_appendDescriptionToStream___block_invoke;
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStateLaunching.m"), 132, CFSTR("Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"));

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
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);

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
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because UI blocked", buf, 2u);
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
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because UI unlocked", buf, 2u);
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
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because in call", buf, 2u);
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
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because SOS active", buf, 2u);
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
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because lock screen search presented", buf, 2u);
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
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because airplay mirroring", buf, 2u);
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
    _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because using secure app", buf, 2u);
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
      _os_log_impl(&dword_1D0540000, v25, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid because user-initiated remote transient overlay is presented", buf, 2u);
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
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStateLaunching.m"), 202, CFSTR("Must have invalid reason"));

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
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid keybag has been unexpectedly unlocked", v10, 2u);
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
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .invalid keybag has been unexpectedly  locked", buf, 2u);
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
  NSMutableArray *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSMutableArray *handlingLaunchEvents;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  NSMutableArray *v13;
  void (*v14)(void);
  int v15;
  NSMutableArray *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableArray *)a3;
  if (self->_isCurrentState)
  {
    SBLogContinuitySession();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[State.Launching] Re-evaluating state for reason: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_radar124642623)
    {
      SBLogContinuitySession();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State.Launching] waiting on rdar://124642623", (uint8_t *)&v15, 2u);
      }

      objc_msgSend(v6, "addObject:", CFSTR("rdar://124642623"));
    }
    if (-[NSMutableArray count](self->_handlingLaunchEvents, "count"))
    {
      SBLogContinuitySession();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        handlingLaunchEvents = self->_handlingLaunchEvents;
        v15 = 138543362;
        v16 = handlingLaunchEvents;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[State.Launching] still waiting on launch events: %{public}@", (uint8_t *)&v15, 0xCu);
      }

      objc_msgSend(v6, "addObject:", CFSTR("checkpoint.handling-launch-event"));
    }
    v10 = objc_msgSend(v6, "count");
    SBLogContinuitySession();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v12)
      {
        objc_msgSend(v6, "bs_array");
        v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        v15 = 138543362;
        v16 = v13;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[State.Launching] still blocked by %{public}@", (uint8_t *)&v15, 0xCu);

      }
      v14 = (void (*)(void))*((_QWORD *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v12)
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[State.Launching] --> moving to .active", (uint8_t *)&v15, 2u);
      }

      v14 = (void (*)(void))*((_QWORD *)self->_stateTransitionHandler + 2);
    }
    v14();

  }
}

- (id)stateUpdateHandler
{
  return self->_stateUpdateHandler;
}

- (void)setStateUpdateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)stateTransitionHandler
{
  return self->_stateTransitionHandler;
}

- (void)setStateTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)invalidStateHandler
{
  return self->_invalidStateHandler;
}

- (void)setInvalidStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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
  objc_storeStrong((id *)&self->_handlingLaunchEvents, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end
