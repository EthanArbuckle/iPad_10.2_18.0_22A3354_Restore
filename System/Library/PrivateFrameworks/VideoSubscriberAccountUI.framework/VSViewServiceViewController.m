@implementation VSViewServiceViewController

- (VSViewServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  VSViewServiceViewController *v8;
  VSPersistentStorage *v9;
  VSPersistentStorage *storage;
  uint64_t v11;
  VSRestrictionsCenter *restrictionsCenter;
  NSOperationQueue *v13;
  NSOperationQueue *privateQueue;
  id v15;
  uint64_t v16;
  VSRemoteNotifier *remoteNotifier;
  VSPreferences *v18;
  VSPreferences *preferences;
  VSTopShelfPurger *v20;
  VSTopShelfPurger *topShelfPurger;
  VSOptional *v22;
  VSOptional *currentRequest;
  VSOptional *v24;
  VSOptional *currentRequestID;
  UINavigationController *v26;
  UINavigationController *navController;
  void *v28;
  void *v29;
  objc_super v31;

  v6 = a4;
  v7 = a3;
  VSRequireMainThread();
  v31.receiver = self;
  v31.super_class = (Class)VSViewServiceViewController;
  v8 = -[VSViewServiceViewController initWithNibName:bundle:](&v31, sel_initWithNibName_bundle_, v7, v6);

  if (v8)
  {
    v9 = (VSPersistentStorage *)objc_alloc_init(MEMORY[0x24BDF8C40]);
    storage = v8->_storage;
    v8->_storage = v9;

    objc_msgSend(MEMORY[0x24BDF8C58], "defaultRestrictionsCenter");
    v11 = objc_claimAutoreleasedReturnValue();
    restrictionsCenter = v8->_restrictionsCenter;
    v8->_restrictionsCenter = (VSRestrictionsCenter *)v11;

    v13 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x24BDD1710]);
    privateQueue = v8->_privateQueue;
    v8->_privateQueue = v13;

    -[NSOperationQueue setName:](v8->_privateQueue, "setName:", CFSTR("VSViewServiceViewController"));
    v15 = objc_alloc(MEMORY[0x24BDF8C50]);
    v16 = objc_msgSend(v15, "initWithNotificationName:", *MEMORY[0x24BDF8DE0]);
    remoteNotifier = v8->_remoteNotifier;
    v8->_remoteNotifier = (VSRemoteNotifier *)v16;

    -[VSRemoteNotifier setDelegate:](v8->_remoteNotifier, "setDelegate:", v8);
    v18 = (VSPreferences *)objc_alloc_init(MEMORY[0x24BDF8C48]);
    preferences = v8->_preferences;
    v8->_preferences = v18;

    v20 = objc_alloc_init(VSTopShelfPurger);
    topShelfPurger = v8->_topShelfPurger;
    v8->_topShelfPurger = v20;

    v22 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    currentRequest = v8->_currentRequest;
    v8->_currentRequest = v22;

    v24 = (VSOptional *)objc_alloc_init(MEMORY[0x24BDF8C38]);
    currentRequestID = v8->_currentRequestID;
    v8->_currentRequestID = v24;

    v26 = (UINavigationController *)objc_alloc_init(MEMORY[0x24BDF6BF8]);
    navController = v8->_navController;
    v8->_navController = v26;

    -[VSViewServiceViewController addChildViewController:](v8, "addChildViewController:", v8->_navController);
    -[UINavigationController view](v8->_navController, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSViewServiceViewController view](v8, "view");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "bounds");
    objc_msgSend(v28, "setFrame:");
    objc_msgSend(v29, "addSubview:", v28);
    objc_msgSend(v28, "setAutoresizingMask:", 18);
    -[UINavigationController didMoveToParentViewController:](v8->_navController, "didMoveToParentViewController:", v8);

  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  VSRequireMainThread();
  v3.receiver = self;
  v3.super_class = (Class)VSViewServiceViewController;
  -[VSViewServiceViewController dealloc](&v3, sel_dealloc);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255E9BC30);
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_255EC1A20);
}

- (void)_willAppearInRemoteViewController
{
  void *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  -[VSViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v8 = (id)objc_opt_class();
    v9 = 2112;
    v10 = v3;
    v5 = v8;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "%@: Appearing in client: %@", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)VSViewServiceViewController;
  -[VSViewServiceViewController _willAppearInRemoteViewController](&v6, sel__willAppearInRemoteViewController);

}

- (void)_performRequest:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = v6;
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Received view service request: %@", buf, 0xCu);
  }

  -[VSViewServiceViewController storage](self, "storage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accountStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke;
  v13[3] = &unk_24FE1A8D8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "fetchAccountsWithCompletionHandler:", v13);

}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2;
  v8[3] = &unk_24FE1A8B0;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7;
  v6[3] = &unk_24FE1A5B8;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(a2, "unwrapObject:error:", v8, v6);

}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  VSViewServiceRequestPreparationOperation *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  VSAMSStorefrontFetchAllOperation *v21;
  id v22;
  id v23;
  VSViewServiceRequestPreparationOperation *v24;
  VSAMSStorefrontFetchAllOperation *v25;
  id v26;
  void *v27;
  void *v28;
  VSAMSStorefrontFetchAllOperation *v29;
  id v30;
  VSViewServiceRequestPreparationOperation *v31;
  id v32;
  void *v33;
  _OWORD v34[2];
  _OWORD v35[2];

  v3 = a2;
  objc_msgSend(a1[4], "_hostApplicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  memset(v35, 0, sizeof(v35));
  v5 = a1[4];
  if (v5)
    objc_msgSend(v5, "_hostAuditToken");
  v6 = objc_alloc_init(MEMORY[0x24BDF8BB0]);
  objc_msgSend(v6, "setBundleIdentifier:", v4);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v35, 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTokenBytes:", v7);

  objc_msgSend(a1[4], "setAuditToken:", v6);
  v8 = objc_alloc_init(VSViewServiceRequestPreparationOperation);
  objc_msgSend(a1[4], "restrictionsCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation setAccountModificationAllowed:](v8, "setAccountModificationAllowed:", objc_msgSend(v9, "isAcountModificationAllowed"));

  v10 = a1[4];
  if (v10)
    objc_msgSend(v10, "_hostAuditToken");
  else
    memset(v34, 0, sizeof(v34));
  -[VSViewServiceRequestPreparationOperation setHostAuditToken:](v8, "setHostAuditToken:", v34);
  -[VSViewServiceRequestPreparationOperation setHostProcessIdentifier:](v8, "setHostProcessIdentifier:", objc_msgSend(a1[4], "_hostProcessIdentifier"));
  -[VSViewServiceRequestPreparationOperation setAuditToken:](v8, "setAuditToken:", v6);
  v11 = (void *)MEMORY[0x24BDF8C38];
  objc_msgSend(v3, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "optionalWithObject:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation setCurrentAccount:](v8, "setCurrentAccount:", v13);

  -[VSViewServiceRequestPreparationOperation setRequestAllowsPrivacyUI:](v8, "setRequestAllowsPrivacyUI:", objc_msgSend(a1[5], "allowsPrivacyUI"));
  -[VSViewServiceRequestPreparationOperation setRequestRequiresPrivacyUI:](v8, "setRequestRequiresPrivacyUI:", objc_msgSend(a1[5], "requiresPrivacyUI"));
  objc_msgSend(a1[5], "supportedIdentityProviderIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation setSupportedIdentityProviderIdentifiers:](v8, "setSupportedIdentityProviderIdentifiers:", v14);

  objc_msgSend(a1[5], "featuredIdentityProviderIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation setFeaturedIdentityProviderIdentifiers:](v8, "setFeaturedIdentityProviderIdentifiers:", v15);

  objc_msgSend(a1[5], "applicationAccountProviders");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceRequestPreparationOperation setApplicationAccountProviders:](v8, "setApplicationAccountProviders:", v16);

  -[VSViewServiceRequestPreparationOperation setShouldInferFeaturedProviders:](v8, "setShouldInferFeaturedProviders:", objc_msgSend(a1[5], "shouldInferFeaturedProviders"));
  -[VSViewServiceRequestPreparationOperation setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:](v8, "setShouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront:", objc_msgSend(a1[5], "shouldReturnErrorOnTVProviderFeatureUnsupportedByStorefront"));
  objc_msgSend(a1[5], "supportedIdentityProviderIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
    v18 = 0;
  else
    v18 = objc_msgSend(a1[5], "allowsAuthenticationUI");

  objc_msgSend(a1[4], "privateQueue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v20 = objc_alloc_init(MEMORY[0x24BDF8C88]);
    v21 = objc_alloc_init(VSAMSStorefrontFetchAllOperation);
    v22 = v20;
    -[VSViewServiceRequestPreparationOperation addDependency:](v8, "addDependency:", v22);
    -[VSViewServiceRequestPreparationOperation addDependency:](v8, "addDependency:", v21);
    objc_msgSend(v19, "addOperation:", v22);

    objc_msgSend(v19, "addOperation:", v21);
  }
  else
  {
    v21 = 0;
    v22 = 0;
  }
  v28 = v22;
  v29 = v21;
  v30 = a1[6];
  v31 = v8;
  v32 = a1[5];
  v33 = v3;
  v23 = v3;
  v24 = v8;
  v25 = v21;
  v26 = v22;
  VSMainThreadOperationWithBlock();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addDependency:", v24);
  objc_msgSend(v19, "addOperation:", v24);
  VSEnqueueCompletionOperation();

}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];
  id v30;
  _QWORD v31[5];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__3;
  v34[4] = __Block_byref_object_dispose__3;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__3;
  v32[4] = __Block_byref_object_dispose__3;
  v33 = 0;
  v2 = *(void **)(a1 + 32);
  v3 = MEMORY[0x24BDAC760];
  if (v2 && *(_QWORD *)(a1 + 40))
  {
    v4 = v2;
    objc_msgSend(v4, "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "forceUnwrapObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v3;
    v31[1] = 3221225472;
    v31[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_81;
    v31[3] = &unk_24FE1A028;
    v31[4] = v34;
    v29[0] = v3;
    v29[1] = 3221225472;
    v7 = *(_QWORD *)(a1 + 48);
    v8 = *(void **)(a1 + 56);
    v29[3] = &unk_24FE1A5B8;
    v29[4] = v7;
    v29[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2_83;
    v30 = v8;
    objc_msgSend(v6, "unwrapObject:error:", v31, v29);

    v9 = *(void **)(a1 + 40);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The fetchAllSfOperationOrNil parameter must not be nil."));
      v9 = *(void **)(a1 + 40);
    }
    v10 = v9;
    objc_msgSend(v10, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "forceUnwrapObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v3;
    v28[1] = 3221225472;
    v28[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_3_87;
    v28[3] = &unk_24FE1A838;
    v28[4] = v32;
    v26[0] = v3;
    v26[1] = 3221225472;
    v13 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 56);
    v26[3] = &unk_24FE1A5B8;
    v26[4] = v13;
    v26[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_4;
    v27 = v14;
    objc_msgSend(v12, "unwrapObject:error:", v28, v26);

  }
  objc_msgSend(*(id *)(a1 + 64), "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "forceUnwrapObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v20[0] = v3;
  v20[1] = 3221225472;
  v20[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_5;
  v20[3] = &unk_24FE1A860;
  v20[4] = *(_QWORD *)(a1 + 48);
  v21 = *(id *)(a1 + 72);
  v22 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 80);
  v24 = v34;
  v25 = v32;
  v18[0] = v3;
  v18[1] = 3221225472;
  v18[2] = __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_6;
  v18[3] = &unk_24FE1A5B8;
  v17 = *(void **)(a1 + 56);
  v18[4] = *(_QWORD *)(a1 + 48);
  v19 = v17;
  objc_msgSend(v16, "unwrapObject:error:", v20, v18);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_81(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2_83(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_request:didFailWithError:", *(_QWORD *)(a1 + 40), a2);
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_3_87(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_request:didFailWithError:", *(_QWORD *)(a1 + 40), a2);
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performRequestInternal:withID:identityProviders:accounts:currentStorefrontCode:allStorefronts:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_6(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_request:didFailWithError:", *(_QWORD *)(a1 + 40), a2);
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;

  v3 = a2;
  VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7_cold_1();

  v6 = *(id *)(a1 + 40);
  v7 = v3;
  v5 = v3;
  VSPerformCompletionHandler();

}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_90(uint64_t a1)
{
  id v2;
  id v3;

  v2 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 48);
  VSPerformBlockOnMainThread();

}

uint64_t __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_2_91(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_request:didFailWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setCurrentRequest:(id)a3
{
  VSOptional *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  VSOptional *v20;
  VSOptional *currentRequest;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = (VSOptional *)a3;
  if (self->_currentRequest != v4)
  {
    -[VSViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1540], "vs_applicationRecordWithBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__3;
    v27 = __Block_byref_object_dispose__3;
    v28 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __49__VSViewServiceViewController_setCurrentRequest___block_invoke;
    v22[3] = &unk_24FE1A900;
    v22[4] = &v23;
    -[VSOptional conditionallyUnwrapObject:](v4, "conditionallyUnwrapObject:", v22);
    objc_msgSend(v6, "localizedName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "localizedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [appRecordOrNil localizedName] parameter must not be nil."));
      objc_msgSend(v6, "localizedName");
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = &stru_24FE1B848;
    }

    v10 = (void *)v24[5];
    v11 = (void *)MEMORY[0x24BDF8C38];
    v12 = (void *)-[__CFString copy](v9, "copy");
    objc_msgSend(v11, "optionalWithObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setRequestingAppDisplayName:", v13);

    v14 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "iTunesMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "numberWithUnsignedLongLong:", objc_msgSend(v15, "storeItemIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "stringValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v24[5], "setRequestingAppAdamID:", v17);
    v18 = (void *)MEMORY[0x24BDF8C38];
    v19 = (void *)objc_msgSend((id)v24[5], "copy");
    objc_msgSend(v18, "optionalWithObject:", v19);
    v20 = (VSOptional *)objc_claimAutoreleasedReturnValue();
    currentRequest = self->_currentRequest;
    self->_currentRequest = v20;

    _Block_object_dispose(&v23, 8);
  }

}

void __49__VSViewServiceViewController_setCurrentRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_performRequestInternal:(id)a3 withID:(id)a4 identityProviders:(id)a5 accounts:(id)a6 currentStorefrontCode:(id)a7 allStorefronts:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  _BOOL4 v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  _QWORD v57[5];
  __int128 buf;
  uint64_t v59;
  char v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v54 = a6;
  v51 = a7;
  v52 = a8;
  if (v14)
  {
    if (v15)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The request parameter must not be nil."));
    if (v15)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The requestID parameter must not be nil."));
LABEL_3:
  v53 = v15;
  if (!v16)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The identityProviders parameter must not be nil."));
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceViewController setCurrentRequest:](self, "setCurrentRequest:", v17);

  v18 = (void *)MEMORY[0x24BDF8C38];
  v19 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v18, "optionalWithObject:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceViewController setCurrentRequestID:](self, "setCurrentRequestID:", v20);

  -[VSViewServiceViewController setDidAuthenticateAccount:](self, "setDidAuthenticateAccount:", 0);
  -[VSViewServiceViewController setIdentityProviderPickerRequired:](self, "setIdentityProviderPickerRequired:", 0);
  objc_msgSend(v14, "accountMetadataRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    v28 = objc_alloc_init(MEMORY[0x24BDF8CD8]);
    -[VSViewServiceViewController _completeRequestWithResponse:](self, "_completeRequestWithResponse:", v28);

    goto LABEL_42;
  }
  objc_msgSend(v21, "accountProviderAuthenticationToken");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = MEMORY[0x24BDAC760];
  if (v23)
  {
    VSDefaultLogObject();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2303C5000, v25, OS_LOG_TYPE_DEFAULT, "Request has account provider authentication token.", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v59 = 0x2020000000;
    v60 = 0;
    if (objc_msgSend(v54, "count"))
    {
      objc_msgSend(v54, "objectAtIndex:", 0);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "authenticationToken");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v24;
      v57[1] = 3221225472;
      v57[2] = __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke;
      v57[3] = &unk_24FE1A928;
      v57[4] = &buf;
      objc_msgSend(v27, "conditionallyUnwrapObject:", v57);

      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
        goto LABEL_18;
    }
    else
    {
      *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) = 1;
    }
    if (objc_msgSend(v14, "allowsAuthenticationUI") && objc_msgSend(v16, "count") == 1)
    {
LABEL_21:
      _Block_object_dispose(&buf, 8);
      goto LABEL_22;
    }
LABEL_18:
    VSErrorLogObject();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[VSViewServiceViewController _performRequestInternal:withID:identityProviders:accounts:currentStorefrontCode:allStorefronts:].cold.1();

    VSPublicError();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSViewServiceViewController _requestDidFailWithError:](self, "_requestDidFailWithError:", v30);

    goto LABEL_21;
  }
LABEL_22:
  if (objc_msgSend(v54, "count"))
  {
    objc_msgSend(v54, "objectAtIndex:", 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "identityProviderID");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "forceUnwrapObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v55[0] = v24;
    v55[1] = 3221225472;
    v55[2] = __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke_107;
    v55[3] = &unk_24FE1A950;
    v33 = v32;
    v56 = v33;
    v34 = objc_msgSend(v16, "indexOfObjectPassingTest:", v55);
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Current provider not included among providers."));
    objc_msgSend(v16, "objectAtIndex:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "supportedAccountProviderAuthenticationSchemes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isFullySupportedForRequestsExpectingAuthenticationSchemes:", v36);

    if (v37)
    {
      -[VSViewServiceViewController _performRequestWithIdentityProvider:account:](self, "_performRequestWithIdentityProvider:account:", v35, v50);
    }
    else
    {
      VSDefaultLogObject();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v35;
        _os_log_impl(&dword_2303C5000, v42, OS_LOG_TYPE_DEFAULT, "Identity provider %@ is not supported.", (uint8_t *)&buf, 0xCu);
      }

      objc_msgSend(v35, "providerID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "forceUnwrapObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      VSPublicUnsupportedProviderError();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v35, "isDeveloper") & 1) == 0)
      {
        v46 = (void *)MEMORY[0x24BDF8C28];
        -[VSViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "recordMetadataRequestWithProviderIdentifier:channelAdamID:fulfilledByProvider:error:", v44, v47, 0, v45);

      }
      -[VSViewServiceViewController _requestDidFailWithError:](self, "_requestDidFailWithError:", v45);

    }
  }
  else if (objc_msgSend(v14, "allowsAuthenticationUI"))
  {
    if (objc_msgSend(v16, "count") == 1)
    {
      VSDefaultLogObject();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_2303C5000, v38, OS_LOG_TYPE_DEFAULT, "Will skip identity provider picker due to single provider.", (uint8_t *)&buf, 2u);
      }

      objc_msgSend(v16, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v39 == 0;

      if (v40)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [identityProviders firstObject] parameter must not be nil."));
      objc_msgSend(v16, "firstObject");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[VSViewServiceViewController _didDetermineIdentityProvider:withPickerViewController:](self, "_didDetermineIdentityProvider:withPickerViewController:", v41, 0);

    }
    else
    {
      -[VSViewServiceViewController setIdentityProviderPickerRequired:](self, "setIdentityProviderPickerRequired:", 1);
      -[VSViewServiceViewController _showIdentityProviderPickerViewControllerWithIdentityProviders:currentStorefrontCode:allStorefronts:](self, "_showIdentityProviderPickerViewControllerWithIdentityProviders:currentStorefrontCode:allStorefronts:", v16, v51, v52);
    }
  }
  else
  {
    v48 = objc_alloc_init(MEMORY[0x24BDF8CD8]);
    v49 = objc_alloc_init(MEMORY[0x24BDF8B78]);
    objc_msgSend(v48, "setAccountMetadata:", v49);

    -[VSViewServiceViewController _completeRequestWithResponse:](self, "_completeRequestWithResponse:", v48);
  }
LABEL_42:

}

uint64_t __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isFromUnsupportedProvider");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __126__VSViewServiceViewController__performRequestInternal_withID_identityProviders_accounts_currentStorefrontCode_allStorefronts___block_invoke_107(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "providerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "forceUnwrapObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((_DWORD)v8)
    *a4 = 1;
  return v8;
}

- (id)_identityProviderRequestForViewServiceRequest:(id)a3 withAccount:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  VSViewServiceViewController *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __89__VSViewServiceViewController__identityProviderRequestForViewServiceRequest_withAccount___block_invoke;
  v11[3] = &unk_24FE1A978;
  v14 = &v15;
  v8 = v7;
  v12 = v8;
  v13 = self;
  objc_msgSend(v6, "conditionallyUnwrapObject:otherwise:", v11, &__block_literal_global_12);
  objc_msgSend(MEMORY[0x24BDF8C38], "optionalWithObject:", v16[5]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __89__VSViewServiceViewController__identityProviderRequestForViewServiceRequest_withAccount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v3 = a2;
  objc_msgSend(v3, "requestingAppDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "requestingAppAdamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountProviderAuthenticationToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountMetadataRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "storage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSIdentityProviderRequest accountMetadataRequestWithAccount:storage:accountMetadataRequest:requestingAppDisplayName:requestingAppAdamID:accountProviderAuthenticationToken:](VSIdentityProviderRequest, "accountMetadataRequestWithAccount:storage:accountMetadataRequest:requestingAppDisplayName:requestingAppAdamID:accountProviderAuthenticationToken:", v8, v9, v7, v13, v5, v6);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __89__VSViewServiceViewController__identityProviderRequestForViewServiceRequest_withAccount___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No view service request to use to construct identity provider request.", v1, 2u);
  }

}

- (void)_determinePreAuthAppIsAuthorized:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  uint64_t *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[16];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  if (objc_msgSend(v6, "isDeveloper"))
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    objc_msgSend(v6, "nonChannelAppDescriptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      v28 = v6;
      v9 = (uint64_t *)MEMORY[0x24BDBCAB8];
      if (!v8)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The providerAppDescriptionsOrNil parameter must not be nil."));
      v27 = v8;
      v10 = v8;
      -[VSViewServiceViewController _hostApplicationBundleIdentifier](self, "_hostApplicationBundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v12 = v10;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        v16 = *v9;
        while (2)
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
            objc_msgSend(v18, "bundleID", v27);
            v19 = objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              v20 = (void *)v19;
              objc_msgSend(v18, "bundleID");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v21)
                objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v16, CFSTR("The [description bundleID] parameter must not be nil."));
              objc_msgSend(v18, "bundleID");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v11, "isEqualToString:", v22);

              if ((v23 & 1) != 0)
              {

                VSDefaultLogObject();
                v24 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_2303C5000, v24, OS_LOG_TYPE_DEFAULT, "Requesting app is an identity provider app, can allow pre-auth.", buf, 2u);
                }
                v25 = 1;
                goto LABEL_26;
              }
            }
          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
          if (v14)
            continue;
          break;
        }
      }

      VSErrorLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[VSViewServiceViewController _determinePreAuthAppIsAuthorized:completion:].cold.1();
      v25 = 0;
LABEL_26:
      v8 = v27;
      v6 = v28;

      v7[2](v7, v25, 0);
    }
    else
    {
      VSDefaultLogObject();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2303C5000, v26, OS_LOG_TYPE_DEFAULT, "Identity provider has no apps, will reject any pre-auth requests.", buf, 2u);
      }

      v7[2](v7, 0, 0);
    }

  }
}

- (void)_performRequestWithIdentityProvider:(id)a3 account:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[VSViewServiceViewController currentRequest](self, "currentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke;
  v11[3] = &unk_24FE1AA30;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "conditionallyUnwrapObject:otherwise:", v11, &__block_literal_global_131);

}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  void *v9;
  id v10;
  id v11;

  v3 = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2;
  v7[3] = &unk_24FE1AA08;
  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 48);
  v11 = *(id *)(a1 + 40);
  v6 = v3;
  objc_msgSend(v5, "_determinePreAuthAppIsAuthorized:completion:", v4, v7);

}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v5 = a3;
  if (v5)
  {
    VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_2();
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isPreAuthRequest") || (a2 & 1) != 0)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v8, "currentRequest");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_identityProviderRequestForViewServiceRequest:withAccount:", v9, *(_QWORD *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_123;
      v12[3] = &unk_24FE1A9C0;
      v10 = *(id *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 40);
      v13 = v10;
      v14 = v11;
      objc_msgSend(v7, "conditionallyUnwrapObject:otherwise:", v12, &__block_literal_global_128);

      goto LABEL_10;
    }
    VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_1();
  }

  VSPublicError();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_requestDidFailWithError:", v7);
LABEL_10:

}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_123(uint64_t a1, void *a2)
{
  id v3;
  VSIdentityProviderViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = -[VSIdentityProviderViewController initWithIdentityProvider:]([VSIdentityProviderViewController alloc], "initWithIdentityProvider:", *(_QWORD *)(a1 + 32));
  -[VSIdentityProviderViewController setDelegate:](v4, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "auditToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSIdentityProviderViewController setAuditToken:](v4, "setAuditToken:", v5);

  -[VSIdentityProviderViewController setCancellationAllowed:](v4, "setCancellationAllowed:", objc_msgSend(*(id *)(a1 + 40), "isIdentityProviderPickerRequired") ^ 1);
  -[VSIdentityProviderViewController enqueueRequest:](v4, "enqueueRequest:", v3);

  LODWORD(v3) = objc_msgSend(*(id *)(a1 + 40), "isIdentityProviderPickerRequired");
  objc_msgSend(*(id *)(a1 + 40), "navController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v3)
  {
    objc_msgSend(v6, "pushViewController:animated:", v4, 1);
  }
  else
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setViewControllers:", v8);

  }
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_127()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No identity provider request to submit.", v1, 2u);
  }

}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_130()
{
  NSObject *v0;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_130_cold_1();

}

- (void)_showIdentityProviderPickerViewControllerWithIdentityProviders:(id)a3 currentStorefrontCode:(id)a4 allStorefronts:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  VSViewServiceViewController *v24;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  +[VSViewControllerFactory sharedFactory](VSViewControllerFactory, "sharedFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identityProviderPickerViewControllerWithIdentityProviders:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "forceUnwrapObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setCancellationAllowed:", 1);
  objc_msgSend(v13, "setDelegate:", self);
  objc_msgSend(v13, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "searchController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSearchController:", v15);

  -[VSViewServiceViewController currentRequest](self, "currentRequest");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __131__VSViewServiceViewController__showIdentityProviderPickerViewControllerWithIdentityProviders_currentStorefrontCode_allStorefronts___block_invoke;
  v20[3] = &unk_24FE1AA78;
  v21 = v13;
  v22 = v9;
  v23 = v8;
  v24 = self;
  v17 = v8;
  v18 = v9;
  v19 = v13;
  objc_msgSend(v16, "conditionallyUnwrapObject:otherwise:", v20, &__block_literal_global_133);

}

void __131__VSViewServiceViewController__showIdentityProviderPickerViewControllerWithIdentityProviders_currentStorefrontCode_allStorefronts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "requestingAppDisplayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceUnwrapObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v6, "setRequestingAppDisplayName:", v7);

  objc_msgSend(v3, "localizedVideoTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setResourceTitle:", v8);
  if (*(_QWORD *)(a1 + 40) && *(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAllStorefronts:");
  }
  else
  {
    objc_msgSend(v3, "accountMetadataRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationAccountProviders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    objc_msgSend(*(id *)(a1 + 32), "setAdditionalProvidersMode:", v11 == 0);
  }
  objc_msgSend(v3, "supportedIdentityProviderIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  objc_msgSend(*(id *)(a1 + 32), "setRequestedStorefrontCountryCode:defaultToDeveloperProviders:", *(_QWORD *)(a1 + 48), v13);
  objc_msgSend(*(id *)(a1 + 56), "navController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setViewControllers:", v15);

  objc_msgSend(*(id *)(a1 + 56), "_presentInHostIfNecessary");
}

void __131__VSViewServiceViewController__showIdentityProviderPickerViewControllerWithIdentityProviders_currentStorefrontCode_allStorefronts___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No current request to show picker.", v1, 2u);
  }

}

- (void)_didDetermineIdentityProvider:(id)a3 withPickerViewController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  VSViewServiceViewController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[VSViewServiceViewController currentRequest](self, "currentRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke;
  v11[3] = &unk_24FE1AA30;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "conditionallyUnwrapObject:otherwise:", v11, &__block_literal_global_141);

}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int8x16_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  _QWORD v32[4];
  int8x16_t v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "supportedAccountProviderAuthenticationSchemes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "isFullySupportedForRequestsExpectingAuthenticationSchemes:", v4))
  {
    if (objc_msgSend(v3, "canVetoAuthentication"))
    {
      objc_msgSend(*(id *)(a1 + 32), "providerID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "forceUnwrapObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "_viewControllerHost");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = MEMORY[0x24BDAC760];
      v32[1] = 3221225472;
      v32[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2;
      v32[3] = &unk_24FE1AAC0;
      v26 = *(int8x16_t *)(a1 + 32);
      v8 = (id)v26.i64[0];
      v33 = vextq_s8(v26, v26, 8uLL);
      v34 = v6;
      v9 = v6;
      objc_msgSend(v7, "_didChooseProviderWithIdentifier:vetoHandler:", v9, v32);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "_performRequestWithIdentityProvider:account:", *(_QWORD *)(a1 + 32), 0);
    }
  }
  else
  {
    VSDefaultLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v36 = v11;
      _os_log_impl(&dword_2303C5000, v10, OS_LOG_TYPE_DEFAULT, "Identity provider %@ is not supported.", buf, 0xCu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "isApplication"))
    {
      objc_msgSend(*(id *)(a1 + 32), "providerID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "forceUnwrapObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      VSPublicUnsupportedProviderError();
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "_requestDidFailWithError:", v14);
    }
    else
    {
      objc_msgSend(v3, "requestingAppDisplayName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "forceUnwrapObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      +[VSViewControllerFactory sharedFactory](VSViewControllerFactory, "sharedFactory");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 40), "storage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_135;
      v27[3] = &unk_24FE1AAE8;
      v28 = *(id *)(a1 + 32);
      v20 = v4;
      v21 = *(_QWORD *)(a1 + 40);
      v22 = *(void **)(a1 + 48);
      v29 = v20;
      v30 = v21;
      v31 = v22;
      objc_msgSend(v17, "viewControllerForUnsupportedProvider:withRequestingAppDisplayName:storage:acknowledgementHandler:", v18, v16, v19, v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = *(void **)(a1 + 40);
      objc_msgSend(v23, "forceUnwrapObject");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "presentViewController:animated:completion:", v25, 1, 0);

    }
  }

}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2(uint64_t a1, int a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_performRequestWithIdentityProvider:account:", *(_QWORD *)(a1 + 40), 0);
  }
  else
  {
    VSPublicUnsupportedProviderError();
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_requestDidFailWithError:", v3);

  }
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_135(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v4 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2_136;
  v10[3] = &unk_24FE1A8D8;
  v11 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v12 = v5;
  v13 = v6;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_138;
  v8[3] = &unk_24FE19778;
  v9 = v7;
  objc_msgSend(a2, "conditionallyUnwrapObject:otherwise:", v10, v8);

}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2_136(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;

  v4 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_3;
  v8[3] = &unk_24FE1A8B0;
  v9 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v10 = v5;
  v11 = v6;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_137;
  v7[3] = &unk_24FE19D18;
  v7[4] = v6;
  objc_msgSend(a2, "unwrapObject:error:", v8, v7);

}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  VSDefaultLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2303C5000, v2, OS_LOG_TYPE_DEFAULT, "Successfully saved unsupported provider.", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "providerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forceUnwrapObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "supportsRequestsExpectingAuthenticationSchemes:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    VSPrivateError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  VSPublicUnsupportedProviderError();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "_requestDidFailWithError:", v6);

}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_137(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Failed: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_requestDidFailWithError:", v3);
}

void *__86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_138(uint64_t a1)
{
  void *result;

  result = *(void **)(a1 + 32);
  if (result)
    return (void *)objc_msgSend(result, "deselectSelectedProviderAnimated:", 1);
  return result;
}

void __86__VSViewServiceViewController__didDetermineIdentityProvider_withPickerViewController___block_invoke_2_140()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No request for which to pick providers.", v1, 2u);
  }

}

- (void)_presentInHostIfNecessary
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (!-[VSViewServiceViewController isPresentedInHost](self, "isPresentedInHost"))
  {
    -[VSViewServiceViewController setPresentedInHost:](self, "setPresentedInHost:", 1);
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Will present in host", buf, 2u);
    }

    -[VSViewServiceViewController _viewControllerHost](self, "_viewControllerHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentViewController");

    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Did present in host", v6, 2u);
    }

    objc_msgSend(MEMORY[0x24BDF8C28], "recordEnterEventWithPage:pageType:", *MEMORY[0x24BDF8EB0], *MEMORY[0x24BDF8EA8]);
  }
}

- (void)_dismissInHostIfNecessary
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (-[VSViewServiceViewController isPresentedInHost](self, "isPresentedInHost"))
  {
    -[VSViewServiceViewController setPresentedInHost:](self, "setPresentedInHost:", 0);
    VSDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2303C5000, v3, OS_LOG_TYPE_DEFAULT, "Will dismiss in host", buf, 2u);
    }

    -[VSViewServiceViewController _viewControllerHost](self, "_viewControllerHost");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_dismissViewController");

    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2303C5000, v5, OS_LOG_TYPE_DEFAULT, "Did dismiss in host", v6, 2u);
    }

    objc_msgSend(MEMORY[0x24BDF8C28], "recordExitEventWithPage:pageType:", *MEMORY[0x24BDF8EB0], *MEMORY[0x24BDF8EA8]);
  }
}

- (void)_request:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "vs_secureCodingSafeError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  VSDefaultLogObject();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412546;
    v13 = v6;
    v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_2303C5000, v9, OS_LOG_TYPE_DEFAULT, "Will fail request %@ in host with error: %@", (uint8_t *)&v12, 0x16u);
  }

  -[VSViewServiceViewController _viewControllerHost](self, "_viewControllerHost");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_request:didFailWithError:", v6, v8);

  VSDefaultLogObject();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12) = 0;
    _os_log_impl(&dword_2303C5000, v11, OS_LOG_TYPE_DEFAULT, "Did fail in host", (uint8_t *)&v12, 2u);
  }

}

- (void)_requestDidFailWithError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSViewServiceViewController currentRequestID](self, "currentRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__VSViewServiceViewController__requestDidFailWithError___block_invoke;
  v7[3] = &unk_24FE19750;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "conditionallyUnwrapObject:otherwise:", v7, &__block_literal_global_143);

}

void __56__VSViewServiceViewController__requestDidFailWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "_request:didFailWithError:", a2, *(_QWORD *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  v4 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  objc_msgSend(v3, "setCurrentRequest:", v4);

  v5 = *(void **)(a1 + 32);
  v6 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  objc_msgSend(v5, "setCurrentRequestID:", v6);

}

void __56__VSViewServiceViewController__requestDidFailWithError___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No request to fail.", v1, 2u);
  }

}

- (void)_didCancelRequest
{
  void *v3;
  _QWORD v4[5];

  -[VSViewServiceViewController currentRequestID](self, "currentRequestID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__VSViewServiceViewController__didCancelRequest__block_invoke;
  v4[3] = &unk_24FE1AB50;
  v4[4] = self;
  objc_msgSend(v3, "conditionallyUnwrapObject:otherwise:", v4, &__block_literal_global_145);

}

void __48__VSViewServiceViewController__didCancelRequest__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Will cancel request %@ in host", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_viewControllerHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didCancelRequest:", v3);

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Did cancel in host", (uint8_t *)&v11, 2u);
  }

  v7 = *(void **)(a1 + 32);
  v8 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  objc_msgSend(v7, "setCurrentRequest:", v8);

  v9 = *(void **)(a1 + 32);
  v10 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  objc_msgSend(v9, "setCurrentRequestID:", v10);

}

void __48__VSViewServiceViewController__didCancelRequest__block_invoke_144()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No request to cancel.", v1, 2u);
  }

}

- (void)_completeRequestWithResponse:(id)a3 fromIdentityProvider:(id)a4
{
  id v5;

  -[VSViewServiceViewController _viewServiceResponseWithIdentityProviderResponse:](self, "_viewServiceResponseWithIdentityProviderResponse:", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VSViewServiceViewController _completeRequestWithResponse:](self, "_completeRequestWithResponse:", v5);

}

- (void)_completeRequest:(id)a3 withResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[VSViewServiceViewController _dismissInHostIfNecessary](self, "_dismissInHostIfNecessary");
  VSDefaultLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_2303C5000, v8, OS_LOG_TYPE_DEFAULT, "Will finish request %@ with response %@", (uint8_t *)&v13, 0x16u);
  }

  -[VSViewServiceViewController _viewControllerHost](self, "_viewControllerHost");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_request:didFinishWithResponse:", v6, v7);

  VSDefaultLogObject();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl(&dword_2303C5000, v10, OS_LOG_TYPE_DEFAULT, "Did finish request in host", (uint8_t *)&v13, 2u);
  }

  v11 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  -[VSViewServiceViewController setCurrentRequest:](self, "setCurrentRequest:", v11);

  v12 = objc_alloc_init(MEMORY[0x24BDF8C38]);
  -[VSViewServiceViewController setCurrentRequestID:](self, "setCurrentRequestID:", v12);

}

- (void)_completeRequestWithResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[VSViewServiceViewController currentRequestID](self, "currentRequestID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __60__VSViewServiceViewController__completeRequestWithResponse___block_invoke;
  v7[3] = &unk_24FE19750;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "conditionallyUnwrapObject:otherwise:", v7, &__block_literal_global_146);

}

uint64_t __60__VSViewServiceViewController__completeRequestWithResponse___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_completeRequest:withResponse:", a2, *(_QWORD *)(a1 + 40));
}

void __60__VSViewServiceViewController__completeRequestWithResponse___block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No request to complete.", v1, 2u);
  }

}

- (id)_viewServiceResponseWithIdentityProviderResponse:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDF8CD8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "accountMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setAccountMetadata:", v6);
  return v5;
}

- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = (void *)MEMORY[0x24BDF8C28];
  v7 = *MEMORY[0x24BDF8EA0];
  v8 = *MEMORY[0x24BDF8EA8];
  v9 = *MEMORY[0x24BDF8E88];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v6, "recordClickEventWithPage:pageType:target:", v7, v8, v9);
  -[VSViewServiceViewController _didDetermineIdentityProvider:withPickerViewController:](self, "_didDetermineIdentityProvider:withPickerViewController:", v10, v11);

}

- (void)identityProviderPickerViewControllerDidPickAdditionalIdentityProviders:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[VSViewServiceViewController currentRequestID](self, "currentRequestID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __102__VSViewServiceViewController_identityProviderPickerViewControllerDidPickAdditionalIdentityProviders___block_invoke;
  v5[3] = &unk_24FE1AB50;
  v5[4] = self;
  objc_msgSend(v4, "conditionallyUnwrapObject:otherwise:", v5, &__block_literal_global_148);

}

void __102__VSViewServiceViewController_identityProviderPickerViewControllerDidPickAdditionalIdentityProviders___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Will choose additional providers for request %@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_viewControllerHost");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_didChooseAdditionalProvidersForRequest:", v3);

  VSDefaultLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v7) = 0;
    _os_log_impl(&dword_2303C5000, v6, OS_LOG_TYPE_DEFAULT, "Did choose additional providers in host", (uint8_t *)&v7, 2u);
  }

}

void __102__VSViewServiceViewController_identityProviderPickerViewControllerDidPickAdditionalIdentityProviders___block_invoke_147()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No request to choose additional providers.", v1, 2u);
  }

}

- (void)identityProviderViewControllerDidCancel:(id)a3
{
  id v4;
  id v5;

  if (-[VSViewServiceViewController isIdentityProviderPickerRequired](self, "isIdentityProviderPickerRequired", a3))
  {
    -[VSViewServiceViewController navController](self, "navController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popToRootViewControllerAnimated:", 1);

  }
  else
  {
    -[VSViewServiceViewController _didCancelRequest](self, "_didCancelRequest");
  }
}

- (void)identityProviderViewController:(id)a3 didFinishRequest:(id)a4 withResult:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  VSViewServiceViewController *v12;

  v7 = a3;
  v9[4] = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke;
  v10[3] = &unk_24FE1ABF8;
  v11 = v7;
  v12 = self;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_152;
  v9[3] = &unk_24FE19D18;
  v8 = v7;
  objc_msgSend(a5, "unwrapObject:error:", v10, v9);

}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identityProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 40), "currentRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_2;
  v15[3] = &unk_24FE19700;
  v7 = v5;
  v16 = v7;
  objc_msgSend(v6, "conditionallyUnwrapObject:otherwise:", v15, &__block_literal_global_150);

  objc_msgSend(v3, "accountMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountProviderResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "authenticationScheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && (objc_msgSend(v7, "containsObject:", v10) & 1) == 0)
  {
    VSPrivateError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "providerID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "forceUnwrapObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    VSPublicUnsupportedProviderError();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_requestDidFailWithError:", v14);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_completeRequestWithResponse:fromIdentityProvider:", v3, v4);
  }

}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "supportedAccountProviderAuthenticationSchemes");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  VSDefaultLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2303C5000, v0, OS_LOG_TYPE_DEFAULT, "No current request to inspect for supported auth schemes.", v1, 2u);
  }

}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  int IsPublicError;
  int v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];

  v3 = a2;
  IsPublicError = VSErrorIsPublicError();
  v5 = objc_msgSend(*(id *)(a1 + 32), "isIdentityProviderPickerRequired");
  if (IsPublicError)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "navController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (id)objc_msgSend(v6, "popToRootViewControllerAnimated:", 1);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_didCancelRequest");
    }
  }
  else if (v5)
  {
    VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_152_cold_1();

    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_153;
    v10[3] = &unk_24FE1AC20;
    v10[4] = *(_QWORD *)(a1 + 32);
    VSAlertForError(v3, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_requestDidFailWithError:", v3);
  }

}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_153(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popToRootViewControllerAnimated:", 1);

}

- (void)identityProviderViewController:(id)a3 didAuthenticateAccount:(id)a4 forRequest:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  VSViewServiceViewController *v25;
  void *v26;
  void *v27;
  _BYTE v28[32];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  objc_msgSend(a5, "requestingAppAdamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v7;
  objc_msgSend(v7, "identityProviderID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "forceUnwrapObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = self;
  -[VSViewServiceViewController storage](self, "storage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "voucherLockbox");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = v12;
  objc_msgSend(v12, "unredeemedVouchers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v18, "appAdamID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v19, "isEqual:", v8) & 1) != 0)
        {
          objc_msgSend(v18, "providerID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqual:", v10);

          if (v21)
            objc_msgSend(v27, "redeemVoucher:", v18);
        }
        else
        {

        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }

  -[VSViewServiceViewController storage](v25, "storage");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "privacyFacade");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[VSViewServiceViewController _hostAuditToken](v25, "_hostAuditToken");
  if ((objc_msgSend(v23, "setAccessGranted:forAuditToken:", 1, v28) & 1) == 0)
  {
    VSErrorLogObject();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[VSViewServiceViewController identityProviderViewController:didAuthenticateAccount:forRequest:].cold.1(v24);

  }
  -[VSViewServiceViewController _dismissInHostIfNecessary](v25, "_dismissInHostIfNecessary");

}

- (void)identityProviderViewControllerDidFinishLoading:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  VSViewServiceViewController *v9;

  v4 = a3;
  -[VSViewServiceViewController currentRequest](self, "currentRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke;
  v7[3] = &unk_24FE196D8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "conditionallyUnwrapObject:otherwise:", v7, &__block_literal_global_159);

}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  if (objc_msgSend(v3, "isPreAuthRequest")
    && (objc_msgSend(*(id *)(a1 + 32), "currentAuthenticationViewControllerSupportsPreAuth") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "sendErrorMessage:", CFSTR("presented template is incompatible with authentication share requests"));
    VSErrorLogObject();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_cold_1();

    VSPublicError();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_requestDidFailWithError:", v5);
    objc_msgSend(v3, "requestingAppAdamID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "requestingAppAdamID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The [currentRequest requestingAppAdamID] parameter must not be nil."));
      objc_msgSend(v3, "requestingAppAdamID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDF8C28], "recordInvalidTemplateErrorWithProviderAppAdamID:", v8);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_presentInHostIfNecessary");
  }

}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_158()
{
  NSObject *v0;

  VSErrorLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_158_cold_1();

}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  id v5;

  -[VSViewServiceViewController _didCancelRequest](self, "_didCancelRequest", a3, a4);
  -[VSViewServiceViewController topShelfPurger](self, "topShelfPurger");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "purge");

}

- (VSPersistentStorage)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (VSRestrictionsCenter)restrictionsCenter
{
  return self->_restrictionsCenter;
}

- (void)setRestrictionsCenter:(id)a3
{
  objc_storeStrong((id *)&self->_restrictionsCenter, a3);
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteNotifier, a3);
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_storeStrong((id *)&self->_preferences, a3);
}

- (VSTopShelfPurger)topShelfPurger
{
  return self->_topShelfPurger;
}

- (void)setTopShelfPurger:(id)a3
{
  objc_storeStrong((id *)&self->_topShelfPurger, a3);
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_privateQueue, a3);
}

- (VSOptional)currentRequest
{
  return self->_currentRequest;
}

- (VSOptional)currentRequestID
{
  return self->_currentRequestID;
}

- (void)setCurrentRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_currentRequestID, a3);
}

- (BOOL)isPresentedInHost
{
  return self->_presentedInHost;
}

- (void)setPresentedInHost:(BOOL)a3
{
  self->_presentedInHost = a3;
}

- (BOOL)isIdentityProviderPickerRequired
{
  return self->_identityProviderPickerRequired;
}

- (void)setIdentityProviderPickerRequired:(BOOL)a3
{
  self->_identityProviderPickerRequired = a3;
}

- (BOOL)didAuthenticateAccount
{
  return self->_didAuthenticateAccount;
}

- (void)setDidAuthenticateAccount:(BOOL)a3
{
  self->_didAuthenticateAccount = a3;
}

- (UINavigationController)navController
{
  return self->_navController;
}

- (void)setNavController:(id)a3
{
  objc_storeStrong((id *)&self->_navController, a3);
}

- (VSAuditToken)auditToken
{
  return self->_auditToken;
}

- (void)setAuditToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_currentRequestID, 0);
  objc_storeStrong((id *)&self->_currentRequest, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_topShelfPurger, 0);
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong((id *)&self->_remoteNotifier, 0);
  objc_storeStrong((id *)&self->_restrictionsCenter, 0);
  objc_storeStrong((id *)&self->_storage, 0);
}

void __62__VSViewServiceViewController__performRequest_withIdentifier___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Unable to fetch accounts for request due to failure to fetch accounts: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_performRequestInternal:withID:identityProviders:accounts:currentStorefrontCode:allStorefronts:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Request has account provider authentication token but pre-auth is not applicable.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_determinePreAuthAppIsAuthorized:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "App with bundle ID %@ is not allowed to make pre-auth requests to this identity provider.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Request is a pre-auth request but the host app is not authorized for pre-auth.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Error checking pre-auth authorization: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __75__VSViewServiceViewController__performRequestWithIdentityProvider_account___block_invoke_130_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "No request to perform.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __90__VSViewServiceViewController_identityProviderViewController_didFinishRequest_withResult___block_invoke_152_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_2303C5000, v0, v1, "Will present error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)identityProviderViewController:(NSObject *)a1 didAuthenticateAccount:forRequest:.cold.1(NSObject *a1)
{
  int v2;
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v3 = *__error();
  v4[0] = 67109376;
  v4[1] = v2;
  v5 = 1024;
  v6 = v3;
  _os_log_error_impl(&dword_2303C5000, a1, OS_LOG_TYPE_ERROR, "Error granting access for audit token: %d (%{errno}d)", (uint8_t *)v4, 0xEu);
}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "Invalid template loaded for pre-auth request.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __78__VSViewServiceViewController_identityProviderViewControllerDidFinishLoading___block_invoke_158_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2(&dword_2303C5000, v0, v1, "No request to perform. Possibly cancelled.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
