@implementation SBDefaultCoverSheetContext

- (void)proximitySensorManager:(id)a3 crudeProximityDidChange:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  self->_objectInProximity = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_proximitySensorProviderObservers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "proximitySensorProvider:objectWithinProximityDidChange:", self, v4, (_QWORD)v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (SBDefaultCoverSheetContext)initWithWindowScene:(id)a3
{
  id v4;
  SBDefaultCoverSheetContext *v5;
  SBDefaultCoverSheetContext *v6;
  uint64_t v7;
  SBFAuthenticationAssertionProviding *authenticationAssertionProvider;
  uint64_t v9;
  SBFAuthenticationStatusProvider *authenticationStatusProvider;
  uint64_t v11;
  SBFPasscodeFieldChangeObserver *passcodeFieldChangeObserver;
  id v13;
  id v14;
  uint64_t v15;
  SBFDateProviding *dateProvider;
  uint64_t v17;
  SBFLockOutStatusProvider *lockOutStatusProvider;
  SBDashBoardLegibilityProvider *v19;
  CSLegibilityProviding *legibilityProvider;
  uint64_t v21;
  CSPowerStatusProviding *powerStatusProvider;
  uint64_t v23;
  NSString *powerStatusChangeNotificationName;
  SBDashBoardThermalStatusProvider *v25;
  CSThermalStatusProviding *thermalStatusProvider;
  uint64_t v27;
  SBUIBiometricResource *biometricResource;
  uint64_t v29;
  CSScreenStateProviding *screenStateProvider;
  uint64_t v31;
  SBFScreenWakeAnimationControlling *screenWakeAnimationController;
  uint64_t v33;
  SBSyncController *syncController;
  SBDashBoardWallpaperProvider *v35;
  CSWallpaperProviding *wallpaperProvider;
  uint64_t v37;
  CSWallpaperSnapshotUpdating *wallpaperSnapshotUpdater;
  SBFWallpaperAggdLogger *v39;
  SBFWallpaperAggdLogger *wallpaperAggdLogger;
  SBDashBoardHomeAffordanceController *v41;
  CSHomeAffordanceControlling *homeAffordanceController;
  SBDashBoardModalHomeAffordanceController *v43;
  CSModalHomeAffordanceControlling *modalHomeAffordanceController;
  SBDashBoardPlatterHomeGestureManager *v45;
  CSPlatterHomeGestureManaging *platterHomeGestureManager;
  SBDashBoardStatusBarController *v47;
  void *v48;
  uint64_t v49;
  CSStatusBarControlling *statusBarController;
  uint64_t v51;
  SBFActionProviding *contentActionProvider;
  SBDashBoardApplicationInformer *v53;
  CSApplicationInforming *applicationInformer;
  SBDashBoardNotificationPresenter *v55;
  SBDashBoardNotificationPresenter *notificationPresenter;
  uint64_t v57;
  SBProximitySensorManager *proximitySensorManager;
  NSMutableSet *v59;
  NSMutableSet *proximitySensorProviderObservers;
  uint64_t v61;
  CSMagSafeAccessoryStatusProviding *accessoryStatusProvider;
  uint64_t v63;
  NSString *accessoryAttachedNotificationName;
  uint64_t v65;
  NSString *accessoryDetachedNotificationName;
  uint64_t v67;
  NSString *accessoryAnimationStatusChangedNotificationName;
  uint64_t v69;
  SBFHomeAffordanceInteractionProviding *homeAffordanceInteractionProvider;
  objc_super v72;

  v4 = a3;
  v72.receiver = self;
  v72.super_class = (Class)SBDefaultCoverSheetContext;
  v5 = -[SBDefaultCoverSheetContext init](&v72, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_sbWindowScene, v4);
    objc_msgSend((id)SBApp, "authenticationController");
    v7 = objc_claimAutoreleasedReturnValue();
    authenticationAssertionProvider = v6->_authenticationAssertionProvider;
    v6->_authenticationAssertionProvider = (SBFAuthenticationAssertionProviding *)v7;

    objc_msgSend((id)SBApp, "authenticationController");
    v9 = objc_claimAutoreleasedReturnValue();
    authenticationStatusProvider = v6->_authenticationStatusProvider;
    v6->_authenticationStatusProvider = (SBFAuthenticationStatusProvider *)v9;

    objc_msgSend((id)SBApp, "authenticationController");
    v11 = objc_claimAutoreleasedReturnValue();
    passcodeFieldChangeObserver = v6->_passcodeFieldChangeObserver;
    v6->_passcodeFieldChangeObserver = (SBFPasscodeFieldChangeObserver *)v11;

    v13 = objc_alloc(MEMORY[0x1E0DA9EB0]);
    v14 = objc_alloc_init(MEMORY[0x1E0D1BC18]);
    v15 = objc_msgSend(v13, "initWithDateProvider:", v14);
    dateProvider = v6->_dateProvider;
    v6->_dateProvider = (SBFDateProviding *)v15;

    objc_msgSend((id)SBApp, "lockOutController");
    v17 = objc_claimAutoreleasedReturnValue();
    lockOutStatusProvider = v6->_lockOutStatusProvider;
    v6->_lockOutStatusProvider = (SBFLockOutStatusProvider *)v17;

    v19 = objc_alloc_init(SBDashBoardLegibilityProvider);
    legibilityProvider = v6->_legibilityProvider;
    v6->_legibilityProvider = (CSLegibilityProviding *)v19;

    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v21 = objc_claimAutoreleasedReturnValue();
    powerStatusProvider = v6->_powerStatusProvider;
    v6->_powerStatusProvider = (CSPowerStatusProviding *)v21;

    v23 = objc_msgSend(CFSTR("SBUIACStatusChangedNotification"), "copy");
    powerStatusChangeNotificationName = v6->_powerStatusChangeNotificationName;
    v6->_powerStatusChangeNotificationName = (NSString *)v23;

    v25 = objc_alloc_init(SBDashBoardThermalStatusProvider);
    thermalStatusProvider = v6->_thermalStatusProvider;
    v6->_thermalStatusProvider = (CSThermalStatusProviding *)v25;

    objc_msgSend(MEMORY[0x1E0DAC5A0], "sharedInstance");
    v27 = objc_claimAutoreleasedReturnValue();
    biometricResource = v6->_biometricResource;
    v6->_biometricResource = (SBUIBiometricResource *)v27;

    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v29 = objc_claimAutoreleasedReturnValue();
    screenStateProvider = v6->_screenStateProvider;
    v6->_screenStateProvider = (CSScreenStateProviding *)v29;

    +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
    v31 = objc_claimAutoreleasedReturnValue();
    screenWakeAnimationController = v6->_screenWakeAnimationController;
    v6->_screenWakeAnimationController = (SBFScreenWakeAnimationControlling *)v31;

    +[SBSyncController sharedInstance](SBSyncController, "sharedInstance");
    v33 = objc_claimAutoreleasedReturnValue();
    syncController = v6->_syncController;
    v6->_syncController = (SBSyncController *)v33;

    v35 = objc_alloc_init(SBDashBoardWallpaperProvider);
    wallpaperProvider = v6->_wallpaperProvider;
    v6->_wallpaperProvider = (CSWallpaperProviding *)v35;

    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v37 = objc_claimAutoreleasedReturnValue();
    wallpaperSnapshotUpdater = v6->_wallpaperSnapshotUpdater;
    v6->_wallpaperSnapshotUpdater = (CSWallpaperSnapshotUpdating *)v37;

    v39 = (SBFWallpaperAggdLogger *)objc_alloc_init(MEMORY[0x1E0DA9F68]);
    wallpaperAggdLogger = v6->_wallpaperAggdLogger;
    v6->_wallpaperAggdLogger = v39;

    v41 = objc_alloc_init(SBDashBoardHomeAffordanceController);
    homeAffordanceController = v6->_homeAffordanceController;
    v6->_homeAffordanceController = (CSHomeAffordanceControlling *)v41;

    v43 = objc_alloc_init(SBDashBoardModalHomeAffordanceController);
    modalHomeAffordanceController = v6->_modalHomeAffordanceController;
    v6->_modalHomeAffordanceController = (CSModalHomeAffordanceControlling *)v43;

    v45 = objc_alloc_init(SBDashBoardPlatterHomeGestureManager);
    platterHomeGestureManager = v6->_platterHomeGestureManager;
    v6->_platterHomeGestureManager = (CSPlatterHomeGestureManaging *)v45;

    v47 = [SBDashBoardStatusBarController alloc];
    objc_msgSend(v4, "statusBarManager");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = -[SBDashBoardStatusBarController initWithWindowSceneStatusBarManager:](v47, "initWithWindowSceneStatusBarManager:", v48);
    statusBarController = v6->_statusBarController;
    v6->_statusBarController = (CSStatusBarControlling *)v49;

    +[SBActionHandler sharedInstance](SBActionHandler, "sharedInstance");
    v51 = objc_claimAutoreleasedReturnValue();
    contentActionProvider = v6->_contentActionProvider;
    v6->_contentActionProvider = (SBFActionProviding *)v51;

    v53 = objc_alloc_init(SBDashBoardApplicationInformer);
    applicationInformer = v6->_applicationInformer;
    v6->_applicationInformer = (CSApplicationInforming *)v53;

    v55 = objc_alloc_init(SBDashBoardNotificationPresenter);
    notificationPresenter = v6->_notificationPresenter;
    v6->_notificationPresenter = v55;

    objc_msgSend((id)SBApp, "proximitySensorManager");
    v57 = objc_claimAutoreleasedReturnValue();
    proximitySensorManager = v6->_proximitySensorManager;
    v6->_proximitySensorManager = (SBProximitySensorManager *)v57;

    v59 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    proximitySensorProviderObservers = v6->_proximitySensorProviderObservers;
    v6->_proximitySensorProviderObservers = v59;

    -[SBProximitySensorManager addObserver:](v6->_proximitySensorManager, "addObserver:", v6);
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v61 = objc_claimAutoreleasedReturnValue();
    accessoryStatusProvider = v6->_accessoryStatusProvider;
    v6->_accessoryStatusProvider = (CSMagSafeAccessoryStatusProviding *)v61;

    v63 = objc_msgSend(CFSTR("SBUIAccessoryAttachedNotification"), "copy");
    accessoryAttachedNotificationName = v6->_accessoryAttachedNotificationName;
    v6->_accessoryAttachedNotificationName = (NSString *)v63;

    v65 = objc_msgSend(CFSTR("SBUIAccessoryDetachedNotification"), "copy");
    accessoryDetachedNotificationName = v6->_accessoryDetachedNotificationName;
    v6->_accessoryDetachedNotificationName = (NSString *)v65;

    v67 = objc_msgSend(CFSTR("SBUIAccessoryAnimationStatusChangedNotification"), "copy");
    accessoryAnimationStatusChangedNotificationName = v6->_accessoryAnimationStatusChangedNotificationName;
    v6->_accessoryAnimationStatusChangedNotificationName = (NSString *)v67;

    objc_msgSend(v4, "homeAffordanceInteractionManager");
    v69 = objc_claimAutoreleasedReturnValue();
    homeAffordanceInteractionProvider = v6->_homeAffordanceInteractionProvider;
    v6->_homeAffordanceInteractionProvider = (SBFHomeAffordanceInteractionProviding *)v69;

  }
  return v6;
}

- (NSArray)dismissableOverlays
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  +[SBControlCenterController sharedInstance](SBControlCenterController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (CSNotificationPresenting)notificationPresenter
{
  return (CSNotificationPresenting *)self->_notificationPresenter;
}

- (void)attemptUnlockWithPasscode:(id)a3 finishUIUnlock:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "attemptUnlockWithPasscode:finishUIUnlock:completion:", v8, v5, v7);

}

- (void)setBiometricAutoUnlockingDisabled:(BOOL)a3 forReason:(id)a4
{
  _BOOL8 v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a4;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBiometricAutoUnlockingDisabled:forReason:", v4, v5);

}

- (void)setPasscodeVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasscodeVisible:animated:", v5, v4);

}

- (BOOL)isCarPlayActiveForNotifications
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "notificationDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCarDestinationActive");

  return v3;
}

- (void)stopMediaPlaybackForSource:(int64_t)a3
{
  uint64_t v3;
  id v4;

  if (a3 == 1)
    v3 = 6;
  else
    v3 = 0;
  +[SBMediaController sharedInstance](SBMediaController, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopForEventSource:", v3);

}

- (void)deactivateReachability
{
  id v2;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deactivateReachability");

}

- (double)effectiveReachabilityYOffset
{
  void *v2;
  double v3;
  double v4;

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveReachabilityYOffset");
  v4 = v3;

  return v4;
}

- (BOOL)isResetting
{
  return -[SBSyncController isResetting](self->_syncController, "isResetting");
}

- (int64_t)resetState
{
  int v2;

  v2 = -[SBSyncController resetState](self->_syncController, "resetState");
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (BOOL)isRestoring
{
  return -[SBSyncController isRestoring](self->_syncController, "isRestoring");
}

- (int64_t)restoreState
{
  uint64_t v2;

  v2 = -[SBSyncController restoreState](self->_syncController, "restoreState") - 1;
  if (v2 < 4)
    return v2 + 1;
  else
    return 0;
}

- (BOOL)isEmergencyCallSupported
{
  void *v2;
  char v3;

  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "emergencyCallSupported");

  return v3;
}

- (BOOL)expectsPocketTouches
{
  void *v2;
  char v3;

  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBeenDismissedSinceKeybagLock") ^ 1;

  return v3;
}

- (BOOL)tapToWakeEnabled
{
  void *v2;
  char v3;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldTapToWake");

  return v3;
}

- (id)createUnlockRequest
{
  return objc_alloc_init(CSConcreteUnlockRequest);
}

- (id)createUnlockRequestForActionContext:(id)a3
{
  id v3;
  CSConcreteUnlockRequest *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_alloc_init(CSConcreteUnlockRequest);
  -[CSConcreteUnlockRequest setSource:](v4, "setSource:", objc_msgSend(v3, "source"));
  -[CSConcreteUnlockRequest setIntent:](v4, "setIntent:", objc_msgSend(v3, "intent"));
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSConcreteUnlockRequest setName:](v4, "setName:", v5);

  v6 = objc_msgSend(v3, "confirmedNotInPocket");
  -[CSConcreteUnlockRequest setConfirmedNotInPocket:](v4, "setConfirmedNotInPocket:", v6);
  return v4;
}

- (void)unlockWithRequest:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  SBLockScreenUnlockRequest *v10;

  v5 = a4;
  v6 = a3;
  v10 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setSource:](v10, "setSource:", objc_msgSend(v6, "source"));
  -[SBLockScreenUnlockRequest setIntent:](v10, "setIntent:", objc_msgSend(v6, "intent"));
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenUnlockRequest setName:](v10, "setName:", v7);

  -[SBLockScreenUnlockRequest setWantsBiometricPresentation:](v10, "setWantsBiometricPresentation:", objc_msgSend(v6, "wantsBiometricPresentation"));
  v8 = objc_msgSend(v6, "confirmedNotInPocket");

  -[SBLockScreenUnlockRequest setConfirmedNotInPocket:](v10, "setConfirmedNotInPocket:", v8);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unlockWithRequest:completion:", v10, v5);

}

- (BOOL)isLogoutSupported
{
  void *v2;
  char v3;

  objc_msgSend((id)SBApp, "userSessionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canLogout");

  return v3;
}

- (void)logout
{
  void *v2;
  int v3;
  void *v4;
  id v5;

  v2 = (void *)objc_opt_new();
  v3 = objc_msgSend(v2, "isCurrentUserAnonymous");

  if (v3)
  {
    v5 = (id)objc_opt_new();
    objc_msgSend(v5, "setLogoutActionHandler:", &__block_literal_global_199);
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activateAlertItem:", v5);

  }
  else
  {
    objc_msgSend((id)SBApp, "userSessionController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logout");
  }

}

void __36__SBDefaultCoverSheetContext_logout__block_invoke()
{
  id v0;

  objc_msgSend((id)SBApp, "userSessionController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "logout");

}

- (void)incrementIrisPlayCount
{
  -[SBFWallpaperAggdLogger incrementIrisPlayCount](self->_wallpaperAggdLogger, "incrementIrisPlayCount");
}

- (BOOL)wantsHomeScreenOverlay
{
  return 1;
}

- (id)newOverlayController
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SBHomeScreenOverlayController *v8;
  SBHomeScreenOverlayController *v9;
  void *v10;
  void *v11;
  void *v12;
  id result;
  void *v14;
  uint64_t v15;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  if (WeakRetained)
  {
    v4 = WeakRetained;
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listLayoutProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [SBHomeScreenOverlayController alloc];
    LOBYTE(v15) = 1;
    v9 = -[SBHomeScreenOverlayController initWithListLayoutProvider:windowLevel:windowScene:traitsRole:zStackParticipantIdentifier:screenEdgeSystemGestureType:indirectScreenEdgeSystemGestureType:scrunchSystemGestureType:secure:](v8, "initWithListLayoutProvider:windowLevel:windowScene:traitsRole:zStackParticipantIdentifier:screenEdgeSystemGestureType:indirectScreenEdgeSystemGestureType:scrunchSystemGestureType:secure:", v7, v4, CFSTR("SBTraitsParticipantRoleCoverSheetHomeScreenOverlay"), 11, 106, 107, *MEMORY[0x1E0CEBBD0], 108, v15);
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coverSheetTodayViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBHomeScreenOverlayController setLeadingSidebarViewController:](v9, "setLeadingSidebarViewController:", v11);
    -[SBHomeScreenOverlayController viewController](v9, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setContainerViewController:", v12);

    objc_msgSend(v11, "setDismissalDelegate:", v9);
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v9, "addHomeScreenOverlayObserver:", self);
    -[SBHomeScreenOverlayController addHomeScreenOverlayObserver:](v9, "addHomeScreenOverlayObserver:", v11);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("windowScene != nil"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDefaultCoverSheetContext newOverlayController].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (BOOL)dismissModalContentIfVisibleAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  int v5;

  v3 = a3;
  -[SBDefaultCoverSheetContext _todayViewControllerIfAvailable](self, "_todayViewControllerIfAvailable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isSpotlightVisible");
  if (v5)
    objc_msgSend(v4, "dismissSpotlightAnimated:", v3);

  return v5;
}

- (id)_todayViewControllerIfAvailable
{
  void *v2;
  void *v3;
  id v4;

  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coverSheetTodayViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (a6)
  {
    objc_msgSend(a3, "presentationProgress", a4, a5);
    if (a4 <= 0.0 && v7 > 0.0)
    {
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 1;
LABEL_8:
      objc_msgSend(v8, "setOverlayCoverSheetTodayViewVisible:", v10);

      return;
    }
    if (a4 > 0.0 && v7 <= 0.0)
    {
      +[SBIconController sharedInstance](SBIconController, "sharedInstance");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = 0;
      goto LABEL_8;
    }
  }
}

- (id)applicationHosterForHostContextProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBDeviceApplicationSceneEntity *v9;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v10;
  SBDashBoardHostedAppViewController *v11;
  id result;
  void *v13;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "hostedAppBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7F878], "specification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:generatingNewSceneIfRequiredWithSpecification:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:generatingNewSceneIfRequiredWithSpecification:", v7, v8);
    v10 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:]([SBMutableDeviceApplicationScenePlaceholderContentContext alloc], "initWithActivationSettings:", v9);
    v11 = -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:]([SBDashBoardHostedAppViewController alloc], "initWithApplicationSceneEntity:", v9);
    -[SBDashBoardHostedAppViewController setPlaceholderContentContext:](v11, "setPlaceholderContentContext:", v10);
    -[SBDashBoardHostedAppViewController setHostContextProvider:](v11, "setHostContextProvider:", v4);

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostContextProvider != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDefaultCoverSheetContext applicationHosterForHostContextProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)applicationHosterForTraitsHostContextProvider:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBDeviceApplicationSceneEntity *v9;
  SBMutableDeviceApplicationScenePlaceholderContentContext *v10;
  SBDashBoardHostedAppViewController *v11;
  id result;
  void *v13;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "hostedAppBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7F878], "specification");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:generatingNewSceneIfRequiredWithSpecification:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:generatingNewSceneIfRequiredWithSpecification:", v7, v8);
    v10 = -[SBDeviceApplicationScenePlaceholderContentContext initWithActivationSettings:]([SBMutableDeviceApplicationScenePlaceholderContentContext alloc], "initWithActivationSettings:", v9);
    v11 = -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:]([SBDashBoardHostedAppViewController alloc], "initWithApplicationSceneEntity:", v9);
    -[SBDashBoardHostedAppViewController setPlaceholderContentContext:](v11, "setPlaceholderContentContext:", v10);
    -[SBDashBoardHostedAppViewController setHostContextProvider:](v11, "setHostContextProvider:", v4);

    return v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("hostContextProvider != ((void *)0)"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDefaultCoverSheetContext applicationHosterForTraitsHostContextProvider:].cold.1();
    objc_msgSend(objc_retainAutorelease(v13), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)traitsAwareViewControllerForApplicationHoster:(id)a3 targetWindow:(id)a4
{
  id v5;
  id v6;
  SBDashBoardTraitsAwareAppHostingViewController *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[SBDashBoardTraitsAwareAppHostingViewController initWithAppHosting:targetWindow:]([SBDashBoardTraitsAwareAppHostingViewController alloc], "initWithAppHosting:targetWindow:", v6, v5);

  return v7;
}

- (void)registerView:(id)a3 delegate:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "systemPointerInteractionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerView:delegate:", v11, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("windowScene != nil"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDefaultCoverSheetContext registerView:delegate:].cold.1();
    objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)unregisterView:(id)a3
{
  SBWindowScene **p_sbWindowScene;
  id v4;
  void *v5;
  id WeakRetained;

  p_sbWindowScene = &self->_sbWindowScene;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_sbWindowScene);
  objc_msgSend(WeakRetained, "systemPointerInteractionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unregisterView:", v4);

}

- (void)addProximitySensorProviderObserver:(id)a3
{
  -[NSMutableSet addObject:](self->_proximitySensorProviderObservers, "addObject:", a3);
}

- (void)removeProximitySensorProviderObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_proximitySensorProviderObservers, "removeObject:", a3);
}

- (id)requestProximityMode:(int)a3 forReason:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)SBApp;
  v6 = a4;
  objc_msgSend(v5, "HIDUISensorController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestProximityMode:forReason:", v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)rawDeviceOrientationIgnoringOrientationLocks
{
  return objc_msgSend((id)SBApp, "rawDeviceOrientationIgnoringOrientationLocks");
}

- (BOOL)isSystemAssistantExperienceAvailable
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceAvailable");

  return v4;
}

- (BOOL)isSystemAssistantExperienceEnabled
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceEnabled");

  return v4;
}

- (BOOL)isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
  objc_msgSend(WeakRetained, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  return v4;
}

- (void)addAssistantControllerObserver:(id)a3
{
  id v4;
  NSHashTable *assistantControllerObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v4 = a3;
  assistantControllerObservers = self->_assistantControllerObservers;
  v10 = v4;
  if (!assistantControllerObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_assistantControllerObservers;
    self->_assistantControllerObservers = v6;

    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    objc_msgSend(WeakRetained, "assistantController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:", self);

    v4 = v10;
    assistantControllerObservers = self->_assistantControllerObservers;
  }
  -[NSHashTable addObject:](assistantControllerObservers, "addObject:", v4);

}

- (void)removeAssistantControllerObserver:(id)a3
{
  id WeakRetained;
  void *v5;
  NSHashTable *assistantControllerObservers;

  -[NSHashTable removeObject:](self->_assistantControllerObservers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_assistantControllerObservers, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sbWindowScene);
    objc_msgSend(WeakRetained, "assistantController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", self);

    assistantControllerObservers = self->_assistantControllerObservers;
    self->_assistantControllerObservers = 0;

  }
}

- (void)assistantDidChangeSystemAssistantExperienceEnablement:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v4 = self->_assistantControllerObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceEnablement:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v4 = self->_assistantControllerObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (void)assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  v4 = self->_assistantControllerObservers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "assistantDidChangeSystemAssistantExperiencePersistentSiriEnablement:", self, (_QWORD)v10);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

}

- (SBFAuthenticationAssertionProviding)authenticationAssertionProvider
{
  return self->_authenticationAssertionProvider;
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (SBFPasscodeFieldChangeObserver)passcodeFieldChangeObserver
{
  return self->_passcodeFieldChangeObserver;
}

- (SBFDateProviding)dateProvider
{
  return self->_dateProvider;
}

- (SBFLockOutStatusProvider)lockOutStatusProvider
{
  return self->_lockOutStatusProvider;
}

- (CSLegibilityProviding)legibilityProvider
{
  return self->_legibilityProvider;
}

- (CSPowerStatusProviding)powerStatusProvider
{
  return self->_powerStatusProvider;
}

- (NSString)powerStatusChangeNotificationName
{
  return self->_powerStatusChangeNotificationName;
}

- (CSMagSafeAccessoryStatusProviding)accessoryStatusProvider
{
  return self->_accessoryStatusProvider;
}

- (NSString)accessoryAttachedNotificationName
{
  return self->_accessoryAttachedNotificationName;
}

- (NSString)accessoryDetachedNotificationName
{
  return self->_accessoryDetachedNotificationName;
}

- (NSString)accessoryAnimationStatusChangedNotificationName
{
  return self->_accessoryAnimationStatusChangedNotificationName;
}

- (CSThermalStatusProviding)thermalStatusProvider
{
  return self->_thermalStatusProvider;
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (CSScreenStateProviding)screenStateProvider
{
  return self->_screenStateProvider;
}

- (SBFScreenWakeAnimationControlling)screenWakeAnimationController
{
  return self->_screenWakeAnimationController;
}

- (CSHomeAffordanceControlling)homeAffordanceController
{
  return self->_homeAffordanceController;
}

- (CSModalHomeAffordanceControlling)modalHomeAffordanceController
{
  return self->_modalHomeAffordanceController;
}

- (CSPlatterHomeGestureManaging)platterHomeGestureManager
{
  return self->_platterHomeGestureManager;
}

- (CSStatusBarControlling)statusBarController
{
  return self->_statusBarController;
}

- (CSWallpaperProviding)wallpaperProvider
{
  return self->_wallpaperProvider;
}

- (CSWallpaperSnapshotUpdating)wallpaperSnapshotUpdater
{
  return self->_wallpaperSnapshotUpdater;
}

- (SBFActionProviding)contentActionProvider
{
  return self->_contentActionProvider;
}

- (CSApplicationInforming)applicationInformer
{
  return self->_applicationInformer;
}

- (BOOL)isObjectInProximity
{
  return self->_objectInProximity;
}

- (SBFHomeAffordanceInteractionProviding)homeAffordanceInteractionProvider
{
  return self->_homeAffordanceInteractionProvider;
}

- (SBWindowScene)_sbWindowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_sbWindowScene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sbWindowScene);
  objc_storeStrong((id *)&self->_homeAffordanceInteractionProvider, 0);
  objc_storeStrong((id *)&self->_applicationInformer, 0);
  objc_storeStrong((id *)&self->_contentActionProvider, 0);
  objc_storeStrong((id *)&self->_wallpaperSnapshotUpdater, 0);
  objc_storeStrong((id *)&self->_wallpaperProvider, 0);
  objc_storeStrong((id *)&self->_statusBarController, 0);
  objc_storeStrong((id *)&self->_platterHomeGestureManager, 0);
  objc_storeStrong((id *)&self->_modalHomeAffordanceController, 0);
  objc_storeStrong((id *)&self->_homeAffordanceController, 0);
  objc_storeStrong((id *)&self->_screenWakeAnimationController, 0);
  objc_storeStrong((id *)&self->_screenStateProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_thermalStatusProvider, 0);
  objc_storeStrong((id *)&self->_accessoryAnimationStatusChangedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessoryDetachedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessoryAttachedNotificationName, 0);
  objc_storeStrong((id *)&self->_accessoryStatusProvider, 0);
  objc_storeStrong((id *)&self->_powerStatusChangeNotificationName, 0);
  objc_storeStrong((id *)&self->_powerStatusProvider, 0);
  objc_storeStrong((id *)&self->_legibilityProvider, 0);
  objc_storeStrong((id *)&self->_lockOutStatusProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_passcodeFieldChangeObserver, 0);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_authenticationAssertionProvider, 0);
  objc_storeStrong((id *)&self->_assistantControllerObservers, 0);
  objc_storeStrong((id *)&self->_proximitySensorProviderObservers, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_notificationPresenter, 0);
  objc_storeStrong((id *)&self->_wallpaperAggdLogger, 0);
  objc_storeStrong((id *)&self->_syncController, 0);
}

- (void)newOverlayController
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)applicationHosterForHostContextProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)applicationHosterForTraitsHostContextProvider:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)registerView:delegate:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
