@implementation TIKeyboardActivityController

- (void)notifyTransitionWithContext:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TIKeyboardActivityOSLogFacility();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Notifying observers of activity state transition from %u to %u"), "-[TIKeyboardActivityController notifyTransitionWithContext:]", objc_msgSend(v4, "fromState"), objc_msgSend(v4, "toState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v6;
    _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TIKeyboardActivityController observers](self, "observers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "keyboardActivityDidTransition:", v4);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)keyboardAssertionsDidChange
{
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAssertions");

  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (v4)
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Invalidating inactivity timer"), "-[TIKeyboardActivityController keyboardAssertionsDidChange]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v8;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIKeyboardActivityController inactivityTimer](self, "inactivityTimer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "invalidate");

    self->_hadRecentActivity = 1;
    -[TIKeyboardActivityController setKeyboardDirtyIfNecessaryWithReason:](self, "setKeyboardDirtyIfNecessaryWithReason:", CFSTR("keyboardAssertionsDidChange"));
  }
  else
  {
    if (TICanLogMessageAtLevel_logLevel >= 2)
    {
      TIOSLogFacility();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Setting inactivity timer"), "-[TIKeyboardActivityController keyboardAssertionsDidChange]");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v11 = v9;
        _os_log_debug_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    -[TIKeyboardActivityController touchInactivityTimer](self, "touchInactivityTimer");
    -[TIKeyboardActivityController updateActivityState](self, "updateActivityState");
    -[TIKeyboardActivityController setKeyboardCleanIfNecessary](self, "setKeyboardCleanIfNecessary");
  }
}

- (void)updateActivityState
{
  unint64_t activityState;
  unint64_t v4;
  void *v5;
  id v6;

  activityState = self->_activityState;
  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "hasAssertions") & 1) != 0)
  {
    v4 = 1;
  }
  else if (self->_hadRecentActivity)
  {
    v4 = 2;
  }
  else
  {
    v4 = 3;
  }
  self->_activityState = v4;
  if (activityState != v4)
  {
    self->_inactiveMemoryPressureCount = 0;
    +[TIKeyboardActivityContext contextFromState:toState:](TIKeyboardActivityContext, "contextFromState:toState:", activityState);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setExcessMemoryInBytes:", getExcessMemoryInBytes());
    -[TIKeyboardActivityController notifyTransitionWithContext:](self, "notifyTransitionWithContext:", v5);

  }
}

- (void)inactivityTimerFired:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t buf[4];
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel)
  {
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Keyboard inactivity timer fired."), "-[TIKeyboardActivityController inactivityTimerFired:]");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v7 = v5;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  self->_hadRecentActivity = 0;
  -[TIKeyboardActivityController setKeyboardCleanIfNecessary](self, "setKeyboardCleanIfNecessary");
}

- (void)setKeyboardCleanIfNecessary
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  id v19;
  id location;
  uint8_t v21[4];
  void *v22;
  __int128 buf;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (-[TIKeyboardActivityController shouldBecomeClean](self, "shouldBecomeClean"))
    goto LABEL_2;
  if (!-[TIKeyboardActivityController canGoEarlyClean](self, "canGoEarlyClean"))
  {
    -[TIKeyboardActivityController updateActivityState](self, "updateActivityState");
    return;
  }
  TIKeyboardActivityOSLogFacility();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Keyboard is going early clean."), "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1DA6F2000, v8, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);

  }
  if (!self->_hadRecentActivity)
  {
LABEL_2:
    TIKeyboardActivityOSLogFacility();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Keyboard is becoming clean."), "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);

    }
    self->_isDirty = 0;
    -[TIKeyboardActivityController updateActivityState](self, "updateActivityState");
    objc_initWeak(&location, self);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__6861;
    v26 = __Block_byref_object_dispose__6862;
    -[TIKeyboardActivityController isDirtyTransaction](self, "isDirtyTransaction");
    v27 = (id)objc_claimAutoreleasedReturnValue();
    TIKeyboardActivityOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Setting a block to release the dirty transaction: %p"), "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v21 = 138412290;
      v22 = v6;
      _os_log_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEFAULT, "%@", v21, 0xCu);

    }
    -[TIKeyboardActivityController setIsDirtyTransaction:](self, "setIsDirtyTransaction:", 0);
    v7 = dispatch_time(0, 15000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__TIKeyboardActivityController_setKeyboardCleanIfNecessary__block_invoke;
    block[3] = &unk_1EA0FFA30;
    objc_copyWeak(&v19, &location);
    block[4] = &buf;
    dispatch_after(v7, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v19);
    _Block_object_dispose(&buf, 8);

    objc_destroyWeak(&location);
  }
  else
  {
    -[TIKeyboardActivityController inactivityTimer](self, "inactivityTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isValid");

    if (v11)
    {
      -[TIKeyboardActivityController inactivityTimer](self, "inactivityTimer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "invalidate");

      TIKeyboardActivityOSLogFacility();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Keyboard is going clean in 10 seconds."), "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v14;
        _os_log_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10.0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v15, self, sel_inactivityTimerFired_, 0, 0, 0.0);
      objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addTimer:forMode:", v16, *MEMORY[0x1E0C99748]);

      -[TIKeyboardActivityController setInactivityTimer:](self, "setInactivityTimer:", v16);
    }
    else
    {
      self->_hadRecentActivity = 0;
    }
    -[TIKeyboardActivityController updateActivityState](self, "updateActivityState");
  }
}

- (NSTimer)inactivityTimer
{
  return self->_inactivityTimer;
}

- (void)setKeyboardDirtyIfNecessaryWithReason:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[TIKeyboardActivityController shouldBecomeDirty](self, "shouldBecomeDirty"))
  {
    if (TICanLogMessageAtLevel_onceToken != -1)
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
    if (TICanLogMessageAtLevel_logLevel)
    {
      TIOSLogFacility();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Keyboard is becoming dirty."), "-[TIKeyboardActivityController setKeyboardDirtyIfNecessaryWithReason:]");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v10 = v8;
        _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s.%s"), "com.apple.TextInput.kbd.isDirty", objc_msgSend(objc_retainAutorelease(v4), "UTF8String"));
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "UTF8String");
    v7 = (void *)os_transaction_create();
    -[TIKeyboardActivityController setIsDirtyTransaction:](self, "setIsDirtyTransaction:", v7);

    self->_isDirty = 1;
    -[TIKeyboardActivityController updateActivityState](self, "updateActivityState");

  }
  else
  {
    -[TIKeyboardActivityController updateActivityState](self, "updateActivityState");
  }

}

- (void)setIsDirtyTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_isDirtyTransaction, a3);
}

- (BOOL)shouldBecomeDirty
{
  _BOOL4 v3;
  NSObject *v4;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_isDirty)
    v3 = 0;
  else
    v3 = self->_hadRecentActivity || self->_hasBackgroundActivity;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s result=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d)"), "-[TIKeyboardActivityController shouldBecomeDirty]", v3, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  return v3;
}

- (BOOL)shouldBecomeClean
{
  _BOOL4 v3;
  NSObject *v4;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = self->_isDirty && !self->_hadRecentActivity && !self->_hasBackgroundActivity;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s result=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d)"), "-[TIKeyboardActivityController shouldBecomeClean]", v3, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_debug_impl(&dword_1DA6F2000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  return v3;
}

- (OS_os_transaction)isDirtyTransaction
{
  return self->_isDirtyTransaction;
}

- (void)touchInactivityTimer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[TIKeyboardActivityController inactivityTimer](self, "inactivityTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isValid");

  if ((v4 & 1) == 0)
  {
    v5 = (void *)MEMORY[0x1E0C99D68];
    +[TIKeyboardActivityController keyboardIdleTimeoutInterval](TIKeyboardActivityController, "keyboardIdleTimeoutInterval");
    objc_msgSend(v5, "dateWithTimeIntervalSinceNow:");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E88]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v8, self, sel_inactivityTimerFired_, 0, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", v6, *MEMORY[0x1E0C99748]);

    -[TIKeyboardActivityController setInactivityTimer:](self, "setInactivityTimer:", v6);
  }
}

- (void)setInactivityTimer:(id)a3
{
  objc_storeStrong((id *)&self->_inactivityTimer, a3);
}

- (BOOL)canGoEarlyClean
{
  void *v3;
  char v4;
  char v5;
  NSObject *v6;
  void *v7;
  BOOL v8;
  uint64_t ExcessMemoryInBytes;
  void *v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasAssertions");

  if (self->_isDirty && (self->_hasBackgroundActivity ? (v5 = 1) : (v5 = v4), (v5 & 1) == 0))
  {
    ExcessMemoryInBytes = getExcessMemoryInBytes();
    v8 = ExcessMemoryInBytes == 0;
    TIKeyboardActivityOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s earlycleanbytes=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d, bytesover=%lu)"), "-[TIKeyboardActivityController canGoEarlyClean]", ExcessMemoryInBytes == 0, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity, ExcessMemoryInBytes);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v11;
      _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
  }
  else
  {
    TIKeyboardActivityOSLogFacility();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s earlyclean=%d (isDirty=%d, hadRecentActivity=%d, hasBackgroundActivity=%d)"), "-[TIKeyboardActivityController canGoEarlyClean]", 0, self->_isDirty, self->_hadRecentActivity, self->_hasBackgroundActivity);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v13 = v7;
      _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

+ (double)keyboardIdleTimeoutInterval
{
  double result;

  if ((__hasTestingIdleTimeout & 1) != 0)
    return *(double *)&__testingIdleTimeout;
  +[TIKeyboardActivityController defaultKeyboardIdleTimeoutInterval](TIKeyboardActivityController, "defaultKeyboardIdleTimeoutInterval");
  return result;
}

+ (double)defaultKeyboardIdleTimeoutInterval
{
  if (defaultKeyboardIdleTimeoutInterval_onceToken != -1)
    dispatch_once(&defaultKeyboardIdleTimeoutInterval_onceToken, &__block_literal_global_49);
  return *(double *)&defaultKeyboardIdleTimeoutInterval_defaultIdleTimeout;
}

- (TIKeyboardActivityController)init
{
  TIKeyboardActivityController *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  OS_dispatch_source *memoryPressureSource;
  void *v7;
  OS_os_transaction *isDirtyTransaction;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardActivityController;
  v2 = -[TIKeyboardActivityController init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    -[TIKeyboardActivityController createMemoryPressureSource](v2, "createMemoryPressureSource");
    v5 = objc_claimAutoreleasedReturnValue();
    memoryPressureSource = v2->_memoryPressureSource;
    v2->_memoryPressureSource = (OS_dispatch_source *)v5;

    v2->_activityState = 0;
    +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", v2);
    isDirtyTransaction = v2->_isDirtyTransaction;
    v2->_isDirtyTransaction = 0;

    -[TIKeyboardActivityController updateActivityState](v2, "updateActivityState");
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSTimer invalidate](self->_inactivityTimer, "invalidate");
  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)TIKeyboardActivityController;
  -[TIKeyboardActivityController dealloc](&v4, sel_dealloc);
}

- (void)addActivityObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s Adding observer <%@: %p>"), "-[TIKeyboardActivityController addActivityObserver:]", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__TIKeyboardActivityController_addActivityObserver___block_invoke;
  aBlock[3] = &unk_1EA107030;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v7[2](v7);
  else
    TIDispatchSync();

}

- (void)removeActivityObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (TICanLogMessageAtLevel_onceToken != -1)
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
  if (TICanLogMessageAtLevel_logLevel >= 2)
  {
    TIOSLogFacility();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringWithFormat:", CFSTR("%s Removing observer <%@: %p>"), "-[TIKeyboardActivityController removeActivityObserver:]", v4, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v15 = v11;
      _os_log_debug_impl(&dword_1DA6F2000, v5, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

    }
  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__TIKeyboardActivityController_removeActivityObserver___block_invoke;
  aBlock[3] = &unk_1EA107030;
  aBlock[4] = self;
  v6 = v4;
  v13 = v6;
  v7 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v7[2](v7);
  else
    TIDispatchSync();

}

- (void)notifyMemoryPressureLevel:(unint64_t)a3 excessMemoryInBytes:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  dispatch_time_t v15;
  _QWORD block[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  __int128 buf;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  TIKeyboardActivityOSLogFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Notifying observers of memory pressure level %u (above the limit by %u bytes)"), "-[TIKeyboardActivityController notifyMemoryPressureLevel:excessMemoryInBytes:]", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v8;
    _os_log_impl(&dword_1DA6F2000, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__6861;
  v25 = __Block_byref_object_dispose__6862;
  v26 = (id)os_transaction_create();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[TIKeyboardActivityController observers](self, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "handleMemoryPressureLevel:excessMemoryInBytes:", a3, a4);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v15 = dispatch_time(0, 10000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__TIKeyboardActivityController_notifyMemoryPressureLevel_excessMemoryInBytes___block_invoke;
  block[3] = &unk_1EA107058;
  block[4] = &buf;
  dispatch_after(v15, MEMORY[0x1E0C80D38], block);
  _Block_object_dispose(&buf, 8);

}

- (id)createMemoryPressureSource
{
  dispatch_source_t v2;
  dispatch_source_t v3;
  NSObject *v4;
  _QWORD handler[4];
  NSObject *v7;

  v2 = dispatch_source_create(MEMORY[0x1E0C80DA8], 0, 6uLL, MEMORY[0x1E0C80D38]);
  v3 = v2;
  if (v2)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __58__TIKeyboardActivityController_createMemoryPressureSource__block_invoke;
    handler[3] = &unk_1EA106A98;
    v4 = v2;
    v7 = v4;
    dispatch_source_set_event_handler(v4, handler);
    dispatch_resume(v4);

  }
  return v3;
}

- (void)handleMemoryStatusPressure:(unint64_t)a3
{
  char v3;
  void *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t ExcessMemoryInBytes;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "activityState") != 3)
  {
    TIKeyboardActivityOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Keyboard is not in hibernating state, ignoring"), "-[TIKeyboardActivityController handleMemoryStatusPressure:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v14;
LABEL_13:
      _os_log_impl(&dword_1DA6F2000, v13, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

    }
LABEL_14:

    goto LABEL_15;
  }
  if ((v3 & 6) == 0)
    goto LABEL_15;
  ++self->_inactiveMemoryPressureCount;
  TIKeyboardActivityOSLogFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Received inactive memory pressure warning (count=%ld)"), "-[TIKeyboardActivityController handleMemoryStatusPressure:]", self->_inactiveMemoryPressureCount);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v8 = self->_inactiveMemoryPressureCount - 1;
  if (v8 >= 3)
  {
    TIKeyboardActivityOSLogFacility();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Too many inactive memory pressure warnings -- Ignoring"), "-[TIKeyboardActivityController handleMemoryStatusPressure:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v16 = v14;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v9 = qword_1DA90FEC8[v8];
  ExcessMemoryInBytes = getExcessMemoryInBytes();
  TIKeyboardActivityOSLogFacility();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Notifying memory pressure level %lu"), "-[TIKeyboardActivityController handleMemoryStatusPressure:]", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v12;
    _os_log_impl(&dword_1DA6F2000, v11, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  -[TIKeyboardActivityController notifyMemoryPressureLevel:excessMemoryInBytes:](self, "notifyMemoryPressureLevel:excessMemoryInBytes:", v9, ExcessMemoryInBytes);
LABEL_15:

}

- (unint64_t)activityState
{
  void (**v2)(_QWORD);
  unint64_t v3;
  void (**v5)(_QWORD);
  _QWORD aBlock[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__TIKeyboardActivityController_activityState__block_invoke;
  aBlock[3] = &unk_1EA106F40;
  aBlock[4] = self;
  aBlock[5] = &v7;
  v2 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v2[2](v2);
  }
  else
  {
    v5 = v2;
    TIDispatchSync();

  }
  v3 = v8[3];

  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)releaseInputManagers
{
  -[TIKeyboardActivityController notifyMemoryPressureLevel:excessMemoryInBytes:](self, "notifyMemoryPressureLevel:excessMemoryInBytes:", 3, getExcessMemoryInBytes());
}

- (BOOL)atexitHandler
{
  return -[TIKeyboardApplicationStateMonitor flushPendingChangesToDisk](self->_appMonitor, "flushPendingChangesToDisk");
}

- (void)backgroundActivityAssertionsDidChange
{
  void *v3;

  +[TIKeyboardAssertionManager sharedAssertionManager](TIKeyboardAssertionManager, "sharedAssertionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasBackgroundActivity = objc_msgSend(v3, "hasBackgroundActivityAssertions");

  if (self->_hasBackgroundActivity)
    -[TIKeyboardActivityController setKeyboardDirtyIfNecessaryWithReason:](self, "setKeyboardDirtyIfNecessaryWithReason:", CFSTR("backgroundActivityAssertionsDidChange"));
  else
    -[TIKeyboardActivityController setKeyboardCleanIfNecessary](self, "setKeyboardCleanIfNecessary");
}

- (void)generateMemgraphsIfNeeded
{
  void *v2;
  int v3;
  uint64_t ExcessMemoryInBytes;
  uint64_t v5;
  NSObject *v6;
  ipc_space_t *v7;
  task_read_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  mach_port_t corpse_task_port;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  __int128 buf;
  void *(*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInternalInstall");

  if (v3)
  {
    ExcessMemoryInBytes = getExcessMemoryInBytes();
    if (ExcessMemoryInBytes)
    {
      v5 = ExcessMemoryInBytes;
      TIKeyboardActivityOSLogFacility();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s kbd is still over the inactive limit: %lu, likely going down from jetsam"), "-[TIKeyboardActivityController generateMemgraphsIfNeeded]", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_1DA6F2000, v6, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

      }
      v7 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
      v8 = *MEMORY[0x1E0C83DA0];
      corpse_task_port = 0;
      task_generate_corpse(v8, &corpse_task_port);
      v9 = corpse_task_port;
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v10 = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
      v16 = getReportMemoryExceptionFromTaskSymbolLoc_ptr;
      if (!getReportMemoryExceptionFromTaskSymbolLoc_ptr)
      {
        *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
        *((_QWORD *)&buf + 1) = 3221225472;
        v18 = __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke;
        v19 = &unk_1EA107058;
        v20 = &v13;
        __getReportMemoryExceptionFromTaskSymbolLoc_block_invoke((uint64_t)&buf);
        v10 = (void *)v14[3];
      }
      _Block_object_dispose(&v13, 8);
      if (!v10)
      {
        dlerror();
        abort_report_np();
      }
      ((void (*)(uint64_t, uint64_t, _QWORD, _QWORD, _QWORD))v10)(v9, 1, 0, 0, 0);
      mach_port_deallocate(*v7, corpse_task_port);
    }
  }
}

- (BOOL)isDirty
{
  return self->_isDirty;
}

- (void)setIsDirty:(BOOL)a3
{
  self->_isDirty = a3;
}

- (TIKeyboardApplicationStateMonitor)appMonitor
{
  return self->_appMonitor;
}

- (void)setAppMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_appMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_inactivityTimer, 0);
  objc_storeStrong((id *)&self->_isDirtyTransaction, 0);
  objc_storeStrong((id *)&self->_memoryPressureSource, 0);
}

void __59__TIKeyboardActivityController_setKeyboardCleanIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "generateMemgraphsIfNeeded");
  TIKeyboardActivityOSLogFacility();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(WeakRetained, "isDirtyTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%s Keyboard is releasing the placeholder transaction %p, current: %p"), "-[TIKeyboardActivityController setKeyboardCleanIfNecessary]_block_invoke", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_impl(&dword_1DA6F2000, v3, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

  }
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

uint64_t __45__TIKeyboardActivityController_activityState__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

uint64_t __45__TIKeyboardActivityController_activityState__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__TIKeyboardActivityController_createMemoryPressureSource__block_invoke(uint64_t a1)
{
  uintptr_t data;
  id v2;

  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleMemoryStatusPressure:", data);

}

void __78__TIKeyboardActivityController_notifyMemoryPressureLevel_excessMemoryInBytes___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(_QWORD *)(v1 + 40) = 0;

}

void __55__TIKeyboardActivityController_removeActivityObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __52__TIKeyboardActivityController_addActivityObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

+ (id)sharedController
{
  if (__testingInstance_6941)
    return (id)__testingInstance_6941;
  +[TIKeyboardActivityController singletonInstance](TIKeyboardActivityController, "singletonInstance");
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)singletonInstance
{
  if (singletonInstance_onceToken_6938 != -1)
    dispatch_once(&singletonInstance_onceToken_6938, &__block_literal_global_6939);
  return (id)singletonInstance_singletonInstance_6940;
}

void __66__TIKeyboardActivityController_defaultKeyboardIdleTimeoutInterval__block_invoke()
{
  CFIndex AppIntegerValue;
  CFIndex v1;
  NSObject *v2;
  void *v3;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  defaultKeyboardIdleTimeoutInterval_defaultIdleTimeout = 0x4064A00000000000;
  if (TI_IS_INTERNAL_INSTALL::once_token != -1)
    dispatch_once(&TI_IS_INTERNAL_INSTALL::once_token, &__block_literal_global_3460);
  if (TI_IS_INTERNAL_INSTALL::is_internal_install)
  {
    keyExistsAndHasValidFormat = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("idleTimeout"), CFSTR("com.apple.keyboard"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
    {
      v1 = AppIntegerValue;
      if ((AppIntegerValue & 0x8000000000000000) == 0)
      {
        *(double *)&defaultKeyboardIdleTimeoutInterval_defaultIdleTimeout = (double)AppIntegerValue;
        if (TICanLogMessageAtLevel_onceToken != -1)
          dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_21185);
        if (TICanLogMessageAtLevel_logLevel >= 2)
        {
          TIOSLogFacility();
          v2 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s Setting keyboard idle timeout to %ld seconds"), "+[TIKeyboardActivityController defaultKeyboardIdleTimeoutInterval]_block_invoke", v1);
            v3 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v6 = v3;
            _os_log_debug_impl(&dword_1DA6F2000, v2, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);

          }
        }
      }
    }
  }
}

uint64_t __49__TIKeyboardActivityController_singletonInstance__block_invoke()
{
  TIKeyboardActivityController *v0;
  void *v1;

  v0 = objc_alloc_init(TIKeyboardActivityController);
  v1 = (void *)singletonInstance_singletonInstance_6940;
  singletonInstance_singletonInstance_6940 = (uint64_t)v0;

  return atexit_b(&__block_literal_global_21);
}

void __49__TIKeyboardActivityController_singletonInstance__block_invoke_2()
{
  id v0;

  +[TIKeyboardActivityController sharedController](TIKeyboardActivityController, "sharedController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "atexitHandler");

}

+ (void)setSharedController:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)__testingInstance_6941 != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&__testingInstance_6941, a3);
    v4 = v5;
  }

}

+ (void)setKeyboardIdleTimeoutInterval:(double)a3
{
  __testingIdleTimeout = *(_QWORD *)&a3;
  __hasTestingIdleTimeout = 1;
}

@end
