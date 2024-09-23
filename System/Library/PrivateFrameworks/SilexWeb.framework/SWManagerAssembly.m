@implementation SWManagerAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  id v63;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_255033AB0, &__block_literal_global_1);

  objc_msgSend(v3, "privateContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_25501BDA0, &__block_literal_global_71_0);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_25501B228, &__block_literal_global_79);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_255019C08, &__block_literal_global_91);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_255019CA8, &__block_literal_global_98);

  objc_msgSend(v3, "privateContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerClass:factory:", objc_opt_class(), &__block_literal_global_100);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_255025150, &__block_literal_global_114);

  objc_msgSend(v3, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_2550251C0, &__block_literal_global_120);

  objc_msgSend(v3, "privateContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerClass:factory:", objc_opt_class(), &__block_literal_global_122);

  objc_msgSend(v3, "publicContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "registerProtocol:factory:", &unk_255033A00, &__block_literal_global_129);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_msgSend(v23, "withConfiguration:", &__block_literal_global_132);

  objc_msgSend(v3, "privateContainer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (id)objc_msgSend(v25, "registerClass:factory:", objc_opt_class(), &__block_literal_global_135);

  objc_msgSend(v3, "publicContainer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (id)objc_msgSend(v27, "registerProtocol:factory:", &unk_25501AEB0, &__block_literal_global_155);

  objc_msgSend(v3, "publicContainer");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (id)objc_msgSend(v29, "registerProtocol:factory:", &unk_25501A090, &__block_literal_global_180);

  objc_msgSend(v3, "publicContainer");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (id)objc_msgSend(v31, "registerProtocol:factory:", &unk_255033D60, &__block_literal_global_183);

  objc_msgSend(v3, "publicContainer");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (id)objc_msgSend(v33, "registerProtocol:factory:", &unk_2550199F8, &__block_literal_global_190);

  objc_msgSend(v3, "privateContainer");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (id)objc_msgSend(v35, "registerProtocol:factory:", &unk_25501A8B0, &__block_literal_global_197);

  objc_msgSend(v3, "publicContainer");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v37, "registerProtocol:factory:", &unk_2550341C8, &__block_literal_global_200);

  objc_msgSend(v3, "publicContainer");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (id)objc_msgSend(v39, "registerProtocol:factory:", &unk_255033910, &__block_literal_global_207);

  objc_msgSend(v3, "publicContainer");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "registerProtocol:factory:", &unk_2550343E8, &__block_literal_global_222);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (id)objc_msgSend(v42, "withConfiguration:", &__block_literal_global_228);

  objc_msgSend(v3, "publicContainer");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "registerProtocol:factory:", &unk_2550252C0, &__block_literal_global_240);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (id)objc_msgSend(v45, "inScope:", 2);

  objc_msgSend(v3, "privateContainer");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (id)objc_msgSend(v47, "registerProtocol:factory:", &unk_25501B5D8, &__block_literal_global_242);

  objc_msgSend(v3, "publicContainer");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (id)objc_msgSend(v49, "registerProtocol:name:factory:", &unk_2550252C0, CFSTR("local"), &__block_literal_global_244);

  objc_msgSend(v3, "publicContainer");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (id)objc_msgSend(v51, "registerProtocol:factory:", &unk_25501BE78, &__block_literal_global_249);

  objc_msgSend(v3, "publicContainer");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (id)objc_msgSend(v53, "registerProtocol:factory:", &unk_2550254B8, &__block_literal_global_254);

  objc_msgSend(v3, "callback");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_opt_class();
  TFCallbackScopeName();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "whenResolvingClass:scope:callbackBlock:", v56, v57, &__block_literal_global_258);

  objc_msgSend(v3, "publicContainer");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (id)objc_msgSend(v58, "registerProtocol:factory:", &unk_25501A580, &__block_literal_global_265);

  objc_msgSend(v3, "publicContainer");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (id)objc_msgSend(v60, "registerProtocol:factory:", &unk_25501A458, &__block_literal_global_270);

  objc_msgSend(v3, "publicContainer");
  v63 = (id)objc_claimAutoreleasedReturnValue();

  v62 = (id)objc_msgSend(v63, "registerProtocol:factory:", &unk_25501AA50, &__block_literal_global_280);
}

SWConfigurationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SWConfigurationManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SWConfigurationManager *v7;

  v2 = a2;
  v3 = [SWConfigurationManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501BDA0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SWConfigurationManager initWithWebContentScriptsManager:logger:serializer:](v3, "initWithWebContentScriptsManager:logger:serializer:", v4, v5, v6);
  return v7;
}

SWConfigurationSerializer *__36__SWManagerAssembly_loadInRegistry___block_invoke_2()
{
  return objc_alloc_init(SWConfigurationSerializer);
}

SWContentRuleManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SWContentRuleManager *v3;
  void *v4;
  SWContentRuleManager *v5;

  v2 = a2;
  v3 = [SWContentRuleManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWContentRuleManager initWithUserContentController:](v3, "initWithUserContentController:", v4);
  return v5;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SWDocumentStateManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  SWDocumentStateManager *v3;
  void *v4;
  SWDocumentStateManager *v5;

  v2 = a2;
  v3 = [SWDocumentStateManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWDocumentStateManager initWithUserContentController:](v3, "initWithUserContentController:", v4);
  return v5;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SWErrorManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SWErrorManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SWErrorManager *v7;

  v2 = a2;
  v3 = [SWErrorManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550341C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SWErrorManager initWithMessageHandlerManager:timeoutManager:logger:](v3, "initWithMessageHandlerManager:timeoutManager:logger:", v4, v5, v6);
  return v7;
}

SWMessageHandlerManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SWMessageHandlerManager *v3;
  void *v4;
  void *v5;
  SWMessageHandlerManager *v6;

  v2 = a2;
  v3 = [SWMessageHandlerManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWMessageHandlerManager initWithUserContentController:logger:](v3, "initWithUserContentController:logger:", v4, v5);
  return v6;
}

void __36__SWManagerAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addMessageHandler:name:", v6, CFSTR("log"));
}

SWLogMessageHandler *__36__SWManagerAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  SWLogMessageHandler *v3;
  void *v4;
  SWLogMessageHandler *v5;

  v2 = a2;
  v3 = [SWLogMessageHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWLogMessageHandler initWithLogger:](v3, "initWithLogger:", v4);
  return v5;
}

SWNavigationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_13()
{
  return objc_alloc_init(SWNavigationManager);
}

SWPresentationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  SWPresentationManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SWPresentationManager *v8;

  v2 = a2;
  v3 = [SWPresentationManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019C08);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SWPresentationManager initWithWebContentScriptsManager:messageHandlerManager:documentStateProvider:logger:](v3, "initWithWebContentScriptsManager:messageHandlerManager:documentStateProvider:logger:", v4, v5, v6, v7);
  return v8;
}

SWScriptsManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2;
  SWScriptsManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SWScriptsManager *v7;

  v2 = a2;
  v3 = [SWScriptsManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019C08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SWScriptsManager initWithWebView:documentStateProvider:logger:](v3, "initWithWebView:documentStateProvider:logger:", v4, v5, v6);
  return v7;
}

SWProcessTerminationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_16(uint64_t a1, void *a2)
{
  id v2;
  SWProcessTerminationManager *v3;
  void *v4;
  void *v5;
  SWProcessTerminationManager *v6;

  v2 = a2;
  v3 = [SWProcessTerminationManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_25501A8B0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550251C0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWProcessTerminationManager initWithTerminationThrottler:errorReporter:](v3, "initWithTerminationThrottler:errorReporter:", v4, v5);
  return v6;
}

SWCrashRetryThrottler *__36__SWManagerAssembly_loadInRegistry___block_invoke_17()
{
  return objc_alloc_init(SWCrashRetryThrottler);
}

SWTimeoutManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_18(uint64_t a1, void *a2)
{
  id v2;
  SWTimeoutManager *v3;
  void *v4;
  void *v5;
  SWTimeoutManager *v6;

  v2 = a2;
  v3 = [SWTimeoutManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019C08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWTimeoutManager initWithTimeout:messageHandlerManager:documentStateProvider:](v3, "initWithTimeout:messageHandlerManager:documentStateProvider:", v4, v5, 60.0);
  return v6;
}

SWSessionManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_19(uint64_t a1, void *a2)
{
  id v2;
  SWSessionManager *v3;
  void *v4;
  void *v5;
  SWSessionManager *v6;

  v2 = a2;
  v3 = [SWSessionManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWSessionManager initWithScriptsManager:logger:](v3, "initWithScriptsManager:logger:", v4, v5);
  return v6;
}

SWDatastoreSynchronizationManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2;
  SWDatastoreSynchronizationManager *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SWDatastoreSynchronizationManager *v9;

  v2 = a2;
  v3 = [SWDatastoreSynchronizationManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_25501B5D8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033910);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SWDatastoreSynchronizationManager initWithSettingsFactory:scriptsManager:messageHandlerManager:sessionManager:logger:](v3, "initWithSettingsFactory:scriptsManager:messageHandlerManager:sessionManager:logger:", v4, v5, v6, v7, v8);
  return v9;
}

void __36__SWManagerAssembly_loadInRegistry___block_invoke_21(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveProtocol:", &unk_2550252C0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDatastoreManager:", v6);

  objc_msgSend(v5, "resolveProtocol:name:", &unk_2550252C0, CFSTR("local"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setLocalDatastoreManager:", v7);
}

SWDatastoreManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_22(uint64_t a1, void *a2)
{
  id v2;
  SWDatastoreManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SWDatastoreManager *v7;

  v2 = a2;
  v3 = [SWDatastoreManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019C08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550343E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SWDatastoreManager initWithLogger:documentStateProvider:datastoreSynchronizationManager:](v3, "initWithLogger:documentStateProvider:datastoreSynchronizationManager:", v4, v5, v6);
  return v7;
}

SWDatastoreFactory *__36__SWManagerAssembly_loadInRegistry___block_invoke_23(uint64_t a1, void *a2)
{
  id v2;
  SWDatastoreFactory *v3;
  void *v4;
  SWDatastoreFactory *v5;

  v2 = a2;
  v3 = [SWDatastoreFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWDatastoreFactory initWithLogger:](v3, "initWithLogger:", v4);
  return v5;
}

SWDatastoreManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_24(uint64_t a1, void *a2)
{
  id v2;
  SWDatastoreManager *v3;
  void *v4;
  void *v5;
  void *v6;
  SWDatastoreManager *v7;

  v2 = a2;
  v3 = [SWDatastoreManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019C08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550343E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SWDatastoreManager initWithLogger:documentStateProvider:datastoreSynchronizationManager:](v3, "initWithLogger:documentStateProvider:datastoreSynchronizationManager:", v4, v5, v6);
  return v7;
}

SWSetupManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_25(uint64_t a1, void *a2)
{
  id v2;
  SWSetupManager *v3;
  void *v4;
  SWSetupManager *v5;

  v2 = a2;
  v3 = [SWSetupManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWSetupManager initWithLogger:](v3, "initWithLogger:", v4);
  return v5;
}

SWURLSchemeHandlerManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_26(uint64_t a1, void *a2)
{
  id v2;
  SWURLSchemeHandlerManager *v3;
  void *v4;
  void *v5;
  SWURLSchemeHandlerManager *v6;

  v2 = a2;
  v3 = [SWURLSchemeHandlerManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWURLSchemeHandlerManager initWithConfiguration:logger:](v3, "initWithConfiguration:logger:", v4, v5);
  return v6;
}

id __36__SWManagerAssembly_loadInRegistry___block_invoke_27(uint64_t a1, uint64_t a2, void *a3)
{
  return (id)objc_msgSend(a3, "resolveProtocol:", &unk_2550254B8);
}

SWScaleManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_28(uint64_t a1, void *a2)
{
  id v2;
  SWScaleManager *v3;
  void *v4;
  SWScaleManager *v5;

  v2 = a2;
  v3 = [SWScaleManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWScaleManager initWithWebView:scale:](v3, "initWithWebView:scale:", v4, 1.0);
  return v5;
}

SWSnapshotManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_29(uint64_t a1, void *a2)
{
  id v2;
  SWSnapshotManager *v3;
  void *v4;
  void *v5;
  SWSnapshotManager *v6;

  v2 = a2;
  v3 = [SWSnapshotManager alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033AB0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWSnapshotManager initWithWebView:configurationManager:](v3, "initWithWebView:configurationManager:", v4, v5);
  return v6;
}

SWPreferredSizeManager *__36__SWManagerAssembly_loadInRegistry___block_invoke_30(uint64_t a1, void *a2)
{
  id v2;
  SWPreferredSizeManager *v3;
  void *v4;
  void *v5;
  SWPreferredSizeManager *v6;

  v2 = a2;
  v3 = [SWPreferredSizeManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWPreferredSizeManager initWithMessageHandlerManager:logger:](v3, "initWithMessageHandlerManager:logger:", v4, v5);
  return v6;
}

@end
