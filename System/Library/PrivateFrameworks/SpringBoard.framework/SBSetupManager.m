@implementation SBSetupManager

- (BOOL)_isInSetupMode
{
  return self->_setupRequiredReason != 0;
}

+ (SBSetupManager)sharedInstance
{
  if (sharedInstance___once_2 != -1)
    dispatch_once(&sharedInstance___once_2, &__block_literal_global_6_2);
  return (SBSetupManager *)(id)sharedInstance___instance_3;
}

uint64_t __32__SBSetupManager_sharedInstance__block_invoke()
{
  SBSetupManager *v0;
  void *v1;

  kdebug_trace();
  v0 = objc_alloc_init(SBSetupManager);
  v1 = (void *)sharedInstance___instance_3;
  sharedInstance___instance_3 = (uint64_t)v0;

  return kdebug_trace();
}

- (SBSetupManager)init
{
  SBSetupManager *v2;
  uint64_t v3;
  NSHashTable *floatingDockControllers;
  uint64_t v5;
  NSMapTable *floatingDockBehaviorAssertionsByFloatingDockController;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSetupManager;
  v2 = -[SBSetupManager init](&v9, sel_init);
  if (v2)
  {
    if (SBPrepareLaunchSentinelIfNecessary___once != -1)
      dispatch_once(&SBPrepareLaunchSentinelIfNecessary___once, &__block_literal_global_120);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    floatingDockControllers = v2->_floatingDockControllers;
    v2->_floatingDockControllers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    floatingDockBehaviorAssertionsByFloatingDockController = v2->_floatingDockBehaviorAssertionsByFloatingDockController;
    v2->_floatingDockBehaviorAssertionsByFloatingDockController = (NSMapTable *)v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)SBSetupDeviceMigrationNotificationReceived, (CFStringRef)*MEMORY[0x1E0D8D6E8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[SBSetupManager _invalidateFloatingDockBehaviorAssertions](self, "_invalidateFloatingDockBehaviorAssertions");
  v3.receiver = self;
  v3.super_class = (Class)SBSetupManager;
  -[SBSetupManager dealloc](&v3, sel_dealloc);
}

- (BOOL)isInSetupModeReadyToExit
{
  _BOOL4 v3;

  v3 = -[SBSetupManager _isInSetupMode](self, "_isInSetupMode");
  if (v3)
    LOBYTE(v3) = self->_inSetupModeReadyToExit;
  return v3;
}

- (BOOL)isInSetupModeForDeviceMigration
{
  return self->_setupRequiredReason == 3;
}

- (BOOL)updateInSetupMode
{
  void *v3;
  void *v4;
  int v5;
  void *v7;
  SBSetupManager *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint8_t *v13;
  void *v14;
  int v15;
  BOOL v16;
  uint8_t v17[16];
  uint8_t buf[2];
  __int16 v19;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isInLostMode") & 1) != 0)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasPasscodeSet");

    if (v5)
      return -[SBSetupManager _setSetupRequiredReason:](self, "_setSetupRequiredReason:", 0);
  }
  else
  {

  }
  objc_msgSend((id)SBApp, "userSessionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "isMultiUserSupported") || !objc_msgSend(v7, "isLoginSession"))
  {
    if (BYSetupAssistantNeedsToRun())
    {
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = 1;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v19 = 0;
        v12 = "inSetupMode = YES because BYSetupAssistantNeedsToRun() returned YES";
        v11 = 1;
        v13 = (uint8_t *)&v19;
LABEL_14:
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, v12, v13, 2u);
      }
    }
    else
    {
      +[SBLockdownManager sharedInstance](SBLockdownManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "brickedDevice");

      if (v15)
      {
        SBLogCommon();
        v10 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = 2;
          goto LABEL_20;
        }
        *(_WORD *)buf = 0;
        v12 = "inSetupMode = YES because SBLockdownManager reports we have a bricked device";
        v11 = 2;
        v13 = buf;
        goto LABEL_14;
      }
      if (!self->_setupWantedForDeviceMigration)
      {
        v11 = 0;
        goto LABEL_21;
      }
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "inSetupMode = YES because we have been asked to migrate a device.", v17, 2u);
      }
      v11 = 3;
    }
LABEL_20:

LABEL_21:
    v8 = self;
    v9 = v11;
    goto LABEL_22;
  }
  v8 = self;
  v9 = 0;
LABEL_22:
  v16 = -[SBSetupManager _setSetupRequiredReason:](v8, "_setSetupRequiredReason:", v9);

  return v16;
}

- (BOOL)setupHasFinishedRestoringFromBackup
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  +[SBDefaults externalDefaults](SBDefaults, "externalDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setupDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setupState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("RestoredFromiTunesBackup"));
  else
    v5 = 0;

  return v5;
}

- (void)postLaunchCompleteNotificationForSetup
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.springboard.setupsnapshotremoved"), 0, 0, 0);
}

- (BOOL)isDeferringDeviceOrientationUpdates
{
  return self->_deferOrientationUpdatesAssertion != 0;
}

- (void)setDeferringDeviceOrientationUpdates:(BOOL)a3
{
  BSInvalidatable *deferOrientationUpdatesAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;

  deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
  if ((((deferOrientationUpdatesAssertion == 0) ^ a3) & 1) == 0)
  {
    if (a3)
    {
      objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBOrientationLockedForBuddy"));
      v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[BSInvalidatable invalidate](deferOrientationUpdatesAssertion, "invalidate");
      v5 = 0;
    }
    v6 = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v5;

  }
}

- (void)noteAuthenticationSucceededWithPasscode:(id)a3
{
  BYSetupAssistantCreateAuthContext();
}

- (BOOL)_setSetupRequiredReason:(unint64_t)a3
{
  int v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  unint64_t v18;
  const __CFString *v19;
  void *v20;
  int v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = -[SBSetupManager _isInSetupMode](self, "_isInSetupMode");
  self->_setupRequiredReason = a3;
  v6 = -[SBSetupManager _isInSetupMode](self, "_isInSetupMode");
  if (v5 != v6)
  {
    if ((v6 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "userInterfaceIdiom");

      if ((v8 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "mainWindowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "appInteractionEventSource");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObserver:", self);

      }
      -[SBSetupManager _takeFloatingDockBehaviorAssertions](self, "_takeFloatingDockBehaviorAssertions");
    }
    else
    {
      self->_inSetupModeReadyToExit = 0;
      -[SBSetupManager _invalidateFloatingDockBehaviorAssertions](self, "_invalidateFloatingDockBehaviorAssertions");
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "userInterfaceIdiom");

      if ((v13 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "mainWindowScene");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "appInteractionEventSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObserver:", self);

      }
    }
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_setupRequiredReason - 1;
      if (v18 > 2)
        v19 = CFSTR("none");
      else
        v19 = off_1E8EAB9E0[v18];
      v22 = 138412290;
      v23 = v19;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Setup mode state did change - required reason: %@", (uint8_t *)&v22, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:userInfo:", CFSTR("SBInBuddyModeDidChangeNotification"), 0, 0);

  }
  return -[SBSetupManager isInSetupMode](self, "isInSetupMode");
}

- (void)_toggleSetupForMigrationNeeded:(BOOL)a3 forReason:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t setupRequiredReason;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  SBDeviceApplicationSceneEntity *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, int);
  void *v25;
  id v26;
  SBSetupManager *v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  self->_setupWantedForDeviceMigration = a3;
  -[SBSetupManager updateInSetupMode](self, "updateInSetupMode");
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setupApplication");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  setupRequiredReason = self->_setupRequiredReason;
  SBLogCommon();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (setupRequiredReason == 3)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Activating Setup for device migration.", buf, 2u);
    }

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v8);
    v14 = objc_alloc(MEMORY[0x1E0CEA7E0]);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", *MEMORY[0x1E0D8D6F0]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v14, "initWithURL:", v15);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSceneEntity addActions:](v13, "addActions:", v17);

    objc_msgSend(v12, "createRequestForApplicationActivation:options:", v13, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setEventLabel:", CFSTR("ActivateBuddyForDeviceMigration"));
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __59__SBSetupManager__toggleSetupForMigrationNeeded_forReason___block_invoke;
    v25 = &unk_1E8E9DEB0;
    v19 = v8;
    v26 = v19;
    v27 = self;
    v20 = (id)objc_msgSend(v18, "addCompletionHandler:", &v22);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v22, v23, v24, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObserver:selector:name:object:", self, sel__setupProcessChangedNotificationReceived_, CFSTR("SBApplicationProcessStateDidChange"), v19);

    objc_msgSend(v12, "executeTransitionRequest:", v18);
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      v29 = v6;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Setup no longer required for device migration for reason: %{public}@", buf, 0xCu);
    }

    self->_setupWantedForDeviceMigration = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObserver:name:object:", self, CFSTR("SBApplicationProcessStateDidChange"), v8);
  }

}

void __59__SBSetupManager__toggleSetupForMigrationNeeded_forReason___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  char v4;

  if (!a2
    || (objc_msgSend(*(id *)(a1 + 32), "processState"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isForeground"),
        v3,
        (v4 & 1) == 0))
  {
    objc_msgSend(*(id *)(a1 + 40), "_toggleSetupForMigrationNeeded:forReason:", 0, CFSTR("Setup not foreground at transition completion"));
  }
}

- (void)_setupProcessChangedNotificationReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("previousProcessState"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "processState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "isForeground") && (objc_msgSend(v7, "isForeground") & 1) == 0)
    -[SBSetupManager _toggleSetupForMigrationNeeded:forReason:](self, "_toggleSetupForMigrationNeeded:forReason:", 0, CFSTR("backgrounded or exited"));

}

- (void)_takeFloatingDockBehaviorAssertions
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v3 = self->_floatingDockControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[SBSetupManager _takeFloatingDockBehaviorAssertionForFloatingDockController:](self, "_takeFloatingDockBehaviorAssertionForFloatingDockController:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_takeFloatingDockBehaviorAssertionForFloatingDockController:(id)a3
{
  id v4;
  SBFloatingDockBehaviorAssertion *v5;

  v4 = a3;
  v5 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:]([SBFloatingDockBehaviorAssertion alloc], "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v4, 1, 0, 12, CFSTR("in setup"), 0, 0.0);
  -[NSMapTable setObject:forKey:](self->_floatingDockBehaviorAssertionsByFloatingDockController, "setObject:forKey:", v5, v4);

}

- (void)_invalidateFloatingDockBehaviorAssertions
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_floatingDockControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_floatingDockBehaviorAssertionsByFloatingDockController, "objectForKey:", v8, (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");
        -[NSMapTable removeObjectForKey:](self->_floatingDockBehaviorAssertionsByFloatingDockController, "removeObjectForKey:", v8);

      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)floatingDockControllerDidRegister:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[NSHashTable addObject:](self->_floatingDockControllers, "addObject:", v6);
    if (-[SBSetupManager _isInSetupMode](self, "_isInSetupMode"))
      -[SBSetupManager _takeFloatingDockBehaviorAssertionForFloatingDockController:](self, "_takeFloatingDockBehaviorAssertionForFloatingDockController:", v6);
  }

}

- (void)eventSource:(id)a3 didBeginTransitionToMode:(int64_t)a4 withLayoutState:(id)a5 activatingElement:(id)a6 triggeredBy:(int64_t)a7
{
  _BOOL4 v9;

  v9 = -[SBSetupManager isInSetupModeReadyToExit](self, "isInSetupModeReadyToExit", a3, a4, a5, a6, a7);
  if (a4 == 1 && v9)
    -[SBSetupManager _invalidateFloatingDockBehaviorAssertions](self, "_invalidateFloatingDockBehaviorAssertions");
}

- (void)setInSetupModeReadyToExit:(BOOL)a3
{
  self->_inSetupModeReadyToExit = a3;
}

- (NSHashTable)floatingDockControllers
{
  return self->_floatingDockControllers;
}

- (NSMapTable)floatingDockBehaviorAssertionsByFloatingDockController
{
  return self->_floatingDockBehaviorAssertionsByFloatingDockController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertionsByFloatingDockController, 0);
  objc_storeStrong((id *)&self->_floatingDockControllers, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
}

@end
