@implementation ICSHomeViewControllerLegacy

- (ICSHomeViewControllerLegacy)init
{
  ICSHomeViewControllerLegacy *v2;
  uint64_t v3;
  NSSet *mainViewDataclasses;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICSHomeViewControllerLegacy;
  v2 = -[ICSDataclassViewController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDB3E78], *MEMORY[0x24BDB3EC8], *MEMORY[0x24BDB3E38], *MEMORY[0x24BDB3E30], *MEMORY[0x24BDB3DA8], 0);
    v3 = objc_claimAutoreleasedReturnValue();
    mainViewDataclasses = v2->_mainViewDataclasses;
    v2->_mainViewDataclasses = (NSSet *)v3;

  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICSHomeViewControllerLegacy;
  -[ACUIDataclassConfigurationViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[ICSHomeViewControllerLegacy navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SERVICE_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "ICSHomeViewControllerLegacy dealloc.", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)ICSHomeViewControllerLegacy;
  -[ICSDataclassViewController dealloc](&v4, sel_dealloc);
}

- (Class)accountInfoControllerClass
{
  if (-[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount"))
    -[ICSHomeViewControllerLegacy _loadMailSettingsBundleIfNeeded](self, "_loadMailSettingsBundleIfNeeded");
  return NSClassFromString(CFSTR("AccountPSDetailController"));
}

- (BOOL)shouldEnableAccountSummaryCell
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled");
  if (v3)
    LOBYTE(v3) = -[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount");
  return v3;
}

- (void)_loadMailSettingsBundleIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  MEMORY[0x24BD22FA0](self, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("System/Library/PreferenceBundles/AccountSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("MailAccountSettings.bundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isLoaded") & 1) == 0)
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Mail settings bundle not loaded. Loading...", v7, 2u);
    }

    objc_msgSend(v5, "load");
  }

}

- (void)setAccountManager:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICSHomeViewControllerLegacy setAccountManager:].cold.1(v5);

  v6.receiver = self;
  v6.super_class = (Class)ICSHomeViewControllerLegacy;
  -[ICSDataclassViewController setAccountManager:](&v6, sel_setAccountManager_, v4);

  -[ICSHomeViewControllerLegacy _initiateSpecifiers](self, "_initiateSpecifiers");
}

- (BOOL)isSecondaryAccount
{
  void *v3;
  int v4;
  void *v5;

  -[ICSDataclassViewController account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "aa_isAccountClass:", *MEMORY[0x24BE047F0]) & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    -[ICSDataclassViewController account](self, "account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "aa_isManagedAppleID") ^ 1;

  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ICSHomeViewControllerLegacy;
  -[ICSHomeViewControllerLegacy traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[ICSHomeViewControllerLegacy reloadSpecifiers](self, "reloadSpecifiers");
}

- (void)_initiateSpecifiers
{
  ICSHeaderSpecifierProvider *v3;
  void *v4;
  AAUISpecifierProvider *v5;
  AAUISpecifierProvider *headerSpecifierProvider;
  ICSBackupSpecifierProvider *v7;
  void *v8;
  AAUISpecifierProvider *v9;
  AAUISpecifierProvider *backupSpecifierProvider;
  ICSDataclassSpecifierProvider *v11;
  void *v12;
  AAUISpecifierProvider *v13;
  AAUISpecifierProvider *dataClassSpecifierProvider;

  v3 = [ICSHeaderSpecifierProvider alloc];
  -[ICSDataclassViewController accountManager](self, "accountManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICSHeaderSpecifierProvider initWithAccountManager:presenter:](v3, "initWithAccountManager:presenter:", v4, self);
  headerSpecifierProvider = self->_headerSpecifierProvider;
  self->_headerSpecifierProvider = v5;

  -[AAUISpecifierProvider setDelegate:](self->_headerSpecifierProvider, "setDelegate:", self);
  if (!objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled")
    || !-[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount"))
  {
    v7 = [ICSBackupSpecifierProvider alloc];
    -[ICSDataclassViewController accountManager](self, "accountManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[ICSBackupSpecifierProvider initWithAccountManager:presenter:](v7, "initWithAccountManager:presenter:", v8, self);
    backupSpecifierProvider = self->_backupSpecifierProvider;
    self->_backupSpecifierProvider = v9;

    -[AAUISpecifierProvider setDelegate:](self->_backupSpecifierProvider, "setDelegate:", self);
  }
  v11 = [ICSDataclassSpecifierProvider alloc];
  -[ICSDataclassViewController accountManager](self, "accountManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICSDataclassSpecifierProvider initWithAccountManager:presenter:homeViewModel:manageStorageAppsListViewModel:](v11, "initWithAccountManager:presenter:homeViewModel:manageStorageAppsListViewModel:", v12, self, 0, 0);
  dataClassSpecifierProvider = self->_dataClassSpecifierProvider;
  self->_dataClassSpecifierProvider = v13;

  -[AAUISpecifierProvider setDelegate:](self->_dataClassSpecifierProvider, "setDelegate:", self);
}

- (void)_cleanupAllSpecifiers
{
  -[ICSHomeViewControllerLegacy cleanupDataclassSpecifiers](self, "cleanupDataclassSpecifiers");
  -[ICSHomeViewControllerLegacy _cleanupiCloudSpecifiers](self, "_cleanupiCloudSpecifiers");
}

- (void)cleanupDataclassSpecifiers
{
  NSArray *deviceBackupSpecifiers;
  uint64_t v4;
  void *v5;

  -[AAUISpecifierProvider setSpecifiers:](self->_backupSpecifierProvider, "setSpecifiers:", 0);
  deviceBackupSpecifiers = self->_deviceBackupSpecifiers;
  self->_deviceBackupSpecifiers = 0;

  -[AAUISpecifierProvider setSpecifiers:](self->_dataClassSpecifierProvider, "setSpecifiers:", 0);
  v4 = (int)*MEMORY[0x24BE756E0];
  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4) = 0;

}

- (void)_cleanupiCloudSpecifiers
{
  uint64_t v3;
  void *v4;

  -[AAUISpecifierProvider setSpecifiers:](self->_headerSpecifierProvider, "setSpecifiers:", 0);
  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v3) = 0;

}

- (id)specifiers
{
  NSObject *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_class *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[8];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_24B4C1000, v3, OS_LOG_TYPE_DEFAULT, "updating the specifiers in the iCloudVC", buf, 2u);
  }

  v4 = (int)*MEMORY[0x24BE756E0];
  if (!*(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4))
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (!objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled")
      || !-[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount"))
    {
      -[AAUISpecifierProvider specifiers](self->_headerSpecifierProvider, "specifiers");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      if (v7)
      {
        -[AAUISpecifierProvider specifiers](self->_headerSpecifierProvider, "specifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v8);

      }
    }
    -[ICSDataclassViewController account](self, "account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (!objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled")
        || !-[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount"))
      {
LABEL_15:
        -[AAUISpecifierProvider specifiers](self->_dataClassSpecifierProvider, "specifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v20);

        -[ICSHomeViewControllerLegacy _iCloudBackupSpecifiers](self, "_iCloudBackupSpecifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v21);

        -[ICSDataclassViewController account](self, "account");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          if (!objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled")
            || !-[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount"))
          {
            goto LABEL_23;
          }
          objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("accountSettingsSpecifier"));
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v23);
          -[ACUIDataclassConfigurationViewController specifierForAccountSettingsCell](self, "specifierForAccountSettingsCell");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v24);

          -[AAUISpecifierProvider specifiers](self->_headerSpecifierProvider, "specifiers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "count");

          if (v26)
          {
            -[AAUISpecifierProvider specifiers](self->_headerSpecifierProvider, "specifiers");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v27);

          }
        }
        else
        {
          LogSubsystem();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[ICSHomeViewControllerLegacy specifiers].cold.1(v23, v28, v29, v30, v31, v32, v33, v34);
        }

LABEL_23:
        v35 = (objc_class *)objc_msgSend(v5, "copy");
        v36 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);
        *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4) = v35;

        goto LABEL_24;
      }
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSHomeViewControllerLegacy groupSpecifierAccountSummary](self, "groupSpecifierAccountSummary");
      v11 = objc_claimAutoreleasedReturnValue();

      -[ACUIDataclassConfigurationViewController specifierForAccountSummaryCell](self, "specifierForAccountSummaryCell");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v11);
      objc_msgSend(v5, "addObject:", v12);

    }
    else
    {
      LogSubsystem();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICSHomeViewControllerLegacy specifiers].cold.2(v11, v13, v14, v15, v16, v17, v18, v19);
    }

    goto LABEL_15;
  }
LABEL_24:
  if (-[ICSHomeViewControllerLegacy _shouldDisableiCloudUI](self, "_shouldDisableiCloudUI"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = *(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v4);
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v46;
      v41 = *MEMORY[0x24BE75A18];
      v42 = MEMORY[0x24BDBD1C0];
      do
      {
        v43 = 0;
        do
        {
          if (*(_QWORD *)v46 != v40)
            objc_enumerationMutation(v37);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * v43++), "setObject:forKeyedSubscript:", v42, v41, (_QWORD)v45);
        }
        while (v39 != v43);
        v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      }
      while (v39);
    }

  }
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                                 + v4));
}

- (id)groupSpecifierAccountSummary
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
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  NSRange v24;

  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", CFSTR("identifier"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICSHomeViewControllerLegacy isSecondaryAccount](self, "isSecondaryAccount")
    && objc_msgSend(MEMORY[0x24BE04D08], "isAccountDataclassListRedesignEnabled"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("PASSWORD_CHANGE_LABEL_SECONDARY_ACCOUNT"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("CHANGE_PASSWORD_LINK_SECONDARY_ACCOUNT");
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("PASSWORD_CHANGE_LABEL"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CHANGE_PASSWORD_LINK"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@"), v15, v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = CFSTR("CHANGE_PASSWORD_LINK");
  }
  objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24.location = objc_msgSend(v9, "rangeOfString:", v18);
  NSStringFromRange(v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v19, *MEMORY[0x24BE75A40]);

  objc_msgSend(v3, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v21, *MEMORY[0x24BE75A30]);

  objc_msgSend(v3, "setProperty:forKey:", v9, *MEMORY[0x24BE75A58]);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", self);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v22, *MEMORY[0x24BE75A50]);

  objc_msgSend(v3, "setProperty:forKey:", CFSTR("_changePasswordLinkWasTapped"), *MEMORY[0x24BE75A38]);
  return v3;
}

- (void)_changePasswordLinkWasTapped
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://appleid.apple.com"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "openURL:withCompletionHandler:", v3, 0);

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

- (id)_iCloudBackupSpecifiers
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *deviceBackupSpecifiers;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  if (!self->_deviceBackupSpecifiers)
  {
    -[AAUISpecifierProvider specifiers](self->_backupSpecifierProvider, "specifiers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      v5 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DEVICE_BACKUP_GROUP_NAME"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "groupSpecifierWithName:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v14[0] = v8;
      -[AAUISpecifierProvider specifiers](self->_backupSpecifierProvider, "specifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[1] = v10;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
      v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
      deviceBackupSpecifiers = self->_deviceBackupSpecifiers;
      self->_deviceBackupSpecifiers = v11;

    }
  }
  return self->_deviceBackupSpecifiers;
}

- (BOOL)shouldDeferPushForSpecifierID:(id)a3 urlDictionary:(id)a4
{
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  BOOL v9;
  int v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  LogSubsystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ICSHomeViewControllerLegacy navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("NO");
    if (!v6)
      v7 = CFSTR("YES");
    v11 = 138412290;
    v12 = v7;
    _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, "shouldDeferPush? %@", (uint8_t *)&v11, 0xCu);

  }
  -[ICSHomeViewControllerLegacy navigationController](self, "navigationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8 == 0;

  return v9;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  LogSubsystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[ICSHomeViewControllerLegacy handleURL:withCompletion:]";
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "%s handleURL with dictionary - %@", buf, 0x16u);
  }

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("showiCloudDetails"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSHomeViewControllerLegacy setShouldShowiCloudDetails:](self, "setShouldShowiCloudDetails:", v9 != 0);

  if (-[ICSHomeViewControllerLegacy _canHandleURL:](self, "_canHandleURL:", v6))
  {
    v7[2](v7);
    -[ICSHomeViewControllerLegacy presentedViewController](self, "presentedViewController");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[ICSHomeViewControllerLegacy presentedViewController](self, "presentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "parentViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[ICSHomeViewControllerLegacy presentedViewController](self, "presentedViewController");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

      }
    }
  }
  else
  {
    LogSubsystem();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_24B4C1000, v15, OS_LOG_TYPE_DEFAULT, "Calling superclass handleURL.", buf, 2u);
    }

    v16.receiver = self;
    v16.super_class = (Class)ICSHomeViewControllerLegacy;
    -[ICSHomeViewControllerLegacy handleURL:withCompletion:](&v16, sel_handleURL_withCompletion_, v6, v7);
  }

}

- (BOOL)_canHandleURL:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[AAUISpecifierProvider handleURL:](self->_headerSpecifierProvider, "handleURL:", v4))
  {
    LogSubsystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[ICSHomeViewControllerLegacy _canHandleURL:]";
      v11 = 2112;
      v12 = v4;
      v6 = "%s Header specifier provider handled url: %@";
LABEL_9:
      _os_log_impl(&dword_24B4C1000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || !-[AAUISpecifierProvider handleURL:](self->_dataClassSpecifierProvider, "handleURL:", v4))
    {
      v7 = 0;
      goto LABEL_12;
    }
    LogSubsystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315394;
      v10 = "-[ICSHomeViewControllerLegacy _canHandleURL:]";
      v11 = 2112;
      v12 = v4;
      v6 = "%s iCloud specifier provider handled url: %@";
      goto LABEL_9;
    }
  }

  v7 = 1;
LABEL_12:

  return v7;
}

- (BOOL)shouldShowiCloudDetails
{
  return self->_shouldShowiCloudDetails;
}

- (void)setShouldShowiCloudDetails:(BOOL)a3
{
  self->_shouldShowiCloudDetails = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainViewDataclasses, 0);
  objc_storeStrong((id *)&self->_deviceBackupSpecifiers, 0);
  objc_storeStrong((id *)&self->_ubiquitySpecifierProvider, 0);
  objc_storeStrong((id *)&self->_dataClassSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_backupSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_headerSpecifierProvider, 0);
}

- (void)setAccountManager:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_24B4C1000, log, OS_LOG_TYPE_DEBUG, "ICSHomeViewControllerLegacy - setting account manager", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)specifiers
{
  OUTLINED_FUNCTION_0(&dword_24B4C1000, a1, a3, "Account is nil, not displaying account summary cell.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
