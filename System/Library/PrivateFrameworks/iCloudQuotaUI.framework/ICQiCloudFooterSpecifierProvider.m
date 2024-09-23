@implementation ICQiCloudFooterSpecifierProvider

- (ICQiCloudFooterSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICQiCloudFooterSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (ICQiCloudFooterSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICQiCloudFooterSpecifierProvider *v9;
  ICQiCloudFooterSpecifierProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICQiCloudFooterSpecifierProvider;
  v9 = -[ICQiCloudFooterSpecifierProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
  }

  return v10;
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

- (void)dealloc
{
  PSSpecifier *activeSpecifier;
  objc_super v4;

  -[ICQPreferencesRemoteUIDelegate cleanupLoader](self->_ruiDelegate, "cleanupLoader");
  -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_ruiDelegate, "setDelegate:", 0);
  activeSpecifier = self->_activeSpecifier;
  self->_activeSpecifier = 0;

  v4.receiver = self;
  v4.super_class = (Class)ICQiCloudFooterSpecifierProvider;
  -[ICQiCloudFooterSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (NSArray)specifiers
{
  void *v3;
  char v4;
  NSArray *specifiers;
  id v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  -[ICQiCloudFooterSpecifierProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

  if ((v4 & 1) != 0)
  {
    specifiers = self->_specifiers;
    if (!specifiers)
    {
      v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v7);

      -[ICQiCloudFooterSpecifierProvider _buildSubscriptionSpecifiers](self, "_buildSubscriptionSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v8);

      v9 = (NSArray *)objc_msgSend(v6, "copy");
      v10 = self->_specifiers;
      self->_specifiers = v9;

      specifiers = self->_specifiers;
    }
    v11 = specifiers;
  }
  else
  {
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICQiCloudFooterSpecifierProvider specifiers].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    v11 = 0;
  }
  return v11;
}

- (id)_buildSubscriptionSpecifiers
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  ICQCloudStorageSummary *v7;
  ICQCloudStorageSummary *storageSummary;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  int v28;
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
  void *v40;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[16];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQiCloudFooterSpecifierProvider account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAccount:", v5);

  objc_msgSend(v6, "cachedStorageSummary");
  v7 = (ICQCloudStorageSummary *)objc_claimAutoreleasedReturnValue();
  storageSummary = self->_storageSummary;
  self->_storageSummary = v7;

  -[ICQCloudStorageSummary subscriptionInfo](self->_storageSummary, "subscriptionInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "specifiersInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[ICQiCloudFooterSpecifierProvider account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "aa_isManagedAppleID");

    if (v12)
    {
      _ICQGetLogSystem();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21F2CC000, v13, OS_LOG_TYPE_DEFAULT, "Subscription specifiers are not displayed for MAID accounts.", buf, 2u);
      }
    }
    else
    {
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      -[ICQCloudStorageSummary subscriptionInfo](self->_storageSummary, "subscriptionInfo");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "specifiersInfo");
      v13 = objc_claimAutoreleasedReturnValue();

      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
      if (v22)
      {
        v23 = v22;
        v42 = v6;
        v24 = *(_QWORD *)v47;
        v45 = *MEMORY[0x24BE75AC0];
        v44 = *MEMORY[0x24BE75D50];
        v43 = *MEMORY[0x24BE75D28];
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v47 != v24)
              objc_enumerationMutation(v13);
            v26 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_msgSend(v26, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("ICLOUD_PLUS_INFO"));

            if (v28)
            {
              -[ICQiCloudFooterSpecifierProvider _buildiCloudPlusSpecifiers](self, "_buildiCloudPlusSpecifiers");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObjectsFromArray:", v29);
            }
            else
            {
              v30 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(v26, "title");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v31, self, 0, sel__stringForSpecifier_, 0, 2, 0);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v26, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v32, v45);

              objc_msgSend(v26, "actionURL");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v33, CFSTR("ICQUISpecifierKeyServerUIURL"));

              objc_msgSend(v26, "icqLink");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v34, CFSTR("ICQUISpecifierKeyICQLink"));

              objc_msgSend(v26, "title");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v35, v44);

              objc_msgSend(v26, "subTitle");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v36, v43);

              objc_msgSend(v26, "type");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v37, CFSTR("SPECIFIER_TYPE"));

              objc_msgSend(v26, "iconURL");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              +[_ICQUIHelperFunctions scaledImageURL:](_ICQUIHelperFunctions, "scaledImageURL:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "setObject:forKeyedSubscript:", v39, CFSTR("ICON_URL"));

              objc_msgSend(v29, "setControllerLoadAction:", sel__launchFlowForSpecifier_);
              -[ICQiCloudFooterSpecifierProvider _setupSpecifier:](self, "_setupSpecifier:", v29);
              objc_msgSend(v3, "addObject:", v29);
            }

          }
          v23 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
        }
        while (v23);
        v6 = v42;
      }
    }
  }
  else
  {
    _ICQGetLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICQiCloudFooterSpecifierProvider _buildSubscriptionSpecifiers].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  }

  v40 = (void *)objc_msgSend(v3, "copy");
  return v40;
}

- (void)_setupSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SPECIFIER_TYPE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("LINK_CELL")))
  {
    objc_msgSend(v12, "setCellType:", 13);
    objc_msgSend(v12, "setButtonAction:", sel__launchFlowForSpecifier_);
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SUBTITLE_CELL")))
  {
    objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  }
  else
  {
    objc_msgSend(v3, "isEqualToString:", CFSTR("DETAIL_LABEL_CELL"));
  }
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("STORAGE_UPGRADE")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("MANAGE_PLAN")))
    {
      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "imageForKey:", *MEMORY[0x24BE75818]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BE75AC8]);
      goto LABEL_18;
    }
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("ICLOUD_PLUS_INFO")))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("ICON_URL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v12, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
        v8 = (_QWORD *)MEMORY[0x24BE75B98];
LABEL_16:
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, *v8);
      }
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("FAMILY_USAGE")))
        goto LABEL_18;
      v9 = (void *)MEMORY[0x24BEBD640];
      v10 = (void *)MEMORY[0x24BDD1488];
      getFACircleStateControllerClass();
      objc_msgSend(v10, "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageNamed:inBundle:", CFSTR("family"), v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v8 = (_QWORD *)MEMORY[0x24BE75AC8];
        goto LABEL_16;
      }
    }

    goto LABEL_18;
  }
  objc_msgSend(v12, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
LABEL_18:

}

- (id)_buildiCloudPlusSpecifiers
{
  ICQCloudStorageSummary *storageSummary;
  void *v4;
  char v5;
  void *v6;
  AAUISpecifierProvider *icloudPlusSpecifierProvider;
  ICQUIiCloudPlusSpecifierProvider *v8;
  AAUISpecifierProvider *v9;
  id WeakRetained;

  storageSummary = self->_storageSummary;
  if (storageSummary
    && (-[ICQCloudStorageSummary subscriptionInfo](storageSummary, "subscriptionInfo"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isiCloudPlusSubscriber"),
        v4,
        (v5 & 1) == 0))
  {
    icloudPlusSpecifierProvider = self->_icloudPlusSpecifierProvider;
    if (!icloudPlusSpecifierProvider)
    {
      v8 = -[ICQUIiCloudPlusSpecifierProvider initWithAccountManager:]([ICQUIiCloudPlusSpecifierProvider alloc], "initWithAccountManager:", self->_accountManager);
      v9 = self->_icloudPlusSpecifierProvider;
      self->_icloudPlusSpecifierProvider = (AAUISpecifierProvider *)v8;

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      -[AAUISpecifierProvider setDelegate:](self->_icloudPlusSpecifierProvider, "setDelegate:", WeakRetained);

      icloudPlusSpecifierProvider = self->_icloudPlusSpecifierProvider;
    }
    -[AAUISpecifierProvider specifiers](icloudPlusSpecifierProvider, "specifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1A8];
  }
  return v6;
}

- (id)_stringForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SPECIFIER_TYPE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("DETAIL_LABEL_CELL")))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE75D28]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_launchFlowForSpecifier:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint8_t v16[16];

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[ICQiCloudFooterSpecifierProvider _beginLoadingSpecifier:](self, "_beginLoadingSpecifier:", v4);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICQUISpecifierKeyICQLink"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "No icqLink found, falling back to old identifier/url based handling.", v16, 2u);
    }

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ICQUISpecifierKeyServerUIURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("STORAGE_UPGRADE")))
    {

      goto LABEL_8;
    }
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("MANAGE_PLAN"));

    if (v10)
    {
LABEL_8:
      if (v7)
        -[ICQiCloudFooterSpecifierProvider _launchUpgradeFlowWithURL:](self, "_launchUpgradeFlowWithURL:", v7);
      else
        -[ICQiCloudFooterSpecifierProvider _launchLegacyPurchaseFlow](self, "_launchLegacyPurchaseFlow");
      goto LABEL_21;
    }
    objc_msgSend(v4, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("FAMILY_SHARING"));

    if (v12)
    {
      -[ICQiCloudFooterSpecifierProvider _startFamilySharing](self, "_startFamilySharing");
LABEL_21:

      goto LABEL_22;
    }
    objc_msgSend(v4, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("FAMILY_USAGE"));

    if (v14)
    {
      if (v7)
      {
        -[ICQiCloudFooterSpecifierProvider _launchFamilyUsageFlowWithURL:](self, "_launchFamilyUsageFlowWithURL:", v7);
        goto LABEL_21;
      }
      _ICQGetLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICQiCloudFooterSpecifierProvider _launchFlowForSpecifier:].cold.1();
    }
    else
    {
      _ICQGetLogSystem();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[ICQiCloudFooterSpecifierProvider _launchFlowForSpecifier:].cold.2(v4);
    }

    -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
    goto LABEL_21;
  }
  -[ICQiCloudFooterSpecifierProvider _handleICQLink:forSpecifier:](self, "_handleICQLink:forSpecifier:", v5, v4);
LABEL_22:

}

- (void)_handleICQLink:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _ICQGetLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v6;
    v13 = 2112;
    v14 = v7;
    _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Handling ICQLink: %@ forSpecifier: %@", (uint8_t *)&v11, 0x16u);
  }

  switch(objc_msgSend(v6, "action"))
  {
    case 'n':
      objc_msgSend(v6, "actionURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICQiCloudFooterSpecifierProvider _launchFamilyUsageFlowWithURL:](self, "_launchFamilyUsageFlowWithURL:", v9);

      break;
    case 'o':
      -[ICQiCloudFooterSpecifierProvider _startFamilySharing](self, "_startFamilySharing");
      break;
    case 'v':
    case 'x':
    case 'y':
      -[ICQiCloudFooterSpecifierProvider _launchUpgradeFlowWithICQLink:](self, "_launchUpgradeFlowWithICQLink:", v6);
      break;
    case 'w':
      -[ICQiCloudFooterSpecifierProvider _launchLegacyPurchaseFlow](self, "_launchLegacyPurchaseFlow");
      break;
    default:
      _ICQGetLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[ICQiCloudFooterSpecifierProvider _handleICQLink:forSpecifier:].cold.1();

      -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
      break;
  }

}

- (void)_launchUpgradeFlowWithURL:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICQUpgradeFlowManager *v13;
  ICQUpgradeFlowManager *upgradeFlowManager;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_upgradeFlowManager)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQiCloudFooterSpecifierProvider _launchUpgradeFlowWithURL:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BEC72F8]);
    -[NSObject _updateRequestedServerUIURLWithURL:](v5, "_updateRequestedServerUIURLWithURL:", v4);
    v13 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", v5);
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v13;

    -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", self);
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with url: %@", (uint8_t *)&v16, 0xCu);
    }

    -[ICQUpgradeFlowManager _beginRemoteFlowWithURL:](self->_upgradeFlowManager, "_beginRemoteFlowWithURL:", v4);
  }

}

- (void)_launchUpgradeFlowWithICQLink:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ICQUpgradeFlowManager *v13;
  ICQUpgradeFlowManager *upgradeFlowManager;
  NSObject *v15;
  ICQUpgradeFlowManager *v16;
  id WeakRetained;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (self->_upgradeFlowManager)
  {
    _ICQGetLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ICQiCloudFooterSpecifierProvider _launchUpgradeFlowWithURL:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BEC72F8]);
    v13 = -[ICQUpgradeFlowManager initWithOffer:]([ICQUpgradeFlowManager alloc], "initWithOffer:", v5);
    upgradeFlowManager = self->_upgradeFlowManager;
    self->_upgradeFlowManager = v13;

    -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", self);
    _ICQGetLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v4;
      _os_log_impl(&dword_21F2CC000, v15, OS_LOG_TYPE_DEFAULT, "Launching freshmint upgrade flow with icqLink: %@", (uint8_t *)&v18, 0xCu);
    }

    v16 = self->_upgradeFlowManager;
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    -[ICQUpgradeFlowManager beginRemoteUpgradeFlowWithICQLink:presenter:](v16, "beginRemoteUpgradeFlowWithICQLink:presenter:", v4, WeakRetained);

  }
}

- (void)_startFamilySharing
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  objc_class *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  void *v17;
  id v18;
  id WeakRetained;
  void *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  uint8_t buf[8];
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  id *v28;
  id v29;
  id location;
  id *p_location;
  uint64_t v32;
  uint64_t v33;

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Launching start family sharing flow.", buf, 2u);
  }

  location = 0;
  p_location = &location;
  v32 = 0x2050000000;
  v11 = (id)getFACircleContextClass_softClass_2;
  v33 = getFACircleContextClass_softClass_2;
  v12 = MEMORY[0x24BDAC760];
  if (!getFACircleContextClass_softClass_2)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    v25 = 3221225472;
    v26 = (uint64_t)__getFACircleContextClass_block_invoke_2;
    v27 = (uint64_t (*)(uint64_t, uint64_t))&unk_24E3F3868;
    v28 = &location;
    __getFACircleContextClass_block_invoke_2((uint64_t)buf, v4, v5, v6, v7, v8, v9, v10, v22[0]);
    v11 = p_location[3];
  }
  v13 = (objc_class *)objc_retainAutorelease(v11);
  _Block_object_dispose(&location, 8);
  v14 = [v13 alloc];
  *(_QWORD *)buf = 0;
  v25 = (uint64_t)buf;
  v26 = 0x2020000000;
  v15 = (_QWORD *)getFACircleEventTypeInitiateSymbolLoc_ptr_2;
  v27 = (uint64_t (*)(uint64_t, uint64_t))getFACircleEventTypeInitiateSymbolLoc_ptr_2;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr_2)
  {
    v16 = (void *)FamilyCircleUILibrary_2();
    v15 = dlsym(v16, "FACircleEventTypeInitiate");
    *(_QWORD *)(v25 + 24) = v15;
    getFACircleEventTypeInitiateSymbolLoc_ptr_2 = (uint64_t)v15;
  }
  _Block_object_dispose(buf, 8);
  if (!v15)
    -[ICQFamilySharingHook _beginFamilySharingFlowWithCompletion:].cold.1();
  v17 = (void *)objc_msgSend(v14, "initWithEventType:", *v15);
  objc_msgSend(v17, "setClientName:", CFSTR("iCloudStorage"));
  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  v25 = (uint64_t)buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__9;
  v28 = (id *)__Block_byref_object_dispose__9;
  v18 = objc_alloc((Class)getFACircleStateControllerClass());
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  objc_msgSend(WeakRetained, "navigationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v18, "initWithPresenter:", v20);

  v21 = *(void **)(v25 + 40);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke;
  v22[3] = &unk_24E3F5308;
  objc_copyWeak(&v23, &location);
  v22[4] = buf;
  objc_msgSend(v21, "performWithContext:completion:", v17, v22);
  objc_destroyWeak(&v23);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
}

void __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_finishLoadingSpecifier");
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      _ICQGetLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke_cold_1(v3, v7);

    }
    else
    {
      objc_msgSend(v5, "_fetchStorageSummary");
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
}

- (void)_launchFamilyUsageFlowWithURL:(id)a3
{
  id v4;
  ICQPreferencesRemoteUIDelegate *ruiDelegate;
  ICQPreferencesRemoteUIDelegate *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  ICQPreferencesRemoteUIDelegate *v10;
  ICQPreferencesRemoteUIDelegate *v11;
  id v12;

  v4 = a3;
  ruiDelegate = self->_ruiDelegate;
  v12 = v4;
  if (!ruiDelegate)
  {
    v6 = [ICQPreferencesRemoteUIDelegate alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQiCloudFooterSpecifierProvider account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:](v6, "initWithNavigationController:initialAction:account:", v8, 0, v9);
    v11 = self->_ruiDelegate;
    self->_ruiDelegate = v10;

    -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_ruiDelegate, "setDelegate:", self);
    v4 = v12;
    ruiDelegate = self->_ruiDelegate;
  }
  -[ICQPreferencesRemoteUIDelegate loadURL:postBody:additionalHeaders:](ruiDelegate, "loadURL:postBody:additionalHeaders:", v4, 0, 0);

}

- (void)_launchLegacyPurchaseFlow
{
  NSObject *v3;
  NSObject *v4;
  ICQUILegacyPurchaseFlowController *v5;
  ICQUILegacyPurchaseFlowController *legacyPurchaseFlowController;
  ICQUILegacyPurchaseFlowController *v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint8_t v12[16];
  id buf[2];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Launching legacy purchase flow.", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
  }

  v5 = objc_alloc_init(ICQUILegacyPurchaseFlowController);
  legacyPurchaseFlowController = self->_legacyPurchaseFlowController;
  self->_legacyPurchaseFlowController = v5;

  v7 = self->_legacyPurchaseFlowController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  v9 = *MEMORY[0x24BE75820];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke;
  v10[3] = &unk_24E3F5330;
  objc_copyWeak(&v11, buf);
  -[ICQUILegacyPurchaseFlowController beginFlowWithPresenter:action:completion:](v7, "beginFlowWithPresenter:action:completion:", WeakRetained, v9, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *WeakRetained;
  uint8_t v8[16];

  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  WeakRetained = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21F2CC000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Legacy purchase flow completed successfully! Reloading specifiers.", v8, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    -[NSObject _postQuotaDidChangeNotification](WeakRetained, "_postQuotaDidChangeNotification");
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke_cold_1();
  }

}

- (void)_fetchStorageSummary
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__9;
  v11 = __Block_byref_object_dispose__9;
  v3 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQiCloudFooterSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "initWithAccount:", v4);

  objc_msgSend((id)v8[5], "setShouldIgnoreCache:", 1);
  v5 = (void *)v8[5];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke;
  v6[3] = &unk_24E3F3938;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "fetchStorageSummaryWithCompletion:", v6);
  _Block_object_dispose(&v7, 8);

}

void __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD block[5];

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v5;
  v9 = v5;

  if (v6)
  {
    _ICQGetLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_cold_1();

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_68;
  block[3] = &unk_24E3F3610;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = 0;

}

uint64_t __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifiers");
}

- (void)_reloadSpecifiers
{
  NSArray *specifiers;
  NSArray *v4;
  id WeakRetained;

  specifiers = self->_specifiers;
  self->_specifiers = 0;
  v4 = specifiers;

  -[AAUISpecifierProvider setSpecifiers:](self->_icloudPlusSpecifierProvider, "setSpecifiers:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", self, v4, 0);

}

- (void)upgradeFlowManagerDidCancel:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow cancelled.", v6, 2u);
  }

  -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

}

- (void)upgradeFlowManagerDidComplete:(id)a3
{
  NSObject *v4;
  ICQUpgradeFlowManager *upgradeFlowManager;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Upgrade flow completed successfully.", v6, 2u);
  }

  -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
  -[ICQUpgradeFlowManager setDelegate:](self->_upgradeFlowManager, "setDelegate:", 0);
  upgradeFlowManager = self->_upgradeFlowManager;
  self->_upgradeFlowManager = 0;

  -[ICQiCloudFooterSpecifierProvider _postQuotaDidChangeNotification](self, "_postQuotaDidChangeNotification");
}

- (void)_postQuotaDidChangeNotification
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[ICQiCloudFooterSpecifierProvider _postQuotaDidChangeNotification]";
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "%s refreshing quota storage info", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("QuotaDidChange"), 0);

}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;

  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[ICQUIRecommendationsRestorableViewController loadFailed:withError:].cold.1();

  -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
}

- (void)loadFinished:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate Loading finished", v5, 2u);
  }

  -[ICQiCloudFooterSpecifierProvider _finishLoadingSpecifier](self, "_finishLoadingSpecifier");
}

- (void)loadStarted:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  _ICQGetLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "DelayedPushDelegate Loading started.", v4, 2u);
  }

}

- (void)_finishLoadingSpecifier
{
  _QWORD block[5];

  if (self->_activeSpecifier)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __59__ICQiCloudFooterSpecifierProvider__finishLoadingSpecifier__block_invoke;
    block[3] = &unk_24E3F3610;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __59__ICQiCloudFooterSpecifierProvider__finishLoadingSpecifier__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = 0;

}

- (void)_beginLoadingSpecifier:(id)a3
{
  PSSpecifier *v4;
  PSSpecifier *activeSpecifier;
  PSSpecifier *v6;
  id WeakRetained;

  v4 = (PSSpecifier *)a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  activeSpecifier = self->_activeSpecifier;
  self->_activeSpecifier = v4;
  v6 = v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:willBeginLoadingSpecifier:", self, v6);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_icloudPlusSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowManager, 0);
  objc_storeStrong((id *)&self->_legacyPurchaseFlowController, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_upgradeFlowManager, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)specifiers
{
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, a1, a3, "%s specifiers were requested for non-primary account. Returning no specifiers.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)_buildSubscriptionSpecifiers
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "No subscription specifier info found. Returning no specifier.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

- (void)_launchFlowForSpecifier:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "No url found. Failed to launch family usage view for specifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_launchFlowForSpecifier:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_4(&dword_21F2CC000, v2, v3, "Unknown identifier: %@, can not load URL: %@", v4, v5, v6, v7, v8);

}

- (void)_handleICQLink:forSpecifier:.cold.1()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_opt_class();
  OUTLINED_FUNCTION_5_0();
  v1 = v0;
  OUTLINED_FUNCTION_2_4(&dword_21F2CC000, v2, v3, "%@ can not handle link: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_launchUpgradeFlowWithURL:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_21F2CC000, a1, a3, "Upgrade flow is already in progress. Bailing.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void __55__ICQiCloudFooterSpecifierProvider__startFamilySharing__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  _os_log_error_impl(&dword_21F2CC000, a2, OS_LOG_TYPE_ERROR, "Family sharing launch error %@", v4, 0xCu);

  OUTLINED_FUNCTION_1_1();
}

void __61__ICQiCloudFooterSpecifierProvider__launchLegacyPurchaseFlow__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Legacy purchase flow completed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __56__ICQiCloudFooterSpecifierProvider__fetchStorageSummary__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_0(&dword_21F2CC000, v0, v1, "Failed to fetch storage summary with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
