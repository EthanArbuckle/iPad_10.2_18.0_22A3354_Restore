@implementation ICSHealthDataSpecifierProvider

- (ICSHealthDataSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICSHealthDataSpecifierProvider *v6;
  ICSHealthDataSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSHealthDataSpecifierProvider;
  v6 = -[ICSHealthDataSpecifierProvider init](&v9, sel_init);
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
  uint64_t v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    -[ICSHealthDataSpecifierProvider _specifierForHealthData](self, "_specifierForHealthData");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v4;
    if (v4)
    {
      v9[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
      v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v7 = self->_specifiers;
      self->_specifiers = v6;

    }
    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (id)_specifierForHealthData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HEALTH_DATA_SPECIFIER_NAME"), &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, sel__isHealthDataEnabledString_, objc_opt_class(), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICSHealthDataSpecifierProvider healthDataIcon](self, "healthDataIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75AC8]);
  v8 = *MEMORY[0x24BDB3E18];
  objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x24BDB3E18], *MEMORY[0x24BE75AC0]);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.accountsui.dataclass"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", self->_accountManager, CFSTR("icloudAccountManager"));

  return v6;
}

- (id)_isHealthDataEnabledString:(id)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[ICSHealthDataSpecifierProvider _isHealthDataEnabled:](self, "_isHealthDataEnabled:", a3);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("ON");
  else
    v6 = CFSTR("OFF");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_251C6B070, CFSTR("Localizable-AppleID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_isHealthDataEnabled:(id)a3
{
  id v4;
  AAUISpecifierProviderDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  char v9;
  void *v10;
  char v11;
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
      -[ICSPhotoStreamSpecifierProvider _isPhotoStreamEnabled:].cold.1((id *)p_delegate, v12);

    goto LABEL_7;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(v8, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4);

  if ((v9 & 1) == 0)
  {
LABEL_7:
    v11 = 0;
    goto LABEL_8;
  }
  -[ICSHealthDataSpecifierProvider account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x24BDB3E18]);

LABEL_8:
  return v11;
}

- (id)healthDataIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageForKey:", *MEMORY[0x24BE757D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
