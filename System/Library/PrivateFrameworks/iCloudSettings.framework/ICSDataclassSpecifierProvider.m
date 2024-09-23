@implementation ICSDataclassSpecifierProvider

- (ICSDataclassSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4 homeViewModel:(id)a5 manageStorageAppsListViewModel:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICSDataclassSpecifierProvider *v15;
  ICSDataclassSpecifierProvider *v16;
  uint64_t v17;
  NSSet *mainViewDataclasses;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *accountWorkQueue;
  void *v22;
  void *v23;
  _TtC14iCloudSettings30ManageStorageAppsListViewModel *manageStorageAppsListViewModel;
  void *v25;
  id v26;
  _QWORD v28[4];
  id v29;
  id location;
  objc_super v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v31.receiver = self;
  v31.super_class = (Class)ICSDataclassSpecifierProvider;
  v15 = -[ICSDataclassSpecifierProvider init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_accountManager, a3);
    objc_storeWeak((id *)&v16->_listController, v12);
    objc_storeStrong((id *)&v16->_homeViewModel, a5);
    objc_storeStrong((id *)&v16->_manageStorageAppsListViewModel, a6);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB3E78], *MEMORY[0x24BDB3EC8], *MEMORY[0x24BDB3E38], *MEMORY[0x24BDB3E30], *MEMORY[0x24BDB3DA8], 0);
    v17 = objc_claimAutoreleasedReturnValue();
    mainViewDataclasses = v16->_mainViewDataclasses;
    v16->_mainViewDataclasses = (NSSet *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.appleaccountsettings.accountwork", v19);
    accountWorkQueue = v16->_accountWorkQueue;
    v16->_accountWorkQueue = (OS_dispatch_queue *)v20;

    objc_initWeak(&location, v16);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[ManageStorageAppsListViewModel ViewModelDidUpdateNotificationName](_TtC14iCloudSettings30ManageStorageAppsListViewModel, "ViewModelDidUpdateNotificationName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    manageStorageAppsListViewModel = v16->_manageStorageAppsListViewModel;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __111__ICSDataclassSpecifierProvider_initWithAccountManager_presenter_homeViewModel_manageStorageAppsListViewModel___block_invoke;
    v28[3] = &unk_251C60FA8;
    objc_copyWeak(&v29, &location);
    v26 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v23, manageStorageAppsListViewModel, v25, v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }

  return v16;
}

void __111__ICSDataclassSpecifierProvider_initWithAccountManager_presenter_homeViewModel_manageStorageAppsListViewModel___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    +[ManageStorageAppsListViewModel ViewModelDidUpdateNotificationName](_TtC14iCloudSettings30ManageStorageAppsListViewModel, "ViewModelDidUpdateNotificationName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "%@ notification received. Reloading specifiers.", (uint8_t *)&v5, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiers");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSDataclassSpecifierProvider;
  -[ICSDataclassSpecifierProvider dealloc](&v4, sel_dealloc);
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

- (void)resetAccount
{
  -[AIDAAccountManager setAccounts:](self->_accountManager, "setAccounts:", 0);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[ICSDataclassSpecifierProvider _initiateServiceAuthHandler](self, "_initiateServiceAuthHandler");
  -[ICSDataclassSpecifierProvider _initiateSpecifiers](self, "_initiateSpecifiers");
}

- (void)_initiateServiceAuthHandler
{
  ICSServiceAuthHandler *v3;
  AIDAAccountManager *accountManager;
  ICSServiceAuthHandler *v5;
  ICSServiceAuthHandler *serviceAuthHandler;
  id WeakRetained;

  if (!self->_serviceAuthHandler)
  {
    v3 = [ICSServiceAuthHandler alloc];
    accountManager = self->_accountManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v5 = -[ICSServiceAuthHandler initWithAccountManager:presenter:](v3, "initWithAccountManager:presenter:", accountManager, WeakRetained);
    serviceAuthHandler = self->_serviceAuthHandler;
    self->_serviceAuthHandler = v5;

  }
}

- (void)_initiateSpecifiers
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24B4C1000, log, OS_LOG_TYPE_DEBUG, "Calendar settings main feature not enabled", v1, 2u);
}

- (void)cleanupDataclassSpecifiers
{
  NSArray *specifiers;
  NSArray *appGroupSpecifiers;
  NSArray *appSpecifiers;

  specifiers = self->_specifiers;
  self->_specifiers = 0;

  appGroupSpecifiers = self->_appGroupSpecifiers;
  self->_appGroupSpecifiers = 0;

  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;

  -[ICSKeychainSpecifierProvider setSpecifiers:](self->_keychainSpecifierProvider, "setSpecifiers:", 0);
  -[AAUISpecifierProvider setSpecifiers:](self->_photoStreamSpecifierProvider, "setSpecifiers:", 0);
  -[AAUISpecifierProvider setSpecifiers:](self->_mailSpecifierProvider, "setSpecifiers:", 0);
  -[AAUISpecifierProvider setSpecifiers:](self->_hmeSpecifierProvider, "setSpecifiers:", 0);
  -[ICSUbiquitySpecifierProvider setSpecifiers:](self->_ubiquitySpecifierProvider, "setSpecifiers:", 0);
  -[AAUISpecifierProvider setSpecifiers:](self->_gpSpecifierProvider, "setSpecifiers:", 0);
  -[AAUISpecifierProvider setSpecifiers:](self->_healthDataSpecifierProvider, "setSpecifiers:", 0);
  -[AAUISpecifierProvider setSpecifiers:](self->_otherSpecifierProvider, "setSpecifiers:", 0);
  if (_os_feature_enabled_impl())
    -[AAUISpecifierProvider setSpecifiers:](self->_calendarSpecifierProvider, "setSpecifiers:", 0);
}

- (void)reloadSpecifiers
{
  id WeakRetained;
  id v4;

  v4 = (id)-[NSArray copy](self->_specifiers, "copy");
  -[ICSDataclassSpecifierProvider cleanupDataclassSpecifiers](self, "cleanupDataclassSpecifiers");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v4, 0);

}

- (void)reloadSpecifier:(id)a3 animated:(BOOL)a4
{
  id v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  id v9;

  v5 = a3;
  if (objc_msgSend(v5, "cellType") == 6)
  {
    objc_msgSend(v5, "removePropertyForKey:", *MEMORY[0x24BE75DA0]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v9 = WeakRetained;
    v7 = v5;
    v8 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v9 = WeakRetained;
    v7 = v5;
    v8 = 1;
  }
  objc_msgSend(WeakRetained, "reloadSpecifier:animated:", v7, v8);

}

- (BOOL)_showSpecifierForDataclass:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (void *)MEMORY[0x24BE04948];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierProvider account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "shouldShowDataclass:forAccount:", v5, v7);

  return v8;
}

- (id)_buildPhotosSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if ((-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x24BDB3E40])|| -[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x24BDB3EA8]))&& (-[AAUISpecifierProvider specifiers](self->_photoStreamSpecifierProvider, "specifiers"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v4 = objc_msgSend(v3, "count"), v3, v4))
  {
    -[AAUISpecifierProvider specifiers](self->_photoStreamSpecifierProvider, "specifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v6, *MEMORY[0x24BDB3E78]);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_buildGPSpecifier
{
  void *v2;
  void *v3;

  -[AAUISpecifierProvider specifiers](self->_gpSpecifierProvider, "specifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_buildHealthDataSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[AAUISpecifierProvider specifiers](self->_healthDataSpecifierProvider, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[AAUISpecifierProvider specifiers](self->_healthDataSpecifierProvider, "specifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_buildUbiquitySpecifier
{
  void *v3;
  BOOL v4;
  id v5;

  -[ICSUbiquitySpecifierProvider ubiquityLinklistSpecifier](self->_ubiquitySpecifierProvider, "ubiquityLinklistSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v3, *MEMORY[0x24BDB3EC8]);
  if (-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x24BDB4668]))
  {
    v4 = v3 == 0;
  }
  else
  {
    v4 = 1;
  }
  if (v4)
    v5 = 0;
  else
    v5 = v3;

  return v5;
}

- (id)_buildEmailSpecifier
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;

  v3 = *MEMORY[0x24BDB3E38];
  if (-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x24BDB3E38]))
  {
    -[AAUISpecifierProvider specifiers](self->_mailSpecifierProvider, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      if (objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled"))
      {
        -[ICSDataclassSpecifierProvider account](self, "account");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "aa_isAccountClass:", *MEMORY[0x24BE047F0]))
        {

        }
        else
        {
          -[ICSDataclassSpecifierProvider account](self, "account");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "aa_isManagedAppleID");

          if (!v9)
          {
            -[ICSDataclassSpecifierProvider specifierForDataclass:](self, "specifierForDataclass:", v3);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_9;
          }
        }
      }
      -[AAUISpecifierProvider specifiers](self->_mailSpecifierProvider, "specifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
      -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v7, v3);
      return v7;
    }
  }
  v7 = 0;
  return v7;
}

- (id)_buildKeychainSpecifier
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = *MEMORY[0x24BDB3E30];
  if (-[ICSDataclassSpecifierProvider _showSpecifierForDataclass:](self, "_showSpecifierForDataclass:", *MEMORY[0x24BDB3E30])&& (-[ICSKeychainSpecifierProvider specifiers](self->_keychainSpecifierProvider, "specifiers"), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "count"), v4, v5))
  {
    -[ICSKeychainSpecifierProvider specifiers](self->_keychainSpecifierProvider, "specifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v7, v3);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_specifierForMessagesDataclass
{
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  if (_os_feature_enabled_impl() && _os_feature_enabled_impl())
  {
    v10 = 0;
    v11 = &v10;
    v12 = 0x2050000000;
    v3 = (void *)getCKCloudSettingsViewControllerClass_softClass;
    v13 = getCKCloudSettingsViewControllerClass_softClass;
    if (!getCKCloudSettingsViewControllerClass_softClass)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __getCKCloudSettingsViewControllerClass_block_invoke;
      v9[3] = &unk_251C61100;
      v9[4] = &v10;
      __getCKCloudSettingsViewControllerClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = *MEMORY[0x24BDB3E48];
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v10, 8);
    -[ICSDataclassSpecifierProvider _specifierForDataclass:withCustomDetailClass:](self, "_specifierForDataclass:withCustomDetailClass:", v4, v5);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = *MEMORY[0x24BDB3E48];
    -[ICSDataclassSpecifierProvider _specifierForDataclass:](self, "_specifierForDataclass:", *MEMORY[0x24BDB3E48]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v6, v4);
  return v7;
}

- (BOOL)isRegularWatchPairing
{
  if (isRegularWatchPairing_onceToken != -1)
    dispatch_once(&isRegularWatchPairing_onceToken, &__block_literal_global_3);
  return 0;
}

- (id)_buildAppGroupHeaderSpecifiers
{
  void *v3;
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
  void *v17;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("APP_GROUP_HEADER_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("AppsUsingiCloudHeader"), self, 0, 0, 0, -1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("APPS_USING_ICLOUD_HEADER_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75D50]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DATACLASS_LIST_INFO_TEXT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v9, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75D28]);

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SAVED_TO_ICLOUD_LEARN_MORE_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, CFSTR("AAUIDataclassAttributedLink"));

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, CFSTR("AAUIDataclassAttributedLinkText"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", &unk_251C83CE8, *MEMORY[0x24BE75860]);
  v15 = (void *)MEMORY[0x24BEBD640];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageNamed:inBundle:", CFSTR("AppsUsingiCloud"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v3, "addObject:", v5);
  return v3;
}

- (id)_buildAppSpecifiers
{
  NSArray *appSpecifiers;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  char isKindOfClass;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  NSArray *v56;
  NSArray *v57;

  appSpecifiers = self->_appSpecifiers;
  if (appSpecifiers)
    return appSpecifiers;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ICSDataclassSpecifierProvider _specifiersForProvisionedDataclasses](self, "_specifiersForProvisionedDataclasses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("APPS_GROUP_0"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      -[ICSDataclassSpecifierProvider _buildAppGroupHeaderSpecifiers](self, "_buildAppGroupHeaderSpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v9);
    }
    else
    {
      -[ICSDataclassSpecifierProvider account](self, "account");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x24BE047F0]) & 1) != 0)
      {
        -[ICSDataclassSpecifierProvider account](self, "account");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "aa_isManagedAppleID");

        if (!v12)
          goto LABEL_11;
      }
      else
      {

      }
      v13 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SYNC_WITH_ICLOUD_GROUP_NAME"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "groupSpecifierWithID:name:", CFSTR("SYNC WITH ICLOUD"), v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v15;
    }

LABEL_11:
    objc_msgSend(v4, "addObject:", v6);

  }
  if (-[ICSDataclassSpecifierProvider isRegularWatchPairing](self, "isRegularWatchPairing"))
  {
    v16 = 0;
  }
  else
  {
    -[ICSDataclassSpecifierProvider _buildPhotosSpecifier](self, "_buildPhotosSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v4, "addObject:", v16);
  }
  if (self->_ubiquitySpecifierProvider)
  {
    -[ICSDataclassSpecifierProvider _buildUbiquitySpecifier](self, "_buildUbiquitySpecifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      objc_msgSend(v4, "addObject:", v17);

  }
  -[ICSDataclassSpecifierProvider _buildEmailSpecifier](self, "_buildEmailSpecifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    objc_msgSend(v4, "addObject:", v18);
  if (!-[ICSDataclassSpecifierProvider isRegularWatchPairing](self, "isRegularWatchPairing"))
  {
    -[ICSDataclassSpecifierProvider _buildKeychainSpecifier](self, "_buildKeychainSpecifier");
    v19 = objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "addObject:", v19);
      v16 = (void *)v19;
    }
    else
    {
      v16 = 0;
    }
  }
  v20 = *MEMORY[0x24BDB3E68];
  objc_msgSend(v5, "specifierForID:", *MEMORY[0x24BDB3E68]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v21, v20);
    objc_msgSend(v4, "addObject:", v21);
  }
  if (!-[ICSDataclassSpecifierProvider isRegularWatchPairing](self, "isRegularWatchPairing"))
  {
    v22 = *MEMORY[0x24BDB3E48];
    objc_msgSend(v5, "specifierForID:", *MEMORY[0x24BDB3E48]);
    v23 = objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v23, v22);
      objc_msgSend(v4, "addObject:", v23);
      v21 = (void *)v23;
    }
    else
    {
      v21 = 0;
    }
  }
  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x24BDB3E18];
  -[ICSDataclassSpecifierProvider account](self, "account");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "shouldShowDataclass:forAccount:", v25, v26);

  if (!v27)
    goto LABEL_39;
  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "appIsNeitherInstalledOrPlaceholder:", v25);

  if (!v29)
  {
    -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", v25, v5);
    v31 = objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      objc_msgSend(v4, "addObject:", v31);
      v21 = (void *)v31;
      goto LABEL_39;
    }
LABEL_38:
    v21 = 0;
    goto LABEL_39;
  }
  -[ICSDataclassSpecifierProvider _buildHealthDataSpecifier](self, "_buildHealthDataSpecifier");
  v30 = objc_claimAutoreleasedReturnValue();

  if (!v30)
    goto LABEL_38;
  objc_msgSend(v4, "addObject:", v30);
  -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v30, v25);
  v21 = (void *)v30;
LABEL_39:
  if (!-[ICSDataclassSpecifierProvider isRegularWatchPairing](self, "isRegularWatchPairing"))
  {
    if (_os_feature_enabled_impl()
      && (-[ICSDataclassSpecifierProvider account](self, "account"),
          v32 = (void *)objc_claimAutoreleasedReturnValue(),
          v33 = objc_msgSend(v32, "aa_isAccountClass:", *MEMORY[0x24BE047F0]),
          v32,
          v33))
    {
      -[AAUISpecifierProvider specifiers](self->_calendarSpecifierProvider, "specifiers");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "count");

      if (v35)
      {
        -[AAUISpecifierProvider specifiers](self->_calendarSpecifierProvider, "specifiers");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObjectsFromArray:", v36);

        -[AAUISpecifierProvider specifiers](self->_calendarSpecifierProvider, "specifiers");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "count");

        if (v38)
        {
          -[AAUISpecifierProvider specifiers](self->_calendarSpecifierProvider, "specifiers");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = (void *)objc_claimAutoreleasedReturnValue();

          -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v40, *MEMORY[0x24BDB3DD8]);
        }
      }
      v41 = v21;
    }
    else
    {
      -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3DD8], v5);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      if (v41)
      {
        if (_os_feature_enabled_impl())
          objc_msgSend(v41, "setName:", CFSTR("iCloud Calendar"));
        objc_msgSend(v4, "addObject:", v41);
      }
    }
    -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3DE8], v5);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (v42)
      objc_msgSend(v4, "addObject:", v42);
    -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E88], v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v4, "addObject:", v21);
  }
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3DB0], v5);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    objc_msgSend(v4, "addObject:", v43);
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E60], v5);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    objc_msgSend(v4, "addObject:", v44);
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3EC0], v5);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    objc_msgSend(v4, "addObject:", v45);
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E20], v5);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
    objc_msgSend(v4, "addObject:", v46);
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E08], v5);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    objc_msgSend(v4, "addObject:", v47);
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3EB0], v5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    objc_msgSend(v4, "addObject:", v48);
  v49 = *MEMORY[0x24BE06090];
  -[ICSDataclassSpecifierProvider specifierForServiceType:](self, "specifierForServiceType:", *MEMORY[0x24BE06090]);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    -[ICSDataclassSpecifierProvider _decorateServiceSpecifier:forService:](self, "_decorateServiceSpecifier:forService:", v50, v49);
    objc_msgSend(v4, "addObject:", v50);
  }
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3EB8], v5);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51)
    objc_msgSend(v4, "addObject:", v51);
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E10], v5);
  v52 = (void *)objc_claimAutoreleasedReturnValue();

  if (v52)
    objc_msgSend(v4, "addObject:", v52);
  if (objc_msgSend(MEMORY[0x24BE049F8], "isMomentsDataclassEnabled"))
  {
    -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E50], v5);
    v53 = objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v4, "addObject:", v53);
      v52 = (void *)v53;
    }
    else
    {
      v52 = 0;
    }
  }
  -[ICSDataclassSpecifierProvider _specifierForDataclass:fromProvisionedSpecifiers:](self, "_specifierForDataclass:fromProvisionedSpecifiers:", *MEMORY[0x24BDB3E70], v5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if (v54)
    objc_msgSend(v4, "addObject:", v54);
  -[ICSDataclassSpecifierProvider _buildGPSpecifier](self, "_buildGPSpecifier");
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  if (v55)
    objc_msgSend(v4, "addObject:", v55);
  v56 = (NSArray *)objc_msgSend(v4, "copy");
  v57 = self->_appSpecifiers;
  self->_appSpecifiers = v56;

  appSpecifiers = self->_appSpecifiers;
  return appSpecifiers;
}

- (id)_specifierForDataclass:(id)a3 fromProvisionedSpecifiers:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a4, "specifierForID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[ICSDataclassSpecifierProvider _decorateDataclassSpecifier:forDataclass:](self, "_decorateDataclassSpecifier:forDataclass:", v7, v6);
    v8 = v7;
  }

  return v7;
}

- (void)_decorateDataclassSpecifier:(id)a3 forDataclass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[ICSDataclassSpecifierProvider manageStorageAppsListViewModel](self, "manageStorageAppsListViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expandedSubTitleForDataclass:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3E78]) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3DE0]) & 1) == 0
    && (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3E68]) & 1) == 0
    && !objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDB3E30]))
  {
LABEL_9:
    v10 = 0;
    v16 = 0;
    if (!v8)
      goto LABEL_12;
    goto LABEL_10;
  }
  -[ICSDataclassSpecifierProvider homeViewModel](self, "homeViewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expandedSubTitleForDataclass:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_ON"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isEqualToString:", v12))
  {

LABEL_8:
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SUBTITLE_OFF"), &stru_251C6B070, CFSTR("Localizable-iCloud"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "isEqualToString:", v14);

  if (v15)
    goto LABEL_8;
  if (v8 && v10)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ • %@"), v10, v8);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v8)
  {
LABEL_10:
    v17 = v8;
LABEL_11:
    v16 = v17;
    goto LABEL_12;
  }
  if (v10)
  {
    v17 = v10;
    v10 = v17;
    goto LABEL_11;
  }
  v16 = 0;
LABEL_12:
  objc_msgSend(v18, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  if (v16)
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75D28]);

}

- (void)_decorateLiverpoolSpecifier:(id)a3 forBundleId:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ICSDataclassSpecifierProvider manageStorageAppsListViewModel](self, "manageStorageAppsListViewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "expandedSubTitleForLiverpoolBundleId:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75D28]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);

}

- (void)_decorateServiceSpecifier:(id)a3 forService:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  -[ICSDataclassSpecifierProvider homeViewModel](self, "homeViewModel");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "expandedSubTitleForService:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75D28]);
}

- (NSArray)specifiers
{
  NSArray *specifiers;
  NSArray *v4;
  NSArray *v5;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    -[ICSDataclassSpecifierProvider _specifiersForAppListVC](self, "_specifiersForAppListVC");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_specifiers;
    self->_specifiers = v4;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_specifiersForAppListVC
{
  NSArray *appGroupSpecifiers;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  NSArray *v25;
  NSArray *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  appGroupSpecifiers = self->_appGroupSpecifiers;
  if (!appGroupSpecifiers)
  {
    v4 = (void *)objc_opt_new();
    if (!self->_appSpecifiers)
    {
      -[ICSDataclassSpecifierProvider _buildAppSpecifiers](self, "_buildAppSpecifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v5);

    }
    -[ICSUbiquitySpecifierProvider specifiers](self->_ubiquitySpecifierProvider, "specifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      -[ICSUbiquitySpecifierProvider specifiers](self->_ubiquitySpecifierProvider, "specifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __56__ICSDataclassSpecifierProvider__specifiersForAppListVC__block_invoke;
      v32[3] = &unk_251C60DA0;
      v32[4] = self;
      objc_msgSend(v8, "enumerateObjectsUsingBlock:", v32);

      -[ICSUbiquitySpecifierProvider specifiers](self->_ubiquitySpecifierProvider, "specifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v9);

    }
    -[ICSDataclassSpecifierProvider account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

    if (v11)
    {
      -[AAUISpecifierProvider specifiers](self->_hmeSpecifierProvider, "specifiers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        objc_msgSend(v4, "addObjectsFromArray:", v12);
      }

    }
    -[AAUISpecifierProvider specifiers](self->_otherSpecifierProvider, "specifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      -[AAUISpecifierProvider specifiers](self->_otherSpecifierProvider, "specifiers");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v16);

    }
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v17 = v4;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v29;
      v21 = *MEMORY[0x24BE75AC0];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v29 != v20)
            objc_enumerationMutation(v17);
          v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v23, "objectForKeyedSubscript:", v21, (_QWORD)v28);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICSDataclassSpecifierProvider _performUpdateIfNeededOnSpecifier:forDataclass:](self, "_performUpdateIfNeededOnSpecifier:forDataclass:", v23, v24);

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v19);
    }

    v25 = (NSArray *)objc_msgSend(v17, "copy");
    v26 = self->_appGroupSpecifiers;
    self->_appGroupSpecifiers = v25;

    appGroupSpecifiers = self->_appGroupSpecifiers;
  }
  return appGroupSpecifiers;
}

void __56__ICSDataclassSpecifierProvider__specifiersForAppListVC__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_decorateLiverpoolSpecifier:forBundleId:", v3, v4);

}

- (id)_specifiersForProvisionedDataclasses
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v17 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ICSDataclassSpecifierProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "provisionedDataclasses");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICSDataclassSpecifierProvider account](self, "account");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "shouldShowDataclass:forAccount:", v10, v12);

        if (v13)
        {
          -[ICSDataclassSpecifierProvider specifierForDataclass:](self, "specifierForDataclass:", v10);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v17, "addObject:", v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    }
    while (v7);
  }

  LogSubsystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v17;
    _os_log_impl(&dword_24B4C1000, v15, OS_LOG_TYPE_DEFAULT, "Returning specifiers: %@", buf, 0xCu);
  }

  return v17;
}

- (id)specifierForDataclass:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *healthDataSpecifierProvider;
  void *WeakRetained;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3E40]) & 1) == 0
    && !objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3EA8]))
  {
    v11 = *MEMORY[0x24BDB3E18];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3E18]))
    {
      objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "appIsNeitherInstalledOrPlaceholder:", v11);

      if (v13)
      {
        -[AAUISpecifierProvider specifiers](self->_healthDataSpecifierProvider, "specifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          healthDataSpecifierProvider = self->_healthDataSpecifierProvider;
          goto LABEL_5;
        }
LABEL_14:
        v10 = 0;
        goto LABEL_18;
      }
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3E30]))
      {
        -[ICSKeychainSpecifierProvider specifiers](self->_keychainSpecifierProvider, "specifiers");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          healthDataSpecifierProvider = self->_keychainSpecifierProvider;
          goto LABEL_5;
        }
        goto LABEL_14;
      }
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3E68]))
      {
        if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDB3E48]))
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
          objc_msgSend(WeakRetained, "specifierForDataclass:", v4);
          v9 = objc_claimAutoreleasedReturnValue();
          goto LABEL_6;
        }
        -[ICSDataclassSpecifierProvider _specifierForMessagesDataclass](self, "_specifierForMessagesDataclass");
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_17:
        v10 = (void *)v18;
        goto LABEL_18;
      }
    }
    -[ICSDataclassSpecifierProvider _specifierForDataclass:](self, "_specifierForDataclass:", v4);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  -[AAUISpecifierProvider specifiers](self->_photoStreamSpecifierProvider, "specifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    goto LABEL_14;
  healthDataSpecifierProvider = self->_photoStreamSpecifierProvider;
LABEL_5:
  objc_msgSend(healthDataSpecifierProvider, "specifiers");
  WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v10 = (void *)v9;

LABEL_18:
  return v10;
}

- (void)_performUpdateIfNeededOnSpecifier:(id)a3 forDataclass:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSString *v14;
  _BOOL4 IsAccessibilityCategory;
  double v16;
  void *v17;
  id v18;

  v18 = a3;
  v6 = a4;
  -[ICSDataclassSpecifierProvider account](self, "account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "aa_serverDisabledDataclass:", v6);

  if (v8)
  {
    objc_msgSend(v18, "cellType");
    objc_msgSend(v18, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    objc_msgSend(v18, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MANAGED_BY_APPLE_ID"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProperty:forKey:", v10, *MEMORY[0x24BE75D28]);

  }
  objc_msgSend(v18, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("AppsUsingiCloudHeader"));

  if ((v12 & 1) == 0)
  {
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v14);
    v16 = *MEMORY[0x24BEBE770];
    if (!IsAccessibilityCategory)
      v16 = 60.0;
    objc_msgSend(v13, "numberWithDouble:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setProperty:forKey:", v17, *MEMORY[0x24BE75D10]);

  }
}

- (id)_specifierForDataclass:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ICSDataclassSpecifierProvider _specifierForDataclass:withCustomDetailClass:](self, "_specifierForDataclass:withCustomDetailClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_specifierForDataclass:(id)a3 withCustomDetailClass:(Class)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BE75590];
  v7 = a3;
  -[ICSDataclassSpecifierProvider account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v7, v8, self, 0, sel__dataclassState_, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v9, "setObject:forKeyedSubscript:", self->_accountManager, CFSTR("icloudAccountManager"));
  return v9;
}

- (id)_dataclassState:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:dataclassSwitchStateForSpecifier:", self, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((_DWORD)v5)
    v10 = CFSTR("ON");
  else
    v10 = CFSTR("OFF");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)shouldShowSpecifierForServiceType:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_msgSend(MEMORY[0x24BE04958], "isMultiUserMode") & 1) != 0
    || (-[ICSDataclassSpecifierProvider account](self, "account"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "aa_isAccountClass:", *MEMORY[0x24BE047F0]),
        v5,
        !v6))
  {
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  -[ICSServiceAuthHandler serviceOwnersManager](self->_serviceAuthHandler, "serviceOwnersManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "supportedServices");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);

  if ((v9 & 1) == 0)
  {
    LogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, "Could not find a service owner for %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_8;
  }
  v10 = 1;
LABEL_9:

  return v10;
}

- (id)specifierForServiceType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (-[ICSDataclassSpecifierProvider shouldShowSpecifierForServiceType:](self, "shouldShowSpecifierForServiceType:", v4))
  {
    v5 = (void *)MEMORY[0x24BE75590];
    AALocalizedStringForServiceType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel_setValue_forServiceSpecifier_, sel_valueForServiceSpecifier_, 0, 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE06090]))
    {
      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "imageForKey:", *MEMORY[0x24BE757C8]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75AC8]);

    }
    objc_msgSend(v7, "setProperty:forKey:", v4, CFSTR("com.apple.appleaccount.ServiceType"));
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setValue:(id)a3 forServiceSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  int v13;
  ICSServiceAuthHandler *serviceAuthHandler;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, char);
  void *v18;
  ICSDataclassSpecifierProvider *v19;
  id v20;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_msgSend(v7, "propertyForKey:", CFSTR("com.apple.appleaccount.ServiceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "activeSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(v11, "startSpinnerInSpecifier:", v7);

    v15 = MEMORY[0x24BDAC760];
    v16 = 3221225472;
    v17 = __62__ICSDataclassSpecifierProvider_setValue_forServiceSpecifier___block_invoke;
    v18 = &unk_251C610D8;
    v19 = self;
    v20 = v7;
    v12 = _Block_copy(&v15);
    v13 = objc_msgSend(v6, "BOOLValue", v15, v16, v17, v18, v19);
    serviceAuthHandler = self->_serviceAuthHandler;
    if (v13)
      -[ICSServiceAuthHandler signInAccountForService:completion:](serviceAuthHandler, "signInAccountForService:completion:", v8, v12);
    else
      -[ICSServiceAuthHandler signOutAccountForService:completion:](serviceAuthHandler, "signOutAccountForService:completion:", v8, v12);

  }
}

void __62__ICSDataclassSpecifierProvider_setValue_forServiceSpecifier___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained;
  id v5;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(WeakRetained, "stopSpinnerInActiveSpecifier");

  if ((a2 & 1) == 0)
  {
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
    objc_msgSend(v5, "reloadSpecifier:", *(_QWORD *)(a1 + 40));

  }
}

- (id)valueForServiceSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "propertyForKey:", CFSTR("com.apple.appleaccount.ServiceType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSServiceAuthHandler serviceOwnersManager](self->_serviceAuthHandler, "serviceOwnersManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountForService:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICSServiceAuthHandler accountMatchesPrimaryAccount:service:](self->_serviceAuthHandler, "accountMatchesPrimaryAccount:service:", v6, v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v7;
}

- (id)_loadCalendarSpecifierProvider
{
  void *v3;
  objc_class *v4;
  id v5;
  AIDAAccountManager *accountManager;
  id WeakRetained;
  void *v8;
  id v9;
  NSObject *v10;

  objc_msgSend(MEMORY[0x24BDD1488], "ics_loadBundle:atPath:", CFSTR("icloudCalendarSettings.bundle"), CFSTR("System/Library/PreferenceBundles/AccountSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = NSClassFromString(CFSTR("CalendarSettingsSpecifierProvider"));
  if (-[objc_class conformsToProtocol:](v4, "conformsToProtocol:", &unk_2579C6E98))
  {
    v5 = [v4 alloc];
    accountManager = self->_accountManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v8 = (void *)objc_msgSend(v5, "initWithAccountManager:presenter:", accountManager, WeakRetained);

    v9 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "setDelegate:", v9);

  }
  else
  {
    LogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICSDataclassSpecifierProvider _loadCalendarSpecifierProvider].cold.1((uint64_t)self, (uint64_t)v3, v10);

    v8 = 0;
  }

  return v8;
}

- (id)getICloudMailSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  -[ICSDataclassSpecifierProvider loadBundle:atPath:](self, "loadBundle:atPath:", CFSTR("icloudMailSettings.bundle"), CFSTR("System/Library/PreferenceBundles/AccountSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassSpecifierProvider _loadSpecifierProviderWithClassName:inBundle:](self, "_loadSpecifierProviderWithClassName:inBundle:", CFSTR("MailSettingsSpecifierProvider"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ICSDataclassSpecifierProvider getICloudMailSpecifier].cold.1(v7);

  }
  return v5;
}

- (id)loadBundle:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  MEMORY[0x24BD22FA0]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringByAppendingPathComponent:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isLoaded") & 1) == 0)
  {
    LogSubsystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v5;
      _os_log_impl(&dword_24B4C1000, v11, OS_LOG_TYPE_DEFAULT, "%@ not loaded. Loading...", (uint8_t *)&v13, 0xCu);
    }

    objc_msgSend(v10, "load");
  }

  return v10;
}

- (id)_loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  NSString *v6;
  id v7;
  objc_class *v8;
  id v9;
  AIDAAccountManager *accountManager;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  int v15;
  ICSDataclassSpecifierProvider *v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (NSString *)a3;
  v7 = a4;
  v8 = NSClassFromString(v6);
  if (-[objc_class conformsToProtocol:](v8, "conformsToProtocol:", &unk_2579C6E98))
  {
    v9 = [v8 alloc];
    accountManager = self->_accountManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    v12 = (void *)objc_msgSend(v9, "initWithAccountManager:presenter:", accountManager, WeakRetained);

  }
  else
  {
    LogSubsystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543874;
      v16 = self;
      v17 = 2114;
      v18 = v6;
      v19 = 2114;
      v20 = v7;
      _os_log_error_impl(&dword_24B4C1000, v13, OS_LOG_TYPE_ERROR, "%{public}@ Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v15, 0x20u);
    }

    v12 = 0;
  }

  return v12;
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (ICSUbiquitySpecifierProvider)ubiquitySpecifierProvider
{
  return self->_ubiquitySpecifierProvider;
}

- (_TtC14iCloudSettings19iCloudHomeViewModel)homeViewModel
{
  return self->_homeViewModel;
}

- (void)setHomeViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_homeViewModel, a3);
}

- (_TtC14iCloudSettings30ManageStorageAppsListViewModel)manageStorageAppsListViewModel
{
  return self->_manageStorageAppsListViewModel;
}

- (void)setManageStorageAppsListViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_manageStorageAppsListViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manageStorageAppsListViewModel, 0);
  objc_storeStrong((id *)&self->_homeViewModel, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mainViewDataclasses, 0);
  objc_storeStrong((id *)&self->_serviceAuthHandler, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
  objc_storeStrong((id *)&self->_appGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_gpSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_calendarSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_otherSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_hmeSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_keychainSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_mailSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_healthDataSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_photoStreamSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_accountWorkQueue, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_loadCalendarSpecifierProvider
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
}

- (void)getICloudMailSpecifier
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "AAUIMailSpecifierProvider not found", v1, 2u);
}

@end
