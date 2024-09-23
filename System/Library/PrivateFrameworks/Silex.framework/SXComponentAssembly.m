@implementation SXComponentAssembly

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
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerProtocol:factory:", &unk_254F80080, &__block_literal_global_5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "withConfiguration:", &__block_literal_global_110_0);

  objc_msgSend(v3, "publicContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_254F44128, &__block_literal_global_122);

  objc_msgSend(v3, "publicContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "registerProtocol:factory:", &unk_254F3E388, &__block_literal_global_136);

  objc_msgSend(v3, "publicContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "registerProtocol:factory:", &unk_254F17FC0, &__block_literal_global_146);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v12, "withConfiguration:", &__block_literal_global_149);

  objc_msgSend(v3, "publicContainer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "registerProtocol:factory:", &unk_254F576C0, &__block_literal_global_162);

  objc_msgSend(v3, "publicContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "registerProtocol:factory:", &unk_254F524A8, &__block_literal_global_177);

  objc_msgSend(v3, "publicContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerClass:factory:", objc_opt_class(), &__block_literal_global_180);

  objc_msgSend(v3, "publicContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerProtocol:factory:", &unk_254F32328, &__block_literal_global_190);

  objc_msgSend(v3, "publicContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254F162B0, &__block_literal_global_218_0);

  objc_msgSend(v3, "privateContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerClass:factory:", objc_opt_class(), &__block_literal_global_221);

  objc_msgSend(v3, "publicContainer");
  v27 = (id)objc_claimAutoreleasedReturnValue();

  v26 = (id)objc_msgSend(v27, "registerProtocol:factory:", &unk_254F70BE0, &__block_literal_global_238);
}

SXComponentController *__38__SXComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXComponentController *v3;
  void *v4;
  void *v5;
  SXComponentController *v6;

  v2 = a2;
  v3 = [SXComponentController alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17D00);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXComponentController initWithViewport:DOMObjectProvider:](v3, "initWithViewport:DOMObjectProvider:", v4, v5);
  return v6;
}

void __38__SXComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHost:", v6);

  objc_msgSend(v5, "resolveProtocol:", &unk_254F3E388);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setComponentViewEngine:", v7);
}

SXComponentStyleRendererFactory *__38__SXComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXComponentStyleRendererFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SXComponentStyleRendererFactory *v9;

  v2 = a2;
  v3 = [SXComponentStyleRendererFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1F420);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F44E28);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F5FBC8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F40110);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[SXComponentStyleRendererFactory initWithImageFillViewFactory:videoFillViewFactory:gradientFactory:repeatableImageFillViewFactory:viewport:](v3, "initWithImageFillViewFactory:videoFillViewFactory:gradientFactory:repeatableImageFillViewFactory:viewport:", v4, v5, v6, v7, v8);
  return v9;
}

SXComponentViewEngine *__38__SXComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  SXComponentViewEngine *v3;
  void *v4;
  SXComponentViewEngine *v5;

  v2 = a2;
  v3 = [SXComponentViewEngine alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F17FC0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXComponentViewEngine initWithPostProcessorManager:](v3, "initWithPostProcessorManager:", v4);
  return v5;
}

SXComponentViewPostProcessorManager *__38__SXComponentAssembly_loadInRegistry___block_invoke_5()
{
  return objc_alloc_init(SXComponentViewPostProcessorManager);
}

void __38__SXComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addProcessor:", v6);

  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addProcessor:", v7);
}

SXComponentInteractionManager *__38__SXComponentAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  SXComponentInteractionManager *v3;
  void *v4;
  void *v5;
  SXComponentInteractionManager *v6;

  v2 = a2;
  v3 = [SXComponentInteractionManager alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F524A8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXComponentInteractionManager initWithInteractionHandlerManager:viewport:](v3, "initWithInteractionHandlerManager:viewport:", v4, v5);
  return v6;
}

SXComponentInteractionHandlerManager *__38__SXComponentAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2;
  SXComponentInteractionHandlerManager *v3;
  void *v4;
  SXComponentInteractionHandlerManager *v5;

  v2 = a2;
  v3 = [SXComponentInteractionHandlerManager alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXComponentInteractionHandlerManager initWithViewport:](v3, "initWithViewport:", v4);
  return v5;
}

SXActionComponentViewPostProcessor *__38__SXComponentAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SXActionComponentViewPostProcessor *v3;
  void *v4;
  void *v5;
  void *v6;
  SXActionComponentViewPostProcessor *v7;

  v2 = a2;
  v3 = [SXActionComponentViewPostProcessor alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F61BF0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F32328);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F524A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXActionComponentViewPostProcessor initWithActionProvider:interactionHandlerFactory:interactionHandlerManager:](v3, "initWithActionProvider:interactionHandlerFactory:interactionHandlerManager:", v4, v5, v6);
  return v7;
}

SXActionComponentInteractionHandlerFactory *__38__SXComponentAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  SXActionComponentInteractionHandlerFactory *v3;
  void *v4;
  void *v5;
  void *v6;
  SXActionComponentInteractionHandlerFactory *v7;

  v2 = a2;
  v3 = [SXActionComponentInteractionHandlerFactory alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F142D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXActionComponentInteractionHandlerFactory initWithActionManager:actionSerializer:analyticsReportingProvider:](v3, "initWithActionManager:actionSerializer:analyticsReportingProvider:", v4, v5, v6);
  return v7;
}

SXComponentActionHandler *__38__SXComponentAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  SXComponentActionHandler *v3;
  void *v4;
  void *v5;
  void *v6;
  SXComponentActionHandler *v7;

  v2 = a2;
  v3 = [SXComponentActionHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F03AA0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F142D0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[SXComponentActionHandler initWithActionManager:actionSerializer:analyticsReportingProvider:](v3, "initWithActionManager:actionSerializer:analyticsReportingProvider:", v4, v5, v6);
  return v7;
}

SXExposureComponentViewPostProcessor *__38__SXComponentAssembly_loadInRegistry___block_invoke_12(uint64_t a1, void *a2)
{
  id v2;
  SXExposureComponentViewPostProcessor *v3;
  void *v4;
  void *v5;
  SXExposureComponentViewPostProcessor *v6;

  v2 = a2;
  v3 = [SXExposureComponentViewPostProcessor alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F70BE0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F56200);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXExposureComponentViewPostProcessor initWithExposureMonitor:analyticsReportingProvider:](v3, "initWithExposureMonitor:analyticsReportingProvider:", v4, v5);
  return v6;
}

SXComponentExposureMonitor *__38__SXComponentAssembly_loadInRegistry___block_invoke_13(uint64_t a1, void *a2)
{
  id v2;
  SXComponentExposureMonitor *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  SXComponentExposureMonitor *v8;

  v2 = a2;
  v3 = [SXComponentExposureMonitor alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F91590);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F80080);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1A9C0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[SXComponentExposureMonitor initWithViewport:appStateMonitor:componentController:host:](v3, "initWithViewport:appStateMonitor:componentController:host:", v4, v5, v6, v7);
  return v8;
}

@end
