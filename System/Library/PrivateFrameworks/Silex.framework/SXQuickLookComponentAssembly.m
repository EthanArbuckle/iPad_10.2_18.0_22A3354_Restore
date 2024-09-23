@implementation SXQuickLookComponentAssembly

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
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_52);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_8);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_7);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_122_1);

  objc_msgSend(v3, "privateContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v13, "registerProtocol:factory:", &unk_254F460A0, &__block_literal_global_124_0);
}

void __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXQuickLookComponentViewFactory *__47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookComponentViewFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  SXQuickLookComponentViewFactory *v11;
  _QWORD v13[4];
  id v14;

  v2 = a2;
  v3 = [SXQuickLookComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F460A0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_4;
  v13[3] = &unk_24D68AEF8;
  v14 = v2;
  v9 = v2;
  objc_msgSend(v9, "resolveProtocol:contextBlock:", &unk_254F6F0A8, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SXQuickLookComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:fileProvider:quickLookModule:](v3, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:fileProvider:quickLookModule:", v4, v5, v6, v7, v8, v10);

  return v11;
}

void __47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40D68);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "useObject:forProtocol:", v4, &unk_254F40D68);

}

SXQuickLookComponentSizerFactory *__47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SXQuickLookComponentSizerFactory);
}

SXQuickLookComponentFileProvider *__47__SXQuickLookComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  SXQuickLookComponentFileProvider *v5;
  void *v6;
  void *v7;
  SXQuickLookComponentFileProvider *v8;

  v2 = a2;
  objc_msgSend(v2, "resolveProtocol:", &unk_254F718A8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "documentController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [SXQuickLookComponentFileProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F52650);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXQuickLookComponentFileProvider initWithDOMObjectProvider:resourceDataSourceProvider:shareURLProvider:](v5, "initWithDOMObjectProvider:resourceDataSourceProvider:shareURLProvider:", v6, v7, v4);
  return v8;
}

@end
