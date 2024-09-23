@implementation ICSDataclassDetailSpecifierProvider

- (ICSDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3
{
  return -[ICSDataclassDetailSpecifierProvider initWithAccountManager:presenter:](self, "initWithAccountManager:presenter:", a3, 0);
}

- (ICSDataclassDetailSpecifierProvider)initWithAccountManager:(id)a3 presenter:(id)a4
{
  id v7;
  id v8;
  ICSDataclassDetailSpecifierProvider *v9;
  ICSDataclassDetailSpecifierProvider *v10;
  _TtC14iCloudSettings22ICSAnalyticsController *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _TtC14iCloudSettings22ICSAnalyticsController *analyticsController;
  void *v16;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)ICSDataclassDetailSpecifierProvider;
  v9 = -[ICSDataclassDetailSpecifierProvider init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accountManager, a3);
    objc_storeWeak((id *)&v10->_presenter, v8);
    *(_QWORD *)&v10->_isStorageUsedRequestInProgress = 0xFFFFFFFF00000000;
    v11 = [_TtC14iCloudSettings22ICSAnalyticsController alloc];
    objc_msgSend(v7, "accounts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ICSAnalyticsController initWithAccount:](v11, "initWithAccount:", v13);
    analyticsController = v10->_analyticsController;
    v10->_analyticsController = (_TtC14iCloudSettings22ICSAnalyticsController *)v14;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v10, sel__fetchStorageUsedAndRefreshSpecifier, *MEMORY[0x24BEC7230], 0);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICSDataclassDetailSpecifierProvider;
  -[ICSDataclassDetailSpecifierProvider dealloc](&v4, sel_dealloc);
}

- (void)setDataclass:(id)a3
{
  AAUISpecifierProvider *v5;
  AAUISpecifierProvider *healthSpecifierProvider;
  id v7;

  v7 = a3;
  objc_storeStrong((id *)&self->_dataclass, a3);
  if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3E18]))
  {
    -[ICSDataclassDetailSpecifierProvider _loadHealthSpecifierProvider](self, "_loadHealthSpecifierProvider");
    v5 = (AAUISpecifierProvider *)objc_claimAutoreleasedReturnValue();
    healthSpecifierProvider = self->_healthSpecifierProvider;
    self->_healthSpecifierProvider = v5;

  }
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

- (void)setSpecifiers:(id)a3
{
  NSArray *v4;
  ICQAppCloudStorage *appCloudStorage;
  NSArray *specifiers;

  v4 = (NSArray *)a3;
  appCloudStorage = self->_appCloudStorage;
  self->_appCloudStorage = 0;

  specifiers = self->_specifiers;
  self->_specifiers = v4;

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSArray *v10;
  NSArray *v11;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if (self->_dataclass)
    {
      v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      -[ICSDataclassDetailSpecifierProvider _headerGroupSpecifiers](self, "_headerGroupSpecifiers");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v5);

      -[ICSDataclassDetailSpecifierProvider _storageUsedGroupSpecifiers](self, "_storageUsedGroupSpecifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v6);

      if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3EC8]))
      {
        -[ICSDataclassDetailSpecifierProvider account](self, "account");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEnabledForDataclass:", self->_dataclass);

        if (v8)
        {
          -[ICSDataclassDetailSpecifierProvider _syncingToDriveGroupSpecifiers](self, "_syncingToDriveGroupSpecifiers");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObjectsFromArray:", v9);

        }
      }
      v10 = (NSArray *)objc_msgSend(v4, "copy");
      v11 = self->_specifiers;
      self->_specifiers = v10;

      specifiers = self->_specifiers;
    }
    else
    {
      specifiers = 0;
    }
  }
  return specifiers;
}

- (id)_headerGroupSpecifiers
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
  void *v15;
  void *v16;
  ICSUbiquitySpecifierProvider *v17;
  ICSUbiquitySpecifierProvider *ubiquitySpecifierProvider;
  id WeakRetained;
  void *v20;
  uint64_t v21;
  void *v22;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATACLASS_HEADER_GROUP"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v5 = (void *)MEMORY[0x24BE75590];
  -[ICSDataclassDetailSpecifierProvider _specifierTitle](self, "_specifierTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, 0, 0, -1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  -[ICSDataclassDetailSpecifierProvider _specifierTitle](self, "_specifierTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v8, *MEMORY[0x24BE75D50]);

  -[ICSDataclassDetailSpecifierProvider _specifierSubTitle](self, "_specifierSubTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75D28]);

  -[ICSDataclassDetailSpecifierProvider _specifierAttributedLink](self, "_specifierAttributedLink");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v10, CFSTR("AAUIDataclassAttributedLink"));

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("AAUIDataclassAttributedLinkText"));

  objc_msgSend(v7, "setProperty:forKey:", &unk_251C83CB8, *MEMORY[0x24BE75860]);
  -[ICSDataclassDetailSpecifierProvider _iconForDataclass:](self, "_iconForDataclass:", self->_dataclass);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperty:forKey:", v13, *MEMORY[0x24BE75AC8]);

  objc_msgSend(v3, "addObject:", v7);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DATACLASS_CELL_TITLE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3EC8]))
  {
    v17 = -[ICSUbiquitySpecifierProvider initWithAccountManager:]([ICSUbiquitySpecifierProvider alloc], "initWithAccountManager:", self->_accountManager);
    ubiquitySpecifierProvider = self->_ubiquitySpecifierProvider;
    self->_ubiquitySpecifierProvider = v17;

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[ICSUbiquitySpecifierProvider setDelegate:](self->_ubiquitySpecifierProvider, "setDelegate:", WeakRetained);

    -[ICSUbiquitySpecifierProvider setUbiquityDelegate:](self->_ubiquitySpecifierProvider, "setUbiquityDelegate:", self);
    -[ICSUbiquitySpecifierProvider ubiquityDataclassSwitchSpecifier](self->_ubiquitySpecifierProvider, "ubiquityDataclassSwitchSpecifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      goto LABEL_6;
    goto LABEL_9;
  }
  v21 = *MEMORY[0x24BDB3E18];
  if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3E18]))
  {
    -[ICSDataclassDetailSpecifierProvider _specifierForHealth](self, "_specifierForHealth");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setName:", v16);
    if (!v20)
    {
LABEL_6:
      v21 = *MEMORY[0x24BDB3E18];
      goto LABEL_7;
    }
LABEL_9:
    objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
    objc_msgSend(v3, "addObject:", v20);

    goto LABEL_10;
  }
LABEL_7:
  if (!-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", v21))
  {
    -[ICSDataclassDetailSpecifierProvider _switchSpecifierWithTitle:](self, "_switchSpecifierWithTitle:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      goto LABEL_9;
  }
LABEL_10:
  v22 = (void *)objc_msgSend(v3, "copy");

  return v22;
}

- (id)_switchSpecifierWithTitle:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", a3, self, sel__setValue_forSpecifier_, sel__toggleValue_, 0, 6, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ICSDataclassDetailSpecifierProvider isDataclassLDMDisabled](self, "isDataclassLDMDisabled") ^ 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x24BE75A18]);

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_dataclass, *MEMORY[0x24BE75AC0]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_dataclass, CFSTR("com.apple.accountsui.dataclass"));
  return v4;
}

- (BOOL)isDataclassLDMDisabled
{
  void *v3;
  int v4;

  objc_msgSend(MEMORY[0x24BE60C28], "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enabled");

  return v4 && -[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB45F0]);
}

- (id)_iconForDataclass:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = *MEMORY[0x24BDB3E18];
  if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3E18])
    && (objc_msgSend(MEMORY[0x24BE04948], "sharedManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "appIsNeitherInstalledOrPlaceholder:", v5),
        v6,
        v7))
  {
    objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageForKey:", *MEMORY[0x24BE757D8]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appBundleIdentifierForDataclass:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "imageForDataclassWithBundleID:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BE75590], "acui_iconForDataclass:", self->_dataclass);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_storageUsedGroupSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STORAGE_USED"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel__fetchStorageUsed_, 0, -1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  -[ICSDataclassDetailSpecifierProvider _setupStorageUsedSpecifier:](self, "_setupStorageUsedSpecifier:", v6);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATACLASS_STORAGE_USED_GROUP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_setupStorageUsedSpecifier:(id)a3
{
  id v4;
  ICQAppCloudStorage *appCloudStorage;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  appCloudStorage = self->_appCloudStorage;
  if (appCloudStorage)
  {
    -[ICQAppCloudStorage storageUsed](appCloudStorage, "storageUsed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longLongValue");

    if (v7 < 1)
    {
      objc_msgSend(v4, "setCellType:", -1);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
    }
    else
    {
      objc_msgSend(v4, "setCellType:", 2);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
      if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3E48]))
      {
        objc_msgSend(v4, "setDetailControllerClass:", -[ICSDataclassDetailSpecifierProvider _cloudMessageDetailControllerClass](self, "_cloudMessageDetailControllerClass"));
      }
      else
      {
        if (-[NSString isEqualToString:](self->_dataclass, "isEqualToString:", *MEMORY[0x24BDB3E18]))
        {
          v12 = 0;
          v13 = &v12;
          v14 = 0x2050000000;
          v9 = (void *)getHKHealthManageStorageViewControllerClass_softClass;
          v15 = getHKHealthManageStorageViewControllerClass_softClass;
          if (!getHKHealthManageStorageViewControllerClass_softClass)
          {
            v11[0] = MEMORY[0x24BDAC760];
            v11[1] = 3221225472;
            v11[2] = __getHKHealthManageStorageViewControllerClass_block_invoke;
            v11[3] = &unk_251C61100;
            v11[4] = &v12;
            __getHKHealthManageStorageViewControllerClass_block_invoke((uint64_t)v11);
            v9 = (void *)v13[3];
          }
          v10 = objc_retainAutorelease(v9);
          _Block_object_dispose(&v12, 8);
          objc_msgSend(v4, "setDetailControllerClass:", v10);
        }
        objc_msgSend(v4, "setControllerLoadAction:", sel__storageUsedWasTapped_);
      }
    }
  }
  else
  {
    objc_msgSend(v4, "setCellType:", 2);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !self->_storageUsedRequestDidError);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BE75998]);

  }
}

- (void)_setupAppsSyncingToDriveSpecifier:(id)a3
{
  id v4;
  int numberOfAppsSyncingToDrive;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v4 = a3;
  numberOfAppsSyncingToDrive = self->_numberOfAppsSyncingToDrive;
  v10 = v4;
  if (numberOfAppsSyncingToDrive < 1)
  {
    v8 = *MEMORY[0x24BE75A18];
    if (numberOfAppsSyncingToDrive)
    {
      objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], v8);
      objc_msgSend(v10, "setCellType:", 2);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", !self->_appsSyncingToDriveRequestDidError);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75998]);

      goto LABEL_6;
    }
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], v8);
    v6 = v10;
    v7 = -1;
  }
  else
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    v6 = v10;
    v7 = 2;
  }
  objc_msgSend(v6, "setCellType:", v7);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75998]);
LABEL_6:

}

- (id)_syncingToDriveGroupSpecifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  if (!-[ICSDataclassDetailSpecifierProvider _shouldShowSyncingToDriveGroupSpecifier](self, "_shouldShowSyncingToDriveGroupSpecifier"))return MEMORY[0x24BDBD1A8];
  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("APPS_SYNCING_TO_DRIVE_SPECIFIER_NAME"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel__fetchNumberOfAppsSyncingToDrive_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  -[ICSDataclassDetailSpecifierProvider _setupAppsSyncingToDriveSpecifier:](self, "_setupAppsSyncingToDriveSpecifier:", v6);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_accountManager, CFSTR("icloudAccountManager"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("DATACLASS_DRIVE_GROUP"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldShowSyncingToDriveGroupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldShowDataclass:forAccount:", self->_dataclass, v4))
    v6 = objc_msgSend(v4, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);
  else
    v6 = 0;

  return v6;
}

- (id)_toggleValue:(id)a3
{
  id v4;
  id WeakRetained;
  char v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0
    && (v7 = objc_loadWeakRetained((id *)&self->_delegate),
        v8 = objc_msgSend(v7, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4),
        v7,
        v8))
  {
    v9 = (void *)MEMORY[0x24BDD16E0];
    -[ICSDataclassDetailSpecifierProvider account](self, "account");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithBool:", objc_msgSend(v10, "isEnabledForDataclass:", self->_dataclass));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v11;
}

- (id)_specifierTitle
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[ICSDataclassHelper localizedTitleForDataclass:](ICSDataclassHelper, "localizedTitleForDataclass:", self->_dataclass);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNDEFINED_DATACLASS"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_specifierSubTitle
{
  void *v3;
  uint64_t v4;
  NSString *dataclass;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[ICSDataclassDetailSpecifierProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ams_securityLevel");

  dataclass = self->_dataclass;
  -[ICSDataclassDetailSpecifierProvider account](self, "account");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSDataclassHelper localizedSubTitleForDataclass:idmsAccount:securityLevel:](ICSDataclassHelper, "localizedSubTitleForDataclass:idmsAccount:securityLevel:", dataclass, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("UNDEFINED_DATACLASS"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_specifierAttributedLink
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  +[ICSDataclassHelper attributedLinkForDataclass:](ICSDataclassHelper, "attributedLinkForDataclass:", self->_dataclass);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNDEFINED_DATACLASS"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)_fetchNumberOfAppsSyncingToDrive:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v4 = a3;
  if (self->_appsSyncingToDrive)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", CFSTR("%d"), self->_numberOfAppsSyncingToDrive);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_isAppsSyncingToDriveRequestInProgress && !self->_appsSyncingToDriveRequestDidError)
    {
      self->_isAppsSyncingToDriveRequestInProgress = 1;
      v6 = objc_alloc(MEMORY[0x24BEC72A8]);
      -[ICSDataclassDetailSpecifierProvider account](self, "account");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithAccount:", v7);

      objc_msgSend(v8, "setShouldIgnoreCache:", 1);
      v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v10 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke;
      v14[3] = &unk_251C61088;
      v14[4] = self;
      v15 = v9;
      v16 = v10;
      v17 = v4;
      v11 = v10;
      v12 = v9;
      objc_msgSend(v8, "fetchAppsSyncingToiCloudDriveWithCompletion:", v14);

    }
    v5 = 0;
  }

  return v5;
}

void __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD block[5];
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a2;
  v7 = a3;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 0;
  v8 = MEMORY[0x24BDAC760];
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 67) = 1;
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 32), a2);
    objc_msgSend(v6, "apps");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_2;
    v14[3] = &unk_251C60D78;
    v15 = *(id *)(a1 + 40);
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

    v10 = *(void **)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "appsUsingUbiquity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObjectsFromArray:", v11);

    objc_msgSend(*(id *)(a1 + 48), "intersectSet:", *(_QWORD *)(a1 + 40));
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 68) = objc_msgSend(*(id *)(a1 + 48), "count");

  }
  block[0] = v8;
  block[1] = 3221225472;
  block[2] = __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_3;
  block[3] = &unk_251C61060;
  block[4] = *(_QWORD *)(a1 + 32);
  v13 = *(id *)(a1 + 56);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "containerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "bundleIds");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "addObjectsFromArray:", v7);
}

void __72__ICSDataclassDetailSpecifierProvider__fetchNumberOfAppsSyncingToDrive___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setupAppsSyncingToDriveSpecifier:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "reloadSpecifierForProvider:identifier:", *(_QWORD *)(a1 + 32), CFSTR("DATACLASS_DRIVE_GROUP"));

}

- (id)_fetchStorageUsed:(id)a3
{
  id v4;
  ICQAppCloudStorage *appCloudStorage;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  appCloudStorage = self->_appCloudStorage;
  if (appCloudStorage)
  {
    -[ICQAppCloudStorage storageUsed](appCloudStorage, "storageUsed");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "longLongValue");

    NSLocalizedFileSizeDescription();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!self->_isStorageUsedRequestInProgress && !self->_storageUsedRequestDidError)
    {
      self->_isStorageUsedRequestInProgress = 1;
      self->_storageUsedRequestDidError = 0;
      v8 = objc_alloc(MEMORY[0x24BEC72A8]);
      -[ICSDataclassDetailSpecifierProvider account](self, "account");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithAccount:", v9);

      objc_msgSend(v10, "setShouldIgnoreCache:", 1);
      objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appBundleIdentifierForDataclass:", self->_dataclass);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke;
      v14[3] = &unk_251C610B0;
      v14[4] = self;
      v15 = v4;
      objc_msgSend(v10, "fetchStorageByApp:completion:", v12, v14);

    }
    v7 = 0;
  }

  return v7;
}

void __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a2;
  v7 = a3;
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_cold_1((uint64_t)v6, (uint64_t)v7, v8);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  v9 = *(_QWORD *)(a1 + 32);
  if (v7)
    *(_BYTE *)(v9 + 66) = 1;
  else
    objc_storeStrong((id *)(v9 + 24), a2);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_91;
  v11[3] = &unk_251C61060;
  v10 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v10;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_91(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "_setupStorageUsedSpecifier:", *(_QWORD *)(a1 + 40));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 80));
  objc_msgSend(WeakRetained, "reloadSpecifierForProvider:identifier:", *(_QWORD *)(a1 + 32), CFSTR("DATACLASS_STORAGE_USED_GROUP"));

}

- (void)_fetchStorageUsedAndRefreshSpecifier
{
  NSObject *v3;
  NSArray *specifiers;
  void *v5;
  ICQAppCloudStorage *appCloudStorage;
  id v7;
  uint8_t v8[16];

  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "_fetchStorageUsedAndRefreshSpecifier", v8, 2u);
  }

  specifiers = self->_specifiers;
  if (specifiers)
  {
    -[NSArray specifierForID:](specifiers, "specifierForID:", CFSTR("DATACLASS_STORAGE_USED_GROUP"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      appCloudStorage = self->_appCloudStorage;
      self->_appCloudStorage = 0;

      v7 = -[ICSDataclassDetailSpecifierProvider _fetchStorageUsed:](self, "_fetchStorageUsed:", v5);
    }

  }
}

- (void)_setValue:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id WeakRetained;
  void *v11;
  char v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, int);
  void *v17;
  id v18;
  id v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BE75AC0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *MEMORY[0x24BDB3E18]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = WeakRetained;
  if (v9)
  {
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      v13 = objc_loadWeakRetained((id *)&self->_delegate);
      v14 = MEMORY[0x24BDAC760];
      v15 = 3221225472;
      v16 = __62__ICSDataclassDetailSpecifierProvider__setValue_forSpecifier___block_invoke;
      v17 = &unk_251C610D8;
      v18 = v7;
      v19 = v6;
      objc_msgSend(v13, "validateDataclassAccessForProvider:specifier:completion:", self, v18, &v14);

    }
  }
  else
  {
    objc_msgSend(WeakRetained, "specifierProvider:dataclassSwitchStateDidChange:withSpecifier:", self, v6, v7);

  }
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", v8, 0, objc_msgSend(v6, "BOOLValue", v14, v15, v16, v17));

}

uint64_t __62__ICSDataclassDetailSpecifierProvider__setValue_forSpecifier___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "ics_performSuperSetterWithValue:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_storageUsedWasTapped:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  ICSManageStorageDrilldownController *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  ICSManageStorageDrilldownController *v11;
  ICSManageStorageDrilldownController *manageStorageController;
  id v13;

  v4 = (void *)MEMORY[0x24BE04948];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appBundleIdentifierForDataclass:", self->_dataclass);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v7 = [ICSManageStorageDrilldownController alloc];
  -[ICSDataclassDetailSpecifierProvider account](self, "account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_msgSend(WeakRetained, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[ICSManageStorageDrilldownController initWithAppBundleID:account:navigationController:](v7, "initWithAppBundleID:account:navigationController:", v13, v8, v10);
  manageStorageController = self->_manageStorageController;
  self->_manageStorageController = v11;

  -[ICSManageStorageDrilldownController beginLoadingForSpecifier:](self->_manageStorageController, "beginLoadingForSpecifier:", v5);
}

- (id)_specifierForHealth
{
  void *v3;
  void *v4;

  -[AAUISpecifierProvider specifiers](self->_healthSpecifierProvider, "specifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ics_overrideAccessorsWithTarget:getter:setter:", self, sel__specifierSwitchState_, sel__setValue_forSpecifier_);
  return v4;
}

- (id)_specifierSwitchState:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(WeakRetained, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4))
  {
    objc_msgSend(v4, "ics_performSuperGetter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v6;
}

- (id)_loadHealthSpecifierProvider
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "ics_loadBundle:atPath:", CFSTR("HealthDataclassOwnerPlugin.bundle"), CFSTR("System/Library/Accounts/DataclassOwners"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSDataclassDetailSpecifierProvider loadSpecifierProviderWithClassName:inBundle:](self, "loadSpecifierProviderWithClassName:inBundle:", CFSTR("HKHealthDataclassSpecifierProvider"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)loadSpecifierProviderWithClassName:(id)a3 inBundle:(id)a4
{
  objc_class *v5;
  void *v6;
  id WeakRetained;

  v5 = NSClassFromString((NSString *)a3);
  if (-[objc_class conformsToProtocol:](v5, "conformsToProtocol:", &unk_2579C6E98))
  {
    v6 = (void *)objc_msgSend([v5 alloc], "initWithAccountManager:", self->_accountManager);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "setDelegate:", WeakRetained);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (Class)_cloudMessageDetailControllerClass
{
  id v2;

  v2 = (id)objc_msgSend(MEMORY[0x24BDD1488], "ics_loadBundle:atPath:", CFSTR("CKStoragePlugin.bundle"), CFSTR("System/Library/PreferenceBundles/StoragePlugins"));
  return NSClassFromString(CFSTR("CKCloudMessagesDetailController"));
}

- (id)ubiquityProviderGetAccountOperationsHelper
{
  UIViewController **p_presenter;
  id WeakRetained;
  char isKindOfClass;
  id v5;
  void *v6;

  p_presenter = &self->_presenter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v5 = objc_loadWeakRetained((id *)p_presenter);
    objc_msgSend(v5, "accountOperationsHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)ubiquityProviderShowViewController:(id)a3
{
  AAUISpecifierProviderDelegate **p_delegate;
  id v5;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, v5);

}

- (AAUISpecifierProviderDelegate)delegate
{
  return (AAUISpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)dataclass
{
  return self->_dataclass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataclass, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_healthSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_manageStorageController, 0);
  objc_storeStrong((id *)&self->_appsSyncingToDrive, 0);
  objc_storeStrong((id *)&self->_appCloudStorage, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

void __57__ICSDataclassDetailSpecifierProvider__fetchStorageUsed___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_24B4C1000, log, OS_LOG_TYPE_DEBUG, "Fetched storage used: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

@end
