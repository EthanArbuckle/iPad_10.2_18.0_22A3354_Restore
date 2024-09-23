@implementation ICQInternetPrivacySpecifierProvider

- (ICQInternetPrivacySpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICQInternetPrivacySpecifierProvider *v6;
  ICQInternetPrivacySpecifierProvider *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ICQInternetPrivacySpecifierProvider;
  v6 = -[ICQInternetPrivacySpecifierProvider init](&v19, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    -[AIDAAccountManager accounts](v7->_accountManager, "accounts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "aa_isAccountClass:", *MEMORY[0x24BE047F0]))
    {
      objc_msgSend(v9, "aa_altDSID");
      v10 = objc_claimAutoreleasedReturnValue();
      -[ICQInternetPrivacySpecifierProvider _setupWithAltDSID:](v7, "_setupWithAltDSID:", v10);
    }
    else
    {
      _ICQGetLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICQInternetPrivacySpecifierProvider initWithAccountManager:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    }

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (self->_observationToken)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self->_observationToken);

  }
  -[ICQInternetPrivacySpecifierProvider _unregisterForNSPDarwinNotification](self, "_unregisterForNSPDarwinNotification");
  v5.receiver = self;
  v5.super_class = (Class)ICQInternetPrivacySpecifierProvider;
  -[ICQInternetPrivacySpecifierProvider dealloc](&v5, sel_dealloc);
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;

  -[ICQInternetPrivacySpecifierProvider accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)reloadSpecifer:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Should reload specifer for new Internet Privacy status.", v5, 2u);
  }

  -[ICQInternetPrivacySpecifierProvider _fetchStatus](self, "_fetchStatus");
}

- (NSArray)specifiers
{
  NSObject *v3;
  unint64_t v4;
  const __CFString *v5;
  NSObject *v6;
  NSArray *v7;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSArray *v13;
  NSArray *specifiers;
  void *v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[ICQInternetPrivacySpecifierProvider internetPrivacyAvailability](self, "internetPrivacyAvailability");
    if (v4 - 1 > 2)
      v5 = CFSTR("Unknown");
    else
      v5 = off_24E3F3C90[v4 - 1];
    *(_DWORD *)buf = 138412290;
    v17 = (void *)v5;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Internet Privacy country availability: %@", buf, 0xCu);
  }

  if (!self->_specifiers)
  {
    -[ICQInternetPrivacySpecifierProvider internetPrivacySpecifier](self, "internetPrivacySpecifier");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = -[ICQInternetPrivacySpecifierProvider _shouldShowInternetPrivacySpecifier](self, "_shouldShowInternetPrivacySpecifier");

      if (v11)
      {
        -[ICQInternetPrivacySpecifierProvider internetPrivacySpecifier](self, "internetPrivacySpecifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v12;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
        v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
        specifiers = self->_specifiers;
        self->_specifiers = v13;

      }
    }
  }
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = self->_specifiers;
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "ICQInternetPrivacySpecifierProvider returning specifiers %@", buf, 0xCu);
  }

  return self->_specifiers;
}

- (void)_reloadSpecifiers
{
  void *v3;
  id v4;

  v4 = (id)-[NSArray copy](self->_specifiers, "copy");
  -[ICQInternetPrivacySpecifierProvider setSpecifiers:](self, "setSpecifiers:", 0);
  -[ICQInternetPrivacySpecifierProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v4, 1);

}

- (void)reloadQuotaInfo
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing quota storage info.", v4, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);

}

- (void)_setupWithAltDSID:(id)a3
{
  id v4;
  ICQInternetPrivacyViewModel *v5;
  ICQInternetPrivacyViewModel *viewModel;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *observationToken;
  _QWORD v17[5];
  _QWORD v18[5];
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(ICQInternetPrivacyViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  self->_internetPrivacyAvailability = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasProfileRestriction = objc_msgSend(v7, "isCloudPrivateRelayAllowed") ^ 1;

  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v20 = CFSTR("networking.privacy.subscriber");
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Loading internet privacy service availability for %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQInternetPrivacySpecifierProvider makeDefaultInternetPrivacySpecifier](self, "makeDefaultInternetPrivacySpecifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySpecifierProvider setInternetPrivacySpecifier:](self, "setInternetPrivacySpecifier:", v11);

  v12 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke;
  v18[3] = &unk_24E3F3BF8;
  v18[4] = self;
  objc_msgSend(MEMORY[0x24BE17DC8], "requestGeoClassificationForFeatureID:bundleID:altDSID:ignoreCache:completion:", CFSTR("networking.privacy.subscriber"), v10, v4, 0, v18);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", self, sel_reloadSpecifer_, CFSTR("PorcupineStatusDidChange"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel_reloadSpecifer_, *MEMORY[0x24BE63740], 0);

  objc_initWeak((id *)buf, self);
  v17[0] = v12;
  v17[1] = 3221225472;
  v17[2] = __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_2;
  v17[3] = &unk_24E3F3610;
  v17[4] = self;
  objc_msgSend(MEMORY[0x24BE17DC8], "registerForFeatureChangeNotificationsUsingBlock:", v17);
  v15 = objc_claimAutoreleasedReturnValue();
  observationToken = self->_observationToken;
  self->_observationToken = v15;

  -[ICQInternetPrivacySpecifierProvider _registerForNSPDarwinNotification](self, "_registerForNSPDarwinNotification");
  objc_destroyWeak((id *)buf);

}

void __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  _QWORD *v10;
  _BOOL8 v11;
  void *v12;
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 2)
      v8 = CFSTR("Unknown");
    else
      v8 = off_24E3F3C90[a2 - 1];
    objc_msgSend(v6, "localizedDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Received status %@, error: %@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setInternetPrivacyAvailability:", a2);
  v10 = *(_QWORD **)(a1 + 32);
  v11 = v10[9] == 2;
  objc_msgSend(v10, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setServiceIsLimited:", v11);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_28;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_msgSend(*(id *)(a1 + 32), "_fetchStatus");

}

uint64_t __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_28(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "internetPrivacySpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_configureInternetPrivacySpecifier:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

uint64_t __57__ICQInternetPrivacySpecifierProvider__setupWithAltDSID___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "received feature change notification; reloading internet privacy specifiers",
      v4,
      2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_fetchStatusWithCompletion:", 0);
}

- (void)_presentLearnMoreSubscriberPage
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = CFSTR("com.apple.icloud.privaterelay.learnmoresubscriber");
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Presenting sheet with identifier %@", (uint8_t *)&v8, 0xCu);
  }

  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQInternetPrivacySheetPresenter presenterWithIdentifier:viewModel:](ICQInternetPrivacySheetPresenter, "presenterWithIdentifier:viewModel:", CFSTR("com.apple.icloud.privaterelay.learnmoresubscriber"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICQInternetPrivacySpecifierProvider delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setPresentingViewController:", v7);
  objc_msgSend(v5, "present");

}

- (id)makeDefaultInternetPrivacySpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE75590];
  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel__valueForInternetPrivacySpecifier_, objc_opt_class(), -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", CFSTR("INTERNET_PRIVACY"));
  objc_msgSend(MEMORY[0x24BEBD640], "icqBundleImageNamed:", CFSTR("PrivateRelayIcon"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v6, "setControllerLoadAction:", sel__controllerLoadAction);
  return v6;
}

- (void)_controllerLoadAction
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __60__ICQInternetPrivacySpecifierProvider__controllerLoadAction__block_invoke;
  v2[3] = &unk_24E3F3610;
  v2[4] = self;
  -[ICQInternetPrivacySpecifierProvider _fetchStatusWithCompletion:](self, "_fetchStatusWithCompletion:", v2);
}

void __60__ICQInternetPrivacySpecifierProvider__controllerLoadAction__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "proxyUserTierDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "proxyAccountTypeDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412546;
    v13 = v4;
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "tap action: got user tier: %@, account type: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "proxyAccountType");

  if (v8 == 2)
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v11, "internetPrivacySpecifier");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_internetPrivacySpecifierWasTapped:", v10);
  }
  else if (v8 == 1)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "internetPrivacySpecifier");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_internetPrivacySpecifierLoadJourney:", v10);
  }
  else
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_21F2CC000, v10, OS_LOG_TYPE_DEFAULT, "in waiting state ... not doing anything", (uint8_t *)&v12, 2u);
    }
  }

}

- (void)_configureInternetPrivacySpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a3;
  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switchTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setName:", v5);

  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  if (v7 == 7)
    v8 = -1;
  else
    v8 = 2;
  objc_msgSend(v9, "setCellType:", v8);

}

- (id)_valueForInternetPrivacySpecifier:(id)a3
{
  return -[ICQInternetPrivacyViewModel privateRelayStatusText](self->_viewModel, "privateRelayStatusText", a3);
}

- (void)_fetchStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  uint8_t buf[16];
  _QWORD v14[3];
  uint64_t v15;

  v4 = a3;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v15 = 0;
  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "status");

  v15 = v6;
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "fetching bannerModels from viewModel", buf, 2u);
  }

  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke;
  v10[3] = &unk_24E3F3C48;
  v10[4] = self;
  v12 = v14;
  v9 = v4;
  v11 = v9;
  objc_msgSend(v8, "fetchBannerModels:", v10);

  _Block_object_dispose(v14, 8);
}

void __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke(uint64_t a1)
{
  id v1;
  __int128 v2;
  _QWORD block[5];
  __int128 v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke_2;
  block[3] = &unk_24E3F3C20;
  block[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 40);
  v1 = (id)v2;
  v4 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__ICQInternetPrivacySpecifierProvider__fetchStatusWithCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t result;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "status");

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "status");
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3)
    v9 = 0;
  else
    v9 = v5 == v6;
  if (v9)
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewModel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "statusDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412290;
      v19 = v16;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Skipping Internet Privacy specifier reload in iCloud. Status hasn't changed: %@", (uint8_t *)&v18, 0xCu);

    }
  }
  else
  {
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "viewModel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "statusDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      ICQInternetPrivacyViewModelStatusDescription(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v11;
      v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Configuring and reloading Internet Privacy specifier in iCloud. New status: %@, old status: %@", (uint8_t *)&v18, 0x16u);

    }
    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "internetPrivacySpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_configureInternetPrivacySpecifier:", v14);

    objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_fetchStatus
{
  -[ICQInternetPrivacySpecifierProvider _fetchStatusWithCompletion:](self, "_fetchStatusWithCompletion:", 0);
}

- (void)_internetPrivacySpecifierWasTapped:(id)a3
{
  ICQInternetPrivacyViewController *v4;
  void *v5;
  void *v6;
  ICQInternetPrivacyViewController *v7;
  ICQInternetPrivacyViewController *internetPrivacyController;
  NSObject *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = [ICQInternetPrivacyViewController alloc];
  -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICQInternetPrivacySpecifierProvider accountManager](self, "accountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICQInternetPrivacyViewController initWithViewModel:accountManager:](v4, "initWithViewModel:accountManager:", v5, v6);
  internetPrivacyController = self->_internetPrivacyController;
  self->_internetPrivacyController = v7;

  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[ICQInternetPrivacySpecifierProvider viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "serviceIsLimited");
    v12 = CFSTR("NO");
    if (v11)
      v12 = CFSTR("YES");
    v14 = 138412290;
    v15 = v12;
    _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "_internetPrivacySpecifierWasTapped country limited %@", (uint8_t *)&v14, 0xCu);

  }
  -[ICQInternetPrivacySpecifierProvider delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "specifierProvider:showViewController:", self, self->_internetPrivacyController);

}

- (void)_internetPrivacySpecifierLoadJourney:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD block[5];
  uint8_t buf[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Not a private relay subscriber. Presenting journey flow", buf, 2u);
  }

  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke;
  block[3] = &unk_24E3F3610;
  block[4] = self;
  dispatch_async(v5, block);

}

void __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke(uint64_t a1)
{
  ICQUpgradeFlowManager *v2;
  ICQUpgradeFlowManager *v3;
  uint64_t v4;
  ICQUpgradeFlowManager *v5;
  _QWORD v6[4];
  ICQUpgradeFlowManager *v7;
  uint64_t v8;

  v2 = [ICQUpgradeFlowManager alloc];
  v3 = -[ICQUpgradeFlowManager initWithJourneyId:](v2, "initWithJourneyId:", *MEMORY[0x24BEC7228]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2;
  v6[3] = &unk_24E3F34D8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "setDelegate:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "beginJourney");
    objc_msgSend(*(id *)(a1 + 40), "setFlowManager:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (BOOL)_shouldShowInternetPrivacySpecifier
{
  _BOOL4 v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = -[ICQInternetPrivacySpecifierProvider hasProfileRestriction](self, "hasProfileRestriction");
  if (v2)
  {
    _ICQGetLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Hiding Private Relay because [MCProfileConnection sharedConnection] isCloudPrivateRelayAllowed] is NO (Private Relay has a profile restriction)", v5, 2u);
    }

  }
  return !v2;
}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInternetPrivacySpecifierProvider upgradeFlowManagerDidCancel:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Freshmint %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInternetPrivacySpecifierProvider reloadSpecifer:](self, "reloadSpecifer:", 0);
}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ICQInternetPrivacySpecifierProvider upgradeFlowManagerDidComplete:]";
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Freshmint %s", (uint8_t *)&v5, 0xCu);
  }

  -[ICQInternetPrivacySpecifierProvider reloadSpecifer:](self, "reloadSpecifer:", 0);
  -[ICQInternetPrivacySpecifierProvider reloadQuotaInfo](self, "reloadQuotaInfo");
}

- (BOOL)handleURL:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  objc_msgSend(v4, "valueForKey:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsString:", CFSTR("INTERNET_PRIVACY")))
    v6 = -[ICQInternetPrivacySpecifierProvider _handleQuotaJourneyURL:](self, "_handleQuotaJourneyURL:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)_handleQuotaJourneyURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[5];
  _QWORD v18[5];
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("learnMore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "BOOLValue"))
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke;
    v18[3] = &unk_24E3F3610;
    v18[4] = self;
    -[ICQInternetPrivacySpecifierProvider _fetchStatusWithCompletion:](self, "_fetchStatusWithCompletion:", v18);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showNotice"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("showNotice"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      v10 = CFSTR("false");
      if (v9)
        v10 = CFSTR("true");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("showNotice=%@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _ICQGetLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      v14 = *MEMORY[0x24BEC7228];
      if (v13)
      {
        *(_DWORD *)buf = 138412290;
        v21 = v14;
        _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Launching quota journey with id: %@", buf, 0xCu);
      }

      v19 = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_62;
      v17[3] = &unk_24E3F3C70;
      v17[4] = self;
      +[ICQUpgradeFlowManager flowManagerWithJourneyId:params:completion:](ICQUpgradeFlowManager, "flowManagerWithJourneyId:params:completion:", v14, v15, v17);

    }
    else
    {
      -[ICQInternetPrivacySpecifierProvider _controllerLoadAction](self, "_controllerLoadAction");
    }

  }
  return 1;
}

void __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "proxyAccountType");

  v4 = *(void **)(a1 + 32);
  if (v3 == 1)
  {
    objc_msgSend(v4, "internetPrivacySpecifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_internetPrivacySpecifierLoadJourney:", v5);

  }
  else
  {
    objc_msgSend(v4, "_presentLearnMoreSubscriberPage");
  }
}

void __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_62(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[4];
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setFlowManager:", v5);
    objc_msgSend(v5, "setDelegate:", *(_QWORD *)(a1 + 32));
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_2;
    block[3] = &unk_24E3F3610;
    v9 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    v7 = v9;
  }
  else
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_62_cold_1((uint64_t)v6, v7);
  }

}

uint64_t __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "beginJourney");
}

- (void)_registerForNSPDarwinNotification
{
  NSObject *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed");
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Registering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleNSPDarwinNotification, CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed"), 0, (CFNotificationSuspensionBehavior)1028);
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "Registering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_handleNSPDarwinNotification, CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"), 0, (CFNotificationSuspensionBehavior)1028);
}

- (void)_unregisterForNSPDarwinNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed");
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "unregistering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.networkserviceproxy.privacy-proxy-configuration-changed"), 0);
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed");
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "unregistering for darwin notification %@", (uint8_t *)&v6, 0xCu);
  }

  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.networkserviceproxy.privacy-proxy-service-status-changed"), 0);
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

- (ICQInternetPrivacyViewController)internetPrivacyController
{
  return self->_internetPrivacyController;
}

- (void)setInternetPrivacyController:(id)a3
{
  objc_storeStrong((id *)&self->_internetPrivacyController, a3);
}

- (ICQInternetPrivacyViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_viewModel, a3);
}

- (NSString)statusString
{
  return self->_statusString;
}

- (void)setStatusString:(id)a3
{
  objc_storeStrong((id *)&self->_statusString, a3);
}

- (ICQUpgradeFlowManager)flowManager
{
  return self->_flowManager;
}

- (void)setFlowManager:(id)a3
{
  objc_storeStrong((id *)&self->_flowManager, a3);
}

- (unint64_t)internetPrivacyAvailability
{
  return self->_internetPrivacyAvailability;
}

- (void)setInternetPrivacyAvailability:(unint64_t)a3
{
  self->_internetPrivacyAvailability = a3;
}

- (PSSpecifier)internetPrivacySpecifier
{
  return self->_internetPrivacySpecifier;
}

- (void)setInternetPrivacySpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_internetPrivacySpecifier, a3);
}

- (BOOL)hasProfileRestriction
{
  return self->_hasProfileRestriction;
}

- (void)setHasProfileRestriction:(BOOL)a3
{
  self->_hasProfileRestriction = a3;
}

- (NSObject)observationToken
{
  return self->_observationToken;
}

- (void)setObservationToken:(id)a3
{
  objc_storeStrong((id *)&self->_observationToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationToken, 0);
  objc_storeStrong((id *)&self->_internetPrivacySpecifier, 0);
  objc_storeStrong((id *)&self->_flowManager, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_internetPrivacyController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Private relay specifier requested for non-primary account but it's not yet supported.", a5, a6, a7, a8, 0);
}

void __76__ICQInternetPrivacySpecifierProvider__internetPrivacySpecifierLoadJourney___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "No flow manager present", a5, a6, a7, a8, 0);
}

void __62__ICQInternetPrivacySpecifierProvider__handleQuotaJourneyURL___block_invoke_62_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Failed to lauch journey: %@", (uint8_t *)&v2, 0xCu);
}

@end
