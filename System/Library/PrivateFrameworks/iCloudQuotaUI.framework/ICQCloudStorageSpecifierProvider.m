@implementation ICQCloudStorageSpecifierProvider

- (ICQCloudStorageSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICQCloudStorageSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (ICQCloudStorageSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICQCloudStorageSpecifierProvider *v9;
  ICQCloudStorageSpecifierProvider *v10;
  uint64_t v11;
  FLFollowUpController *followUpController;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *recommendationAnalyticsHelper;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICQCloudStorageSpecifierProvider;
  v9 = -[ICQCloudStorageSpecifierProvider init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    objc_msgSend(MEMORY[0x24BEC7348], "sharedFollowUpController");
    v11 = objc_claimAutoreleasedReturnValue();
    followUpController = v10->_followUpController;
    v10->_followUpController = (FLFollowUpController *)v11;

    v13 = [_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper alloc];
    -[AIDAAccountManager accounts](v10->_accountManager, "accounts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[RecommendationAnalyticsHelper initWithAccount:](v13, "initWithAccount:", v15);
    recommendationAnalyticsHelper = v10->_recommendationAnalyticsHelper;
    v10->_recommendationAnalyticsHelper = (_TtC13iCloudQuotaUI29RecommendationAnalyticsHelper *)v16;

    -[ICQCloudStorageSpecifierProvider _startObservingQuotaChangeNotifications](v10, "_startObservingQuotaChangeNotifications");
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
  objc_super v3;

  -[ICQCloudStorageSpecifierProvider _stopObservingQuotaChangeNotifications](self, "_stopObservingQuotaChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICQCloudStorageSpecifierProvider;
  -[ICQCloudStorageSpecifierProvider dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  id v5;
  void *v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_storeWeak((id *)p_delegate, v5);

  v6 = WeakRetained;
  if (!WeakRetained)
  {
    -[RecommendationAnalyticsHelper sendiCloudSettingsDisplayedEventWithCompletionHandler:](self->_recommendationAnalyticsHelper, "sendiCloudSettingsDisplayedEventWithCompletionHandler:", &__block_literal_global_21);
    v6 = 0;
  }

}

void __48__ICQCloudStorageSpecifierProvider_setDelegate___block_invoke()
{
  NSObject *v0;

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __48__ICQCloudStorageSpecifierProvider_setDelegate___block_invoke_cold_1();

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  NSArray *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PSSpecifier *v10;
  PSSpecifier *storageGraphSpecifier;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  PSSpecifier *v19;
  PSSpecifier *manageStorageSpecifier;
  NSArray *v21;
  NSArray *v22;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

    if (!self->_storageGraphSpecifier)
    {
      v7 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ICLOUD_TITLE"), &stru_24E400750, CFSTR("CloudGroup"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel__valueForStorageGraphSpecifier_, 0, -1, 0);
      v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      storageGraphSpecifier = self->_storageGraphSpecifier;
      self->_storageGraphSpecifier = v10;

      -[PSSpecifier setObject:forKeyedSubscript:](self->_storageGraphSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_storageSummary != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](self->_storageGraphSpecifier, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A18]);

    -[PSSpecifier setIdentifier:](self->_storageGraphSpecifier, "setIdentifier:", CFSTR("iCloudStorageBarGraph"));
    objc_msgSend(v5, "addObject:", self->_storageGraphSpecifier);
    if (self->_manageStorageSpecifier)
      goto LABEL_11;
    -[ICQCloudStorageSpecifierProvider account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "aa_isAccountClass:", *MEMORY[0x24BE047F0]))
    {

    }
    else
    {
      -[ICQCloudStorageSpecifierProvider account](self, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "aa_isManagedAppleID");

      if (!v15)
        goto LABEL_10;
    }
    v16 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ICLOUD_MANAGE_STORAGE"), &stru_24E400750, CFSTR("CloudGroup"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v18, self, 0, 0, 0, 1, 0);
    v19 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
    manageStorageSpecifier = self->_manageStorageSpecifier;
    self->_manageStorageSpecifier = v19;

    -[PSSpecifier setIdentifier:](self->_manageStorageSpecifier, "setIdentifier:", CFSTR("STORAGE_AND_BACKUP"));
    -[PSSpecifier setObject:forKeyedSubscript:](self->_manageStorageSpecifier, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    -[PSSpecifier setControllerLoadAction:](self->_manageStorageSpecifier, "setControllerLoadAction:", sel__manageStorageSpecifierWasTapped_);
LABEL_10:
    if (!self->_manageStorageSpecifier)
    {
LABEL_12:
      v21 = (NSArray *)objc_msgSend(v5, "copy");
      v22 = self->_specifiers;
      self->_specifiers = v21;

      v3 = self->_specifiers;
      return v3;
    }
LABEL_11:
    objc_msgSend(v5, "addObject:");
    goto LABEL_12;
  }
  v3 = specifiers;
  return v3;
}

- (id)_valueForStorageGraphSpecifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  ICQCloudStorageSummary *storageSummary;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04CA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04CB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  storageSummary = self->_storageSummary;
  if (storageSummary || (v6 & 1) != 0 || (v8 & 1) != 0)
  {
    if (storageSummary)
    {
      -[ICQCloudStorageSummary displayLabel](storageSummary, "displayLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE75D50]);

      -[ICQCloudStorageSummary manageStorageTitle](self->_storageSummary, "manageStorageTitle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PSSpecifier setName:](self->_manageStorageSpecifier, "setName:", v11);

      -[ICQCloudStorageSummary totalStorage](self->_storageSummary, "totalStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE04C90]);

      -[ICQCloudStorageSummary freeStorage](self->_storageSummary, "freeStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE04C88]);

      -[ICQCloudStorageSummary usedStorage](self->_storageSummary, "usedStorage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE04CA0]);

      -[ICQCloudStorageSummary icqui_AAUIiCloudMediaUsageInfo](self->_storageSummary, "icqui_AAUIiCloudMediaUsageInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE04C98]);

    }
  }
  else
  {
    -[ICQCloudStorageSpecifierProvider _fetchStorageSummary:](self, "_fetchStorageSummary:", v4);
  }

  return 0;
}

- (void)_manageStorageSpecifierWasTapped:(id)a3
{
  ICQCloudStorageSummary *storageSummary;
  id v5;
  NSObject *v6;

  storageSummary = self->_storageSummary;
  v5 = a3;
  if (storageSummary)
  {
    -[ICQCloudStorageSpecifierProvider _enterManageStorage:](self, "_enterManageStorage:", v5);
  }
  else
  {
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ICQCloudStorageSpecifierProvider _manageStorageSpecifierWasTapped:].cold.1();

    self->_delayedEnterManageStorage = 1;
    -[ICQCloudStorageSpecifierProvider _fetchStorageSummary:](self, "_fetchStorageSummary:", v5);
  }

}

- (void)_enterManageStorage:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  ICQPreferencesRemoteUIDelegate *v8;
  id WeakRetained;
  void *v10;
  NSString *initialStorageFlowAction;
  void *v12;
  ICQPreferencesRemoteUIDelegate *v13;
  ICQPreferencesRemoteUIDelegate *ruiDelegate;
  NSString *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD block[5];
  id v23;
  id v24;
  id buf[2];

  v5 = a3;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ICQCloudStorageSpecifierProvider _enterManageStorage:].cold.1();

  if (self->_activeSpecifier)
  {
    _ICQGetLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "Currently loading managed storage page. Bailing.", (uint8_t *)buf, 2u);
    }

  }
  else
  {
    v8 = [ICQPreferencesRemoteUIDelegate alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    objc_msgSend(WeakRetained, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    initialStorageFlowAction = self->_initialStorageFlowAction;
    -[ICQCloudStorageSpecifierProvider account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICQPreferencesRemoteUIDelegate initWithNavigationController:initialAction:account:](v8, "initWithNavigationController:initialAction:account:", v10, initialStorageFlowAction, v12);
    ruiDelegate = self->_ruiDelegate;
    self->_ruiDelegate = v13;

    -[ICQPreferencesRemoteUIDelegate setIsManageStorage:](self->_ruiDelegate, "setIsManageStorage:", 1);
    v15 = self->_initialStorageFlowAction;
    self->_initialStorageFlowAction = 0;

    -[ICQPreferencesRemoteUIDelegate setDelegate:](self->_ruiDelegate, "setDelegate:", self);
    if (-[ICQCloudStorageSummary shouldUseNativeManageStorage](self->_storageSummary, "shouldUseNativeManageStorage"))
    {
      _ICQGetLogSystem();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "Detected V2 Storage Summary API, will use native Manage Storage view", (uint8_t *)buf, 2u);
      }

      -[ICQPreferencesRemoteUIDelegate setNextSignpostId:](self->_ruiDelegate, "setNextSignpostId:", CFSTR("MANAGE_DRILLDOWN"));
      -[ICQCloudStorageSpecifierProvider _createNativeManageStorageIfNeeded](self, "_createNativeManageStorageIfNeeded");
      -[ICQUINativeManageStorageController refreshAppList](self->_nativeManageStorage, "refreshAppList");
      -[ICQCloudStorageSpecifierProvider delegate](self, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "specifierProvider:showViewController:", self, self->_nativeManageStorage);

      -[RecommendationAnalyticsHelper sendManageStorageDisplayedEventWithCompletionHandler:](self->_recommendationAnalyticsHelper, "sendManageStorageDisplayedEventWithCompletionHandler:", &__block_literal_global_66);
    }
    else
    {
      -[ICQPreferencesRemoteUIDelegate setNextSignpostId:](self->_ruiDelegate, "setNextSignpostId:", CFSTR("MANAGE"));
      v18 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v18, "specifierProvider:willBeginLoadingSpecifier:", self, v5);

      objc_storeStrong((id *)&self->_activeSpecifier, a3);
      objc_initWeak(buf, self->_ruiDelegate);
      -[ICQCloudStorageSummary manageStorageURL](self->_storageSummary, "manageStorageURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_get_global_queue(0, 0);
      v20 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_69;
      block[3] = &unk_24E3F58A0;
      block[4] = self;
      objc_copyWeak(&v24, buf);
      v23 = v19;
      v21 = v19;
      dispatch_async(v20, block);

      objc_destroyWeak(&v24);
      objc_destroyWeak(buf);
    }
  }

}

void __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke()
{
  NSObject *v0;

  _ICQGetLogSystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_cold_1();

}

void __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_69(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  objc_msgSend(a1[4], "account");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICQCloudStorageInfo backupInfoHeadersForAccount:](ICQCloudStorageInfo, "backupInfoHeadersForAccount:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_2;
  block[3] = &unk_24E3F5878;
  objc_copyWeak(&v8, a1 + 6);
  v6 = a1[5];
  v7 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
}

void __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "loadURL:postBody:additionalHeaders:", *(_QWORD *)(a1 + 32), 0, *(_QWORD *)(a1 + 40));

}

- (void)_fetchStorageSummary:(id)a3
{
  -[ICQCloudStorageSpecifierProvider _fetchStorageSummary:completion:](self, "_fetchStorageSummary:completion:", a3, 0);
}

- (void)_fetchStorageSummary:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  id WeakRetained;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id v22;
  uint8_t *v23;
  uint8_t buf[8];
  uint8_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint8_t v30[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = *MEMORY[0x24BE04CA8];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE04CA8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "BOOLValue"))
  {

LABEL_4:
    _ICQGetLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v12, OS_LOG_TYPE_DEFAULT, "Already fetching cloud storage summary. Bailing.", buf, 2u);
    }

    goto LABEL_12;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE04CB0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    goto LABEL_4;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "specifierProvider:willBeginLoadingSpecifier:", self, v6);

    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v8);
  }
  *(_QWORD *)buf = 0;
  v25 = buf;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__13;
  v28 = __Block_byref_object_dispose__13;
  v14 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICQCloudStorageSpecifierProvider account](self, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v14, "initWithAccount:", v15);

  _ICQGetLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_opt_class();
    *(_DWORD *)v30 = 138412290;
    v31 = v17;
    v18 = v17;
    _os_log_impl(&dword_21F2CC000, v16, OS_LOG_TYPE_DEFAULT, "%@: requesting storage summary.", v30, 0xCu);

  }
  v19 = (void *)*((_QWORD *)v25 + 5);
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke;
  v20[3] = &unk_24E3F58F0;
  v20[4] = self;
  v21 = v6;
  v22 = v7;
  v23 = buf;
  objc_msgSend(v19, "fetchStorageSummaryWithCompletion:", v20);

  _Block_object_dispose(buf, 8);
LABEL_12:

}

void __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke_2;
  v11[3] = &unk_24E3F58C8;
  v7 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v7;
  v8 = *(id *)(a1 + 48);
  v14 = v6;
  v15 = v8;
  v16 = *(_QWORD *)(a1 + 56);
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __68__ICQCloudStorageSpecifierProvider__fetchStorageSummary_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE04CA8]);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(WeakRetained, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
  v4 = *(void **)(a1 + 48);
  v5 = *MEMORY[0x24BE04CB0];
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v5);
    objc_msgSend(*(id *)(a1 + 32), "_reloadStorageSpecifiers");
    v6 = *(_QWORD *)(a1 + 32);
    if (*(_BYTE *)(v6 + 40))
    {
      *(_BYTE *)(v6 + 40) = 0;
      objc_msgSend(*(id *)(a1 + 32), "_enterManageStorage:", *(_QWORD *)(a1 + 48));
    }
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v5);
    objc_msgSend(*(id *)(a1 + 32), "_reloadStorageSpecifiers");
  }
  v7 = *(_QWORD *)(a1 + 64);
  if (v7)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v7 + 16))(v7, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = 0;

}

- (void)_reloadStorageSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (self->_storageGraphSpecifier)
  {
    -[ICQCloudStorageSpecifierProvider delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_storageGraphSpecifier, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSpecifierForProvider:identifier:", self, v4);

  }
  if (self->_manageStorageSpecifier)
  {
    -[ICQCloudStorageSpecifierProvider delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_manageStorageSpecifier, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadSpecifierForProvider:identifier:", self, v5);

  }
}

- (void)_finishLoadingActiveSpecifier
{
  id WeakRetained;
  PSSpecifier *activeSpecifier;

  if (self->_activeSpecifier)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "specifierProvider:didFinishLoadingSpecifier:", self, self->_activeSpecifier);

    activeSpecifier = self->_activeSpecifier;
    self->_activeSpecifier = 0;

  }
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
    _os_log_impl(&dword_21F2CC000, v3, OS_LOG_TYPE_DEFAULT, "Manage storage loading started.", v4, 2u);
  }

}

- (void)loadFinished:(id)a3
{
  NSObject *v4;
  ICQUINativeManageStorageController *nativeManageStorage;
  uint8_t v6[16];

  _ICQGetLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21F2CC000, v4, OS_LOG_TYPE_DEFAULT, "Manage storage load finished with success.", v6, 2u);
  }

  -[ICQCloudStorageSpecifierProvider _finishLoadingActiveSpecifier](self, "_finishLoadingActiveSpecifier");
  nativeManageStorage = self->_nativeManageStorage;
  if (nativeManageStorage)
    -[ICQUINativeManageStorageController stopActiveSpecifier](nativeManageStorage, "stopActiveSpecifier");
}

- (void)loadFailed:(id)a3 withError:(id)a4
{
  id v5;
  NSObject *v6;
  ICQUINativeManageStorageController *nativeManageStorage;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _ICQGetLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_21F2CC000, v6, OS_LOG_TYPE_DEFAULT, "Manage storage load failed with error: %@", (uint8_t *)&v8, 0xCu);
  }

  -[ICQCloudStorageSpecifierProvider _finishLoadingActiveSpecifier](self, "_finishLoadingActiveSpecifier");
  nativeManageStorage = self->_nativeManageStorage;
  if (nativeManageStorage)
    -[ICQUINativeManageStorageController stopActiveSpecifier](nativeManageStorage, "stopActiveSpecifier");

}

- (void)remoteUIDelegate:(id)a3 didCreatePage:(id)a4 inObjectModel:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  ICQCloudStorageGraphTableViewRow *v19;
  void *v20;
  ICQCloudStorageGraphTableViewRow *v21;
  void *v22;
  void *v23;
  uint8_t v24[8];
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if ((-[ICQCloudStorageSummary shouldUseNativeManageStorage](self->_storageSummary, "shouldUseNativeManageStorage") & 1) == 0)
  {
    objc_msgSend(v8, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("iCloudManageStorage"));

    if (v10)
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "Manage storage rui page created. Injecting storage graph cell.", v24, 2u);
      }

      v12 = objc_alloc(MEMORY[0x24BE7EE18]);
      objc_msgSend(v7, "tableViewOM");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithAttributes:parent:", 0, v13);

      objc_msgSend(v8, "clientInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("storageGraphFooterText"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        v17 = objc_alloc_init(MEMORY[0x24BE7EDB8]);
        objc_msgSend(v17, "setBody:", v16);
        v25[0] = CFSTR("color");
        v25[1] = CFSTR("align");
        v26[0] = CFSTR("secondaryLabelColor");
        v26[1] = &stru_24E400750;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setAttributes:", v18);
        objc_msgSend(v14, "setFooter:", v17);

      }
      v19 = [ICQCloudStorageGraphTableViewRow alloc];
      -[ICQCloudStorageSpecifierProvider account](self, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[ICQCloudStorageGraphTableViewRow initWithAccount:](v19, "initWithAccount:", v20);

      -[RUITableViewRow setDelegate:](v21, "setDelegate:", self);
      objc_msgSend(v14, "addRow:", v21);
      objc_msgSend(v7, "tableViewOM");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "sections");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "insertObject:atIndex:", v14, 0);

    }
    -[ICQCloudStorageSpecifierProvider _replaceRUISectionWithTipUIFromObjectModel:inPage:](self, "_replaceRUISectionWithTipUIFromObjectModel:inPage:", v8, v7);
  }

}

- (void)_replaceRUISectionWithTipUIFromObjectModel:(id)a3 inPage:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  ICQUITipSpecifierProvider *v10;
  AIDAAccountManager *accountManager;
  id WeakRetained;
  ICQUITipSpecifierProvider *v13;
  ICQUITipSpecifierProvider *tipSpecifierProvider;
  id v15;
  void *v16;
  void *v17;
  ICQUITipSpecifierProvider *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint8_t v27[16];
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(a3, "subElementWithID:", *MEMORY[0x24BEC7288]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _ICQGetLogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, "Did not find section to replace with violation tip", buf, 2u);
    }
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    _ICQGetLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v27 = 0;
      _os_log_impl(&dword_21F2CC000, v8, OS_LOG_TYPE_DEFAULT, "Violation tip section found. Injecting client generated tip.", v27, 2u);
    }

    v9 = v7;
    if (!self->_tipSpecifierProvider)
    {
      v10 = [ICQUITipSpecifierProvider alloc];
      accountManager = self->_accountManager;
      WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
      v13 = -[ICQUITipSpecifierProvider initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:](v10, "initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:", accountManager, WeakRetained, *MEMORY[0x24BEC7240], 0);
      tipSpecifierProvider = self->_tipSpecifierProvider;
      self->_tipSpecifierProvider = v13;

    }
    v15 = objc_alloc(MEMORY[0x24BE7EE18]);
    objc_msgSend(v6, "tableViewOM");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithAttributes:parent:", 0, v16);

    v18 = self->_tipSpecifierProvider;
    -[NSObject attributes](v9, "attributes");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject rows](v9, "rows");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUITipSpecifierProvider tipForManageStorageFromAttributes:rows:viewController:remoteUIDelegate:](v18, "tipForManageStorageFromAttributes:rows:viewController:remoteUIDelegate:", v19, v20, v6, self->_ruiDelegate);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      objc_msgSend(v17, "addRow:", v21);
    objc_msgSend(v6, "tableViewOM");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "sections");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "indexOfObject:", v9);

    if (v24 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "tableViewOM");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "sections");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "replaceObjectAtIndex:withObject:", v24, v17);

    }
LABEL_14:

  }
}

- (Class)tableCellClassForTableViewRow:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)_startObservingQuotaChangeNotifications
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *quotaChangeNotificationObserver;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_quotaChangeNotificationObserver)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __75__ICQCloudStorageSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke;
    v7[3] = &unk_24E3F3B40;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("QuotaDidChange"), 0, v4, v7);
    v5 = objc_claimAutoreleasedReturnValue();
    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __75__ICQCloudStorageSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _ICQGetLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = CFSTR("QuotaDidChange");
    _os_log_impl(&dword_21F2CC000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fetchStorageSummary:", 0);

}

- (void)_stopObservingQuotaChangeNotifications
{
  void *v3;
  NSObject *quotaChangeNotificationObserver;

  if (self->_quotaChangeNotificationObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_quotaChangeNotificationObserver);

    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = 0;

  }
}

- (BOOL)handleURL:(id)a3
{
  _BOOL4 v4;

  v4 = -[ICQCloudStorageSpecifierProvider _handleManagedStorageURL:](self, "_handleManagedStorageURL:", a3);
  if (v4)
    -[ICQCloudStorageSpecifierProvider _manageStorageSpecifierWasTapped:](self, "_manageStorageSpecifierWasTapped:", self->_manageStorageSpecifier);
  return v4;
}

- (BOOL)_handleManagedStorageURL:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  id *v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  id v29;
  const char *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  _QWORD v35[5];
  id v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v4;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "resourceDictionary - %@", buf, 0xCu);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "icqui_isChangeStoragePlanPath"))
  {
    if (objc_msgSend(v6, "icqui_isDeviceOffersPath"))
    {
      _ICQGetLogSystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v12;
        v13 = v12;
        _os_log_impl(&dword_21F2CC000, v11, OS_LOG_TYPE_DEFAULT, "%@: Received a device offers url.", buf, 0xCu);

      }
      v10 = (id *)MEMORY[0x24BE75828];
      goto LABEL_23;
    }
    if (objc_msgSend(v6, "icqui_isStorageUpgradePath"))
    {
      _ICQGetLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v15;
        v16 = v15;
        _os_log_impl(&dword_21F2CC000, v14, OS_LOG_TYPE_DEFAULT, "%@: Received a Freshmint storage upgrade url.", buf, 0xCu);

      }
      -[ICQCloudStorageSpecifierProvider _handleStorageUpgradeURL:](self, "_handleStorageUpgradeURL:", v4);
      goto LABEL_24;
    }
    if (objc_msgSend(v6, "icqui_isPhotosPath"))
    {
      _ICQGetLogSystem();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v18;
        v19 = v18;
        _os_log_impl(&dword_21F2CC000, v17, OS_LOG_TYPE_DEFAULT, "%@: Received a launch photos storage action.", buf, 0xCu);

      }
      v10 = (id *)MEMORY[0x24BE75840];
      goto LABEL_23;
    }
    if (objc_msgSend(v6, "icqui_isCurrentDeviceBackupPath"))
    {
      _ICQGetLogSystem();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v21;
        v22 = v21;
        _os_log_impl(&dword_21F2CC000, v20, OS_LOG_TYPE_DEFAULT, "%@: Received current device backup action", buf, 0xCu);

      }
      v10 = (id *)MEMORY[0x24BE75838];
      goto LABEL_23;
    }
    objc_msgSend(v6, "lastPathComponent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("MANAGE_STORAGE"));

    if (v26)
    {
      _ICQGetLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v28 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v28;
        v29 = v28;
        v30 = "%@: Received manage storage url";
LABEL_35:
        _os_log_impl(&dword_21F2CC000, v27, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend(v6, "lastPathComponent");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("STORAGE_AND_BACKUP"));

      if (!v32)
      {
        if (!objc_msgSend(v6, "containsString:", CFSTR("LOCAL_BACKUP")))
        {
          v23 = 0;
          goto LABEL_25;
        }
        _ICQGetLogSystem();
        v27 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v34 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v34;
        v29 = v34;
        v30 = "%@: Received local backup url";
        goto LABEL_35;
      }
      _ICQGetLogSystem();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v38 = v33;
        v29 = v33;
        v30 = "%@: Received storage and backup url";
        goto LABEL_35;
      }
    }
LABEL_36:

    goto LABEL_24;
  }
  _ICQGetLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    v9 = v8;
    _os_log_impl(&dword_21F2CC000, v7, OS_LOG_TYPE_DEFAULT, "%@: Received a change storage plan url.", buf, 0xCu);

  }
  v10 = (id *)MEMORY[0x24BE75820];
LABEL_23:
  objc_storeStrong((id *)&self->_initialStorageFlowAction, *v10);
LABEL_24:
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __61__ICQCloudStorageSpecifierProvider__handleManagedStorageURL___block_invoke;
  v35[3] = &unk_24E3F5918;
  v35[4] = self;
  v36 = v4;
  -[ICQCloudStorageSpecifierProvider _fetchStorageSummary:completion:](self, "_fetchStorageSummary:completion:", 0, v35);

  v23 = 1;
LABEL_25:

  return v23;
}

uint64_t __61__ICQCloudStorageSpecifierProvider__handleManagedStorageURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "shouldUseNativeManageStorage");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "_createNativeManageStorageIfNeeded");
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "handleURL:withCompletion:", *(_QWORD *)(a1 + 40), 0);
  }
  return result;
}

- (void)_handleStorageUpgradeURL:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  FLFollowUpController *followUpController;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;

  v4 = a3;
  objc_storeStrong((id *)&self->_initialStorageFlowAction, (id)*MEMORY[0x24BE75830]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clearCFUForOfferType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("device")) & 1) != 0)
  {
    v6 = 3;
LABEL_7:
    v7 = (void *)MEMORY[0x24BEC7348];
    followUpController = self->_followUpController;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke;
    v10[3] = &unk_24E3F3F40;
    v11 = v5;
    objc_msgSend(v7, "clearNotificationWithController:offerType:completion:", followUpController, v6, v10);
    v9 = v11;
    goto LABEL_8;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("premium")) & 1) != 0)
  {
    v6 = 2;
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("event")))
  {
    v6 = 5;
    goto LABEL_7;
  }
  _ICQGetLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ICQCloudStorageSpecifierProvider _handleStorageUpgradeURL:].cold.1(v4, v9);
LABEL_8:

}

void __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    _ICQGetLogSystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke_cold_1(a1, (uint64_t)v3, v4);

  }
}

- (void)_createNativeManageStorageIfNeeded
{
  ICQUINativeManageStorageController *v3;
  ICQUINativeManageStorageController *nativeManageStorage;

  if (!self->_nativeManageStorage)
  {
    v3 = -[ICQUINativeManageStorageController initWithAccountManager:summary:ruiDelegate:]([ICQUINativeManageStorageController alloc], "initWithAccountManager:summary:ruiDelegate:", self->_accountManager, self->_storageSummary, self->_ruiDelegate);
    nativeManageStorage = self->_nativeManageStorage;
    self->_nativeManageStorage = v3;

  }
  -[ICQPreferencesRemoteUIDelegate setIsNativeManageStorage:](self->_ruiDelegate, "setIsNativeManageStorage:", 1);
  -[ICQUINativeManageStorageController setRuiDelegate:](self->_nativeManageStorage, "setRuiDelegate:", self->_ruiDelegate);
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)initialStorageFlowAction
{
  return self->_initialStorageFlowAction;
}

- (void)setInitialStorageFlowAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialStorageFlowAction, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recommendationAnalyticsHelper, 0);
  objc_storeStrong((id *)&self->_nativeManageStorage, 0);
  objc_storeStrong((id *)&self->_followUpController, 0);
  objc_storeStrong((id *)&self->_tipSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_storageGraphSpecifier, 0);
  objc_storeStrong((id *)&self->_manageStorageSpecifier, 0);
  objc_storeStrong((id *)&self->_storageSummary, 0);
  objc_storeStrong((id *)&self->_quotaChangeNotificationObserver, 0);
  objc_storeStrong((id *)&self->_ruiDelegate, 0);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __48__ICQCloudStorageSpecifierProvider_setDelegate___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, v0, v1, "Sending iCloudSettings displayed event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_manageStorageSpecifierWasTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, v0, v1, "Manage storage enter delayed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_enterManageStorage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, v0, v1, "Entering manage storage.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__ICQCloudStorageSpecifierProvider__enterManageStorage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_21F2CC000, v0, v1, "Sending ManageStorage displayed event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_handleStorageUpgradeURL:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  const __CFString *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("clearCFUForOfferType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = CFSTR("clearCFUForOfferType");
  v7 = 2112;
  v8 = v3;
  OUTLINED_FUNCTION_2_5(&dword_21F2CC000, a2, v4, "Invalid value for query param: %@, value: %@", (uint8_t *)&v5);

}

void __61__ICQCloudStorageSpecifierProvider__handleStorageUpgradeURL___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_2_5(&dword_21F2CC000, a3, (uint64_t)a3, "Error clearing out CFU for offer type %@, error: %@", (uint8_t *)&v4);
}

@end
