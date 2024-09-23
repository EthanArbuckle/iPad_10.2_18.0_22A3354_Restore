@implementation ICQInternetPrivacyLocationSharingSpecifierProvider

- (ICQInternetPrivacyLocationSharingSpecifierProvider)init
{
  ICQInternetPrivacyLocationSharingSpecifierProvider *v2;
  ICQInternetPrivacyLocationSharingSpecifierProvider *v3;
  ICQInternetPrivacyViewModel *v4;
  ICQInternetPrivacyViewModel *viewModel;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICQInternetPrivacyLocationSharingSpecifierProvider;
  v2 = -[ICQInternetPrivacyLocationSharingSpecifierProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    if (!v2->_viewModel)
    {
      v4 = objc_alloc_init(ICQInternetPrivacyViewModel);
      viewModel = v3->_viewModel;
      v3->_viewModel = v4;

    }
    -[ICQInternetPrivacyLocationSharingSpecifierProvider _startFetchingSharingLocationPreference](v3, "_startFetchingSharingLocationPreference");
  }
  return v3;
}

- (ICQInternetPrivacyLocationSharingSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICQInternetPrivacyLocationSharingSpecifierProvider *v6;
  ICQInternetPrivacyLocationSharingSpecifierProvider *v7;

  v5 = a3;
  v6 = -[ICQInternetPrivacyLocationSharingSpecifierProvider init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  NSArray **p_specifiers;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PSSpecifier *v11;
  PSSpecifier *enableSpecifier;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICQInternetPrivacyViewModel *viewModel;
  void *v20;
  NSObject *v21;
  NSArray *v22;
  uint8_t buf[4];
  NSArray *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  p_specifiers = &self->_specifiers;
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = (void *)MEMORY[0x24BE75590];
    -[ICQInternetPrivacyViewModel IPAddressLocationEnabledTitle](self->_viewModel, "IPAddressLocationEnabledTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupSpecifierWithID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObject:", v8);
    v9 = (void *)MEMORY[0x24BE75590];
    -[ICQInternetPrivacyViewModel IPAddressLocationEnabledTitle](self->_viewModel, "IPAddressLocationEnabledTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, 0, 0, 0, 3, 0);
    v11 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    enableSpecifier = self->_enableSpecifier;
    self->_enableSpecifier = v11;

    if (self->_locationSharingEnabled)
      v13 = &unk_24E435EA8;
    else
      v13 = &unk_24E435EC0;
    v14 = *MEMORY[0x24BE75850];
    -[PSSpecifier setProperty:forKey:](self->_enableSpecifier, "setProperty:forKey:", v13, *MEMORY[0x24BE75850]);
    -[PSSpecifier setButtonAction:](self->_enableSpecifier, "setButtonAction:", sel__specifierWasTapped_);
    -[PSSpecifier setUserInfo:](self->_enableSpecifier, "setUserInfo:", MEMORY[0x24BDBD1C8]);
    objc_msgSend(v5, "addObject:", self->_enableSpecifier);
    v15 = (void *)MEMORY[0x24BE75590];
    -[ICQInternetPrivacyViewModel IPAddressLocationDisabledTitle](self->_viewModel, "IPAddressLocationDisabledTitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, 0, 0, 0, 3, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_locationSharingEnabled)
      v18 = &unk_24E435EC0;
    else
      v18 = &unk_24E435EA8;
    objc_msgSend(v17, "setProperty:forKey:", v18, v14);
    objc_msgSend(v17, "setButtonAction:", sel__specifierWasTapped_);
    objc_msgSend(v17, "setUserInfo:", MEMORY[0x24BDBD1C0]);
    objc_msgSend(v5, "addObject:", v17);
    viewModel = self->_viewModel;
    if (self->_locationSharingEnabled)
      -[ICQInternetPrivacyViewModel IPAddressLocationEnabledMessage](viewModel, "IPAddressLocationEnabledMessage");
    else
      -[ICQInternetPrivacyViewModel IPAddressLocationDisabledMessage](viewModel, "IPAddressLocationDisabledMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v20, *MEMORY[0x24BE75A68]);
    objc_storeStrong((id *)p_specifiers, v5);
    _ICQGetLogSystem();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *p_specifiers;
      *(_DWORD *)buf = 138412290;
      v25 = v22;
      _os_log_impl(&dword_21F2CC000, v21, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyLocationSharingSpecifierProvider returning specifiers %@", buf, 0xCu);
    }

    specifiers = *p_specifiers;
  }
  return specifiers;
}

- (void)_specifierWasTapped:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  ICQInternetPrivacyViewModel *viewModel;
  uint64_t v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Location Sharing Specifier Tapped: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  viewModel = self->_viewModel;
  v8 = objc_msgSend(v6, "BOOLValue");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__ICQInternetPrivacyLocationSharingSpecifierProvider__specifierWasTapped___block_invoke;
  v9[3] = &unk_24E3F3F40;
  v9[4] = self;
  -[ICQInternetPrivacyViewModel enableLocationSharing:completion:](viewModel, "enableLocationSharing:completion:", v8, v9);

}

uint64_t __74__ICQInternetPrivacyLocationSharingSpecifierProvider__specifierWasTapped___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_startFetchingSharingLocationPreference");
  return result;
}

- (void)_startFetchingSharingLocationPreference
{
  NSObject *v3;
  ICQInternetPrivacyViewModel *viewModel;
  _QWORD v5[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[ICQInternetPrivacyLocationSharingSpecifierProvider _startFetchingSharingLocationPreference]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  viewModel = self->_viewModel;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __93__ICQInternetPrivacyLocationSharingSpecifierProvider__startFetchingSharingLocationPreference__block_invoke;
  v5[3] = &unk_24E3F3540;
  v5[4] = self;
  -[ICQInternetPrivacyViewModel isLocationSharingEnabled:](viewModel, "isLocationSharingEnabled:", v5);
}

uint64_t __93__ICQInternetPrivacyLocationSharingSpecifierProvider__startFetchingSharingLocationPreference__block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = a2;
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (void)_reloadSpecifiers
{
  NSArray *specifiers;
  void *v4;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v5 = (id)-[NSArray copy](self->_specifiers, "copy");
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  -[ICQInternetPrivacyLocationSharingSpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v5, 0);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (BOOL)locationSharingEnabled
{
  return self->_locationSharingEnabled;
}

- (void)setLocationSharingEnabled:(BOOL)a3
{
  self->_locationSharingEnabled = a3;
}

- (PSSpecifier)enableSpecifier
{
  return self->_enableSpecifier;
}

- (void)setEnableSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_enableSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableSpecifier, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
