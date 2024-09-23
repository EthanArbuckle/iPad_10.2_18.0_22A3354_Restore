@implementation _SBContinuitySessionStateMachineStateActive

- (_SBContinuitySessionStateMachineStateActive)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v7;
  id v8;
  _SBContinuitySessionStateMachineStateActive *v9;
  _SBContinuitySessionStateMachineStateActive *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_SBContinuitySessionStateMachineStateActive;
  v9 = -[_SBContinuitySessionStateMachineStateActive init](&v12, sel_init);
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

- (void)enteredStateFrom:(unint64_t)a3
{
  self->_isCurrentState = 1;
  -[_SBContinuitySessionStateMachineStateActive _evaluateClientExternallyBlockedReasons](self, "_evaluateClientExternallyBlockedReasons", a3);
  -[_SBContinuitySessionStateMachineStateActive _evaluateLockState](self, "_evaluateLockState");
  -[_SBContinuitySessionStateMachineStateActive _evaluateSystemEvents](self, "_evaluateSystemEvents");
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
  _SBContinuitySessionStateMachineStateActive *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73___SBContinuitySessionStateMachineStateActive_appendDescriptionToStream___block_invoke;
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStateActive.m"), 98, CFSTR("Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"));

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
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because client blocked reasons are unexpected: %{public}@", (uint8_t *)&v10, 0xCu);

    }
    (*((void (**)(void))self->_invalidStateHandler + 2))();
  }

}

- (void)_evaluateSystemEvents
{
  NSObject *v3;
  void (**invalidStateHandler)(id, void *);
  void *v5;
  __CFString **v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];

  if (self->_isCurrentState)
  {
    if (-[SBContinuitySessionSystemEventMonitor isUIBlocked](self->_systemEventMonitor, "isUIBlocked"))
    {
      SBLogContinuitySession();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because UI blocked", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockUIBlocked;
LABEL_14:
      objc_msgSend(v5, "setWithObject:", *v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      invalidStateHandler[2](invalidStateHandler, v9);

      return;
    }
    if (!-[SBContinuitySessionSystemEventMonitor isUILocked](self->_systemEventMonitor, "isUILocked"))
    {
      SBLogContinuitySession();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because UI unlocked", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockUIUnlocked;
      goto LABEL_14;
    }
    if (-[SBContinuitySessionSystemEventMonitor isInCall](self->_systemEventMonitor, "isInCall"))
    {
      SBLogContinuitySession();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because in call", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockInCall;
      goto LABEL_14;
    }
    if (-[SBContinuitySessionSystemEventMonitor isSOSActive](self->_systemEventMonitor, "isSOSActive"))
    {
      SBLogContinuitySession();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because SOS active", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockSOSActive;
      goto LABEL_14;
    }
    if (-[SBContinuitySessionSystemEventMonitor isLockScreenSearchPresented](self->_systemEventMonitor, "isLockScreenSearchPresented"))
    {
      SBLogContinuitySession();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because lock screen search presented", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockLockScreenSearchPresented;
      goto LABEL_14;
    }
    if (-[SBContinuitySessionSystemEventMonitor isUsingSecureApp](self->_systemEventMonitor, "isUsingSecureApp"))
    {
      SBLogContinuitySession();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because using secure app", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockSecureAppUsage;
      goto LABEL_14;
    }
    if (-[SBContinuitySessionSystemEventMonitor isAirplayMirroring](self->_systemEventMonitor, "isAirplayMirroring"))
    {
      SBLogContinuitySession();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because airplay mirroring", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockAirplayMirroring;
      goto LABEL_14;
    }
    if (-[SBContinuitySessionSystemEventMonitor isUserInitiatedRemoteTransientOverlayPresented](self->_systemEventMonitor, "isUserInitiatedRemoteTransientOverlayPresented"))
    {
      SBLogContinuitySession();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid because user-initiated remote transient overlay is presented", v15, 2u);
      }

      invalidStateHandler = (void (**)(id, void *))self->_invalidStateHandler;
      v5 = (void *)MEMORY[0x1E0C99E60];
      v6 = SBContinuityBlockUserInitiatedRemoteTransientOverlayPresented;
      goto LABEL_14;
    }
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
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid keybag has been unexpectedly unlocked", v10, 2u);
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
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "[State.Active] --> moving to .invalid keybag has been unexpectedly locked", buf, 2u);
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
