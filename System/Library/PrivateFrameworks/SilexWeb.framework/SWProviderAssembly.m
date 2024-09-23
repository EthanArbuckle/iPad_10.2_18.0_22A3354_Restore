@implementation SWProviderAssembly

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
  id v12;
  id v13;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_255019808, &__block_literal_global_3);

  objc_msgSend(v3, "privateContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_25501BF10, &__block_literal_global_55);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_2550340B0, &__block_literal_global_73);

  objc_msgSend(v3, "privateContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_25501B528, &__block_literal_global_80);

  objc_msgSend(v3, "publicContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v13, "registerProtocol:factory:", &unk_255025AE8, &__block_literal_global_85);
}

SWActionProvider *__37__SWProviderAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SWActionProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  SWActionProvider *v7;

  v2 = a2;
  v3 = [SWActionProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501BF10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SWActionProvider initWithMessageHandlerManager:actionFactory:logger:](v3, "initWithMessageHandlerManager:actionFactory:logger:", v4, v5, v6);
  return v7;
}

SWActionFactory *__37__SWProviderAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SWActionFactory *v3;
  void *v4;
  SWActionFactory *v5;

  v2 = a2;
  v3 = [SWActionFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_25501AEB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWActionFactory initWithNavigationManager:](v3, "initWithNavigationManager:", v4);
  return v5;
}

SWInteractionProvider *__37__SWProviderAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SWInteractionProvider *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SWInteractionProvider *v8;

  v2 = a2;
  v3 = [SWInteractionProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019C08);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501B528);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SWInteractionProvider initWithMessageHandlerManager:documentStateProvider:interactionFactory:logger:](v3, "initWithMessageHandlerManager:documentStateProvider:interactionFactory:logger:", v4, v5, v6, v7);
  return v8;
}

SWInteractionFactory *__37__SWProviderAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SWInteractionFactory *v3;
  void *v4;
  SWInteractionFactory *v5;

  v2 = a2;
  v3 = [SWInteractionFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_25501AEB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SWInteractionFactory initWithNavigationManager:](v3, "initWithNavigationManager:", v4);
  return v5;
}

SWLoadingPolicyProvider *__37__SWProviderAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SWLoadingPolicyProvider);
}

@end
