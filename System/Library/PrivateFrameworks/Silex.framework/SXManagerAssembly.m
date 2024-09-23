@implementation SXManagerAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerProtocol:factory:", &unk_254F447E0, &__block_literal_global_77);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "withConfiguration:", &__block_literal_global_54_16);

  objc_msgSend(v3, "publicContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_254F19A98, &__block_literal_global_60_0);

  objc_msgSend(v3, "privateContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "registerClass:factory:", objc_opt_class(), &__block_literal_global_63);

  objc_msgSend(v3, "privateContainer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_79);
}

SXInteractionContextManager *__36__SXManagerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXInteractionContextManager *v3;
  void *v4;
  SXInteractionContextManager *v5;

  v2 = a2;
  v3 = [SXInteractionContextManager alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXInteractionContextManager initWithViewport:](v3, "initWithViewport:", v4);
  return v5;
}

void __36__SXManagerAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProvider:", v6);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addProvider:", v7);
}

SXLinkHoverStylingManager *__36__SXManagerAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXLinkHoverStylingManager *v3;
  void *v4;
  SXLinkHoverStylingManager *v5;

  v2 = a2;
  v3 = [SXLinkHoverStylingManager alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXLinkHoverStylingManager initWithTangierController:](v3, "initWithTangierController:", v4);
  return v5;
}

SXTextInteractionContextProvider *__36__SXManagerAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXTextInteractionContextProvider *v3;
  void *v4;
  void *v5;
  SXTextInteractionContextProvider *v6;

  v2 = a2;
  v3 = [SXTextInteractionContextProvider alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXTextInteractionContextProvider initWithTangierController:actionManager:](v3, "initWithTangierController:actionManager:", v4, v5);
  return v6;
}

SXComponentInteractionContextProvider *__36__SXManagerAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXComponentInteractionContextProvider *v3;
  void *v4;
  void *v5;
  SXComponentInteractionContextProvider *v6;

  v2 = a2;
  v3 = [SXComponentInteractionContextProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F524A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXComponentInteractionContextProvider initWithComponentInteractionHandlerManager:actionManager:](v3, "initWithComponentInteractionHandlerManager:actionManager:", v4, v5);
  return v6;
}

@end
