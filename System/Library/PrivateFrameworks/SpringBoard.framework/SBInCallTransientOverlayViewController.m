@implementation SBInCallTransientOverlayViewController

- (SBInCallTransientOverlayViewController)initWithSceneHandle:(id)a3 shouldPreferContinuityDisplay:(BOOL)a4
{
  id v7;
  SBInCallTransientOverlayViewController *v8;
  SBInCallTransientOverlayViewController *v9;
  id *p_sceneHandle;
  void *v11;
  uint64_t v12;
  SBInCallSettings *settings;
  SBIdleTimerCoordinatorHelper *v14;
  SBIdleTimerCoordinatorHelper *idleTimerCoordinatorHelper;
  void *v16;
  objc_super v18;

  v7 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBInCallTransientOverlayViewController;
  v8 = -[SBTransientOverlayViewController initWithNibName:bundle:](&v18, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    p_sceneHandle = (id *)&v8->_sceneHandle;
    objc_storeStrong((id *)&v8->_sceneHandle, a3);
    v9->_preferContinuityDisplay = a4;
    objc_msgSend(*p_sceneHandle, "addObserver:", v9);
    objc_msgSend(*p_sceneHandle, "statusBarStateProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addStatusBarObserver:", v9);

    +[SBInCallDomain rootSettings](SBInCallDomain, "rootSettings");
    v12 = objc_claimAutoreleasedReturnValue();
    settings = v9->_settings;
    v9->_settings = (SBInCallSettings *)v12;

    v14 = -[SBIdleTimerCoordinatorHelper initWithSourceProvider:]([SBIdleTimerCoordinatorHelper alloc], "initWithSourceProvider:", v9);
    idleTimerCoordinatorHelper = v9->_idleTimerCoordinatorHelper;
    v9->_idleTimerCoordinatorHelper = v14;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v9, sel_setNeedsGestureDismissalStyleUpdate, *MEMORY[0x1E0DBD4D8], 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  if (-[SBInCallTransientOverlayViewController isViewLoaded](self, "isViewLoaded"))
    -[SBInCallTransientOverlayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_sceneViewController);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DBD4D8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController dealloc](&v4, sel_dealloc);
}

- (id)hostedSceneIdentityTokens
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "identityToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canResignFirstResponder
{
  return 1;
}

- (int)serviceProcessIdentifier
{
  void *v2;
  void *v3;
  int v4;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "clientProcess");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "pid");

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  void *v2;
  int64_t v3;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _SBStatusBarLegacyStyleFromStyle(objc_msgSend(v2, "statusBarStyle"));

  return v3;
}

- (BOOL)prefersStatusBarHidden
{
  void *v2;
  char v3;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "statusBarHidden") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "statusBarAlpha");
    v3 = BSFloatLessThanOrEqualToFloat();
  }

  return v3;
}

- (int64_t)preferredWhitePointAdaptivityStyle
{
  return -[SBDeviceApplicationSceneHandle whitePointAdaptivityStyle](self->_sceneHandle, "whitePointAdaptivityStyle");
}

- (unint64_t)supportedInterfaceOrientations
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v3 = objc_opt_class();
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "supportedInterfaceOrientations");
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "userInterfaceIdiom");

      if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
        v7 = 30;
      else
        v7 = 1 << objc_msgSend(v6, "interfaceOrientation");
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBInCallTransientOverlayViewController;
    v7 = -[SBTransientOverlayViewController supportedInterfaceOrientations](&v11, sel_supportedInterfaceOrientations);
  }

  return v7;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  int64_t v13;
  void *v14;
  SBApplicationSceneBackgroundView *existingSceneBackgroundView;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLayoutSubviews](&v16, sel_viewDidLayoutSubviews);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  v13 = -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation");
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v13, v13, v9, v11);
  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  existingSceneBackgroundView = self->_existingSceneBackgroundView;
  objc_msgSend(v14, "bounds");
  -[SBApplicationSceneBackgroundView setFrame:](existingSceneBackgroundView, "setFrame:");

}

- (void)viewDidLoad
{
  void *v3;
  SBDeviceApplicationSceneViewController *v4;
  SBDeviceApplicationSceneViewController *sceneViewController;
  double v6;
  double v7;
  double v8;
  double v9;
  int64_t v10;
  void *v11;
  void *v12;
  SBApplicationSceneBackgroundView *v13;
  SBApplicationSceneBackgroundView *existingSceneBackgroundView;
  _SBInCallProxySceneBackgroundView *v15;
  _SBInCallProxySceneBackgroundView *v16;
  _SBInCallProxySceneBackgroundView *proxySceneBackgroundView;
  _SBInCallProxySceneBackgroundView *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidLoad](&v20, sel_viewDidLoad);
  -[SBTransientOverlayViewController contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDeviceApplicationSceneHandle newSceneViewController](self->_sceneHandle, "newSceneViewController");
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v4;

  -[SBDeviceApplicationSceneViewController setRendersWhileLocked:](self->_sceneViewController, "setRendersWhileLocked:", 1);
  -[SBDeviceApplicationSceneViewController setHomeGrabberDisplayMode:](self->_sceneViewController, "setHomeGrabberDisplayMode:", 1);
  -[SBInCallTransientOverlayViewController addChildViewController:](self, "addChildViewController:", self->_sceneViewController);
  objc_msgSend(v3, "bounds");
  v7 = v6;
  v9 = v8;
  v10 = -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation");
  -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", v10, v10, v7, v9);
  -[SBDeviceApplicationSceneViewController view](self->_sceneViewController, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v11);

  -[SBTransientOverlayViewController backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeviceApplicationSceneViewController backgroundView](self->_sceneViewController, "backgroundView");
  v13 = (SBApplicationSceneBackgroundView *)objc_claimAutoreleasedReturnValue();
  existingSceneBackgroundView = self->_existingSceneBackgroundView;
  self->_existingSceneBackgroundView = v13;

  v15 = [_SBInCallProxySceneBackgroundView alloc];
  -[SBApplicationSceneBackgroundView frame](self->_existingSceneBackgroundView, "frame");
  v16 = -[_SBInCallProxySceneBackgroundView initWithFrame:proxyTarget:](v15, "initWithFrame:proxyTarget:", self->_existingSceneBackgroundView);
  proxySceneBackgroundView = self->_proxySceneBackgroundView;
  self->_proxySceneBackgroundView = v16;

  v18 = self->_proxySceneBackgroundView;
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SBInCallProxySceneBackgroundView setBackgroundColor:](v18, "setBackgroundColor:", v19);

  -[SBDeviceApplicationSceneViewController setBackgroundView:](self->_sceneViewController, "setBackgroundView:", self->_proxySceneBackgroundView);
  objc_msgSend(v12, "addSubview:", self->_existingSceneBackgroundView);
  -[SBDeviceApplicationSceneViewController didMoveToParentViewController:](self->_sceneViewController, "didMoveToParentViewController:", self);
  -[SBDeviceApplicationSceneViewController setDisplayMode:animationFactory:completion:](self->_sceneViewController, "setDisplayMode:animationFactory:completion:", 4, 0, 0);
  -[SBInCallTransientOverlayViewController _registerForAmbientPresentationTraitChange](self, "_registerForAmbientPresentationTraitChange");

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBInCallTransientOverlayViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallTransientOverlayViewController:willAppearAnimated:", self, v3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidAppear:](&v8, sel_viewDidAppear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallTransientOverlayViewController:didAppearAnimated:", self, v3);

  -[SBInCallTransientOverlayViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.025, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBInCallTransientOverlayViewController viewWillDisappear:](&v6, sel_viewWillDisappear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallTransientOverlayViewController:willDisappearAnimated:", self, v3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController viewDidDisappear:](&v6, sel_viewDidDisappear_);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallTransientOverlayViewController:didDisappearAnimated:", self, v3);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  objc_super v9;

  height = a3.height;
  width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SBInCallTransientOverlayViewController;
  v7 = a4;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __93__SBInCallTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E8E9EA28;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v8, 0);

}

void __93__SBInCallTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CEABB0], "_currentAnimationSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inCallTransientOverlayViewController:viewWillTransitionSizeWithAnimationSettings:", v2, v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (id)sceneDeactivationPredicate
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __68__SBInCallTransientOverlayViewController_sceneDeactivationPredicate__block_invoke;
    v6[3] = &unk_1E8EA3EA0;
    v7 = v2;
    v4 = (void *)MEMORY[0x1D17E5550](v6);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __68__SBInCallTransientOverlayViewController_sceneDeactivationPredicate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32)) ^ 1;

  return v4;
}

- (void)handleGestureDismissal
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "inCallTransientOverlayViewControllerRequestsDismissal:", self);

}

- (int64_t)preferredLockedGestureDismissalStyle
{
  if (-[SBInCallTransientOverlayViewController prefersHomeIndicatorAutoHidden](self, "prefersHomeIndicatorAutoHidden"))
    return 0;
  else
    return 2;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  if (-[SBInCallTransientOverlayViewController prefersHomeIndicatorAutoHidden](self, "prefersHomeIndicatorAutoHidden"))
    return 0;
  else
    return 2;
}

- (void)setShouldIgnoreHomeIndicatorAutoHiddenClientSettings:(BOOL)a3
{
  if (self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings != a3)
  {
    self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings = a3;
    -[SBTransientOverlayViewController setNeedsGestureDismissalStyleUpdate](self, "setNeedsGestureDismissalStyleUpdate");
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  char v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DBD1C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentCalls");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "isEmergency", (_QWORD)v13))
        {

          goto LABEL_12;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }

  if (self->_shouldAlwaysPreventHomeGestureDismissal)
  {
    v9 = 1;
  }
  else
  {
LABEL_12:
    if (self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings)
    {
      v9 = 0;
    }
    else
    {
      -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "clientSettings");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "transientOverlayHomeIndicatorAutoHidden");

    }
  }

  return v9;
}

- (BOOL)handleHomeButtonPress
{
  int64_t v3;
  NSObject *WeakRetained;
  _BOOL4 v5;
  uint8_t v7[16];
  uint8_t buf[16];

  v3 = -[SBInCallTransientOverlayViewController preferredLockedGestureDismissalStyle](self, "preferredLockedGestureDismissalStyle");
  SBLogInCallPresentation();
  WeakRetained = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_DEFAULT, "SBInCallTransientOverlayViewController is consuming home button press to dismiss overlay", v7, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject inCallTransientOverlayViewControllerRequestsDismissal:](WeakRetained, "inCallTransientOverlayViewControllerRequestsDismissal:", self);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, WeakRetained, OS_LOG_TYPE_DEFAULT, "SBInCallTransientOverlayViewController is consuming home button press to prevent dismissal", buf, 2u);
  }

  return 1;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  objc_super v4;

  if ((-[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_sceneHandle, "preferredHardwareButtonEventTypes") & 2) != 0)return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", 1);
  v4.receiver = self;
  v4.super_class = (Class)SBInCallTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleVolumeUpButtonPress](&v4, sel_handleVolumeUpButtonPress);
}

- (BOOL)handleVolumeDownButtonPress
{
  objc_super v4;

  if ((-[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_sceneHandle, "preferredHardwareButtonEventTypes") & 4) != 0)return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](self->_sceneHandle, "handleHardwareButtonEventType:", 2);
  v4.receiver = self;
  v4.super_class = (Class)SBInCallTransientOverlayViewController;
  return -[SBTransientOverlayViewController handleVolumeDownButtonPress](&v4, sel_handleVolumeDownButtonPress);
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  SBDeviceApplicationSceneHandle *sceneHandle;
  uint64_t v7;
  objc_super v9;

  v3 = a3;
  v5 = -[SBDeviceApplicationSceneHandle preferredHardwareButtonEventTypes](self->_sceneHandle, "preferredHardwareButtonEventTypes");
  if (!v3)
  {
    if ((v5 & 8) != 0)
    {
      sceneHandle = self->_sceneHandle;
      v7 = 3;
      return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](sceneHandle, "handleHardwareButtonEventType:", v7);
    }
LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)SBInCallTransientOverlayViewController;
    return -[SBTransientOverlayViewController handleHeadsetButtonPress:](&v9, sel_handleHeadsetButtonPress_, v3);
  }
  if ((v5 & 0x10) == 0)
    goto LABEL_5;
  sceneHandle = self->_sceneHandle;
  v7 = 4;
  return -[SBDeviceApplicationSceneHandle handleHardwareButtonEventType:](sceneHandle, "handleHardwareButtonEventType:", v7);
}

- (BOOL)isContentOpaque
{
  return 1;
}

- (BOOL)preventsSystemApertureSuppressionFromBelow
{
  return 1;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t v23;

  v3 = a2;
  v4 = objc_msgSend(v3, "isAnimated");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "transientOverlayFadeOutSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 0;
    objc_msgSend(v7, "dampingRatio");
    objc_msgSend(v7, "response");
    convertDampingRatioAndResponseToTensionAndFriction();
    v8 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 1.0, 0.0, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2;
    v20[3] = &unk_1E8E9DED8;
    v11 = v3;
    v21 = v11;
    objc_msgSend(v8, "animateWithSettings:actions:", v9, v20);

    v12 = (void *)MEMORY[0x1E0CEABB0];
    v17[0] = v10;
    v17[1] = 3221225472;
    v17[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3;
    v17[3] = &unk_1E8E9E820;
    v13 = v6;
    v14 = *(_QWORD *)(a1 + 32);
    v18 = v13;
    v19 = v14;
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4;
    v15[3] = &unk_1E8EA46E8;
    v16 = v11;
    objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v7, 3, v17, v15);

  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setAlpha:", 0.0);
    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
  }

}

uint64_t __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAlongsideTransitions");
}

uint64_t __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "setAlpha:", 0.0);
}

uint64_t __91__SBInCallTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  SBTransientOverlayBlockTransitionCoordinator *v3;
  _QWORD v5[5];

  v3 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke;
  v5[3] = &unk_1E8E9E9A8;
  v5[4] = self;
  -[SBTransientOverlayBlockTransitionCoordinator setStartTransitionHandler:](v3, "setStartTransitionHandler:", v5);
  return v3;
}

void __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "loadViewIfNeeded");
  v4 = objc_msgSend(v3, "isAnimated");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1416), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    v7 = (void *)MEMORY[0x1E0CEABB0];
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2;
    v27[3] = &unk_1E8E9E820;
    v9 = v5;
    v10 = *(_QWORD *)(a1 + 32);
    v28 = v9;
    v29 = v10;
    objc_msgSend(v7, "_performWithoutRetargetingAnimations:", v27);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1424), "transientOverlayFadeInSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v24[0] = v8;
    v24[1] = 3221225472;
    v24[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3;
    v24[3] = &unk_1E8E9E820;
    v13 = v9;
    v14 = *(_QWORD *)(a1 + 32);
    v25 = v13;
    v26 = v14;
    v22[0] = v8;
    v22[1] = 3221225472;
    v22[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4;
    v22[3] = &unk_1E8EA46E8;
    v15 = v3;
    v23 = v15;
    objc_msgSend(v12, "sb_animateWithSettings:mode:animations:completion:", v11, 3, v24, v22);
    v20 = 0;
    v21 = 0;
    objc_msgSend(v11, "dampingRatio");
    objc_msgSend(v11, "response");
    convertDampingRatioAndResponseToTensionAndFriction();
    v16 = (void *)MEMORY[0x1E0D01908];
    objc_msgSend(MEMORY[0x1E0D01870], "settingsWithMass:stiffness:damping:", 1.0, 0.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5;
    v18[3] = &unk_1E8E9DED8;
    v19 = v15;
    objc_msgSend(v16, "animateWithSettings:actions:", v17, v18);

  }
  else
  {
    objc_msgSend(v5, "setAlpha:", 1.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "setAlpha:", 1.0);
    objc_msgSend(v3, "performAlongsideTransitions");
    objc_msgSend(v3, "completeTransition:", 1);
  }

}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "setAlpha:", 0.0);
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1384), "setAlpha:", 1.0);
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", 1);
}

uint64_t __94__SBInCallTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performAlongsideTransitions");
}

- (id)preferredDisplayLayoutElementIdentifier
{
  void *v2;
  void *v3;

  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)preferredBackgroundActivitiesToSuppress
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundActivitiesToSuppress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setContainerOrientation:(int64_t)a3
{
  int64_t v5;
  SBDeviceApplicationSceneViewController *sceneViewController;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v5 = -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation");
  v10.receiver = self;
  v10.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController setContainerOrientation:](&v10, sel_setContainerOrientation_, a3);
  if (v5 != -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation"))
  {
    sceneViewController = self->_sceneViewController;
    -[SBTransientOverlayViewController contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    -[SBSceneViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](sceneViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a3, a3, v8, v9);

  }
}

- (void)setIdleTimerCoordinator:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBInCallTransientOverlayViewController;
  v4 = a3;
  -[SBTransientOverlayViewController setIdleTimerCoordinator:](&v5, sel_setIdleTimerCoordinator_, v4);
  -[SBIdleTimerCoordinatorHelper setTargetCoordinator:](self->_idleTimerCoordinatorHelper, "setTargetCoordinator:", v4, v5.receiver, v5.super_class);

}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return 1;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  SBDeviceApplicationSceneHandle *sceneHandle;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  sceneHandle = self->_sceneHandle;
  v4 = a3;
  -[SBDeviceApplicationSceneHandle sceneIfExists](sceneHandle, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identityToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", v4);

  return v8;
}

- (id)keyboardFocusTarget
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusTarget targetForFBScene:](SBKeyboardFocusTarget, "targetForFBScene:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldDisableBanners
{
  SBInCallTransientOverlayViewController *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "inCallTransientOverlayViewControllerShouldPreventBannerPresentations:", v2);

  return (char)v2;
}

- (BOOL)supportsAlwaysOnDisplay
{
  SBInCallTransientOverlayViewController *v2;
  id WeakRetained;

  v2 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v2) = objc_msgSend(WeakRetained, "inCallTransientOverlayViewControllerShouldSupportAlwaysOnDisplay:", v2);

  return (char)v2;
}

- (id)associatedBundleIdentifiersToSuppressInSystemAperture
{
  void *v2;
  void *v3;
  void *v4;

  -[SBApplicationSceneHandle application](self->_sceneHandle, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)associatedSceneIdentifiersToSuppressInSystemAperture
{
  void *v2;
  void *v3;

  -[SBDeviceApplicationSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return 1;
}

- (BOOL)prefersContinuityDisplayPresentation
{
  return self->_preferContinuityDisplay;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBInCallTransientOverlayViewController;
  -[SBTransientOverlayViewController succinctDescriptionBuilder](&v6, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", self->_sceneViewController, CFSTR("sceneViewController"), 1);
  return v3;
}

- (void)invalidate
{
  void *v3;

  -[SBDeviceApplicationSceneViewController invalidate](self->_sceneViewController, "invalidate");
  -[_SBInCallProxySceneBackgroundView setProxyTarget:](self->_proxySceneBackgroundView, "setProxyTarget:", 0);
  -[SBSUIInCallSceneClientSettingsDiffInspector removeAllObservers](self->_inCallSceneClientSettingsDiffInspector, "removeAllObservers");
  -[SBDeviceApplicationSceneHandle statusBarStateProvider](self->_sceneHandle, "statusBarStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeStatusBarObserver:", self);

  -[SBDeviceApplicationSceneHandle removeObserver:](self->_sceneHandle, "removeObserver:", self);
}

- (id)idleTimerProvider:(id)a3 didProposeBehavior:(id)a4 forReason:(id)a5
{
  return -[SBIdleTimerCoordinatorHelper proposeIdleTimerBehavior:fromProvider:reason:](self->_idleTimerCoordinatorHelper, "proposeIdleTimerBehavior:fromProvider:reason:", a4, a3, a5);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = objc_opt_class();
  -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clientSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "idleTimerDisabled"))
  {
    +[SBIdleTimerBehavior disabledBehavior](SBIdleTimerBehavior, "disabledBehavior");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = objc_opt_class();
    -[SBDeviceApplicationSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "prefersLockedIdleDurationOnCoversheet"))
    {
      if (objc_msgSend(v12, "isBeingShownAboveCoverSheet"))
        v13 = 1;
      else
        v13 = 12;
    }
    else
    {
      v13 = 12;
    }
    +[SBIdleTimerBehavior behaviorWithDuration:mode:warnMode:](SBIdleTimerBehavior, "behaviorWithDuration:mode:warnMode:", v13, 1, 2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[SBInCallTransientOverlayViewController _inCallSceneClientSettingsDiffInspector](self, "_inCallSceneClientSettingsDiffInspector");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inspectDiff:withContext:", v6, 0);

}

- (id)_inCallSceneClientSettingsDiffInspector
{
  SBSUIInCallSceneClientSettingsDiffInspector *inCallSceneClientSettingsDiffInspector;
  SBSUIInCallSceneClientSettingsDiffInspector *v4;
  SBSUIInCallSceneClientSettingsDiffInspector *v5;
  SBSUIInCallSceneClientSettingsDiffInspector *v6;
  uint64_t v7;
  SBSUIInCallSceneClientSettingsDiffInspector *v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  if (!inCallSceneClientSettingsDiffInspector)
  {
    v4 = (SBSUIInCallSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0DAC4D0]);
    v5 = self->_inCallSceneClientSettingsDiffInspector;
    self->_inCallSceneClientSettingsDiffInspector = v4;

    objc_initWeak(&location, self);
    v6 = self->_inCallSceneClientSettingsDiffInspector;
    v7 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke;
    v12[3] = &unk_1E8EA2658;
    objc_copyWeak(&v13, &location);
    -[SBSUIInCallSceneClientSettingsDiffInspector observeTransientOverlayHomeIndicatorAutoHiddenWithBlock:](v6, "observeTransientOverlayHomeIndicatorAutoHiddenWithBlock:", v12);
    v8 = self->_inCallSceneClientSettingsDiffInspector;
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke_2;
    v10[3] = &unk_1E8EA2658;
    objc_copyWeak(&v11, &location);
    -[SBSUIInCallSceneClientSettingsDiffInspector observePrefersLockedIdleDurationOnCoversheet:](v8, "observePrefersLockedIdleDurationOnCoversheet:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
    inCallSceneClientSettingsDiffInspector = self->_inCallSceneClientSettingsDiffInspector;
  }
  return inCallSceneClientSettingsDiffInspector;
}

void __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsGestureDismissalStyleUpdate");

}

void __81__SBInCallTransientOverlayViewController__inCallSceneClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsIdleTimerReset");

}

- (void)_registerForAmbientPresentationTraitChange
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id location;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[SBInCallTransientOverlayViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);

  v4 = objc_loadWeakRetained(&location);
  -[SBInCallTransientOverlayViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAmbientPresented");
  -[SBInCallTransientOverlayViewController traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:ambientDisplayStyle:", v6, objc_msgSend(v7, "ambientDisplayStyle"));

  objc_opt_self();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_opt_self();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__SBInCallTransientOverlayViewController__registerForAmbientPresentationTraitChange__block_invoke;
  v12[3] = &unk_1E8EAC8B0;
  objc_copyWeak(&v13, &location);
  v11 = (id)-[SBInCallTransientOverlayViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v10, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __84__SBInCallTransientOverlayViewController__registerForAmbientPresentationTraitChange__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  id v11;

  v11 = a3;
  v5 = a2;
  objc_msgSend(v5, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isAmbientPresented");

  LODWORD(v6) = objc_msgSend(v11, "isAmbientPresented");
  objc_msgSend(v5, "traitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "ambientDisplayStyle");
  if ((_DWORD)v7 != (_DWORD)v6 || v9 != objc_msgSend(v11, "ambientDisplayStyle"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "inCallTransientOverlayViewControllerDidUpdateAmbientPresentationIsAmbientPresented:ambientDisplayStyle:", v7, v9);

  }
}

- (SBDeviceApplicationSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (SBInCallTransientOverlayViewControllerDelegate)delegate
{
  return (SBInCallTransientOverlayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldIgnoreHomeIndicatorAutoHiddenClientSettings
{
  return self->_shouldIgnoreHomeIndicatorAutoHiddenClientSettings;
}

- (BOOL)shouldAlwaysPreventHomeGestureDismissal
{
  return self->_shouldAlwaysPreventHomeGestureDismissal;
}

- (void)setShouldAlwaysPreventHomeGestureDismissal:(BOOL)a3
{
  self->_shouldAlwaysPreventHomeGestureDismissal = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_proxySceneBackgroundView, 0);
  objc_storeStrong((id *)&self->_inCallSceneClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_idleTimerCoordinatorHelper, 0);
  objc_storeStrong((id *)&self->_existingSceneBackgroundView, 0);
}

@end
