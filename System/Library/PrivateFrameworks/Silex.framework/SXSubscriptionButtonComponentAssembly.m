@implementation SXSubscriptionButtonComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerClass:factory:", objc_opt_class(), &__block_literal_global_80);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "withConfiguration:", &__block_literal_global_3_1);

  objc_msgSend(v3, "callback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v8, &__block_literal_global_54_18);

  objc_msgSend(v3, "privateContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "registerClass:factory:", objc_opt_class(), &__block_literal_global_56);

  objc_msgSend(v3, "publicContainer");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v12, "registerProtocol:factory:", &unk_254F3A438, &__block_literal_global_62);
}

SXSubscriptionButtonComponentSizerFactory *__56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXSubscriptionButtonComponentSizerFactory *v3;
  void *v4;
  void *v5;
  SXSubscriptionButtonComponentSizerFactory *v6;

  v2 = a2;
  v3 = [SXSubscriptionButtonComponentSizerFactory alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F29E18);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXButtonComponentSizerFactory initWithTextProvider:textSourceFactory:](v3, "initWithTextProvider:textSourceFactory:", v4, v5);
  return v6;
}

void __56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "resolveProtocol:", &unk_254F6B000);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextComponentLayoutHosting:", v5);

}

void __56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

SXSubscriptionButtonComponentTextProvider *__56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXSubscriptionButtonComponentTextProvider *v3;
  void *v4;
  SXSubscriptionButtonComponentTextProvider *v5;

  v2 = a2;
  v3 = [SXSubscriptionButtonComponentTextProvider alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3A438);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXSubscriptionButtonComponentTextProvider initWithTextProvider:](v3, "initWithTextProvider:", v4);
  return v5;
}

SXSubscriptionButtonTextProvider *__56__SXSubscriptionButtonComponentAssembly_loadInRegistry___block_invoke_5()
{
  SXSubscriptionButtonTextProvider *v0;
  void *v1;
  void *v2;
  SXSubscriptionButtonTextProvider *v3;

  v0 = [SXSubscriptionButtonTextProvider alloc];
  SXBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localizedStringForKey:value:table:", CFSTR("Subscribe"), &stru_24D68E0F8, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SXSubscriptionButtonTextProvider initWithTitle:](v0, "initWithTitle:", v2);

  return v3;
}

@end
