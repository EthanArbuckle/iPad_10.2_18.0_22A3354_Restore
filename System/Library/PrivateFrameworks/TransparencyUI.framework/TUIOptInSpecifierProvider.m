@implementation TUIOptInSpecifierProvider

- (TUIOptInSpecifierProvider)initWithAccountManager:(id)a3
{
  id v5;
  TUIOptInSpecifierProvider *v6;
  TUIOptInSpecifierProvider *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  KTOptInManager *optInManager;
  uint64_t v12;
  KTStatus *keyTransparencyStatus;
  uint64_t v14;
  TUIKTStateManager *stateManager;
  objc_super v17;

  v5 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_4);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG))
    -[TUIOptInSpecifierProvider initWithAccountManager:].cold.1();
  v17.receiver = self;
  v17.super_class = (Class)TUIOptInSpecifierProvider;
  v6 = -[TUIOptInSpecifierProvider init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_accountManager, a3);
    v8 = objc_alloc(MEMORY[0x24BEBA810]);
    v9 = *MEMORY[0x24BEBA860];
    v10 = objc_msgSend(v8, "initWithApplication:", *MEMORY[0x24BEBA860]);
    optInManager = v7->_optInManager;
    v7->_optInManager = (KTOptInManager *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x24BEBA820]), "initWithApplication:", v9);
    keyTransparencyStatus = v7->_keyTransparencyStatus;
    v7->_keyTransparencyStatus = (KTStatus *)v12;

    v14 = objc_opt_new();
    stateManager = v7->_stateManager;
    v7->_stateManager = (TUIKTStateManager *)v14;

    -[TUIOptInSpecifierProvider _checkKTStatus](v7, "_checkKTStatus");
    -[TUIOptInSpecifierProvider _beginObservingTransparencyStatusChangedNotification](v7, "_beginObservingTransparencyStatusChangedNotification");
  }

  return v7;
}

void __52__TUIOptInSpecifierProvider_initWithAccountManager___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)dealloc
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

void __36__TUIOptInSpecifierProvider_dealloc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (BOOL)handleURL:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *handleURLResourceDictionary;

  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_27);
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG))
    -[TUIOptInSpecifierProvider handleURL:].cold.1();
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  handleURLResourceDictionary = self->_handleURLResourceDictionary;
  self->_handleURLResourceDictionary = v5;

  return 0;
}

void __39__TUIOptInSpecifierProvider_handleURL___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)_checkKTStatus
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  _BYTE buf[12];
  __int16 v8;
  TUIOptInSpecifierProvider *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_28);
  v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[TUIOptInSpecifierProvider _checkKTStatus]";
    v8 = 2114;
    v9 = self;
    _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_DEFAULT, "%s getting CKV status on %{public}@", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  objc_initWeak((id *)buf, self);
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_29;
  block[3] = &unk_251A5AF70;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_29(uint64_t a1)
{
  id WeakRetained;
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _BYTE buf[12];
  __int16 v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = objc_alloc(MEMORY[0x24BEBA820]);
    v3 = (void *)objc_msgSend(v2, "initWithApplication:", *MEMORY[0x24BEBA860]);
    v11 = 0;
    objc_msgSend(v3, "status:", &v11);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v11;
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_32_0);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = WeakRetained;
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ got CKV status = %{public}@, error = %{public}@", buf, 0x20u);
    }
    objc_msgSend(WeakRetained, "stateManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "updateStateWithKTStatusResult:", v4);

    *(_QWORD *)buf = 0;
    objc_initWeak((id *)buf, WeakRetained);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_33;
    v9[3] = &unk_251A5AF70;
    objc_copyWeak(&v10, (id *)buf);
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_30_0);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[TUIOptInSpecifierProvider _checkKTStatus]_block_invoke";
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_31()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_33(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "reloadSpecifiers");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_35_1);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[TUIOptInSpecifierProvider _checkKTStatus]_block_invoke";
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __43__TUIOptInSpecifierProvider__checkKTStatus__block_invoke_2_34()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)_beginObservingTransparencyStatusChangedNotification
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

void __81__TUIOptInSpecifierProvider__beginObservingTransparencyStatusChangedNotification__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)_stopObservingTransparencyStatusChangedNotification
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

void __80__TUIOptInSpecifierProvider__stopObservingTransparencyStatusChangedNotification__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (void)_transparencyStatusChangedNotificationHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  TUIOptInSpecifierProvider *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_41_0);
  v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "-[TUIOptInSpecifierProvider _transparencyStatusChangedNotificationHandler:]";
    v8 = 2114;
    v9 = v4;
    v10 = 2114;
    v11 = self;
    _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEFAULT, "%s %{public}@ on %{public}@", (uint8_t *)&v6, 0x20u);
  }
  -[TUIOptInSpecifierProvider _checkKTStatus](self, "_checkKTStatus");

}

void __75__TUIOptInSpecifierProvider__transparencyStatusChangedNotificationHandler___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (NSArray)specifiers
{
  void *v3;
  NSArray *specifiers;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *v9;

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_42);
  v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_DEBUG))
    -[TUIOptInSpecifierProvider specifiers].cold.1((uint64_t)self, v3);
  specifiers = self->_specifiers;
  if (!specifiers)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithID:", CFSTR("TRANSPARENCY_GROUP"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
    -[TUIOptInSpecifierProvider _transparencyPaneSpecifier](self, "_transparencyPaneSpecifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v7);

    v8 = (NSArray *)objc_msgSend(v5, "copy");
    v9 = self->_specifiers;
    self->_specifiers = v8;

    specifiers = self->_specifiers;
  }
  return specifiers;
}

void __39__TUIOptInSpecifierProvider_specifiers__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

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
  v6[2] = __45__TUIOptInSpecifierProvider_reloadSpecifiers__block_invoke;
  v6[3] = &unk_251A5AD78;
  v6[4] = self;
  v7 = v3;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __45__TUIOptInSpecifierProvider_reloadSpecifiers__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_4, &__block_literal_global_47_1);
  v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_2493EE000, v2, OS_LOG_TYPE_INFO, "%{public}@ attempting to reload specifiers...", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reloadSpecifiersForProvider:oldSpecifiers:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1);

}

void __45__TUIOptInSpecifierProvider_reloadSpecifiers__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (id)_transparencyPaneSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  TUIKTStateManager *stateManager;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v3 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEVICE_VERIFICATION_SPECIFIER_TITLE"), &stru_251A5E438, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, self, 0, 0, 0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setControllerLoadAction:", sel__showTransparencyPane);
  objc_msgSend(v6, "setIdentifier:", CFSTR("TRANSPARENCY"));
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75868]);
  objc_msgSend(v6, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
  v7 = *MEMORY[0x24BE75D28];
  objc_msgSend(v6, "setProperty:forKey:", &stru_251A5E438, *MEMORY[0x24BE75D28]);
  v8 = -[TUIOptInSpecifierProvider _shouldShowErrorUI](self, "_shouldShowErrorUI");
  stateManager = self->_stateManager;
  if (v8)
  {
    if (-[TUIKTStateManager state](stateManager, "state") != 6
      && -[TUIKTStateManager state](self->_stateManager, "state") != 10
      && -[TUIKTStateManager state](self->_stateManager, "state") != 11)
    {
      -[TUIKTStateManager stateLabel](self->_stateManager, "stateLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v10, v7);
LABEL_11:

    }
  }
  else
  {
    -[TUIKTStateManager ktStatusResult](stateManager, "ktStatusResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "optIn");

    if (v12 != 2)
    {
      objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v13, *MEMORY[0x24BE75D20]);

      -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v10, "optIn");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14 == 1)
        v17 = CFSTR("ACTIVE");
      else
        v17 = CFSTR("OFF");
      objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_251A5E438, CFSTR("Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setProperty:forKey:", v18, v7);

      goto LABEL_11;
    }
  }
  return v6;
}

- (void)_showTransparencyPane
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

void __50__TUIOptInSpecifierProvider__showTransparencyPane__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_4 = (uint64_t)v0;

}

- (BOOL)_shouldShowErrorUI
{
  void *v3;
  uint64_t v4;
  BOOL result;

  result = 1;
  if (!-[TUIKTStateManager isErrorState](self->_stateManager, "isErrorState"))
  {
    -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "optIn");

    if (v4 != 1 || !-[TUIOptInSpecifierProvider _reportableFailureFound](self, "_reportableFailureFound"))
      return 0;
  }
  return result;
}

- (BOOL)_reportableFailureFound
{
  void *v2;
  void *v3;
  BOOL v4;

  -[TUIKTStateManager ktStatusResult](self->_stateManager, "ktStatusResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentFailedEventIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
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

- (AIDAAccountManager)accountManager
{
  return self->_accountManager;
}

- (void)setAccountManager:(id)a3
{
  objc_storeStrong((id *)&self->_accountManager, a3);
}

- (KTOptInManager)optInManager
{
  return self->_optInManager;
}

- (void)setOptInManager:(id)a3
{
  objc_storeStrong((id *)&self->_optInManager, a3);
}

- (KTStatus)keyTransparencyStatus
{
  return self->_keyTransparencyStatus;
}

- (void)setKeyTransparencyStatus:(id)a3
{
  objc_storeStrong((id *)&self->_keyTransparencyStatus, a3);
}

- (TUIKTPaneViewController)paneViewController
{
  return self->_paneViewController;
}

- (void)setPaneViewController:(id)a3
{
  objc_storeStrong((id *)&self->_paneViewController, a3);
}

- (TUIKTStateManager)stateManager
{
  return self->_stateManager;
}

- (void)setStateManager:(id)a3
{
  objc_storeStrong((id *)&self->_stateManager, a3);
}

- (NSDictionary)handleURLResourceDictionary
{
  return self->_handleURLResourceDictionary;
}

- (void)setHandleURLResourceDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handleURLResourceDictionary, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_paneViewController, 0);
  objc_storeStrong((id *)&self->_keyTransparencyStatus, 0);
  objc_storeStrong((id *)&self->_optInManager, 0);
  objc_storeStrong((id *)&self->_accountManager, 0);
  objc_storeStrong((id *)&self->_specifiers, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithAccountManager:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s %{public}@ on %{public}@", v2);
}

- (void)handleURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136315650;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6(&dword_2493EE000, v0, v1, "%s %{public}@ on %{public}@", v2);
}

- (void)specifiers
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = *(void **)(a1 + 56);
  v4 = a2;
  objc_msgSend(v3, "stateDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 16);
  v7 = 136315906;
  v8 = "-[TUIOptInSpecifierProvider specifiers]";
  v9 = 2114;
  v10 = v5;
  v11 = 2114;
  v12 = v6;
  v13 = 2114;
  v14 = a1;
  _os_log_debug_impl(&dword_2493EE000, v4, OS_LOG_TYPE_DEBUG, "%s %{public}@, specifiers = %{public}@ on %{public}@", (uint8_t *)&v7, 0x2Au);

}

@end
