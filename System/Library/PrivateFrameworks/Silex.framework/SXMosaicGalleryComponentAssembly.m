@implementation SXMosaicGalleryComponentAssembly

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
  objc_msgSend(v4, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F3E388, v5, &__block_literal_global_81);

  objc_msgSend(v3, "callback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  TFCallbackScopeAny();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "whenResolvingProtocol:scope:callbackBlock:", &unk_254F6F8B0, v7, &__block_literal_global_54_19);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_57_16);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerClass:factory:", objc_opt_class(), &__block_literal_global_121_0);

  objc_msgSend(v3, "privateContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v13, "registerProtocol:factory:", &unk_254F17060, &__block_literal_global_123_1);
}

void __51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

SXMosaicGalleryComponentViewFactory *__51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
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
  SXMosaicGalleryComponentViewFactory *v12;
  SXMosaicGalleryComponentViewFactory *v14;

  v2 = a2;
  v14 = [SXMosaicGalleryComponentViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70E20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44128);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91590);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C2B8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17060);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F06E18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SXMosaicGalleryComponentViewFactory initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:analyticsReportingProvider:appStateMonitor:mediaSharingPolicyProvider:imageViewFactory:canvasControllerFactory:](v14, "initWithDOMObjectProvider:viewport:presentationDelegateProvider:componentStyleRendererFactory:analyticsReportingProvider:appStateMonitor:mediaSharingPolicyProvider:imageViewFactory:canvasControllerFactory:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

SXMosaicGalleryComponentSizerFactory *__51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_4()
{
  return objc_alloc_init(SXMosaicGalleryComponentSizerFactory);
}

SXGalleryItemImageViewFactory *__51__SXMosaicGalleryComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXGalleryItemImageViewFactory *v3;
  void *v4;
  void *v5;
  SXGalleryItemImageViewFactory *v6;

  v2 = a2;
  v3 = [SXGalleryItemImageViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F52650);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91670);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXGalleryItemImageViewFactory initWithResourceDataSourceProvider:reachabilityProvider:](v3, "initWithResourceDataSourceProvider:reachabilityProvider:", v4, v5);
  return v6;
}

@end
