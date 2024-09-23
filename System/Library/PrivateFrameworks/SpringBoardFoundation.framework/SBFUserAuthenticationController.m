@implementation SBFUserAuthenticationController

- (BOOL)isAuthenticatedCached
{
  return self->_authenticationState != 0;
}

- (BOOL)_isUserAuthenticated
{
  SBFAuthenticationAssertion *v4;
  SBFAuthenticationAssertion *transientAuthCheckingAssertion;
  void *v6;
  int IsYes;
  NSObject *v8;
  _BOOL4 v9;
  void *v11;
  void *v12;

  BSDispatchQueueAssertMain();
  if (_isUserAuthenticated___reentryGuard == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFUserAuthenticationController.m"), 453, CFSTR("auth state is being configured re-entrantly"));

  }
  _isUserAuthenticated___reentryGuard = 1;
  if (self->_cachedAuthFlag == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_authenticationState == 2)
    {
      if (self->_transientAuthCheckingAssertion)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFUserAuthenticationController.m"), 469, CFSTR("transient auth assertion must be nil"));

      }
      -[SBFUserAuthenticationController createGracePeriodAssertionWithReason:](self, "createGracePeriodAssertionWithReason:", CFSTR("Checking if passcode locked"));
      v4 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
      transientAuthCheckingAssertion = self->_transientAuthCheckingAssertion;
      self->_transientAuthCheckingAssertion = v4;

      -[SBFAuthenticationAssertion activate](self->_transientAuthCheckingAssertion, "activate");
      -[SBFAuthenticationAssertion isValid](self->_transientAuthCheckingAssertion, "isValid");
      self->_cachedAuthFlag = BSSettingFlagForBool();
    }
    else
    {
      -[SBFUserAuthenticationController _cachedLockStateExtended](self, "_cachedLockStateExtended");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "isEffectivelyLocked");
      self->_cachedAuthFlag = BSSettingFlagForBool();

    }
    IsYes = BSSettingFlagIsYes();
    SBLogAuthenticationController();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (IsYes)
    {
      if (v9)
        -[SBFUserAuthenticationController _isUserAuthenticated].cold.1();
    }
    else if (v9)
    {
      -[SBFUserAuthenticationController _isUserAuthenticated].cold.2();
    }

    -[SBFUserAuthenticationController _setup_runLoopObserverIfNecessary](self, "_setup_runLoopObserverIfNecessary");
  }
  _isUserAuthenticated___reentryGuard = 0;
  return BSSettingFlagIsYes();
}

- (void)_setup_runLoopObserverIfNecessary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "Starting runloop cache period.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (id)_cachedLockStateExtended
{
  SBFMobileKeyBagState *v3;
  SBFMobileKeyBagState *cachedExtendedState;

  if (!self->_cachedExtendedState)
  {
    -[SBFMobileKeyBag extendedState](self->_keybag, "extendedState");
    v3 = (SBFMobileKeyBagState *)objc_claimAutoreleasedReturnValue();
    cachedExtendedState = self->_cachedExtendedState;
    self->_cachedExtendedState = v3;

  }
  -[SBFUserAuthenticationController _setup_runLoopObserverIfNecessary](self, "_setup_runLoopObserverIfNecessary");
  return self->_cachedExtendedState;
}

- (BOOL)_isTemporarilyBlocked
{
  -[SBFUserAuthenticationController _refreshModelCacheIfNeeded](self, "_refreshModelCacheIfNeeded");
  return -[SBFUserAuthenticationModel isTemporarilyBlocked](self->_model, "isTemporarilyBlocked");
}

- (void)_refreshModelCacheIfNeeded
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_unblockTimer
    && (objc_opt_respondsToSelector() & 1) != 0
    && (-[SBFUserAuthenticationModel isTemporarilyBlocked](self->_model, "isTemporarilyBlocked") & 1) == 0)
  {
    -[SBFUserAuthenticationModel refreshBlockedState](self->_model, "refreshBlockedState");
    -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
    SBLogAuthenticationController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      MEMORY[0x18D773350](-[SBFUserAuthenticationModel isTemporarilyBlocked](self->_model, "isTemporarilyBlocked"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFUserAuthenticationModel timeUntilUnblockedSinceReferenceDate](self->_model, "timeUntilUnblockedSinceReferenceDate");
      v6 = v5;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      *(_DWORD *)buf = 138543874;
      v10 = v4;
      v11 = 2048;
      v12 = v6;
      v13 = 2048;
      v14 = v7;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_INFO, "Refreshed model cache due to unfired unblock timer while nominally unblocked. isTemporarilyBlocked = %{public}@ timeUntilUnblockedSinceReferenceDate = %f timeIntervalSinceReferenceDate = %f", buf, 0x20u);

    }
    if (!self->_unblockTimer)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __61__SBFUserAuthenticationController__refreshModelCacheIfNeeded__block_invoke;
      block[3] = &unk_1E200E188;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
}

- (BOOL)_isPermanentlyBlocked
{
  return -[SBFUserAuthenticationModel isPermanentlyBlocked](self->_model, "isPermanentlyBlocked");
}

void __68__SBFUserAuthenticationController__setup_runLoopObserverIfNecessary__block_invoke(uint64_t a1)
{
  NSObject *v2;
  __CFRunLoop *Main;

  SBLogAuthenticationController();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __68__SBFUserAuthenticationController__setup_runLoopObserverIfNecessary__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_invalidateCachedPasscodeLockState");
  Main = CFRunLoopGetMain();
  CFRunLoopRemoveObserver(Main, *(CFRunLoopObserverRef *)(*(_QWORD *)(a1 + 32) + 88), (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 88));
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
}

- (void)_invalidateCachedPasscodeLockState
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "Invalidating runloop cached authentication state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (SBFUserAuthenticationController)initWithAssertionManager:(id)a3 policy:(id)a4
{
  return -[SBFUserAuthenticationController initWithAssertionManager:policy:keybag:model:](self, "initWithAssertionManager:policy:keybag:model:", a3, a4, 0, 0);
}

- (SBFUserAuthenticationController)initWithAssertionManager:(id)a3 policy:(id)a4 keybag:(id)a5 model:(id)a6
{
  id v11;
  id v12;
  id v13;
  SBFUserAuthenticationModelSEP *v14;
  SBFUserAuthenticationController *v15;
  SBFMobileKeyBag *v16;
  SBFMobileKeyBag *keybag;
  SBFUserAuthenticationModelSEP *v18;
  SBFSecureDisplayCoordinator *v19;
  SBFSecureDisplayCoordinator *secureDisplayCoordinator;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSDate *lastRevokedAuthenticationDate;
  void *v26;
  uint64_t v27;
  BSCompoundAssertion *secureDisplayDeferralAssertions;
  NSObject *v29;
  void *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t);
  void *v35;
  id v36;
  id location;
  objc_super v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (SBFUserAuthenticationModelSEP *)a6;
  v38.receiver = self;
  v38.super_class = (Class)SBFUserAuthenticationController;
  v15 = -[SBFUserAuthenticationController init](&v38, sel_init);
  if (!v15)
    goto LABEL_22;
  if (v13)
  {
    v16 = (SBFMobileKeyBag *)v13;
  }
  else
  {
    +[SBFMobileKeyBag sharedInstance](SBFMobileKeyBag, "sharedInstance");
    v16 = (SBFMobileKeyBag *)objc_claimAutoreleasedReturnValue();
  }
  keybag = v15->_keybag;
  v15->_keybag = v16;

  -[SBFMobileKeyBag addObserver:](v15->_keybag, "addObserver:", v15);
  if (!v14)
  {
    if (MGGetBoolAnswer())
      v18 = -[SBFUserAuthenticationModelSEP initWithKeyBag:]([SBFUserAuthenticationModelSEP alloc], "initWithKeyBag:", v15->_keybag);
    else
      v18 = objc_alloc_init(SBFUserAuthenticationModelJournaledDefaults);
    v14 = v18;
  }
  -[SBFUserAuthenticationController _setModel:](v15, "_setModel:", v14);
  objc_storeStrong((id *)&v15->_assertionManager, a3);
  objc_storeStrong((id *)&v15->_policy, a4);
  if (-[SBFAuthenticationPolicy usesSecureMode](v15->_policy, "usesSecureMode"))
  {
    v19 = objc_alloc_init(SBFSecureDisplayCoordinator);
    secureDisplayCoordinator = v15->_secureDisplayCoordinator;
    v15->_secureDisplayCoordinator = v19;

  }
  -[SBFMobileKeyBag state](v15->_keybag, "state");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "lockState");
  v15->_cachedAuthFlag = 0x7FFFFFFFFFFFFFFFLL;
  v15->_authenticationState = 1;
  if (-[SBFMobileKeyBag hasPasscodeSet](v15->_keybag, "hasPasscodeSet"))
  {
    if (v22 == 2)
    {
      v23 = 0;
    }
    else
    {
      if (v22 != 1)
      {
LABEL_18:
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v24 = objc_claimAutoreleasedReturnValue();
        lastRevokedAuthenticationDate = v15->_lastRevokedAuthenticationDate;
        v15->_lastRevokedAuthenticationDate = (NSDate *)v24;

        goto LABEL_19;
      }
      v23 = 2;
    }
    v15->_authenticationState = v23;
    goto LABEL_18;
  }
LABEL_19:
  -[SBFUserAuthenticationController _setupPolicy:](v15, "_setupPolicy:", v12);
  -[SBFUserAuthenticationController _scheduleUnblockTimer](v15, "_scheduleUnblockTimer");
  objc_initWeak(&location, v15);
  v26 = (void *)MEMORY[0x1E0D01718];
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __80__SBFUserAuthenticationController_initWithAssertionManager_policy_keybag_model___block_invoke;
  v35 = &unk_1E200E828;
  objc_copyWeak(&v36, &location);
  objc_msgSend(v26, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("secureDisplayDeferral"), &v32);
  v27 = objc_claimAutoreleasedReturnValue();
  secureDisplayDeferralAssertions = v15->_secureDisplayDeferralAssertions;
  v15->_secureDisplayDeferralAssertions = (BSCompoundAssertion *)v27;

  SBLogAuthenticationController();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    -[SBFUserAuthenticationController publicDescription](v15, "publicDescription", v32, v33, v34, v35);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v30;
    _os_log_impl(&dword_18AB69000, v29, OS_LOG_TYPE_DEFAULT, "UserAuthenticationController initialized: %{public}@", buf, 0xCu);

  }
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

LABEL_22:
  return v15;
}

void __80__SBFUserAuthenticationController_initWithAssertionManager_policy_keybag_model___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSecureModeIfNecessaryForNewAuthState");

}

- (void)dealloc
{
  objc_super v3;

  -[SBFMobileKeyBag removeObserver:](self->_keybag, "removeObserver:", self);
  -[SBFUserAuthenticationModel synchronize](self->_model, "synchronize");
  -[SBFUserAuthenticationController _clearUnblockTimer](self, "_clearUnblockTimer");
  v3.receiver = self;
  v3.super_class = (Class)SBFUserAuthenticationController;
  -[SBFUserAuthenticationController dealloc](&v3, sel_dealloc);
}

- (void)processAuthenticationRequest:(id)a3
{
  NSMutableArray *responders;
  id v5;
  id v6;

  responders = self->_responders;
  v5 = a3;
  -[NSMutableArray firstObject](responders, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFUserAuthenticationController _processAuthenticationRequest:responder:](self, "_processAuthenticationRequest:responder:", v5, v6);

}

- (id)createKeybagUnlockAssertionWithReason:(id)a3
{
  id v4;
  SBFAuthenticationAssertion *v5;

  v4 = a3;
  v5 = -[SBFAuthenticationAssertion initWithIdentifier:type:withController:]([SBFAuthenticationAssertion alloc], "initWithIdentifier:type:withController:", v4, 1, self);

  return v5;
}

- (id)createGracePeriodAssertionWithReason:(id)a3
{
  id v4;
  SBFAuthenticationAssertion *v5;

  v4 = a3;
  v5 = -[SBFAuthenticationAssertion initWithIdentifier:type:withController:]([SBFAuthenticationAssertion alloc], "initWithIdentifier:type:withController:", v4, 2, self);

  return v5;
}

- (id)createSecureDisplayDeferralAssertionWithReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_secureDisplayDeferralAssertions, "acquireForReason:", a3);
}

- (id)authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:(BOOL)a3
{
  _SBFContinuityUnlockAuthenticationStatusProvider *v3;

  if (a3)
    v3 = -[_SBFContinuityUnlockAuthenticationStatusProvider initWithMobileKeyBag:underlyingProvider:]([_SBFContinuityUnlockAuthenticationStatusProvider alloc], "initWithMobileKeyBag:underlyingProvider:", self->_keybag, self);
  else
    v3 = self;
  return v3;
}

- (NSString)description
{
  return (NSString *)-[SBFUserAuthenticationController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)hasPasscodeSet
{
  return -[SBFMobileKeyBag hasPasscodeSet](self->_keybag, "hasPasscodeSet");
}

- (BOOL)hasAuthenticatedAtLeastOnceSinceBoot
{
  return -[SBFMobileKeyBag hasBeenUnlockedSinceBoot](self->_keybag, "hasBeenUnlockedSinceBoot");
}

- (void)revokeAuthenticationImmediatelyForPublicReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAuthenticationController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_INFO, "Revoke authentication immediately requested for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SBFUserAuthenticationController _revokeAuthenticationImmediately:forPublicReason:](self, "_revokeAuthenticationImmediately:forPublicReason:", 1, v4);
}

- (void)revokeAuthenticationImmediatelyIfNecessaryForPublicReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAuthenticationController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_INFO, "Revoke authentication immediately if necessary requested for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SBFUserAuthenticationController _updateAuthenticationStateImmediately:forPublicReason:](self, "_updateAuthenticationStateImmediately:forPublicReason:", 1, v4);
}

- (void)revokeAuthenticationIfNecessaryForPublicReason:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogAuthenticationController();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_18AB69000, v5, OS_LOG_TYPE_INFO, "Revoke authentication requested for reason: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  -[SBFUserAuthenticationController _updateAuthenticationStateImmediately:forPublicReason:](self, "_updateAuthenticationStateImmediately:forPublicReason:", 0, v4);
}

- (void)notePasscodeEntryBegan
{
  -[SBFUserAuthenticationModel notePasscodeEntryBegan](self->_model, "notePasscodeEntryBegan");
}

- (void)notePasscodeEntryCancelled
{
  -[SBFUserAuthenticationModel notePasscodeEntryCancelled](self->_model, "notePasscodeEntryCancelled");
}

- (BOOL)isInSecureDisplayMode
{
  return -[SBFSecureDisplayCoordinator inSecureMode](self->_secureDisplayCoordinator, "inSecureMode");
}

- (BOOL)supportsSecureDisplayMode
{
  return 1;
}

- (void)deviceLockStateMayHaveChangedForModel:(id)a3
{
  -[SBFUserAuthenticationController _notifyAboutTemporaryBlockStatusChanged](self, "_notifyAboutTemporaryBlockStatusChanged", a3);
  -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
}

- (void)deviceLockModelRequestsDeviceWipe:(id)a3
{
  -[SBFAuthenticationPolicy wipeDeviceWithReason:](self->_policy, "wipeDeviceWithReason:", CFSTR("deviceLockModelRequestsDeviceWipe"));
}

- (id)publicDescription
{
  void *v3;
  void *v4;
  unint64_t authenticationState;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  authenticationState = self->_authenticationState;
  if (authenticationState > 2)
    v6 = 0;
  else
    v6 = off_1E200E8B0[authenticationState];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("authState"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet"), CFSTR("hasPasscodeSet"));
  if (-[SBFUserAuthenticationController _isTemporarilyBlocked](self, "_isTemporarilyBlocked"))
    v9 = (id)objc_msgSend(v4, "appendBool:withName:", 1, CFSTR("temporarilyBlocked"));
  if (-[SBFUserAuthenticationController _isPermanentlyBlocked](self, "_isPermanentlyBlocked"))
    v10 = (id)objc_msgSend(v4, "appendBool:withName:", 1, CFSTR("permanentlyBlocked"));
  if (-[SBFUserAuthenticationController _isUserRequestedEraseEnabled](self, "_isUserRequestedEraseEnabled"))
    v11 = (id)objc_msgSend(v4, "appendBool:withName:", 1, CFSTR("userRequestedEraseEnabled"));
  if (self->_lastRevokedAuthenticationDate)
  {
    objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "formatDateAsLongYMDHMSZWithDate:", self->_lastRevokedAuthenticationDate);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (id)objc_msgSend(v4, "appendObject:withName:", v13, CFSTR("revokedAuthDate"));

  }
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self->_model);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "build");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v4, "appendObject:withName:", v16, CFSTR("model"));

  objc_msgSend(v4, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFUserAuthenticationController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  unint64_t authenticationState;
  __CFString *v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  authenticationState = self->_authenticationState;
  if (authenticationState > 2)
    v6 = 0;
  else
    v6 = off_1E200E8B0[authenticationState];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("authState"));
  v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet"), CFSTR("passcodeSet"));
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFUserAuthenticationController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  id v7;
  _QWORD v9[4];
  id v10;
  SBFUserAuthenticationController *v11;

  v4 = a3;
  -[SBFUserAuthenticationController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__SBFUserAuthenticationController_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E200E2A0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

id __73__SBFUserAuthenticationController_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appendArraySection:withName:skipIfEmpty:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("responders"), 0);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 48))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D01738], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formatDateAsLongYMDHMSZWithDate:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("revokedAuthDate"));

    v2 = *(_QWORD *)(a1 + 40);
  }
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(v2 + 56), CFSTR("assertManager"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 128), CFSTR("secureDisplayDeferralAssertions"));
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  BSDispatchMain();
}

void __66__SBFUserAuthenticationController_keybagDidUnlockForTheFirstTime___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:userInfo:", CFSTR("SBFUserAuthenticatedForFirstTimeNotification"), 0, 0);

}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v4;
  id v5;

  v5 = a3;
  v4 = v5;
  BSDispatchMain();

}

void __65__SBFUserAuthenticationController_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "extendedState");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_updateAuthenticationStateAndDateForLockState:", v2);

}

- (void)_setModel:(id)a3
{
  SBFUserAuthenticationModel *v5;
  SBFUserAuthenticationModel *v6;

  v5 = (SBFUserAuthenticationModel *)a3;
  if (self->_model != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_model, a3);
    -[SBFUserAuthenticationModel setDelegate:](self->_model, "setDelegate:", self);
    v5 = v6;
  }

}

- (void)_setupPolicy:(id)a3
{
  id v4;
  SBFAuthenticationPolicy *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  v4 = a3;
  v5 = self->_policy;
  if (-[SBFAuthenticationPolicy shouldClearBlockStateOnSync](v5, "shouldClearBlockStateOnSync"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __48__SBFUserAuthenticationController__setupPolicy___block_invoke;
    v11 = &unk_1E200E570;
    objc_copyWeak(&v12, &location);
    v7 = (id)objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", CFSTR("kSBSyncSessionBegan"), 0, 0, &v8);
    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__uncachePasscodeIfNecessary, CFSTR("SBSetupBuddyCompletedNotification"), 0, v8, v9, v10, v11);
    if (objc_msgSend(v4, "usesSecureMode", v8, v9, v10, v11)
      && !-[SBFUserAuthenticationController isAuthenticatedCached](self, "isAuthenticatedCached"))
    {
      -[SBFSecureDisplayCoordinator setSecureMode:postNotification:](self->_secureDisplayCoordinator, "setSecureMode:postNotification:", 1, 0);
    }
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __48__SBFUserAuthenticationController__setupPolicy___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_clearBlockedState");

}

- (void)_uncachePasscodeIfNecessary
{
  SBFAuthenticationPolicy *v2;

  v2 = self->_policy;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFAuthenticationPolicy clearPasscodeCache](v2, "clearPasscodeCache");

}

- (void)_addAuthenticationAssertion:(id)a3
{
  SBFAuthenticationAssertionManager *assertionManager;
  id v5;
  uint64_t v6;

  assertionManager = self->_assertionManager;
  v5 = a3;
  -[SBFAuthenticationAssertionManager addAssertion:](assertionManager, "addAssertion:", v5);
  v6 = objc_msgSend(v5, "type");

  if (v6 == 1 && self->_authenticationState != 1)
  {
    -[SBFUserAuthenticationController _authenticateIfInGracePeriod](self, "_authenticateIfInGracePeriod");
    -[SBFUserAuthenticationController _updateAuthenticationStateForPublicReason:](self, "_updateAuthenticationStateForPublicReason:", CFSTR("add authentication assertion for preventLock while locked"));
  }
}

- (void)_removeAuthenticationAssertion:(id)a3
{
  NSObject *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SBFAuthenticationAssertionManager removeAssertion:](self->_assertionManager, "removeAssertion:");
  if (!-[SBFAuthenticationAssertionManager hasActiveAssertions](self->_assertionManager, "hasActiveAssertions"))
  {
    SBLogAuthenticationController();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("remove authentication assertion: %@"), v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFUserAuthenticationController _updateAuthenticationStateForPublicReason:](self, "_updateAuthenticationStateForPublicReason:", v5);

    }
    else
    {
      -[SBFUserAuthenticationController _updateAuthenticationStateForPublicReason:](self, "_updateAuthenticationStateForPublicReason:", CFSTR("remove authentication assertion"));
    }

  }
}

- (BOOL)_isAssertionValid:(id)a3
{
  return -[SBFAuthenticationAssertionManager isAssertionValid:](self->_assertionManager, "isAssertionValid:", a3);
}

- (void)_addPrivateAuthenticationObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_removePrivateAuthenticationObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (BOOL)_isInBioUnlockState
{
  void *v2;
  BOOL v3;

  -[SBFUserAuthenticationController _cachedLockStateExtended](self, "_cachedLockStateExtended");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockState") == 7;

  return v3;
}

- (BOOL)_isInGracePeriodState
{
  void *v2;
  BOOL v3;

  -[SBFUserAuthenticationController _cachedLockStateExtended](self, "_cachedLockStateExtended");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "lockState") == 5;

  return v3;
}

- (void)_setAuthState:(int64_t)a3
{
  int64_t authenticationState;
  NSObject *v6;
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSDate *v13;
  NSDate *lastRevokedAuthenticationDate;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  authenticationState = self->_authenticationState;
  if (authenticationState != a3)
  {
    SBLogAuthenticationController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if ((unint64_t)a3 > 2)
        v7 = 0;
      else
        v7 = off_1E200E8B0[a3];
      *(_DWORD *)buf = 138543362;
      v18 = v7;
      _os_log_impl(&dword_18AB69000, v6, OS_LOG_TYPE_DEFAULT, "State changed to %{public}@", buf, 0xCu);
    }

    self->_authenticationState = a3;
    -[SBFUserAuthenticationController _invalidateCachedPasscodeLockState](self, "_invalidateCachedPasscodeLockState");
    -[SBFUserAuthenticationController _notifyAboutTemporaryBlockStatusChanged](self, "_notifyAboutTemporaryBlockStatusChanged");
    -[SBFUserAuthenticationController _updateSecureModeIfNecessaryForNewAuthState](self, "_updateSecureModeIfNecessaryForNewAuthState");
    if ((unint64_t)a3 >= 2)
    {
      if (a3 == 2)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
        lastRevokedAuthenticationDate = self->_lastRevokedAuthenticationDate;
        self->_lastRevokedAuthenticationDate = v13;

      }
    }
    else
    {
      SBLogAuthenticationController();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SBFUserAuthenticationController _setAuthState:].cold.1();

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", authenticationState != 0, CFSTR("SBFUserAuthenticationStateWasAuthenticatedKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("SBFUserAuthenticationStateDidChangeNotification"), 0, v11);

      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.DeviceLockStatusChanged"), 0, 0, 0);
    }
  }
}

- (void)_updateAuthenticationStateAndDateForLockState:(id)a3
{
  id v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "lockState");
  v6 = objc_msgSend(v4, "isEffectivelyLocked");
  if ((v6 & 1) != 0)
  {
    v7 = 0;
LABEL_6:
    -[SBFUserAuthenticationController _setAuthState:](self, "_setAuthState:", v7);
    goto LABEL_7;
  }
  if (v5 <= 7 && ((1 << v5) & 0x89) != 0)
  {
    v7 = 1;
    goto LABEL_6;
  }
LABEL_7:
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_observers;
  v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "extendedKeybagLockStateChanged:", v6, (_QWORD)v14);
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFUserAuthenticationModel noteNewMkbDeviceLockState:](self->_model, "noteNewMkbDeviceLockState:", v4);

}

- (void)_updateAuthenticationStateForPublicReason:(id)a3
{
  -[SBFUserAuthenticationController _updateAuthenticationStateImmediately:forPublicReason:](self, "_updateAuthenticationStateImmediately:forPublicReason:", 0, a3);
}

- (void)_updateAuthenticationStateImmediately:(BOOL)a3 forPublicReason:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (!-[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet"))
  {
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recomputeUserComplianceWarning");

  }
  if (-[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet")
    && !-[SBFAuthenticationAssertionManager hasActiveAssertions](self->_assertionManager, "hasActiveAssertions")
    && -[SBFUserAuthenticationController _shouldRevokeAuthenticationNow](self, "_shouldRevokeAuthenticationNow")
    && (-[SBFUserAuthenticationController authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:](self, "authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:", v4), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "isAuthenticated"), v8, v9))
  {
    SBLogAuthenticationController();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = &stru_1E2010FC0;
      if (v4)
        v11 = CFSTR("immediately");
      v13 = 138412546;
      v14 = v11;
      v15 = 2114;
      v16 = v6;
      _os_log_impl(&dword_18AB69000, v10, OS_LOG_TYPE_DEFAULT, "Update authentication state - needs authentication revoked; revoking %@ for reason: %{public}@",
        (uint8_t *)&v13,
        0x16u);
    }

    -[SBFUserAuthenticationController _revokeAuthenticationImmediately:forPublicReason:](self, "_revokeAuthenticationImmediately:forPublicReason:", v4, v6);
  }
  else
  {
    SBLogAuthenticationController();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[SBFUserAuthenticationController _updateAuthenticationStateImmediately:forPublicReason:].cold.1();

  }
}

- (BOOL)_shouldRevokeAuthenticationNow
{
  int v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[SBFAuthenticationPolicy allowAuthenticationRevocation](self->_policy, "allowAuthenticationRevocation");
  if (v2)
  {
    SBLogAuthenticationController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_INFO, "Authentication policy wants authentication revoked.", v5, 2u);
    }

  }
  return v2;
}

- (void)_revokeAuthenticationImmediately:(BOOL)a3 forPublicReason:(id)a4
{
  void *v4;
  _BOOL8 v5;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  int64_t authenticationState;
  NSObject *v17;
  NSDate *v18;
  NSDate *lastRevokedAuthenticationDate;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  __CFString *v25;
  uint64_t v26;

  v5 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (-[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet"))
  {
    -[SBFUserAuthenticationController authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:](self, "authenticationStatusProviderTreatingContinuityUnlockedAsUnlocked:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isAuthenticated");

    if (v9)
    {
      SBLogAuthenticationController();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = &stru_1E2010FC0;
        if (v5)
          v12 = CFSTR("immediately");
        else
          v12 = &stru_1E2010FC0;
        SBLogAuthenticationController();
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
        if (v14)
        {
          v15 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR(", caller: %@"), v4);
          v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        *(_DWORD *)buf = 138543874;
        v21 = v12;
        v22 = 2114;
        v23 = v7;
        v24 = 2114;
        v25 = v11;
        _os_log_impl(&dword_18AB69000, v10, OS_LOG_TYPE_DEFAULT, "Revoking authentication%{public}@ - reason: %{public}@ %{public}@", buf, 0x20u);
        if (v14)
        {

        }
      }

      authenticationState = self->_authenticationState;
      -[SBFMobileKeyBag lockSkippingGracePeriod:](self->_keybag, "lockSkippingGracePeriod:", v5);
      -[SBFUserAuthenticationController _invalidateCachedPasscodeLockState](self, "_invalidateCachedPasscodeLockState");
      if (authenticationState)
      {
        -[SBFUserAuthenticationController _setAuthState:](self, "_setAuthState:", 2);
      }
      else
      {
        SBLogAuthenticationController();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[SBFUserAuthenticationController _revokeAuthenticationImmediately:forPublicReason:].cold.1();

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v18 = (NSDate *)objc_claimAutoreleasedReturnValue();
      lastRevokedAuthenticationDate = self->_lastRevokedAuthenticationDate;
      self->_lastRevokedAuthenticationDate = v18;

    }
  }

}

- (void)_addAsFirstResponder:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *responders;
  NSObject *v7;

  v4 = a3;
  if (v4)
  {
    if (self->_responders)
    {
      -[SBFUserAuthenticationController _removeAuthResponder:](self, "_removeAuthResponder:", v4);
      -[NSMutableArray insertObject:atIndex:](self->_responders, "insertObject:atIndex:", v4, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v4);
      v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      responders = self->_responders;
      self->_responders = v5;

    }
    SBLogAuthenticationRequests();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[SBFUserAuthenticationController _addAsFirstResponder:].cold.1((uint64_t)self, v7);

  }
}

- (void)_removeAuthResponder:(id)a3
{
  id v4;
  NSObject *v5;

  if (a3)
  {
    v4 = a3;
    SBLogAuthenticationRequests();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[SBFUserAuthenticationController _removeAuthResponder:].cold.1((uint64_t)self, v5);

    -[NSMutableArray removeObject:](self->_responders, "removeObject:", v4);
  }
}

- (BOOL)_processAuthenticationRequest:(id)a3 responder:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  id v9;
  id v11;

  v11 = 0;
  v6 = a4;
  v7 = a3;
  v8 = -[SBFUserAuthenticationController _evaluateAuthenticationAttempt:outError:](self, "_evaluateAuthenticationAttempt:outError:", v7, &v11);
  v9 = v11;
  -[SBFUserAuthenticationController _notifyClientsOfAuthenticationResult:forRequest:error:withResponder:](self, "_notifyClientsOfAuthenticationResult:forRequest:error:withResponder:", v8, v7, v9, v6);

  LOBYTE(v7) = -[SBFUserAuthenticationController _BOOLForAuthenticationResult:](self, "_BOOLForAuthenticationResult:", v8);
  return (char)v7;
}

- (void)_notifyClientsOfAuthenticationResult:(int64_t)a3 forRequest:(id)a4 error:(id)a5 withResponder:(id)a6
{
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if ((unint64_t)(a3 - 1) > 2)
    v13 = 0;
  else
    v13 = off_1E200E8C8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = CFSTR("SBFUserAuthenticationRequestCompletedAuthenticationTypeKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("SBFUserAuthenticationRequestCompletedResultKey");
  v21[0] = v15;
  v21[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("SBFUserAuthenticationRequestCompletedNotification"), self, v16);

  if (v12 || (objc_msgSend(v10, "handler"), v17 = (void *)objc_claimAutoreleasedReturnValue(), v17, v17))
  {
    switch(a3)
    {
      case 1:
        -[SBFUserAuthenticationController _handleFailedAuthentication:error:responder:](self, "_handleFailedAuthentication:error:responder:", v10, v11, v12);
        break;
      case 3:
        -[SBFUserAuthenticationController _handleInvalidAuthentication:responder:](self, "_handleInvalidAuthentication:responder:", v10, v12);
        break;
      case 2:
        -[SBFUserAuthenticationController _handleSuccessfulAuthentication:responder:](self, "_handleSuccessfulAuthentication:responder:", v10, v12);
        break;
    }
    objc_msgSend(v10, "handler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "handler");
      v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, BOOL))v19)[2](v19, -[SBFUserAuthenticationController _BOOLForAuthenticationResult:](self, "_BOOLForAuthenticationResult:", a3));

    }
  }

}

- (void)_handleSuccessfulAuthentication:(id)a3 responder:(id)a4
{
  id v6;
  SBFUserAuthenticationModel *model;
  id v8;
  SBFAuthenticationPolicy *v9;
  void *v10;
  _QWORD block[5];

  v6 = a3;
  model = self->_model;
  v8 = a4;
  -[SBFUserAuthenticationModel notePasscodeUnlockSucceeded](model, "notePasscodeUnlockSucceeded");
  -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
  if (objc_msgSend(v6, "type") == 1 && !objc_msgSend(v6, "source"))
  {
    v9 = self->_policy;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "passcode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFAuthenticationPolicy cachePasscode:](v9, "cachePasscode:", v10);

    }
  }
  -[SBFUserAuthenticationController _setAuthState:](self, "_setAuthState:", 1);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__SBFUserAuthenticationController__handleSuccessfulAuthentication_responder___block_invoke;
  block[3] = &unk_1E200E188;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_msgSend(v8, "handleSuccessfulAuthenticationRequest:", v6);

}

uint64_t __77__SBFUserAuthenticationController__handleSuccessfulAuthentication_responder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAuthenticationStateImmediately:forPublicReason:", 0, CFSTR("authentication successful from authentication request"));
}

- (void)_handleFailedAuthentication:(id)a3 error:(id)a4 responder:(id)a5
{
  SBFUserAuthenticationModel *model;
  id v9;
  id v10;
  id v11;

  v11 = a4;
  model = self->_model;
  v9 = a5;
  v10 = a3;
  -[SBFUserAuthenticationModel notePasscodeUnlockFailedWithError:](model, "notePasscodeUnlockFailedWithError:", v11);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFAuthenticationPolicy passcodeAuthenticationFailedWithError:](self->_policy, "passcodeAuthenticationFailedWithError:", v11);
  -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
  objc_msgSend(v9, "handleFailedAuthenticationRequest:error:", v10, v11);

}

- (void)_handleInvalidAuthentication:(id)a3 responder:(id)a4
{
  objc_msgSend(a4, "handleInvalidAuthenticationRequest:", a3);
}

- (BOOL)_BOOLForAuthenticationResult:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)_performNilPasscodeCheck
{
  SBFMobileKeyBagUnlockOptions *v3;

  v3 = -[SBFMobileKeyBagUnlockOptions initWithPasscode:]([SBFMobileKeyBagUnlockOptions alloc], "initWithPasscode:", 0);
  LOBYTE(self) = -[SBFMobileKeyBag unlockWithOptions:error:](self->_keybag, "unlockWithOptions:error:", v3, 0);

  return (char)self;
}

- (BOOL)_authenticateIfInGracePeriod
{
  int64_t authenticationState;
  BOOL result;
  BOOL v6;
  void *v7;

  authenticationState = self->_authenticationState;
  if (authenticationState != 2)
    return authenticationState == 1;
  if (-[SBFUserAuthenticationController _isInGracePeriodState](self, "_isInGracePeriodState")
    && -[SBFUserAuthenticationController _performNilPasscodeCheck](self, "_performNilPasscodeCheck"))
  {
    v6 = 1;
    -[SBFUserAuthenticationController _setAuthState:](self, "_setAuthState:", 1);
    result = 1;
    if (self->_authenticationState == 1)
      return result;
    goto LABEL_6;
  }
  v6 = 0;
  result = 0;
  if (self->_authenticationState == 1)
  {
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFUserAuthenticationController.m"), 793, CFSTR("-[SBFUserAuthenticationController _authenticateIfInGracePeriod]'s return value is different from its internal authentication state."));

    return v6;
  }
  return result;
}

- (int64_t)_evaluateAuthenticationAttempt:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_msgSend(v6, "type");
  if (v7 == 2)
  {
    v8 = -[SBFUserAuthenticationController _evaluateBiometricAttempt:](self, "_evaluateBiometricAttempt:", v6);
    goto LABEL_5;
  }
  if (v7 == 1)
  {
    v8 = -[SBFUserAuthenticationController _evaluatePasscodeAttempt:outError:](self, "_evaluatePasscodeAttempt:outError:", v6, a4);
LABEL_5:
    v9 = v8;
    goto LABEL_7;
  }
  v9 = 3;
LABEL_7:
  SBLogAuthenticationRequests();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x18D773350](v9 != 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "publicDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    _os_log_impl(&dword_18AB69000, v10, OS_LOG_TYPE_DEFAULT, "Processed authentication request (success=%{public}@): %{public}@", (uint8_t *)&v14, 0x16u);

  }
  return v9;
}

- (int64_t)_evaluatePasscodeAttempt:(id)a3 outError:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  BOOL v12;
  _BOOL4 v13;
  BOOL v14;
  int64_t v15;
  SBFUserAuthenticationModel *model;
  id v17;
  NSString *lastIncorrectPasscodeAttempt;
  void *v19;
  NSString *v20;
  _BOOL4 v22;
  _QWORD v23[5];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t *v28;
  BOOL v29;
  BOOL v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;

  v6 = a3;
  v7 = objc_msgSend(v6, "source");
  v8 = v7 == 0;
  objc_msgSend(v6, "passcode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "length"))
  {
    v11 = -[SBFUserAuthenticationController hasPasscodeSet](self, "hasPasscodeSet");
    v12 = v11;
    if (v7)
      v13 = 0;
    else
      v13 = v11;
    if (v13)
      ADClientAddValueForScalarKey();
    v22 = v13;
    v14 = -[SBFUserAuthenticationController _isPermanentlyBlocked](self, "_isPermanentlyBlocked")
       || -[SBFUserAuthenticationController _isTemporarilyBlocked](self, "_isTemporarilyBlocked");
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy__1;
    v36 = __Block_byref_object_dispose__1;
    v37 = 0;
    model = self->_model;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __69__SBFUserAuthenticationController__evaluatePasscodeAttempt_outError___block_invoke;
    v23[3] = &unk_1E200E878;
    v29 = v8;
    v23[4] = self;
    v17 = v10;
    v24 = v17;
    v26 = &v38;
    v30 = v14;
    v25 = v6;
    v27 = &v42;
    v28 = &v32;
    v31 = v12;
    -[SBFUserAuthenticationModel performPasswordTest:](model, "performPasswordTest:", v23);
    if (*((_BYTE *)v39 + 24))
    {
      v15 = 3;
LABEL_27:

      _Block_object_dispose(&v32, 8);
      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);
      goto LABEL_28;
    }
    if (*((_BYTE *)v43 + 24))
    {
      lastIncorrectPasscodeAttempt = self->_lastIncorrectPasscodeAttempt;
      self->_lastIncorrectPasscodeAttempt = 0;
    }
    else
    {
      if (v22)
        ADClientAddValueForScalarKey();
      v19 = (void *)v33[5];
      if (v19 && objc_msgSend(v19, "code") == -14)
        goto LABEL_22;
      v20 = (NSString *)objc_msgSend(v17, "copy");
      lastIncorrectPasscodeAttempt = self->_lastIncorrectPasscodeAttempt;
      self->_lastIncorrectPasscodeAttempt = v20;
    }

LABEL_22:
    if (a4)
      *a4 = objc_retainAutorelease((id)v33[5]);
    if (*((_BYTE *)v43 + 24))
      v15 = 2;
    else
      v15 = 1;
    goto LABEL_27;
  }
  v15 = 1;
LABEL_28:

  return v15;
}

void __69__SBFUserAuthenticationController__evaluatePasscodeAttempt_outError___block_invoke(uint64_t a1, _BYTE *a2)
{
  SBFMobileKeyBagUnlockOptions *v4;
  void *v5;
  SBFMobileKeyBagUnlockOptions *v6;
  void *v7;
  uint64_t v8;
  void **v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  if ((!*(_BYTE *)(a1 + 80)
     || !*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72)
     || !objc_msgSend(*(id *)(a1 + 40), "isEqualToString:"))
    && !*(_BYTE *)(a1 + 81))
  {
    v4 = [SBFMobileKeyBagUnlockOptions alloc];
    objc_msgSend(*(id *)(a1 + 40), "dataUsingEncoding:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBFMobileKeyBagUnlockOptions initWithPasscode:skipSEKeepUserDataOperation:](v4, "initWithPasscode:skipSEKeepUserDataOperation:", v5, objc_msgSend(*(id *)(a1 + 48), "skipSEKeepUserDataOperation"));

    if (objc_msgSend(*(id *)(a1 + 48), "verifyOnly"))
    {
      if (*(_BYTE *)(a1 + 82))
      {
        v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v10 = *(void **)(v8 + 40);
        v9 = (void **)(v8 + 40);
        v19 = v10;
        v11 = objc_msgSend(v7, "verifyWithOptions:error:", v6, &v19);
        v12 = v19;
LABEL_11:
        v16 = v12;
        v17 = *v9;
        *v9 = v16;

LABEL_13:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v11;

        goto LABEL_14;
      }
    }
    else if (*(_BYTE *)(a1 + 82))
    {
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v15 = *(void **)(v14 + 40);
      v9 = (void **)(v14 + 40);
      v18 = v15;
      v11 = objc_msgSend(v13, "unlockWithOptions:error:", v6, &v18);
      v12 = v18;
      goto LABEL_11;
    }
    v11 = 1;
    goto LABEL_13;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
LABEL_14:
  *a2 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

- (int64_t)_evaluateBiometricAttempt:(id)a3
{
  NSString *lastIncorrectPasscodeAttempt;

  if (-[SBFUserAuthenticationController _isInBioUnlockState](self, "_isInBioUnlockState", a3))
  {
    if (-[SBFUserAuthenticationController _performNilPasscodeCheck](self, "_performNilPasscodeCheck"))
    {
      lastIncorrectPasscodeAttempt = self->_lastIncorrectPasscodeAttempt;
      self->_lastIncorrectPasscodeAttempt = 0;

      -[SBFUserAuthenticationController _invalidateCachedPasscodeLockState](self, "_invalidateCachedPasscodeLockState");
      return 2;
    }
    else
    {
      return 1;
    }
  }
  else if (-[SBFUserAuthenticationController isAuthenticated](self, "isAuthenticated"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

uint64_t __61__SBFUserAuthenticationController__refreshModelCacheIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyAboutTemporaryBlockStatusChanged");
}

- (void)_notifyAboutTemporaryBlockStatusChanged
{
  NSHashTable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = self->_observers;
  v3 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "temporaryBlockStatusChanged", (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (BOOL)_isUserRequestedEraseEnabled
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  -[SBFUserAuthenticationController _refreshModelCacheIfNeeded](self, "_refreshModelCacheIfNeeded");
  if (!-[SBFUserAuthenticationModel isUserRequestedEraseEnabled](self->_model, "isUserRequestedEraseEnabled"))return 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v3 = (void *)getAAUIDeviceLocatorServiceClass_softClass;
  v12 = getAAUIDeviceLocatorServiceClass_softClass;
  if (!getAAUIDeviceLocatorServiceClass_softClass)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __getAAUIDeviceLocatorServiceClass_block_invoke;
    v8[3] = &unk_1E200E038;
    v8[4] = &v9;
    __getAAUIDeviceLocatorServiceClass_block_invoke((uint64_t)v8);
    v3 = (void *)v10[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v4, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabled");

  return v6;
}

- (double)_timeUntilUnblockedSinceReferenceDate
{
  double result;

  -[SBFUserAuthenticationController _refreshModelCacheIfNeeded](self, "_refreshModelCacheIfNeeded");
  -[SBFUserAuthenticationModel timeUntilUnblockedSinceReferenceDate](self->_model, "timeUntilUnblockedSinceReferenceDate");
  return result;
}

- (void)_scheduleUnblockTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  PCPersistentTimer *v6;
  PCPersistentTimer *unblockTimer;
  PCPersistentTimer *v8;
  void *v9;
  uint8_t v10[16];

  -[SBFUserAuthenticationController _clearUnblockTimer](self, "_clearUnblockTimer");
  if (-[SBFUserAuthenticationModel isTemporarilyBlocked](self->_model, "isTemporarilyBlocked"))
  {
    SBLogAuthenticationController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Starting temporary blocked timer", v10, 2u);
    }

    v4 = (void *)MEMORY[0x1E0C99D68];
    -[SBFUserAuthenticationModel timeUntilUnblockedSinceReferenceDate](self->_model, "timeUntilUnblockedSinceReferenceDate");
    objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PCPersistentTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70A38]), "initWithFireDate:serviceIdentifier:target:selector:userInfo:", v5, CFSTR("SBUnblockTimer"), self, sel__unblockTimerFired, 0);
    unblockTimer = self->_unblockTimer;
    self->_unblockTimer = v6;

    -[PCPersistentTimer setMinimumEarlyFireProportion:](self->_unblockTimer, "setMinimumEarlyFireProportion:", 1.0);
    v8 = self->_unblockTimer;
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PCPersistentTimer scheduleInRunLoop:](v8, "scheduleInRunLoop:", v9);

  }
}

- (void)_clearUnblockTimer
{
  NSObject *v3;
  PCPersistentTimer *unblockTimer;
  uint8_t v5[16];

  if (self->_unblockTimer)
  {
    SBLogAuthenticationController();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Cleared temporary blocked timer", v5, 2u);
    }

    -[PCPersistentTimer invalidate](self->_unblockTimer, "invalidate");
    unblockTimer = self->_unblockTimer;
    self->_unblockTimer = 0;

  }
}

- (void)_unblockTimerFired
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogAuthenticationController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_18AB69000, v3, OS_LOG_TYPE_DEFAULT, "Temporary blocked timer fired", v4, 2u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBFUserAuthenticationModel refreshBlockedState](self->_model, "refreshBlockedState");
  if (-[SBFUserAuthenticationModel isTemporarilyBlocked](self->_model, "isTemporarilyBlocked"))
    -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
  else
    -[SBFUserAuthenticationController _notifyAboutTemporaryBlockStatusChanged](self, "_notifyAboutTemporaryBlockStatusChanged");
}

- (void)_clearBlockedState
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[SBFUserAuthenticationModel clearBlockedState](self->_model, "clearBlockedState");
    -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
  }
}

- (void)_noteDeviceLockStateMayHaveChangedForExternalReasons
{
  -[SBFUserAuthenticationModel refreshBlockedState](self->_model, "refreshBlockedState");
  -[SBFUserAuthenticationController _notifyAboutTemporaryBlockStatusChanged](self, "_notifyAboutTemporaryBlockStatusChanged");
  -[SBFUserAuthenticationController _scheduleUnblockTimer](self, "_scheduleUnblockTimer");
}

- (void)_updateSecureModeIfNecessaryForNewAuthState
{
  int64_t authenticationState;
  int v4;
  uint64_t v5;

  if (-[SBFAuthenticationPolicy usesSecureMode](self->_policy, "usesSecureMode"))
  {
    authenticationState = self->_authenticationState;
    if (authenticationState != 2)
    {
      v4 = -[BSCompoundAssertion isActive](self->_secureDisplayDeferralAssertions, "isActive");
      if (authenticationState)
        v5 = 0;
      else
        v5 = v4 ^ 1u;
      -[SBFSecureDisplayCoordinator setSecureMode:postNotification:](self->_secureDisplayCoordinator, "setSecureMode:postNotification:", v5, 1);
    }
  }
}

- (NSDate)lastRevokedAuthenticationDate
{
  return self->_lastRevokedAuthenticationDate;
}

- (SBFAuthenticationPolicy)_policy
{
  return self->_policy;
}

- (void)_setPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_policy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureDisplayDeferralAssertions, 0);
  objc_storeStrong((id *)&self->_cachedExtendedState, 0);
  objc_storeStrong((id *)&self->_secureDisplayCoordinator, 0);
  objc_storeStrong((id *)&self->_unblockTimer, 0);
  objc_storeStrong((id *)&self->_transientAuthCheckingAssertion, 0);
  objc_storeStrong((id *)&self->_lastIncorrectPasscodeAttempt, 0);
  objc_storeStrong((id *)&self->_policy, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_lastRevokedAuthenticationDate, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_responders, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
}

- (void)_isUserAuthenticated
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "Runloop cached passcode state determined - not authenticated / revoked", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __68__SBFUserAuthenticationController__setup_runLoopObserverIfNecessary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "Ending runloop cache period.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_setAuthState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "Posting com.apple.springboard.DeviceLockStatusChanged", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_updateAuthenticationStateImmediately:forPublicReason:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0_3(&dword_18AB69000, v0, v1, "Update authentication state - no change necessary.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_revokeAuthenticationImmediately:forPublicReason:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_6();
  _os_log_error_impl(&dword_18AB69000, v0, OS_LOG_TYPE_ERROR, "Revoking authentication but not updating our state because we are already revoked", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_addAsFirstResponder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_3_0(&dword_18AB69000, a2, v5, "Authentication responder added: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1();
}

- (void)_removeAuthResponder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_3_0(&dword_18AB69000, a2, v5, "Authentication responder removed: %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1();
}

@end
