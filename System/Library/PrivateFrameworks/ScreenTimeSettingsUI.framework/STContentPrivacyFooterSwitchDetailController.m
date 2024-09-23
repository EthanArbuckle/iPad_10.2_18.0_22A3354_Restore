@implementation STContentPrivacyFooterSwitchDetailController

- (id)itemsFromParent
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDBCEB8]);
  v12.receiver = self;
  v12.super_class = (Class)STContentPrivacyFooterSwitchDetailController;
  -[PSListItemsController itemsFromParent](&v12, sel_itemsFromParent);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  v6 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v6), "objectForKeyedSubscript:", 0x24DB8F510);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    -[STContentPrivacyFooterSwitchDetailController defaultSwitchSpecifierWithKey:](self, "defaultSwitchSpecifierWithKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.super.isa + v6), "setObject:forKeyedSubscript:", v10, 0x24DB8F4F0);
    objc_msgSend(v5, "addObjectsFromArray:", v10);

  }
  return v5;
}

- (id)getItemSpecifierValue:(id)a3
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;

  v3 = (id *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE75790]);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "getItemSpecifierValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setItemSpecifierValue:(id)a3 specifier:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE75790]));
  if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __80__STContentPrivacyFooterSwitchDetailController_setItemSpecifierValue_specifier___block_invoke;
    v9[3] = &unk_24DB867C8;
    v10 = WeakRetained;
    v11 = v6;
    v12 = v7;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v9);

  }
  else
  {
    objc_msgSend(WeakRetained, "setItemSpecifierValue:specifier:", v6, v7);
  }

}

uint64_t __80__STContentPrivacyFooterSwitchDetailController_setItemSpecifierValue_specifier___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "setItemSpecifierValue:specifier:", *(_QWORD *)(result + 40), *(_QWORD *)(result + 48));
  return result;
}

- (id)defaultSwitchSpecifierWithKey:(id)a3
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  v5 = *(Class *)((char *)&self->super.super.super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", 0x24DB8DCB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rmConfiguration");
  v8 = objc_claimAutoreleasedReturnValue();

  -[STPINListItemsController coordinator](self, "coordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentPrivacyCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)v8;
  objc_msgSend(v11, "visibleRestrictionWithConfiguration:key:", v8, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STContentPrivacyFooterSwitchDetailController.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("item"));

  }
  +[STScreenTimeSettingsUIBundle restrictionsStringsTable](STScreenTimeSettingsUIBundle, "restrictionsStringsTable");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uiLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_24DB8A1D0, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v16, self, sel_setItemSpecifierValue_specifier_, sel_getItemSpecifierValue_, 0, 6, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDD16E0];
  -[STPINListItemsController coordinator](self, "coordinator");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "contentPrivacyCoordinator");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "viewModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "numberWithBool:", objc_msgSend(v21, "restrictionsEnabled"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE75A18]);

  objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, 0x24DB8DCB0);
  objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);

  return v17;
}

- (void)didCancelEnteringPIN
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STContentPrivacyFooterSwitchDetailController;
  -[STPINListItemsController didCancelEnteringPIN](&v3, sel_didCancelEnteringPIN);
  -[STContentPrivacyFooterSwitchDetailController reloadSpecifiers](self, "reloadSpecifiers");
}

@end
