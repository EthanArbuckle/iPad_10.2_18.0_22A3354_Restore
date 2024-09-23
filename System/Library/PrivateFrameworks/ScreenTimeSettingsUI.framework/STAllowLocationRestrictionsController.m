@implementation STAllowLocationRestrictionsController

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ (int)*MEMORY[0x24BE757A8]), "objectForKeyedSubscript:", 0x24DB91230);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  PSSpecifier *allowedGroup;
  id v17;
  STAllowLocationRestrictionsController *v18;
  void *v19;
  void *v21;
  void *v22;
  objc_super v23;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)STAllowLocationRestrictionsController;
    -[PUILocationServicesListController specifiers](&v23, sel_specifiers);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[STAllowLocationRestrictionsController specifiers].cold.1();
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("AllowChangesSpecifierName"), &stru_24DB8A1D0, CFSTR("Restrictions"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v22, self, 0, 0, 0, 3, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("ALLOW"), *MEMORY[0x24BE75AC0]);
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("DontAllowChangesSpecifierName"), &stru_24DB8A1D0, CFSTR("Restrictions"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, self, 0, 0, 0, 3, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("DISALLOW"), v8);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("ALLOW_GROUP"), v8);
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LOCATION_EXPLANATION"), &stru_24DB8A1D0, CFSTR("Restrictions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE75A68]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE75B28]);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "performGetter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
      v15 = v7;
    else
      v15 = v9;
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75C20]);
    objc_msgSend(v5, "insertObject:atIndex:", v10, 0);
    objc_msgSend(v5, "insertObject:atIndex:", v7, 1);
    objc_msgSend(v5, "insertObject:atIndex:", v9, 2);
    allowedGroup = self->_allowedGroup;
    self->_allowedGroup = (PSSpecifier *)v10;
    v17 = v10;

    v18 = self;
    objc_sync_enter(v18);
    v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_sync_exit(v18);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id WeakRetained;
  objc_super v18;
  objc_super v19;
  _QWORD v20[4];
  id v21;
  id v22;
  STAllowLocationRestrictionsController *v23;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  -[STAllowLocationRestrictionsController indexPathForIndex:](self, "indexPathForIndex:", -[STAllowLocationRestrictionsController indexOfSpecifier:](self, "indexOfSpecifier:", self->_allowedGroup));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "section");

  if (v8 == v10)
  {
    if (-[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
    {
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __75__STAllowLocationRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke;
      v20[3] = &unk_24DB867C8;
      v21 = v6;
      v22 = v7;
      v23 = self;
      -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v20);

    }
    else
    {
      v19.receiver = self;
      v19.super_class = (Class)STAllowLocationRestrictionsController;
      -[STAllowLocationRestrictionsController tableView:didSelectRowAtIndexPath:](&v19, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
      -[STAllowLocationRestrictionsController specifierAtIndex:](self, "specifierAtIndex:", -[STAllowLocationRestrictionsController indexForIndexPath:](self, "indexForIndexPath:", v7));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("ALLOW"));

      v14 = (int)*MEMORY[0x24BE757A8];
      v15 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v14);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "performSetterWithValue:", v16);

      -[PUILocationServicesListController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
      WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                                + (int)*MEMORY[0x24BE75790]));
      objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v14));

    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)STAllowLocationRestrictionsController;
    -[STAllowLocationRestrictionsController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
  }

}

void __75__STAllowLocationRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id WeakRetained;
  objc_super v12;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v12.receiver = *(id *)(a1 + 48);
    v12.super_class = (Class)STAllowLocationRestrictionsController;
    objc_msgSendSuper2(&v12, sel_tableView_didSelectRowAtIndexPath_, v4, v3);
    objc_msgSend(*(id *)(a1 + 48), "specifierAtIndex:", objc_msgSend(*(id *)(a1 + 48), "indexForIndexPath:", *(_QWORD *)(a1 + 40)));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("ALLOW"));

    v8 = (int)*MEMORY[0x24BE757A8];
    v9 = *(void **)(*(_QWORD *)(a1 + 48) + v8);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "performSetterWithValue:", v10);

    objc_msgSend(*(id *)(a1 + 48), "updateSpecifiersForImposedSettings");
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 48) + (int)*MEMORY[0x24BE75790]));
    objc_msgSend(WeakRetained, "reloadSpecifier:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + v8));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedGroup, 0);
}

- (void)specifiers
{
  __assert_rtn("-[STAllowLocationRestrictionsController specifiers]", "STAllowLocationRestrictionsController.m", 26, "[specifiers isKindOfClass:[NSMutableArray class]]");
}

@end
