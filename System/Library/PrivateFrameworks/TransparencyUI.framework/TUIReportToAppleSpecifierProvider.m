@implementation TUIReportToAppleSpecifierProvider

- (TUIReportToAppleSpecifierProvider)initWithContext:(id)a3 reportManager:(id)a4
{
  id v7;
  id v8;
  TUIReportToAppleSpecifierProvider *v9;
  TUIReportToAppleSpecifierProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIReportToAppleSpecifierProvider;
  v9 = -[TUIReportToAppleSpecifierProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_context, a3);
    objc_storeStrong((id *)&v10->_reportManager, a4);
  }

  return v10;
}

- (TUIReportToAppleSpecifierProvider)initWithAccountManager:(id)a3
{
  id v4;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_20);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_ERROR))
    -[TUIReportToAppleSpecifierProvider initWithAccountManager:].cold.1();

  return 0;
}

void __60__TUIReportToAppleSpecifierProvider_initWithAccountManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)v0;

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  NSArray *v8;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIReportToAppleSpecifierProvider _groupSpecifier](self, "_groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[TUIReportToAppleSpecifierProvider _reportDetailsSpecifier](self, "_reportDetailsSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    v7 = (NSArray *)objc_msgSend(v4, "copy");
    v8 = self->_specifiers;
    self->_specifiers = v7;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)reloadSpecifiers
{
  NSArray *v3;
  NSArray *specifiers;
  NSArray *v5;
  _QWORD block[4];
  NSArray *v7;
  id v8;
  id location;

  v3 = self->_specifiers;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_20);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_INFO, "Attempting to reload specifiers...", (uint8_t *)&v6, 2u);
    }
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSpecifiersForProvider:oldSpecifiers:animated:", WeakRetained, *(_QWORD *)(a1 + 32), 1);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_18_0);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[TUIReportToAppleSpecifierProvider reloadSpecifiers]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)v0;

}

void __53__TUIReportToAppleSpecifierProvider_reloadSpecifiers__block_invoke_19()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)v0;

}

- (id)_groupSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_GROUP_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_GROUP_FOOTER"), &stru_251A5E438, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIReportToAppleSpecifierProvider createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:](self, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("TUI_REPORT_TO_APPLE_GROUP"), v4, v6, v8, CFSTR("_learnMoreTapped"), self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_learnMoreTapped
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2493EE000, v0, OS_LOG_TYPE_DEBUG, "%s  on %{public}@", (uint8_t *)v1, 0x16u);
}

void __53__TUIReportToAppleSpecifierProvider__learnMoreTapped__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)v0;

}

void __53__TUIReportToAppleSpecifierProvider__learnMoreTapped__block_invoke_35(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_opt_new();
    objc_msgSend(WeakRetained, "presentingViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentWithPresentingViewController:", v3);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_19, &__block_literal_global_36_2);
    v4 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315138;
      v6 = "-[TUIReportToAppleSpecifierProvider _learnMoreTapped]_block_invoke";
      _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v5, 0xCu);
    }
  }

}

void __53__TUIReportToAppleSpecifierProvider__learnMoreTapped__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_19 = (uint64_t)v0;

}

- (id)_reportDetailsSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("TUI_REPORT_DETAILS"), self, 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75D10]);

  -[TUIReportManager reportData](self->_reportManager, "reportData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BEBA870]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setProperty:forKey:", v6, *MEMORY[0x24BE75D28]);
  objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);

  return v3;
}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  NSUInteger v22;
  NSUInteger v23;
  NSUInteger v24;
  void *v25;
  void *v26;
  NSRange v28;

  v13 = (void *)MEMORY[0x24BE75590];
  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  objc_msgSend(v13, "groupSpecifierWithID:name:", a3, a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setProperty:forKey:", v19, *MEMORY[0x24BE75A68]);
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProperty:forKey:", v21, *MEMORY[0x24BE75A30]);

  objc_msgSend(v18, "setProperty:forKey:", v19, *MEMORY[0x24BE75A58]);
  v22 = objc_msgSend(v19, "rangeOfString:", v16);
  v24 = v23;

  v28.location = v22;
  v28.length = v24;
  NSStringFromRange(v28);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProperty:forKey:", v25, *MEMORY[0x24BE75A40]);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v14);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setProperty:forKey:", v26, *MEMORY[0x24BE75A50]);
  objc_msgSend(v18, "setProperty:forKey:", v15, *MEMORY[0x24BE75A38]);

  return v18;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_presentingViewController, a3);
}

- (TUIKTReportToAppleContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (TUIReportManager)reportManager
{
  return self->_reportManager;
}

- (void)setReportManager:(id)a3
{
  objc_storeStrong((id *)&self->_reportManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportManager, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2493EE000, v0, OS_LOG_TYPE_ERROR, "%s not supported on %{public}@", (uint8_t *)v1, 0x16u);
}

@end
