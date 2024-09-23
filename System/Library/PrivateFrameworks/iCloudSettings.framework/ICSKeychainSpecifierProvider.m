@implementation ICSKeychainSpecifierProvider

- (ICSKeychainSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICSKeychainSpecifierProvider *v6;
  ICSKeychainSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSKeychainSpecifierProvider;
  v6 = -[ICSKeychainSpecifierProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v7->_keychainStatus = 0;
    v7->_keychainStatusFetchInProgress = 0;
    -[ICSKeychainSpecifierProvider _registerForKeychainSyncStatusChangeNotification](v7, "_registerForKeychainSyncStatusChangeNotification");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ICSKeychainSpecifierProvider _stopListeningForKeychainSyncStatusChangeNotification](self, "_stopListeningForKeychainSyncStatusChangeNotification");
  v3.receiver = self;
  v3.super_class = (Class)ICSKeychainSpecifierProvider;
  -[ICSKeychainSpecifierProvider dealloc](&v3, sel_dealloc);
}

- (id)account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
    -[ICSKeychainSpecifierProvider _specifierForKeychainSync](self, "_specifierForKeychainSync");
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

- (id)_specifierForKeychainSync
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBoolSettingLockedDownByRestrictions:", *MEMORY[0x24BE638C8]);

  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("KEYCHAIN_SPECIFIER_NAME"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, 0, sel__keychainSyncStateForSpecifier_, objc_opt_class(), 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x24BDB3E30];
    objc_msgSend(MEMORY[0x24BE75590], "acui_iconForDataclass:", *MEMORY[0x24BDB3E30]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      objc_msgSend(v5, "setProperty:forKey:", v10, *MEMORY[0x24BE75AC8]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75AC0]);
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.accountsui.dataclass"));

  }
  return v5;
}

- (id)_keychainSyncStateForSpecifier:(id)a3
{
  void *v3;
  id v5;
  unint64_t keychainStatus;
  void *v7;
  void *v8;
  const __CFString *v9;

  v5 = a3;
  keychainStatus = self->_keychainStatus;
  switch(keychainStatus)
  {
    case 2uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("ON");
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("OFF");
      goto LABEL_7;
    case 0uLL:
      -[ICSKeychainSpecifierProvider _refreshKeychainState](self, "_refreshKeychainState");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      v9 = CFSTR("LOADING_CELL");
LABEL_7:
      objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v3;
}

- (void)_refreshKeychainState
{
  NSObject *v2;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  if (self->_keychainStatusFetchInProgress)
  {
    LogSubsystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Keychain status fetch is already in progress. Bailing!", buf, 2u);
    }

  }
  else
  {
    self->_keychainStatusFetchInProgress = 1;
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke;
    block[3] = &unk_251C60DC8;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

void __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD block[5];
  uint8_t buf[4];
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = +[ICSKeychainSyncController isKeychainSyncEnabled](ICSKeychainSyncController, "isKeychainSyncEnabled");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v9 = v2;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "isKeychainSyncEnabled: %d", buf, 8u);
  }

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v4 + 16);
  if (v2)
  {
    if (v5 == 2)
      return;
    v6 = 2;
  }
  else
  {
    if (v5 == 1)
      return;
    v6 = 1;
  }
  *(_QWORD *)(v4 + 16) = v6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke_48;
  block[3] = &unk_251C60DC8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __53__ICSKeychainSpecifierProvider__refreshKeychainState__block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  _QWORD *v4;
  uint64_t v5;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  v4 = (_QWORD *)MEMORY[0x24BDB3E30];
  if (v3)
  {
    v5 = *MEMORY[0x24BDB3E30];
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
    objc_msgSend(v8, "reloadSpecifierForProvider:identifier:", *(_QWORD *)(a1 + 32), *v4);

  }
}

- (void)_registerForKeychainSyncStatusChangeNotification
{
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD handler[4];
  id v13;
  id location;

  objc_initWeak(&location, self);
  v3 = (const char *)*MEMORY[0x24BDE8518];
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke;
  handler[3] = &unk_251C612D8;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch(v3, &self->_keychainSyncNotificationToken, v4, handler);

  v6 = (const char *)*MEMORY[0x24BDE8EE0];
  v10[0] = v5;
  v10[1] = 3221225472;
  v10[2] = __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_2;
  v10[3] = &unk_251C612D8;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v6, &self->_keychainSyncNotificationToken, v4, v10);

  v7 = (const char *)*MEMORY[0x24BDE8EF0];
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_3;
  v8[3] = &unk_251C612D8;
  objc_copyWeak(&v9, &location);
  notify_register_dispatch(v7, &self->_keychainSyncNotificationToken, v4, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_keychainSyncStateDidChange");

}

void __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_keychainSyncStateDidChange");

}

void __80__ICSKeychainSpecifierProvider__registerForKeychainSyncStatusChangeNotification__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_keychainSyncStateDidChange");

}

- (void)_stopListeningForKeychainSyncStatusChangeNotification
{
  notify_cancel(self->_keychainSyncNotificationToken);
}

- (void)_keychainSyncStateDidChange
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "%@ received keychain sync state change notification.", (uint8_t *)&v6, 0xCu);

  }
  -[ICSKeychainSpecifierProvider _refreshKeychainState](self, "_refreshKeychainState");
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (iCloudHomeViewModel)homeViewModel
{
  return self->_homeViewModel;
}

- (void)setHomeViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_homeViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeViewModel, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
