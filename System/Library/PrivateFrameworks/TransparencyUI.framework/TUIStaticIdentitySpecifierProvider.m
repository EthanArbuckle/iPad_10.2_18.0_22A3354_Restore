@implementation TUIStaticIdentitySpecifierProvider

- (TUIStaticIdentitySpecifierProvider)initWithStaticIdentityManager:(id)a3 analytics:(id)a4
{
  id v7;
  id v8;
  TUIStaticIdentitySpecifierProvider *v9;
  TUIStaticIdentitySpecifierProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUIStaticIdentitySpecifierProvider;
  v9 = -[TUIStaticIdentitySpecifierProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticIdentityManager, a3);
    -[TUIStaticIdentityManager setDelegate:](v10->_staticIdentityManager, "setDelegate:", v10);
    -[TUIStaticIdentityManager requestNewSasCode](v10->_staticIdentityManager, "requestNewSasCode");
    -[TUIStaticIdentityManager requestConversationVerificationState:](v10->_staticIdentityManager, "requestConversationVerificationState:", 0);
    objc_storeStrong((id *)&v10->_analytics, a4);
  }

  return v10;
}

- (TUIStaticIdentitySpecifierProvider)initWithAccountManager:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_18);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "initWithAccountManager is not supported", v7, 2u);
  }

  return 0;
}

void __61__TUIStaticIdentitySpecifierProvider_initWithAccountManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)v0;

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentitySpecifierProvider _groupSpecifier](self, "_groupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    -[TUIStaticIdentitySpecifierProvider _codeSpecifier](self, "_codeSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    -[TUIStaticIdentitySpecifierProvider _buttonsSpecifier](self, "_buttonsSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

    v8 = (NSArray *)objc_msgSend(v4, "copy");
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

- (void)reloadSpecifiers
{
  NSArray *v3;
  NSArray *specifiers;
  NSArray *v5;
  _QWORD v6[5];
  NSArray *v7;

  v3 = self->_specifiers;
  specifiers = self->_specifiers;
  self->_specifiers = 0;

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__TUIStaticIdentitySpecifierProvider_reloadSpecifiers__block_invoke;
  v6[3] = &unk_251A5AD78;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __54__TUIStaticIdentitySpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_18);
  v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_2493EE000, v2, OS_LOG_TYPE_INFO, "Attempting to reload specifiers...", v4, 2u);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadSpecifiersForProvider:oldSpecifiers:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

}

void __54__TUIStaticIdentitySpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)v0;

}

- (id)_groupSpecifier
{
  void *v2;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_GROUP_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUIStaticIdentityManager accountKeysDisplayed](self->_staticIdentityManager, "accountKeysDisplayed");
  if (v6)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_GROUP_FOOTER_PART1"), &stru_251A5E438, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("STATIC_IDENTITY_GROUP_FOOTER_PART2"), &stru_251A5E438, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIStaticIdentitySpecifierProvider createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:](self, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", CFSTR("TUI_STATIC_IDENTITY_GROUP"), v5, v7, v9, CFSTR("_usePublicVerificationCodesTapped"), self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {

  }
  return v10;
}

- (void)_usePublicVerificationCodesTapped
{
  -[TUIAnalytics ktInteraction:](self->_analytics, "ktInteraction:", CFSTR("showPublicKeysSelected"));
  -[TUIStaticIdentityManager showAccountKeys](self->_staticIdentityManager, "showAccountKeys");
}

- (id)_codeSpecifier
{
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

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("TUI_STATIC_IDENTITY_CODE"), self, 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75D10]);

  -[TUIStaticIdentityManager sasCodeString](self->_staticIdentityManager, "sasCodeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75D50]);

  -[TUIStaticIdentityManager sasCodeString](self->_staticIdentityManager, "sasCodeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VERIFY_CODE_SUBTITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[TUIStaticIdentityManager localizedPeerAccountNameMessage:](self->_staticIdentityManager, "localizedPeerAccountNameMessage:", CFSTR("GENERATE_CODE_SUBTITLE"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ %@"), v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setProperty:forKey:", v12, *MEMORY[0x24BE75D28]);
  objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);

  return v3;
}

- (id)_buttonsSpecifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("TUI_STATIC_IDENTITY_BUTTONS"), self, 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(v3, "setConfirmationAlternateAction:", sel__noMatchAction_);
  objc_msgSend(v3, "setConfirmationAction:", sel__markAsVerifiedAction_);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TUIStaticIdentityManager sasCodeValid](self->_staticIdentityManager, "sasCodeValid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75A18]);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TUIStaticIdentityManager conversationVerified](self->_staticIdentityManager, "conversationVerified"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75DA0]);

  return v3;
}

- (void)_noMatchAction:(id)a3
{
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[TUIAnalytics ktInteraction:](self->_analytics, "ktInteraction:", CFSTR("doNotMatchSelected"));
  location = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke;
  v5[3] = &unk_251A5AF70;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  _BYTE buf[12];
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x24BEBA820]);
    v3 = (void *)objc_msgSend(v2, "initWithApplication:", *MEMORY[0x24BEBA860]);
    v12 = 0;
    objc_msgSend(v3, "status:", &v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_60_1);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = WeakRetained;
      v14 = 2114;
      v15 = v4;
      v16 = 2114;
      v17 = v5;
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ got CKV status = %{public}@, error = %{public}@", buf, 0x20u);
    }
    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_61;
    block[3] = &unk_251A5AD50;
    objc_copyWeak(&v11, (id *)buf);
    v10 = v4;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_57);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIStaticIdentitySpecifierProvider _noMatchAction:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)v0;

}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_59()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)v0;

}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_61(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD v21[5];
  _QWORD v22[4];
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (void *)MEMORY[0x24BDF67F0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("NO_MATCH_ALERT_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "staticIdentityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedPeerAccountNameMessage:", CFSTR("NO_MATCH_ALERT_TEXT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = +[TUIUtils isTransparencyFeatureEnabled:](TUIUtils, "isTransparencyFeatureEnabled:", ffKTReportToApple);
    v10 = MEMORY[0x24BDAC760];
    if (v9)
    {
      v11 = (void *)MEMORY[0x24BDF67E8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("REPORT_TO_APPLE_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v10;
      v22[1] = 3221225472;
      v22[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_73;
      v22[3] = &unk_251A5B868;
      v23 = *(id *)(a1 + 32);
      v24 = WeakRetained;
      objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 0, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAction:", v14);

    }
    v15 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_251A5E438, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_81;
    v21[3] = &unk_251A5B840;
    v21[4] = WeakRetained;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 1, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAction:", v18);

    objc_msgSend(WeakRetained, "delegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "specifierProvider:showViewController:", WeakRetained, v8);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_63_1);
    v20 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v26 = "-[TUIStaticIdentitySpecifierProvider _noMatchAction:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v20, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_2_62()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)v0;

}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_73(uint64_t a1)
{
  TUIKTReportToAppleContext *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  TUIKTReportToAppleViewController *v8;
  void *v9;
  TUIKTReportToAppleViewController *v10;
  id WeakRetained;

  v2 = objc_alloc_init(TUIKTReportToAppleContext);
  objc_msgSend(*(id *)(a1 + 32), "recentFailedEventIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "recentFailedEventIds");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIKTReportToAppleContext setFailingValidation:](v2, "setFailingValidation:", v6);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_17, &__block_literal_global_76_1);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17, OS_LOG_TYPE_ERROR))
      __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_73_cold_1(a1, v7);
  }
  v8 = [TUIKTReportToAppleViewController alloc];
  objc_msgSend(*(id *)(a1 + 40), "staticIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[TUIKTReportToAppleViewController initWithContext:staticIdentityManager:](v8, "initWithContext:staticIdentityManager:", v2, v9);

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 8));
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", *(_QWORD *)(a1 + 40), v10);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "ktConversationNoMatch:", 1);
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_2_75()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_17 = (uint64_t)v0;

}

uint64_t __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "ktConversationNoMatch:", 0);
}

- (void)_markAsVerifiedAction:(id)a3
{
  -[TUIAnalytics ktInteraction:](self->_analytics, "ktInteraction:", CFSTR("markAsVerifiedSelected"));
  -[TUIStaticIdentityManager verifyConversation](self->_staticIdentityManager, "verifyConversation");
}

- (void)verifyContact:(id)a3 peerPublicAccountIdentity:(id)a4
{
  id WeakRetained;
  id v6;

  objc_msgSend(MEMORY[0x24BDBAE90], "viewControllerForUpdatingContact:withPublicAccountIdentity:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "specifierProvider:showViewController:", self, v6);

}

- (id)createGroupSpecifierWithIdentifier:(id)a3 title:(id)a4 footerText:(id)a5 linkText:(id)a6 actionMethodName:(id)a7 target:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  NSRange v24;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:name:", a3, a4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75A68]);
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProperty:forKey:", v20, *MEMORY[0x24BE75A30]);

    objc_msgSend(v17, "setProperty:forKey:", v18, *MEMORY[0x24BE75A58]);
    v24.location = objc_msgSend(v18, "rangeOfString:", v14);
    NSStringFromRange(v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProperty:forKey:", v21, *MEMORY[0x24BE75A40]);

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setProperty:forKey:", v22, *MEMORY[0x24BE75A50]);

    objc_msgSend(v17, "setProperty:forKey:", v15, *MEMORY[0x24BE75A38]);
  }

  return v17;
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

- (TUIStaticIdentityManager)staticIdentityManager
{
  return self->_staticIdentityManager;
}

- (void)setStaticIdentityManager:(id)a3
{
  objc_storeStrong((id *)&self->_staticIdentityManager, a3);
}

- (TUIAnalytics)analytics
{
  return self->_analytics;
}

- (void)setAnalytics:(id)a3
{
  objc_storeStrong((id *)&self->_analytics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_staticIdentityManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __53__TUIStaticIdentitySpecifierProvider__noMatchAction___block_invoke_73_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_2493EE000, a2, OS_LOG_TYPE_ERROR, "%{public}@ no recent failed event id found, cannot get report data for no match", (uint8_t *)&v3, 0xCu);
}

@end
