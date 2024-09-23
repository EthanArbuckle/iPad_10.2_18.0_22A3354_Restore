@implementation SBLockScreenViewControllerBase

- (void)viewDidLoad
{
  void *v3;
  id v4;
  void *v5;
  SBFLegacyWallpaperWakeAnimator *v6;
  SBFLegacyWallpaperWakeAnimator *legacyWallpaperWakeAnimator;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBLockScreenViewControllerBase;
  -[SBLockScreenViewControllerBase viewDidLoad](&v8, sel_viewDidLoad);
  -[SBLockScreenViewControllerBase view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CEABE8]);
  objc_msgSend(v3, "bounds");
  v5 = (void *)objc_msgSend(v4, "initWithFrame:");
  objc_msgSend(v5, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", v5);
  objc_msgSend(v3, "sendSubviewToBack:", v5);
  v6 = (SBFLegacyWallpaperWakeAnimator *)objc_alloc_init(MEMORY[0x1E0DA9E30]);
  legacyWallpaperWakeAnimator = self->_legacyWallpaperWakeAnimator;
  self->_legacyWallpaperWakeAnimator = v6;

  -[SBFLegacyWallpaperWakeAnimator setWakeEffectView:](self->_legacyWallpaperWakeAnimator, "setWakeEffectView:", v5);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[6];
  objc_super v14;

  height = a3.height;
  width = a3.width;
  v14.receiver = self;
  v14.super_class = (Class)SBLockScreenViewControllerBase;
  v6 = a4;
  -[SBLockScreenViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v14, sel_viewWillTransitionToSize_withTransitionCoordinator_, v6, width, height);
  SBFWindowForViewControllerTransition();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_toWindowOrientation");

  objc_msgSend(v6, "transitionDuration");
  v10 = v9;
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "orientationSource:willRotateToInterfaceOrientation:duration:", 3, v8, v10);

  v12[4] = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &__block_descriptor_48_e56_v16__0___UIViewControllerTransitionCoordinatorContext__8l;
  v13[4] = v8;
  *(double *)&v13[5] = v10;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v12[3] = &__block_descriptor_40_e56_v16__0___UIViewControllerTransitionCoordinatorContext__8l;
  objc_msgSend(v6, "animateAlongsideTransition:completion:", v13, v12);

}

void __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orientationSource:willAnimateRotationToInterfaceOrientation:duration:", 3, *(_QWORD *)(a1 + 32), *(double *)(a1 + 40));

}

void __85__SBLockScreenViewControllerBase_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orientationSource:didRotateFromInterfaceOrientation:", 3, *(_QWORD *)(a1 + 32));

}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBLockScreenViewControllerBase succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBLockScreenViewControllerBase descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)suppressesBanners
{
  return 1;
}

- (BOOL)suppressesControlCenter
{
  return 0;
}

- (BOOL)suppressesScreenshots
{
  return 0;
}

- (BOOL)isPasscodeLockVisible
{
  return 0;
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4
{
  -[SBLockScreenViewControllerBase setPasscodeLockVisible:animated:completion:](self, "setPasscodeLockVisible:animated:completion:", a3, a4, 0);
}

- (void)setPasscodeLockVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  if (a5)
    (*((void (**)(id))a5 + 2))(a5);
}

- (BOOL)isUnlockDisabled
{
  return 0;
}

- (void)prepareForUIUnlock
{
  id v2;

  +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resetIdleTimerForReason:", CFSTR("LS:PrepareForUIUnlock"));

}

- (void)prepareForUILock
{
  void *v3;
  int v4;
  void *v5;
  id v6;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenIsOn");

  if (v4)
  {
    +[SBIdleTimerGlobalCoordinator sharedInstance](SBIdleTimerGlobalCoordinator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resetIdleTimerForReason:", CFSTR("LS:PrepareForUILock"));

    -[SBLockScreenViewControllerBase setInScreenOffMode:](self, "setInScreenOffMode:", 0);
  }
  +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertUnlockedAlertsToLockedAlerts");

}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  return 1;
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  return 1;
}

- (BOOL)isMakingEmergencyCall
{
  return 0;
}

- (BOOL)isInScreenOffMode
{
  return 0;
}

- (void)setInScreenOffMode:(BOOL)a3
{
  -[SBLockScreenViewControllerBase setInScreenOffMode:forAutoUnlock:fromUnlockSource:](self, "setInScreenOffMode:forAutoUnlock:fromUnlockSource:", a3, 0, 0);
}

- (void)setInScreenOffMode:(BOOL)a3 forAutoUnlock:(BOOL)a4 fromUnlockSource:(int)a5
{
  void *v5;
  __CFString **v6;
  _QWORD *v7;
  void *v8;
  id v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithAnimation:", &__block_literal_global_402, a4, *(_QWORD *)&a5);
    +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forState:", 1, *MEMORY[0x1E0DAB708]);
    v6 = SBLockScreenDimmedNotification;
    v7 = (_QWORD *)MEMORY[0x1E0DAB6E8];
  }
  else
  {
    +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance", a3, a4, *(_QWORD *)&a5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forState:", 0, *MEMORY[0x1E0DAB708]);
    v6 = SBLockScreenUndimmedNotification;
    v7 = (_QWORD *)MEMORY[0x1E0DAB6F0];
  }

  +[SBEventObserverRegistry sharedInstance](SBEventObserverRegistry, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEventToInterestedObservers:", *v7);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "postNotificationName:object:", *v6, 0);

}

void __84__SBLockScreenViewControllerBase_setInScreenOffMode_forAutoUnlock_fromUnlockSource___block_invoke()
{
  id v0;

  objc_msgSend((id)SBApp, "HUDController");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissHUDs:", 1);

}

- (int64_t)backlightLuminance
{
  void *v2;
  int64_t v3;

  -[SBLockScreenViewControllerBase traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_backlightLuminance");

  return v3;
}

- (BOOL)handleHomeButtonPress
{
  return 0;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 1;
}

- (BOOL)handleHomeButtonLongPress
{
  return 0;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (BOOL)canHostAnApp
{
  return 0;
}

- (BOOL)isHostingAnApp
{
  return 0;
}

- (id)hostedAppSceneHandle
{
  return 0;
}

- (id)hostedAppSceneHandles
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (BOOL)contentOccludesBackground
{
  return 0;
}

- (BOOL)shouldDisableALS
{
  return 1;
}

- (BOOL)shouldShowLockStatusBarTime
{
  return 0;
}

- (SBFLockScreenActionContext)_customLockScreenActionContext
{
  return self->_customLockScreenActionContext;
}

- (void)setCustomLockScreenActionContext:(id)a3
{
  SBFLockScreenActionContext *v5;
  SBFLockScreenActionContext *v6;

  v5 = (SBFLockScreenActionContext *)a3;
  if (self->_customLockScreenActionContext != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_customLockScreenActionContext, a3);
    v5 = v6;
  }

}

- (BOOL)isShowingMediaControls
{
  return 0;
}

- (id)createHomeButtonShowPasscodeRecognizerForHomeButtonPress
{
  return 0;
}

- (id)createHomeButtonSuppressAfterUnlockRecognizerForUnlockSource:(int)a3
{
  return 0;
}

- (void)jiggleLockIcon
{
  void *v2;
  void *v3;
  id v4;

  -[UIViewController _sbWindowScene](self, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusBarManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "jiggleLockIcon");

}

- (BOOL)isMainPageVisible
{
  return 0;
}

- (BOOL)shouldUnlockUIOnKeyDownEvent
{
  return 1;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  return 0;
}

- (BOOL)shouldPresentOrDismissCoverSheetSpotlight
{
  return 0;
}

- (BOOL)isAuthenticated
{
  return self->_authenticated;
}

- (void)setAuthenticated:(BOOL)a3
{
  self->_authenticated = a3;
}

- (BOOL)expectsFaceContact
{
  return self->_expectsFaceContact;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  return (SBIdleTimerCoordinating *)objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
}

- (void)setIdleTimerCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_idleTimerCoordinator, a3);
}

- (double)backlightLevel
{
  return self->_backlightLevel;
}

- (void)setBacklightLevel:(double)a3
{
  self->_backlightLevel = a3;
}

- (SBBiometricUnlockBehaviorDelegate)biometricUnlockBehaviorDelegate
{
  return (SBBiometricUnlockBehaviorDelegate *)objc_loadWeakRetained((id *)&self->_biometricUnlockBehaviorDelegate);
}

- (void)setBiometricUnlockBehaviorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_biometricUnlockBehaviorDelegate, a3);
}

- (UIVisualEffectView)wakeEffectView
{
  return (UIVisualEffectView *)objc_loadWeakRetained((id *)&self->_wakeEffectView);
}

- (void)setWakeEffectView:(id)a3
{
  objc_storeWeak((id *)&self->_wakeEffectView, a3);
}

- (SBFLegacyWallpaperWakeAnimator)legacyWallpaperWakeAnimator
{
  return self->_legacyWallpaperWakeAnimator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyWallpaperWakeAnimator, 0);
  objc_destroyWeak((id *)&self->_wakeEffectView);
  objc_destroyWeak((id *)&self->_biometricUnlockBehaviorDelegate);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_customLockScreenActionContext, 0);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
}

@end
