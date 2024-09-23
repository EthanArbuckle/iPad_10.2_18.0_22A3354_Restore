@implementation SXFormatAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F29F88, &__block_literal_global_24);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F308D0, &__block_literal_global_54_3);

  objc_msgSend(v3, "privateContainer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v9, "registerProtocol:factory:", &unk_254F08AB0, &__block_literal_global_112_0);
}

SXFormatModule *__35__SXFormatAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXFormatModule *v3;

  v2 = a2;
  v3 = -[SXFormatModule initWithResolver:]([SXFormatModule alloc], "initWithResolver:", v2);

  return v3;
}

SXFormatInteractor *__35__SXFormatAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
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
  SXFormatInteractor *v12;
  SXFormatInteractor *v14;

  v2 = a2;
  v14 = [SXFormatInteractor alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F58558);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F08AB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C320);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44D58);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F16998);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F51550);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03D40);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F06CB8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91778);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SXFormatInteractor initWithLayoutCoordinator:layoutOptionsFactory:presentationAttributesProvider:subscriptionStatusProvider:debugLayoutOptionsProvider:newsletterSubscriptionStatusProvider:offerUpsellScenarioProvider:subscriptionActivationEligibilityProvider:renderingConfigurationProvider:](v14, "initWithLayoutCoordinator:layoutOptionsFactory:presentationAttributesProvider:subscriptionStatusProvider:debugLayoutOptionsProvider:newsletterSubscriptionStatusProvider:offerUpsellScenarioProvider:subscriptionActivationEligibilityProvider:renderingConfigurationProvider:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

SXLayoutOptionsFactory *__35__SXFormatAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXLayoutOptionsFactory *v3;
  void *v4;
  void *v5;
  SXLayoutOptionsFactory *v6;

  v2 = a2;
  v3 = [SXLayoutOptionsFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F2A8F8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXLayoutOptionsFactory initWithColumnCalculator:documentProvider:](v3, "initWithColumnCalculator:documentProvider:", v4, v5);
  return v6;
}

@end
