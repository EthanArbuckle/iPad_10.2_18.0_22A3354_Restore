@implementation SXTangierAssembly

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
  id v14;
  id v15;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerClass:factory:", objc_opt_class(), &__block_literal_global_98);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_4_2);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254F6B000, &__block_literal_global_137_0);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_139_0);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F058A8, &__block_literal_global_144);

  objc_msgSend(v3, "publicContainer");
  v15 = (id)objc_claimAutoreleasedReturnValue();

  v14 = (id)objc_msgSend(v15, "registerProtocol:factory:", &unk_254F29E18, &__block_literal_global_159_0);
}

SXScrollView *__36__SXTangierAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(SXScrollView);
}

SXTangierController *__36__SXTangierAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
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
  SXTangierController *v12;
  SXTangierController *v14;

  v2 = a2;
  v14 = [SXTangierController alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F162B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F80080);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F576C0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F46908);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F06980);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SXTangierController initWithViewport:scrollView:componentActionHandler:dragItemProvider:componentController:componentInteractionManager:DOMObjectProvider:adIgnorableViewFactory:config:](v14, "initWithViewport:scrollView:componentActionHandler:dragItemProvider:componentController:componentInteractionManager:DOMObjectProvider:adIgnorableViewFactory:config:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

id __36__SXTangierAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXTangierDragItemProvider *__36__SXTangierAssembly_loadInRegistry___block_invoke_4()
{
  return objc_alloc_init(SXTangierDragItemProvider);
}

SXSmartFieldFactory *__36__SXTangierAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXSmartFieldFactory *v3;
  void *v4;
  void *v5;
  SXSmartFieldFactory *v6;

  v2 = a2;
  v3 = [SXSmartFieldFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F61BF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F142D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXSmartFieldFactory initWithActionProvider:actionSerializer:](v3, "initWithActionProvider:actionSerializer:", v4, v5);
  return v6;
}

SXTextSourceFactory *__36__SXTangierAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  SXTextSourceFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXTextSourceFactory *v7;

  v2 = a2;
  v3 = [SXTextSourceFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F058A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2FA58);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F55350);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXTextSourceFactory initWithSmartFieldFactory:documentLanguageProvider:fontAttributesConstructor:](v3, "initWithSmartFieldFactory:documentLanguageProvider:fontAttributesConstructor:", v4, v5, v6);
  return v7;
}

@end
