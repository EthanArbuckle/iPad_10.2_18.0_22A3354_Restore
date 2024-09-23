@implementation SXAdAssembly

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
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F461D0, &__block_literal_global_67);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F7E390, &__block_literal_global_55);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254F46908, &__block_literal_global_60);

  objc_msgSend(v3, "callback");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F412E8, v11, &__block_literal_global_73);

  objc_msgSend(v3, "publicContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_76_0);

  objc_msgSend(v3, "privateContainer");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "registerProtocol:name:factory:", &unk_254F5FD48, CFSTR("ad-insertion"), &__block_literal_global_91);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "withConfiguration:", &__block_literal_global_94);

}

SXAdvertisingSettingsFactory *__31__SXAdAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXAdvertisingSettingsFactory *v3;
  void *v4;
  void *v5;
  SXAdvertisingSettingsFactory *v6;

  v2 = a2;
  v3 = [SXAdvertisingSettingsFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7E390);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXAdvertisingSettingsFactory initWithDocumentProvider:debugSettingsProvider:](v3, "initWithDocumentProvider:debugSettingsProvider:", v4, v5);
  return v6;
}

SXDebugAdvertisementSettingsProvider *__31__SXAdAssembly_loadInRegistry___block_invoke_2()
{
  return -[SXDebugAdvertisementSettingsProvider initWithDebugSettings:]([SXDebugAdvertisementSettingsProvider alloc], "initWithDebugSettings:", 0);
}

SXAdIgnorableViewFactory *__31__SXAdAssembly_loadInRegistry___block_invoke_3()
{
  return objc_alloc_init(SXAdIgnorableViewFactory);
}

void __31__SXAdAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v4, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addInserter:", v6);
}

SXAdComponentInserter *__31__SXAdAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXAdComponentInserter *v3;
  void *v4;
  void *v5;
  SXAdComponentInserter *v6;

  v2 = a2;
  v3 = [SXAdComponentInserter alloc];
  objc_msgSend(v2, "resolveProtocol:name:", &unk_254F5FD48, CFSTR("ad-insertion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F461D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXAdComponentInserter initWithConditionEngine:advertisingSettingsFactory:](v3, "initWithConditionEngine:advertisingSettingsFactory:", v4, v5);
  return v6;
}

SXComponentInsertionConditionEngine *__31__SXAdAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(SXComponentInsertionConditionEngine);
}

void __31__SXAdAssembly_loadInRegistry___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  SXFirstViewportComponentInsertionCondition *v4;
  SXPastBodyComponentInsertionCondition *v5;

  v3 = a3;
  v4 = objc_alloc_init(SXFirstViewportComponentInsertionCondition);
  objc_msgSend(v3, "addCondition:", v4);

  v5 = objc_alloc_init(SXPastBodyComponentInsertionCondition);
  objc_msgSend(v3, "addCondition:", v5);

}

@end
