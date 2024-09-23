@implementation SBUIBiometricResource

- (BOOL)hasBiometricAuthenticationCapabilityEnabled
{
  if (-[SBFMobileKeyBag hasPasscodeSet](self->_keybag, "hasPasscodeSet")
    && -[SBUIBiometricResource hasEnrolledIdentities](self, "hasEnrolledIdentities"))
  {
    return -[MCProfileConnection isFingerprintUnlockAllowed](self->_profileConnection, "isFingerprintUnlockAllowed");
  }
  else
  {
    return 0;
  }
}

+ (SBUIBiometricResource)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_32);
  return (SBUIBiometricResource *)(id)sharedInstance___sharedInstance_1;
}

void __39__SBUIBiometricResource_sharedInstance__block_invoke()
{
  SBUIBiometricResource *v0;
  void *v1;

  v0 = objc_alloc_init(SBUIBiometricResource);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;

}

- (SBUIBiometricResource)init
{
  _SBUIBiometricKitInterface *v3;
  SBUIBiometricResource *v4;

  v3 = objc_alloc_init(_SBUIBiometricKitInterface);
  v4 = -[SBUIBiometricResource initWithBiometricKitInterface:](self, "initWithBiometricKitInterface:", v3);

  return v4;
}

- (SBUIBiometricResource)initWithBiometricKitInterface:(id)a3
{
  id v5;
  SBUIBiometricResource *v6;
  uint64_t v7;
  SBFMobileKeyBag *keybag;
  void *v9;
  uint64_t v10;
  MCProfileConnection *profileConnection;
  void *v12;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBUIBiometricResource;
  v6 = -[SBUIBiometricResource init](&v14, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    keybag = v6->_keybag;
    v6->_keybag = (SBFMobileKeyBag *)v7;

    -[SBFMobileKeyBag addObserver:](v6->_keybag, "addObserver:", v6);
    -[SBFMobileKeyBag extendedState](v6->_keybag, "extendedState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_isAuthenticated = objc_msgSend(v9, "isEffectivelyLocked") ^ 1;

    v6->_bkMatchPearlOperationClass = _SBUIEffectiveBiometricClassFromString(CFSTR("BKMatchPearlOperation"));
    __SBUIBiometricEMRootDomainConnect = IORegisterForSystemPower(0, (IONotificationPortRef *)&__ioPortRef, (IOServiceInterestCallback)_PowerChanged, __ioPMNotifier);
    if (__SBUIBiometricEMRootDomainConnect)
      IONotificationPortSetDispatchQueue((IONotificationPortRef)__ioPortRef, MEMORY[0x1E0C80D38]);
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v10 = objc_claimAutoreleasedReturnValue();
    profileConnection = v6->_profileConnection;
    v6->_profileConnection = (MCProfileConnection *)v10;

    objc_storeStrong((id *)&v6->_biometricInterface, a3);
    -[_SBUIBiometricKitInterface setDelegate:](v6->_biometricInterface, "setDelegate:", v6);
    v6->_hasMesaHardware = -[_SBUIBiometricKitInterface isTouchIDCapable](v6->_biometricInterface, "isTouchIDCapable");
    v6->_hasPearlHardware = -[_SBUIBiometricKitInterface isPearlIDCapable](v6->_biometricInterface, "isPearlIDCapable");
    if (!v6->_hasMesaHardware)
      -[_SBUIBiometricKitInterface enableBackgroundFingerDetection:error:](v6->_biometricInterface, "enableBackgroundFingerDetection:error:", 0, 0);
    if (MGGetSInt32Answer() == 2)
      v6->_hasPoseidonMesaTypeHardware = 1;
    v6->_lastEvent = 0;
    v6->_shouldSendFingerOffNotification = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v6, sel__profileSettingsChanged_, *MEMORY[0x1E0D46EC8], 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (__SBUIBiometricEMRootDomainConnect)
  {
    IONotificationPortSetDispatchQueue((IONotificationPortRef)__ioPortRef, 0);
    IODeregisterForSystemPower(__ioPMNotifier);
    IOServiceClose(__SBUIBiometricEMRootDomainConnect);
    IONotificationPortDestroy((IONotificationPortRef)__ioPortRef);
    __SBUIBiometricEMRootDomainConnect = 0;
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[_SBUIBiometricKitInterface setDelegate:](self->_biometricInterface, "setDelegate:", 0);
  v4.receiver = self;
  v4.super_class = (Class)SBUIBiometricResource;
  -[SBUIBiometricResource dealloc](&v4, sel_dealloc);
}

- (BOOL)isFingerOn
{
  return -[_SBUIBiometricKitInterface isFingerOn](self->_biometricInterface, "isFingerOn");
}

- (BOOL)hasEnrolledIdentities
{
  return -[_SBUIBiometricKitInterface hasEnrolledIdentities](self->_biometricInterface, "hasEnrolledIdentities");
}

- (BOOL)isFingerDetectEnabled
{
  return (self->_isForegroundFingerDetectionEnabled || self->_isMatchingEnabled) && self->_hasMesaHardware;
}

- (BOOL)hasMesaSupport
{
  return self->_hasMesaHardware;
}

- (BOOL)hasPoseidonSupport
{
  return self->_hasPoseidonMesaTypeHardware;
}

- (BOOL)hasPearlSupport
{
  return self->_hasPearlHardware;
}

- (BOOL)isPearlDetectEnabled
{
  return (self->_isPresenceDetectionAllowed || self->_isMatchingAllowed) && self->_hasPearlHardware;
}

- (unint64_t)biometricLockoutState
{
  unint64_t result;
  void *v4;
  unint64_t v5;

  result = -[_SBUIBiometricKitInterface lockoutState](self->_biometricInterface, "lockoutState");
  if (!result)
  {
    result = -[NSMutableOrderedSet count](self->_simulatedLockoutAssertions, "count");
    if (result)
    {
      -[NSMutableOrderedSet firstObject](self->_simulatedLockoutAssertions, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "lockoutState");

      return v5;
    }
  }
  return result;
}

- (BOOL)isPeriocularMatchingEnabled
{
  return -[_SBUIBiometricKitInterface isPeriocularMatchingEnabled](self->_biometricInterface, "isPeriocularMatchingEnabled");
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
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

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
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 230, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

}

- (id)acquireMatchingAssertionWithMode:(unint64_t)a3 reason:(id)a4
{
  id v6;
  _SBUIBiometricMatchingAssertion *v7;
  _SBUIBiometricMatchingAssertion *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = [_SBUIBiometricMatchingAssertion alloc];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __65__SBUIBiometricResource_acquireMatchingAssertionWithMode_reason___block_invoke;
  v13 = &unk_1E4C402C8;
  objc_copyWeak(&v14, &location);
  v8 = -[_SBUIBiometricMatchingAssertion initWithMatchMode:reason:invalidationBlock:](v7, "initWithMatchMode:reason:invalidationBlock:", a3, v6, &v10);
  if (v8)
    -[SBUIBiometricResource _addMatchingAssertion:](self, "_addMatchingAssertion:", v8, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __65__SBUIBiometricResource_acquireMatchingAssertionWithMode_reason___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "_removeMatchingAssertion:", v6);

}

- (void)resumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v4 = a4;
  v6 = a3;
  v7 = objc_opt_class();
  v10 = v6;
  if (v7)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v10;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");
  -[SBUIBiometricResource _reallyResumeMatchingForAssertion:advisory:](self, "_reallyResumeMatchingForAssertion:advisory:", v9, v4);

}

- (void)resumeMatchingAdvisory:(BOOL)a3
{
  _BOOL8 v3;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_matchAssertions;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[SBUIBiometricResource _reallyResumeMatchingForAssertion:advisory:](self, "_reallyResumeMatchingForAssertion:advisory:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), v3, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3
{
  return -[SBUIBiometricResource acquireFingerDetectionWantedAssertionForReason:HIDEventsOnly:](self, "acquireFingerDetectionWantedAssertionForReason:HIDEventsOnly:", a3, 0);
}

- (id)acquireFingerDetectionWantedAssertionForReason:(id)a3 HIDEventsOnly:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _SBUIBiometricOperationAssertion *v7;
  uint64_t v8;
  id v9;
  _SBUIBiometricOperationAssertion *v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;
  id location;

  v4 = a4;
  v6 = a3;
  objc_initWeak(&location, self);
  v7 = [_SBUIBiometricOperationAssertion alloc];
  v8 = MEMORY[0x1E0C80D38];
  v9 = MEMORY[0x1E0C80D38];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __86__SBUIBiometricResource_acquireFingerDetectionWantedAssertionForReason_HIDEventsOnly___block_invoke;
  v12[3] = &unk_1E4C402F0;
  objc_copyWeak(&v13, &location);
  v14 = v4;
  v10 = -[_SBUIBiometricOperationAssertion initWithIdentifier:forReason:queue:invalidationBlock:](v7, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("FingerDetectionWanted"), v6, v8, v12);

  if (v10)
    -[SBUIBiometricResource _addFingerDetectionWantedAssertion:HIDEventsOnly:](self, "_addFingerDetectionWantedAssertion:HIDEventsOnly:", v10, v4);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v10;
}

void __86__SBUIBiometricResource_acquireFingerDetectionWantedAssertionForReason_HIDEventsOnly___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "_removeFingerDetectionWantedAssertion:HIDEventsOnly:", v6, *(unsigned __int8 *)(a1 + 40));

}

- (id)acquireFaceDetectionWantedAssertionForReason:(id)a3
{
  id v4;
  _SBUIBiometricOperationAssertion *v5;
  uint64_t v6;
  id v7;
  _SBUIBiometricOperationAssertion *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [_SBUIBiometricOperationAssertion alloc];
  v6 = MEMORY[0x1E0C80D38];
  v7 = MEMORY[0x1E0C80D38];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __70__SBUIBiometricResource_acquireFaceDetectionWantedAssertionForReason___block_invoke;
  v13 = &unk_1E4C402C8;
  objc_copyWeak(&v14, &location);
  v8 = -[_SBUIBiometricOperationAssertion initWithIdentifier:forReason:queue:invalidationBlock:](v5, "initWithIdentifier:forReason:queue:invalidationBlock:", CFSTR("FaceDetectionWanted"), v4, v6, &v10);

  if (v8)
    -[SBUIBiometricResource _addFaceDetectionWantedAssertion:](self, "_addFaceDetectionWantedAssertion:", v8, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __70__SBUIBiometricResource_acquireFaceDetectionWantedAssertionForReason___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "_removeFaceDetectionWantedAssertion:", v6);

}

- (id)acquireSimulatedLockoutAssertionWithLockoutState:(unint64_t)a3 forReason:(id)a4
{
  id v6;
  _SBUISimulatedLockoutAssertion *v7;
  _SBUISimulatedLockoutAssertion *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v7 = [_SBUISimulatedLockoutAssertion alloc];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __84__SBUIBiometricResource_acquireSimulatedLockoutAssertionWithLockoutState_forReason___block_invoke;
  v13 = &unk_1E4C402C8;
  objc_copyWeak(&v14, &location);
  v8 = -[_SBUISimulatedLockoutAssertion initWithLockoutState:reason:invalidationBlock:](v7, "initWithLockoutState:reason:invalidationBlock:", a3, v6, &v10);
  if (v8)
    -[SBUIBiometricResource _addSimulatedLockoutAssertion:](self, "_addSimulatedLockoutAssertion:", v8, v10, v11, v12, v13);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

void __84__SBUIBiometricResource_acquireSimulatedLockoutAssertionWithLockoutState_forReason___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(WeakRetained, "_removeSimulatedLockoutAssertion:", v6);

}

- (void)_setAuthenticated:(BOOL)a3
{
  -[SBUIBiometricResource _reallySetAuthenticated:keybagState:](self, "_reallySetAuthenticated:keybagState:", a3, 0);
}

- (void)_forceBioLockout
{
  -[_SBUIBiometricKitInterface forceBioLockout](self->_biometricInterface, "forceBioLockout");
  aks_drop_auxiliary_auth_by_handle();
}

- (void)noteScreenWillTurnOff
{
  if (self->_screenIsOn)
  {
    self->_screenIsOn = 0;
    -[SBUIBiometricResource _matchingAllowedStateMayHaveChangedForReason:](self, "_matchingAllowedStateMayHaveChangedForReason:", CFSTR("Screen Off"));
    -[SBUIBiometricResource _presenceDetectAllowedStateMayHaveChangedForReason:](self, "_presenceDetectAllowedStateMayHaveChangedForReason:", CFSTR("Screen Off"));
  }
}

- (void)noteScreenDidTurnOff
{
  if (self->_screenIsOn)
  {
    self->_screenIsOn = 0;
    -[SBUIBiometricResource _matchingAllowedStateMayHaveChangedForReason:](self, "_matchingAllowedStateMayHaveChangedForReason:", CFSTR("Screen Off"));
    -[SBUIBiometricResource _presenceDetectAllowedStateMayHaveChangedForReason:](self, "_presenceDetectAllowedStateMayHaveChangedForReason:", CFSTR("Screen Off"));
  }
}

- (void)noteScreenWillTurnOn
{
  if (!self->_screenIsOn)
  {
    self->_screenIsOn = 1;
    -[SBUIBiometricResource _matchingAllowedStateMayHaveChangedForReason:](self, "_matchingAllowedStateMayHaveChangedForReason:", CFSTR("Screen On"));
    -[SBUIBiometricResource _presenceDetectAllowedStateMayHaveChangedForReason:](self, "_presenceDetectAllowedStateMayHaveChangedForReason:", CFSTR("Screen On"));
  }
}

- (void)_profileSettingsChanged:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__SBUIBiometricResource__profileSettingsChanged___block_invoke;
  block[3] = &unk_1E4C3E408;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __49__SBUIBiometricResource__profileSettingsChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "isFingerprintUnlockAllowed");
    NSStringFromBOOL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_INFO, "Profile settings did change - authentication allowed via mesa? %@", (uint8_t *)&v5, 0xCu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "_matchingAllowedStateMayHaveChangedForReason:", CFSTR("Profile settings changed"));
}

- (void)_deviceWillWake
{
  OUTLINED_FUNCTION_4_0(&dword_1A471F000, a1, a3, "uh-oh, the device went to sleep without disabling matching... forcibly re-enabling.", a5, a6, a7, a8, 0);
}

- (void)keybag:(id)a3 extendedStateDidChange:(id)a4
{
  id v4;
  id v5;

  v5 = a4;
  v4 = v5;
  BSDispatchMain();

}

uint64_t __55__SBUIBiometricResource_keybag_extendedStateDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "hasPasscodeSet");
    NSStringFromBOOL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_INFO, "Keybag state change (passcodeSet? %{public}@)", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_reallySetAuthenticated:keybagState:", objc_msgSend(*(id *)(a1 + 40), "isEffectivelyLocked") ^ 1, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_matchingAllowedStateMayHaveChangedForReason:", CFSTR("Keybag state did change"));
}

- (NSString)description
{
  return (NSString *)-[SBUIBiometricResource descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBUIBiometricResource succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBUIBiometricResource descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  SBUIBiometricResource *v11;

  -[SBUIBiometricResource succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__SBUIBiometricResource_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4C3E6A0;
  v5 = v4;
  v10 = v5;
  v11 = self;
  v6 = (id)objc_msgSend(v5, "modifyBody:", v9);
  v7 = v5;

  return v7;
}

id __63__SBUIBiometricResource_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFingerOn"), CFSTR("isFingerOn"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 53), CFSTR("isPresenceDetectionAllowed"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 54), CFSTR("isForegroundFingerDetectionEnabled"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 55), CFSTR("isBackgroundFingerDetectionEnabled"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 56), CFSTR("isFingerDetectionEnabledThroughHIDChannel"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 51), CFSTR("isMatchingAllowed"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 52), CFSTR("isMatchingEnabled"));
  v9 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80), CFSTR("MatchingAssertions"));
  v10 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88), CFSTR("NormalFingerDetectWantedAssertions"));
  v11 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96), CFSTR("HIDEventsOnlyFingerDetectWantedAssertions"));
  v12 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), CFSTR("FaceDetectWantedAssertions"));
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 112), CFSTR("PasscodeRequiredAssertions"));
}

- (void)biometricKitInterface:(id)a3 enrolledIdentitiesDidChange:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  SBLogBiometricResource();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v11 = v7;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Enrolled identities did change - now enrolled: %{public}@", buf, 0xCu);

  }
  v8 = CFSTR("Not Enrolled");
  if (v4)
    v8 = CFSTR("Enrolled");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Enrolled identities may have changed to %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBUIBiometricResource _matchingAllowedStateMayHaveChangedForReason:](self, "_matchingAllowedStateMayHaveChangedForReason:", v9);

}

- (void)biometricKitInterface:(id)a3 handleEvent:(unint64_t)a4
{
  id v6;
  NSMutableOrderedSet *v7;
  const char *v8;
  void *v9;
  NSMutableOrderedSet *matchAssertions;
  unint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint8_t v33[128];
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  NSMutableOrderedSet *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  switch(a4)
  {
    case 0uLL:
      kdebug_trace();
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Finger OFF sensor";
      goto LABEL_88;
    case 1uLL:
      kdebug_trace();
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Finger ON sensor";
      goto LABEL_88;
    case 2uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: request to remove the finger";
      goto LABEL_88;
    case 3uLL:
      kdebug_trace();
      if (self->_isAuthenticated)
        goto LABEL_90;
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
      {
        NSStringFromBOOL();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        matchAssertions = self->_matchAssertions;
        *(_DWORD *)buf = 138412546;
        v35 = v9;
        v36 = 2112;
        v37 = matchAssertions;
        _os_log_impl(&dword_1A471F000, &v7->super.super, OS_LOG_TYPE_INFO, "Identity match - authenticated: %@, matchingAssertions: %@", buf, 0x16u);

      }
      goto LABEL_89;
    case 4uLL:
      goto LABEL_91;
    case 5uLL:
      kdebug_trace();
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match attempt but passcode locked out";
      goto LABEL_88;
    case 6uLL:
      kdebug_trace();
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match attempt but bio locked out";
      goto LABEL_88;
    case 7uLL:
      kdebug_trace();
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match attempt but bio unlock is expired";
      goto LABEL_88;
    case 8uLL:
      kdebug_trace();
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match attempt before first unlock";
      goto LABEL_88;
    case 9uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match failed with dirt on sensor";
      goto LABEL_88;
    case 0xAuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match attempt failed";
      goto LABEL_88;
    case 0xBuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match attempt failed and reached bio lockout";
      goto LABEL_88;
    case 0xCuLL:
      v11 = -[SBUIBiometricResource biometricLockoutState](self, "biometricLockoutState");
      SBLogBiometricResource();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_INFO, "Status: match operation started", buf, 2u);
      }

      if (!v11)
        goto LABEL_90;
      goto LABEL_91;
    case 0xDuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face in view";
      goto LABEL_88;
    case 0xEuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face not in view";
      goto LABEL_88;
    case 0xFuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: match ended without result";
      goto LABEL_88;
    case 0x10uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: No Feedback";
      goto LABEL_88;
    case 0x11uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face too far";
      goto LABEL_88;
    case 0x12uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face too close";
      goto LABEL_88;
    case 0x13uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Camera Obstructed";
      goto LABEL_88;
    case 0x14uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: No attention";
      goto LABEL_88;
    case 0x15uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face occluded";
      goto LABEL_88;
    case 0x16uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face out of view";
      goto LABEL_88;
    case 0x17uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Marginal Pose";
      goto LABEL_88;
    case 0x18uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: pearl interlocked";
      goto LABEL_88;
    case 0x19uLL:
      SBLogBiometricResource();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v13, OS_LOG_TYPE_INFO, "Status: device too hot", buf, 2u);
      }

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v7 = self->_matchAssertions;
      v14 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v29 != v16)
              objc_enumerationMutation(v7);
            -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          }
          v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v15);
      }
      goto LABEL_89;
    case 0x1AuLL:
      SBLogBiometricResource();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v18, OS_LOG_TYPE_INFO, "Status: device too cold", buf, 2u);
      }

      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v7 = self->_matchAssertions;
      v19 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v25 != v21)
              objc_enumerationMutation(v7);
            -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j), (_QWORD)v24);
          }
          v20 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v20);
      }
      goto LABEL_89;
    case 0x1BuLL:
      SBLogBiometricResource();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v23, OS_LOG_TYPE_INFO, "Status: operation failed", buf, 2u);
      }

      -[SBUIBiometricResource _deactivateAllPearlAssertions](self, "_deactivateAllPearlAssertions");
      goto LABEL_90;
    case 0x1CuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Bottom of face occluded";
      goto LABEL_88;
    case 0x1DuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Face wu pose eligible";
      goto LABEL_88;
    case 0x1EuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Unsupported glasses";
      goto LABEL_88;
    case 0x1FuLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Pose out of negative pitch range";
      goto LABEL_88;
    case 0x20uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: Periocular timed out";
      goto LABEL_88;
    case 0x21uLL:
      SBLogBiometricResource();
      v7 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(&v7->super.super, OS_LOG_TYPE_INFO))
        goto LABEL_89;
      *(_WORD *)buf = 0;
      v8 = "Status: unlock token dropped";
LABEL_88:
      _os_log_impl(&dword_1A471F000, &v7->super.super, OS_LOG_TYPE_INFO, v8, buf, 2u);
LABEL_89:

LABEL_90:
      -[SBUIBiometricResource _updateHandlersForEvent:](self, "_updateHandlersForEvent:", a4, (_QWORD)v24);
LABEL_91:

      return;
    default:
      goto LABEL_90;
  }
}

- (void)_reallySetAuthenticated:(BOOL)a3 keybagState:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (self->_isAuthenticated != v4)
  {
    self->_isAuthenticated = v4;
    SBLogBiometricResource();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_INFO, "Authentication state changed - authenticated: %@", (uint8_t *)&v13, 0xCu);

    }
    if (v4)
    {
      v9 = v6;
      v10 = v9;
      if (!v9)
      {
        -[SBFMobileKeyBag extendedState](self->_keybag, "extendedState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      SBLogBiometricResource();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 138543618;
        v14 = v9;
        v15 = 2114;
        v16 = v10;
        _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_DEFAULT, "Became authenticated with keybag state: %{public}@, local keybag state: %{public}@", (uint8_t *)&v13, 0x16u);
      }

      if (objc_msgSend(v10, "lockState") == 7)
      {
        SBLogBiometricResource();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_INFO, "Identity match reported by the keybag - BioUnlocked", (uint8_t *)&v13, 2u);
        }

        -[SBUIBiometricResource _updateHandlersForEvent:](self, "_updateHandlersForEvent:", 4);
      }

    }
  }

}

- (void)_reallyResumeMatchingForAssertion:(id)a3 advisory:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[4];
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  _BOOL4 v37;
  __int16 v38;
  _BOOL4 v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v4 = a4;
  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v8 = v4 && objc_msgSend(v6, "restartCount") == 0;
  SBLogBiometricResource();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    v37 = v4;
    v38 = 1024;
    v39 = v8;
    v40 = 2112;
    v41 = v7;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_INFO, "evaluating resumption (advisory: %{BOOL}u advisoryRestart: %{BOOL}u) for assertion %@", buf, 0x18u);
  }

  if (v4 && !v8 || !self->_bkMatchPearlOperationClass)
    goto LABEL_35;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v7, "operations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (!v11)
  {

    v26 = 0;
    goto LABEL_34;
  }
  v12 = v11;
  v13 = 0;
  v14 = *(_QWORD *)v30;
  v27 = v7;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v30 != v14)
        objc_enumerationMutation(v10);
      v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = v16;
      else
        v17 = 0;
      v18 = v17;
      if (objc_msgSend(v18, "shouldAutoRetry"))
      {
        v28 = 0;
        objc_msgSend(v18, "enableAutoRetry:error:", 0, &v28);
        v19 = v28;
        if (v19)
        {
          SBLogBiometricResource();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            -[SBUIBiometricResource _reallyResumeMatchingForAssertion:advisory:].cold.1(buf, v19, &v37, v20);

        }
      }
      v21 = objc_msgSend(v18, "startNewMatchAttemptWithError:", 0, v27);
      SBLogBiometricResource();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
      if (v21)
      {
        if (!v23)
          goto LABEL_28;
        *(_DWORD *)v33 = 138412290;
        v34 = v18;
        v24 = v22;
        v25 = "operation %@ resumed";
      }
      else
      {
        if (!v23)
          goto LABEL_28;
        *(_DWORD *)v33 = 138412290;
        v34 = v18;
        v24 = v22;
        v25 = "operation %@ not resumed";
      }
      _os_log_impl(&dword_1A471F000, v24, OS_LOG_TYPE_INFO, v25, v33, 0xCu);
LABEL_28:
      v13 |= v21;

    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  }
  while (v12);

  if ((v13 & 1) != 0)
  {
    v7 = v27;
    v26 = objc_msgSend(v27, "restartCount") + 1;
  }
  else
  {
    v26 = 0;
    v7 = v27;
  }
LABEL_34:
  objc_msgSend(v7, "setRestartCount:", v26);
LABEL_35:

}

- (void)_activateMatchAssertion:(id)a3
{
  id v4;
  uint64_t v5;
  SBFCredentialSet *unlockCredentialSet;
  SBFCredentialSet *v7;
  void *v8;
  _SBUIBiometricKitInterface *biometricInterface;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  SBFCredentialSet *v21;
  _QWORD v22[4];
  id v23;
  SBUIBiometricResource *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBUIBiometricResource _clearFinishedOperationsIfNeededForAssertion:](self, "_clearFinishedOperationsIfNeededForAssertion:", v4);
  v5 = objc_msgSend(v4, "matchMode");
  if (v5 == 3)
    unlockCredentialSet = self->_unlockCredentialSet;
  else
    unlockCredentialSet = 0;
  v7 = unlockCredentialSet;
  objc_msgSend(v4, "operations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (v5)
    {
      biometricInterface = self->_biometricInterface;
      v29 = 0;
      -[_SBUIBiometricKitInterface createMatchOperationsWithMode:andCredentialSet:error:](biometricInterface, "createMatchOperationsWithMode:andCredentialSet:error:", v5, v7, &v29);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v29;
      if (v10)
      {
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setOperations:", v12);

        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v4, "operations");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v14)
        {
          v15 = v14;
          v21 = v7;
          v16 = *(_QWORD *)v26;
          v17 = MEMORY[0x1E0C809B0];
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v26 != v16)
                objc_enumerationMutation(v13);
              v19 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
              v22[0] = v17;
              v22[1] = 3221225472;
              v22[2] = __49__SBUIBiometricResource__activateMatchAssertion___block_invoke;
              v22[3] = &unk_1E4C40318;
              v23 = v4;
              v24 = self;
              objc_msgSend(v19, "startWithReply:", v22);

            }
            v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
          }
          while (v15);
          v7 = v21;
        }
      }
      else
      {
        SBLogBiometricResource();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[SBUIBiometricResource _activateMatchAssertion:].cold.1();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOperations:", v20);

    }
  }

}

void __49__SBUIBiometricResource__activateMatchAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2;
    block[3] = &unk_1E4C3E650;
    v9 = *(id *)(a1 + 32);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = v6;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 48), "_deactivateAssertion:", *(_QWORD *)(a1 + 32));
}

- (void)_clearFinishedOperationsIfNeededForAssertion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogBiometricResource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_INFO, "_clearFinishedOperationsIfNeededForAssertion: %{public}@", buf, 0xCu);
  }

  if (self->_isAuthenticated && objc_msgSend(v4, "matchMode") == 3)
  {
    SBLogBiometricResource();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Not clearing operations because we're already authenticated.", buf, 2u);
    }
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v4, "operations", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "state") == 4)
          {

            SBLogBiometricResource();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_INFO, "Clearing operations because we found a finished one.", buf, 2u);
            }

            objc_msgSend(v4, "setOperations:", 0);
            goto LABEL_19;
          }
        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v8)
          continue;
        break;
      }
    }
  }

LABEL_19:
}

- (void)_activateFingerDetectAssertion:(id)a3
{
  id v4;
  void *v5;
  _SBUIBiometricKitInterface *biometricInterface;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SBUIBiometricResource *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    biometricInterface = self->_biometricInterface;
    v25 = 0;
    -[_SBUIBiometricKitInterface createFingerDetectOperationsWithError:](biometricInterface, "createFingerDetectOperationsWithError:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOperations:", v9);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "operations");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
      {
        v12 = v11;
        v17 = v7;
        v13 = *(_QWORD *)v22;
        v14 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v18[0] = v14;
            v18[1] = 3221225472;
            v18[2] = __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke;
            v18[3] = &unk_1E4C40318;
            v19 = v4;
            v20 = self;
            objc_msgSend(v16, "startWithReply:", v18);

          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v12);
        v7 = v17;
      }
    }
    else
    {
      SBLogBiometricResource();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBUIBiometricResource _activateFingerDetectAssertion:].cold.1();
    }

  }
}

void __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2;
    block[3] = &unk_1E4C3E650;
    v9 = *(id *)(a1 + 32);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = v6;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 48), "_deactivateAssertion:", *(_QWORD *)(a1 + 32));
}

- (void)_activateFaceDetectAssertion:(id)a3
{
  id v4;
  void *v5;
  _SBUIBiometricKitInterface *biometricInterface;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  SBUIBiometricResource *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "operations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    biometricInterface = self->_biometricInterface;
    v25 = 0;
    -[_SBUIBiometricKitInterface createFaceDetectOperationsWithError:](biometricInterface, "createFaceDetectOperationsWithError:", &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setOperations:", v9);

      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      objc_msgSend(v4, "operations");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      if (v11)
      {
        v12 = v11;
        v17 = v7;
        v13 = *(_QWORD *)v22;
        v14 = MEMORY[0x1E0C809B0];
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v22 != v13)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
            v18[0] = v14;
            v18[1] = 3221225472;
            v18[2] = __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke;
            v18[3] = &unk_1E4C40318;
            v19 = v4;
            v20 = self;
            objc_msgSend(v16, "startWithReply:", v18);

          }
          v12 = -[NSObject countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        }
        while (v12);
        v7 = v17;
      }
    }
    else
    {
      SBLogBiometricResource();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[SBUIBiometricResource _activateFaceDetectAssertion:].cold.1();
    }

  }
}

void __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;

  v5 = a3;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2;
    block[3] = &unk_1E4C3E650;
    v9 = *(id *)(a1 + 32);
    v6 = v5;
    v7 = *(_QWORD *)(a1 + 40);
    v10 = v6;
    v11 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SBLogBiometricResource();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2_cold_1();

  return objc_msgSend(*(id *)(a1 + 48), "_deactivateAssertion:", *(_QWORD *)(a1 + 32));
}

- (void)_deactivateAssertion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "operations", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cancel");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "setOperations:", 0);
}

- (void)_deactivateAllPearlAssertions
{
  NSMutableOrderedSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self->_bkMatchPearlOperationClass)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = self->_matchAssertions;
    v4 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v19;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
          v15 = 0u;
          v16 = 0u;
          v17 = 0u;
          objc_msgSend(v8, "operations", 0, 0);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v15;
            while (2)
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v15 != v12)
                  objc_enumerationMutation(v9);
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {

                  -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", v8);
                  goto LABEL_17;
                }
                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
              if (v11)
                continue;
              break;
            }
          }

LABEL_17:
          ++v7;
        }
        while (v7 != v5);
        v5 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v5);
    }

  }
}

- (void)_addMatchingAssertion:(id)a3
{
  id v5;
  NSMutableOrderedSet *matchAssertions;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  NSObject *v9;
  NSMutableOrderedSet *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  NSMutableOrderedSet *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 816, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  matchAssertions = self->_matchAssertions;
  if (!matchAssertions)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v8 = self->_matchAssertions;
    self->_matchAssertions = v7;

    matchAssertions = self->_matchAssertions;
  }
  -[NSMutableOrderedSet addObject:](matchAssertions, "addObject:", v5);
  SBLogBiometricResource();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self->_matchAssertions;
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_INFO, "Biometric matching assertion added (%p) - all assertions: %@", buf, 0x16u);
  }

  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");
}

- (void)_removeMatchingAssertion:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableOrderedSet *matchAssertions;
  NSMutableOrderedSet *v8;
  void *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  NSMutableOrderedSet *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 830, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", v5);
  -[NSMutableOrderedSet removeObject:](self->_matchAssertions, "removeObject:", v5);
  SBLogBiometricResource();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    matchAssertions = self->_matchAssertions;
    *(_DWORD *)buf = 134218242;
    v11 = v5;
    v12 = 2112;
    v13 = matchAssertions;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Biometric matching wanted assertion removed (%p) - remaining reasons: %@", buf, 0x16u);
  }

  if (!-[NSMutableOrderedSet count](self->_matchAssertions, "count"))
  {
    v8 = self->_matchAssertions;
    self->_matchAssertions = 0;

  }
  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");

}

- (void)_addFingerDetectionWantedAssertion:(id)a3 HIDEventsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  NSMutableOrderedSet *HIDEventsOnlyFingerDetectAssertions;
  NSMutableOrderedSet **p_HIDEventsOnlyFingerDetectAssertions;
  NSMutableOrderedSet *v10;
  NSMutableOrderedSet *v11;
  NSObject *v12;
  NSMutableOrderedSet *normalFingerDetectAssertions;
  NSMutableOrderedSet *v14;
  void *v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  NSMutableOrderedSet *v21;
  __int16 v22;
  NSMutableOrderedSet *v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 844, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  if (v4)
  {
    p_HIDEventsOnlyFingerDetectAssertions = &self->_HIDEventsOnlyFingerDetectAssertions;
    HIDEventsOnlyFingerDetectAssertions = self->_HIDEventsOnlyFingerDetectAssertions;
    if (HIDEventsOnlyFingerDetectAssertions)
      goto LABEL_6;
    goto LABEL_5;
  }
  p_HIDEventsOnlyFingerDetectAssertions = &self->_normalFingerDetectAssertions;
  HIDEventsOnlyFingerDetectAssertions = self->_normalFingerDetectAssertions;
  if (!HIDEventsOnlyFingerDetectAssertions)
  {
LABEL_5:
    v10 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v11 = *p_HIDEventsOnlyFingerDetectAssertions;
    *p_HIDEventsOnlyFingerDetectAssertions = v10;

    HIDEventsOnlyFingerDetectAssertions = *p_HIDEventsOnlyFingerDetectAssertions;
  }
LABEL_6:
  -[NSMutableOrderedSet addObject:](HIDEventsOnlyFingerDetectAssertions, "addObject:", v7);
  SBLogBiometricResource();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    normalFingerDetectAssertions = self->_normalFingerDetectAssertions;
    v14 = self->_HIDEventsOnlyFingerDetectAssertions;
    *(_DWORD *)buf = 134218754;
    v17 = v7;
    v18 = 1024;
    v19 = v4;
    v20 = 2112;
    v21 = normalFingerDetectAssertions;
    v22 = 2112;
    v23 = v14;
    _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_INFO, "Finger detect wanted assertion added (%p) (HIDEventsOnly: %{BOOL}u) - all assertions: %@ %@", buf, 0x26u);
  }

  -[SBUIBiometricResource _reevaluateFingerDetection](self, "_reevaluateFingerDetection");
}

- (void)_removeFingerDetectionWantedAssertion:(id)a3 HIDEventsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSMutableOrderedSet *normalFingerDetectAssertions;
  NSMutableOrderedSet *HIDEventsOnlyFingerDetectAssertions;
  void *v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  NSMutableOrderedSet *v18;
  __int16 v19;
  NSMutableOrderedSet *v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 865, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", v7);
  v8 = 88;
  if (v4)
    v8 = 96;
  objc_msgSend(*(id *)((char *)&self->super.isa + v8), "removeObject:", v7);
  SBLogBiometricResource();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    normalFingerDetectAssertions = self->_normalFingerDetectAssertions;
    HIDEventsOnlyFingerDetectAssertions = self->_HIDEventsOnlyFingerDetectAssertions;
    *(_DWORD *)buf = 134218754;
    v14 = v7;
    v15 = 1024;
    v16 = v4;
    v17 = 2112;
    v18 = normalFingerDetectAssertions;
    v19 = 2112;
    v20 = HIDEventsOnlyFingerDetectAssertions;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_INFO, "Finger detect wanted assertion removed (%p) (HIDEventsOnly: %{BOOL}u) - remaining assertions: %@ %@", buf, 0x26u);
  }

  -[SBUIBiometricResource _reevaluateFingerDetection](self, "_reevaluateFingerDetection");
}

- (void)_addFaceDetectionWantedAssertion:(id)a3
{
  id v5;
  NSMutableOrderedSet *faceDetectAssertions;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  NSObject *v9;
  NSMutableOrderedSet *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  NSMutableOrderedSet *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 880, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  faceDetectAssertions = self->_faceDetectAssertions;
  if (!faceDetectAssertions)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v8 = self->_faceDetectAssertions;
    self->_faceDetectAssertions = v7;

    faceDetectAssertions = self->_faceDetectAssertions;
  }
  -[NSMutableOrderedSet addObject:](faceDetectAssertions, "addObject:", v5);
  SBLogBiometricResource();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self->_faceDetectAssertions;
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_INFO, "Face detect wanted assertion added (%p) - all assertions: %@", buf, 0x16u);
  }

  -[SBUIBiometricResource _reevaluateFaceDetection](self, "_reevaluateFaceDetection");
}

- (void)_removeFaceDetectionWantedAssertion:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableOrderedSet *faceDetectAssertions;
  void *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  NSMutableOrderedSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 893, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", v5);
  -[NSMutableOrderedSet removeObject:](self->_faceDetectAssertions, "removeObject:", v5);
  SBLogBiometricResource();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    faceDetectAssertions = self->_faceDetectAssertions;
    *(_DWORD *)buf = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = faceDetectAssertions;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Face detect wanted assertion removed (%p) - remaining assertions: %@", buf, 0x16u);
  }

  -[SBUIBiometricResource _reevaluateFaceDetection](self, "_reevaluateFaceDetection");
}

- (void)_addSimulatedLockoutAssertion:(id)a3
{
  id v5;
  NSMutableOrderedSet *simulatedLockoutAssertions;
  NSMutableOrderedSet *v7;
  NSMutableOrderedSet *v8;
  NSObject *v9;
  NSMutableOrderedSet *v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  NSMutableOrderedSet *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 904, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  simulatedLockoutAssertions = self->_simulatedLockoutAssertions;
  if (!simulatedLockoutAssertions)
  {
    v7 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    v8 = self->_simulatedLockoutAssertions;
    self->_simulatedLockoutAssertions = v7;

    simulatedLockoutAssertions = self->_simulatedLockoutAssertions;
  }
  -[NSMutableOrderedSet addObject:](simulatedLockoutAssertions, "addObject:", v5);
  SBLogBiometricResource();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = self->_simulatedLockoutAssertions;
    *(_DWORD *)buf = 134218242;
    v13 = v5;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_INFO, "Passcode required assertion added (%p) - all assertions: %@", buf, 0x16u);
  }

  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");
}

- (void)_removeSimulatedLockoutAssertion:(id)a3
{
  id v5;
  NSObject *v6;
  NSMutableOrderedSet *simulatedLockoutAssertions;
  void *v8;
  uint8_t buf[4];
  id v10;
  __int16 v11;
  NSMutableOrderedSet *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBUIBiometricResource.m"), 917, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assertion"));

  }
  -[NSMutableOrderedSet removeObject:](self->_simulatedLockoutAssertions, "removeObject:", v5);
  SBLogBiometricResource();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    simulatedLockoutAssertions = self->_simulatedLockoutAssertions;
    *(_DWORD *)buf = 134218242;
    v10 = v5;
    v11 = 2112;
    v12 = simulatedLockoutAssertions;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Passcode required assertion removed (%p) - remaining assertions: %@", buf, 0x16u);
  }

  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");
}

- (void)_presenceDetectAllowedStateMayHaveChangedForReason:(id)a3
{
  id v4;
  _BOOL4 screenIsOn;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  screenIsOn = self->_screenIsOn;
  if (self->_isPresenceDetectionAllowed != screenIsOn)
  {
    self->_isPresenceDetectionAllowed = screenIsOn;
    SBLogBiometricResource();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 2112;
      v11 = v4;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "PresenceDetection allowed changed to %{public}@ for reason: %@", (uint8_t *)&v8, 0x16u);

    }
  }
  -[SBUIBiometricResource _reevaluateFingerDetection](self, "_reevaluateFingerDetection");
  -[SBUIBiometricResource _reevaluateFaceDetection](self, "_reevaluateFaceDetection");

}

- (void)_matchingAllowedStateMayHaveChangedForReason:(id)a3
{
  id v4;
  _BOOL4 screenIsOn;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[SBUIBiometricResource hasBiometricAuthenticationCapabilityEnabled](self, "hasBiometricAuthenticationCapabilityEnabled"))
  {
    screenIsOn = self->_screenIsOn;
  }
  else
  {
    screenIsOn = 0;
  }
  if (self->_isMatchingAllowed != screenIsOn)
  {
    self->_isMatchingAllowed = screenIsOn;
    SBLogBiometricResource();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Matching allowed changed to %{public}@ for reason: %@", buf, 0x16u);

    }
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v13, "biometricResource:matchingAllowedDidChange:", self, self->_isMatchingAllowed);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v10);
    }

  }
  -[SBUIBiometricResource _reevaluateMatching](self, "_reevaluateMatching");

}

- (void)_reevaluateMatching
{
  int isMatchingEnabled;
  _BOOL4 v4;
  int v5;
  NSObject *v6;
  void *v7;
  NSMutableOrderedSet *v8;
  void *v9;
  NSMutableOrderedSet *matchAssertions;
  NSObject *v11;
  void *v12;
  NSMutableOrderedSet *v13;
  NSMutableOrderedSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  NSObject *v26;
  void *v27;
  NSMutableOrderedSet *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  NSMutableOrderedSet *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  NSMutableOrderedSet *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  isMatchingEnabled = self->_isMatchingEnabled;
  if (self->_isMatchingAllowed && -[NSMutableOrderedSet count](self->_matchAssertions, "count"))
  {
    v4 = -[NSMutableOrderedSet count](self->_simulatedLockoutAssertions, "count") == 0;
    v5 = 1;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  SBLogBiometricResource();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v8 = (NSMutableOrderedSet *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    matchAssertions = self->_matchAssertions;
    *(_DWORD *)buf = 138544130;
    v40 = v7;
    v41 = 2114;
    v42 = v8;
    v43 = 2114;
    v44 = v9;
    v45 = 2112;
    v46 = matchAssertions;
    _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "Reevaluating matching. _isMatchingEnabled = %{public}@ shouldBeEnabled = %{public}@ _isMatchingAllowed = %{public}@ _matchAssertions = %@", buf, 0x2Au);

  }
  if (self->_isMatchingEnabled != v5)
  {
    SBLogBiometricResource();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = self->_matchAssertions;
      *(_DWORD *)buf = 138412546;
      v40 = v12;
      v41 = 2112;
      v42 = v13;
      _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_INFO, "Changing matching to %@. _matchAssertions = %@", buf, 0x16u);

    }
  }
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = self->_matchAssertions;
  v15 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v4)
          -[SBUIBiometricResource _activateMatchAssertion:](self, "_activateMatchAssertion:", v19);
        else
          -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", v19);
      }
      v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v16);
  }

  if (isMatchingEnabled != v5)
  {
    self->_isMatchingEnabled = v5;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v20 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v25, "biometricResource:matchingEnabledDidChange:", self, self->_isMatchingEnabled);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v22);
    }

    SBLogBiometricResource();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      NSStringFromBOOL();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = self->_matchAssertions;
      *(_DWORD *)buf = 138412546;
      v40 = v27;
      v41 = 2112;
      v42 = v28;
      _os_log_impl(&dword_1A471F000, v26, OS_LOG_TYPE_INFO, "Changed matching to %@. _matchAssertions = %@", buf, 0x16u);

    }
  }
}

- (void)_reevaluateFingerDetection
{
  _BOOL4 v3;
  _BOOL4 hasMesaHardware;
  NSObject *v5;
  const __CFString *v6;
  _SBUIBiometricKitInterface *biometricInterface;
  _BOOL4 v8;
  __CFString *v9;
  NSObject *v10;
  const __CFString *v11;
  const char *v12;
  _SBUIBiometricKitInterface *v13;
  _BOOL4 v14;
  const __CFString *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSMutableOrderedSet *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  id v36;
  _BYTE v37[128];
  uint8_t v38[128];
  uint8_t buf[4];
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (self->_isPresenceDetectionAllowed)
  {
    v3 = (-[NSMutableOrderedSet count](self->_HIDEventsOnlyFingerDetectAssertions, "count")
       || -[NSMutableOrderedSet count](self->_normalFingerDetectAssertions, "count"))
      && self->_hasMesaHardware;
    if (self->_isPresenceDetectionAllowed && -[NSMutableOrderedSet count](self->_normalFingerDetectAssertions, "count"))
    {
      hasMesaHardware = self->_hasMesaHardware;
      goto LABEL_10;
    }
  }
  else
  {
    v3 = 0;
  }
  hasMesaHardware = 0;
LABEL_10:
  if (self->_isBackgroundFingerDetectionEnabled == v3)
    goto LABEL_29;
  self->_isBackgroundFingerDetectionEnabled = v3;
  SBLogBiometricResource();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (self->_isBackgroundFingerDetectionEnabled)
      v6 = CFSTR("ENABLED");
    else
      v6 = CFSTR("DISABLED");
    *(_DWORD *)buf = 138412290;
    v40 = v6;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_INFO, "Background FingerDetection %@", buf, 0xCu);
  }

  if (self->_isBackgroundFingerDetectionEnabled)
  {
    biometricInterface = self->_biometricInterface;
    v36 = 0;
    v8 = -[_SBUIBiometricKitInterface enableBackgroundFingerDetection:error:](biometricInterface, "enableBackgroundFingerDetection:error:", 1, &v36);
    v9 = (__CFString *)v36;
    self->_isFingerDetectionEnabledThroughHIDChannel = v8;
    SBLogBiometricResource();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v8)
        v11 = 0;
      else
        v11 = v9;
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      v12 = "FingerDetection ENABLED through HID channel (error %@)";
LABEL_27:
      _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
    }
  }
  else
  {
    self->_isFingerDetectionEnabledThroughHIDChannel = 0;
    v13 = self->_biometricInterface;
    v35 = 0;
    v14 = -[_SBUIBiometricKitInterface enableBackgroundFingerDetection:error:](v13, "enableBackgroundFingerDetection:error:", 0, &v35);
    v9 = (__CFString *)v35;
    SBLogBiometricResource();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      if (v14)
        v15 = 0;
      else
        v15 = v9;
      *(_DWORD *)buf = 138412290;
      v40 = v15;
      v12 = "FingerDetection DISABLED through HID channel (error %@)";
      goto LABEL_27;
    }
  }

LABEL_29:
  if (self->_isForegroundFingerDetectionEnabled != hasMesaHardware)
  {
    self->_isForegroundFingerDetectionEnabled = hasMesaHardware;
    SBLogBiometricResource();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);
    if (hasMesaHardware)
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v16, OS_LOG_TYPE_INFO, "FingerDetection ENABLED through biometricKit channel.", buf, 2u);
      }

      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v18 = self->_normalFingerDetectAssertions;
      v19 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v32 != v21)
              objc_enumerationMutation(v18);
            -[SBUIBiometricResource _activateFingerDetectAssertion:](self, "_activateFingerDetectAssertion:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          }
          v20 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v20);
      }
    }
    else
    {
      if (v17)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v16, OS_LOG_TYPE_INFO, "FingerDetection DISABLED through biometricKit channel", buf, 2u);
      }

      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v18 = self->_normalFingerDetectAssertions;
      v23 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v28 != v25)
              objc_enumerationMutation(v18);
            -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j), (_QWORD)v27);
          }
          v24 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
        }
        while (v24);
      }
    }

  }
}

- (void)_reevaluateFaceDetection
{
  int isPresenceDetectionAllowed;
  int isFaceDetectionEnabled;
  NSObject *v5;
  const __CFString *v6;
  NSMutableOrderedSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint8_t v25[128];
  uint8_t buf[4];
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  isPresenceDetectionAllowed = self->_isPresenceDetectionAllowed;
  if (self->_isPresenceDetectionAllowed)
  {
    if (-[NSMutableOrderedSet count](self->_faceDetectAssertions, "count"))
      isPresenceDetectionAllowed = self->_hasPearlHardware;
    else
      isPresenceDetectionAllowed = 0;
  }
  isFaceDetectionEnabled = self->_isFaceDetectionEnabled;
  if (isFaceDetectionEnabled != isPresenceDetectionAllowed)
  {
    self->_isFaceDetectionEnabled = isPresenceDetectionAllowed;
    SBLogBiometricResource();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      if (self->_isFaceDetectionEnabled)
        v6 = CFSTR("ENABLED");
      else
        v6 = CFSTR("DISABLED");
      *(_DWORD *)buf = 138412290;
      v27 = v6;
      _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_INFO, "FaceDetection %@", buf, 0xCu);
    }

    isFaceDetectionEnabled = self->_isFaceDetectionEnabled;
  }
  if (isFaceDetectionEnabled)
  {
    v22 = 0uLL;
    v23 = 0uLL;
    v20 = 0uLL;
    v21 = 0uLL;
    v7 = self->_faceDetectAssertions;
    v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          -[SBUIBiometricResource _activateFaceDetectAssertion:](self, "_activateFaceDetectAssertion:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
        }
        v9 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v9);
    }
  }
  else
  {
    v18 = 0uLL;
    v19 = 0uLL;
    v16 = 0uLL;
    v17 = 0uLL;
    v7 = self->_faceDetectAssertions;
    v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v17;
      do
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v7);
          -[SBUIBiometricResource _deactivateAssertion:](self, "_deactivateAssertion:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j), (_QWORD)v16);
        }
        v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }
  }

}

- (void)_updateHandlersForEvent:(unint64_t)a3
{
  unint64_t lastEvent;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  BOOL v10;
  SBUIBiometricResource *v11;
  unint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  lastEvent = self->_lastEvent;
  self->_lastEvent = a3;
  if (a3 != 4)
    goto LABEL_37;
  v6 = self->_isMatchingEnabled
     ? -[SBUIBiometricAuthenticationPolicy shouldRelockAfterBioUnlock](self->_authenticationPolicy, "shouldRelockAfterBioUnlock") ^ 1: 0;
  if (lastEvent == 4)
    goto LABEL_37;
  SBLogBiometricResource();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromBOOL();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIBiometricAuthenticationPolicy shouldRelockAfterBioUnlock](self->_authenticationPolicy, "shouldRelockAfterBioUnlock");
    NSStringFromBOOL();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v25 = v8;
    v26 = 2112;
    v27 = v9;
    _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_INFO, "_isMatchingEnabled: %@, [_authenticationPolicy shouldRelockAfterBioUnlock]: %@", buf, 0x16u);

  }
  if ((v6 & 1) != 0)
  {
LABEL_37:
    if (self->_isMatchingEnabled)
    {
      if (a3 == 1)
      {
        v10 = 1;
        goto LABEL_22;
      }
      if (!a3)
      {
        v10 = 0;
        goto LABEL_22;
      }
      -[SBUIBiometricResource _notifyObserversOfEvent:](self, "_notifyObserversOfEvent:", a3);
      if (a3 == 4)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __49__SBUIBiometricResource__updateHandlersForEvent___block_invoke;
        block[3] = &unk_1E4C3E408;
        block[4] = self;
        dispatch_async(MEMORY[0x1E0C80D38], block);
      }
    }
    else
    {
      if (!a3 && self->_shouldSendFingerOffNotification)
      {
        self->_shouldSendFingerOffNotification = 0;
        v11 = self;
        v12 = 0;
LABEL_24:
        -[SBUIBiometricResource _notifyObserversOfEvent:](v11, "_notifyObserversOfEvent:", v12);
        return;
      }
      if (self->_isForegroundFingerDetectionEnabled)
      {
        if (a3 > 1)
        {
LABEL_23:
          v11 = self;
          v12 = a3;
          goto LABEL_24;
        }
        v10 = a3 == 1;
LABEL_22:
        self->_shouldSendFingerOffNotification = v10;
        goto LABEL_23;
      }
      if (self->_isFaceDetectionEnabled)
      {
        if (a3 == 13)
        {
          v22 = 1;
        }
        else
        {
          if (a3 != 22)
            goto LABEL_23;
          v22 = 0;
        }
        self->_shouldSendFaceOutOfViewNotification = v22;
        goto LABEL_23;
      }
    }
  }
  else
  {
    SBLogBiometricResource();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SBUIBiometricResource _updateHandlersForEvent:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "lockDeviceImmediately:", 1);

  }
}

void __49__SBUIBiometricResource__updateHandlersForEvent___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("SBBiometricEventMonitorHasAuthenticated"), *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversOfEvent:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v10, "biometricResource:observeEvent:", self, a3);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (SBUIBiometricAuthenticationPolicy)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void)setAuthenticationPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationPolicy, a3);
}

- (SBFCredentialSet)unlockCredentialSet
{
  return self->_unlockCredentialSet;
}

- (void)setUnlockCredentialSet:(id)a3
{
  objc_storeStrong((id *)&self->_unlockCredentialSet, a3);
}

- (BOOL)isMatchingEnabled
{
  return self->_isMatchingEnabled;
}

- (BOOL)isMatchingAllowed
{
  return self->_isMatchingAllowed;
}

- (SBFMobileKeyBag)_keybagInterface
{
  return self->_keybag;
}

- (void)_setKeybagInterface:(id)a3
{
  objc_storeStrong((id *)&self->_keybag, a3);
}

- (_SBUIBiometricKitInterface)_biometricKitInterface
{
  return self->_biometricInterface;
}

- (void)_setBiometricKitInterface:(id)a3
{
  objc_storeStrong((id *)&self->_biometricInterface, a3);
}

- (MCProfileConnection)_profileConnection
{
  return self->_profileConnection;
}

- (void)_setProfileConnection:(id)a3
{
  objc_storeStrong((id *)&self->_profileConnection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationPolicy, 0);
  objc_storeStrong((id *)&self->_simulatedLockoutAssertions, 0);
  objc_storeStrong((id *)&self->_faceDetectAssertions, 0);
  objc_storeStrong((id *)&self->_HIDEventsOnlyFingerDetectAssertions, 0);
  objc_storeStrong((id *)&self->_normalFingerDetectAssertions, 0);
  objc_storeStrong((id *)&self->_matchAssertions, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_unlockCredentialSet, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_authPolicy, 0);
  objc_storeStrong((id *)&self->_profileConnection, 0);
  objc_storeStrong((id *)&self->_biometricInterface, 0);
}

- (void)_reallyResumeMatchingForAssertion:(_QWORD *)a3 advisory:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  objc_msgSend(a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1A471F000, a4, OS_LOG_TYPE_ERROR, "Could not disable auto-retry: %@", a1, 0xCu);

}

- (void)_activateMatchAssertion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A471F000, v0, (uint64_t)v0, "Failed to create operations for match assertion %{public}@ with error %{public}@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __49__SBUIBiometricResource__activateMatchAssertion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1A471F000, v0, v1, "Failed to activate match assertion %{public}@ with error %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_activateFingerDetectAssertion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A471F000, v0, (uint64_t)v0, "Failed to create operations for finger detection assertion %{public}@ with error %{public}@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __56__SBUIBiometricResource__activateFingerDetectAssertion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1A471F000, v0, v1, "Failed to activate finger detection assertion %{public}@ with error %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_activateFaceDetectAssertion:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_3(&dword_1A471F000, v0, (uint64_t)v0, "Failed to create operations for face detection assertion %{public}@ with error %{public}@", v1);
  OUTLINED_FUNCTION_1_0();
}

void __54__SBUIBiometricResource__activateFaceDetectAssertion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_3(&dword_1A471F000, v0, v1, "Failed to activate face detection assertion %{public}@ with error %{public}@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_updateHandlersForEvent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1A471F000, a1, a3, "Relocking keybag because we think we should do so (matching disabled but received a bioUnlock event).", a5, a6, a7, a8, 0);
}

@end
