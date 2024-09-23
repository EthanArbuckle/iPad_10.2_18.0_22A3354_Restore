@implementation SXWebContentComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_64);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_12);

  objc_msgSend(v3, "callback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F917D8, v9, &__block_literal_global_76);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_81);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_199_0);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerClass:factory:", objc_opt_class(), &__block_literal_global_202_0);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254F40A08, &__block_literal_global_204_0);

  objc_msgSend(v3, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254F6F1E8, &__block_literal_global_233_0);

  objc_msgSend(v3, "publicContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerProtocol:factory:", &unk_254F71B90, &__block_literal_global_265);

  objc_msgSend(v3, "privateContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254F6ED58, &__block_literal_global_268);

  objc_msgSend(v3, "publicContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerProtocol:factory:", &unk_254F14190, &__block_literal_global_271);

  objc_msgSend(v3, "publicContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "registerProtocol:factory:", &unk_254F0A000, &__block_literal_global_274);

  objc_msgSend(v3, "publicContainer");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (id)objc_msgSend(v28, "registerClass:factory:", objc_opt_class(), &__block_literal_global_277_0);

  objc_msgSend(v3, "publicContainer");
  v31 = (id)objc_claimAutoreleasedReturnValue();

  v30 = (id)objc_msgSend(v31, "registerClass:factory:", objc_opt_class(), &__block_literal_global_296_0);
}

void __48__SXWebContentComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addFactory:", v6);
}

void __48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addFactory:", v6);
}

void __48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerHandler:scheme:", v6, CFSTR("action"));

  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "registerHandler:", v7);
}

SXWebContentComponentViewFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  SXWebContentComponentViewFactory *v16;
  SXWebContentComponentViewFactory *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v2 = a2;
  v16 = [SXWebContentComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40A08);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F917D8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70BE0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6F1E8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91670);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F52650);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91880);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6ED58);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F71590);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F14190);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F0A000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXWebContentComponentViewFactory initWithResolver:DOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:containerViewController:configurationProvider:navigationManager:analyticsReportingProvider:componentExposureMonitor:interactionManagerFactory:reachabilityProvider:resourceDataSourceProvider:loadingPolicyProvider:dataSourceProvider:layoutInvalidator:contentRuleProvider:developerSettingsProvider:](v16, "initWithResolver:DOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:containerViewController:configurationProvider:navigationManager:analyticsReportingProvider:componentExposureMonitor:interactionManagerFactory:reachabilityProvider:resourceDataSourceProvider:loadingPolicyProvider:dataSourceProvider:layoutInvalidator:contentRuleProvider:developerSettingsProvider:", v2, v22, v18, v15, v14, v13, v21, v20, v19, v12, v11, v10, v9, v3,
          v4,
          v5,
          v6,
          v7);

  return v17;
}

SXWebContentComponentSizerFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXWebContentComponentSizerFactory *v3;
  void *v4;
  void *v5;
  SXWebContentComponentSizerFactory *v6;

  v2 = a2;
  v3 = [SXWebContentComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91880);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXWebContentComponentSizerFactory initWithDOMObjectProvider:loadingPolicyProvider:](v3, "initWithDOMObjectProvider:loadingPolicyProvider:", v4, v5);
  return v6;
}

SXFallbackLiveActivityAttributesProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXFallbackLiveActivityAttributesProvider);
}

SXWebContentConfigurationProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  SXWebContentConfigurationProvider *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXWebContentConfigurationProvider *v12;

  v2 = a2;
  objc_msgSend(v2, "resolveOptionalProtocol:", &unk_254F80AE8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "resolveClass:", objc_opt_class());
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  v7 = [SXWebContentConfigurationProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C320);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91970);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91A90);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SXWebContentConfigurationProvider initWithPresentationAttributesProvider:storeFrontProvider:liveActivityAttributesProvider:locale:location:](v7, "initWithPresentationAttributesProvider:storeFrontProvider:liveActivityAttributesProvider:locale:location:", v8, v9, v6, v10, v11);

  return v12;
}

SXWebContentComponentInteractionManagerFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  SXWebContentComponentInteractionManagerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXWebContentComponentInteractionManagerFactory *v7;

  v2 = a2;
  v3 = [SXWebContentComponentInteractionManagerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91C10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F524A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F71B90);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXWebContentComponentInteractionManagerFactory initWithInteractionProvider:interactionHandlerManager:componentInteractionHandlerFactory:](v3, "initWithInteractionProvider:interactionHandlerManager:componentInteractionHandlerFactory:", v4, v5, v6);
  return v7;
}

SXWebContentComponentInteractionHandlerFactory *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_9()
{
  return objc_alloc_init(SXWebContentComponentInteractionHandlerFactory);
}

SXWebContentDataSourceProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SXWebContentDataSourceProvider *v3;
  void *v4;
  void *v5;
  SXWebContentDataSourceProvider *v6;

  v2 = a2;
  v3 = [SXWebContentDataSourceProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F52650);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXWebContentDataSourceProvider initWithDOMObjectProvider:resourceDataSourceProvider:](v3, "initWithDOMObjectProvider:resourceDataSourceProvider:", v4, v5);
  return v6;
}

SXWebContentComponentContentRuleProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_11()
{
  return objc_alloc_init(SXWebContentComponentContentRuleProvider);
}

SXWebContentComponentDeveloperSettingsProvider *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_12()
{
  return objc_alloc_init(SXWebContentComponentDeveloperSettingsProvider);
}

SXWebContentGenericNavigationHandler *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  SXWebContentGenericNavigationHandler *v3;
  void *v4;
  void *v5;
  SXWebContentGenericNavigationHandler *v6;

  v2 = a2;
  v3 = [SXWebContentGenericNavigationHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F401C8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXWebContentGenericNavigationHandler initWithActionManager:URLActionFactory:](v3, "initWithActionManager:URLActionFactory:", v4, v5);
  return v6;
}

SXWebContentActionNavigationHandler *__48__SXWebContentComponentAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2;
  SXWebContentActionNavigationHandler *v3;
  void *v4;
  void *v5;
  SXWebContentActionNavigationHandler *v6;

  v2 = a2;
  v3 = [SXWebContentActionNavigationHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F61BF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXWebContentActionNavigationHandler initWithActionProvider:actionManager:](v3, "initWithActionProvider:actionManager:", v4, v5);
  return v6;
}

@end
