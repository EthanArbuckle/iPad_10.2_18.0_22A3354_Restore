@implementation SBLockScreenBiometricAuthenticationCoordinator

- (void)_walletPreArmDisabledDidChange:(id)a3
{
  const __CFString *v4;

  if (-[SBWalletPreArmController isPreArmSuppressed](self->_walletPreArmController, "isPreArmSuppressed", a3))
    v4 = CFSTR("All wallet pre-arm assertions have been removed");
  else
    v4 = CFSTR("Wallet pre-arm assertions exist");
  -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v4);
}

- (void)_resetStateForReason:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reset because %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBLockScreenBiometricAuthenticationCoordinator isUnlockingDisabled](self, "isUnlockingDisabled");
  if (!-[SBLockScreenBiometricAuthenticationCoordinator isEnabled](self, "isEnabled"))
    goto LABEL_11;
  if (!v6 && -[SBLockScreenBiometricAuthenticationCoordinator _hasActivePasscodeViews](self, "_hasActivePasscodeViews"))
  {
    v7 = 4;
    goto LABEL_12;
  }
  if (-[SBLockScreenBiometricAuthenticationCoordinator _isWalletPreArmAllowed](self, "_isWalletPreArmAllowed"))
  {
    v7 = 2;
    goto LABEL_12;
  }
  if (-[SBUIBiometricResource hasEnrolledIdentities](self->_biometricResource, "hasEnrolledIdentities"))
  {
    if (v6
      || -[SBLockScreenBiometricAuthenticationCoordinator isAutoUnlockingDisabled](self, "isAutoUnlockingDisabled"))
    {
      v7 = 1;
    }
    else
    {
      v7 = 3;
    }
  }
  else
  {
LABEL_11:
    v7 = 0;
  }
LABEL_12:
  -[SBLockScreenBiometricAuthenticationCoordinator _setState:forReason:](self, "_setState:forReason:", v7, v5);
  if (self->_state != v7)
  {
    SBLogLockScreenBiometricCoordinator();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:].cold.1((uint64_t)v4, v8);

  }
}

- (BOOL)isUnlockingDisabled
{
  if (-[NSHashTable count](self->_disabledUnlockAssertions, "count"))
    return 1;
  else
    return -[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self->_biometricResource, "hasBiometricAuthenticationCapabilityEnabled") ^ 1;
}

- (BOOL)isEnabled
{
  return -[NSHashTable count](self->_disabledAssertions, "count") == 0;
}

- (void)_setState:(unint64_t)a3 forReason:(id)a4
{
  id v6;
  unint64_t state;
  NSObject *v8;
  unint64_t v9;
  const __CFString *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    SBLogLockScreenBiometricCoordinator();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_state - 1;
      if (v9 > 3)
        v10 = CFSTR("Disabled");
      else
        v10 = off_1E8EAF9F0[v9];
      v11 = 138543618;
      v12 = v10;
      v13 = 2114;
      v14 = v6;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Mesa state changed to [%{public}@] for reason: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    -[SBLockScreenBiometricAuthenticationCoordinator _updateMatchingForState:forReason:](self, "_updateMatchingForState:forReason:", self->_state, v6);
    -[SBLockScreenBiometricAuthenticationCoordinator _stateChangedFrom:to:](self, "_stateChangedFrom:to:", state, self->_state);
  }

}

- (SBLockScreenBiometricAuthenticationCoordinator)initWithBiometricResource:(id)a3 walletPreArmController:(id)a4
{
  id v8;
  id v9;
  SBLockScreenBiometricAuthenticationCoordinator *v10;
  SBLockScreenBiometricAuthenticationCoordinator *v11;
  NSMutableOrderedSet *v12;
  NSMutableOrderedSet *activePasscodeMatchAssertions;
  uint64_t v14;
  NSHashTable *disabledUnlockAssertions;
  uint64_t v16;
  NSHashTable *disabledAutoUnlockAssertions;
  uint64_t v18;
  NSHashTable *disabledAssertions;
  id v20;
  id v21;
  SBUIBiometricResource *biometricResource;
  id v23;
  id v24;
  void *v25;
  void *v27;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("biometricResource"));

  }
  v28.receiver = self;
  v28.super_class = (Class)SBLockScreenBiometricAuthenticationCoordinator;
  v10 = -[SBLockScreenBiometricAuthenticationCoordinator init](&v28, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_state = 0;
    objc_storeStrong((id *)&v10->_walletPreArmController, a4);
    v12 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    activePasscodeMatchAssertions = v11->_activePasscodeMatchAssertions;
    v11->_activePasscodeMatchAssertions = v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    disabledUnlockAssertions = v11->_disabledUnlockAssertions;
    v11->_disabledUnlockAssertions = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v16 = objc_claimAutoreleasedReturnValue();
    disabledAutoUnlockAssertions = v11->_disabledAutoUnlockAssertions;
    v11->_disabledAutoUnlockAssertions = (NSHashTable *)v16;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v18 = objc_claimAutoreleasedReturnValue();
    disabledAssertions = v11->_disabledAssertions;
    v11->_disabledAssertions = (NSHashTable *)v18;

    v20 = objc_alloc_init(MEMORY[0x1E0D66F08]);
    -[SBLockScreenBiometricAuthenticationCoordinator _setPassLibrary:](v11, "_setPassLibrary:", v20);

    v21 = objc_alloc_init(MEMORY[0x1E0D51960]);
    -[SBLockScreenBiometricAuthenticationCoordinator _setWalletPresentation:](v11, "_setWalletPresentation:", v21);

    objc_storeStrong((id *)&v11->_biometricResource, a3);
    biometricResource = v11->_biometricResource;
    v23 = objc_alloc_init(MEMORY[0x1E0DA9DD8]);
    -[SBUIBiometricResource setUnlockCredentialSet:](biometricResource, "setUnlockCredentialSet:", v23);

    -[SBUIBiometricResource addObserver:](v11->_biometricResource, "addObserver:", v11);
    v24 = +[SBBiometricEventLogger sharedInstance](SBBiometricEventLogger, "sharedInstance");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObserver:selector:name:object:", v11, sel__walletPreArmDisabledDidChange_, CFSTR("SBWalletPreArmControllerPreArmSuppressionDidChange"), v9);

  }
  return v11;
}

- (void)setAuthenticated:(BOOL)a3
{
  unint64_t state;
  void *v5;
  void *v6;
  id v7;

  if (self->_isAuthenticated != a3)
  {
    self->_isAuthenticated = a3;
    -[SBUIBiometricResource _setAuthenticated:](self->_biometricResource, "_setAuthenticated:");
    state = self->_state;
    v5 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromBOOL();
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Authentication state changed (authenticated: %@)"), v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenBiometricAuthenticationCoordinator _updateMatchingForState:forReason:](self, "_updateMatchingForState:forReason:", state, v6);

  }
}

- (id)acquireDisableCoordinatorAssertionForReason:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v6 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __94__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableCoordinatorAssertionForReason___block_invoke;
  v15 = &unk_1E8EA4CC0;
  objc_copyWeak(&v17, &location);
  v7 = v4;
  v16 = v7;
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("DisableCoordinator"), v7, MEMORY[0x1E0C80D38], &v12);

  if (v8)
  {
    SBLogLockScreenBiometricCoordinator();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Added disable wallet pre-arm assertion for reason: %{public}@", buf, 0xCu);
    }

    -[NSHashTable addObject:](self->_disabledAssertions, "addObject:", v8);
    if (self->_state)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Disable coordinator assertion added: %@"), self->_disabledAssertions, v12, v13, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v10);

    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __94__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableCoordinatorAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[18], "removeObject:", v4);

  SBLogLockScreenBiometricCoordinator();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Removed disable coordinator assertion for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (objc_msgSend(WeakRetained, "isEnabled"))
    objc_msgSend(WeakRetained, "_resetStateForReason:", CFSTR("Last disable coordinator assertion removed."));

}

- (id)acquireDisableWalletPreArmAssertionForReason:(id)a3
{
  return -[SBWalletPreArmController acquireSuppressPreArmAssertionForReason:](self->_walletPreArmController, "acquireSuppressPreArmAssertionForReason:", a3);
}

- (BOOL)isWalletPreArmDisabled
{
  return -[SBWalletPreArmController isPreArmSuppressed](self->_walletPreArmController, "isPreArmSuppressed");
}

- (id)acquireDisableUnlockAssertionForReason:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v6 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __89__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableUnlockAssertionForReason___block_invoke;
  v15 = &unk_1E8EA4CC0;
  objc_copyWeak(&v17, &location);
  v7 = v4;
  v16 = v7;
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("DisableUnlockAssertion"), v7, MEMORY[0x1E0C80D38], &v12);

  if (v8)
  {
    SBLogLockScreenBiometricCoordinator();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Added disable Unlock assertion for reason: %{public}@", buf, 0xCu);
    }

    -[NSHashTable addObject:](self->_disabledUnlockAssertions, "addObject:", v8);
    if (self->_state - 3 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unlock was allowed, but now it's disabled for assertions: %@"), self->_disabledUnlockAssertions, v12, v13, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v10);

    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __89__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableUnlockAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[19], "removeObject:", v4);

  SBLogLockScreenBiometricCoordinator();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Removed disable Unlock assertion for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ((objc_msgSend(WeakRetained, "isUnlockingDisabled") & 1) == 0)
    objc_msgSend(WeakRetained, "_resetStateForReason:", CFSTR("Last disable Unlock assertion dropped and current state is unavailable."));

}

- (id)acquireDisableAutoUnlockAssertionForReason:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v6 = MEMORY[0x1E0C80D38];
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __93__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableAutoUnlockAssertionForReason___block_invoke;
  v15 = &unk_1E8EA4CC0;
  objc_copyWeak(&v17, &location);
  v7 = v4;
  v16 = v7;
  v8 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("DisableAutoUnlockAssertion"), v7, MEMORY[0x1E0C80D38], &v12);

  if (v8)
  {
    SBLogLockScreenBiometricCoordinator();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v7;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "Added disable AutoUnlock assertion for reason: %{public}@", buf, 0xCu);
    }

    -[NSHashTable addObject:](self->_disabledAutoUnlockAssertions, "addObject:", v8);
    if (self->_state == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AutoUnlock was allowed, but now it's disabled for assertions: %@"), self->_disabledAutoUnlockAssertions, v12, v13, v14, v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v10);

    }
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __93__SBLockScreenBiometricAuthenticationCoordinator_acquireDisableAutoUnlockAssertionForReason___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id *WeakRetained;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained[20], "removeObject:", v4);

  SBLogLockScreenBiometricCoordinator();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Removed disable AutoUnlock assertion for reason: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if ((objc_msgSend(WeakRetained, "isAutoUnlockingDisabled") & 1) == 0)
    objc_msgSend(WeakRetained, "_resetStateForReason:", CFSTR("Last disable AutoUnlock assertion dropped and current state is unavailable."));

}

- (BOOL)isAutoUnlockingDisabled
{
  return -[SBLockScreenBiometricAuthenticationCoordinator isUnlockingDisabled](self, "isUnlockingDisabled")
      || -[NSHashTable count](self->_disabledAutoUnlockAssertions, "count") != 0;
}

- (void)_noteMenuButtonSinglePress
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenBiometricCoordinator();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Received menu button single press", v4, 2u);
  }

  -[SBLockScreenBiometricAuthenticationCoordinator _setupPreArmRecognizerIfPossibleForReason:](self, "_setupPreArmRecognizerIfPossibleForReason:", CFSTR("MenuButtonSinglePress"));
  -[SBWalletPrearmRecognizer menuButtonSinglePress](self->_walletPrearmRecognizer, "menuButtonSinglePress");
}

- (void)_noteMenuButtonDoublePress
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLockScreenBiometricCoordinator();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Received menu button double press", v4, 2u);
  }

  -[SBLockScreenBiometricAuthenticationCoordinator _setupPreArmRecognizerIfPossibleForReason:](self, "_setupPreArmRecognizerIfPossibleForReason:", CFSTR("MenuButtonDoublePress"));
  -[SBWalletPrearmRecognizer menuButtonDoublePress](self->_walletPrearmRecognizer, "menuButtonDoublePress");
}

- (void)_setPassLibrary:(id)a3
{
  PKPassLibrary *v5;
  PKPassLibrary *passLibrary;
  PKPassLibrary *v7;

  v5 = (PKPassLibrary *)a3;
  passLibrary = self->_passLibrary;
  if (passLibrary != v5)
  {
    v7 = v5;
    -[PKPassLibrary removeDelegate:](passLibrary, "removeDelegate:", self);
    objc_storeStrong((id *)&self->_passLibrary, a3);
    -[PKPassLibrary addDelegate:](self->_passLibrary, "addDelegate:", self);
    v5 = v7;
  }

}

- (NSString)description
{
  return (NSString *)-[SBLockScreenBiometricAuthenticationCoordinator descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenBiometricAuthenticationCoordinator succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBLockScreenBiometricAuthenticationCoordinator descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  SBLockScreenBiometricAuthenticationCoordinator *v17;

  -[SBLockScreenBiometricAuthenticationCoordinator succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = self->_state - 1;
  if (v6 > 3)
    v7 = CFSTR("Disabled");
  else
    v7 = off_1E8EAF9F0[v6];
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("matchingState"));
  v8 = (id)objc_msgSend(v5, "appendObject:withName:", self->_walletPrearmRecognizer, CFSTR("walletPrearmRecognizer"));
  v9 = (id)objc_msgSend(v5, "appendBool:withName:", self->_presentingWalletInterface, CFSTR("isPresentingWalletInterface"));
  v10 = (id)objc_msgSend(v5, "appendObject:withName:", self->_pendingUnlockRequest, CFSTR("pendingUnlockRequest"));
  objc_msgSend(v5, "activeMultilinePrefix");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__SBLockScreenBiometricAuthenticationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke;
  v15[3] = &unk_1E8E9E820;
  v12 = v5;
  v16 = v12;
  v17 = self;
  objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("assertions"), v11, v15);

  v13 = v12;
  return v13;
}

void __88__SBLockScreenBiometricAuthenticationCoordinator_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 144), "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendArraySection:withName:skipIfEmpty:", v3, CFSTR("disableCoordinatorAssertions"), 1);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 152), "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendArraySection:withName:skipIfEmpty:", v5, CFSTR("disableUnlockAssertions"), 1);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 160), "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendArraySection:withName:skipIfEmpty:", v7, CFSTR("disableAutoUnlockAssertions"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 136), "array");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendArraySection:withName:skipIfEmpty:", v9, CFSTR("passcodeMatchAssertions"), 1);

}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  __CFString **v10;
  SBLockScreenBiometricAuthenticationCoordinator *v11;
  uint64_t v12;
  unint64_t state;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  unint64_t v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  _QWORD v21[5];
  uint8_t buf[16];

  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      SBLogLockScreenBiometricCoordinator();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Finger off", buf, 2u);
      }
      goto LABEL_19;
    case 1uLL:
      SBLogLockScreenBiometricCoordinator();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Finger on", buf, 2u);
      }

      -[SBLockScreenBiometricAuthenticationCoordinator _setupPreArmRecognizerIfPossibleForReason:](self, "_setupPreArmRecognizerIfPossibleForReason:", CFSTR("Finger On"));
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v9;
      v10 = SBBiometricEventTimestampNotificationFingerOn;
      goto LABEL_18;
    case 3uLL:
      state = self->_state;
      if (state != 2)
      {
        v17 = state - 3;
        SBLogLockScreenBiometricCoordinator();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        if (v17 > 1)
        {
          if (v19)
          {
            *(_WORD *)buf = 0;
            v20 = "Identity match - likely to be consumed by someone else (ie. wallet) because we aren't looking for it.";
            goto LABEL_25;
          }
        }
        else if (v19)
        {
          *(_WORD *)buf = 0;
          v20 = "Identity match received while waiting for unlock.";
LABEL_25:
          _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, v20, buf, 2u);
        }

        goto LABEL_27;
      }
      if (self->_walletPrearmRecognizer || self->_presentingWalletInterface)
      {
        SBLogLockScreenBiometricCoordinator();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Identity match - while wallet pre-arm recognizer active", buf, 2u);
        }

        self->_didMatchBeforeWalletPrearmRecognizerTimeout = 1;
      }
      else if (!-[SBLockScreenBiometricAuthenticationCoordinator isAutoUnlockingDisabled](self, "isAutoUnlockingDisabled"))
      {
        -[SBLockScreenBiometricAuthenticationCoordinator _setState:forReason:](self, "_setState:forReason:", 3, CFSTR("Identity match - with no wallet pre-arm recognizer active and not presenting wallet UI"));
      }
LABEL_27:
      v11 = self;
      v12 = 1;
LABEL_28:
      -[SBLockScreenBiometricAuthenticationCoordinator _handleIdentityMatchSuccess:](v11, "_handleIdentityMatchSuccess:", v12);
LABEL_29:
      -[SBBiometricUnlockBehavior handleBiometricEvent:](self->_autoUnlockBehavior, "handleBiometricEvent:", a4);

      return;
    case 4uLL:
      SBLogLockScreenBiometricCoordinator();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "Bio unlock", buf, 2u);
      }

      self->_bioAuthenticatedWhileMenuButtonDown = 1;
      objc_msgSend((id)SBApp, "homeHardwareButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __81__SBLockScreenBiometricAuthenticationCoordinator_biometricResource_observeEvent___block_invoke;
      v21[3] = &unk_1E8E9DED8;
      v21[4] = self;
      objc_msgSend(v16, "performWhenMenuButtonIsUpUsingBlock:", v21);

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v9 = objc_claimAutoreleasedReturnValue();
      v7 = v9;
      v10 = SBBiometricEventTimestampNotificationKeybagUnlock;
LABEL_18:
      -[NSObject postNotificationName:object:](v9, "postNotificationName:object:", *v10, 0);
LABEL_19:

      goto LABEL_29;
    default:
      if ((a4 & 0xFFFFFFFFFFFFFFFELL) != 0xA)
        goto LABEL_29;
      v11 = self;
      v12 = 0;
      goto LABEL_28;
  }
}

uint64_t __81__SBLockScreenBiometricAuthenticationCoordinator_biometricResource_observeEvent___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 121) = 0;
  return result;
}

- (void)biometricResource:(id)a3 matchingAllowedDidChange:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  SBLogLockScreenBiometricCoordinator();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = CFSTR("NotAllowed");
    if (v4)
      v7 = CFSTR("Allowed");
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Biometric resource matching allowed did change to %{public}@", (uint8_t *)&v8, 0xCu);
  }

  if (v4 && self->_state <= 1)
  {
    -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", CFSTR("Biometric event monitor matching is now allowed."));
    -[SBUIBiometricResource refreshMatchMode](self->_biometricResource, "refreshMatchMode");
  }
}

- (void)walletPrearmRecognizerDidRecognize:(id)a3
{
  SBWalletPrearmRecognizer *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  v5 = (SBWalletPrearmRecognizer *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 466, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognizer"));

  }
  if (self->_walletPrearmRecognizer == v5)
  {
    if (self->_presentingWalletInterface)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 469, CFSTR("We should never be presenting the wallet interface when a pre-arm recognizer recognizes."));

    }
    if (self->_state != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 470, CFSTR("We must be in the pre-arm state to receive this message"));

    }
    SBLogLockScreenBiometricCoordinator();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Presenting wallet UI", buf, 2u);
    }

    self->_presentingWalletInterface = 1;
    -[NFWalletPresentation present](self->_walletPresentation, "present");
    -[SBLockScreenBiometricAuthenticationCoordinator _invalidateWalletPreArmRecognizer](self, "_invalidateWalletPreArmRecognizer");
  }

}

- (void)walletPrearmRecognizer:(id)a3 didFailToRecognizeForReason:(unint64_t)a4
{
  SBWalletPrearmRecognizer *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBWalletPrearmRecognizer *v13;

  v7 = (SBWalletPrearmRecognizer *)a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recognizer"));

    v7 = 0;
  }
  if (self->_walletPrearmRecognizer == v7)
  {
    v13 = v7;
    if (self->_presentingWalletInterface)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 486, CFSTR("We should never be presenting the wallet interface when a pre-arm recognizer fails."));

    }
    if (self->_state != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 487, CFSTR("We must be in the pre-arm state to receive this message"));

    }
    NSStringFromWalletPrearmFailureRecognitionReason(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[SBLockScreenBiometricAuthenticationCoordinator isAutoUnlockingDisabled](self, "isAutoUnlockingDisabled")
      && (self->_didMatchBeforeWalletPrearmRecognizerTimeout
       || -[SBUIBiometricResource isFingerOn](self->_biometricResource, "isFingerOn")))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallet pre-arm failed to recognize for reason %@ but we matched before it failed to recognize or the finger is still on the sensor"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenBiometricAuthenticationCoordinator _setState:forReason:](self, "_setState:forReason:", 3, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Wallet pre-arm failed to recognize for reason %@ - bioAutoUnlockingDisabledReasons: %@"), v8, self->_disabledAutoUnlockAssertions);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v9);
    }

    -[SBLockScreenBiometricAuthenticationCoordinator _invalidateWalletPreArmRecognizer](self, "_invalidateWalletPreArmRecognizer");
    v7 = v13;
  }

}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsFeedback:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id WeakRetained;
  int v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 507, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("behavior"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 508, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("feedback"));

LABEL_3:
  SBLogLockScreenBiometricCoordinator();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "succinctDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v11;
    v22 = 2114;
    v23 = v9;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "Unlock behavior (%{public}@) requests feedback: %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = objc_msgSend(WeakRetained, "biometricAuthenticationCoordinator:requestsAuthenticationFeedback:", self, v9);

  SBLogLockScreenBiometricCoordinator();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      v16 = "Feedback request handled successfully.";
LABEL_10:
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, v16, buf, 2u);
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    v16 = "Feedback request was dropped and unhandled.";
    goto LABEL_10;
  }

  return v13;
}

- (BOOL)biometricUnlockBehavior:(id)a3 requestsUnlock:(id)a4 withFeedback:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  SBDiagnosticRequestAlertItem *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  SBDiagnosticRequestAlertItem *v25;
  uint64_t v26;
  unint64_t state;
  NSObject *v28;
  SBLockScreenBiometricAuthenticationCoordinator *v29;
  _SBPendingMesaUnlockBehaviorUnlockRequest *v30;
  void *v31;
  NSObject *v32;
  SBLockScreenBiometricAuthenticationCoordinator *v33;
  BOOL v34;
  NSObject *v35;
  SBLockScreenBiometricAuthenticationCoordinator *v36;
  id WeakRetained;
  int v38;
  _BOOL4 v39;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  SBDiagnosticRequestAlertItem *v45;
  _QWORD v46[4];
  id v47;
  const __CFString *v48;
  uint64_t v49;
  uint8_t buf[4];
  SBLockScreenBiometricAuthenticationCoordinator *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("behavior"));

    if (v10)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("request"));

LABEL_3:
  if (-[SBLockScreenBiometricAuthenticationCoordinator _isMatchingEffectivelyDisabled](self, "_isMatchingEffectivelyDisabled"))
  {
    if ((-[SBUIBiometricResource hasPearlSupport](self->_biometricResource, "hasPearlSupport") & 1) != 0
      || (+[SBPlatformController sharedInstance](SBPlatformController, "sharedInstance"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "isInternalInstall"),
          v12,
          !v13))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 558, CFSTR("We shouldn't be getting unlock requests when matching is effectively disabled."));

LABEL_31:
      v34 = 0;
      goto LABEL_32;
    }
    SBLogLockScreenBiometricCoordinator();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v51 = self;
      v52 = 2114;
      v53 = v9;
      v54 = 2114;
      v55 = v10;
      v56 = 2114;
      v57 = v11;
      _os_log_error_impl(&dword_1D0540000, v14, OS_LOG_TYPE_ERROR, "We saw an unlock request when matching is effectively disabled, requesting diagnostics.\nself: %{public}@, behavior: %{public}@, request: %{public}@, feedback: %{public}@", buf, 0x2Au);
    }

    -[SBLockScreenBiometricAuthenticationCoordinator acquireDisableUnlockAssertionForReason:](self, "acquireDisableUnlockAssertionForReason:", CFSTR("Disagnostic reporting"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc_init(SBDiagnosticRequestAlertItem);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("RADAR_REQUEST_MESSAGE_BODY_HOME_BUTTON"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem setMessage:](v16, "setMessage:", v18);

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("RADAR_REQUEST_TITLE"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDiagnosticRequestAlertItem setTitle:](v16, "setTitle:", v20);

    v21 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke;
    v46[3] = &unk_1E8E9DED8;
    v47 = v15;
    v22 = v15;
    -[SBDiagnosticRequestAlertItem setCompletionBlock:](v16, "setCompletionBlock:", v46);
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = CFSTR("SBUILockOptionsUseScreenOffModeKey");
    v49 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v21;
    v44[1] = 3221225472;
    v44[2] = __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke_2;
    v44[3] = &unk_1E8E9E980;
    v45 = v16;
    v25 = v16;
    objc_msgSend(v23, "lockUIFromSource:withOptions:completion:", 1, v24, v44);

LABEL_30:
    goto LABEL_31;
  }
  v26 = objc_msgSend(v10, "intent");
  if ((v26 & 0xFFFFFFFE) == 2)
  {
    state = self->_state;
    if (state == 2)
    {
      SBLogLockScreenBiometricCoordinator();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "succinctDescription");
        v29 = (SBLockScreenBiometricAuthenticationCoordinator *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v51 = v29;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_INFO, "Unlock behavior (%{public}@) requests unlock attempt but we can't handle it right now because we're matching for PreArm.", buf, 0xCu);

      }
      v30 = -[_SBPendingMesaUnlockBehaviorUnlockRequest initWithBehavior:request:feedback:]([_SBPendingMesaUnlockBehaviorUnlockRequest alloc], "initWithBehavior:request:feedback:", v9, v10, v11);
      -[SBLockScreenBiometricAuthenticationCoordinator _pendUnlockRequest:](self, "_pendUnlockRequest:", v30);

    }
    else
    {
      if (state - 3 >= 2)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 574, CFSTR("We must be in an state allowing unlocks to request an unlock."));

      }
      SBLogLockScreenBiometricCoordinator();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v9, "succinctDescription");
        v36 = (SBLockScreenBiometricAuthenticationCoordinator *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        v52 = 2112;
        v53 = v10;
        _os_log_impl(&dword_1D0540000, v35, OS_LOG_TYPE_INFO, "Unlock behavior (%{public}@) requests unlock attempt: %@", buf, 0x16u);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v38 = objc_msgSend(WeakRetained, "biometricAuthenticationCoordinator:requestsUnlockWithIntent:", self, v26);

      SBLogLockScreenBiometricCoordinator();
      v22 = objc_claimAutoreleasedReturnValue();
      v39 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (!v38)
      {
        if (v39)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "Unlock request failed.", buf, 2u);
        }
        goto LABEL_30;
      }
      if (v39)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "Unlock request succeeded.", buf, 2u);
      }

      if (v11)
        -[SBLockScreenBiometricAuthenticationCoordinator biometricUnlockBehavior:requestsFeedback:](self, "biometricUnlockBehavior:requestsFeedback:", v9, v11);
    }
  }
  else
  {
    SBLogLockScreenBiometricCoordinator();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v9, "succinctDescription");
      v33 = (SBLockScreenBiometricAuthenticationCoordinator *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v33;
      v52 = 1024;
      LODWORD(v53) = v26;
      _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_INFO, "Denied unlock request from behavior (%{public}@) because it specifies unhandled intent: %d", buf, 0x12u);

    }
  }
  v34 = 1;
LABEL_32:

  return v34;
}

uint64_t __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __102__SBLockScreenBiometricAuthenticationCoordinator_biometricUnlockBehavior_requestsUnlock_withFeedback___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(MEMORY[0x1E0DAC210], "activateAlertItem:", *(_QWORD *)(result + 32));
  return result;
}

- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = objc_alloc(MEMORY[0x1E0DAC708]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __90__SBLockScreenBiometricAuthenticationCoordinator_acquireMatchingAssertionWithMode_reason___block_invoke;
  v13 = &unk_1E8E9E468;
  objc_copyWeak(&v14, &location);
  v8 = (void *)objc_msgSend(v7, "initWithMatchMode:reason:invalidationBlock:", a3, v6, &v10);
  if (v8)
    -[SBLockScreenBiometricAuthenticationCoordinator _addPasscodeMatchingAssertion:](self, "_addPasscodeMatchingAssertion:", v8, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __90__SBLockScreenBiometricAuthenticationCoordinator_acquireMatchingAssertionWithMode_reason___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id WeakRetained;
  id v8;

  v3 = a2;
  v4 = objc_opt_class();
  v8 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v8;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_removePasscodeMatchingAssertion:", v6);

}

- (void)passLibraryReceivedInterruption
{
  BSDispatchMain();
}

uint64_t __81__SBLockScreenBiometricAuthenticationCoordinator_passLibraryReceivedInterruption__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePassKitDismissalIfNecessaryWithReason:", CFSTR("service-interruption"));
}

- (void)contactlessInterfaceDidDismissFromSource:(int64_t)a3
{
  BSDispatchMain();
}

void __91__SBLockScreenBiometricAuthenticationCoordinator_contactlessInterfaceDidDismissFromSource___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("source: %d"), *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_handlePassKitDismissalIfNecessaryWithReason:", v2);

}

- (void)_handleIdentityMatchSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  NSTimer *matchingAssertionInvalidationTimer;

  v3 = a3;
  self->_matchedWithResult = 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "biometricAuthenticationCoordinator:handleIdentityMatchSuccess:", self, v3);

  -[NSTimer fire](self->_matchingAssertionInvalidationTimer, "fire");
  matchingAssertionInvalidationTimer = self->_matchingAssertionInvalidationTimer;
  self->_matchingAssertionInvalidationTimer = 0;

}

- (void)_updateMatchingForState:(unint64_t)a3 forReason:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void (**v13)(_QWORD);
  NSObject *v14;
  NSTimer *matchingAssertionInvalidationTimer;
  NSObject *v16;
  void *v17;
  NSTimer *v18;
  NSTimer *v19;
  _QWORD v20[5];
  void (**v21)(_QWORD);
  _QWORD v22[6];
  uint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v23 = 0;
  -[SBLockScreenBiometricAuthenticationCoordinator _stateWantsMatching:outMatchMode:](self, "_stateWantsMatching:outMatchMode:", self->_state, &v23);
  SBLogLockScreenBiometricCoordinator();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSBUIBiometricMatchMode();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v7;
    v26 = 2114;
    v27 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "Mesa matching mode changed to [%{public}@] for reason: %{public}@", buf, 0x16u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(WeakRetained, "biometricAuthenticationCoordinatorShouldWaitToInvalidateMatchingAssertion:", self);

  v10 = v23;
  if (v23 != self->_matchingWantedAssertionMode || !self->_matchingWantedAssertion)
  {
    if (v23)
    {
      v11 = 0;
    }
    else if (v9 && !self->_matchedWithResult)
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      -[BSInvalidatable invalidate](self->_matchingWantedAssertion, "invalidate");
      v11 = 0;
      v10 = v23;
    }
    v12 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke;
    v22[3] = &unk_1E8E9DE88;
    v22[4] = self;
    v22[5] = v10;
    v13 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v22);
    if (self->_matchingAssertionInvalidationTimer)
    {
      SBLogLockScreenBiometricCoordinator();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Clearing obsolete assertion invalidation timer", buf, 2u);
      }

      -[NSTimer invalidate](self->_matchingAssertionInvalidationTimer, "invalidate");
      matchingAssertionInvalidationTimer = self->_matchingAssertionInvalidationTimer;
      self->_matchingAssertionInvalidationTimer = 0;

    }
    if (v11)
    {
      SBLogLockScreenBiometricCoordinator();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "Creating assertion invalidation timer", buf, 2u);
      }

      v17 = (void *)MEMORY[0x1E0C99E88];
      v20[0] = v12;
      v20[1] = 3221225472;
      v20[2] = __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke_157;
      v20[3] = &unk_1E8EA0EE0;
      v20[4] = self;
      v21 = v13;
      objc_msgSend(v17, "scheduledTimerWithTimeInterval:repeats:block:", 0, v20, 1.5);
      v18 = (NSTimer *)objc_claimAutoreleasedReturnValue();
      v19 = self->_matchingAssertionInvalidationTimer;
      self->_matchingAssertionInvalidationTimer = v18;

    }
    else
    {
      v13[2](v13);
    }

  }
}

void __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v2 + 8);
  v10 = *(id *)(v2 + 96);
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acquireMatchingAssertionWithMode:reason:", v3, v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(v8 + 96);
  *(_QWORD *)(v8 + 96) = v7;

  objc_msgSend(v10, "invalidate");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) = *(_QWORD *)(a1 + 40);

}

uint64_t __84__SBLockScreenBiometricAuthenticationCoordinator__updateMatchingForState_forReason___block_invoke_157(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  id WeakRetained;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 120))
  {
    SBLogLockScreenBiometricCoordinator();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Matching assertion invalidation timer fired before matched with result: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
    objc_msgSend(WeakRetained, "biometricAuthenticationCoordinator:handleIdentityMatchSuccess:", *(_QWORD *)(a1 + 32), 0);

    v2 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend(*(id *)(v2 + 96), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_stateChangedFrom:(unint64_t)a3 to:(unint64_t)a4
{
  SBLockScreenBiometricAuthenticationCoordinator *v6;
  uint64_t v7;
  NSObject *v8;
  _SBPendingMesaUnlockBehaviorUnlockRequest *pendingUnlockRequest;
  _SBPendingMesaUnlockBehaviorUnlockRequest *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  _SBPendingMesaUnlockBehaviorUnlockRequest *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 - 3 < 2)
  {
    -[SBLockScreenBiometricAuthenticationCoordinator _clearPendingUnlockRequest](self, "_clearPendingUnlockRequest");
  }
  else if (a3)
  {
    if (a3 == 2)
    {
      -[SBLockScreenBiometricAuthenticationCoordinator _invalidateWalletPreArmRecognizer](self, "_invalidateWalletPreArmRecognizer");
      -[SBLockScreenBiometricAuthenticationCoordinator _handlePassKitDismissalIfNecessaryWithReason:](self, "_handlePassKitDismissalIfNecessaryWithReason:", CFSTR("Cleanup making sure the UI is actually dismissed."));
    }
  }
  else
  {
    -[SBLockScreenBiometricAuthenticationCoordinator _createFingerDetectAssertion](self, "_createFingerDetectAssertion");
  }
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      -[SBLockScreenBiometricAuthenticationCoordinator _clearPendingUnlockRequest](self, "_clearPendingUnlockRequest");
      -[SBLockScreenBiometricAuthenticationCoordinator _toggleAutoUnlockBehaviorEnabled:](self, "_toggleAutoUnlockBehaviorEnabled:", 0);
      if (!a4)
        -[SBLockScreenBiometricAuthenticationCoordinator _clearFingerDetectAssertion](self, "_clearFingerDetectAssertion");
      break;
    case 2uLL:
      v6 = self;
      v7 = 1;
      goto LABEL_17;
    case 3uLL:
      -[SBLockScreenBiometricAuthenticationCoordinator _toggleAutoUnlockBehaviorEnabled:](self, "_toggleAutoUnlockBehaviorEnabled:", 1);
      if (self->_pendingUnlockRequest)
      {
        SBLogLockScreenBiometricCoordinator();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          pendingUnlockRequest = self->_pendingUnlockRequest;
          v14 = 138412290;
          v15 = pendingUnlockRequest;
          _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Replaying pending unlock request because now we're available for match unlocks: %@", (uint8_t *)&v14, 0xCu);
        }

        v10 = self->_pendingUnlockRequest;
        -[SBLockScreenBiometricAuthenticationCoordinator _clearPendingUnlockRequest](self, "_clearPendingUnlockRequest");
        -[_SBPendingMesaUnlockBehaviorUnlockRequest behavior](v10, "behavior");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SBPendingMesaUnlockBehaviorUnlockRequest request](v10, "request");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SBPendingMesaUnlockBehaviorUnlockRequest feedback](v10, "feedback");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBLockScreenBiometricAuthenticationCoordinator biometricUnlockBehavior:requestsUnlock:withFeedback:](self, "biometricUnlockBehavior:requestsUnlock:withFeedback:", v11, v12, v13);

      }
      break;
    case 4uLL:
      v6 = self;
      v7 = 0;
LABEL_17:
      -[SBLockScreenBiometricAuthenticationCoordinator _toggleAutoUnlockBehaviorEnabled:](v6, "_toggleAutoUnlockBehaviorEnabled:", v7);
      break;
    default:
      return;
  }
}

- (void)_setupPreArmRecognizerIfPossibleForReason:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  SBWalletPrearmRecognizer *v7;
  SBWalletPrearmRecognizer *walletPrearmRecognizer;
  NSObject *v9;

  v4 = a3;
  v5 = self->_state & 0xFFFFFFFFFFFFFFFELL;
  if (-[SBLockScreenBiometricAuthenticationCoordinator _isWalletPreArmAllowed](self, "_isWalletPreArmAllowed")
    && v5 == 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - starting recognition for wallet pre-arm"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenBiometricAuthenticationCoordinator _setState:forReason:](self, "_setState:forReason:", 2, v6);

    if (!self->_walletPrearmRecognizer && !self->_presentingWalletInterface)
    {
      v7 = -[SBWalletPrearmRecognizer initWithDelegate:]([SBWalletPrearmRecognizer alloc], "initWithDelegate:", self);
      walletPrearmRecognizer = self->_walletPrearmRecognizer;
      self->_walletPrearmRecognizer = v7;

      -[SBWalletPrearmRecognizer startRecognizing](self->_walletPrearmRecognizer, "startRecognizing");
    }
  }
  else
  {
    SBLogLockScreenBiometricCoordinator();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SBLockScreenBiometricAuthenticationCoordinator _setupPreArmRecognizerIfPossibleForReason:].cold.1(self, v5 == 2, v9);

  }
}

- (void)_pendUnlockRequest:(id)a3
{
  _SBPendingMesaUnlockBehaviorUnlockRequest *v6;
  NSObject *v7;
  dispatch_time_t v8;
  void *v9;
  _QWORD block[5];
  _SBPendingMesaUnlockBehaviorUnlockRequest *v11;
  uint8_t buf[4];
  _SBPendingMesaUnlockBehaviorUnlockRequest *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (_SBPendingMesaUnlockBehaviorUnlockRequest *)a3;
  if (self->_state != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 786, CFSTR("We only support pending while in a pre-arm state at this time (currentState: %d)."), self->_state);

  }
  if (self->_pendingUnlockRequest != v6)
  {
    objc_storeStrong((id *)&self->_pendingUnlockRequest, a3);
    SBLogLockScreenBiometricCoordinator();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "Pended unlock request: %@", buf, 0xCu);
    }

    v8 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __69__SBLockScreenBiometricAuthenticationCoordinator__pendUnlockRequest___block_invoke;
    block[3] = &unk_1E8E9E820;
    block[4] = self;
    v11 = v6;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __69__SBLockScreenBiometricAuthenticationCoordinator__pendUnlockRequest___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 128) == *(_QWORD *)(result + 40))
  {
    v1 = result;
    SBLogLockScreenBiometricCoordinator();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(*(_QWORD *)(v1 + 32) + 128);
      v4 = 138412290;
      v5 = v3;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Dropping pended unlock request because it expired: %@", (uint8_t *)&v4, 0xCu);
    }

    return objc_msgSend(*(id *)(v1 + 32), "_clearPendingUnlockRequest");
  }
  return result;
}

- (void)_toggleAutoUnlockBehaviorEnabled:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  int v7;
  NSObject *v8;
  SBBiometricUnlockBehavior *autoUnlockBehavior;
  SBLockScreenBiometricAuthenticationCoordinator *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a3;
  -[SBBiometricUnlockBehavior biometricUnlockBehaviorDelegate](self->_autoUnlockBehavior, "biometricUnlockBehaviorDelegate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = !v3;
  if (v3 && !v5)
  {
    SBLogLockScreenBiometricCoordinator();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Enabling auto unlock behavior based on current state.", buf, 2u);
    }

    autoUnlockBehavior = self->_autoUnlockBehavior;
    v10 = self;
LABEL_12:
    -[SBBiometricUnlockBehavior setBiometricUnlockBehaviorDelegate:](autoUnlockBehavior, "setBiometricUnlockBehaviorDelegate:", v10);
    goto LABEL_13;
  }
  if (!v5)
    v7 = 0;
  if (v7 == 1)
  {
    SBLogLockScreenBiometricCoordinator();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Disabling auto unlock behavior based on current state.", v12, 2u);
    }

    autoUnlockBehavior = self->_autoUnlockBehavior;
    v10 = 0;
    goto LABEL_12;
  }
LABEL_13:

}

- (void)_clearPendingUnlockRequest
{
  _SBPendingMesaUnlockBehaviorUnlockRequest *pendingUnlockRequest;

  pendingUnlockRequest = self->_pendingUnlockRequest;
  self->_pendingUnlockRequest = 0;

}

- (void)_invalidateWalletPreArmRecognizer
{
  SBWalletPrearmRecognizer *walletPrearmRecognizer;

  self->_didMatchBeforeWalletPrearmRecognizerTimeout = 0;
  -[SBWalletPrearmRecognizer invalidate](self->_walletPrearmRecognizer, "invalidate");
  walletPrearmRecognizer = self->_walletPrearmRecognizer;
  self->_walletPrearmRecognizer = 0;

}

- (BOOL)_stateWantsMatching:(unint64_t)a3 outMatchMode:(unint64_t *)a4
{
  int v6;
  unint64_t v7;
  void *v8;

  switch(a3)
  {
    case 4uLL:
      if (self->_isAuthenticated)
      {
        v7 = 0;
      }
      else
      {
        -[NSMutableOrderedSet lastObject](self->_activePasscodeMatchAssertions, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v8, "matchMode");

      }
      goto LABEL_16;
    case 3uLL:
      if (self->_isAuthenticated)
        v7 = 0;
      else
        v7 = 3;
LABEL_16:
      LOBYTE(v6) = 1;
      break;
    case 2uLL:
      v6 = -[SBUIBiometricResource hasEnrolledIdentities](self->_biometricResource, "hasEnrolledIdentities");
      if (v6)
      {
        LOBYTE(v6) = 1;
        if (self->_isAuthenticated)
          v7 = 2;
        else
          v7 = 1;
      }
      else
      {
        v7 = 0;
      }
      break;
    default:
      v7 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  if (a4)
    *a4 = v7;
  return v6;
}

- (BOOL)_isMatchingEffectivelyDisabled
{
  return !-[SBLockScreenBiometricAuthenticationCoordinator _stateWantsMatching:outMatchMode:](self, "_stateWantsMatching:outMatchMode:", self->_state, 0);
}

- (BOOL)_hasActivePasscodeViews
{
  return -[NSMutableOrderedSet count](self->_activePasscodeMatchAssertions, "count") != 0;
}

- (void)_addPasscodeMatchingAssertion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 875, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

    v5 = 0;
  }
  -[NSMutableOrderedSet addObject:](self->_activePasscodeMatchAssertions, "addObject:", v5);
  if (!-[SBLockScreenBiometricAuthenticationCoordinator isUnlockingDisabled](self, "isUnlockingDisabled"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Passcode view is active and wants matching: %@"), v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v6);

  }
  -[SBLockScreenBiometricAuthenticationCoordinator _updateMatchingForState:forReason:](self, "_updateMatchingForState:forReason:", self->_state, CFSTR("Passcode frontmost added."));
  -[SBUIBiometricResource resumeMatchingForAssertion:advisory:](self->_biometricResource, "resumeMatchingForAssertion:advisory:", self->_matchingWantedAssertion, 0);

}

- (void)_removePasscodeMatchingAssertion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLockScreenBiometricAuthenticationCoordinator.m"), 888, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

    v5 = 0;
  }
  -[NSMutableOrderedSet removeObject:](self->_activePasscodeMatchAssertions, "removeObject:", v5);
  if (!-[SBLockScreenBiometricAuthenticationCoordinator _hasActivePasscodeViews](self, "_hasActivePasscodeViews")
    && self->_state == 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("last passcode view matching wanted assertion relinquished: %@"), v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v6);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("SBBiometricEventTimestampNotificationPasscodeCancelled"), self);

  }
  -[SBLockScreenBiometricAuthenticationCoordinator _updateMatchingForState:forReason:](self, "_updateMatchingForState:forReason:", self->_state, CFSTR("Passcode frontmost removed."));

}

- (BOOL)_isWalletPreArmAllowed
{
  BOOL v3;
  BOOL v4;

  v3 = -[SBWalletPreArmController isPreArmSuppressed](self->_walletPreArmController, "isPreArmSuppressed");
  v4 = -[SBWalletPreArmController isPreArmTriggeredByHomeButtonDoublePress](self->_walletPreArmController, "isPreArmTriggeredByHomeButtonDoublePress");
  return -[SBWalletPreArmController isPreArmAvailable](self->_walletPreArmController, "isPreArmAvailable") && v4 && !v3;
}

- (void)_handlePassKitDismissalIfNecessaryWithReason:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (self->_presentingWalletInterface)
  {
    self->_presentingWalletInterface = 0;
    v6 = v4;
    -[SBLockScreenBiometricAuthenticationCoordinator _invalidateWalletPreArmRecognizer](self, "_invalidateWalletPreArmRecognizer");
    v4 = v6;
    if (self->_state == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("wallet UI dismissed with reason: %@"), v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenBiometricAuthenticationCoordinator _resetStateForReason:](self, "_resetStateForReason:", v5);
      -[SBUIBiometricResource refreshMatchMode](self->_biometricResource, "refreshMatchMode");

      v4 = v6;
    }
  }

}

- (void)_createFingerDetectAssertion
{
  BSInvalidatable *v3;
  BSInvalidatable *fingerDetectEnabledAssertion;

  if (!self->_fingerDetectEnabledAssertion)
  {
    -[SBUIBiometricResource acquireFingerDetectionWantedAssertionForReason:](self->_biometricResource, "acquireFingerDetectionWantedAssertionForReason:", CFSTR("MesaCoordinatorEnabled"));
    v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    fingerDetectEnabledAssertion = self->_fingerDetectEnabledAssertion;
    self->_fingerDetectEnabledAssertion = v3;

  }
}

- (void)_clearFingerDetectAssertion
{
  BSInvalidatable *fingerDetectEnabledAssertion;
  BSInvalidatable *v4;

  fingerDetectEnabledAssertion = self->_fingerDetectEnabledAssertion;
  if (fingerDetectEnabledAssertion)
  {
    -[BSInvalidatable invalidate](fingerDetectEnabledAssertion, "invalidate");
    v4 = self->_fingerDetectEnabledAssertion;
    self->_fingerDetectEnabledAssertion = 0;

  }
}

- (SBLockScreenBiometricAuthenticationCoordinatorDelegate)delegate
{
  return (SBLockScreenBiometricAuthenticationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)bioAuthenticatedWhileMenuButtonDown
{
  return self->_bioAuthenticatedWhileMenuButtonDown;
}

- (void)setBioAuthenticatedWhileMenuButtonDown:(BOOL)a3
{
  self->_bioAuthenticatedWhileMenuButtonDown = a3;
}

- (BOOL)isAuthenticated
{
  return self->_isAuthenticated;
}

- (SBBiometricUnlockBehavior)_setAutoUnlockBehavior
{
  return self->_autoUnlockBehavior;
}

- (void)_setAutoUnlockBehavior:(id)a3
{
  objc_storeStrong((id *)&self->_autoUnlockBehavior, a3);
}

- (SBWalletPrearmRecognizer)_walletPrearmRecognizer
{
  return self->_walletPrearmRecognizer;
}

- (unint64_t)_state
{
  return self->_state;
}

- (NFWalletPresentation)_getWalletPresentation
{
  return self->_walletPresentation;
}

- (void)_setWalletPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_walletPresentation, a3);
}

- (PKPassLibrary)_getPassLibrary
{
  return self->_passLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledAutoUnlockAssertions, 0);
  objc_storeStrong((id *)&self->_disabledUnlockAssertions, 0);
  objc_storeStrong((id *)&self->_disabledAssertions, 0);
  objc_storeStrong((id *)&self->_activePasscodeMatchAssertions, 0);
  objc_storeStrong((id *)&self->_pendingUnlockRequest, 0);
  objc_storeStrong((id *)&self->_matchingAssertionInvalidationTimer, 0);
  objc_storeStrong((id *)&self->_matchingWantedAssertion, 0);
  objc_storeStrong((id *)&self->_walletPresentation, 0);
  objc_storeStrong((id *)&self->_passLibrary, 0);
  objc_storeStrong((id *)&self->_walletPrearmRecognizer, 0);
  objc_storeStrong((id *)&self->_walletPreArmController, 0);
  objc_storeStrong((id *)&self->_autoUnlockBehavior, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fingerDetectEnabledAssertion, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
}

- (void)_resetStateForReason:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Ignoring reset request because state wouldn't change for reason: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_setupPreArmRecognizerIfPossibleForReason:(NSObject *)a3 .cold.1(void *a1, char a2, NSObject *a3)
{
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v5[0] = 67109376;
  v5[1] = objc_msgSend(a1, "_isWalletPreArmAllowed");
  v6 = 1024;
  v7 = a2 & 1;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Not starting pre-arm recognizer because isWalletPreArmAllowed: %d, canTransitionToPreArm: %d", (uint8_t *)v5, 0xEu);
}

@end
