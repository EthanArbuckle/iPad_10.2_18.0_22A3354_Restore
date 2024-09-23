@implementation SXStyleAssembly

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
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F41B20, &__block_literal_global_96);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F5FBC8, &__block_literal_global_50);

  objc_msgSend(v3, "publicContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerProtocol:factory:", &unk_254F1F420, &__block_literal_global_57_19);

  objc_msgSend(v3, "publicContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254F44E28, &__block_literal_global_101_3);

  objc_msgSend(v3, "publicContainer");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v13, "registerProtocol:factory:", &unk_254F40110, &__block_literal_global_107_2);
}

SXDocumentStyleRenderer *__34__SXStyleAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXDocumentStyleRenderer *v3;
  void *v4;
  void *v5;
  SXDocumentStyleRenderer *v6;

  v2 = a2;
  v3 = [SXDocumentStyleRenderer alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F5FBC8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXDocumentStyleRenderer initWithViewport:gradientFactory:](v3, "initWithViewport:gradientFactory:", v4, v5);
  return v6;
}

SXGradientFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_2()
{
  return objc_alloc_init(SXGradientFactory);
}

SXImageFillViewFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXImageFillViewFactory *v3;
  void *v4;
  void *v5;
  SXImageFillViewFactory *v6;

  v2 = a2;
  v3 = [SXImageFillViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3D0A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXImageFillViewFactory initWithDOMObjectProvider:imageViewFactory:](v3, "initWithDOMObjectProvider:imageViewFactory:", v4, v5);
  return v6;
}

SXVideoFillViewFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXVideoFillViewFactory *v3;
  void *v4;
  void *v5;
  SXVideoFillViewFactory *v6;

  v2 = a2;
  v3 = [SXVideoFillViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3D0A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXVideoFillViewFactory initWithDOMObjectProvider:imageViewFactory:](v3, "initWithDOMObjectProvider:imageViewFactory:", v4, v5);
  return v6;
}

SXRepeatableImageFillViewFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXRepeatableImageFillViewFactory *v3;
  void *v4;
  void *v5;
  SXRepeatableImageFillViewFactory *v6;

  v2 = a2;
  v3 = [SXRepeatableImageFillViewFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F3D0A8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXRepeatableImageFillViewFactory initWithDOMObjectProvider:imageViewFactory:](v3, "initWithDOMObjectProvider:imageViewFactory:", v4, v5);
  return v6;
}

@end
