@implementation STIncludeWebsiteDataGroupSpecifierProvider

- (STIncludeWebsiteDataGroupSpecifierProvider)init
{
  STIncludeWebsiteDataGroupSpecifierProvider *v2;
  STIncludeWebsiteDataGroupSpecifierProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STIncludeWebsiteDataGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    -[STGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("IncludeWebsiteDataSpecifierName"), &stru_24DB8A1D0, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, v3, sel_setIncludeWebsiteData_specifier_, sel_includeWebsiteData_, 0, 6, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIncludeWebsiteDataGroupSpecifierProvider setToggleIncludeWebsiteDataSpecifier:](v3, "setToggleIncludeWebsiteDataSpecifier:", v6);

    -[STGroupSpecifierProvider mutableSpecifiers](v3, "mutableSpecifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STIncludeWebsiteDataGroupSpecifierProvider toggleIncludeWebsiteDataSpecifier](v3, "toggleIncludeWebsiteDataSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

  }
  return v3;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.canToggleWebsiteData"), "STIncludeWebsiteDataGroupSpecifierProviderObservationContext");
  v6.receiver = self;
  v6.super_class = (Class)STIncludeWebsiteDataGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.canToggleWebsiteData"), 4, "STIncludeWebsiteDataGroupSpecifierProviderObservationContext");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  int v12;
  void *v13;
  id v14;
  objc_super v15;

  if (a6 == "STIncludeWebsiteDataGroupSpecifierProviderObservationContext")
  {
    v11 = a3;
    -[STRootGroupSpecifierProvider coordinator](self, "coordinator");

    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("viewModel.canToggleWebsiteData"));
    if (v12)
    {
      -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "viewModel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v13, "canToggleWebsiteData") ^ 1);

    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)STIncludeWebsiteDataGroupSpecifierProvider;
    v10 = a3;
    -[STIncludeWebsiteDataGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, a5, a6);

  }
}

- (void)setIncludeWebsiteData:(id)a3 specifier:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;

  v5 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  objc_msgSend(v7, "setShareWebUsageEnabled:completionHandler:", v6, &__block_literal_global_11);
}

void __78__STIncludeWebsiteDataGroupSpecifierProvider_setIncludeWebsiteData_specifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    +[STUILog persistence](STUILog, "persistence");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __78__STIncludeWebsiteDataGroupSpecifierProvider_setIncludeWebsiteData_specifier___block_invoke_cold_1((uint64_t)v2, v3);

  }
}

- (id)includeWebsiteData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "isWebUsageEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PSSpecifier)toggleIncludeWebsiteDataSpecifier
{
  return self->_toggleIncludeWebsiteDataSpecifier;
}

- (void)setToggleIncludeWebsiteDataSpecifier:(id)a3
{
  objc_storeStrong((id *)&self->_toggleIncludeWebsiteDataSpecifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleIncludeWebsiteDataSpecifier, 0);
}

void __78__STIncludeWebsiteDataGroupSpecifierProvider_setIncludeWebsiteData_specifier___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_219AB4000, a2, OS_LOG_TYPE_FAULT, "failed to set include website data enabled: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
