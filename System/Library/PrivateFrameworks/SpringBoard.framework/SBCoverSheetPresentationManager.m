@implementation SBCoverSheetPresentationManager

+ (SBCoverSheetPresentationManager)sharedInstance
{
  if (sharedInstance_onceToken_20 != -1)
    dispatch_once(&sharedInstance_onceToken_20, &__block_literal_global_152);
  return (SBCoverSheetPresentationManager *)(id)__sharedInstance_1;
}

- (BSInvalidatable)secureAppViewController
{
  return self->_secureAppViewController;
}

- (BOOL)isVisible
{
  BOOL v3;
  void *v4;

  if ((-[SBUILockStateProvider isUILocked](self->_uiLockStateProvider, "isUILocked") & 1) != 0)
    return 1;
  -[SBCoverSheetPresentationManager coverSheetSlidingViewControllerIfLoaded](self, "coverSheetSlidingViewControllerIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v4, "_appearState") != 0;

  return v3;
}

- (id)coverSheetSlidingViewControllerIfLoaded
{
  return self->_coverSheetSlidingViewController;
}

- (NSString)coverSheetIdentifier
{
  return (NSString *)CFSTR("CoverSheet");
}

- (BOOL)isCoverSheetHostingAnApp
{
  void *v3;
  char v4;
  BSInvalidatable *secureAppViewController;
  NSObject *v6;
  uint8_t v8[16];

  -[SBLockScreenEnvironment applicationHoster](self->_lockScreenEnvironment, "applicationHoster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHostingAnApp");

  if ((v4 & 1) != 0)
  {
LABEL_7:
    LOBYTE(secureAppViewController) = 1;
    return (char)secureAppViewController;
  }
  secureAppViewController = self->_secureAppViewController;
  if (secureAppViewController)
  {
    if ((-[BSInvalidatable isHostingAnApp](secureAppViewController, "isHostingAnApp") & 1) == 0)
    {
      SBLogCoverSheet();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Is coversheet hosting an app ? Neither application hoster nor secure app view controller is hosting an app but we have a secure app view controller. Returning YES", v8, 2u);
      }

    }
    goto LABEL_7;
  }
  return (char)secureAppViewController;
}

- (SBDeviceApplicationSceneHandle)coverSheetHostedAppSceneHandle
{
  void *v3;
  char v4;
  BSInvalidatable *secureAppViewController;
  void *v6;

  -[SBLockScreenEnvironment applicationHoster](self->_lockScreenEnvironment, "applicationHoster");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHostingAnApp");
  secureAppViewController = (BSInvalidatable *)v3;
  if ((v4 & 1) == 0)
  {
    if (!-[BSInvalidatable isHostingAnApp](self->_secureAppViewController, "isHostingAnApp"))
    {
      v6 = 0;
      goto LABEL_6;
    }
    secureAppViewController = self->_secureAppViewController;
  }
  -[BSInvalidatable hostedAppSceneHandle](secureAppViewController, "hostedAppSceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (SBDeviceApplicationSceneHandle *)v6;
}

- (void)_tellDashBoardOurAppearanceAndBehaviorChanged
{
  -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceChanged](self, "_tellDashBoardOurAppearanceChanged");
  -[SBCoverSheetPresentationManager _tellDashBoardOurBehaviorChanged](self, "_tellDashBoardOurBehaviorChanged");
}

- (void)_tellDashBoardOurBehaviorChanged
{
  id v3;

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalBehaviorProviderBehaviorChanged:", self);

}

- (void)_tellDashBoardOurAppearanceChanged
{
  id v3;

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "externalAppearanceProviderBehaviorChanged:", self);

}

- (id)coverSheetViewController
{
  void *v2;
  id v3;

  -[SBLockScreenEnvironment rootViewController](self->_lockScreenEnvironment, "rootViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

+ (id)sharedInstanceIfExists
{
  return (id)__sharedInstance_1;
}

- (SBCoverSheetSlidingViewController)coverSheetSlidingViewController
{
  SBCoverSheetSlidingViewController *coverSheetSlidingViewController;
  void *v6;

  coverSheetSlidingViewController = self->_coverSheetSlidingViewController;
  if (!coverSheetSlidingViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCoverSheetPresentationManager.m"), 488, CFSTR("asking for the coversheet sliding view controller before it was initialized."));

    coverSheetSlidingViewController = self->_coverSheetSlidingViewController;
  }
  return coverSheetSlidingViewController;
}

- (id)traitsParticipantForSceneHandle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (-[SBCoverSheetSecureAppEnvironmentViewController traitsParticipantForSceneHandle:](self->_secureAppEnvironmentViewController, "traitsParticipantForSceneHandle:", v4), (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SBLockScreenEnvironment applicationHoster](self->_lockScreenEnvironment, "applicationHoster");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "traitsParticipantForSceneHandle:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

uint64_t __49__SBCoverSheetPresentationManager_sharedInstance__block_invoke()
{
  SBCoverSheetPresentationManager *v0;
  void *v1;
  void *v2;

  kdebug_trace();
  v0 = objc_alloc_init(SBCoverSheetPresentationManager);
  v1 = (void *)__sharedInstance_1;
  __sharedInstance_1 = (uint64_t)v0;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setOrientationProvider:forSource:", __sharedInstance_1, 3);

  return kdebug_trace();
}

- (SBCoverSheetPresentationManager)init
{
  SBCoverSheetPresentationManager *v2;
  NSMutableSet *v3;
  NSMutableSet *coverSheetWindowVisibleReasons;
  NSMutableSet *v5;
  NSMutableSet *secureAppWindowVisibleReasons;
  SBAtomicObjectQueue *v7;
  SBAtomicObjectQueue *unlockProgressQueue;
  id v9;
  uint64_t v10;
  BSEventQueue *lockUnlockQueue;
  uint64_t v12;
  CSLockScreenSettings *lockScreenSettings;
  void *v14;
  uint64_t v15;
  UIImpactFeedbackGenerator *rubberBandFeedbackGenerator;
  void *v17;
  uint64_t v18;
  CSCoverSheetFlyInSettings *flyInSettings;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  SBFZStackParticipant *zStackParticipant;
  void *v30;
  objc_class *v31;
  void *v32;
  uint64_t v33;
  BSCompoundAssertion *preserveSecureAppAssertions;
  void *v35;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *);
  void *v40;
  id v41;
  id location;
  objc_super v43;

  v43.receiver = self;
  v43.super_class = (Class)SBCoverSheetPresentationManager;
  v2 = -[SBCoverSheetPresentationManager init](&v43, sel_init);
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    coverSheetWindowVisibleReasons = v2->_coverSheetWindowVisibleReasons;
    v2->_coverSheetWindowVisibleReasons = v3;

    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    secureAppWindowVisibleReasons = v2->_secureAppWindowVisibleReasons;
    v2->_secureAppWindowVisibleReasons = v5;

    v7 = objc_alloc_init(SBAtomicObjectQueue);
    unlockProgressQueue = v2->_unlockProgressQueue;
    v2->_unlockProgressQueue = v7;

    v9 = objc_alloc(MEMORY[0x1E0D01770]);
    v10 = objc_msgSend(v9, "initWithName:onQueue:", CFSTR("SBCoverSheetLockUnlockQueue"), MEMORY[0x1E0C80D38]);
    lockUnlockQueue = v2->_lockUnlockQueue;
    v2->_lockUnlockQueue = (BSEventQueue *)v10;

    objc_msgSend(MEMORY[0x1E0D1BBD8], "rootSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    lockScreenSettings = v2->_lockScreenSettings;
    v2->_lockScreenSettings = (CSLockScreenSettings *)v12;

    -[CSLockScreenSettings addKeyObserver:](v2->_lockScreenSettings, "addKeyObserver:", v2);
    -[CSLockScreenSettings dashBoardScrollModifierSettings](v2->_lockScreenSettings, "dashBoardScrollModifierSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addKeyObserver:", v2);

    v15 = -[SBCoverSheetPresentationManager _newRubberBandFeedbackGeneratorForSettings:](v2, "_newRubberBandFeedbackGeneratorForSettings:", v2->_lockScreenSettings);
    rubberBandFeedbackGenerator = v2->_rubberBandFeedbackGenerator;
    v2->_rubberBandFeedbackGenerator = (UIImpactFeedbackGenerator *)v15;

    -[CSLockScreenSettings coverSheetTransitionsSettings](v2->_lockScreenSettings, "coverSheetTransitionsSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "flyInSettings");
    v18 = objc_claimAutoreleasedReturnValue();
    flyInSettings = v2->_flyInSettings;
    v2->_flyInSettings = (CSCoverSheetFlyInSettings *)v18;

    -[SBCoverSheetPresentationManager _updateIconsFlyInWithSettings:](v2, "_updateIconsFlyInWithSettings:", v2->_flyInSettings);
    -[CSLockScreenSettings coverSheetTransitionsSettings](v2->_lockScreenSettings, "coverSheetTransitionsSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "flyInSettings");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addKeyObserver:", v2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel__authenticationChanged_, *MEMORY[0x1E0DAA248], 0);
    objc_msgSend(v22, "addObserver:selector:name:object:", v2, sel__restartStartupTransitionBegan_, CFSTR("SBRestartManagerDidBeginStartupTransitionNotification"), 0);
    +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:", v2);

    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:", v2);

    objc_msgSend((id)SBApp, "windowSceneManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "embeddedDisplayWindowScene");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "zStackResolver");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "acquireParticipantWithIdentifier:delegate:", 8, v2);
    v28 = objc_claimAutoreleasedReturnValue();
    zStackParticipant = v2->_zStackParticipant;
    v2->_zStackParticipant = (SBFZStackParticipant *)v28;

    objc_initWeak(&location, v2);
    v30 = (void *)MEMORY[0x1E0D01718];
    v31 = (objc_class *)objc_opt_class();
    NSStringFromClass(v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __39__SBCoverSheetPresentationManager_init__block_invoke;
    v40 = &unk_1E8EA3688;
    objc_copyWeak(&v41, &location);
    objc_msgSend(v30, "assertionWithIdentifier:stateDidChangeHandler:", v32, &v37);
    v33 = objc_claimAutoreleasedReturnValue();
    preserveSecureAppAssertions = v2->_preserveSecureAppAssertions;
    v2->_preserveSecureAppAssertions = (BSCompoundAssertion *)v33;

    objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider", v37, v38, v39, v40);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "registerBacklightEnvironmentSceneProvider:", v2);

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);

  }
  return v2;
}

void __39__SBCoverSheetPresentationManager_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  v4 = v3;
  BSDispatchMain();

  objc_destroyWeak(&v5);
}

void __39__SBCoverSheetPresentationManager_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_updateSecureAppViewControllerVisibilityForAssertionsActive:", objc_msgSend(*(id *)(a1 + 32), "isActive"));

}

- (BOOL)coverSheetCanTransitionToPresented:(BOOL)a3
{
  return -[SBCoverSheetSlidingViewController canTransitionToPresented:](self->_coverSheetSlidingViewController, "canTransitionToPresented:", a3);
}

- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  -[SBCoverSheetPresentationManager setCoverSheetPresented:animated:options:withCompletion:](self, "setCoverSheetPresented:animated:options:withCompletion:", a3, a4, 0, a5);
}

- (void)_setCoverSheetPresented:(BOOL)a3 forcePresented:(BOOL)a4 animated:(BOOL)a5 withCompletion:(id)a6
{
  -[SBCoverSheetPresentationManager _setCoverSheetPresented:forcePresented:animated:options:withCompletion:](self, "_setCoverSheetPresented:forcePresented:animated:options:withCompletion:", a3, a4, a5, 0, a6);
}

- (void)setCoverSheetPresented:(BOOL)a3 animated:(BOOL)a4 options:(unint64_t)a5 withCompletion:(id)a6
{
  -[SBCoverSheetPresentationManager _setCoverSheetPresented:forcePresented:animated:options:withCompletion:](self, "_setCoverSheetPresented:forcePresented:animated:options:withCompletion:", a3, 0, a4, a5, a6);
}

- (void)_setCoverSheetPresented:(BOOL)a3 forcePresented:(BOOL)a4 animated:(BOOL)a5 options:(unint64_t)a6 withCompletion:(id)a7
{
  _BOOL8 v8;
  _BOOL4 v9;
  _BOOL8 v10;
  id v12;
  _BOOL4 v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _BOOL4 v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[16];

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v12 = a7;
  v13 = -[SBCoverSheetPresentationManager isInSecureApp](self, "isInSecureApp");
  if (-[SBUILockStateProvider isUILocked](self->_uiLockStateProvider, "isUILocked") != v10
    || (v17 = -[SBCoverSheetSlidingViewController isAnyGestureActivelyRecognized](self->_coverSheetSlidingViewController, "isAnyGestureActivelyRecognized"), v10 && v9)|| v17|| v13)
  {
    -[SBCoverSheetSlidingViewController activeGestureRecognizer](self->_coverSheetSlidingViewController, "activeGestureRecognizer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && !v10)
    {
      SBLogTelemetrySignposts();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v15))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v15, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_LOCKSCREEN_UNLOCK_ANIMATION_START", " enableTelemetry=YES  isAnimation=YES ", buf, 2u);
      }

      kdebug_trace();
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "postNotificationName:object:", CFSTR("SBCoverSheetWillAnimateDeactivation"), self);

    }
    objc_msgSend(v14, "setEnabled:", 0);
    objc_msgSend(v14, "setEnabled:", 1);
    self->_transitionOverrideOptions = a6;
    -[SBCoverSheetSlidingViewController setPresented:forUserGesture:animated:withCompletion:](self->_coverSheetSlidingViewController, "setPresented:forUserGesture:animated:withCompletion:", v10, (a6 >> 2) & 1, v8, v12);
    self->_transitionOverrideOptions = 0;
  }
  else
  {
    if (!v12)
      goto LABEL_9;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__SBCoverSheetPresentationManager__setCoverSheetPresented_forcePresented_animated_options_withCompletion___block_invoke;
    block[3] = &unk_1E8E9E8D0;
    v19 = v12;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v14 = v19;
  }

LABEL_9:
}

uint64_t __106__SBCoverSheetPresentationManager__setCoverSheetPresented_forcePresented_animated_options_withCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)completeOngoingPresentationIfNeeded
{
  void *v3;
  int v4;
  _QWORD v5[5];

  -[SBCoverSheetPresentationManager coverSheetSlidingViewControllerIfLoaded](self, "coverSheetSlidingViewControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_appearState");

  if (v4 == 1)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__SBCoverSheetPresentationManager_completeOngoingPresentationIfNeeded__block_invoke;
    v5[3] = &unk_1E8E9DED8;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v5);
  }
}

void __70__SBCoverSheetPresentationManager_completeOngoingPresentationIfNeeded__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "coverSheetSlidingViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setPresented:forUserGesture:animated:withCompletion:", 1, 0, 0, 0);

}

- (BOOL)isInSecureApp
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBCoverSheetPresentationManager secureAppSlidingViewControllerIfLoaded](self, "secureAppSlidingViewControllerIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "_appearState") != 0;
  else
    v4 = 0;

  return v4;
}

- (void)updateBecauseSecureAppChanged
{
  -[SBCoverSheetPresentationManager _clearSecureAppViewControllersIncludingWindow:force:](self, "_clearSecureAppViewControllersIncludingWindow:force:", 0, 1);
  -[SBCoverSheetPresentationManager _prepareSecureAppWindowForDisplay](self, "_prepareSecureAppWindowForDisplay");
}

- (void)updateInterfaceOrientationToMatchOrientation:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  _QWORD v7[6];

  -[SBCoverSheetPresentationManager coverSheetWindow](self, "coverSheetWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "interfaceOrientation");

  if (v6 != a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__SBCoverSheetPresentationManager_updateInterfaceOrientationToMatchOrientation___block_invoke;
    v7[3] = &unk_1E8E9DE88;
    v7[4] = self;
    v7[5] = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  }
}

void __80__SBCoverSheetPresentationManager_updateInterfaceOrientationToMatchOrientation___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "coverSheetWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_legacySetRotatableViewOrientation:duration:", *(_QWORD *)(a1 + 40), 0.0);

  objc_msgSend(*(id *)(a1 + 32), "zStackParticipant");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdatePreferencesWithReason:", CFSTR("updateInterfaceOrientationToMatchOrientation"));

}

- (BOOL)isVisibleAndNotDisappearing
{
  void *v3;
  int v4;
  BOOL result;

  -[SBCoverSheetPresentationManager coverSheetSlidingViewControllerIfLoaded](self, "coverSheetSlidingViewControllerIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_appearState");

  if (v4 == 3)
    return 0;
  result = -[SBUILockStateProvider isUILocked](self->_uiLockStateProvider, "isUILocked");
  if (v4)
    return 1;
  return result;
}

- (BOOL)isTransitioning
{
  void *v2;
  int v3;

  -[SBCoverSheetPresentationManager coverSheetSlidingViewControllerIfLoaded](self, "coverSheetSlidingViewControllerIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_appearState");

  return (v3 & 0xFFFFFFFD) == 1;
}

- (BOOL)isPresented
{
  void *v2;
  int v3;

  -[SBCoverSheetPresentationManager coverSheetSlidingViewControllerIfLoaded](self, "coverSheetSlidingViewControllerIfLoaded");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_appearState");

  return (v3 - 1) < 2;
}

- (BOOL)isDismissGestureActive
{
  return -[SBCoverSheetSlidingViewController isDismissGestureActive](self->_coverSheetSlidingViewController, "isDismissGestureActive")|| -[SBCoverSheetSlidingViewController isDismissGestureActive](self->_secureAppSlidingViewController, "isDismissGestureActive");
}

- (BOOL)isAnyGestureActivelyRecognized
{
  return -[SBCoverSheetSlidingViewController isAnyGestureActivelyRecognized](self->_coverSheetSlidingViewController, "isAnyGestureActivelyRecognized")|| -[SBCoverSheetSlidingViewController isAnyGestureActivelyRecognized](self->_secureAppSlidingViewController, "isAnyGestureActivelyRecognized");
}

- (void)willUIUnlockWithPendingUnlockRequest:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  if (!-[SBCoverSheetPresentationManager _isEffectivelyLocked](self, "_isEffectivelyLocked"))
  {
    -[SBCoverSheetPresentationManager secureAppViewController](self, "secureAppViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hostedAppSceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      -[SBCoverSheetPresentationManager _transitionFromSecureAppToFullAppAndDismiss:preservingBanners:](self, "_transitionFromSecureAppToFullAppAndDismiss:preservingBanners:", v3 ^ 1, v3);
  }
}

- (void)authenticationStateMayHaveChangedFromSource:(int)a3
{
  -[SBCoverSheetPresentationManager _noteEffectiveLockStatusMayHaveChangedForUserNotification:canDismiss:](self, "_noteEffectiveLockStatusMayHaveChangedForUserNotification:canDismiss:", a3 == 10, 1);
}

- (void)loadViewsIfNeeded
{
  id v2;

  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loadViewIfNeeded");

}

- (void)noteDeviceDidLock
{
  -[SBCoverSheetPresentationManager setHasBeenDismissedSinceKeybagLock:](self, "setHasBeenDismissedSinceKeybagLock:", 0);
}

- (id)acquirePreserveSecureAppAssertionForReason:(id)a3
{
  return (id)-[BSCompoundAssertion acquireForReason:](self->_preserveSecureAppAssertions, "acquireForReason:", a3);
}

- (void)addDismissalObserver:(id)a3
{
  id v4;
  NSHashTable *dismissalObservers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  dismissalObservers = self->_dismissalObservers;
  v8 = v4;
  if (!dismissalObservers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dismissalObservers;
    self->_dismissalObservers = v6;

    v4 = v8;
    dismissalObservers = self->_dismissalObservers;
  }
  -[NSHashTable addObject:](dismissalObservers, "addObject:", v4);

}

- (void)removeDismissalObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_dismissalObservers, "removeObject:", a3);
}

- (SBWindow)coverSheetWindow
{
  SBWindow *coverSheetWindow;
  SBCoverSheetWindow *v4;
  void *v5;
  void *v6;
  SBCoverSheetWindow *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  coverSheetWindow = self->_coverSheetWindow;
  if (!coverSheetWindow)
  {
    v4 = [SBCoverSheetWindow alloc];
    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "embeddedDisplayWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBWindow initWithWindowScene:role:debugName:](v4, "initWithWindowScene:role:debugName:", v6, CFSTR("SBTraitsParticipantRoleCoverSheet"), CFSTR("CoverSheet"));

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetWindow setBackgroundColor:](v7, "setBackgroundColor:", v8);

    -[SBCoverSheetWindow setWindowLevel:](v7, "setWindowLevel:", *MEMORY[0x1E0CEBBD0]);
    -[UIWindow _sbWindowScene](v7, "_sbWindowScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusBarManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "layoutManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setOrientationWindow:forStatusBarLayoutLayer:", v7, 1);

    +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _sbWindowScene](v7, "_sbWindowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutStateTransitionCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecureAppTransitionCoordinator:", v14);

    -[SBCoverSheetPresentationManager setCoverSheetWindow:](self, "setCoverSheetWindow:", v7);
    coverSheetWindow = self->_coverSheetWindow;
  }
  return coverSheetWindow;
}

- (void)setCoverSheetWindow:(id)a3
{
  SBWindow *v5;
  void *v6;
  SBWindow *v7;

  v5 = (SBWindow *)a3;
  if (self->_coverSheetWindow != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_coverSheetWindow, a3);
    -[SBCoverSheetPresentationManager _prepareCoverSheetWindowForDisplay](self, "_prepareCoverSheetWindowForDisplay");
    -[SBCoverSheetPresentationManager _updateVisibilityOfWindow:forReasons:](self, "_updateVisibilityOfWindow:forReasons:", self->_coverSheetWindow, self->_coverSheetWindowVisibleReasons);
    -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCoverSheetWindow:", self->_coverSheetWindow);

    v5 = v7;
  }

}

- (void)setLockScreenEnvironment:(id)a3
{
  SBLockScreenEnvironment *v5;
  void *v6;
  id v7;
  SBCoverSheetPrimarySlidingViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SBLockScreenEnvironment *v13;

  v5 = (SBLockScreenEnvironment *)a3;
  if (self->_lockScreenEnvironment != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_lockScreenEnvironment, a3);
    -[SBLockScreenEnvironment rootViewController](self->_lockScreenEnvironment, "rootViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
    v8 = -[SBCoverSheetSlidingViewController initWithContentViewController:canBePulledDown:canBePulledUp:dismissalPreemptingGestureRecognizer:]([SBCoverSheetPrimarySlidingViewController alloc], "initWithContentViewController:canBePulledDown:canBePulledUp:dismissalPreemptingGestureRecognizer:", v7, 1, 1, 0);
    -[SBCoverSheetSlidingViewController setDelegate:](v8, "setDelegate:", self);
    -[SBCoverSheetPrimarySlidingViewController setGrabberDelegate:](v8, "setGrabberDelegate:", self);
    objc_msgSend((id)SBApp, "proximitySensorManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetSlidingViewController setProximitySensorManager:](v8, "setProximitySensorManager:", v9);

    -[SBCoverSheetPresentationManager setCoverSheetSlidingViewController:](self, "setCoverSheetSlidingViewController:", v8);
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerExternalAppearanceProvider:", self);

    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "registerExternalBehaviorProvider:", self);

    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addCoverSheetObserver:", self);

    v5 = v13;
  }

}

- (SBCoverSheetSceneManager)sceneManager
{
  SBCoverSheetSceneManager *sceneManager;
  SBCoverSheetSceneManager *v4;
  void *v5;
  SBCoverSheetSceneManager *v6;
  SBCoverSheetSceneManager *v7;

  sceneManager = self->_sceneManager;
  if (!sceneManager)
  {
    v4 = [SBCoverSheetSceneManager alloc];
    -[SBCoverSheetPresentationManager coverSheetWindow](self, "coverSheetWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SBCoverSheetSceneManager initWithCoverSheetWindow:](v4, "initWithCoverSheetWindow:", v5);
    v7 = self->_sceneManager;
    self->_sceneManager = v6;

    sceneManager = self->_sceneManager;
  }
  return sceneManager;
}

- (void)setTransitionType:(unint64_t)a3
{
  id v4;

  if (self->_transitionType != a3)
  {
    self->_transitionType = a3;
    CSCoverSheetTransitionSettingsForTransitionType(a3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetPresentationManager setTransitionSettings:](self, "setTransitionSettings:", v4);
    -[SBCoverSheetSlidingViewController setTransitionSettings:](self->_coverSheetSlidingViewController, "setTransitionSettings:", v4);

  }
}

- (void)setPearlMatchingStateProvider:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_pearlMatchingStateProvider);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "setDelegate:", 0);
    objc_storeWeak((id *)&self->_pearlMatchingStateProvider, obj);
    objc_msgSend(obj, "setDelegate:", self);
  }

}

- (BOOL)isActiveInterfaceOrientationLocked
{
  return self->_activeInterfaceOrientationChangeAssertion != 0;
}

- (void)setActiveInterfaceOrientationLocked:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  SBDisableActiveInterfaceOrientationChangeAssertion *activeInterfaceOrientationChangeAssertion;
  SBDisableActiveInterfaceOrientationChangeAssertion *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return;
  if (!v3)
  {
    -[SBDisableActiveInterfaceOrientationChangeAssertion invalidate](self->_activeInterfaceOrientationChangeAssertion, "invalidate");
    activeInterfaceOrientationChangeAssertion = self->_activeInterfaceOrientationChangeAssertion;
    self->_activeInterfaceOrientationChangeAssertion = 0;
LABEL_9:

    return;
  }
  v7 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  if (v7 != objc_msgSend((id)SBApp, "activeInterfaceOrientationWithoutConsideringTransientOverlays"))
    objc_msgSend((id)SBApp, "noteInterfaceOrientationChanged:logMessage:", v7, CFSTR("Cover Sheet presentation over transient overlay might cause orientation mismatch"));
  if (!self->_activeInterfaceOrientationChangeAssertion)
  {
    v9 = -[SBDisableActiveInterfaceOrientationChangeAssertion initWithReason:nudgeOrientationOnInvalidate:]([SBDisableActiveInterfaceOrientationChangeAssertion alloc], "initWithReason:nudgeOrientationOnInvalidate:", CFSTR("SBCoverSheetLockActiveInterfaceOrientationReason"), 1);
    activeInterfaceOrientationChangeAssertion = self->_activeInterfaceOrientationChangeAssertion;
    self->_activeInterfaceOrientationChangeAssertion = v9;
    goto LABEL_9;
  }
}

- (void)setHasBeenDismissedSinceKeybagLock:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v3 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (self->_hasBeenDismissedSinceKeybagLockAndAuthenticated != a3)
  {
    if (!a3
      || (objc_msgSend((id)SBApp, "authenticationController"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isAuthenticated"),
          v5,
          v6))
    {
      self->_hasBeenDismissedSinceKeybagLockAndAuthenticated = v3;
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v7 = (void *)-[NSHashTable copy](self->_dismissalObservers, "copy");
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v12, "coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLockAndAuthenticated:", self);
            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v9);
      }

    }
  }
  if (self->_hasBeenDismissedSinceKeybagLock != v3)
  {
    self->_hasBeenDismissedSinceKeybagLock = v3;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = (void *)-[NSHashTable copy](self->_dismissalObservers, "copy", 0);
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v17);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v18, "coverSheetPresentationManagerDidChangeDismissedSinceKeyBagLock:", self);
          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      }
      while (v15);
    }

    -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceChanged](self, "_tellDashBoardOurAppearanceChanged");
    -[UIViewController _setNeedsUpdateOfSupportedInterfaceOrientations](self->_coverSheetSlidingViewController, "_setNeedsUpdateOfSupportedInterfaceOrientations");
  }
}

- (void)setIconAnimatorCompletionGroup:(id)a3
{
  OS_dispatch_group *v5;
  OS_dispatch_group *v6;

  v5 = (OS_dispatch_group *)a3;
  if (self->_iconAnimatorCompletionGroup != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_iconAnimatorCompletionGroup, a3);
    -[SBCoverSheetPresentationManager setIconAnimatorCompletionBlock:](self, "setIconAnimatorCompletionBlock:", 0);
    v5 = v6;
  }

}

- (void)setIconAnimatorCompletionBlock:(id)a3
{
  id v4;
  id iconAnimatorCompletionBlock;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  iconAnimatorCompletionBlock = self->_iconAnimatorCompletionBlock;
  if (iconAnimatorCompletionBlock != v4)
  {
    if (iconAnimatorCompletionBlock)
    {
      SBLogCoverSheet();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = (void *)MEMORY[0x1D17E5550](self->_iconAnimatorCompletionBlock);
        v12 = 134217984;
        v13 = v7;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Cancelling completion block %p for icon animation", (uint8_t *)&v12, 0xCu);

      }
      dispatch_block_cancel(self->_iconAnimatorCompletionBlock);
    }
    v8 = (void *)objc_msgSend(v4, "copy");
    v9 = self->_iconAnimatorCompletionBlock;
    self->_iconAnimatorCompletionBlock = v8;

    if (self->_iconAnimatorCompletionBlock)
    {
      SBLogCoverSheet();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = (void *)MEMORY[0x1D17E5550](self->_iconAnimatorCompletionBlock);
        v12 = 134217984;
        v13 = v11;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Scheduling completion block %p for icon animation", (uint8_t *)&v12, 0xCu);

      }
      dispatch_group_notify((dispatch_group_t)self->_iconAnimatorCompletionGroup, MEMORY[0x1E0C80D38], self->_iconAnimatorCompletionBlock);
    }
  }

}

- (SBWindow)secureAppWindow
{
  void *v3;
  int v4;
  SBSecureAppWindow *v5;
  void *v6;
  void *v7;
  SBSecureAppWindow *v8;
  void *v9;

  if (!self->_secureAppWindow)
  {
    +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "hasSecureApp");

    if (v4)
    {
      v5 = [SBSecureAppWindow alloc];
      objc_msgSend((id)SBApp, "windowSceneManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "embeddedDisplayWindowScene");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[SBWindow initWithWindowScene:role:debugName:](v5, "initWithWindowScene:role:debugName:", v7, CFSTR("SBTraitsParticipantRoleSecureApp"), CFSTR("SecureApp"));

      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSecureAppWindow setBackgroundColor:](v8, "setBackgroundColor:", v9);

      -[SBSecureAppWindow setWindowLevel:](v8, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + -5.0);
      -[SBCoverSheetPresentationManager setSecureAppWindow:](self, "setSecureAppWindow:", v8);

    }
  }
  return self->_secureAppWindow;
}

- (void)setSecureAppWindow:(id)a3
{
  SBWindow *v5;
  SBWindow *v6;

  v5 = (SBWindow *)a3;
  if (self->_secureAppWindow != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_secureAppWindow, a3);
    -[SBCoverSheetPresentationManager _updateVisibilityOfWindow:forReasons:](self, "_updateVisibilityOfWindow:forReasons:", self->_secureAppWindow, self->_secureAppWindowVisibleReasons);
    -[SBCoverSheetPresentationManager _tellDashBoardOurBehaviorChanged](self, "_tellDashBoardOurBehaviorChanged");
    v5 = v6;
  }

}

- (SBCoverSheetSlidingViewController)secureAppSlidingViewController
{
  SBCoverSheetSlidingViewController *secureAppSlidingViewController;

  secureAppSlidingViewController = self->_secureAppSlidingViewController;
  if (!secureAppSlidingViewController)
  {
    -[SBCoverSheetPresentationManager _prepareSecureAppViewController](self, "_prepareSecureAppViewController");
    secureAppSlidingViewController = self->_secureAppSlidingViewController;
  }
  return secureAppSlidingViewController;
}

- (id)secureAppSlidingViewControllerIfLoaded
{
  return self->_secureAppSlidingViewController;
}

- (void)setSecureAppSlidingViewController:(id)a3
{
  SBCoverSheetSlidingViewController *v5;
  SBCoverSheetSlidingViewController *secureAppSlidingViewController;
  SBCoverSheetSlidingViewController *v7;

  v5 = (SBCoverSheetSlidingViewController *)a3;
  secureAppSlidingViewController = self->_secureAppSlidingViewController;
  if (secureAppSlidingViewController != v5)
  {
    v7 = v5;
    -[SBCoverSheetSlidingViewController bs_endAppearanceTransition:](secureAppSlidingViewController, "bs_endAppearanceTransition:", 0);
    -[SBWindow setRootViewController:](self->_secureAppWindow, "setRootViewController:", 0);
    objc_storeStrong((id *)&self->_secureAppSlidingViewController, a3);
    v5 = v7;
  }

}

- (void)_prepareSecureAppViewController
{
  void *v3;
  SBSecureAppViewController *v4;
  void *v5;
  void *v6;
  SBCoverSheetSecureAppEnvironmentViewController *v7;
  uint64_t v8;
  SBCoverSheetSlidingViewController *v9;
  SBCoverSheetSecureAppEnvironmentViewController *secureAppEnvironmentViewController;
  void *v11;
  SBCoverSheetSlidingViewController *v12;
  id v13;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v13, "newHostableEntityForCurrentSecureApp");
  if (v3)
  {
    v4 = (SBSecureAppViewController *)objc_alloc_init(MEMORY[0x1E0D1BBD0]);
    -[SBSecureAppViewController setHostedEntity:](v4, "setHostedEntity:", v3);
    -[SBSecureAppViewController setEntityPresenterDelegate:](v4, "setEntityPresenterDelegate:", self);
    -[SBSecureAppViewController setHostableEntityContentMode:](v4, "setHostableEntityContentMode:", 2);
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSCoverSheetExternalViewControllerBase setCoverSheetViewController:](v4, "setCoverSheetViewController:", v5);
  }
  else
  {
    v5 = (void *)objc_msgSend(v13, "newApplicationSceneEntityForCurrentSecureApp");
    v4 = -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:]([SBSecureAppViewController alloc], "initWithApplicationSceneEntity:", v5);
    -[SBDashBoardHostedAppViewController setDelegate:](v4, "setDelegate:", self);
    -[SBDashBoardHostedAppViewController setPlaceholderContentEnabled:](v4, "setPlaceholderContentEnabled:", 0);
    if (__sb__runningInSpringBoard())
    {
      -[SBDashBoardHostedAppViewController setInterfaceOrientationLocked:](v4, "setInterfaceOrientationLocked:", SBFEffectiveDeviceClass() != 2);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDashBoardHostedAppViewController setInterfaceOrientationLocked:](v4, "setInterfaceOrientationLocked:", objc_msgSend(v6, "userInterfaceIdiom") != 1);

    }
  }

  -[SBCoverSheetPresentationManager setSecureAppViewController:](self, "setSecureAppViewController:", v4);
  v7 = -[SBCoverSheetSecureAppEnvironmentViewController initWithSecureAppViewController:]([SBCoverSheetSecureAppEnvironmentViewController alloc], "initWithSecureAppViewController:", v4);
  -[SBCoverSheetPresentationManager setSecureAppEnvironmentViewController:](self, "setSecureAppEnvironmentViewController:", v7);
  -[SBCoverSheetSecureAppEnvironmentViewController setDelegate:](self->_secureAppEnvironmentViewController, "setDelegate:", self);
  v8 = SBHomeGestureEnabled();
  v9 = [SBCoverSheetSlidingViewController alloc];
  secureAppEnvironmentViewController = self->_secureAppEnvironmentViewController;
  -[SBCoverSheetSlidingViewController dismissGestureRecognizer](self->_coverSheetSlidingViewController, "dismissGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBCoverSheetSlidingViewController initWithContentViewController:canBePulledDown:canBePulledUp:dismissalPreemptingGestureRecognizer:](v9, "initWithContentViewController:canBePulledDown:canBePulledUp:dismissalPreemptingGestureRecognizer:", secureAppEnvironmentViewController, 0, v8, v11);

  -[SBCoverSheetSlidingViewController setDismissalTransformMode:](v12, "setDismissalTransformMode:", 2);
  -[SBCoverSheetSlidingViewController setRoundsCorners:](v12, "setRoundsCorners:", 1);
  -[SBCoverSheetSlidingViewController setDelegate:](v12, "setDelegate:", self);
  -[SBCoverSheetPresentationManager setSecureAppSlidingViewController:](self, "setSecureAppSlidingViewController:", v12);
  self->_pendingClearSecureAppViewControllers = 0;

}

- (void)_updateSecureAppViewControllerVisibilityForAssertionsActive:(BOOL)a3
{
  if (!a3 && self->_pendingClearSecureAppViewControllers)
    -[SBCoverSheetPresentationManager _clearSecureAppViewControllersIncludingWindow:](self, "_clearSecureAppViewControllersIncludingWindow:", 1);
}

- (void)_clearSecureAppViewControllersIncludingWindow:(BOOL)a3
{
  -[SBCoverSheetPresentationManager _clearSecureAppViewControllersIncludingWindow:force:](self, "_clearSecureAppViewControllersIncludingWindow:force:", a3, 0);
}

- (void)_clearSecureAppViewControllersIncludingWindow:(BOOL)a3 force:(BOOL)a4
{
  _BOOL4 v4;
  BOOL v6;
  NSObject *v7;
  void (**v8)(_QWORD);
  uint8_t v9[16];

  v4 = a3;
  if (a4 || (-[BSCompoundAssertion isActive](self->_preserveSecureAppAssertions, "isActive") & 1) == 0)
  {
    SBLogCoverSheet();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Clearing Secure App View Controllers", v9, 2u);
    }

    -[SBCoverSheetSecureAppEnvironmentViewController relinquishHomeGesture](self->_secureAppEnvironmentViewController, "relinquishHomeGesture");
    -[SBCoverSheetSecureAppEnvironmentViewController setDelegate:](self->_secureAppEnvironmentViewController, "setDelegate:", 0);
    -[SBCoverSheetSlidingViewController invalidate](self->_secureAppSlidingViewController, "invalidate");
    -[BSInvalidatable invalidate](self->_secureAppViewController, "invalidate");
    -[SBCoverSheetPresentationManager setSecureAppViewController:](self, "setSecureAppViewController:", 0);
    -[SBCoverSheetPresentationManager setSecureAppEnvironmentViewController:](self, "setSecureAppEnvironmentViewController:", 0);
    -[SBCoverSheetPresentationManager setSecureAppSlidingViewController:](self, "setSecureAppSlidingViewController:", 0);
    if (v4)
      -[SBCoverSheetPresentationManager setSecureAppWindow:](self, "setSecureAppWindow:", 0);
    if (self->_secureAppCleanupHandler)
    {
      v8 = (void (**)(_QWORD))MEMORY[0x1D17E5550]();
      -[SBCoverSheetPresentationManager setSecureAppCleanupHandler:](self, "setSecureAppCleanupHandler:", 0);
      v8[2](v8);

    }
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  self->_pendingClearSecureAppViewControllers = v6;
}

- (void)_performAfterSecureAppCleanup:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  if (self->_secureAppWindow)
  {
    v6 = v4;
    -[SBCoverSheetPresentationManager setSecureAppCleanupHandler:](self, "setSecureAppCleanupHandler:", v4);
LABEL_5:
    v5 = v6;
    goto LABEL_6;
  }
  if (v4)
  {
    v6 = v4;
    (*((void (**)(id))v4 + 2))(v4);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)setSecureAppViewController:(id)a3
{
  BSInvalidatable *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BSInvalidatable *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = (BSInvalidatable *)a3;
  if (self->_secureAppViewController != v5)
  {
    SBLogCoverSheet();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v5;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Secure app view controller changed to %@", (uint8_t *)&v11, 0xCu);
    }

    -[BSInvalidatable applicationSceneHandle](self->_secureAppViewController, "applicationSceneHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

    -[BSInvalidatable bs_endAppearanceTransition:](self->_secureAppViewController, "bs_endAppearanceTransition:", 0);
    -[BSInvalidatable removeFromParentViewController](self->_secureAppViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_secureAppViewController, a3);
    -[BSInvalidatable applicationSceneHandle](self->_secureAppViewController, "applicationSceneHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:", self);

    objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidateBacklightScenesForProvider:", self);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("BCoverSheetSecureAppChangedNotification"), self);

  }
}

- (void)setSecureAppEnvironmentViewController:(id)a3
{
  SBCoverSheetSecureAppEnvironmentViewController *v5;
  void *v6;
  void *v7;
  SBCoverSheetSecureAppEnvironmentViewController *v8;

  v5 = (SBCoverSheetSecureAppEnvironmentViewController *)a3;
  if (self->_secureAppEnvironmentViewController != v5)
  {
    v8 = v5;
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeApplicationHoster:", self->_secureAppEnvironmentViewController);

    -[SBCoverSheetSecureAppEnvironmentViewController bs_endAppearanceTransition:](self->_secureAppEnvironmentViewController, "bs_endAppearanceTransition:", 0);
    -[SBCoverSheetSecureAppEnvironmentViewController removeFromParentViewController](self->_secureAppEnvironmentViewController, "removeFromParentViewController");
    objc_storeStrong((id *)&self->_secureAppEnvironmentViewController, a3);
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addApplicationHoster:", self->_secureAppEnvironmentViewController);

    v5 = v8;
  }

}

- (void)_noteEffectiveLockStatusMayHaveChangedForUserNotification:(BOOL)a3 canDismiss:(BOOL)a4
{
  BOOL v7;
  SBLockScreenUnlockRequest *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  BOOL v12;
  BOOL v13;

  -[SBCoverSheetPresentationManager secureAppViewController](self, "secureAppViewController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isHostingAnApp"))
  {
    v7 = -[SBCoverSheetPresentationManager _isEffectivelyLocked](self, "_isEffectivelyLocked");

    if (!v7)
    {
      v8 = objc_alloc_init(SBLockScreenUnlockRequest);
      -[SBLockScreenUnlockRequest setName:](v8, "setName:", CFSTR("Unlock UI for authenticated while in secure app"));
      -[SBLockScreenUnlockRequest setSource:](v8, "setSource:", 24);
      -[SBLockScreenUnlockRequest setIntent:](v8, "setIntent:", 1);
      -[SBCoverSheetPresentationManager uiLockStateProvider](self, "uiLockStateProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __104__SBCoverSheetPresentationManager__noteEffectiveLockStatusMayHaveChangedForUserNotification_canDismiss___block_invoke;
      v11[3] = &unk_1E8EADF70;
      v11[4] = self;
      v12 = a3;
      v13 = a4;
      objc_msgSend(v9, "coverSheetPresentationManager:unlockWithRequest:completion:", self, v8, v11);

    }
  }
  else
  {

  }
}

void __104__SBCoverSheetPresentationManager__noteEffectiveLockStatusMayHaveChangedForUserNotification_canDismiss___block_invoke(uint64_t a1, int a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "secureAppViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isHostingAnApp");

    if (v4)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        objc_msgSend((id)SBApp, "notificationDispatcher");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bannerDestination");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "isPresentingBannerInLongLook");

      }
      else
      {
        v7 = 0;
      }
      if (*(_BYTE *)(a1 + 41))
        v8 = v7 ^ 1;
      else
        v8 = 0;
      objc_msgSend(*(id *)(a1 + 32), "_transitionFromSecureAppToFullAppAndDismiss:preservingBanners:", v8, v7);
    }
  }
}

- (void)_transitionFromSecureAppToFullAppAndDismiss:(BOOL)a3 preservingBanners:(BOOL)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  SBDeviceApplicationSceneEntity *v9;
  void *v10;
  SBDeviceApplicationSceneEntity *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[4];
  BOOL v22;

  v5 = a3;
  -[SBCoverSheetPresentationManager secureAppViewController](self, "secureAppViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hostedAppSceneHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = [SBDeviceApplicationSceneEntity alloc];
    objc_msgSend(v8, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v9, "initWithApplicationForMainDisplay:", v10);

  }
  else
  {
    v11 = 0;
  }
  +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "createRequestForApplicationActivation:options:", v11, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke;
  v21[3] = &__block_descriptor_33_e70___SBMainWorkspaceTransaction_16__0__SBMainWorkspaceTransitionRequest_8l;
  v22 = a4;
  objc_msgSend(v13, "setTransactionProvider:", v21);
  objc_msgSend(v8, "application");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.purplebuddy"));

  if (v5 && (v17 & 1) == 0)
  {
    v19[0] = v14;
    v19[1] = 3221225472;
    v19[2] = __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_2;
    v19[3] = &unk_1E8E9DEB0;
    v19[4] = self;
    v20 = v8;
    v18 = (id)objc_msgSend(v13, "addCompletionHandler:", v19);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[BSInvalidatable setIntentToTransitionFromSecureAppToFull:](self->_secureAppViewController, "setIntentToTransitionFromSecureAppToFull:", 1);
  objc_msgSend(v12, "executeTransitionRequest:", v13);

}

SBCoverSheetToAppsWorkspaceTransaction *__97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBCoverSheetToAppsWorkspaceTransaction *v4;

  v3 = a2;
  v4 = -[SBCoverSheetToAppsWorkspaceTransaction initWithTransitionRequest:]([SBCoverSheetToAppsWorkspaceTransaction alloc], "initWithTransitionRequest:", v3);

  -[SBCoverSheetToAppsWorkspaceTransaction setPreservesBanners:](v4, "setPreservesBanners:", *(unsigned __int8 *)(a1 + 32));
  return v4;
}

void __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_3;
    v3[3] = &unk_1E8E9DED8;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "_performAfterSecureAppCleanup:", v3);

  }
}

void __97__SBCoverSheetPresentationManager__transitionFromSecureAppToFullAppAndDismiss_preservingBanners___block_invoke_3(uint64_t a1)
{
  SBDeviceApplicationSceneEntity *v2;
  void *v3;
  void *v4;
  void *v5;
  SBDeviceApplicationSceneEntity *v6;

  v2 = [SBDeviceApplicationSceneEntity alloc];
  objc_msgSend(*(id *)(a1 + 32), "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v2, "initWithApplicationForMainDisplay:", v3);

  -[SBApplicationSceneEntity sceneHandle](v6, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    SBWorkspaceSuspendApplicationScene(v4);

}

- (NSSet)components
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = -[SBCoverSheetSlidingViewController dismissalSlidingMode](self->_coverSheetSlidingViewController, "dismissalSlidingMode");
  objc_msgSend(MEMORY[0x1E0D1BB88], "homeAffordance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "priority:", 20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager appearanceIdentifier](self, "appearanceIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == 2
    || -[SBCoverSheetSlidingViewController isTransitioning](self->_coverSheetSlidingViewController, "isTransitioning"))
  {
    if (self->_shouldDisplayFakeStatusBar)
    {
      v9 = (void *)objc_opt_new();
      objc_msgSend(v9, "priority:", 20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "fakeStatusBar:", 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionModifiers:", 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v12);

    }
    objc_msgSend(v8, "setValue:", MEMORY[0x1E0C9AAB0]);
  }
  if (-[SBCoverSheetPresentationManager hasBeenDismissedSinceKeybagLock](self, "hasBeenDismissedSinceKeybagLock"))
    objc_msgSend(v8, "setValue:", MEMORY[0x1E0C9AAB0]);
  objc_msgSend(v3, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0D1BB88], "homeAffordance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager appearanceIdentifier](self, "appearanceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "systemGesturesDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "syntheticAppearState");

  v19 = -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") ^ 1;
  if (v18 == 1)
    v20 = 1;
  else
    v20 = v19;
  objc_msgSend(v15, "setHidden:", v20);
  if ((_DWORD)v20 == 1)
    objc_msgSend(v15, "setPriority:", 20);
  objc_msgSend(v3, "addObject:", v15);
  if (-[SBCoverSheetPresentationManager hasBeenDismissedSinceKeybagLock](self, "hasBeenDismissedSinceKeybagLock"))
  {
    objc_msgSend(MEMORY[0x1E0D1BB88], "footerCallToActionLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "hidden:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v22);

  }
  objc_msgSend(MEMORY[0x1E0D1BB88], "statusBarGradient");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager appearanceIdentifier](self, "appearanceIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "identifier:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_wallpaperViewForVariant:", 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v27, "hasVideo") & 1) != 0)
  {
    objc_msgSend(v27, "wallpaperName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "length");

    objc_msgSend(v25, "setHidden:", v29 != 0);
    if (v29)
      objc_msgSend(v3, "addObject:", v25);
  }
  else
  {
    objc_msgSend(v25, "setHidden:", 0);
  }
  if (-[SBCoverSheetPresentationManager wallpaperFloatingLayerHidden](self, "wallpaperFloatingLayerHidden"))
  {
    v30 = (void *)objc_opt_new();
    objc_msgSend(v30, "identifier:", CFSTR("SBCoverSheetPresentationManager"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "priority:", 20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "shouldRenderInline:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v33);
  }

  return (NSSet *)v3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return 0;
}

- (int64_t)idleWarnMode
{
  return 0;
}

- (int64_t)idleTimerMode
{
  return 0;
}

- (int64_t)idleTimerDuration
{
  void *v2;
  int64_t v3;

  if (!-[SBCoverSheetPresentationManager hasBeenDismissedSinceKeybagLock](self, "hasBeenDismissedSinceKeybagLock"))
    return 0;
  objc_msgSend((id)SBApp, "authenticationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isAuthenticatedCached"))
    v3 = 12;
  else
    v3 = 1;

  return v3;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  unint64_t v3;
  void *v4;
  int v5;

  v3 = 8 * (self->_secureAppWindow != 0);
  if ((-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture") & 1) == 0)
  {
    -[SBCoverSheetSecureAppEnvironmentViewController zStackParticipant](self->_secureAppEnvironmentViewController, "zStackParticipant");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "ownsHomeGesture");

    if (!v5)
      v3 |= 0x1000uLL;
  }
  if (-[SBCoverSheetSlidingViewController _appearState](self->_coverSheetSlidingViewController, "_appearState") == 2)return v3;
  else
    return v3 | 0x40;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (void)coverSheetViewControllerExternalLockProviderStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __94__SBCoverSheetPresentationManager_coverSheetViewControllerExternalLockProviderStateDidChange___block_invoke;
  v6[3] = &unk_1E8E9DED8;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0D229B0], "eventWithName:handler:", CFSTR("external lock provider state did change"), v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeOrAppendEvent:", v5);

}

uint64_t __94__SBCoverSheetPresentationManager_coverSheetViewControllerExternalLockProviderStateDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_noteEffectiveLockStatusMayHaveChangedForUserNotification:canDismiss:", 0, 0);
}

- (void)coverSheetViewControllerDidAddNewSceneHostEnvironment:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "backlightEnvironmentSessionProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateBacklightSceneHostEnvironmentsForProvider:", v4);

}

- (void)coverSheetViewControllerActivityItemsMayHaveChanged:(id)a3
{
  id v3;

  -[SBCoverSheetPresentationManager zStackParticipant](self, "zStackParticipant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdatePreferencesWithReason:", CFSTR("coversheet activity items may have changed"));

}

- (void)coverSheetViewControllerDidUpdateAudioCategoriesDisablingVolumeHUD:(id)a3
{
  id v3;

  -[SBCoverSheetPresentationManager zStackParticipant](self, "zStackParticipant", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdatePreferencesWithReason:", CFSTR("coversheet updated audio categories disabling the Volume HUD"));

}

- (void)coverSheetViewControllerDidObscureWallpaper:(id)a3 obscured:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWallpaperObscured:", v4);

}

- (void)coverSheetViewController:(id)a3 didChangeActiveBehavior:(id)a4
{
  id v4;

  -[SBCoverSheetPresentationManager zStackParticipant](self, "zStackParticipant", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsUpdatePreferencesWithReason:", CFSTR("coversheet active behavior did change"));

}

- (void)_updateTopButtonsForCoverSheetViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(v3, "_screen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getLeadingTopButtonFrame:trailingTopButtonFrame:forScreen:", &v8, &v6, v5);

  objc_msgSend(v3, "updateLeadingTopButtonFrame:trailingTopButtonFrame:", v8, v9, v6, v7);
}

+ (void)getLeadingTopButtonFrame:(CGRect *)a3 trailingTopButtonFrame:(CGRect *)a4 forScreen:(id)a5
{
  void *v7;
  void *v8;
  double Width;
  double v10;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a5;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getLeadingTopButtonFrame:trailingTopButtonFrame:", a3, a4);

    v8 = v16;
  }
  else
  {
    objc_msgSend(v16, "bounds");
    Width = CGRectGetWidth(v17);
    v18.size.width = 60.0;
    v18.origin.x = 0.0;
    v18.origin.y = 8.0;
    v18.size.height = 24.0;
    v10 = CGRectGetWidth(v18);
    if (a3)
    {
      __asm { FMOV            V2.2D, #8.0 }
      a3->origin = _Q2;
      a3->size = (CGSize)xmmword_1D0E89950;
    }
    v8 = v16;
    if (a4)
    {
      a4->origin.x = Width - v10 + -8.0;
      *(_OWORD *)&a4->origin.y = xmmword_1D0E89960;
      a4->size.height = 24.0;
    }
  }

}

- (void)pearlMatchingStateProviderStateChangedForMatchFailure:(id)a3
{
  void *v4;
  char v5;
  id v6;

  if (objc_msgSend(a3, "seenMatchResultSinceScreenOn"))
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isAuthenticated");

    if ((v5 & 1) == 0)
    {
      if (-[SBCoverSheetSlidingViewController isAnyGestureActivelyRecognized](self->_coverSheetSlidingViewController, "isAnyGestureActivelyRecognized"))
      {
        -[SBCoverSheetSlidingViewController activeGestureRecognizer](self->_coverSheetSlidingViewController, "activeGestureRecognizer");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setEnabled:", 0);
        objc_msgSend(v6, "setEnabled:", 1);

      }
    }
  }
}

- (void)coverSheetSlidingViewController:(id)a3 prepareForPresentationTransitionForUserGesture:(BOOL)a4
{
  _BOOL8 v4;
  SBCoverSheetSlidingViewController *v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];
  uint8_t buf[16];

  v4 = a4;
  v6 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v6)
  {
    SBLogCoverSheet();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "cover sheet sliding view controller prepare for presentation transition", buf, 2u);
    }

    -[SBCoverSheetPresentationManager _prepareForPresentationTransitionForUserGesture:](self, "_prepareForPresentationTransitionForUserGesture:", v4);
  }
  if (self->_secureAppSlidingViewController == v6)
  {
    SBLogCoverSheet();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "secure app view controller prepare for presentation transition", v9, 2u);
    }

  }
}

- (void)coverSheetSlidingViewControllerCleanupPresentationTransition:(id)a3
{
  SBCoverSheetSlidingViewController *v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v4)
    -[SBCoverSheetPresentationManager _cleanupPresentationTransition](self, "_cleanupPresentationTransition");
  if (self->_secureAppSlidingViewController == v4)
  {
    SBLogCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "secure app view controller clean up presentation transition", v6, 2u);
    }

  }
}

- (void)coverSheetSlidingViewControllerPrepareForRubberBandedPresentationTransition:(id)a3
{
  id v4;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBCoverSheetPresentationManager _prepareForRubberBandPresentationTransitionForSlidingViewController:](self, "_prepareForRubberBandPresentationTransitionForSlidingViewController:", v4);

}

- (void)coverSheetSlidingViewControllerCleanupRubberBandedPresentationTransition:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  BSDispatchQueueAssertMain();
  -[SBCoverSheetPresentationManager _cleanupRubberBandPresentationTransitionForSlidingViewController:](self, "_cleanupRubberBandPresentationTransitionForSlidingViewController:", v4);

  if (self->_rubberBandCleanupNeeded)
  {
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cleanupRubberBandTransition");

  }
}

- (void)coverSheetSlidingViewController:(id)a3 prepareForDismissalTransitionForReversingTransition:(BOOL)a4 forUserGesture:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  SBCoverSheetSlidingViewController *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  int v19;
  void *v20;
  char v21;
  _BOOL4 v22;
  void *v23;
  uint8_t v24[16];

  v5 = a5;
  v6 = a4;
  v8 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_secureAppSlidingViewController == v8)
  {
    SBLogCoverSheet();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v24 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "secure app view controller prepare for dismissal transition", v24, 2u);
    }

  }
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "authenticationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isAuthenticated");

  -[SBCoverSheetPresentationManager pearlMatchingStateProvider](self, "pearlMatchingStateProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (self->_coverSheetSlidingViewController == v8)
    v15 = objc_msgSend(v13, "pearlMatchEnabledAndPossible") ^ 1;
  else
    v15 = 1;
  v16 = objc_msgSend(v10, "externalLockProvidersRequireUnlock");
  v17 = -[SBCoverSheetSlidingViewController dismissalSlidingMode](v8, "dismissalSlidingMode");
  if (v12)
    v18 = v16 == 0;
  else
    v18 = 0;
  if (v18)
    v19 = 0;
  else
    v19 = v17 == 2 || !v6;
  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v20, "hasSecureApp") & 1) != 0)
    v21 = 0;
  else
    v21 = !-[SBCoverSheetPresentationManager isInSecureApp](self, "isInSecureApp");

  v22 = 0;
  if (self->_coverSheetSlidingViewController == v8 && (v21 & 1) == 0)
    v22 = -[SBCoverSheetPresentationManager _isEffectivelyLocked](self, "_isEffectivelyLocked");
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:", CFSTR("SBBiometricEventTimestampNotificationCoversheetSwipedForDismissal"), self);

  }
  if (v22)
  {
    -[SBCoverSheetPresentationManager _prepareForTransitionToSecureApp](self, "_prepareForTransitionToSecureApp");
  }
  else if (v19)
  {
    if (((v15 | v16) & 1) != 0)
      -[SBCoverSheetPresentationManager _prepareForRubberBandDismissalTransitionForSlidingViewController:](self, "_prepareForRubberBandDismissalTransitionForSlidingViewController:", v8);
    else
      -[SBCoverSheetPresentationManager _prepareInterstitialTransitionForSlidingViewController:](self, "_prepareInterstitialTransitionForSlidingViewController:", v8);
  }
  else
  {
    -[SBCoverSheetPresentationManager _prepareForDismissalTransition](self, "_prepareForDismissalTransition");
  }

}

- (void)coverSheetSlidingViewControllerUserPresentGestureBegan:(id)a3
{
  SBCoverSheetSlidingViewController *v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v4)
  {
    -[SBCoverSheetPresentationManager setHasBeenDismissedSinceKeybagLock:](self, "setHasBeenDismissedSinceKeybagLock:", 1);
    -[SBCoverSheetPresentationManager setHasBeenDismissedSinceBoot:](self, "setHasBeenDismissedSinceBoot:", 1);
  }
  if (self->_secureAppSlidingViewController == v4)
  {
    SBLogCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "secure app view controller user present gesture began", v7, 2u);
    }

  }
  +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissAnimated:", 0);

}

- (void)coverSheetSlidingViewController:(id)a3 committingToEndPresented:(BOOL)a4
{
  SBCoverSheetSlidingViewController *v6;
  SBCoverSheetSlidingViewController *coverSheetSlidingViewController;

  v6 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  coverSheetSlidingViewController = self->_coverSheetSlidingViewController;

  if (coverSheetSlidingViewController == v6)
  {
    if (a4)
    {
      -[SBCoverSheetPresentationManager setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 1);
    }
    else
    {
      -[SBCoverSheetPresentationManager setHasBeenDismissedSinceKeybagLock:](self, "setHasBeenDismissedSinceKeybagLock:", 1);
      -[SBCoverSheetPresentationManager setHasBeenDismissedSinceBoot:](self, "setHasBeenDismissedSinceBoot:", 1);
      -[SBCoverSheetPresentationManager setWantsHomeGestureOwnership:](self, "setWantsHomeGestureOwnership:", 0);
      -[SBCoverSheetPresentationManager _invalidateSystemApertureCoverSheetAssertion](self, "_invalidateSystemApertureCoverSheetAssertion");
    }
  }
}

- (void)coverSheetSlidingViewControllerCleanupDismissalTransition:(id)a3
{
  SBCoverSheetSlidingViewController *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  uint8_t v15[16];
  uint8_t v16[16];
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  if (self->_coverSheetSlidingViewController == v4)
  {
    SBLogCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "cover sheet sliding view controller cleanup dismissal transition", buf, 2u);
    }

  }
  if (self->_secureAppSlidingViewController == v4)
  {
    SBLogCoverSheet();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "secure app view controller cleanup dismissal transition", v18, 2u);
    }

  }
  v7 = -[SBCoverSheetPresentationManager _isEffectivelyLocked](self, "_isEffectivelyLocked");
  if (self->_coverSheetSlidingViewController == v4
    && (+[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "hasSecureApp") & v7,
        v8,
        v9 == 1))
  {
    SBLogCoverSheet();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "*** not cleaning up cover sheet dismissal transition because going to secure app ***", v17, 2u);
    }

    -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDismissGesturesEnabled:", 0);

    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setCoverSheetIsVisible:", 0);

    -[SBCoverSheetPresentationManager _cleanupATransition](self, "_cleanupATransition");
  }
  else
  {
    SBLogCoverSheet();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (v7)
    {
      if (v14)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "*** not cleaning up cover sheet dismissal transition because requires unlock ***", v16, 2u);
      }

      -[SBCoverSheetPresentationManager _setCoverSheetPresented:forcePresented:animated:withCompletion:](self, "_setCoverSheetPresented:forcePresented:animated:withCompletion:", 1, 1, 1, 0);
    }
    else
    {
      if (v14)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "cleaning up cover sheet dismissal transition", v15, 2u);
      }

      -[SBCoverSheetPresentationManager _cleanupDismissalTransition](self, "_cleanupDismissalTransition");
    }
  }

}

- (void)coverSheetSlidingViewControllerDidEndTransition:(id)a3
{
  BSDispatchQueueAssertMain();
  -[SBCoverSheetPresentationManager setTransitionType:](self, "setTransitionType:", 0);
}

- (void)coverSheetSlidingViewControllerDidPassRubberBandThreshold:(id)a3
{
  BSDispatchQueueAssertMain();
  -[SBCoverSheetPresentationManager _notifyDelegateRequestsUnlock](self, "_notifyDelegateRequestsUnlock");
  -[UIImpactFeedbackGenerator impactOccurred](self->_rubberBandFeedbackGenerator, "impactOccurred");
  self->_rubberBandCleanupNeeded = 0;
}

- (BOOL)hasContentUnderCoverSheetSlidingViewController:(id)a3
{
  SBCoverSheetSlidingViewController *v4;
  SBCoverSheetSlidingViewController *coverSheetSlidingViewController;
  void *v7;
  char v8;

  v4 = (SBCoverSheetSlidingViewController *)a3;
  BSDispatchQueueAssertMain();
  coverSheetSlidingViewController = self->_coverSheetSlidingViewController;

  if (coverSheetSlidingViewController != v4)
    return 0;
  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSecureApp");

  return v8;
}

- (void)coverSheetSlidingViewController:(id)a3 animationTickedWithProgress:(double)a4 velocity:(double)a5 coverSheetFrame:(CGRect)a6 gestureActive:(BOOL)a7 forPresentationValue:(BOOL)a8
{
  SBCoverSheetSlidingViewController *v10;
  SBCoverSheetSlidingViewController *coverSheetSlidingViewController;
  SBAtomicObjectQueue *unlockProgressQueue;
  void *v13;

  if (a8)
  {
    v10 = (SBCoverSheetSlidingViewController *)a3;
    kdebug_trace();
    kdebug_trace();
    coverSheetSlidingViewController = self->_coverSheetSlidingViewController;

    if (coverSheetSlidingViewController == v10)
    {
      unlockProgressQueue = self->_unlockProgressQueue;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBAtomicObjectQueue enqueue:](unlockProgressQueue, "enqueue:", v13);

      BSDispatchMain();
    }
  }
}

void __155__SBCoverSheetPresentationManager_coverSheetSlidingViewController_animationTickedWithProgress_velocity_coverSheetFrame_gestureActive_forPresentationValue___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "dequeue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_CGFloatValue");
  v4 = v3;

  if (v4 > 0.9)
  {
    v5 = *(double *)(a1 + 40);
    if (v4 <= 0.8)
    {
      if (v5 <= 0.0)
        goto LABEL_11;
    }
    else if (v5 <= 0.0)
    {
      if (v5 >= 0.0)
        goto LABEL_11;
LABEL_8:
      objc_msgSend(*(id *)(a1 + 32), "_acquireSystemApertureCoverSheetAssertion");
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "_invalidateSystemApertureCoverSheetAssertion");
    goto LABEL_11;
  }
  if (v4 > 0.8 && *(double *)(a1 + 40) < 0.0)
    goto LABEL_8;
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "_updateShouldDisplayFakeStatusBarInVisibleTransition:", v4 < 0.9);
  objc_msgSend(*(id *)(a1 + 32), "transitionSettings");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (objc_msgSend(v9, "usesFixedWallpaperPresentationProgress"))
  {
    objc_msgSend(v9, "fixedWallpaperPresentationProgress");
    v6 = v7;
  }
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateWallpaperAnimationWithProgress:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setWallpaperFloatingLayerHidden:", v4 > 0.2);
}

- (void)_updateShouldDisplayFakeStatusBarInVisibleTransition:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  void (*v6)(uint64_t);
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v4 = a3 || self->_secureAppViewController || self->_needsFakeStatusBarUpdate || self->_preparingToDismissCoverSheet;
  if (self->_shouldDisplayFakeStatusBar != v4)
  {
    self->_needsFakeStatusBarUpdate = 0;
    self->_shouldDisplayFakeStatusBar = v4;
    v5 = (void *)MEMORY[0x1E0CEABB0];
    if (v4)
    {
      v9 = MEMORY[0x1E0C809B0];
      v6 = __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke;
      v7 = &v9;
    }
    else
    {
      v8 = MEMORY[0x1E0C809B0];
      v6 = __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke_2;
      v7 = &v8;
    }
    v7[1] = 3221225472;
    v7[2] = (uint64_t)v6;
    v7[3] = (uint64_t)&unk_1E8E9DED8;
    v7[4] = (uint64_t)self;
    objc_msgSend(v5, "performWithoutAnimation:", v8);
    -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceAndBehaviorChanged](self, "_tellDashBoardOurAppearanceAndBehaviorChanged");
  }
}

void __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "statusBarTransitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStatusBarForLockScreenComeback");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_sbWindowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addActiveLayoutLayer:", 1);

}

void __88__SBCoverSheetPresentationManager__updateShouldDisplayFakeStatusBarInVisibleTransition___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "statusBarTransitionController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateStatusBarForLockScreenTeardown");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "_sbWindowScene");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statusBarManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeActiveLayoutLayer:", 1);

}

- (void)coverSheetSlidingViewController:(id)a3 animateForGestureActive:(BOOL)a4 withProgress:(double)a5 beginBlock:(id)a6 endBlock:(id)a7
{
  _BOOL8 v9;
  void (**v11)(_QWORD);
  id v12;
  NSObject *v13;
  _BOOL4 v15;
  _QWORD v16[4];
  id v17;

  v9 = a4;
  v11 = (void (**)(_QWORD))a6;
  v12 = a7;
  SBLogCoverSheet();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[SBCoverSheetPresentationManager coverSheetSlidingViewController:animateForGestureActive:withProgress:beginBlock:endBlock:].cold.1(v13, a5);

  if (self->_iconAnimator && self->_iconAnimatorCompletionGroup)
  {
    v15 = a5 > 0.2 && self->_iconAnimatorNeedsAnimating;
    if (v9)
      v15 = a5 > 0.560000002;
    if (v15)
    {
      if (v11)
        v11[2](v11);
      self->_iconAnimatorNeedsAnimating = 0;
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __124__SBCoverSheetPresentationManager_coverSheetSlidingViewController_animateForGestureActive_withProgress_beginBlock_endBlock___block_invoke;
      v16[3] = &unk_1E8E9E8D0;
      v17 = v12;
      -[SBCoverSheetPresentationManager _setTransitionProgress:animated:gestureActive:coverSheetProgress:completion:](self, "_setTransitionProgress:animated:gestureActive:coverSheetProgress:completion:", 1, v9, v16, 1.0, a5);

    }
  }

}

uint64_t __124__SBCoverSheetPresentationManager_coverSheetSlidingViewController_animateForGestureActive_withProgress_beginBlock_endBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)coverSheetSlidingViewControllerContentShouldAutoRotateWhenNotVisible:(id)a3
{
  BOOL v4;

  v4 = -[SBCoverSheetPresentationManager hasBeenDismissedSinceBoot](self, "hasBeenDismissedSinceBoot", a3);
  return !v4 | -[SBCoverSheetPresentationManager isPresented](self, "isPresented");
}

- (BOOL)coverSheetSlidingViewControllerShouldAllowDismissal:(id)a3
{
  if (self->_coverSheetSlidingViewController == a3
    && -[SBCoverSheetPresentationManager _isEffectivelyLocked](self, "_isEffectivelyLocked"))
  {
    return -[BSInvalidatable isHostingAnApp](self->_secureAppViewController, "isHostingAnApp");
  }
  else
  {
    return 1;
  }
}

- (void)coverSheetSlidingViewController:(id)a3 isTransitioning:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPartiallyOnScreen:", v4);

}

- (void)coverSheetSlidingViewControllerReachabilityAnimationWillBegin:(id)a3
{
  id v3;

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleReachabilityAnimationWillBegin");

}

- (void)coverSheetSlidingViewControllerReachabilityAnimationDidEnd:(id)a3
{
  id v3;

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleReachabilityAnimationDidEnd");

}

- (void)_updateWallpaperOverlay
{
  void *v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (self->_wallpaperFloatingLayerHidden
    || !-[SBCoverSheetSlidingViewController isTransitioning](self->_coverSheetSlidingViewController, "isTransitioning"))
  {
    -[SBCoverSheetPresentationManager _removeWallpaperOverlay](self, "_removeWallpaperOverlay");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (_os_feature_enabled_impl() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_referenceBounds");
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v13 = v12;
    }
    else
    {
      -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bounds");
      v7 = v15;
      v9 = v16;
      v11 = v17;
      v13 = v18;

    }
    -[SBCoverSheetPresentationManager _createWallpaperOverlayIfNeededWithCoverSheetFrame:](self, "_createWallpaperOverlayIfNeededWithCoverSheetFrame:", v7, v9, v11, v13);
  }
}

- (void)_createWallpaperOverlayIfNeededWithCoverSheetFrame:(CGRect)a3
{
  double height;
  double width;
  void *v6;
  int v7;
  void *v8;
  objc_class *v9;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *wallpaperFloatingLayerView;
  UIView *v13;
  UIView *wallpaperFloatingLayerViewContainerView;
  id v15;

  if (!self->_wallpaperFloatingLayerView)
  {
    height = a3.size.height;
    width = a3.size.width;
    -[SBCoverSheetPresentationManager transitionSettings](self, "transitionSettings", a3.origin.x, a3.origin.y);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "floatingLayerAsWallpaperOverlay");

    if (v7)
    {
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createWallpaperFloatingViewForReason:ignoreReplica:", v10, 1);
      v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      wallpaperFloatingLayerView = self->_wallpaperFloatingLayerView;
      self->_wallpaperFloatingLayerView = v11;

      v13 = (UIView *)objc_alloc_init(MEMORY[0x1E0CEABB0]);
      wallpaperFloatingLayerViewContainerView = self->_wallpaperFloatingLayerViewContainerView;
      self->_wallpaperFloatingLayerViewContainerView = v13;

      -[UIView setClipsToBounds:](self->_wallpaperFloatingLayerViewContainerView, "setClipsToBounds:", 1);
      -[UIView addSubview:](self->_wallpaperFloatingLayerViewContainerView, "addSubview:", self->_wallpaperFloatingLayerView);
      -[UIView setFrame:](self->_wallpaperFloatingLayerViewContainerView, "setFrame:", 0.0, 0.0, width, height);
      -[BSInvalidatable setFrame:](self->_wallpaperFloatingLayerView, "setFrame:", 0.0, 0.0, width, height);
      +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addWallpaperOverlay:", self->_wallpaperFloatingLayerViewContainerView);

    }
  }
}

- (void)_removeWallpaperOverlay
{
  void *v3;
  BSInvalidatable *wallpaperFloatingLayerView;
  UIView *wallpaperFloatingLayerViewContainerView;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeWallpaperOverlay:", self->_wallpaperFloatingLayerViewContainerView);

  -[BSInvalidatable invalidate](self->_wallpaperFloatingLayerView, "invalidate");
  wallpaperFloatingLayerView = self->_wallpaperFloatingLayerView;
  self->_wallpaperFloatingLayerView = 0;

  wallpaperFloatingLayerViewContainerView = self->_wallpaperFloatingLayerViewContainerView;
  self->_wallpaperFloatingLayerViewContainerView = 0;

}

- (BOOL)hasFirstSwipeShowGrabberOverride
{
  void *v2;
  void *v3;
  char v4;

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayPresentationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasActivePresentation");

  return v4;
}

- (unint64_t)screenEdgesDeferringSystemGestures
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[UIWindow _sbWindowScene](self->_coverSheetWindow, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "layoutStatePrimaryElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workspaceEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationSceneEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "screenEdgesDeferringSystemGestures");

  return v8;
}

- (void)updateVisibilityForGrabberVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;

  v3 = a3;
  if (a3)
  {
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
    {
      v6 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
      objc_msgSend(v5, "setEffectiveInterfaceOrientationOverride:", v6);
      -[SBCoverSheetPresentationManager updateInterfaceOrientationToMatchOrientation:](self, "updateInterfaceOrientationToMatchOrientation:", v6);
    }

  }
  -[SBCoverSheetPresentationManager _setCoverSheetWindowVisible:forReason:](self, "_setCoverSheetWindowVisible:forReason:", v3, CFSTR("SBCoverSheetPresentTongueGrabberVisibleReason"));
}

- (BOOL)secureAppEnvironmentViewControllerShouldEnableIdleWarning:(id)a3 alwaysOnEnabled:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  char v12;
  char v13;

  if (!a4)
    return 1;
  objc_msgSend(a3, "hostedAppSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "application");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secureAppAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wakeDestination");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10 || (objc_msgSend(v8, "isInProcessAction") & 1) != 0 || objc_msgSend(v9, "type") != 1)
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", v6);

    v13 = v12 ^ 1;
  }

  return v13;
}

- (void)secureAppOfTypeDidBegin:(unint64_t)a3
{
  NSObject *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  int v13;
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SecureApp began of type: %lu", (uint8_t *)&v13, 0xCu);
  }

  v6 = -[SBUILockStateProvider isUILocked](self->_uiLockStateProvider, "isUILocked");
  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasSecureApp");

  if (v6 && v8)
  {
    if (+[SBBacklightPlatformProvider deviceSupportsAlwaysOn](SBBacklightPlatformProvider, "deviceSupportsAlwaysOn"))
    {
      objc_msgSend((id)SBApp, "authenticationController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasPasscodeSet");

    }
    else
    {
      v10 = 1;
    }
    +[SBBacklightController sharedInstanceIfExists](SBBacklightController, "sharedInstanceIfExists");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "backlightState");

    if ((v10 & 1) != 0 || v12 != 3)
      -[SBCoverSheetPresentationManager setCoverSheetPresented:animated:withCompletion:](self, "setCoverSheetPresented:animated:withCompletion:", 0, 1, 0);
  }
}

- (void)secureAppOfTypeDidEnd:(unint64_t)a3
{
  NSObject *v5;
  BOOL v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "SecureApp ended of type: %lu", (uint8_t *)&v10, 0xCu);
  }

  v6 = -[SBCoverSheetPresentationManager _secureAppTypeGetsCorrectDismissalSemantics:](self, "_secureAppTypeGetsCorrectDismissalSemantics:", a3);
  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secureAppAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "secureAppType");

  if (!v6 && -[SBUILockStateProvider isUILocked](self->_uiLockStateProvider, "isUILocked") && !v9)
    -[SBCoverSheetPresentationManager setCoverSheetPresented:animated:withCompletion:](self, "setCoverSheetPresented:animated:withCompletion:", 1, 1, 0);
}

- (void)assistantDidDisappear:(id)a3 windowScene:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secureAppAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "secureAppType");

  if (-[SBUILockStateProvider isUILocked](self->_uiLockStateProvider, "isUILocked"))
    v8 = v7 == 9;
  else
    v8 = 0;
  if (v8)
    -[SBCoverSheetPresentationManager setCoverSheetPresented:animated:withCompletion:](self, "setCoverSheetPresented:animated:withCompletion:", 0, 1, 0);
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v6;
  CSLockScreenSettings *lockScreenSettings;
  CSLockScreenSettings *v8;
  void *v9;
  CSLockScreenSettings *v10;
  UIImpactFeedbackGenerator *v11;
  UIImpactFeedbackGenerator *rubberBandFeedbackGenerator;
  CSLockScreenSettings *v13;

  v13 = (CSLockScreenSettings *)a3;
  v6 = a4;
  lockScreenSettings = self->_lockScreenSettings;
  if (lockScreenSettings == v13)
  {
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("unlockRubberBandFeedbackIntensity")) & 1) != 0
      || objc_msgSend(v6, "isEqualToString:", CFSTR("unlockRubberBandFeedbackInterval")))
    {
      v11 = -[SBCoverSheetPresentationManager _newRubberBandFeedbackGeneratorForSettings:](self, "_newRubberBandFeedbackGeneratorForSettings:", self->_lockScreenSettings);
      rubberBandFeedbackGenerator = self->_rubberBandFeedbackGenerator;
      self->_rubberBandFeedbackGenerator = v11;

    }
  }
  else
  {
    -[CSLockScreenSettings dashBoardScrollModifierSettings](lockScreenSettings, "dashBoardScrollModifierSettings");
    v8 = (CSLockScreenSettings *)objc_claimAutoreleasedReturnValue();

    if (v8 == v13)
    {
      if (objc_msgSend(v6, "isEqualToString:", CFSTR("strategy")))
        -[SBCoverSheetPresentationManager _tellDashBoardOurBehaviorChanged](self, "_tellDashBoardOurBehaviorChanged");
    }
    else
    {
      -[CSLockScreenSettings coverSheetTransitionsSettings](self->_lockScreenSettings, "coverSheetTransitionsSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "flyInSettings");
      v10 = (CSLockScreenSettings *)objc_claimAutoreleasedReturnValue();

      if (v10 == v13)
        -[SBCoverSheetPresentationManager _updateIconsFlyInWithSettings:](self, "_updateIconsFlyInWithSettings:", v13);
    }
  }

}

- (void)_updateIconsFlyInWithSettings:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v4 = a3;
  self->_centerFollowsFinger = objc_msgSend(v4, "centerFollowsFinger");
  self->_animateIconsOnPresentationToo = objc_msgSend(v4, "animateIconsOnPresentationToo");
  objc_msgSend(v4, "iconsFlyInInteractiveResponseMin");
  self->_iconFlyInInteractiveResponseMin = v5;
  objc_msgSend(v4, "iconsFlyInInteractiveResponseMax");
  self->_iconFlyInInteractiveResponseMax = v6;
  objc_msgSend(v4, "iconsFlyInInteractiveDampingRatioMin");
  self->_iconFlyInInteractiveDampingRatioMin = v7;
  objc_msgSend(v4, "iconsFlyInInteractiveDampingRatioMax");
  self->_iconFlyInInteractiveDampingRatioMax = v8;
  objc_msgSend(v4, "iconsFlyInTension");
  self->_iconFlyInTension = v9;
  objc_msgSend(v4, "iconsFlyInFriction");
  v11 = v10;

  self->_iconFlyInFriction = v11;
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  SBWindow *v21;
  _BOOL8 v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[SBCoverSheetPresentationManager wantsHomeGestureOwnership](self, "wantsHomeGestureOwnership"))
    v8 = 2;
  else
    v8 = 0;
  objc_msgSend(v7, "setActivationPolicyForParticipantsBelow:", v8);
  if (!-[SBCoverSheetPresentationManager wantsHomeGestureOwnership](self, "wantsHomeGestureOwnership"))
    goto LABEL_22;
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isLockScreenShowingDefaultContent"))
  {

  }
  else
  {
    +[SBAssistantController sharedInstanceIfExists](SBAssistantController, "sharedInstanceIfExists");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isVisible");

    if (!v11)
      goto LABEL_22;
  }
  v23 = v6;
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v12, "sceneHostEnvironmentEntriesForBacklightSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "bundleIdentifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          if (!v16)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v16, "addObject:", v19);
        }

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  objc_msgSend(v7, "setAssociatedBundleIdentifiersToSuppressInSystemAperture:", v16);
  objc_msgSend(v12, "audioCategoriesDisablingVolumeHUD");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAudioCategoriesDisablingVolumeHUD:", v20);

  v6 = v23;
LABEL_22:
  v21 = self->_coverSheetWindow;
  if (-[SBCoverSheetPresentationManager wantsHomeGestureOwnership](self, "wantsHomeGestureOwnership"))
    v22 = (unint64_t)(-[SBWindow interfaceOrientation](v21, "interfaceOrientation") - 3) < 2;
  else
    v22 = 0;
  objc_msgSend(v7, "setSuppressSystemApertureForSystemChromeSuppression:", v22);
  if (-[SBCoverSheetPresentationManager isPresented](self, "isPresented"))
    objc_msgSend(v7, "setAllowsDimmingWhenForegroundInactive:", 1);

}

- (id)scenesForBacklightSession
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBCoverSheetPresentationManager secureAppViewController](self, "secureAppViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationSceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sceneHandle:(id)a3 didCreateScene:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__SBCoverSheetPresentationManager_sceneHandle_didCreateScene___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__SBCoverSheetPresentationManager_sceneHandle_didCreateScene___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 32));

}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__SBCoverSheetPresentationManager_sceneHandle_didDestroyScene___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __63__SBCoverSheetPresentationManager_sceneHandle_didDestroyScene___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 32));

}

- (void)hostableEntityPresenter:(id)a3 didBeginHosting:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SBCoverSheetPresentationManager_hostableEntityPresenter_didBeginHosting___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __75__SBCoverSheetPresentationManager_hostableEntityPresenter_didBeginHosting___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 32));

}

- (void)hostableEntityPresenter:(id)a3 didEndHosting:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__SBCoverSheetPresentationManager_hostableEntityPresenter_didEndHosting___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __73__SBCoverSheetPresentationManager_hostableEntityPresenter_didEndHosting___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend((id)SBApp, "backlightEnvironmentSessionProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidateBacklightScenesForProvider:", *(_QWORD *)(a1 + 32));

}

- (int64_t)_wallpaperEffectiveInterfaceOrientation
{
  return -[SBCoverSheetPresentationManager _wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:](self, "_wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"));
}

- (int64_t)_wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:(int64_t)a3
{
  return a3;
}

- (int64_t)interfaceOrientationForWallpaperController:(id)a3
{
  void *v4;
  int64_t v5;

  -[SBCoverSheetPresentationManager coverSheetWindow](self, "coverSheetWindow", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SBCoverSheetPresentationManager _wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:](self, "_wallpaperEffectiveInterfaceOrientationWithFallbackOrientation:", objc_msgSend(v4, "interfaceOrientation"));

  return v5;
}

- (void)_prepareForPresentationTransitionForUserGesture:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void (**v21)(_QWORD);
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v3 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_prepareForPresentationTransition", buf, 2u);
  }

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager _prepareForATransition](self, "_prepareForATransition");
  v7 = -[SBCoverSheetSlidingViewController _appearState](self->_coverSheetSlidingViewController, "_appearState");
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0 && !v7)
  {
    v8 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
    objc_msgSend(v6, "setEffectiveInterfaceOrientationOverride:", v8);
    -[SBCoverSheetPresentationManager updateInterfaceOrientationToMatchOrientation:](self, "updateInterfaceOrientationToMatchOrientation:", v8);
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowIconRotation:forReason:", 0, CFSTR("SBCoverSheetSuspendIconRotationReason"));

  }
  -[SBCoverSheetPresentationManager setActiveInterfaceOrientationLocked:](self, "setActiveInterfaceOrientationLocked:", 1);
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activateOrientationSource:", 3);

  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bs_beginAppearanceTransition:animated:", 1, 0);

  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDismissGesturesEnabled:", 1);

  -[SBCoverSheetPresentationManager suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidate");

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "suspendWallpaperAnimationForReason:", CFSTR("SBCoverSheetSuspendWallpaperAnimationForTransition"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", v17);

  -[SBCoverSheetPresentationManager setParticipantState:](self, "setParticipantState:", 2);
  -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceAndBehaviorChanged](self, "_tellDashBoardOurAppearanceAndBehaviorChanged");
  -[SBCoverSheetPresentationManager transitionSettings](self, "transitionSettings");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "revealWallpaper"))
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActiveVariant:", 0);

  }
  if (!v7)
  {
    -[SBCoverSheetPresentationManager _notifyDelegateWillPresent](self, "_notifyDelegateWillPresent");
    SBLogTelemetrySignposts();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)v26 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", v26, 2u);
    }

    kdebug_trace();
    -[SBCoverSheetPresentationManager ppt_transitionBeginsCallback](self, "ppt_transitionBeginsCallback");
    v21 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      -[SBCoverSheetPresentationManager setPpt_transitionBeginsCallback:](self, "setPpt_transitionBeginsCallback:", 0);
      v21[2](v21);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "postNotificationName:object:", CFSTR("SBCoverSheetWillPresentNotification"), self);

  self->_dismissingCoverSheet = 0;
  -[SBCoverSheetPresentationManager setNeedsFakeStatusBarUpdate:](self, "setNeedsFakeStatusBarUpdate:", 1);
  -[SBCoverSheetPresentationManager _updateWallpaperOverlay](self, "_updateWallpaperOverlay");
  if (v3 && -[SBCoverSheetPresentationManager hasBeenDismissedSinceKeybagLock](self, "hasBeenDismissedSinceKeybagLock"))
  {
    objc_msgSend(v6, "noteWillPresentForUserGesture");
  }
  else if (self->_shouldDisplayFakeStatusBar)
  {
    -[UIWindow _sbWindowScene](self->_coverSheetWindow, "_sbWindowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "statusBarManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "layoutManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addActiveLayoutLayer:", 1);

  }
  -[SBCoverSheetPresentationManager _acquireSystemApertureCoverSheetAssertion](self, "_acquireSystemApertureCoverSheetAssertion");

}

- (void)_invalidateSystemApertureCoverSheetAssertion
{
  BSInvalidatable *systemApertureCoverSheetAssertion;

  -[BSInvalidatable invalidate](self->_systemApertureCoverSheetAssertion, "invalidate");
  systemApertureCoverSheetAssertion = self->_systemApertureCoverSheetAssertion;
  self->_systemApertureCoverSheetAssertion = 0;

}

- (void)_acquireSystemApertureCoverSheetAssertion
{
  BSInvalidatable *v3;
  BSInvalidatable *systemApertureCoverSheetAssertion;
  id v5;

  if (!self->_systemApertureCoverSheetAssertion)
  {
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "systemApertureRepresentationSuppressionAssertionForCoversheetVisibility");
    v3 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    systemApertureCoverSheetAssertion = self->_systemApertureCoverSheetAssertion;
    self->_systemApertureCoverSheetAssertion = v3;

  }
}

- (void)_cleanupPresentationTransition
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t v21[16];

  SBLogCoverSheet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v21 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "_cleanupPresentationTransition", v21, 2u);
  }

  v4 = 1;
  -[SBCoverSheetPresentationManager _setCoverSheetWindowVisible:forReason:](self, "_setCoverSheetWindowVisible:forReason:", 1, CFSTR("SBCoverSheetWindowVisibleReasonPresented"));
  -[SBCoverSheetPresentationManager _setSecureAppWindowVisible:forReason:](self, "_setSecureAppWindowVisible:forReason:", 0, CFSTR("SBCoverSheetWindowVisibleReasonPresented"));
  -[SBCoverSheetPresentationManager _cleanupATransition](self, "_cleanupATransition");
  if (-[SBCoverSheetPresentationManager hasBeenDismissedSinceKeybagLock](self, "hasBeenDismissedSinceKeybagLock"))
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isAuthenticated") ^ 1;

  }
  -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSceneManagerForPresented:suspendUnderLockEnvironment:", 1, v4);

  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_endAppearanceTransition:", 1);

  -[SBCoverSheetPresentationManager _notifyDelegateDidPresent](self, "_notifyDelegateDidPresent");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SBCoverSheetDidPresentNotification"), self);

  -[SBCoverSheetPresentationManager _clearSecureAppViewControllersIncludingWindow:](self, "_clearSecureAppViewControllersIncludingWindow:", 1);
  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActiveVariant:", 0);
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + -15.0);

  self->_shouldDisplayFakeStatusBar = 0;
  -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceAndBehaviorChanged](self, "_tellDashBoardOurAppearanceAndBehaviorChanged");
  -[SBCoverSheetPresentationManager suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "invalidate");

  -[SBCoverSheetPresentationManager setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", 0);
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setForceAlertsToPend:forReason:", 0, CFSTR("SBCoverSheetForceAlertItemsToPendReason"));

  -[SBCoverSheetPresentationManager keyboardFocusAssertion](self, "keyboardFocusAssertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    -[SBCoverSheetPresentationManager mainWorkspace](self, "mainWorkspace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "keyboardFocusController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetPresentationManager coverSheetWindow](self, "coverSheetWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_sbWindowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusLockReason coverSheet](SBKeyboardFocusLockReason, "coverSheet");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "focusLockSpringBoardWindowScene:forReason:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCoverSheetPresentationManager setKeyboardFocusAssertion:](self, "setKeyboardFocusAssertion:", v19);

  }
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setCoverSheetIsVisible:", 1);

}

- (void)_prepareForARubberBandTransitionForSlidingViewController:(id)a3
{
  SBCoverSheetSlidingViewController *v4;
  SBCoverSheetSlidingViewController *v5;

  v4 = (SBCoverSheetSlidingViewController *)a3;
  v5 = v4;
  if (self->_coverSheetSlidingViewController == v4)
  {
    -[SBCoverSheetPresentationManager _prepareForATransition](self, "_prepareForATransition");
    -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceAndBehaviorChanged](self, "_tellDashBoardOurAppearanceAndBehaviorChanged");
    v4 = v5;
  }
  -[SBCoverSheetSlidingViewController setDismissalSlidingMode:](v4, "setDismissalSlidingMode:", 2);

}

- (void)_cleanupARubberBandTransitionForSlidingViewController:(id)a3
{
  SBCoverSheetSlidingViewController *v4;
  void *v5;
  SBCoverSheetSlidingViewController *v6;

  v4 = (SBCoverSheetSlidingViewController *)a3;
  v6 = v4;
  if (self->_coverSheetSlidingViewController == v4)
  {
    -[SBCoverSheetPresentationManager _cleanupATransition](self, "_cleanupATransition");
    v4 = v6;
  }
  -[SBCoverSheetSlidingViewController setDismissalSlidingMode:](v4, "setDismissalSlidingMode:", 1);
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setForceAlertsToPend:forReason:", 0, CFSTR("SBCoverSheetForceAlertItemsToPendReason"));

}

- (void)_prepareForRubberBandPresentationTransitionForSlidingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_prepareForRubberBandPresentationTransitionForSlidingViewController: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SBCoverSheetPresentationManager _prepareForARubberBandTransitionForSlidingViewController:](self, "_prepareForARubberBandTransitionForSlidingViewController:", v4);
}

- (void)_cleanupRubberBandPresentationTransitionForSlidingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_cleanupRubberBandPresentationTransitionForSlidingViewController: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SBCoverSheetPresentationManager _cleanupARubberBandTransitionForSlidingViewController:](self, "_cleanupARubberBandTransitionForSlidingViewController:", v4);
}

- (void)_prepareForRubberBandDismissalTransitionForSlidingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_prepareForRubberBandDismissalTransitionForSlidingViewController: %@", (uint8_t *)&v7, 0xCu);
  }

  -[SBCoverSheetPresentationManager _prepareForARubberBandTransitionForSlidingViewController:](self, "_prepareForARubberBandTransitionForSlidingViewController:", v4);
  -[UIImpactFeedbackGenerator prepare](self->_rubberBandFeedbackGenerator, "prepare");
  self->_rubberBandCleanupNeeded = 1;
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "prepareRubberBandTransition");

}

- (void)_cleanupRubberBandDismissalTransitionForSlidingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_cleanupRubberBandDismissalTransitionForSlidingViewController: %@", (uint8_t *)&v6, 0xCu);
  }

  -[SBCoverSheetPresentationManager _cleanupARubberBandTransitionForSlidingViewController:](self, "_cleanupARubberBandTransitionForSlidingViewController:", v4);
}

- (void)_prepareInterstitialTransitionForSlidingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_prepareInterstitialTransitionForSlidingViewController: %@", (uint8_t *)&v9, 0xCu);
  }

  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    LOWORD(v9) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_INTERSTITIAL_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v9, 2u);
  }

  kdebug_trace();
  objc_msgSend(v4, "setDismissalSlidingMode:", 3);
  -[SBCoverSheetPresentationManager pearlMatchingStateProvider](self, "pearlMatchingStateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reset");

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prepareForInterstitialPresentation");

}

- (void)_updateInterstitialTransitionForSlidingViewController:(id)a3 withProgress:(double)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogCoverSheet();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412546;
    v10 = v6;
    v11 = 2048;
    v12 = a4;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "_updateInterstitialTransitionForSlidingViewController: %@ withProgress: %.2f", (uint8_t *)&v9, 0x16u);
  }

  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updateInterstitialPresentationWithProgress:", a4);

}

- (void)_cleanupInterstitialTransitionForSlidingViewController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  BOOL v9;
  _BOOL8 v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCoverSheet();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v15 = 138412290;
    v16 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "_cleanupInterstitialTransitionForSlidingViewController: %@", (uint8_t *)&v15, 0xCu);
  }

  objc_msgSend(v4, "setDismissalSlidingMode:", 1);
  objc_msgSend(v4, "activeGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "state");
  v8 = -[SBCoverSheetSlidingViewController mathForGestureRecognizerPointsDown:](self->_coverSheetSlidingViewController, "mathForGestureRecognizerPointsDown:", v6);
  v9 = v7 == 2;
  v10 = v7 == 2;
  v11 = v9 || v8;
  v12 = v11 ^ 1u;
  -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cleanupInterstitialPresentationToPresented:inPlace:", v12, v10);

  SBLogTelemetrySignposts();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v14))
  {
    LOWORD(v15) = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_INTERSTITIAL_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", (uint8_t *)&v15, 2u);
  }

  kdebug_trace();
}

- (void)_prepareForDismissalTransition
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id WeakRetained;
  BOOL v18;
  uint8_t v19[16];
  uint8_t buf[16];

  SBLogCoverSheet();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "_prepareForDismissalTransition", buf, 2u);
  }

  if (-[SBCoverSheetSlidingViewController dismissalSlidingMode](self->_coverSheetSlidingViewController, "dismissalSlidingMode") == 2)-[SBCoverSheetPresentationManager _cleanupARubberBandTransitionForSlidingViewController:](self, "_cleanupARubberBandTransitionForSlidingViewController:", self->_coverSheetSlidingViewController);
  if (-[SBCoverSheetSlidingViewController dismissalSlidingMode](self->_coverSheetSlidingViewController, "dismissalSlidingMode") == 3)-[SBCoverSheetPresentationManager _cleanupInterstitialTransitionForSlidingViewController:](self, "_cleanupInterstitialTransitionForSlidingViewController:", self->_coverSheetSlidingViewController);
  v4 = -[SBCoverSheetSlidingViewController _appearState](self->_coverSheetSlidingViewController, "_appearState");
  -[SBCoverSheetPresentationManager _prepareForATransition](self, "_prepareForATransition");
  -[SBCoverSheetPresentationManager _setCoverSheetWindowVisible:forReason:](self, "_setCoverSheetWindowVisible:forReason:", 0, CFSTR("SBCoverSheetWindowVisibleReasonPresented"));
  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_beginAppearanceTransition:animated:", 0, 0);

  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizeDrawing");
  -[SBCoverSheetPresentationManager transitionSettings](self, "transitionSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "revealWallpaper");

  if ((v7 & 1) == 0)
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActiveVariant:", 1);

  }
  -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateSceneManagerForPresented:suspendUnderLockEnvironment:", 0, 0);

  if (v4 == 2)
  {
    -[SBCoverSheetPresentationManager _notifyDelegateWillDismiss](self, "_notifyDelegateWillDismiss");
    SBLogTelemetrySignposts();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", v19, 2u);
    }

    kdebug_trace();
    -[SBCoverSheetPresentationManager ppt_transitionBeginsCallback](self, "ppt_transitionBeginsCallback");
    v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[SBCoverSheetPresentationManager setPpt_transitionBeginsCallback:](self, "setPpt_transitionBeginsCallback:", 0);
      v11[2](v11);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "postNotificationName:object:", CFSTR("SBCoverSheetWillDismissNotification"), self);

  -[SBCoverSheetPresentationManager suspendWallpaperAnimationAssertion](self, "suspendWallpaperAnimationAssertion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "invalidate");

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "suspendWallpaperAnimationForReason:", CFSTR("SBCoverSheetSuspendWallpaperAnimationForTransition"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager setSuspendWallpaperAnimationAssertion:](self, "setSuspendWallpaperAnimationAssertion:", v15);

  self->_preparingToDismissCoverSheet = 1;
  -[SBCoverSheetPresentationManager _updateShouldDisplayFakeStatusBarInVisibleTransition:](self, "_updateShouldDisplayFakeStatusBarInVisibleTransition:", 0);
  -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceAndBehaviorChanged](self, "_tellDashBoardOurAppearanceAndBehaviorChanged");
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWindowLevel:", *MEMORY[0x1E0CEBE28] + -3.0);

  *(_WORD *)&self->_preparingToDismissCoverSheet = 256;
  -[SBCoverSheetPresentationManager _updateWallpaperOverlay](self, "_updateWallpaperOverlay");
  if (v4 == 2)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_transitionSettings);
    if ((objc_msgSend(WeakRetained, "iconsFlyIn") & 1) != 0)
    {
      v18 = -[SBCoverSheetPresentationManager hasBeenDismissedSinceKeybagLock](self, "hasBeenDismissedSinceKeybagLock");

      if (!v18)
        -[SBCoverSheetPresentationManager _prepareIconAnimatorForPresenting:](self, "_prepareIconAnimatorForPresenting:", 0);
    }
    else
    {

    }
  }
}

- (void)_cleanupDismissalTransition
{
  void *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  BSInterfaceOrientationDescription();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a1 == a2)
    v7 = &stru_1E8EC7EC0;
  else
    v7 = CFSTR("which is unexpected and doesn't match the active interface orientation! ");
  objc_msgSend((id)SBApp, "orientationAggregator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "Unlocking to %{public}@, %{public}@%{public}@", (uint8_t *)&v9, 0x20u);

}

- (void)_prepareForTransitionToSecureApp
{
  -[SBCoverSheetPresentationManager _prepareSecureAppWindowForDisplay](self, "_prepareSecureAppWindowForDisplay");
  -[SBCoverSheetPresentationManager setTransitionType:](self, "setTransitionType:", SBCoverSheetTransitionTypeForCurrentState());
}

- (void)_prepareForATransition
{
  void *v3;
  unint64_t transitionOverrideOptions;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SBCoverSheetPresentationManager _setOrientationUpdatesDeferred:](self, "_setOrientationUpdatesDeferred:", 1);
  -[SBLockScreenEnvironment idleTimerController](self->_lockScreenEnvironment, "idleTimerController");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "addIdleTimerDisabledAssertionReason:", CFSTR("SBCoverSheetDisableIdleTimerForGestureInProgress"));
  -[SBCoverSheetPresentationManager _setCoverSheetWindowVisible:forReason:](self, "_setCoverSheetWindowVisible:forReason:", 1, CFSTR("SBCoverSheetWindowVisibleReasonTransition"));
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setForceAlertsToPend:forReason:", 1, CFSTR("SBCoverSheetForceAlertItemsToPendReason"));

  transitionOverrideOptions = self->_transitionOverrideOptions;
  if ((transitionOverrideOptions & 2) != 0)
  {
    v5 = 5;
  }
  else if ((transitionOverrideOptions & 1) != 0)
  {
    v5 = 9;
  }
  else
  {
    v5 = SBCoverSheetTransitionTypeForCurrentState();
  }
  -[SBCoverSheetPresentationManager setTransitionType:](self, "setTransitionType:", v5);
  -[SBCoverSheetPresentationManager _acquireAsynchronousRenderingAssertion](self, "_acquireAsynchronousRenderingAssertion");
  -[SBCoverSheetPresentationManager requireWallpaperAssertion](self, "requireWallpaperAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requireWallpaperWithReason:", CFSTR("CoverSheet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBCoverSheetPresentationManager setRequireWallpaperAssertion:](self, "setRequireWallpaperAssertion:", v8);

  -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "updateForegroundScenesForCoverSheetAnimationActive:", 1);

}

- (void)_cleanupATransition
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void (**v7)(_QWORD);
  uint8_t v8[16];

  -[SBCoverSheetPresentationManager _setCoverSheetWindowVisible:forReason:](self, "_setCoverSheetWindowVisible:forReason:", 0, CFSTR("SBCoverSheetWindowVisibleReasonTransition"));
  -[SBCoverSheetPresentationManager _setOrientationUpdatesDeferred:](self, "_setOrientationUpdatesDeferred:", 0);
  -[SBLockScreenEnvironment idleTimerController](self->_lockScreenEnvironment, "idleTimerController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "removeIdleTimerDisabledAssertionReason:", CFSTR("SBCoverSheetDisableIdleTimerForGestureInProgress"));
  -[SBCoverSheetPresentationManager _relinquishAsynchronousRenderingAssertion](self, "_relinquishAsynchronousRenderingAssertion");
  -[SBCoverSheetPresentationManager requireWallpaperAssertion](self, "requireWallpaperAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[SBCoverSheetPresentationManager setRequireWallpaperAssertion:](self, "setRequireWallpaperAssertion:", 0);
  -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateForegroundScenesForCoverSheetAnimationActive:", 0);

  -[SBCoverSheetPresentationManager _updateWallpaperOverlay](self, "_updateWallpaperOverlay");
  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_COVERSHEET_TRANSITION", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  kdebug_trace();
  -[SBCoverSheetPresentationManager ppt_transitionEndsCallback](self, "ppt_transitionEndsCallback");
  v7 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBCoverSheetPresentationManager setPpt_transitionEndsCallback:](self, "setPpt_transitionEndsCallback:", 0);
    v7[2](v7);
  }

}

- (void)noteScreenDidTurnOff
{
  void *v3;

  -[SBCoverSheetPresentationManager setHasBeenDismissedSinceKeybagLock:](self, "setHasBeenDismissedSinceKeybagLock:", 0);
  -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateSceneManagerForPresented:suspendUnderLockEnvironment:", 1, 1);

  -[SBCoverSheetPresentationManager _setOrientationUpdatesDeferred:](self, "_setOrientationUpdatesDeferred:", 0);
}

- (void)_notifyDelegateWillPresent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__SBCoverSheetPresentationManager__notifyDelegateWillPresent__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  -[SBCoverSheetPresentationManager _enqueueBlock:withName:](self, "_enqueueBlock:withName:", v2, CFSTR("willPresent"));
}

void __61__SBCoverSheetPresentationManager__notifyDelegateWillPresent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lockScreenViewControllerWillPresent");

}

- (void)_notifyDelegateDidPresent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__SBCoverSheetPresentationManager__notifyDelegateDidPresent__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  -[SBCoverSheetPresentationManager _enqueueBlock:withName:](self, "_enqueueBlock:withName:", v2, CFSTR("didPresent"));
}

void __60__SBCoverSheetPresentationManager__notifyDelegateDidPresent__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lockScreenViewControllerDidPresent");

}

- (void)_notifyDelegateWillDismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __61__SBCoverSheetPresentationManager__notifyDelegateWillDismiss__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  -[SBCoverSheetPresentationManager _enqueueBlock:withName:](self, "_enqueueBlock:withName:", v2, CFSTR("willDismiss"));
}

void __61__SBCoverSheetPresentationManager__notifyDelegateWillDismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lockScreenViewControllerWillDismiss");

}

- (void)_notifyDelegateDidDismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __60__SBCoverSheetPresentationManager__notifyDelegateDidDismiss__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  -[SBCoverSheetPresentationManager _enqueueBlock:withName:](self, "_enqueueBlock:withName:", v2, CFSTR("didDismiss"));
}

void __60__SBCoverSheetPresentationManager__notifyDelegateDidDismiss__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lockScreenViewControllerDidDismiss");

}

- (void)_notifyDelegateRequestsUnlock
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64__SBCoverSheetPresentationManager__notifyDelegateRequestsUnlock__block_invoke;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = self;
  -[SBCoverSheetPresentationManager _enqueueBlock:withName:](self, "_enqueueBlock:withName:", v2, CFSTR("requestsUnlock"));
}

void __64__SBCoverSheetPresentationManager__notifyDelegateRequestsUnlock__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lockScreenViewControllerRequestsUnlock");

}

- (void)_enqueueBlock:(id)a3 withName:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](self->_lockUnlockQueue, "executeOrInsertEvent:atPosition:", v5, 1);

}

- (void)setWantsHomeGestureOwnership:(BOOL)a3
{
  if (self->_wantsHomeGestureOwnership != a3)
  {
    self->_wantsHomeGestureOwnership = a3;
    if (a3)
      -[SBCoverSheetPresentationManager _requestHomeGestureOwnership](self, "_requestHomeGestureOwnership");
    else
      -[SBCoverSheetPresentationManager _relinquishHomeGestureOwnership](self, "_relinquishHomeGestureOwnership");
  }
}

- (void)_requestHomeGestureOwnership
{
  id v2;

  -[SBCoverSheetPresentationManager zStackParticipant](self, "zStackParticipant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdatePreferencesWithReason:", CFSTR("requesting home gesture ownership"));

}

- (void)_relinquishHomeGestureOwnership
{
  id v2;

  -[SBCoverSheetPresentationManager zStackParticipant](self, "zStackParticipant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsUpdatePreferencesWithReason:", CFSTR("relinquishing home gesture ownership"));

}

- (void)_setOrientationUpdatesDeferred:(BOOL)a3
{
  _BOOL4 v3;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  BSInvalidatable *v6;
  BSInvalidatable *v7;

  v3 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheet")) & 1) == 0)
  {
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    if ((((deferOrientationUpdatesAssertion == 0) ^ v3) & 1) == 0)
    {
      if (v3)
      {
        objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBCoverSheetLockOrientationForInteractiveTransition"));
        v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[BSInvalidatable invalidate](deferOrientationUpdatesAssertion, "invalidate");
        v6 = 0;
      }
      v7 = self->_deferOrientationUpdatesAssertion;
      self->_deferOrientationUpdatesAssertion = v6;

    }
  }
}

- (void)_setCoverSheetWindowVisible:(BOOL)a3 forReason:(id)a4
{
  -[SBCoverSheetPresentationManager _setCoverSheet:windowVisible:forReason:](self, "_setCoverSheet:windowVisible:forReason:", 1, a3, a4);
}

- (void)_setSecureAppWindowVisible:(BOOL)a3 forReason:(id)a4
{
  -[SBCoverSheetPresentationManager _setCoverSheet:windowVisible:forReason:](self, "_setCoverSheet:windowVisible:forReason:", 0, a3, a4);
}

- (void)_setCoverSheet:(BOOL)a3 windowVisible:(BOOL)a4 forReason:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  const __CFString *v17;
  int v18;
  const __CFString *v19;
  uint64_t v20;

  v5 = a4;
  v6 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (v6)
  {
    -[SBCoverSheetPresentationManager coverSheetWindow](self, "coverSheetWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 112;
  }
  else
  {
    -[SBCoverSheetPresentationManager secureAppWindow](self, "secureAppWindow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 120;
  }
  v11 = *(id *)((char *)&self->super.isa + v10);
  v12 = v11;
  if (v5)
  {
    v13 = objc_msgSend(v11, "count");
    objc_msgSend(v12, "addObject:", v8);
    if (!v13)
    {
      SBLogCoverSheet();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = CFSTR("Secure App");
        if (v6)
          v15 = CFSTR("CoverSheet");
        v18 = 138543362;
        v19 = v15;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_INFO, "Making %{public}@ Window visible", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(v9, "makeKeyAndVisible");
    }
  }
  else
  {
    objc_msgSend(v11, "removeObject:", v8);
    if (!objc_msgSend(v12, "count"))
    {
      SBLogCoverSheet();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = CFSTR("Secure App");
        if (v6)
          v17 = CFSTR("CoverSheet");
        v18 = 138543362;
        v19 = v17;
        _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "Making %{public}@ Window hidden", (uint8_t *)&v18, 0xCu);
      }

      objc_msgSend(v9, "resignAsKeyWindow");
      objc_msgSend(v9, "setHidden:", 1);
    }
  }

}

- (void)_updateVisibilityOfWindow:(id)a3 forReasons:(id)a4
{
  id v5;

  v5 = a3;
  if (objc_msgSend(a4, "count"))
    objc_msgSend(v5, "makeKeyAndVisible");
  else
    objc_msgSend(v5, "setHidden:", 1);

}

- (void)_prepareCoverSheetWindowForDisplay
{
  void *v3;
  void *v4;
  id v5;

  -[SBCoverSheetPresentationManager coverSheetSlidingViewController](self, "coverSheetSlidingViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SBCoverSheetPresentationManager coverSheetWindow](self, "coverSheetWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootViewController:", v5);

  }
}

- (void)_prepareSecureAppWindowForDisplay
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasSecureApp");

  if (v4)
  {
    -[SBCoverSheetPresentationManager secureAppSlidingViewController](self, "secureAppSlidingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[SBCoverSheetPresentationManager secureAppWindow](self, "secureAppWindow");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setRootViewController:", v5);

      -[SBCoverSheetPresentationManager _setSecureAppWindowVisible:forReason:](self, "_setSecureAppWindowVisible:forReason:", 1, CFSTR("SBCoverSheetWindowVisibleReasonPresented"));
      -[SBCoverSheetSecureAppEnvironmentViewController requestHomeGestureOwnership](self->_secureAppEnvironmentViewController, "requestHomeGestureOwnership");
    }

  }
  self->_pendingClearSecureAppViewControllers = 0;
}

- (void)_updateProximitySensorState
{
  void *v3;
  uint64_t v4;
  id v5;

  if (-[SBCoverSheetPresentationManager isPresented](self, "isPresented"))
  {
    -[SBLockScreenEnvironment proximityBehaviorProvider](self->_lockScreenEnvironment, "proximityBehaviorProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "expectsFaceContact");

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend((id)SBApp, "proximitySensorManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client:wantsProximityDetectionEnabled:", CFSTR("CoverSheet"), v4);

}

- (void)_acquireAsynchronousRenderingAssertion
{
  SBAsynchronousRenderingAssertion *v3;
  SBAsynchronousRenderingAssertion *asynchronousRenderingAssertion;

  if (!self->_asynchronousRenderingAssertion)
  {
    v3 = -[SBAsynchronousRenderingAssertion initWithReason:]([SBAsynchronousRenderingAssertion alloc], "initWithReason:", CFSTR("SBCoverSheetAsynchronousRenderingReason"));
    asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
    self->_asynchronousRenderingAssertion = v3;

  }
}

- (void)_relinquishAsynchronousRenderingAssertion
{
  SBAsynchronousRenderingAssertion *asynchronousRenderingAssertion;

  -[BSSimpleAssertion invalidate](self->_asynchronousRenderingAssertion, "invalidate");
  asynchronousRenderingAssertion = self->_asynchronousRenderingAssertion;
  self->_asynchronousRenderingAssertion = 0;

}

- (void)_authenticationChanged:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];

  v4 = (void *)SBApp;
  v5 = a3;
  objc_msgSend(v4, "authenticationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAuthenticatedCached");

  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "bs_BOOLForKey:", *MEMORY[0x1E0DAA250]);
  if (-[SBCoverSheetSlidingViewController dismissalSlidingMode](self->_coverSheetSlidingViewController, "dismissalSlidingMode") != 1&& v7&& (v9 & 1) == 0)
  {
    SBLogCoverSheet();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_INFO, "Authentication state changed while in a non-tracking dismissal transition, re-preparing for dismissal.", v12, 2u);
    }

    -[SBCoverSheetPresentationManager coverSheetSlidingViewController:prepareForDismissalTransitionForReversingTransition:forUserGesture:](self, "coverSheetSlidingViewController:prepareForDismissalTransitionForReversingTransition:forUserGesture:", self->_coverSheetSlidingViewController, 0, 0);
  }
  if (((v7 | v9 ^ 1) & 1) == 0)
  {
    -[SBCoverSheetPresentationManager setHasBeenDismissedSinceKeybagLock:](self, "setHasBeenDismissedSinceKeybagLock:", 0);
    if (!-[SBCoverSheetPresentationManager isTransitioning](self, "isTransitioning")
      && (-[SBUILockStateProvider isLockScreenPresentationPending](self->_uiLockStateProvider, "isLockScreenPresentationPending") & 1) == 0)
    {
      -[SBCoverSheetPresentationManager sceneManager](self, "sceneManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "updateSceneManagerForPresented:suspendUnderLockEnvironment:", 1, 1);

    }
  }
}

- (void)_restartStartupTransitionBegan:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startupTransition");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "destination");

  if (v5 == 2)
  {
    -[SBCoverSheetPresentationManager setHasBeenDismissedSinceBoot:](self, "setHasBeenDismissedSinceBoot:", 1);
    -[SBCoverSheetPresentationManager setHasBeenDismissedSinceKeybagLock:](self, "setHasBeenDismissedSinceKeybagLock:", 1);
  }

}

- (BOOL)_isEffectivelyLocked
{
  void *v3;
  void *v4;
  char v5;

  objc_msgSend((id)SBApp, "authenticationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAuthenticated"))
  {
    -[SBCoverSheetPresentationManager coverSheetViewController](self, "coverSheetViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "externalLockProvidersRequireUnlock");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (id)_impactFeedbackGeneratorConfigurationForStyle:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CEAD78], "lightConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEAD78], "strongConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEAD78], "softConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CEAD78], "rigidConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CEAD78], "defaultConfiguration");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
  return v3;
}

- (id)_newRubberBandFeedbackGeneratorForSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[SBCoverSheetPresentationManager _impactFeedbackGeneratorConfigurationForStyle:](self, "_impactFeedbackGeneratorConfigurationForStyle:", objc_msgSend(v4, "unlockRubberBandFeedbackIntensity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "feedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CEAD28], "feedbackPattern");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addFeedback:atTime:", v7, 0.0);
    objc_msgSend(v4, "unlockRubberBandFeedbackInterval");
    objc_msgSend(v8, "addFeedback:atTime:", v7);
    objc_msgSend(v5, "setFeedback:", v8);

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA660]), "initWithConfiguration:", v5);

  return v9;
}

- (BOOL)_secureAppTypeGetsCorrectDismissalSemantics:(unint64_t)a3
{
  return (a3 > 0xC) | (0x8C1u >> a3) & 1;
}

- (void)_prepareIconAnimatorForPresenting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SBCoverSheetIconFlyInAnimator *v10;
  SBCoverSheetIconFlyInAnimator *iconAnimator;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  dispatch_group_t v17;
  NSObject *v18;
  int v19;
  dispatch_group_t v20;
  uint64_t v21;

  v3 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  if (!SBReduceMotion())
  {
    -[SBCoverSheetPresentationManager _cleanupIconAnimator](self, "_cleanupIconAnimator");
    SBLogCoverSheet();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Preparing for icon animation", (uint8_t *)&v19, 2u);
    }

    +[SBIconController sharedInstance](SBIconController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_openFolderController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "iconManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "closeFolderAnimated:withCompletion:", 0, 0);

    }
    objc_msgSend(v6, "_currentFolderController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBCoverSheetIconFlyInAnimator initWithFolderController:]([SBCoverSheetIconFlyInAnimator alloc], "initWithFolderController:", v9);
    iconAnimator = self->_iconAnimator;
    self->_iconAnimator = v10;

    objc_msgSend(MEMORY[0x1E0DAA470], "rootSettings");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconAnimationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unlockSettings");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    -[SBIconAnimator setSettings:](self->_iconAnimator, "setSettings:", v15);
    -[SBIconAnimator prepare](self->_iconAnimator, "prepare");
    if (v3)
      v16 = 1.0;
    else
      v16 = 0.0;
    -[SBCoverSheetPresentationManager _animateForProgress:](self, "_animateForProgress:", v16);
    -[SBCoverSheetPresentationManager _setTransitionProgress:animated:gestureActive:coverSheetProgress:completion:](self, "_setTransitionProgress:animated:gestureActive:coverSheetProgress:completion:", 0, 0, 0, v16, 0.0);
    self->_iconAnimatorNeedsAnimating = 1;
    v17 = dispatch_group_create();
    SBLogCoverSheet();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 134217984;
      v20 = v17;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Creating completion group for icon animation: %p", (uint8_t *)&v19, 0xCu);
    }

    -[SBCoverSheetPresentationManager setIconAnimatorCompletionGroup:](self, "setIconAnimatorCompletionGroup:", v17);
  }
}

- (void)_animateForProgress:(double)a3
{
  -[SBCenterIconZoomAnimator setFraction:withCenter:](self->_iconAnimator, "setFraction:withCenter:", 1.0 - a3, *(double *)&SBCoverSheetIconFlyInDefaultCenter, unk_1EFC446B8);
}

- (void)_setTransitionProgress:(double)a3 animated:(BOOL)a4 gestureActive:(BOOL)a5 coverSheetProgress:(double)a6 completion:(id)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  id v11;
  double iconFlyInTension;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  _BOOL4 v16;
  dispatch_block_t v17;
  void *v18;
  double v19;
  double v20;
  NSObject *v21;
  _QWORD v22[6];
  _QWORD v23[4];
  NSObject *v24;
  id v25;
  _QWORD v26[8];
  BOOL v27;
  _QWORD block[5];
  id v29;
  double iconFlyInFriction;
  double v31;
  uint8_t buf[4];
  NSObject *v33;
  uint64_t v34;

  v7 = a5;
  v8 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v11 = a7;
  if (v8)
  {
    iconFlyInFriction = 0.0;
    v31 = 0.0;
    if (v7)
    {
      convertDampingRatioAndResponseToTensionAndFriction();
    }
    else
    {
      iconFlyInTension = self->_iconFlyInTension;
      iconFlyInFriction = self->_iconFlyInFriction;
      v31 = iconFlyInTension;
    }
    -[SBCoverSheetPresentationManager iconAnimatorCompletionGroup](self, "iconAnimatorCompletionGroup");
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(v13);
    SBLogCoverSheet();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = v13;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Entering completion group %p for icon animation", buf, 0xCu);
    }

    -[SBCoverSheetPresentationManager iconAnimatorCompletionBlock](self, "iconAnimatorCompletionBlock");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      objc_initWeak((id *)buf, self);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke;
      block[3] = &unk_1E8EA7838;
      block[4] = self;
      objc_copyWeak(&v29, (id *)buf);
      v17 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[SBCoverSheetPresentationManager setIconAnimatorCompletionBlock:](self, "setIconAnimatorCompletionBlock:", v17);

      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)buf);
    }
    v18 = (void *)MEMORY[0x1E0CEABB0];
    v20 = iconFlyInFriction;
    v19 = v31;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_158;
    v26[3] = &unk_1E8EA8710;
    v26[4] = self;
    v27 = v7;
    *(double *)&v26[5] = a3;
    *(double *)&v26[6] = v31;
    *(double *)&v26[7] = iconFlyInFriction;
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_3;
    v23[3] = &unk_1E8EA4890;
    v24 = v13;
    v25 = v11;
    v21 = v13;
    objc_msgSend(v18, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v26, v23, v19, v20);

  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_160;
    v22[3] = &unk_1E8E9DE88;
    v22[4] = self;
    *(double *)&v22[5] = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v22);
  }

}

void __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  dispatch_time_t v5;
  _QWORD v6[6];
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheet();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
    *(_DWORD *)buf = 134217984;
    v8 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Running completion for icon animation group %p", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setIconAnimatorCompletionGroup:", 0);
  v5 = dispatch_time(0, 300000000);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_157;
  v6[3] = &unk_1E8E9E820;
  v6[4] = *(_QWORD *)(a1 + 32);
  v6[5] = WeakRetained;
  dispatch_after(v5, MEMORY[0x1E0C80D38], v6);

}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_157(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCoverSheet();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 232);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Cleaning up icon animator for icon animation group %p", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_cleanupIconAnimator");
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_158(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];
  __int128 v5;
  uint64_t v6;
  char v7;
  CAFrameRateRange v8;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_2;
  v4[3] = &unk_1E8EA8710;
  v4[4] = *(_QWORD *)(a1 + 32);
  v7 = *(_BYTE *)(a1 + 64);
  v5 = *(_OWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 56);
  return objc_msgSend(v2, "sb_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1114125, v4, *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
}

void __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_animateForProgress:", *(double *)(a1 + 40));
  if (!*(_BYTE *)(a1 + 64))
  {
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateWallpaperAnimationWithIconFlyInTension:friction:", *(double *)(a1 + 48), *(double *)(a1 + 56));

  }
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  SBLogCoverSheet();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 134217984;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Leaving completion group %p for icon animation", (uint8_t *)&v5, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __111__SBCoverSheetPresentationManager__setTransitionProgress_animated_gestureActive_coverSheetProgress_completion___block_invoke_160(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_animateForProgress:", *(double *)(a1 + 40));
}

- (void)setWallpaperFloatingLayerHidden:(BOOL)a3
{
  if (self->_wallpaperFloatingLayerHidden != a3)
  {
    self->_wallpaperFloatingLayerHidden = a3;
    -[SBCoverSheetPresentationManager _tellDashBoardOurAppearanceChanged](self, "_tellDashBoardOurAppearanceChanged");
    -[SBCoverSheetPresentationManager _updateWallpaperOverlay](self, "_updateWallpaperOverlay");
  }
}

- (void)_cleanupIconAnimator
{
  SBCoverSheetIconFlyInAnimator *iconAnimator;
  SBCoverSheetIconFlyInAnimator *v4;

  iconAnimator = self->_iconAnimator;
  if (iconAnimator)
  {
    -[SBIconAnimator cleanup](iconAnimator, "cleanup");
    v4 = self->_iconAnimator;
    self->_iconAnimator = 0;

  }
}

- (int64_t)participantState
{
  return self->_participantState;
}

- (void)setParticipantState:(int64_t)a3
{
  self->_participantState = a3;
}

- (int64_t)scrollingStrategy
{
  return self->_scrollingStrategy;
}

- (SBCoverSheetPresentationDelegate)delegate
{
  return (SBCoverSheetPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBUILockStateProvider)uiLockStateProvider
{
  return self->_uiLockStateProvider;
}

- (void)setUILockStateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_uiLockStateProvider, a3);
}

- (SBPearlMatchingStateProvider)pearlMatchingStateProvider
{
  return (SBPearlMatchingStateProvider *)objc_loadWeakRetained((id *)&self->_pearlMatchingStateProvider);
}

- (SBLockScreenEnvironment)lockScreenEnvironment
{
  return self->_lockScreenEnvironment;
}

- (BOOL)isCoverSheetHostingUnlockedEnvironmentWindows
{
  return self->_isCoverSheetHostingUnlockedEnvironmentWindows;
}

- (SBMainWorkspace)mainWorkspace
{
  return self->_mainWorkspace;
}

- (void)setMainWorkspace:(id)a3
{
  objc_storeStrong((id *)&self->_mainWorkspace, a3);
}

- (BOOL)hasBeenDismissedSinceKeybagLock
{
  return self->_hasBeenDismissedSinceKeybagLock;
}

- (BOOL)hasBeenDismissedSinceKeybagLockAndAuthenticated
{
  return self->_hasBeenDismissedSinceKeybagLockAndAuthenticated;
}

- (BOOL)hasBeenDismissedSinceBoot
{
  return self->_hasBeenDismissedSinceBoot;
}

- (void)setHasBeenDismissedSinceBoot:(BOOL)a3
{
  self->_hasBeenDismissedSinceBoot = a3;
}

- (BOOL)activeInterfaceOrientationLocked
{
  return self->_activeInterfaceOrientationLocked;
}

- (NSMutableSet)coverSheetWindowVisibleReasons
{
  return self->_coverSheetWindowVisibleReasons;
}

- (void)setCoverSheetWindowVisibleReasons:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetWindowVisibleReasons, a3);
}

- (NSMutableSet)secureAppWindowVisibleReasons
{
  return self->_secureAppWindowVisibleReasons;
}

- (void)setSecureAppWindowVisibleReasons:(id)a3
{
  objc_storeStrong((id *)&self->_secureAppWindowVisibleReasons, a3);
}

- (SBCoverSheetSecureAppEnvironmentViewController)secureAppEnvironmentViewController
{
  return self->_secureAppEnvironmentViewController;
}

- (id)secureAppCleanupHandler
{
  return self->_secureAppCleanupHandler;
}

- (void)setSecureAppCleanupHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void)setSceneManager:(id)a3
{
  objc_storeStrong((id *)&self->_sceneManager, a3);
}

- (BSEventQueue)lockUnlockQueue
{
  return self->_lockUnlockQueue;
}

- (void)setLockUnlockQueue:(id)a3
{
  objc_storeStrong((id *)&self->_lockUnlockQueue, a3);
}

- (CSLockScreenSettings)lockScreenSettings
{
  return self->_lockScreenSettings;
}

- (void)setLockScreenSettings:(id)a3
{
  objc_storeStrong((id *)&self->_lockScreenSettings, a3);
}

- (UIImpactFeedbackGenerator)rubberBandFeedbackGenerator
{
  return self->_rubberBandFeedbackGenerator;
}

- (void)setRubberBandFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_rubberBandFeedbackGenerator, a3);
}

- (unint64_t)transitionType
{
  return self->_transitionType;
}

- (CSCoverSheetTransitionSettings)transitionSettings
{
  return (CSCoverSheetTransitionSettings *)objc_loadWeakRetained((id *)&self->_transitionSettings);
}

- (void)setTransitionSettings:(id)a3
{
  objc_storeWeak((id *)&self->_transitionSettings, a3);
}

- (unint64_t)transitionOverrideOptions
{
  return self->_transitionOverrideOptions;
}

- (void)setTransitionOverrideOptions:(unint64_t)a3
{
  self->_transitionOverrideOptions = a3;
}

- (BOOL)shouldDisplayFakeStatusBar
{
  return self->_shouldDisplayFakeStatusBar;
}

- (void)setShouldDisplayFakeStatusBar:(BOOL)a3
{
  self->_shouldDisplayFakeStatusBar = a3;
}

- (BOOL)needsFakeStatusBarUpdate
{
  return self->_needsFakeStatusBarUpdate;
}

- (void)setNeedsFakeStatusBarUpdate:(BOOL)a3
{
  self->_needsFakeStatusBarUpdate = a3;
}

- (BOOL)rubberBandCleanupNeeded
{
  return self->_rubberBandCleanupNeeded;
}

- (void)setRubberBandCleanupNeeded:(BOOL)a3
{
  self->_rubberBandCleanupNeeded = a3;
}

- (SBAsynchronousRenderingAssertion)asynchronousRenderingAssertion
{
  return self->_asynchronousRenderingAssertion;
}

- (void)setAsynchronousRenderingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, a3);
}

- (SBDisableActiveInterfaceOrientationChangeAssertion)activeInterfaceOrientationChangeAssertion
{
  return self->_activeInterfaceOrientationChangeAssertion;
}

- (void)setActiveInterfaceOrientationChangeAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeAssertion, a3);
}

- (BSInvalidatable)deferOrientationUpdatesAssertion
{
  return self->_deferOrientationUpdatesAssertion;
}

- (void)setDeferOrientationUpdatesAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, a3);
}

- (SBCoverSheetIconFlyInAnimator)iconAnimator
{
  return self->_iconAnimator;
}

- (void)setIconAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_iconAnimator, a3);
}

- (BOOL)preparingToDismissCoverSheet
{
  return self->_preparingToDismissCoverSheet;
}

- (void)setPreparingToDismissCoverSheet:(BOOL)a3
{
  self->_preparingToDismissCoverSheet = a3;
}

- (BOOL)dismissingCoverSheet
{
  return self->_dismissingCoverSheet;
}

- (void)setDismissingCoverSheet:(BOOL)a3
{
  self->_dismissingCoverSheet = a3;
}

- (OS_dispatch_group)iconAnimatorCompletionGroup
{
  return self->_iconAnimatorCompletionGroup;
}

- (id)iconAnimatorCompletionBlock
{
  return self->_iconAnimatorCompletionBlock;
}

- (BSInvalidatable)systemApertureCoverSheetAssertion
{
  return self->_systemApertureCoverSheetAssertion;
}

- (void)setSystemApertureCoverSheetAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_systemApertureCoverSheetAssertion, a3);
}

- (CSCoverSheetFlyInSettings)flyInSettings
{
  return self->_flyInSettings;
}

- (void)setFlyInSettings:(id)a3
{
  objc_storeStrong((id *)&self->_flyInSettings, a3);
}

- (BOOL)centerFollowsFinger
{
  return self->_centerFollowsFinger;
}

- (void)setCenterFollowsFinger:(BOOL)a3
{
  self->_centerFollowsFinger = a3;
}

- (BOOL)animateIconsOnPresentationToo
{
  return self->_animateIconsOnPresentationToo;
}

- (void)setAnimateIconsOnPresentationToo:(BOOL)a3
{
  self->_animateIconsOnPresentationToo = a3;
}

- (double)iconFlyInInteractiveResponseMin
{
  return self->_iconFlyInInteractiveResponseMin;
}

- (void)setIconFlyInInteractiveResponseMin:(double)a3
{
  self->_iconFlyInInteractiveResponseMin = a3;
}

- (double)iconFlyInInteractiveResponseMax
{
  return self->_iconFlyInInteractiveResponseMax;
}

- (void)setIconFlyInInteractiveResponseMax:(double)a3
{
  self->_iconFlyInInteractiveResponseMax = a3;
}

- (double)iconFlyInInteractiveDampingRatioMin
{
  return self->_iconFlyInInteractiveDampingRatioMin;
}

- (void)setIconFlyInInteractiveDampingRatioMin:(double)a3
{
  self->_iconFlyInInteractiveDampingRatioMin = a3;
}

- (double)iconFlyInInteractiveDampingRatioMax
{
  return self->_iconFlyInInteractiveDampingRatioMax;
}

- (void)setIconFlyInInteractiveDampingRatioMax:(double)a3
{
  self->_iconFlyInInteractiveDampingRatioMax = a3;
}

- (double)iconFlyInTension
{
  return self->_iconFlyInTension;
}

- (void)setIconFlyInTension:(double)a3
{
  self->_iconFlyInTension = a3;
}

- (double)iconFlyInFriction
{
  return self->_iconFlyInFriction;
}

- (void)setIconFlyInFriction:(double)a3
{
  self->_iconFlyInFriction = a3;
}

- (BOOL)iconAnimatorNeedsAnimating
{
  return self->_iconAnimatorNeedsAnimating;
}

- (void)setIconAnimatorNeedsAnimating:(BOOL)a3
{
  self->_iconAnimatorNeedsAnimating = a3;
}

- (BOOL)wantsHomeGestureOwnership
{
  return self->_wantsHomeGestureOwnership;
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (BSInvalidatable)suspendWallpaperAnimationAssertion
{
  return self->_suspendWallpaperAnimationAssertion;
}

- (void)setSuspendWallpaperAnimationAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, a3);
}

- (BSInvalidatable)requireWallpaperAssertion
{
  return self->_requireWallpaperAssertion;
}

- (void)setRequireWallpaperAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_requireWallpaperAssertion, a3);
}

- (BSInvalidatable)keyboardFocusAssertion
{
  return self->_keyboardFocusAssertion;
}

- (void)setKeyboardFocusAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardFocusAssertion, a3);
}

- (id)ppt_transitionBeginsCallback
{
  return self->_ppt_transitionBeginsCallback;
}

- (void)setPpt_transitionBeginsCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 344);
}

- (id)ppt_transitionEndsCallback
{
  return self->_ppt_transitionEndsCallback;
}

- (void)setPpt_transitionEndsCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (UIView)wallpaperFloatingLayerViewContainerView
{
  return self->_wallpaperFloatingLayerViewContainerView;
}

- (void)setWallpaperFloatingLayerViewContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerViewContainerView, a3);
}

- (BSInvalidatable)wallpaperFloatingLayerView
{
  return self->_wallpaperFloatingLayerView;
}

- (void)setWallpaperFloatingLayerView:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerView, a3);
}

- (BOOL)wallpaperFloatingLayerHidden
{
  return self->_wallpaperFloatingLayerHidden;
}

- (BSCompoundAssertion)preserveSecureAppAssertions
{
  return self->_preserveSecureAppAssertions;
}

- (void)setPreserveSecureAppAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_preserveSecureAppAssertions, a3);
}

- (BOOL)pendingClearSecureAppViewControllers
{
  return self->_pendingClearSecureAppViewControllers;
}

- (void)setPendingClearSecureAppViewControllers:(BOOL)a3
{
  self->_pendingClearSecureAppViewControllers = a3;
}

- (NSHashTable)dismissalObservers
{
  return self->_dismissalObservers;
}

- (void)setDismissalObservers:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalObservers, a3);
}

- (SBAtomicObjectQueue)unlockProgressQueue
{
  return self->_unlockProgressQueue;
}

- (void)setUnlockProgressQueue:(id)a3
{
  objc_storeStrong((id *)&self->_unlockProgressQueue, a3);
}

- (void)setCoverSheetSlidingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_coverSheetSlidingViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coverSheetSlidingViewController, 0);
  objc_storeStrong((id *)&self->_unlockProgressQueue, 0);
  objc_storeStrong((id *)&self->_dismissalObservers, 0);
  objc_storeStrong((id *)&self->_preserveSecureAppAssertions, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerView, 0);
  objc_storeStrong((id *)&self->_wallpaperFloatingLayerViewContainerView, 0);
  objc_storeStrong(&self->_ppt_transitionEndsCallback, 0);
  objc_storeStrong(&self->_ppt_transitionBeginsCallback, 0);
  objc_storeStrong((id *)&self->_keyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_requireWallpaperAssertion, 0);
  objc_storeStrong((id *)&self->_suspendWallpaperAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_storeStrong((id *)&self->_flyInSettings, 0);
  objc_storeStrong((id *)&self->_systemApertureCoverSheetAssertion, 0);
  objc_storeStrong(&self->_iconAnimatorCompletionBlock, 0);
  objc_storeStrong((id *)&self->_iconAnimatorCompletionGroup, 0);
  objc_storeStrong((id *)&self->_iconAnimator, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_activeInterfaceOrientationChangeAssertion, 0);
  objc_storeStrong((id *)&self->_asynchronousRenderingAssertion, 0);
  objc_destroyWeak((id *)&self->_transitionSettings);
  objc_storeStrong((id *)&self->_rubberBandFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_lockScreenSettings, 0);
  objc_storeStrong((id *)&self->_lockUnlockQueue, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong(&self->_secureAppCleanupHandler, 0);
  objc_storeStrong((id *)&self->_secureAppEnvironmentViewController, 0);
  objc_storeStrong((id *)&self->_secureAppWindowVisibleReasons, 0);
  objc_storeStrong((id *)&self->_coverSheetWindowVisibleReasons, 0);
  objc_storeStrong((id *)&self->_mainWorkspace, 0);
  objc_storeStrong((id *)&self->_secureAppViewController, 0);
  objc_storeStrong((id *)&self->_lockScreenEnvironment, 0);
  objc_destroyWeak((id *)&self->_pearlMatchingStateProvider);
  objc_storeStrong((id *)&self->_uiLockStateProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secureAppSlidingViewController, 0);
  objc_storeStrong((id *)&self->_secureAppWindow, 0);
  objc_storeStrong((id *)&self->_coverSheetWindow, 0);
}

- (void)coverSheetSlidingViewController:(os_log_t)log animateForGestureActive:(double)a2 withProgress:beginBlock:endBlock:.cold.1(os_log_t log, double a2)
{
  int v2;
  double v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a2;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "animateForGestureActive withProgress: %.2f", (uint8_t *)&v2, 0xCu);
}

@end
