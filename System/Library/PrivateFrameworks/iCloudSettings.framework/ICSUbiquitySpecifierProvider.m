@implementation ICSUbiquitySpecifierProvider

- (ICSUbiquitySpecifierProvider)init
{
  -[ICSUbiquitySpecifierProvider doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICSUbiquitySpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICSUbiquitySpecifierProvider *v6;
  ICSUbiquitySpecifierProvider *v7;
  uint64_t v8;
  ICSUbiquityAccessManager *ubiquityAccessManager;
  _TtC14iCloudSettings22ICSAnalyticsController *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _TtC14iCloudSettings22ICSAnalyticsController *analyticsController;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICSUbiquitySpecifierProvider;
  v6 = -[ICSUbiquitySpecifierProvider init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    +[ICSUbiquityAccessManager sharedInstance](ICSUbiquityAccessManager, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    ubiquityAccessManager = v7->_ubiquityAccessManager;
    v7->_ubiquityAccessManager = (ICSUbiquityAccessManager *)v8;

    v10 = [_TtC14iCloudSettings22ICSAnalyticsController alloc];
    -[AIDAAccountManager accounts](v7->_accountManager, "accounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[ICSAnalyticsController initWithAccount:](v10, "initWithAccount:", v12);
    analyticsController = v7->_analyticsController;
    v7->_analyticsController = (_TtC14iCloudSettings22ICSAnalyticsController *)v13;

    -[ICSUbiquitySpecifierProvider _startObservingTCCAccessChanges](v7, "_startObservingTCCAccessChanges");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[ICSUbiquitySpecifierProvider _stopObservingTCCAccessChanges](self, "_stopObservingTCCAccessChanges");
  v3.receiver = self;
  v3.super_class = (Class)ICSUbiquitySpecifierProvider;
  -[ICSUbiquitySpecifierProvider dealloc](&v3, sel_dealloc);
}

- (id)_account
{
  void *v2;
  void *v3;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)specifiers
{
  NSArray *specifiers;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    if (-[ICSUbiquitySpecifierProvider shouldShowSpecifierForDataclass:](self, "shouldShowSpecifierForDataclass:", *MEMORY[0x24BDB4668]))
    {
      -[ICSUbiquitySpecifierProvider _appSpecifiersForUbiquityServices](self, "_appSpecifiersForUbiquityServices");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSUbiquitySpecifierProvider _groupUbiquityServices:](self, "_groupUbiquityServices:", v4);
      v5 = (NSArray *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v5 = 0;
    }
    v6 = self->_specifiers;
    self->_specifiers = v5;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (BOOL)shouldShowSpecifierForDataclass:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;

  v4 = (void *)MEMORY[0x24BE04948];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "shouldShowDataclass:forAccount:", v5, v7);

  if (v8)
  {
    -[ICSUbiquitySpecifierProvider _account](self, "_account");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "aa_isAccountClass:", *MEMORY[0x24BE047F0]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)ubiquitySpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB4668];
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v3, "shouldShowDataclass:forAccount:", v4, v5);

  if ((_DWORD)v4)
  {
    -[ICSUbiquitySpecifierProvider _ubiquitySpecifier](self, "_ubiquitySpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_ubiquitySpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BE75590];
  v4 = *MEMORY[0x24BDB4668];
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "acui_specifierForDataclass:account:target:set:get:", v4, v5, self, sel__setDocumentsAndDataEnabled_forSpecifier_, sel__isDocumentsAndDataEnabled_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638C0]);

  if ((_DWORD)v4 == 2)
    objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
  return v6;
}

- (id)ubiquityDataclassSwitchSpecifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;

  if (-[ICSUbiquitySpecifierProvider _shouldShowUbiquitySpecifier](self, "_shouldShowUbiquitySpecifier"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BE04958]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("DATACLASS_CELL_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v5, &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel__setDocumentsAndDataEnabled_forSpecifier_, sel__isDocumentsAndDataEnabled_, 0, 6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE75A18];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
    v9 = *MEMORY[0x24BDB3EC8];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x24BDB3EC8], *MEMORY[0x24BE75AC0]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.accountsui.dataclass"));
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638C0]);

    if (v11 == 2)
      objc_msgSend(v7, "setProperty:forKey:", MEMORY[0x24BDBD1C0], v8);

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)ubiquityLinklistSpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  if (-[ICSUbiquitySpecifierProvider _shouldShowUbiquitySpecifier](self, "_shouldShowUbiquitySpecifier"))
  {
    v3 = (void *)MEMORY[0x24BE75590];
    v4 = *MEMORY[0x24BDB3EC8];
    -[ICSUbiquitySpecifierProvider _account](self, "_account");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v4, v5, self, 0, sel__dataclassState_, objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638C0]);

    if (v8 == 2)
      objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x24BE75AC0]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_accountManager, CFSTR("icloudAccountManager"));
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_dataclassState:(id)a3
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  -[ICSUbiquitySpecifierProvider _isDocumentsAndDataEnabled:](self, "_isDocumentsAndDataEnabled:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    v7 = CFSTR("ON");
  else
    v7 = CFSTR("OFF");
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_shouldShowUbiquitySpecifier
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE04948], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDB3EC8];
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v3, "shouldShowDataclass:forAccount:", v4, v5);

  return v4;
}

- (id)_groupUbiquityServices:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v3;
  v5 = (void *)objc_msgSend(v3, "mutableCopy");
  objc_msgSend(v5, "specifierForID:", CFSTR("com.apple.iBooks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "addObject:", v6);
    objc_msgSend(v5, "removeObject:", v6);
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("com.apple.Pages"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "addObject:", v7);
    objc_msgSend(v5, "removeObject:", v7);
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("com.apple.Numbers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "addObject:", v8);
    objc_msgSend(v5, "removeObject:", v8);
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("com.apple.Keynote"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v4, "addObject:", v9);
    objc_msgSend(v5, "removeObject:", v9);
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("com.apple.mobilegarageband"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v4, "addObject:", v10);
    objc_msgSend(v5, "removeObject:", v10);
  }
  objc_msgSend(v5, "specifierForID:", CFSTR("com.apple.iMovie"));
  v11 = objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v4, "addObject:", v11);
    objc_msgSend(v5, "removeObject:", v11);
  }
  v35 = (void *)v11;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v12 = (id)objc_msgSend(v5, "copy");
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v47 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v17, "identifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "hasPrefix:", CFSTR("com.apple."));

        if (v19)
        {
          objc_msgSend(v4, "addObject:", v17);
          objc_msgSend(v5, "removeObject:", v17);
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v14);
  }

  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("APPS_GROUP_3"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertObject:atIndex:", v20, 0);

  }
  if (objc_msgSend(v5, "count", v12))
  {
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("APPS_GROUP_4"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertObject:atIndex:", v21, 0);

  }
  v36 = v5;
  v37 = v4;
  objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v43;
    v25 = *MEMORY[0x24BE75AC0];
    v40 = *MEMORY[0x24BE75948];
    v39 = *MEMORY[0x24BE75D28];
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v43 != v24)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
        objc_msgSend(v27, "objectForKeyedSubscript:", v25);
        v28 = objc_claimAutoreleasedReturnValue();
        if (v28)
        {
          v29 = (void *)v28;
          objc_msgSend(v27, "objectForKeyedSubscript:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "isEqualToString:", CFSTR("APPS_GROUP_3")))
          {

          }
          else
          {
            objc_msgSend(v27, "objectForKeyedSubscript:", v25);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("APPS_GROUP_4"));

            if ((v32 & 1) == 0)
            {
              objc_msgSend(v27, "setObject:forKeyedSubscript:", objc_opt_class(), v40);
              objc_msgSend(v27, "setObject:forKeyedSubscript:", &stru_251C6B070, v39);
            }
          }
        }
      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v23);
  }

  return obj;
}

- (id)_appSpecifiersForUbiquityServices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BE04958], "isMultiUserMode"))
  {
    v4 = (void *)objc_msgSend(v3, "copy");
    v5 = v3;
  }
  else
  {
    -[ICSUbiquityAccessManager allBundleIDs](self->_ubiquityAccessManager, "allBundleIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __65__ICSUbiquitySpecifierProvider__appSpecifiersForUbiquityServices__block_invoke;
    v10[3] = &unk_251C61270;
    v10[4] = self;
    objc_msgSend(v6, "aaf_map:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_0);
    LogSubsystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v5;
      _os_log_impl(&dword_24B4C1000, v8, OS_LOG_TYPE_DEFAULT, "Returning TCC/Ubiquity Specifiers: %@", buf, 0xCu);
    }

    v4 = (void *)objc_msgSend(v5, "copy");
  }

  return v4;
}

uint64_t __65__ICSUbiquitySpecifierProvider__appSpecifiersForUbiquityServices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_appSpecifierWithBundleID:", a2);
}

uint64_t __65__ICSUbiquitySpecifierProvider__appSpecifiersForUbiquityServices__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedStandardCompare:", v6);
  return v7;
}

- (id)_appSpecifierWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;

  v4 = a3;
  if (+[ICSUbiquitySpecifierProvider isSpecifierHiddenForBundleID:ubiquityAccessManager:](ICSUbiquitySpecifierProvider, "isSpecifierHiddenForBundleID:ubiquityAccessManager:", v4, self->_ubiquityAccessManager))
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(v6, "localizedName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel__setAppAccessGranted_forSpecifier_, sel__appAccessGrantedForSpecifier_, 0, 6, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIdentifier:", v4);
    objc_msgSend(v5, "setProperty:forKey:", v4, *MEMORY[0x24BE75B70]);
    v9 = MEMORY[0x24BDBD1C8];
    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCloudSyncAllowed:", v4);

    if (v11)
      v12 = v9;
    else
      v12 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v5, "setProperty:forKey:", v12, *MEMORY[0x24BE75A18]);

  }
  return v5;
}

- (void)_clearSpecifiers
{
  NSArray *specifiers;

  specifiers = self->_specifiers;
  self->_specifiers = 0;

  -[ICSUbiquityAccessManager reloadAccessInfo](self->_ubiquityAccessManager, "reloadAccessInfo");
}

- (BOOL)_isAccountInGrayMode
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[AIDAAccountManager accounts](self->_accountManager, "accounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BE06080]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if ((objc_msgSend(v3, "aa_isSuspended") & 1) != 0 || !objc_msgSend(v3, "aa_isPrimaryEmailVerified"))
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v3, "aa_repairState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "unsignedIntegerValue") == 3;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)isSpecifierHiddenForBundleID:(id)a3 ubiquityAccessManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  BOOL v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isInstalled");

  if (v9)
  {
    objc_msgSend(v7, "entitlementValueForKey:ofClass:", CFSTR("com.apple.private.appleaccount.app-hidden-from-icloud-settings"), objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "BOOLValue"))
    {
      +[ICSUbiquitySpecifierProvider appAccessGrantedForBundleID:ubiquityAccessManager:](ICSUbiquitySpecifierProvider, "appAccessGrantedForBundleID:ubiquityAccessManager:", v5, v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = 1;
      }
      else
      {
        v12 = 1;
        objc_msgSend(v6, "setAppAccessGranted:forBundleID:", 1, v5);
      }
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)_isDocumentsAndDataEnabled:(id)a3
{
  id v4;
  ICSSpecifierProviderDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;

  v4 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    LogSubsystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ICSUbiquitySpecifierProvider _isDocumentsAndDataEnabled:].cold.1((id *)p_delegate);

    goto LABEL_8;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(v8, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4);

  if ((v9 & 1) == 0)
  {
LABEL_8:
    v13 = (void *)MEMORY[0x24BDBD1C0];
    goto LABEL_11;
  }
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isEnabledForDataclass:", *MEMORY[0x24BDB4668]) & 1) != 0)
  {
    -[ICSUbiquitySpecifierProvider _account](self, "_account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithInt:", objc_msgSend(v12, "aa_isUsingCloudDocs"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v10, "numberWithInt:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  return v13;
}

- (void)_setDocumentsAndDataEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  NSObject *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  id WeakRetained;
  char v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[ICSAnalyticsController sendToggleEventForDataclassID:actionType:enabled:](self->_analyticsController, "sendToggleEventForDataclassID:actionType:enabled:", *MEMORY[0x24BDB3EC8], 0, objc_msgSend(v6, "BOOLValue"));
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aa_isUsingCloudDocs");

  if ((v9 & 1) != 0)
  {
    LogSubsystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[ICSUbiquitySpecifierProvider _account](self, "_account");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v6, "BOOLValue");
      v13 = CFSTR("NO");
      if (v12)
        v13 = CFSTR("YES");
      v17 = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_24B4C1000, v10, OS_LOG_TYPE_DEFAULT, "Updating account %@ ubiquity state to %@.", (uint8_t *)&v17, 0x16u);

    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = objc_opt_respondsToSelector();

    if ((v15 & 1) != 0)
    {
      v16 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v16, "specifierProvider:dataclassSwitchStateDidChange:withSpecifier:", self, v6, v7);

    }
  }
  else
  {
    -[ICSUbiquitySpecifierProvider _presentiCloudUpgradeFlowForSpecifier:](self, "_presentiCloudUpgradeFlowForSpecifier:", v7);
  }

}

- (void)_startUsingiCloudDriveWithSpecifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  id v15;

  v15 = a3;
  -[ICSUbiquitySpecifierProvider _loadiCloudDriveSettingsBundleIfNeeded](self, "_loadiCloudDriveSettingsBundleIfNeeded");
  v4 = objc_alloc_init(NSClassFromString(CFSTR("CDSUpgradeViewController")));
  objc_msgSend(v15, "userInfo");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  objc_msgSend(v15, "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v15, "userInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      goto LABEL_5;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }

LABEL_5:
  objc_msgSend(v15, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

LABEL_7:
  -[ICSUbiquitySpecifierProvider _account](self, "_account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE00EC8]);

  v13 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v15, "setUserInfo:", v13);

  objc_msgSend(v4, "setSpecifier:", v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_ubiquityDelegate);
  objc_msgSend(WeakRetained, "ubiquityProviderShowViewController:", v4);

}

- (void)_presentiCloudUpgradeFlowForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id WeakRetained;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, char);
  void *v20;
  ICSUbiquitySpecifierProvider *v21;
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SERVICE_UBIQUITY_UPGRAGE_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SERVICE_UBIQUITY_UPGRAGE_MESSAGE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("ICLOUD_SERVICE_UBIQUITY_UPGRAGE_BUTTON_TITLE"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3B0];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __70__ICSUbiquitySpecifierProvider__presentiCloudUpgradeFlowForSpecifier___block_invoke;
  v20 = &unk_251C610D8;
  v21 = self;
  v22 = v4;
  v14 = v4;
  objc_msgSend(v13, "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:", v6, v8, v12, v10, &v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, v15, v17, v18, v19, v20, v21);

}

void __70__ICSUbiquitySpecifierProvider__presentiCloudUpgradeFlowForSpecifier___block_invoke(uint64_t a1, char a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  if ((a2 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_startUsingiCloudDriveWithSpecifier:", *(_QWORD *)(a1 + 40));
  v3 = *(id **)(a1 + 32);
  v4 = v3[5];
  objc_msgSend(v3, "_clearSpecifiers");
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "reloadSpecifiersForProvider:oldSpecifiers:animated:", *(_QWORD *)(a1 + 32), v4, 1);

}

- (void)_loadiCloudDriveSettingsBundleIfNeeded
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

  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("iCloudDriveSettings.bundle"));
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
      _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "iCloud Drive settings bundle not loaded. Loading...", v7, 2u);
    }

    objc_msgSend(v5, "load");
  }

}

- (void)_startObservingTCCAccessChanges
{
  NSObject *v3;
  id v4;
  uint32_t v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD handler[4];
  id v9;
  id location;

  objc_initWeak(&location, self);
  v3 = MEMORY[0x24BDAC9B8];
  v4 = MEMORY[0x24BDAC9B8];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __63__ICSUbiquitySpecifierProvider__startObservingTCCAccessChanges__block_invoke;
  handler[3] = &unk_251C612D8;
  objc_copyWeak(&v9, &location);
  v5 = notify_register_dispatch("com.apple.tcc.access.changed", &self->_tccObserverToken, v3, handler);

  if (v5)
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "Error registering for TCC notification.", v7, 2u);
    }

  }
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__ICSUbiquitySpecifierProvider__startObservingTCCAccessChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v2;
  id v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = *((id *)WeakRetained + 5);
    LogSubsystem();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = CFSTR("YES");
      if (!v3)
        v5 = CFSTR("NO");
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_24B4C1000, v4, OS_LOG_TYPE_DEFAULT, "ICSUbiquitySpecifierProvider received TCC access changed notification (has old specifiers: %@)", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v2, "_clearSpecifiers");
    objc_msgSend(v2, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceContiguousSpecifiers:withSpecifiers:animated:", v3, v2[5], 0);

  }
}

- (void)_stopObservingTCCAccessChanges
{
  if (notify_is_valid_token(self->_tccObserverToken))
    notify_cancel(self->_tccObserverToken);
}

- (id)_appAccessGrantedForSpecifier:(id)a3
{
  id v4;
  ICSSpecifierProviderDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v4 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) == 0)
  {
    LogSubsystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICSUbiquitySpecifierProvider _isDocumentsAndDataEnabled:].cold.1((id *)p_delegate);

    goto LABEL_7;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(v8, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4);

  if ((v9 & 1) == 0)
  {
LABEL_7:
    v11 = (void *)MEMORY[0x24BDBD1C0];
    goto LABEL_8;
  }
  objc_msgSend(v4, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSUbiquitySpecifierProvider appAccessGrantedForBundleID:ubiquityAccessManager:](ICSUbiquitySpecifierProvider, "appAccessGrantedForBundleID:ubiquityAccessManager:", v10, self->_ubiquityAccessManager);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v11;
}

+ (id)appAccessGrantedForBundleID:(id)a3 ubiquityAccessManager:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isCloudSyncAllowed:", v5);

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isAccessGrantedForBundleID:", v5));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BDBD1C0];
  }

  return v9;
}

- (void)_setAppAccessGranted:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  char v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    v10 = objc_loadWeakRetained((id *)&self->_delegate);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __66__ICSUbiquitySpecifierProvider__setAppAccessGranted_forSpecifier___block_invoke;
    v11[3] = &unk_251C61300;
    objc_copyWeak(&v14, &location);
    v11[4] = self;
    v12 = v6;
    v13 = v7;
    objc_msgSend(v10, "validateDataclassAccessForProvider:specifier:completion:", self, v13, v11);

    objc_destroyWeak(&v14);
  }
  objc_destroyWeak(&location);

}

void __66__ICSUbiquitySpecifierProvider__setAppAccessGranted_forSpecifier___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    v8 = WeakRetained;
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
    v6 = objc_msgSend(*(id *)(a1 + 40), "BOOLValue");
    objc_msgSend(*(id *)(a1 + 48), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAppAccessGranted:forBundleID:", v6, v7);

    WeakRetained = v8;
  }

}

- (NSArray)appsUsingUbiquity
{
  return -[ICSUbiquityAccessManager allBundleIDs](self->_ubiquityAccessManager, "allBundleIDs");
}

- (ICSSpecifierProviderDelegate)delegate
{
  return (ICSSpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setSpecifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (ICSUbiquitySpecifierProviderDelegate)ubiquityDelegate
{
  return (ICSUbiquitySpecifierProviderDelegate *)objc_loadWeakRetained((id *)&self->_ubiquityDelegate);
}

- (void)setUbiquityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_ubiquityDelegate, a3);
}

- (ICSUbiquityAccessManager)ubiquityAccessManager
{
  return self->_ubiquityAccessManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ubiquityAccessManager, 0);
  objc_destroyWeak((id *)&self->_ubiquityDelegate);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_isDocumentsAndDataEnabled:(id *)a1 .cold.1(id *a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained(a1);
  OUTLINED_FUNCTION_0_1(&dword_24B4C1000, v2, v3, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

@end
