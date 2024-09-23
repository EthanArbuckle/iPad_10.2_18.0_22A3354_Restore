@implementation SBDashBoardHostedAppViewController

- (BOOL)isHostingAnApp
{
  return -[SBAppViewController isHostingAnApp](self->_appViewController, "isHostingAnApp");
}

- (void)aggregateBehavior:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase aggregateBehavior:](&v13, sel_aggregateBehavior_, v4);
  +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secureAppAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInProcessAction");

  if ((v7 & 1) != 0
    || (+[SBThermalController sharedInstance](SBThermalController, "sharedInstance"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "level"),
        v8,
        (v9 & 0xFFFFFFFFFFFFFFFELL) != 2))
  {
    if (self->_wantsIdleTimerDisabled)
      v11 = 3;
    else
      v11 = 1;
    if (self->_wantsIdleTimerDisabled)
      v10 = 14;
    else
      v10 = 12;
    if (self->_wantsIdleTimerDisabled)
      v12 = 1;
    else
      v12 = 2;
  }
  else
  {
    v10 = 9;
    v11 = 1;
    v12 = 1;
  }
  objc_msgSend(v4, "setIdleTimerMode:", v11);
  objc_msgSend(v4, "setIdleTimerDuration:", v10);
  objc_msgSend(v4, "setIdleWarnMode:", v12);
  if (self->_overrideIdleWarnMode)
    objc_msgSend(v4, "setIdleWarnMode:");
  objc_msgSend(v4, "setNotificationBehavior:", 2);

}

void __100__SBDashBoardHostedAppViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  _BYTE *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "applicationSceneHandle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiClientSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[1105] = objc_msgSend(v4, "idleTimerDisabled");

    objc_msgSend(v5, "rebuildBehavior");
    WeakRetained = v5;
  }

}

- (SBApplicationSceneHandle)applicationSceneHandle
{
  return -[SBAppViewController sceneHandle](self->_appViewController, "sceneHandle");
}

- (SBApplicationSceneView)appView
{
  return -[SBAppViewController appView](self->_appViewController, "appView");
}

- (void)sceneHandle:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneClientSettingsDiffInspector *appClientSettingsDiffInspector;
  UIApplicationSceneClientSettingsDiffInspector *v12;
  UIApplicationSceneClientSettingsDiffInspector *v13;
  UIApplicationSceneClientSettingsDiffInspector *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    if (!appClientSettingsDiffInspector)
    {
      v12 = (UIApplicationSceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA328]);
      v13 = self->_appClientSettingsDiffInspector;
      self->_appClientSettingsDiffInspector = v12;

      objc_initWeak(&location, self);
      v14 = self->_appClientSettingsDiffInspector;
      v15 = MEMORY[0x1E0C809B0];
      v16 = 3221225472;
      v17 = __100__SBDashBoardHostedAppViewController_sceneHandle_didUpdateClientSettingsWithDiff_transitionContext___block_invoke;
      v18 = &unk_1E8EA2658;
      objc_copyWeak(&v19, &location);
      -[UIApplicationSceneClientSettingsDiffInspector observeIdleTimerDisabledWithBlock:](v14, "observeIdleTimerDisabledWithBlock:", &v15);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
      appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
    }
    objc_msgSend(v9, "evaluateWithInspector:context:", appClientSettingsDiffInspector, v10, v15, v16, v17, v18);
  }

}

- (void)applicationSceneHandle:(id)a3 appendToSceneSettings:(id)a4 fromRequestContext:(id)a5 entity:(id)a6
{
  void *v7;
  id v8;

  v8 = a4;
  -[SBDashBoardHostedAppViewController hostContextProvider](self, "hostContextProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "appendToHostedAppSceneSettings:", v8);

}

- (CSAppHostContextProviding)hostContextProvider
{
  return (CSAppHostContextProviding *)objc_loadWeakRetained((id *)&self->_hostContextProvider);
}

- (SBDashBoardHostedAppViewController)initWithApplicationSceneEntity:(id)a3
{
  id v5;
  SBDashBoardHostedAppViewController *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSString *cachedBasicPublicDescription;
  SBAppViewController *v14;
  void *v15;
  uint64_t v16;
  SBAppViewController *appViewController;
  void *v18;
  NSObject *v19;
  NSString *v20;
  void *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  objc_super v27;
  uint8_t buf[4];
  NSString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("SBApplicationSceneEntity"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B01298);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:SBApplicationSceneEntityClass]"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBDashBoardHostedAppViewController initWithApplicationSceneEntity:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0B012FCLL);
  }

  v27.receiver = self;
  v27.super_class = (Class)SBDashBoardHostedAppViewController;
  v6 = -[SBDashBoardHostedAppViewController init](&v27, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogDashBoardHostedAppViewController();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);

    if (v9)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __69__SBDashBoardHostedAppViewController_initWithApplicationSceneEntity___block_invoke;
      v24[3] = &unk_1E8E9E820;
      v25 = v7;
      v26 = v5;
      v10 = (id)objc_msgSend(v25, "modifyProem:", v24);

    }
    objc_msgSend(v5, "sceneHandle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSceneUpdateContributer:", v6);

    objc_msgSend(v7, "build");
    v12 = objc_claimAutoreleasedReturnValue();
    cachedBasicPublicDescription = v6->_cachedBasicPublicDescription;
    v6->_cachedBasicPublicDescription = (NSString *)v12;

    v14 = [SBAppViewController alloc];
    -[SBDashBoardHostedAppViewController appearanceIdentifier](v6, "appearanceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[SBAppViewController initWithIdentifier:andApplicationSceneEntity:](v14, "initWithIdentifier:andApplicationSceneEntity:", v15, v5);
    appViewController = v6->_appViewController;
    v6->_appViewController = (SBAppViewController *)v16;

    -[SBAppViewController setAutomatesLifecycle:](v6->_appViewController, "setAutomatesLifecycle:", 0);
    -[SBAppViewController setIgnoresOcclusions:](v6->_appViewController, "setIgnoresOcclusions:", 1);
    -[SBAppViewController setDelegate:](v6->_appViewController, "setDelegate:", v6);
    -[SBAppViewController setApplicationSceneStatusBarDelegate:](v6->_appViewController, "setApplicationSceneStatusBarDelegate:", v6);
    -[SBDashBoardHostedAppViewController applicationSceneHandle](v6, "applicationSceneHandle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:", v6);

    SBLogDashBoardHostedAppViewController();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = v6->_cachedBasicPublicDescription;
      *(_DWORD *)buf = 138543362;
      v29 = v20;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "<%{public}@> created", buf, 0xCu);
    }

  }
  return v6;
}

void __69__SBDashBoardHostedAppViewController_initWithApplicationSceneEntity___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "application");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:withName:", v2, CFSTR("bundleIdentifier"));

}

- (void)dealloc
{
  NSObject *v3;
  NSString *cachedBasicPublicDescription;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogDashBoardHostedAppViewController();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    v8 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "<%{public}@> dealloc", buf, 0xCu);
  }

  -[UIApplicationSceneClientSettingsDiffInspector removeAllObservers](self->_appClientSettingsDiffInspector, "removeAllObservers");
  -[SBDashBoardHostedAppViewController applicationSceneHandle](self, "applicationSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[SBDashBoardHostedAppViewController invalidate](self, "invalidate");
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase dealloc](&v6, sel_dealloc);
}

- (int64_t)mode
{
  return -[SBAppViewController requestedMode](self->_appViewController, "requestedMode");
}

- (void)setMode:(int64_t)a3
{
  -[SBDashBoardHostedAppViewController _setMode:fromClient:forReason:](self, "_setMode:fromClient:forReason:", a3, 1, CFSTR("client requested"));
}

- (SBScenePlaceholderContentContext)placeholderContentContext
{
  return -[SBAppViewController placeholderContentContext](self->_appViewController, "placeholderContentContext");
}

- (void)setPlaceholderContentContext:(id)a3
{
  -[SBAppViewController setPlaceholderContentContext:](self->_appViewController, "setPlaceholderContentContext:", a3);
}

- (NSSet)actionsToDeliver
{
  return -[SBAppViewController actionsToDeliver](self->_appViewController, "actionsToDeliver");
}

- (void)setActionsToDeliver:(id)a3
{
  -[SBAppViewController setActionsToDeliver:](self->_appViewController, "setActionsToDeliver:", a3);
}

- (BOOL)placeholderContentEnabled
{
  return -[SBAppViewController placeholderContentEnabled](self->_appViewController, "placeholderContentEnabled");
}

- (void)setPlaceholderContentEnabled:(BOOL)a3
{
  -[SBAppViewController setPlaceholderContentEnabled:](self->_appViewController, "setPlaceholderContentEnabled:", a3);
}

- (void)setInterfaceOrientationLocked:(BOOL)a3
{
  _BOOL4 v3;
  BSInvalidatable *v5;
  BSInvalidatable *deferOrientationUpdatesAssertion;

  v3 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleSecureApp")) & 1) == 0
    && (SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCoverSheetCamera")) & 1) == 0
    && self->_interfaceOrientationLocked != v3)
  {
    self->_interfaceOrientationLocked = v3;
    if (-[SBDashBoardHostedAppViewController _appearState](self, "_appearState") == 2)
    {
      if (self->_interfaceOrientationLocked)
      {
        objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBDashBoardHostedApp"));
        v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
        self->_deferOrientationUpdatesAssertion = v5;
      }
      else
      {
        -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
        deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
        self->_deferOrientationUpdatesAssertion = 0;
      }

    }
  }
}

- (void)setSupplementalActivationSettings:(id)a3
{
  -[SBAppViewController setSupplementalActivationSettings:](self->_appViewController, "setSupplementalActivationSettings:", a3);
}

- (void)setOverrideIdleWarnMode:(int64_t)a3
{
  if (self->_overrideIdleWarnMode != a3)
  {
    self->_overrideIdleWarnMode = a3;
    -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    +[SBSceneManagerCoordinator secureMainDisplaySceneManager](SBSceneManagerCoordinator, "secureMainDisplaySceneManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardHostedAppViewController appView](self, "appView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "application");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneIdentityForApplication:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFAuthenticationAssertion invalidate](self->_authenticationAssertion, "invalidate");
    -[SBAppViewController invalidate](self->_appViewController, "invalidate");
    -[SBDashBoardHostedAppViewController _setResignActiveAssertionEnabled:](self, "_setResignActiveAssertionEnabled:", 0);
    self->_invalidated = 1;
    objc_msgSend(v11, "sceneWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v11, "destroyScene:withTransitionContext:", v7, 0);
    -[SBDashBoardHostedAppViewController invalidationHandler](self, "invalidationHandler");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      (*(void (**)(uint64_t))(v9 + 16))(v9);

  }
}

- (void)viewDidLoad
{
  SBAppViewController *appViewController;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase viewDidLoad](&v5, sel_viewDidLoad);
  appViewController = self->_appViewController;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__SBDashBoardHostedAppViewController_viewDidLoad__block_invoke;
  v4[3] = &unk_1E8EA0048;
  v4[4] = self;
  -[SBDashBoardHostedAppViewController bs_addChildViewController:animated:transitionBlock:](self, "bs_addChildViewController:animated:transitionBlock:", appViewController, 0, v4);
  -[SBDashBoardHostedAppViewController _addStatusBarViewIfNeeded](self, "_addStatusBarViewIfNeeded");
}

void __49__SBDashBoardHostedAppViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(_QWORD);
  void *v5;
  id v6;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  v4 = a2;
  objc_msgSend(v3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(v6, "setAutoresizingMask:", 18);
  v4[2](v4);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v4;
  NSString *cachedBasicPublicDescription;
  void *v6;
  void *v7;
  SBFAuthenticationAssertion *v8;
  SBFAuthenticationAssertion *authenticationAssertion;
  BSInvalidatable *v10;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  objc_super v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v12, sel_viewWillAppear_, a3);
  SBLogDashBoardHostedAppViewController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    v14 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewWillAppear", buf, 0xCu);
  }

  -[SBDashBoardHostedAppViewController _setMode:fromClient:forReason:](self, "_setMode:fromClient:forReason:", 2, 0, CFSTR("viewWillAppear"));
  if (!self->_authenticationAssertion)
  {
    objc_msgSend((id)SBApp, "authenticationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardHostedAppViewController appearanceIdentifier](self, "appearanceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "createKeybagUnlockAssertionWithReason:", v7);
    v8 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
    authenticationAssertion = self->_authenticationAssertion;
    self->_authenticationAssertion = v8;

    -[SBFAuthenticationAssertion activate](self->_authenticationAssertion, "activate");
  }
  if (self->_interfaceOrientationLocked)
  {
    objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("SBDashBoardHostedApp"));
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v10;

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  NSString *cachedBasicPublicDescription;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetExternalViewControllerBase viewDidAppear:](&v14, sel_viewDidAppear_, a3);
  SBLogDashBoardHostedAppViewController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    v16 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewDidAppear", buf, 0xCu);
  }

  -[SBDashBoardHostedAppViewController hostedAppSceneHandle](self, "hostedAppSceneHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneIfExists");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "uiClientSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "idleTimerDisabled");

    if (self->_wantsIdleTimerDisabled != v9)
    {
      self->_wantsIdleTimerDisabled = v9;
      -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior");
    }
  }
  -[SBDashBoardHostedAppViewController _setMode:fromClient:forReason:](self, "_setMode:fromClient:forReason:", 2, 0, CFSTR("viewDidAppear"));
  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardHostedAppViewController _appViewController](self, "_appViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_sbWindowScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason dsahBoardAppViewControllerDidAppear](SBKeyboardFocusArbitrationReason, "dsahBoardAppViewControllerDidAppear");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "requestArbitrationForSBWindowScene:forReason:", v12, v13);

}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  NSString *cachedBasicPublicDescription;
  objc_super v6;
  uint8_t buf[4];
  NSString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetExternalViewControllerBase viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  SBLogDashBoardHostedAppViewController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    v8 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewWillDisappear", buf, 0xCu);
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSObject *v4;
  NSString *cachedBasicPublicDescription;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  _BOOL4 v7;
  SBFAuthenticationAssertion *authenticationAssertion;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  objc_super v14;
  uint8_t buf[4];
  NSString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase viewDidDisappear:](&v14, sel_viewDidDisappear_, a3);
  SBLogDashBoardHostedAppViewController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    *(_DWORD *)buf = 138543362;
    v16 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%{public}@> viewDidDisappear", buf, 0xCu);
  }

  if (self->_interfaceOrientationLocked)
  {
    -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;

  }
  v7 = -[SBDashBoardHostedAppViewController _shouldDelayDeactivationUntilAfterDisappearance](self, "_shouldDelayDeactivationUntilAfterDisappearance");
  self->_waitingToDeactivateAfterDisappearance = v7;
  if (v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke;
    v13[3] = &unk_1E8E9DED8;
    v13[4] = self;
    objc_msgSend(MEMORY[0x1E0CD28B0], "bs_performAfterSynchronizedCommit:", v13);
  }
  else
  {
    -[SBDashBoardHostedAppViewController _deactivateIfAppropriateForReason:](self, "_deactivateIfAppropriateForReason:", CFSTR("viewDidDisappear"));
  }
  -[SBFAuthenticationAssertion invalidate](self->_authenticationAssertion, "invalidate");
  authenticationAssertion = self->_authenticationAssertion;
  self->_authenticationAssertion = 0;

  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardHostedAppViewController _appViewController](self, "_appViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_sbWindowScene");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason dsahBoardAppViewControllerDidDisappear](SBKeyboardFocusArbitrationReason, "dsahBoardAppViewControllerDidDisappear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestArbitrationForSBWindowScene:forReason:", v11, v12);

}

void __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke(uint64_t a1)
{
  void (**v1)(void);
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke_2;
  v2[3] = &unk_1E8E9DED8;
  v2[4] = *(_QWORD *)(a1 + 32);
  v1 = (void (**)(void))MEMORY[0x1D17E5550](v2);
  v1[2]();

}

uint64_t __55__SBDashBoardHostedAppViewController_viewDidDisappear___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isInAWindow");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_setResignActiveAssertionEnabled:", 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1106) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_deactivateIfAppropriateForReason:", CFSTR("after viewDidDisappear"));
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardHostedAppViewController;
  -[SBDashBoardHostedAppViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v6, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (!a3)
    -[SBDashBoardHostedAppViewController _setResignActiveAssertionEnabled:](self, "_setResignActiveAssertionEnabled:", 0);
}

- (void)willMoveToParentViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  -[SBDashBoardHostedAppViewController willMoveToParentViewController:](&v5, sel_willMoveToParentViewController_);
  if (!a3)
    -[SBDashBoardHostedAppViewController _setResignActiveAssertionEnabled:](self, "_setResignActiveAssertionEnabled:", 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  _QWORD v14[5];
  objc_super v15;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBDashBoardHostedAppViewController;
  -[CSCoverSheetViewControllerBase viewWillTransitionToSize:withTransitionCoordinator:](&v15, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBDashBoardHostedAppViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_roleHint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SBTraitsArbiterOrientationActuationEnabledForRole(v10);

  if ((v11 & 1) == 0)
  {
    -[SBDashBoardHostedAppViewController hostedAppSceneHandle](self, "hostedAppSceneHandle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "wantsDeviceOrientationEventsEnabled");

    if (v13)
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __89__SBDashBoardHostedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
      v14[3] = &unk_1E8E9EA28;
      v14[4] = self;
      objc_msgSend(v7, "animateAlongsideTransition:completion:", v14, 0);
    }
  }

}

uint64_t __89__SBDashBoardHostedAppViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStatusBarContainerOrientation");
}

- (void)aggregateAppearance:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBDashBoardHostedAppViewController;
  v3 = a3;
  -[CSCoverSheetViewControllerBase aggregateAppearance:](&v7, sel_aggregateAppearance_, v3);
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "priority:", 10, v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fakeStatusBar:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addComponent:", v6);

}

- (id)_newDisplayLayoutElement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBDashBoardHostedAppViewController applicationSceneHandle](self, "applicationSceneHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "application");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAE30]), "initWithIdentifier:", v4);
    objc_msgSend(v5, "setFillsDisplayBounds:", 1);
    objc_msgSend(v5, "setLayoutRole:", 6);
    objc_msgSend(v5, "setUIApplicationElement:", 1);
    objc_msgSend(v5, "setBundleIdentifier:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_updateDisplayLayoutElementForActivation:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  v4 = a3;
  -[CSCoverSheetViewControllerBase _updateDisplayLayoutElementForActivation:](&v5, sel__updateDisplayLayoutElementForActivation_, v4);
  objc_msgSend(v4, "sb_setTransitioning:", (-[SBDashBoardHostedAppViewController _appearState](self, "_appearState", v5.receiver, v5.super_class) & 0xFFFFFFFD) == 1);

}

- (id)appearanceIdentifier
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDashBoardHostedAppViewController;
  v3 = -[CSCoverSheetViewControllerBase appearanceIdentifier](&v5, sel_appearanceIdentifier);
  return self->_cachedBasicPublicDescription;
}

- (int64_t)presentationStyle
{
  return 1;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 0;
}

- (BOOL)canHostAnApp
{
  return -[SBAppViewController canHostAnApp](self->_appViewController, "canHostAnApp");
}

- (id)hostedAppSceneHandle
{
  return -[SBAppViewController hostedAppSceneHandle](self->_appViewController, "hostedAppSceneHandle");
}

- (id)hostedAppSceneHandles
{
  return -[SBAppViewController hostedAppSceneHandles](self->_appViewController, "hostedAppSceneHandles");
}

- (void)hostedAppWillRotateToInterfaceOrientation:(int64_t)a3
{
  -[SBAppViewController hostedAppWillRotateToInterfaceOrientation:](self->_appViewController, "hostedAppWillRotateToInterfaceOrientation:", a3);
}

- (void)setHostedAppReferenceSize:(CGSize)a3 withInterfaceOrientation:(int64_t)a4
{
  -[SBAppViewController setContentReferenceSize:withContentOrientation:andContainerOrientation:](self->_appViewController, "setContentReferenceSize:withContentOrientation:andContainerOrientation:", a4, a4, a3.width, a3.height);
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  char v5;
  uint64_t v6;
  NSObject *v7;
  NSString *v8;
  NSObject *v9;
  NSString *cachedBasicPublicDescription;
  SBDashBoardHostedAppViewController *v11;
  uint64_t v12;
  NSObject *v13;
  NSString *v14;
  objc_super v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBDashBoardHostedAppViewController;
  if (!-[CSCoverSheetViewControllerBase handleEvent:](&v16, sel_handleEvent_, v4)
    || (objc_msgSend(v4, "isConsumable") & 1) == 0)
  {
    v6 = objc_msgSend(v4, "type");
    if (v6 == 11)
    {
      if (-[CSCoverSheetExternalViewControllerBase isExternalToDashBoard](self, "isExternalToDashBoard"))
      {
LABEL_21:
        v5 = 0;
        goto LABEL_22;
      }
      SBLogDashBoardHostedAppViewController();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
        *(_DWORD *)buf = 138543362;
        v18 = cachedBasicPublicDescription;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "<%{public}@> didBecomeActive", buf, 0xCu);
      }

      v11 = self;
      v12 = 0;
    }
    else
    {
      if (v6 != 10)
      {
        if (v6 == 9 && !-[CSCoverSheetExternalViewControllerBase isExternalToDashBoard](self, "isExternalToDashBoard"))
        {
          SBLogDashBoardHostedAppViewController();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            v8 = self->_cachedBasicPublicDescription;
            *(_DWORD *)buf = 138543362;
            v18 = v8;
            _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, "<%{public}@> didDeactivate", buf, 0xCu);
          }

          -[SBDashBoardHostedAppViewController _setResignActiveAssertionEnabled:](self, "_setResignActiveAssertionEnabled:", 0);
          -[SBDashBoardHostedAppViewController _setMode:fromClient:forReason:](self, "_setMode:fromClient:forReason:", 0, 0, CFSTR("DashBoard deactivated"));
        }
        goto LABEL_21;
      }
      if (-[CSCoverSheetExternalViewControllerBase isExternalToDashBoard](self, "isExternalToDashBoard"))
        goto LABEL_21;
      SBLogDashBoardHostedAppViewController();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = self->_cachedBasicPublicDescription;
        *(_DWORD *)buf = 138543362;
        v18 = v14;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "<%{public}@> didResignActive", buf, 0xCu);
      }

      if (-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared"))
        goto LABEL_21;
      v11 = self;
      v12 = 1;
    }
    -[SBDashBoardHostedAppViewController _setResignActiveAssertionEnabled:](v11, "_setResignActiveAssertionEnabled:", v12);
    goto LABEL_21;
  }
  v5 = objc_msgSend(v4, "isConsumable");
LABEL_22:

  return v5;
}

- (void)appViewControllerWillActivateApplication:(id)a3
{
  NSObject *v4;
  NSString *cachedBasicPublicDescription;
  NSObject *v6;
  NSString *v7;
  void *v8;
  void *v9;
  SBFAuthenticationAssertion *v10;
  SBFAuthenticationAssertion *authenticationAssertion;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogDashBoardHostedAppViewController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    v12 = 138543362;
    v13 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%{public}@> willActivateApplication", (uint8_t *)&v12, 0xCu);
  }

  if (!self->_authenticationAssertion)
  {
    SBLogDashBoardHostedAppViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_cachedBasicPublicDescription;
      v12 = 138543362;
      v13 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "<%{public}@> taking authentication sustain assertion", (uint8_t *)&v12, 0xCu);
    }

    objc_msgSend((id)SBApp, "authenticationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDashBoardHostedAppViewController appearanceIdentifier](self, "appearanceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createKeybagUnlockAssertionWithReason:", v9);
    v10 = (SBFAuthenticationAssertion *)objc_claimAutoreleasedReturnValue();
    authenticationAssertion = self->_authenticationAssertion;
    self->_authenticationAssertion = v10;

    -[SBFAuthenticationAssertion activate](self->_authenticationAssertion, "activate");
  }
  self->_intentToTransitionFromSecureAppToFull = 0;
  -[SBDashBoardHostedAppViewController _beginShowingStatusBarView](self, "_beginShowingStatusBarView");
}

- (void)appViewControllerDidDeactivateApplication:(id)a3
{
  NSObject *v4;
  NSString *cachedBasicPublicDescription;
  NSObject *v6;
  NSString *v7;
  SBFAuthenticationAssertion *authenticationAssertion;
  int v9;
  NSString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogDashBoardHostedAppViewController();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    v9 = 138543362;
    v10 = cachedBasicPublicDescription;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "<%{public}@> didDeactivateApplication", (uint8_t *)&v9, 0xCu);
  }

  if (self->_authenticationAssertion)
  {
    SBLogDashBoardHostedAppViewController();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_cachedBasicPublicDescription;
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_INFO, "<%{public}@> releasing authentication sustain assertion", (uint8_t *)&v9, 0xCu);
    }

    -[SBFAuthenticationAssertion invalidate](self->_authenticationAssertion, "invalidate");
    authenticationAssertion = self->_authenticationAssertion;
    self->_authenticationAssertion = 0;

  }
  -[SBDashBoardHostedAppViewController _endShowingStatusBarView](self, "_endShowingStatusBarView");
}

- (void)appViewController:(id)a3 didTransitionFromMode:(int64_t)a4 toMode:(int64_t)a5
{
  -[CSCoverSheetViewControllerBase rebuildBehavior](self, "rebuildBehavior", a3, a4, a5);
  -[CSCoverSheetViewControllerBase rebuildAppearance](self, "rebuildAppearance");
}

- (BOOL)appViewControllerShouldBackgroundApplicationOnDeactivate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  char v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createRequestWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "finalize");
  objc_msgSend(v6, "applicationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "applicationSceneEntities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "sceneHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sceneHandle", (_QWORD)v19);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = SBDashBoardSceneHandleEqualToSceneHandle(v9, v15);

        if ((v16 & 1) != 0)
        {
          v17 = 0;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v12)
        continue;
      break;
    }
  }
  v17 = 1;
LABEL_11:

  if (objc_msgSend(v9, "isSecure") && self->_intentToTransitionFromSecureAppToFull)
    v17 = 0;

  return v17;
}

- (BOOL)appViewControllerShouldReactivateApplicationOnDestruction:(id)a3
{
  void *v3;
  char v4;

  -[SBDashBoardHostedAppViewController hostContextProvider](self, "hostContextProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "hostedAppShouldReactivateUponDestruction");
  else
    v4 = 1;

  return v4;
}

- (BOOL)appViewControllerShouldHideHomeGrabberView:(id)a3
{
  void *v3;
  char v4;

  -[SBDashBoardHostedAppViewController hostContextProvider](self, "hostContextProvider", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hostedAppShouldHideHomeGrabberView");

  return v4;
}

- (BOOL)appViewControllerIsInNonRotatingWindow:(id)a3
{
  BOOL v3;
  void *v4;

  if (__sb__runningInSpringBoard())
  {
    v3 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom") == 1;

  }
  return !v3;
}

- (void)appViewControllerDidFailToActivateApplication:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "dashBoardHostedAppViewControllerDidFailToActivateApplication:", self);

}

- (void)_setMode:(int64_t)a3 fromClient:(BOOL)a4 forReason:(id)a5
{
  id v8;
  NSObject *v9;
  NSString *cachedBasicPublicDescription;
  void *v11;
  void *v12;
  id WeakRetained;
  char v14;
  NSObject *v15;
  NSString *v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  int v20;
  NSString *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (-[SBDashBoardHostedAppViewController mode](self, "mode") == a3)
    goto LABEL_15;
  SBLogDashBoardHostedAppViewController();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
    NSStringFromSBAppViewControllerMode(a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromBOOL();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138544130;
    v21 = cachedBasicPublicDescription;
    v22 = 2114;
    v23 = v11;
    v24 = 2114;
    v25 = v12;
    v26 = 2112;
    v27 = v8;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "<%{public}@> mode change request to %{public}@ (fromClient: %{public}@) for reason: %@", (uint8_t *)&v20, 0x2Au);

  }
  if (!a4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v14 = objc_msgSend(WeakRetained, "dashBoardHostedAppViewController:shouldTransitionToMode:", self, a3);

      if ((v14 & 1) == 0)
      {
        SBLogDashBoardHostedAppViewController();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          v16 = self->_cachedBasicPublicDescription;
          v20 = 138543362;
          v21 = v16;
          _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, "<%{public}@> mode change request vetoed by delegate", (uint8_t *)&v20, 0xCu);
        }

        goto LABEL_15;
      }
    }
    else
    {

    }
  }
  SBLogDashBoardHostedAppViewController();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = self->_cachedBasicPublicDescription;
    NSStringFromSBAppViewControllerMode(a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v18;
    v22 = 2114;
    v23 = v19;
    _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_INFO, "<%{public}@> mode changed to %{public}@", (uint8_t *)&v20, 0x16u);

  }
  -[SBAppViewController setRequestedMode:](self->_appViewController, "setRequestedMode:", a3);
  if (a3 == 2)
    -[CSCoverSheetViewControllerBase _setDisplayLayoutElementActive:immediately:](self, "_setDisplayLayoutElementActive:immediately:", 1, 1);
LABEL_15:

}

- (void)_setResignActiveAssertionEnabled:(BOOL)a3
{
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  NSObject *v5;
  NSString *cachedBasicPublicDescription;
  void *v7;
  void *v8;
  UIApplicationSceneDeactivationAssertion *v9;
  UIApplicationSceneDeactivationAssertion *v10;
  UIApplicationSceneDeactivationAssertion *v11;
  NSObject *v12;
  NSString *v13;
  UIApplicationSceneDeactivationAssertion *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  resignActiveAssertion = self->_resignActiveAssertion;
  if (a3)
  {
    if (!resignActiveAssertion)
    {
      SBLogDashBoardHostedAppViewController();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        cachedBasicPublicDescription = self->_cachedBasicPublicDescription;
        *(_DWORD *)buf = 138543362;
        v18 = cachedBasicPublicDescription;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "<%{public}@> taking resign active assertion", buf, 0xCu);
      }

      +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sceneDeactivationManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (UIApplicationSceneDeactivationAssertion *)objc_msgSend(v8, "newAssertionWithReason:", 7);
      v10 = self->_resignActiveAssertion;
      self->_resignActiveAssertion = v9;

      objc_initWeak((id *)buf, self);
      v11 = self->_resignActiveAssertion;
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __71__SBDashBoardHostedAppViewController__setResignActiveAssertionEnabled___block_invoke;
      v15[3] = &unk_1E8EAC318;
      objc_copyWeak(&v16, (id *)buf);
      -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:](v11, "acquireWithPredicate:transitionContext:", v15, 0);
      objc_destroyWeak(&v16);
      objc_destroyWeak((id *)buf);
    }
  }
  else if (resignActiveAssertion)
  {
    SBLogDashBoardHostedAppViewController();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = self->_cachedBasicPublicDescription;
      *(_DWORD *)buf = 138543362;
      v18 = v13;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_INFO, "<%{public}@> releasing resign active assertion", buf, 0xCu);
    }

    -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
    v14 = self->_resignActiveAssertion;
    self->_resignActiveAssertion = 0;

    -[SBDashBoardHostedAppViewController _deactivateIfAppropriateForReason:](self, "_deactivateIfAppropriateForReason:", CFSTR("resign active released"));
  }
}

uint64_t __71__SBDashBoardHostedAppViewController__setResignActiveAssertionEnabled___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "applicationSceneHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sceneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v6, "isEqualToString:", v7);
  return v8;
}

- (void)_deactivateIfAppropriateForReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[CSCoverSheetViewControllerBase isDisappeared](self, "isDisappeared")
    && !self->_resignActiveAssertion
    && !self->_waitingToDeactivateAfterDisappearance)
  {
    if (-[SBDashBoardHostedAppViewController mode](self, "mode"))
      -[SBDashBoardHostedAppViewController _setMode:fromClient:forReason:](self, "_setMode:fromClient:forReason:", 1, 0, v4);
    if (-[SBDashBoardHostedAppViewController _shouldInvalidateUponDeactivation](self, "_shouldInvalidateUponDeactivation")&& -[SBDashBoardHostedAppViewController mode](self, "mode") != 2)
    {
      -[SBDashBoardHostedAppViewController invalidate](self, "invalidate");
    }
  }

}

- (BOOL)_shouldDelayDeactivationUntilAfterDisappearance
{
  void *v2;
  char v3;

  -[SBDashBoardHostedAppViewController hostContextProvider](self, "hostContextProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "hostedAppShouldDeactivateAfterDisappearance");
  else
    v3 = 0;

  return v3;
}

- (BOOL)_shouldInvalidateUponDeactivation
{
  void *v2;
  char v3;

  -[SBDashBoardHostedAppViewController hostContextProvider](self, "hostContextProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "hostedAppShouldInvalidateUponDeactivation");
  else
    v3 = 0;

  return v3;
}

- (void)applicationSceneViewController:(id)a3 didUpdateStatusBarSettings:(id)a4
{
  -[SBDeviceApplicationSceneStatusBarStateProxy invalidateStatusBarSettings](self->_statusBarObserverProxy, "invalidateStatusBarSettings", a3, a4);
}

- (void)sceneWithIdentifier:(id)a3 didChangeSceneInterfaceOrientationTo:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  _SBDashBoardHostedAppStatusBarStateProxy *v9;
  uint64_t v10;
  void *v11;
  int v12;
  _SBDashBoardHostedAppStatusBarStateProxy *v13;

  -[SBDashBoardHostedAppViewController view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_roleHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SBTraitsArbiterOrientationActuationEnabledForRole(v7);

  if ((v8 & 1) == 0)
  {
    v9 = self->_statusBarObserverProxy;
    if (v9)
    {
      v13 = v9;
      v10 = -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarOrientation](v9, "statusBarOrientation");
      v9 = v13;
      if (v10)
      {
        -[SBDashBoardHostedAppViewController _deviceApplicationSceneHandle](self, "_deviceApplicationSceneHandle");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "wantsDeviceOrientationEventsEnabled");

        v9 = v13;
        if (v12)
        {
          -[SBDashBoardHostedAppViewController _updateStatusBarContainerOrientation](self, "_updateStatusBarContainerOrientation");
          -[SBMainDisplaySceneLayoutStatusBarView layoutStatusBarForSpringBoardRotationToOrientation:](self->_statusBarView, "layoutStatusBarForSpringBoardRotationToOrientation:", v10);
          v9 = v13;
        }
      }
    }

  }
}

- (id)_deviceApplicationSceneHandle
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class();
  -[SBDashBoardHostedAppViewController applicationSceneHandle](self, "applicationSceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBSafeCast(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)containerInterfaceOrientation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lockScreenEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldAutorotate"))
    v6 = -[SBDashBoardHostedAppViewController statusBarOrientation](self, "statusBarOrientation");
  else
    v6 = objc_msgSend((id)SBApp, "activeInterfaceOrientation");
  v7 = v6;

  return v7;
}

- (void)_addStatusBarViewIfNeeded
{
  void *v3;
  BOOL v4;
  void *v5;
  SBMainDisplaySceneLayoutStatusBarView *v6;
  SBMainDisplaySceneLayoutStatusBarView *v7;
  SBMainDisplaySceneLayoutStatusBarView *statusBarView;
  SBMainDisplaySceneLayoutStatusBarView *v9;
  void *v10;
  void *v11;
  _SBDashBoardHostedAppStatusBarStateProxy *v12;
  _SBDashBoardHostedAppStatusBarStateProxy *statusBarObserverProxy;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  -[SBDashBoardHostedAppViewController _deviceApplicationSceneHandle](self, "_deviceApplicationSceneHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_statusBarView)
    v4 = 1;
  else
    v4 = v3 == 0;
  if (!v4)
  {
    v26 = v3;
    -[SBDashBoardHostedAppViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [SBMainDisplaySceneLayoutStatusBarView alloc];
    objc_msgSend(v5, "bounds");
    v7 = -[SBMainDisplaySceneLayoutStatusBarView initWithFrame:](v6, "initWithFrame:");
    statusBarView = self->_statusBarView;
    self->_statusBarView = v7;

    v9 = self->_statusBarView;
    objc_msgSend(MEMORY[0x1E0CEA478], "redColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "colorWithAlphaComponent:", 0.4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMainDisplaySceneLayoutStatusBarView _setDebugBackgroundColor:](v9, "_setDebugBackgroundColor:", v11);

    -[SBMainDisplaySceneLayoutStatusBarView setTranslatesAutoresizingMaskIntoConstraints:](self->_statusBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SBMainDisplaySceneLayoutStatusBarView setDataSource:](self->_statusBarView, "setDataSource:", self);
    v12 = -[SBDeviceApplicationSceneStatusBarStateProxy initWithDeviceApplicationSceneHandle:]([_SBDashBoardHostedAppStatusBarStateProxy alloc], "initWithDeviceApplicationSceneHandle:", v26);
    statusBarObserverProxy = self->_statusBarObserverProxy;
    self->_statusBarObserverProxy = v12;

    -[SBDeviceApplicationSceneStatusBarStateProvider_Base addStatusBarObserver:](self->_statusBarObserverProxy, "addStatusBarObserver:", self->_statusBarView);
    -[SBDeviceApplicationSceneStatusBarStateProvider_Base addStatusBarObserver:](self->_statusBarObserverProxy, "addStatusBarObserver:", self);
    -[_SBDashBoardHostedAppStatusBarStateProxy setHostedAppVCBackReference:](self->_statusBarObserverProxy, "setHostedAppVCBackReference:", self);
    objc_msgSend(v5, "addSubview:", self->_statusBarView);
    -[SBMainDisplaySceneLayoutStatusBarView leftAnchor](self->_statusBarView, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setActive:", 1);

    -[SBMainDisplaySceneLayoutStatusBarView rightAnchor](self->_statusBarView, "rightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);

    -[SBMainDisplaySceneLayoutStatusBarView topAnchor](self->_statusBarView, "topAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setActive:", 1);

    -[SBMainDisplaySceneLayoutStatusBarView bottomAnchor](self->_statusBarView, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setActive:", 1);

    v3 = v26;
  }

}

- (void)_updateStatusBarContainerOrientation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[SBDashBoardHostedAppViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_roleHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBTraitsArbiterOrientationActuationEnabledForRole(v5);

  if ((v6 & 1) == 0)
    -[SBMainDisplaySceneLayoutStatusBarView setContainerOrientation:](self->_statusBarView, "setContainerOrientation:", -[SBDashBoardHostedAppViewController containerInterfaceOrientation](self, "containerInterfaceOrientation"));
}

- (void)_beginShowingStatusBarView
{
  -[SBMainDisplaySceneLayoutStatusBarView beginRequiringStatusBarForReason:](self->_statusBarView, "beginRequiringStatusBarForReason:", CFSTR("SBDashBoardHostedApp"));
  -[SBMainDisplaySceneLayoutStatusBarView applyStatusBarStylesForDescriber:](self->_statusBarView, "applyStatusBarStylesForDescriber:", self->_statusBarObserverProxy);
  -[SBMainDisplaySceneLayoutStatusBarView setContainerOrientation:](self->_statusBarView, "setContainerOrientation:", -[SBDashBoardHostedAppViewController containerInterfaceOrientation](self, "containerInterfaceOrientation"));
}

- (void)_endShowingStatusBarView
{
  -[SBMainDisplaySceneLayoutStatusBarView endRequiringStatusBarForReason:](self->_statusBarView, "endRequiringStatusBarForReason:", CFSTR("SBDashBoardHostedApp"));
}

- (id)_appViewController
{
  return self->_appViewController;
}

- (id)statusBarDescribers
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_statusBarObserverProxy;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)statusBarDescriberForStatusBarPart:(id)a3
{
  return self->_statusBarObserverProxy;
}

- (BOOL)allowsConfiguringIndividualStatusBarParts
{
  return 0;
}

- (int64_t)statusBarOrientation
{
  return -[SBDeviceApplicationSceneStatusBarStateProvider_Base statusBarOrientation](self->_statusBarObserverProxy, "statusBarOrientation");
}

- (SBDashBoardHostedAppViewControllerDelegate)delegate
{
  return (SBDashBoardHostedAppViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)overrideIdleWarnMode
{
  return self->_overrideIdleWarnMode;
}

- (SBApplicationSceneStatusBarDescribing)statusBarDescriber
{
  return (SBApplicationSceneStatusBarDescribing *)self->_statusBarObserverProxy;
}

- (void)setHostContextProvider:(id)a3
{
  objc_storeWeak((id *)&self->_hostContextProvider, a3);
}

- (BOOL)intentToTransitionFromSecureAppToFull
{
  return self->_intentToTransitionFromSecureAppToFull;
}

- (void)setIntentToTransitionFromSecureAppToFull:(BOOL)a3
{
  self->_intentToTransitionFromSecureAppToFull = a3;
}

- (BOOL)interfaceOrientationLocked
{
  return self->_interfaceOrientationLocked;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_hostContextProvider);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_statusBarObserverProxy, 0);
  objc_storeStrong((id *)&self->_statusBarView, 0);
  objc_storeStrong((id *)&self->_cachedBasicPublicDescription, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_authenticationAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_appViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithApplicationSceneEntity:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_14();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
