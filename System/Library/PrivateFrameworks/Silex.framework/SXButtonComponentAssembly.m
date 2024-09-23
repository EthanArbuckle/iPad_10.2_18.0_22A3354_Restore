@implementation SXButtonComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerClass:factory:", objc_opt_class(), &__block_literal_global_17);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_103_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "withConfiguration:", &__block_literal_global_107);

  objc_msgSend(v3, "callback");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v10, &__block_literal_global_117_0);

  objc_msgSend(v3, "callback");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v12, &__block_literal_global_124);

  objc_msgSend(v3, "privateContainer");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v14, "registerClass:factory:", objc_opt_class(), &__block_literal_global_126);
}

SXButtonComponentViewFactory *__44__SXButtonComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXButtonComponentViewFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SXButtonComponentViewFactory *v10;

  v2 = a2;
  v3 = [SXButtonComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F32328);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F524A8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[SXButtonComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:interactionHandlerFactory:interactionHandlerManager:](v3, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:interactionHandlerFactory:interactionHandlerManager:", v4, v5, v6, v7, v8, v9);
  return v10;
}

SXButtonComponentSizerFactory *__44__SXButtonComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SXButtonComponentSizerFactory *v3;
  void *v4;
  void *v5;
  SXButtonComponentSizerFactory *v6;

  v2 = a2;
  v3 = [SXButtonComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F29E18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXButtonComponentSizerFactory initWithTextProvider:textSourceFactory:](v3, "initWithTextProvider:textSourceFactory:", v4, v5);
  return v6;
}

void __44__SXButtonComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "resolveProtocol:", &unk_254F6B000);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextComponentLayoutHosting:", v5);

}

void __44__SXButtonComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2, void *a3)
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

void __44__SXButtonComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2, void *a3)
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

SXButtonComponentTextProvider *__44__SXButtonComponentAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXButtonComponentTextProvider);
}

@end
