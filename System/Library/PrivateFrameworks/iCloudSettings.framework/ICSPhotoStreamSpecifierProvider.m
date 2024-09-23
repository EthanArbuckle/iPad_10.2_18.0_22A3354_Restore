@implementation ICSPhotoStreamSpecifierProvider

- (ICSPhotoStreamSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  ICSPhotoStreamSpecifierProvider *v6;
  ICSPhotoStreamSpecifierProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICSPhotoStreamSpecifierProvider;
  v6 = -[ICSPhotoStreamSpecifierProvider init](&v9, sel_init);
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
    -[ICSPhotoStreamSpecifierProvider _specifierForPhotoStream](self, "_specifierForPhotoStream");
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

- (id)_specifierForPhotoStream
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A68]) == 2
    && objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63AA8]) == 2
    && objc_msgSend(v3, "effectiveBoolValueForSetting:", *MEMORY[0x24BE638D0]) == 2)
  {
    v4 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BE75590];
    v6 = *MEMORY[0x24BDB3E40];
    -[ICSPhotoStreamSpecifierProvider account](self, "account");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:", v6, v7, self, 0, sel__isPhotoStreamEnabledString_, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = *MEMORY[0x24BE00EC8];
    -[ICSPhotoStreamSpecifierProvider account](self, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInfo:", v9);

    objc_msgSend(v4, "setControllerLoadAction:", sel__photoStreamSpecifierWasTapped_);
  }

  return v4;
}

- (id)_isPhotoStreamEnabledString:(id)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = -[ICSPhotoStreamSpecifierProvider _isPhotoStreamEnabled:](self, "_isPhotoStreamEnabled:", a3);
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

- (BOOL)_isPhotoStreamEnabled:(id)a3
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
  void *v13;
  void *v14;

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

    goto LABEL_8;
  }
  v8 = objc_loadWeakRetained((id *)&self->_delegate);
  v9 = objc_msgSend(v8, "specifierProvider:isDataclassAvailableForSpecifier:", self, v4);

  if ((v9 & 1) == 0)
  {
LABEL_8:
    v11 = 0;
    goto LABEL_14;
  }
  -[ICSPhotoStreamSpecifierProvider account](self, "account");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEnabledForDataclass:", *MEMORY[0x24BDB3E40]) & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    -[ICSPhotoStreamSpecifierProvider account](self, "account");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEnabledForDataclass:", *MEMORY[0x24BDB3EA8]) & 1) != 0)
    {
      v11 = 1;
    }
    else
    {
      -[ICSPhotoStreamSpecifierProvider account](self, "account");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v14, "isEnabledForDataclass:", *MEMORY[0x24BDB3DE0]);

    }
  }

LABEL_14:
  return v11;
}

- (void)_photoStreamSpecifierWasTapped:(id)a3
{
  id v4;
  ICSPhotoStreamSpecifierProvider *v5;
  id WeakRetained;
  char v7;
  id v8;
  _QWORD v9[4];
  ICSPhotoStreamSpecifierProvider *v10;
  id v11;

  v4 = a3;
  v5 = self;
  WeakRetained = objc_loadWeakRetained((id *)&v5->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&v5->_delegate);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __66__ICSPhotoStreamSpecifierProvider__photoStreamSpecifierWasTapped___block_invoke;
    v9[3] = &unk_251C610D8;
    v10 = v5;
    v11 = v4;
    objc_msgSend(v8, "validateDataclassAccessForProvider:specifier:completion:", v10, v11, v9);

  }
}

uint64_t __66__ICSPhotoStreamSpecifierProvider__photoStreamSpecifierWasTapped___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_showPhotoStreamController:", *(_QWORD *)(result + 40));
  return result;
}

- (void)_showPhotoStreamController:(id)a3
{
  id v4;
  PSListController *photosSettingsController;
  ICSPhotoSettingsController *v6;
  PSListController *v7;
  id WeakRetained;
  NSDictionary *handleURLResourceDictionary;
  NSObject *v10;
  uint8_t v11[16];

  v4 = a3;
  photosSettingsController = self->_photosSettingsController;
  if (photosSettingsController)
  {
LABEL_4:
    -[PSListController setSpecifier:](photosSettingsController, "setSpecifier:", v4);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, self->_photosSettingsController);

    if (self->_handleURLResourceDictionary && (objc_opt_respondsToSelector() & 1) != 0)
    {
      -[PSListController handleURL:](self->_photosSettingsController, "handleURL:", self->_handleURLResourceDictionary);
      handleURLResourceDictionary = self->_handleURLResourceDictionary;
      self->_handleURLResourceDictionary = 0;

    }
    goto LABEL_10;
  }
  v6 = objc_alloc_init(ICSPhotoSettingsController);
  if (v6)
  {
    v7 = self->_photosSettingsController;
    self->_photosSettingsController = &v6->super;

    photosSettingsController = self->_photosSettingsController;
    goto LABEL_4;
  }
  LogSubsystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_24B4C1000, v10, OS_LOG_TYPE_DEFAULT, "ICSPhotoStreamSpecifierProvider could not load the photos settings controller!", v11, 2u);
  }

LABEL_10:
}

- (BOOL)handleURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  BOOL v7;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  ICSPhotoStreamSpecifierProvider *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hasPrefix:", *MEMORY[0x24BDB3E78]) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", *MEMORY[0x24BDB3E40]) & 1) != 0
    || (objc_msgSend(v5, "hasPrefix:", *MEMORY[0x24BDB3EA8]) & 1) != 0
    || objc_msgSend(v5, "hasPrefix:", *MEMORY[0x24BDB3DE0]))
  {
    LogSubsystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_24B4C1000, v6, OS_LOG_TYPE_DEFAULT, "%@ handling deeplink url for path: %@", buf, 0x16u);
    }

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __45__ICSPhotoStreamSpecifierProvider_handleURL___block_invoke;
    v9[3] = &unk_251C61060;
    v9[4] = self;
    v10 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

    v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __45__ICSPhotoStreamSpecifierProvider_handleURL___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "specifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "specifiers");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_photoStreamSpecifierWasTapped:", v5);

  }
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_photosSettingsController, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
}

- (void)_isPhotoStreamEnabled:(id *)a1 .cold.1(id *a1, NSObject *a2)
{
  id WeakRetained;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained(a1);
  v4 = 138412290;
  v5 = WeakRetained;
  _os_log_error_impl(&dword_24B4C1000, a2, OS_LOG_TYPE_ERROR, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", (uint8_t *)&v4, 0xCu);

}

@end
