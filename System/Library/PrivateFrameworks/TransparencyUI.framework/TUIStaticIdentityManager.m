@implementation TUIStaticIdentityManager

- (TUIStaticIdentityManager)initWithConversationMembers:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  TUIStaticIdentityManager *v9;
  TUIStaticIdentityManager *v10;
  uint64_t v11;
  NSString *contactIdentifier;
  uint64_t v13;
  NSString *lastUsedAddress;
  NSObject *v15;
  uint8_t v17[16];
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TUIStaticIdentityManager;
  v9 = -[TUIStaticIdentityManager init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conversationMembers, a3);
    objc_storeStrong((id *)&v10->_options, a4);
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contactIdentifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    contactIdentifier = v10->_contactIdentifier;
    v10->_contactIdentifier = (NSString *)v11;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("lastUsedIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    lastUsedAddress = v10->_lastUsedAddress;
    v10->_lastUsedAddress = (NSString *)v13;

    if (!v10->_contactIdentifier)
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_23);
      v15 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2493EE000, v15, OS_LOG_TYPE_ERROR, "Didn't get contact identifier, so result can't be saved", v17, 2u);
      }
    }
  }

  return v10;
}

void __64__TUIStaticIdentityManager_initWithConversationMembers_options___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBA8B8], 0);

  -[TUIStaticIdentityManager deleteKTSession](self, "deleteKTSession");
  v4.receiver = self;
  v4.super_class = (Class)TUIStaticIdentityManager;
  -[TUIStaticIdentityManager dealloc](&v4, sel_dealloc);
}

- (void)deleteKTSession
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_8_0);
  v3 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
  {
    v4 = v3;
    -[TUIStaticIdentityManager ktSession](self, "ktSession");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v5;
    _os_log_impl(&dword_2493EE000, v4, OS_LOG_TYPE_DEBUG, "Deleting ktsession: %@", (uint8_t *)&v12, 0xCu);

  }
  -[TUIStaticIdentityManager staticKey](self, "staticKey");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    -[TUIStaticIdentityManager ktSession](self, "ktSession");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[TUIStaticIdentityManager staticKey](self, "staticKey");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUIStaticIdentityManager ktSession](self, "ktSession");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "sessionID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deleteKTSession:complete:", v11, &__block_literal_global_11_0);

      -[TUIStaticIdentityManager setKtSession:](self, "setKtSession:", 0);
    }
  }
}

void __43__TUIStaticIdentityManager_deleteKTSession__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)requestSelfAccountKey
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_13(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  void *v3;
  id v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;
  _BYTE location[24];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_16_1);
    v2 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
      __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_13_cold_1((uint64_t)WeakRetained, v2);
    objc_msgSend(MEMORY[0x24BEBA7F0], "accountPublicID:", *MEMORY[0x24BEBA860]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)location = 0;
    objc_initWeak((id *)location, WeakRetained);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_18;
    block[3] = &unk_251A5B318;
    objc_copyWeak(&v9, (id *)location);
    v7 = v3;
    v8 = 0;
    v4 = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)location);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_14_1);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)location = 136315138;
      *(_QWORD *)&location[4] = "-[TUIStaticIdentityManager requestSelfAccountKey]_block_invoke";
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", location, 0xCu);
    }
  }

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_15()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_18(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "displayStringWithAccountPublicID:");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v3[4];
      v3[4] = v4;

      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_22_1);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
        __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_18_cold_2();
    }
    else
    {
      if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
        dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_24_1);
      if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
        __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_18_cold_1();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VERIFICATION_CODE_NOT_AVAILABLE"), &stru_251A5E438, CFSTR("Localizable"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v3[4];
      v3[4] = v8;

    }
    objc_msgSend(v3, "_updateUI");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_20_0);
    v6 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315138;
      v11 = "-[TUIStaticIdentityManager requestSelfAccountKey]_block_invoke";
      _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v10, 0xCu);
    }
  }

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_2_19()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_21()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_23()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)requestNewSasCodeWithDelay
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __54__TUIStaticIdentityManager_requestNewSasCodeWithDelay__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __54__TUIStaticIdentityManager_requestNewSasCodeWithDelay__block_invoke_33(uint64_t a1)
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
    objc_msgSend(WeakRetained, "requestNewSasCode");
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_34_1);
    v3 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      v4 = 136315138;
      v5 = "-[TUIStaticIdentityManager requestNewSasCodeWithDelay]_block_invoke";
      _os_log_impl(&dword_2493EE000, v3, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", (uint8_t *)&v4, 0xCu);
    }
  }

}

void __54__TUIStaticIdentityManager_requestNewSasCodeWithDelay__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)requestNewSasCode
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_0_1(&dword_2493EE000, v0, v1, "%s  on %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_2();
}

void __45__TUIStaticIdentityManager_requestNewSasCode__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)requestConversationVerificationState:(BOOL)a3
{
  -[TUIStaticIdentityManager requestConversationVerificationState:completionHandler:](self, "requestConversationVerificationState:completionHandler:", a3, &__block_literal_global_36_3);
}

- (void)requestConversationVerificationState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSDictionary *options;
  _QWORD block[5];
  id v14;
  id v15;
  void (**v16)(_QWORD);
  BOOL v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  NSDictionary *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(_QWORD))a4;
  self->_conversationVerified = 0;
  -[TUIStaticIdentityManager _updateUI](self, "_updateUI");
  if (-[NSArray count](self->_conversationMembers, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_conversationMembers, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("publicAccountIdentity"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7 && (v8 || (_os_feature_enabled_impl() & 1) != 0))
  {
    dispatch_get_global_queue(25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_42;
    block[3] = &unk_251A5E030;
    block[4] = self;
    v17 = v4;
    v16 = v6;
    v14 = v7;
    v15 = v9;
    dispatch_async(v10, block);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_41_1);
    v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      options = self->_options;
      *(_DWORD *)buf = 138412546;
      v19 = v7;
      v20 = 2112;
      v21 = options;
      _os_log_impl(&dword_2493EE000, v11, OS_LOG_TYPE_ERROR, "failed get peer verification status (invalid parameters uri = %@, options = %@)", buf, 0x16u);
    }
    self->_conversationVerified = 0;
    if (v4)
      -[TUIStaticIdentityManager requestNewSasCode](self, "requestNewSasCode");
    else
      -[TUIStaticIdentityManager _updateUI](self, "_updateUI");
    v6[2](v6);
  }

}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_42(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;
  char v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BEBA828]);
  v3 = (void *)objc_msgSend(v2, "initWithApplication:", *MEMORY[0x24BEBA860]);
  v4 = MEMORY[0x24BDAC760];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_2;
  v9[3] = &unk_251A5DFE0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 64);
  v10 = *(id *)(a1 + 56);
  v5 = (void *)MEMORY[0x2495B0158](v9);
  if (_os_feature_enabled_impl())
  {
    v12[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_47;
    v7[3] = &unk_251A5E008;
    v8 = v5;
    objc_msgSend(v3, "getCachedValidatePeerResults:completionBlock:", v6, v7);

  }
  else
  {
    objc_msgSend(v3, "getValidatePeerResult:uuid:completionBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
  }

}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_44);
  v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138478083;
    v19 = v5;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "getValidatePeerResult result = %{private}@, error = %{public}@", (uint8_t *)&v18, 0x16u);
  }
  v8 = v5
    && objc_msgSend(v5, "staticAccountKeyEnforced")
    && objc_msgSend(v5, "staticAccountKeyStatus") == 0;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17) = v8;
  objc_msgSend(v5, "publicID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "publicID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publicAccountIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPeerPublicAccountIdentity:", v11);

    v12 = *(void **)(a1 + 32);
    objc_msgSend(v5, "publicID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "displayStringWithAccountPublicID:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
  v17 = *(_BYTE **)(a1 + 32);
  if (v17[17] || !*(_BYTE *)(a1 + 48))
    objc_msgSend(v17, "_updateUI");
  else
    objc_msgSend(v17, "requestNewSasCode");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_3()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __83__TUIStaticIdentityManager_requestConversationVerificationState_completionHandler___block_invoke_47(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "count"))
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBA850], "errorWithDomain:code:description:", *MEMORY[0x24BEBA8A0], -351, CFSTR("no verifier results for static key"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v6, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v5, v3);

}

- (void)verifyConversation
{
  void *v3;
  NSTimer *sessionExpiredTimer;
  NSObject *v5;
  NSString *contactIdentifier;
  NSString *peerPublicAccountIdentity;
  void *v8;
  void *v9;
  NSObject *v10;
  NSString *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  NSString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[TUIStaticIdentityManager peerCNContact:](self, "peerCNContact:", self->_contactIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSTimer invalidate](self->_sessionExpiredTimer, "invalidate");
    sessionExpiredTimer = self->_sessionExpiredTimer;
    self->_sessionExpiredTimer = 0;

    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_54_0);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
    {
      contactIdentifier = self->_contactIdentifier;
      peerPublicAccountIdentity = self->_peerPublicAccountIdentity;
      v12 = 138412546;
      v13 = contactIdentifier;
      v14 = 2112;
      v15 = peerPublicAccountIdentity;
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_DEBUG, "Updating contact %@ with public key: %@", (uint8_t *)&v12, 0x16u);
    }
    -[TUIStaticIdentityManager delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIStaticIdentityManager peerPublicAccountIdentity](self, "peerPublicAccountIdentity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "verifyContact:peerPublicAccountIdentity:", v3, v9);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_52_1);
    v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      v11 = self->_contactIdentifier;
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_ERROR, "failed to verify conversation (no peer) %@", (uint8_t *)&v12, 0xCu);
    }
  }

}

void __46__TUIStaticIdentityManager_verifyConversation__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __46__TUIStaticIdentityManager_verifyConversation__block_invoke_53()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)verifyConversationWithContact:(id)a3 completionHandler:(id)a4
{
  void (**v6)(void);
  void (**v7)(void);

  v6 = (void (**)(void))a4;
  v7 = v6;
  if (a3)
  {
    -[TUIStaticIdentityManager requestConversationVerificationState:completionHandler:](self, "requestConversationVerificationState:completionHandler:", 1, v6);
  }
  else
  {
    -[TUIStaticIdentityManager requestNewSasCode](self, "requestNewSasCode");
    v7[2]();
  }

}

- (void)showAccountKeys
{
  -[TUIStaticIdentityManager showAccountKeys:](self, "showAccountKeys:", 1);
}

- (void)showAccountKeys:(BOOL)a3
{
  if (!self->_accountKeysDisplayed)
  {
    self->_accountKeysDisplayed = 1;
    if (a3)
      -[TUIStaticIdentityManager _updateUI](self, "_updateUI");
  }
}

- (void)hideAccountKeys:(BOOL)a3
{
  if (self->_accountKeysDisplayed)
  {
    self->_accountKeysDisplayed = 0;
    if (a3)
      -[TUIStaticIdentityManager _updateUI](self, "_updateUI");
  }
}

- (NSString)sasCodeString
{
  NSString *sasCode;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sasCode = self->_sasCode;
  if (sasCode)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[NSString substringToIndex:](sasCode, "substringToIndex:", 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString substringFromIndex:](self->_sasCode, "substringFromIndex:", 4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ %@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (BOOL)sasCodeValid
{
  return self->_sasCode != 0;
}

- (id)localizedPeerAccountNameMessage:(id)a3
{
  id v4;
  NSPersonNameComponents *personNameComponents;
  void *v6;
  NSObject *v7;
  NSPersonNameComponents *v8;
  NSPersonNameComponents *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  personNameComponents = self->_personNameComponents;
  if (personNameComponents)
    goto LABEL_13;
  if (self->_contactIdentifier)
  {
    -[TUIStaticIdentityManager peerCNContact:](self, "peerCNContact:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_60_2);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v6;
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "peer account: %@", buf, 0xCu);
    }
    v8 = (NSPersonNameComponents *)objc_alloc_init(MEMORY[0x24BDD1730]);
    v9 = self->_personNameComponents;
    self->_personNameComponents = v8;

    objc_msgSend(v6, "namePrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponents setNamePrefix:](self->_personNameComponents, "setNamePrefix:", v10);

    objc_msgSend(v6, "nameSuffix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponents setNameSuffix:](self->_personNameComponents, "setNameSuffix:", v11);

    objc_msgSend(v6, "middleName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponents setMiddleName:](self->_personNameComponents, "setMiddleName:", v12);

    objc_msgSend(v6, "givenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponents setGivenName:](self->_personNameComponents, "setGivenName:", v13);

    objc_msgSend(v6, "familyName");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponents setFamilyName:](self->_personNameComponents, "setFamilyName:", v14);

    objc_msgSend(v6, "nickname");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSPersonNameComponents setNickname:](self->_personNameComponents, "setNickname:", v15);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_58_2);
    v16 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2493EE000, v16, OS_LOG_TYPE_ERROR, "no contact identifier", buf, 2u);
    }
  }
  personNameComponents = self->_personNameComponents;
  if (personNameComponents)
  {
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD1738], "localizedStringFromPersonNameComponents:style:options:", personNameComponents, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v17, "length"))
  {
    v18 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v4, &stru_251A5E438, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v20, v17);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR("_UNKNOWN"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", v20, &stru_251A5E438, CFSTR("Localizable"));
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __60__TUIStaticIdentityManager_localizedPeerAccountNameMessage___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __60__TUIStaticIdentityManager_localizedPeerAccountNameMessage___block_invoke_59()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (id)peerCNContact:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__0;
  v23 = __Block_byref_object_dispose__0;
  v24 = 0;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x24BDBACB8]);
    objc_msgSend(MEMORY[0x24BDBAE70], "descriptorForRequiredKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithKeysToFetch:", v6);

    v8 = (void *)MEMORY[0x24BDBACA0];
    v29 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateForContactsWithIdentifiers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v10);

    v11 = (void *)objc_opt_new();
    v18 = 0;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __42__TUIStaticIdentityManager_peerCNContact___block_invoke;
    v17[3] = &unk_251A5E0D8;
    v17[4] = &v19;
    objc_msgSend(v11, "enumerateContactsWithFetchRequest:error:usingBlock:", v7, &v18, v17);
    v12 = v18;

    v13 = (void *)v20[5];
    if (v13)
      goto LABEL_10;
  }
  else
  {
    v12 = 0;
  }
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_70_2);
  v14 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v3;
    v27 = 2112;
    v28 = v12;
    _os_log_impl(&dword_2493EE000, v14, OS_LOG_TYPE_ERROR, "failed to fetch a contact for contactIdentifier = %@, error = %@", buf, 0x16u);
  }
  v13 = (void *)v20[5];
LABEL_10:
  v15 = v13;
  _Block_object_dispose(&v19, 8);

  return v15;
}

void __42__TUIStaticIdentityManager_peerCNContact___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

void __42__TUIStaticIdentityManager_peerCNContact___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (int64_t)_sessionStateWithStateString:(id)a3
{
  id v3;
  int64_t v4;
  NSObject *v5;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEBA8E8]) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEBA8E0]) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEBA8D0]) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEBA8D8]) & 1) != 0)
  {
    v4 = 4;
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_71_2);
    v5 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v3;
      _os_log_impl(&dword_2493EE000, v5, OS_LOG_TYPE_ERROR, "invalid session state %@", (uint8_t *)&v7, 0xCu);
    }
    v4 = 0;
  }

  return v4;
}

void __57__TUIStaticIdentityManager__sessionStateWithStateString___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)_updateUI
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "updateUI");

}

- (void)_setupKTSession
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  self->_sessionState = 1;
  -[TUIStaticIdentityManager _updateUI](self, "_updateUI");
  v3 = objc_alloc_init(MEMORY[0x24BEBA858]);
  -[TUIStaticIdentityManager setStaticKey:](self, "setStaticKey:", v3);

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:suspensionBehavior:", self, sel_handleNotification_, *MEMORY[0x24BEBA8B8], 0, 4);

  location = 0;
  objc_initWeak(&location, self);
  dispatch_get_global_queue(25, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__TUIStaticIdentityManager__setupKTSession__block_invoke;
  v6[3] = &unk_251A5AF70;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "conversationMembers");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    v5 = objc_alloc(MEMORY[0x24BEBA818]);
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithPeer:", v6);

    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOtherNamesForPeer:", v8);

    objc_msgSend(v2, "lastUsedAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v2, "lastUsedAddress");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setLastUsedAddressOfMe:", v10);

    }
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_79_2);
    v11 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v16 = (const char *)v7;
      _os_log_impl(&dword_2493EE000, v11, OS_LOG_TYPE_DEFAULT, "setupKTSession (%{public}@)", buf, 0xCu);
    }
    objc_msgSend(v2, "staticKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __43__TUIStaticIdentityManager__setupKTSession__block_invoke_80;
    v14[3] = &unk_251A5E1C0;
    v14[4] = v2;
    objc_msgSend(v12, "setupKTSession:complete:", v7, v14);

  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_75_1);
    v13 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[TUIStaticIdentityManager _setupKTSession]_block_invoke";
      _os_log_impl(&dword_2493EE000, v13, OS_LOG_TYPE_ERROR, "%s, block required strong self is nil", buf, 0xCu);
    }
  }

}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke_78()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke_80(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_84_0);
    v7 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEFAULT, "setupKTSession succeeded, session = %{public}@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "setKtSession:", v5);
  }
  else
  {
    if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
      dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_82_0);
    v8 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
    if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_2493EE000, v8, OS_LOG_TYPE_ERROR, "setupKTSession failed: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "requestNewSasCodeWithDelay");
  }

}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke_2_81()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __43__TUIStaticIdentityManager__setupKTSession__block_invoke_83()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)handleNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "name");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUIStaticIdentityManager postNotificationName:object:userInfo:deliverImmediately:](self, "postNotificationName:object:userInfo:deliverImmediately:", v7, v5, v6, 0);
}

- (void)postNotificationName:(id)a3 object:(id)a4 userInfo:(id)a5 deliverImmediately:(BOOL)a6
{
  id v7;
  void *v8;
  int64_t v9;
  NSObject *v10;
  void *v11;
  TransparencyStaticKey *staticKey;
  id v13;
  _QWORD v14[4];
  id v15;
  TUIStaticIdentityManager *v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BEBA8C8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUIStaticIdentityManager _sessionStateWithStateString:](self, "_sessionStateWithStateString:", v8);

  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_86_0);
  v10 = TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v7;
    v20 = 1024;
    v21 = v9;
    _os_log_impl(&dword_2493EE000, v10, OS_LOG_TYPE_DEFAULT, "postNotificationName: %@/%d", buf, 0x12u);
  }
  if (v9 == 1)
  {
    self->_sessionState = 1;
    -[TUIStaticIdentityManager _updateUI](self, "_updateUI");
  }
  else if (v9 == 2)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x24BEBA8C0]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    staticKey = self->_staticKey;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke_87;
    v14[3] = &unk_251A5E228;
    v15 = v11;
    v16 = self;
    v17 = 2;
    v13 = v11;
    -[TransparencyStaticKey getKTSessionByID:complete:](staticKey, "getKTSessionByID:complete:", v13, v14);

  }
  else
  {
    self->_sessionState = v9;
    self->_sasCodeRefreshRequired = 1;
    -[TUIStaticIdentityManager requestNewSasCode](self, "requestNewSasCode");
  }

}

void __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

void __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke_87(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_88_0);
  v4 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "sasCode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    objc_msgSend(v3, "sessionExpire");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "peerAccountIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "publicAccountIdentity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 138413058;
    v28 = v5;
    v29 = 2112;
    v30 = v8;
    v31 = 2112;
    v32 = v9;
    v33 = 2112;
    v34 = v11;
    _os_log_impl(&dword_2493EE000, v6, OS_LOG_TYPE_DEFAULT, "post notification, sessionId = %@ code = %@, expiration = %@, peer identity = %@", (uint8_t *)&v27, 0x2Au);

  }
  objc_msgSend(v3, "sasCode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setSasCode:", v12);

  objc_msgSend(v3, "sessionExpire");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceNow");
    if (v15 < 1.0)
    {
      objc_msgSend(*(id *)(a1 + 40), "requestNewSasCode");
      goto LABEL_15;
    }
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56) = vcvtpd_u64_f64(v15 / 60.0);
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF40]), "initWithFireDate:interval:target:selector:userInfo:repeats:", v14, *(_QWORD *)(a1 + 40), sel_sessionExpired_, 0, 0, 0.0);
    objc_msgSend(*(id *)(a1 + 40), "setSessionExpiredTimer:", v16);

    objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "sessionExpiredTimer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addTimer:forMode:", v18, *MEMORY[0x24BDBCA90]);

  }
  objc_msgSend(v3, "peerAccountIdentity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v3, "peerAccountIdentity");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "publicAccountIdentity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPeerPublicAccountIdentity:", v21);

    v22 = *(void **)(a1 + 40);
    objc_msgSend(v3, "peerAccountIdentity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "displayStringWithAccountPublicID:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(a1 + 40);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 18) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48) = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "_updateUI");
LABEL_15:

}

void __84__TUIStaticIdentityManager_postNotificationName_object_userInfo_deliverImmediately___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (void)sessionExpired:(id)a3
{
  id v4;
  void *v5;
  KTIDSSession *ktSession;
  NSObject *v7;
  void *v8;
  _BOOL4 conversationVerified;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22 != -1)
    dispatch_once(&TRANSPARENCYUI_DEFAULT_LOG_BLOCK_22, &__block_literal_global_98);
  v5 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  if (os_log_type_enabled((os_log_t)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22, OS_LOG_TYPE_DEBUG))
  {
    ktSession = self->_ktSession;
    v7 = v5;
    -[KTIDSSession sessionID](ktSession, "sessionID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    conversationVerified = self->_conversationVerified;
    v10 = 138412546;
    v11 = v8;
    v12 = 1024;
    v13 = conversationVerified;
    _os_log_impl(&dword_2493EE000, v7, OS_LOG_TYPE_DEBUG, "session expired, sessionID = %@, conversationVerified = %d", (uint8_t *)&v10, 0x12u);

  }
  if (self->_sessionExpiredTimer && !self->_conversationVerified)
  {
    self->_sasCodeRefreshRequired = 1;
    -[TUIStaticIdentityManager requestNewSasCode](self, "requestNewSasCode");
  }

}

void __43__TUIStaticIdentityManager_sessionExpired___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.Transparency", "ui");
  v1 = (void *)TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22;
  TRANSPARENCYUI_DEFAULT_LOG_INTERNAL_22 = (uint64_t)v0;

}

- (id)displayStringWithAccountPublicID:(id)a3
{
  return (id)objc_msgSend(a3, "publicAccountIdentity");
}

- (TUIStaticIdentityManagerProtocol)delegate
{
  return (TUIStaticIdentityManagerProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)selfAccountKeyDisplayString
{
  return self->_selfAccountKeyDisplayString;
}

- (NSString)peerAccountKeyDisplayString
{
  return self->_peerAccountKeyDisplayString;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (BOOL)accountKeysDisplayed
{
  return self->_accountKeysDisplayed;
}

- (BOOL)conversationVerified
{
  return self->_conversationVerified;
}

- (BOOL)sasCodeRefreshRequired
{
  return self->_sasCodeRefreshRequired;
}

- (unint64_t)sasCodeValidMinutes
{
  return self->_sasCodeValidMinutes;
}

- (NSArray)conversationMembers
{
  return self->_conversationMembers;
}

- (void)setConversationMembers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)lastUsedAddress
{
  return self->_lastUsedAddress;
}

- (void)setLastUsedAddress:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (TransparencyStaticKey)staticKey
{
  return self->_staticKey;
}

- (void)setStaticKey:(id)a3
{
  objc_storeStrong((id *)&self->_staticKey, a3);
}

- (KTIDSSession)ktSession
{
  return self->_ktSession;
}

- (void)setKtSession:(id)a3
{
  objc_storeStrong((id *)&self->_ktSession, a3);
}

- (NSString)peerPublicAccountIdentity
{
  return self->_peerPublicAccountIdentity;
}

- (void)setPeerPublicAccountIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_peerPublicAccountIdentity, a3);
}

- (NSString)sasCode
{
  return self->_sasCode;
}

- (void)setSasCode:(id)a3
{
  objc_storeStrong((id *)&self->_sasCode, a3);
}

- (NSTimer)sessionExpiredTimer
{
  return self->_sessionExpiredTimer;
}

- (void)setSessionExpiredTimer:(id)a3
{
  objc_storeStrong((id *)&self->_sessionExpiredTimer, a3);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (void)setContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contactIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionExpiredTimer, 0);
  objc_storeStrong((id *)&self->_sasCode, 0);
  objc_storeStrong((id *)&self->_peerPublicAccountIdentity, 0);
  objc_storeStrong((id *)&self->_ktSession, 0);
  objc_storeStrong((id *)&self->_staticKey, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_lastUsedAddress, 0);
  objc_storeStrong((id *)&self->_conversationMembers, 0);
  objc_storeStrong((id *)&self->_peerAccountKeyDisplayString, 0);
  objc_storeStrong((id *)&self->_selfAccountKeyDisplayString, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_personNameComponents, 0);
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_13_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_2493EE000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ requesting self public account key...", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_18_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_2493EE000, v0, OS_LOG_TYPE_ERROR, "%{public}@ failed to get self public account key: %{public}@", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

void __49__TUIStaticIdentityManager_requestSelfAccountKey__block_invoke_18_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_1(&dword_2493EE000, v0, (uint64_t)v0, "%{public}@ got self public account key: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

@end
