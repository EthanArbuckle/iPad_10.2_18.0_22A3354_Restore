@implementation _SBContinuitySessionStateMachine

- (_SBContinuitySessionStateMachine)initWithSystemEventMonitor:(id)a3 continuityDisplayAuthenticationCoordinator:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v26;
  _SBContinuitySessionStateMachine *v28;
  id v29;
  id v30;
  _SBContinuitySessionStateMachineStateBlocked *v31;
  _QWORD v32[4];
  id v33;
  id v34;

  v5 = a3;
  v6 = a4;
  v31 = -[_SBContinuitySessionStateMachineStateBlocked initWithSystemEventMonitor:]([_SBContinuitySessionStateMachineStateBlocked alloc], "initWithSystemEventMonitor:", v5);
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __106___SBContinuitySessionStateMachine_initWithSystemEventMonitor_continuityDisplayAuthenticationCoordinator___block_invoke;
  v32[3] = &unk_1E8EC09F8;
  v33 = v5;
  v34 = v6;
  v30 = v6;
  v29 = v5;
  v7 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v32);
  v8 = objc_opt_class();
  v7[2](v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_class();
  v7[2](v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_opt_class();
  v7[2](v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_opt_class();
  v7[2](v7, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  v7[2](v7, v16);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_opt_class();
  v7[2](v7, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_opt_class();
  v7[2](v7, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_opt_class();
  v7[2](v7, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_opt_class();
  v7[2](v7, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[_SBContinuitySessionStateMachine initWithBlockedState:preparingForRemoteUnlockState:waitingForRemoteUnlockState:waitingForScenesState:waitingForHIDServicesState:activatingState:updatingActiveDisplayState:launchingState:flushingState:activeState:](self, "initWithBlockedState:preparingForRemoteUnlockState:waitingForRemoteUnlockState:waitingForScenesState:waitingForHIDServicesState:activatingState:updatingActiveDisplayState:launchingState:flushingState:activeState:", v31, v9, v11, v13, v15, v26, v18, v20, v22, v24);

  return v28;
}

- (_SBContinuitySessionStateMachine)initWithBlockedState:(id)a3 preparingForRemoteUnlockState:(id)a4 waitingForRemoteUnlockState:(id)a5 waitingForScenesState:(id)a6 waitingForHIDServicesState:(id)a7 activatingState:(id)a8 updatingActiveDisplayState:(id)a9 launchingState:(id)a10 flushingState:(id)a11 activeState:(id)a12
{
  id v18;
  id v19;
  id v20;
  _SBContinuitySessionStateMachine *v21;
  _SBContinuitySessionStateMachine *v22;
  NSSet *v23;
  NSSet *internalReasons;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v27 = a6;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v28 = a9;
  v18 = a10;
  v19 = a11;
  v20 = a12;
  v35.receiver = self;
  v35.super_class = (Class)_SBContinuitySessionStateMachine;
  v21 = -[_SBContinuitySessionStateMachine init](&v35, sel_init);
  v22 = v21;
  if (v21)
  {
    v21->_internalState = 0;
    v21->_observerState = 0;
    v23 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    internalReasons = v22->_internalReasons;
    v22->_internalReasons = v23;

    objc_storeStrong((id *)&v22->_observerReasons, v22->_internalReasons);
    objc_storeStrong((id *)&v22->_blockedState, a3);
    objc_storeStrong((id *)&v22->_preparingForRemoteUnlockState, a4);
    objc_storeStrong((id *)&v22->_waitingForRemoteUnlockState, a5);
    objc_storeStrong((id *)&v22->_waitingForScenesState, v27);
    objc_storeStrong((id *)&v22->_waitingForHIDServicesState, a7);
    objc_storeStrong((id *)&v22->_activatingState, a8);
    objc_storeStrong((id *)&v22->_updatingActiveDisplayState, a9);
    objc_storeStrong((id *)&v22->_launchingState, a10);
    objc_storeStrong((id *)&v22->_flushingState, a11);
    objc_storeStrong((id *)&v22->_activeState, a12);
    -[_SBContinuitySessionStateMachine _initializeStates](v22, "_initializeStates");
    -[_SBContinuitySessionStateMachine _moveToState:](v22, "_moveToState:", 1);
  }

  return v22;
}

- (unint64_t)state
{
  return self->_observerState;
}

- (NSSet)reasons
{
  return self->_observerReasons;
}

- (void)setAutomaticBiometricsDisabled:(BOOL)a3
{
  -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock setAutomaticBiometricsDisabled:](self->_preparingForRemoteUnlockState, "setAutomaticBiometricsDisabled:", a3);
}

- (BOOL)isAutomaticBiometricsDisabled
{
  return -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock isAutomaticBiomtericsDisabled](self->_preparingForRemoteUnlockState, "isAutomaticBiomtericsDisabled");
}

- (void)noteClientConnectedWithInitialExternallyBlockedReasons:(id)a3
{
  -[_SBContinuitySessionStateMachineStateBlocked noteClientConnectedWithInitialExternallyBlockedReasons:](self->_blockedState, "noteClientConnectedWithInitialExternallyBlockedReasons:", a3);
}

- (void)noteClientDidUpdateExternallyBlockedReasons
{
  id v2;

  -[_SBContinuitySessionStateMachine _stateMachineStateForState:](self, "_stateMachineStateForState:", self->_internalState);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteClientDidUpdateExternallyBlockedReasons");

}

- (void)noteClientConfiguredHIDServices
{
  -[_SBContinuitySessionStateMachineStateWaitingForHIDServices noteClientConfiguredHIDServices](self->_waitingForHIDServicesState, "noteClientConfiguredHIDServices");
}

- (void)noteMainSceneConnected
{
  -[_SBContinuitySessionStateMachineStateWaitingForScenes noteMainSceneConnected](self->_waitingForScenesState, "noteMainSceneConnected");
}

- (void)noteSceneHasValidDisplayUUID
{
  -[_SBContinuitySessionStateMachineStateWaitingForScenes noteSceneHasValidDisplayUUID](self->_waitingForScenesState, "noteSceneHasValidDisplayUUID");
}

- (void)noteUIIsReady
{
  -[_SBContinuitySessionStateMachineStateActivating noteUIIsReady](self->_activatingState, "noteUIIsReady");
}

- (void)noteSystemApertureSceneConnected
{
  -[_SBContinuitySessionStateMachineStateWaitingForScenes noteSystemApertureSceneConnected](self->_waitingForScenesState, "noteSystemApertureSceneConnected");
}

- (void)noteSystemApertureUIIsReady
{
  -[_SBContinuitySessionStateMachineStateActivating noteSystemApertureUIIsReady](self->_activatingState, "noteSystemApertureUIIsReady");
}

- (void)noteSystemApertureCurtainSceneConnected
{
  -[_SBContinuitySessionStateMachineStateWaitingForScenes noteSystemApertureCurtainSceneConnected](self->_waitingForScenesState, "noteSystemApertureCurtainSceneConnected");
}

- (void)noteSystemApertureCurtainUIIsReady
{
  -[_SBContinuitySessionStateMachineStateActivating noteSystemApertureCurtainUIIsReady](self->_activatingState, "noteSystemApertureCurtainUIIsReady");
}

- (void)noteActiveDisplayUpdated
{
  -[_SBContinuitySessionStateMachineStateUpdatingActiveDisplay noteActiveDisplayUpdated](self->_updatingActiveDisplayState, "noteActiveDisplayUpdated");
}

- (void)noteUIFlushed
{
  -[_SBContinuitySessionStateMachineStateFlushing noteUIFlushed](self->_flushingState, "noteUIFlushed");
}

- (void)invalidateForReasons:(id)a3
{
  id v4;
  NSObject *v5;
  _SBContinuitySessionStateMachineStateBlocked *blockedState;
  _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *preparingForRemoteUnlockState;
  _SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *waitingForRemoteUnlockState;
  _SBContinuitySessionStateMachineStateWaitingForScenes *waitingForScenesState;
  _SBContinuitySessionStateMachineStateWaitingForHIDServices *waitingForHIDServicesState;
  _SBContinuitySessionStateMachineStateActivating *activatingState;
  _SBContinuitySessionStateMachineStateUpdatingActiveDisplay *updatingActiveDisplayState;
  _SBContinuitySessionStateMachineStateLaunching *launchingState;
  _SBContinuitySessionStateMachineStateFlushing *flushingState;
  _SBContinuitySessionStateMachineStateActive *activeState;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    SBLogContinuityDisplay();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543362;
      v17 = v4;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[State Machine] invalidated for reasons: %{public}@", (uint8_t *)&v16, 0xCu);
    }

    -[_SBContinuitySessionStateMachine _moveToInvalidStateForReasons:postToDelegate:](self, "_moveToInvalidStateForReasons:postToDelegate:", v4, 0);
    -[_SBContinuitySessionStateMachineStateBlocked invalidate](self->_blockedState, "invalidate");
    blockedState = self->_blockedState;
    self->_blockedState = 0;

    -[_SBContinuitySessionStateMachineStatePreparingForRemoteUnlock invalidate](self->_preparingForRemoteUnlockState, "invalidate");
    preparingForRemoteUnlockState = self->_preparingForRemoteUnlockState;
    self->_preparingForRemoteUnlockState = 0;

    -[_SBContinuitySessionStateMachineStateWaitingForRemoteUnlock invalidate](self->_waitingForRemoteUnlockState, "invalidate");
    waitingForRemoteUnlockState = self->_waitingForRemoteUnlockState;
    self->_waitingForRemoteUnlockState = 0;

    -[_SBContinuitySessionStateMachineStateWaitingForScenes invalidate](self->_waitingForScenesState, "invalidate");
    waitingForScenesState = self->_waitingForScenesState;
    self->_waitingForScenesState = 0;

    -[_SBContinuitySessionStateMachineStateWaitingForHIDServices invalidate](self->_waitingForHIDServicesState, "invalidate");
    waitingForHIDServicesState = self->_waitingForHIDServicesState;
    self->_waitingForHIDServicesState = 0;

    -[_SBContinuitySessionStateMachineStateActivating invalidate](self->_activatingState, "invalidate");
    activatingState = self->_activatingState;
    self->_activatingState = 0;

    -[_SBContinuitySessionStateMachineStateUpdatingActiveDisplay invalidate](self->_updatingActiveDisplayState, "invalidate");
    updatingActiveDisplayState = self->_updatingActiveDisplayState;
    self->_updatingActiveDisplayState = 0;

    -[_SBContinuitySessionStateMachineStateLaunching invalidate](self->_launchingState, "invalidate");
    launchingState = self->_launchingState;
    self->_launchingState = 0;

    -[_SBContinuitySessionStateMachineStateFlushing invalidate](self->_flushingState, "invalidate");
    flushingState = self->_flushingState;
    self->_flushingState = 0;

    -[_SBContinuitySessionStateMachineStateActive invalidate](self->_activeState, "invalidate");
    activeState = self->_activeState;
    self->_activeState = 0;

  }
}

- (void)didReceiveLaunchEvent:(id)a3
{
  -[_SBContinuitySessionStateMachineStateLaunching didReceiveLaunchEvent:](self->_launchingState, "didReceiveLaunchEvent:", a3);
}

- (void)didHandleLaunchEvent:(id)a3
{
  -[_SBContinuitySessionStateMachineStateLaunching didHandleLaunchEvent:](self->_launchingState, "didHandleLaunchEvent:", a3);
}

- (void)_initializeStates
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17[2];
  _QWORD v18[5];
  id v19[2];
  _QWORD v20[5];
  id v21[2];
  id location;

  objc_initWeak(&location, self);
  v4 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke;
  v20[3] = &unk_1E8EC0A48;
  objc_copyWeak(v21, &location);
  v21[1] = (id)a2;
  v20[4] = self;
  v5 = (void *)MEMORY[0x1D17E5550](v20);
  v18[0] = v4;
  v18[1] = 3221225472;
  v18[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_3;
  v18[3] = &unk_1E8EC0A98;
  objc_copyWeak(v19, &location);
  v19[1] = (id)a2;
  v18[4] = self;
  v6 = (void *)MEMORY[0x1D17E5550](v18);
  v16[0] = v4;
  v16[1] = 3221225472;
  v16[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_5;
  v16[3] = &unk_1E8EC0A48;
  objc_copyWeak(v17, &location);
  v17[1] = (id)a2;
  v16[4] = self;
  v7 = (void *)MEMORY[0x1D17E5550](v16);
  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __53___SBContinuitySessionStateMachine__initializeStates__block_invoke_7;
  v12[3] = &unk_1E8EC0AC0;
  v8 = v6;
  v13 = v8;
  v9 = v5;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v12[4] = self;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v12);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateBlocked *, uint64_t))v11)[2](v11, self->_blockedState, 1);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStatePreparingForRemoteUnlock *, uint64_t))v11)[2](v11, self->_preparingForRemoteUnlockState, 2);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateWaitingForRemoteUnlock *, uint64_t))v11)[2](v11, self->_waitingForRemoteUnlockState, 3);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateWaitingForScenes *, uint64_t))v11)[2](v11, self->_waitingForScenesState, 4);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateWaitingForHIDServices *, uint64_t))v11)[2](v11, self->_waitingForHIDServicesState, 5);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateActivating *, uint64_t))v11)[2](v11, self->_activatingState, 6);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateUpdatingActiveDisplay *, uint64_t))v11)[2](v11, self->_updatingActiveDisplayState, 7);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateLaunching *, uint64_t))v11)[2](v11, self->_launchingState, 8);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateFlushing *, uint64_t))v11)[2](v11, self->_flushingState, 9);
  ((void (**)(_QWORD, _SBContinuitySessionStateMachineStateActive *, uint64_t))v11)[2](v11, self->_activeState, 10);

  objc_destroyWeak(v17);
  objc_destroyWeak(v19);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

- (id)_stateMachineStateForState:(unint64_t)a3
{
  if (a3 - 1 > 9)
    return 0;
  else
    return *((id *)&self->_authenticationCoordinator + a3);
}

- (void)_moveToInvalidStateForReasons:(id)a3 postToDelegate:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  unint64_t internalState;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unint64_t observerState;
  unint64_t v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  internalState = self->_internalState;
  SBLogContinuityDisplay();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (internalState == 11)
  {
    if (v10)
    {
      objc_msgSend(v7, "bs_array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v11;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[State Machine] ignoring call to move to invalid for reasons %{public}@ because we are already in .invalid", (uint8_t *)&v19, 0xCu);

    }
  }
  else
  {
    if (v10)
    {
      NSStringFromSBContinuitySessionState(self->_internalState);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "bs_array");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v12;
      v21 = 2114;
      v22 = v13;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[State Machine] %{public}@ -> INVALID reasons: %{public}@", (uint8_t *)&v19, 0x16u);

    }
    SBLogContinuitySession();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v14))
    {
      NSStringFromSBContinuitySessionState(11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543362;
      v20 = v15;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_STATE_MACHINE_STATE_UPDATE", "%{public}@", (uint8_t *)&v19, 0xCu);

    }
    observerState = self->_observerState;
    v17 = self->_internalState;
    self->_internalState = 11;
    objc_storeStrong((id *)&self->_internalReasons, a3);
    -[_SBContinuitySessionStateMachine _stateMachineStateForState:](self, "_stateMachineStateForState:", v17);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject exitedStateTo:](v9, "exitedStateTo:", 11);
    if (self->_observerState != 11)
    {
      self->_observerState = 11;
      objc_storeStrong((id *)&self->_observerReasons, a3);
      if (v4)
      {
        -[_SBContinuitySessionStateMachine delegate](self, "delegate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "continuitySessionStateMachineDidUpdateState:oldState:", self, observerState);

      }
    }
  }

}

- (void)_updateCurrentStateReasons:(id)a3
{
  id v5;
  unint64_t internalState;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15[2];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  internalState = self->_internalState;
  SBLogContinuityDisplay();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (internalState == 11)
  {
    if (v8)
    {
      objc_msgSend(v5, "bs_array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v9;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State Machine] ignoring call update reasons %{public}@ because we are already in .invalid", buf, 0xCu);

    }
  }
  else
  {
    if (v8)
    {
      NSStringFromSBContinuitySessionState(self->_internalState);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bs_array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v17 = v10;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "[State Machine] %{public}@ updated reasons: %{public}@", buf, 0x16u);

    }
    v12 = (void *)self->_internalState;
    objc_storeStrong((id *)&self->_internalReasons, a3);
    if (!self->_suppressReasonUpdateCallout)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63___SBContinuitySessionStateMachine__updateCurrentStateReasons___block_invoke;
      block[3] = &unk_1E8EA0CE8;
      objc_copyWeak(v15, (id *)buf);
      v14 = v5;
      v15[1] = v12;
      dispatch_async(MEMORY[0x1E0C80D38], block);

      objc_destroyWeak(v15);
      objc_destroyWeak((id *)buf);
    }
  }

}

- (void)_moveToState:(unint64_t)a3
{
  unint64_t internalState;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  NSSet *internalReasons;
  void *v16;
  void *v17;
  id v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23[3];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionStateMachine.m"), 386, CFSTR("must call _moveToInvalidStateForReasons:"));

  }
  internalState = self->_internalState;
  SBLogContinuityDisplay();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (internalState == 11)
  {
    if (v7)
    {
      NSStringFromSBContinuitySessionState(a3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v8;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[State Machine] ignoring call to move to %{public}@ because we are already in .invalid", buf, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      NSStringFromSBContinuitySessionState(self->_internalState);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBContinuitySessionState(a3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v25 = v9;
      v26 = 2114;
      v27 = v10;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "[State Machine] %{public}@ -> %{public}@", buf, 0x16u);

    }
    SBLogContinuitySession();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v11))
    {
      NSStringFromSBContinuitySessionState(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v12;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_STATE_MACHINE_STATE_UPDATE", "%{public}@", buf, 0xCu);

    }
    v13 = (void *)self->_internalState;
    self->_internalState = a3;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
    internalReasons = self->_internalReasons;
    self->_internalReasons = v14;

    self->_suppressReasonUpdateCallout = 1;
    -[_SBContinuitySessionStateMachine _stateMachineStateForState:](self, "_stateMachineStateForState:", v13);
    v6 = objc_claimAutoreleasedReturnValue();
    -[_SBContinuitySessionStateMachine _stateMachineStateForState:](self, "_stateMachineStateForState:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject exitedStateTo:](v6, "exitedStateTo:", a3);
    objc_msgSend(v16, "enteredStateFrom:", v13);
    self->_suppressReasonUpdateCallout = 0;
    v17 = (void *)-[NSSet copy](self->_internalReasons, "copy");
    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __49___SBContinuitySessionStateMachine__moveToState___block_invoke;
    v21[3] = &unk_1E8EC0AE8;
    objc_copyWeak(v23, (id *)buf);
    v23[1] = (id)a3;
    v23[2] = v13;
    v22 = v17;
    v18 = v17;
    dispatch_async(MEMORY[0x1E0C80D38], v21);

    objc_destroyWeak(v23);
    objc_destroyWeak((id *)buf);

  }
}

- (id)clientExternallyBlockedReasons
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_SBContinuitySessionStateMachine clientExternallyBlockedReasonsProvider](self, "clientExternallyBlockedReasonsProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientExternallyBlockedReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("stateMachine.missingClientExternallyBlockedReasonsProvider"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _SBContinuitySessionStateMachine *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _SBContinuitySessionStateMachine *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _SBContinuitySessionStateMachine *v24;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke;
  v22[3] = &unk_1E8E9E820;
  v7 = v4;
  v23 = v7;
  v24 = self;
  objc_msgSend(v7, "appendProem:block:", self, v22);
  v18[0] = v6;
  v18[1] = 3221225472;
  v18[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_2;
  v18[3] = &unk_1E8E9E270;
  v8 = v7;
  v19 = v8;
  v20 = self;
  v9 = v5;
  v21 = v9;
  objc_msgSend(v8, "appendBodySectionWithName:block:", CFSTR("observerState"), v18);
  v14[0] = v6;
  v14[1] = 3221225472;
  v14[2] = __62___SBContinuitySessionStateMachine_appendDescriptionToStream___block_invoke_4;
  v14[3] = &unk_1E8E9E270;
  v13 = v8;
  v15 = v13;
  v16 = self;
  v17 = v9;
  v10 = v9;
  objc_msgSend(v13, "appendBodySectionWithName:block:", CFSTR("internalState"), v14);
  if ((objc_msgSend(v13, "hasSuccinctStyle") & 1) == 0)
  {
    -[_SBContinuitySessionStateMachine _stateMachineStateForState:](self, "_stateMachineStateForState:", self->_internalState);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v13, "appendObject:withName:", v11, CFSTR("currentState"));

  }
}

- (_SBContinuitySessionStateMachineDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (_SBContinuitySessionStateMachineDelegate *)a3;
}

- (BOOL)isAutomaticBiomtericsDisabled
{
  return self->_automaticBiometricsDisabled;
}

- (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider)clientExternallyBlockedReasonsProvider
{
  return (_SBContinuitySessionStateMachineClientExternallyBlockedReasonsProvider *)objc_loadWeakRetained((id *)&self->_clientExternallyBlockedReasonsProvider);
}

- (void)setClientExternallyBlockedReasonsProvider:(id)a3
{
  objc_storeWeak((id *)&self->_clientExternallyBlockedReasonsProvider, a3);
}

- (_SBContinuitySessionServiceClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_clientExternallyBlockedReasonsProvider);
  objc_storeStrong((id *)&self->_observerReasons, 0);
  objc_storeStrong((id *)&self->_internalReasons, 0);
  objc_storeStrong((id *)&self->_activeState, 0);
  objc_storeStrong((id *)&self->_flushingState, 0);
  objc_storeStrong((id *)&self->_launchingState, 0);
  objc_storeStrong((id *)&self->_updatingActiveDisplayState, 0);
  objc_storeStrong((id *)&self->_activatingState, 0);
  objc_storeStrong((id *)&self->_waitingForHIDServicesState, 0);
  objc_storeStrong((id *)&self->_waitingForScenesState, 0);
  objc_storeStrong((id *)&self->_waitingForRemoteUnlockState, 0);
  objc_storeStrong((id *)&self->_preparingForRemoteUnlockState, 0);
  objc_storeStrong((id *)&self->_blockedState, 0);
  objc_storeStrong((id *)&self->_authenticationCoordinator, 0);
  objc_storeStrong((id *)&self->_systemEventMonitor, 0);
}

@end
