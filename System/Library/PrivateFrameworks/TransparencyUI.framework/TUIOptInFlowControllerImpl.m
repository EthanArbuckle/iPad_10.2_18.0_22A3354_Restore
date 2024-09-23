@implementation TUIOptInFlowControllerImpl

- (TUIOptInFlowControllerImpl)initWithPresentingNavigationController:(id)a3 parentViewController:(id)a4 accountManager:(id)a5 stateManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  TUIOptInFlowControllerImpl *v16;
  TUIOptInFlowControllerImpl *v17;
  id v18;
  uint64_t v19;
  KTOptInManager *optInManager;
  uint64_t v21;
  ACAccountStore *accountStore;
  uint64_t v23;
  AIDAServiceOwnersManager *serviceOwnersManager;
  NSMutableArray *v25;
  NSMutableArray *devicesWithIssuesIdentifiers;
  TUIAppleAccountManager *v27;
  TUIAppleAccountManager *appleAccountManager;
  id v29;
  uint64_t v30;
  IDSService *idsService;
  id v32;
  uint64_t v33;
  IDSSignInController *idsSignInController;
  objc_super v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  TUIOptInFlowControllerImpl *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_1);
  v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316418;
    v38 = "-[TUIOptInFlowControllerImpl initWithPresentingNavigationController:parentViewController:accountManager:stateManager:]";
    v39 = 2114;
    v40 = v11;
    v41 = 2114;
    v42 = v12;
    v43 = 2114;
    v44 = v13;
    v45 = 2114;
    v46 = v14;
    v47 = 2114;
    v48 = self;
    _os_log_debug_impl(&dword_2493EE000, v15, OS_LOG_TYPE_DEBUG, "%s presentingNavigationController = %{public}@, parentViewController = %{public}@, accountManager = %{public}@, stateManager = %{public}@ on %{public}@", buf, 0x3Eu);
  }
  v36.receiver = self;
  v36.super_class = (Class)TUIOptInFlowControllerImpl;
  v16 = -[TUIOptInFlowControllerImpl init](&v36, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_stateManager, a6);
    objc_storeStrong((id *)&v17->_accountManager, a5);
    objc_storeStrong((id *)&v17->_parentViewController, a4);
    objc_storeStrong((id *)&v17->_presentingNavigationController, a3);
    v18 = objc_alloc(MEMORY[0x24BEBA810]);
    v19 = objc_msgSend(v18, "initWithApplication:", *MEMORY[0x24BEBA860]);
    optInManager = v17->_optInManager;
    v17->_optInManager = (KTOptInManager *)v19;

    objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
    v21 = objc_claimAutoreleasedReturnValue();
    accountStore = v17->_accountStore;
    v17->_accountStore = (ACAccountStore *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x24BE060E0]), "initWithAccountStore:", v17->_accountStore);
    serviceOwnersManager = v17->_serviceOwnersManager;
    v17->_serviceOwnersManager = (AIDAServiceOwnersManager *)v23;

    v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    devicesWithIssuesIdentifiers = v17->_devicesWithIssuesIdentifiers;
    v17->_devicesWithIssuesIdentifiers = v25;

    v27 = -[TUIAppleAccountManager initWithAccountStore:]([TUIAppleAccountManager alloc], "initWithAccountStore:", v17->_accountStore);
    appleAccountManager = v17->_appleAccountManager;
    v17->_appleAccountManager = v27;

    v29 = objc_alloc(MEMORY[0x24BE4FCB8]);
    v30 = objc_msgSend(v29, "initWithService:", *MEMORY[0x24BE4FB70]);
    idsService = v17->_idsService;
    v17->_idsService = (IDSService *)v30;

    v32 = objc_alloc(MEMORY[0x24BE4FCD8]);
    v33 = objc_msgSend(v32, "initWithQueue:", MEMORY[0x24BDAC9B8]);
    idsSignInController = v17->_idsSignInController;
    v17->_idsSignInController = (IDSSignInController *)v33;

  }
  return v17;
}

void __118__TUIOptInFlowControllerImpl_initWithPresentingNavigationController_parentViewController_accountManager_stateManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)beginOptInFlow
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

void __44__TUIOptInFlowControllerImpl_beginOptInFlow__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)beginOptOutFlow
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

void __45__TUIOptInFlowControllerImpl_beginOptOutFlow__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)showWelcomeScreen
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

void __47__TUIOptInFlowControllerImpl_showWelcomeScreen__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __47__TUIOptInFlowControllerImpl_showWelcomeScreen__block_invoke_34(uint64_t a1)
{
  id WeakRetained;
  TUIOBWelcomeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = -[TUIOBWelcomeController initWithViewModel:]([TUIOBWelcomeController alloc], "initWithViewModel:", *(_QWORD *)(a1 + 32));
    objc_msgSend(WeakRetained, "setWelcomeController:", v3);

    objc_msgSend(WeakRetained, "welcomeController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTarget:action:forControlEvents:", WeakRetained, sel__startFlowPressed, 64);

    objc_msgSend(WeakRetained, "welcomeController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "secondaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTarget:action:forControlEvents:", WeakRetained, sel__dismiss, 64);

    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, WeakRetained, sel__dismiss);
    objc_msgSend(WeakRetained, "welcomeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setLeftBarButtonItem:", v8);

    objc_msgSend(WeakRetained, "presentingNavigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "welcomeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushViewController:animated:", v12, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_35_0);
    v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v14 = 136315138;
      v15 = "-[TUIOptInFlowControllerImpl showWelcomeScreen]_block_invoke";
      _os_log_impl(&dword_2493EE000, v13, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v14, 0xCu);
    }
  }

}

void __47__TUIOptInFlowControllerImpl_showWelcomeScreen__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)showActivityIndicatorForViewController:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = (objc_class *)MEMORY[0x24BDF67D0];
  v4 = a3;
  v7 = (id)objc_msgSend([v3 alloc], "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v7, "setHidesWhenStopped:", 1);
  objc_msgSend(v7, "startAnimating");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithCustomView:", v7);
  objc_msgSend(v4, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setRightBarButtonItem:", v5);
}

- (void)dismissPendingPopupUI
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

void __51__TUIOptInFlowControllerImpl_dismissPendingPopupUI__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __51__TUIOptInFlowControllerImpl_dismissPendingPopupUI__block_invoke_44(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "stateManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isVerifyCDPRunning");

    if ((v4 & 1) == 0)
      objc_msgSend(v2, "_dismissWithoutStateChange");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_45_0);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[TUIOptInFlowControllerImpl dismissPendingPopupUI]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __51__TUIOptInFlowControllerImpl_dismissPendingPopupUI__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_dismissWithoutStateChange
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

void __56__TUIOptInFlowControllerImpl__dismissWithoutStateChange__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_dismiss
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

void __38__TUIOptInFlowControllerImpl__dismiss__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_dismissOptOutFlow
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

void __48__TUIOptInFlowControllerImpl__dismissOptOutFlow__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_startFlowPressed
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

void __47__TUIOptInFlowControllerImpl__startFlowPressed__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)performAccountChecksForFlow:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[6];

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_50);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl performAccountChecksForFlow:].cold.1();
  if (self->_welcomeController)
  {
    -[UINavigationController topViewController](self->_presentingNavigationController, "topViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOptInFlowControllerImpl showActivityIndicatorForViewController:](self, "showActivityIndicatorForViewController:", v5);

    -[TUIOBWelcomeController primaryButton](self->_welcomeController, "primaryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEnabled:", 0);

    -[TUIOBWelcomeController secondaryButton](self->_welcomeController, "secondaryButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

  }
  -[TUIKTStateManager setIsVerifyCDPRunning:](self->_stateManager, "setIsVerifyCDPRunning:", 1);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_51;
  v8[3] = &unk_251A5B120;
  v8[4] = self;
  v8[5] = a3;
  -[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:](self, "_verifyCDPWithCompletion:", v8);
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_51(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v5 = a3;
  v6 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "stateManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setIsVerifyCDPRunning:", 0);

  if (!a2)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_66);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
      __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_51_cold_2();
    objc_msgSend(v5, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BE1A368]))
    {
      if (objc_msgSend(v5, "code") == -5307)
      {
LABEL_19:

LABEL_20:
        objc_msgSend(*v6, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "optInFlowResultWithStateUpdate");

        goto LABEL_21;
      }
      v10 = objc_msgSend(v5, "code");

      if (v10 == 5095)
        goto LABEL_20;
    }
    else
    {

    }
    v11 = *v6;
    objc_msgSend(*v6, "welcomeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v11, "_showErrorAlertWithError:presentingViewController:", v5, v9);
    }
    else
    {
      objc_msgSend(*v6, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_showErrorAlertWithError:presentingViewController:", v5, v12);

    }
    goto LABEL_19;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_52);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_51_cold_1();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53;
  v14[3] = &unk_251A5B0D8;
  v8 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(a1 + 40);
  v14[4] = v8;
  v15 = v5;
  objc_msgSend(v8, "_verifyMessages:", v14);

LABEL_21:
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53(uint64_t a1, char a2)
{
  uint64_t v3;
  _QWORD *v4;
  TUIOBMissingAppleIDViewModel *v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  TUIOBMismatchedAppleIDViewModel *v20;
  void *v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = (_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 != 1 || (a2 & 1) != 0)
  {
    if (v3 != 1)
      goto LABEL_10;
    v6 = (id *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 32), "_idsAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "aida_dsid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v6, "_appleAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "aa_personID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if ((v11 & 1) == 0)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_58);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
        __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53_cold_2();
      v20 = -[TUIOBMismatchedAppleIDViewModel initWithFlow:]([TUIOBMismatchedAppleIDViewModel alloc], "initWithFlow:", *v4);
      objc_msgSend(*v6, "showAppleIDErrorForFlow:withViewModel:", *v4, v20);

    }
    else
    {
LABEL_10:
      objc_msgSend(*(id *)(a1 + 40), "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqual:", *MEMORY[0x24BEBA890]);

      if (v13)
      {
        v14 = *(void **)(a1 + 32);
        v15 = *(_QWORD *)(a1 + 40);
        objc_msgSend(v14, "welcomeController");
        v16 = objc_claimAutoreleasedReturnValue();
        v22 = (id)v16;
        if (v16)
        {
          objc_msgSend(v14, "_showErrorAlertWithError:presentingViewController:", v15, v16);
        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "parentViewController");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_showErrorAlertWithError:presentingViewController:", v15, v21);

        }
      }
      else if ((unint64_t)(*v4 - 1) > 1)
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_63);
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
          __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53_cold_1();
      }
      else
      {
        if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
          dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_61);
        v17 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
        if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
        {
          v18 = *(_QWORD *)(a1 + 32);
          v19 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138543618;
          v24 = v18;
          v25 = 1024;
          v26 = v19;
          _os_log_impl(&dword_2493EE000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ attempting to set opt in state (%d)...", buf, 0x12u);
        }
        objc_msgSend(*(id *)(a1 + 32), "_attemptToSetOptInWithState:", *(_QWORD *)(a1 + 48) == 1);
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_55);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
      __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53_cold_3();
    v5 = -[TUIOBMissingAppleIDViewModel initWithFlow:]([TUIOBMissingAppleIDViewModel alloc], "initWithFlow:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "showAppleIDErrorForFlow:withViewModel:", *(_QWORD *)(a1 + 48), v5);

  }
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_2_54()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_57()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_60()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_62()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_65()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)showAppleIDErrorForFlow:(unint64_t)a3 withViewModel:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10[2];
  id location;

  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_68);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl showAppleIDErrorForFlow:withViewModel:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke_69;
  v8[3] = &unk_251A5B188;
  objc_copyWeak(v10, &location);
  v9 = v6;
  v10[1] = (id)a3;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v8);

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke_69(uint64_t a1)
{
  id WeakRetained;
  TUIOBWelcomeController *v3;
  void *v4;
  uint64_t v5;
  char **v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = -[TUIOBWelcomeController initWithViewModel:]([TUIOBWelcomeController alloc], "initWithViewModel:", *(_QWORD *)(a1 + 32));
    -[TUIOBWelcomeController primaryButton](v3, "primaryButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:action:forControlEvents:", WeakRetained, sel__openMessagesSettings, 64);

    v5 = *(_QWORD *)(a1 + 48);
    if (v5 == 1)
    {
      v6 = &selRef__dismiss;
    }
    else
    {
      if (v5 != 2)
      {
LABEL_11:
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, WeakRetained, sel__dismiss);
        -[OBBaseWelcomeController navigationItem](v3, "navigationItem");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setLeftBarButtonItem:", v9);

        if (*(_QWORD *)(a1 + 48) == 2)
        {
          objc_msgSend(WeakRetained, "delegate");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "presentOptInNavigationController");

        }
        objc_msgSend(WeakRetained, "presentingNavigationController");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pushViewController:animated:", v3, 1);

        goto LABEL_14;
      }
      v6 = &selRef__dismissOptOutFlow;
    }
    -[TUIOBWelcomeController secondaryButton](v3, "secondaryButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addTarget:action:forControlEvents:", WeakRetained, *v6, 64);

    goto LABEL_11;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_70);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    v13 = 136315138;
    v14 = "-[TUIOptInFlowControllerImpl showAppleIDErrorForFlow:withViewModel:]_block_invoke";
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v13, 0xCu);
  }
LABEL_14:

}

void __68__TUIOptInFlowControllerImpl_showAppleIDErrorForFlow_withViewModel___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_showOptInErrorForViewModel:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_75);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl _showOptInErrorForViewModel:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke_76;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke_76(uint64_t a1)
{
  id WeakRetained;
  TUIOBWelcomeController *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = -[TUIOBWelcomeController initWithViewModel:]([TUIOBWelcomeController alloc], "initWithViewModel:", *(_QWORD *)(a1 + 32));
    -[TUIOBWelcomeController primaryButton](v3, "primaryButton");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTarget:action:forControlEvents:", WeakRetained, sel__dismiss, 64);

    -[TUIOBWelcomeController secondaryButton](v3, "secondaryButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addTarget:action:forControlEvents:", WeakRetained, sel__openTrustedDeviceList, 64);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, WeakRetained, sel__dismiss);
    -[OBBaseWelcomeController navigationItem](v3, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLeftBarButtonItem:", v6);

    if (objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild"))
    {
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addTarget:action:forControlEvents:", WeakRetained, sel__openTapToRadar, 64);
      objc_msgSend(v8, "setTitle:forState:", CFSTR("[INTERNAL] Tap-To-Radar"), 0);
      -[TUIOBWelcomeController buttonTray](v3, "buttonTray");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addButton:", v8);

    }
    objc_msgSend(WeakRetained, "presentingNavigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v3, 1);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_77);
    v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315138;
      v13 = "-[TUIOptInFlowControllerImpl _showOptInErrorForViewModel:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v11, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __58__TUIOptInFlowControllerImpl__showOptInErrorForViewModel___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

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

void __51__TUIOptInFlowControllerImpl__openMessagesSettings__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_openTrustedDeviceList
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

void __52__TUIOptInFlowControllerImpl__openTrustedDeviceList__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_openSettingsURL:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_89);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl _openSettingsURL:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_90;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_90(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "optInFlowResultWithStateUpdate");

    objc_msgSend(v3, "presentingNavigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_92;
    v7[3] = &unk_251A5B270;
    v8 = *(id *)(a1 + 32);
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_91);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[TUIOptInFlowControllerImpl _openSettingsURL:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __47__TUIOptInFlowControllerImpl__openSettingsURL___block_invoke_92(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openSensitiveURL:withOptions:", *(_QWORD *)(a1 + 32), 0);

}

- (void)dismissRemoteUIForViewController:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  location = 0;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke;
  v10[3] = &unk_251A5B318;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke(id *a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    objc_msgSend(a1[4], "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_96);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
        __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_cold_1();
      v4 = a1[4];
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_97;
      v12[3] = &unk_251A5B270;
      v12[4] = WeakRetained;
      objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v12);
    }
    else
    {
      objc_msgSend(WeakRetained, "welcomeController");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        objc_msgSend(a1[5], "domain");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BE1A368]) & 1) != 0)
        {
          v9 = objc_msgSend(a1[5], "code");

          if (v9 == -5307)
          {
            objc_msgSend(WeakRetained, "welcomeController");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11[0] = MEMORY[0x24BDAC760];
            v11[1] = 3221225472;
            v11[2] = __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_100;
            v11[3] = &unk_251A5B270;
            v11[4] = WeakRetained;
            objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v11);

          }
        }
        else
        {

        }
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_94);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v14 = "-[TUIOptInFlowControllerImpl dismissRemoteUIForViewController:error:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_95()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_97()
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_99);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_97_cold_1();
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_2_98()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_100()
{
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_102);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_100_cold_1();
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_2_101()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_verifyCDPWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD *v19;
  id v20;
  id location;
  _QWORD v22[3];
  BOOL v23;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_103);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:].cold.1();
  -[TUIOptInFlowControllerImpl welcomeController](self, "welcomeController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[TUIOptInFlowControllerImpl presentingNavigationController](self, "presentingNavigationController");
  else
    -[TUIOptInFlowControllerImpl parentViewController](self, "parentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BE1AA20]);
  objc_msgSend(MEMORY[0x24BE1A3D0], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "primaryAccountAltDSID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithAltDSID:", v9);

  objc_msgSend(v10, "setSecurityUpgradeContext:", *MEMORY[0x24BE0AC50]);
  objc_msgSend(v10, "setDeviceToDeviceEncryptionUpgradeUIStyle:", 1);
  objc_msgSend(v10, "setDeviceToDeviceEncryptionUpgradeType:", 0);
  objc_msgSend(v10, "setForceInlinePresentation:", 1);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_SPECIFIER_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFeatureName:", v12);

  objc_msgSend(v10, "setPresentingViewController:", v6);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D30]), "initWithFlowContext:withPresentingViewController:", v10, v6);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v23 = +[TUIUtils isHSA2](TUIUtils, "isHSA2");
  location = 0;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_113;
  v16[3] = &unk_251A5B3E8;
  objc_copyWeak(&v20, &location);
  v14 = v4;
  v18 = v14;
  v19 = v22;
  v15 = v6;
  v17 = v15;
  objc_msgSend(v13, "verifyAndRepairManateeWithCompletion:", v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
  _Block_object_dispose(v22, 8);

}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_113(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void (*v12)(void);
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  char v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_114);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_116);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    if (WeakRetained)
      goto LABEL_10;
LABEL_19:
    v15 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -120, CFSTR("object deallocated"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v15 + 16))(v15, 0, v16);

    goto LABEL_20;
  }
  *(_DWORD *)buf = 136315906;
  v23 = "-[TUIOptInFlowControllerImpl _verifyCDPWithCompletion:]_block_invoke_2";
  v24 = 1024;
  v25 = a2;
  v26 = 2114;
  v27 = v5;
  v28 = 2114;
  v29 = WeakRetained;
  _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s isVerified = %d, error = %{public}@ on %{public}@", buf, 0x26u);
  if (!WeakRetained)
    goto LABEL_19;
LABEL_10:
  if (a2)
  {
    objc_msgSend(WeakRetained, "welcomeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(WeakRetained, "presentingNavigationController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "showActivityIndicatorForViewController:", v11);

    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_msgSend(WeakRetained, "optInManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_120;
      v17[3] = &unk_251A5B3C0;
      v14 = *(id *)(a1 + 40);
      v21 = a2;
      v20 = v14;
      v17[4] = WeakRetained;
      v18 = *(id *)(a1 + 32);
      v19 = v5;
      objc_msgSend(v13, "waitForIDSRegistration:", v17);

      goto LABEL_20;
    }
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(WeakRetained, "dismissRemoteUIForViewController:error:", *(_QWORD *)(a1 + 32), v5);
    v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v12();
LABEL_20:

}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_115()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_120(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void (*v5)(void);
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_122);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v6 = 138543362;
      v7 = v3;
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "waitForIDSRegistration error after verifying CDP %{public}@", (uint8_t *)&v6, 0xCu);
    }
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "dismissRemoteUIForViewController:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v5();

}

void __55__TUIOptInFlowControllerImpl__verifyCDPWithCompletion___block_invoke_2_121()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_attemptToSetOptInWithState:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[4];
  id v6;
  BOOL v7;
  id location;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_124);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    -[TUIOptInFlowControllerImpl _attemptToSetOptInWithState:].cold.1();
    if (v3)
      goto LABEL_5;
  }
  else if (v3)
  {
LABEL_5:
    location = 0;
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_125;
    v5[3] = &unk_251A5B4D8;
    objc_copyWeak(&v6, &location);
    v7 = v3;
    -[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:](self, "_beginIneligibleDevicesRemoteUIRequestWithCompletion:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
    return;
  }
  -[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:](self, "_continueAttemptToSetOptInWithState:", 0);
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_125(uint64_t a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  char v12;
  _BYTE buf[24];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BEBA838], "logger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logResultForEvent:hardFailure:result:", CFSTR("KTIneligibleDevicesUI"), 1, v5);

    if (a2)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_129);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
        __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_125_cold_1();
    }
    else
    {
      objc_msgSend(WeakRetained, "_dismissIneligibleDevicesRemoteUI");
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_131);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
        __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_125_cold_2();
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, WeakRetained);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_132;
      block[3] = &unk_251A5B4B0;
      objc_copyWeak(&v11, (id *)buf);
      v12 = *(_BYTE *)(a1 + 40);
      v10 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      objc_destroyWeak(&v11);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_126);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIOptInFlowControllerImpl _attemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_128()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_130()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_132(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showOptInResultError:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_134);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIOptInFlowControllerImpl _attemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_2_133()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_continueAttemptToSetOptInWithState:(BOOL)a3
{
  _BOOL8 v3;
  KTOptInManager *optInManager;
  _QWORD v6[4];
  id v7;
  BOOL v8;
  id location;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_135);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  optInManager = self->_optInManager;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_136;
  v6[3] = &unk_251A5B640;
  objc_copyWeak(&v7, &location);
  v8 = v3;
  -[KTOptInManager setOptInState:detailedCompletionBlock:](optInManager, "setOptInState:detailedCompletionBlock:", v3, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_136(uint64_t a1, const __CFString *a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __CFString *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  const __CFString *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  id v33;
  id val;
  _QWORD v35[4];
  id v36;
  _QWORD block[4];
  id v38;
  id v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE buf[12];
  __int16 v47;
  const __CFString *v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v33 = a4;
  val = objc_loadWeakRetained((id *)(a1 + 32));
  v32 = v7;
  if (val)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_139);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = val;
      v47 = 2048;
      v48 = a2;
      v49 = 2114;
      v50 = v7;
      v51 = 2114;
      v52 = v33;
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setOptInState result = %ld, loggableDatas = %{public}@, error = %{public}@", buf, 0x2Au);
    }
    objc_msgSend(val, "devicesWithIssuesIdentifiers", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeAllObjects");

    if (v33)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_141);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
        __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_136_cold_2();
      if (!+[TUIUtils isNetworkError:](TUIUtils, "isNetworkError:", v33))
      {
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v10 = v7;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v42;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v42 != v12)
                objc_enumerationMutation(v10);
              v14 = *(__CFString **)(*((_QWORD *)&v41 + 1) + 8 * v13);
              if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
                dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_143);
              v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
              if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = val;
                v47 = 2114;
                v48 = v14;
                _os_log_debug_impl(&dword_2493EE000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@", buf, 0x16u);
              }
              if (!-[__CFString result](v14, "result"))
              {
                if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
                  dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_145);
                v16 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
                if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
                {
                  v19 = v16;
                  -[__CFString deviceID](v14, "deviceID");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "kt_hexString");
                  v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
                  -[__CFString failure](v14, "failure");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = val;
                  v47 = 2114;
                  v48 = v21;
                  v49 = 2114;
                  v50 = v22;
                  _os_log_error_impl(&dword_2493EE000, v19, OS_LOG_TYPE_ERROR, "%{public}@ KTResultFailed on deviceId %{public}@, failure = %{public}@", buf, 0x20u);

                }
                objc_msgSend(val, "devicesWithIssuesIdentifiers");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                -[__CFString deviceID](v14, "deviceID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "addObject:", v18);

              }
              ++v13;
            }
            while (v11 != v13);
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
          }
          while (v11);
        }

      }
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_147);
      v23 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
        __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_136_cold_1(val, v23);
      *(_QWORD *)buf = 0;
      objc_initWeak((id *)buf, val);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_148;
      block[3] = &unk_251A5B4B0;
      objc_copyWeak(&v39, (id *)buf);
      v40 = *(_BYTE *)(v31 + 40);
      v24 = v33;
      v38 = v24;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend(MEMORY[0x24BEBA838], "logger");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logResultForEvent:hardFailure:result:", CFSTR("KTOptIn"), 1, v24);

      objc_destroyWeak(&v39);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_152);
      v27 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEFAULT))
      {
        v28 = CFSTR("YES");
        if (!*(_BYTE *)(v31 + 40))
          v28 = CFSTR("NO");
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = val;
        v47 = 2114;
        v48 = v28;
        _os_log_impl(&dword_2493EE000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ successfully set new opt in state: %{public}@", buf, 0x16u);
      }
      objc_msgSend(val, "delegate");
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v29, "optInFlowResultWithStateUpdate");

      objc_msgSend(val, "welcomeController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v29) = v30 == 0;

      if ((v29 & 1) == 0)
      {
        *(_QWORD *)buf = 0;
        objc_initWeak((id *)buf, val);
        v35[0] = MEMORY[0x24BDAC760];
        v35[1] = 3221225472;
        v35[2] = __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_157;
        v35[3] = &unk_251A5AF70;
        objc_copyWeak(&v36, (id *)buf);
        dispatch_async(MEMORY[0x24BDAC9B8], v35);
        objc_destroyWeak(&v36);
        objc_destroyWeak((id *)buf);
      }
    }
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_137);
    v26 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v26, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_138()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_140()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_142()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_144()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_146()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_148(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_showOptInResultError:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_150);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_2_149()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_151()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_157(uint64_t a1)
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
    objc_msgSend(WeakRetained, "welcomeController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_159);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_2_158()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_showOptInResultError:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  TUIOBMissingAppleIDViewModel *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v6 = a4;
  if (!v4)
  {
LABEL_10:
    -[TUIOptInFlowControllerImpl welcomeController](self, "welcomeController");
    v7 = (TUIOBMissingAppleIDViewModel *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:](self, "_showErrorAlertWithError:presentingViewController:", v6, v7);
    }
    else
    {
      -[TUIOptInFlowControllerImpl parentViewController](self, "parentViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:](self, "_showErrorAlertWithError:presentingViewController:", v6, v8);

    }
    goto LABEL_13;
  }
  if (!-[NSMutableArray count](self->_devicesWithIssuesIdentifiers, "count"))
  {
    if (+[TUIUtils isMismatchedAccountError:](TUIUtils, "isMismatchedAccountError:", v6))
    {
      v7 = -[TUIOBMissingAppleIDViewModel initWithFlow:]([TUIOBMissingAppleIDViewModel alloc], "initWithFlow:", 1);
      -[TUIOptInFlowControllerImpl showAppleIDErrorForFlow:withViewModel:](self, "showAppleIDErrorForFlow:withViewModel:", 1, v7);
      goto LABEL_13;
    }
    goto LABEL_10;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_161);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl _showOptInResultError:error:].cold.1();
  v7 = -[TUIOBUpdateDevicesViewModel initWithAccountManager:devicesWithIssuesIdentifiers:]([TUIOBUpdateDevicesViewModel alloc], "initWithAccountManager:devicesWithIssuesIdentifiers:", self->_accountManager, self->_devicesWithIssuesIdentifiers);
  -[TUIOptInFlowControllerImpl _showOptInErrorForViewModel:](self, "_showOptInErrorForViewModel:", v7);
LABEL_13:

  -[TUIOptInFlowControllerImpl delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "optInFlowResultWithStateUpdate");

}

void __58__TUIOptInFlowControllerImpl__showOptInResultError_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_beginIneligibleDevicesRemoteUIRequestWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, id);
  void *v5;
  void *v6;
  void *v7;
  AAUIGrandSlamRemoteUIPresenter *v8;
  AAUIGrandSlamRemoteUIPresenter *ineligibleDevicesRemoteUIPresenter;
  id v10;
  AAUIGrandSlamRemoteUIPresenter *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  void (**v15)(id, _QWORD, id);
  id v16;
  id location;

  v4 = (void (**)(id, _QWORD, id))a3;
  objc_msgSend(MEMORY[0x24BE0ADF0], "bagForAltDSID:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contactKeyVerificationIneligibleDevicesURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_164);
  v7 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    -[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:].cold.1(v7, v6, (uint64_t)self);
    if (v6)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -120, CFSTR("no ineligible devices remote UI URL"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v4[2](v4, 0, v12);
    goto LABEL_8;
  }
  if (!v6)
    goto LABEL_7;
LABEL_5:
  *(_WORD *)&self->_ineligibleDevicesRemoteUICanceled = 0;
  v8 = (AAUIGrandSlamRemoteUIPresenter *)objc_msgSend(objc_alloc(MEMORY[0x24BE04D18]), "initWithAccountManager:presenter:", self->_accountManager, self->_presentingNavigationController);
  ineligibleDevicesRemoteUIPresenter = self->_ineligibleDevicesRemoteUIPresenter;
  self->_ineligibleDevicesRemoteUIPresenter = v8;

  -[AAUIGrandSlamRemoteUIPresenter setDelegate:](self->_ineligibleDevicesRemoteUIPresenter, "setDelegate:", self);
  v10 = objc_alloc_init(MEMORY[0x24BDB7458]);
  objc_msgSend(v10, "setURL:", v6);
  objc_msgSend(v10, "setHTTPMethod:", CFSTR("GET"));
  location = 0;
  objc_initWeak(&location, self);
  v11 = self->_ineligibleDevicesRemoteUIPresenter;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_171;
  v13[3] = &unk_251A5B7B8;
  objc_copyWeak(&v16, &location);
  v15 = v4;
  v12 = v10;
  v14 = v12;
  -[AAUIGrandSlamRemoteUIPresenter loadRequest:completion:](v11, "loadRequest:completion:", v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
LABEL_8:

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_171(id *a1, int a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  _BYTE buf[12];
  __int16 v17;
  int v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_172);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_174);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (!os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    if (WeakRetained)
      goto LABEL_10;
LABEL_14:
    v10 = (void (**)(id, _QWORD, void *))a1[5];
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -120, CFSTR("object deallocated"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v11);

    goto LABEL_15;
  }
  *(_DWORD *)buf = 136315906;
  *(_QWORD *)&buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke_2";
  v17 = 1024;
  v18 = a2;
  v19 = 2114;
  v20 = v5;
  v21 = 2114;
  v22 = WeakRetained;
  _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: loadRequest result = %d, error = %{public}@ on %{public}@", buf, 0x26u);
  if (!WeakRetained)
    goto LABEL_14;
LABEL_10:
  if (+[TUIUtils isAuthError:](TUIUtils, "isAuthError:", v5))
  {
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    objc_msgSend(WeakRetained, "appleAccountManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_175;
    v12[3] = &unk_251A5B790;
    objc_copyWeak(&v15, (id *)buf);
    v14 = a1[5];
    v13 = a1[4];
    objc_msgSend(v9, "silentRenewAppleAccountWithCompletionHandler:", v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    (*((void (**)(void))a1[5] + 2))();
  }
LABEL_15:

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_173()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_175(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _BYTE buf[12];
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_177);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", buf, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_179);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke_2";
    v17 = 2048;
    v18 = a2;
    v19 = 2114;
    v20 = v5;
    v21 = 2114;
    v22 = WeakRetained;
    _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: silent renew result = %ld, error = %{public}@ on %{public}@", buf, 0x2Au);
    if (WeakRetained)
      goto LABEL_10;
LABEL_12:
    v11 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -120, CFSTR("object deallocated"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v12);

    goto LABEL_13;
  }
  if (!WeakRetained)
    goto LABEL_12;
LABEL_10:
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, WeakRetained);
  objc_msgSend(WeakRetained, "ineligibleDevicesRemoteUIPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_180;
  v13[3] = &unk_251A5B768;
  objc_copyWeak(&v15, (id *)buf);
  v14 = *(id *)(a1 + 40);
  objc_msgSend(v9, "loadRequest:completion:", v10, v13);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
LABEL_13:

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_2_176()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_178()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_180(uint64_t a1, int a2, void *a3)
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
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_182);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315138;
      v10 = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_ERROR, "%s, block strong self is nil", (uint8_t *)&v9, 0xCu);
    }
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_184);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    v9 = 136315906;
    v10 = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]_block_invoke_2";
    v11 = 1024;
    v12 = a2;
    v13 = 2114;
    v14 = v5;
    v15 = 2114;
    v16 = WeakRetained;
    _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: retry loadRequest result = %d, error = %{public}@ on %{public}@", (uint8_t *)&v9, 0x26u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_2_181()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __83__TUIOptInFlowControllerImpl__beginIneligibleDevicesRemoteUIRequestWithCompletion___block_invoke_183()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_dismissIneligibleDevicesRemoteUI
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

void __63__TUIOptInFlowControllerImpl__dismissIneligibleDevicesRemoteUI__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)_showErrorAlertWithError:(id)a3 presentingViewController:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_187);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    -[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_188;
  v10[3] = &unk_251A5B318;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_188(uint64_t a1)
{
  id WeakRetained;
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = +[TUIUtils isNetworkError:](TUIUtils, "isNetworkError:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CONTACT_KEY_VERIFICATION_NOT_AVAILABLE"), &stru_251A5E438, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CHECK_YOUR_NETWORK_CONNECTION"), &stru_251A5E438, CFSTR("Localizable"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_OPTIN_ERROR"), &stru_251A5E438, CFSTR("Localizable"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild") || (v10 = *(void **)(a1 + 32)) == 0)
      {
        v12 = 0;
        goto LABEL_13;
      }
      v11 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v10, "description");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@"), v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v8;

LABEL_13:
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v6, v12, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_251A5E438, CFSTR("Localizable"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_203;
    v23[3] = &unk_251A5B840;
    v24 = *(id *)(a1 + 40);
    objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 1, v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addAction:", v18);

    if (objc_msgSend(MEMORY[0x24BDFC310], "isInternalBuild"))
    {
      v19 = (void *)MEMORY[0x24BDF67E8];
      v21[0] = v17;
      v21[1] = 3221225472;
      v21[2] = __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_2_207;
      v21[3] = &unk_251A5B868;
      v21[4] = WeakRetained;
      v22 = *(id *)(a1 + 40);
      objc_msgSend(v19, "actionWithTitle:style:handler:", CFSTR("[INTERNAL] Tap-to-Radar"), 0, v21);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addAction:", v20);

    }
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v13, 1, 0);

    goto LABEL_16;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_189);
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v26 = "-[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:]_block_invoke";
    _os_log_impl(&dword_2493EE000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
  }
LABEL_16:

}

void __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

uint64_t __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_203(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __80__TUIOptInFlowControllerImpl__showErrorAlertWithError_presentingViewController___block_invoke_2_207(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_openTapToRadar");
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_openTapToRadar
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

void __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_209()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_218(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "kt_hexString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __45__TUIOptInFlowControllerImpl__openTapToRadar__block_invoke_225()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (id)_appleAccount
{
  return (id)-[ACAccountStore aa_primaryAppleAccount](self->_accountStore, "aa_primaryAppleAccount");
}

- (id)_idsAccount
{
  return (id)-[AIDAServiceOwnersManager accountForService:](self->_serviceOwnersManager, "accountForService:", *MEMORY[0x24BE06098]);
}

- (void)_verifyMessages:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  IDSSignInController *idsSignInController;
  _QWORD v8[5];
  void (**v9)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))a3;
  if ((-[IDSSignInController isiMessageEnabled](self->_idsSignInController, "isiMessageEnabled") & 1) == 0)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_227);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
      -[TUIOptInFlowControllerImpl _verifyMessages:].cold.2();
    goto LABEL_12;
  }
  -[IDSService aliases](self->_idsService, "aliases");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_229);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
      -[TUIOptInFlowControllerImpl _verifyMessages:].cold.1();
LABEL_12:
    v4[2](v4, 0);
    goto LABEL_13;
  }
  idsSignInController = self->_idsSignInController;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_230;
  v8[3] = &unk_251A5B9B8;
  v8[4] = self;
  v9 = v4;
  -[IDSSignInController statusOfUsersOnService:withCompletion:](idsSignInController, "statusOfUsersOnService:withCompletion:", 1, v8);

LABEL_13:
}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_228()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_230(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  char v9;
  _QWORD v10[4];
  id v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a2, "serviceUserInfos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "type") == 1 && objc_msgSend(v8, "status") == 3)
        {
          if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
            dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_231);
          if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
            __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_230_cold_2();

          v9 = 1;
          goto LABEL_20;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_233);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_ERROR))
    __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_230_cold_1();
  v9 = 0;
LABEL_20:
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_235;
  v10[3] = &unk_251A5ADF0;
  v11 = *(id *)(a1 + 40);
  v12 = v9;
  dispatch_async(MEMORY[0x24BDAC9B8], v10);

}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_232()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

uint64_t __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_235(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  TUIOptInFlowControllerImpl *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_237);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    v12 = 136315906;
    v13 = "-[TUIOptInFlowControllerImpl remoteUIRequestComplete:error:]";
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    v18 = 2114;
    v19 = self;
    _os_log_debug_impl(&dword_2493EE000, v8, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: request = %{public}@, error = %{public}@ on %{public}@", (uint8_t *)&v12, 0x2Au);
    if (!v7)
      goto LABEL_9;
  }
  else if (!v7)
  {
    goto LABEL_9;
  }
  -[TUIOptInFlowControllerImpl welcomeController](self, "welcomeController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:](self, "_showErrorAlertWithError:presentingViewController:", v7, v9);
  }
  else
  {
    -[TUIOptInFlowControllerImpl parentViewController](self, "parentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIOptInFlowControllerImpl _showErrorAlertWithError:presentingViewController:](self, "_showErrorAlertWithError:presentingViewController:", v7, v10);

  }
  -[TUIOptInFlowControllerImpl delegate](self, "delegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "optInFlowResultWithStateUpdate");

LABEL_9:
}

void __60__TUIOptInFlowControllerImpl_remoteUIRequestComplete_error___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)remoteUIWillLoadRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_238);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl remoteUIWillLoadRequest:].cold.1();
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasSuffix:", CFSTR("/cancel"));

  if (v7)
    self->_ineligibleDevicesRemoteUICanceled = 1;

}

void __54__TUIOptInFlowControllerImpl_remoteUIWillLoadRequest___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)remoteUIDidEndFlow:(id)a3
{
  id v3;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_241);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl remoteUIDidEndFlow:].cold.1();

}

void __49__TUIOptInFlowControllerImpl_remoteUIDidEndFlow___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)remoteUIWillPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  TUIOptInFlowControllerImpl *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_242);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315906;
    v9 = "-[TUIOptInFlowControllerImpl remoteUIWillPresentObjectModel:modally:]";
    v10 = 2114;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    v14 = 2114;
    v15 = self;
    _os_log_debug_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: objectModel = %{public}@, isModal = %d on %{public}@", (uint8_t *)&v8, 0x26u);
  }

}

void __69__TUIOptInFlowControllerImpl_remoteUIWillPresentObjectModel_modally___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_243);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl remoteUIDidDismiss:].cold.4((uint64_t)v4, (uint64_t)self, v5);
  if (self->_ineligibleDevicesRemoteUICanceled)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_245);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
      -[TUIOptInFlowControllerImpl remoteUIDidDismiss:].cold.3();
    -[TUIOptInFlowControllerImpl _dismiss](self, "_dismiss");
  }
  else if (self->_ineligibleDevicesRemoteUIPresented)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_249);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
      -[TUIOptInFlowControllerImpl remoteUIDidDismiss:].cold.2();
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_247);
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
      -[TUIOptInFlowControllerImpl remoteUIDidDismiss:].cold.1();
    -[TUIOptInFlowControllerImpl _continueAttemptToSetOptInWithState:](self, "_continueAttemptToSetOptInWithState:", 1);
  }

}

void __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke_244()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke_246()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

void __49__TUIOptInFlowControllerImpl_remoteUIDidDismiss___block_invoke_248()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  id v3;

  v3 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_250);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
    -[TUIOptInFlowControllerImpl remoteUIDidReceiveHTTPResponse:].cold.1();

}

void __61__TUIOptInFlowControllerImpl_remoteUIDidReceiveHTTPResponse___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (void)remoteUIDidPresentObjectModel:(id)a3 modally:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  TUIOptInFlowControllerImpl *v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_1, &__block_literal_global_251);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1, OS_LOG_TYPE_DEBUG))
  {
    v8 = 136315906;
    v9 = "-[TUIOptInFlowControllerImpl remoteUIDidPresentObjectModel:modally:]";
    v10 = 2114;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    v14 = 2114;
    v15 = self;
    _os_log_debug_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: objectModel = %{public}@, isModal = %d on %{public}@", (uint8_t *)&v8, 0x26u);
  }
  self->_ineligibleDevicesRemoteUIPresented = 1;

}

void __68__TUIOptInFlowControllerImpl_remoteUIDidPresentObjectModel_modally___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_1 = (uint64_t)v0;

}

- (TUIOptInFlowControllerDelegate)delegate
{
  return (TUIOptInFlowControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parentViewController, a3);
}

- (UINavigationController)presentingNavigationController
{
  return self->_presentingNavigationController;
}

- (void)setPresentingNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingNavigationController, a3);
}

- (TUIOBWelcomeController)welcomeController
{
  return self->_welcomeController;
}

- (void)setWelcomeController:(id)a3
{
  objc_storeStrong((id *)&self->_welcomeController, a3);
}

- (KTOptInManager)optInManager
{
  return self->_optInManager;
}

- (void)setOptInManager:(id)a3
{
  objc_storeStrong((id *)&self->_optInManager, a3);
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
  objc_storeStrong((id *)&self->_accountStore, a3);
}

- (AIDAServiceOwnersManager)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, a3);
}

- (NSMutableArray)devicesWithIssuesIdentifiers
{
  return self->_devicesWithIssuesIdentifiers;
}

- (void)setDevicesWithIssuesIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, a3);
}

- (AAUIGrandSlamRemoteUIPresenter)ineligibleDevicesRemoteUIPresenter
{
  return self->_ineligibleDevicesRemoteUIPresenter;
}

- (void)setIneligibleDevicesRemoteUIPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_ineligibleDevicesRemoteUIPresenter, a3);
}

- (TUIAppleAccountManager)appleAccountManager
{
  return self->_appleAccountManager;
}

- (void)setAppleAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_appleAccountManager, a3);
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (IDSService)idsService
{
  return self->_idsService;
}

- (void)setIdsService:(id)a3
{
  objc_storeStrong((id *)&self->_idsService, a3);
}

- (IDSSignInController)idsSignInController
{
  return self->_idsSignInController;
}

- (void)setIdsSignInController:(id)a3
{
  objc_storeStrong((id *)&self->_idsSignInController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsSignInController, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_appleAccountManager, 0);
  objc_storeStrong((id *)&self->_ineligibleDevicesRemoteUIPresenter, 0);
  objc_storeStrong((id *)&self->_devicesWithIssuesIdentifiers, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_optInManager, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_presentingNavigationController, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)performAccountChecksForFlow:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2493EE000, v0, v1, "%s requestedFlow = %d on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_51_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_16();
  _os_log_debug_impl(&dword_2493EE000, v0, OS_LOG_TYPE_DEBUG, "%{public}@ verified that iCloud account is HSA2 and CDP enabled for opt in state (%d)...", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_51_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_8(&dword_2493EE000, v0, v1, "%{public}@ unable to verify HSA2 and CDP state on account, aborting...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_13(&dword_2493EE000, v0, v1, "%{public}@ unknown flow requested, unable to process opt in state (%d)...");
  OUTLINED_FUNCTION_2();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_8(&dword_2493EE000, v0, v1, "%{public}@ the iCloud and IDS account do not match, showing mismatched accounts error...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__TUIOptInFlowControllerImpl_performAccountChecksForFlow___block_invoke_53_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_8(&dword_2493EE000, v0, v1, "%{public}@ messages verification failed, showing sign into messages with your Apple ID error...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)showAppleIDErrorForFlow:withViewModel:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_5(&dword_2493EE000, v0, v1, "%s requestedFlow = %d on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)_showOptInErrorForViewModel:.cold.1()
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

- (void)_openSettingsURL:.cold.1()
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

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_2493EE000, v0, v1, "%{public}@ dismissing CDP repair UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_97_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3(&dword_2493EE000, v0, v1, "%{public}@ CDP repair UI dismissed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __69__TUIOptInFlowControllerImpl_dismissRemoteUIForViewController_error___block_invoke_100_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3(&dword_2493EE000, v0, v1, "%{public}@ CDP repair UI dismissed (welcomeController)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyCDPWithCompletion:.cold.1()
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

- (void)_attemptToSetOptInWithState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_2493EE000, v0, v1, "%s requested state = %d on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_125_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_2493EE000, v0, v1, "%{public}@ successfully requested ineligible devices remote UI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __58__TUIOptInFlowControllerImpl__attemptToSetOptInWithState___block_invoke_125_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_12();
  v3 = 2114;
  v4 = v0;
  _os_log_error_impl(&dword_2493EE000, v1, OS_LOG_TYPE_ERROR, "%{public}@ failed to request ineligible devices remote UI: error = %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_continueAttemptToSetOptInWithState:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_5(&dword_2493EE000, v0, v1, "%s requested opt in state = %d on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_136_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(a1, "devicesWithIssuesIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543618;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(v4, "count");
  _os_log_debug_impl(&dword_2493EE000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ devices with issues count: %ld", (uint8_t *)&v5, 0x16u);

}

void __66__TUIOptInFlowControllerImpl__continueAttemptToSetOptInWithState___block_invoke_136_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_13(&dword_2493EE000, v0, v1, "%{public}@ unable to set requested opt in state = %d");
  OUTLINED_FUNCTION_2();
}

- (void)_showOptInResultError:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3(&dword_2493EE000, v0, v1, "%{public}@ showing devices with issues...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_beginIneligibleDevicesRemoteUIRequestWithCompletion:(uint64_t)a3 .cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "absoluteString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136315650;
  v8 = "-[TUIOptInFlowControllerImpl _beginIneligibleDevicesRemoteUIRequestWithCompletion:]";
  v9 = 2114;
  v10 = v6;
  v11 = 2114;
  v12 = a3;
  _os_log_debug_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI URL = '%{public}@' on %{public}@", (uint8_t *)&v7, 0x20u);

}

- (void)_showErrorAlertWithError:presentingViewController:.cold.1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315650;
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_2493EE000, v0, OS_LOG_TYPE_ERROR, "%s opt in state error = %{public}@ on %{public}@", (uint8_t *)v1, 0x20u);
  OUTLINED_FUNCTION_7();
}

- (void)_verifyMessages:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_2493EE000, v0, v1, "%s iMessage has no address selected on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_verifyMessages:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_9(&dword_2493EE000, v0, v1, "%s iMessage is turned off on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_230_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_9(&dword_2493EE000, v0, v1, "%s user is not signed in to iMessage with their appleID on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__TUIOptInFlowControllerImpl__verifyMessages___block_invoke_230_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_14(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s success on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIWillLoadRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s ineligible devices remote UI: request = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)remoteUIDidEndFlow:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s ineligible devices remote UI: controller = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

- (void)remoteUIDidDismiss:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s ineligible devices remote UI: no ineligible devices found => continue opt in on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIDidDismiss:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s ineligible devices remote UI: Remove Devices in Settings pressed on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIDidDismiss:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s ineligible devices remote UI: OK pressed on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)remoteUIDidDismiss:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)(a2 + 9);
  v4 = *(unsigned __int8 *)(a2 + 8);
  v5 = 136316162;
  v6 = "-[TUIOptInFlowControllerImpl remoteUIDidDismiss:]";
  v7 = 2114;
  v8 = a1;
  v9 = 1024;
  v10 = v3;
  v11 = 1024;
  v12 = v4;
  v13 = 2114;
  v14 = a2;
  _os_log_debug_impl(&dword_2493EE000, log, OS_LOG_TYPE_DEBUG, "%s ineligible devices remote UI: controller = %{public}@, presented = %d, canceled = %d on %{public}@", (uint8_t *)&v5, 0x2Cu);
}

- (void)remoteUIDidReceiveHTTPResponse:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s ineligible devices remote UI: response = %{public}@ on %{public}@", v2);
  OUTLINED_FUNCTION_7();
}

@end
