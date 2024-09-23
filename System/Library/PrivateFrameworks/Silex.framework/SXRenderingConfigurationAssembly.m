@implementation SXRenderingConfigurationAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F706C8, &__block_literal_global_20);

  objc_msgSend(v3, "privateContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v7, "registerClass:factory:", objc_opt_class(), &__block_literal_global_45);
}

id __51__SXRenderingConfigurationAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXRenderingConfigurationOptionsManager *__51__SXRenderingConfigurationAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SXRenderingConfigurationOptionsManager *v3;
  void *v4;
  void *v5;
  SXRenderingConfigurationOptionsManager *v6;

  v2 = a2;
  v3 = [SXRenderingConfigurationOptionsManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F42130);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91778);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXRenderingConfigurationOptionsManager initWithDocumentProvider:configurationProvider:](v3, "initWithDocumentProvider:configurationProvider:", v4, v5);
  return v6;
}

@end
