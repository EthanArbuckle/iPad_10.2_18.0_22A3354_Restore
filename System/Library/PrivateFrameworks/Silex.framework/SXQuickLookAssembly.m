@implementation SXQuickLookAssembly

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
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "registerProtocol:factory:", &unk_254F6F0A8, &__block_literal_global_29);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerProtocol:factory:", &unk_254F7FD18, &__block_literal_global_49);

  objc_msgSend(v3, "privateContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "registerClass:factory:", objc_opt_class(), &__block_literal_global_53);

  objc_msgSend(v3, "privateContainer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "registerProtocol:factory:", &unk_254F01BB0, &__block_literal_global_69);

  objc_msgSend(v3, "privateContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:factory:", objc_opt_class(), &__block_literal_global_72);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v13, "withConfiguration:", &__block_literal_global_83);

  objc_msgSend(v3, "privateContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerProtocol:factory:", &unk_254F7FD98, &__block_literal_global_85);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (id)objc_msgSend(v16, "withConfiguration:", &__block_literal_global_93_0);

  objc_msgSend(v3, "privateContainer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v18, "registerProtocol:factory:", &unk_254F1F4E0, &__block_literal_global_95);

  objc_msgSend(v3, "privateContainer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "registerProtocol:factory:", &unk_254F6A998, &__block_literal_global_98);

  objc_msgSend(v3, "privateContainer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "registerProtocol:factory:", &unk_254F82EA0, &__block_literal_global_101_0);

  objc_msgSend(v3, "privateContainer");
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v24 = (id)objc_msgSend(v25, "registerProtocol:factory:", &unk_254F19F88, &__block_literal_global_107_0);
}

SXQuickLookModule *__38__SXQuickLookAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookModule *v3;

  v2 = a2;
  v3 = -[SXQuickLookModule initWithResolver:]([SXQuickLookModule alloc], "initWithResolver:", v2);

  return v3;
}

SXQuickLookPreviewViewControllerFactory *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_2()
{
  return objc_alloc_init(SXQuickLookPreviewViewControllerFactory);
}

SXQuickLookViewController *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookViewController *v3;
  void *v4;
  void *v5;
  SXQuickLookViewController *v6;

  v2 = a2;
  v3 = [SXQuickLookViewController alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F01BB0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F82EA0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXQuickLookViewController initWithEventHandler:renderer:](v3, "initWithEventHandler:renderer:", v4, v5);
  return v6;
}

id __38__SXQuickLookAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

SXQuickLookEventHandler *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookEventHandler *v3;
  void *v4;
  void *v5;
  SXQuickLookEventHandler *v6;

  v2 = a2;
  v3 = [SXQuickLookEventHandler alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F7FD98);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F1F4E0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXQuickLookEventHandler initWithInteractor:router:](v3, "initWithInteractor:router:", v4, v5);
  return v6;
}

void __38__SXQuickLookAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v5 = a2;
  objc_msgSend(v5, "resolveClass:", objc_opt_class());
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setDelegate:", v6);
}

SXQuickLookInteractor *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookInteractor *v3;
  void *v4;
  void *v5;
  SXQuickLookInteractor *v6;

  v2 = a2;
  v3 = [SXQuickLookInteractor alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_254F6A998);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SXQuickLookInteractor initWithFile:service:](v3, "initWithFile:service:", v4, v5);
  return v6;
}

void __38__SXQuickLookAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "resolveProtocol:", &unk_254F01BB0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

}

SXQuickLookRouter *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookRouter *v3;

  v2 = a2;
  v3 = -[SXQuickLookRouter initWithResolver:]([SXQuickLookRouter alloc], "initWithResolver:", v2);

  return v3;
}

SXQuickLookService *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_10()
{
  return objc_alloc_init(SXQuickLookService);
}

SXQuickLookRenderer *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_11(uint64_t a1, void *a2)
{
  id v2;
  SXQuickLookRenderer *v3;
  void *v4;
  SXQuickLookRenderer *v5;

  v2 = a2;
  v3 = [SXQuickLookRenderer alloc];
  objc_msgSend(v2, "resolveProtocol:", &unk_254F19F88);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SXQuickLookRenderer initWithStyler:](v3, "initWithStyler:", v4);
  return v5;
}

SXQuickLookStyler *__38__SXQuickLookAssembly_loadInRegistry___block_invoke_12()
{
  return objc_alloc_init(SXQuickLookStyler);
}

@end
