@implementation ICSAppsSyncingToiCloudViewController

- (ICSAppsSyncingToiCloudViewController)initWithAccountManager:(id)a3
{
  id v4;
  ICSAppsSyncingToiCloudViewController *v5;
  ICSAppsSyncingToiCloudViewController *v6;
  ICSAppsSyncingToDriveSpecifierProvider *v7;
  void *v8;
  uint64_t v9;
  ICSAppsSyncingToDriveSpecifierProvider *appsSyncingToDriveSpecifierProvider;

  v4 = a3;
  v5 = -[ICSDataclassViewController init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[ICSDataclassViewController setAccountManager:](v5, "setAccountManager:", v4);
    v7 = [ICSAppsSyncingToDriveSpecifierProvider alloc];
    -[ICSDataclassViewController accountManager](v6, "accountManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICSAppsSyncingToDriveSpecifierProvider initWithAccountManager:presenter:](v7, "initWithAccountManager:presenter:", v8, v6);
    appsSyncingToDriveSpecifierProvider = v6->_appsSyncingToDriveSpecifierProvider;
    v6->_appsSyncingToDriveSpecifierProvider = (ICSAppsSyncingToDriveSpecifierProvider *)v9;

    -[ICSAppsSyncingToDriveSpecifierProvider setDelegate:](v6->_appsSyncingToDriveSpecifierProvider, "setDelegate:", v6);
  }

  return v6;
}

- (id)account
{
  void *v2;
  void *v3;
  void *v4;

  -[ICSDataclassViewController accountManager](self, "accountManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)dealloc
{
  NSObject *v3;
  ICSAppsSyncingToDriveSpecifierProvider *appsSyncingToDriveSpecifierProvider;
  objc_super v5;
  uint8_t buf[4];
  ICSAppsSyncingToiCloudViewController *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "AAUISyncingToiCloudViewController dealloc %@", buf, 0xCu);
  }

  -[ICSAppsSyncingToDriveSpecifierProvider setDelegate:](self->_appsSyncingToDriveSpecifierProvider, "setDelegate:", 0);
  appsSyncingToDriveSpecifierProvider = self->_appsSyncingToDriveSpecifierProvider;
  self->_appsSyncingToDriveSpecifierProvider = 0;

  v5.receiver = self;
  v5.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  -[ICSDataclassViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  -[ACUIDataclassConfigurationViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  -[ACUIDataclassConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[ICSAppsSyncingToiCloudViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("APPS_SYNCING_TO_ICLOUD_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

}

- (void)setSpecifier:(id)a3
{
  id v4;
  ICSAppsSyncingToDriveSpecifierProvider *v5;
  void *v6;
  ICSAppsSyncingToDriveSpecifierProvider *v7;
  ICSAppsSyncingToDriveSpecifierProvider *appsSyncingToDriveSpecifierProvider;
  void *v9;
  NSObject *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICSAppsSyncingToiCloudViewController;
  -[ICSAppsSyncingToiCloudViewController setSpecifier:](&v11, sel_setSpecifier_, v4);
  v5 = [ICSAppsSyncingToDriveSpecifierProvider alloc];
  -[ICSDataclassViewController accountManager](self, "accountManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICSAppsSyncingToDriveSpecifierProvider initWithAccountManager:presenter:](v5, "initWithAccountManager:presenter:", v6, self);
  appsSyncingToDriveSpecifierProvider = self->_appsSyncingToDriveSpecifierProvider;
  self->_appsSyncingToDriveSpecifierProvider = v7;

  -[ICSAppsSyncingToDriveSpecifierProvider setDelegate:](self->_appsSyncingToDriveSpecifierProvider, "setDelegate:", self);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("icloudAccountManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    -[ICSAppsSyncingToiCloudViewController setSpecifier:].cold.2();
  if (!v9)
  {
    LogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[ICSAppsSyncingToiCloudViewController setSpecifier:].cold.1(v10);

  }
}

- (id)specifiers
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3))
  {
    LogSubsystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "ICSAppsSyncingToiCloudViewController is loading specifiers.", (uint8_t *)&v15, 2u);
    }

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("THIRD_PARTY_APPS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("APPS_SYNCING_TO_ICLOUD_DESC"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setProperty:forKey:", v8, *MEMORY[0x24BE75A68]);

    objc_msgSend(v5, "addObject:", v6);
    if (self->_appsSyncingToDriveSpecifierProvider)
    {
      -[ICSAppsSyncingToiCloudViewController _specifiersForAppsSyncingToDrive](self, "_specifiersForAppsSyncingToDrive");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v9);

    }
    v10 = (objc_class *)objc_msgSend(v5, "copy");
    v11 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = v10;

  }
  LogSubsystem();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
    v15 = 138412290;
    v16 = v13;
    _os_log_impl(&dword_24B4C1000, v12, OS_LOG_TYPE_DEFAULT, "ICSAppsSyncingToiCloudViewController specifiers: returning %@", (uint8_t *)&v15, 0xCu);
  }

  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + v3));
}

- (id)_specifiersForAppsSyncingToDrive
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  if (self->_appsSyncingToDriveSpecifierProvider)
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("APPS SYNCING"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);

    -[ICSAppsSyncingToDriveSpecifierProvider specifiers](self->_appsSyncingToDriveSpecifierProvider, "specifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appsSyncingToDriveSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
}

- (void)setSpecifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_24B4C1000, log, OS_LOG_TYPE_FAULT, "ICSAppsSyncingToiCloudViewController was instantiated without an AIDAAccountManager set on the launching specifier.", v1, 2u);
}

- (void)setSpecifier:.cold.2()
{
  __assert_rtn("-[ICSAppsSyncingToiCloudViewController setSpecifier:]", "ICSAppsSyncingToiCloudViewController.m", 69, "[specifierAccountManager isKindOfClass:[AIDAAccountManager class]]");
}

@end
