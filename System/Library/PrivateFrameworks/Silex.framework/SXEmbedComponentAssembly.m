@implementation SXEmbedComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_65);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_13);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_11);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_149_0);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_151_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "inScope:", 2);

  objc_msgSend(v3, "privateContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "registerProtocol:factory:", &unk_254F68498, &__block_literal_global_155);

  objc_msgSend(v3, "publicContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:factory:", objc_opt_class(), &__block_literal_global_166_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerProtocol:factory:", &unk_254F3E238, &__block_literal_global_167);

  objc_msgSend(v3, "publicContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254F372F0, &__block_literal_global_169_0);

  objc_msgSend(v3, "privateContainer");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v24 = (id)objc_msgSend(v25, "registerProtocol:factory:", &unk_254F7C428, &__block_literal_global_175);
}

void __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXEmbedComponentViewFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SXEmbedComponentViewFactory *v15;
  SXEmbedComponentViewFactory *v16;
  void *v17;
  void *v18;

  v2 = a2;
  v15 = [SXEmbedComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91670);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91CC8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F162B0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F71590);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F372F0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1A630);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SXEmbedComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:reachabilityProvider:embedDataProvider:actionHandler:layoutInvalidator:websiteDataStore:relatedWebViewCache:proxyAuthenticationHandler:sceneStateMonitor:analyticsReportingProvider:](v15, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:reachabilityProvider:embedDataProvider:actionHandler:layoutInvalidator:websiteDataStore:relatedWebViewCache:proxyAuthenticationHandler:sceneStateMonitor:analyticsReportingProvider:", v18, v12, v3, v17, v14, v13, v11, v10, v4, v5, v6, v7, v8);
  return v16;
}

SXEmbedComponentSizerFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXEmbedComponentSizerFactory *v3;
  void *v4;
  void *v5;
  SXEmbedComponentSizerFactory *v6;

  v2 = a2;
  v3 = [SXEmbedComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91CC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXEmbedComponentSizerFactory initWithDOMObjectProvider:embedDataProvider:](v3, "initWithDOMObjectProvider:embedDataProvider:", v4, v5);
  return v6;
}

id __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "resolveProtocol:", &unk_254F68498);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createWebsiteDataStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXWebsiteDataStoreFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  SXWebsiteDataStoreFactory *v3;
  void *v4;
  SXWebsiteDataStoreFactory *v5;

  v2 = a2;
  v3 = [SXWebsiteDataStoreFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E238);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXWebsiteDataStoreFactory initWithProxyConfiguration:](v3, "initWithProxyConfiguration:", v4);
  return v5;
}

SXRelatedWebViewCache *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_7()
{
  return objc_alloc_init(SXRelatedWebViewCache);
}

id __43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_8()
{
  return +[SXProxyConfiguration direct](SXProxyConfiguration, "direct");
}

SXProxyAuthenticationHandler *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SXProxyAuthenticationHandler *v3;
  void *v4;
  void *v5;
  SXProxyAuthenticationHandler *v6;

  v2 = a2;
  v3 = [SXProxyAuthenticationHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7C428);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3E238);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXProxyAuthenticationHandler initWithCredentialFactory:proxyConfiguration:retryCount:](v3, "initWithCredentialFactory:proxyConfiguration:retryCount:", v4, v5, 1);
  return v6;
}

SXProxyAuthenticationCredentialFactory *__43__SXEmbedComponentAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SXProxyAuthenticationCredentialFactory *v3;
  void *v4;
  SXProxyAuthenticationCredentialFactory *v5;

  v2 = a2;
  v3 = [SXProxyAuthenticationCredentialFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6A450);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXProxyAuthenticationCredentialFactory initWithKeyProvider:](v3, "initWithKeyProvider:", v4);
  return v5;
}

@end
