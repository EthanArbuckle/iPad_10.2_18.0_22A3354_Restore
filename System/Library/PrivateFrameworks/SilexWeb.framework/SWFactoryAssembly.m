@implementation SWFactoryAssembly

- (void)loadInRegistry:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;

  v3 = a3;
  objc_msgSend(v3, "publicContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerProtocol:name:factory:", &unk_25501B0F0, CFSTR("web-content"), &__block_literal_global_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v7, "registerProtocol:factory:", &unk_2550344F8, &__block_literal_global_50);

  objc_msgSend(v3, "privateContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:name:factory:", objc_opt_class(), CFSTR("web-content"), &__block_literal_global_54);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "inScope:", 2);

  objc_msgSend(v3, "privateContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerClass:name:factory:", objc_opt_class(), CFSTR("web-content"), &__block_literal_global_57);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "inScope:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (id)objc_msgSend(v14, "withConfiguration:", &__block_literal_global_59);

  objc_msgSend(v3, "privateContainer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "registerClass:name:factory:", objc_opt_class(), CFSTR("web-content"), &__block_literal_global_61);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v17, "withConfiguration:", &__block_literal_global_63);

  objc_msgSend(v3, "publicContainer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v19, "registerClass:name:factory:", objc_opt_class(), CFSTR("web-content"), &__block_literal_global_66);

  objc_msgSend(v3, "privateContainer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "registerProtocol:name:factory:", &unk_255025CE8, CFSTR("web-content"), &__block_literal_global_71);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (id)objc_msgSend(v22, "inScope:", 2);

  objc_msgSend(v3, "publicContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (id)objc_msgSend(v24, "registerClass:name:factory:", objc_opt_class(), CFSTR("web-content"), &__block_literal_global_74);

  objc_msgSend(v3, "publicContainer");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (id)objc_msgSend(v26, "registerClass:factory:", objc_opt_class(), &__block_literal_global_76);

  objc_msgSend(v3, "publicContainer");
  v29 = (id)objc_claimAutoreleasedReturnValue();

  v28 = (id)objc_msgSend(v29, "registerClass:factory:", objc_opt_class(), &__block_literal_global_78);
}

SWWebViewFactory *__36__SWFactoryAssembly_loadInRegistry___block_invoke()
{
  return objc_alloc_init(SWWebViewFactory);
}

SWProcessConfiguration *__36__SWFactoryAssembly_loadInRegistry___block_invoke_2()
{
  return -[SWProcessConfiguration initWithBackgroundPriority:]([SWProcessConfiguration alloc], "initWithBackgroundPriority:", 1);
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BDFA8E8];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "_initWithConfiguration:", v5);
  return v6;
}

uint64_t __36__SWFactoryAssembly_loadInRegistry___block_invoke_4()
{
  return objc_msgSend(MEMORY[0x24BDFA928], "defaultDataStore");
}

uint64_t __36__SWFactoryAssembly_loadInRegistry___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_setResourceLoadStatisticsEnabled:", 1);
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_6()
{
  return objc_alloc_init(MEMORY[0x24BDFA978]);
}

void __36__SWFactoryAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a2, "resolveProtocol:", &unk_2550344F8);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlwaysRunsAtBackgroundPriority:", objc_msgSend(v5, "shouldRunAtBackgroundPriority"));

}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_8()
{
  return objc_alloc_init(MEMORY[0x24BDFA8F8]);
}

SWWebViewConfigurationFactory *__36__SWFactoryAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2;
  SWWebViewConfigurationFactory *v3;
  void *v4;
  void *v5;
  SWWebViewConfigurationFactory *v6;

  v2 = a2;
  v3 = [SWWebViewConfigurationFactory alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SWWebViewConfigurationFactory initWithProcessPool:websiteDataStore:](v3, "initWithProcessPool:websiteDataStore:", v4, v5);
  return v6;
}

id __36__SWFactoryAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:name:", &unk_255025CE8, CFSTR("web-content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createWebViewConfigurationWithUserContentController:mediaSettings:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

SWMediaSettings *__36__SWFactoryAssembly_loadInRegistry___block_invoke_11()
{
  return -[SWMediaSettings initWithMediaTypesRequiringUserActionForPlayback:fullScreenEnabled:]([SWMediaSettings alloc], "initWithMediaTypesRequiringUserActionForPlayback:fullScreenEnabled:", 1, 0);
}

SWScrollSettings *__36__SWFactoryAssembly_loadInRegistry___block_invoke_12()
{
  return -[SWScrollSettings initWithScrollEnabled:scrollsToTop:showsVerticalScrollIndicator:]([SWScrollSettings alloc], "initWithScrollEnabled:scrollsToTop:showsVerticalScrollIndicator:", 0, 0, 0);
}

@end
