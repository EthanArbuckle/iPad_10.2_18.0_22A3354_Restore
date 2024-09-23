@implementation SBAmbientIdleTimerController

- (SBAmbientIdleTimerController)initWithWindowScene:(id)a3
{
  id v4;
  SBAmbientIdleTimerController *v5;
  SBAmbientIdleTimerController *v6;
  uint64_t v7;
  NSHashTable *observers;
  uint64_t v9;
  SBAmbientSettings *ambientSettings;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBAmbientIdleTimerController;
  v5 = -[SBAmbientIdleTimerController init](&v18, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_windowScene, v4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (NSHashTable *)v7;

    +[SBAmbientDomain rootSettings](SBAmbientDomain, "rootSettings");
    v9 = objc_claimAutoreleasedReturnValue();
    ambientSettings = v6->_ambientSettings;
    v6->_ambientSettings = (SBAmbientSettings *)v9;

    v11 = (void *)_allAmbientIdleTimerControllers;
    if (!_allAmbientIdleTimerControllers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)_allAmbientIdleTimerControllers;
      _allAmbientIdleTimerControllers = v12;

      objc_msgSend((id)SBApp, "blshService");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localAssertionService");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = +[BLSHLocalAssertionAttributeHandler registerHandlerForService:](SBAllowAmbientIdleTimerAttributeHandler, "registerHandlerForService:", v15);
      v11 = (void *)_allAmbientIdleTimerControllers;
    }
    objc_msgSend(v11, "addObject:", v6);
    v6->_suppressForSleep = 0;
    v6->_monitoredSuppressionReasons = 2;
    v6->_suppressionEnabled = -[SBAmbientSettings enableSuppression](v6->_ambientSettings, "enableSuppression");
    -[SBAmbientIdleTimerController _updateSuppressionManager](v6, "_updateSuppressionManager");
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend((id)_allAmbientIdleTimerControllers, "removeObject:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBAmbientIdleTimerController;
  -[SBAmbientIdleTimerController dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)setSuppressForSleep:(BOOL)a3
{
  if (self->_suppressForSleep != a3)
  {
    self->_suppressForSleep = a3;
    -[SBAmbientIdleTimerController _updateSuppressionManager](self, "_updateSuppressionManager");
    -[SBAmbientIdleTimerController _updateAmbientSuppressed](self, "_updateAmbientSuppressed");
  }
}

- (int64_t)idleTimerMode
{
  if (-[SBAmbientIdleTimerController idleTimerDuration](self, "idleTimerDuration") == 14)
    return 3;
  else
    return 1;
}

- (int64_t)idleTimerDuration
{
  _BOOL4 v3;
  SBAmbientSettings *ambientSettings;
  uint64_t v5;
  int64_t v6;

  v3 = -[SBAmbientIdleTimerController isAmbientSuppressed](self, "isAmbientSuppressed");
  ambientSettings = self->_ambientSettings;
  if (v3)
    v5 = -[SBAmbientSettings suppressedIdleTimerDuration](ambientSettings, "suppressedIdleTimerDuration");
  else
    v5 = -[SBAmbientSettings idleTimerDuration](ambientSettings, "idleTimerDuration");
  v6 = v5;
  if ((objc_msgSend(MEMORY[0x1E0CEA2F8], "isRunningInStoreDemoMode") & (v5 != 14)) != 0)
    return 8;
  else
    return v6;
}

- (int64_t)idleWarnMode
{
  _BOOL4 v3;
  SBAmbientSettings *ambientSettings;

  v3 = -[SBAmbientIdleTimerController isAmbientSuppressed](self, "isAmbientSuppressed");
  ambientSettings = self->_ambientSettings;
  if (v3)
    return -[SBAmbientSettings suppressedIdleTimerWarnMode](ambientSettings, "suppressedIdleTimerWarnMode");
  else
    return -[SBAmbientSettings idleTimerWarnMode](ambientSettings, "idleTimerWarnMode");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;
  int v6;

  if (self->_ambientSettings == a3)
  {
    v5 = a4;
    -[SBAmbientIdleTimerController _notifyObserversIdleTimerBehaviorDidChange](self, "_notifyObserversIdleTimerBehaviorDidChange");
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("enableSuppression"));

    if (v6)
      -[SBAmbientIdleTimerController _setSuppressionEnabled:](self, "_setSuppressionEnabled:", -[SBAmbientSettings enableSuppression](self->_ambientSettings, "enableSuppression"));
  }
}

- (void)_setSuppressionEnabled:(BOOL)a3
{
  int v4;

  if (a3)
    v4 = objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable");
  else
    v4 = 0;
  if (self->_suppressionEnabled != v4)
  {
    self->_suppressionEnabled = v4;
    -[SBAmbientIdleTimerController _updateSuppressionManager](self, "_updateSuppressionManager");
    -[SBAmbientIdleTimerController _updateUserSleepPredicted](self, "_updateUserSleepPredicted");
  }
}

- (void)_updateSuppressionManager
{
  CMSuppressionManager *v3;
  CMSuppressionManager *suppressionManager;
  NSObject *v5;
  unint64_t v6;
  CMSuppressionManager *v7;
  void *v8;
  NSObject *v9;
  CMSuppressionManager *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];
  id location[2];

  if (self->_suppressionEnabled && !self->_suppressionManager)
  {
    v3 = (CMSuppressionManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA56D8]), "initWithClientType:", 2);
    suppressionManager = self->_suppressionManager;
    self->_suppressionManager = v3;

  }
  if (self->_suppressionManager)
  {
    if (self->_suppressForSleep)
    {
      if (!self->_suppressionServiceStarted)
      {
        objc_initWeak(location, self);
        SBLogAmbientIdleTimer();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Starting suppression monitoring", buf, 2u);
        }

        v6 = -[SBAmbientIdleTimerController _sourcesForMonitoredEvents](self, "_sourcesForMonitoredEvents");
        -[CMSuppressionManager startService](self->_suppressionManager, "startService");
        v7 = self->_suppressionManager;
        objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke;
        v11[3] = &unk_1E8EBD248;
        objc_copyWeak(&v12, location);
        -[CMSuppressionManager startSuppressionUpdatesToQueue:withOptions:withHandler:](v7, "startSuppressionUpdatesToQueue:withOptions:withHandler:", v8, v6, v11);

        self->_suppressionServiceStarted = 1;
        objc_destroyWeak(&v12);
        objc_destroyWeak(location);
      }
    }
    else if (self->_suppressionServiceStarted)
    {
      SBLogAmbientIdleTimer();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Stopping suppression monitoring", (uint8_t *)location, 2u);
      }

      -[SBAmbientIdleTimerController _setActiveSuppressionReasons:](self, "_setActiveSuppressionReasons:", 0);
      -[CMSuppressionManager stopSuppressionUpdates](self->_suppressionManager, "stopSuppressionUpdates");
      -[CMSuppressionManager stopService](self->_suppressionManager, "stopService");
      self->_suppressionServiceStarted = 0;
    }
  }
  if (!self->_suppressionEnabled)
  {
    if (self->_suppressionManager)
    {
      -[SBAmbientIdleTimerController _setActiveSuppressionReasons:](self, "_setActiveSuppressionReasons:", 0);
      -[CMSuppressionManager stopSuppressionUpdates](self->_suppressionManager, "stopSuppressionUpdates");
      -[CMSuppressionManager stopService](self->_suppressionManager, "stopService");
      v10 = self->_suppressionManager;
      self->_suppressionManager = 0;

      self->_suppressionServiceStarted = 0;
    }
  }
}

void __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (!v5 || v6)
  {
    SBLogAmbientIdleTimer();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke_cold_1((uint64_t)v5, v6, v13);

  }
  else if (WeakRetained)
  {
    SBLogAmbientIdleTimer();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Received suppression event %@", (uint8_t *)&v14, 0xCu);
    }

    v10 = objc_msgSend(v5, "type");
    if (v10 == 2)
    {
      v12 = v8;
      v11 = 0;
      goto LABEL_13;
    }
    if (v10 == 1)
    {
      v11 = objc_msgSend(v5, "reason");
      v12 = v8;
LABEL_13:
      objc_msgSend(v12, "_setActiveSuppressionReasons:", v11);
    }
  }

}

- (void)_notifyObserversIdleTimerBehaviorDidChange
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
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v8, "ambientIdleTimerController:didChangeIdleTimerBehavior:", self, self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversSuppressionDidEnd
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
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v8, "ambientIdleTimerControllerSuppressionDidEnd:", self);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_notifyObserversUserSleepPredictedDidChange
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
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v8, "ambientIdleTimerController:didUpdateUserSleepPredicted:", self, self->_userSleepPredicted);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)_setAmbientSuppressed:(BOOL)a3
{
  if (self->_ambientSuppressed != a3)
  {
    self->_ambientSuppressed = a3;
    -[SBAmbientIdleTimerController _notifyObserversIdleTimerBehaviorDidChange](self, "_notifyObserversIdleTimerBehaviorDidChange");
  }
}

- (void)_updateAmbientSuppressed
{
  _BOOL4 v3;
  _BOOL8 v4;
  NSObject *v5;
  _BOOL4 idleTimerAllowedForAssertions;
  _BOOL4 idleTimerAllowedForAssertionsForSleepFocus;
  _BOOL4 suppressForSleep;
  _BOOL4 idleTimerAllowedForSuppression;
  NSObject *v10;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = -[SBAmbientIdleTimerController isAmbientSuppressed](self, "isAmbientSuppressed");
  v4 = self->_idleTimerAllowedForAssertions
    || self->_idleTimerAllowedForAssertionsForSleepFocus && self->_suppressForSleep
    || self->_idleTimerAllowedForSuppression;
  -[SBAmbientIdleTimerController _setAmbientSuppressed:](self, "_setAmbientSuppressed:", v4);
  SBLogAmbientIdleTimer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    idleTimerAllowedForAssertions = self->_idleTimerAllowedForAssertions;
    idleTimerAllowedForAssertionsForSleepFocus = self->_idleTimerAllowedForAssertionsForSleepFocus;
    suppressForSleep = self->_suppressForSleep;
    idleTimerAllowedForSuppression = self->_idleTimerAllowedForSuppression;
    v12[0] = 67110400;
    v12[1] = v3;
    v13 = 1024;
    v14 = v4;
    v15 = 1024;
    v16 = idleTimerAllowedForAssertions;
    v17 = 1024;
    v18 = idleTimerAllowedForAssertionsForSleepFocus;
    v19 = 1024;
    v20 = suppressForSleep;
    v21 = 1024;
    v22 = idleTimerAllowedForSuppression;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Ambient supression state updated. wasAmbientSuppressed = %{BOOL}u  isAmbientSuppressed = %{BOOL}u  [ _idleTimerAllowedForAssertions = %{BOOL}u _idleTimerAllowedForAssertionsForSleepFocus = %{BOOL}u _suppressForSleep = %{BOOL}u _idleTimerAllowedForSuppression = %{BOOL}u ]", (uint8_t *)v12, 0x26u);
  }

  if (v3 || !v4)
  {
    if (!v4 && v3)
    {
      SBLogAmbientIdleTimer();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12[0]) = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Suppression ended", (uint8_t *)v12, 2u);
      }

      -[SBAmbientIdleTimerController _notifyObserversSuppressionDidEnd](self, "_notifyObserversSuppressionDidEnd");
    }
  }
  else
  {
    SBLogAmbientIdleTimer();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Suppression began", (uint8_t *)v12, 2u);
    }

  }
}

- (void)_setIdleTimerAllowedForAssertions:(BOOL)a3
{
  if (self->_idleTimerAllowedForAssertions != a3)
  {
    self->_idleTimerAllowedForAssertions = a3;
    -[SBAmbientIdleTimerController _updateAmbientSuppressed](self, "_updateAmbientSuppressed");
  }
}

- (void)_setIdleTimerAllowedForAssertionsForSleepFocus:(BOOL)a3
{
  if (self->_idleTimerAllowedForAssertionsForSleepFocus != a3)
  {
    self->_idleTimerAllowedForAssertionsForSleepFocus = a3;
    -[SBAmbientIdleTimerController _updateAmbientSuppressed](self, "_updateAmbientSuppressed");
  }
}

- (void)_setIdleTimerAllowedForAssertions:(BOOL)a3 forSleepFocus:(BOOL)a4
{
  if (a4)
    -[SBAmbientIdleTimerController _setIdleTimerAllowedForAssertionsForSleepFocus:](self, "_setIdleTimerAllowedForAssertionsForSleepFocus:", a3);
  else
    -[SBAmbientIdleTimerController _setIdleTimerAllowedForAssertions:](self, "_setIdleTimerAllowedForAssertions:", a3);
}

- (void)_setIdleTimerAllowedForSuppression:(BOOL)a3
{
  if (self->_idleTimerAllowedForSuppression != a3)
  {
    self->_idleTimerAllowedForSuppression = a3;
    -[SBAmbientIdleTimerController _updateAmbientSuppressed](self, "_updateAmbientSuppressed");
    -[SBAmbientIdleTimerController _updateUserSleepPredicted](self, "_updateUserSleepPredicted");
  }
}

- (void)_setActiveSuppressionReasons:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  unint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  SBLogAmbientIdleTimer();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Active suppression reasons: 0x%lx", (uint8_t *)&v6, 0xCu);
  }

  -[SBAmbientIdleTimerController _setIdleTimerAllowedForSuppression:](self, "_setIdleTimerAllowedForSuppression:", (self->_monitoredSuppressionReasons & a3) != 0);
}

- (void)_updateUserSleepPredicted
{
  _BOOL8 v2;

  v2 = self->_suppressionEnabled && self->_idleTimerAllowedForSuppression;
  -[SBAmbientIdleTimerController _setUserSleepPredicted:](self, "_setUserSleepPredicted:", v2);
}

- (void)_setUserSleepPredicted:(BOOL)a3
{
  if (self->_userSleepPredicted != a3)
  {
    self->_userSleepPredicted = a3;
    -[SBAmbientIdleTimerController _notifyObserversUserSleepPredictedDidChange](self, "_notifyObserversUserSleepPredictedDidChange");
  }
}

- (unint64_t)_sourcesForMonitoredEvents
{
  unint64_t monitoredSuppressionReasons;
  _QWORD *v3;
  uint8x8_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD v9[2];
  uint64_t (*v10)(uint64_t, unint64_t);
  void *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  monitoredSuppressionReasons = self->_monitoredSuppressionReasons;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __58__SBAmbientIdleTimerController__sourcesForMonitoredEvents__block_invoke;
  v11 = &unk_1E8EA8288;
  v12 = &v13;
  v3 = v9;
  if (monitoredSuppressionReasons)
  {
    v17 = 0;
    v4 = (uint8x8_t)vcnt_s8((int8x8_t)monitoredSuppressionReasons);
    v4.i16[0] = vaddlv_u8(v4);
    v5 = v4.i32[0];
    if (v4.i32[0])
    {
      v6 = 0;
      do
      {
        if (((1 << v6) & monitoredSuppressionReasons) != 0)
        {
          ((void (*)(_QWORD *))v10)(v3);
          if (v17)
            break;
          --v5;
        }
        if (v6 > 0x3E)
          break;
        ++v6;
      }
      while (v5 > 0);
    }
  }

  v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __58__SBAmbientIdleTimerController__sourcesForMonitoredEvents__block_invoke(uint64_t result, unint64_t a2)
{
  if (a2 <= 4 && ((1 << a2) & 0x16) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) |= a2;
  return result;
}

- (BOOL)suppressForSleep
{
  return self->_suppressForSleep;
}

- (BOOL)isUserSleepPredicted
{
  return self->_userSleepPredicted;
}

- (BOOL)isAmbientSuppressed
{
  return self->_ambientSuppressed;
}

- (BOOL)_isIdleTimerAllowedForAssertions
{
  return self->_idleTimerAllowedForAssertions;
}

- (BOOL)_isIdleTimerAllowedForAssertionsForSleepFocus
{
  return self->_idleTimerAllowedForAssertionsForSleepFocus;
}

- (BOOL)_isIdleTimerAllowedForSuppression
{
  return self->_idleTimerAllowedForSuppression;
}

- (SBWindowScene)_windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)_setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_ambientSettings, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __57__SBAmbientIdleTimerController__updateSuppressionManager__block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "localizedFailureReason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_fault_impl(&dword_1D0540000, a3, OS_LOG_TYPE_FAULT, "Suppression event error - event:%{public}@ error:%{public}@ reason:%{public}@", (uint8_t *)&v8, 0x20u);

}

@end
