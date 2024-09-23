@implementation SWViewControllerAssembly

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
  v5 = (id)objc_msgSend(v4, "registerClass:factory:", objc_opt_class(), &__block_literal_global_2);

  objc_msgSend(v3, "publicContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "registerClass:factory:", objc_opt_class(), &__block_literal_global_10);

  objc_msgSend(v3, "publicContainer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (id)objc_msgSend(v9, "registerClass:name:factory:", objc_opt_class(), CFSTR("web-content"), &__block_literal_global_76_0);
}

SWContainerViewController *__43__SWViewControllerAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
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
  SWContainerViewController *v12;
  SWContainerViewController *v14;

  v2 = a2;
  v14 = [SWContainerViewController alloc];
  objc_msgSend(v2, "resolveClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019808);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550340B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025150);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033AB0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501A090);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501A580);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501A458);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501AA50);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[SWContainerViewController initWithWebContentViewController:actionProvider:interactionProvider:errorProvider:configurationManager:presentationManager:scaleManager:snapshotManager:preferredSizeManager:](v14, "initWithWebContentViewController:actionProvider:interactionProvider:errorProvider:configurationManager:presentationManager:scaleManager:snapshotManager:preferredSizeManager:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

SWViewController *__43__SWViewControllerAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SWViewController *v15;
  SWViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v2 = a2;
  v15 = [SWViewController alloc];
  objc_msgSend(v2, "resolveClass:name:", objc_opt_class(), CFSTR("web-content"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501BE78);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033D60);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033A00);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501AEB0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550251C0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255019CA8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550341C8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550199F8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_25501B228);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550359B8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255025DF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_255033910);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550343E8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:name:", &unk_2550252C0, CFSTR("local"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resolveProtocol:", &unk_2550254B8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[SWViewController initWithWebView:setupManager:scriptsManager:messageHandlerManager:navigationManager:errorReporter:documentStateReporter:timeoutManager:terminationManager:contentRuleManager:reachabilityProvider:logger:sessionManager:datastoreSynchronizationManager:localDatastoreManager:URLSchemeHandlerManager:](v15, "initWithWebView:setupManager:scriptsManager:messageHandlerManager:navigationManager:errorReporter:documentStateReporter:timeoutManager:terminationManager:contentRuleManager:reachabilityProvider:logger:sessionManager:datastoreSynchronizationManager:localDatastoreManager:URLSchemeHandlerManager:", v21, v12, v18, v17, v14, v13, v20, v19, v11, v10, v9, v3, v4, v5, v6,
          v7);

  return v16;
}

id __43__SWViewControllerAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
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
  objc_msgSend(v2, "resolveProtocol:name:", &unk_25501B0F0, CFSTR("web-content"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createWebViewWithWebViewConfiguration:scrollSettings:", v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
