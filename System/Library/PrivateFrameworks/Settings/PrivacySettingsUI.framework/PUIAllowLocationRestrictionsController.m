@implementation PUIAllowLocationRestrictionsController

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  PSSpecifier *allowedGroup;
  id v20;
  PUIAllowLocationRestrictionsController *v21;
  void *v22;
  objc_super v24;

  v3 = (int)*MEMORY[0x1E0D80590];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v24.receiver = self;
    v24.super_class = (Class)PUIAllowLocationRestrictionsController;
    -[PUILocationServicesListController specifiers](&v24, sel_specifiers);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[PUIAllowLocationRestrictionsController specifiers].cold.1();
    v6 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForRestrictions(CFSTR("ALLOW_CHANGES_VALUE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v7, self, 0, 0, 0, 3, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x1E0D80868];
    objc_msgSend(v8, "setProperty:forKey:", CFSTR("ALLOW"), *MEMORY[0x1E0D80868]);
    v10 = (void *)MEMORY[0x1E0D804E8];
    PUI_LocalizedStringForRestrictions(CFSTR("DONT_ALLOW_CHANGES_VALUE"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, self, 0, 0, 0, 3, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setProperty:forKey:", CFSTR("DISALLOW"), v9);
    objc_msgSend(MEMORY[0x1E0D804E8], "emptyGroupSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:forKey:", CFSTR("ALLOW_GROUP"), v9);
    PUI_LocalizedStringForRestrictions(CFSTR("LOCATION_EXPLANATION"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:forKey:", v14, *MEMORY[0x1E0D80848]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setProperty:forKey:", v15, *MEMORY[0x1E0D80898]);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E0D80628]), "performGetter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "BOOLValue");

    if (v17)
      v18 = v8;
    else
      v18 = v12;
    objc_msgSend(v13, "setProperty:forKey:", v18, *MEMORY[0x1E0D808E0]);
    objc_msgSend(v5, "insertObject:atIndex:", v13, 0);
    objc_msgSend(v5, "insertObject:atIndex:", v8, 1);
    objc_msgSend(v5, "insertObject:atIndex:", v12, 2);
    allowedGroup = self->_allowedGroup;
    self->_allowedGroup = (PSSpecifier *)v13;
    v20 = v13;

    v21 = self;
    objc_sync_enter(v21);
    v22 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3) = (Class)v5;

    objc_sync_exit(v21);
    v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id WeakRetained;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PUIAllowLocationRestrictionsController;
  -[PUIAllowLocationRestrictionsController tableView:didSelectRowAtIndexPath:](&v17, sel_tableView_didSelectRowAtIndexPath_, a3, v6);
  v7 = objc_msgSend(v6, "section");
  -[PUIAllowLocationRestrictionsController indexPathForIndex:](self, "indexPathForIndex:", -[PUIAllowLocationRestrictionsController indexOfSpecifier:](self, "indexOfSpecifier:", self->_allowedGroup));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "section");

  if (v7 == v9)
  {
    -[PUIAllowLocationRestrictionsController specifierAtIndex:](self, "specifierAtIndex:", -[PUIAllowLocationRestrictionsController indexForIndexPath:](self, "indexForIndexPath:", v6));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ALLOW"));

    v13 = (int)*MEMORY[0x1E0D80628];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "performSetterWithValue:", v15);

    -[PUILocationServicesListController updateSpecifiersForImposedSettings](self, "updateSpecifiersForImposedSettings");
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.super.isa
                                              + (int)*MEMORY[0x1E0D80618]));
    objc_msgSend(WeakRetained, "reloadSpecifier:", *(Class *)((char *)&self->super.super.super.super.super.super.isa + v13));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedGroup, 0);
}

- (void)specifiers
{
  __assert_rtn("-[PUIAllowLocationRestrictionsController specifiers]", "PUIAllowLocationRestrictionsController.m", 18, "[specifiers isKindOfClass:[NSMutableArray class]]");
}

@end
