@implementation ICSPrivateEmailSpecifierProvider

- (ICSPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICSPrivateEmailSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (ICSPrivateEmailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v6;

  objc_storeStrong((id *)&self->_accountManager, a3);
  v6 = a4;
  objc_storeWeak((id *)&self->_presenter, v6);

  -[ICSPrivateEmailSpecifierProvider _fetchCloudStorageSummary](self, "_fetchCloudStorageSummary");
  return self;
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
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PSSpecifier *v8;
  PSSpecifier *privateEmailSpecifier;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  ICQCloudStorageSummary *storageSummary;
  void *v15;
  char v16;
  NSArray *v17;
  NSArray *v18;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PRIVATE_EMAIL_ADDRESSES"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 1, 0);
    v8 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    privateEmailSpecifier = self->privateEmailSpecifier;
    self->privateEmailSpecifier = v8;

    -[PSSpecifier setControllerLoadAction:](self->privateEmailSpecifier, "setControllerLoadAction:", sel__privateEmailSpecifierWasTapped_);
    -[PSSpecifier setIdentifier:](self->privateEmailSpecifier, "setIdentifier:", CFSTR("PRIVATE_EMAIL_MANAGE"));
    v10 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageNamed:inBundle:", CFSTR("privateEmailAddressIcon.png"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[PSSpecifier setProperty:forKey:](self->privateEmailSpecifier, "setProperty:forKey:", v12, *MEMORY[0x24BE75AC8]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      storageSummary = self->_storageSummary;
      if (!storageSummary)
      {

        goto LABEL_9;
      }
      -[ICQCloudStorageSummary subscriptionInfo](storageSummary, "subscriptionInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isiCloudPlusSubscriber");

      if ((v16 & 1) != 0)
        goto LABEL_9;
    }
    else
    {

    }
    objc_msgSend(v4, "addObject:", self->privateEmailSpecifier);
LABEL_9:
    v17 = (NSArray *)objc_msgSend(v4, "copy");
    v18 = self->_specifiers;
    self->_specifiers = v17;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)_reloadPrivateEmailSpecifier
{
  NSArray *specifiers;
  id WeakRetained;
  id v5;

  v5 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 0);

}

- (void)_privateEmailSpecifierWasTapped:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  ICSMatterhornUpsellHook *v11;
  ICSPrivateEmailUpdateCacheHook *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  AIDAAccountManager *accountManager;
  id v21;
  AAUIGrandSlamRemoteUIPresenter *v22;
  AAUIGrandSlamRemoteUIPresenter *privateEmailPresenter;
  void *v24;
  _QWORD v25[4];

  v25[3] = *MEMORY[0x24BDAC8D0];
  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:willBeginLoadingSpecifier:", self, v5);

  objc_msgSend(MEMORY[0x24BE0ADF0], "bagForAltDSID:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "privateEmailManageURL");
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  v24 = (void *)v8;
  objc_msgSend(v9, "setURL:", v8);
  objc_msgSend(v9, "setHTTPMethod:", CFSTR("GET"));
  LogSubsystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[ICSPrivateEmailSpecifierProvider _privateEmailSpecifierWasTapped:].cold.1((uint64_t)v9, v10);

  v11 = objc_alloc_init(ICSMatterhornUpsellHook);
  v12 = objc_alloc_init(ICSPrivateEmailUpdateCacheHook);
  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x24BE04D00]);
  objc_msgSend(v14, "aa_altDSID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithAltDSID:upgradeContext:", v16, *MEMORY[0x24BE0AC50]);

  v25[0] = v11;
  v25[1] = v12;
  v25[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x24BE04D18]);
  accountManager = self->_accountManager;
  v21 = objc_loadWeakRetained((id *)&self->_presenter);
  v22 = (AAUIGrandSlamRemoteUIPresenter *)objc_msgSend(v19, "initWithAccountManager:presenter:hooks:", accountManager, v21, v18);
  privateEmailPresenter = self->_privateEmailPresenter;
  self->_privateEmailPresenter = v22;

  -[AAUIGrandSlamRemoteUIPresenter setDelegate:](self->_privateEmailPresenter, "setDelegate:", self);
  -[AAUIGrandSlamRemoteUIPresenter loadRequest:](self->_privateEmailPresenter, "loadRequest:", v9);

}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
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
  _QWORD block[5];
  uint8_t buf[16];

  v5 = a4;
  LogSubsystem();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ICSPrivateEmailSpecifierProvider remoteUIRequestComplete:error:].cold.1((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v7, OS_LOG_TYPE_DEFAULT, "private email specifier provider success", buf, 2u);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ICSPrivateEmailSpecifierProvider_remoteUIRequestComplete_error___block_invoke;
  block[3] = &unk_251C60DC8;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __66__ICSPrivateEmailSpecifierProvider_remoteUIRequestComplete_error___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 40));
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v3 + 48), "specifierForID:", CFSTR("PRIVATE_EMAIL_MANAGE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifierProvider:didFinishLoadingSpecifier:", v3, v4);

  }
}

- (void)_fetchCloudStorageSummary
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICSPrivateEmailSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAccount:", v4);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke;
  v6[3] = &unk_251C614B0;
  v6[4] = self;
  objc_msgSend(v5, "fetchStorageSummaryWithCompletion:", v6);

}

void __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v5;
  v9 = v5;

  if (v6)
  {
    LogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_cold_1((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_52;
  block[3] = &unk_251C60DC8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_52(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadPrivateEmailSpecifier");
}

- (BOOL)handleURL:(id)a3
{
  void *v4;
  int v5;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("path"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("PRIVATE_EMAIL_MANAGE"));
  if (v5)
    -[ICSPrivateEmailSpecifierProvider _privateEmailSpecifierWasTapped:](self, "_privateEmailSpecifierWasTapped:", self->privateEmailSpecifier);

  return v5;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->privateEmailSpecifier, 0);
  objc_storeStrong((id *)&self->_privateEmailPresenter, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_privateEmailSpecifierWasTapped:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_DEBUG, "Private email specifier tapped, url %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)remoteUIRequestComplete:(uint64_t)a3 error:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "private email specifier failed with error %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void __61__ICSPrivateEmailSpecifierProvider__fetchCloudStorageSummary__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_24B4C1000, a2, a3, "Failed to fetch storage summary with error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

@end
