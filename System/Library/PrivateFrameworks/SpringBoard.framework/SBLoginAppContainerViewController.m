@implementation SBLoginAppContainerViewController

- (id)_initWithSceneHoster:(id)a3 wallpaperController:(id)a4
{
  return -[SBLoginAppContainerViewController initWithNibName:bundle:sceneHoster:wallpaperController:](self, "initWithNibName:bundle:sceneHoster:wallpaperController:", 0, 0, a3, a4);
}

- (SBLoginAppContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  SBLoginAppSceneHoster *v8;
  void *v9;
  SBLoginAppContainerViewController *v10;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(SBLoginAppSceneHoster);
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SBLoginAppContainerViewController initWithNibName:bundle:sceneHoster:wallpaperController:](self, "initWithNibName:bundle:sceneHoster:wallpaperController:", v7, v6, v8, v9);

  return v10;
}

- (SBLoginAppContainerViewController)initWithNibName:(id)a3 bundle:(id)a4 sceneHoster:(id)a5 wallpaperController:(id)a6
{
  id v11;
  id v12;
  SBLoginAppContainerViewController *v13;
  void *v14;
  uint64_t v15;
  NSMutableSet *showStatusBarReasons;
  SBLockScreenPluginManager *v17;
  SBLockScreenPluginManager *pluginManager;
  objc_super v20;

  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SBLoginAppContainerViewController;
  v13 = -[SBLoginAppContainerViewController initWithNibName:bundle:](&v20, sel_initWithNibName_bundle_, a3, a4);
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v13, sel__handleBacklightFadeEnded, *MEMORY[0x1E0DAC2F0], 0);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = objc_claimAutoreleasedReturnValue();
    showStatusBarReasons = v13->_showStatusBarReasons;
    v13->_showStatusBarReasons = (NSMutableSet *)v15;

    objc_storeStrong((id *)&v13->_sceneHoster, a5);
    -[SBLoginAppSceneHoster setDelegate:](v13->_sceneHoster, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_wallpaperController, a6);
    -[SBWallpaperController addObserver:forVariant:](v13->_wallpaperController, "addObserver:forVariant:", v13, 0);
    v13->_idleTimerMode = 0;
    v17 = objc_alloc_init(SBLockScreenPluginManager);
    pluginManager = v13->_pluginManager;
    v13->_pluginManager = v17;

    -[SBLockScreenPluginManager setDelegate:](v13->_pluginManager, "setDelegate:", v13);
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forVariant:", self, 0);

  -[SBLoginAppContainerViewController _reallyRelinquishStatusBarAssertion](self, "_reallyRelinquishStatusBarAssertion");
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLoginAppContainerViewController dealloc](&v4, sel_dealloc);
}

- (void)addLoginObserver:(id)a3
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

- (void)removeLoginObserver:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v6;
    if (v5)
    {
      -[NSHashTable removeObject:](self->_observers, "removeObject:", v6);
      v4 = v6;
    }
  }

}

- (void)loadView
{
  SBLoginAppContainerView *v3;
  SBLoginAppContainerView *v4;

  v3 = [SBLoginAppContainerView alloc];
  v4 = -[SBLoginAppContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[SBLoginAppContainerView setAutoresizingMask:](v4, "setAutoresizingMask:", 18);
  -[SBLoginAppContainerView setAutoresizesSubviews:](v4, "setAutoresizesSubviews:", 1);
  -[SBLoginAppContainerViewController setView:](self, "setView:", v4);
  -[SBLoginAppContainerViewController _updateLegibility](self, "_updateLegibility");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLoginAppContainerViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  -[SBLockScreenPluginManager setEnabled:](self->_pluginManager, "setEnabled:", 1);
  -[SBLoginAppContainerViewController _showOrHideThermalTrapUIAnimated:](self, "_showOrHideThermalTrapUIAnimated:", 0);
  +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInLostMode"))
    objc_msgSend(v4, "enableLostModePlugin");

}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLoginAppContainerViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[SBLockScreenPluginManager setEnabled:](self->_pluginManager, "setEnabled:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  SBLoginAppSceneHoster *sceneHoster;
  id v9;
  _QWORD v10[4];
  id v11;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLockScreenViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  sceneHoster = self->_sceneHoster;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__SBLoginAppContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E8EB78F0;
  v11 = v7;
  v9 = v7;
  -[SBLoginAppSceneHoster updateSettingsWithTransitionBlock:](sceneHoster, "updateSettingsWithTransitionBlock:", v10);

}

id __88__SBLoginAppContainerViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CEA350];
  v4 = a2;
  objc_msgSend(v3, "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D016B0];
  objc_msgSend(*(id *)(a1 + 32), "transitionDuration");
  objc_msgSend(v6, "settingsWithDuration:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationSettings:", v7);

  objc_msgSend(MEMORY[0x1E0CEA918], "_synchronizedDrawingFence");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnimationFence:", v8);

  SBFWindowForViewControllerTransition();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(v9, "_toWindowOrientation"));

  return v5;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLoginAppContainerViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
    -[SBLoginAppContainerViewController _reallyAcquireStatusBarAssertionIfNecessaryInitiallyVisible:](self, "_reallyAcquireStatusBarAssertionIfNecessaryInitiallyVisible:", 1);
  else
    -[SBLoginAppContainerViewController _reallyRelinquishStatusBarAssertion](self, "_reallyRelinquishStatusBarAssertion");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)willUIUnlockFromSource:(int)a3
{
  return 0;
}

- (BOOL)canBeDeactivatedForUIUnlockFromSource:(int)a3
{
  return 0;
}

- (BOOL)requiresPasscodeInputForUIUnlockFromSource:(int)a3 withOptions:(id)a4
{
  return 0;
}

- (void)noteDeviceBlockedStatusUpdated
{
  id v3;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBLoginAppContainerViewController _showOrHideThermalTrapUIAnimated:](self, "_showOrHideThermalTrapUIAnimated:", objc_msgSend(v3, "screenIsOn"));

}

- (void)startLockScreenFadeInAnimationForSource:(int)a3
{
  void *v4;
  char v5;
  uint64_t v6;
  id v7;

  if ((a3 - 21) <= 1 && !self->_batteryChargingViewController)
    -[SBLoginAppContainerViewController _updateBatteryChargingViewAnimated:](self, "_updateBatteryChargingViewAnimated:", 0);
  +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "screenIsOn") & 1) != 0)
    goto LABEL_7;
  v5 = objc_msgSend(v7, "isWakeAnimationInProgress");

  if ((v5 & 1) == 0)
  {
    v6 = SBUIConvertUnlockSourceToBacklightChangeSource();
    -[SBLockScreenViewControllerBase legacyWallpaperWakeAnimator](self, "legacyWallpaperWakeAnimator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "prepareToWakeForSource:timeAlpha:statusBarAlpha:target:dateView:completion:", v6, v4, 0, 0, 0.0, 0.0);
LABEL_7:

  }
}

- (void)enableLockScreenPluginWithContext:(id)a3
{
  id v4;
  void *v5;
  int v6;
  SBLoginAppContainerPluginWrapperViewController *v7;
  void *v8;
  SBLoginAppContainerPluginWrapperViewController *v9;
  SBLoginAppContainerPluginWrapperViewController *pluginWrapperViewController;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("FindMyiPhoneLockScreen"));

  if (v6
    && !self->_pluginWrapperViewController
    && -[SBLockScreenPluginManager enableLockScreenPluginWithContext:](self->_pluginManager, "enableLockScreenPluginWithContext:", v4))
  {
    v7 = [SBLoginAppContainerPluginWrapperViewController alloc];
    -[SBLockScreenPluginManager activePlugin](self->_pluginManager, "activePlugin");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBLoginAppContainerPluginWrapperViewController initWithPlugin:](v7, "initWithPlugin:", v8);
    pluginWrapperViewController = self->_pluginWrapperViewController;
    self->_pluginWrapperViewController = v9;

    -[SBLoginAppContainerViewController addChildViewController:](self, "addChildViewController:", self->_pluginWrapperViewController);
    -[SBLoginAppContainerViewController loginContainerView](self, "loginContainerView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLoginAppContainerPluginWrapperViewController view](self->_pluginWrapperViewController, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setPluginView:", v12);

    -[SBLoginAppContainerPluginWrapperViewController didMoveToParentViewController:](self->_pluginWrapperViewController, "didMoveToParentViewController:", self);
    -[SBLoginAppContainerPluginWrapperViewController view](self->_pluginWrapperViewController, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__SBLoginAppContainerViewController_enableLockScreenPluginWithContext___block_invoke;
    v14[3] = &unk_1E8E9DED8;
    v14[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v14, 0.5);
  }

}

void __71__SBLoginAppContainerViewController_enableLockScreenPluginWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(*(id *)(a1 + 32), "loginContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentHidden:forRequester:", 1, CFSTR("LockScreenPlugin"));

}

- (void)disableLockScreenPluginWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  _QWORD v11[5];

  v4 = a3;
  v5 = v4;
  if (self->_pluginWrapperViewController)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("FindMyiPhoneLockScreen"));

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CEABB0];
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke;
      v11[3] = &unk_1E8E9DED8;
      v11[4] = self;
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke_2;
      v9[3] = &unk_1E8E9DEB0;
      v9[4] = self;
      v10 = v5;
      objc_msgSend(v8, "animateWithDuration:animations:completion:", v11, v9, 0.5);

    }
  }

}

void __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "loginContainerView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentHidden:forRequester:", 0, CFSTR("LockScreenPlugin"));

}

uint64_t __72__SBLoginAppContainerViewController_disableLockScreenPluginWithContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "loginContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPluginView:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "removeFromParentViewController");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1048);
  *(_QWORD *)(v3 + 1048) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "disableLockScreenPluginWithContext:", *(_QWORD *)(a1 + 40));
}

- (BOOL)handleHomeButtonDoublePress
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[SBLoginAppSceneHoster hostedApp](self->_sceneHoster, "hostedApp");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "menuButtonInterceptApp");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2 == v3 && objc_msgSend(v4, "isRunning"))
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v2, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "intercepting menu button event and forwarding to %{public}@", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(v2, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBSendFakeHomeButtonTapEventToApplication(v8, objc_msgSend(v5, "pid"));

    objc_msgSend(v2, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBSendFakeHomeButtonTapEventToApplication(v9, objc_msgSend(v5, "pid"));

    if ((objc_msgSend((id)SBApp, "menuButtonInterceptAppEnabledForever") & 1) == 0)
      objc_msgSend((id)SBApp, "setMenuButtonInterceptApp:forever:", 0, 0);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)handleVolumeUpButtonPress
{
  objc_super v4;

  if (-[SBLoginAppContainerPluginWrapperViewController handleVolumeUpButtonPress](self->_pluginWrapperViewController, "handleVolumeUpButtonPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  return -[SBLockScreenViewControllerBase handleVolumeUpButtonPress](&v4, sel_handleVolumeUpButtonPress);
}

- (BOOL)handleVolumeDownButtonPress
{
  objc_super v4;

  if (-[SBLoginAppContainerPluginWrapperViewController handleVolumeDownButtonPress](self->_pluginWrapperViewController, "handleVolumeDownButtonPress"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)SBLoginAppContainerViewController;
  return -[SBLockScreenViewControllerBase handleVolumeDownButtonPress](&v4, sel_handleVolumeDownButtonPress);
}

- (BOOL)shouldShowLockStatusBarTime
{
  return 1;
}

- (BOOL)shouldDisableALS
{
  return 0;
}

- (id)_displayLayoutElementIdentifier
{
  return (id)*MEMORY[0x1E0DAB680];
}

- (BOOL)suppressesScreenshots
{
  return 1;
}

- (void)prepareForUILock
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLockScreenViewControllerBase prepareForUILock](&v3, sel_prepareForUILock);
  -[SBLoginAppContainerViewController _setupLoginScene](self, "_setupLoginScene");
  -[SBLoginAppSceneHoster setDeferHIDEvents:](self->_sceneHoster, "setDeferHIDEvents:", 1);
}

- (void)prepareForUIUnlock
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBLoginAppContainerViewController;
  -[SBLockScreenViewControllerBase prepareForUIUnlock](&v3, sel_prepareForUIUnlock);
  -[SBLoginAppSceneHoster setDeferHIDEvents:](self->_sceneHoster, "setDeferHIDEvents:", 0);
}

- (BOOL)suppressesControlCenter
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D14578], "standardDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldAlwaysBeEnabled") ^ 1;

  return v3;
}

- (void)_killLoginApp
{
  -[SBLoginAppSceneHoster killLoginApp](self->_sceneHoster, "killLoginApp");
}

- (id)_hostedAppBundleID
{
  return -[SBLoginAppSceneHoster hostedAppBundleID](self->_sceneHoster, "hostedAppBundleID");
}

- (id)_hostedAppView
{
  return -[SBLoginAppSceneHoster contentView](self->_sceneHoster, "contentView");
}

- (id)_hostedSceneIdentifier
{
  return -[SBLoginAppSceneHoster hostedSceneIdentifier](self->_sceneHoster, "hostedSceneIdentifier");
}

- (id)_statusBarSettingsAssertion
{
  return self->_statusBarAssertion;
}

- (void)_reallyAcquireStatusBarAssertionIfNecessaryInitiallyVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  SBWindowSceneStatusBarSettingsAssertion *v8;
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;
  id v10;

  if (!self->_statusBarAssertion)
  {
    v3 = a3;
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "statusBarManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assertionManager");
      v10 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (SBWindowSceneStatusBarSettingsAssertion *)objc_msgSend(v10, "newSettingsAssertionWithStatusBarHidden:atLevel:reason:", !v3, 10, CFSTR("login"));
      statusBarAssertion = self->_statusBarAssertion;
      self->_statusBarAssertion = v8;

      -[SBWindowSceneStatusBarSettingsAssertion acquire](self->_statusBarAssertion, "acquire");
    }
  }
}

- (void)_reallyRelinquishStatusBarAssertion
{
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;

  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_statusBarAssertion, "invalidate");
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;

}

- (void)_setupLoginScene
{
  void *v3;
  void *v4;
  uint64_t v5;
  SBLoginAppSceneHoster *sceneHoster;
  id v7;
  _QWORD v8[4];
  id v9;
  SBLoginAppContainerViewController *v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D229C0]), "initWithEventQueue:reason:", v3, CFSTR("Launch LoginUI"));
  v5 = -[SBLoginAppContainerViewController interfaceOrientation](self, "interfaceOrientation");
  sceneHoster = self->_sceneHoster;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke;
  v8[3] = &unk_1E8EB7918;
  v9 = v4;
  v10 = self;
  v11 = v5;
  v7 = v4;
  -[SBLoginAppSceneHoster launchLoginAppWithInitialOrientation:completion:](sceneHoster, "launchLoginAppWithInitialOrientation:completion:", v5, v8);

}

void __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  dispatch_time_t v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v20;
  uint64_t v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogWorkspace();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v29 = a2;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "LoginUI app activation completed: %d", buf, 8u);
  }

  objc_msgSend(*(id *)(a1 + 32), "relinquish");
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 40), "loginContainerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1024), "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentView:", v8);

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "allObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v13++), "loginAppDidFinishLaunching:", *(_QWORD *)(a1 + 40));
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v11);
    }

    if (objc_msgSend(*(id *)(a1 + 40), "interfaceOrientation") != *(_QWORD *)(a1 + 48))
    {
      v14 = *(_QWORD *)(a1 + 40);
      v15 = *(void **)(v14 + 1024);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_51;
      v22[3] = &unk_1E8EB78F0;
      v22[4] = v14;
      objc_msgSend(v15, "updateSettingsWithTransitionBlock:", v22);
    }
  }
  else
  {
    v16 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2;
    block[3] = &unk_1E8E9E820;
    v17 = v5;
    v18 = *(_QWORD *)(a1 + 40);
    v20 = v17;
    v21 = v18;
    dispatch_after(v16, MEMORY[0x1E0C80D38], block);

  }
}

id __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_51(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CEA350];
  v4 = a2;
  objc_msgSend(v3, "transitionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "interfaceOrientation"));

  return v5;
}

uint64_t __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  SBLogWorkspace();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 40), "_setupLoginScene");
}

- (void)sceneInvalidated
{
  dispatch_time_t v3;
  _QWORD block[5];

  v3 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke(uint64_t a1)
{
  NSObject *v2;

  SBLogWorkspace();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke_cold_1(v2);

  return objc_msgSend(*(id *)(a1 + 32), "_setupLoginScene");
}

- (void)sceneUpdatedIdleTimerMode:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  if (self->_idleTimerMode != a3)
  {
    self->_idleTimerMode = a3;
    -[SBLockScreenViewControllerBase idleTimerCoordinator](self, "idleTimerCoordinator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v7 = v4;
      -[SBLoginAppContainerViewController coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (id)objc_msgSend(v7, "idleTimerProvider:didProposeBehavior:forReason:", self, v5, CFSTR("SBLoginAppContainerViewControllerSceneUpdatedIdleTimerMode"));

      v4 = v7;
    }

  }
}

- (void)sceneUpdatedStatusBarUserName:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)SBApp;
  v4 = a3;
  objc_msgSend(v3, "statusBarStateAggregator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserNameOverride:", v4);

}

- (void)sceneUpdatedRotationMode:(int64_t)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *deferOrientationUpdatesAssertion;

  if (a3 == 1)
  {
    objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("LoginAppDisablingRotation"));
    v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v4;
  }
  else
  {
    -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;
  }

}

- (void)sceneUpdatedWallpaperMode:(unint64_t)a3
{
  uint64_t v3;

  if (a3)
  {
    if (a3 != 1)
      return;
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  -[SBWallpaperController _updateWallpaperForLocations:options:wallpaperMode:withCompletion:](self->_wallpaperController, "_updateWallpaperForLocations:options:wallpaperMode:withCompletion:", 1, 0, v3, 0);
}

- (void)_handleBacklightFadeEnded
{
  void *v3;
  char v4;

  +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "screenIsOn");

  if ((v4 & 1) == 0)
    -[SBLoginAppContainerViewController _cleanupBatteryChargingViewWithAnimationDuration:](self, "_cleanupBatteryChargingViewWithAnimationDuration:", 0.0);
}

- (void)_addBatteryChargingView
{
  SBLockScreenBatteryChargingViewController *batteryChargingViewController;
  SBLockScreenBatteryChargingViewController *v4;
  SBLockScreenBatteryChargingViewController *v5;
  void *v6;
  void *v7;

  batteryChargingViewController = self->_batteryChargingViewController;
  if (!batteryChargingViewController)
  {
    v4 = -[SBLockScreenBatteryChargingViewController initForDisplayOfBattery:]([SBLockScreenBatteryChargingViewController alloc], "initForDisplayOfBattery:", 1);
    v5 = self->_batteryChargingViewController;
    self->_batteryChargingViewController = v4;

    -[SBLockScreenBatteryChargingViewController setDelegate:](self->_batteryChargingViewController, "setDelegate:", self);
    batteryChargingViewController = self->_batteryChargingViewController;
  }
  -[SBLoginAppContainerViewController addChildViewController:](self, "addChildViewController:", batteryChargingViewController);
  -[SBLoginAppContainerViewController loginContainerView](self, "loginContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenBatteryChargingViewController chargingView](self->_batteryChargingViewController, "chargingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBatteryChargingView:", v7);

  -[SBLockScreenBatteryChargingViewController didMoveToParentViewController:](self->_batteryChargingViewController, "didMoveToParentViewController:", self);
}

- (void)_removeBatteryChargingView
{
  void *v3;
  SBLockScreenBatteryChargingViewController *batteryChargingViewController;

  -[SBLockScreenBatteryChargingViewController willMoveToParentViewController:](self->_batteryChargingViewController, "willMoveToParentViewController:", 0);
  -[SBLoginAppContainerViewController loginContainerView](self, "loginContainerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBatteryChargingView:", 0);

  -[SBLockScreenBatteryChargingViewController removeFromParentViewController](self->_batteryChargingViewController, "removeFromParentViewController");
  batteryChargingViewController = self->_batteryChargingViewController;
  self->_batteryChargingViewController = 0;

}

- (void)_updateBatteryChargingViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  double v7;
  void *v8;
  _QWORD v9[6];
  _QWORD v10[5];

  v3 = a3;
  +[SBUIController sharedInstanceIfExists](SBUIController, "sharedInstanceIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isConnectedToExternalChargingSource");

  if (v6)
  {
    if (v3)
      v7 = 0.25;
    else
      v7 = 0.0;
    -[SBLoginAppContainerViewController _addBatteryChargingView](self, "_addBatteryChargingView");
    -[SBLockScreenBatteryChargingViewController showChargeLevelWithBatteryVisible:](self->_batteryChargingViewController, "showChargeLevelWithBatteryVisible:", 1);
    -[SBLockScreenBatteryChargingViewController view](self->_batteryChargingViewController, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 0.0);

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke;
    v10[3] = &unk_1E8E9DED8;
    v10[4] = self;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_2;
    v9[3] = &unk_1E8EAAB58;
    *(double *)&v9[5] = v7;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v10, v9, v7);
  }
  else if (self->_batteryChargingViewController)
  {
    -[SBLoginAppContainerViewController _cleanupBatteryChargingViewWithAnimationDuration:](self, "_cleanupBatteryChargingViewWithAnimationDuration:", 0.0);
  }
}

uint64_t __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeViewsForChargingViewVisible:", 1);
}

uint64_t __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_2(uint64_t a1)
{
  double v1;
  _QWORD v3[5];

  v1 = *(double *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_3;
  v3[3] = &unk_1E8E9DED8;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v3, v1);
}

void __72__SBLoginAppContainerViewController__updateBatteryChargingViewAnimated___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "view");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setAlpha:", 1.0);

}

- (void)_fadeViewsForChargingViewVisible:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBLoginAppContainerViewController loginContainerView](self, "loginContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentHidden:forRequester:", v3, CFSTR("ChargingView"));

}

- (void)_cleanupBatteryChargingViewWithAnimationDuration:(double)a3
{
  _QWORD v5[5];

  -[SBLockScreenBatteryChargingViewController prepareForDismissalWithAnimation:](self->_batteryChargingViewController, "prepareForDismissalWithAnimation:", 0);
  -[SBLoginAppContainerViewController _removeBatteryChargingView](self, "_removeBatteryChargingView");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __86__SBLoginAppContainerViewController__cleanupBatteryChargingViewWithAnimationDuration___block_invoke;
  v5[3] = &unk_1E8E9DED8;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, a3);
}

uint64_t __86__SBLoginAppContainerViewController__cleanupBatteryChargingViewWithAnimationDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fadeViewsForChargingViewVisible:", 0);
}

- (void)chargingViewControllerFadedOutContent:(id)a3
{
  -[SBLoginAppContainerViewController _cleanupBatteryChargingViewWithAnimationDuration:](self, "_cleanupBatteryChargingViewWithAnimationDuration:", a3, 0.25);
}

- (void)_showOrHideThermalTrapUIAnimated:(BOOL)a3
{
  double v4;
  void *v5;
  int v6;
  SBLockScreenTemperatureWarningViewController *thermalWarningViewController;
  SBLockScreenTemperatureWarningViewController *v8;
  SBLockScreenTemperatureWarningViewController *v9;
  void *v10;
  SBLoginAppContainerOverlayWrapperView *v11;
  SBLoginAppContainerOverlayWrapperView *v12;
  void *v13;
  void *v14;
  SBLoginAppContainerOverlayWrapperView *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  _QWORD v18[4];
  SBLoginAppContainerOverlayWrapperView *v19;
  SBLoginAppContainerViewController *v20;

  if (a3)
    v4 = 0.5;
  else
    v4 = 0.0;
  objc_msgSend((id)SBApp, "lockOutController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isThermallyBlocked");

  thermalWarningViewController = self->_thermalWarningViewController;
  if (v6)
  {
    if (!thermalWarningViewController)
    {
      v8 = -[SBLockScreenTemperatureWarningViewController initWithNibName:bundle:]([SBLockScreenTemperatureWarningViewController alloc], "initWithNibName:bundle:", 0, 0);
      v9 = self->_thermalWarningViewController;
      self->_thermalWarningViewController = v8;

      -[SBLockOverlayViewController overlayView](self->_thermalWarningViewController, "overlayView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = [SBLoginAppContainerOverlayWrapperView alloc];
      v12 = -[SBLoginAppContainerOverlayWrapperView initWithFrame:overlayView:](v11, "initWithFrame:overlayView:", v10, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      -[SBLoginAppContainerViewController addChildViewController:](self, "addChildViewController:", self->_thermalWarningViewController);
      -[SBLoginAppContainerViewController loginContainerView](self, "loginContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setThermalWarningView:", v12);

      -[SBLockScreenTemperatureWarningViewController didMoveToParentViewController:](self->_thermalWarningViewController, "didMoveToParentViewController:", self);
      -[SBLoginAppContainerOverlayWrapperView setAlpha:](v12, "setAlpha:", 0.0);
      v14 = (void *)MEMORY[0x1E0CEABB0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke;
      v18[3] = &unk_1E8E9E820;
      v19 = v12;
      v20 = self;
      v15 = v12;
      objc_msgSend(v14, "animateWithDuration:animations:", v18, v4);

    }
  }
  else if (thermalWarningViewController)
  {
    v16[4] = self;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_2;
    v17[3] = &unk_1E8E9DED8;
    v17[4] = self;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_3;
    v16[3] = &unk_1E8E9E980;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:completion:", v17, v16, v4);
  }
}

void __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "loginContainerView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setContentHidden:forRequester:", 1, CFSTR("ThermalTrap"));

}

void __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "loginContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thermalWarningView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", 0.0);

  objc_msgSend(*(id *)(a1 + 32), "loginContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentHidden:forRequester:", 0, CFSTR("ThermalTrap"));

}

void __70__SBLoginAppContainerViewController__showOrHideThermalTrapUIAnimated___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "loginContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setThermalWarningView:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1040), "removeFromParentViewController");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1040);
  *(_QWORD *)(v3 + 1040) = 0;

}

- (void)wallpaperLegibilitySettingsDidChange:(id)a3 forVariant:(int64_t)a4
{
  if (!a4)
    -[SBLoginAppContainerViewController _updateLegibility](self, "_updateLegibility", a3);
}

- (void)wallpaperDidChangeForVariant:(int64_t)a3
{
  if (!a3)
    -[SBLoginAppContainerViewController _updateLegibility](self, "_updateLegibility");
}

- (void)_updateLegibility
{
  void *v2;
  void *v3;
  id v4;

  -[SBLoginAppContainerViewController loginContainerView](self, "loginContainerView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "legibilitySettingsForVariant:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLegibilitySettings:", v3);

}

- (void)pluginManager:(id)a3 willUnloadPlugin:(id)a4
{
  id v6;
  SBLoginAppContainerPluginWrapperViewController *pluginWrapperViewController;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  pluginWrapperViewController = self->_pluginWrapperViewController;
  if (pluginWrapperViewController)
  {
    -[SBLoginAppContainerPluginWrapperViewController plugin](pluginWrapperViewController, "plugin");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v6)
    {
      v9 = (void *)MEMORY[0x1E0DAC230];
      objc_msgSend(v6, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "contextWithName:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLoginAppContainerViewController disableLockScreenPluginWithContext:](self, "disableLockScreenPluginWithContext:", v11);

    }
  }

}

- (BOOL)pluginManager:(id)a3 plugin:(id)a4 handleAction:(id)a5
{
  return 0;
}

- (BOOL)shouldAutoUnlockForSource:(int)a3
{
  return (a3 < 0x2A) & (0x20000800008uLL >> a3);
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  id v4;
  int64_t idleTimerMode;
  SBLoginAppContainerViewController *v6;

  v4 = a3;
  idleTimerMode = self->_idleTimerMode;
  if (idleTimerMode == 1)
  {
    +[SBIdleTimerBehavior lockScreenBehavior](SBIdleTimerBehavior, "lockScreenBehavior");
    v6 = (SBLoginAppContainerViewController *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (!idleTimerMode)
  {
    +[SBIdleTimerBehavior autoLockBehavior](SBIdleTimerBehavior, "autoLockBehavior");
    v6 = (SBLoginAppContainerViewController *)objc_claimAutoreleasedReturnValue();
LABEL_5:
    self = v6;
  }

  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_wallpaperController, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_showStatusBarReasons, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_pluginWrapperViewController, 0);
  objc_storeStrong((id *)&self->_thermalWarningViewController, 0);
  objc_storeStrong((id *)&self->_batteryChargingViewController, 0);
  objc_storeStrong((id *)&self->_sceneHoster, 0);
}

void __53__SBLoginAppContainerViewController__setupLoginScene__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to activate login scene, retrying; error = %@",
    (uint8_t *)&v3,
    0xCu);
}

void __53__SBLoginAppContainerViewController_sceneInvalidated__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Login scene invalidated", v1, 2u);
}

@end
