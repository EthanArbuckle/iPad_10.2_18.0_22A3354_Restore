@implementation ICSOtherSpecifierProvider

- (ICSOtherSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICSOtherSpecifierProvider *v6;
  ICSOtherSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSOtherSpecifierProvider;
  v6 = -[ICSOtherSpecifierProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_accountManager, a3);

  return v7;
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
  NSArray *specifiers;
  NSArray *v3;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  specifiers = self->_specifiers;
  if (specifiers)
  {
    v3 = specifiers;
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if ((objc_msgSend(MEMORY[0x24BE04958], "isMultiUserMode") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("ADVANCED_GROUP"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICSOtherSpecifierProvider _specifierForLookMeUpByEmail](self, "_specifierForLookMeUpByEmail");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v5, "addObject:", v6);
        objc_msgSend(v5, "addObject:", v7);
      }
      -[ICSOtherSpecifierProvider _specifiersForServerProvidedFooter](self, "_specifiersForServerProvidedFooter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v8);

    }
    v9 = (NSArray *)objc_msgSend(v5, "copy");
    v10 = self->_specifiers;
    self->_specifiers = v9;

    v3 = self->_specifiers;
  }
  return v3;
}

- (id)_specifierForLookMeUpByEmail
{
  void *v3;
  int v4;
  id v5;
  Class v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  AAUISpecifierProviderDelegate **p_delegate;
  id WeakRetained;
  char isKindOfClass;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  -[ICSOtherSpecifierProvider account](self, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProvisionedForDataclass:", *MEMORY[0x24BDB3DC0]);

  if (v4)
  {
    v5 = (id)objc_msgSend(MEMORY[0x24BDD1488], "ics_loadBundle:atPath:", CFSTR("CloudKitSettings.bundle"), CFSTR("System/Library/PreferenceBundles/AccountSettings"));
    v6 = NSClassFromString(CFSTR("CKSettingsController"));
    v7 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CLOUD_DRIVE_PRIVACY_INFO"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, self, 0, 0, v6, 2, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setIdentifier:", CFSTR("CLOUD_DRIVE_PRIVACY_INFO"));
    -[ICSOtherSpecifierProvider account](self, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "aa_cloudKitAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      p_delegate = &self->_delegate;
      WeakRetained = objc_loadWeakRetained((id *)p_delegate);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v16 = objc_loadWeakRetained((id *)p_delegate);
        objc_msgSend(v16, "specifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "userInfo");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v18, "mutableCopy");

        objc_msgSend(v19, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE00EC8]);
        v20 = (void *)objc_msgSend(v19, "copy");
        objc_msgSend(v10, "setUserInfo:", v20);

      }
    }

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_specifiersForServerProvidedFooter
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char *v16;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ICSOtherSpecifierProvider account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_accountFooterText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICSOtherSpecifierProvider account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "aa_accountFooterText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProperty:forKey:", v9, *MEMORY[0x24BE75A68]);

    objc_msgSend(v7, "setProperty:forKey:", &unk_251C83CD0, *MEMORY[0x24BE75A28]);
    objc_msgSend(v3, "addObject:", v7);

  }
  -[ICSOtherSpecifierProvider account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "aa_accountFooterButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[ICSOtherSpecifierProvider account](self, "account");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "aa_accountFooterButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, 0, 13, 0);
    v16 = (char *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v16[*MEMORY[0x24BE75720]] = sel__footerButtonTapped_;
    objc_msgSend(v3, "addObject:", v16);

  }
  return v3;
}

- (void)_footerButtonTapped:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[ICSOtherSpecifierProvider account](self, "account", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aa_accountFooterButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("url"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BEBDF78], "openURL:options:completionHandler:", v5, MEMORY[0x24BDBD1B8], 0);

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

@end
