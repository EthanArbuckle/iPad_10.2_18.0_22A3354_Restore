@implementation ICQInternetPrivacyDetailSpecifierProvider

- (ICQInternetPrivacyDetailSpecifierProvider)initWithViewModel:(id)a3 accountManager:(id)a4
{
  id v7;
  id v8;
  ICQInternetPrivacyDetailSpecifierProvider *v9;
  ICQInternetPrivacyDetailSpecifierProvider *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  ICQInternetPrivacyDetailSpecifierProvider *v23;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)ICQInternetPrivacyDetailSpecifierProvider;
  v9 = -[ICQInternetPrivacyDetailSpecifierProvider init](&v24, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewModel, a3);
    objc_storeStrong((id *)&v10->_accountManager, a4);
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "accounts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "aa_altDSID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDB4398], "defaultStore");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "aa_primaryAppleAccount");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "aa_altDSID");
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = (void *)MEMORY[0x24BE17DC8];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __78__ICQInternetPrivacyDetailSpecifierProvider_initWithViewModel_accountManager___block_invoke;
    v22[3] = &unk_24E3F3BF8;
    v23 = v10;
    objc_msgSend(v20, "requestGeoClassificationForFeatureID:bundleID:altDSID:ignoreCache:completion:", CFSTR("networking.privacy.subscriber"), v12, v17, 0, v22);

  }
  return v10;
}

uint64_t __78__ICQInternetPrivacyDetailSpecifierProvider_initWithViewModel_accountManager___block_invoke(uint64_t a1, uint64_t a2)
{
  _BOOL8 v3;
  void *v4;

  v3 = a2 == 2;
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setServiceIsLimited:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_startFetchingBannerModels");
}

- (ICQInternetPrivacyDetailSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICQInternetPrivacyDetailSpecifierProvider *v6;
  ICQInternetPrivacyDetailSpecifierProvider *v7;

  v5 = a3;
  v6 = -[ICQInternetPrivacyDetailSpecifierProvider init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;
  NSObject *v9;
  NSArray *v10;
  int v12;
  NSArray *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICQInternetPrivacyDetailSpecifierProvider _explanationSpecifiers](self, "_explanationSpecifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

    if (-[NSArray count](self->_banners, "count"))
    {
      -[ICQInternetPrivacyDetailSpecifierProvider _bannerSpecifiers](self, "_bannerSpecifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v6);

    }
    v7 = (NSArray *)objc_msgSend(v4, "copy");
    v8 = self->_specifiers;
    self->_specifiers = v7;

    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_specifiers;
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacyDetailSpecifierProvider returning specifiers %@", (uint8_t *)&v12, 0xCu);
    }

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_serviceEnabledSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, sel__setServiceEnabled_forSpecifier_, sel__serviceEnabledForSpecifier_, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setButtonAction:", sel__setServiceEnabled_forSpecifier_);
  return v6;
}

- (id)_IPAddressLocationSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "IPAddressLocationTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setControllerLoadAction:", sel__IPAddressLocationSpecifierWasTapped_);
  return v6;
}

- (id)_explanationSpecifiers
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSUInteger v19;
  void *v20;
  void *v21;
  NSUInteger v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PSSpecifier *v40;
  PSSpecifier *enableSwitchSpecifer;
  void *v42;
  id v44;
  void *v45;
  NSRange v46;

  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("INTERNET_PRIVACY_EXPLANATION"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75A30]);

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "privateRelayPausedMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "incompatibleSitesMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v10);

  objc_msgSend(v8, "appendString:", CFSTR(" "));
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "learnMoreLinkTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendString:", v12);

  v45 = v8;
  v13 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v3, "setProperty:forKey:", v13, *MEMORY[0x24BE75A58]);

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "privateRelayPausedMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "incompatibleSitesMessage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v16 + objc_msgSend(v18, "length") + 1;
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "learnMoreLinkTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "length");

  v46.location = v19;
  v46.length = v22;
  NSStringFromRange(v46);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v23, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v24, *MEMORY[0x24BE75A50]);

  objc_msgSend(v3, "setProperty:forKey:", CFSTR("presentIncompatibleSitesHelp"), *MEMORY[0x24BE75A38]);
  objc_msgSend(v44, "addObject:", v3);
  v25 = (void *)MEMORY[0x24BE75590];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "explanationTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v27, self, 0, 0, 0, 3, 0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "explanationTitle");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v30, *MEMORY[0x24BE75D50]);

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "explanationMessage");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v32, *MEMORY[0x24BE75D28]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ABOUT_PRIVATE_RELAY_LINK_URL"), &stru_24E400750, CFSTR("Localizable"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE04C58]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("ABOUT_PRIVATE_RELAY_LINK_TITLE"), &stru_24E400750, CFSTR("Localizable"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setObject:forKeyedSubscript:", v36, *MEMORY[0x24BE04C60]);

  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("PrivateRelayLargeIcon"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProperty:forKey:", v37, *MEMORY[0x24BE75AC8]);
  objc_msgSend(v28, "setProperty:forKey:", &unk_24E435F50, *MEMORY[0x24BE75860]);
  objc_msgSend(v44, "addObject:", v28);
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v36) = objc_msgSend(v38, "isEnabled");

  if ((_DWORD)v36)
  {
    -[ICQInternetPrivacyDetailSpecifierProvider _IPAddressLocationSpecifier](self, "_IPAddressLocationSpecifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v39);

  }
  -[ICQInternetPrivacyDetailSpecifierProvider _serviceEnabledSpecifier](self, "_serviceEnabledSpecifier");
  v40 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
  enableSwitchSpecifer = self->_enableSwitchSpecifer;
  self->_enableSwitchSpecifer = v40;

  objc_msgSend(v44, "addObject:", self->_enableSwitchSpecifer);
  v42 = (void *)objc_msgSend(v44, "copy");

  return v42;
}

- (id)_bannerSpecifiers
{
  void *v3;
  NSArray *banners;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  ICQInternetPrivacyDetailSpecifierProvider *v13;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  banners = self->_banners;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __62__ICQInternetPrivacyDetailSpecifierProvider__bannerSpecifiers__block_invoke;
  v11 = &unk_24E3F51C8;
  v12 = v3;
  v13 = self;
  v5 = v3;
  -[NSArray enumerateObjectsUsingBlock:](banners, "enumerateObjectsUsingBlock:", &v8);
  v6 = (void *)objc_msgSend(v5, "copy", v8, v9, v10, v11);

  return v6;
}

void __62__ICQInternetPrivacyDetailSpecifierProvider__bannerSpecifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char **v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  v7 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v3, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, *(_QWORD *)(a1 + 40), 0, 0, 0, 3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v3, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v10, *MEMORY[0x24BE75D50]);

  objc_msgSend(v3, "message");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperty:forKey:", v11, *MEMORY[0x24BE75D28]);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v9);
  v12 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v3, "buttonTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, *(_QWORD *)(a1 + 40), 0, 0, 0, 13, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setProperty:forKey:", &unk_24E435F68, *MEMORY[0x24BE75860]);
  if (objc_msgSend(v3, "status") == 1)
  {
    v15 = &selRef__turnOffWifiSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 2)
  {
    v15 = &selRef__unsupportedWiFiLearnMoreSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 4)
  {
    v15 = &selRef__turnOffCellularSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 8)
  {
    v15 = &selRef__unsupportedCellularLearnMoreSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 16)
  {
    v15 = &selRef__turnOnSafariSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 32)
  {
    v15 = &selRef__turnOnDNSSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 64)
  {
    v15 = &selRef__unsupportedRegionLearnMoreSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 128)
  {
    v15 = &selRef__turnOnWifiSpecifierWasTapped;
  }
  else if (objc_msgSend(v3, "status") == 256)
  {
    v15 = &selRef__turnOnCellularSpecifierWasTapped;
  }
  else
  {
    if (objc_msgSend(v3, "status") != 2048)
      goto LABEL_22;
    v15 = &selRef__openSystemStatusSpecifierWasTapped;
  }
  objc_msgSend(v14, "setButtonAction:", *v15);
LABEL_22:
  objc_msgSend(v3, "buttonTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v14);
  _ICQGetLogSystem();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v20 = v18;
    _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "Added specifier: %@", buf, 0xCu);
  }

}

- (void)_startFetchingBannerModels
{
  NSObject *v3;
  void *v4;
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
    v7 = "-[ICQInternetPrivacyDetailSpecifierProvider _startFetchingBannerModels]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __71__ICQInternetPrivacyDetailSpecifierProvider__startFetchingBannerModels__block_invoke;
  v5[3] = &unk_24E3F51F0;
  v5[4] = self;
  objc_msgSend(v4, "fetchBannerModels:", v5);

}

uint64_t __71__ICQInternetPrivacyDetailSpecifierProvider__startFetchingBannerModels__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setBanners:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (void)_turnOnSafariSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOnSafariSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v6, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider _turnOnSafariAlert](self, "_turnOnSafariAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showAlert:", v5);

}

- (void)_turnOnDNSSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOnDNSSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v6, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider _turnOnDNSAlert](self, "_turnOnDNSAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "showAlert:", v5);

}

- (void)_turnOffWifiSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOffWifiSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wiFiName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__ICQInternetPrivacyDetailSpecifierProvider__turnOffWifiSpecifierWasTapped__block_invoke;
  v7[3] = &unk_24E3F3F40;
  v7[4] = self;
  objc_msgSend(v4, "enableWifi:onNetworkName:completion:", 0, v6, v7);

}

void __75__ICQInternetPrivacyDetailSpecifierProvider__turnOffWifiSpecifierWasTapped__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startFetchingBannerModels");
    objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_turnOffUnsupportedWifiAlert");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showAlert:", v3);

  }
}

- (void)_turnOffCellularSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOffCellularSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellularName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__ICQInternetPrivacyDetailSpecifierProvider__turnOffCellularSpecifierWasTapped__block_invoke;
  v7[3] = &unk_24E3F3F40;
  v7[4] = self;
  objc_msgSend(v4, "enableCellular:onNetworkName:completion:", 0, v6, v7);

}

void __79__ICQInternetPrivacyDetailSpecifierProvider__turnOffCellularSpecifierWasTapped__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startFetchingBannerModels");
    objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_turnOffUnsupportedCellularAlert");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "showAlert:", v3);

  }
}

- (void)_turnOnWifiSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOnWifiSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wiFiName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__ICQInternetPrivacyDetailSpecifierProvider__turnOnWifiSpecifierWasTapped__block_invoke;
  v7[3] = &unk_24E3F3F40;
  v7[4] = self;
  objc_msgSend(v4, "enableWifi:onNetworkName:completion:", 1, v6, v7);

}

uint64_t __74__ICQInternetPrivacyDetailSpecifierProvider__turnOnWifiSpecifierWasTapped__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_refreshStatusAndPostNotification");
  return result;
}

- (void)_turnOnCellularSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOnCellularSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellularName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__ICQInternetPrivacyDetailSpecifierProvider__turnOnCellularSpecifierWasTapped__block_invoke;
  v7[3] = &unk_24E3F3F40;
  v7[4] = self;
  objc_msgSend(v4, "enableCellular:onNetworkName:completion:", 1, v6, v7);

}

uint64_t __78__ICQInternetPrivacyDetailSpecifierProvider__turnOnCellularSpecifierWasTapped__block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2)
    return objc_msgSend(*(id *)(result + 32), "_refreshStatusAndPostNotification");
  return result;
}

- (void)_openSystemStatusSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInternetPrivacyDetailSpecifierProvider _openSystemStatusSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentSystemStatus");

}

- (void)_unsupportedWiFiLearnMoreSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInternetPrivacyDetailSpecifierProvider _unsupportedWiFiLearnMoreSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentLearnMoreFrom:", CFSTR("com.apple.icloud.privaterelay.learnmoreunsupportednetwork"));

}

- (void)_unsupportedCellularLearnMoreSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInternetPrivacyDetailSpecifierProvider _unsupportedCellularLearnMoreSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentLearnMoreFrom:", CFSTR("com.apple.icloud.privaterelay.learnmoreunsupportednetwork"));

}

- (void)_unsupportedRegionLearnMoreSpecifierWasTapped
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInternetPrivacyDetailSpecifierProvider _unsupportedRegionLearnMoreSpecifierWasTapped]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentLearnMoreFrom:", CFSTR("com.apple.icloud.privaterelay.learnmoreunsupportedregion"));

}

- (void)_IPAddressLocationSpecifierWasTapped:(id)a3
{
  NSObject *v4;
  ICQInternetPrivacyLocationSharingViewController *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[ICQInternetPrivacyDetailSpecifierProvider _IPAddressLocationSpecifierWasTapped:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Tap action: %s", (uint8_t *)&v8, 0xCu);
  }

  v5 = objc_alloc_init(ICQInternetPrivacyLocationSharingViewController);
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyLocationSharingViewController setViewModel:](v5, "setViewModel:", v6);

  -[ICQInternetPrivacyDetailSpecifierProvider delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "specifierProvider:showViewController:", self, v5);

}

- (id)_serviceEnabledForSpecifier:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEnabled");
    v7 = CFSTR("NO");
    if (v6)
      v7 = CFSTR("YES");
    v12 = 138412290;
    v13 = v7;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "viewModel.isEnabled: %@", (uint8_t *)&v12, 0xCu);

  }
  v8 = (void *)MEMORY[0x24BDD16E0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "numberWithBool:", objc_msgSend(v9, "isEnabled"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_setServiceEnabled:(id)a3 forSpecifier:(id)a4
{
  NSArray *banners;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  if ((objc_msgSend(a3, "BOOLValue") & 1) != 0)
  {
    -[ICQInternetPrivacyDetailSpecifierProvider _updateEnableStatusTo:](self, "_updateEnableStatusTo:", 1);
  }
  else
  {
    if (-[NSArray count](self->_banners, "count"))
    {
      banners = self->_banners;
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __77__ICQInternetPrivacyDetailSpecifierProvider__setServiceEnabled_forSpecifier___block_invoke;
      v10[3] = &unk_24E3F5218;
      v10[4] = self;
      -[NSArray enumerateObjectsUsingBlock:](banners, "enumerateObjectsUsingBlock:", v10);
      -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQInternetPrivacyDetailSpecifierProvider _switchOffAlert](self, "_switchOffAlert");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "showAlert:", v7);

    }
    -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[ICQInternetPrivacyDetailSpecifierProvider _switchOffAlert](self, "_switchOffAlert");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "showAlert:", v8);

  }
}

void __77__ICQInternetPrivacyDetailSpecifierProvider__setServiceEnabled_forSpecifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "status") == 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_switchOffUnsupportedCellularAlert");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    objc_msgSend(v3, "showAlert:", v4);

    goto LABEL_6;
  }
  if (objc_msgSend(v6, "status") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_switchOffUnsupportedWifiAlert");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (id)_turnOffUnsupportedWifiAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  uint8_t buf[4];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOffUnsupportedWifiAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "wiFiName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsupportedTurnOffAlertTitleFor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unsupportedTurnOffWifiAlertMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v8, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unsupportedTurnOffAlertOk");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __73__ICQInternetPrivacyDetailSpecifierProvider__turnOffUnsupportedWifiAlert__block_invoke;
  v17[3] = &unk_24E3F4130;
  v17[4] = self;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v14, 1, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v15);
  return v11;
}

void __73__ICQInternetPrivacyDetailSpecifierProvider__turnOffUnsupportedWifiAlert__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "statusDidChange");

}

- (id)_turnOffUnsupportedCellularAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOffUnsupportedCellularAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsupportedTurnOffCellularAlertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unsupportedTurnOffCellularAlertMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsupportedTurnOffAlertOk");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __77__ICQInternetPrivacyDetailSpecifierProvider__turnOffUnsupportedCellularAlert__block_invoke;
  v15[3] = &unk_24E3F4130;
  v15[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v13);
  return v9;
}

void __77__ICQInternetPrivacyDetailSpecifierProvider__turnOffUnsupportedCellularAlert__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "statusDidChange");

}

- (id)_switchOffUnsupportedWifiAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[ICQInternetPrivacyDetailSpecifierProvider _switchOffUnsupportedWifiAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Switch action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsupportedWifiSwitchOffAlertMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "wiFiName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsupportedSwitchOffAlertTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v12, v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unsupportedSwitchOffNetworkOnly");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke;
  v30[3] = &unk_24E3F4130;
  v30[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v18);
  v19 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unsupportedSwitchOffCompletely");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke_3;
  v29[3] = &unk_24E3F4130;
  v29[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v22);
  v23 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "unsupportedSwitchOffCancel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke_4;
  v28[3] = &unk_24E3F4130;
  v28[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v26);
  return v13;
}

void __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "wiFiName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke_2;
  v7[3] = &unk_24E3F5240;
  objc_copyWeak(&v8, &location);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enableWifi:onNetworkName:completion:", 0, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2 && WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_setServiceEnabled:forSpecifier:", &unk_24E435F68, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v6, "_startFetchingBannerModels");
    objc_msgSend(v6, "detailDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusDidChange");

    WeakRetained = v6;
  }

}

uint64_t __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEnableStatusTo:", 0);
}

uint64_t __75__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedWifiAlert__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setServiceEnabled:forSpecifier:", &unk_24E435F68, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (id)_switchOffUnsupportedCellularAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  uint8_t buf[4];
  const char *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[ICQInternetPrivacyDetailSpecifierProvider _switchOffUnsupportedCellularAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Switch action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BDD17C8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unsupportedCellularSwitchOffAlertMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellularName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsupportedSwitchOffAlertTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "alertControllerWithTitle:message:preferredStyle:", v12, v9, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unsupportedSwitchOffProviderOnly");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke;
  v30[3] = &unk_24E3F4130;
  v30[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v18);
  v19 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unsupportedSwitchOffCompletely");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v17;
  v29[1] = 3221225472;
  v29[2] = __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke_3;
  v29[3] = &unk_24E3F4130;
  v29[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v29);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v22);
  v23 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "unsupportedSwitchOffCancel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v17;
  v28[1] = 3221225472;
  v28[2] = __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke_4;
  v28[3] = &unk_24E3F4130;
  v28[4] = self;
  objc_msgSend(v23, "actionWithTitle:style:handler:", v25, 1, v28);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addAction:", v26);
  return v13;
}

void __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  id location;

  v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cellularName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke_2;
  v7[3] = &unk_24E3F5240;
  objc_copyWeak(&v8, &location);
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "enableCellular:onNetworkName:completion:", 0, v6, v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2 && WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "_setServiceEnabled:forSpecifier:", &unk_24E435F68, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
    objc_msgSend(v6, "_startFetchingBannerModels");
    objc_msgSend(v6, "detailDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusDidChange");

    WeakRetained = v6;
  }

}

uint64_t __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEnableStatusTo:", 0);
}

uint64_t __79__ICQInternetPrivacyDetailSpecifierProvider__switchOffUnsupportedCellularAlert__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setServiceEnabled:forSpecifier:", &unk_24E435F68, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (id)_switchOffAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[ICQInternetPrivacyDetailSpecifierProvider _switchOffAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Switch action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switchOffAlertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "switchOffAlertMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "switchOffAlertPause");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __60__ICQInternetPrivacyDetailSpecifierProvider__switchOffAlert__block_invoke;
  v26[3] = &unk_24E3F4130;
  v26[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 0, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v14);
  v15 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "switchOffAlertTurnOff");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __60__ICQInternetPrivacyDetailSpecifierProvider__switchOffAlert__block_invoke_2;
  v25[3] = &unk_24E3F4130;
  v25[4] = self;
  objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 2, v25);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v18);
  v19 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unsupportedSwitchOffCancel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v13;
  v24[1] = 3221225472;
  v24[2] = __60__ICQInternetPrivacyDetailSpecifierProvider__switchOffAlert__block_invoke_3;
  v24[3] = &unk_24E3F4130;
  v24[4] = self;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v22);
  return v9;
}

uint64_t __60__ICQInternetPrivacyDetailSpecifierProvider__switchOffAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pausePrivateRelay");
}

uint64_t __60__ICQInternetPrivacyDetailSpecifierProvider__switchOffAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateEnableStatusTo:", 0);
}

uint64_t __60__ICQInternetPrivacyDetailSpecifierProvider__switchOffAlert__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (void)presentIncompatibleSitesHelp
{
  id v2;

  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentIncompatibleSitesHelp");

}

- (id)_turnOnSafariAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOnSafariAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnOnSafariAlertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnOnSafariAlertMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsupportedTurnOffAlertOk");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __63__ICQInternetPrivacyDetailSpecifierProvider__turnOnSafariAlert__block_invoke;
  v15[3] = &unk_24E3F4130;
  v15[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v13);
  return v9;
}

void __63__ICQInternetPrivacyDetailSpecifierProvider__turnOnSafariAlert__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__ICQInternetPrivacyDetailSpecifierProvider__turnOnSafariAlert__block_invoke_2;
  v3[3] = &unk_24E3F3F40;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enableSafari:", v3);

}

void __63__ICQInternetPrivacyDetailSpecifierProvider__turnOnSafariAlert__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startFetchingBannerModels");
    objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusDidChange");

  }
}

- (id)_turnOnDNSAlert
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[ICQInternetPrivacyDetailSpecifierProvider _turnOnDNSAlert]";
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Tap action: %s", buf, 0xCu);
  }

  v4 = (void *)MEMORY[0x24BEBD3B0];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "turnOnDNSAlertTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "turnOnDNSAlertMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD3A8];
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unsupportedTurnOffAlertOk");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__ICQInternetPrivacyDetailSpecifierProvider__turnOnDNSAlert__block_invoke;
  v15[3] = &unk_24E3F4130;
  v15[4] = self;
  objc_msgSend(v10, "actionWithTitle:style:handler:", v12, 1, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addAction:", v13);
  return v9;
}

void __60__ICQInternetPrivacyDetailSpecifierProvider__turnOnDNSAlert__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__ICQInternetPrivacyDetailSpecifierProvider__turnOnDNSAlert__block_invoke_2;
  v3[3] = &unk_24E3F3F40;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "enableDNS:", v3);

}

void __60__ICQInternetPrivacyDetailSpecifierProvider__turnOnDNSAlert__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v3;

  if (!a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_startFetchingBannerModels");
    objc_msgSend(*(id *)(a1 + 32), "detailDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusDidChange");

  }
}

- (void)_reloadSpecifiers
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__ICQInternetPrivacyDetailSpecifierProvider__reloadSpecifiers__block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __62__ICQInternetPrivacyDetailSpecifierProvider__reloadSpecifiers__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setSpecifiers:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadSpecifiersForProvider:oldSpecifiers:animated:", *(_QWORD *)(a1 + 32), v3, 0);

}

- (void)_pausePrivateRelay
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __63__ICQInternetPrivacyDetailSpecifierProvider__pausePrivateRelay__block_invoke;
  v4[3] = &unk_24E3F5268;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "pausePrivateRelayUntilTomorrow:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__ICQInternetPrivacyDetailSpecifierProvider__pausePrivateRelay__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_startFetchingBannerModels");
    objc_msgSend(v5, "detailDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusDidChange");

    WeakRetained = v5;
  }

}

- (void)_updateEnableStatusTo:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v3 = a3;
  objc_initWeak(&location, self);
  -[ICQInternetPrivacyDetailSpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__ICQInternetPrivacyDetailSpecifierProvider__updateEnableStatusTo___block_invoke;
  v6[3] = &unk_24E3F5268;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "setEnabled:completion:", v3, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __67__ICQInternetPrivacyDetailSpecifierProvider__updateEnableStatusTo___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_startFetchingBannerModels");
    objc_msgSend(v5, "detailDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "statusDidChange");

    WeakRetained = v5;
  }

}

- (void)_refreshStatusAndPostNotification
{
  id v3;

  -[ICQInternetPrivacyDetailSpecifierProvider _startFetchingBannerModels](self, "_startFetchingBannerModels");
  -[ICQInternetPrivacyDetailSpecifierProvider detailDelegate](self, "detailDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "statusDidChange");

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ICQInternetPrivacyDetailDelegate)detailDelegate
{
  return (ICQInternetPrivacyDetailDelegate *)objc_loadWeakRetained((id *)&self->_detailDelegate);
}

- (void)setDetailDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_detailDelegate, a3);
}

- (UIViewController)presenter
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
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

- (NSArray)banners
{
  return self->_banners;
}

- (void)setBanners:(id)a3
{
  objc_storeStrong((id *)&self->_banners, a3);
}

- (PSSpecifier)enableSwitchSpecifer
{
  return self->_enableSwitchSpecifer;
}

- (void)setEnableSwitchSpecifer:(id)a3
{
  objc_storeStrong((id *)&self->_enableSwitchSpecifer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableSwitchSpecifer, 0);
  objc_storeStrong((id *)&self->_banners, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_detailDelegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
