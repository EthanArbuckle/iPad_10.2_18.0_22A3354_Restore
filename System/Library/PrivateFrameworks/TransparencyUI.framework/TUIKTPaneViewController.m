@implementation TUIKTPaneViewController

- (TUIKTPaneViewController)initWithAccountManager:(id)a3 optInManager:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  TUIKTPaneViewController *v10;
  TUIKTPaneViewController *v11;
  id v12;
  uint64_t v13;
  KTStatus *keyTransparencyStatus;
  TUIAppleAccountManager *v15;
  void *v16;
  uint64_t v17;
  TUIAppleAccountManager *appleAccountManager;
  uint64_t v19;
  TUINetworkMonitor *networkMonitor;
  uint64_t v21;
  TUIKTStateManager *stateManager;
  objc_super v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  TUIKTPaneViewController *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_14);
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v26 = "-[TUIKTPaneViewController initWithAccountManager:optInManager:]";
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v8;
    v31 = 2114;
    v32 = self;
    _os_log_debug_impl(&dword_2493EE000, v9, OS_LOG_TYPE_DEBUG, "%s accountManager = %{public}@, optInManager = %{public}@ on %{public}@", buf, 0x2Au);
  }
  v24.receiver = self;
  v24.super_class = (Class)TUIKTPaneViewController;
  v10 = -[TUIKTPaneViewController init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_accountManager, a3);
    objc_storeStrong((id *)&v11->_optInManager, a4);
    v12 = objc_alloc(MEMORY[0x24BEBA820]);
    v13 = objc_msgSend(v12, "initWithApplication:", *MEMORY[0x24BEBA860]);
    keyTransparencyStatus = v11->_keyTransparencyStatus;
    v11->_keyTransparencyStatus = (KTStatus *)v13;

    v15 = [TUIAppleAccountManager alloc];
    -[TUIKTPaneViewController _accountStore](v11, "_accountStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[TUIAppleAccountManager initWithAccountStore:](v15, "initWithAccountStore:", v16);
    appleAccountManager = v11->_appleAccountManager;
    v11->_appleAccountManager = (TUIAppleAccountManager *)v17;

    v19 = objc_opt_new();
    networkMonitor = v11->_networkMonitor;
    v11->_networkMonitor = (TUINetworkMonitor *)v19;

    -[TUINetworkMonitor setDelegate:](v11->_networkMonitor, "setDelegate:", v11);
    -[TUINetworkMonitor setUpNetworkPathMonitor](v11->_networkMonitor, "setUpNetworkPathMonitor");
    v21 = objc_opt_new();
    stateManager = v11->_stateManager;
    v11->_stateManager = (TUIKTStateManager *)v21;

  }
  return v11;
}

void __63__TUIKTPaneViewController_initWithAccountManager_optInManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __34__TUIKTPaneViewController_dealloc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_28_1);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController viewWillAppear:].cold.1();
  v8.receiver = self;
  v8.super_class = (Class)TUIKTPaneViewController;
  -[TUIKTPaneViewController viewWillAppear:](&v8, sel_viewWillAppear_, v3);
  -[TUIKTPaneViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_SPECIFIER_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v7);

}

void __42__TUIKTPaneViewController_viewWillAppear___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)viewDidLoad
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __38__TUIKTPaneViewController_viewDidLoad__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __38__TUIKTPaneViewController_viewDidLoad__block_invoke_39(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  TUIOptInFlowControllerImpl *v7;
  void *v8;
  void *v9;
  void *v10;
  TUIOptInFlowControllerImpl *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDF6BF8]);
    objc_msgSend(WeakRetained, "setOptInNavigationController:", v2);

    objc_msgSend(WeakRetained, "optInNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v6 = 2;
    else
      v6 = -2;
    objc_msgSend(v3, "setModalPresentationStyle:", v6);

    v7 = [TUIOptInFlowControllerImpl alloc];
    objc_msgSend(WeakRetained, "optInNavigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accountManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "stateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[TUIOptInFlowControllerImpl initWithPresentingNavigationController:parentViewController:accountManager:stateManager:](v7, "initWithPresentingNavigationController:parentViewController:accountManager:stateManager:", v8, WeakRetained, v9, v10);
    objc_msgSend(WeakRetained, "setOptInFlowController:", v11);

    objc_msgSend(WeakRetained, "optInFlowController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDelegate:", WeakRetained);

    objc_msgSend(WeakRetained, "_checkKTStatus:", 1);
    objc_msgSend(WeakRetained, "_beginObservingTransparencyStatusChangedNotification");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_40_1);
    v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[TUIKTPaneViewController viewDidLoad]_block_invoke";
      _os_log_impl(&dword_2493EE000, v13, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v14, 0xCu);
    }
  }

}

void __38__TUIKTPaneViewController_viewDidLoad__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  NSObject *v7;
  objc_super v8;
  uint8_t buf[4];
  TUIKTPaneViewController *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_43_1);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController viewDidAppear:].cold.1();
  v8.receiver = self;
  v8.super_class = (Class)TUIKTPaneViewController;
  -[TUIKTPaneViewController viewDidAppear:](&v8, sel_viewDidAppear_, v3);
  -[TUIKTPaneViewController stateManager](self, "stateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldMaybeUpdateMonitor");

  if (v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_47_2);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v10 = self;
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ forcing a refresh since we are in error", buf, 0xCu);
    }
    -[TUIKTPaneViewController _maybeRefreshMonitorStateInBackground](self, "_maybeRefreshMonitorStateInBackground");
  }
  -[TUIKTPaneViewController _provideNavigationDonations](self, "_provideNavigationDonations");
}

void __41__TUIKTPaneViewController_viewDidAppear___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __41__TUIKTPaneViewController_viewDidAppear___block_invoke_46()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_provideNavigationDonations
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__TUIKTPaneViewController__provideNavigationDonations__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __54__TUIKTPaneViewController__provideNavigationDonations__block_invoke_59()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_61_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController viewWillDisappear:].cold.1();
  v5.receiver = self;
  v5.super_class = (Class)TUIKTPaneViewController;
  -[TUIKTPaneViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, v3);
}

void __45__TUIKTPaneViewController_viewWillDisappear___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_64);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController viewDidDisappear:].cold.1();
  v5.receiver = self;
  v5.super_class = (Class)TUIKTPaneViewController;
  -[TUIKTPaneViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

void __44__TUIKTPaneViewController_viewDidDisappear___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)willMoveToParentViewController:(id)a3
{
  void *v4;
  AAUIRemoteUIController *activeRemoteUIController;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUIKTPaneViewController;
  -[TUIKTPaneViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_, a3);
  -[AAUIRemoteUIController loader](self->_activeRemoteUIController, "loader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  -[AAUIRemoteUIController setNavigationController:](self->_activeRemoteUIController, "setNavigationController:", 0);
  activeRemoteUIController = self->_activeRemoteUIController;
  self->_activeRemoteUIController = 0;

}

- (void)_setupUIStateNoError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *accountKeySpecifierProvider;
  TUIAccountKeySpecifierProvider *v10;
  TUIAccountKeySpecifierProvider *v11;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_69_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateNoError:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifier](self, "_topGroupSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "optIn");

  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (v8 == 1)
  {
    if (!accountKeySpecifierProvider)
    {
      v10 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
      v11 = self->_accountKeySpecifierProvider;
      self->_accountKeySpecifierProvider = v10;

      -[TUIAccountKeySpecifierProvider setDelegate:](self->_accountKeySpecifierProvider, "setDelegate:", self);
      accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
    }
    objc_msgSend(accountKeySpecifierProvider, "refreshSelfAccountKey");
    -[TUIAccountKeySpecifierProvider specifiers](self->_accountKeySpecifierProvider, "specifiers");
    accountKeySpecifierProvider = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", accountKeySpecifierProvider);
  }
  else
  {
    self->_accountKeySpecifierProvider = 0;
  }

}

void __48__TUIKTPaneViewController__setupUIStateNoError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateNoIDSAppleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_71);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateNoIDSAppleID:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[TUIKTPaneViewController _messagesSettingsSpecifier](self, "_messagesSettingsSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[TUIKTPaneViewController _turnOffButtonSpecifierGroup](self, "_turnOffButtonSpecifierGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[TUIKTPaneViewController _turnOffButtonSpecifier](self, "_turnOffButtonSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

}

void __53__TUIKTPaneViewController__setupUIStateNoIDSAppleID___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateCDPWaiting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_72_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateCDPWaiting:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[TUIKTPaneViewController _resetButtonSpecifierGroup](self, "_resetButtonSpecifierGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[TUIKTPaneViewController _resetButtonSpecifier](self, "_resetButtonSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

void __51__TUIKTPaneViewController__setupUIStateCDPWaiting___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateDeviceError:(id)a3
{
  id v4;
  PSSpecifier *v5;
  PSSpecifier *topGroupSpecifier;
  void *v7;
  void *v8;
  TUIDeviceSpecifierProvider *v9;
  TUIDeviceSpecifierProvider *deviceSpecifierProvider;
  void *v11;
  TUIAccountKeySpecifierProvider *accountKeySpecifierProvider;
  TUIAccountKeySpecifierProvider *v13;
  TUIAccountKeySpecifierProvider *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_73);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateDeviceError:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  topGroupSpecifier = self->_topGroupSpecifier;
  self->_topGroupSpecifier = v5;

  objc_msgSend(v4, "addObject:", self->_topGroupSpecifier);
  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  if (+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
  {
    -[TUIKTPaneViewController _reportToAppleSpecifier](self, "_reportToAppleSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v9 = -[TUIDeviceSpecifierProvider initWithAccountManager:stateManager:]([TUIDeviceSpecifierProvider alloc], "initWithAccountManager:stateManager:", self->_accountManager, self->_stateManager);
  deviceSpecifierProvider = self->_deviceSpecifierProvider;
  self->_deviceSpecifierProvider = v9;

  -[TUIDeviceSpecifierProvider setDelegate:](self->_deviceSpecifierProvider, "setDelegate:", self);
  -[TUIDeviceSpecifierProvider specifiers](self->_deviceSpecifierProvider, "specifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v11);

  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (!accountKeySpecifierProvider)
  {
    v13 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
    v14 = self->_accountKeySpecifierProvider;
    self->_accountKeySpecifierProvider = v13;

    -[TUIAccountKeySpecifierProvider setDelegate:](self->_accountKeySpecifierProvider, "setDelegate:", self);
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  }
  -[TUIAccountKeySpecifierProvider specifiers](accountKeySpecifierProvider, "specifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v15);

  -[TUIKTPaneViewController _turnOffButtonSpecifierGroup](self, "_turnOffButtonSpecifierGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

  -[TUIKTPaneViewController _turnOffButtonSpecifier](self, "_turnOffButtonSpecifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v17);

}

void __52__TUIKTPaneViewController__setupUIStateDeviceError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateOtherError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  TUIAccountKeySpecifierProvider *accountKeySpecifierProvider;
  TUIAccountKeySpecifierProvider *v12;
  TUIAccountKeySpecifierProvider *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_76_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateOtherError:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  if (+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
  {
    -[TUIKTPaneViewController _reportToAppleSpecifier](self, "_reportToAppleSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  if (objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild"))
  {
    -[TUIKTPaneViewController _tapToRadarSpecifier](self, "_tapToRadarSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  -[TUIKTPaneViewController _resetButtonSpecifierGroup](self, "_resetButtonSpecifierGroup");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  -[TUIKTPaneViewController _resetButtonSpecifier](self, "_resetButtonSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v10);

  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (!accountKeySpecifierProvider)
  {
    v12 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
    v13 = self->_accountKeySpecifierProvider;
    self->_accountKeySpecifierProvider = v12;

    -[TUIAccountKeySpecifierProvider setDelegate:](self->_accountKeySpecifierProvider, "setDelegate:", self);
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  }
  -[TUIAccountKeySpecifierProvider specifiers](accountKeySpecifierProvider, "specifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v14);

  -[TUIKTPaneViewController _turnOffButtonSpecifierGroup](self, "_turnOffButtonSpecifierGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v15);

  -[TUIKTPaneViewController _turnOffButtonSpecifier](self, "_turnOffButtonSpecifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v16);

}

void __51__TUIKTPaneViewController__setupUIStateOtherError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateCDPError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_78);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateCDPError:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[TUIKTPaneViewController _updateAppleIDSpecifier](self, "_updateAppleIDSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

  -[TUIKTPaneViewController _resetButtonSpecifierGroup](self, "_resetButtonSpecifierGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[TUIKTPaneViewController _resetButtonSpecifier](self, "_resetButtonSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

}

void __49__TUIKTPaneViewController__setupUIStateCDPError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateTemporaryError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  TUIAccountKeySpecifierProvider *accountKeySpecifierProvider;
  TUIAccountKeySpecifierProvider *v9;
  TUIAccountKeySpecifierProvider *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_79);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateTemporaryError:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  if (+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
  {
    -[TUIKTPaneViewController _reportToAppleSpecifier](self, "_reportToAppleSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  if (!accountKeySpecifierProvider)
  {
    v9 = (TUIAccountKeySpecifierProvider *)objc_opt_new();
    v10 = self->_accountKeySpecifierProvider;
    self->_accountKeySpecifierProvider = v9;

    -[TUIAccountKeySpecifierProvider setDelegate:](self->_accountKeySpecifierProvider, "setDelegate:", self);
    accountKeySpecifierProvider = self->_accountKeySpecifierProvider;
  }
  -[TUIAccountKeySpecifierProvider specifiers](accountKeySpecifierProvider, "specifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v11);

  -[TUIKTPaneViewController _turnOffButtonSpecifierGroup](self, "_turnOffButtonSpecifierGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v12);

  -[TUIKTPaneViewController _turnOffButtonSpecifier](self, "_turnOffButtonSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v13);

}

void __55__TUIKTPaneViewController__setupUIStateTemporaryError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateTreeReset:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_80);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateTreeReset:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  if (+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
  {
    -[TUIKTPaneViewController _reportToAppleSpecifier](self, "_reportToAppleSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  -[TUIKTPaneViewController _turnOffButtonSpecifierGroup](self, "_turnOffButtonSpecifierGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  -[TUIKTPaneViewController _turnOffButtonSpecifier](self, "_turnOffButtonSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

}

void __50__TUIKTPaneViewController__setupUIStateTreeReset___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateOptInPendingCDPError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_81);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateOptInPendingCDPError:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[TUIKTPaneViewController _updateAppleIDSpecifier](self, "_updateAppleIDSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);

}

void __61__TUIKTPaneViewController__setupUIStateOptInPendingCDPError___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateOptInPendingCDPWaiting:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_82);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateOptInPendingCDPWaiting:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

}

void __63__TUIKTPaneViewController__setupUIStateOptInPendingCDPWaiting___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_setupUIStateIDSDisabled:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_83_0);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setupUIStateIDSDisabled:].cold.1();
  -[TUIKTPaneViewController _topGroupSpecifierWithError](self, "_topGroupSpecifierWithError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  -[TUIKTPaneViewController _optInSpecifier](self, "_optInSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  -[TUIKTPaneViewController stateManager](self, "stateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ktStatusResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "optIn");

  if (v9 == 1)
  {
    -[TUIKTPaneViewController _turnOffButtonSpecifierGroup](self, "_turnOffButtonSpecifierGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

    -[TUIKTPaneViewController _turnOffButtonSpecifier](self, "_turnOffButtonSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
}

void __52__TUIKTPaneViewController__setupUIStateIDSDisabled___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)specifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v10;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_84);
  v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController specifiers].cold.2((uint64_t)self, v3);
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    switch(-[TUIKTStateManager state](self->_stateManager, "state"))
    {
      case -1:
      case 0:
      case 1:
      case 2:
        goto LABEL_7;
      case 3:
        -[TUIKTPaneViewController _setupUIStateNoIDSAppleID:](self, "_setupUIStateNoIDSAppleID:", v6);
        break;
      case 4:
        -[TUIKTPaneViewController _setupUIStateDeviceError:](self, "_setupUIStateDeviceError:", v6);
        break;
      case 5:
        -[TUIKTPaneViewController _setupUIStateCDPError:](self, "_setupUIStateCDPError:", v6);
        break;
      case 6:
        -[TUIKTPaneViewController _setupUIStateCDPWaiting:](self, "_setupUIStateCDPWaiting:", v6);
        break;
      case 7:
        -[TUIKTPaneViewController _setupUIStateOtherError:](self, "_setupUIStateOtherError:", v6);
        break;
      case 8:
        -[TUIKTPaneViewController _setupUIStateTemporaryError:](self, "_setupUIStateTemporaryError:", v6);
        break;
      case 9:
        -[TUIKTPaneViewController _setupUIStateTreeReset:](self, "_setupUIStateTreeReset:", v6);
        break;
      case 10:
        -[TUIKTPaneViewController _setupUIStateOptInPendingCDPError:](self, "_setupUIStateOptInPendingCDPError:", v6);
        break;
      case 11:
        -[TUIKTPaneViewController _setupUIStateOptInPendingCDPWaiting:](self, "_setupUIStateOptInPendingCDPWaiting:", v6);
        break;
      case 12:
        -[TUIKTPaneViewController _setupUIStateIDSDisabled:](self, "_setupUIStateIDSDisabled:", v6);
        break;
      default:
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_87_0);
        v10 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
          -[TUIKTPaneViewController specifiers].cold.1((void **)&self->_stateManager, v10, (uint64_t)self);
LABEL_7:
        -[TUIKTPaneViewController _setupUIStateNoError:](self, "_setupUIStateNoError:", v6);
        break;
    }
    v7 = (objc_class *)objc_msgSend(v6, "copy");
    v8 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v4) = v7;

    -[TUIKTPaneViewController _handleLaunchURL](self, "_handleLaunchURL");
    v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + v4);
  }
  return v5;
}

void __37__TUIKTPaneViewController_specifiers__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __37__TUIKTPaneViewController_specifiers__block_invoke_86()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_topGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_SPECIFIER_FOOTER"), &stru_251A5E438, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKTPaneViewController _createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:](self, "_createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("TUI_PANE_TOP_GROUP"), 0, v4, v6, CFSTR("_learnMoreTapped"), self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_topGroupSpecifierWithError
{
  _BOOL4 v3;
  int64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int64_t v18;

  v3 = -[TUIKTStateManager isCDPErrorState](self->_stateManager, "isCDPErrorState");
  v4 = -[TUIKTStateManager state](self->_stateManager, "state");
  if (v3)
  {
    if (v4 == 6 || -[TUIKTStateManager state](self->_stateManager, "state") == 11)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("DEVICE_VERIFICATION_SPECIFIER_FOOTER");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("UPDATE_APPLE_ID_FOOTER");
    }
    goto LABEL_10;
  }
  if (v4 == 8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v8 = CFSTR("TEMPORARY_ERROR_FOOTER");
  }
  else if (-[TUIKTStateManager state](self->_stateManager, "state") == 9)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v8 = CFSTR("TREE_RESET_FOOTER");
  }
  else
  {
    if (-[TUIKTStateManager state](self->_stateManager, "state") == 4
      && -[TUIKTStateManager expectedResolutionDays](self->_stateManager, "expectedResolutionDays"))
    {
      v10 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER_WITH_DAYS"), &stru_251A5E438, CFSTR("Localizable"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringWithFormat:", v11, -[TUIKTStateManager expectedResolutionDays](self->_stateManager, "expectedResolutionDays"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    if (-[TUIKTStateManager state](self->_stateManager, "state") == 3)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v8 = CFSTR("MISSING_APPLEID_OPTIN_ERROR_DETAIL");
    }
    else
    {
      v18 = -[TUIKTStateManager state](self->_stateManager, "state");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v18 == 12)
      {
        v7 = CFSTR("IDS_KT_DISABLED_DETAIL");
LABEL_10:
        objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_251A5E438, CFSTR("Localizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
      v8 = CFSTR("TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER");
    }
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v8, &stru_251A5E438, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
  {
    objc_msgSend(v9, "stringByAppendingString:", CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_FOOTER"), &stru_251A5E438, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_18;
  }
LABEL_19:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKTPaneViewController _createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:](self, "_createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("TUI_PANE_TOP_GROUP"), 0, v9, v15, CFSTR("_learnMoreTapped"), self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)_learnMoreTapped
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/ht213465"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "openURL:options:completionHandler:", v2, MEMORY[0x24BDBD1B8], 0);

}

- (id)_optInSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_OPTIN_SPECIFIER_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel__setDeviceVerificationEnabled_withSpecifier_, sel__getDeviceVerificationEnabledForSpecifier_, 0, -[TUIKTPaneViewController _optInTableCellType](self, "_optInTableCellType"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  if (-[TUIKTPaneViewController _shouldShowErrorUI](self, "_shouldShowErrorUI"))
  {
    -[TUIKTStateManager stateLabel](self->_stateManager, "stateLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75D28]);

    if (-[TUIKTStateManager state](self->_stateManager, "state") == 6
      || -[TUIKTStateManager state](self->_stateManager, "state") == 11)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75D20]);

    }
    objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  }
  return v6;
}

- (int64_t)_optInTableCellType
{
  int64_t result;
  void *v4;
  uint64_t v5;

  if (-[TUIKTPaneViewController _shouldShowErrorUI](self, "_shouldShowErrorUI"))
    return -1;
  result = -[TUIKTStateManager state](self->_stateManager, "state");
  if (result == -1)
    return result;
  if (-[TUIKTStateManager isVerifyCDPRunning](self->_stateManager, "isVerifyCDPRunning"))
    return -1;
  -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "optIn");

  if (v5 == 2)
    return -1;
  else
    return 6;
}

- (id)_getDeviceVerificationEnabledForSpecifier:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  NSObject *v7;
  const char *v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint8_t v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_124_0);
  v5 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _getDeviceVerificationEnabledForSpecifier:].cold.2((uint64_t)self, v5);
  if (-[TUIKTPaneViewController _shouldShowErrorUI](self, "_shouldShowErrorUI"))
  {
    v6 = &stru_251A5E438;
    goto LABEL_15;
  }
  if (-[TUIKTStateManager state](self->_stateManager, "state") == -1
    || -[TUIKTStateManager isVerifyCDPRunning](self->_stateManager, "isVerifyCDPRunning"))
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_126_0);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_DWORD *)v22 = 138543362;
    *(_QWORD *)&v22[4] = self;
    v8 = "%{public}@ adding spinner to specifier...";
LABEL_13:
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_INFO, v8, v22, 0xCu);
LABEL_14:
    -[TUIKTPaneViewController _startSpinnerForSpecifier:](self, "_startSpinnerForSpecifier:", v4, *(_OWORD *)v22);
    v6 = (__CFString *)MEMORY[0x24BDBD1C0];
    goto LABEL_15;
  }
  -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "optIn");

  if (v11 == 2)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_128);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_INFO))
      goto LABEL_14;
    *(_DWORD *)v22 = 138543362;
    *(_QWORD *)&v22[4] = self;
    v8 = "%{public}@ cached opt in state is not available, adding spinner to specifier...";
    goto LABEL_13;
  }
  objc_msgSend(v4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "control");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIsAccessibilityElement:", 1);
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("OptIn Switch"));
    v14 = (void *)MEMORY[0x24BDD16E0];
    -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "optIn"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAccessibilityValue:", v17);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_hasActiveConnection);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setProperty:forKey:", v18, *MEMORY[0x24BE75A18]);

    v19 = (void *)MEMORY[0x24BDD16E0];
    -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "optIn") == 1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_131_0);
    v21 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
      -[TUIKTPaneViewController _getDeviceVerificationEnabledForSpecifier:].cold.1((uint64_t)self, (uint64_t)v12, v21);
    v6 = &stru_251A5E438;
  }

LABEL_15:
  return v6;
}

void __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke_125()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke_127()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __69__TUIKTPaneViewController__getDeviceVerificationEnabledForSpecifier___block_invoke_130()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_updateAppleIDSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  PSSpecifier *v6;
  PSSpecifier *appleIDSpecifier;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("UPDATE_APPLE_ID_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  appleIDSpecifier = self->_appleIDSpecifier;
  self->_appleIDSpecifier = v6;

  -[PSSpecifier setButtonAction:](self->_appleIDSpecifier, "setButtonAction:", sel__updateAppleIDButtonPressed);
  return self->_appleIDSpecifier;
}

- (void)_updateAppleIDButtonPressed
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __54__TUIKTPaneViewController__updateAppleIDButtonPressed__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)dismissRemoteUIForViewController
{
  OUTLINED_FUNCTION_3(&dword_2493EE000, a2, a3, "%{public}@ dismissing CDP repair UI", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_139(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_141;
    v4[3] = &unk_251A5B270;
    v4[4] = WeakRetained;
    objc_msgSend(WeakRetained, "dismissViewControllerAnimated:completion:", 1, v4);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_140);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v6 = "-[TUIKTPaneViewController dismissRemoteUIForViewController]_block_invoke";
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_141(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_143_0);
  v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_141_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_2_142()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_updateAppleID
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_148(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_151);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v13 = "-[TUIKTPaneViewController _updateAppleID]_block_invoke_2";
      v14 = 1024;
      v15 = a2;
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = WeakRetained;
      _os_log_debug_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "%s isVerified = %d, error = %{public}@ on %{public}@", buf, 0x26u);
      if (a2)
      {
LABEL_6:
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
        {
          objc_msgSend(WeakRetained, "optInManager");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __41__TUIKTPaneViewController__updateAppleID__block_invoke_152;
          v11[3] = &unk_251A5CA40;
          v11[4] = WeakRetained;
          objc_msgSend(v8, "waitForIDSRegistration:", v11);

        }
        goto LABEL_14;
      }
    }
    else if (a2)
    {
      goto LABEL_6;
    }
    objc_msgSend(WeakRetained, "stateManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setIsVerifyCDPRunning:", 0);

    objc_msgSend(WeakRetained, "dismissRemoteUIForViewController");
    objc_msgSend(WeakRetained, "_checkKTStatus:", 0);
    goto LABEL_14;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_149);
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[TUIKTPaneViewController _updateAppleID]_block_invoke";
    _os_log_impl(&dword_2493EE000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_14:

}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_150()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_154);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v8 = 138543362;
      v9 = v3;
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "waitForIDSRegistration error after verifying CDP %{public}@", (uint8_t *)&v8, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "optInFlowController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_showErrorAlertWithError:presentingViewController:", v3, v6);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setIsVerifyCDPRunning:", 0);

    objc_msgSend(*(id *)(a1 + 32), "dismissRemoteUIForViewController");
    objc_msgSend(*(id *)(a1 + 32), "_checkKTStatus:", 0);
  }

}

void __41__TUIKTPaneViewController__updateAppleID__block_invoke_2_153()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_messagesSettingsSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MESSAGES_SETTINGS_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setButtonAction:", sel__openMessagesSettings);
  return v6;
}

- (void)_openMessagesSettings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __48__TUIKTPaneViewController__openMessagesSettings__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __48__TUIKTPaneViewController__openMessagesSettings__block_invoke_162(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=MESSAGES&path=MADRID_ACCOUNTS_BUTTON"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "openSensitiveURL:withOptions:", v3, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_163);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIKTPaneViewController _openMessagesSettings]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __48__TUIKTPaneViewController__openMessagesSettings__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_reportToAppleSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setButtonAction:", sel__openReportToApple);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TUIKTPaneViewController _reportableFailureFound](self, "_reportableFailureFound"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

  return v6;
}

- (id)_tapToRadarSpecifier
{
  void *v2;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("[INTERNAL] File a Tap-to-Radar..."), self, 0, 0, 0, 13, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setButtonAction:", sel__openTapToRadar);
  objc_msgSend(v2, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  return v2;
}

- (id)_resetButtonSpecifierGroup
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("RESET_CONTACT_KEY_VERIFICATION"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TUIKTStateManager state](self->_stateManager, "state");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 == 7)
    v7 = CFSTR("RESET_CONTACT_KEY_VERIFICATION_ISSUE_FOOTER");
  else
    v7 = CFSTR("RESET_CONTACT_KEY_VERIFICATION_FOOTER");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_251A5E438, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

  return v3;
}

- (id)_resetButtonSpecifier
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = -[TUIKTStateManager state](self->_stateManager, "state");
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESET_CONTACT_KEY_VERIFICATION_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 7)
  {
    objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, 13, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setButtonAction:", sel__resetButtonPressed_);
  }
  else
  {
    objc_msgSend(v4, "deleteButtonSpecifierWithName:target:action:", v6, self, sel__resetButtonPressed_);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setProperty:forKey:", CFSTR("RESET_CONTACT_KEY_VERIFICATION_BUTTON"), *MEMORY[0x24BE75AC0]);
  }
  v8 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75A18]);
  return v7;
}

- (void)_resetButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _BYTE buf[12];
  __int16 v11;
  TUIKTPaneViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_183);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _resetButtonPressed:]";
    v11 = 2114;
    v12 = self;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_184;
  v7[3] = &unk_251A5AD50;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_184(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _BYTE buf[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "state");

    if (v5 == 7)
    {
      objc_msgSend(v3, "_changeOptInState:requestedOptInChange:", *(_QWORD *)(a1 + 32), 2);
    }
    else
    {
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, v3);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_186;
      v7[3] = &unk_251A5CB30;
      objc_copyWeak(&v9, (id *)buf);
      v8 = *(id *)(a1 + 32);
      objc_msgSend(v3, "_showResetConfirmationAlertWithCompletion:", v7);

      objc_destroyWeak(&v9);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_185);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _resetButtonPressed:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_186(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
      objc_msgSend(WeakRetained, "_changeOptInState:requestedOptInChange:", *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_188);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[TUIKTPaneViewController _resetButtonPressed:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __47__TUIKTPaneViewController__resetButtonPressed___block_invoke_2_187()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_changeOptInState:(id)a3 requestedOptInChange:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_190);
  v7 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _changeOptInState:requestedOptInChange:].cold.1(v7, a4, (uint64_t)self);
  -[TUIKTPaneViewController _disableCellForSpecifier:showSpinner:](self, "_disableCellForSpecifier:showSpinner:", v6, 1);
  -[TUIKTPaneViewController appleIDSpecifier](self, "appleIDSpecifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKTPaneViewController _disableCellForSpecifier:showSpinner:](self, "_disableCellForSpecifier:showSpinner:", v8, 0);

  location = 0;
  objc_initWeak(&location, self);
  -[TUIKTPaneViewController optInManager](self, "optInManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_191;
  v11[3] = &unk_251A5CBD8;
  objc_copyWeak(&v13, &location);
  v10 = v6;
  v12 = v10;
  objc_msgSend(v9, "changeOptInState:detailedCompletionBlock:", a4, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_191(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id WeakRetained;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_194);
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)location = 136316162;
      *(_QWORD *)&location[4] = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]_block_invoke_2";
      v16 = 1024;
      v17 = a2;
      v18 = 2114;
      v19 = v7;
      v20 = 2114;
      v21 = v8;
      v22 = 2114;
      v23 = WeakRetained;
      _os_log_debug_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "%s changeOptInState result = %d, loggableDatas = %{public}@, error = %{public}@ on %{public}@", location, 0x30u);
    }
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, WeakRetained);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_195;
    v12[3] = &unk_251A5AD50;
    objc_copyWeak(&v14, (id *)location);
    v13 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_192);
    v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v11, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }

}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_193()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_195(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_enableCellForSpecifier:hideSpinner:", *(_QWORD *)(a1 + 32), 1);
    objc_msgSend(v3, "appleIDSpecifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_enableCellForSpecifier:hideSpinner:", v4, 0);

    objc_msgSend(v3, "_checkKTStatus:", 0);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_197);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __66__TUIKTPaneViewController__changeOptInState_requestedOptInChange___block_invoke_2_196()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_turnOffButtonSpecifierGroup
{
  return (id)objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("TUI_PANE_TURNOFF_GROUP"));
}

- (id)_turnOffButtonSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TURN_OFF"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteButtonSpecifierWithName:target:action:", v5, self, sel__turnOffButtonPressed_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setProperty:forKey:", CFSTR("TURN_OFF_BUTTON"), *MEMORY[0x24BE75AC0]);
  return v6;
}

- (void)_turnOffButtonPressed:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  _BYTE buf[12];
  __int16 v11;
  TUIKTPaneViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_207);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _turnOffButtonPressed:]";
    v11 = 2114;
    v12 = self;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_208;
  v7[3] = &unk_251A5AD50;
  objc_copyWeak(&v9, (id *)buf);
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_208(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_210;
    v5[3] = &unk_251A5CC40;
    v5[4] = WeakRetained;
    v6 = *(id *)(a1 + 32);
    objc_msgSend(v3, "_showOptOutConfirmationAlertWithCompletion:", v5);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_209);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[TUIKTPaneViewController _turnOffButtonPressed:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __49__TUIKTPaneViewController__turnOffButtonPressed___block_invoke_210(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_disableCellForSpecifier:showSpinner:", *(_QWORD *)(a1 + 40), 1);
    objc_msgSend(*(id *)(a1 + 32), "optInFlowController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginOptOutFlow");

  }
}

- (void)_beginObservingTransparencyStatusChangedNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __79__TUIKTPaneViewController__beginObservingTransparencyStatusChangedNotification__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_stopObservingTransparencyStatusChangedNotification
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __78__TUIKTPaneViewController__stopObservingTransparencyStatusChangedNotification__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_transparencyStatusChangedNotificationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  _QWORD block[4];
  id v9;
  _BYTE buf[12];
  __int16 v11;
  id v12;
  __int16 v13;
  TUIKTPaneViewController *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_216);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _transparencyStatusChangedNotificationHandler:]";
    v11 = 2114;
    v12 = v4;
    v13 = 2114;
    v14 = self;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %{public}@", buf, 0x20u);
  }
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BEBA868]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (self->_alert)
      -[TUIKTPaneViewController _dismissPendingAlert](self, "_dismissPendingAlert");
    else
      -[TUIOptInFlowControllerImpl dismissPendingPopupUI](self->_optInFlowController, "dismissPendingPopupUI");
  }
  -[TUIKTPaneViewController _checkKTStatus:](self, "_checkKTStatus:", 0);
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke_217;
  block[3] = &unk_251A5AF70;
  objc_copyWeak(&v9, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);

}

void __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke_217(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "accountKeySpecifierProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "refreshSelfAccountKey");

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_218);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIKTPaneViewController _transparencyStatusChangedNotificationHandler:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __73__TUIKTPaneViewController__transparencyStatusChangedNotificationHandler___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_disableCellForSpecifier:(id)a3 showSpinner:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = *MEMORY[0x24BE75A18];
  v6 = a3;
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v5);
  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCellEnabled:", 0);
  if (v4)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v7, "startAnimating");
    objc_msgSend(v8, "setAccessoryView:", v7);

  }
  objc_msgSend(v8, "setNeedsDisplay");

}

- (void)_enableCellForSpecifier:(id)a3 hideSpinner:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  v5 = *MEMORY[0x24BE75D18];
  v6 = a3;
  objc_msgSend(v6, "propertyForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v4)
  {
    objc_msgSend(v7, "accessoryView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stopAnimating");

    v7 = v9;
  }
  objc_msgSend(v7, "setCellEnabled:", 1);
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);

}

- (void)_checkKTStatus:(BOOL)a3
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  BOOL v9;
  _BYTE buf[12];
  __int16 v11;
  TUIKTPaneViewController *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_220_0);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _checkKTStatus:]";
    v11 = 2114;
    v12 = self;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEFAULT, "%s getting CKV status on %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(33, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __42__TUIKTPaneViewController__checkKTStatus___block_invoke_221;
  v7[3] = &unk_251A5CD88;
  objc_copyWeak(&v8, (id *)buf);
  v9 = a3;
  dispatch_async(v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_221(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  char v13;
  id v14;
  _BYTE buf[12];
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = objc_alloc(MEMORY[0x24BEBA820]);
    v4 = (void *)objc_msgSend(v3, "initWithApplication:", *MEMORY[0x24BEBA860]);
    v14 = 0;
    objc_msgSend(v4, "status:", &v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v14;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_224);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _checkKTStatus:]_block_invoke_2";
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v6;
      v20 = 2114;
      v21 = WeakRetained;
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "%s got CKV status = %{public}@, error = %{public}@ on %{public}@", buf, 0x2Au);
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __42__TUIKTPaneViewController__checkKTStatus___block_invoke_225;
    v10[3] = &unk_251A5B4B0;
    objc_copyWeak(&v12, (id *)buf);
    v11 = v5;
    v13 = *(_BYTE *)(a1 + 40);
    v8 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_222);
    v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _checkKTStatus:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_223()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_225(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateStateWithKTStatusResult:", *(_QWORD *)(a1 + 32));

    if (*(_BYTE *)(a1 + 48))
    {
      objc_msgSend(v3, "stateManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "shouldMaybeUpdateMonitor");

      if (v6)
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_229_0);
        v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 138543362;
          v10 = (const char *)v3;
          _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ forcing a refresh on because of failure at initial load", (uint8_t *)&v9, 0xCu);
        }
        objc_msgSend(v3, "_maybeRefreshMonitorStateInBackground");
      }
    }
    objc_msgSend(v3, "reloadSpecifiers");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_227_0);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[TUIKTPaneViewController _checkKTStatus:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }

}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_2_226()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__TUIKTPaneViewController__checkKTStatus___block_invoke_228()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_maybeRefreshMonitorStateInBackground
{
  NSObject *v2;

  dispatch_get_global_queue(0, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_230);

}

void __64__TUIKTPaneViewController__maybeRefreshMonitorStateInBackground__block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BEBA848]);
  objc_msgSend(v0, "maybeUpdateMonitorState");

}

- (void)_setDeviceVerificationEnabled:(id)a3 withSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  id *v16;
  _QWORD block[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _BYTE buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_232);
  v8 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _setDeviceVerificationEnabled:withSpecifier:].cold.1((uint64_t)self, v8);
  -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "optIn") == 2;

  if (!v10)
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "optIn") == 0;

    if (v13)
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_235;
      v20[3] = &unk_251A5AF70;
      v16 = &v21;
      objc_copyWeak(&v21, (id *)buf);
      dispatch_async(MEMORY[0x24BDAC9B8], v20);
    }
    else
    {
      -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "optIn") == 1;

      if (!v15)
      {
LABEL_15:
        objc_destroyWeak((id *)buf);
        goto LABEL_16;
      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_237;
      block[3] = &unk_251A5AD50;
      v16 = &v19;
      objc_copyWeak(&v19, (id *)buf);
      v18 = v7;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

    }
    objc_destroyWeak(v16);
    goto LABEL_15;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_234);
  v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_2493EE000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ cached opt in state is not available, aborting attempt to change opt in state...", buf, 0xCu);
  }
LABEL_16:

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_233()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_235(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "optInNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);

    objc_msgSend(v2, "optInFlowController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginOptInFlow");

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_236);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[TUIKTPaneViewController _setDeviceVerificationEnabled:withSpecifier:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_237(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_240;
    v4[3] = &unk_251A5CC40;
    v5 = *(id *)(a1 + 32);
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_showOptOutConfirmationAlertWithCompletion:", v4);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_239);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v8 = "-[TUIKTPaneViewController _setDeviceVerificationEnabled:withSpecifier:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_2_238()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_240(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(*(id *)(a1 + 32), "propertyForKey:", *MEMORY[0x24BE75D18]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a2)
    {
      objc_msgSend(v4, "setLoading:", 1);
      objc_msgSend(*(id *)(a1 + 40), "optInFlowController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "beginOptOutFlow");
    }
    else
    {
      objc_msgSend(v4, "control");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setOn:animated:", 1, 1);
    }

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_242_0);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
      __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_240_cold_1(a1, (uint64_t)v4, v6);
  }

}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_2_241()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_openReportToApple
{
  TUIKTReportToAppleContext *v3;
  void *v4;
  void *v5;
  void *v6;
  TUIKTReportToAppleViewController *v7;
  TUIKTReportToAppleViewController *reportToAppleViewController;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = [TUIKTReportToAppleContext alloc];
  if (-[TUIKTPaneViewController _reportableFailureFound](self, "_reportableFailureFound"))
  {
    -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recentFailedEventIds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKTReportToAppleContext setFailingValidation:](v3, "setFailingValidation:", v6);

  }
  v7 = -[TUIKTReportToAppleViewController initWithContext:staticIdentityManager:]([TUIKTReportToAppleViewController alloc], "initWithContext:staticIdentityManager:", v3, 0);
  reportToAppleViewController = self->_reportToAppleViewController;
  self->_reportToAppleViewController = v7;

  location = 0;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__TUIKTPaneViewController__openReportToApple__block_invoke;
  v9[3] = &unk_251A5AF70;
  objc_copyWeak(&v10, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __45__TUIKTPaneViewController__openReportToApple__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x24BDF6BF8]);
    objc_msgSend(WeakRetained, "reportToAppleViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithRootViewController:", v3);
    objc_msgSend(WeakRetained, "setReportNavigationController:", v4);

    objc_msgSend(WeakRetained, "reportNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v8 = 2;
    else
      v8 = -2;
    objc_msgSend(v5, "setModalPresentationStyle:", v8);

    objc_msgSend(WeakRetained, "reportNavigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_245_0);
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[TUIKTPaneViewController _openReportToApple]_block_invoke";
      _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v11, 0xCu);
    }
  }

}

void __45__TUIKTPaneViewController__openReportToApple__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_openTapToRadar
{
  NSObject *v2;
  id v3;
  void *v4;
  dispatch_semaphore_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  NSObject *v16;
  uint8_t buf[16];

  if (objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild"))
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_246);
    v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2493EE000, v2, OS_LOG_TYPE_DEBUG, "User tapped on 'File a Tap-to-Radar'... Attempting to open Tap-to-Radar.", buf, 2u);
    }
    v3 = (id)*MEMORY[0x24BEBA860];
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBA828]), "initWithApplication:", v3);
    v5 = dispatch_semaphore_create(0);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __42__TUIKTPaneViewController__openTapToRadar__block_invoke_248;
    v14[3] = &unk_251A5CEB0;
    v7 = v6;
    v15 = v7;
    v8 = v5;
    v16 = v8;
    objc_msgSend(v4, "copyDeviceStatus:complete:", v3, v14);
    v9 = dispatch_time(0, 1000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v10 = CFSTR("tap-to-radar://new?componentid=986752&ComponentName=Transparency&ComponentVersion=all");
    }
    else
    {
      objc_msgSend(v7, "componentsJoinedByString:", CFSTR(","));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&%@=%@"), CFSTR("tap-to-radar://new?componentid=986752&ComponentName=Transparency&ComponentVersion=all"), CFSTR("DeviceIDs"), v11);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "openSensitiveURL:withOptions:", v12, 0);

  }
}

void __42__TUIKTPaneViewController__openTapToRadar__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __42__TUIKTPaneViewController__openTapToRadar__block_invoke_248(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "idms");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "pushToken");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
          objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_showOptOutConfirmationAlertWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAlertController *v9;
  UIAlertController *alert;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v23 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_256);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _showOptOutConfirmationAlertWithCompletion:].cold.1();
  v4 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ALERT_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ALERT_MESSAGE"), &stru_251A5E438, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alert = self->_alert;
  self->_alert = v9;

  v11 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ALERT_TURN_OFF_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_265;
  v26[3] = &unk_251A5CEF8;
  v26[4] = self;
  v15 = v23;
  v27 = v15;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setTitleTextColor:", v17);

  -[UIAlertController addAction:](self->_alert, "addAction:", v16);
  v18 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TURN_OFF_ALERT_KEEP_USING_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_2;
  v24[3] = &unk_251A5CEF8;
  v24[4] = self;
  v25 = v15;
  v21 = v15;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAlertController addAction:](self->_alert, "addAction:", v22);
  -[UIAlertController setPreferredAction:](self->_alert, "setPreferredAction:", v22);
  -[TUIKTPaneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alert, 1, 0);

}

void __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

uint64_t __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_265(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlert:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __70__TUIKTPaneViewController__showOptOutConfirmationAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlert:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_showResetConfirmationAlertWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIAlertController *v9;
  UIAlertController *alert;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;

  v23 = a3;
  v4 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RESET_CONTACT_KEY_VERIFICATION_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("RESET_CONTACT_KEY_VERIFICATION_MESSAGE"), &stru_251A5E438, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  alert = self->_alert;
  self->_alert = v9;

  v11 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("RESET_CONTACT_KEY_VERIFICATION_RESET_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke;
  v26[3] = &unk_251A5CEF8;
  v26[4] = self;
  v15 = v23;
  v27 = v15;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v26);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6950], "systemRedColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setTitleTextColor:", v17);

  -[UIAlertController addAction:](self->_alert, "addAction:", v16);
  v18 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("RESET_CONTACT_KEY_VERIFICATION_KEEP_USING_BUTTON"), &stru_251A5E438, CFSTR("Localizable"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v14;
  v24[1] = 3221225472;
  v24[2] = __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke_2;
  v24[3] = &unk_251A5CEF8;
  v24[4] = self;
  v25 = v15;
  v21 = v15;
  objc_msgSend(v18, "actionWithTitle:style:handler:", v20, 0, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIAlertController addAction:](self->_alert, "addAction:", v22);
  -[UIAlertController setPreferredAction:](self->_alert, "setPreferredAction:", v22);
  -[TUIKTPaneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_alert, 1, 0);

}

uint64_t __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlert:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __69__TUIKTPaneViewController__showResetConfirmationAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlert:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)_createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = (void *)MEMORY[0x24BE75590];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  objc_msgSend(v14, "groupSpecifierWithID:name:", a3, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKTPaneViewController _setFooterTextWithLinkForSpecifier:footerText:linkText:actionMethodName:target:](self, "_setFooterTextWithLinkForSpecifier:footerText:linkText:actionMethodName:target:", v19, v18, v17, v16, v15);

  return v19;
}

- (void)_setFooterTextWithLinkForSpecifier:(id)a3 footerText:(id)a4 linkText:(id)a5 actionMethodName:(id)a6 target:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  id v23;
  NSRange v24;

  v11 = (void *)MEMORY[0x24BDD17C8];
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ %@"), a4, v14);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v23, *MEMORY[0x24BE75A68]);
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v17, *MEMORY[0x24BE75A30]);

  objc_msgSend(v15, "setProperty:forKey:", v23, *MEMORY[0x24BE75A58]);
  v18 = objc_msgSend(v23, "rangeOfString:", v14);
  v20 = v19;

  v24.location = v18;
  v24.length = v20;
  NSStringFromRange(v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v21, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v12);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setProperty:forKey:", v22, *MEMORY[0x24BE75A50]);
  objc_msgSend(v15, "setProperty:forKey:", v13, *MEMORY[0x24BE75A38]);

}

- (void)_startSpinnerForSpecifier:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v3, "startAnimating");
  objc_msgSend(v4, "setAccessoryView:", v3);

}

- (void)_stopSpinnerForSpecifier:(id)a3
{
  id v3;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessoryView:", 0);

}

- (BOOL)_shouldShowErrorUI
{
  void *v3;
  uint64_t v4;
  BOOL result;

  result = 1;
  if (!-[TUIKTStateManager isErrorState](self->_stateManager, "isErrorState"))
  {
    -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "optIn");

    if (v4 != 1 || !-[TUIKTPaneViewController _reportableFailureFound](self, "_reportableFailureFound"))
      return 0;
  }
  return result;
}

- (BOOL)_reportableFailureFound
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentFailedEventIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (void)_dismissPendingAlert
{
  _QWORD v2[4];
  id v3;
  id location;

  location = 0;
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke;
  v2[3] = &unk_251A5AF70;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "alert");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_283);
      v4 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
        __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_cold_1(v4, v2);
      objc_msgSend(v2, "alert");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);

      objc_msgSend(v2, "setAlert:", 0);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_281);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315138;
      v8 = "-[TUIKTPaneViewController _dismissPendingAlert]_block_invoke";
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v7, 0xCu);
    }
  }

}

void __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_282()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_handleLaunchURL
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 1384);
  v4 = 136315650;
  v5 = "-[TUIKTPaneViewController _handleLaunchURL]";
  v6 = 2114;
  v7 = v3;
  v8 = 2114;
  v9 = a1;
  OUTLINED_FUNCTION_2_0(&dword_2493EE000, a2, a3, "%s %{public}@ on %{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_7();
}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_285(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "handleURLResourceDictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("id"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("STATUS")))
        objc_msgSend(v2, "setHandleURLResourceDictionary:", 0);
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("PUBLIC_VERIFICATION_CODE")))
      {
        objc_msgSend(v2, "accountKeySpecifierProvider");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        if (v5)
        {
          objc_msgSend(v2, "setHandleURLResourceDictionary:", 0);
          objc_msgSend(v2, "accountKeySpecifierProvider");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setIsExpanded:", 1);

        }
      }
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_294);
      v8 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
        __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_285_cold_1(v8, v2);
      objc_msgSend(v2, "appleIDSpecifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v2, "setHandleURLResourceDictionary:", 0);
        objc_msgSend(v2, "_updateAppleID");
      }
    }

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_286);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[TUIKTPaneViewController _handleLaunchURL]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v10, 0xCu);
    }
  }

}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_293()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)presentOptInNavigationController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __59__TUIKTPaneViewController_presentOptInNavigationController__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __59__TUIKTPaneViewController_presentOptInNavigationController__block_invoke_296(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "optInNavigationController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentViewController:animated:completion:", v3, 1, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_297);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIKTPaneViewController presentOptInNavigationController]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __59__TUIKTPaneViewController_presentOptInNavigationController__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)optInFlowResultWithStateUpdate
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  uint8_t buf[8];

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_298);
  v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_24942AF52, buf, 2u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_299;
  block[3] = &unk_251A5AF70;
  objc_copyWeak(&v5, (id *)buf);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_299(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_checkKTStatus:", 0);
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_302);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v5) = 0;
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_INFO, "Attempting to reload specifiers in transparency pane...", (uint8_t *)&v5, 2u);
    }
    objc_msgSend(v2, "reloadSpecifiers");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_300);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIKTPaneViewController optInFlowResultWithStateUpdate]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __57__TUIKTPaneViewController_optInFlowResultWithStateUpdate__block_invoke_301()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[TUIKTPaneViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  else
    -[TUIKTPaneViewController showViewController:sender:](self, "showViewController:sender:", v6, v7);

}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_303);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }

}

void __71__TUIKTPaneViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_304);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }

}

void __71__TUIKTPaneViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_305);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController reloadSpecifiersForProvider:oldSpecifiers:animated:].cold.1();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "specifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKTPaneViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v9, v10, v5);

  }
  else
  {
    -[TUIKTPaneViewController reloadSpecifiers](self, "reloadSpecifiers");
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && self->_topGroupSpecifier)
    -[TUIKTPaneViewController _updateTopGroupSpecifierFooter:](self, "_updateTopGroupSpecifierFooter:", v5);

}

void __78__TUIKTPaneViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_306);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController validateDataclassAccessForProvider:specifier:completion:].cold.1();

}

void __83__TUIKTPaneViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 loadRequest:(id)a4 withIdentifier:(id)a5 specifier:(id)a6
{
  -[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:specifier:](self, "_loadRemoteRequest:withIdentifier:specifier:", a4, a5, a6);
}

- (void)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 specifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  AAUIRemoteUIController *v12;
  AAUIRemoteUIController *activeRemoteUIController;
  _QWORD v14[4];
  id v15;
  _BYTE buf[12];
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  TUIKTPaneViewController *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_deviceDetailsButtonSpecifier)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_307);
    v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:specifier:]";
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      v21 = 2114;
      v22 = self;
      _os_log_debug_impl(&dword_2493EE000, v11, OS_LOG_TYPE_DEBUG, "%s another request is runnning, ignoring request = %{public}@, identifier = %{public}@ on %{public}@", buf, 0x2Au);
    }
  }
  else
  {
    objc_storeStrong((id *)&self->_deviceDetailsButtonSpecifier, a5);
    -[TUIKTPaneViewController _startSpinnerForSpecifier:](self, "_startSpinnerForSpecifier:", v10);
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke_308;
    v14[3] = &unk_251A5D120;
    objc_copyWeak(&v15, (id *)buf);
    -[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:preparation:completion:](self, "_loadRemoteRequest:withIdentifier:preparation:completion:", v8, v9, 0, v14);
    v12 = (AAUIRemoteUIController *)objc_claimAutoreleasedReturnValue();
    activeRemoteUIController = self->_activeRemoteUIController;
    self->_activeRemoteUIController = v12;

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }

}

void __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke_308(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "deviceDetailsButtonSpecifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_stopSpinnerForSpecifier:", v3);

    objc_msgSend(v2, "setDeviceDetailsButtonSpecifier:", 0);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_309);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:specifier:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __71__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_specifier___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_loadRemoteRequest:(id)a3 withIdentifier:(id)a4 preparation:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, void *);
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  TUIKTPaneViewController *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a5;
  v13 = a6;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_310);
  v14 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    v28 = "-[TUIKTPaneViewController _loadRemoteRequest:withIdentifier:preparation:completion:]";
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = self;
    _os_log_debug_impl(&dword_2493EE000, v14, OS_LOG_TYPE_DEBUG, "%s request = %{public}@, identifier = %{public}@ on %{public}@", buf, 0x2Au);
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D70]), "initWithIdentifier:", v11);
  objc_msgSend(v15, "setDelegate:", self);
  -[TUIKTPaneViewController navigationController](self, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setNavigationController:", v16);

  if (v12)
    v12[2](v12, v15);
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_312;
  v23[3] = &unk_251A5D1D8;
  v26 = v13;
  v17 = v15;
  v24 = v17;
  v25 = v10;
  v18 = v10;
  v19 = v13;
  -[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:](self, "_getServerUILoadDelegateWithCompletion:", v23);
  v20 = v25;
  v21 = v17;

  return v21;
}

void __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_312(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_2;
    v10[3] = &unk_251A5D1B0;
    v11 = v7;
    v12 = *(id *)(a1 + 48);
    objc_msgSend(v11, "loadRequest:completion:", v8, v10);

  }
  else
  {
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, 0, v6);
  }

}

void __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  char v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_313);
  v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v16 = v7;
    v17 = 1024;
    v18 = a2;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_DEBUG, "%@ done loading request with success %d. Error: %@", buf, 0x1Cu);
  }
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_314;
  v10[3] = &unk_251A5D188;
  v8 = *(id *)(a1 + 40);
  v14 = a2;
  v13 = v8;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

uint64_t __84__TUIKTPaneViewController__loadRemoteRequest_withIdentifier_preparation_completion___block_invoke_314(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
  return result;
}

- (id)remoteUIController:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_316);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController remoteUIController:createPageWithName:attributes:].cold.1();
  v10 = objc_alloc_init(MEMORY[0x24BE04D68]);
  objc_msgSend(v10, "setHidesBottomBarWhenPushed:", 1);

  return v10;
}

void __76__TUIKTPaneViewController_remoteUIController_createPageWithName_attributes___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)remoteUIController:(id)a3 didRefreshObjectModel:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_318);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController remoteUIController:didRefreshObjectModel:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[TUIKTPaneViewController _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v6, v7, 0);

}

void __68__TUIKTPaneViewController_remoteUIController_didRefreshObjectModel___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_319);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController remoteUIController:willPresentObjectModel:modally:].cold.1();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[TUIKTPaneViewController _handleObjectModelChangeForController:objectModel:isModal:](self, "_handleObjectModelChangeForController:objectModel:isModal:", v8, v9, v5);

}

void __77__TUIKTPaneViewController_remoteUIController_willPresentObjectModel_modally___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_320);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController remoteUIController:shouldLoadRequest:redirectResponse:].cold.1();
  -[AKAppleIDServerResourceLoadDelegate processResponse:](self->_serverUILoadDelegate, "processResponse:", v10);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("fmip1"), CFSTR("prefs"), CFSTR("itms"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "containsObject:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke_328;
    v18[3] = &unk_251A5D2A0;
    v19 = v9;
    objc_msgSend(v15, "openURL:configuration:completionHandler:", v16, 0, v18);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[TUIKTPaneViewController _attemptUpdateAuthControllerWithActionableResponse:](self, "_attemptUpdateAuthControllerWithActionableResponse:", v10);
    -[TUIKTPaneViewController _addHeadersToRequest:](self, "_addHeadersToRequest:", v9);
  }

  return v14 ^ 1;
}

void __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke_328(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_329);
    v7 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "URL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_2493EE000, v9, OS_LOG_TYPE_ERROR, "TUIKTPaneViewController shouldLoadRequest failed to open URL: %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

void __81__TUIKTPaneViewController_remoteUIController_shouldLoadRequest_redirectResponse___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _BYTE location[12];
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  TUIKTPaneViewController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_332);
  v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)location = 136316162;
    *(_QWORD *)&location[4] = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]";
    v18 = 2114;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    v24 = 2114;
    v25 = self;
    _os_log_debug_impl(&dword_2493EE000, v11, OS_LOG_TYPE_DEBUG, "%s controller = %{public}@, error = %{public}@, request = %{public}@ on %{public}@", location, 0x34u);
  }
  if (+[TUIUtils isAuthError:](TUIUtils, "isAuthError:", v9))
  {
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, self);
    -[TUIKTPaneViewController appleAccountManager](self, "appleAccountManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_333;
    v13[3] = &unk_251A5D368;
    objc_copyWeak(&v16, (id *)location);
    v14 = v8;
    v15 = v10;
    objc_msgSend(v12, "silentRenewAppleAccountWithCompletionHandler:", v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)location);
  }

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_333(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  _BYTE buf[12];
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_334);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_336);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke_2";
    v14 = 2048;
    v15 = a2;
    v16 = 2114;
    v17 = v5;
    v18 = 2114;
    v19 = WeakRetained;
    _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s device details remote UI: silent renew result = %ld, error = %{public}@ on %{public}@", buf, 0x2Au);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, WeakRetained);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_337;
  v11[3] = &unk_251A5D120;
  objc_copyWeak(&v12, (id *)buf);
  objc_msgSend(v9, "loadRequest:completion:", v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_335()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_337(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_339);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_341);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315906;
    v10 = "-[TUIKTPaneViewController remoteUIController:didFinishLoadWithError:forRequest:]_block_invoke_2";
    v11 = 1024;
    v12 = a2;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = WeakRetained;
    _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s device details remote UI: retry loadRequest result = %d, error = %{public}@ on %{public}@", (uint8_t *)&v9, 0x26u);
  }

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_2_338()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __80__TUIKTPaneViewController_remoteUIController_didFinishLoadWithError_forRequest___block_invoke_340()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  __int16 v20;
  TUIKTPaneViewController *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_343);
  v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136316162;
    v13 = "-[TUIKTPaneViewController remoteUIController:didReceiveHTTPResponse:forRequest:]";
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = self;
    _os_log_debug_impl(&dword_2493EE000, v11, OS_LOG_TYPE_DEBUG, "%s controller = %{public}@, response = %{public}@, request = %{public}@ on %{public}@", (uint8_t *)&v12, 0x34u);
  }

}

void __80__TUIKTPaneViewController_remoteUIController_didReceiveHTTPResponse_forRequest___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_handleObjectModelChangeForController:(id)a3 objectModel:(id)a4 isModal:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  BOOL v24;
  _BYTE location[12];
  __int16 v26;
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  TUIKTPaneViewController *v31;
  uint64_t v32;

  v5 = a5;
  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_344);
  v10 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
  {
    v20 = v10;
    objc_msgSend(v9, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)location = 136315906;
    *(_QWORD *)&location[4] = "-[TUIKTPaneViewController _handleObjectModelChangeForController:objectModel:isModal:]";
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v21;
    v30 = 2114;
    v31 = self;
    _os_log_debug_impl(&dword_2493EE000, v20, OS_LOG_TYPE_DEBUG, "%s controller = %{public}@, model: %{public}@ on %{public}@", location, 0x2Au);

  }
  objc_storeStrong((id *)&self->_currentObjectModel, a4);
  objc_msgSend(v9, "defaultPages");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "leftBarButtonItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v14, "count") == 0;

  if ((_DWORD)v12)
  {
    if (v5)
    {
      v16 = objc_alloc(MEMORY[0x24BDF6860]);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_251A5E438, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithTitle:style:target:action:", v18, 0, self, sel__cancelButtonForRemoteObjectModelWasTapped_);
      objc_msgSend(v13, "setLeftBarButtonItem:", v19);

    }
  }
  else
  {
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, v8);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke_350;
    v22[3] = &unk_251A5D3F0;
    objc_copyWeak(&v23, (id *)location);
    v15 = *MEMORY[0x24BE0AAD8];
    v24 = v5;
    objc_msgSend(v8, "setHandlerForButtonName:handler:", v15, v22);
    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)location);
  }

}

void __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke_350(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  id WeakRetained;
  void *v7;
  int v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0AAF8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BE0AAE0]);

    if (v8)
    {
      if (*(_BYTE *)(a1 + 40))
      {
        v9 = (id)objc_msgSend(WeakRetained, "dismissObjectModelsAnimated:completion:", 1, 0);
      }
      else
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_351);
        v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v11 = 0;
          _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "Cancel action received for a non-modal flow", v11, 2u);
        }
      }
    }
  }

}

void __85__TUIKTPaneViewController__handleObjectModelChangeForController_objectModel_isModal___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint8_t v13[16];

  v7 = a3;
  v8 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_353);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController remoteUIController:didReceiveObjectModel:actionSignal:].cold.1();
  objc_msgSend(v8, "clientInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE7EE50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("update:trustedDevicesSummary")))
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_357);
      v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_2493EE000, v12, OS_LOG_TYPE_DEBUG, "Server request client to update trusted devices list", v13, 2u);
      }
      -[TUIDeviceSpecifierProvider refreshDeviceList](self->_deviceSpecifierProvider, "refreshDeviceList");
    }

  }
}

void __81__TUIKTPaneViewController_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __81__TUIKTPaneViewController_remoteUIController_didReceiveObjectModel_actionSignal___block_invoke_356()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_cancelButtonForRemoteObjectModelWasTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_358);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _cancelButtonForRemoteObjectModelWasTapped:].cold.1();
  v5 = (id)-[AAUIRemoteUIController dismissObjectModelsAnimated:completion:](self->_activeRemoteUIController, "dismissObjectModelsAnimated:completion:", 1, 0);

}

void __70__TUIKTPaneViewController__cancelButtonForRemoteObjectModelWasTapped___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_addHeadersToRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_359);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _addHeadersToRequest:].cold.1();
  -[TUIKTPaneViewController _grandSlamAccount](self, "_grandSlamAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIKTPaneViewController _accountStore](self, "_accountStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "credentialForAccount:serviceID:", v5, *MEMORY[0x24BE04870]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "token");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAppleIDServerResourceLoadDelegate setServiceToken:](self->_serverUILoadDelegate, "setServiceToken:", v8);
  -[AKAppleIDServerResourceLoadDelegate signRequest:](self->_serverUILoadDelegate, "signRequest:", v4);
  objc_msgSend(v5, "aida_dsid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addDeviceProvisioningInfoHeadersWithDSID:", v9);

  objc_msgSend(v4, "aa_addAppProvidedContext:", CFSTR("transparency"));
}

void __48__TUIKTPaneViewController__addHeadersToRequest___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_authController
{
  AKAppleIDAuthenticationController *authController;
  AKAppleIDAuthenticationController *v4;
  AKAppleIDAuthenticationController *v5;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_362);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _authController].cold.1();
  authController = self->_authController;
  if (!authController)
  {
    v4 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x24BE0ACC0]);
    v5 = self->_authController;
    self->_authController = v4;

    authController = self->_authController;
  }
  return authController;
}

void __42__TUIKTPaneViewController__authController__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_attemptUpdateAuthControllerWithActionableResponse:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[4];
  dispatch_semaphore_t v14;
  uint8_t buf[16];

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_364);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _attemptUpdateAuthControllerWithActionableResponse:].cold.1();
  if (-[AKAppleIDServerResourceLoadDelegate isResponseActionable:](self->_serverUILoadDelegate, "isResponseActionable:", v4))
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_366);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "Final Apple ID settings UI server response! Informing AuthKit...", buf, 2u);
    }
    -[TUIKTPaneViewController _grandSlamAccount](self, "_grandSlamAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
    objc_msgSend(v6, "aida_alternateDSID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAltDSID:", v8);

    objc_msgSend(v7, "setAnticipateEscrowAttempt:", 1);
    objc_msgSend(v6, "username");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setUsername:", v9);

    v10 = dispatch_semaphore_create(0);
    -[TUIKTPaneViewController _authController](self, "_authController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_368;
    v13[3] = &unk_251A5D538;
    v14 = v10;
    v12 = v10;
    objc_msgSend(v11, "updateStateWithExternalAuthenticationResponse:forContext:completion:", v4, v7, v13);

    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }

}

void __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_365()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_368(uint64_t a1, char a2, void *a3)
{
  id v5;
  uint64_t v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_371);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v11) = 0;
      v7 = "Successfully passed on auth response to AuthKit.";
      v8 = v6;
      v9 = 2;
LABEL_10:
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, v7, (uint8_t *)&v11, v9);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_369);
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      v11 = 138412290;
      v12 = v5;
      v7 = "Failed to inform AuthKit of auth response! Error: %@.";
      v8 = v10;
      v9 = 12;
      goto LABEL_10;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __78__TUIKTPaneViewController__attemptUpdateAuthControllerWithActionableResponse___block_invoke_370()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)_getServerUILoadDelegateWithCompletion:(id)a3
{
  void (**v4)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD);
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD);

  v4 = (void (**)(id, AKAppleIDServerResourceLoadDelegate *, _QWORD))a3;
  if (self->_serverUILoadDelegate)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_372);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    {
      -[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:].cold.2();
      if (!v4)
        goto LABEL_12;
      goto LABEL_6;
    }
    if (v4)
LABEL_6:
      v4[2](v4, self->_serverUILoadDelegate, 0);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_374);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      -[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:].cold.1();
    -[TUIKTPaneViewController _grandSlamAccount](self, "_grandSlamAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x24BE0ACB8]);
    objc_msgSend(v5, "aida_alternateDSID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAltDSID:", v7);

    objc_msgSend(v6, "setAnticipateEscrowAttempt:", 1);
    -[TUIKTPaneViewController _authController](self, "_authController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_375;
    v9[3] = &unk_251A5D5E8;
    v9[4] = self;
    v10 = v4;
    objc_msgSend(v8, "getServerUILoadDelegateWithContext:completion:", v6, v9);

  }
LABEL_12:

}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_373()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_375(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_376);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_375_cold_1((uint64_t)v6, a1, v7);
  }
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_377;
  v12[3] = &unk_251A5D5C0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v5;
  v14 = v8;
  v15 = v6;
  v16 = v9;
  v10 = v6;
  v11 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v12);

}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

uint64_t __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_377(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)a1[4];
  if (v2)
    objc_storeStrong((id *)(a1[5] + 1464), v2);
  result = a1[7];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[6]);
  return result;
}

- (id)_accountStore
{
  return (id)-[AIDAAccountManager accountStore](self->_accountManager, "accountStore");
}

- (id)_appleAccount
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_grandSlamAccount
{
  ACAccount *grandSlamAccount;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  ACAccount *v8;
  ACAccount *v9;
  NSObject *v10;
  uint8_t v12[16];
  uint8_t buf[16];

  grandSlamAccount = self->_grandSlamAccount;
  if (!grandSlamAccount)
  {
    -[TUIKTPaneViewController _appleAccount](self, "_appleAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_378);
      v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "Fetching grandslam account from apple account", buf, 2u);
      }
      -[TUIKTPaneViewController _accountStore](self, "_accountStore");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIKTPaneViewController _appleAccount](self, "_appleAccount");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aida_accountForiCloudAccount:", v7);
      v8 = (ACAccount *)objc_claimAutoreleasedReturnValue();
      v9 = self->_grandSlamAccount;
      self->_grandSlamAccount = v8;

    }
    grandSlamAccount = self->_grandSlamAccount;
    if (!grandSlamAccount)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_380);
      v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "Could not fetch GrandSlam Account, we're destined for failure!", v12, 2u);
      }
      grandSlamAccount = self->_grandSlamAccount;
    }
  }
  return grandSlamAccount;
}

void __44__TUIKTPaneViewController__grandSlamAccount__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __44__TUIKTPaneViewController__grandSlamAccount__block_invoke_379()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (id)_grandSlamSigner
{
  AAGrandSlamSigner *grandSlamSigner;
  id v4;
  void *v5;
  void *v6;
  AAGrandSlamSigner *v7;
  AAGrandSlamSigner *v8;

  grandSlamSigner = self->_grandSlamSigner;
  if (!grandSlamSigner)
  {
    v4 = objc_alloc(MEMORY[0x24BE049B0]);
    -[TUIKTPaneViewController _accountStore](self, "_accountStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKTPaneViewController _grandSlamAccount](self, "_grandSlamAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (AAGrandSlamSigner *)objc_msgSend(v4, "initWithAccountStore:grandSlamAccount:appTokenID:", v5, v6, *MEMORY[0x24BE04878]);
    v8 = self->_grandSlamSigner;
    self->_grandSlamSigner = v7;

    grandSlamSigner = self->_grandSlamSigner;
  }
  return grandSlamSigner;
}

- (void)_updateTopGroupSpecifierFooter:(BOOL)a3
{
  _QWORD block[4];
  id v6;
  BOOL v7;
  id location;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_382);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_DEBUG))
    -[TUIKTPaneViewController _updateTopGroupSpecifierFooter:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke_383;
  block[3] = &unk_251A5CD88;
  objc_copyWeak(&v6, &location);
  v7 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

void __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke_383(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "state") == 4)
    {
      objc_msgSend(v3, "stateManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "expectedResolutionDays");

      if (v6)
      {
        v7 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER_WITH_DAYS"), &stru_251A5E438, CFSTR("Localizable"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stateManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringWithFormat:", v9, objc_msgSend(v10, "expectedResolutionDays"));
        v11 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      }
    }
    else
    {

    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("TRANSPARENCY_PANE_TOP_SPECIFIER_FOOTER"), &stru_251A5E438, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
    {
LABEL_13:
      objc_msgSend(v3, "topGroupSpecifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "_setFooterTextWithLinkForSpecifier:footerText:linkText:actionMethodName:target:", v15, v14, v17, CFSTR("_learnMoreTapped"), v3);

      objc_msgSend(v3, "topGroupSpecifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "reloadSpecifier:animated:", v18, *(unsigned __int8 *)(a1 + 40));

      goto LABEL_14;
    }
    objc_msgSend(v14, "stringByAppendingString:", CFSTR(" "));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_FOOTER"), &stru_251A5E438, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingString:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v14 = (void *)v11;

    goto LABEL_13;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_14, &__block_literal_global_384);
  v12 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v20 = "-[TUIKTPaneViewController _updateTopGroupSpecifierFooter:]_block_invoke";
    _os_log_impl(&dword_2493EE000, v12, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_14:

}

void __58__TUIKTPaneViewController__updateTopGroupSpecifierFooter___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (void)activeConnectionChanged
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 136315650;
  v5 = "-[TUIKTPaneViewController activeConnectionChanged]";
  v6 = 1024;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  _os_log_debug_impl(&dword_2493EE000, log, OS_LOG_TYPE_DEBUG, "%s hasActiveConnection = %d on %{public}@", (uint8_t *)&v4, 0x1Cu);
  OUTLINED_FUNCTION_7();
}

void __50__TUIKTPaneViewController_activeConnectionChanged__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_14 = (uint64_t)v0;

}

- (NSDictionary)handleURLResourceDictionary
{
  return self->_handleURLResourceDictionary;
}

- (void)setHandleURLResourceDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (UINavigationController)optInNavigationController
{
  return self->_optInNavigationController;
}

- (void)setOptInNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_optInNavigationController, a3);
}

- (TUIOptInFlowControllerImpl)optInFlowController
{
  return self->_optInFlowController;
}

- (void)setOptInFlowController:(id)a3
{
  objc_storeStrong((id *)&self->_optInFlowController, a3);
}

- (TUIKTReportToAppleViewController)reportToAppleViewController
{
  return self->_reportToAppleViewController;
}

- (void)setReportToAppleViewController:(id)a3
{
  objc_storeStrong((id *)&self->_reportToAppleViewController, a3);
}

- (TUIDeviceSpecifierProvider)deviceSpecifierProvider
{
  return self->_deviceSpecifierProvider;
}

- (void)setDeviceSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, a3);
}

- (TUIAccountKeySpecifierProvider)accountKeySpecifierProvider
{
  return self->_accountKeySpecifierProvider;
}

- (void)setAccountKeySpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_accountKeySpecifierProvider, a3);
}

- (KTStatus)keyTransparencyStatus
{
  return self->_keyTransparencyStatus;
}

- (void)setKeyTransparencyStatus:(id)a3
{
  objc_storeStrong((id *)&self->_keyTransparencyStatus, a3);
}

- (AAUIRemoteUIController)activeRemoteUIController
{
  return self->_activeRemoteUIController;
}

- (void)setActiveRemoteUIController:(id)a3
{
  objc_storeStrong((id *)&self->_activeRemoteUIController, a3);
}

- (AKAppleIDAuthenticationController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
  objc_storeStrong((id *)&self->_authController, a3);
}

- (AKAppleIDServerResourceLoadDelegate)serverUILoadDelegate
{
  return self->_serverUILoadDelegate;
}

- (void)setServerUILoadDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_serverUILoadDelegate, a3);
}

- (ACAccount)grandSlamAccount
{
  return self->_grandSlamAccount;
}

- (void)setGrandSlamAccount:(id)a3
{
  objc_storeStrong((id *)&self->_grandSlamAccount, a3);
}

- (AAGrandSlamSigner)grandSlamSigner
{
  return self->_grandSlamSigner;
}

- (void)setGrandSlamSigner:(id)a3
{
  objc_storeStrong((id *)&self->_grandSlamSigner, a3);
}

- (RUIObjectModel)currentObjectModel
{
  return self->_currentObjectModel;
}

- (void)setCurrentObjectModel:(id)a3
{
  objc_storeStrong((id *)&self->_currentObjectModel, a3);
}

- (UINavigationController)reportNavigationController
{
  return self->_reportNavigationController;
}

- (void)setReportNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_reportNavigationController, a3);
}

- (TUINetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (KTOptInManager)optInManager
{
  return self->_optInManager;
}

- (void)setOptInManager:(id)a3
{
  objc_storeStrong((id *)&self->_optInManager, a3);
}

- (PSSpecifier)appleIDSpecifier
{
  return self->_appleIDSpecifier;
}

- (void)setAppleIDSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_appleIDSpecifier, a3);
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (PSSpecifier)topGroupSpecifier
{
  return self->_topGroupSpecifier;
}

- (void)setTopGroupSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_topGroupSpecifier, a3);
}

- (UIAlertController)alert
{
  return self->_alert;
}

- (void)setAlert:(id)a3
{
  objc_storeStrong((id *)&self->_alert, a3);
}

- (PSSpecifier)deviceDetailsButtonSpecifier
{
  return self->_deviceDetailsButtonSpecifier;
}

- (void)setDeviceDetailsButtonSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_deviceDetailsButtonSpecifier, a3);
}

- (TUIAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (void)setAppleAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_deviceDetailsButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_topGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_appleIDSpecifier, 0);
  objc_storeStrong((id *)&self->_optInManager, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_reportNavigationController, 0);
  objc_storeStrong((id *)&self->_currentObjectModel, 0);
  objc_storeStrong((id *)&self->_grandSlamSigner, 0);
  objc_storeStrong((id *)&self->_grandSlamAccount, 0);
  objc_storeStrong((id *)&self->_serverUILoadDelegate, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_activeRemoteUIController, 0);
  objc_storeStrong((id *)&self->_keyTransparencyStatus, 0);
  objc_storeStrong((id *)&self->_accountKeySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_deviceSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_reportToAppleViewController, 0);
  objc_storeStrong((id *)&self->_optInFlowController, 0);
  objc_storeStrong((id *)&self->_optInNavigationController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
}

- (void)viewWillAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)viewDidAppear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)viewWillDisappear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)viewDidDisappear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateNoError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateNoIDSAppleID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateCDPWaiting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateDeviceError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateOtherError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateCDPError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateTemporaryError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateTreeReset:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateOptInPendingCDPError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateOptInPendingCDPWaiting:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_setupUIStateIDSDisabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)specifiers
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 1528);
  v4 = a2;
  objc_msgSend(v3, "stateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + (int)*MEMORY[0x24BE756E0]);
  v7 = 136315906;
  v8 = "-[TUIKTPaneViewController specifiers]";
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = a1;
  _os_log_debug_impl(&dword_2493EE000, v4, OS_LOG_TYPE_DEBUG, "%s %{public}@, specifiers = %{public}@ on %{public}@", (uint8_t *)&v7, 0x2Au);

}

- (void)_getDeviceVerificationEnabledForSpecifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2493EE000, a2, a3, "%{public}@ trying update the switch cell that is not there, %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_getDeviceVerificationEnabledForSpecifier:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7[7];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 1528);
  v4 = a2;
  objc_msgSend(v3, "stateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 1528), "isVerifyCDPRunning");
  v7[0] = 136315906;
  OUTLINED_FUNCTION_8_0();
  v8 = a1;
  OUTLINED_FUNCTION_12_0(&dword_2493EE000, v4, v6, "%s %{public}@, isVerifyCDPRunning = %d on %{public}@", (uint8_t *)v7);

  OUTLINED_FUNCTION_6_0();
}

void __59__TUIKTPaneViewController_dismissRemoteUIForViewController__block_invoke_141_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_2493EE000, a2, a3, "%{public}@ CDP repair UI dismissed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_changeOptInState:(uint64_t)a3 requestedOptInChange:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD16E0];
  v6 = a1;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 136315650;
  v10 = "-[TUIKTPaneViewController _changeOptInState:requestedOptInChange:]";
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = a3;
  OUTLINED_FUNCTION_2_0(&dword_2493EE000, v6, v8, "%s requestedOptInChange = %{public}@ on %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_6_0();
}

- (void)_setDeviceVerificationEnabled:(uint64_t)a1 withSpecifier:(void *)a2 .cold.1(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8[7];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 1528);
  v4 = *(void **)(a1 + 1528);
  v5 = a2;
  objc_msgSend(v4, "stateDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v3, "isVerifyCDPRunning");
  v8[0] = 136315906;
  OUTLINED_FUNCTION_8_0();
  v9 = a1;
  OUTLINED_FUNCTION_12_0(&dword_2493EE000, v5, v7, "%s %{public}@, isVerifyCDPRunning = %d on %{public}@", (uint8_t *)v8);

  OUTLINED_FUNCTION_6_0();
}

void __71__TUIKTPaneViewController__setDeviceVerificationEnabled_withSpecifier___block_invoke_240_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 40);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_2493EE000, a2, a3, "%{public}@ trying update the switch cell that is not there, %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_showOptOutConfirmationAlertWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __47__TUIKTPaneViewController__dismissPendingAlert__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "alert");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_0(&dword_2493EE000, v3, v5, "%s alert = %{public}@ on %{public}@", (uint8_t *)v6);

  OUTLINED_FUNCTION_6_0();
}

void __43__TUIKTPaneViewController__handleLaunchURL__block_invoke_285_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6[10];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "appleIDSpecifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315650;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_2_0(&dword_2493EE000, v3, v5, "%s appleIDSpecifier = %{public}@ on %{public}@", (uint8_t *)v6);

  OUTLINED_FUNCTION_6_0();
}

- (void)reloadSpecifiersForProvider:oldSpecifiers:animated:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  __int128 v2;

  LODWORD(v2) = 136315650;
  *(_QWORD *)((char *)&v2 + 4) = "-[TUIKTPaneViewController reloadSpecifiersForProvider:oldSpecifiers:animated:]";
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s reloading specifiers for provider %@ on %{public}@", (_QWORD)v2, DWORD2(v2));
  OUTLINED_FUNCTION_7();
}

- (void)validateDataclassAccessForProvider:specifier:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s not implemented on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIController:createPageWithName:attributes:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)remoteUIController:didRefreshObjectModel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)remoteUIController:willPresentObjectModel:modally:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)remoteUIController:shouldLoadRequest:redirectResponse:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)remoteUIController:didReceiveObjectModel:actionSignal:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s controller = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_cancelButtonForRemoteObjectModelWasTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_addHeadersToRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s request = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_authController
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_attemptUpdateAuthControllerWithActionableResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_getServerUILoadDelegateWithCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s Starting to fetch AKAppleIDServerResourceLoadDelegate on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_getServerUILoadDelegateWithCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s AKAppleIDServerResourceLoadDelegate cache available on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __66__TUIKTPaneViewController__getServerUILoadDelegateWithCompletion___block_invoke_375_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 136315650;
  *(_QWORD *)&v3[4] = "-[TUIKTPaneViewController _getServerUILoadDelegateWithCompletion:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a1;
  *(_WORD *)&v3[22] = 2114;
  OUTLINED_FUNCTION_6(&dword_2493EE000, a2, a3, "%s Error! Unable to get AKAppleIDServerResourceLoadDelegate. %@ on %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *(_QWORD *)(a2 + 32));
  OUTLINED_FUNCTION_7();
}

- (void)_updateTopGroupSpecifierFooter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
