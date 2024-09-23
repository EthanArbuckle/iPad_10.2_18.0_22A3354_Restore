@implementation SXDataTableComponentAssembly

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
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_160);

  objc_msgSend(v3, "privateContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F52770, &__block_literal_global_169);

  objc_msgSend(v3, "privateContainer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v15, "registerProtocol:factory:", &unk_254F085E8, &__block_literal_global_187);
}

void __47__SXDataTableComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXDataTableComponentViewFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXDataTableComponentViewFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  SXDataTableComponentViewFactory *v13;
  void *v14;
  void *v15;

  v2 = a2;
  v3 = [SXDataTableComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3D0A8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F162B0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6B000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F80080);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F46908);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F06980);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SXDataTableComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:imageViewFactory:componentActionHandler:textComponentLayoutHosting:componentController:adIgnorableViewFactory:config:](v3, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:imageViewFactory:componentActionHandler:textComponentLayoutHosting:componentController:adIgnorableViewFactory:config:", v4, v5, v6, v15, v14, v7, v8, v9, v10, v11);
  return v13;
}

SXDataTableComponentSizerFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXDataTableComponentSizerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SXDataTableComponentSizerFactory *v8;

  v2 = a2;
  v3 = [SXDataTableComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6B000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F52770);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F085E8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXDataTableComponentSizerFactory initWithDOMObjectProvider:textComponentLayoutHosting:textSourceFactory:recordValueTransformerFactory:](v3, "initWithDOMObjectProvider:textComponentLayoutHosting:textSourceFactory:recordValueTransformerFactory:", v4, v5, v6, v7);
  return v8;
}

SXDataTableTextSourceFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXDataTableTextSourceFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXDataTableTextSourceFactory *v7;

  v2 = a2;
  v3 = [SXDataTableTextSourceFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F058A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2FA58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F55350);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXDataTableTextSourceFactory initWithSmartFieldFactory:documentLanguageProvider:fontAttributesConstructor:](v3, "initWithSmartFieldFactory:documentLanguageProvider:fontAttributesConstructor:", v4, v5, v6);
  return v7;
}

SXDataRecordValueTransformerFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  SXDataRecordValueTransformerFactory *v3;
  void *v4;
  SXDataRecordValueTransformerFactory *v5;

  v2 = a2;
  v3 = [SXDataRecordValueTransformerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXDataRecordValueTransformerFactory initWithDOMObjectProvider:](v3, "initWithDOMObjectProvider:", v4);
  return v5;
}

@end
