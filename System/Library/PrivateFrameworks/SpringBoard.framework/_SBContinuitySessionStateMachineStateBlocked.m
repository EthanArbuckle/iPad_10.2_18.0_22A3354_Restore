@implementation _SBContinuitySessionStateMachineStateBlocked

- (_SBContinuitySessionStateMachineStateBlocked)initWithSystemEventMonitor:(id)a3
{
  id v5;
  _SBContinuitySessionStateMachineStateBlocked *v6;
  _SBContinuitySessionStateMachineStateBlocked *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBContinuitySessionStateMachineStateBlocked;
  v6 = -[_SBContinuitySessionStateMachineStateBlocked init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemEventMonitor, a3);
    -[SBContinuitySessionSystemEventMonitor addObserver:](v7->_systemEventMonitor, "addObserver:", v7);
  }

  return v7;
}

- (BOOL)isClientConnected
{
  return self->_clientConnected;
}

- (void)noteClientConnectedWithInitialExternallyBlockedReasons:(id)a3
{
  self->_clientConnected = 1;
  objc_storeStrong((id *)&self->_blockedReasons_client, a3);
  -[_SBContinuitySessionStateMachineStateBlocked _reevaluateStateForReason:](self, "_reevaluateStateForReason:", CFSTR("client connected"));
}

- (void)enteredStateFrom:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  self->_isCurrentState = 1;
  -[_SBContinuitySessionStateMachineStateBlocked _evaluateClientExternallyBlockedReasons](self, "_evaluateClientExternallyBlockedReasons");
  -[_SBContinuitySessionStateMachineStateBlocked _evaluateSystemEvents](self, "_evaluateSystemEvents");
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSBContinuitySessionState(a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("entered state from: %@"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBContinuitySessionStateMachineStateBlocked _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v6);

}

- (void)exitedStateTo:(unint64_t)a3
{
  self->_isCurrentState = 0;
}

- (void)noteClientDidUpdateExternallyBlockedReasons
{
  -[_SBContinuitySessionStateMachineStateBlocked _evaluateClientExternallyBlockedReasons](self, "_evaluateClientExternallyBlockedReasons");
  -[_SBContinuitySessionStateMachineStateBlocked _reevaluateStateForReason:](self, "_reevaluateStateForReason:", CFSTR("client updated externally blocked reasons"));
}

- (void)continuitySessionSystemEventMonitor:(id)a3 eventOccurred:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[_SBContinuitySessionStateMachineStateBlocked _evaluateSystemEvents](self, "_evaluateSystemEvents");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("system monitor event occurred: %@"), v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[_SBContinuitySessionStateMachineStateBlocked _reevaluateStateForReason:](self, "_reevaluateStateForReason:", v6);
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
  _SBContinuitySessionStateMachineStateBlocked *v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74___SBContinuitySessionStateMachineStateBlocked_appendDescriptionToStream___block_invoke;
  v7[3] = &unk_1E8E9E820;
  v8 = v4;
  v9 = self;
  v5 = v4;
  objc_msgSend(v5, "overlayStyle:block:", v6, v7);

}

- (void)_evaluateClientExternallyBlockedReasons
{
  id WeakRetained;
  NSSet *v5;
  NSSet *blockedReasons_client;
  void *v7;
  id v8;

  if (self->_isCurrentState)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
    v8 = WeakRetained;
    if (!WeakRetained)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachineStateBlocked.m"), 133, CFSTR("Must have _SBContinuitySessionStateMachineExternallyBlockedReasonsProvider"));

      WeakRetained = 0;
    }
    objc_msgSend(WeakRetained, "clientExternallyBlockedReasons");
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
    blockedReasons_client = self->_blockedReasons_client;
    self->_blockedReasons_client = v5;

  }
}

- (void)_evaluateSystemEvents
{
  if (self->_isCurrentState)
  {
    self->_uiLocked = -[SBContinuitySessionSystemEventMonitor isUILocked](self->_systemEventMonitor, "isUILocked");
    self->_uiBlocked = -[SBContinuitySessionSystemEventMonitor isUIBlocked](self->_systemEventMonitor, "isUIBlocked");
    self->_inCall = -[SBContinuitySessionSystemEventMonitor isInCall](self->_systemEventMonitor, "isInCall");
    self->_sosActive = -[SBContinuitySessionSystemEventMonitor isSOSActive](self->_systemEventMonitor, "isSOSActive");
    self->_lockScreenSearchPresented = -[SBContinuitySessionSystemEventMonitor isLockScreenSearchPresented](self->_systemEventMonitor, "isLockScreenSearchPresented");
    self->_usingSecureApp = -[SBContinuitySessionSystemEventMonitor isUsingSecureApp](self->_systemEventMonitor, "isUsingSecureApp");
    self->_isAirplayMirroring = -[SBContinuitySessionSystemEventMonitor isAirplayMirroring](self->_systemEventMonitor, "isAirplayMirroring");
    self->_isUserInitiatedRemoteTransientOverlayPresented = -[SBContinuitySessionSystemEventMonitor isUserInitiatedRemoteTransientOverlayPresented](self->_systemEventMonitor, "isUserInitiatedRemoteTransientOverlayPresented");
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
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[State.Blocked] Re-evaluating state for reason: %{public}@", (uint8_t *)&v13, 0xCu);
    }

    v6 = (void *)-[NSSet mutableCopy](self->_blockedReasons_client, "mutableCopy");
    v7 = v6;
    if (!self->_clientConnected)
      objc_msgSend(v6, "addObject:", CFSTR("block.session.client-connected"));
    if (self->_uiBlocked)
      objc_msgSend(v7, "addObject:", CFSTR("block.embedded-display.uiBlocked"));
    if (!self->_uiLocked)
      objc_msgSend(v7, "addObject:", CFSTR("block.embedded-display.uiUnlocked"));
    if (self->_inCall)
      objc_msgSend(v7, "addObject:", CFSTR("block.inCall"));
    if (self->_sosActive)
      objc_msgSend(v7, "addObject:", CFSTR("block.sos.active"));
    if (self->_lockScreenSearchPresented)
      objc_msgSend(v7, "addObject:", CFSTR("block.lockScreen.searchPresented"));
    if (self->_usingSecureApp)
      objc_msgSend(v7, "addObject:", CFSTR("block.embedded-display.secureAppUsage"));
    if (self->_isAirplayMirroring)
      objc_msgSend(v7, "addObject:", CFSTR("block.airplayMirroring"));
    if (self->_isUserInitiatedRemoteTransientOverlayPresented)
      objc_msgSend(v7, "addObject:", CFSTR("block.userInitiatedRemoteTransientOverlayPresented"));
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
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[State.Blocked] still blocked by %{public}@", (uint8_t *)&v13, 0xCu);

      }
      v12 = (void (*)(void))*((_QWORD *)self->_stateUpdateHandler + 2);
    }
    else
    {
      if (v10)
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[State.Blocked] --> moving to .preparing", (uint8_t *)&v13, 2u);
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
  objc_storeStrong((id *)&self->_blockedReasons_client, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end
