@implementation SXArticleLinkComponentAssembly

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
  id v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_87);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_20);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_17);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_116_0);

  objc_msgSend(v3, "publicContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v13, "registerProtocol:factory:", &unk_254F68070, &__block_literal_global_117_1);
}

void __49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXArticleLinkComponentViewFactory *__49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXArticleLinkComponentViewFactory *v12;
  SXArticleLinkComponentViewFactory *v14;

  v2 = a2;
  v14 = [SXArticleLinkComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C2B8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F524A8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F32328);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F401C8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F68070);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SXArticleLinkComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:mediaSharingPolicyProvider:interactionHandlerManager:interactionHandlerFactory:URLActionFactory:articleURLFactory:](v14, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:mediaSharingPolicyProvider:interactionHandlerManager:interactionHandlerFactory:URLActionFactory:articleURLFactory:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

SXArticleLinkComponentSizerFactory *__49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_4()
{
  return objc_alloc_init(SXArticleLinkComponentSizerFactory);
}

SXArticleURLFactory *__49__SXArticleLinkComponentAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SXArticleURLFactory);
}

@end
