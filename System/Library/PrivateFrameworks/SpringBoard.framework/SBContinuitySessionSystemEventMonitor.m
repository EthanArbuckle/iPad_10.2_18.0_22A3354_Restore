@implementation SBContinuitySessionSystemEventMonitor

- (SBContinuitySessionSystemEventMonitor)init
{
  SBContinuitySessionSystemEventMonitor *v2;
  uint64_t v3;
  NSHashTable *observers;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  BSInvalidatable *displayManagerObserver;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBContinuitySessionSystemEventMonitor;
  v2 = -[SBContinuitySessionSystemEventMonitor init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBLockStateAggregator sharedInstance](SBLockStateAggregator, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "lockState");

    v2->_isUILocked = v7 & 1;
    v2->_isUIBlocked = (v7 & 4) != 0;
    v2->_inCall = -[SBContinuitySessionSystemEventMonitor _calculateIsInCall](v2, "_calculateIsInCall");
    v2->_isPasscodeVisible = objc_msgSend(v5, "isPasscodeEntryVisible");
    objc_msgSend(MEMORY[0x1E0D89860], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:queue:", v2, MEMORY[0x1E0C80D38]);
    v2->_isSOSActive = objc_msgSend(v8, "currentSOSInitiationState") == 1;
    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_usingSecureApp = objc_msgSend(v9, "isCoverSheetHostingAnApp");

    objc_msgSend(v5, "coverSheetViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addCoverSheetObserver:", v2);
    objc_msgSend(v10, "registerExternalEventHandler:", v2);
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coverSheetTodayViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "addObserver:", v2);
    objc_msgSend(v10, "coverSheetSpotlightPresenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isSpotlightPresented") & 1) != 0)
      v14 = 1;
    else
      v14 = objc_msgSend(v12, "isSpotlightVisible");
    v2->_lockScreenSearchPresented = v14;

    v2->_userInitiatedRemoteTransientOverlayPresented = -[SBContinuitySessionSystemEventMonitor _calculateUserInitiatedRemoteTransientOverlayPresented](v2, "_calculateUserInitiatedRemoteTransientOverlayPresented");
    objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:", v2);

    objc_msgSend((id)SBApp, "displayManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:", v2);
    v17 = objc_claimAutoreleasedReturnValue();
    displayManagerObserver = v2->_displayManagerObserver;
    v2->_displayManagerObserver = (BSInvalidatable *)v17;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__passcodeVisibilityUpdated_, CFSTR("SBLockScreenPasscodeUIVisibilityUpdatedNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__aggregateLockStateChanged_, CFSTR("SBAggregateLockStateDidChangeNotification"), 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__callStatusChanged_, *MEMORY[0x1E0DBD4A0], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__callStatusChanged_, *MEMORY[0x1E0DBD4F0], 0);
    objc_msgSend(v19, "addObserver:selector:name:object:", v2, sel__coverSheetSecureAppChanged_, CFSTR("BCoverSheetSecureAppChangedNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  BSInvalidatable *displayManagerObserver;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[BSInvalidatable invalidate](self->_displayManagerObserver, "invalidate");
  displayManagerObserver = self->_displayManagerObserver;
  self->_displayManagerObserver = 0;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "coverSheetViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "unregisterExternalEventHandler:", self);
  objc_msgSend(v5, "removeCoverSheetObserver:", self);
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "coverSheetTodayViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:", self);

  v9.receiver = self;
  v9.super_class = (Class)SBContinuitySessionSystemEventMonitor;
  -[SBContinuitySessionSystemEventMonitor dealloc](&v9, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (BOOL)isUILocked
{
  return self->_isUILocked;
}

- (BOOL)isUIBlocked
{
  return self->_isUIBlocked;
}

- (BOOL)isSOSActive
{
  return self->_isSOSActive;
}

- (BOOL)isInCall
{
  return self->_inCall;
}

- (BOOL)isUsingSecureApp
{
  return self->_usingSecureApp;
}

- (BOOL)isAirplayMirroring
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  NSObject *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectedIdentities");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isAirPlayDisplay") & 1) != 0
          || (objc_msgSend(v8, "isRestrictedAirPlayDisplay") & 1) != 0
          || (objc_msgSend(v8, "isMusicOnlyDisplay") & 1) != 0
          || objc_msgSend(v8, "isiPodOnlyDisplay"))
        {
          SBLogContinuityDisplay();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138543362;
            v17 = v8;
            _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "Found airplay display: %{public}@", buf, 0xCu);
          }

          v9 = 1;
          goto LABEL_17;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
      v9 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }
LABEL_17:

  return v9;
}

- (BOOL)isUserInitiatedRemoteTransientOverlayPresented
{
  return self->_userInitiatedRemoteTransientOverlayPresented;
}

- (void)coverSheetViewControllerDidPresentModalView:(id)a3
{
  id v4;

  +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

}

- (void)coverSheetViewControllerDidSettleOnPage:(id)a3 mainPage:(BOOL)a4
{
  void *v5;

  if (a4)
  {
    -[SBContinuitySessionSystemEventMonitor _setUsingSecureApp:](self, "_setUsingSecureApp:", 0);
  }
  else
  {
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v5);

    -[SBContinuitySessionSystemEventMonitor _reevaluateSecureAppUsage](self, "_reevaluateSecureAppUsage");
  }
}

- (void)coverSheetViewControllerDidPresentSearch:(id)a3
{
  -[SBContinuitySessionSystemEventMonitor _setLockScreenSearchPresented:](self, "_setLockScreenSearchPresented:", -[SBContinuitySessionSystemEventMonitor _calculateLockScreenSearchPresented](self, "_calculateLockScreenSearchPresented", a3));
}

- (void)coverSheetViewControllerDidDismissSearch:(id)a3
{
  -[SBContinuitySessionSystemEventMonitor _setLockScreenSearchPresented:](self, "_setLockScreenSearchPresented:", -[SBContinuitySessionSystemEventMonitor _calculateLockScreenSearchPresented](self, "_calculateLockScreenSearchPresented", a3));
}

- (void)todayViewControllerDidPresentSearch:(id)a3
{
  -[SBContinuitySessionSystemEventMonitor _setLockScreenSearchPresented:](self, "_setLockScreenSearchPresented:", -[SBContinuitySessionSystemEventMonitor _calculateLockScreenSearchPresented](self, "_calculateLockScreenSearchPresented", a3));
}

- (void)todayViewControllerDidDismissSearch:(id)a3
{
  -[SBContinuitySessionSystemEventMonitor _setLockScreenSearchPresented:](self, "_setLockScreenSearchPresented:", -[SBContinuitySessionSystemEventMonitor _calculateLockScreenSearchPresented](self, "_calculateLockScreenSearchPresented", a3));
}

- (void)didUpdateCurrentSOSInitiationState:(int64_t)a3
{
  -[SBContinuitySessionSystemEventMonitor _setSOSActive:](self, "_setSOSActive:", a3 == 1);
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (BOOL)handleEvent:(id)a3
{
  if ((unint64_t)(objc_msgSend(a3, "type") - 39) <= 1)
    -[SBContinuitySessionSystemEventMonitor _reevaluateSecureAppUsage](self, "_reevaluateSecureAppUsage");
  return 0;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (void)displayManager:(id)a3 didConnectIdentity:(id)a4 withConfiguration:(id)a5
{
  id v6;

  +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 11, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v6);

}

- (void)displayManager:(id)a3 didDisconnectIdentity:(id)a4
{
  id v5;

  +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 11, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v5);

}

- (void)remoteTransientOverlaySessionManager:(id)a3 didActivateSession:(id)a4
{
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a4;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "embeddedDisplayWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isPresentedOnWindowScene:", v6);

  if (v7)
  {
    objc_msgSend(v8, "addSessionObserver:", self);
    -[SBContinuitySessionSystemEventMonitor _setUserInitiatedRemoteTransientOverlayPresented:](self, "_setUserInitiatedRemoteTransientOverlayPresented:", -[SBContinuitySessionSystemEventMonitor _calculateUserInitiatedRemoteTransientOverlayPresented](self, "_calculateUserInitiatedRemoteTransientOverlayPresented"));
  }

}

- (void)remoteTransientOverlaySessionDidDeactivate:(id)a3
{
  objc_msgSend(a3, "removeSessionObserver:", self);
  -[SBContinuitySessionSystemEventMonitor _setUserInitiatedRemoteTransientOverlayPresented:](self, "_setUserInitiatedRemoteTransientOverlayPresented:", -[SBContinuitySessionSystemEventMonitor _calculateUserInitiatedRemoteTransientOverlayPresented](self, "_calculateUserInitiatedRemoteTransientOverlayPresented"));
}

- (void)remoteTransientOverlaySession:(id)a3 didInvalidateWithReason:(int64_t)a4 error:(id)a5
{
  objc_msgSend(a3, "removeSessionObserver:", self, a4, a5);
  -[SBContinuitySessionSystemEventMonitor _setUserInitiatedRemoteTransientOverlayPresented:](self, "_setUserInitiatedRemoteTransientOverlayPresented:", -[SBContinuitySessionSystemEventMonitor _calculateUserInitiatedRemoteTransientOverlayPresented](self, "_calculateUserInitiatedRemoteTransientOverlayPresented"));
}

- (void)_postEvent:(id)a3
{
  id v4;
  void *v5;
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

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "continuitySessionSystemEventMonitor:eventOccurred:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_passcodeVisibilityUpdated:(id)a3
{
  id v4;

  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBContinuitySessionSystemEventMonitor _setPasscodeVisible:](self, "_setPasscodeVisible:", objc_msgSend(v4, "isPasscodeEntryVisible"));

}

- (void)_aggregateLockStateChanged:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("SBAggregateLockStateKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  -[SBContinuitySessionSystemEventMonitor _setUILocked:](self, "_setUILocked:", v6 & 1);
  -[SBContinuitySessionSystemEventMonitor _setUIBlocked:](self, "_setUIBlocked:", (v6 >> 2) & 1);
}

- (void)_callStatusChanged:(id)a3
{
  BSDispatchMain();
}

uint64_t __60__SBContinuitySessionSystemEventMonitor__callStatusChanged___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  SBLogContinuityDisplay();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_INFO, "Call status changed", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_setInCall:", objc_msgSend(*(id *)(a1 + 32), "_calculateIsInCall"));
}

- (void)_setPasscodeVisible:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_isPasscodeVisible != a3)
  {
    self->_isPasscodeVisible = a3;
    if (a3)
      v4 = 2;
    else
      v4 = 3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v5);

  }
}

- (void)_setUILocked:(BOOL)a3
{
  id v4;

  if (self->_isUILocked != a3)
  {
    self->_isUILocked = a3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

  }
}

- (void)_setUIBlocked:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (self->_isUIBlocked != a3)
  {
    self->_isUIBlocked = a3;
    if (a3)
      v4 = 5;
    else
      v4 = 6;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v5);

  }
}

- (void)_setInCall:(BOOL)a3
{
  id v4;

  if (self->_inCall != a3)
  {
    self->_inCall = a3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 7);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

  }
}

- (BOOL)_calculateIsInCall
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v18 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        SBLogContinuityDisplay();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "callUUID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uniqueProxyIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218498;
          v22 = v7;
          v23 = 2114;
          v24 = v9;
          v25 = 2114;
          v26 = v10;
          _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "Found current call: <%p:%{public}@ - %{public}@>", buf, 0x20u);

        }
        if (objc_msgSend(v7, "status") == 1 && (objc_msgSend(v7, "isEndpointOnCurrentDevice") & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_16;
        }
        SBLogContinuityDisplay();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "callUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "uniqueProxyIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v7, "status");
          v15 = objc_msgSend(v7, "isEndpointOnCurrentDevice");
          *(_DWORD *)buf = 134219010;
          v22 = v7;
          v23 = 2114;
          v24 = v12;
          v25 = 2114;
          v26 = v13;
          v27 = 1024;
          v28 = v14;
          v29 = 1024;
          v30 = v15;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "Call <%p:%{public}@ - %{public}@> doesn't meet criteria -> call status: %d, isEndpointOnCurrentDevice: %{BOOL}u", buf, 0x2Cu);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_16:

  return v4;
}

- (void)_setSOSActive:(BOOL)a3
{
  id v4;

  if (self->_isSOSActive != a3)
  {
    self->_isSOSActive = a3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 8);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

  }
}

- (BOOL)_calculateLockScreenSearchPresented
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coverSheetSpotlightPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSpotlightPresented") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coverSheetTodayViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "isSpotlightVisible");

  }
  return v5;
}

- (void)_setLockScreenSearchPresented:(BOOL)a3
{
  id v4;

  if (self->_lockScreenSearchPresented != a3)
  {
    self->_lockScreenSearchPresented = a3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 9);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

  }
}

- (void)_reevaluateSecureAppUsage
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCoverSheetHostingAnApp");

  SBLogContinuityDisplay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "Reevaluating secure app usage... cover sheet hosting an app: %{BOOL}u", (uint8_t *)v6, 8u);
  }

  -[SBContinuitySessionSystemEventMonitor _setUsingSecureApp:](self, "_setUsingSecureApp:", v4);
}

- (void)_setUsingSecureApp:(BOOL)a3
{
  id v4;

  if (self->_usingSecureApp != a3)
  {
    self->_usingSecureApp = a3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 10);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

  }
}

- (BOOL)_calculateUserInitiatedRemoteTransientOverlayPresented
{
  void *v2;
  char v3;

  if (_calculateUserInitiatedRemoteTransientOverlayPresented_onceToken != -1)
    dispatch_once(&_calculateUserInitiatedRemoteTransientOverlayPresented_onceToken, &__block_literal_global_124);
  objc_msgSend((id)SBApp, "remoteTransientOverlaySessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasActiveSessionMatchingPredicate:options:", &__block_literal_global_22_0, 0);

  return v3;
}

void __95__SBContinuitySessionSystemEventMonitor__calculateUserInitiatedRemoteTransientOverlayPresented__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.PassbookUIService");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_calculateUserInitiatedRemoteTransientOverlayPresented_allowedBundleIdentifiers;
  _calculateUserInitiatedRemoteTransientOverlayPresented_allowedBundleIdentifiers = v0;

}

uint64_t __95__SBContinuitySessionSystemEventMonitor__calculateUserInitiatedRemoteTransientOverlayPresented__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = a2;
  objc_msgSend((id)SBApp, "windowSceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "embeddedDisplayWindowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isPresentedOnWindowScene:", v4))
  {
    v5 = (void *)_calculateUserInitiatedRemoteTransientOverlayPresented_allowedBundleIdentifiers;
    objc_msgSend(v2, "serviceBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_setUserInitiatedRemoteTransientOverlayPresented:(BOOL)a3
{
  id v4;

  if (self->_userInitiatedRemoteTransientOverlayPresented != a3)
  {
    self->_userInitiatedRemoteTransientOverlayPresented = a3;
    +[SBContinuitySessionSystemEvent eventWithType:](SBContinuitySessionSystemEvent, "eventWithType:", 12);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBContinuitySessionSystemEventMonitor _postEvent:](self, "_postEvent:", v4);

  }
}

- (BOOL)isLockScreenSearchPresented
{
  return self->_lockScreenSearchPresented;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayManagerObserver, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
