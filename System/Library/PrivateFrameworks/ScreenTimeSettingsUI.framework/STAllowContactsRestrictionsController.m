@implementation STAllowContactsRestrictionsController

- (STRootViewModelCoordinator)coordinator
{
  return (STRootViewModelCoordinator *)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa+ (int)*MEMORY[0x24BE757A8]), "objectForKeyedSubscript:", 0x24DB91230);
}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  STAllowContactsRestrictionsController *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PSSpecifier *allowedGroup;
  void *v19;
  int v21;
  void *v22;
  objc_super v23;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v23.receiver = self;
    v23.super_class = (Class)STAllowContactsRestrictionsController;
    -[PUIContactsPrivacyController specifiers](&v23, sel_specifiers);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[STAllowContactsRestrictionsController specifiers].cold.1();
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "performGetter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v22, "BOOLValue");
    v6 = self;
    v7 = v5;
    +[STScreenTimeSettingsUIBundle bundle](STScreenTimeSettingsUIBundle, "bundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("AllowChangesSpecifierName"), &stru_24DB8A1D0, CFSTR("Restrictions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v9, v6, 0, 0, 0, 3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE75AC0];
    objc_msgSend(v10, "setObject:forKeyedSubscript:", CFSTR("ALLOW"), *MEMORY[0x24BE75AC0]);

    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("DontAllowChangesSpecifierName"), &stru_24DB8A1D0, CFSTR("Restrictions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, v6, 0, 0, 0, 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("DISALLOW"), v11);

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("ALLOW_GROUP"), v11);
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTACTS_EXPLANATION"), &stru_24DB8A1D0, CFSTR("Restrictions"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE75A68]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE75B28]);

    if (v21)
      v17 = v10;
    else
      v17 = v13;
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE75C20]);
    objc_msgSend(v7, "insertObject:atIndex:", v14, 0);
    objc_msgSend(v7, "insertObject:atIndex:", v10, 1);
    objc_msgSend(v7, "insertObject:atIndex:", v13, 2);

    allowedGroup = v6->_allowedGroup;
    v6->_allowedGroup = (PSSpecifier *)v14;

    v19 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v7;

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
  id v11;
  void *v12;
  id WeakRetained;
  PSSpecifier *allowedGroup;
  STAllowContactsRestrictionsController *v15;
  id v16;
  PSSpecifier *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  objc_super v30;
  _QWORD v31[4];
  id v32;
  id v33;
  STAllowContactsRestrictionsController *v34;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  -[STAllowContactsRestrictionsController indexPathForIndex:](self, "indexPathForIndex:", -[STAllowContactsRestrictionsController indexOfSpecifier:](self, "indexOfSpecifier:", self->_allowedGroup));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "section");

  if (v8 == v10
    && -[PSListController st_shouldShowPINSheetForPINSpecifier](self, "st_shouldShowPINSheetForPINSpecifier"))
  {
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = __75__STAllowContactsRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke;
    v31[3] = &unk_24DB867C8;
    v32 = v6;
    v33 = v7;
    v34 = self;
    -[PSListController st_showPINSheetWithCompletion:](self, "st_showPINSheetWithCompletion:", v31);

    v11 = v32;
  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)STAllowContactsRestrictionsController;
    -[STAllowContactsRestrictionsController tableView:didSelectRowAtIndexPath:](&v30, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
    v12 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]);
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE75790]));
    allowedGroup = self->_allowedGroup;
    v15 = self;
    v16 = v12;
    v11 = WeakRetained;
    v17 = allowedGroup;
    v18 = v7;
    -[STAllowContactsRestrictionsController indexPathForIndex:](v15, "indexPathForIndex:", -[STAllowContactsRestrictionsController indexOfSpecifier:](v15, "indexOfSpecifier:", v17));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "section");

    if (objc_msgSend(v18, "section") == v20)
    {
      objc_msgSend(v16, "objectForKeyedSubscript:", 0x24DB8DCB0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v29, "restrictionType");
      -[STAllowContactsRestrictionsController specifierAtIndex:](v15, "specifierAtIndex:", -[STAllowContactsRestrictionsController indexForIndexPath:](v15, "indexForIndexPath:", v18));
      v22 = v6;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v21 == 1)
        v26 = CFSTR("DISALLOW");
      else
        v26 = CFSTR("ALLOW");
      v27 = objc_msgSend(v24, "isEqualToString:", v26);

      v6 = v22;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "performSetterWithValue:", v28);

      -[PUIContactsPrivacyController updateSpecifiersForImposedSettings](v15, "updateSpecifiersForImposedSettings");
      objc_msgSend(v11, "reloadSpecifier:", v16);

    }
  }

}

void __75__STAllowContactsRestrictionsController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  uint64_t v23;
  void *v24;
  objc_super v25;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 32);
    v25.receiver = *(id *)(a1 + 48);
    v25.super_class = (Class)STAllowContactsRestrictionsController;
    objc_msgSendSuper2(&v25, sel_tableView_didSelectRowAtIndexPath_, v4, v3);
    v5 = *(char **)(a1 + 48);
    v6 = *(void **)&v5[*MEMORY[0x24BE757A8]];
    WeakRetained = objc_loadWeakRetained((id *)&v5[*MEMORY[0x24BE75790]]);
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 48) + 1424);
    v10 = v5;
    v11 = v6;
    v12 = WeakRetained;
    v13 = v9;
    v14 = v8;
    objc_msgSend(v10, "indexPathForIndex:", objc_msgSend(v10, "indexOfSpecifier:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "section");

    if (objc_msgSend(v14, "section") == v16)
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", 0x24DB8DCB0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "restrictionType");
      objc_msgSend(v10, "specifierAtIndex:", objc_msgSend(v10, "indexForIndexPath:", v14));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v18 == 1)
        v22 = CFSTR("DISALLOW");
      else
        v22 = CFSTR("ALLOW");
      v23 = objc_msgSend(v20, "isEqualToString:", v22);

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "performSetterWithValue:", v24);

      objc_msgSend(v10, "updateSpecifiersForImposedSettings");
      objc_msgSend(v12, "reloadSpecifier:", v11);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedGroup, 0);
}

- (void)specifiers
{
  __assert_rtn("-[STAllowContactsRestrictionsController specifiers]", "STAllowContactsRestrictionsController.m", 28, "[specifiers isKindOfClass:[NSMutableArray class]]");
}

@end
