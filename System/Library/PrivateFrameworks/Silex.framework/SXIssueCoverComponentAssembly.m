@implementation SXIssueCoverComponentAssembly

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
  id v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_50);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_7);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_6);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_107_1);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F71AF0, &__block_literal_global_112_1);

  objc_msgSend(v3, "publicContainer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v15, "registerProtocol:factory:", &unk_254F57A18, &__block_literal_global_115_0);
}

void __48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXIssueCoverComponentViewFactory *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXIssueCoverComponentViewFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXIssueCoverComponentViewFactory *v9;

  v2 = a2;
  v3 = [SXIssueCoverComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F71AF0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SXIssueCoverComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:viewProvider:](v3, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:viewProvider:", v4, v5, v6, v7, v8);
  return v9;
}

SXIssueCoverComponentSizerFactory *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXIssueCoverComponentSizerFactory *v3;
  void *v4;
  SXIssueCoverComponentSizerFactory *v5;

  v2 = a2;
  v3 = [SXIssueCoverComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F57A18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXIssueCoverComponentSizerFactory initWithLayoutAttributesFactory:](v3, "initWithLayoutAttributesFactory:", v4);
  return v5;
}

SXIssueCoverViewProvider *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXIssueCoverViewProvider *v3;
  void *v4;
  SXIssueCoverViewProvider *v5;

  v2 = a2;
  v3 = [SXIssueCoverViewProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F57A18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXIssueCoverViewProvider initWithLayoutAttributesFactory:](v3, "initWithLayoutAttributesFactory:", v4);
  return v5;
}

SXIssueCoverLayoutAttributesFactory *__48__SXIssueCoverComponentAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXIssueCoverLayoutAttributesFactory);
}

@end
