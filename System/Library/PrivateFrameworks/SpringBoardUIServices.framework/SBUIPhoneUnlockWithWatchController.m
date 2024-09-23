@implementation SBUIPhoneUnlockWithWatchController

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_7);
  return (id)sharedInstance___sharedInstance_0;
}

void __52__SBUIPhoneUnlockWithWatchController_sharedInstance__block_invoke()
{
  SBUIPhoneUnlockWithWatchController *v0;
  void *v1;

  v0 = objc_alloc_init(SBUIPhoneUnlockWithWatchController);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

- (SBUIPhoneUnlockWithWatchController)init
{
  SBUIPhoneUnlockWithWatchController *v2;
  SBUIPhoneUnlockWithWatchController *v3;
  SFAutoUnlockManager *v4;
  SFAutoUnlockManager *autoUnlockManager;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIPhoneUnlockWithWatchController;
  v2 = -[SBUIPhoneUnlockWithWatchController init](&v7, sel_init);
  v3 = v2;
  if (v2 && -[SBUIPhoneUnlockWithWatchController phoneUnlockWithWatchSupported](v2, "phoneUnlockWithWatchSupported"))
  {
    v4 = (SFAutoUnlockManager *)objc_alloc_init(MEMORY[0x1E0D973E0]);
    autoUnlockManager = v3->_autoUnlockManager;
    v3->_autoUnlockManager = v4;

    -[SFAutoUnlockManager setDelegate:](v3->_autoUnlockManager, "setDelegate:", v3);
  }
  return v3;
}

- (void)setBiometricResource:(id)a3
{
  SBUIBiometricResource *v5;
  SBUIBiometricResource *biometricResource;
  SBUIBiometricResource *v7;
  SBUIBiometricResource *v8;

  v5 = (SBUIBiometricResource *)a3;
  biometricResource = self->_biometricResource;
  v8 = v5;
  if (biometricResource != v5)
  {
    -[SBUIBiometricResource removeObserver:](biometricResource, "removeObserver:", self);
    objc_storeStrong((id *)&self->_biometricResource, a3);
    v7 = self->_biometricResource;
    if (v7)
      -[SBUIBiometricResource addObserver:](v7, "addObserver:", self);
  }

}

- (BOOL)phoneUnlockWithWatchSupported
{
  return objc_msgSend(MEMORY[0x1E0D973E0], "autoUnlockSupported");
}

- (BOOL)phoneUnlockWithWatchEnabled
{
  return objc_msgSend(MEMORY[0x1E0D973E0], "autoUnlockEnabled");
}

- (BOOL)showRawErrorCodes
{
  SBUIPhoneUnlockWithWatchController *v2;
  void *v3;

  v2 = self;
  -[SBUIPhoneUnlockWithWatchController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "phoneUnlockWithWatchControllerShowRawErrorCodes:", v2);

  return (char)v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)handleScreenOff
{
  *(_WORD *)&self->_significantUserInteractionOccuredSinceScreenOn = 0;
  *(_DWORD *)&self->_bottomFaceOccludedSinceScreenOn = 0;
}

- (void)setWakeSourceIsUserAction:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  if (self->_wakeSourceIsUserAction != a3)
  {
    self->_wakeSourceIsUserAction = a3;
    if (a3)
    {
      if (-[SBUIPhoneUnlockWithWatchController phoneUnlockWithWatchEnabled](self, "phoneUnlockWithWatchEnabled"))
      {
        -[SBUIPhoneUnlockWithWatchController _autoUnlockManager](self, "_autoUnlockManager");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "prewarmAutoUnlock");

        SBLogPhoneUnlockWithWatch();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v6 = 0;
          _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Prewarm phone unlock with watch for user action wake source", v6, 2u);
        }

      }
    }
  }
}

- (void)attemptPhoneUnlockWithWatch
{
  NSObject *v3;
  const char *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v12[8];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (-[SBUIPhoneUnlockWithWatchController phoneUnlockWithWatchEnabled](self, "phoneUnlockWithWatchEnabled"))
  {
    if (-[SBUIBiometricResource biometricLockoutState](self->_biometricResource, "biometricLockoutState"))
    {
      SBLogPhoneUnlockWithWatch();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v12 = 0;
        v4 = "Not attempting phone unlock with watch because of biolockout";
LABEL_7:
        _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, v4, v12, 2u);
      }
    }
    else
    {
      if (!-[SBUIPhoneUnlockWithWatchController didDetectFaceRequirementsForPAU](self, "didDetectFaceRequirementsForPAU"))
      {
        SBLogPhoneUnlockWithWatch();
        v3 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        *(_WORD *)v12 = 0;
        v4 = "Not attempting phone unlock with watch because face requirements not met";
        goto LABEL_7;
      }
      if (!self->_wakeSourceIsUserAction
        && !self->_significantUserInteractionOccuredSinceScreenOn
        && !self->_liftToWakeGestureDetectedSinceScreenOn)
      {
        SBLogPhoneUnlockWithWatch();
        v3 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
          goto LABEL_8;
        *(_WORD *)v12 = 0;
        v4 = "Not attempting phone unlock with watch because not enough user interaction";
        goto LABEL_7;
      }
      +[SBUIPeriocularController sharedInstance](SBUIPeriocularController, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "periocularEnabled");

      SBLogPhoneUnlockWithWatch();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v8)
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch without notification", v12, 2u);
        }

        -[SBUIPhoneUnlockWithWatchController _autoUnlockManager](self, "_autoUnlockManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attemptAutoUnlockWithoutNotifyingWatch");
      }
      else
      {
        if (v8)
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch", v12, 2u);
        }

        -[SBUIPhoneUnlockWithWatchController _autoUnlockManager](self, "_autoUnlockManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "attemptAutoUnlock");
      }

      v13[0] = CFSTR("bottomFaceOcclusion");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bottomFaceOccludedSinceScreenOn);
      v3 = objc_claimAutoreleasedReturnValue();
      v13[1] = CFSTR("anyFaceOcclusion");
      v14[0] = v3;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_faceOccludedSinceScreenOn);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBUIPhoneUnlockWithWatchController _sendCoreAnalyticsEventWithPayload:](self, "_sendCoreAnalyticsEventWithPayload:", v11);

    }
  }
  else
  {
    SBLogPhoneUnlockWithWatch();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      v4 = "Not attempting phone unlock with watch because feature not enabled";
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (BOOL)didDetectFaceRequirementsForPAU
{
  return (self->_bottomFaceOccludedSinceScreenOn
       || self->_faceOccludedSinceScreenOn && _os_feature_enabled_impl())
      && self->_faceWUPoseEligibleSinceScreenOn;
}

- (BOOL)shouldPhoneCompleteAutoUnlockWithNotification
{
  void *v3;
  int v4;
  BOOL result;

  result = 0;
  if (-[SBUIPhoneUnlockWithWatchController phoneUnlockWithWatchEnabled](self, "phoneUnlockWithWatchEnabled"))
  {
    +[SBUIPeriocularController sharedInstance](SBUIPeriocularController, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "periocularEnabled");

    if (v4)
    {
      if (-[SBUIPhoneUnlockWithWatchController didDetectFaceRequirementsForPAU](self, "didDetectFaceRequirementsForPAU"))
      {
        return 1;
      }
    }
  }
  return result;
}

- (void)completePhoneAutoUnlockWithNotification:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  if (-[SBUIPhoneUnlockWithWatchController shouldPhoneCompleteAutoUnlockWithNotification](self, "shouldPhoneCompleteAutoUnlockWithNotification"))
  {
    SBLogPhoneUnlockWithWatch();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Complete phone unlock with watch notification: %{public}@", (uint8_t *)&v8, 0xCu);

    }
    -[SBUIPhoneUnlockWithWatchController _autoUnlockManager](self, "_autoUnlockManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "completeAutoUnlockWithNotification:", v3);

  }
}

- (void)_handleUnlockAttemptSucceeded
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "phoneUnlockWithWatchControllerAttemptSucceeded:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_handleUnlockAttemptFailedWithError:(id)a3
{
  id v4;
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
  v4 = a3;
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
          objc_msgSend(v10, "phoneUnlockWithWatchControllerAttemptFailed:withError:", self, v4);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (void)_sendCoreAnalyticsEventWithPayload:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  AnalyticsSendEventLazy();

}

id __73__SBUIPhoneUnlockWithWatchController__sendCoreAnalyticsEventWithPayload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)_autoUnlockManager
{
  SFAutoUnlockManager *testAutoUnlockManager;

  testAutoUnlockManager = self->_testAutoUnlockManager;
  if (!testAutoUnlockManager)
    testAutoUnlockManager = self->_autoUnlockManager;
  return testAutoUnlockManager;
}

- (void)biometricResource:(id)a3 observeEvent:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  uint64_t v12;
  uint8_t buf[16];
  __int16 v14;

  v6 = a3;
  if ((uint64_t)a4 > 27)
  {
    if (a4 == 28)
    {
      self->_bottomFaceOccludedSinceScreenOn = 1;
      SBLogPhoneUnlockWithWatch();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
LABEL_16:

        goto LABEL_17;
      }
      LOWORD(v12) = 0;
      v9 = "Bottom face occluded since screen on";
      v10 = (uint8_t *)&v12;
    }
    else
    {
      if (a4 != 29)
        goto LABEL_18;
      self->_faceWUPoseEligibleSinceScreenOn = 1;
      SBLogPhoneUnlockWithWatch();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        goto LABEL_16;
      v14 = 0;
      v9 = "Face WU pose eligibile since screen on";
      v10 = (uint8_t *)&v14;
    }
    _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    goto LABEL_16;
  }
  if (a4 == 4)
  {
    -[SBUIPhoneUnlockWithWatchController _autoUnlockManager](self, "_autoUnlockManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "donateDeviceUnlockedWithMask:", 1);

    goto LABEL_18;
  }
  if (a4 == 21)
  {
    self->_faceOccludedSinceScreenOn = 1;
    SBLogPhoneUnlockWithWatch();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Face occluded since screen on", buf, 2u);
    }

    if (_os_feature_enabled_impl())
LABEL_17:
      -[SBUIPhoneUnlockWithWatchController attemptPhoneUnlockWithWatch](self, "attemptPhoneUnlockWithWatch", v12);
  }
LABEL_18:

}

- (void)manager:(id)a3 beganAttemptWithDevice:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  SBLogPhoneUnlockWithWatch();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v4;
    _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch began with device: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

- (void)manager:(id)a3 completedUnlockWithDevice:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBUIPhoneUnlockWithWatchController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__SBUIPhoneUnlockWithWatchController_manager_completedUnlockWithDevice___block_invoke;
  v7[3] = &unk_1E4C3E6A0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __72__SBUIPhoneUnlockWithWatchController_manager_completedUnlockWithDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogPhoneUnlockWithWatch();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch completed with device: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_handleUnlockAttemptSucceeded");
}

- (void)manager:(id)a3 failedAttemptWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  SBUIPhoneUnlockWithWatchController *v9;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__SBUIPhoneUnlockWithWatchController_manager_failedAttemptWithError___block_invoke;
  v7[3] = &unk_1E4C3E6A0;
  v8 = v5;
  v9 = self;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __69__SBUIPhoneUnlockWithWatchController_manager_failedAttemptWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogPhoneUnlockWithWatch();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_DEFAULT, "Attempt phone unlock with watch failed with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_handleUnlockAttemptFailedWithError:", *(_QWORD *)(a1 + 32));
}

- (id)_testAutoUnlockManager
{
  return self->_testAutoUnlockManager;
}

- (void)setTestAutoUnlockManager:(id)a3
{
  SFAutoUnlockManager *v5;
  SFAutoUnlockManager **p_testAutoUnlockManager;
  SFAutoUnlockManager *testAutoUnlockManager;
  SFAutoUnlockManager *v8;

  v5 = (SFAutoUnlockManager *)a3;
  testAutoUnlockManager = self->_testAutoUnlockManager;
  p_testAutoUnlockManager = &self->_testAutoUnlockManager;
  if (testAutoUnlockManager != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_testAutoUnlockManager, a3);
    v5 = v8;
  }

}

- (void)setBottomFaceOccludedSinceScreenOn:(BOOL)a3
{
  if (self->_bottomFaceOccludedSinceScreenOn != a3)
    self->_bottomFaceOccludedSinceScreenOn = a3;
}

- (void)setFaceWUPoseEligibleSinceScreenOn:(BOOL)a3
{
  if (self->_faceWUPoseEligibleSinceScreenOn != a3)
    self->_faceWUPoseEligibleSinceScreenOn = a3;
}

- (void)setFaceOccludedSinceScreenOn:(BOOL)a3
{
  if (self->_faceOccludedSinceScreenOn != a3)
    self->_faceOccludedSinceScreenOn = a3;
}

- (SBUIPhoneUnlockWithWatchControllerDelegate)delegate
{
  return (SBUIPhoneUnlockWithWatchControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (BOOL)wakeSourceIsUserAction
{
  return self->_wakeSourceIsUserAction;
}

- (BOOL)significantUserInteractionOccuredSinceScreenOn
{
  return self->_significantUserInteractionOccuredSinceScreenOn;
}

- (void)setSignificantUserInteractionOccuredSinceScreenOn:(BOOL)a3
{
  self->_significantUserInteractionOccuredSinceScreenOn = a3;
}

- (BOOL)liftToWakeGestureDetectedSinceScreenOn
{
  return self->_liftToWakeGestureDetectedSinceScreenOn;
}

- (void)setLiftToWakeGestureDetectedSinceScreenOn:(BOOL)a3
{
  self->_liftToWakeGestureDetectedSinceScreenOn = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_testAutoUnlockManager, 0);
  objc_storeStrong((id *)&self->_autoUnlockManager, 0);
}

@end
