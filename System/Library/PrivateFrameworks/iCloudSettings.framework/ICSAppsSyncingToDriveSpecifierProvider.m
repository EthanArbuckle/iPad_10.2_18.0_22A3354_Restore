@implementation ICSAppsSyncingToDriveSpecifierProvider

- (ICSAppsSyncingToDriveSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICSAppsSyncingToDriveSpecifierProvider *v9;
  ICSAppsSyncingToDriveSpecifierProvider *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  ICQCloudStorageDataController *datacontroller;
  ICSUbiquitySpecifierProvider *v16;
  ICSUbiquitySpecifierProvider *ubiquitySpecifierProvider;
  NSMutableSet *v18;
  NSMutableSet *serverApps;
  NSMutableSet *v20;
  NSMutableSet *appsSyncingToDriveBundleIDs;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ICSAppsSyncingToDriveSpecifierProvider;
  v9 = -[ICSAppsSyncingToDriveSpecifierProvider init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    v11 = objc_alloc(MEMORY[0x24BEC72A8]);
    -[AIDAAccountManager accounts](v10->_accountManager, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithAccount:", v13);
    datacontroller = v10->_datacontroller;
    v10->_datacontroller = (ICQCloudStorageDataController *)v14;

    v16 = -[ICSUbiquitySpecifierProvider initWithAccountManager:]([ICSUbiquitySpecifierProvider alloc], "initWithAccountManager:", v10->_accountManager);
    ubiquitySpecifierProvider = v10->_ubiquitySpecifierProvider;
    v10->_ubiquitySpecifierProvider = v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    serverApps = v10->_serverApps;
    v10->_serverApps = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    appsSyncingToDriveBundleIDs = v10->_appsSyncingToDriveBundleIDs;
    v10->_appsSyncingToDriveBundleIDs = v20;

    objc_storeWeak((id *)&v10->_listController, v8);
    v10->_isAppsSyncToDriveRequestInProgress = 0;
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

- (NSArray)specifiers
{
  NSArray *v3;
  NSArray *specifiers;

  -[ICSAppsSyncingToDriveSpecifierProvider _specifiersForAppsSyncingToDrive](self, "_specifiersForAppsSyncingToDrive");
  v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
  specifiers = self->_specifiers;
  self->_specifiers = v3;

  return self->_specifiers;
}

- (void)setDelegate:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  id v5;
  id v6;

  p_delegate = &self->_delegate;
  v6 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v6);
  -[ICSUbiquitySpecifierProvider setDelegate:](self->_ubiquitySpecifierProvider, "setDelegate:", v6);

  -[ICSAppsSyncingToDriveSpecifierProvider _fetchServerApps](self, "_fetchServerApps");
}

- (id)_specifiersForAppsSyncingToDrive
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  ICSAppsSyncingToDriveSpecifierProvider *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (-[NSMutableSet count](self->_appsSyncingToDriveBundleIDs, "count"))
  {
    -[ICSUbiquitySpecifierProvider specifiers](self->_ubiquitySpecifierProvider, "specifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x24BDAC760];
    v8 = 3221225472;
    v9 = __74__ICSAppsSyncingToDriveSpecifierProvider__specifiersForAppsSyncingToDrive__block_invoke;
    v10 = &unk_251C60D50;
    v11 = self;
    v12 = v3;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", &v7);

  }
  v5 = (void *)objc_msgSend(v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

void __74__ICSAppsSyncingToDriveSpecifierProvider__specifiersForAppsSyncingToDrive__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v6 = v3;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

}

- (void)_reloadSpecifier
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

- (void)_fetchServerApps
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[NSMutableSet removeAllObjects](self->_serverApps, "removeAllObjects");
  self->_isAppsSyncToDriveRequestInProgress = 1;
  v3 = objc_alloc(MEMORY[0x24BEC72A8]);
  -[ICSAppsSyncingToDriveSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAccount:", v4);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke;
  v6[3] = &unk_251C60DF0;
  v6[4] = self;
  objc_msgSend(v5, "fetchAppsSyncingToiCloudDriveWithCompletion:", v6);

}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[5];
  _QWORD v13[5];
  _QWORD v14[5];
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeAllObjects");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  LogSubsystem();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_cold_1((uint64_t)v6, v8);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v5;
      _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "Apps Syncing To Drive : %@", buf, 0xCu);
    }

    objc_msgSend(v5, "apps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_31;
    v14[3] = &unk_251C60D78;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_33;
    v13[3] = &unk_251C60DA0;
    v13[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v13);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "intersectSet:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_2;
    block[3] = &unk_251C60DC8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogSubsystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v5;
    _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "App from server %@", (uint8_t *)&v10, 0xCu);

  }
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v3, "containerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v3, "bundleIds");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v9);

}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_33(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(a2, "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSpecifier");
}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appsSyncingToDriveBundleIDs, 0);
  objc_storeStrong((id *)&self->_serverApps, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_datacontroller, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __58__ICSAppsSyncingToDriveSpecifierProvider__fetchServerApps__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "Apps Syncing To Drive error : %@", (uint8_t *)&v2, 0xCu);
}

@end
