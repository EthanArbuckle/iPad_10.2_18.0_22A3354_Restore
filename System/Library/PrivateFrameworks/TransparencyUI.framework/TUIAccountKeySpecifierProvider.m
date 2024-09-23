@implementation TUIAccountKeySpecifierProvider

- (TUIAccountKeySpecifierProvider)init
{
  void *v3;
  void *v4;
  TUIAccountKeySpecifierProvider *v5;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = -[TUIAccountKeySpecifierProvider initWithStaticIdentityManager:analytics:](self, "initWithStaticIdentityManager:analytics:", v3, v4);

  if (v5)
    -[TUIStaticIdentityManager requestSelfAccountKey](v5->_staticIdentityManager, "requestSelfAccountKey");
  return v5;
}

- (TUIAccountKeySpecifierProvider)initWithStaticIdentityManager:(id)a3 analytics:(id)a4
{
  id v7;
  id v8;
  TUIAccountKeySpecifierProvider *v9;
  TUIAccountKeySpecifierProvider *v10;
  void *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TUIAccountKeySpecifierProvider;
  v9 = -[TUIAccountKeySpecifierProvider init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_staticIdentityManager, a3);
    objc_storeStrong((id *)&v10->_analytics, a4);
    -[TUIStaticIdentityManager delegate](v10->_staticIdentityManager, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
      -[TUIStaticIdentityManager setDelegate:](v10->_staticIdentityManager, "setDelegate:", v10);
  }

  return v10;
}

- (TUIAccountKeySpecifierProvider)initWithAccountManager:(id)a3
{
  id v4;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_10);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    -[TUIAccountKeySpecifierProvider initWithAccountManager:].cold.1();

  return 0;
}

void __57__TUIAccountKeySpecifierProvider_initWithAccountManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (void)refreshSelfAccountKey
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __55__TUIAccountKeySpecifierProvider_refreshSelfAccountKey__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (NSArray)specifiers
{
  NSArray *specifiers;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  NSArray *v10;

  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_isExpanded)
    {
      -[TUIAccountKeySpecifierProvider _groupSpecifier](self, "_groupSpecifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v5);

      -[TUIAccountKeySpecifierProvider _accountKeySpecifier](self, "_accountKeySpecifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

      -[TUIAccountKeySpecifierProvider _buttonSpecifier](self, "_buttonSpecifier");
    }
    else
    {
      -[TUIAccountKeySpecifierProvider _collapsedGroupSpecifier](self, "_collapsedGroupSpecifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      -[TUIAccountKeySpecifierProvider _collapsedButtonSpecifier](self, "_collapsedButtonSpecifier");
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    v9 = (NSArray *)objc_msgSend(v4, "copy");
    v10 = self->_specifiers;
    self->_specifiers = v9;

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
  block[2] = __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  char *WeakRetained;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_28_0);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_INFO))
    {
      v6 = 138543362;
      v7 = WeakRetained;
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_INFO, "%{public}@ attempting to reload specifiers...", (uint8_t *)&v6, 0xCu);
    }
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reloadSpecifiersForProvider:oldSpecifiers:animated:", WeakRetained, *(_QWORD *)(a1 + 32), 1);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_26);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      v6 = 136315138;
      v7 = "-[TUIAccountKeySpecifierProvider reloadSpecifiers]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v6, 0xCu);
    }
  }

}

void __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __50__TUIAccountKeySpecifierProvider_reloadSpecifiers__block_invoke_27()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

- (void)_startSpinnerForSpecifier:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "propertyForKey:", *MEMORY[0x24BE75D18]);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v3, "startAnimating");
  objc_msgSend(v4, "setAccessoryView:", v3);

}

- (id)_collapsedGroupSpecifier
{
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (self->_isPeerAccount)
    v3 = CFSTR("PEER_PUBLIC_VERIFICATION_CODE");
  else
    v3 = CFSTR("PUBLIC_VERIFICATION_CODE");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_KEY_GROUP_FOOTER_PART1"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAccountKeySpecifierProvider createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:](self, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", v3, 0, v5, v7, CFSTR("_learnMoreTapped"), self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_collapsedButtonSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SHOW_PUBLIC_VERIFICATION_CODE"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 13, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x24BDBD1C8];
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  objc_msgSend(v6, "setButtonAction:", sel__showPublicVerificationCodeTapped_);
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75868]);
  return v6;
}

- (void)_showPublicVerificationCodeTapped:(id)a3
{
  self->_isExpanded = 1;
  -[TUIAccountKeySpecifierProvider reloadSpecifiers](self, "reloadSpecifiers", a3);
}

- (id)_groupSpecifier
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _BOOL4 isPeerAccount;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  const __CFString *v19;

  v5 = CFSTR("PEER_PUBLIC_VERIFICATION_CODE");
  isPeerAccount = self->_isPeerAccount;
  if (!self->_isPeerAccount)
    v5 = CFSTR("PUBLIC_VERIFICATION_CODE");
  v19 = v5;
  if (self->_isPeerAccount)
  {
    -[TUIStaticIdentityManager localizedPeerAccountNameMessage:](self->_staticIdentityManager, "localizedPeerAccountNameMessage:", CFSTR("VERIFICATION_CODE_GROUP_PEER_TITLE"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_CODE_GROUP_SELF_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = self->_isPeerAccount;
  if (self->_isPeerAccount)
  {
    -[TUIStaticIdentityManager localizedPeerAccountNameMessage:](self->_staticIdentityManager, "localizedPeerAccountNameMessage:", CFSTR("VERIFICATION_CODE_GROUP_PEER_FOOTER"));
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_KEY_GROUP_FOOTER_PART1"), &stru_251A5E438, CFSTR("Localizable"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_KEY_GROUP_FOOTER_PART2"), &stru_251A5E438, CFSTR("Localizable"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)v11;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@ %@"), v11, v3);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_251A5E438, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIAccountKeySpecifierProvider createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:](self, "createGroupSpecifierWithIdentifier:title:footerText:linkText:actionMethodName:target:", v19, v7, v10, v13, CFSTR("_learnMoreTapped"), self);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {

    v10 = v18;
  }

  if (!isPeerAccount)
  return v14;
}

- (id)_accountKeySpecifier
{
  void *v3;
  void *v4;
  void *v5;
  __CFString **v6;

  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", CFSTR("TUI_VERIFICATION_CODE"), self, 0, 0, 0, -1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *MEMORY[0x24BDF7DE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v4, *MEMORY[0x24BE75D10]);

  -[TUIAccountKeySpecifierProvider _currentAccountKeyString](self, "_currentAccountKeyString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75D50]);

  objc_msgSend(v3, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75A18]);
  if (self->_isPeerAccount)
    v6 = kTUIAccessibilityIdentifierPeerPublicVerificationCode;
  else
    v6 = kTUIAccessibilityIdentifierSelfPublicVerificationCode;
  objc_msgSend(v3, "setProperty:forKey:", *v6, *MEMORY[0x24BE75DA0]);
  return v3;
}

- (id)_buttonSpecifier
{
  unsigned __int8 *v2;
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v2 = (unsigned __int8 *)self;
  v3 = -[TUIStaticIdentityManager conversationVerified](self->_staticIdentityManager, "conversationVerified");
  v4 = (void *)MEMORY[0x24BE75590];
  v5 = v2[8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (v3)
    {
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("VERIFIED"), &stru_251A5E438, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      v10 = 1;
    }
    else
    {
      objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("MARK_AS_VERIFIED_NO_DOTS"), &stru_251A5E438, CFSTR("Localizable"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      v9 = 1;
    }
  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("COPY_VERIFICATION_CODE"), &stru_251A5E438, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v9 = 0;
  }
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v2, 0, sel__getAccountKeyButtonEnabledForSpecifier_, 0, objc_msgSend(v2, "_accountKeyButtonTableCellType"), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!v9)
      goto LABEL_8;
  }
  else
  {

    if (!v9)
    {
LABEL_8:
      if (!v10)
        goto LABEL_9;
LABEL_13:

      if (v3)
        goto LABEL_10;
      goto LABEL_14;
    }
  }

  if (v10)
    goto LABEL_13;
LABEL_9:
  if (v3)
  {
LABEL_10:
    objc_msgSend(v11, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
    v12 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDF6AE0], "configurationWithTextStyle:scale:", *MEMORY[0x24BDF77E8], -1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "systemImageNamed:withConfiguration:", CFSTR("checkmark.circle.fill"), v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setProperty:forKey:", v14, *MEMORY[0x24BE75AC8]);
    objc_msgSend(v11, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A18]);
    goto LABEL_20;
  }
LABEL_14:
  objc_msgSend(v2, "_currentAccountKeyString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BDD16E0];
  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v2 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_CODE_NOT_AVAILABLE"), &stru_251A5E438, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqualToString:", v8) ^ 1;
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v15, "numberWithInt:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperty:forKey:", v17, *MEMORY[0x24BE75A18]);

  if (v14)
  {

  }
  objc_msgSend(v11, "setButtonAction:", sel__accountKeyButtonTapped_);
LABEL_20:

  return v11;
}

- (id)_getAccountKeyButtonEnabledForSpecifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[TUIAccountKeySpecifierProvider _currentAccountKeyString](self, "_currentAccountKeyString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[TUIAccountKeySpecifierProvider _startSpinnerForSpecifier:](self, "_startSpinnerForSpecifier:", v4);

  return 0;
}

- (int64_t)_accountKeyButtonTableCellType
{
  void *v2;

  -[TUIAccountKeySpecifierProvider _currentAccountKeyString](self, "_currentAccountKeyString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return 13;
  else
    return -1;
}

- (void)_accountKeyButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (self->_isPeerAccount)
  {
    -[TUIAnalytics ktInteraction:](self->_analytics, "ktInteraction:", CFSTR("markAsVerifiedSelected"));
    -[TUIStaticIdentityManager verifyConversation](self->_staticIdentityManager, "verifyConversation");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6C40], "generalPasteboard", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAccountKeySpecifierProvider _currentAccountKeyString](self, "_currentAccountKeyString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setString:", v5);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VERIFICATON_CODE_COPIED"), &stru_251A5E438, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIAccountKeySpecifierProvider _showInfoAlert:](self, "_showInfoAlert:", v6);

  }
}

- (void)_learnMoreTapped
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://support.apple.com/ht213465"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "openURL:options:completionHandler:", v2, MEMORY[0x24BDBD1B8], 0);

}

- (id)_currentAccountKeyString
{
  _BOOL4 isPeerAccount;
  TUIStaticIdentityManager *staticIdentityManager;

  isPeerAccount = self->_isPeerAccount;
  staticIdentityManager = self->_staticIdentityManager;
  if (isPeerAccount)
    -[TUIStaticIdentityManager peerAccountKeyDisplayString](staticIdentityManager, "peerAccountKeyDisplayString");
  else
    -[TUIStaticIdentityManager selfAccountKeyDisplayString](staticIdentityManager, "selfAccountKeyDisplayString");
  return (id)objc_claimAutoreleasedReturnValue();
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

- (void)_showInfoAlert:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_83);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_DEBUG))
    -[TUIAccountKeySpecifierProvider _showInfoAlert:].cold.1();
  location = 0;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke_84;
  block[3] = &unk_251A5AD50;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

}

void __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke_84(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", *(_QWORD *)(a1 + 32), 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)MEMORY[0x24BDF67E8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DISMISS"), &stru_251A5E438, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionWithTitle:style:handler:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAction:", v7);

    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specifierProvider:showViewController:", WeakRetained, v3);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_10, &__block_literal_global_85);
    v9 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[TUIAccountKeySpecifierProvider _showInfoAlert:]_block_invoke";
      _os_log_impl(&dword_2493EE000, v9, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v10, 0xCu);
    }
  }

}

void __49__TUIAccountKeySpecifierProvider__showInfoAlert___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_10 = (uint64_t)v0;

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
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isPeerAccount
{
  return self->_isPeerAccount;
}

- (void)setIsPeerAccount:(BOOL)a3
{
  self->_isPeerAccount = a3;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
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

- (void)initWithAccountManager:.cold.1()
{
  os_log_t v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_2493EE000, v0, OS_LOG_TYPE_ERROR, "%s initWithAccountManager is not supported on %{public}@", (uint8_t *)v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

- (void)_showInfoAlert:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

@end
