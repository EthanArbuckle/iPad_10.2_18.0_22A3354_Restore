@implementation ICSBackupSpecifierProvider

- (ICSBackupSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICSBackupSpecifierProvider *v9;
  ICSBackupSpecifierProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSBackupSpecifierProvider;
  v9 = -[ICSBackupSpecifierProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
}

- (ICSBackupSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICSBackupSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  uint64_t v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    -[ICSBackupSpecifierProvider _iCloudBackupSpecifier](self, "_iCloudBackupSpecifier");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_specifiers;
      self->_specifiers = v6;

    }
    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (ACAccount)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccount *)v3;
}

- (id)_iCloudBackupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (-[ICSBackupSpecifierProvider _shouldShowBackupSpecifier](self, "_shouldShowBackupSpecifier"))
  {
    v3 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ICLOUD_BACKUP_SPECIFIER_NAME"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel__dataclassState_, 0, 2, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setControllerLoadAction:", sel__backupSpecifierWasTapped_);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("BACKUP"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageForKey:", *MEMORY[0x24BE75810]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75AC8]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BACKUP_CELL_LABEL"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", v10);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_shouldShowBackupSpecifier
{
  void *v3;
  char v4;
  void *v6;
  char v7;

  -[ICSBackupSpecifierProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x24BE047E0]);

  if ((v4 & 1) != 0)
    return 0;
  -[ICSBackupSpecifierProvider account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isProvisionedForDataclass:", *MEMORY[0x24BDB3DA8]);

  return v7;
}

- (id)_dataclassState:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0)
  {
    LogSubsystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICSPhotoStreamSpecifierProvider _isPhotoStreamEnabled:].cold.1((id *)&self->_delegate, v14);

    goto LABEL_8;
  }
  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  v8 = objc_msgSend(v7, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4);

  if (!v8
    || (-[ICSBackupSpecifierProvider account](self, "account"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isEnabledForDataclass:", *MEMORY[0x24BDB3DA8]),
        v9,
        (v10 & 1) == 0))
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = CFSTR("OFF");
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = CFSTR("ON");
LABEL_9:
  objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_backupSpecifierWasTapped:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__ICSBackupSpecifierProvider__backupSpecifierWasTapped___block_invoke;
    v8[3] = &unk_251C61638;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v7, "validateDataclassAccessForProvider:specifier:completion:", self, v9, v8);

    objc_destroyWeak(&v10);
  }
  objc_destroyWeak(&location);

}

void __56__ICSBackupSpecifierProvider__backupSpecifierWasTapped___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_showBackupController:", *(_QWORD *)(a1 + 32));
    WeakRetained = v5;
  }

}

- (void)_showBackupController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AAUISpecifierProviderDelegate **p_listController;
  id WeakRetained;
  id v9;
  void *v10;
  id v11;
  id v12;

  v12 = a3;
  v4 = objc_alloc(MEMORY[0x24BEC7418]);
  -[ICSBackupSpecifierProvider account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAccount:", v5);

  if (v6)
  {
    objc_msgSend(v6, "setSpecifier:", v12);
    p_listController = &self->_listController;
    WeakRetained = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v6, "setParentController:", WeakRetained);

    v9 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v9, "rootController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setRootController:", v10);

    v11 = objc_loadWeakRetained((id *)p_listController);
    objc_msgSend(v11, "showController:animate:", v6, 1);

  }
}

- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  NSString *v6;
  id v7;
  objc_class *v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  int v13;
  ICSBackupSpecifierProvider *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (NSString *)a3;
  v7 = a4;
  v8 = NSClassFromString(v6);
  if (-[objc_class conformsToProtocol:](v8, "conformsToProtocol:", &unk_2579C6E98))
  {
    v9 = (void *)objc_msgSend([v8 alloc], "initWithAccountManager:", self->_accountManager);
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(v9, "setDelegate:", WeakRetained);

  }
  else
  {
    LogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v13 = 138543874;
      v14 = self;
      v15 = 2114;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      _os_log_error_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v13, 0x20u);
    }

    v9 = 0;
  }

  return v9;
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
