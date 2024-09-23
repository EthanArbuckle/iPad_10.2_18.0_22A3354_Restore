@implementation SBLiftToWakeController

+ (id)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_148);
  return (id)sharedController_sController;
}

void __42__SBLiftToWakeController_sharedController__block_invoke()
{
  SBLiftToWakeController *v0;
  void *v1;

  v0 = objc_alloc_init(SBLiftToWakeController);
  v1 = (void *)sharedController_sController;
  sharedController_sController = (uint64_t)v0;

}

- (SBLiftToWakeController)init
{
  void *v3;
  void *v4;
  void *v5;
  SBLiftToWakeController *v6;

  +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "idleTimerDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBLiftToWakeController initWithBacklightController:idleTimerDefaults:](self, "initWithBacklightController:idleTimerDefaults:", v3, v5);

  return v6;
}

- (SBLiftToWakeController)initWithBacklightController:(id)a3 idleTimerDefaults:(id)a4
{
  id v6;
  id v7;
  SBLiftToWakeController *v8;
  void *v9;
  void *v10;
  SBIdleTimerDefaults *idleTimerDefaults;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  SBWakeDebounceFilter *v16;
  SBWakeDebounceFilter *bumpToWakeDebounceFilter;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  objc_super v25;

  v6 = a3;
  v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBLiftToWakeController;
  v8 = -[SBLiftToWakeController init](&v25, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v8, sel__handleBacklightLevelChanged_, *MEMORY[0x1E0DAC2F8], 0);

    objc_msgSend(MEMORY[0x1E0D00F58], "sharedBacklight");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:", v8);

    v8->_screenOn = objc_msgSend(v6, "screenIsOn");
    objc_initWeak(&location, v8);
    objc_storeStrong((id *)&v8->_idleTimerDefaults, a4);
    idleTimerDefaults = v8->_idleTimerDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "supportLiftToWake");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
    v19 = MEMORY[0x1E0C809B0];
    v20 = 3221225472;
    v21 = __72__SBLiftToWakeController_initWithBacklightController_idleTimerDefaults___block_invoke;
    v22 = &unk_1E8E9DF28;
    objc_copyWeak(&v23, &location);
    v15 = (id)-[SBIdleTimerDefaults observeDefault:onQueue:withBlock:](idleTimerDefaults, "observeDefault:onQueue:withBlock:", v12, v13, &v19);

    -[SBLiftToWakeController _reconsiderEnablement](v8, "_reconsiderEnablement", v19, v20, v21, v22);
    v16 = objc_alloc_init(SBWakeDebounceFilter);
    bumpToWakeDebounceFilter = v8->_bumpToWakeDebounceFilter;
    v8->_bumpToWakeDebounceFilter = v16;

    -[SBWakeDebounceFilter setFilterInterval:](v8->_bumpToWakeDebounceFilter, "setFilterInterval:", 300.0);
    -[SBWakeDebounceFilter setIntervalActivationLimit:](v8->_bumpToWakeDebounceFilter, "setIntervalActivationLimit:", 10);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __72__SBLiftToWakeController_initWithBacklightController_idleTimerDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reconsiderEnablement");

}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInt:withName:", LODWORD(self->_wakeGestureState), CFSTR("wakeGestureState"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", self->_screenOn, CFSTR("screenOn"));
  v6 = (id)objc_msgSend(v3, "appendBool:withName:", self->_isEnabled, CFSTR("enabled"));
  v7 = (id)objc_msgSend(v3, "appendBool:withName:", self->_observingCMWakeGestureManager, CFSTR("observingCMWakeGestureManager"));
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", self->_observers, CFSTR("observers"));
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)addObserver:(id)a3
{
  NSHashTable *observers;
  NSHashTable *v5;
  NSHashTable *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssertMain();
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);
  if (self->_isEnabled)
    -[SBLiftToWakeController _startObservingIfNecessary](self, "_startObservingIfNecessary");

}

- (void)removeObserver:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);

  if (!-[NSHashTable count](self->_observers, "count"))
    -[SBLiftToWakeController _stopObservingIfNecessary](self, "_stopObservingIfNecessary");
}

- (id)acquireBumpToWakeEnableAssertionForReason:(id)a3
{
  id v4;
  BSCompoundAssertion *bumpToWakeAssertions;
  void *v6;
  BSCompoundAssertion *v7;
  BSCompoundAssertion *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  bumpToWakeAssertions = self->_bumpToWakeAssertions;
  if (!bumpToWakeAssertions)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0D01718];
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __68__SBLiftToWakeController_acquireBumpToWakeEnableAssertionForReason___block_invoke;
    v14 = &unk_1E8EA3688;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v6, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("SBLiftToWakeController bump-to-wake"), &v11);
    v7 = (BSCompoundAssertion *)objc_claimAutoreleasedReturnValue();
    v8 = self->_bumpToWakeAssertions;
    self->_bumpToWakeAssertions = v7;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    bumpToWakeAssertions = self->_bumpToWakeAssertions;
  }
  -[BSCompoundAssertion acquireForReason:](bumpToWakeAssertions, "acquireForReason:", v4, v11, v12, v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __68__SBLiftToWakeController_acquireBumpToWakeEnableAssertionForReason___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reconsiderEnablement");

}

- (void)_ignoredTransition:(int64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogLiftToWake();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v6 = CFSTR("<unknown>");
    else
      v6 = off_1E8EADA48[a3 - 1];
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: intentionally ignored transition: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  -[SBLiftToWakeController _sendIgnoredTransitionToObservers:](self, "_sendIgnoredTransitionToObservers:", a3);
}

- (void)_screenTurnedOff
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "SBLiftToWakeController: screen turned off", a5, a6, a7, a8, 0);
}

- (void)_screenTurnedOn
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "SBLiftToWakeController: screen turned on", a5, a6, a7, a8, 0);
}

- (BOOL)_isObservingWakeGestureManager
{
  return self->_observingCMWakeGestureManager;
}

- (void)_reconsiderEnablement
{
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  v3 = objc_msgSend(MEMORY[0x1E0CA5708], "isWakeGestureAvailable");
  if (v3)
  {
    if ((-[SBIdleTimerDefaults supportLiftToWake](self->_idleTimerDefaults, "supportLiftToWake") & 1) != 0)
      v3 = 1;
    else
      v3 = -[BSCompoundAssertion isActive](self->_bumpToWakeAssertions, "isActive");
  }
  if (self->_isEnabled == v3)
  {
    if (-[BSCompoundAssertion isActive](self->_bumpToWakeAssertions, "isActive"))
      -[SBLiftToWakeController _startObservingBumpsIfNecessary](self, "_startObservingBumpsIfNecessary");
    else
      -[SBLiftToWakeController _stopObservingBumpsIfNecessary](self, "_stopObservingBumpsIfNecessary");
  }
  else
  {
    self->_isEnabled = v3;
    SBLogLiftToWake();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromBOOL();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CA5708], "isWakeGestureAvailable");
      NSStringFromBOOL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIdleTimerDefaults supportLiftToWake](self->_idleTimerDefaults, "supportLiftToWake");
      NSStringFromBOOL();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[BSCompoundAssertion isActive](self->_bumpToWakeAssertions, "isActive");
      *(_DWORD *)buf = 138544130;
      v21 = v5;
      v22 = 2114;
      v23 = v6;
      v24 = 2114;
      v25 = v7;
      v26 = 1024;
      v27 = v8;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Lift to wake enablement changed to: %{public}@ (Available: %{public}@, UserPref: %{public}@, Bump: %{BOOL}u)", buf, 0x26u);

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v9 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v16 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v14, "liftToWakeControllerEnablementDidChange:", self);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v11);
    }

    if (self->_isEnabled)
    {
      if (-[NSHashTable count](self->_observers, "count"))
        -[SBLiftToWakeController _startObservingIfNecessary](self, "_startObservingIfNecessary");
    }
    else
    {
      -[SBLiftToWakeController _stopObservingIfNecessary](self, "_stopObservingIfNecessary");
    }
  }
}

- (void)_handleBacklightLevelChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  int v13;
  NSObject *v14;
  _BOOL4 v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DAC308]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");
  v8 = v7;

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DAC300]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_msgSend(v5, "objectForKey:", *MEMORY[0x1E0DAC2E8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  SBLogLiftToWake();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[SBLiftToWakeController _handleBacklightLevelChanged:].cold.1((uint64_t)v4, v14);

  v15 = v11 > 0.0 && v8 <= 0.0;
  if (v13 != 13)
  {
    if (v8 <= 0.0 || v11 > 0.0)
    {
      if (v15)
        -[SBLiftToWakeController _screenTurnedOn](self, "_screenTurnedOn");
    }
    else
    {
      -[SBLiftToWakeController _screenTurnedOff](self, "_screenTurnedOff");
    }
  }

}

- (void)_startObservingIfNecessary
{
  NSObject *v3;
  CMWakeGestureManager *v4;
  CMWakeGestureManager *wakeGestureManager;
  uint8_t v6[16];

  if (!self->_observingCMWakeGestureManager && self->_isEnabled && -[NSHashTable count](self->_observers, "count"))
  {
    self->_wakeGestureState = 0;
    SBLogLiftToWake();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Starting to observe the CMWakeGestureManager.", v6, 2u);
    }

    self->_observingCMWakeGestureManager = 1;
    objc_msgSend(MEMORY[0x1E0CA5708], "sharedManager");
    v4 = (CMWakeGestureManager *)objc_claimAutoreleasedReturnValue();
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = v4;

    -[CMWakeGestureManager setDelegate:](self->_wakeGestureManager, "setDelegate:", self);
    -[CMWakeGestureManager startWakeGestureUpdates](self->_wakeGestureManager, "startWakeGestureUpdates");
  }
  -[SBLiftToWakeController _startObservingBumpsIfNecessary](self, "_startObservingBumpsIfNecessary");
}

- (void)_stopObservingIfNecessary
{
  CMWakeGestureManager *wakeGestureManager;
  NSObject *v4;
  uint8_t v5[16];

  -[SBLiftToWakeController _stopObservingBumpsIfNecessary](self, "_stopObservingBumpsIfNecessary");
  if (self->_observingCMWakeGestureManager)
  {
    self->_observingCMWakeGestureManager = 0;
    -[CMWakeGestureManager stopWakeGestureUpdates](self->_wakeGestureManager, "stopWakeGestureUpdates");
    wakeGestureManager = self->_wakeGestureManager;
    self->_wakeGestureManager = 0;

    SBLogLiftToWake();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Stopped observing the CMWakeGestureManager.", v5, 2u);
    }

  }
}

- (void)_startObservingBumpsIfNecessary
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (self->_observingCMWakeGestureManager)
  {
    v3 = -[BSCompoundAssertion isActive](self->_bumpToWakeAssertions, "isActive");
    SBLogLiftToWake();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = v3;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "Setting nightStandWakeEnabled to %{BOOL}u.", (uint8_t *)v5, 8u);
    }

    -[CMWakeGestureManager setNightStandWakeEnabled:withConfiguration:](self->_wakeGestureManager, "setNightStandWakeEnabled:withConfiguration:", v3, 2);
  }
}

- (void)_stopObservingBumpsIfNecessary
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogLiftToWake();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Setting nightStandWakeEnabled to NO", v4, 2u);
  }

  -[CMWakeGestureManager setNightStandWakeEnabled:withConfiguration:](self->_wakeGestureManager, "setNightStandWakeEnabled:withConfiguration:", 0, 2);
}

- (void)_sendTransitionToObservers:(int64_t)a3 deviceOrientation:(int64_t)a4
{
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogLiftToWake();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v8 = CFSTR("<unknown>");
    else
      v8 = off_1E8EADA48[a3 - 1];
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: sending to observers: %@", buf, 0xCu);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "liftToWakeController:didObserveTransition:deviceOrientation:", self, a3, a4);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_sendIgnoredTransitionToObservers:(int64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  SBLogLiftToWake();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a3 - 1) > 3)
      v6 = CFSTR("<unknown>");
    else
      v6 = off_1E8EADA48[a3 - 1];
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: sending ignored transition to observers: %@", buf, 0xCu);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "liftToWakeController:didIgnoreTransition:", self, a3);
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  uint64_t v5;

  if ((unint64_t)a4 > 3)
    v5 = 0;
  else
    v5 = qword_1D0E89810[a4];
  -[CMWakeGestureManager setBacklightState:](self->_wakeGestureManager, "setBacklightState:", v5);
}

- (void)wakeGestureManager:(id)a3 didUpdateWakeGestureEvent:(id)a4
{
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  double v12;
  unint64_t v13;
  void *v14;
  id v15;
  _QWORD block[5];
  id v17;
  uint64_t v18;
  int v19;
  mach_timebase_info info;

  v6 = a3;
  v7 = a4;
  v8 = wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor;
  if (*(double *)&wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor == 0.0)
  {
    info = 0;
    if (!mach_timebase_info(&info))
    {
      LODWORD(v9) = info.numer;
      LODWORD(v8) = info.denom;
      *(double *)&v8 = (double)v8 / (double)v9 * 1000000000.0;
      wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor = v8;
    }
  }
  v10 = objc_msgSend(v7, "orientation", *(double *)&v8);
  v11 = objc_msgSend(v7, "state");
  objc_msgSend(v7, "timestamp");
  if (v11 == 1)
  {
    v13 = (unint64_t)(v12 * *(double *)&wakeGestureManager_didUpdateWakeGestureEvent__secondsToTicksScaleFactor);
    objc_msgSend(MEMORY[0x1E0DA9FC8], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "wakeMayBegin:withTimestamp:", 2, v13);

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SBLiftToWakeController_wakeGestureManager_didUpdateWakeGestureEvent___block_invoke;
  block[3] = &unk_1E8EADA28;
  v19 = v10;
  v17 = v7;
  v18 = v11;
  block[4] = self;
  v15 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __71__SBLiftToWakeController_wakeGestureManager_didUpdateWakeGestureEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  int v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned int *)(a1 + 56);
  SBLogLiftToWake();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 48);
    BSDeviceOrientationDescription();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 67109378;
    v21 = v4;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: updated wake gesture state received:%d %@", (uint8_t *)&v20, 0x12u);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 16);
  *(_QWORD *)(v6 + 16) = *(_QWORD *)(a1 + 48);
  v8 = objc_msgSend(*(id *)(a1 + 40), "type");
  v9 = *(_QWORD *)(a1 + 32);
  if (v8 == 7)
  {
    if (objc_msgSend(*(id *)(v9 + 48), "isActive"))
    {
      v10 = *(_QWORD *)(a1 + 32);
      if (*(_QWORD *)(a1 + 48) != 1)
      {
LABEL_23:
        v17 = 4;
LABEL_29:
        objc_msgSend((id)v10, "_ignoredTransition:", v17);
        return;
      }
      if (objc_msgSend(*(id *)(v10 + 56), "wakeEventOccurred"))
      {
        v10 = *(_QWORD *)(a1 + 32);
        v11 = 4;
LABEL_13:
        objc_msgSend((id)v10, "_sendTransitionToObservers:deviceOrientation:", v11, v2);
        return;
      }
      SBLogLiftToWake();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "debounce filter rejected bump event", (uint8_t *)&v20, 2u);
      }

    }
    v10 = *(_QWORD *)(a1 + 32);
    goto LABEL_23;
  }
  if (!objc_msgSend(*(id *)(v9 + 32), "supportLiftToWake"))
    goto LABEL_27;
  v12 = *(_QWORD *)(a1 + 48);
  if ((unint64_t)(v12 - 2) < 2)
  {
    v10 = *(_QWORD *)(a1 + 32);
    if ((v7 & 0xFFFFFFFFFFFFFFFELL) != 2 && *(_BYTE *)(v10 + 40))
    {
      v11 = 3;
      goto LABEL_13;
    }
    goto LABEL_28;
  }
  if (v12 != 1)
  {
    SBLogLiftToWake();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = *(_QWORD *)(a1 + 48);
      v20 = 67109120;
      v21 = v19;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "SBLiftToWakeController: wake gesture state not handled -- were we supposed to receive %d ?", (uint8_t *)&v20, 8u);
    }

LABEL_27:
    v10 = *(_QWORD *)(a1 + 32);
LABEL_28:
    v17 = 0;
    goto LABEL_29;
  }
  v13 = *(_BYTE **)(a1 + 32);
  if (v13[40])
    v14 = 2;
  else
    v14 = 1;
  objc_msgSend(v13, "_sendTransitionToObservers:deviceOrientation:", v14, v2);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "postNotificationName:object:", *MEMORY[0x1E0DAC348], *(_QWORD *)(a1 + 32));

}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (SBIdleTimerDefaults)_idleTimerDefaults
{
  return self->_idleTimerDefaults;
}

- (void)_setIdleTimerDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_idleTimerDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bumpToWakeDebounceFilter, 0);
  objc_storeStrong((id *)&self->_bumpToWakeAssertions, 0);
  objc_storeStrong((id *)&self->_idleTimerDefaults, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_wakeGestureManager, 0);
}

- (void)_handleBacklightLevelChanged:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "SBLiftToWakeController: backlight changed: %@", (uint8_t *)&v2, 0xCu);
}

@end
