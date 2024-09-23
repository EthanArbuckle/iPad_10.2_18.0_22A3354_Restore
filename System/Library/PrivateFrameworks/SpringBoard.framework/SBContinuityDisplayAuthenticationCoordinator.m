@implementation SBContinuityDisplayAuthenticationCoordinator

+ (SBContinuityDisplayAuthenticationCoordinator)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1)
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_36);
  return (SBContinuityDisplayAuthenticationCoordinator *)(id)sharedInstance___sharedInstance_0;
}

void __62__SBContinuityDisplayAuthenticationCoordinator_sharedInstance__block_invoke()
{
  SBContinuityDisplayAuthenticationCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(SBContinuityDisplayAuthenticationCoordinator);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (SBContinuityDisplayAuthenticationCoordinator)init
{
  void *v3;
  void *v4;
  SBContinuityDisplayAuthenticationCoordinator *v5;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBContinuityDisplayAuthenticationCoordinator initWithLockScreenManager:mobileKeyBag:](self, "initWithLockScreenManager:mobileKeyBag:", v3, v4);

  return v5;
}

- (SBContinuityDisplayAuthenticationCoordinator)initWithLockScreenManager:(id)a3 mobileKeyBag:(id)a4
{
  id v7;
  id v8;
  SBContinuityDisplayAuthenticationCoordinator *v9;
  uint64_t v10;
  NSHashTable *observers;
  void *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  BSCompoundAssertion *continuityDisplaySessionAssertions;
  BSCompoundAssertion *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id location;
  objc_super v26;

  v7 = a3;
  v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)SBContinuityDisplayAuthenticationCoordinator;
  v9 = -[SBContinuityDisplayAuthenticationCoordinator init](&v26, sel_init);
  if (v9)
  {
    objc_initWeak(&location, v9);
    objc_storeStrong((id *)&v9->_mobileKeyBag, a4);
    -[SBFMobileKeyBag addObserver:](v9->_mobileKeyBag, "addObserver:", v9);
    objc_storeStrong((id *)&v9->_lockScreenManager, a3);
    v9->_invalidated = 0;
    v9->_sessionActive = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    observers = v9->_observers;
    v9->_observers = (NSHashTable *)v10;

    v9->_previousLockState = -[SBContinuityDisplayAuthenticationCoordinator lockState](v9, "lockState");
    v12 = (void *)MEMORY[0x1E0D01718];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __87__SBContinuityDisplayAuthenticationCoordinator_initWithLockScreenManager_mobileKeyBag___block_invoke;
    v23 = &unk_1E8EA3688;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v12, "assertionWithIdentifier:stateDidChangeHandler:", v14, &v20);
    v15 = objc_claimAutoreleasedReturnValue();
    continuityDisplaySessionAssertions = v9->_continuityDisplaySessionAssertions;
    v9->_continuityDisplaySessionAssertions = (BSCompoundAssertion *)v15;

    v17 = v9->_continuityDisplaySessionAssertions;
    SBLogContinuityDisplay();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v17, "setLog:", v18, v20, v21, v22, v23);

    -[SBContinuityDisplayAuthenticationCoordinator setHeartbeatInterval:](v9, "setHeartbeatInterval:", 30.0);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __87__SBContinuityDisplayAuthenticationCoordinator_initWithLockScreenManager_mobileKeyBag___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSessionState");

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayAuthenticationCoordinator.m"), 72, CFSTR("Must be invalidated before -dealloc"));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBContinuityDisplayAuthenticationCoordinator;
  -[SBContinuityDisplayAuthenticationCoordinator dealloc](&v5, sel_dealloc);
}

- (id)acquireContinuityDisplayActiveAssertionForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_continuityDisplaySessionAssertions, "acquireForReason:", a3);
}

- (unint64_t)lockState
{
  int v3;
  void *v4;
  int v5;
  unint64_t v6;

  v3 = -[SBFMobileKeyBag isContinuityUnlocked](self->_mobileKeyBag, "isContinuityUnlocked");
  -[SBFMobileKeyBag extendedState](self->_mobileKeyBag, "extendedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEffectivelyLocked");

  v6 = 2;
  if (v5)
    v6 = 0;
  if (v3)
    return 1;
  else
    return v6;
}

- (void)addObserver:(id)a3
{
  id v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  void *v9;
  id v10;

  v5 = a3;
  v10 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayAuthenticationCoordinator.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_observers;
    self->_observers = v7;

    v5 = v10;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v5);

}

- (void)removeObserver:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBContinuityDisplayAuthenticationCoordinator.m"), 104, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

}

- (void)invalidate
{
  self->_invalidated = 1;
  -[BSCompoundAssertion invalidate](self->_continuityDisplaySessionAssertions, "invalidate");
  -[SBContinuityDisplayAuthenticationCoordinator _setSessionActive:](self, "_setSessionActive:", 0);
  -[SBFMobileKeyBag removeObserver:](self->_mobileKeyBag, "removeObserver:", self);
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  BSDispatchMain();
}

uint64_t __78__SBContinuityDisplayAuthenticationCoordinator_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleKeyBagStateChange");
}

- (void)_updateSessionState
{
  _BOOL8 v3;

  if (-[BSCompoundAssertion isActive](self->_continuityDisplaySessionAssertions, "isActive"))
    v3 = !self->_invalidated;
  else
    v3 = 0;
  -[SBContinuityDisplayAuthenticationCoordinator _setSessionActive:](self, "_setSessionActive:", v3);
}

- (void)_handleAuthenticationHeartbeatTimer
{
  -[SBFMobileKeyBag refreshContinuityUnlockHeartbeat](self->_mobileKeyBag, "refreshContinuityUnlockHeartbeat");
}

- (void)_setSessionActive:(BOOL)a3
{
  double v4;
  double v5;
  id v6;
  objc_class *v7;
  void *v8;
  BSContinuousMachTimer *v9;
  BSContinuousMachTimer *heartbeatTimer;
  BSContinuousMachTimer *v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  BSContinuousMachTimer *v17;
  NSObject *v18;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  id location[2];

  if (self->_sessionActive != a3)
  {
    self->_sessionActive = a3;
    if (a3)
    {
      objc_initWeak(location, self);
      -[SBContinuityDisplayAuthenticationCoordinator heartbeatInterval](self, "heartbeatInterval");
      v5 = v4;
      -[BSContinuousMachTimer invalidate](self->_heartbeatTimer, "invalidate");
      v6 = objc_alloc(MEMORY[0x1E0D01720]);
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (BSContinuousMachTimer *)objc_msgSend(v6, "initWithIdentifier:", v8);
      heartbeatTimer = self->_heartbeatTimer;
      self->_heartbeatTimer = v9;

      v11 = self->_heartbeatTimer;
      v12 = MEMORY[0x1E0C80D38];
      v13 = MEMORY[0x1E0C80D38];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __66__SBContinuityDisplayAuthenticationCoordinator__setSessionActive___block_invoke;
      v20[3] = &unk_1E8E9DD28;
      objc_copyWeak(&v21, location);
      -[BSContinuousMachTimer scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:](v11, "scheduleRepeatingWithFireInterval:repeatInterval:leewayInterval:queue:handler:", v12, v20, v5, v5, v5 * 0.25);

      -[SBLockScreenManager setBiometricAutoUnlockingDisabled:forReason:](self->_lockScreenManager, "setBiometricAutoUnlockingDisabled:forReason:", 1, CFSTR("SBContinuityDisplayAuthenticationCoordinator"));
      -[SBFMobileKeyBag extendedState](self->_mobileKeyBag, "extendedState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "lockState");

      if (v15 != 2)
      {
        SBLogContinuityDisplay();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v19 = 0;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Session changed to active but we're not fully locked. Locking key bag", v19, 2u);
        }

        -[SBFMobileKeyBag lockSkippingGracePeriod:endingContinuityUnlock:](self->_mobileKeyBag, "lockSkippingGracePeriod:endingContinuityUnlock:", 1, 1);
      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(location);
    }
    else
    {
      -[BSContinuousMachTimer invalidate](self->_heartbeatTimer, "invalidate");
      v17 = self->_heartbeatTimer;
      self->_heartbeatTimer = 0;

      -[SBLockScreenManager setBiometricAutoUnlockingDisabled:forReason:](self->_lockScreenManager, "setBiometricAutoUnlockingDisabled:forReason:", 0, CFSTR("SBContinuityDisplayAuthenticationCoordinator"));
      if (-[SBContinuityDisplayAuthenticationCoordinator lockState](self, "lockState") == 1)
      {
        SBLogContinuityDisplay();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(location[0]) = 0;
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Session changed to inactive while in continuity unlock. Locking key bag", (uint8_t *)location, 2u);
        }

        -[SBFMobileKeyBag lockSkippingGracePeriod:endingContinuityUnlock:](self->_mobileKeyBag, "lockSkippingGracePeriod:endingContinuityUnlock:", 0, 1);
      }
    }
  }
}

void __66__SBContinuityDisplayAuthenticationCoordinator__setSessionActive___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAuthenticationHeartbeatTimer");

}

- (void)_handleKeyBagStateChange
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Key bag continuity unlocked but we don't have an active session, relocking immediately!!", v1, 2u);
}

- (BOOL)_isSessionActive
{
  return self->_sessionActive;
}

- (double)heartbeatInterval
{
  return self->_heartbeatInterval;
}

- (void)setHeartbeatInterval:(double)a3
{
  self->_heartbeatInterval = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_mobileKeyBag, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_continuityDisplaySessionAssertions, 0);
}

@end
