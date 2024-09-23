@implementation STUsageSharingGroupSpecifierProvider

- (STUsageSharingGroupSpecifierProvider)init
{
  STUsageSharingGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STUsageSharingGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v11, sel_init);
  v3 = (void *)MEMORY[0x24BE75590];
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "groupSpecifierWithID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD538], "modelSpecificLocalizedStringKeyForKey:", CFSTR("AADC_ScreenTimeGroupSpecifierFooterText"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", v8, &stru_24DB8A1D0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE75A68]);

  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);
  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STRootGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("viewModel.isSharingUsageData"), CFSTR("KVOContextUsageSharingGroupSpecifierProvider"));
  v6.receiver = self;
  v6.super_class = (Class)STUsageSharingGroupSpecifierProvider;
  -[STRootGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("viewModel.isSharingUsageData"), 5, CFSTR("KVOContextUsageSharingGroupSpecifierProvider"));

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  void *v11;
  void *v12;
  objc_super v13;

  v10 = a5;
  if (a6 == CFSTR("KVOContextUsageSharingGroupSpecifierProvider"))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("viewModel.isSharingUsageData")))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
      {

        v11 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v11, "BOOLValue") ^ 1);

    }
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)STUsageSharingGroupSpecifierProvider;
    -[STUsageSharingGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v13, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, v10, a6);
  }

}

@end
