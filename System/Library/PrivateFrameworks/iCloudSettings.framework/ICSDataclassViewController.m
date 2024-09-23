@implementation ICSDataclassViewController

- (ICSDataclassViewController)init
{
  ICSDataclassViewController *v2;
  ICSDataclassViewController *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accountWorkQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSDataclassViewController;
  v2 = -[ACUIDataclassConfigurationViewController init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ACUIDataclassConfigurationViewController setShouldShowDeleteAccountButton:](v2, "setShouldShowDeleteAccountButton:", 0);
    -[ACUIDataclassConfigurationViewController setShouldEnableDeleteAccountButton:](v3, "setShouldEnableDeleteAccountButton:", 0);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v4);
    accountWorkQueue = v3->_accountWorkQueue;
    v3->_accountWorkQueue = (OS_dispatch_queue *)v5;

  }
  return v3;
}

- (AIDAAccountManager)accountManager
{
  AIDAAccountManager *accountManager;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  accountManager = self->_accountManager;
  if (!accountManager)
  {
    -[ICSDataclassViewController specifier](self, "specifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[ICSDataclassViewController specifier](self, "specifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("icloudAccountManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      LogSubsystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v12 = v6;
        _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "specifierAccountManager %@", buf, 0xCu);
      }

      if (v6)
        -[ICSDataclassViewController setAccountManager:](self, "setAccountManager:", v6);

    }
    accountManager = self->_accountManager;
    if (!accountManager)
    {
      LogSubsystem();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ICSDataclassViewController accountManager].cold.1(v8);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __44__ICSDataclassViewController_accountManager__block_invoke;
      block[3] = &unk_251C60DC8;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      accountManager = self->_accountManager;
    }
  }
  return accountManager;
}

void __44__ICSDataclassViewController_accountManager__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void)setAccountManager:(id)a3
{
  id v5;
  ICSDataclassValidationController *v6;
  void *v7;
  ICSDataclassValidationController *v8;
  ICSDataclassValidationController *dataclassValidationController;

  objc_storeStrong((id *)&self->_accountManager, a3);
  v5 = a3;
  v6 = [ICSDataclassValidationController alloc];
  -[ICSDataclassViewController account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICSDataclassValidationController initWithAccount:presentingViewController:](v6, "initWithAccount:presentingViewController:", v7, self);
  dataclassValidationController = self->_dataclassValidationController;
  self->_dataclassValidationController = v8;

  -[ICSDataclassValidationController setDelegate:](self->_dataclassValidationController, "setDelegate:", self);
  -[ICSDataclassViewController _startObservingAccountStoreChanges](self, "_startObservingAccountStoreChanges");
  -[ICSDataclassViewController _startObservingRestrictionChanges](self, "_startObservingRestrictionChanges");
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSDataclassViewController accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[ICSDataclassViewController _stopObservingRestrictionChanges](self, "_stopObservingRestrictionChanges");
  -[ICSDataclassViewController _stopObservingAccountStoreChanges](self, "_stopObservingAccountStoreChanges");
  v3.receiver = self;
  v3.super_class = (Class)ICSDataclassViewController;
  -[ACUIDataclassConfigurationViewController dealloc](&v3, sel_dealloc);
}

- (void)cleanupDataclassSpecifiers
{
  NSObject *v2;
  uint8_t v3[16];

  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
  }

}

- (void)startSpinnerInSpecifier:(id)a3
{
  id v5;
  void *v6;
  PSSpecifier **p_activeSpecifier;
  int v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    p_activeSpecifier = &self->_activeSpecifier;
    if (!*p_activeSpecifier)
    {
      v9 = v5;
      v8 = objc_msgSend(v5, "ics_startSpinner");
      v6 = v9;
      if (v8)
      {
        objc_storeStrong((id *)p_activeSpecifier, a3);
        v6 = v9;
      }
    }
  }

}

- (void)stopSpinnerInActiveSpecifier
{
  PSSpecifier *activeSpecifier;
  PSSpecifier *v4;

  activeSpecifier = self->_activeSpecifier;
  if (activeSpecifier)
  {
    -[PSSpecifier ics_stopSpinner](activeSpecifier, "ics_stopSpinner");
    v4 = self->_activeSpecifier;
    self->_activeSpecifier = 0;

  }
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "showViewController for provider %@", (uint8_t *)&v9, 0xCu);
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[ICSDataclassViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  else
    -[ICSDataclassViewController showViewController:sender:](self, "showViewController:sender:", v7, v6);

}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "willBeginLoadingSpecifier for provider %@", (uint8_t *)&v16, 0xCu);
  }

  if (self->_activeSpecifier)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ICSDataclassViewController specifierProvider:willBeginLoadingSpecifier:].cold.1((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  }
  else
  {
    -[ICSDataclassViewController startSpinnerInSpecifier:](self, "startSpinnerInSpecifier:", v7);
  }

}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412290;
    v15 = v5;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "didFinishLoadingSpecifier for provider %@", (uint8_t *)&v14, 0xCu);
  }

  if (self->_activeSpecifier)
  {
    -[ICSDataclassViewController stopSpinnerInActiveSpecifier](self, "stopSpinnerInActiveSpecifier");
  }
  else
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICSDataclassViewController specifierProvider:didFinishLoadingSpecifier:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);

  }
}

- (void)insertSpecifier:(id)a3 afterSpecifierNamed:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LogSubsystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ICSDataclassViewController specifierForID:](self, "specifierForID:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v10;
    _os_log_impl(&dword_24B4C1000, v9, OS_LOG_TYPE_DEFAULT, "Inserting new specifier %@ after %@", (uint8_t *)&v16, 0x16u);

  }
  if (objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "containsObject:", v7))
  {
    LogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      v12 = "Did not insert new specifier because it's already present";
      v13 = v11;
      v14 = 2;
LABEL_8:
      _os_log_impl(&dword_24B4C1000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v16, v14);
    }
  }
  else
  {
    -[ICSDataclassViewController specifierForID:](self, "specifierForID:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSDataclassViewController insertSpecifier:afterSpecifier:animated:](self, "insertSpecifier:afterSpecifier:animated:", v7, v15, 1);

    LogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v7;
      v12 = "Inserted new specifier %@";
      v13 = v11;
      v14 = 12;
      goto LABEL_8;
    }
  }

}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LogSubsystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_24B4C1000, v10, OS_LOG_TYPE_DEFAULT, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSDataclassViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v9, v11, v5);

  }
  else
  {
    -[ICSDataclassViewController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (void)reloadSpecifierForProvider:(id)a3 identifier:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v7, 0xCu);
  }

  -[ICSDataclassViewController reloadSpecifierID:](self, "reloadSpecifierID:", v5);
}

- (void)specifierProvider:(id)a3 dataclassSwitchStateDidChange:(id)a4 withSpecifier:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICSDataclassViewController _dataclassSwitchStateDidChange:forSpecifier:](self, "_dataclassSwitchStateDidChange:forSpecifier:", v8, v7);

}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogSubsystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, "validateDataclassAccessForProvider. provider: %@, specifier: %@", (uint8_t *)&v12, 0x16u);
  }

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICSDataclassViewController _validateDataclassAccessForSpecifier:completion:](self, "_validateDataclassAccessForSpecifier:completion:", v9, v10);

}

- (BOOL)specifierProvider:(id)a3 isDataclassAvailableForSpecifier:(id)a4
{
  id v5;

  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  LOBYTE(self) = -[ICSDataclassViewController _isDataclassAvailableForSpecifier:](self, "_isDataclassAvailableForSpecifier:", v5);

  return (char)self;
}

- (id)specifierProvider:(id)a3 dataclassSwitchStateForSpecifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (-[ICSDataclassViewController _isDataclassAvailableForSpecifier:](self, "_isDataclassAvailableForSpecifier:", v5))
  {
    objc_msgSend(v5, "acui_dataclass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[ICSDataclassViewController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithBool:", objc_msgSend(v8, "isEnabledForDataclass:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v9;
}

- (id)dataclassSwitchStateForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "acui_dataclass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICSDataclassValidationController isDataclassAvailable:](self->_dataclassValidationController, "isDataclassAvailable:", v5))
  {
    v8.receiver = self;
    v8.super_class = (Class)ICSDataclassViewController;
    -[ACUIDataclassConfigurationViewController dataclassSwitchStateForSpecifier:](&v8, sel_dataclassSwitchStateForSpecifier_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v6;
}

- (void)_dataclassSwitchStateDidChange:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "BOOLValue")
    && !-[ICSDataclassViewController _shouldContinueDataclassChangeForSpecifier:](self, "_shouldContinueDataclassChangeForSpecifier:", v7))
  {
    -[ICSDataclassViewController reloadSpecifier:](self, "reloadSpecifier:", v7);
  }
  else
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB3E18]))
    {
      -[ICSDataclassViewController reloadSpecifier:](self, "reloadSpecifier:", v7);
    }
    else
    {
      objc_initWeak(&location, self);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke;
      v9[3] = &unk_251C61B38;
      objc_copyWeak(&v12, &location);
      v10 = v7;
      v11 = v6;
      -[ICSDataclassViewController _validateDataclassAccessForSpecifier:completion:](self, "_validateDataclassAccessForSpecifier:completion:", v10, v9);

      objc_destroyWeak(&v12);
      objc_destroyWeak(&location);
    }

  }
}

void __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke(id *a1, int a2)
{
  id WeakRetained;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (a2)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke_2;
    block[3] = &unk_251C61350;
    v7 = WeakRetained;
    v8 = a1[4];
    v9 = a1[5];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

uint64_t __74__ICSDataclassViewController__dataclassSwitchStateDidChange_forSpecifier___block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1624), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_superDataclassSwitchStateDidChange:withSpecifier:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (BOOL)_shouldContinueDataclassChangeForSpecifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  ICSMailConfigController *v15;
  void *v16;
  ICSMailConfigController *v17;
  ICSMailConfigController *mailConfigController;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, char);
  void *v23;
  ICSDataclassViewController *v24;
  id v25;

  v4 = a3;
  v20 = MEMORY[0x24BDAC760];
  v21 = 3221225472;
  v22 = __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke;
  v23 = &unk_251C610D8;
  v24 = self;
  v5 = v4;
  v25 = v5;
  v6 = _Block_copy(&v20);
  objc_msgSend(v5, "acui_dataclass", v20, v21, v22, v23, v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB3E38]))
  {
    -[ICSDataclassViewController account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "aa_needsEmailConfiguration");

  }
  else
  {
    v9 = 0;
  }

  objc_msgSend(v5, "acui_dataclass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BDB3E68]))
  {
    -[ICSDataclassViewController account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "aa_isPrimaryAccount") & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      -[ICSDataclassViewController account](self, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "aa_needsEmailConfiguration");

    }
  }
  else
  {
    v12 = 0;
  }

  v14 = v9 | v12;
  if (v14 == 1)
  {
    v15 = [ICSMailConfigController alloc];
    -[ICSDataclassViewController account](self, "account");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[ICSMailConfigController initWithAccount:presenter:](v15, "initWithAccount:presenter:", v16, self);
    mailConfigController = self->_mailConfigController;
    self->_mailConfigController = v17;

    -[ICSMailConfigController presentCreateFreeEmailPromptWithCompletion:isForNotes:](self->_mailConfigController, "presentCreateFreeEmailPromptWithCompletion:isForNotes:", v6, v9 ^ 1u);
  }

  return v14 ^ 1;
}

void __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke(uint64_t a1, char a2)
{
  void *v2;
  _QWORD block[5];
  id v4;
  char v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke_2;
  block[3] = &unk_251C61B60;
  v5 = a2;
  v2 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __73__ICSDataclassViewController__shouldContinueDataclassChangeForSpecifier___block_invoke_2(uint64_t a1)
{
  int v2;
  id *v3;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(id **)(a1 + 32);
  if (v2)
    return objc_msgSend(v3, "reloadSpecifier:", *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3[202], "configureEmailAccount");
}

- (void)_validateDataclassAccessForSpecifier:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  void *v8;
  ICSDataclassValidationController *dataclassValidationController;
  _QWORD v10[4];
  id v11;
  void (**v12)(id, _QWORD);
  id v13;
  id location;

  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  if (self->_activeSpecifier)
  {
    -[ICSDataclassViewController reloadSpecifier:](self, "reloadSpecifier:", v6);
    v7[2](v7, 0);
  }
  else
  {
    -[ICSDataclassViewController startSpinnerInSpecifier:](self, "startSpinnerInSpecifier:", v6);
    objc_initWeak(&location, self);
    objc_msgSend(v6, "acui_dataclass");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dataclassValidationController = self->_dataclassValidationController;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __78__ICSDataclassViewController__validateDataclassAccessForSpecifier_completion___block_invoke;
    v10[3] = &unk_251C61B88;
    objc_copyWeak(&v13, &location);
    v11 = v6;
    v12 = v7;
    -[ICSDataclassValidationController validateAccessForDataclass:completion:](dataclassValidationController, "validateAccessForDataclass:completion:", v8, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

void __78__ICSDataclassViewController__validateDataclassAccessForSpecifier_completion___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  id WeakRetained;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "_validateDataclassAccessForSpecifier shouldContinue: %d", (uint8_t *)v6, 8u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "stopSpinnerInActiveSpecifier");
  if ((a2 & 1) == 0)
    objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_superDataclassSwitchStateDidChange:(id)a3 withSpecifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const __CFString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (objc_msgSend(v6, "BOOLValue"))
      v9 = CFSTR("YES");
    else
      v9 = CFSTR("NO");
    objc_msgSend(v7, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "Dataclass switch state changed to %@: %@", buf, 0x16u);

  }
  v11.receiver = self;
  v11.super_class = (Class)ICSDataclassViewController;
  -[ACUIDataclassConfigurationViewController dataclassSwitchStateDidChange:withSpecifier:](&v11, sel_dataclassSwitchStateDidChange_withSpecifier_, v6, v7);

}

- (BOOL)_isDataclassAvailableForSpecifier:(id)a3
{
  void *v4;

  objc_msgSend(a3, "acui_dataclass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ICSDataclassValidationController isDataclassAvailable:](self->_dataclassValidationController, "isDataclassAvailable:", v4);

  return (char)self;
}

- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  NSString *v6;
  id v7;
  objc_class *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v6 = (NSString *)a3;
  v7 = a4;
  v8 = NSClassFromString(v6);
  if (-[objc_class conformsToProtocol:](v8, "conformsToProtocol:", &unk_2579C6E98))
  {
    v9 = [v8 alloc];
    -[ICSDataclassViewController accountManager](self, "accountManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithAccountManager:", v10);

    objc_msgSend(v11, "setDelegate:", self);
  }
  else
  {
    LogSubsystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICSDataclassViewController loadSpecifierProviderWithClassName:inBundle:].cold.1((uint64_t)v6, (uint64_t)v7, v12);

    v11 = 0;
  }

  return v11;
}

- (void)operationsHelper:(id)a3 willSaveAccount:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSDataclassViewController;
  -[ACUIDataclassConfigurationViewController operationsHelper:willSaveAccount:](&v4, sel_operationsHelper_willSaveAccount_, a3, a4);
}

- (void)operationsHelper:(id)a3 didSaveAccount:(id)a4 withSuccess:(BOOL)a5 error:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICSAccountSaveErrorHandler *accountSaveErrorHandler;
  ICSAccountSaveErrorHandler *v20;
  ICSAccountSaveErrorHandler *v21;
  objc_super v22;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  LogSubsystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = CFSTR("NO");
    if (v7)
      v14 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v24 = v14;
    v25 = 2112;
    v26 = v12;
    _os_log_impl(&dword_24B4C1000, v13, OS_LOG_TYPE_DEFAULT, "Operations helper did save account with success? %@, error: %@", buf, 0x16u);
  }

  if (v12)
  {
    objc_msgSend(v11, "enabledDataclasses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    -[ACUIViewController accountStore](self, "accountStore");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "enabledDataclassesForAccount:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "minusSet:", v18);
    accountSaveErrorHandler = self->_accountSaveErrorHandler;
    if (!accountSaveErrorHandler)
    {
      v20 = -[ICSAccountSaveErrorHandler initWithPresenter:]([ICSAccountSaveErrorHandler alloc], "initWithPresenter:", self);
      v21 = self->_accountSaveErrorHandler;
      self->_accountSaveErrorHandler = v20;

      accountSaveErrorHandler = self->_accountSaveErrorHandler;
    }
    -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:](accountSaveErrorHandler, "handleAccountSaveError:forAccount:failedDataclasses:", v12, v11, v16);

  }
  v22.receiver = self;
  v22.super_class = (Class)ICSDataclassViewController;
  -[ACUIDataclassConfigurationViewController operationsHelper:didSaveAccount:withSuccess:error:](&v22, sel_operationsHelper_didSaveAccount_withSuccess_error_, v10, v11, v7, v12);

}

- (void)operationsHelper:(id)a3 didLoadSaveActions:(id)a4 forDataclass:(id)a5 withAccount:(id)a6 error:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  ICSAccountSaveErrorHandler *accountSaveErrorHandler;
  ICSAccountSaveErrorHandler *v18;
  ICSAccountSaveErrorHandler *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  LogSubsystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413058;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v13;
    v26 = 2112;
    v27 = v14;
    _os_log_impl(&dword_24B4C1000, v15, OS_LOG_TYPE_DEFAULT, "Operations helper did load save actions: %@ forDataclass: %@ withAccount: %@ error: %@", (uint8_t *)&v20, 0x2Au);
  }

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    accountSaveErrorHandler = self->_accountSaveErrorHandler;
    if (!accountSaveErrorHandler)
    {
      v18 = -[ICSAccountSaveErrorHandler initWithPresenter:]([ICSAccountSaveErrorHandler alloc], "initWithPresenter:", self);
      v19 = self->_accountSaveErrorHandler;
      self->_accountSaveErrorHandler = v18;

      accountSaveErrorHandler = self->_accountSaveErrorHandler;
    }
    -[ICSAccountSaveErrorHandler handleAccountSaveError:forAccount:failedDataclasses:](accountSaveErrorHandler, "handleAccountSaveError:forAccount:failedDataclasses:", v14, v13, v16);

  }
}

- (void)_startObservingAccountStoreChanges
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ICSDataclassViewController accountManager](self, "accountManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__ICSDataclassViewController__startObservingAccountStoreChanges__block_invoke;
  v4[3] = &unk_251C61BB0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "addAccountChangeObserver:handler:", self, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __64__ICSDataclassViewController__startObservingAccountStoreChanges__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = *MEMORY[0x24BE06080];
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "accountDidChangeFromAccount:toAccount:", v8, v9);

  }
}

- (void)_stopObservingAccountStoreChanges
{
  AIDAAccountManager *accountManager;

  accountManager = self->_accountManager;
  if (accountManager)
    -[AIDAAccountManager removeAccountChangeObserver:](accountManager, "removeAccountChangeObserver:", self);
}

- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  NSObject *accountWorkQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  ICSDataclassViewController *v14;

  v6 = a3;
  v7 = a4;
  accountWorkQueue = self->_accountWorkQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke;
  block[3] = &unk_251C61350;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(accountWorkQueue, block);

}

void __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  int v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD block[5];
  uint8_t buf[16];

  if ((objc_msgSend(*(id *)(a1 + 32), "aa_isPrimaryEmailVerified") & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(*(id *)(a1 + 40), "aa_isPrimaryEmailVerified");
  v3 = objc_msgSend(*(id *)(a1 + 32), "isAuthenticated");
  v4 = objc_msgSend(*(id *)(a1 + 40), "isAuthenticated");
  objc_msgSend(*(id *)(a1 + 32), "enabledDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "enabledDataclasses");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  v8 = objc_msgSend(*(id *)(a1 + 32), "isPropertyDirty:", *MEMORY[0x24BDB42D0]);
  if (v2)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Account became verified. Will reload specifiers.";
LABEL_13:
      _os_log_impl(&dword_24B4C1000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (v3 != v4)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Account authentication state changed. Will reload specifiers.";
      goto LABEL_13;
    }
LABEL_14:

    LogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, "Account has changed, will reload specifiers.", buf, 2u);
    }

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_114;
    block[3] = &unk_251C60DC8;
    block[4] = *(_QWORD *)(a1 + 48);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    return;
  }
  if (v8)
  {
    LogSubsystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v10 = "Account enabled dataclasses are dirty and were likely set on oldAccount. Will reload specifiers.";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if ((v7 & 1) == 0)
  {
    LogSubsystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "Account enabled dataclasses changed. Will reload specifiers if needed.", buf, 2u);
    }

    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_115;
    v13[3] = &unk_251C61350;
    v13[4] = *(_QWORD *)(a1 + 48);
    v14 = *(id *)(a1 + 32);
    v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v13);

  }
}

uint64_t __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_114(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "cleanupDataclassSpecifiers");
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __68__ICSDataclassViewController_accountDidChangeFromAccount_toAccount___block_invoke_115(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1624));
  if (!objc_msgSend(WeakRetained, "hasValidGetter"))
    goto LABEL_9;
  objc_msgSend(WeakRetained, "performGetter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_9:
    objc_msgSend(*(id *)(a1 + 32), "_checkAndReloadSpecifierIfNeededForAccountChangedFrom:toAccount:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    goto LABEL_10;
  }
  v7.receiver = *(id *)(a1 + 32);
  v7.super_class = (Class)ICSDataclassViewController;
  objc_msgSendSuper2(&v7, sel_dataclassSwitchStateForSpecifier_, WeakRetained);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 != v4)
  {
    LogSubsystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "acui_dataclass");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v9 = v6;
      _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "Toggle value does not match new account state, refreshing specifier for dataclass %@", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "reloadSpecifier:", WeakRetained);
  }
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 1624), 0);

LABEL_10:
}

- (void)_checkAndReloadSpecifierIfNeededForAccountChangedFrom:(id)a3 toAccount:(id)a4
{
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  id v22;

  v22 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BDB3E40];
  v8 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E40]);
  if (v8 != objc_msgSend(v6, "isEnabledForDataclass:", v7))
    goto LABEL_12;
  v9 = *MEMORY[0x24BDB3EA8];
  v10 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3EA8]);
  if (v10 != objc_msgSend(v6, "isEnabledForDataclass:", v9))
    goto LABEL_12;
  v11 = *MEMORY[0x24BDB3E78];
  v12 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E78]);
  if (v12 != objc_msgSend(v6, "isEnabledForDataclass:", v11))
    goto LABEL_12;
  v13 = *MEMORY[0x24BDB3DE0];
  v14 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3DE0]);
  if (v14 != objc_msgSend(v6, "isEnabledForDataclass:", v13))
    goto LABEL_12;
  v7 = *MEMORY[0x24BDB3EC8];
  v15 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3EC8]);
  if (v15 != objc_msgSend(v6, "isEnabledForDataclass:", v7))
    goto LABEL_12;
  v7 = *MEMORY[0x24BDB3E38];
  v16 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E38]);
  if (v16 != objc_msgSend(v6, "isEnabledForDataclass:", v7))
    goto LABEL_12;
  v7 = *MEMORY[0x24BDB3E30];
  v17 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E30]);
  if (v17 != objc_msgSend(v6, "isEnabledForDataclass:", v7))
    goto LABEL_12;
  v7 = *MEMORY[0x24BDB3E68];
  v18 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E68]);
  if (v18 != objc_msgSend(v6, "isEnabledForDataclass:", v7)
    || (v7 = *MEMORY[0x24BDB3E48],
        v19 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E48]),
        v19 != objc_msgSend(v6, "isEnabledForDataclass:", v7))
    || (v7 = *MEMORY[0x24BDB3E18],
        v20 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3E18]),
        v20 != objc_msgSend(v6, "isEnabledForDataclass:", v7))
    || (v7 = *MEMORY[0x24BDB3DD8],
        v21 = objc_msgSend(v22, "isEnabledForDataclass:", *MEMORY[0x24BDB3DD8]),
        v21 != objc_msgSend(v6, "isEnabledForDataclass:", v7)))
  {
LABEL_12:
    -[ICSDataclassViewController reloadSpecifierID:](self, "reloadSpecifierID:", v7);
  }

}

- (void)_startObservingRestrictionChanges
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id restrictionChangeNotificationObserver;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_restrictionChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *MEMORY[0x24BE63BA0];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __63__ICSDataclassViewController__startObservingRestrictionChanges__block_invoke;
    v8[3] = &unk_251C60FA8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v5, 0, v4, v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
    self->_restrictionChangeNotificationObserver = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __63__ICSDataclassViewController__startObservingRestrictionChanges__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cleanupDataclassSpecifiers");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "reloadSpecifiers");

}

- (void)_stopObservingRestrictionChanges
{
  void *v3;
  id restrictionChangeNotificationObserver;

  if (self->_restrictionChangeNotificationObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_restrictionChangeNotificationObserver);

    restrictionChangeNotificationObserver = self->_restrictionChangeNotificationObserver;
    self->_restrictionChangeNotificationObserver = 0;

  }
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[ICSDataclassViewController activeSpecifier](self, "activeSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (PSSpecifier)activeSpecifier
{
  return self->_activeSpecifier;
}

- (void)setActiveSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_activeSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_toggledSpecifier);
  objc_storeStrong((id *)&self->_mailConfigController, 0);
  objc_storeStrong((id *)&self->_dataclassValidationController, 0);
  objc_storeStrong((id *)&self->_accountSaveErrorHandler, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);
  objc_storeStrong(&self->_restrictionChangeNotificationObserver, 0);
}

- (void)accountManager
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24B4C1000, log, OS_LOG_TYPE_FAULT, "ICSDataclassViewController was instantiated without an AIDAAccountManager set on the launching specifier", v1, 2u);
}

- (void)specifierProvider:(uint64_t)a3 willBeginLoadingSpecifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Unbalanced call to -specifierProvider:willBeginLoadingSpecifier:, please file a radar! (provider: %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)specifierProvider:(uint64_t)a3 didFinishLoadingSpecifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Unbalanced call to -specifierProvider:didFinishLoadingSpecifier:, please file a radar! (provider: %@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)loadSpecifierProviderWithClassName:(os_log_t)log inBundle:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "ICSDataclassViewController Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
