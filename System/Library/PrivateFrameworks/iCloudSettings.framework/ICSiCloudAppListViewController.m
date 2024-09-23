@implementation ICSiCloudAppListViewController

- (void)setAccountManager:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICSiCloudAppListViewController;
  -[ICSDataclassViewController setAccountManager:](&v3, sel_setAccountManager_, a3);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  ICSiCloudAppListViewController *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "ICSiCloudAppListViewController dealloc %@", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICSiCloudAppListViewController;
  -[ICSDataclassViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)ICSiCloudAppListViewController;
  -[ACUIDataclassConfigurationViewController viewDidAppear:](&v9, sel_viewDidAppear_, a3);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", CFSTR("settings-navigation://com.apple.Settings.AppleAccount/ICLOUD_SERVICE/com.apple.Dataclass"));
  +[ICSDeviceExpertManager savedToiCloudTitle](ICSDeviceExpertManager, "savedToiCloudTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSDeviceExpertManager appleAccountTitle](ICSDeviceExpertManager, "appleAccountTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  +[ICSDeviceExpertManager iCloudTitle](ICSDeviceExpertManager, "iCloudTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSiCloudAppListViewController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.application-icon.icloud"), v5, v8, v4);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICSiCloudAppListViewController;
  -[ACUIDataclassConfigurationViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[ManageStorageAppsListViewModel fetchAppsListWithFetchHomeViewModel:loadImages:completionHandler:](self->_manageStorageAppsListViewModel, "fetchAppsListWithFetchHomeViewModel:loadImages:completionHandler:", 0, 0, &__block_literal_global_2);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("APP_LIST_VIEW_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSiCloudAppListViewController setTitle:](self, "setTitle:", v4);

}

void __45__ICSiCloudAppListViewController_viewDidLoad__block_invoke()
{
  NSObject *v0;

  LogSubsystem();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __45__ICSiCloudAppListViewController_viewDidLoad__block_invoke_cold_1(v0);

}

- (id)dataClassSpecifierProvider
{
  ICSDataclassSpecifierProvider *dataClassSpecifierProvider;
  void *v4;
  ICSDataclassSpecifierProvider *v5;
  void *v6;
  void *v7;
  void *v8;
  ICSDataclassSpecifierProvider *v9;
  ICSDataclassSpecifierProvider *v10;
  ICSDataclassSpecifierProvider *v11;

  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  if (!dataClassSpecifierProvider)
  {
    -[ICSiCloudAppListViewController homeViewModel](self, "homeViewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v11 = 0;
      return v11;
    }
    v5 = [ICSDataclassSpecifierProvider alloc];
    -[ICSDataclassViewController accountManager](self, "accountManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSiCloudAppListViewController homeViewModel](self, "homeViewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSiCloudAppListViewController manageStorageAppsListViewModel](self, "manageStorageAppsListViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICSDataclassSpecifierProvider initWithAccountManager:presenter:homeViewModel:manageStorageAppsListViewModel:](v5, "initWithAccountManager:presenter:homeViewModel:manageStorageAppsListViewModel:", v6, self, v7, v8);
    v10 = self->_dataClassSpecifierProvider;
    self->_dataClassSpecifierProvider = v9;

    -[ICSDataclassSpecifierProvider setDelegate:](self->_dataClassSpecifierProvider, "setDelegate:", self);
    dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  }
  v11 = dataClassSpecifierProvider;
  return v11;
}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3))
  {
    LogSubsystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "ICSiCloudAppListViewController is loading specifiers.", buf, 2u);
    }

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICSiCloudAppListViewController _specifiersForAppsGroup](self, "_specifiersForAppsGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = (objc_class *)objc_msgSend(v5, "copy");
    v8 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v7;

  }
  if (-[ICSiCloudAppListViewController _shouldDisableiCloudUI](self, "_shouldDisableiCloudUI"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v9 = *(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      v13 = *MEMORY[0x24BE75A18];
      v14 = MEMORY[0x24BDBD1C0];
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v15++), "setObject:forKeyedSubscript:", v14, v13, (_QWORD)v19);
        }
        while (v11 != v15);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v11);
    }

  }
  LogSubsystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(_DWORD *)buf = 138412290;
    v24 = v17;
    _os_log_impl(&dword_24B4C1000, v16, OS_LOG_TYPE_DEFAULT, "ICSiCloudAppListViewController specifiers: returning %@", buf, 0xCu);
  }

  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + v3));
}

- (void)cleanupDataclassSpecifiers
{
  uint64_t v3;
  void *v4;
  NSMutableArray *appSpecifiers;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = 0;

  appSpecifiers = self->_appSpecifiers;
  self->_appSpecifiers = 0;

  -[ICSDataclassSpecifierProvider setSpecifiers:](self->_dataClassSpecifierProvider, "setSpecifiers:", 0);
}

- (id)_specifiersForAppsGroup
{
  NSMutableArray *appSpecifiers;
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;

  appSpecifiers = self->_appSpecifiers;
  if (!appSpecifiers)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[ICSiCloudAppListViewController dataClassSpecifierProvider](self, "dataClassSpecifierProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "specifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v6);

    v7 = (NSMutableArray *)objc_msgSend(v4, "copy");
    v8 = self->_appSpecifiers;
    self->_appSpecifiers = v7;

    appSpecifiers = self->_appSpecifiers;
  }
  return appSpecifiers;
}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  -[ICSiCloudAppListViewController cleanupDataclassSpecifiers](self, "cleanupDataclassSpecifiers", a3, a4, a5);
  -[ICSiCloudAppListViewController reloadSpecifiers](self, "reloadSpecifiers");
}

- (BOOL)_shouldDisableiCloudUI
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;

  -[ICSDataclassViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "aa_needsToVerifyTerms") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[ICSDataclassViewController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "aa_isPrimaryEmailVerified"))
    {
      -[ICSDataclassViewController account](self, "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "aa_suspensionInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v7, "isiCloudSuspended");

    }
    else
    {
      v4 = 1;
    }

  }
  return v4;
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[ICSDataclassViewController activeSpecifier](self, "activeSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (void)accountDidChangeFromAccount:(id)a3 toAccount:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t v26[16];
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)ICSiCloudAppListViewController;
  -[ICSDataclassViewController accountDidChangeFromAccount:toAccount:](&v27, sel_accountDidChangeFromAccount_toAccount_, v6, v7);
  objc_msgSend(v6, "provisionedDataclasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "provisionedDataclasses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    -[ICSiCloudAppListViewController dataClassSpecifierProvider](self, "dataClassSpecifierProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resetAccount");

    -[ICSiCloudAppListViewController cleanupDataclassSpecifiers](self, "cleanupDataclassSpecifiers");
    -[ICSiCloudAppListViewController reloadSpecifiers](self, "reloadSpecifiers");
  }
  objc_msgSend(v6, "enabledDataclasses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enabledDataclasses");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if ((v14 & 1) == 0)
  {
    LogSubsystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v26 = 0;
      _os_log_impl(&dword_24B4C1000, v15, OS_LOG_TYPE_DEFAULT, "Account enabled dataclasses changed. Will reload specifiers.", v26, 2u);
    }

    if (v7)
    {
      v16 = *MEMORY[0x24BDB3E38];
      v17 = objc_msgSend(v6, "isEnabledForDataclass:", *MEMORY[0x24BDB3E38]);
      if (v17 != objc_msgSend(v7, "isEnabledForDataclass:", v16))
      {
        -[ICSiCloudAppListViewController dataClassSpecifierProvider](self, "dataClassSpecifierProvider");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "ubiquitySpecifierProvider");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "ubiquityAccessManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setAppAccessGranted:forBundleID:", objc_msgSend(v7, "isEnabledForDataclass:", v16), CFSTR("com.apple.mobilemail"));

      }
      v21 = *MEMORY[0x24BDB3DB0];
      v22 = objc_msgSend(v6, "isEnabledForDataclass:", *MEMORY[0x24BDB3DB0]);
      if (v22 != objc_msgSend(v7, "isEnabledForDataclass:", v21))
      {
        -[ICSiCloudAppListViewController dataClassSpecifierProvider](self, "dataClassSpecifierProvider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "ubiquitySpecifierProvider");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "ubiquityAccessManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setAppAccessGranted:forBundleID:", objc_msgSend(v7, "isEnabledForDataclass:", v21), CFSTR("com.apple.mobilesafari"));

      }
    }
  }

}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, a3);
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
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_dataClassSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_appSpecifiers, 0);
}

void __45__ICSiCloudAppListViewController_viewDidLoad__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24B4C1000, log, OS_LOG_TYPE_DEBUG, "ICSiCloudAppListViewController: Apps list request complete", v1, 2u);
}

@end
