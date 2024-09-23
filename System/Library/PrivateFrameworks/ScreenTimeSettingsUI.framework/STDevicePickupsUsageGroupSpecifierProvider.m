@implementation STDevicePickupsUsageGroupSpecifierProvider

- (STDevicePickupsUsageGroupSpecifierProvider)init
{
  STDevicePickupsUsageGroupSpecifierProvider *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STDevicePickupsUsageGroupSpecifierProvider;
  v2 = -[STShowMoreUsageGroupSpecifierProvider init](&v11, sel_init);
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PickupsGroupName"), &stru_24DB8A1D0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupSpecifierWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STGroupSpecifierProvider setGroupSpecifier:](v2, "setGroupSpecifier:", v6);

  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DevicePickupSummaryName"), &stru_24DB8A1D0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, v2, 0, sel__usageDetailsCoordinator_, 0, -1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  -[STShowMoreUsageGroupSpecifierProvider setSummarySpecifier:](v2, "setSummarySpecifier:", v8);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__specifierIdentifierDidChange_, 0x24DB8F710, 0);

  return v2;
}

- (void)setCoordinator:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), "KVOContextDevicePickupsUsageGroupSpecifierProvider");
  objc_msgSend(v5, "removeObserver:forKeyPath:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), "KVOContextDevicePickupsUsageGroupSpecifierProvider");
  v6.receiver = self;
  v6.super_class = (Class)STDevicePickupsUsageGroupSpecifierProvider;
  -[STUsageGroupSpecifierProvider setCoordinator:](&v6, sel_setCoordinator_, v4);
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.hasUsageData"), 5, "KVOContextDevicePickupsUsageGroupSpecifierProvider");
  objc_msgSend(v4, "addObserver:forKeyPath:options:context:", self, CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport"), 7, "KVOContextDevicePickupsUsageGroupSpecifierProvider");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v10 = a3;
  v11 = a5;
  if (a6 == "KVOContextDevicePickupsUsageGroupSpecifierProvider")
  {
    -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

    if (objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.hasUsageData")))
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
      {

        v12 = 0;
      }
      -[STGroupSpecifierProvider setIsHidden:](self, "setIsHidden:", objc_msgSend(v12, "BOOLValue") ^ 1);
    }
    else
    {
      -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");

      if (!objc_msgSend(v10, "isEqualToString:", CFSTR("usageDetailsCoordinator.viewModel.selectedUsageReport")))goto LABEL_14;
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v14)
      {

        v12 = 0;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15 == v16)
      {

        v15 = 0;
      }
      -[STDevicePickupsUsageGroupSpecifierProvider _selectedUsageReportDidChangeFrom:to:](self, "_selectedUsageReportDidChangeFrom:to:", v12, v15);

    }
    goto LABEL_14;
  }
  v17.receiver = self;
  v17.super_class = (Class)STDevicePickupsUsageGroupSpecifierProvider;
  -[STDevicePickupsUsageGroupSpecifierProvider observeValueForKeyPath:ofObject:change:context:](&v17, sel_observeValueForKeyPath_ofObject_change_context_, v10, a4, v11, a6);
LABEL_14:

}

- (void)_selectedUsageReportDidChangeFrom:(id)a3 to:(id)a4
{
  id v6;
  uint64_t v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  if (v6 && (objc_msgSend(v11, "isEqual:", v6) & 1) == 0)
  {
    v7 = objc_msgSend(v11, "type");
    v8 = v7 == objc_msgSend(v6, "type");
    -[STShowMoreUsageGroupSpecifierProvider summarySpecifier](self, "summarySpecifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STGroupSpecifierProvider reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v9, v8);

    objc_msgSend(v6, "pickups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STShowMoreUsageGroupSpecifierProvider setUsageItems:](self, "setUsageItems:", v10);

  }
}

- (id)newSpecifierWithUsageItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BE75590];
  v5 = a3;
  objc_msgSend(v5, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, 0, sel_getPickupsInfo_, 0, 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemTealColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, 0x24DB92CB0);

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v7, "setUserInfo:", v5);

  objc_msgSend(v7, "setControllerLoadAction:", sel_showMostUsedDetailListController_);
  return v7;
}

- (void)updateSpecifier:(id)a3 usageItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  objc_msgSend(v8, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v5)
  {
    objc_msgSend(v5, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v7);

    objc_msgSend(v8, "setUserInfo:", v5);
  }

}

- (id)_usageDetailsCoordinator:(id)a3
{
  void *v3;
  void *v4;

  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "usageDetailsCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getPickupsInfo:(id)a3
{
  return (id)objc_msgSend(a3, "userInfo");
}

- (void)showMostUsedDetailListController:(id)a3
{
  id v4;
  STDrillInDetailListController *v5;
  void *v6;
  STDrillInDetailListController *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [STDrillInDetailListController alloc];
  -[STUsageGroupSpecifierProvider coordinator](self, "coordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[STDrillInDetailListController initWithUsageItem:coordinator:](v5, "initWithUsageItem:coordinator:", v10, v6);

  -[STGroupSpecifierProvider delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInDetailListController setParentController:](v7, "setParentController:", v8);
  objc_msgSend(v8, "rootController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDrillInDetailListController setRootController:](v7, "setRootController:", v9);

  -[STDrillInDetailListController setSpecifier:](v7, "setSpecifier:", v4);
  -[STGroupSpecifierProvider showController:animated:](self, "showController:animated:", v7, 1);

}

- (void)_specifierIdentifierDidChange:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", 0x24DB8F730);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STShowMoreUsageGroupSpecifierProvider summarySpecifier](self, "summarySpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentifier:", v4);

}

@end
