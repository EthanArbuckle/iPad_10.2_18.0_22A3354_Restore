@implementation ICSHeaderSpecifierProvider

- (ICSHeaderSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICSHeaderSpecifierProvider *v9;
  ICSHeaderSpecifierProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICSHeaderSpecifierProvider;
  v9 = -[ICSHeaderSpecifierProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_listController, v8);
    -[ICSHeaderSpecifierProvider _startObservingQuotaChangeNotifications](v10, "_startObservingQuotaChangeNotifications");
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

  -[ICSHeaderSpecifierProvider _stopObservingQuotaChangeNotifications](self, "_stopObservingQuotaChangeNotifications");
  v3.receiver = self;
  v3.super_class = (Class)ICSHeaderSpecifierProvider;
  -[ICSHeaderSpecifierProvider dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  id v4;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_storeWeak((id *)p_delegate, v4);

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
  NSArray *v13;
  NSArray *v14;

  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
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
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ICLOUD_TITLE"), &stru_251C6B070, CFSTR("CloudGroup"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, sel__valueForStorageGraphSpecifier_, 0, -1, 0);
      v10 = (PSSpecifier *)objc_claimAutoreleasedReturnValue();
      storageGraphSpecifier = self->_storageGraphSpecifier;
      self->_storageGraphSpecifier = v10;

      -[PSSpecifier setObject:forKeyedSubscript:](self->_storageGraphSpecifier, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", self->_homeDataModel != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier setObject:forKeyedSubscript:](self->_storageGraphSpecifier, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75A18]);

    -[PSSpecifier setIdentifier:](self->_storageGraphSpecifier, "setIdentifier:", CFSTR("iCloudStorageBarGraph"));
    objc_msgSend(v5, "addObject:", self->_storageGraphSpecifier);
    v13 = (NSArray *)objc_msgSend(v5, "copy");
    v14 = self->_specifiers;
    self->_specifiers = v13;

    v3 = self->_specifiers;
  }
  return v3;
}

- (id)_valueForStorageGraphSpecifier:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  char v8;
  ICSHomeDataModel *homeDataModel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04CA8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE04CB0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  homeDataModel = self->_homeDataModel;
  if (homeDataModel || (v6 & 1) != 0 || (v8 & 1) != 0)
  {
    if (homeDataModel)
    {
      -[ICSHomeDataModel headerCard](homeDataModel, "headerCard");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "storageSummary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "subscriptionLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75D50]);

      v13 = (void *)MEMORY[0x24BDD16E0];
      -[ICSHomeDataModel headerCard](self->_homeDataModel, "headerCard");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "storageSummary");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedLongLong:", objc_msgSend(v15, "totalStorageInBytes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE04C90]);

      v17 = (void *)MEMORY[0x24BDD16E0];
      -[ICSHomeDataModel headerCard](self->_homeDataModel, "headerCard");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "storageSummary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v19, "usedStorageInBytes"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE04CA0]);

    }
  }
  else
  {
    -[ICSHeaderSpecifierProvider _fetchStorageSummary:](self, "_fetchStorageSummary:", v4);
  }

  return 0;
}

- (void)_fetchStorageSummary:(id)a3
{
  -[ICSHeaderSpecifierProvider _fetchStorageSummary:completion:](self, "_fetchStorageSummary:completion:", a3, 0);
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
  ICSHomeDataController *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  ICSHeaderSpecifierProvider *v19;
  id v20;
  uint8_t *v21;
  id v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  ICSHomeDataController *v28;
  id location;

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
      _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "Already fetching cloud storage summary. Bailing.", buf, 2u);
    }

    goto LABEL_10;
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
  objc_initWeak(&location, self);
  *(_QWORD *)buf = 0;
  v24 = buf;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v14 = [ICSHomeDataController alloc];
  -[ICSHeaderSpecifierProvider account](self, "account");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = -[ICSHomeDataController initWithAccount:](v14, "initWithAccount:", v15);

  v16 = (void *)*((_QWORD *)v24 + 5);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke;
  v17[3] = &unk_251C61168;
  objc_copyWeak(&v22, &location);
  v21 = buf;
  v18 = v6;
  v19 = self;
  v20 = v7;
  objc_msgSend(v16, "fetchiCloudHomeDataModelAllowingCache:completion:", 1, v17);

  objc_destroyWeak(&v22);
  _Block_object_dispose(buf, 8);

  objc_destroyWeak(&location);
LABEL_10:

}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_39;
    block[3] = &unk_251C61140;
    block[4] = WeakRetained;
    v17 = v5;
    v9 = *(id *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v18 = v9;
    v19 = v10;
    v20 = v6;
    v11 = *(id *)(a1 + 48);
    v12 = *(_QWORD *)(a1 + 56);
    v21 = v11;
    v22 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    LogSubsystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_cold_1(v13);

    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

  }
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_39(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), *(id *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  if (v2)
  {
    objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE04CA8]);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 56));
    objc_msgSend(WeakRetained, "specifierProvider:didFinishLoadingSpecifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48));

  }
  if (*(_QWORD *)(a1 + 40))
  {
    v4 = *(void **)(a1 + 48);
    v5 = *MEMORY[0x24BE04CB0];
    v6 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    LogSubsystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_39_cold_1(a1, v7);

    v4 = *(void **)(a1 + 48);
    v5 = *MEMORY[0x24BE04CB0];
    v6 = MEMORY[0x24BDBD1C8];
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);
  objc_msgSend(*(id *)(a1 + 56), "_reloadStorageSpecifiers");
  v8 = *(_QWORD *)(a1 + 72);
  if (v8)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v8 + 16))(v8, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;

}

- (void)_reloadStorageSpecifiers
{
  void *v3;
  id v4;

  if (self->_storageGraphSpecifier)
  {
    -[ICSHeaderSpecifierProvider delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PSSpecifier identifier](self->_storageGraphSpecifier, "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSpecifierForProvider:identifier:", self, v3);

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
    v7[2] = __69__ICSHeaderSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke;
    v7[3] = &unk_251C60FA8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", CFSTR("QuotaDidChange"), 0, v4, v7);
    v5 = objc_claimAutoreleasedReturnValue();
    quotaChangeNotificationObserver = self->_quotaChangeNotificationObserver;
    self->_quotaChangeNotificationObserver = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __69__ICSHeaderSpecifierProvider__startObservingQuotaChangeNotifications__block_invoke(uint64_t a1)
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
    _os_log_impl(&dword_24B4C1000, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
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

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_storageGraphSpecifier, 0);
  objc_storeStrong((id *)&self->_activeSpecifier, 0);
  objc_storeStrong((id *)&self->_homeDataModel, 0);
  objc_storeStrong((id *)&self->_quotaChangeNotificationObserver, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24B4C1000, log, OS_LOG_TYPE_ERROR, "Missing strongSelf. Stopping fetchCloudStorageSummary flow.", v1, 2u);
}

void __62__ICSHeaderSpecifierProvider__fetchStorageSummary_completion___block_invoke_39_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 64);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch iCloudHome data w/ error: %@", (uint8_t *)&v3, 0xCu);
}

@end
