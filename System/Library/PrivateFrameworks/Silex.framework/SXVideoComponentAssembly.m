@implementation SXVideoComponentAssembly

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
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_42);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_6);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_5);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254F1A630, &__block_literal_global_137);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_140);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerClass:factory:", objc_opt_class(), &__block_literal_global_142);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254F542E8, &__block_literal_global_143);

  objc_msgSend(v3, "publicContainer");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  v18 = (id)objc_msgSend(v19, "registerClass:factory:", objc_opt_class(), &__block_literal_global_145);
}

void __43__SXVideoComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __43__SXVideoComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXVideoComponentViewFactory *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SXVideoComponentViewFactory *v15;
  SXVideoComponentViewFactory *v16;
  void *v17;
  void *v18;

  v2 = a2;
  v15 = [SXVideoComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91590);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1A630);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F52650);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91670);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F681E8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2FB38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F542E8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SXVideoComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:analyticsReportingProvider:appStateMonitor:sceneStateMonitor:resourceDataSourceProvider:reachabilityProvider:scrollObserverManager:videoPlayerViewControllerManager:bookmarkManager:prerollAdFactory:](v15, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:analyticsReportingProvider:appStateMonitor:sceneStateMonitor:resourceDataSourceProvider:reachabilityProvider:scrollObserverManager:videoPlayerViewControllerManager:bookmarkManager:prerollAdFactory:", v18, v3, v4, v17, v14, v13, v12, v11, v5, v6, v7, v8, v9);
  return v16;
}

SXDefaultSceneStateMonitor *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_4()
{
  return objc_alloc_init(SXDefaultSceneStateMonitor);
}

SXVideoComponentSizerFactory *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SXVideoComponentSizerFactory);
}

SXVideoPlayerViewControllerManager *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXVideoPlayerViewControllerManager);
}

id __43__SXVideoComponentAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXLegacyPrerollAdFactory *__43__SXVideoComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  SXLegacyPrerollAdFactory *v3;
  void *v4;
  void *v5;
  SXLegacyPrerollAdFactory *v6;

  v2 = a2;
  v3 = [SXLegacyPrerollAdFactory alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F681E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXLegacyPrerollAdFactory initWithViewport:scrollObserverManager:](v3, "initWithViewport:scrollObserverManager:", v4, v5);
  return v6;
}

@end
