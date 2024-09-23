@implementation SXFullscreenAssembly

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
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F06E18, &__block_literal_global_16);

  objc_msgSend(v3, "publicContainer");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_254F322A0, &__block_literal_global_61);
}

SXFullscreenCanvasControllerFactory *__39__SXFullscreenAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXFullscreenCanvasControllerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXFullscreenCanvasControllerFactory *v7;

  v2 = a2;
  v3 = [SXFullscreenCanvasControllerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F322A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C320);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3C2B8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXFullscreenCanvasControllerFactory initWithCaptionViewFactory:presentationAttributesProvider:mediaSharingPolicyProvider:](v3, "initWithCaptionViewFactory:presentationAttributesProvider:mediaSharingPolicyProvider:", v4, v5, v6);
  return v7;
}

SXFullscreenCaptionViewFactory *__39__SXFullscreenAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  SXFullscreenCaptionViewFactory *v3;
  void *v4;
  void *v5;
  SXFullscreenCaptionViewFactory *v6;

  v2 = a2;
  v3 = [SXFullscreenCaptionViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F29E18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F162B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXFullscreenCaptionViewFactory initWithTextSourceFactory:actionHandler:](v3, "initWithTextSourceFactory:actionHandler:", v4, v5);
  return v6;
}

@end
