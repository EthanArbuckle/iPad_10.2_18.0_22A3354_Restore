@implementation TUIKTReportToAppleViewController

- (TUIKTReportToAppleViewController)initWithContext:(id)a3
{
  return -[TUIKTReportToAppleViewController initWithContext:staticIdentityManager:](self, "initWithContext:staticIdentityManager:", a3, 0);
}

- (TUIKTReportToAppleViewController)initWithContext:(id)a3 staticIdentityManager:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  TUIKTReportToAppleViewController *v10;
  TUIKTReportToAppleViewController *v11;
  TUIReportManager *v12;
  TUIReportManager *reportManager;
  void *v14;
  id v15;
  uint64_t v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  TUIKTReportToAppleViewController *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_21);
  v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[TUIKTReportToAppleViewController initWithContext:staticIdentityManager:]";
    v20 = 2114;
    v21 = v7;
    v22 = 2114;
    v23 = v8;
    v24 = 2114;
    v25 = self;
    _os_log_impl(&dword_2493EE000, v9, OS_LOG_TYPE_DEFAULT, "%s context = %{public}@, staticIdentityManager = %{public}@ on %{public}@", buf, 0x2Au);
  }
  v10 = -[TUIKTReportToAppleViewController init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_context, a3);
    if (!v8)
    {
      v8 = (id)objc_opt_new();
      objc_msgSend(v8, "requestSelfAccountKey");
    }
    v12 = -[TUIReportManager initWithStaticIdentityManager:]([TUIReportManager alloc], "initWithStaticIdentityManager:", v8);
    reportManager = v11->_reportManager;
    v11->_reportManager = v12;

    v17 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[TUIKTReportToAppleViewController registerForTraitChanges:withAction:](v11, "registerForTraitChanges:withAction:", v14, sel_traitEnvironment_didChangeTraitCollection_);

  }
  return v11;
}

void __74__TUIKTReportToAppleViewController_initWithContext_staticIdentityManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (void)viewWillAppear:(BOOL)a3
{
  TUIReportManager *reportManager;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  UIGestureRecognizer *v14;
  UIGestureRecognizer *gestureRecognizer;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)TUIKTReportToAppleViewController;
  -[TUIKTReportToAppleViewController viewWillAppear:](&v17, sel_viewWillAppear_, a3);
  reportManager = self->_reportManager;
  -[TUIKTReportToAppleContext failingValidation](self->_context, "failingValidation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportManager fetchDataWithUUID:](reportManager, "fetchDataWithUUID:", v5);

  -[TUIKTReportToAppleViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTitle:", v8);

  v9 = objc_alloc(MEMORY[0x24BDF6860]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SEND"), &stru_251A5E438, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithTitle:style:target:action:", v11, 0, self, sel__send);

  objc_msgSend(v6, "setRightBarButtonItem:", v12);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__dismiss);
  objc_msgSend(v6, "setLeftBarButtonItem:", v13);
  v14 = (UIGestureRecognizer *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6E80]), "initWithTarget:action:", self, sel__dismissKeyboard_);
  gestureRecognizer = self->_gestureRecognizer;
  self->_gestureRecognizer = v14;

  -[UIGestureRecognizer setCancelsTouchesInView:](self->_gestureRecognizer, "setCancelsTouchesInView:", 0);
  -[TUIKTReportToAppleViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addGestureRecognizer:", self->_gestureRecognizer);

}

- (void)traitEnvironment:(id)a3 didChangeTraitCollection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_38);
  v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
    -[TUIKTReportToAppleViewController traitEnvironment:didChangeTraitCollection:].cold.1((uint64_t)self, v8);
  -[TUIKTReportToAppleViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceStyle");
  v11 = objc_msgSend(v7, "userInterfaceStyle");

  if (v10 != v11)
    -[TUIKTReportToAppleViewController reloadSpecifiers](self, "reloadSpecifiers");

}

void __78__TUIKTReportToAppleViewController_traitEnvironment_didChangeTraitCollection___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (id)specifiers
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUIReportToAppleSpecifierProvider *reportToAppleSpecifierProvider;
  TUIReportToAppleSpecifierProvider *v9;
  TUIReportToAppleSpecifierProvider *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;

  v3 = (int)*MEMORY[0x24BE756E0];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple))
    {
      -[TUIKTReportToAppleViewController _additionalDetailsTitleSpecifier](self, "_additionalDetailsTitleSpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v6);

      -[TUIKTReportToAppleViewController _specifiersForAdditionalDetails](self, "_specifiersForAdditionalDetails");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v7);

      reportToAppleSpecifierProvider = self->_reportToAppleSpecifierProvider;
      if (!reportToAppleSpecifierProvider)
      {
        v9 = -[TUIReportToAppleSpecifierProvider initWithContext:reportManager:]([TUIReportToAppleSpecifierProvider alloc], "initWithContext:reportManager:", self->_context, self->_reportManager);
        v10 = self->_reportToAppleSpecifierProvider;
        self->_reportToAppleSpecifierProvider = v9;

        -[TUIReportToAppleSpecifierProvider setPresentingViewController:](self->_reportToAppleSpecifierProvider, "setPresentingViewController:", self);
        -[TUIReportToAppleSpecifierProvider setDelegate:](self->_reportToAppleSpecifierProvider, "setDelegate:", self);
        reportToAppleSpecifierProvider = self->_reportToAppleSpecifierProvider;
      }
      -[TUIReportToAppleSpecifierProvider specifiers](reportToAppleSpecifierProvider, "specifiers");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObjectsFromArray:", v11);

      -[TUIKTReportToAppleViewController _reportToAppleButtonSpecifier](self, "_reportToAppleButtonSpecifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

    }
    v13 = (objc_class *)objc_msgSend(v5, "copy");
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = v13;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)_reportToAppleButtonSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_DETAILS"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setButtonAction:", sel__reportToApple_);
  objc_msgSend(v6, "setProperty:forKey:", &unk_251A6D650, *MEMORY[0x24BE75850]);
  return v6;
}

- (void)_reportToApple:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  TUIReportDetailsViewController *v8;

  v8 = -[TUIReportDetailsViewController initWithReportManager:]([TUIReportDetailsViewController alloc], "initWithReportManager:", self->_reportManager);
  v4 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DETAILS_BACK_BUTTON_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v6);

  -[TUIKTReportToAppleViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackBarButtonItem:", v4);

  -[TUIKTReportToAppleViewController showViewController:sender:](self, "showViewController:sender:", v8, self);
}

- (id)_additionalDetailsTitleSpecifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADDITIONAL_DETAILS"), &stru_251A5E438, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupSpecifierWithID:name:", CFSTR("TUI_ADDITIONAL_DETAILS_KEY"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_specifiersForAdditionalDetails
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE755F0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_251A5E438, self, sel__setAdditionalDetails_withSpecifier_, sel__additionalDetailsForSpecifier_, 0, 14, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setKeyboardType:autoCaps:autoCorrection:", 0, 2, 0);
  objc_msgSend(v2, "setProperty:forKey:", &unk_251A6D668, *MEMORY[0x24BE75D10]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ADDITIONAL_DETAILS_PLACEHOLDER"), &stru_251A5E438, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setProperty:forKey:", v4, *MEMORY[0x24BE75D50]);

  objc_msgSend(v2, "setProperty:forKey:", CFSTR("TUIKTSpecifierAdditionalDetails"), *MEMORY[0x24BE75B50]);
  objc_msgSend(v2, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  return v2;
}

- (id)_additionalDetailsForSpecifier:(id)a3
{
  return -[TUIReportManager additionalDetails](self->_reportManager, "additionalDetails", a3);
}

- (void)_setAdditionalDetails:(id)a3 withSpecifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a4, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "placeholderDisplayed"))
  {
    -[TUIReportManager setAdditionalDetails:](self->_reportManager, "setAdditionalDetails:", &stru_251A5E438);
  }
  else
  {
    objc_msgSend(v7, "textView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIReportManager setAdditionalDetails:](self->_reportManager, "setAdditionalDetails:", v6);

  }
}

- (void)specifierProvider:(id)a3 showViewController:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    -[TUIKTReportToAppleViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  else
    -[TUIKTReportToAppleViewController showViewController:sender:](self, "showViewController:sender:", v6, v7);

}

- (void)specifierProvider:(id)a3 willBeginLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_69_1);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:willBeginLoadingSpecifier not implemented", v8, 2u);
  }

}

void __80__TUIKTReportToAppleViewController_specifierProvider_willBeginLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (void)specifierProvider:(id)a3 didFinishLoadingSpecifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  v6 = a4;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_70_1);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "specifierProvider:didFinishLoadingSpecifier not implemented", v8, 2u);
  }

}

void __80__TUIKTReportToAppleViewController_specifierProvider_didFinishLoadingSpecifier___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (void)reloadSpecifiersForProvider:(id)a3 oldSpecifiers:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  uint64_t v14;

  v5 = a5;
  v14 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_71_1);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    v12 = 138412290;
    v13 = v8;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "Reloading specifiers for provider %@", (uint8_t *)&v12, 0xCu);
  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v8, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKTReportToAppleViewController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v9, v11, v5);

  }
  else
  {
    -[TUIKTReportToAppleViewController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

void __87__TUIKTReportToAppleViewController_reloadSpecifiersForProvider_oldSpecifiers_animated___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (void)validateDataclassAccessForProvider:(id)a3 specifier:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint8_t v11[16];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_72_1);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEBUG, "validateDataclassAccessForProvider:specifier:completion not implemented", v11, 2u);
  }

}

void __92__TUIKTReportToAppleViewController_validateDataclassAccessForProvider_specifier_completion___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (void)_send
{
  TUIReportManager *reportManager;
  _QWORD v3[5];

  reportManager = self->_reportManager;
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__TUIKTReportToAppleViewController__send__block_invoke;
  v3[3] = &unk_251A5CA40;
  v3[4] = self;
  -[TUIReportManager sendReport:](reportManager, "sendReport:", v3);
}

void __41__TUIKTReportToAppleViewController__send__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id location;

  v3 = a2;
  location = 0;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__TUIKTReportToAppleViewController__send__block_invoke_2;
  v6[3] = &unk_251A5B318;
  objc_copyWeak(&v9, &location);
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __41__TUIKTReportToAppleViewController__send__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_ERROR"), &stru_251A5E438, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_251A5E438, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, &__block_literal_global_79_1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addAction:", v12);
    objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_20, &__block_literal_global_80_0);
    v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_2493EE000, v13, OS_LOG_TYPE_DEBUG, "Report to Apple sent", v14, 2u);
    }
    objc_msgSend(WeakRetained, "_dismiss");
  }

}

void __41__TUIKTReportToAppleViewController__send__block_invoke_4()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_20 = (uint64_t)v0;

}

- (void)_dismiss
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TUIKTReportToAppleViewController__dismiss__block_invoke;
  block[3] = &unk_251A5B270;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __44__TUIKTReportToAppleViewController__dismiss__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_dismissKeyboard:(id)a3
{
  id v3;

  -[TUIKTReportToAppleViewController view](self, "view", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

}

- (TUIReportToAppleSpecifierProvider)reportToAppleSpecifierProvider
{
  return self->_reportToAppleSpecifierProvider;
}

- (void)setReportToAppleSpecifierProvider:(id)a3
{
  objc_storeStrong((id *)&self->_reportToAppleSpecifierProvider, a3);
}

- (TUIReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
  objc_storeStrong((id *)&self->_reportManager, a3);
}

- (UIGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_reportToAppleSpecifierProvider, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)traitEnvironment:(uint64_t)a1 didChangeTraitCollection:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[TUIKTReportToAppleViewController traitEnvironment:didChangeTraitCollection:]";
  v4 = 2114;
  v5 = a1;
  _os_log_debug_impl(&dword_2493EE000, a2, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)&v2, 0x16u);
}

@end
