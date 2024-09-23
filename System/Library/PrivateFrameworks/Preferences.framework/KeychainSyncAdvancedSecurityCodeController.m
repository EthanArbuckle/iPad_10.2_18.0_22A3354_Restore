@implementation KeychainSyncAdvancedSecurityCodeController

- (void)viewDidLoad
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
  -[PSListController viewDidLoad](&v7, sel_viewDidLoad);
  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isRunningInBuddy");

  if ((v4 & 1) == 0)
  {
    -[KeychainSyncAdvancedSecurityCodeController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(CFSTR("ADVANCED_SECURITY_OPTIONS"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTitle:", v6);

  }
}

- (id)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  specifiers = self->super.super._specifiers;
  if (!specifiers)
  {
    v19.receiver = self;
    v19.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
    -[PSKeychainSyncViewController specifiers](&v19, sel_specifiers);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isRadioGroup"));

    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRunningInBuddy");

    if (v7)
    {
      -[PSKeychainSyncViewController headerView](self, "headerView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForKeychainSync(CFSTR("ADVANCED_SECURITY_CODE_OPTIONS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitleText:", v9);

    }
    PS_LocalizedStringForKeychainSync(CFSTR("CREATE_COMPLEX_CODE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, 0, 0, 0, 0, 3, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", &unk_1E4A92F88, CFSTR("securityCodeChoice"));
    objc_msgSend(v11, "setProperty:forKey:", &unk_1E4A92F70, CFSTR("accessory"));
    objc_msgSend(v4, "addObject:", v11);
    PS_LocalizedStringForKeychainSync(CFSTR("CREATE_RANDOM_CODE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, 0, 0, 0, 0, 3, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setProperty:forKey:", &unk_1E4A92FA0, CFSTR("securityCodeChoice"));
    objc_msgSend(v13, "setProperty:forKey:", &unk_1E4A92F70, CFSTR("accessory"));
    objc_msgSend(v4, "addObject:", v13);
    if (self->_showsDisableRecoveryOption)
    {
      PS_LocalizedStringForKeychainSync(CFSTR("DONT_CREATE_SECURITY_CODE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifier, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, 0, 0, 0, 0, 3, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setProperty:forKey:", &unk_1E4A92FB8, CFSTR("securityCodeChoice"));
      objc_msgSend(v15, "setProperty:forKey:", &unk_1E4A92F70, CFSTR("accessory"));
      objc_msgSend(v4, "addObject:", v15);
      -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      PS_LocalizedStringForKeychainSync(CFSTR("DISABLE_RECOVERY_DETAILS"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setProperty:forKey:", v17, CFSTR("footerText"));

    }
    specifiers = self->super.super._specifiers;
  }
  return specifiers;
}

- (void)_finishedWithSpecifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[5];

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("securityCodeChoice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (v6 == 3)
  {
    v7 = (void *)MEMORY[0x1E0CEA2E8];
    PS_LocalizedStringForKeychainSync(CFSTR("DONT_CREATE_SECURITY_CODE_QUESTION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PS_LocalizedStringForKeychainSync(CFSTR("DISABLE_RECOVERY_DESCRIPTION"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "alertControllerWithTitle:message:preferredStyle:", v8, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("GO_BACK"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke;
    v20[3] = &unk_1E4A65BF8;
    v20[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14);

    v15 = (void *)MEMORY[0x1E0CEA2E0];
    PS_LocalizedStringForKeychainSync(CFSTR("SKIP_CODE"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    v19[1] = 3221225472;
    v19[2] = __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke_2;
    v19[3] = &unk_1E4A65BF8;
    v19[4] = self;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 0, v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v17);

    -[KeychainSyncAdvancedSecurityCodeController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    -[PSKeychainSyncViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "propertyForKey:", CFSTR("securityCodeChoice"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keychainSyncController:didFinishWithResult:error:", self, v18, 0);

  }
}

void __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "table");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "table");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForSelectedRow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deselectRowAtIndexPath:animated:", v3, 1);

}

void __69__KeychainSyncAdvancedSecurityCodeController__finishedWithSpecifier___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keychainSyncController:didFinishWithResult:error:", *(_QWORD *)(a1 + 32), &unk_1E4A92FB8, 0);

  objc_msgSend(*(id *)(a1 + 32), "table");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "table");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathForSelectedRow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "deselectRowAtIndexPath:animated:", v4, 1);

}

- (void)nextPressed
{
  void *v3;
  id v4;

  -[PSKeychainSyncViewController groupSpecifier](self, "groupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", CFSTR("radioGroupCheckedSpecifier"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  -[KeychainSyncAdvancedSecurityCodeController _finishedWithSpecifier:](self, "_finishedWithSpecifier:", v4);
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  void *v4;
  char v5;

  +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunningInBuddy") ^ 1;

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;

  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", a4));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[KeychainSyncAdvancedSecurityCodeController _finishedWithSpecifier:](self, "_finishedWithSpecifier:", v5);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  UIFont *v20;
  UIFont *cellFont;
  objc_super v23;
  CGRect v24;

  v6 = a3;
  v7 = a4;
  -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23.receiver = self;
  v23.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
  -[PSListController tableView:cellForRowAtIndexPath:](&v23, sel_tableView_cellForRowAtIndexPath_, v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setNumberOfLines:", 0);

  objc_msgSend(v9, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLineBreakMode:", 0);

  objc_msgSend(v9, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v13);

  objc_msgSend(v8, "propertyForKey:", CFSTR("accessory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessoryType:", (int)objc_msgSend(v14, "intValue"));

  if (self->_cellTextWidth == 0.0)
  {
    objc_msgSend(v9, "layoutManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[KeychainSyncAdvancedSecurityCodeController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    objc_msgSend(v15, "textRectForCell:rowWidth:forSizing:", v9, 1, CGRectGetWidth(v24));
    v18 = v17;

    self->_cellTextWidth = v18;
    objc_msgSend(v9, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "font");
    v20 = (UIFont *)objc_claimAutoreleasedReturnValue();
    cellFont = self->_cellFont;
    self->_cellFont = v20;

    objc_msgSend(v6, "reloadData");
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double cellTextWidth;
  UIFont *cellFont;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  objc_super v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_cellTextWidth > 0.0 && self->_cellFont)
  {
    +[PSKeychainSyncManager sharedManager](PSKeychainSyncManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isRunningInBuddy");

    -[PSListController specifierAtIndex:](self, "specifierAtIndex:", -[PSListController indexForIndexPath:](self, "indexForIndexPath:", v7));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    cellTextWidth = self->_cellTextWidth;
    cellFont = self->_cellFont;
    v25 = *MEMORY[0x1E0CEA098];
    v26[0] = cellFont;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingRectWithSize:options:attributes:context:", 1, v14, 0, cellTextWidth, 1.79769313e308);
    v16 = v15;

    v17 = 12.0;
    if (v9)
      v17 = 20.0;
    v18 = 45.0;
    if (v9)
      v18 = 60.0;
    v19 = v16 + v17 * 2.0;
    v20 = floorf(v19);
    if (v18 >= v20)
      v21 = v18;
    else
      v21 = v20;

  }
  else
  {
    v24.receiver = self;
    v24.super_class = (Class)KeychainSyncAdvancedSecurityCodeController;
    -[PSListController tableView:heightForRowAtIndexPath:](&v24, sel_tableView_heightForRowAtIndexPath_, v6, v7);
    v21 = v22;
  }

  return v21;
}

- (BOOL)showsDisableRecoveryOption
{
  return self->_showsDisableRecoveryOption;
}

- (void)setShowsDisableRecoveryOption:(BOOL)a3
{
  self->_showsDisableRecoveryOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellFont, 0);
}

@end
