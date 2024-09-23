@implementation SXTextComponentAssembly

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
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;

  v3 = a3;
  objc_msgSend(v3, "callback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_54);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_9);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_8);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_102);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_109);

  objc_msgSend(v3, "privateContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "registerClass:factory:", objc_opt_class(), &__block_literal_global_114);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "inScope:", 2);

  objc_msgSend(v3, "privateContainer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "registerClass:factory:", objc_opt_class(), &__block_literal_global_116);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  v20 = (id)objc_msgSend(v21, "registerProtocol:factory:", &unk_254F55350, &__block_literal_global_126_0);
}

void __42__SXTextComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __42__SXTextComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXTextComponentViewFactory *__42__SXTextComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXTextComponentViewFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXTextComponentViewFactory *v9;

  v2 = a2;
  v3 = [SXTextComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SXTextComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:tangierController:](v3, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:tangierController:", v4, v5, v6, v7, v8);
  return v9;
}

SXTextComponentSizerFactory *__42__SXTextComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXTextComponentSizerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXTextComponentSizerFactory *v7;

  v2 = a2;
  v3 = [SXTextComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6B000);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F29E18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXTextComponentSizerFactory initWithDOMObjectProvider:textComponentLayoutHosting:textSourceFactory:](v3, "initWithDOMObjectProvider:textComponentLayoutHosting:textSourceFactory:", v4, v5, v6);
  return v7;
}

SXFontIndex *__42__SXTextComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXFontIndex *v3;
  void *v4;
  void *v5;
  void *v6;
  SXFontIndex *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = [SXFontIndex alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SXFontIndex initWithFontFamilyProviders:](v3, "initWithFontFamilyProviders:", v6);

  return v7;
}

SXSystemFontFamilyProvider *__42__SXTextComponentAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXSystemFontFamilyProvider);
}

SXSanFranciscoFontFamilyProvider *__42__SXTextComponentAssembly_loadInRegistry___block_invoke_7()
{
  return objc_alloc_init(SXSanFranciscoFontFamilyProvider);
}

SXFontAttributesConstructor *__42__SXTextComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  SXFontAttributesConstructor *v3;
  void *v4;
  SXFontAttributesConstructor *v5;

  v2 = a2;
  v3 = [SXFontAttributesConstructor alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXFontAttributesConstructor initWithFontIndex:](v3, "initWithFontIndex:", v4);
  return v5;
}

@end
